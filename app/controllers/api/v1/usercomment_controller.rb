module Api
  module V1
    class UsercommentController < ApplicationController
      def index
        puts 'params ',params
        if !params.has_key?(:id)
          render json:{status: 'error', message: 'param not present'}
        else
        usercomment=UserComment.where(post_id: params[:id]);
        puts "usercomment",usercomment
        if usercomment.blank?
          render json:{status: 'success', message: 'no comments found',data:[]}
        else
          #comment=Comment.includes(:users).where('user_comments.post_id':params[:id])
          comment=Comment.joins(:users).where(user_comments:{post_id: params[:id]})

         # comment=UserComment.includes(:user).includes(:comment).where(post_id:1)
         # comment=Comment.includes(:user_comments,:user).where('user_comments.post_id':"1").references(:users)
         # comment=Comment.joins(:user_comments,:user).where('user_comments.post_id':"1").select('comments.*')
          #comment=Comment.joins(user_comments: :users).where(users:{id:1})
        ##comments = Comment.joins(:user).where(id: usercomment[:comment_id]).paginate(:page => params[:page], :per_page => 10).order('id DESC');
        render json: {status: 'SUCCESS', message: 'Loaded Comments', data: comment}, status: :ok
        end
          end
        end
    end
  end
end
cmd