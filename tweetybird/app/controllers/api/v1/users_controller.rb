class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :verify_authentication, only: [:create, :index, :show]
  # respond_to :html, :xml, :json

  # GET /stories
  def index
    @users = User.all
    # render json: @users
    # commented out because a jbuilder template has been added
  end

  # GET /stories/1
  def show
    # render json: @user
    # commented out because a jbuilder template has been added
  end

  # POST /stories
  def create
    @user = User.new(user_params)
    if @user.save
      # respond_with(@user), 
      render 'show.json', status: 201
    else
      render @user.errors, status: 400
    end
  end

  # PATCH/PUT /stories/1
  def update
    if @user.update(user_params)
      # render json: @user
    else
      # render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stories/1
  def destroy
    @user.destroy
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
