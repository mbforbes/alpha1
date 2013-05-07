class Shout < ActiveRecord::Base
  # TODO how to retrieve mortragians??
  validates :who,
    inclusion: {
      in: %(drazsha, fooman),
      message: "Only Mortragians can shout!"
    }

    validates :body, presence: true
end
