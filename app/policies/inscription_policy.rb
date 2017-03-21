class InscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.children.include?(record.child) || record.child.blank?
  end
end
