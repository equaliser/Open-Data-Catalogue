class HelloController < ApplicationController
  layout :public_layout
  before_filter :public_start
  
  def index
    @title = "Hello"
  end

end
