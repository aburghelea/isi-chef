modules = {

    'kendo-theme' {
        resource id: 'kendo-common-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.common.min.css'],
                attrs: [media: 'screen, projection']
        resource id: 'kendo-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.default.min.css'],
                attrs: [media: 'screen, projection']
    }

    'kendo-black' {
        resource id: 'kendo-common-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.common.min.css'],
                attrs: [media: 'screen, projection']
        resource id: 'kendo-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.black.min.css'],
                attrs: [media: 'screen, projection']
    }


    'kendo-blueopal' {
        resource id: 'kendo-common-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.common.min.css'],
                attrs: [media: 'screen, projection']
        resource id: 'kendo-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.blueopal.min.css'],
                attrs: [media: 'screen, projection']
    }

    'kendo-hakama' {
        resource id: 'kendo-common-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.common.min.css'],
                attrs: [media: 'screen, projection']

        resource id: 'kendo-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.hakama.min.css'],
                attrs: [media: 'screen, projection']
    }
    'kendo-kendo' {
        resource id: 'kendo-common-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.common.min.css'],
                attrs: [media: 'screen, projection']
        resource id: 'kendo-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.kendo.min.css'],
                attrs: [media: 'screen, projection']
    }
    'kendo-metro' {
        resource id: 'kendo-common-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.common.min.css'],
                attrs: [media: 'screen, projection']

        resource id: 'kendo-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.metro.min.css'],
                attrs: [media: 'screen, projection']
    }
    'kendo-silver' {
        resource id: 'kendo-common-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.common.min.css'],
                attrs: [media: 'screen, projection']
        resource id: 'kendo-theme',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/styles', file: 'kendo.silver.min.css'],
                attrs: [media: 'screen, projection']
    }

    'kendo-ui' {
        dependsOn 'jquery'
        resource id: 'kendo-ui',
                url: [plugin: 'kendoUi', dir: 'kendo-ui/js', file: "kendo.all.min.js"],
                nominify: true, disposition: 'head'
    }

}