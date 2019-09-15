require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  login_user

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with right params" do
      it "creates a new movie and redirect to index" do
        movie = create(:movie)
        params = { title: movie.title, description: movie.description, category_id: movie.category_id }
        post :create, params: { movie: params }

        expect(response).to redirect_to(action: :index)
      end
    end

    context "with wrong params" do
      it "does not save movie and redirect to new action" do
        params = { title: nil, description: nil, category_id: nil }
        post :create, params: { movie: params }

        expect(response).to redirect_to(action: :new)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      movie = create(:movie, user_id: controller.current_user.id)
      get :edit, params: { id: movie.to_param }

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      movie = create(:movie, user_id: controller.current_user.id)
      get :show, params: { id: movie.to_param }

      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    context "with right params" do
      it "updates the user and redirect to index" do
        movie = create(:movie, user_id: controller.current_user.id)
        params = { title: movie.title, description: movie.description, category_id: movie.category_id }
        patch :update, params: { id: movie.to_param, movie: params }

        expect(response).to redirect_to(action: :index)
      end
    end

    context "with wrong params" do
      it "does not updates the user and redirect to show" do
        movie = create(:movie, user_id: controller.current_user.id)
        params = { title: nil, description: movie.description, category_id: movie.category_id }
        patch :update, params: { id: movie.to_param, movie: params }

        expect(response).to redirect_to(action: :show)
      end
    end
  end

  # describe "POST #rate" do
  #   it "returns http success" do
  #     post :rate
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "DELETE #destroy" do
    it "removes the movie from table and redirect to index" do
      movie = create(:movie)
      delete :destroy, params: { id: movie.to_param }

      expect(response).to redirect_to(action: :index)
    end
  end

end
