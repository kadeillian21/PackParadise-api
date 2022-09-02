class Product < ApplicationRecord
  def is_discounted?
    if price < 10
      true
    else
      false
    end
  end

  def tax
  end

  def total
  end
end
