class InscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    raise
    user.children.include?(record.child)
  end
end
