# pictures_controller.rb

class PicturesController < ApplicationController

	# before_filter :load_pictures

	def index

		@pictures = Picture.all
	end


	def show
		# id comes from the route
		@picture = Picture.find params[:id].to_i

	end

	def new
		@picture = Picture.new
	end

	def create
		@picture =Picture.new(params[:picture])
			#create doesnt return a boolean, always returns an instance of a picture
		if @picture.save #returns true or false
			redirect_to pictures_path
		else
			flash.now[:error] = "Ya dun goofed."
			render :new
		end

		# @picture = Picture.new
		# @picture.url = params[:url]
		# @picture.title = params[:title]
		# @picture.artist = params[:artist]
		# success = @picture.save
		# if success
		# 	redirect_to '/pictures' # pictures_path <= this is complicated, we'll get into it later
		# end

		# render :text => "Saving a picture. URL: #{params[:url]} Artist: #{params[:artist]} Title: #{params[:title]}" 
	
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])

		if @picture.update_attributes(params[:picture])
			redirect_to pictures_path(@picture.id)
			#named routes are convenience methods created by ruby to help us navigate the application
			#redirect_to "/pictures/#{@picture.id}"
		else
			#redirect_to "/pictures"
			redirect_to pictures_path

		end	
		
	end

	# def load_pictures


		# @pictures = [
		# 	{
		# 		:title => "Megan Fox",
		# 		:artist => "Samir",
		# 		:url => 'http://serpentorslair.com/wp-content/uploads/2013/02/megan-fox-wallpaper-16.jpg'},
		# 	{
		# 		:title => "Quit Bitchin",
		# 		:artist => "Unknown",
		# 		:url => 'http://gallery.rennlist.com/albums/album441/bitch.gif'},
		# 	{
		# 		:title => "Jenga",
		# 		:artist => "Unknown",
		# 		:url => 'http://i.imgur.com/Hebp5.jpg'}
		# ]	
	# end
	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		redirect_to pictures_path
	end


end
