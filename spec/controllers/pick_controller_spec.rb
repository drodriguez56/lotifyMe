require 'rails_helper'

describe PicksController do
  describe "GET #new" do
    it "assigns a Pick to @pick" do
      get :new
      expect(response).to be_success
    end

    it "renders :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    let(:pick_params) do {
      pick: {
        email: "-666@example.com",
        number: '374321106',
        game: "snapple",
        draw_date: Faker::Time.between(7.days.ago, Time.now),
        multiplier: 2
      },
      commit: "signup"
    }
    end

    it "redirects to edit_user_path if pick is created" do
      post :create, pick_params
      expect(response).to redirect_to edit_user_path(assigns[:user].id)
    end

    it "redirects to signup form if signup fails" do
      post :create, pick: attributes_for(:failed_pick)
      expect(response).to redirect_to root_path
    end
  end



end