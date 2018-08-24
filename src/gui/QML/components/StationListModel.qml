import QtQuick 2.0

ListModel {
    property string serialized: ""

    function addStation(station, sId, channel) {
        // Check if station already exits
        for(var i=0; i<count; i++)
            if(get(i).stationName === station)
                return // Break if station exists

        append({"stationName": station, "stationSId": sId, "channelName": channel})
        sort()
        serialize()
    }

    function clearStations() {
        clear()
        serialize()
    }

    function sort() {
        // Simple basic bubble sort implementation
        for(var n=count; n>1; --n) {
            for(var i=0; i<n-1; ++i) {
                // Sort in alphabetical order
                if(get(i).stationName.localeCompare(get(i+1).stationName) === 1)
                    move(i,i+1,1)
            }
        }
    }

    // Necessary workaround because the settings component doesn't saves models
    function serialize() {
        var tmp = []
        for (var i = 0; i < count; ++i)
            tmp.push(get(i))
        serialized = JSON.stringify(tmp)
    }

    function deSerialize() {
        clear()
        if(serialized != "") {
            var tmp = JSON.parse(serialized)
            for (var i = 0; i < tmp.length; ++i)
                append(tmp[i])
        }
    }

    Component.onCompleted: {
        deSerialize()
    }
}
