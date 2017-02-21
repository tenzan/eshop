class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :excluding_archived, lambda {where(archived_at: nil)}

  validates :first_name, :last_name, presence: true

  def to_s
    "#{last_name}, #{first_name} - #{email} #{admin? ? "(Admin)" : ""}"
  end

  def archive
    self.update(archived_at: Time.now)
  end

  def active_for_authentication?
    super && archived_at.nil?
  end

  def inactive_message
    archived_at.nil? ? super : :archived
  end
end
