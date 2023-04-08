class Api::V1::PlacesController < ApplicationController
  def places_details
    places_details = Place.all.reverse_order
    render json: {data: places_details, message: 'Data received successfully'}, status: 200
  end

  def create_favorite_places
    place = Place.new(title: params[:title], description: params[:description], imageLink: params[:imageLink])
    if place.save
      render json: { data: place, message: 'Place created successfully'}, status: 200
    else
      render json: { message: place.errors.full_messages}, status: 400
    end
  end
end