# coding: utf-8

module GeneratorHelper
  require 'fileutils'
  
  def self.processFiles fileType, dir, singleCommand
    result = Hash.new
    Dir[dir + '/**/*.' + fileType].each do |file|
      basename = File.basename file
      command = singleCommand.gsub('${file}', basename).gsub('${filename}', basename.gsub('.' + fileType, ''))
      wd = Dir.getwd()
      Dir.chdir(File.dirname file)
      result[command] = %x[#{command} 2>&1]
      Dir.chdir(wd)
      File.delete(file)
    end
    result
  end

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
      if city.en_name.blank?
         file.gsub!("CITY-EN-NAME", FileHelper.to_filename(city.name))
         city.en_name = city.name
      else
         file.gsub!("CITY-EN-NAME", FileHelper.to_filename(city.en_name))
      end
    end
    unless pano.nil?
      file.gsub!("PANO-ID", pano.id.to_s)
      file.gsub!("PANO-NAME", FileHelper.to_filename(pano.name))
      if pano.en_name.blank?
         file.gsub!("PANO-EN-NAME", FileHelper.to_filename(pano.name))
         pano.en_name = pano.name
      else
         file.gsub!("PANO-EN-NAME", FileHelper.to_filename(pano.en_name))
      end
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
