class AttendEventsController < ApplicationController
  def add    
    @attend = EventAttendee.new(attend_params)

    if current_user.attended_event_ids.include?(attend_params[:event_id].to_i)
      flash.notice = "Already signed up for this event!"        
    elsif @attend.save
      flash.notice = "Signed up for event!"
    else 
      flash.notice = "Error signing up for event!"
    end
    redirect_to root_path
  end
  
  def destroy
    flash.notice = "You were removed from event!"
    EventAttendee.where(event_id: params[:event_id].to_i, attendee_id: current_user.id.to_i).delete_all
    redirect_to root_path
  end

  private

  def attend_params
    params.permit(:attendee_id, :event_id)
  end
end