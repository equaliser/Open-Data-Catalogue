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
    @categories = Category.find(:all, :order=>'name ASC')
    
    @datasets = Dataset.published
    #@categories = @datasets.categories.find(:all, :group=>'category_id')
   # @categories = Category.data.find(:all, :include =>'category', :select => 'count(*) count, category.id, category.name ', :group => 'category_id', :conditions => ['status = ?', 'published' ])


logger.info("bla: #{@categories}")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end


  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(:first, params[:id])
    
    @datasets = Dataset.find(:all, :conditions => {:category_id => @category.id, :status => "published"}, :order=> "name ASC")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end
  
end
