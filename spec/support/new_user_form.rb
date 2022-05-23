class NewUserForm
  include Capybara::DSL
  include FactoryBot::Syntax::Methods
  include LoginHelper
  include Rails.application.routes.url_helpers

  def login
    user = create(:user)
    login_user(user)
    self
  end

  def visit_page
    visit()
  end

  def fill_in_with(params = {})
    fill_in('iduff')
  end
end
