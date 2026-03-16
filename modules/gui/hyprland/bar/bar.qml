import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    readonly property bool showAllWorkspaces: false

    property int batteryPercentage: 0

    Process {
        id: batteryProcess
        command: ["cat", "/sys/class/power_supply/macsmc-battery/capacity"]
        stdout: SplitParser {
            onRead: data => {
                if (!data)
                    return;
                var percentage = parseInt(data);
                if (percentage === 100) {
                    percentage -= 1;
                }
                root.batteryPercentage = percentage;
            }
        }
        Component.onCompleted: running = true
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: batteryProcess.running = true
    }

    anchors {
        top: true
        left: true
        bottom: true
    }
    implicitWidth: 30
    color: "#ee161616"

    ColumnLayout {
        anchors.fill: parent

        Image {
            source: "nix-snowflake-colours.svg"
            Layout.fillWidth: true
            Layout.preferredHeight: parent.width - Layout.margins
            Layout.margins: 6
            fillMode: Image.PreserveAspectFit
        }

        Repeater {
            model: 9

            Text {
                required property int index
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                text: index + 1
                color: isActive ? "#ffffff" : (ws ? "#999999" : "#444b6a")
                horizontalAlignment: Text.AlignHCenter
                visible: showAllWorkspaces ? true : (ws ? true : false)
                Layout.fillWidth: true
                font {
                    pixelSize: 14
                    bold: true
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }

        Text {
            id: battery
            property bool showPercentage: false
            text: "󰁾\n" + root.batteryPercentage
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.margins: 6
            color: "#ffffff"
            font.pixelSize: 14
        }

        Text {
            id: clock
            text: Qt.formatTime(new Date(), 'HH\nmm')
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.margins: 6
            color: "#ffffff"
            font {
                pixelSize: 14
            }

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clock.text = Qt.formatTime(new Date(), 'HH\nmm')
            }
        }
    }
}
