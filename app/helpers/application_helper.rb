module ApplicationHelper
  def bulma_class_for(type)
    bulma_classes.fetch(type, 'is_info')
  end

  private

  def bulma_classes
    { 'success' => 'is-success', 'error' => 'is-danger' }
  end
end
