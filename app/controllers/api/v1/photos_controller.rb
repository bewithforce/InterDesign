class Api::V1::PhotosController < ApplicationController
  def index
    family_photos = FamilyPhoto.all
    render json: family_photos
  end

  def show
    filters = params[:filter].split(',')
    print filters
    family_photos = FamilyPhoto.select { |x|
      begin
        print x.member + '\n'
        print filters.class
        filters.include?(x.member)
      end
    }
    render json: family_photos
  end

  def add
  end
end
