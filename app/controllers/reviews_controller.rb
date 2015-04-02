class ReviewsController < ApplicationController


	def create
	 	@review = Review.new(review_params)
	 	if @review.save
	 		redirect_to "/movies/"+@review.movie.id.to_s, notice: "Comentario creada exitosamente"
	 	else
	 		redirect_to "/movies/"+@review.movie.id.to_s, notice: "Error al crear Comentario"
	 	end
	end

	def review_params
		params.require(:review).permit(:description, :movie_id)
	end

end
