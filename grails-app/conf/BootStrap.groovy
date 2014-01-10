import com.osrs.Role
import com.osrs.User
import com.osrs.UserRole

class BootStrap {

    def init = { servletContext ->
        createStatisticalRoles()
        createStatisticalUsers()
        //mapUserRole();
    }
        void createStatisticalRoles() {

        if (!(Role.findByAuthority('ROLE_ADMIN'))) {
            new Role(authority: 'ROLE_ADMIN').save(flush: true)
        }
        if (!(Role.findByAuthority('ROLE_STATE_ADMIN'))) {
            new Role(authority: 'ROLE_STATE_ADMIN').save(flush: true)
        }

        if (!(Role.findByAuthority('ROLE_DATA_ENTRY_OPERATOR '))) {
            new Role(authority: 'ROLE_DATA_ENTRY_OPERATOR').save(flush: true)
        }

        if (!(Role.findByAuthority('ROLE_USER'))) {
            new Role(authority: 'ROLE_USER').save(flush: true)
        }

    }

    void createStatisticalUsers() {
        Role role_admin = Role.findByAuthority('ROLE_ADMIN')
        Role role_state_admin= Role.findByAuthority('ROLE_STATE_ADMIN')
        Role role_dataEntryOperator = Role.findByAuthority('ROLE_DATA_ENTRY_OPERATOR')
        Role role_user = Role.findByAuthority('ROLE_USER')
        //Super_Admin
        if (!(User.findByUsername('user_admin'))) {
            User userAdmin;
            userAdmin = new User(username: 'user_admin', password: 'damyant@123!#', email: 'admin@damyant.com', enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false)
            if (userAdmin.save()) {
                UserRole.create userAdmin, role_admin
                println "saved"
            }
            else {
                println "errors are"
                userAdmin.errors.allErrors.each {
                    println "Error --->> ${it}"
                }
            }

        }

        if (!(User.findByUsername('user_hq'))) {
            User userHq;
            userHq = new User(username: 'user_hq', password: 'damyant@123!#', email: 'admin@damyant.com', enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false)
            if (userHq.save()) {
                UserRole.create userHq, role_state_admin
                println "saved"
            }
            else {
                println "errors are"
                userHq.errors.allErrors.each {
                    println "Error --->> ${it}"
                }
            }

        }
        if (!(User.findByUsername('user_deo'))) {
            User user_deo;
            user_deo = new User(username: 'user_deo', password: 'damyant@123', email: 'admin@damyant.com',  enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false)
            if (user_deo.save()) {
                UserRole.create user_deo, role_dataEntryOperator
                println "saved"
            }
            else {
                println "errors are"
                user_deo.errors.allErrors.each {
                    println "Error --->> ${it}"
                }
            }

        }
        if (!(User.findByUsername('user'))) {
            User normalUser;

            normalUser = new User(username: 'user', password: 'damyant@123', email: 'admin@damyant.com', enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false)

            if (normalUser.save()) {
                UserRole.create normalUser, role_user
                println "saved"
            }
            else {
                println "errors are"
                normalUser.errors.allErrors.each {
                    println "Error --->> ${it}"
                }
            }

        }
    }



    def destroy = {
    }
}
