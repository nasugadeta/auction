class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    #formからデータを受けとる
    @item = Item.new(item_params)
    #これを保存する
    @item.save
    #show.html.erbに飛ばす
    redirect_to "/items/#{@item.id}"
  end

  private

  def item_params
    #params.require(:key).permit(:filter)
    params.require(:item).permit(
      :name,
      :price,
      :seller_id,
      :description,
      :email,
      :image_url
      )
  end
end
