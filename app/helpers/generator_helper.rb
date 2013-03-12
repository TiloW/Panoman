# coding: utf-8

module GeneratorHelper
  require 'fileutils'

  def self.generate_from_erb file_in, file_out, binding
    # Verzeichnis erstellen (Windows)
    system('mkdir "' + File.dirname(file_out) + '"');
    
    if File.extname(file_in) == ".erb"
      inFile = File.new(file_in, "r")
      content = inFile.read
      inFile.close
    
      template = ERB.new(content)
      content = template.result(binding)
      
      out = File.new(file_out, "w")
      out.puts content
      out.close
    else
      system('copy "' + file_in.gsub("/", "\\") + '" "' + file_out.gsub("/", "\\") + '"')
    end

  end
  
  def get_out_file file, env = Hash.new
    file = String.new file
    file = file[0..-5] if File.extname(file) == ".erb"
    city = env[:city]
    pano = env[:pano]
    unless city.nil?
      file.gsub!("CITY-ID", city.id.to_s)
      file.gsub!("CITY-NAME", FileHelper.to_filename(city.name))
    end
    unless pano.nil?
      file.gsub!("PANO-ID", pano.id.to_s)
      file.gsub!("PANO-NAME", FileHelper.to_filename(pano.name))
    end
    file
  end
  
  ## TODO
  ## FIXXME
  def self.toHTML text
    CGI::escapeHTML(text).gsub(/./) do |char|
      code = char[0]
      code > 127 ? "&##{code};" : char
    end
  end
  
end
