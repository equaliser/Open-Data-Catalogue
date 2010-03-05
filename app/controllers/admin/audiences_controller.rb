class Admin::AudiencesController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required
  layout "admin"
  current_tab :audiences

  def initialize
    @title = "Audiences"
  end

  # GET /audiences
  # GET /audiences.xml
  def index
    @audiences = Audience.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @audiences }
    end
  end

  # GET /audiences/1
  # GET /audiences/1.xml
  def show
    @audience = Audience.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @audience }
    end
  end

  # GET /audiences/new
  # GET /audiences/new.xml
  def new
    @audience = Audience.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @audience }
    end
  end

  # GET /audiences/1/edit
  def edit
    @audience = Audience.find(params[:id])
  end

  # POST /audiences
  # POST /audiences.xml
  def create
    @audience = Audience.new(params[:audience])

    respond_to do |format|
      if @audience.save
        flash[:notice] = 'Audience was successfully created.'
        format.html { redirect_to([:admin, @audience]) }
        format.xml  { render :xml => @audience, :status => :created, :location => @audience }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @audience.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /audiences/1
  # PUT /audiences/1.xml
  def update
    @audience = Audience.find(params[:id])

    respond_to do |format|
      if @audience.update_attributes(params[:audience])
        flash[:notice] = 'Audience was successfully updated.'
        format.html { redirect_to([:admin, @audience]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @audience.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /audiences/1
  # DELETE /audiences/1.xml
  def destroy
    @audience = Audience.find(params[:id])
    @audience.destroy

    respond_to do |format|
      format.html { redirect_to(admin_audiences_url) }
      format.xml  { head :ok }
    end
  end

end
