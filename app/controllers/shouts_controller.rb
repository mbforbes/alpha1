class ShoutsController < ApplicationController

	# Controller method pre-filtering. Groups outlined below, too.
	# ------------------------------------------------------------

	before_filter :signed_in_user, only: [:new, :create]
	before_filter :correct_user, only: [:edit, :update, :destroy]


	# Viewing: no restrictions.
	# -------------------------

	def index
		@shouts = Shout.all
	end

	def show
		@shout = Shout.find(params[:id])
	end


	# Make new shouts: must be signed_in_user.
	# ----------------------------------------

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


	# Deal with existing shouts: must be correct_user.
	# ------------------------------------------------

	def edit
		# TODO
	end

	def update
		# TODO
	end

	def destroy
		@shout.destroy
		redirect_to shouts_path
	end


	# Private helpers (before_filter's).
	# ----------------------------------

	private
		def shout_params
			params.require(:shout).permit(:body)
		end

		def correct_user
			@shout = current_user.shouts.find_by(id: params[:id])
			redirect_to root_path if @shout.nil?
		end
end
