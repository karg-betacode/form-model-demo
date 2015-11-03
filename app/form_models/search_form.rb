# So far only found ActiveAttr, https://github.com/cgriego/active_attr 
# work nicely with SimpleForm :(
# Reform https://github.com/apotonick/reform looks pretty interesting too.
class SearchForm
  include ActiveAttr::TypecastedAttributes
  include ActiveAttr::BasicModel
  include ActiveAttr::MassAssignment

  attribute :keywords, type: String
  attribute :image_only, type: Boolean, default: false

  # Logic that affect views can be placed here.
  def valid_search?
    !keywords.blank?
  end

  def search_summary
    if image_only
      "You searched for <strong>#{keywords}</strong> limited to <strong>images</strong>".html_safe
    else
      "You searched for <strong>#{keywords}</strong>".html_safe
    end
  end

  def self.from_params(params)
    SearchForm.new(params[model_name.param_key])
  end

end