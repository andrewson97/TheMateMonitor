package inmatemonitr.LoraWan;


import inet.applications.contract.IApp;

simple PacketForwarder like IApp
{
    @signal[LoRa_GWPacketReceived](type=long); 
    @statistic[LoRa_GWPacketReceived](source=LoRa_GWPacketReceived; record=count);
    int localPort = default(-1);  // local port (-1: use ephemeral port)
    string destAddresses = default(""); // list of IP addresses, separated by spaces ("": don't send)
    string localAddress = default("");
    int destPort;

    gates:
        output socketOut @labels(UdpControlInfo/up);
        input socketIn @labels(UdpControlInfo/down);

        input lowerLayerIn @labels(PacketForwarder/up);
        output lowerLayerOut @labels(PacketForwarder/down);  

}
