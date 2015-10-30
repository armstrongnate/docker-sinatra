require_relative 'constants'

module Helper

  # clone users array for immutability
  def all_users
    USERS.clone
  end

end
