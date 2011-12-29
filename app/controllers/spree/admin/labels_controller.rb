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
          redirect_to spree.admin_labels_path, :notice => 'DONE!'
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
        respond_to do |format|
          format.html { redirect_to :back }
          format.js  { render :text => 'Ok' }
        end 
      end

      def remove
        @product = Spree::Product.find_by_permalink!(params[:product_id])
        @label = Spree::ProductLabel.find(params[:id])
        @product.labels.delete(@label)
        respond_to do |format|
          format.html { redirect_to :back }
          format.js  { render :text => 'Ok' }
        end 
      end

      def update_positions
        params[:positions].each do |id, index|
          Spree::ProductLabel.where(:id => id).update_all(:position => index)
        end 

        respond_to do |format|
          format.html { redirect_to admin_labels_url() }
          format.js  { render :text => 'Ok' }
        end 
      end 

    end
  end
end
