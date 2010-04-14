class TagsController < ApplicationController
  layout :public_layout
  before_filter :public_start
  
  def initialize
    @title = "Tags"
  end

   # GET /datasets
   # GET /datasets.xml
   def index    
    @sorted_tags = Dataset.all(:select=>'tags.*, count(*) as count',:conditions => {:status => "Published"},:joins=>:tags, :group=>"tags.id").sort { |x,y| x.name.upcase <=> y.name.upcase }
    
    #@tags_old = Dataset.tag_counts.sort { |x,y| x.name.upcase <=> y.name.upcase }
    
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
     @tag = Tag.find(params[:id])
    
     @datasets = Dataset.find_tagged_with(@tag.name, :on =>:tags, :conditions => {:status => "Published"}, :order=> "name ASC")
       
     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @datasets }
     end
   end
end
