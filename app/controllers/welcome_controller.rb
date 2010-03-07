class WelcomeController < ApplicationController

  layout "public"

  def index 
    @title = "Welcome"
  end
  
end
