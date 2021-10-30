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

package inmatemonitor.LoraWan.Gateway;

// numOfHosts: 10
// parametric: true
// static:     false

import flora.LoRa.LoRaGWNic;
import flora.LoRa.PacketForwarder;
import inet.linklayer.ethernet.modular.EthernetCutthroughInterface;
import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.configurator.ipv4.Ipv4FlatNetworkConfigurator;
import inet.networklayer.contract.IRoutingTable;
import inet.networklayer.ipv4.Ipv4NetworkLayer;
import inet.nodes.inet.AdhocHost;
import inet.transportlayer.udp.Udp;
import inet.world.radio.ChannelControl;

network Gareway
{
    parameters:
        int numHosts;
        @display("bgb=560,351;i=device/antennatower");
    submodules:
        loRaGWNic: LoRaGWNic {
            @display("p=405,243");
        }
        packetForwarder: PacketForwarder {
            @display("p=409,101");
        }
        ipv4NetworkLayer: Ipv4NetworkLayer {
            @display("p=197,197");
        }
        udp: Udp {
            @display("p=197,92");
        }
        ethernetCutthroughInterface: EthernetCutthroughInterface {
            @display("p=99,278");
        }
        iRoutingTable: <paramName> like IRoutingTable {
            @display("p=57,88");
        }
    connections:
        ethernetCutthroughInterface.cutthroughOut --> ipv4NetworkLayer.ifIn;
        ipv4NetworkLayer.ifOut --> ethernetCutthroughInterface.cutthroughIn;
        ipv4NetworkLayer.transportOut --> udp.ipIn;
        udp.ipOut --> ipv4NetworkLayer.transportIn;
        udp.appOut --> packetForwarder.lowerLayerIn;
        packetForwarder.lowerLayerOut --> udp.appIn;
        loRaGWNic.upperLayerOut --> packetForwarder.socketIn;
        packetForwarder.socketOut --> loRaGWNic.radioIn;
}
