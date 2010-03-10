class DataController < PublicController
  
  def initialize
    @title = "Datasets"
  end

   # GET /datasets
   # GET /datasets.xml
   def index
     @datasets = Dataset.all

     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @datasets }
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
