class Delivery < ActiveRecord::Base
  belongs_to :user

  def as_json(*)
    super(
      only: [:pick_up_date, :name],
      methods: [:user]
    )
  end
end
