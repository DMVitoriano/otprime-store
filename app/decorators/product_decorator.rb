class ProductDecorator < SimpleDelegator
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TagHelper

  def price
    return content_tag(:span, number_to_currency(super), class: "text-muted text-decoration-line-through") + " #{number_to_currency(promo_price, unit: "R$", precision: 2)}" if promo?
    number_to_currency(super, unit: "R$", precision: 2)
  end
end
