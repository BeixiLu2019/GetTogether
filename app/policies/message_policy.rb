class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def new?
      true
    end

    def create?
      # !record.activity.user == user
      true
    end

    # def show?
    #   true
    # end

    # def edit?
    #   update?
    # end

    # def update?
    #   record.user == user
    # end

    # def destroy?
    #   record.user == user
    # end

end
