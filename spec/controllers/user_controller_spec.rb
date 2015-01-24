require 'rails_helper'


describe UsersController do
  let(:user) { create :user }

  describe 'GET #index' do
    it "assigns a User to @user" do
      get :new
      expect(response).to be_success
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    xit "redirects to root_path if user created" do
      post :create,  attributes_for(:post, user: :user)
      response.should be_success
    end
  end

  describe 'GET #show' do
    let(:user) {  build_stubbed(:user,
      username: "kobebryant",
      password_digest: "ballislyfe",
      email: 819913)}

    before :each do
      allow(User).to \
        receive(:order).with('username, password_digest, email').and_return([user])
      allow(User).to \
        receive(:find).with(user.id.to_s).and_return(user)
      get :show, id: user
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe 'DELETE #destroy' do
  let(:user) { create :user }
    it "deletes the contact" do
      expect{
        delete :destroy, id: user
      }.to change(User, :count).by(1)
    end
  end
end
