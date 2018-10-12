class Api::V1::NapsController < ApplicationController

    def create
        day = Day.find(params[:day_id])
        # what happens if I click again on start nap after the time was changed?
        # as I am finding or creating by start as well...
        nap = Nap.find_or_create_by(day: day, start: params[:start])
    
        render json: nap
    end 

    def update
        nap = Nap.find(params[:nap_id])
        nap.update(start: params[:start], end: params[:end])
        render json: nap.nap_duration
    end 

    def destroy
        nap = Nap.find(params[:nap_id])
        nap.destroy
        # render json: do I need one?
    end 

    # def nap_params(*args)
    #     params.require(:nap).permit(*args)
    # end 
end
