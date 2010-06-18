class TagsController < ApplicationController
  layout :public_layout
  before_filter :public_start
  
  def initialize
    @title = "Tags"
  end

   # GET /datasets
   # GET /datasets.xml
   def index    
    @sorted_tags = Dataset.all(:select=>'slugs.name AS slug_name, tags.*, count(*) as count',:conditions => {:status => "Published"},:joins=>{:tags=>:slugs}, :group=>"tags.id, tags.name, slug_name").sort { |x,y| x.name.downcase <=> y.name.downcase }
    
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
     @tag = Tag.find(params[:id].downcase)
     @datasets = Dataset.find_tagged_with(params[:id].downcase)
     #@datasets = Dataset.tagged_with(params[:id].downcase, :on =>:tags, :conditions => {:status => "Published"}, :order=> "name ASC")
       
     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @datasets }
     end
   end
end
