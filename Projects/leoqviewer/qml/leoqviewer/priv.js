.pragma library

var _privs = {}

// only works well with qml objects
function priv(key) {
    var s = ""
    var h = key.toString()
    //console.log("hash",h)
    var o = _privs[key]
    if (!o) {
        o = {}
        _privs[key] = o
    }
    return o
}
