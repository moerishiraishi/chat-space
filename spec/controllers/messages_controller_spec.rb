require 'rails_helper'

  describe MessagesController, type: :controller do

  let(:group) { FactoryGirl.create(:group) }
  let(:user) { FactoryGirl.create(:user) }
  let(:message) { { message: attributes_for(:message), group_id: group.id } }

  context 'anonymous user' do
    describe "POST #create" do
      it "renders the :index template" do
        group = create(:group)
        post :create, { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context 'signed_in user' do
    before do
      login_user
    end
      describe 'GET #index' do
        before do
          get :index, { group_id: group.id }
        end
        it "renders the :index template" do
          expect(response).to render_template :index
        end
        it "assigns the requested contact to @group" do
          expect(assigns(:group)).to eq group
        end
      describe "POST #create" do
        it "renders the :index template" do
          group = create(:group)
          post :create, message
          expect(response).to redirect_to group_messages_path
        end
      end
    end
  end
end

