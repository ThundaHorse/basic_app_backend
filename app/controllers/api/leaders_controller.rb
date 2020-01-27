class Api::LeadersController < ApplicationController

  def index 
    @leaders = Leader.all 
    render "index.json.jbuilder"
  end 

end
