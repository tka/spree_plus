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

      def update
        @label = Spree::ProductLabel.find(params[:id])
        if @label.update_attributes(params[:product_label])
          redirect_to :back, :notice => 'DONE!'
        else
          render :edit
        end
      end

      def destroy
        @label = Spree::ProductLabel.find(params[:id])
        @label.destroy
        redirect_to :back, :notice => 'DONE!'
      end
      
      #  for product
      def available
        @labels = Spree::ProductLabel.all
        @product = Spree::Product.find_by_permalink!(params[:product_id])
      end

      def select
        @product = Spree::Product.find_by_permalink!(params[:product_id])
        @label = Spree::ProductLabel.find(params[:id])
        @product.labels << @label
      end

      def remove
        @product = Spree::Product.find_by_permalink!(params[:product_id])
        @label = Spree::ProductLabel.find(params[:id])
        @product.labels.delete(@label)
      end

    end
  end
end
