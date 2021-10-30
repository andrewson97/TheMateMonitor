//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package inmatemonitor;

// numOfHosts: 10
// parametric: true
// static:     false

import flora.LoRa.LoRaGWNic;
import flora.LoRaApp.SimpleLoRaApp;
import inet.mobility.single.ChiangMobility;
import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.common.InterfaceTable;
import inet.nodes.inet.AdhocHost;
import inet.world.radio.ChannelControl;

network LoraWanNode
{
    parameters:
        int numHosts;
        @display("i=abstract/accesspoint;bgb=699,457");
    submodules:
        loRaGWNic: LoRaGWNic {
            @display("p=351,347");
        }
        simpleLoRaApp: SimpleLoRaApp {
            @display("p=350,115");
        }
        chiangMobility: ChiangMobility {
            @display("p=124,351");
        }
        interfaceTable: InterfaceTable {
            @display("p=71,94");
        }
    connections:
        loRaGWNic.upperLayerOut --> simpleLoRaApp.appIn;
        simpleLoRaApp.appOut --> loRaGWNic.radioIn;
}
