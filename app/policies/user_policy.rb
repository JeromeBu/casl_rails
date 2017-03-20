class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    is_user_owner_or_admin?
  end

  def update?
    is_user_owner_or_admin?
  end

  private

  def is_user_owner_or_admin?
    user.admin? || record == user
  end

end
