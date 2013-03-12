# coding: utf-8

class InternalLinksController < ApplicationController
  before_filter :get_link, :only => [:edit, :update, :destroy]
  before_filter :get_title, :only => [:edit, :update]
  include ErrorHelper
  
  def get_link
    @internal_link = InternalLink.find(params[:id])
    @dest_pano = Panorama.find(@internal_link.destination_id)
  end
  
  def get_title
    @title = "Bearbeiten: Interner Link von " + @internal_link.panorama.name
  end
  
  def new
    @title = "Neuer Interner Link"
    @panorama = Panorama.find(params[:panorama_id])
    @internal_link = @panorama.internal_links.new
    render 'edit'
  end
  
  def create
    @panorama = Panorama.find(params[:internal_link][:panorama_id])
    @internal_link = @panorama.internal_links.new(params[:internal_link])
    unless @internal_link.save
      @title = "Interner Link konnte nicht erstellt werden!"
      register_error @title, @internal_link
      render "edit"
    else
      redirect_to @panorama
    end
  end
  
  def edit
  end
  
  def update
    if @internal_link.update_attributes(params[:internal_link])
      redirect_to @internal_link.panorama
    else
      register_error "Änderung konnte nicht übernommen werden", @internal_link
      render 'edit'
    end
  end
  
  def destroy
    pano = @internal_link.panorama
    @internal_link.destroy
    
    respond_to do |format|
      format.js { render :nothing => true }
    end
  end
  
end
