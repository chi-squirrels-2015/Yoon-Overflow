require 'rails_helper'

describe UsersController do
  let!(:user) { User.create!(name: 'Fake Name', email: 'fake@fake.com', password: 'password') }

  describe 'GET #show' do
    it 'assigns the current user as @user' do
      get :show, { id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end
  end
end
