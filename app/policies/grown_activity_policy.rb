class GrownActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    is_user_activity_admin_or_admin?
  end


  def create?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  private

  def is_user_activity_admin_or_admin?
    if user
      user.admin || user.activity_admin == record.title
    else
      false
    end
  end

  def admin?
    if user
      user.admin
    else
      false
    end
  end
end
