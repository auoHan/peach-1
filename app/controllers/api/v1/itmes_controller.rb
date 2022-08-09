class Api::V1::ItmesController < ApplicationController
  def index
    items = Item.page params[:page]
    render json: { resources: items }
  end
  def create
    item = Item.new amount: 1
    if item.save
      render json: {resources: item}
    else
      render json: {errors: item.errors}    
    end  
  end    
end
