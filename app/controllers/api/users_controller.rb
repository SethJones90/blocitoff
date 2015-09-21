class Api::UsersController < ApiController


  def index
    users = User.all
    render json: users, each_serializer: UserSerializer 
  end

  def show
    if params[:id]
        user = User.find(params[:id])
    else
      user = current_user
    end
    render json: user, each_serializer: UserSerializer 
  end

  def create
    user = User.new(user_params)
    if user.save

      render json: user
    else

      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

 end