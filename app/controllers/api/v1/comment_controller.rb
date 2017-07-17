module Api
  module V1
    class CommentController < ApplicationController

      def create
        params.permit(:comment_id, :like)
        begin
          if params[:like] == true
           comment= Comment.where(id:  params[:comment_id]).increment(:like_count, by = 1 )
            render json: {message: 'Like!', status: 'Success', data: comment}
          else
            comment= Comment.where(id:  params[:comment_id]).increment(:dislike_count, by = 1 )
            render json: {message: 'Dislike!', status: 'Success', data: comment}
          end
        rescue ActiveRecord:: Exception => e
          render json: {message: 'Exception!', status: 'False', data: e.message}
        end

      end
    end
  end
end