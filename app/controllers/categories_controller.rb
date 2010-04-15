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
    #@categories = Category.find(:all, :order=>'name ASC')
    @datasets = Dataset.all(:select =>'count(*) AS count, category_id, categories.name AS category_name', :joins=>:category, :conditions => {:status => "Published"}, :group =>'category_id', :order=>"category_name ASC")
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end


  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
    @datasets = Dataset.find(:all, :conditions => {:category_id => @category.id, :status => "Published"}, :order=> "name ASC")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end
  
end
