class Delivery < ActiveRecord::Base
  belongs_to :driver, :class_name => "User", :foreign_key => "user_id"

  def as_json(*)
    super(
      only: [:pick_up_date, :name, :id],
      methods: [:driver]
    )
  end
end
