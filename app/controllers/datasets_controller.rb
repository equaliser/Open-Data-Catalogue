class DatasetsController < ApplicationController
  layout :public_layout
  before_filter :public_start
  current_tab :datasets
  
  
  def initialize
    @title = "Datasets"
  end

   # GET /datasets
   # GET /datasets.xml
   def index
     @datasets = Dataset.published
     
     respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @datasets }
      end
   end

   def latest
     @datasets = Dataset.latest(10)
     respond_to do |format| 
           format.html
           format.rss { render } 
           format.xml { render :xml => @datasets }
         end        
   end
 
 
   def tag_cloud
      @tags = Dataset.tags
   end

   # GET /datasets/1
   # GET /datasets/1.xml
   def show
     @dataset = Dataset.find(params[:id])
     @title = @dataset.name + " : " + @title
     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @dataset }
     end
   end

end
