class ApplicationPolicy
# TODO: deal with association
  attr_reader :user, :record, :permissions

  def initialize(user, record)
    unless user then raise Pundit::NotAuthorizedError, "must be logged in" end
    @user = user
    @record = record
    model_name = record.class.to_s.gsub(/::.+/, '') # when it's a collection
    @permissions = @user.role.authorizations
                        .where(resourceable_type: model_name)
  end

  def index?
    check_ability minimum: 1
  end

  def show?
    if scope.where(:id => record.id).exists?
      first_check   = check_ability minimum: 1, record_id: record.id
      second_check  = check_ability minimum: 1 unless first_check

      first_check or second_check
    end
  end

  def create?
    check_ability minimum: 3
  end

  def new?
    create?
  end

  def update?
    check_ability minimum: 5
  end

  def edit?
    update?
  end

  def destroy?
    check_ability minimum: 9
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def check_ability(options = {})
    @permissions.where(resourceable_id: options[:record_id])
                .pluck(:ability)
                .bsearch{|ability| ability >= options[:minimum] }
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
