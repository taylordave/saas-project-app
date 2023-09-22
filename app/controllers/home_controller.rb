class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if current_user
      if session[:tenant_id]
        @tenant = session[:tenant_id]
      else
        @tenant = current_user.tenants.first
      end
      params[:tenant_id] = @tenant.id
    end
  end
end
