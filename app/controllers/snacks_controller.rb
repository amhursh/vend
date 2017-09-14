class SnacksController < ApplicationController

	def show
		@snack = Snack.find(params[:id])
		@locations = @snack.machines
	end

end