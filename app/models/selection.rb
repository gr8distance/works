class Selection < ActiveRecord::Base
  belongs_to :user
  belongs_to :staff
end
