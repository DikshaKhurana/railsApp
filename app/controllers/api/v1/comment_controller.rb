module Api
  module V1
    class CommentController < ApplicationController

      def create
        params.permit(:user_id, :comment_id, :like)
        user= User.where(id: params[:user_id])
        if user.length == 0
          render json: {message: 'User not present.!', status: 'False'}
        else
          begin
            if params[:like] == true
              comment= Comment.where(id: params[:comment_id]).last.increment!(:like_count, by = 1)
              render json: {message: 'Like!', status: 'Success', data: comment}
            else
              comment= Comment.where(id: params[:comment_id]).last.increment!(:dislike_count, by = 1)
              render json: {message: 'Dislike!', status: 'Success', data: comment}
            end
          rescue ActiveRecord::Exception => e
            render json: {message: 'Exception!', status: 'False', data: e.message}
          end
        end
      end

      def savecomment
        params.permit(:post_id, :user_id, :comment)
        user= User.where(id: params[:user_id])
        if user.length == 0
          render json: {message: 'User not present.!', status: 'False'}
        else
          comment=Comment.new(comment: params[:comment]);
          Comment.transaction do
            comment.save!
            raise ActiveRecord::Rollback unless UserComment.transaction(requires_new: true) do
              usercomment=UserComment.new(user_id: params[:user_id], post_id: params[:post_id], comment_id: comment.id)
              if usercomment.save!
                render json: {message: 'comment saved!', status: 'Success', data: usercomment}
              else
                raise ActiveRecord::Rollback
              end
            end
          end
        end
      end

    end
  end
end