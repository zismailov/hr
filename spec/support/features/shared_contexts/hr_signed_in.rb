shared_context "hr signed in" do
  let(:current_user) { create :user, :hr }

  before do
    login_as current_user
  end
end
