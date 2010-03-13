class CategoriesController < ApplicationController
  layout :public_layout
  before_filter :public_start
  current_tab :categories
  add_breadcrumb 'Categories', 'categories_path'
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
    @category = Category.find(:first, params[:id])
    
    add_breadcrumb @category.name, ''
    
    @datasets = Dataset.find(:all, :conditions => {:category_id => @category.id, :status => "published"}, :order=> "name ASC")


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end
  
end
