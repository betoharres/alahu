class CompanyPolicy < ApplicationPolicy

  def initialize(user, record)
    super
    @belongs_to_company = user.companies.include?(record)
  end

  def index?
    true
  end

  def show?
    @belongs_to_company
  end

  def create?
    true
  end

  def update?
    @belongs_to_company && check_ability(minimum: 7)
  end

  def destroy?
    @belongs_to_company && check_ability(minimum: 15)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
