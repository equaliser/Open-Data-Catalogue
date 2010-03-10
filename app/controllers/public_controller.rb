class PublicController < ApplicationController
  
  layout "public"
  before_filter :start
  
  private 
  
  def start
    @pages = Page.find(:all, :conditions => {:status => "published"}, :order => "`order` DESC")
  end
  
  
end