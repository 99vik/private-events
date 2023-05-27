class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events
    @attended_events = attended_events_without_users
  end

  private

  def attended_events_without_users
    @user.attended_events.where.not(creator_id: @user.id.to_i)
  end
end
