class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :verify_authentication, only: [:create, :index, :show, :follow]
  # respond_to :html, :xml, :json

  # GET /users
  def index
    @users = User.all
    # render json: @users
    # commented out because a jbuilder template has been added
  end

  # GET /users/1
  def show
    # render json: @user
    # commented out because a jbuilder template has been added
  end

  # POST /user
  def create
    @user = User.new(user_params)
    if @user.save
      # respond_with(@user), 
      render 'show.json', status: 201
    else
      render @user.errors, status: 400
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      # render json: @user
    else
      # render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user/1
  def destroy
    @user.destroy
  end

  def follows
    @follows = current_user.all_follows
    render json: @follows, status: 200
  end
  
  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    @follow = Follow.find_by(follower: current_user, followable: @user)
    render json: current_user, status: 200
  end

  def unfollow
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    render json: 'show.json', status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
  def user_params
      params.permit(:username, :password)
  end
end
