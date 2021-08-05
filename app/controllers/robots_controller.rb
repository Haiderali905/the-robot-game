class RobotsController < ApplicationController
	before_action :initialize_position
	def index
	end

	def place
		check_position_and_render
	end

	def move
		next_move
		check_position_and_render
	end

	def rotate
		@rotation = params[:r]
		directions = ['north', 'east', 'south', 'west']
		indexx = directions.find_index @face
		if @rotation == 'Right'
		 	indexx = indexx < directions.length - 1 ? indexx + 1 : 0
		elsif @rotation == 'Left'
		 	indexx = indexx > 0 ? indexx - 1 : directions.length - 1
		end
		@face = directions[indexx]
		return render partial: 'robots/game_table'
	end

	private
	def initialize_position
		@pos_x = params[:x].to_i
		@pos_y = params[:y].to_i
		@face = params[:f]
	end

	def legal_position
		(0..4).cover?(@pos_x) && (0..4).cover?(@pos_y)
	end

	def next_move
		case @face
		when 'north'
			@pos_x-=1
		when 'south'
			@pos_x+=1
		when 'east'
			@pos_y+=1
		when 'west'
			@pos_y-=1
		end
	end

	def check_position_and_render
		if legal_position
			return render partial: 'robots/game_table'
		else
			return render json: {success: false}
		end
	end
end