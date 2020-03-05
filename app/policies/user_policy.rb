class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def new?
      create?
    end

    def create?
      true
    end

    def show?
      true
    end

    def edit?
      update?
    end

    def update?
      # record.user == user
      true
    end

end
