module Api
  module V1
    class UsercommentController < ApplicationController
      def index
        puts 'params ', params
        if !params.has_key?(:id)
          render json: {status: 'error', message: 'param not present'}
        else
          userCommentInfo=[]
          usercomment= Comment.includes(:user, :user_comment).where(user_comments: {post_id: params[:id]}).paginate(:page => params[:page]||1, :per_page => 10).order('comments.created_at DESC')
          usercomment.each do |comment|
            userInfo=comment.user
            obj=comment.as_json
            obj["user"]=userInfo
            userCommentInfo << obj
          end
          render json: {status: 'SUCCESS', message: 'Loaded Comments', data: userCommentInfo}, status: :ok
        end
      end
    end
  end
end