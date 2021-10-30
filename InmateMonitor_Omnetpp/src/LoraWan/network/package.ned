package flora.simulations;

import inet.applications.udpapp.UdpBasicApp;
import inet.node.inet.Router;
import inet.node.internetcloud.InternetCloud;
import flora.LoRaPhy.LoRaMedium;
import flora.LoraNode.LoRaNode;
import flora.LoraNode.LoRaGW;
import inet.node.inet.StandardHost;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth1G;

@license(LGPL);
network LoRaNetworkTest
{
    parameters:
        int numberOfNodes = default(1);
        int numberOfGateways = default(1);
        int networkSizeX = default(500);
        int networkSizeY = default(500);
        @display("bgb=710,356");
    submodules:
        loRaNodes[numberOfNodes]: LoRaNode {
            @display("p=130,246");
        }
        loRaGW[numberOfGateways]: LoRaGW {
            @display("p=142,171;is=s");
        }
        LoRaMedium: LoRaMedium {
            @display("p=230,114");
        }
        networkServer: StandardHost {
            parameters:
                @display("p=567,62");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                assignDisjunctSubnetAddresses = false;
                @display("p=325,150");
        }
        internetCloud: InternetCloud {
            @display("p=302,52");
        }
        gwRouter[numberOfGateways]: Router {
            @display("p=118,52");
        }
        nsRouter: Router {
            @display("p=394,58");
        }
    connections:
        networkServer.ethg++ <--> Eth1G <--> nsRouter.ethg++;
        nsRouter.pppg++ <--> Eth1G <--> internetCloud.pppg++;
        for i=0..numberOfGateways-1 {
            internetCloud.pppg++ <--> Eth1G <--> gwRouter[i].pppg++;
            gwRouter[i].ethg++ <--> Eth1G <--> loRaGW[i].ethg++;
        }
}

