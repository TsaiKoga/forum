# -*- encoding : utf-8 -*-

class Cpanel::ApplicationController < ApplicationController
  layout "cpanel"
  before_filter :require_admin

  def require_admin
    if not current_user.admin?
    end
  end
end
