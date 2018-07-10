class Api::V1::StoriesController < ApplicationController
    before_action :set_story, only: [:show, :update, :destroy, :share]
    skip_before_action :verify_authentication, only: [:index, :show]

    # GET /stories
    def index
      @stories = Story.all
      # render json: @stories
      # commented out because a jbuilder template has been added
    end
  
    # GET /stories/1
    def show
      # render json: @story
      # commented out because a jbuilder template has been added
    end
  
    # POST /stories
    def create
        @story = Story.new(story_params)
        @story.user_id = current_user.id
        if @story.save
            render 'show.json', status: 201
        else
            render json: @story.errors, status: 400
        end
    end
  
    # PATCH/PUT /stories/1
    def update
      if current_user.admin
        if @story.update(story_params)
          render 'show.json', status: 202
        else
          render json: @story.errors, status: 400
        end
      else
        render 'show.json', status: 405
      end
    end
  
    # DELETE /stories/1
    def destroy
        if current_user.admin || current_user.id == @story.user_id
            @story.destroy
        else
          render json: @story, status: 401
        end
    end

    def share
      @share = Story.new(story_params)
      @share.story_id = @story.id
      @share.user_id = current_user.id
      @share.text = @story.text
      if @story.save
        render 'show.json', status: 201
      else
        render json: @share.errors, status: 400
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_story
        @story = Story.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
    def story_params
        params.permit(:text, :user_id, :story_id)
    end
end