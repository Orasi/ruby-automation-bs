class TitlePage
  include PageObject

  link(:add_title, text: 'New Title')
  text_field(:title_name, id: 'title_name')
  button(:create_title, value: /^\w+ Title$/, class: 'btn-primary')
  table(:titles_table, class: 'table')
  div(:alert, class: 'alert')

  def create_title_with(title)
    add_title
    self.title_name = title
    create_title
  end

  def delete_title(title)
    self.class.button(:delete) do
      titles_table_element[title]['Title']
      .span_element(class: 'glyphicon-trash')
    end
    confirm(true) do
      delete
    end
  end

  def edit_title_name_with(new_title, old_title)
    self.class.button(:edit) do
      titles_table_element[old_title]['Title'].span_element(class: 'glyphicon-pencil')
    end
    edit
    self.title_name = new_title
    create_title
  end
end