class Admin::DatasetsController < Admin::AdminController
  current_tab :datasets
  
  
  def initialize
     @title = "Datasets"
   end

  # GET /datasets
  # GET /datasets.xml
  def index
    @datasets = Dataset.all(:order=>"name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datasets }
    end
  end

  # GET /datasets/1
  # GET /datasets/1.xml
  def show
    @dataset = Dataset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dataset }
    end
  end

  # GET /datasets/new
  # GET /datasets/new.xml
  def new
    @dataset = Dataset.new
    @dataset.language_id = 5     # defaulting to English
    
    3.times { @dataset.format_urls.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dataset }
    end
  end

  # GET /datasets/1/edit
  def edit
    @dataset = Dataset.find(params[:id])
    @tags = @dataset.tags
  end

  # POST /datasets
  # POST /datasets.xml
  def create
    @dataset = Dataset.new(params[:dataset])

    respond_to do |format|
      if @dataset.save
        flash[:notice] = 'Dataset was successfully created.'
        format.html { redirect_to([:admin, @dataset]) }
        format.xml  { render :xml => @dataset, :status => :created, :location => @dataset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dataset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datasets/1
  # PUT /datasets/1.xml
  def update
    @dataset = Dataset.find(params[:id])

    respond_to do |format|
      if @dataset.update_attributes(params[:dataset])
        flash[:notice] = 'Dataset was successfully updated.'
        format.html { redirect_to([:admin, @dataset]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dataset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datasets/1
  # DELETE /datasets/1.xml
  def destroy
    @dataset = Dataset.find(params[:id])
      if @dataset.destroy then
           respond_to do |format|
             format.html { redirect_to(admin_datasets_url) }
             format.xml  { head :ok }
           end
      else
           flash[:error] = @dataset.errors.on_base
           redirect_to(admin_datasets_url)
      end 
  end

  private

end
