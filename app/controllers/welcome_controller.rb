class WelcomeController < ApplicationController
  layout :public_layout
  before_filter :public_start
  
  def index 
    @title = "Welcome"
  end
  
end
