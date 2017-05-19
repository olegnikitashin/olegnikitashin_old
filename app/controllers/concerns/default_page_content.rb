module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Portfolio | Oleg Nikitashin'
    @seo_keywords = 'Oleg Nikitashin Portfolio ruby on rails'
  end
end