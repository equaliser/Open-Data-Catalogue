class DatasetsController < ApplicationController
  include AuthenticatedSystem
  layout "public"
  
  
  def initialize
    @title = "Datasets"
  end
  
  def index
  end

  def new
   @title = "New dataset"
   @dataset = Dataset.new
   
   respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dataset }
    end
  end



  def show
    @dataset = Dataset.find(params[:id])
    @title = @dataset.title
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dataset }
    end
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
    @title = @blogpost.title
  end


  def create
    @blogpost = Blogpost.new(params[:blogpost])

    respond_to do |format|
      if @blogpost.save
        flash[:notice] = 'Blogpost was successfully created.'
        format.html { redirect_to(@blogpost) }
        format.xml  { render :xml => @blogpost, :status => :created, :location => @blogpost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blogpost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @blogpost = Blogpost.find(params[:id])

    respond_to do |format|
      if @blogpost.update_attributes(params[:blogpost])
        flash[:notice] = 'Blogpost was successfully updated.'
        format.html { redirect_to(@blogpost) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blogpost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy
    @blogpost = Blogpost.find(params[:id])
    @blogpost.destroy

    respond_to do |format|
      format.html { redirect_to(blogpost_url) }
      format.xml  { head :ok }
    end
  end



end