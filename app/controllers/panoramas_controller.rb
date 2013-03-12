# coding: utf-8

class PanoramasController < ApplicationController
  before_filter :get_pano, :only => [:show, :edit, :update, :destroy, :shift, :switch_boolean]
  include ErrorHelper
  
  def get_pano
    @panorama = Panorama.find(params[:id])
  end
  
  def show
    @title = @panorama.name
    @internal_links = @panorama.internal_links.all
    @external_links = @panorama.external_links.all
    @hotspot_infos = @panorama.hotspot_infos.all
  end
  
  def shift
    @panoramas = @panorama.city.panoramas
    @panoramas.sort_by! { |pano| pano.priority }
    
    case params[:dest]
    when "top"
      @panorama.priority = @panoramas.first.priority - 1
    when "bottom"
      @panorama.priority = @panoramas.last.priority + 1
    when "up"
      index = @panoramas.index(@panorama) - 1
      @pano_before = @panoramas[index]
      unless @pano_before.nil? or @pano_before.priority > @panorama.priority
        tmp = @pano_before.priority
        @pano_before.priority = @panorama.priority
        @panorama.priority = 1000000 # temp value to prevent conflicting priorities (uniqueness)
        @panorama.save
        @panorama.priority = tmp
        @pano_before.save
      end
    when "down"
      index = @panoramas.index(@panorama) + 1
      @pano_after = @panoramas[index]
      unless @pano_after.nil? or @pano_after.priority < @panorama.priority
        tmp = @pano_after.priority
        @pano_after.priority = @panorama.priority
        @panorama.priority = 1000000 # temp value to prevent conflicting priorities (uniqueness)
        @panorama.save
        @panorama.priority = tmp
        @pano_after.save
      end
    end
    @panorama.save
    
    respond_to do |format|
      format.js { render :nothing => true }
    end
  end
  
  def new
    @city = City.find(params[:city_id])
    @panorama = @city.panoramas.new
    @panorama.date_of_recording = session[:last_date].nil? ? Time.now : session[:last_date]
    @title = @panorama.name
    render 'edit'
  end
  
  def create
    @city = City.find(params[:panorama][:city_id])
    maxPriority = @city.panoramas.maximum(:priority)
    maxPriority = 0 if maxPriority.nil?
    @panorama = @city.panoramas.new(params[:panorama])
    @panorama.priority = maxPriority + 1;
    unless @panorama.save
      @title = "Panorama konnte nicht erstellt werden!"
      register_error @title, @panorama
      render "edit"
    else
      session[:last_date] = @panorama.date_of_recording
      redirect_to @city
    end
  end

  def edit
    @title = "Bearbeiten: " + @panorama.name
  end

  def switch_boolean
    field = params[:field]
    @panorama[field] = (not @panorama[field])
    @panorama.save
    
    respond_to do |format|
      format.js { render :nothing => true }
    end
  end
  
  def update
    if @panorama.update_attributes(params[:panorama])
      redirect_to city_path(@panorama.city, { :show_id => @panorama.id })
    else
      register_error "Änderung konnte nicht übernommen werden", @panorama
      @title = "Bearbeiten: " + @panorama.name
      render 'edit'
    end
  end
  
  def destroy
    city = @panorama.city
    @panorama.destroy
    
    respond_to do |format|
      format.js { render :nothing => true }
    end
  end
end
