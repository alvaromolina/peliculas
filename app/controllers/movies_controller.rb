class MoviesController < ApplicationController

	def index
		@movies  = Movie.all
		
	end

	def new
		@movie = Movie.new
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
	 	if @movie.update_attributes(movie_params)
	 		redirect_to "/movies/"+@movie.id.to_s, notice: "Pelicula modificada exitosamente"
	 	else
	 		render "edit"	 			
	 	end
	end

	def delete
		@movie = Movie.find(params[:id])
	 	if @movie.destroy
	 		redirect_to "/movies", notice: "Pelicula borrada exitosamente"
	 	else
	 		redirect_to "/movies", notice: "Error al borrar pelicula"
	 	end
	end


	def create
	 	@movie = Movie.new(movie_params)
	 	if @movie.save
	 		redirect_to "/movies/"+@movie.id.to_s, notice: "Pelicula creada exitosamente"
	 	else
	 		render "new"	 			
	 	end
	end

	def movie_params
		params.require(:movie).permit(:name, :rating)
	end

end
