package ui

/**
 * User: Alexandru Burghelea
 * Date: 1/6/13
 * Time: 4:25 PM
 */
class DatePickerTagLib {

    static namespace = 'g'

    def customDatePicker = { attrs, body ->
        def unstyled = g.datePicker(attrs, body)
        def sizes = [day: 1, month: 2, year: 1]
        def styled = unstyled.replaceAll('name="\\S+_(day|month|year)"') { match, timeUnit ->
            println match
            "${match} class=\"span${sizes[timeUnit]}\""
        }

        out << styled
    }
}
