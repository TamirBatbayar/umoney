	describe User do

  # before(:each) { @user = User.new(account: 'sumitomo123') }
  let(:user) { FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:account) }

  it "#email returns a string" do
  	user.account = "sumitomo123"
    expect(@user.account).to match 'sumitomo123'
  end

end
