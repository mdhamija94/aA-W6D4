class UsersController < ApplicationController
  def index 
    if params.has_key?(:query)
      query = params[:query]
      render json: User.where('username LIKE ?', "%#{query}%")
    else
      users = User.all
      render json: users
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    # user.save!(user_params)
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render plain: "#{user.username} deleted!"
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def owner_favorites
    debugger
    artworks = User.find(params[:id]).artworks.where("favorite = true")
    render json: artworks
  end

  def shared_favorites
    artworks = ArtworkShare.where("favorite = true and viewer_id = #{params[:id]}")
    render json: artworks
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end