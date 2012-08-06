class User < ActiveRecord::Base

  has_secure_password

  # TODO Need to review what fields are accessible via form changes for a user
  attr_accessible :name, :initials, :state_id, :category_id, :an_code, :password, :password_confirmation, :email

  validates_uniqueness_of :an_code

  # adding defined roles based on entity types (to be noted
  ROLES = %w[system_admin domain_admin user]

  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role_symbols
    # TODO: Look at other ways of symbolizing data for Ray
    roles.map(&:to_sym)
  end

  def role?(role)
    roles.include? role.to_s
  end

end

