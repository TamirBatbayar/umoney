RSpec.describe PageContentsController, :type => :controller do
  describe "Visits index page of ページ管理 page" do

# expect(response).to redirect_to(widgets_path)
# 
    it "管理者がログインしていない場合、内容を目せずにログインページへ移動する" do
      get :index
      expect(response).to redirect_to( user_session_path)
      expect(response).to render_template("devise/sessions/new")
    end
  end
end



