module Spree
  module Admin
    class LinksController < Spree::Admin::BaseController

      def index 
        @links = Spree::ProductLink.page(params[:page])
      end

      def new
        @link = Spree::ProductLink.new
      end

      def edit
        @link = Spree::ProductLink.find(params[:id])
      end

      def create 
        @link = Spree::ProductLink.new(params[:product_link])
        if @link.save
          redirect_to spree.admin_links_path, :notice => 'DONE!'
        else
          render :new
        end
      end

      def update
        @link = Spree::ProductLink.find(params[:id])
        if @link.update_attributes(params[:product_link])
          redirect_to :back, :notice => 'DONE!'
        else
          render :edit
        end
      end

      def destroy
        @link = Spree::ProductLink.find(params[:id])
        @link.destroy
        redirect_to :back, :notice => 'DONE!'
      end

      #  for product
      def available
        @links = Spree::ProductLink.all
        @product = Spree::Product.find_by_permalink!(params[:product_id])
      end

      def select
        @product = Spree::Product.find_by_permalink!(params[:product_id])
        @link = Spree::ProductLink.find(params[:id])
        @product.links << @link
        respond_to do |format|
          format.html { redirect_to :back }
          format.js  { render :text => 'Ok' }
        end 
      end

      def remove
        @product = Spree::Product.find_by_permalink!(params[:product_id])
        @link = Spree::ProductLink.find(params[:id])
        @product.links.delete(@link)
        respond_to do |format|
          format.html { redirect_to :back }
          format.js  { render :text => 'Ok' }
        end 
      end

      def update_positions
        params[:positions].each do |id, index|
          Spree::ProductLink.where(:id => id).update_all(:position => index)
        end 

        respond_to do |format|
          format.html { redirect_to admin_links_url() }
          format.js  { render :text => 'Ok' }
        end 
      end 

    end
  end
end
