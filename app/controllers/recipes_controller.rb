class RecipesController < ApplicationController
	before_action :authenticate_user!, {only: [:registration_recipe, :create, :edit, :update, :destroy]}

	# トップページ
	def show
		@recipes = Recipe.page(params[:page]).reverse_order # 新しいもの順
	end

	# このサイトについて
	def about
	end

	# レシピ投稿画面表示用コントローラ
	def registration_recipe
		@recipe = Recipe.new
		@recipe.foods.build
		@recipe.procedures.build
	end

	def create
		@recipe = Recipe.new(recipe_params) # ストロングパラメータから精査されたデータだけをインスタンスに格納
  		@recipe.user_id = current_user.id
  		if @recipe.save
  			redirect_to root_path
  		else
  			render action: :registration_recipe
  		end
	end


	def show_recipe
		@recipe = Recipe.find(params[:id])
		@procedures = @recipe.procedures.order('no')

	end

	def edit
		@user = current_user
		@recipe = Recipe.find(params[:id])
  	end

  	def update
  		@recipe = Recipe.find(params[:id])
  		if @recipe.user_id == current_user.id
	  		if @recipe.update(recipe_params)
	  			redirect_to show_recipe_path(recipe.id)
	  		else
	  			render action: :edit
	  		end
	  	else # レシピを投稿したユーザーとログイン中のユーザーが不一致の場合、更新せずトップページに戻る
	  		redirect_to root_path
	  	end
  	end

	def destroy
        recipe = Recipe.find(params[:id])
        if recipe.user_id == current_user.id
        	recipe.destroy
        	redirect_to root_path # flash: {notice: 'レシピを削除しました。'}
        else
        	redirect_to show_recipe_path(recipe.id)
        end
    end


	Refile.secret_key = '3e025e06ffe36efaa0da3950a4cdfb2662cc56c3da1f1fb82bc6c2709976d433904d6dd2a13711f348c5f864f9c12f0e8cabdd116df3f530c0ee2d134a7868c7'
	private

	def recipe_params
		params.require(:recipe).permit(
			:recipe_name, :author_comment, :cooking_image,
			foods_attributes: [:id, :recipe_id, :food_name, :amount],
			procedures_attributes: [:id, :recipe_id, :no, :detail, :picture])
	end

end