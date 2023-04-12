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

  def delete_place
    place = Place.find_by(id: params[:id])
    begin
      if place
        if place.user == @current_user
          if place.destroy
            render json: { message: 'Place is deleted successfully' }, status: :ok
          end
        else
          raise StandardError, "User not authorized to delete"
        end
      else
        raise StandardError, "Place not found"
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def edit_place
    place = Place.find_by(id: params[:id])
    begin
      if place
        if place.user == @current_user
          if place.update(title: params[:title], description: params[:description], image_link: params[:imageLink], place_tag: params[:place_tag])
            updated_place = {id: place.id, title: place.title, description: place.description, image_link: place.image_link, user_email: place.user.email}
            render json: { data: updated_place, message: 'Place is updated successfully' }, status: :ok
          else
            raise StandardError, place.errors.full_messages
          end
        else
          raise StandardError, "User not authorised to edit"
        end
      else
        raise StandardError, "Place not found"
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

end
