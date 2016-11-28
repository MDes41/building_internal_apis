module Api
  module V1
    class ItemsController < ApplicationController
      def index
        render json: Item.all
      end

      def show
        render json: Item.find(params[:id])
      end

      def create
        render json: Item.create(name: items_params[:name], price: items_params[:price]), status: 201
      end

      private
        def items_params
          params.permit(:name, :price)
        end
    end
  end
end
