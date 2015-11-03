class SearchForm
  include ActiveAttr::TypecastedAttributes
  include ActiveAttr::BasicModel
  include ActiveAttr::MassAssignment

  attribute :keywords, type: String
  attribute :image_only, type: Boolean, default: false

  def valid_search?
    !keywords.blank?
  end

  def search_summary
    if image_only
      "You searched for <strong>#{keywords}</strong> limited to <strong>images</strong>"
    else
      "You searched for <strong>#{keywords}</strong>"
    end
  end

  def self.from_params(params)
    SearchForm.new(params[model_name.param_key])
  end

end