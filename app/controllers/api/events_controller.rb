class Api::EventsController < ApplicationController
  
  def index 
    @events = Event.all
    render 'index.json.jbuilder'
  end 

  def show
    @event = Event.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @event = Event.create(      
      activity: params[:activity],
      location: params[:location],
      date: params[:date]      
    )

    if @event.save 
      render json: { message: "Event scheduled successfully!" }, status: 200
    else 
      render json: { message: @event.errors.full_messages }
    end
  end
  
  def update
    @event = Event.find(params[:id])    
    @event.activity = params[:activity] || @event.activity
    @event.location = params[:location] || @event.location
    @event.date = params[:date] || @event.date    

    # Need to add validation for user who is leader ability to update
    if @event.save 
      render "show.json.jbuilder"
    else 
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end 

  def destroy 
    # Need to add validation for user who is leader ability to delete
    @event = Event.find(params[:id])
    if @event.delete 
      render json: { message: "Event canceled successfully" }, status: 200
    else 
      render json: { errors: @event.errors.full_messages }
    end
  end 

end
