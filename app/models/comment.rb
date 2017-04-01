class Comment < ApplicationRecord
  belongs_to :tproduct
  belongs_to :user
end
