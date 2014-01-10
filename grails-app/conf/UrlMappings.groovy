class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(action: "auth", controller: "login")
		//"500"(view:'/error')
		"500"(action: "index", controller: "error")
        "/syncWithMoblieApp"(action: "mobileAppSync", controller: "sync")
        "/mobile"(action: "iLogin", controller: "login")
	}
}
