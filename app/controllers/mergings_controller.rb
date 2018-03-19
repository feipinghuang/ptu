class MergingsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @merging = Merging.new(merging_params)

    if @merging.save
      render 'show.json.jbuilder', status: :created
    else
      render json: @merging.errors, status: :unprocessable_entity
    end
  end

  private
  def merging_params
    params.require(:merging).permit(:template_id, :actor_id)
  end
end
