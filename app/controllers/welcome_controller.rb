class WelcomeController < ApplicationController
  include AuthenticatedSystem

  layout "public"

  def index 
    @title = "Welcome"
  end
  
end
