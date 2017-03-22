class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    is_user_activity_admin_or_admin?
  end

  def update?
    is_user_activity_admin_or_admin?
  end

  private

  def is_user_activity_admin_or_admin?
    if user
      user.admin || user.activity_admin == record.activity.title
    else
      false
    end
  end
end
