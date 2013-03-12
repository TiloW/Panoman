#coding: utf-8

class PagesController < ApplicationController
  
  def stats
    @title = "Home"   
    @city_count = City.all.count 
    @pano_count = Panorama.all.count 
    @internal_link_count = InternalLink.all.count 
    @external_link_count = ExternalLink.all.count 
    @hotspot_info_count = HotspotInfo.all.count 
  end
  
  def reset
    City.destroy_all
  end
  
  def validate
    @missing_images = Hash.new
    @missing_images_count = 0
    @missing_images_city_count = 0
    @missing_images_pano_count = 0
    
    Panorama.all.each do |pano|
      city = pano.city.name
      path = FileHelper.get_base_path pano
      [".jpg", "_3.jpg", "_5.jpg"].each do |ending|
        unless File.exists?(Dir.getwd + "/public" + path + ending)
          if @missing_images[city].nil?
            @missing_images_city_count += 1
            @missing_images[city] = Hash.new
          end
          if @missing_images[city][pano.name].nil?
            @missing_images_pano_count += 1
            @missing_images[city][pano.name] = Array.new
          end
          @missing_images_count += 1
          @missing_images[city][pano.name].push(path + ending);
        end
      end
    end
    
    @corrupt_links = Hash.new
    @corrupt_links_count = 0
    @corrupt_links_city_count = 0
    @corrupt_links_pano_count = 0
    # threads = Array.new
    
    # TODO Threads?
    ExternalLink.all.each do |link|
      pano = link.panorama.name
      city = link.panorama.city.name
      # threads.push(Thread.new do
      unless WebHelper.valid_url? link.url
        if @corrupt_links[city].nil?
          @corrupt_links_city_count += 1
          @corrupt_links[city] = Hash.new
        end
        if @corrupt_links[city][pano].nil?
          @corrupt_links_pano_count += 1
          @corrupt_links[city][pano] = Array.new
        end
        @corrupt_links_count += 1
        @corrupt_links[city][pano].push(link)
      end
      # end)
      # if @corrupt_links_count % 8
        # threads.each {|t| t.join }
        # threads = Array.new
      # end
    end

    # threads.each {|t| t.join }
    
    @cities = City.all.sort_by!{ |c| c.name.downcase }
  end
  
  def repair_links
    ExternalLink.all.each do |link|
      link.name = link.name.gsub(/\s*-?\s*((zur\s*)?Homepage|Info-Link)?\s*(\([^)]*\))?\s*\z/, "")
      link.url = link.url.gsub("%2C", ",")
      link.save
    end
  end

end
