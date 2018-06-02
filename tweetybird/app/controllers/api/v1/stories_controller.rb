class Api::V1::StoriesController < ApplicationController
    before_action :set_story, only: [:show, :update, :destroy]
    skip_before_action :verify_authentication, only: [:index, :show]

    # GET /stories
    def index
      @stories = Story.all
      render json: @stories
      # commented out because a jbuilder template has been added
    end
  
    # GET /stories/1
    def show
      render json: @story
      # commented out because a jbuilder template has been added
    end
  
    # POST /stories
    def create
        :user_id = current_user.id 
        @story = Story.new(story_params)
        if @story.save
            render 'show.json', status: 201
        else
            render json: @story.errors, status: 400
        end
    end
  
    # PATCH/PUT /stories/1
    def update
      render 'show.json', status: 405
    end
  
    # DELETE /stories/1
    def destroy
        if current_user.id == @story.user_id
            @story.destroy
        else
          render json: @story, status: 401
        end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_story
        @story = Story.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
    def story_params
        params.require(:story).permit(:text, :user_id)
    end
end