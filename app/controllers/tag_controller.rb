class TagController < PublicController
  def initialize
    @title = "Tags"
  end

   # GET /datasets
   # GET /datasets.xml
   def index
     @tags = Dataset.tags

     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @tags }
     end
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
