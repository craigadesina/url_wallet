class BookmarkPolicy < ApplicationPolicy
  
  def update?
    user.present? && (record.topic.user == user)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (record.topic.user == user)
  end
end