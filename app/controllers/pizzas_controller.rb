class PizzasController < ApplicationController

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@pizza = @restaurant.pizzas.create(params[:pizza].permit(:name, :price, :description))
		@pizza.user_id = current_user.id if current_user
		@pizza.save

		if @pizza.save
			redirect_to restaurant_path(@restaurant)
		else
			render 'new'
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:restaurant_id])
		@pizza = @restaurant.pizzas.find(params[:id])
	end	

	def update
		@restaurant = Restaurant.find(params[:restaurant_id])
		@pizza = @restaurant.pizzas.find(params[:id])

		if @pizza.update(params[:pizza].permit(:name, :price, :description))
			redirect_to restaurant_path(@restaurant)
		else
			render 'edit'
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:restaurant_id])
		@pizza = @restaurant.pizzas.find(params[:id])
		@pizza.destroy
		redirect_to restaurant_path(@restaurant)
	end

end
