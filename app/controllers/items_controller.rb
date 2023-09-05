class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy interest ]

  # GET /items or /items.json
  def index
    @items = Item.filter(params.slice(:category, :address))
    @itemspag = @items.page(params[:page]).per(10)
    @hash = Gmaps4rails.build_markers(@items) do |item, marker|
      marker.lat item.latitude
      marker.lng item.longitude
      marker.infowindow render_to_string(partial: "/items/template", locals: { item: item })
      marker.json(id: item.id)
      marker.picture("url" => "https://hkdigital.fr/logopointer2.png", "width" => 52, "height" => 40)
    end
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_url(@item), notice: "L'annonce a bien été publiée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    if @item.update(item_params)
      redirect_to item_url(@item), notice: "L'annonce a bien été modifiée"
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, notice: "L'annonce a bien été supprimée." 
  end

  def interest
    Interest.create(user: current_user, item: @item)
    redirect_to current_item
    flash[:success] = "L'utilisateur a été prévenu par mail de votre interet, vous pouvez également le contacter "
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:picture, :description, :date, :address, :id, :image, :category, :user_id )
    end
end
