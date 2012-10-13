# All properties are in fact arrays of properties.
def munger(value)
  if value.kind_of?(Array)
    return value
  else
    return [value]
  end
end

Puppet::Type.newtype(:ldapres) do
  @doc = "Insert here: documentation."
	ensurable

	newparam(:dn, :namevar => true) do
    desc "The DN of the ldapres we're working on"
  end

  newproperty(:objectclass)  do
    desc "Object class of DN being manipulated"
    munge do |value|munger(value) end
  end

  newproperty(:cn)  do
    desc "Common name of LDAP resource"
    munge do |value|munger(value) end
  end

  newproperty(:sn)  do
    desc "Surname of inetOrgPerson"
    munge do |value|munger(value) end
  end

  newproperty(:uid) do
    desc "Username of inetOrgPerson"
    munge do |value|munger(value) end
  end

  newproperty(:mail) do
    desc "Email address of inetOrgPerson"
    munge do |value|munger(value) end
  end

  newproperty(:uidPerson) do
    desc "UID number of uidObject"
    munge do |value|munger(value) end
  end

  newproperty(:loginShell) do
    desc "Login shell path of posixAccount"
    munge do |value|munger(value) end
  end

  newproperty(:gidNumber) do
    desc "Primary group ID of posixAccount"
    munge do |value|munger(value) end
  end

  newparam(:binddn) do
    desc "DN to bind to the LDAP server with"
  end

  newparam(:bindpw) do
    desc "Password to bind to the LDAP server with"
  end

  newparam(:ldapserverhost) do
    desc "Hostname of ldap server to connect to"
    defaultto 'localhost'
  end

  newparam(:ldapserverport) do
    desc "Port number of ldap server we're connecting to"
    defaultto '389'
  end
end
