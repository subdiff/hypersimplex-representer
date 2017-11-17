/*********************************************************************
Hypersimplex Representer
Copyright (C) 2017 Roman Gilg

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*********************************************************************/

import QtQuick 2.7
import QtQuick.Controls 1.4

Row {
    id: varSliderRoot

    width: slidersCol.width

    property alias val: slider.value
    property alias oldVal: slider.oldVal
    property int mult: 1

    spacing: 10

    Slider {
        id: slider

        width: parent.width - varText.width - parent.spacing
        minimumValue: 0.
        maximumValue: 1 / mult

        property double oldVal: -1

        value: 0.25    //TODO test

        onValueChanged: {
            if (oldVal == -1) {
                oldVal = value;
                return;
            }
            console.log("onVarValChanged", index + ":", oldVal, "|", value);

            if (value != oldVal) {
                console.log("onVarValChanged -> distrVals!");
                slidersRepeater.distrVals(index);
            }
        }
    }
    TextField {
        id: varText

        text: slider.value

        width: fontMetrics.averageCharacterWidth * 6

        horizontalAlignment: TextInput.AlignHCenter
        readOnly: true
        maximumLength: 5

        FontMetrics {
            id: fontMetrics
        }
    }
}
