require 'rails_helper' do

  describe "CurrentUser", type: :model do
    xit "has valid attributes" do
      user = User.new(username: "betty", password: "password", email: "boo@example.com")
      current_user = CurrentUser.new(user)
      expect(current_user.username).to eq("betty")
      expect(current_user.email).to eq("boo@example.com")
      expect(current_user.password).to eq("password")
      expect(current_user.spots).to eq([])
      expect(current_user.polygons).to eq([])
      expect(current_user.avatar).to eq(nil)
    end
  end
end
