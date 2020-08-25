module RoomsHelper
  def edit_test_attribute(name)
    "edit-#{name.parameterize}"
  end

  def delete_test_attribute(name)
    "delete-#{name.parameterize}"
  end
end
