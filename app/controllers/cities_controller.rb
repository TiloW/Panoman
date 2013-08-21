# coding: utf-8

class CitiesController < ApplicationController
  before_filter :get_city, :only => [:show, :edit, :update, :destroy, :tag, :location, :sort_panoramas]
  include ErrorHelper
  
  def get_city
    @city = City.find(params[:id])
  end
  
  def index
    @cities = City.all
    @cities.sort_by! { |city| city.name.downcase }
    @title = 'Städte'
  end
  
  def show
    @title = @city.name
    @panoramas = @city.panoramas
    @tag_cloud = @panoramas.tag_counts_on(:tags)
    @tag_cloud.sort_by! { |tag| tag.name.downcase }
    @tag = params[:tag]
    unless @tag.nil?
      @panoramas = @panoramas.tagged_with(@tag)
    end
    
    @loc_list = @panoramas.tag_counts_on(:locations)
    @loc_list.sort_by! { |location| location.name.downcase }
    @location = params[:location]
    unless @location.nil?
      @panoramas = @panoramas.tagged_with(@location)
    end
    
    @panoramas_priorized = @panoramas.sort_by { |pano| pano.priority }    
    @panoramas.sort_by! { |pano| pano.name.downcase }
  end
  
  def edit
    @title = "Bearbeiten: " + @city.name
  end
  
  def update
    if @city.update_attributes(params[:city])
      redirect_to cities_path(:show_id => @city.id)
    else
      register_error "Änderung konnte nicht übernommen werden", @city
      @title = "Bearbeiten: " + @city.name
      render 'edit'
    end
  end
  
  def destroy
    @city.destroy
    
    respond_to do |format|
      format.js { render :nothing => true }
    end
  end
  
  def new
    @city = City.new
    @title = @city.name
    render 'edit'
  end
  
  def create
    @city = City.new(params[:city])
    unless @city.save
      @title = "Stadt \"#{@city.name}\" konnte nicht gespeichert werden!"
      register_error @title, @city
      render "edit"
    else
      redirect_to cities_path
    end
  end
end
