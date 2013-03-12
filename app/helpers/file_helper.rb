#coding: utf-8

module FileHelper
  
  def self.to_filename string
    string.downcase.gsub(/[äÄ]/, "ae").gsub(/[üÜ]/, "ue").
      gsub(/[öÖ]/, "oe").gsub("ß", "ss").gsub(" ", "_").
      gsub(/[.]/, "")
  end
  
  def self.pano_to_filename pano
     Rails.application.config.init_dir  + 
       to_filename(pano.city.name) + "\\" + to_filename(pano.name)
  end
  
  def self.get_base_path pano
    Rails.application.config.img_path + "/" + to_filename(pano.city.name) + "/" + to_filename(pano.name)
  end
  
  def self.get_default_thumbnail_location pano
    (get_base_path pano) + ".jpg"
  end
  
  def self.get_thumbnail pano
    result = get_default_thumbnail_location pano
    if File.exists?(Dir.getwd + "/public" + result)
      result
    else
      "/images/error.png"
    end
  end
  
  def self.get_image pano
    (get_base_path pano) + "_3.jpg"
  end
  
  def self.get_pmvr
     Rails.application.config.pmvr_path
  end
  
  def self.list_files dir, result
    Dir[dir + "/*"].each do |f|
      if File.file? f
        result.push(f)
      else
        list_files f, result
      end
    end
  end
  
end