module PageObjectHelpers
  def department_page
    @department_page ||= DepartmentPage.new(@browser)
  end

  def home_page
    @home_page ||= HomePage.new(@browser)
  end

  def login_page
    @login_page ||= LoginPage.new(@browser)
  end
end

World(PageObjectHelpers)