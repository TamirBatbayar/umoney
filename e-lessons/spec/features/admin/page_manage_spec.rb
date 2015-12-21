feature 'Sign in', :devise do
	# let(:user) { FactoryGirl.create(:user, :name => "SECRET_MAN", :role => "supplier", :email => "the_mail@gmail.com") }
	let(:user) { FactoryGirl.create(:user) }

  scenario 'Admin can see the page_managment page' do
	# user = FactoryGirl.create(:user)
    signin('generjet@gmail.com', '123456789')
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
    visit page_contents_path
    expect(page).to have_content'ページ一覧'
    expect(page).to have_content'ページ名'
  end

  scenario 'Admin add pages' do
  	Page_content = instance_double("PageContent")
  	allow(Page_content).to receive_messages(
    :name => "サービス",
    :content => "サービスサービスサービスサービスサービスサービスサービスサービスサービスサービス")

    expect(Page_content).to receive(:name => "Kiki",:content => "The conntent for Kiki")
  	puts Page_content.inspect
  end
end


# feature 'Home page' do

#   # Scenario: Visit the home page
#   #   Given I am a visitor
#   #   When I visit the home page
#   #   Then I see "Welcome"
#   scenario 'visit the home page' do
#     visit root_path
#     expect(page).to have_content 'ホーム'
#     expect(page).to have_content 'メニュー'
#     expect(page).to have_content '商品'
#   end

# end