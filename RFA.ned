import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.contract.INetworkNode;
import inet.physicallayer.wireless.common.contract.packetlevel.IRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;

network Network
{
    parameters:
        int numHosts;
        @display("bgb=1000,1000;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=380,20; anchor=w; font=,18; textFormat="packets received: %g"; initialValue=0);
        @statistic[packetReceived](source=host[24].app[0].packetReceived; record=figure(count); targetFigure=rcvdPkText);



    submodules:
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "";
        configurator: Ipv4NetworkConfigurator;
        radioMedium: <default("UnitDiskRadioMedium")> like IRadioMedium;
        host[numHosts]: <default("WirelessHost")> like INetworkNode;
}