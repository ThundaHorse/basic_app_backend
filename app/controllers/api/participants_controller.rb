class Api::ParticipantsController < ApplicationController

  def index 
    @participants = Participant.all 
    render "index.json.jbuilder"
  end 

  def show_for_event
    @participants = Participant.where(event_id: params[:event_id])
    render "index.json.jbuilder"
  end 

end
