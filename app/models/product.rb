class Product < ApplicationRecord
  belongs_to :type
  belongs_to :brand
  belongs_to :purveyor
  belongs_to :kind
end
