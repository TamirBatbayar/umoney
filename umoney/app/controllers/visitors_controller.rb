class VisitorsController < ApplicationController
  before_action :authenticate_user!
  # before_action :admin_only, :except => :show
  

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end
end
