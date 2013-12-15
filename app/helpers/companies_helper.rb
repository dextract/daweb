module CompaniesHelper


  def owners(company)
    @owners = company.users.where(memberships: {owner: true})
  end

  def members(company)
    @members = company.users.where(memberships: {ex: false})
  end

  def ex(company)
    @ex = company.users.where(memberships: {ex: true})
  end

  def owner?
    !current_user.companies.where(memberships: {owner: true}).nil?
  end

  def member?
    !current_user.companies.nil?
  end

  def ex?
    !current_user.companies.where(memberships: {ex: true}).nil?
  end

end







