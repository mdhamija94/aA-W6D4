class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    
    render json: user.artworks
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: Artwork.find(params[:id])
  end

  def update
    artwork = Artwork.find(params[:id])

    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])

    if artwork.destroy
      render plain: "#{artwork.title} deleted!"
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def favorite
    user_id = params[:user_id]
    artwork_id = params[:id]
    mine = Artwork.find(artwork_id).artist_id == user_id.to_i

    if mine
      artwork = Artwork.find(artwork_id)
      artwork.favorite = true 
      artwork.save!
    else
      artwork_share = ArtworkShare.where( "viewer_id = #{user_id} and artwork_id = #{artwork_id}" ).first

      if artwork_share
        artwork_share.favorite = true
        artwork_share.save!
        render plain: "Favorited!"
      else
        render plain: "Wrong stuff"
      end
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end