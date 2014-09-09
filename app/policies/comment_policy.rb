class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def delete?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end
end