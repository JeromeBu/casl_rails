class ChildPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def update?
    is_user_owner_or_admin?
  end

  def destroy?
    is_user_owner_or_admin?
  end

  private

  def is_user_owner_or_admin?
    user.admin? || record.user == user
  end
end
