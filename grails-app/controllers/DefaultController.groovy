/**
 * User: Alexandru Burghelea
 * Date: 1/5/13
 * Time: 9:21 PM
 */
class DefaultController {

//    "/about"(view: "/siteinfo/about")
//    "/blog"(view: "/siteinfo/blog")
//    "/contact"(view: "/siteinfo/contact")

    def about() {
        render view: "/siteinfo/about"
    }

    def contact() {
        render view: "/siteinfo/contact"
    }
}
