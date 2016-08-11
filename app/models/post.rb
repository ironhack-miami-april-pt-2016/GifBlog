class Post < ApplicationRecord
	has_many :labelled_posts
	has_many :labels, through: :labelled_posts
	
	def self.more_than_four_votes
		where("votes >= 5")
	end

	def self.less_than_four_votes
		where("votes < 5")
	end
end
