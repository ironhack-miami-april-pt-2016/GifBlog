Rails.application.routes.draw do
	# get '/posts/new' => 'posts#new'
	# post '/posts' => 'posts#create'
	# get '/posts' => 'posts#index'

	post '/posts/:id/upvote' => 'posts#upvote'
	post '/posts/:id/downvote' => 'posts#downvote'

	# get '/posts/(:sort_type)' => "posts#index"
	# get '/posts/low-rated' => 'posts#low_rated_index'
	# get '/posts/sorted-by-date' => 'posts#sorted_by_date'
	# get '/posts/sorted-by-votes' => 'posts#sorted_by_votes'

	resources :posts, only: [:index, :new, :create, :show]
end
