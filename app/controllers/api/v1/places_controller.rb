class Api::V1::PlacesController < ApplicationController
  def places_details
    places_details = Place.all
    render json: {data: places_details, message: 'Data received successfully', status: 200}
  end
end
