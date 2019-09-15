class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_movie_and_categories, only: [:new, :show, :edit, :update, :destroy]
  before_action :check_movie_user, only: [:edit, :update, :destroy]

  def index
    @movies_by_categories = Category.includes(:movies)
    @movies_by_ratings = Movie.all.group_by(&:rating_average)
    query_object = MovieQueryObject.new(params)
    @movies = query_object.execute
  end

  def edit; end

  def new; end

  def create
    movie = Movie.new(movie_params)
    movie.user = current_user

    if movie.save
      flash[:notice] = 'Movie created with success'
      redirect_to action: 'index'
    else
      flash[:error] = movie.errors.full_messages
      redirect_to action: 'new'
    end

  end

  def update
    if @movie.update(movie_params)
      flash[:notice] = 'Movie updated with success'
      redirect_to action: 'index'
    else
      flash[:error] = @movie.errors.full_messages
      redirect_to action: 'show'
    end
  end

  def destroy
    if @movie.destroy
      flash[:notice] = 'Movie deleted with success'
    else
      flash[:error] = @movie.errors.full_messages
    end

    redirect_to action: 'index'
  end

  def rate
    rating = Rating.find_or_initialize_by(
      movie_id: params[:movie_id],
      user_id: current_user.id,
    )
    rating.rating_value = movie_params[:ratings]

    if rating.save
      flash.now[:notice] = 'Movie rated with success'
    else
      flash.now[:error] = rating.errors.full_messages
    end

    @movie = rating.movie.reload

    respond_to do |format|
      format.js { render layout: false, locals: { movie: @movie } }
    end
  end

  private

  def set_movie_and_categories
    @movie = params[:id].present? ? Movie.find(params[:id]) : Movie.new
    @categories = Category.order(:name).pluck(:name, :id)
  end

  def check_movie_user
    unless @movie.user == current_user
      flash[:error] = "You don't have permition to manipulate this movie data"

      redirect_to root_path
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :category_id, :ratings)
  end
end
