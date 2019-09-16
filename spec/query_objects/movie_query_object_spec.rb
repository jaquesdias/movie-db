require 'rails_helper'

RSpec.describe MovieQueryObject do
  let(:subject) { MovieQueryObject }

  describe '#execute' do
    context 'when no params is passed' do
      it 'return movies ordered by title' do
        params = {}
        movies = Movie.order(:title).page(params[:page])
        expect(subject.new(params).execute.size).to eq(movies.size)
      end
    end

    context 'when title param is passed' do
      it 'return movies that match that search ordered by title' do
        params = { q: 'John' }
        movies = Movie.where(title: params[:q]).order(:title).page(params[:page])
        expect(subject.new(params).execute.size).to eq(movies.size)
      end
    end

    context 'when category_id is passed' do
      it 'return movies with that category ordered by title' do
        params = { category_id: 5 }
        movies = Movie.where(category_id: params[:category_id]).order(:title).page(params[:page])
        expect(subject.new(params).execute.size).to eq(movies.size)
      end
    end

    context 'when rating is passed' do
      it 'return movies with that rating average ordered by title' do
        params = { rating: 3 }
        movies = Movie.where(rating_average: params[:rating]).order(:title).page(params[:page])
        expect(subject.new(params).execute.size).to eq(movies.size)
      end
    end
  end
end
