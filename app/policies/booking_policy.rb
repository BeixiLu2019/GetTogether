class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
      true
    end

  def new?
    create?
  end

  def create?
    # !record.activity.user == user
    # record.user == user
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end

  def destroy?
   record.user == user
    # true
  end
end
