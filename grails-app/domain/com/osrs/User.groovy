package com.osrs

class User {

	transient springSecurityService
    transient mailService

    String email
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    UserProfile userProfile
    GramPanchayat  panchayat
    Block block
    District district
    State state

	static constraints = {
		username blank: false, unique: true
		password blank: false
        userProfile nullable: true
        panchayat nullable: true
        block nullable: true
        district nullable: true
        state nullable: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
