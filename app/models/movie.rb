class Movie < ActiveRecord::Base
	has_many :reviews
	validates :name, :rating, :presence => true

	before_save :set_rating
	after_save :set_rating_6

	def set_rating
		self.rating = 5
	end

	def set_rating_6
		self.rating = 6
	end


end
