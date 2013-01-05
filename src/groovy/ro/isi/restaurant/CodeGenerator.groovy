package ro.isi.restaurant

/**
 * User: Alexandru Burghelea
 * Date: 12/24/12
 * Time: 6:24 PM
 */
class CodeGenerator {

    private def map = [:];

    def getNextCode(String prefix){
        prefix = prefix.size()> 4 ? prefix.substring(0,3) : prefix
        Integer suffix = getPreviousSuffix(prefix);
        suffix += 1;
        setPreviousSuffix(prefix,suffix);
        return prefix+"_"+suffix;
    }

    def setPreviousSuffix(String prefix, int suffix) {
        map."${prefix}" = suffix
    }

    Integer getPreviousSuffix(String prefix) {
        return map."${prefix}" ?: 0
    }
}
