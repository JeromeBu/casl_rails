class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    admin?
  end

  def update?
    is_user_activity_admin_or_admin?
  end

  def destroy?
    admin?
  end

  private

  def admin?
    if user
      user.admin
    else
      false
    end
  end

  def is_user_activity_admin_or_admin?
    if user
      user.admin || user.activity_admin == record.title
    else
      false
    end
  end
end
