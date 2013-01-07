import grails.util.Environment
import grails.util.GrailsUtil
import org.codehaus.groovy.grails.commons.GrailsApplication

modules = {
    application {
        resource url: 'js/application.js'
        resource url: 'js/jquery.validate.min.js'
        resource url: 'css/custom.css'
    }

    kendoBootStrap {
        resource url: 'css/kendo.bootstrap.css'
        resource url: 'less/bootstrap/kendo.bootstrap.less'
    }

    bootstrap {
        if (Environment.getCurrent().equals(Environment.PRODUCTION)) {
            resource url: '/bootstrap/css/bootstrap.css'
            resource url: '/bootstrap/css/bootstrap-responsive.css'
            resource url: '/datepicker/css/datepicker.css'
            resource url: '/kickstart/css/docs.css'
            resource url: '/kickstart/css/kickstart.css'
            resource url: '/kickstart/img/grails.png'
            resource url: '/images/flags/en.png'
            resource url: '/images/flags/cz.png'
            resource url: '/images/flags/da.png'
            resource url: '/images/flags/de.png'
            resource url: '/images/flags/es.png'
            resource url: '/images/flags/fr.png'
            resource url: '/images/flags/it.png'
            resource url: '/images/flags/ja.png'
            resource url: '/images/flags/nl.png'
            resource url: '/images/flags/br.png'
            resource url: '/images/flags/pt.png'
            resource url: '/images/flags/ru.png'
            resource url: '/images/flags/sv.png'
            resource url: '/images/flags/th.png'
            resource url: '/images/flags/cn.png'
            resource url: '/bootstrap/js/bootstrap.js'
            resource url: '/datepicker/js/bootstrap-datepicker.js'
            resource url: '/kickstart/js/checkboxes.js'
            resource url: '/kickstart/js/kickstart.js'
            resource url: '/images/frontpage/bs-docs-twitter-github.png'
            resource url: '/images/frontpage/html5css3js8.png'
            resource url: '/images/frontpage/browser_logos.png'
            resource url: '/images/frontpage/Datepicker.png'
            resource url: '/images/frontpage/flags_preview_large.png'
            resource url: '/images/frontpage/components.jpg'
        }
    }


    'kendo-theme' {
        resource id: 'kendo-common-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.common.min.css'],
                attrs: [media: 'screen, projection']
        resource id: 'kendo-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.default.min.css'],
                attrs: [media: 'screen, projection']
    }

    'kendo-bootstrap' {
        resource id: 'kendo-common-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.common.min.css'],
                attrs: [media: 'screen, projection']

        resource id: 'kendo-theme',
                url: 'css/kendo.bootstrap.css',
                attrs: [media: 'screen, projection']
    }

    'kendo-ui' {
        dependsOn 'jquery'
        resource id: 'kendo-ui',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/js', file: "kendo.all.min.js"],
                nominify: true, disposition: 'head'
    }
}