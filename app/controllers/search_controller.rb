# You can form model to clean up action code. 
# It also allows you to move code related to view away from your controller.
# Form model can function as generic form controllers not tie to any of your models.

class SearchController < ApplicationController

  # Start with this
  def search_v1
    if params[:search].present?
      @keywords    = params[:search][:keywords]
      @image_only  = params[:search][:image_only] == '1'
      # @result = SearchQuery.run(@keywords, @image_only)

      @search_summary = if @image_only
        "You searched for <strong>#{@keywords}</strong> limited to <strong>images</strong>"
      else
        "You searched for <strong>#{@keywords}</strong>"
      end
    end
  end

  # Simplified to form model
  def search_v2
    @form = SearchForm.from_params(params)
    # @result = SearchQuery.run(@form)
  end
end
