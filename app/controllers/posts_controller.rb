class PostsController < ApplicationController
	# Public
	def index
		@posts = Post.more_than_four_votes
		# if params[:sort_type] == "low_rated"
		# 	@posts = Post.less_than_five_votes
		# elsif params[:sort_type] == "sorted_by_date"
		# 	@posts = Post.more_than_four_votes.order(created_at: :desc)
		# else
		# 	@posts = Post.all 
		# end
	end

	def low_rated_index
		@posts = Post.less_than_five_votes
		render 'index'
	end

	def sorted_by_date
		@posts = Post
							.more_than_four_votes
							.order(created_at: :desc)
		render 'index'
	end

	def sorted_by_votes
		@posts = Post
							.more_than_four_votes
							.order(votes: :asc)
		render 'index'
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to posts_path
		else 
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def upvote
		# find the post
		@post = Post.find(params[:id])
		# increase the votes by 1
		@post.increment!(:votes)
		# redirect to the show page for that post
		redirect_to post_path(@post)
	end

	def downvote
		@post = Post.find(params[:id])
		@post.decrement!(:votes)
		redirect_to post_path(@post)
	end
	#Protected

	private 

	def post_params
		params.require(:post).permit(:title, :gif_url, label_ids: [])
	end
end