class Admin::AdminController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required
  layout "admin"
end
