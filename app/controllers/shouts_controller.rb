class ShoutsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create]
	before_filter :correct_user, only: :destroy

	def index
		@shouts = Shout.all
	end

	def show
		@shout = Shout.find(params[:id])
	end

	def new
		@shout = Shout.new #(who: current_user)
	end

	def create
		@shout = current_user.shouts.build(shout_params)
		if @shout.save
			redirect_to shouts_path
		else
			render 'new'
		end
	end

	def edit
	end

	def destroy
		@shout.destroy
		redirect_to shouts_path
	end

	private
		def shout_params
			params.require(:shout).permit(:body)
		end

		def correct_user
			@shout = current_user.shouts.find_by(id: params[:id])
			redirect_to root_path if @shout.nil?
		end
end
