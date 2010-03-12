class TagsController < ApplicationController
  layout :public_layout
  before_filter :public_start
  
  def initialize
    @title = "Tags"
  end

   # GET /datasets
   # GET /datasets.xml
   def index
     @sorted_tags = Dataset.tag_counts.sort { |x,y| x.name.upcase <=> y.name.upcase }
    
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @tags }
     end
   end
   
   def tag_cloud
      @tags = Dataset.all.tag_counts_on(:tags)
   end

   # GET /datasets/1
   # GET /datasets/1.xml
   def show     
     @datasets = Dataset.find_tagged_with(params[:id], :on =>:tags, :conditions => {:status => "published"}, :order=> "name ASC")
     
     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @datasets }
     end
   end
end
