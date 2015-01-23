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
      expect(response).to redirect_to edit_user_path
    end

    it "redirects to signup form if signup fails" do
      post :create, pick: attributes_for(:failed_pick)
      expect(response).to redirect_to new_pick_path
    end
  end



end