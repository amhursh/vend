class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def average_price
  	"$" + sprintf('%.2f', snacks.average(:price))
  end

  def inventory
  	snacks.count
  end

end
