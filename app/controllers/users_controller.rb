class UsersController < ApplicationController
  def team_approval_request
    current_user.team_id = params[:team_id]
    current_user.team_status = "pending" if current_user.team_status.nil?
    current_user.save!
    flash[:notice] = "Your Team Status is Pending Approval."
    redirect_to :root
  end

  def team_approval_confirm
    user = User.find(params[:user_id])
    user.team_status = "active"
    user.save!
    flash[:notice] = "You have approved #{user.name} for #{user.team.name}"
    redirect_to :root
  end

end
