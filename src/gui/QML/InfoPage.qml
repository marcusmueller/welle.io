import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

// Import custom styles
import "style"

Item {
    id: infoPage

    Flickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: fileContent.implicitHeight

        TextStandart {
            id: fileContent
            text: cppGUI.licenses.FileContent
            Layout.alignment: Qt.AlignLeft
            wrapMode: Text.Wrap
            width: parent.width
            textFormat: Text.PlainText
        }

        ScrollBar.vertical: ScrollBar { }
    }
}
