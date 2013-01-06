class UrlMappings {

    static mappings = {


        "/blog"(view: "/siteinfo/blog")
        "/systeminfo"(view: "/siteinfo/systeminfo")
        "/terms"(view: "/siteinfo/terms")
        "/imprint"(view: "/siteinfo/imprint")

        /*
         * Pages with controller
         * WARN: No domain/controller should be named "api" or "mobile" or "web"!
         */
        "/" {
            controller = 'home'
            action = { 'index' }
            view = { 'index' }
        }
        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")

        "/about"(controller: 'home', action: 'about')
        "/contact"(controller: 'home', action: 'contact')
        "/$controller/$action?/$id?" {
            constraints {
                controller(matches: /^((?!(api|mobile|web)).*)$/)
            }
        }

        /*
         * System Pages without controller
         */
        "403"(view: '/_errors/403')
        "404"(view: '/_errors/404')
        "500"(view: '/_errors/error')
        "503"(view: '/_errors/503')
    }
}
