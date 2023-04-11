class Api::V1::PlacesController < ApplicationController
  before_action :authenticate_request

  def places_detail
    places_detail = Place.joins(:user).where(place_tag: 'public').or(Place.where(user: @current_user))
                         .select('places.id', 'places.title', 'places.description', 'places.image_link',
                                 'users.email as user_email')
    render json: { data: places_detail, message: 'Data received successfully' }, status: :ok
  end

  def create_favorite_places
    place = Place.new(title: params[:title], description: params[:description],
                      image_link: params[:imageLink], user: @current_user, place_tag: params[:place_tag])
    if place.save
      place = {id: place.id, title: place.title, description: place.description, image_link: place.image_link, user_email: place.user.email}
      render json: { data: place, message: 'Place created successfully' }, status: :created
    else
      render json: { message: place.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
