class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def delete?
    can_moderate?(user, record)
  end
end