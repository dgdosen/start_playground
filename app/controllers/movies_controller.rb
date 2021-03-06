class MoviesController < ApplicationController
  respond_to :html, only: [:index, :show]
  respond_to :json, only: [:create, :destroy]

  def create
    new_movie.save
    respond_with new_movie
  end

  def destroy
    movie.destroy
    respond_with movie
  end

  def populate

    starts = Start.find_all_by_race_id 54

    Movie.delete_all
    #[
    #  ['The Revengers', 207438708, 538116000, 38.5],
    #  ['Harry Potter and the Deathly Hallows Part 2', 169189427, 381011219, 44.4],
    #  ['The Dark Knight', 158411483, 533345358, 29.7],
    #  ['The Hunger Games', 152535747, 397200000, 38.4],
    #  ['Spiderman 3', 151116516, 336530303, 44.9],
    #  ['Twilight: New Moon', 142839137, 296623634, 48.2]
    #].each do |data|
    #  data.change_name 'horse'
    #  Movie.create Hash[[:name, :opening_weekend, :total_gross, :percent_of_total].zip(data)]
    #end

    starts.each do |one|
      mov = Movie.new
      mov.name = one.horse.name
      #mov.is_scratched? = one.is_scratched?
      #mov.is_tongue_tied? = one.is_tongue_tied?
      mov.post_position = one.post_position
      mov.program_number = one.program_number
      mov.save
    end
    redirect_to root_path
  end

  def show
    render :index
  end

  private

  def movie
    @movie ||= Movie.find(params[:id])
  end
  helper_method :movie

  def movies
    @movies ||= Movie.all
  end
  helper_method :movies

  def new_movie
    @new_movie ||= Movie.new(params[:movie])
  end
  helper_method :new_movie
end
