module Api
  module V1
    class PostController < ApplicationController
      def index
      # post= Post.page(params[:page],:per_page => 10).order('id DESC');
       post = Post.paginate(:page => params[:page], :per_page => 10).order('id DESC');
        render json: {status: 'SUCCESS', message: 'Loaded Posts', data: post}, status: :ok
      end
    end
  end
end
