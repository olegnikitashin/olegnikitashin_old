module PortfoliosHelper
  def image_generator(width:, height:)
    "http://placehold.it/#{width}x#{height}"
  end

  def portfolio_img(img, type)
    if img.model.main_image? || img.model.thumb_image?
      img
    elsif type == 'thumb'
      image_generator(height: '200', width: '350')
    elsif type == 'main'
      image_generator(height: '400', width: '600')
    end
  end
end
