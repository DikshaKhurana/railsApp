module Api
  module V1
    class UserController < ApplicationController
      def create
        user=User.new(postparams);
        begin
          if user.save
            render json: {message: 'User created sucessfully!', status: 'Success', data: user}
          else
            render json: {message: 'User not created!', status: 'False', data: user.errors}
          end
        rescue ActiveRecord::RecordInvalid, Exception => e
          render json: {message: 'User not created!', status: 'False', data: e.message}
        end
      end

      private

      def postparams
        params.permit(:name, :email_id)
      end

    end
  end
end