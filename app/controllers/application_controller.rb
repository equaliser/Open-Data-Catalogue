# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  

  private
  
  def public_start
    @pages = Page.find(:all, :conditions => {:status => "published"}, :order => "display_order DESC")
  end
  
  def public_layout
    "public"
  end

end
