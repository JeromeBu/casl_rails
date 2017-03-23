class InscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def get_xlsx?
    true
  end

  def create?
    user.children.include?(record.child) || record.child.blank?
  end
end
