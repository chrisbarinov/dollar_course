class DollarCustomization < ApplicationRecord
  validates :course, numericality: {message: "Курс доллара должен быть числом"}
  validates :active_to, presence: {message: "Дата со временем не может быть пустой"}
end
