class WelcomeController < ApplicationController
  require 'rubygems'
  require 'simple-rss'
  require 'open-uri'


  layout :public_layout
  before_filter :public_start
  
  def index 
    @title = "Welcome"
    source = "http://abigbang.wordpress.com/feed/"
    content = ""
    open(source) do |s| content = s.read end
    @rss = SimpleRSS.parse(content)
  

               
  end
  
end
