# Helpers to initialize the page objects
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

  def employee_page
    @employee_page ||= EmployeePage.new(@browser)
  end

  def employee_summary_page
    @employee_summary_page ||= EmployeeSummaryPage.new(@browser)
  end

  def employee_time_off_page
    @employee_time_off_page ||= EmployeeTimeOffPage.new(@browser)
  end

  def title_page
    @title_page ||= TitlePage.new(@browser)
  end
end

World(PageObjectHelpers)
