class AddDefaultValueToVotesInPosts < ActiveRecord::Migration[5.0]
  def change
  						#   table   column    type  	 options
  	change_column :posts, :votes, :integer, default: 0
  end
end
