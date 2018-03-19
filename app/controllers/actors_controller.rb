class ActorsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    image = params.require(:image)
    rectangle = Facepp.new.detect_face_rectangle(image.tempfile)
    @actor = Actor.new(rectangle: rectangle)
    @actor.image.attach(image)

    if @actor.save
      render 'show.json.jbuilder', status: :created
    else
      render json: @actor.errors, status: :unprocessable_entity
    end
  end
end
