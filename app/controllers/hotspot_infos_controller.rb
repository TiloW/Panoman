# coding: utf-8

class HotspotInfosController < ApplicationController
  before_filter :get_hotspot, :only => [:edit, :update, :destroy]
  include ErrorHelper
  
  def get_hotspot
    @hotspot_info = HotspotInfo.find(params[:id])
  end
  
  def new
    @panorama = Panorama.find(params[:panorama_id])
    @hotspot_info = @panorama.hotspot_infos.new
    @title = @hotspot_info.name
    render 'edit'
  end
  
  def create
    @panorama = Panorama.find(params[:hotspot_info][:panorama_id])
    @hotspot_info = @panorama.hotspot_infos.new(params[:hotspot_info])
    unless @hotspot_info.save
      @title = "Hotspot-Information konnte nicht erstellt werden!"
      register_error @title, @hotspot_info
      render "edit"
    else
      redirect_to @panorama
    end
  end
  
  def edit
    @title = "Bearbeiten: " + @hotspot_info.name
  end
  
  def update
    if @hotspot_info.update_attributes(params[:hotspot_info])
      redirect_to @hotspot_info.panorama
    else
      register_error "Änderung konnte nicht übernommen werden", @hotspot_info
      @title = "Bearbeiten: " + @hotspot_info.name
      render 'edit'
    end
  end
  
  def destroy
    pano = @hotspot_info.panorama
    @hotspot_info.destroy
    
    respond_to do |format|
      format.js { render :nothing => true }
    end
  end
  
end
