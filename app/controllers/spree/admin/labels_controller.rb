module Spree
  module Admin
    class LabelsController < Spree::Admin::BaseController

      def index 
        @labels = Spree::ProductLabel.page(params[:page])
      end

      def new
        @label = Spree::ProductLabel.new
      end
      
      def edit
        @label = Spree::ProductLabel.find(params[:id])
      end
      
      def create 
        @label = Spree::ProductLabel.new(params[:product_label])
        if @label.save
        else
          render :new
        end
      end
    end
  end
end
