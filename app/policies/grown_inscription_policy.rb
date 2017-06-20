class GrownInscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def get_xlsx?
    true
  end

  def create?
    true
  end
end
