class Admin::FormatTypesController < Admin::AdminController

  current_tab :format_types

   def initialize
      @title = "Format Types"
    end

   # GET /format_types
   # GET /categories.xml
   def index
     @format_types = FormatType.all

     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @format_types }
     end
   end

   # GET /format_types/1
   # GET /format_types/1.xml
   def show
     @format_type = FormatType.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @format_type }
     end
   end

   # GET /format_types/new
   # GET /format_types/new.xml
   def new
     @format_type = FormatType.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @format_type }
     end
   end

   # GET /format_types/1/edit
   def edit
     @format_type = FormatType.find(params[:id])
   end

   # POST /format_types
   # POST /format_types.xml
   def create
     @format_type = FormatType.new(params[:format_type])

     respond_to do |format|
       if @format_type.save
         flash[:notice] = 'Format type was successfully created.'
         format.html { redirect_to([:admin, @format_type]) }
         format.xml  { render :xml => @format_type, :status => :created, :location => @format_type }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @format_type.errors, :status => :unprocessable_entity }
       end
     end
   end

   # PUT /format_types/1
   # PUT /format_types/1.xml
   def update
     @format_type = FormatType.find(params[:id])

     respond_to do |format|
       if @format_type.update_attributes(params[:format_type])
         flash[:notice] = 'Format type was successfully updated.'
         format.html { redirect_to([:admin, @format_type]) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @format_type.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /format_types/1
   # DELETE /format_types/1.xml
   def destroy
     @format_type = FormatType.find(params[:id])

     if @format_type.destroy then
          respond_to do |format|
            format.html { redirect_to(admin_format_types_url) }
            format.xml  { head :ok }
          end
     else
          flash[:error] = @format_type.errors.on_base
          redirect_to(admin_format_types_url)
     end
   end


end
