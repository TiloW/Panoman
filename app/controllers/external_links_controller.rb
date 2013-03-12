# coding: utf-8

class ExternalLinksController < ApplicationController
  before_filter :get_link, :only => [:edit, :update, :destroy]
  include ErrorHelper
  
  def get_link
    @external_link = ExternalLink.find(params[:id])
  end
  
  def new
    @panorama = Panorama.find(params[:panorama_id])
    @external_link = @panorama.external_links.new
    @title = @external_link.name
    render 'edit'
  end
  
  def create
    @panorama = Panorama.find(params[:external_link][:panorama_id])
    @external_link = @panorama.external_links.new(params[:external_link])
    unless @external_link.save
      @title = "Externer Link konnte nicht erstellt werden!"
      register_error @title, @external_link
      render "edit"
    else
      redirect_to @panorama
    end
  end
  
  def edit
    @title = "Bearbeiten: " + @external_link.name
  end
  
  def update
    if @external_link.update_attributes(params[:external_link])
      redirect_to @external_link.panorama
    else
      register_error "Änderung konnte nicht übernommen werden", @external_link
      @title = "Bearbeiten: " + @external_link.name
      render 'edit'
    end
  end
  
  def destroy
    pano = @external_link.panorama
    @external_link.destroy
    
    respond_to do |format|
      format.js { render :nothing => true }
    end
  end
  
end
