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
    it "redirects to root_path if pick is created" do
      post :create, pick: attributes_for(:pick)
      expect(response).to redirect_to root_path
    end
  end

end