package ro.isi.auth
/**
 * User: Alexandru Burghelea
 * Date: 1/6/13
 * Time: 12:24 PM
 */
class HomeController {
    def index = {
        render(view:"index")
    }

    def about = {

        render view: "/siteinfo/about"
    }

    def contact = {

        render view: "/siteinfo/contact"
    }
}
