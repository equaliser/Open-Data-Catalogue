class CategoriesController < ApplicationController
  layout :public_layout
  before_filter :public_start
  current_tab :categories
 
  def initialize
     @title = "Categories"
  end

  # GET /categories
  # GET /categories.xml

  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  
  
  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end
  
end
