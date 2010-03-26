class WelcomeController < ApplicationController
  require 'rubygems'
  require 'simple-rss'
  require 'open-uri'

  #caches_page :index # :expires_in option is memcached only, btw

  layout :public_layout
  before_filter :public_start
  
  def index 
    @title = "Welcome"
    source = "http://warwickshireopendata.wordpress.com/feed/"
    content = ""
    
    begin
        open(source) do |s| content = s.read end  
        @rss = SimpleRSS.parse(content)
    rescue Timeout::Error
      @rss = ''
    rescue
      @rss = ''
    end
    
    @latestDatasets = Dataset.latest(5)
  end
  
end
