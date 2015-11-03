class SearchController < ApplicationController

  # search for form
  # operations on where entities are tied to one
  #   - generic search
  def search_v1
    if params[:search].present?
      @keywords    = params[:search][:keywords]
      @image_only  = params[:search][:image_only] == '1'
      # @result = SearchQuery.run(keywords)

      @search_summary = if @image_only
        "You searched for <strong>#{@keywords}</strong> limited to <strong>images</strong>"
      else
        "You searched for <strong>#{@keywords}</strong>"
      end
    end
  end

  def search_v2
    @form = SearchForm.from_params(params)
    # @result = SearchQuery.run(keywords)
  end
end
