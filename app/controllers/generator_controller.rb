class GeneratorController < ApplicationController
  include GeneratorHelper
  before_filter :init_path
  
  def init_path
    @src_path = Dir.getwd + Rails.application.config.template_path + "/"
    @out_path = Dir.getwd + Rails.application.config.generated_out_path + "/"
  end
  
  def generate
    @option = params[:option]
    @skip = params[:skip_unpublished]
    files = Array.new
    FileHelper.list_files @src_path + @option, files
    
    @global_files = Array.new
    @city_files = Array.new
    @pano_files = Array.new
        
    files.each do |file|
      file = file.reverse[0..-@src_path.length-1].reverse
      if /CITY-(ID|NAME|)/.match(file)
        if /PANO-(ID|NAME|)/.match(file)
          @pano_files.push(file)
        else
          @city_files.push(file)
        end
      else
        if /PANO-ID/.match(file)
          @pano_files.push(file)
        else
          @global_files.push(file)
        end
      end
    end
  
    @global_files.sort!
    @city_files.sort!
    @pano_files.sort!
    
    @global_files_out = Hash.new
    @city_files_out = Hash.new
    @pano_files_out = Hash.new
    
    @file_count = 0
    
    city_filter = params[:city].to_i
    pano_filter = params[:pano].nil? ? -1 : params[:pano].to_i
    
    # Verzeichnis leeren (Windows)
    system('rmdir /s /q "' + @out_path + @option + '"');
    
    @cities = City.all.sort_by!{ |c| c.name.downcase }
    @global_files.each do |file|
      @global_files_out[file] = @out_path + get_out_file(file)
      @file_count += 1
      GeneratorHelper.generate_from_erb @src_path + file, @global_files_out[file], binding
    end
    @city_files.each do |file|
      @city_files_out[file] = Hash.new
      filtered_cities = city_filter === -1 ? City.all : [City.find(city_filter)]
      filtered_cities.each do |city|
        @city = city
        @city_files_out[file][city.id] = @out_path + get_out_file(file, { :city => city })
        @file_count += 1
        GeneratorHelper.generate_from_erb @src_path + file, @city_files_out[file][city.id], binding
      end
    end
    @pano_files.each do |file|
      @pano_files_out[file] = Hash.new
      panos = pano_filter === -1 ? (city_filter === -1 ? Panorama.all : City.find(city_filter).panoramas) : [Panorama.find(pano_filter)]
      panos.each do |pano|
        unless @skip and not pano.published
          @pano = pano
          @city = pano.city
          @pano_files_out[file][pano.id] = @out_path + get_out_file(file, { :city => pano.city, :pano => pano })
          @file_count += 1
          GeneratorHelper.generate_from_erb @src_path + file, @pano_files_out[file][pano.id], binding
        end
      end
    end
    
    # compile sass and coffescript
    logger.debug GeneratorHelper.processFiles 'sass', @out_path, 'sass -C "${file}":"${filename}.css"'
    logger.debug GeneratorHelper.processFiles 'scss', @out_path, 'sass -C "${file}":"${filename}.css"'
    logger.debug GeneratorHelper.processFiles 'coffee', @out_path, 'coffee -c "${file}"'
  end

  def choose
    @options = Array.new
    @cities = City.all.sort_by{ |c| c.name }
    
    Dir[@src_path + "*"].each do |f|
      @options.push(f.split('/').last) if File.directory? f
    end
  
    @options.sort!()
  end

end
