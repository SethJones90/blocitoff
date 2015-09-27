class Api::ItemsController < ApiController

  before_action :authenticated?

  def index
    user = User.find_by(email: request.headers["HTTP_USERNAME"] )
    items = user.items

    render json: items, each_serializer: ItemSerializer
  end

  def create
    user = User.find_by(email: request.headers["HTTP_USERNAME"] )
    item = Item.new(item_params)
    if item.save

      render json: item
    else

      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: {}, status: :no_content

  rescue ActiveRecord::RecordNotFound
    render :json => {}, :status => :not_found
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
  
end

