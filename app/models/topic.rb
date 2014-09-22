class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ?  privately_viewable : publicly_viewable }
  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { all }

  validates :name, length: { minimum: 5 }, presence: true
  # validates :description, length: { minimum: 5 }, presence: true

end
