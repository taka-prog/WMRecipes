class UsersController < ApplicationController
  def show
  	@recipes = Recipe.page(params[:page]).reverse_order # 新しいもの順
  	@user = User.find(params[:id])
  end

  def edit
  end

  def update
  	user = User.find(params[:id])
    user.update(user_params)
    redirect_to root_path
  end

  private
    def user_params
        params.require(:user).permit(:user_name, :icon, :profile)
    end
end
