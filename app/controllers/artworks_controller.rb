class ArtworksController < ApplicationController
    def url
        response = Artwork.find(params['id']).url
        render json: response
    end
end