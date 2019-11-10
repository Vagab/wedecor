class AdminController < ApplicationController

  before_action :check_user_role

  private

  def check_user_role
    redirect_to root_path unless current_user&.admin?
  end

end