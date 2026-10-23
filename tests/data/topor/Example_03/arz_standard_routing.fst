<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : arz_standard_routing.fst       -->
<!--   Format  : TopoR PCB file                 -->
<!--   Version : 1.2.0                          -->
<!--   Program : TopoR 32 Layer 7.0.18313 Alpha -->
<!--   Date    : Monday, April 09, 2018         -->
<!--   Time    : 18:14                          -->
<!--********************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.2.0</Version>
		<Program>TopoR 32 Layer 7.0.18313 Alpha</Program>
		<Date>Monday, April 09, 2018 18:14</Date>
		<OriginalFormat>Expedition</OriginalFormat>
		<OriginalFile></OriginalFile>
		<Units dist="mm" time="ps"/>
	</Header>

	<Layers version="1.1">
		<StackUpLayers>
			<Layer name="ASSEMBLY_TOP_ASSY" type="Assy" compsOutline="on"/>
			<Layer name="ASSEMBLY_TOP" type="Mechanical" thickness="0"/>
			<Layer name="SOLDERPASTE_TOP" type="Paste" thickness="0"/>
			<Layer name="SILKSCREEN_TOP" type="Silk" thickness="0"/>
			<Layer name="SOLDERMASK_TOP" type="Mask" thickness="0.508"/>
			<Layer name="1" type="Signal" thickness="0.018"/>
			<Layer name="Core/Pre-preg" type="Dielectric" thickness="0.508"/>
			<Layer name="2" type="Signal" thickness="0.0356"/>
			<Layer name="Core/Pre-preg" type="Dielectric" thickness="0.1524"/>
			<Layer name="3" type="Signal" thickness="0.0356"/>
			<Layer name="Core/Pre-preg" type="Dielectric" thickness="0.1524"/>
			<Layer name="4" type="Signal" thickness="0.018"/>
			<Layer name="SOLDERMASK_BOTTOM" type="Mask" thickness="0.508"/>
			<Layer name="SILKSCREEN_BOTTOM" type="Silk" thickness="0"/>
			<Layer name="SOLDERPASTE_BOTTOM" type="Paste" thickness="0"/>
			<Layer name="ASSEMBLY_BOTTOM" type="Mechanical" thickness="0"/>
			<Layer name="ASSEMBLY_BOTTOM_ASSY" type="Assy" compsOutline="on"/>
		</StackUpLayers>
		<UnStackLayers>
			<Layer name="DRILLDRAWING_THRU" type="Doc"/>
		</UnStackLayers>
	</Layers>

	<TextStyles version="1.0">
		<TextStyle name="Default" fontName="default" height="1"/>
	</TextStyles>

	<LocalLibrary version="1.4">
		<Padstacks>
			<Padstack name="via15_PS0" holeDiameter="0.8" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.3">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerRef name="4"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="X1.3Y1.3R0.6_PS0" holeDiameter="0.8" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.3">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerRef name="4"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="CCTVIA_[Default]_PS0" holeDiameter="0.6" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.016">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="1.016">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.016">
						<LayerRef name="4"/>
					</PadCircle>
					<PadCircle diameter="1.016">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="RX4.3Y7.4T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="4.3" height="7.4">
						<LayerRef name="1"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="RX3.5Y7.4T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="3.5" height="7.4">
						<LayerRef name="1"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="EX1.8Y1.8R1.1_PS0" holeDiameter="1.1" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.8">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="1.8">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.8">
						<LayerRef name="4"/>
					</PadCircle>
					<PadCircle diameter="1.8">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="EX1.5Y1.8R1.1_PS0" holeDiameter="0.9" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadOval diameter="1.5">
						<LayerRef name="1"/>
						<Stretch x="0" y="0.3"/>
					</PadOval>
					<PadOval diameter="1.5">
						<LayerTypeRef type="Signal"/>
						<Stretch x="0" y="0.3"/>
					</PadOval>
					<PadOval diameter="1.5">
						<LayerRef name="4"/>
						<Stretch x="0" y="0.3"/>
					</PadOval>
					<PadOval diameter="1.5">
						<LayerTypeRef type="Plane"/>
						<Stretch x="0" y="0.3"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="krest" holeDiameter="0.5" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="0.8">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="0.8">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="0.8">
						<LayerRef name="4"/>
					</PadCircle>
					<PadCircle diameter="0.8">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="OX2.1Y0.8T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadOval diameter="0.8">
						<LayerRef name="1"/>
						<Stretch x="1.3" y="0"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="RX1.275Y1.85T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.275" height="1.85">
						<LayerRef name="1"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="OX2.5Y0.6T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadOval diameter="0.6">
						<LayerRef name="1"/>
						<Stretch x="1.9" y="0"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="OX0.8Y2.5T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadOval diameter="0.8">
						<LayerRef name="1"/>
						<Stretch x="0" y="1.7"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="EX1.7Y1.7R1.0" holeDiameter="1" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.7">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="1.7">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.7">
						<LayerRef name="4"/>
					</PadCircle>
					<PadCircle diameter="1.7">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="RX1.95Y3.5T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.95" height="3.5">
						<LayerRef name="1"/>
					</PadRect>
				</Pads>
			</Padstack>
		</Padstacks>
		<Viastacks>
			<Viastack name="via15" holeDiameter="0.8">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.3">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerRef name="4"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="X1.3Y1.3R0.6" holeDiameter="0.8">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.3">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerRef name="4"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="CCTVIA_[Default]" holeDiameter="0.6">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.016">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="1.016">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.016">
						<LayerRef name="4"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="EX1.8Y1.8R1.1" holeDiameter="1.1">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.8">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="1.8">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.8">
						<LayerRef name="4"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="EX1.5Y1.8R1.1" holeDiameter="0.9">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.5">
						<LayerRef name="1"/>
					</PadCircle>
					<PadCircle diameter="1.5">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.5">
						<LayerRef name="4"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
		</Viastacks>
		<Footprints>
			<Footprint name="16-4.7_auto">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="RX3.5Y7.4T"/>
						<Org x="5.4" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="RX4.3Y7.4T"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-0.725" y="3.425"/>
							<Dot x="8.56" y="-3.425"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="H1806XM1241_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-1"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-2"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-3"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-4"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="7" name="7" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="4.75" y="-8.25"/>
					</Pad>
					<Pad padNum="8" name="8" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="5.75" y="-8.25"/>
					</Pad>
					<Pad padNum="9" name="9" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="6.75" y="-8.25"/>
					</Pad>
					<Pad padNum="10" name="10" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="7.75" y="-8.25"/>
					</Pad>
					<Pad padNum="11" name="11" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="8.75" y="-8.25"/>
					</Pad>
					<Pad padNum="12" name="12" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="9.75" y="-8.25"/>
					</Pad>
					<Pad padNum="13" name="13" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="10.75" y="-8.25"/>
					</Pad>
					<Pad padNum="14" name="14" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="11.75" y="-8.25"/>
					</Pad>
					<Pad padNum="15" name="15" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="12.75" y="-8.25"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-5"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-4"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-3"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-2"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-1"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="1"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="2"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="3"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="4"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="5"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="6"/>
					</Pad>
					<Pad padNum="28" name="28" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="12.75" y="9.25"/>
					</Pad>
					<Pad padNum="29" name="29" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="11.75" y="9.25"/>
					</Pad>
					<Pad padNum="30" name="30" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="10.75" y="9.25"/>
					</Pad>
					<Pad padNum="31" name="31" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="9.75" y="9.25"/>
					</Pad>
					<Pad padNum="32" name="32" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="8.75" y="9.25"/>
					</Pad>
					<Pad padNum="33" name="33" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="7.75" y="9.25"/>
					</Pad>
					<Pad padNum="34" name="34" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="6.75" y="9.25"/>
					</Pad>
					<Pad padNum="35" name="35" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="5.75" y="9.25"/>
					</Pad>
					<Pad padNum="36" name="36" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="4.75" y="9.25"/>
					</Pad>
					<Pad padNum="37" name="37">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="6"/>
					</Pad>
					<Pad padNum="38" name="38">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="5"/>
					</Pad>
					<Pad padNum="39" name="39">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="4"/>
					</Pad>
					<Pad padNum="40" name="40">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="3"/>
					</Pad>
					<Pad padNum="41" name="41">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="2"/>
					</Pad>
					<Pad padNum="42" name="42">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="1"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-1.1" y="10.35"/>
							<Dot x="18.6" y="-9.35"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="1533TM2_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-7.5"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-6.25"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-3.75"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-2.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-1.25"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-0.9" y="1.25"/>
							<Dot x="12.1" y="-8.75"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="556PT5_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-8.75"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-10"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-11.25"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-12.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-13.75"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-13.75"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-12.5"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-11.25"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-10"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-8.75"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-7.5"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-6.25"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-5"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-3.75"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-2.5"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-1.25"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-0.9" y="0.925"/>
							<Dot x="19.65" y="-14.675"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="B19K2_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-8.75"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-10"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-0.625" y="1"/>
							<Dot x="11.85" y="-11"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="H1806XM1-242_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-1"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-2"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-3"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-4"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="7" name="7" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="4.75" y="-8.25"/>
					</Pad>
					<Pad padNum="8" name="8" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="5.75" y="-8.25"/>
					</Pad>
					<Pad padNum="9" name="9" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="6.75" y="-8.25"/>
					</Pad>
					<Pad padNum="10" name="10" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="7.75" y="-8.25"/>
					</Pad>
					<Pad padNum="11" name="11" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="8.75" y="-8.25"/>
					</Pad>
					<Pad padNum="12" name="12" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="9.75" y="-8.25"/>
					</Pad>
					<Pad padNum="13" name="13" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="10.75" y="-8.25"/>
					</Pad>
					<Pad padNum="14" name="14" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="11.75" y="-8.25"/>
					</Pad>
					<Pad padNum="15" name="15" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="12.75" y="-8.25"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-5"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-4"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-3"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-2"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-1"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="1"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="2"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="3"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="4"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="5"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="6"/>
					</Pad>
					<Pad padNum="28" name="28" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="12.75" y="9.25"/>
					</Pad>
					<Pad padNum="29" name="29" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="11.75" y="9.25"/>
					</Pad>
					<Pad padNum="30" name="30" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="10.75" y="9.25"/>
					</Pad>
					<Pad padNum="31" name="31" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="9.75" y="9.25"/>
					</Pad>
					<Pad padNum="32" name="32" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="8.75" y="9.25"/>
					</Pad>
					<Pad padNum="33" name="33" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="7.75" y="9.25"/>
					</Pad>
					<Pad padNum="34" name="34" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="6.75" y="9.25"/>
					</Pad>
					<Pad padNum="35" name="35" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="5.75" y="9.25"/>
					</Pad>
					<Pad padNum="36" name="36" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="4.75" y="9.25"/>
					</Pad>
					<Pad padNum="37" name="37">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="6"/>
					</Pad>
					<Pad padNum="38" name="38">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="5"/>
					</Pad>
					<Pad padNum="39" name="39">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="4"/>
					</Pad>
					<Pad padNum="40" name="40">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="3"/>
					</Pad>
					<Pad padNum="41" name="41">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="2"/>
					</Pad>
					<Pad padNum="42" name="42">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="1"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-1.1" y="10.35"/>
							<Dot x="18.6" y="-9.35"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="533LL1_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-7.5"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-6.25"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-3.75"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-2.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-1.25"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-0.9" y="1.25"/>
							<Dot x="12.1" y="-8.75"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="1533LN2_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-7.5"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-6.25"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-3.75"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-2.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-1.25"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-0.9" y="1.25"/>
							<Dot x="12.1" y="-8.75"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="1533AP6_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-8.75"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-10"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-11.25"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-11.25"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-10"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-8.75"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-7.5"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-6.25"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-5"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-3.75"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-2.5"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-1.25"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-0.9" y="0.875"/>
							<Dot x="19.65" y="-12.125"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="1533LA2_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-7.5"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-6.25"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-3.75"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-2.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-1.25"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-0.9" y="1.25"/>
							<Dot x="12.1" y="-8.75"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="PLD-10_2_2">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="OX0.8Y2.5T"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="0.1M_auto">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="RX1.95Y3.5T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="RX1.95Y3.5T"/>
						<Org x="4.25" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="0.25" y="1.475"/>
							<Dot x="4" y="-1.475"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="P1_12_0.25_auto">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="RX1.275Y1.85T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="RX1.275Y1.85T"/>
						<Org x="3.075" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="0.0625" y="0.75"/>
							<Dot x="3.0125" y="-0.75"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="PL25_Primary">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0.625"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="KREST1_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="krest"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="ASSEMBLY_TOP_ASSY"/>
						<Rect>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="1.25" y="-1.25"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="PLD-10_1_2">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="PLD-10_2">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_3">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_4">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_5">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_6">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_7">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_8">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_9">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_10">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_11">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_12">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_13">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_14">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_15">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_16">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_17">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_18">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_19">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_20">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_21">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_22">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_23">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_24">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_25">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_26">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_27">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_28">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_29">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_30">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_31">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_32">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_33">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_34">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_35">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_36">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_37">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_38">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_39">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_40">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_41">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_42">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_43">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_44">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_45">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_46">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_47">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_48">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_49">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_50">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_51">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_52">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_53">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_54">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_55">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.8Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_56">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="FreePadCell_57">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EX1.5Y1.8R1.1_PS0"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
		</Footprints>
		<Components>
			<Component name="C1_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C2_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C3_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C4_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C5_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C6_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C7_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C8_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C9_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C10_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C12_1">
				<Pins>
					<Pin pinNum="1" name="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="DR1_1">
				<Pins>
					<Pin pinNum="1" name="9" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="8" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="7" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="6" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="4" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="3" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="2" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="1" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="5" pinEqual="1" gate="9" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="DR2_1">
				<Pins>
					<Pin pinNum="1" name="9" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="8" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="7" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="6" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="4" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="3" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="2" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="1" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="5" pinEqual="1" gate="9" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="DR3_1">
				<Pins>
					<Pin pinNum="1" name="9" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="8" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="7" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="6" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="4" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="3" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="2" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="1" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="5" pinEqual="1" gate="9" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D1_1">
				<Pins>
					<Pin pinNum="1" name="8" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="9" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="10" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="11" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="12" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="7" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="2" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="4" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="5" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="6" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="1" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="13" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="14" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="15" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="16" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="17" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="18" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="19" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="20" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="21" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="22" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="23" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="24" pinEqual="1" gate="24" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D2_1">
				<Pins>
					<Pin pinNum="1" name="8" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="9" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="10" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="11" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="12" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="7" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="2" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="4" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="5" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="6" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="1" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="13" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="14" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="15" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="16" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="17" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="18" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="19" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="20" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="21" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="22" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="23" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="24" pinEqual="1" gate="24" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D3_1">
				<Pins>
					<Pin pinNum="1" name="8" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="9" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="10" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="11" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="12" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="7" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="2" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="4" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="5" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="6" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="1" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="13" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="14" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="15" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="16" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="17" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="18" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="19" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="20" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="21" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="22" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="23" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="24" pinEqual="1" gate="24" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D4_1">
				<Pins>
					<Pin pinNum="1" name="7" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="6" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="5" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="2" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="1" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="3" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="11" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="14" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="12" pinEqual="1" gate="14" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D5_1">
				<Pins>
					<Pin pinNum="1" name="7" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="6" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="5" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="2" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="1" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="3" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="11" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="14" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="12" pinEqual="1" gate="14" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D6_1">
				<Pins>
					<Pin pinNum="1" name="7" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="6" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="5" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="2" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="1" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="3" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="11" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="14" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="12" pinEqual="1" gate="14" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D7_1">
				<Pins>
					<Pin pinNum="1" name="7" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="6" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="5" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="2" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="1" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="3" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="11" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="14" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="12" pinEqual="1" gate="14" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D8_1">
				<Pins>
					<Pin pinNum="1" name="7" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="6" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="5" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="2" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="1" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="3" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="11" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="14" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="12" pinEqual="1" gate="14" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D9_1">
				<Pins>
					<Pin pinNum="1" name="7" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="6" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="5" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="2" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="1" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="3" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="11" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="14" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="12" pinEqual="1" gate="14" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D10_1">
				<Pins>
					<Pin pinNum="1" name="7" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="6" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="5" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="2" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="1" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="3" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="11" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="14" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="12" pinEqual="1" gate="14" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D11_1">
				<Pins>
					<Pin pinNum="1" name="36" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="35" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="34" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="28" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="30" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="31" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="32" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="29" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="17" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="18" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="19" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="20" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="23" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="22" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="24" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="25" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="26" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="27" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="7" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="8" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="9" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="15" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="13" pinEqual="1" gate="24" gateEqual="0"/>
					<Pin pinNum="25" name="14" pinEqual="1" gate="25" gateEqual="0"/>
					<Pin pinNum="26" name="12" pinEqual="1" gate="26" gateEqual="0"/>
					<Pin pinNum="27" name="11" pinEqual="1" gate="27" gateEqual="0"/>
					<Pin pinNum="28" name="21" pinEqual="1" gate="28" gateEqual="0"/>
					<Pin pinNum="29" name="6" pinEqual="1" gate="29" gateEqual="0"/>
					<Pin pinNum="30" name="5" pinEqual="1" gate="30" gateEqual="0"/>
					<Pin pinNum="31" name="4" pinEqual="1" gate="31" gateEqual="0"/>
					<Pin pinNum="32" name="3" pinEqual="1" gate="32" gateEqual="0"/>
					<Pin pinNum="33" name="2" pinEqual="1" gate="33" gateEqual="0"/>
					<Pin pinNum="34" name="42" pinEqual="1" gate="34" gateEqual="0"/>
					<Pin pinNum="35" name="41" pinEqual="1" gate="35" gateEqual="0"/>
					<Pin pinNum="36" name="40" pinEqual="1" gate="36" gateEqual="0"/>
					<Pin pinNum="37" name="39" pinEqual="1" gate="37" gateEqual="0"/>
					<Pin pinNum="38" name="38" pinEqual="1" gate="38" gateEqual="0"/>
					<Pin pinNum="39" name="37" pinEqual="1" gate="39" gateEqual="0"/>
					<Pin pinNum="40" name="33" pinEqual="1" gate="40" gateEqual="0"/>
					<Pin pinNum="41" name="10" pinEqual="1" gate="41" gateEqual="0"/>
					<Pin pinNum="42" name="1" pinEqual="1" gate="42" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D12_1">
				<Pins>
					<Pin pinNum="1" name="36" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="35" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="34" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="28" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="30" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="31" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="32" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="29" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="17" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="18" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="19" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="20" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="23" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="22" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="24" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="25" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="26" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="27" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="7" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="8" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="9" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="15" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="13" pinEqual="1" gate="24" gateEqual="0"/>
					<Pin pinNum="25" name="14" pinEqual="1" gate="25" gateEqual="0"/>
					<Pin pinNum="26" name="12" pinEqual="1" gate="26" gateEqual="0"/>
					<Pin pinNum="27" name="11" pinEqual="1" gate="27" gateEqual="0"/>
					<Pin pinNum="28" name="21" pinEqual="1" gate="28" gateEqual="0"/>
					<Pin pinNum="29" name="6" pinEqual="1" gate="29" gateEqual="0"/>
					<Pin pinNum="30" name="5" pinEqual="1" gate="30" gateEqual="0"/>
					<Pin pinNum="31" name="4" pinEqual="1" gate="31" gateEqual="0"/>
					<Pin pinNum="32" name="3" pinEqual="1" gate="32" gateEqual="0"/>
					<Pin pinNum="33" name="2" pinEqual="1" gate="33" gateEqual="0"/>
					<Pin pinNum="34" name="42" pinEqual="1" gate="34" gateEqual="0"/>
					<Pin pinNum="35" name="41" pinEqual="1" gate="35" gateEqual="0"/>
					<Pin pinNum="36" name="40" pinEqual="1" gate="36" gateEqual="0"/>
					<Pin pinNum="37" name="39" pinEqual="1" gate="37" gateEqual="0"/>
					<Pin pinNum="38" name="38" pinEqual="1" gate="38" gateEqual="0"/>
					<Pin pinNum="39" name="37" pinEqual="1" gate="39" gateEqual="0"/>
					<Pin pinNum="40" name="33" pinEqual="1" gate="40" gateEqual="0"/>
					<Pin pinNum="41" name="10" pinEqual="1" gate="41" gateEqual="0"/>
					<Pin pinNum="42" name="1" pinEqual="1" gate="42" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D13_1">
				<Pins>
					<Pin pinNum="1" name="36" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="35" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="34" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="28" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="30" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="31" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="32" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="29" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="17" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="18" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="19" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="20" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="23" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="22" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="24" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="25" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="26" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="27" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="7" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="8" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="9" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="15" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="13" pinEqual="1" gate="24" gateEqual="0"/>
					<Pin pinNum="25" name="14" pinEqual="1" gate="25" gateEqual="0"/>
					<Pin pinNum="26" name="12" pinEqual="1" gate="26" gateEqual="0"/>
					<Pin pinNum="27" name="11" pinEqual="1" gate="27" gateEqual="0"/>
					<Pin pinNum="28" name="21" pinEqual="1" gate="28" gateEqual="0"/>
					<Pin pinNum="29" name="6" pinEqual="1" gate="29" gateEqual="0"/>
					<Pin pinNum="30" name="5" pinEqual="1" gate="30" gateEqual="0"/>
					<Pin pinNum="31" name="4" pinEqual="1" gate="31" gateEqual="0"/>
					<Pin pinNum="32" name="3" pinEqual="1" gate="32" gateEqual="0"/>
					<Pin pinNum="33" name="2" pinEqual="1" gate="33" gateEqual="0"/>
					<Pin pinNum="34" name="42" pinEqual="1" gate="34" gateEqual="0"/>
					<Pin pinNum="35" name="41" pinEqual="1" gate="35" gateEqual="0"/>
					<Pin pinNum="36" name="40" pinEqual="1" gate="36" gateEqual="0"/>
					<Pin pinNum="37" name="39" pinEqual="1" gate="37" gateEqual="0"/>
					<Pin pinNum="38" name="38" pinEqual="1" gate="38" gateEqual="0"/>
					<Pin pinNum="39" name="37" pinEqual="1" gate="39" gateEqual="0"/>
					<Pin pinNum="40" name="33" pinEqual="1" gate="40" gateEqual="0"/>
					<Pin pinNum="41" name="10" pinEqual="1" gate="41" gateEqual="0"/>
					<Pin pinNum="42" name="1" pinEqual="1" gate="42" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D14_1">
				<Pins>
					<Pin pinNum="1" name="36" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="35" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="34" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="28" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="30" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="31" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="32" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="29" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="17" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="18" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="19" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="20" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="23" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="22" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="24" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="25" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="26" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="27" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="7" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="8" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="9" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="15" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="13" pinEqual="1" gate="24" gateEqual="0"/>
					<Pin pinNum="25" name="14" pinEqual="1" gate="25" gateEqual="0"/>
					<Pin pinNum="26" name="12" pinEqual="1" gate="26" gateEqual="0"/>
					<Pin pinNum="27" name="11" pinEqual="1" gate="27" gateEqual="0"/>
					<Pin pinNum="28" name="21" pinEqual="1" gate="28" gateEqual="0"/>
					<Pin pinNum="29" name="6" pinEqual="1" gate="29" gateEqual="0"/>
					<Pin pinNum="30" name="5" pinEqual="1" gate="30" gateEqual="0"/>
					<Pin pinNum="31" name="4" pinEqual="1" gate="31" gateEqual="0"/>
					<Pin pinNum="32" name="3" pinEqual="1" gate="32" gateEqual="0"/>
					<Pin pinNum="33" name="2" pinEqual="1" gate="33" gateEqual="0"/>
					<Pin pinNum="34" name="42" pinEqual="1" gate="34" gateEqual="0"/>
					<Pin pinNum="35" name="41" pinEqual="1" gate="35" gateEqual="0"/>
					<Pin pinNum="36" name="40" pinEqual="1" gate="36" gateEqual="0"/>
					<Pin pinNum="37" name="39" pinEqual="1" gate="37" gateEqual="0"/>
					<Pin pinNum="38" name="38" pinEqual="1" gate="38" gateEqual="0"/>
					<Pin pinNum="39" name="37" pinEqual="1" gate="39" gateEqual="0"/>
					<Pin pinNum="40" name="33" pinEqual="1" gate="40" gateEqual="0"/>
					<Pin pinNum="41" name="10" pinEqual="1" gate="41" gateEqual="0"/>
					<Pin pinNum="42" name="1" pinEqual="1" gate="42" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D15_1">
				<Pins>
					<Pin pinNum="1" name="36" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="35" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="34" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="28" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="30" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="31" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="32" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="29" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="17" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="18" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="19" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="20" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="23" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="22" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="24" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="25" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="26" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="27" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="7" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="8" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="9" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="15" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="13" pinEqual="1" gate="24" gateEqual="0"/>
					<Pin pinNum="25" name="14" pinEqual="1" gate="25" gateEqual="0"/>
					<Pin pinNum="26" name="12" pinEqual="1" gate="26" gateEqual="0"/>
					<Pin pinNum="27" name="11" pinEqual="1" gate="27" gateEqual="0"/>
					<Pin pinNum="28" name="21" pinEqual="1" gate="28" gateEqual="0"/>
					<Pin pinNum="29" name="6" pinEqual="1" gate="29" gateEqual="0"/>
					<Pin pinNum="30" name="5" pinEqual="1" gate="30" gateEqual="0"/>
					<Pin pinNum="31" name="4" pinEqual="1" gate="31" gateEqual="0"/>
					<Pin pinNum="32" name="3" pinEqual="1" gate="32" gateEqual="0"/>
					<Pin pinNum="33" name="2" pinEqual="1" gate="33" gateEqual="0"/>
					<Pin pinNum="34" name="42" pinEqual="1" gate="34" gateEqual="0"/>
					<Pin pinNum="35" name="41" pinEqual="1" gate="35" gateEqual="0"/>
					<Pin pinNum="36" name="40" pinEqual="1" gate="36" gateEqual="0"/>
					<Pin pinNum="37" name="39" pinEqual="1" gate="37" gateEqual="0"/>
					<Pin pinNum="38" name="38" pinEqual="1" gate="38" gateEqual="0"/>
					<Pin pinNum="39" name="37" pinEqual="1" gate="39" gateEqual="0"/>
					<Pin pinNum="40" name="33" pinEqual="1" gate="40" gateEqual="0"/>
					<Pin pinNum="41" name="10" pinEqual="1" gate="41" gateEqual="0"/>
					<Pin pinNum="42" name="1" pinEqual="1" gate="42" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D16_1">
				<Pins>
					<Pin pinNum="1" name="36" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="35" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="34" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="28" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="30" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="31" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="32" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="29" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="17" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="18" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="19" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="20" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="23" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="22" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="24" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="25" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="26" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="27" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="7" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="8" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="9" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="15" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="13" pinEqual="1" gate="24" gateEqual="0"/>
					<Pin pinNum="25" name="14" pinEqual="1" gate="25" gateEqual="0"/>
					<Pin pinNum="26" name="12" pinEqual="1" gate="26" gateEqual="0"/>
					<Pin pinNum="27" name="11" pinEqual="1" gate="27" gateEqual="0"/>
					<Pin pinNum="28" name="21" pinEqual="1" gate="28" gateEqual="0"/>
					<Pin pinNum="29" name="6" pinEqual="1" gate="29" gateEqual="0"/>
					<Pin pinNum="30" name="5" pinEqual="1" gate="30" gateEqual="0"/>
					<Pin pinNum="31" name="4" pinEqual="1" gate="31" gateEqual="0"/>
					<Pin pinNum="32" name="3" pinEqual="1" gate="32" gateEqual="0"/>
					<Pin pinNum="33" name="2" pinEqual="1" gate="33" gateEqual="0"/>
					<Pin pinNum="34" name="42" pinEqual="1" gate="34" gateEqual="0"/>
					<Pin pinNum="35" name="41" pinEqual="1" gate="35" gateEqual="0"/>
					<Pin pinNum="36" name="40" pinEqual="1" gate="36" gateEqual="0"/>
					<Pin pinNum="37" name="39" pinEqual="1" gate="37" gateEqual="0"/>
					<Pin pinNum="38" name="38" pinEqual="1" gate="38" gateEqual="0"/>
					<Pin pinNum="39" name="37" pinEqual="1" gate="39" gateEqual="0"/>
					<Pin pinNum="40" name="33" pinEqual="1" gate="40" gateEqual="0"/>
					<Pin pinNum="41" name="10" pinEqual="1" gate="41" gateEqual="0"/>
					<Pin pinNum="42" name="1" pinEqual="1" gate="42" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D17_1">
				<Pins>
					<Pin pinNum="1" name="36" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="35" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="34" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="28" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="30" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="31" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="32" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="29" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="17" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="18" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="19" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="20" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="23" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="22" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="24" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="25" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="26" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="27" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="7" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="8" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="9" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="15" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="13" pinEqual="1" gate="24" gateEqual="0"/>
					<Pin pinNum="25" name="14" pinEqual="1" gate="25" gateEqual="0"/>
					<Pin pinNum="26" name="12" pinEqual="1" gate="26" gateEqual="0"/>
					<Pin pinNum="27" name="11" pinEqual="1" gate="27" gateEqual="0"/>
					<Pin pinNum="28" name="21" pinEqual="1" gate="28" gateEqual="0"/>
					<Pin pinNum="29" name="6" pinEqual="1" gate="29" gateEqual="0"/>
					<Pin pinNum="30" name="5" pinEqual="1" gate="30" gateEqual="0"/>
					<Pin pinNum="31" name="4" pinEqual="1" gate="31" gateEqual="0"/>
					<Pin pinNum="32" name="3" pinEqual="1" gate="32" gateEqual="0"/>
					<Pin pinNum="33" name="2" pinEqual="1" gate="33" gateEqual="0"/>
					<Pin pinNum="34" name="42" pinEqual="1" gate="34" gateEqual="0"/>
					<Pin pinNum="35" name="41" pinEqual="1" gate="35" gateEqual="0"/>
					<Pin pinNum="36" name="40" pinEqual="1" gate="36" gateEqual="0"/>
					<Pin pinNum="37" name="39" pinEqual="1" gate="37" gateEqual="0"/>
					<Pin pinNum="38" name="38" pinEqual="1" gate="38" gateEqual="0"/>
					<Pin pinNum="39" name="37" pinEqual="1" gate="39" gateEqual="0"/>
					<Pin pinNum="40" name="33" pinEqual="1" gate="40" gateEqual="0"/>
					<Pin pinNum="41" name="10" pinEqual="1" gate="41" gateEqual="0"/>
					<Pin pinNum="42" name="1" pinEqual="1" gate="42" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D18_1">
				<Pins>
					<Pin pinNum="1" name="10" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="9" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="7" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="6" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="8" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="4" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="3" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="1" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="2" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="5" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="13" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="14" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="15" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="12" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="11" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="20" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="19" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="18" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="17" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="16" pinEqual="1" gate="20" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D19_1">
				<Pins>
					<Pin pinNum="1" name="10" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="9" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="7" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="6" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="8" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="4" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="3" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="1" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="2" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="5" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="13" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="14" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="15" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="12" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="11" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="20" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="19" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="18" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="17" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="16" pinEqual="1" gate="20" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D20_1">
				<Pins>
					<Pin pinNum="1" name="36" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="35" pinEqual="1" gate="2" gateEqual="0"/>
					<Pin pinNum="3" name="34" pinEqual="1" gate="3" gateEqual="0"/>
					<Pin pinNum="4" name="28" pinEqual="1" gate="4" gateEqual="0"/>
					<Pin pinNum="5" name="30" pinEqual="1" gate="5" gateEqual="0"/>
					<Pin pinNum="6" name="31" pinEqual="1" gate="6" gateEqual="0"/>
					<Pin pinNum="7" name="32" pinEqual="1" gate="7" gateEqual="0"/>
					<Pin pinNum="8" name="29" pinEqual="1" gate="8" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinEqual="1" gate="9" gateEqual="0"/>
					<Pin pinNum="10" name="17" pinEqual="1" gate="10" gateEqual="0"/>
					<Pin pinNum="11" name="18" pinEqual="1" gate="11" gateEqual="0"/>
					<Pin pinNum="12" name="19" pinEqual="1" gate="12" gateEqual="0"/>
					<Pin pinNum="13" name="20" pinEqual="1" gate="13" gateEqual="0"/>
					<Pin pinNum="14" name="23" pinEqual="1" gate="14" gateEqual="0"/>
					<Pin pinNum="15" name="22" pinEqual="1" gate="15" gateEqual="0"/>
					<Pin pinNum="16" name="24" pinEqual="1" gate="16" gateEqual="0"/>
					<Pin pinNum="17" name="25" pinEqual="1" gate="17" gateEqual="0"/>
					<Pin pinNum="18" name="26" pinEqual="1" gate="18" gateEqual="0"/>
					<Pin pinNum="19" name="27" pinEqual="1" gate="19" gateEqual="0"/>
					<Pin pinNum="20" name="7" pinEqual="1" gate="20" gateEqual="0"/>
					<Pin pinNum="21" name="8" pinEqual="1" gate="21" gateEqual="0"/>
					<Pin pinNum="22" name="9" pinEqual="1" gate="22" gateEqual="0"/>
					<Pin pinNum="23" name="15" pinEqual="1" gate="23" gateEqual="0"/>
					<Pin pinNum="24" name="13" pinEqual="1" gate="24" gateEqual="0"/>
					<Pin pinNum="25" name="14" pinEqual="1" gate="25" gateEqual="0"/>
					<Pin pinNum="26" name="12" pinEqual="1" gate="26" gateEqual="0"/>
					<Pin pinNum="27" name="11" pinEqual="1" gate="27" gateEqual="0"/>
					<Pin pinNum="28" name="21" pinEqual="1" gate="28" gateEqual="0"/>
					<Pin pinNum="29" name="6" pinEqual="1" gate="29" gateEqual="0"/>
					<Pin pinNum="30" name="5" pinEqual="1" gate="30" gateEqual="0"/>
					<Pin pinNum="31" name="4" pinEqual="1" gate="31" gateEqual="0"/>
					<Pin pinNum="32" name="3" pinEqual="1" gate="32" gateEqual="0"/>
					<Pin pinNum="33" name="2" pinEqual="1" gate="33" gateEqual="0"/>
					<Pin pinNum="34" name="42" pinEqual="1" gate="34" gateEqual="0"/>
					<Pin pinNum="35" name="41" pinEqual="1" gate="35" gateEqual="0"/>
					<Pin pinNum="36" name="40" pinEqual="1" gate="36" gateEqual="0"/>
					<Pin pinNum="37" name="39" pinEqual="1" gate="37" gateEqual="0"/>
					<Pin pinNum="38" name="38" pinEqual="1" gate="38" gateEqual="0"/>
					<Pin pinNum="39" name="37" pinEqual="1" gate="39" gateEqual="0"/>
					<Pin pinNum="40" name="33" pinEqual="1" gate="40" gateEqual="0"/>
					<Pin pinNum="41" name="10" pinEqual="1" gate="41" gateEqual="0"/>
					<Pin pinNum="42" name="1" pinEqual="1" gate="42" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_2">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_3">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_4">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_5">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_6">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_7">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_8">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_9">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_10">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_11">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_12">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_13">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_14">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_15">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_16">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_17">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_18">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_19">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_20">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_21">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_22">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_23">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_24">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_25">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_26">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_27">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_28">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_29">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_30">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_31">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_32">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_33">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_34">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_35">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_36">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_37">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_38">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_39">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_40">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_41">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_42">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_43">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_44">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_45">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_46">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_47">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_48">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_49">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_50">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_51">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_52">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_53">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_54">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_55">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_56">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="FreePadPart_57">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K1_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K2_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K3_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K4_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K5_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K6_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P1_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P2_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P3_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P4_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P5_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P6_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P7_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P8_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P9_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P10_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P11_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P12_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P13_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P14_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P15_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P16_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P17_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P18_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P19_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P20_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P21_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P22_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P23_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P24_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P25_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P26_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P27_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P28_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P29_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P30_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P31_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P32_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P33_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P34_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P35_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P36_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P37_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P38_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P39_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P40_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P41_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P42_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P43_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P44_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P45_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P46_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P47_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P48_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P49_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P50_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P51_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P52_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P53_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P54_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P55_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P56_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P57_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P58_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P59_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P60_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P61_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P62_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P63_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P64_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P65_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P66_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P67_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P68_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P69_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P70_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P71_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P72_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P73_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P74_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P75_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P76_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P77_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P78_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P79_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P80_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P81_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P82_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P85_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P86_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P87_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="R4_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="R5_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="R6_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="1" gate="2" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="1_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="2_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="3_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="4_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="5_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="6_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="7_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="8_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="9_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="10_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="11_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="12_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="13_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="C1_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C2_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C3_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C4_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C5_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C6_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C7_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C8_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C9_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C10_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C12_1"/>
				<FootprintRef name="16-4.7_auto"/>
				<Pinpack pinNum="2" padNum="1"/>
				<Pinpack pinNum="1" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="DR1_1"/>
				<FootprintRef name="B19K2_Primary"/>
				<Pinpack pinNum="8" padNum="1"/>
				<Pinpack pinNum="7" padNum="2"/>
				<Pinpack pinNum="6" padNum="3"/>
				<Pinpack pinNum="5" padNum="4"/>
				<Pinpack pinNum="9" padNum="5"/>
				<Pinpack pinNum="4" padNum="6"/>
				<Pinpack pinNum="3" padNum="7"/>
				<Pinpack pinNum="2" padNum="8"/>
				<Pinpack pinNum="1" padNum="9"/>
			</Package>
			<Package>
				<ComponentRef name="DR2_1"/>
				<FootprintRef name="B19K2_Primary"/>
				<Pinpack pinNum="8" padNum="1"/>
				<Pinpack pinNum="7" padNum="2"/>
				<Pinpack pinNum="6" padNum="3"/>
				<Pinpack pinNum="5" padNum="4"/>
				<Pinpack pinNum="9" padNum="5"/>
				<Pinpack pinNum="4" padNum="6"/>
				<Pinpack pinNum="3" padNum="7"/>
				<Pinpack pinNum="2" padNum="8"/>
				<Pinpack pinNum="1" padNum="9"/>
			</Package>
			<Package>
				<ComponentRef name="DR3_1"/>
				<FootprintRef name="B19K2_Primary"/>
				<Pinpack pinNum="8" padNum="1"/>
				<Pinpack pinNum="7" padNum="2"/>
				<Pinpack pinNum="6" padNum="3"/>
				<Pinpack pinNum="5" padNum="4"/>
				<Pinpack pinNum="9" padNum="5"/>
				<Pinpack pinNum="4" padNum="6"/>
				<Pinpack pinNum="3" padNum="7"/>
				<Pinpack pinNum="2" padNum="8"/>
				<Pinpack pinNum="1" padNum="9"/>
			</Package>
			<Package>
				<ComponentRef name="D1_1"/>
				<FootprintRef name="556PT5_Primary"/>
				<Pinpack pinNum="12" padNum="1"/>
				<Pinpack pinNum="7" padNum="2"/>
				<Pinpack pinNum="8" padNum="3"/>
				<Pinpack pinNum="9" padNum="4"/>
				<Pinpack pinNum="10" padNum="5"/>
				<Pinpack pinNum="11" padNum="6"/>
				<Pinpack pinNum="6" padNum="7"/>
				<Pinpack pinNum="1" padNum="8"/>
				<Pinpack pinNum="2" padNum="9"/>
				<Pinpack pinNum="3" padNum="10"/>
				<Pinpack pinNum="4" padNum="11"/>
				<Pinpack pinNum="5" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
				<Pinpack pinNum="19" padNum="19"/>
				<Pinpack pinNum="20" padNum="20"/>
				<Pinpack pinNum="21" padNum="21"/>
				<Pinpack pinNum="22" padNum="22"/>
				<Pinpack pinNum="23" padNum="23"/>
				<Pinpack pinNum="24" padNum="24"/>
			</Package>
			<Package>
				<ComponentRef name="D2_1"/>
				<FootprintRef name="556PT5_Primary"/>
				<Pinpack pinNum="12" padNum="1"/>
				<Pinpack pinNum="7" padNum="2"/>
				<Pinpack pinNum="8" padNum="3"/>
				<Pinpack pinNum="9" padNum="4"/>
				<Pinpack pinNum="10" padNum="5"/>
				<Pinpack pinNum="11" padNum="6"/>
				<Pinpack pinNum="6" padNum="7"/>
				<Pinpack pinNum="1" padNum="8"/>
				<Pinpack pinNum="2" padNum="9"/>
				<Pinpack pinNum="3" padNum="10"/>
				<Pinpack pinNum="4" padNum="11"/>
				<Pinpack pinNum="5" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
				<Pinpack pinNum="19" padNum="19"/>
				<Pinpack pinNum="20" padNum="20"/>
				<Pinpack pinNum="21" padNum="21"/>
				<Pinpack pinNum="22" padNum="22"/>
				<Pinpack pinNum="23" padNum="23"/>
				<Pinpack pinNum="24" padNum="24"/>
			</Package>
			<Package>
				<ComponentRef name="D3_1"/>
				<FootprintRef name="556PT5_Primary"/>
				<Pinpack pinNum="12" padNum="1"/>
				<Pinpack pinNum="7" padNum="2"/>
				<Pinpack pinNum="8" padNum="3"/>
				<Pinpack pinNum="9" padNum="4"/>
				<Pinpack pinNum="10" padNum="5"/>
				<Pinpack pinNum="11" padNum="6"/>
				<Pinpack pinNum="6" padNum="7"/>
				<Pinpack pinNum="1" padNum="8"/>
				<Pinpack pinNum="2" padNum="9"/>
				<Pinpack pinNum="3" padNum="10"/>
				<Pinpack pinNum="4" padNum="11"/>
				<Pinpack pinNum="5" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
				<Pinpack pinNum="19" padNum="19"/>
				<Pinpack pinNum="20" padNum="20"/>
				<Pinpack pinNum="21" padNum="21"/>
				<Pinpack pinNum="22" padNum="22"/>
				<Pinpack pinNum="23" padNum="23"/>
				<Pinpack pinNum="24" padNum="24"/>
			</Package>
			<Package>
				<ComponentRef name="D4_1"/>
				<FootprintRef name="1533LA2_Primary"/>
				<Pinpack pinNum="6" padNum="1"/>
				<Pinpack pinNum="5" padNum="2"/>
				<Pinpack pinNum="7" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="3" padNum="5"/>
				<Pinpack pinNum="2" padNum="6"/>
				<Pinpack pinNum="1" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="12" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D5_1"/>
				<FootprintRef name="1533LA2_Primary"/>
				<Pinpack pinNum="6" padNum="1"/>
				<Pinpack pinNum="5" padNum="2"/>
				<Pinpack pinNum="7" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="3" padNum="5"/>
				<Pinpack pinNum="2" padNum="6"/>
				<Pinpack pinNum="1" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="12" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D6_1"/>
				<FootprintRef name="1533LA2_Primary"/>
				<Pinpack pinNum="6" padNum="1"/>
				<Pinpack pinNum="5" padNum="2"/>
				<Pinpack pinNum="7" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="3" padNum="5"/>
				<Pinpack pinNum="2" padNum="6"/>
				<Pinpack pinNum="1" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="12" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D7_1"/>
				<FootprintRef name="1533TM2_Primary"/>
				<Pinpack pinNum="6" padNum="1"/>
				<Pinpack pinNum="5" padNum="2"/>
				<Pinpack pinNum="7" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="3" padNum="5"/>
				<Pinpack pinNum="2" padNum="6"/>
				<Pinpack pinNum="1" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="12" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D8_1"/>
				<FootprintRef name="1533TM2_Primary"/>
				<Pinpack pinNum="6" padNum="1"/>
				<Pinpack pinNum="5" padNum="2"/>
				<Pinpack pinNum="7" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="3" padNum="5"/>
				<Pinpack pinNum="2" padNum="6"/>
				<Pinpack pinNum="1" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="12" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D9_1"/>
				<FootprintRef name="533LL1_Primary"/>
				<Pinpack pinNum="6" padNum="1"/>
				<Pinpack pinNum="5" padNum="2"/>
				<Pinpack pinNum="7" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="3" padNum="5"/>
				<Pinpack pinNum="2" padNum="6"/>
				<Pinpack pinNum="1" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="12" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D10_1"/>
				<FootprintRef name="1533LN2_Primary"/>
				<Pinpack pinNum="6" padNum="1"/>
				<Pinpack pinNum="5" padNum="2"/>
				<Pinpack pinNum="7" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="3" padNum="5"/>
				<Pinpack pinNum="2" padNum="6"/>
				<Pinpack pinNum="1" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="12" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D11_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="42" padNum="1"/>
				<Pinpack pinNum="33" padNum="2"/>
				<Pinpack pinNum="32" padNum="3"/>
				<Pinpack pinNum="31" padNum="4"/>
				<Pinpack pinNum="30" padNum="5"/>
				<Pinpack pinNum="29" padNum="6"/>
				<Pinpack pinNum="20" padNum="7"/>
				<Pinpack pinNum="21" padNum="8"/>
				<Pinpack pinNum="22" padNum="9"/>
				<Pinpack pinNum="41" padNum="10"/>
				<Pinpack pinNum="27" padNum="11"/>
				<Pinpack pinNum="26" padNum="12"/>
				<Pinpack pinNum="24" padNum="13"/>
				<Pinpack pinNum="25" padNum="14"/>
				<Pinpack pinNum="23" padNum="15"/>
				<Pinpack pinNum="9" padNum="16"/>
				<Pinpack pinNum="10" padNum="17"/>
				<Pinpack pinNum="11" padNum="18"/>
				<Pinpack pinNum="12" padNum="19"/>
				<Pinpack pinNum="13" padNum="20"/>
				<Pinpack pinNum="28" padNum="21"/>
				<Pinpack pinNum="15" padNum="22"/>
				<Pinpack pinNum="14" padNum="23"/>
				<Pinpack pinNum="16" padNum="24"/>
				<Pinpack pinNum="17" padNum="25"/>
				<Pinpack pinNum="18" padNum="26"/>
				<Pinpack pinNum="19" padNum="27"/>
				<Pinpack pinNum="4" padNum="28"/>
				<Pinpack pinNum="8" padNum="29"/>
				<Pinpack pinNum="5" padNum="30"/>
				<Pinpack pinNum="6" padNum="31"/>
				<Pinpack pinNum="7" padNum="32"/>
				<Pinpack pinNum="40" padNum="33"/>
				<Pinpack pinNum="3" padNum="34"/>
				<Pinpack pinNum="2" padNum="35"/>
				<Pinpack pinNum="1" padNum="36"/>
				<Pinpack pinNum="39" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="37" padNum="39"/>
				<Pinpack pinNum="36" padNum="40"/>
				<Pinpack pinNum="35" padNum="41"/>
				<Pinpack pinNum="34" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D12_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="42" padNum="1"/>
				<Pinpack pinNum="33" padNum="2"/>
				<Pinpack pinNum="32" padNum="3"/>
				<Pinpack pinNum="31" padNum="4"/>
				<Pinpack pinNum="30" padNum="5"/>
				<Pinpack pinNum="29" padNum="6"/>
				<Pinpack pinNum="20" padNum="7"/>
				<Pinpack pinNum="21" padNum="8"/>
				<Pinpack pinNum="22" padNum="9"/>
				<Pinpack pinNum="41" padNum="10"/>
				<Pinpack pinNum="27" padNum="11"/>
				<Pinpack pinNum="26" padNum="12"/>
				<Pinpack pinNum="24" padNum="13"/>
				<Pinpack pinNum="25" padNum="14"/>
				<Pinpack pinNum="23" padNum="15"/>
				<Pinpack pinNum="9" padNum="16"/>
				<Pinpack pinNum="10" padNum="17"/>
				<Pinpack pinNum="11" padNum="18"/>
				<Pinpack pinNum="12" padNum="19"/>
				<Pinpack pinNum="13" padNum="20"/>
				<Pinpack pinNum="28" padNum="21"/>
				<Pinpack pinNum="15" padNum="22"/>
				<Pinpack pinNum="14" padNum="23"/>
				<Pinpack pinNum="16" padNum="24"/>
				<Pinpack pinNum="17" padNum="25"/>
				<Pinpack pinNum="18" padNum="26"/>
				<Pinpack pinNum="19" padNum="27"/>
				<Pinpack pinNum="4" padNum="28"/>
				<Pinpack pinNum="8" padNum="29"/>
				<Pinpack pinNum="5" padNum="30"/>
				<Pinpack pinNum="6" padNum="31"/>
				<Pinpack pinNum="7" padNum="32"/>
				<Pinpack pinNum="40" padNum="33"/>
				<Pinpack pinNum="3" padNum="34"/>
				<Pinpack pinNum="2" padNum="35"/>
				<Pinpack pinNum="1" padNum="36"/>
				<Pinpack pinNum="39" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="37" padNum="39"/>
				<Pinpack pinNum="36" padNum="40"/>
				<Pinpack pinNum="35" padNum="41"/>
				<Pinpack pinNum="34" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D13_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="42" padNum="1"/>
				<Pinpack pinNum="33" padNum="2"/>
				<Pinpack pinNum="32" padNum="3"/>
				<Pinpack pinNum="31" padNum="4"/>
				<Pinpack pinNum="30" padNum="5"/>
				<Pinpack pinNum="29" padNum="6"/>
				<Pinpack pinNum="20" padNum="7"/>
				<Pinpack pinNum="21" padNum="8"/>
				<Pinpack pinNum="22" padNum="9"/>
				<Pinpack pinNum="41" padNum="10"/>
				<Pinpack pinNum="27" padNum="11"/>
				<Pinpack pinNum="26" padNum="12"/>
				<Pinpack pinNum="24" padNum="13"/>
				<Pinpack pinNum="25" padNum="14"/>
				<Pinpack pinNum="23" padNum="15"/>
				<Pinpack pinNum="9" padNum="16"/>
				<Pinpack pinNum="10" padNum="17"/>
				<Pinpack pinNum="11" padNum="18"/>
				<Pinpack pinNum="12" padNum="19"/>
				<Pinpack pinNum="13" padNum="20"/>
				<Pinpack pinNum="28" padNum="21"/>
				<Pinpack pinNum="15" padNum="22"/>
				<Pinpack pinNum="14" padNum="23"/>
				<Pinpack pinNum="16" padNum="24"/>
				<Pinpack pinNum="17" padNum="25"/>
				<Pinpack pinNum="18" padNum="26"/>
				<Pinpack pinNum="19" padNum="27"/>
				<Pinpack pinNum="4" padNum="28"/>
				<Pinpack pinNum="8" padNum="29"/>
				<Pinpack pinNum="5" padNum="30"/>
				<Pinpack pinNum="6" padNum="31"/>
				<Pinpack pinNum="7" padNum="32"/>
				<Pinpack pinNum="40" padNum="33"/>
				<Pinpack pinNum="3" padNum="34"/>
				<Pinpack pinNum="2" padNum="35"/>
				<Pinpack pinNum="1" padNum="36"/>
				<Pinpack pinNum="39" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="37" padNum="39"/>
				<Pinpack pinNum="36" padNum="40"/>
				<Pinpack pinNum="35" padNum="41"/>
				<Pinpack pinNum="34" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D14_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="42" padNum="1"/>
				<Pinpack pinNum="33" padNum="2"/>
				<Pinpack pinNum="32" padNum="3"/>
				<Pinpack pinNum="31" padNum="4"/>
				<Pinpack pinNum="30" padNum="5"/>
				<Pinpack pinNum="29" padNum="6"/>
				<Pinpack pinNum="20" padNum="7"/>
				<Pinpack pinNum="21" padNum="8"/>
				<Pinpack pinNum="22" padNum="9"/>
				<Pinpack pinNum="41" padNum="10"/>
				<Pinpack pinNum="27" padNum="11"/>
				<Pinpack pinNum="26" padNum="12"/>
				<Pinpack pinNum="24" padNum="13"/>
				<Pinpack pinNum="25" padNum="14"/>
				<Pinpack pinNum="23" padNum="15"/>
				<Pinpack pinNum="9" padNum="16"/>
				<Pinpack pinNum="10" padNum="17"/>
				<Pinpack pinNum="11" padNum="18"/>
				<Pinpack pinNum="12" padNum="19"/>
				<Pinpack pinNum="13" padNum="20"/>
				<Pinpack pinNum="28" padNum="21"/>
				<Pinpack pinNum="15" padNum="22"/>
				<Pinpack pinNum="14" padNum="23"/>
				<Pinpack pinNum="16" padNum="24"/>
				<Pinpack pinNum="17" padNum="25"/>
				<Pinpack pinNum="18" padNum="26"/>
				<Pinpack pinNum="19" padNum="27"/>
				<Pinpack pinNum="4" padNum="28"/>
				<Pinpack pinNum="8" padNum="29"/>
				<Pinpack pinNum="5" padNum="30"/>
				<Pinpack pinNum="6" padNum="31"/>
				<Pinpack pinNum="7" padNum="32"/>
				<Pinpack pinNum="40" padNum="33"/>
				<Pinpack pinNum="3" padNum="34"/>
				<Pinpack pinNum="2" padNum="35"/>
				<Pinpack pinNum="1" padNum="36"/>
				<Pinpack pinNum="39" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="37" padNum="39"/>
				<Pinpack pinNum="36" padNum="40"/>
				<Pinpack pinNum="35" padNum="41"/>
				<Pinpack pinNum="34" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D15_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="42" padNum="1"/>
				<Pinpack pinNum="33" padNum="2"/>
				<Pinpack pinNum="32" padNum="3"/>
				<Pinpack pinNum="31" padNum="4"/>
				<Pinpack pinNum="30" padNum="5"/>
				<Pinpack pinNum="29" padNum="6"/>
				<Pinpack pinNum="20" padNum="7"/>
				<Pinpack pinNum="21" padNum="8"/>
				<Pinpack pinNum="22" padNum="9"/>
				<Pinpack pinNum="41" padNum="10"/>
				<Pinpack pinNum="27" padNum="11"/>
				<Pinpack pinNum="26" padNum="12"/>
				<Pinpack pinNum="24" padNum="13"/>
				<Pinpack pinNum="25" padNum="14"/>
				<Pinpack pinNum="23" padNum="15"/>
				<Pinpack pinNum="9" padNum="16"/>
				<Pinpack pinNum="10" padNum="17"/>
				<Pinpack pinNum="11" padNum="18"/>
				<Pinpack pinNum="12" padNum="19"/>
				<Pinpack pinNum="13" padNum="20"/>
				<Pinpack pinNum="28" padNum="21"/>
				<Pinpack pinNum="15" padNum="22"/>
				<Pinpack pinNum="14" padNum="23"/>
				<Pinpack pinNum="16" padNum="24"/>
				<Pinpack pinNum="17" padNum="25"/>
				<Pinpack pinNum="18" padNum="26"/>
				<Pinpack pinNum="19" padNum="27"/>
				<Pinpack pinNum="4" padNum="28"/>
				<Pinpack pinNum="8" padNum="29"/>
				<Pinpack pinNum="5" padNum="30"/>
				<Pinpack pinNum="6" padNum="31"/>
				<Pinpack pinNum="7" padNum="32"/>
				<Pinpack pinNum="40" padNum="33"/>
				<Pinpack pinNum="3" padNum="34"/>
				<Pinpack pinNum="2" padNum="35"/>
				<Pinpack pinNum="1" padNum="36"/>
				<Pinpack pinNum="39" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="37" padNum="39"/>
				<Pinpack pinNum="36" padNum="40"/>
				<Pinpack pinNum="35" padNum="41"/>
				<Pinpack pinNum="34" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D16_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="42" padNum="1"/>
				<Pinpack pinNum="33" padNum="2"/>
				<Pinpack pinNum="32" padNum="3"/>
				<Pinpack pinNum="31" padNum="4"/>
				<Pinpack pinNum="30" padNum="5"/>
				<Pinpack pinNum="29" padNum="6"/>
				<Pinpack pinNum="20" padNum="7"/>
				<Pinpack pinNum="21" padNum="8"/>
				<Pinpack pinNum="22" padNum="9"/>
				<Pinpack pinNum="41" padNum="10"/>
				<Pinpack pinNum="27" padNum="11"/>
				<Pinpack pinNum="26" padNum="12"/>
				<Pinpack pinNum="24" padNum="13"/>
				<Pinpack pinNum="25" padNum="14"/>
				<Pinpack pinNum="23" padNum="15"/>
				<Pinpack pinNum="9" padNum="16"/>
				<Pinpack pinNum="10" padNum="17"/>
				<Pinpack pinNum="11" padNum="18"/>
				<Pinpack pinNum="12" padNum="19"/>
				<Pinpack pinNum="13" padNum="20"/>
				<Pinpack pinNum="28" padNum="21"/>
				<Pinpack pinNum="15" padNum="22"/>
				<Pinpack pinNum="14" padNum="23"/>
				<Pinpack pinNum="16" padNum="24"/>
				<Pinpack pinNum="17" padNum="25"/>
				<Pinpack pinNum="18" padNum="26"/>
				<Pinpack pinNum="19" padNum="27"/>
				<Pinpack pinNum="4" padNum="28"/>
				<Pinpack pinNum="8" padNum="29"/>
				<Pinpack pinNum="5" padNum="30"/>
				<Pinpack pinNum="6" padNum="31"/>
				<Pinpack pinNum="7" padNum="32"/>
				<Pinpack pinNum="40" padNum="33"/>
				<Pinpack pinNum="3" padNum="34"/>
				<Pinpack pinNum="2" padNum="35"/>
				<Pinpack pinNum="1" padNum="36"/>
				<Pinpack pinNum="39" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="37" padNum="39"/>
				<Pinpack pinNum="36" padNum="40"/>
				<Pinpack pinNum="35" padNum="41"/>
				<Pinpack pinNum="34" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D17_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="42" padNum="1"/>
				<Pinpack pinNum="33" padNum="2"/>
				<Pinpack pinNum="32" padNum="3"/>
				<Pinpack pinNum="31" padNum="4"/>
				<Pinpack pinNum="30" padNum="5"/>
				<Pinpack pinNum="29" padNum="6"/>
				<Pinpack pinNum="20" padNum="7"/>
				<Pinpack pinNum="21" padNum="8"/>
				<Pinpack pinNum="22" padNum="9"/>
				<Pinpack pinNum="41" padNum="10"/>
				<Pinpack pinNum="27" padNum="11"/>
				<Pinpack pinNum="26" padNum="12"/>
				<Pinpack pinNum="24" padNum="13"/>
				<Pinpack pinNum="25" padNum="14"/>
				<Pinpack pinNum="23" padNum="15"/>
				<Pinpack pinNum="9" padNum="16"/>
				<Pinpack pinNum="10" padNum="17"/>
				<Pinpack pinNum="11" padNum="18"/>
				<Pinpack pinNum="12" padNum="19"/>
				<Pinpack pinNum="13" padNum="20"/>
				<Pinpack pinNum="28" padNum="21"/>
				<Pinpack pinNum="15" padNum="22"/>
				<Pinpack pinNum="14" padNum="23"/>
				<Pinpack pinNum="16" padNum="24"/>
				<Pinpack pinNum="17" padNum="25"/>
				<Pinpack pinNum="18" padNum="26"/>
				<Pinpack pinNum="19" padNum="27"/>
				<Pinpack pinNum="4" padNum="28"/>
				<Pinpack pinNum="8" padNum="29"/>
				<Pinpack pinNum="5" padNum="30"/>
				<Pinpack pinNum="6" padNum="31"/>
				<Pinpack pinNum="7" padNum="32"/>
				<Pinpack pinNum="40" padNum="33"/>
				<Pinpack pinNum="3" padNum="34"/>
				<Pinpack pinNum="2" padNum="35"/>
				<Pinpack pinNum="1" padNum="36"/>
				<Pinpack pinNum="39" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="37" padNum="39"/>
				<Pinpack pinNum="36" padNum="40"/>
				<Pinpack pinNum="35" padNum="41"/>
				<Pinpack pinNum="34" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D18_1"/>
				<FootprintRef name="1533AP6_Primary"/>
				<Pinpack pinNum="8" padNum="1"/>
				<Pinpack pinNum="9" padNum="2"/>
				<Pinpack pinNum="7" padNum="3"/>
				<Pinpack pinNum="6" padNum="4"/>
				<Pinpack pinNum="10" padNum="5"/>
				<Pinpack pinNum="4" padNum="6"/>
				<Pinpack pinNum="3" padNum="7"/>
				<Pinpack pinNum="5" padNum="8"/>
				<Pinpack pinNum="2" padNum="9"/>
				<Pinpack pinNum="1" padNum="10"/>
				<Pinpack pinNum="15" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="11" padNum="13"/>
				<Pinpack pinNum="12" padNum="14"/>
				<Pinpack pinNum="13" padNum="15"/>
				<Pinpack pinNum="20" padNum="16"/>
				<Pinpack pinNum="19" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
				<Pinpack pinNum="17" padNum="19"/>
				<Pinpack pinNum="16" padNum="20"/>
			</Package>
			<Package>
				<ComponentRef name="D19_1"/>
				<FootprintRef name="1533AP6_Primary"/>
				<Pinpack pinNum="8" padNum="1"/>
				<Pinpack pinNum="9" padNum="2"/>
				<Pinpack pinNum="7" padNum="3"/>
				<Pinpack pinNum="6" padNum="4"/>
				<Pinpack pinNum="10" padNum="5"/>
				<Pinpack pinNum="4" padNum="6"/>
				<Pinpack pinNum="3" padNum="7"/>
				<Pinpack pinNum="5" padNum="8"/>
				<Pinpack pinNum="2" padNum="9"/>
				<Pinpack pinNum="1" padNum="10"/>
				<Pinpack pinNum="15" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="11" padNum="13"/>
				<Pinpack pinNum="12" padNum="14"/>
				<Pinpack pinNum="13" padNum="15"/>
				<Pinpack pinNum="20" padNum="16"/>
				<Pinpack pinNum="19" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
				<Pinpack pinNum="17" padNum="19"/>
				<Pinpack pinNum="16" padNum="20"/>
			</Package>
			<Package>
				<ComponentRef name="D20_1"/>
				<FootprintRef name="H1806XM1241_Primary"/>
				<Pinpack pinNum="42" padNum="1"/>
				<Pinpack pinNum="33" padNum="2"/>
				<Pinpack pinNum="32" padNum="3"/>
				<Pinpack pinNum="31" padNum="4"/>
				<Pinpack pinNum="30" padNum="5"/>
				<Pinpack pinNum="29" padNum="6"/>
				<Pinpack pinNum="20" padNum="7"/>
				<Pinpack pinNum="21" padNum="8"/>
				<Pinpack pinNum="22" padNum="9"/>
				<Pinpack pinNum="41" padNum="10"/>
				<Pinpack pinNum="27" padNum="11"/>
				<Pinpack pinNum="26" padNum="12"/>
				<Pinpack pinNum="24" padNum="13"/>
				<Pinpack pinNum="25" padNum="14"/>
				<Pinpack pinNum="23" padNum="15"/>
				<Pinpack pinNum="9" padNum="16"/>
				<Pinpack pinNum="10" padNum="17"/>
				<Pinpack pinNum="11" padNum="18"/>
				<Pinpack pinNum="12" padNum="19"/>
				<Pinpack pinNum="13" padNum="20"/>
				<Pinpack pinNum="28" padNum="21"/>
				<Pinpack pinNum="15" padNum="22"/>
				<Pinpack pinNum="14" padNum="23"/>
				<Pinpack pinNum="16" padNum="24"/>
				<Pinpack pinNum="17" padNum="25"/>
				<Pinpack pinNum="18" padNum="26"/>
				<Pinpack pinNum="19" padNum="27"/>
				<Pinpack pinNum="4" padNum="28"/>
				<Pinpack pinNum="8" padNum="29"/>
				<Pinpack pinNum="5" padNum="30"/>
				<Pinpack pinNum="6" padNum="31"/>
				<Pinpack pinNum="7" padNum="32"/>
				<Pinpack pinNum="40" padNum="33"/>
				<Pinpack pinNum="3" padNum="34"/>
				<Pinpack pinNum="2" padNum="35"/>
				<Pinpack pinNum="1" padNum="36"/>
				<Pinpack pinNum="39" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="37" padNum="39"/>
				<Pinpack pinNum="36" padNum="40"/>
				<Pinpack pinNum="35" padNum="41"/>
				<Pinpack pinNum="34" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_1"/>
				<FootprintRef name="FreePadCell_1"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_2"/>
				<FootprintRef name="FreePadCell_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_3"/>
				<FootprintRef name="FreePadCell_3"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_4"/>
				<FootprintRef name="FreePadCell_4"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_5"/>
				<FootprintRef name="FreePadCell_5"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_6"/>
				<FootprintRef name="FreePadCell_6"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_7"/>
				<FootprintRef name="FreePadCell_7"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_8"/>
				<FootprintRef name="FreePadCell_8"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_9"/>
				<FootprintRef name="FreePadCell_9"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_10"/>
				<FootprintRef name="FreePadCell_10"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_11"/>
				<FootprintRef name="FreePadCell_11"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_12"/>
				<FootprintRef name="FreePadCell_12"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_13"/>
				<FootprintRef name="FreePadCell_13"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_14"/>
				<FootprintRef name="FreePadCell_14"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_15"/>
				<FootprintRef name="FreePadCell_15"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_16"/>
				<FootprintRef name="FreePadCell_16"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_17"/>
				<FootprintRef name="FreePadCell_17"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_18"/>
				<FootprintRef name="FreePadCell_18"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_19"/>
				<FootprintRef name="FreePadCell_19"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_20"/>
				<FootprintRef name="FreePadCell_20"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_21"/>
				<FootprintRef name="FreePadCell_21"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_22"/>
				<FootprintRef name="FreePadCell_22"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_23"/>
				<FootprintRef name="FreePadCell_23"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_24"/>
				<FootprintRef name="FreePadCell_24"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_25"/>
				<FootprintRef name="FreePadCell_25"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_26"/>
				<FootprintRef name="FreePadCell_26"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_27"/>
				<FootprintRef name="FreePadCell_27"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_28"/>
				<FootprintRef name="FreePadCell_28"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_29"/>
				<FootprintRef name="FreePadCell_29"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_30"/>
				<FootprintRef name="FreePadCell_30"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_31"/>
				<FootprintRef name="FreePadCell_31"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_32"/>
				<FootprintRef name="FreePadCell_32"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_33"/>
				<FootprintRef name="FreePadCell_33"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_34"/>
				<FootprintRef name="FreePadCell_34"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_35"/>
				<FootprintRef name="FreePadCell_35"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_36"/>
				<FootprintRef name="FreePadCell_36"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_37"/>
				<FootprintRef name="FreePadCell_37"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_38"/>
				<FootprintRef name="FreePadCell_38"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_39"/>
				<FootprintRef name="FreePadCell_39"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_40"/>
				<FootprintRef name="FreePadCell_40"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_41"/>
				<FootprintRef name="FreePadCell_41"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_42"/>
				<FootprintRef name="FreePadCell_42"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_43"/>
				<FootprintRef name="FreePadCell_43"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_44"/>
				<FootprintRef name="FreePadCell_44"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_45"/>
				<FootprintRef name="FreePadCell_45"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_46"/>
				<FootprintRef name="FreePadCell_46"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_47"/>
				<FootprintRef name="FreePadCell_47"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_48"/>
				<FootprintRef name="FreePadCell_48"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_49"/>
				<FootprintRef name="FreePadCell_49"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_50"/>
				<FootprintRef name="FreePadCell_50"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_51"/>
				<FootprintRef name="FreePadCell_51"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_52"/>
				<FootprintRef name="FreePadCell_52"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_53"/>
				<FootprintRef name="FreePadCell_53"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_54"/>
				<FootprintRef name="FreePadCell_54"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_55"/>
				<FootprintRef name="FreePadCell_55"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_56"/>
				<FootprintRef name="FreePadCell_56"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="FreePadPart_57"/>
				<FootprintRef name="FreePadCell_57"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K1_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K2_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K3_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K4_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K5_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K6_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P1_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P2_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P3_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P4_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P5_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P6_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P7_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P8_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P9_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P10_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P11_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P12_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P13_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P14_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P15_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P16_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P17_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P18_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P19_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P20_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P21_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P22_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P23_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P24_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P25_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P26_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P27_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P28_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P29_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P30_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P31_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P32_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P33_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P34_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P35_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P36_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P37_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P38_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P39_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P40_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P41_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P42_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P43_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P44_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P45_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P46_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P47_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P48_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P49_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P50_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P51_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P52_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P53_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P54_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P55_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P56_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P57_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P58_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P59_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P60_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P61_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P62_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P63_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P64_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P65_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P66_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P67_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P68_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P69_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P70_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P71_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P72_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P73_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P74_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P75_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P76_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P77_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P78_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P79_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P80_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P81_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P82_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P85_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P86_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P87_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="R4_1"/>
				<FootprintRef name="P1_12_0.25_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R5_1"/>
				<FootprintRef name="P1_12_0.25_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R6_1"/>
				<FootprintRef name="P1_12_0.25_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="1_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="2_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="3_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="4_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="5_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="6_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="7_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="8_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="9_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="10_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="11_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="12_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="13_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
		</Packages>
	</LocalLibrary>

	<Constructive version="1.2">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.1">
					<Polyline>
						<Start x="5" y="107"/>
						<SegmentLine>
							<End x="97" y="107"/>
						</SegmentLine>
						<SegmentLine>
							<End x="97" y="5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5" y="5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5" y="107"/>
						</SegmentLine>
					</Polyline>
				</Shape>
			</Contour>
		</BoardOutline>
	</Constructive>

	<ComponentsOnBoard version="1.3">
		<Components>
			<CompInstance name="D1" uniqueId="ATZGUMMD" side="Top" angle="90">
				<ComponentRef name="D1_1"/>
				<FootprintRef name="556PT5_Primary"/>
				<Org x="77.75" y="29"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D16" uniqueId="XVZZZVTH" side="Bottom">
				<ComponentRef name="D16_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="71" y="90"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D19" uniqueId="LJHESDWI" side="Top" angle="90">
				<ComponentRef name="D19_1"/>
				<FootprintRef name="1533AP6_Primary"/>
				<Org x="62.75" y="29"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P24" uniqueId="HNACNSGO" side="Top" angle="90" fixed="on">
				<ComponentRef name="P24_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="35.25" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P53" uniqueId="YNICOUHY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P53_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="55.25" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P13" uniqueId="ISQXDYSA" side="Top" angle="90" fixed="on">
				<ComponentRef name="P13_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="39" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P40" uniqueId="NKIQDFXY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P40_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="66.5" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P34" uniqueId="TNFIIVKU" side="Top" angle="90" fixed="on">
				<ComponentRef name="P34_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="71.5" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C10" uniqueId="OUQDPJQJ" side="Bottom" angle="90">
				<ComponentRef name="C10_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Org x="92.5" y="75.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C1" uniqueId="WKUDNYGY" side="Bottom">
				<ComponentRef name="C1_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Org x="23.5" y="94.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="13" uniqueId="WWRQLWCS" side="Top" angle="180">
				<ComponentRef name="13_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="79" y="51.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="5" uniqueId="RSTGBHJM" side="Top" angle="270">
				<ComponentRef name="5_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="46.25" y="50.375"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="K6" uniqueId="UHLOUVII" side="Top" fixed="on">
				<ComponentRef name="K6_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="10.5" y="15.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P65" uniqueId="NQDFZGRR" side="Top" angle="90" fixed="on">
				<ComponentRef name="P65_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="72.76" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P51" uniqueId="QQUKCMDT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P51_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="62.6" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P71" uniqueId="LXEQNCHD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P71_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="77.84" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P63" uniqueId="QDIGSXVZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P63_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="14.34" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P86" uniqueId="EMWTUHOE" side="Top" angle="90" fixed="on">
				<ComponentRef name="P86_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="27.04" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P5" uniqueId="YPZKWEME" side="Top" angle="90" fixed="on">
				<ComponentRef name="P5_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="77.84" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P76" uniqueId="YBQJVAAF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P76_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="90.54" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_6" uniqueId="ISQVJPGW" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_6"/>
				<FootprintRef name="FreePadCell_6"/>
				<Org x="44.82" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_13" uniqueId="QDWVTFKY" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_13"/>
				<FootprintRef name="FreePadCell_13"/>
				<Org x="37.2" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_20" uniqueId="HVAUPIGZ" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_20"/>
				<FootprintRef name="FreePadCell_20"/>
				<Org x="77.84" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_27" uniqueId="CGFNQFJM" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_27"/>
				<FootprintRef name="FreePadCell_27"/>
				<Org x="62.6" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_34" uniqueId="QWGLMWTU" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_34"/>
				<FootprintRef name="FreePadCell_34"/>
				<Org x="47.36" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_41" uniqueId="PEDBFQTK" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_41"/>
				<FootprintRef name="FreePadCell_41"/>
				<Org x="19.42" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_48" uniqueId="EBJRNWKD" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_48"/>
				<FootprintRef name="FreePadCell_48"/>
				<Org x="49.9" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_55" uniqueId="DOYQXVIP" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_55"/>
				<FootprintRef name="FreePadCell_55"/>
				<Org x="34.66" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D7" uniqueId="IMNMTORY" side="Bottom">
				<ComponentRef name="D7_1"/>
				<FootprintRef name="1533TM2_Primary"/>
				<Org x="92.2" y="94"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D12" uniqueId="DCYJZQXK" side="Bottom" angle="90">
				<ComponentRef name="D12_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="81.25" y="74"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D9" uniqueId="OYSLBOFO" side="Top" angle="270">
				<ComponentRef name="D9_1"/>
				<FootprintRef name="533LL1_Primary"/>
				<Org x="18.75" y="45.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P29" uniqueId="CLOLZLXP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P29_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="45.25" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P20" uniqueId="CARPCUCP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P20_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="37.75" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P55" uniqueId="IRYOQPWU" side="Top" angle="90" fixed="on">
				<ComponentRef name="P55_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="31.5" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P43" uniqueId="NRTUMQGZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P43_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="59" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P44" uniqueId="UIJPEZKP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P44_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="30.25" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P30" uniqueId="LVJTTOVE" side="Top" angle="90" fixed="on">
				<ComponentRef name="P30_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="42.75" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C5" uniqueId="XYSBLQMP" side="Bottom" angle="180">
				<ComponentRef name="C5_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Org x="7.75" y="53"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R4" uniqueId="BKBWNQOO" side="Top" angle="90">
				<ComponentRef name="R4_1"/>
				<FootprintRef name="P1_12_0.25_auto"/>
				<Org x="35.5" y="86.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="8" uniqueId="OHRFVVFZ" side="Top">
				<ComponentRef name="8_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="85.25" y="50.125"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="1" uniqueId="QQWGUCWT" side="Top" angle="270">
				<ComponentRef name="1_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="35" y="53.375"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P69" uniqueId="ROPUJQUB" side="Top" angle="90" fixed="on">
				<ComponentRef name="P69_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="67.68" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P59" uniqueId="VZZXTZSQ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P59_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="27.04" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P11" uniqueId="SYYHSIKF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P11_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="42.28" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P38" uniqueId="BQCEPFXH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P38_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="32.12" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P17" uniqueId="DFQSJTKO" side="Top" angle="90" fixed="on">
				<ComponentRef name="P17_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="65.14" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P8" uniqueId="TWSLLXYC" side="Top" angle="90" fixed="on">
				<ComponentRef name="P8_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="70.22" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P1" uniqueId="IMERDUNE" side="Top" angle="90" fixed="on">
				<ComponentRef name="P1_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="88" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_3" uniqueId="UXGTVMGF" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_3"/>
				<FootprintRef name="FreePadCell_3"/>
				<Org x="67.68" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_10" uniqueId="UIQLJVLX" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_10"/>
				<FootprintRef name="FreePadCell_10"/>
				<Org x="29.58" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_17" uniqueId="XHPRNFJE" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_17"/>
				<FootprintRef name="FreePadCell_17"/>
				<Org x="52.44" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_24" uniqueId="QAFBTTUN" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_24"/>
				<FootprintRef name="FreePadCell_24"/>
				<Org x="65.14" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_31" uniqueId="CVOOKTVJ" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_31"/>
				<FootprintRef name="FreePadCell_31"/>
				<Org x="54.98" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_38" uniqueId="WGNSAJBD" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_38"/>
				<FootprintRef name="FreePadCell_38"/>
				<Org x="39.74" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_45" uniqueId="EJFSTZUJ" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_45"/>
				<FootprintRef name="FreePadCell_45"/>
				<Org x="54.98" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_52" uniqueId="MHEUJYYE" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_52"/>
				<FootprintRef name="FreePadCell_52"/>
				<Org x="39.74" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C12" uniqueId="XRMCDLIJ" side="Bottom" angle="270">
				<ComponentRef name="C12_1"/>
				<FootprintRef name="16-4.7_auto"/>
				<Org x="91.75" y="27"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DR1" uniqueId="TJFMSDXB" side="Bottom" angle="90">
				<ComponentRef name="DR1_1"/>
				<FootprintRef name="B19K2_Primary"/>
				<Org x="76" y="36.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D17" uniqueId="WQCOKNIY" side="Bottom" angle="90">
				<ComponentRef name="D17_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="22.25" y="74"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D6" uniqueId="AYXNZDCE" side="Bottom" angle="180">
				<ComponentRef name="D6_1"/>
				<FootprintRef name="1533LA2_Primary"/>
				<Org x="29.75" y="41"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P27" uniqueId="PDIZEYBC" side="Top" angle="90" fixed="on">
				<ComponentRef name="P27_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="49" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P56" uniqueId="UBMPMZJZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P56_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="52.75" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P85" uniqueId="PRWOBLKJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P85_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="64" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P47" uniqueId="HJGSGDZJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P47_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="34" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P35" uniqueId="EHVUISLD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P35_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="60.25" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C8" uniqueId="YFHHHWXX" side="Bottom">
				<ComponentRef name="C8_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Org x="94.375" y="37.875"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C2" uniqueId="RTSBASHN" side="Top">
				<ComponentRef name="C2_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Org x="10.25" y="31"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="10" uniqueId="HPKYKJPP" side="Top" angle="180">
				<ComponentRef name="10_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="80.875" y="51.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="4" uniqueId="XHAWQPAZ" side="Top" angle="270">
				<ComponentRef name="4_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="43.75" y="50.375"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="K1" uniqueId="LJSTZSIQ" side="Top" fixed="on">
				<ComponentRef name="K1_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="90.5" y="15.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P64" uniqueId="GJBLIKKD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P64_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="77.84" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P18" uniqueId="ZIGBYVIZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P18_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="44.82" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P72" uniqueId="MHUOVWPT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P72_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="80.38" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P62" uniqueId="PPLKZRKT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P62_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="16.88" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P80" uniqueId="EKJOBORS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P80_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="16.88" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P4" uniqueId="MZJWCFLJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P4_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="80.38" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P77" uniqueId="BRADXSRM" side="Top" angle="90" fixed="on">
				<ComponentRef name="P77_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="11.8" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_7" uniqueId="VMRDNOUZ" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_7"/>
				<FootprintRef name="FreePadCell_7"/>
				<Org x="52.44" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_14" uniqueId="TALQDXCF" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_14"/>
				<FootprintRef name="FreePadCell_14"/>
				<Org x="44.82" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_21" uniqueId="HVSXOYML" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_21"/>
				<FootprintRef name="FreePadCell_21"/>
				<Org x="72.76" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_28" uniqueId="HHDFEJIM" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_28"/>
				<FootprintRef name="FreePadCell_28"/>
				<Org x="57.52" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_35" uniqueId="GYVFNHQD" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_35"/>
				<FootprintRef name="FreePadCell_35"/>
				<Org x="47.36" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_42" uniqueId="BRCOGHBW" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_42"/>
				<FootprintRef name="FreePadCell_42"/>
				<Org x="62.6" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_49" uniqueId="JKLZXFMI" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_49"/>
				<FootprintRef name="FreePadCell_49"/>
				<Org x="47.36" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_56" uniqueId="IXOTLRVB" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_56"/>
				<FootprintRef name="FreePadCell_56"/>
				<Org x="34.66" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D3" uniqueId="ZQUWHMKJ" side="Top" angle="90">
				<ComponentRef name="D3_1"/>
				<FootprintRef name="556PT5_Primary"/>
				<Org x="26" y="29"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D13" uniqueId="LFNFWRJR" side="Top" angle="90">
				<ComponentRef name="D13_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="81.25" y="56.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D10" uniqueId="PLXMQNPD" side="Top" angle="90">
				<ComponentRef name="D10_1"/>
				<FootprintRef name="1533LN2_Primary"/>
				<Org x="11.25" y="83.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P28" uniqueId="XOICPAGS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P28_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="46.5" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P23" uniqueId="RLJJMLUW" side="Top" angle="90" fixed="on">
				<ComponentRef name="P23_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="32.75" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P19" uniqueId="QVTZHVLH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P19_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="41.5" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P42" uniqueId="LVHHRYPQ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P42_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="69" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P70" uniqueId="TKBMVWXQ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P70_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="56.5" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P31" uniqueId="MIZZHQYO" side="Top" angle="90" fixed="on">
				<ComponentRef name="P31_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="47.75" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C6" uniqueId="AIEPVORO" side="Bottom" angle="90">
				<ComponentRef name="C6_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Org x="45" y="44.375"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R6" uniqueId="SRYWJTMX" side="Top" angle="90">
				<ComponentRef name="R6_1"/>
				<FootprintRef name="P1_12_0.25_auto"/>
				<Org x="38" y="86.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="7" uniqueId="TFTSFFLF" side="Top" angle="180">
				<ComponentRef name="7_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="54.875" y="53.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="K4" uniqueId="MDCDXSNF" side="Top" fixed="on">
				<ComponentRef name="K4_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="28.5" y="102"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P68" uniqueId="GBBUGXYI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P68_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="65.14" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P52" uniqueId="TABIWPVS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P52_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="72.76" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P48" uniqueId="MFRLDQXJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P48_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="29.58" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P33" uniqueId="PFYKZNTV" side="Top" angle="90" fixed="on">
				<ComponentRef name="P33_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="37.2" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P12" uniqueId="RWBKBJRU" side="Top" angle="90" fixed="on">
				<ComponentRef name="P12_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="14.34" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P7" uniqueId="HEZZXIRZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P7_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="72.76" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P79" uniqueId="CDIUAMEN" side="Top" angle="90" fixed="on">
				<ComponentRef name="P79_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="82.92" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_4" uniqueId="OQOSHZWR" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_4"/>
				<FootprintRef name="FreePadCell_4"/>
				<Org x="67.68" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_11" uniqueId="LWOFEXDZ" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_11"/>
				<FootprintRef name="FreePadCell_11"/>
				<Org x="21.96" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_18" uniqueId="UCCQNHZY" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_18"/>
				<FootprintRef name="FreePadCell_18"/>
				<Org x="85.46" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_25" uniqueId="CWFKVRFP" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_25"/>
				<FootprintRef name="FreePadCell_25"/>
				<Org x="65.14" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_32" uniqueId="CBOFOMGR" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_32"/>
				<FootprintRef name="FreePadCell_32"/>
				<Org x="49.9" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_39" uniqueId="ZAZZAMOC" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_39"/>
				<FootprintRef name="FreePadCell_39"/>
				<Org x="34.66" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_46" uniqueId="DJTERHJW" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_46"/>
				<FootprintRef name="FreePadCell_46"/>
				<Org x="54.98" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_53" uniqueId="AAPSSRZP" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_53"/>
				<FootprintRef name="FreePadCell_53"/>
				<Org x="39.74" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D20" uniqueId="KWBPOUDD" side="Bottom" angle="270">
				<ComponentRef name="D20_1"/>
				<FootprintRef name="H1806XM1241_Primary"/>
				<Org x="37.75" y="81.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DR3" uniqueId="VUEFXHTL" side="Bottom" angle="90">
				<ComponentRef name="DR3_1"/>
				<FootprintRef name="B19K2_Primary"/>
				<Org x="30" y="36.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D14" uniqueId="CDGQZBLR" side="Bottom" angle="90">
				<ComponentRef name="D14_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="51.25" y="74"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D5" uniqueId="JPPBRWWY" side="Bottom" angle="180">
				<ComponentRef name="D5_1"/>
				<FootprintRef name="1533LA2_Primary"/>
				<Org x="49" y="41"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P26" uniqueId="QXTJSILY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P26_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="50.25" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P57" uniqueId="TJJVHVUE" side="Top" angle="90" fixed="on">
				<ComponentRef name="P57_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="54" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P82" uniqueId="BXRHSNKX" side="Top" angle="90" fixed="on">
				<ComponentRef name="P82_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="62.75" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P46" uniqueId="SGWBYNUO" side="Top" angle="90" fixed="on">
				<ComponentRef name="P46_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="67.75" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P36" uniqueId="RCILPUDX" side="Top" angle="90" fixed="on">
				<ComponentRef name="P36_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="74" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C9" uniqueId="SROUQMSW" side="Top">
				<ComponentRef name="C9_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Org x="71.875" y="89.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C3" uniqueId="ZQKDPVJX" side="Bottom" angle="90">
				<ComponentRef name="C3_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Org x="66.25" y="67.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="11" uniqueId="BIQTUXLM" side="Top" angle="270">
				<ComponentRef name="11_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="21.625" y="38.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="3" uniqueId="QGBNAVPA" side="Top" angle="90">
				<ComponentRef name="3_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="35.5" y="50.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="K2" uniqueId="AVGRLSFX" side="Top" fixed="on">
				<ComponentRef name="K2_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="14.3" y="101"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P67" uniqueId="OGJQLUOF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P67_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="60.06" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P15" uniqueId="DQBGIJJT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P15_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="90.54" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P73" uniqueId="OYWNPORZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P73_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="32.12" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P58" uniqueId="UBSHLTPI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P58_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="32.12" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P9" uniqueId="CIHUKMBA" side="Top" angle="90" fixed="on">
				<ComponentRef name="P9_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="67.68" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P3" uniqueId="BYFJRUGA" side="Top" angle="90" fixed="on">
				<ComponentRef name="P3_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="82.92" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_1" uniqueId="GNIRIDPL" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_1"/>
				<FootprintRef name="FreePadCell_1"/>
				<Org x="75.3" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_8" uniqueId="SRNSMSGD" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_8"/>
				<FootprintRef name="FreePadCell_8"/>
				<Org x="52.44" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_15" uniqueId="CMNIWMFG" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_15"/>
				<FootprintRef name="FreePadCell_15"/>
				<Org x="60.06" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_22" uniqueId="NDTVFTGP" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_22"/>
				<FootprintRef name="FreePadCell_22"/>
				<Org x="70.22" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_29" uniqueId="AOALVCZQ" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_29"/>
				<FootprintRef name="FreePadCell_29"/>
				<Org x="57.52" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_36" uniqueId="SQAFSMPK" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_36"/>
				<FootprintRef name="FreePadCell_36"/>
				<Org x="39.74" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_43" uniqueId="ZAYVVALX" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_43"/>
				<FootprintRef name="FreePadCell_43"/>
				<Org x="57.52" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_50" uniqueId="DJYPRSKJ" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_50"/>
				<FootprintRef name="FreePadCell_50"/>
				<Org x="47.36" y="17.82"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_57" uniqueId="HUQDUQBW" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_57"/>
				<FootprintRef name="FreePadCell_57"/>
				<Org x="11.8" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D2" uniqueId="KXINUDJT" side="Top" angle="90">
				<ComponentRef name="D2_1"/>
				<FootprintRef name="556PT5_Primary"/>
				<Org x="44.75" y="29"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D11" uniqueId="YBLWEUYT" side="Top" angle="90">
				<ComponentRef name="D11_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="22.25" y="56.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D18" uniqueId="QYWLETQX" side="Bottom" angle="270">
				<ComponentRef name="D18_1"/>
				<FootprintRef name="1533AP6_Primary"/>
				<Org x="26.25" y="28.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P25" uniqueId="OKHZPHJN" side="Top" angle="90" fixed="on">
				<ComponentRef name="P25_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="44" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P22" uniqueId="RKCCCTQO" side="Top" angle="90" fixed="on">
				<ComponentRef name="P22_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="29" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P14" uniqueId="HOJMLIMW" side="Top" angle="90" fixed="on">
				<ComponentRef name="P14_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="40.25" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P41" uniqueId="QDADTTBJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P41_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="36.5" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P39" uniqueId="UMOPLXCF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P39_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="70.25" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P32" uniqueId="IIYNQGNA" side="Top" angle="90" fixed="on">
				<ComponentRef name="P32_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="51.5" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C7" uniqueId="ABIFFIOX" side="Bottom" angle="90">
				<ComponentRef name="C7_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Org x="36.25" y="67.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="12" uniqueId="TOALLVQC" side="Top" angle="180">
				<ComponentRef name="12_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="58.5" y="51"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="6" uniqueId="GDUPJTLU" side="Top" angle="270">
				<ComponentRef name="6_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="48.75" y="50.375"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="K5" uniqueId="QPXMOHJV" side="Top" fixed="on">
				<ComponentRef name="K5_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="73.5" y="102"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P60" uniqueId="GTDDAQME" side="Top" angle="90" fixed="on">
				<ComponentRef name="P60_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="24.5" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P50" uniqueId="DSMSTYCV" side="Top" angle="90" fixed="on">
				<ComponentRef name="P50_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="70.22" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P78" uniqueId="KCTTLKKD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P78_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="34.66" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P61" uniqueId="WQUMSDZG" side="Top" angle="90" fixed="on">
				<ComponentRef name="P61_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="19.42" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P87" uniqueId="HZXLOBDH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P87_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="32.12" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P6" uniqueId="DDCTZAEY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P6_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="75.3" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P75" uniqueId="HFWEXDZI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P75_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="88" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_5" uniqueId="WZYHVCUW" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_5"/>
				<FootprintRef name="FreePadCell_5"/>
				<Org x="60.06" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_12" uniqueId="KEUUYHRS" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_12"/>
				<FootprintRef name="FreePadCell_12"/>
				<Org x="44.82" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_19" uniqueId="MRCZLEMM" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_19"/>
				<FootprintRef name="FreePadCell_19"/>
				<Org x="80.38" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_26" uniqueId="ISCXGXFH" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_26"/>
				<FootprintRef name="FreePadCell_26"/>
				<Org x="62.6" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_33" uniqueId="CICLDEOT" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_33"/>
				<FootprintRef name="FreePadCell_33"/>
				<Org x="49.9" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_40" uniqueId="SQOWQVQG" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_40"/>
				<FootprintRef name="FreePadCell_40"/>
				<Org x="24.5" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_47" uniqueId="TODSIZZN" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_47"/>
				<FootprintRef name="FreePadCell_47"/>
				<Org x="49.9" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_54" uniqueId="CXFQNBTG" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_54"/>
				<FootprintRef name="FreePadCell_54"/>
				<Org x="42.28" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D8" uniqueId="HXOPOVXV" side="Top">
				<ComponentRef name="D8_1"/>
				<FootprintRef name="1533TM2_Primary"/>
				<Org x="81" y="94"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DR2" uniqueId="OFRSTDCV" side="Bottom" angle="90">
				<ComponentRef name="DR2_1"/>
				<FootprintRef name="B19K2_Primary"/>
				<Org x="49" y="36.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D15" uniqueId="ILIDDRAX" side="Top" angle="90">
				<ComponentRef name="D15_1"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="51.25" y="56.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D4" uniqueId="VYUKHHUV" side="Bottom">
				<ComponentRef name="D4_1"/>
				<FootprintRef name="1533LA2_Primary"/>
				<Org x="86" y="48.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P21" uniqueId="AFRTOGFM" side="Top" angle="90" fixed="on">
				<ComponentRef name="P21_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="27.75" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P54" uniqueId="MYRQBBCW" side="Top" angle="90" fixed="on">
				<ComponentRef name="P54_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="61.5" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P81" uniqueId="JCFBXWGG" side="Top" angle="90" fixed="on">
				<ComponentRef name="P81_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="57.75" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P45" uniqueId="QQGIRVSK" side="Top" angle="90" fixed="on">
				<ComponentRef name="P45_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="65.25" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P37" uniqueId="UWYATGDM" side="Top" angle="90" fixed="on">
				<ComponentRef name="P37_1"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="72.75" y="93.75"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C4" uniqueId="IWCIORMA" side="Bottom" angle="270">
				<ComponentRef name="C4_1"/>
				<FootprintRef name="0.1M_auto"/>
				<Org x="68.25" y="36.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R5" uniqueId="BVQBKBJG" side="Bottom" angle="270">
				<ComponentRef name="R5_1"/>
				<FootprintRef name="P1_12_0.25_auto"/>
				<Org x="63.25" y="37.5"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="9" uniqueId="SSCVLUHP" side="Top" angle="180">
				<ComponentRef name="9_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="82.75" y="51.25"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="2" uniqueId="BKEJOSMT" side="Top" angle="90">
				<ComponentRef name="2_1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="36.25" y="52.125"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="K3" uniqueId="UHKXTWSZ" side="Top" fixed="on">
				<ComponentRef name="K3_1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="88" y="101"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P66" uniqueId="TBSMNQLH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P66_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="75.3" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P10" uniqueId="FODREUPK" side="Top" angle="90" fixed="on">
				<ComponentRef name="P10_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="37.2" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P74" uniqueId="QOUFXILJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P74_1"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="80.38" y="17.84"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P16" uniqueId="VJMPUOMB" side="Top" angle="90" fixed="on">
				<ComponentRef name="P16_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="60.06" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P49" uniqueId="UUGRIVFS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P49_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="21.96" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="P2" uniqueId="VNADWWWA" side="Top" angle="90" fixed="on">
				<ComponentRef name="P2_1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="85.46" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_2" uniqueId="JJXLTOKJ" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_2"/>
				<FootprintRef name="FreePadCell_2"/>
				<Org x="75.3" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_9" uniqueId="PFRRDPOK" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_9"/>
				<FootprintRef name="FreePadCell_9"/>
				<Org x="37.2" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_16" uniqueId="OWPQIUHD" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_16"/>
				<FootprintRef name="FreePadCell_16"/>
				<Org x="52.44" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_23" uniqueId="EPEYVCMY" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_23"/>
				<FootprintRef name="FreePadCell_23"/>
				<Org x="70.22" y="23.02"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_30" uniqueId="FXBLAJHS" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_30"/>
				<FootprintRef name="FreePadCell_30"/>
				<Org x="54.98" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_37" uniqueId="YCEUSRHF" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_37"/>
				<FootprintRef name="FreePadCell_37"/>
				<Org x="42.28" y="15.3"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_44" uniqueId="RQHRIGTG" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_44"/>
				<FootprintRef name="FreePadCell_44"/>
				<Org x="57.52" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="FreePad_51" uniqueId="BIQTGIBO" side="Top" fixed="on">
				<ComponentRef name="FreePadPart_51"/>
				<FootprintRef name="FreePadCell_51"/>
				<Org x="42.28" y="20.48"/>
				<Attributes>
					<Attribute name="ALLOWED_MOUNT_SIDE" value="BOTH"/>
				</Attributes>
			</CompInstance>
		</Components>
	</ComponentsOnBoard>

	<NetList version="2.0">
		<Net name="1">
			<PinRef compName="D1" pinName="8"/>
			<PinRef compName="P1" pinName="1"/>
			<PinRef compName="D3" pinName="8"/>
			<PinRef compName="D2" pinName="8"/>
		</Net>
		<Net name="56">
			<PinRef compName="D6" pinName="12"/>
			<PinRef compName="D3" pinName="17"/>
			<PinRef compName="DR3" pinName="8"/>
		</Net>
		<Net name="55">
			<PinRef compName="D6" pinName="11"/>
			<PinRef compName="D3" pinName="16"/>
			<PinRef compName="DR3" pinName="7"/>
		</Net>
		<Net name="54">
			<PinRef compName="D6" pinName="6"/>
			<PinRef compName="D3" pinName="15"/>
			<PinRef compName="DR3" pinName="6"/>
		</Net>
		<Net name="58">
			<PinRef compName="D19" pinName="1"/>
			<PinRef compName="D10" pinName="2"/>
			<PinRef compName="D18" pinName="1"/>
			<PinRef compName="R5" pinName="1"/>
		</Net>
		<Net name="53">
			<PinRef compName="D6" pinName="5"/>
			<PinRef compName="D3" pinName="14"/>
			<PinRef compName="DR3" pinName="5"/>
		</Net>
		<Net name="32">
			<PinRef compName="D19" pinName="9"/>
			<PinRef compName="P64" pinName="1"/>
		</Net>
		<Net name="31">
			<PinRef compName="D19" pinName="8"/>
			<PinRef compName="P66" pinName="1"/>
		</Net>
		<Net name="30">
			<PinRef compName="D19" pinName="7"/>
			<PinRef compName="P65" pinName="1"/>
		</Net>
		<Net name="29">
			<PinRef compName="D19" pinName="6"/>
			<PinRef compName="P50" pinName="1"/>
		</Net>
		<Net name="28">
			<PinRef compName="D19" pinName="5"/>
			<PinRef compName="P69" pinName="1"/>
		</Net>
		<Net name="26">
			<PinRef compName="D19" pinName="3"/>
			<PinRef compName="P51" pinName="1"/>
		</Net>
		<Net name="27">
			<PinRef compName="D19" pinName="4"/>
			<PinRef compName="P68" pinName="1"/>
		</Net>
		<Net name="25">
			<PinRef compName="D19" pinName="2"/>
			<PinRef compName="P67" pinName="1"/>
		</Net>
		<Net name="24">
			<PinRef compName="P63" pinName="1"/>
			<PinRef compName="D18" pinName="9"/>
		</Net>
		<Net name="23">
			<PinRef compName="P62" pinName="1"/>
			<PinRef compName="D18" pinName="8"/>
		</Net>
		<Net name="22">
			<PinRef compName="D18" pinName="7"/>
			<PinRef compName="P61" pinName="1"/>
		</Net>
		<Net name="21">
			<PinRef compName="D18" pinName="6"/>
			<PinRef compName="P49" pinName="1"/>
		</Net>
		<Net name="20">
			<PinRef compName="D18" pinName="5"/>
			<PinRef compName="P60" pinName="1"/>
		</Net>
		<Net name="18">
			<PinRef compName="P48" pinName="1"/>
			<PinRef compName="D18" pinName="3"/>
		</Net>
		<Net name="19">
			<PinRef compName="P59" pinName="1"/>
			<PinRef compName="D18" pinName="4"/>
		</Net>
		<Net name="52">
			<PinRef compName="D6" pinName="4"/>
			<PinRef compName="D3" pinName="13"/>
			<PinRef compName="DR3" pinName="4"/>
		</Net>
		<Net name="51">
			<PinRef compName="D6" pinName="3"/>
			<PinRef compName="D3" pinName="11"/>
			<PinRef compName="DR3" pinName="3"/>
		</Net>
		<Net name="50">
			<PinRef compName="D6" pinName="2"/>
			<PinRef compName="D3" pinName="10"/>
			<PinRef compName="D10" pinName="5"/>
			<PinRef compName="DR3" pinName="2"/>
		</Net>
		<Net name="48">
			<PinRef compName="D5" pinName="12"/>
			<PinRef compName="D2" pinName="17"/>
			<PinRef compName="DR2" pinName="8"/>
		</Net>
		<Net name="16">
			<PinRef compName="D10" pinName="4"/>
			<PinRef compName="P33" pinName="1"/>
		</Net>
		<Net name="15">
			<PinRef compName="P30" pinName="1"/>
			<PinRef compName="D20" pinName="24"/>
		</Net>
		<Net name="14">
			<PinRef compName="P11" pinName="1"/>
			<PinRef compName="D3" pinName="20"/>
		</Net>
		<Net name="13">
			<PinRef compName="D1" pinName="20"/>
			<PinRef compName="P18" pinName="1"/>
			<PinRef compName="D2" pinName="20"/>
			<PinRef compName="6" pinName="1"/>
			<PinRef compName="9" pinName="1"/>
		</Net>
		<Net name="17">
			<PinRef compName="P58" pinName="1"/>
			<PinRef compName="D18" pinName="2"/>
		</Net>
		<Net name="12">
			<PinRef compName="D7" pinName="3"/>
			<PinRef compName="P85" pinName="1"/>
			<PinRef compName="P16" pinName="1"/>
		</Net>
		<Net name="11">
			<PinRef compName="D1" pinName="21"/>
			<PinRef compName="5" pinName="1"/>
			<PinRef compName="10" pinName="1"/>
			<PinRef compName="D3" pinName="21"/>
			<PinRef compName="D2" pinName="21"/>
			<PinRef compName="2" pinName="1"/>
			<PinRef compName="P10" pinName="1"/>
		</Net>
		<Net name="10">
			<PinRef compName="D1" pinName="18"/>
			<PinRef compName="8" pinName="1"/>
			<PinRef compName="P17" pinName="1"/>
			<PinRef compName="D3" pinName="18"/>
			<PinRef compName="7" pinName="1"/>
			<PinRef compName="3" pinName="1"/>
			<PinRef compName="D2" pinName="18"/>
		</Net>
		<Net name="9">
			<PinRef compName="D1" pinName="23"/>
			<PinRef compName="13" pinName="1"/>
			<PinRef compName="1" pinName="1"/>
			<PinRef compName="4" pinName="1"/>
			<PinRef compName="D3" pinName="23"/>
			<PinRef compName="P9" pinName="1"/>
			<PinRef compName="D2" pinName="23"/>
		</Net>
		<Net name="8">
			<PinRef compName="D1" pinName="1"/>
			<PinRef compName="P8" pinName="1"/>
			<PinRef compName="D3" pinName="1"/>
			<PinRef compName="D2" pinName="1"/>
		</Net>
		<Net name="7">
			<PinRef compName="D1" pinName="2"/>
			<PinRef compName="D3" pinName="2"/>
			<PinRef compName="P7" pinName="1"/>
			<PinRef compName="D2" pinName="2"/>
		</Net>
		<Net name="6">
			<PinRef compName="D1" pinName="3"/>
			<PinRef compName="D3" pinName="3"/>
			<PinRef compName="D2" pinName="3"/>
			<PinRef compName="P6" pinName="1"/>
		</Net>
		<Net name="5">
			<PinRef compName="D1" pinName="4"/>
			<PinRef compName="P5" pinName="1"/>
			<PinRef compName="D3" pinName="4"/>
			<PinRef compName="D2" pinName="4"/>
		</Net>
		<Net name="2">
			<PinRef compName="D1" pinName="7"/>
			<PinRef compName="D3" pinName="7"/>
			<PinRef compName="D2" pinName="7"/>
			<PinRef compName="P2" pinName="1"/>
		</Net>
		<Net name="3">
			<PinRef compName="D1" pinName="6"/>
			<PinRef compName="D3" pinName="6"/>
			<PinRef compName="P3" pinName="1"/>
			<PinRef compName="D2" pinName="6"/>
		</Net>
		<Net name="4">
			<PinRef compName="D1" pinName="5"/>
			<PinRef compName="P4" pinName="1"/>
			<PinRef compName="D3" pinName="5"/>
			<PinRef compName="D2" pinName="5"/>
		</Net>
		<Net name="GND">
			<PinRef compName="D1" pinName="12"/>
			<PinRef compName="D16" pinName="21"/>
			<PinRef compName="D19" pinName="10"/>
			<PinRef compName="D19" pinName="19"/>
			<PinRef compName="C10" pinName="1"/>
			<PinRef compName="C1" pinName="1"/>
			<PinRef compName="P71" pinName="1"/>
			<PinRef compName="P76" pinName="1"/>
			<PinRef compName="D7" pinName="7"/>
			<PinRef compName="D12" pinName="21"/>
			<PinRef compName="D9" pinName="7"/>
			<PinRef compName="C5" pinName="1"/>
			<PinRef compName="P38" pinName="1"/>
			<PinRef compName="C12" pinName="2"/>
			<PinRef compName="D17" pinName="21"/>
			<PinRef compName="D6" pinName="7"/>
			<PinRef compName="C8" pinName="1"/>
			<PinRef compName="C2" pinName="1"/>
			<PinRef compName="P72" pinName="1"/>
			<PinRef compName="P77" pinName="1"/>
			<PinRef compName="D3" pinName="12"/>
			<PinRef compName="D13" pinName="21"/>
			<PinRef compName="D10" pinName="7"/>
			<PinRef compName="C6" pinName="1"/>
			<PinRef compName="D20" pinName="19"/>
			<PinRef compName="D20" pinName="20"/>
			<PinRef compName="D20" pinName="21"/>
			<PinRef compName="D14" pinName="21"/>
			<PinRef compName="D5" pinName="7"/>
			<PinRef compName="C9" pinName="1"/>
			<PinRef compName="C3" pinName="1"/>
			<PinRef compName="P15" pinName="1"/>
			<PinRef compName="P73" pinName="1"/>
			<PinRef compName="D2" pinName="12"/>
			<PinRef compName="D11" pinName="21"/>
			<PinRef compName="D18" pinName="10"/>
			<PinRef compName="D18" pinName="19"/>
			<PinRef compName="C7" pinName="1"/>
			<PinRef compName="P78" pinName="1"/>
			<PinRef compName="P75" pinName="1"/>
			<PinRef compName="D8" pinName="7"/>
			<PinRef compName="D15" pinName="21"/>
			<PinRef compName="D4" pinName="7"/>
			<PinRef compName="P37" pinName="1"/>
			<PinRef compName="C4" pinName="1"/>
			<PinRef compName="P74" pinName="1"/>
		</Net>
		<Net name="60">
			<PinRef compName="D17" pinName="6"/>
			<PinRef compName="D17" pinName="7"/>
			<PinRef compName="P47" pinName="1"/>
		</Net>
		<Net name="33">
			<PinRef compName="P13" pinName="1"/>
			<PinRef compName="D20" pinName="11"/>
		</Net>
		<Net name="59">
			<PinRef compName="P55" pinName="1"/>
			<PinRef compName="D17" pinName="35"/>
			<PinRef compName="D17" pinName="36"/>
		</Net>
		<Net name="47">
			<PinRef compName="P29" pinName="1"/>
			<PinRef compName="D20" pinName="25"/>
		</Net>
		<Net name="46">
			<PinRef compName="D20" pinName="26"/>
			<PinRef compName="P25" pinName="1"/>
		</Net>
		<Net name="45">
			<PinRef compName="P28" pinName="1"/>
			<PinRef compName="D20" pinName="27"/>
		</Net>
		<Net name="44">
			<PinRef compName="P27" pinName="1"/>
			<PinRef compName="D20" pinName="28"/>
		</Net>
		<Net name="43">
			<PinRef compName="D20" pinName="29"/>
			<PinRef compName="P26" pinName="1"/>
		</Net>
		<Net name="42">
			<PinRef compName="D20" pinName="30"/>
			<PinRef compName="P32" pinName="1"/>
		</Net>
		<Net name="34">
			<PinRef compName="D20" pinName="12"/>
			<PinRef compName="P14" pinName="1"/>
		</Net>
		<Net name="41">
			<PinRef compName="P31" pinName="1"/>
			<PinRef compName="D20" pinName="31"/>
		</Net>
		<Net name="40">
			<PinRef compName="P24" pinName="1"/>
			<PinRef compName="D20" pinName="18"/>
		</Net>
		<Net name="39">
			<PinRef compName="P23" pinName="1"/>
			<PinRef compName="D20" pinName="17"/>
		</Net>
		<Net name="38">
			<PinRef compName="D20" pinName="16"/>
			<PinRef compName="P22" pinName="1"/>
		</Net>
		<Net name="35">
			<PinRef compName="P19" pinName="1"/>
			<PinRef compName="D20" pinName="13"/>
		</Net>
		<Net name="117">
			<PinRef compName="D10" pinName="8"/>
			<PinRef compName="R6" pinName="1"/>
			<PinRef compName="D20" pinName="41"/>
		</Net>
		<Net name="36">
			<PinRef compName="P20" pinName="1"/>
			<PinRef compName="D20" pinName="14"/>
		</Net>
		<Net name="116">
			<PinRef compName="P86" pinName="1"/>
			<PinRef compName="P56" pinName="1"/>
		</Net>
		<Net name="115">
			<PinRef compName="P57" pinName="1"/>
			<PinRef compName="P87" pinName="1"/>
		</Net>
		<Net name="114">
			<PinRef compName="D10" pinName="9"/>
			<PinRef compName="D20" pinName="23"/>
			<PinRef compName="D5" pinName="11"/>
			<PinRef compName="D2" pinName="16"/>
			<PinRef compName="DR2" pinName="7"/>
		</Net>
		<Net name="113">
			<PinRef compName="D16" pinName="27"/>
			<PinRef compName="D16" pinName="28"/>
			<PinRef compName="D5" pinName="6"/>
			<PinRef compName="D2" pinName="15"/>
			<PinRef compName="DR2" pinName="6"/>
		</Net>
		<Net name="112">
			<PinRef compName="D16" pinName="6"/>
			<PinRef compName="D16" pinName="7"/>
			<PinRef compName="P54" pinName="1"/>
		</Net>
		<Net name="110">
			<PinRef compName="D16" pinName="14"/>
			<PinRef compName="D16" pinName="15"/>
			<PinRef compName="D5" pinName="5"/>
			<PinRef compName="D2" pinName="14"/>
			<PinRef compName="DR2" pinName="5"/>
		</Net>
		<Net name="111">
			<PinRef compName="D16" pinName="35"/>
			<PinRef compName="D16" pinName="36"/>
			<PinRef compName="P82" pinName="1"/>
		</Net>
		<Net name="94">
			<PinRef compName="D16" pinName="24"/>
			<PinRef compName="D19" pinName="11"/>
			<PinRef compName="D12" pinName="24"/>
			<PinRef compName="D17" pinName="24"/>
			<PinRef compName="D13" pinName="24"/>
			<PinRef compName="D20" pinName="32"/>
			<PinRef compName="D14" pinName="24"/>
			<PinRef compName="D11" pinName="24"/>
			<PinRef compName="D15" pinName="24"/>
		</Net>
		<Net name="93">
			<PinRef compName="D16" pinName="23"/>
			<PinRef compName="D19" pinName="12"/>
			<PinRef compName="D12" pinName="23"/>
			<PinRef compName="D17" pinName="23"/>
			<PinRef compName="D13" pinName="23"/>
			<PinRef compName="D20" pinName="33"/>
			<PinRef compName="D14" pinName="23"/>
			<PinRef compName="D11" pinName="23"/>
			<PinRef compName="D15" pinName="23"/>
		</Net>
		<Net name="92">
			<PinRef compName="D16" pinName="22"/>
			<PinRef compName="D19" pinName="13"/>
			<PinRef compName="D12" pinName="22"/>
			<PinRef compName="D17" pinName="22"/>
			<PinRef compName="D13" pinName="22"/>
			<PinRef compName="D20" pinName="34"/>
			<PinRef compName="D14" pinName="22"/>
			<PinRef compName="D11" pinName="22"/>
			<PinRef compName="D15" pinName="22"/>
		</Net>
		<Net name="91">
			<PinRef compName="D16" pinName="20"/>
			<PinRef compName="D19" pinName="14"/>
			<PinRef compName="D12" pinName="20"/>
			<PinRef compName="D17" pinName="20"/>
			<PinRef compName="D13" pinName="20"/>
			<PinRef compName="D20" pinName="35"/>
			<PinRef compName="D14" pinName="20"/>
			<PinRef compName="D11" pinName="20"/>
			<PinRef compName="D15" pinName="20"/>
		</Net>
		<Net name="90">
			<PinRef compName="D16" pinName="19"/>
			<PinRef compName="D19" pinName="15"/>
			<PinRef compName="D12" pinName="19"/>
			<PinRef compName="D17" pinName="19"/>
			<PinRef compName="D13" pinName="19"/>
			<PinRef compName="D20" pinName="36"/>
			<PinRef compName="D14" pinName="19"/>
			<PinRef compName="D11" pinName="19"/>
			<PinRef compName="D15" pinName="19"/>
		</Net>
		<Net name="89">
			<PinRef compName="D16" pinName="18"/>
			<PinRef compName="D19" pinName="16"/>
			<PinRef compName="D12" pinName="18"/>
			<PinRef compName="D17" pinName="18"/>
			<PinRef compName="D13" pinName="18"/>
			<PinRef compName="D20" pinName="37"/>
			<PinRef compName="D14" pinName="18"/>
			<PinRef compName="D11" pinName="18"/>
			<PinRef compName="D15" pinName="18"/>
		</Net>
		<Net name="88">
			<PinRef compName="D16" pinName="17"/>
			<PinRef compName="D19" pinName="17"/>
			<PinRef compName="D12" pinName="17"/>
			<PinRef compName="D17" pinName="17"/>
			<PinRef compName="D13" pinName="17"/>
			<PinRef compName="D20" pinName="38"/>
			<PinRef compName="D14" pinName="17"/>
			<PinRef compName="D11" pinName="17"/>
			<PinRef compName="D15" pinName="17"/>
		</Net>
		<Net name="87">
			<PinRef compName="D16" pinName="16"/>
			<PinRef compName="D19" pinName="18"/>
			<PinRef compName="D12" pinName="16"/>
			<PinRef compName="D17" pinName="16"/>
			<PinRef compName="D13" pinName="16"/>
			<PinRef compName="D20" pinName="39"/>
			<PinRef compName="D14" pinName="16"/>
			<PinRef compName="D11" pinName="16"/>
			<PinRef compName="D15" pinName="16"/>
		</Net>
		<Net name="86">
			<PinRef compName="D16" pinName="37"/>
			<PinRef compName="D12" pinName="37"/>
			<PinRef compName="D17" pinName="37"/>
			<PinRef compName="D13" pinName="37"/>
			<PinRef compName="D20" pinName="10"/>
			<PinRef compName="D14" pinName="37"/>
			<PinRef compName="D11" pinName="37"/>
			<PinRef compName="D18" pinName="11"/>
			<PinRef compName="D15" pinName="37"/>
		</Net>
		<Net name="85">
			<PinRef compName="D16" pinName="38"/>
			<PinRef compName="D12" pinName="38"/>
			<PinRef compName="D17" pinName="38"/>
			<PinRef compName="D13" pinName="38"/>
			<PinRef compName="D20" pinName="9"/>
			<PinRef compName="D14" pinName="38"/>
			<PinRef compName="D11" pinName="38"/>
			<PinRef compName="D18" pinName="12"/>
			<PinRef compName="D15" pinName="38"/>
		</Net>
		<Net name="84">
			<PinRef compName="D16" pinName="39"/>
			<PinRef compName="D12" pinName="39"/>
			<PinRef compName="D17" pinName="39"/>
			<PinRef compName="D13" pinName="39"/>
			<PinRef compName="D20" pinName="8"/>
			<PinRef compName="D14" pinName="39"/>
			<PinRef compName="D11" pinName="39"/>
			<PinRef compName="D18" pinName="13"/>
			<PinRef compName="D15" pinName="39"/>
		</Net>
		<Net name="83">
			<PinRef compName="D16" pinName="40"/>
			<PinRef compName="D12" pinName="40"/>
			<PinRef compName="D17" pinName="40"/>
			<PinRef compName="D13" pinName="40"/>
			<PinRef compName="D20" pinName="7"/>
			<PinRef compName="D14" pinName="40"/>
			<PinRef compName="D11" pinName="40"/>
			<PinRef compName="D18" pinName="14"/>
			<PinRef compName="D15" pinName="40"/>
		</Net>
		<Net name="82">
			<PinRef compName="D16" pinName="41"/>
			<PinRef compName="D12" pinName="41"/>
			<PinRef compName="D17" pinName="41"/>
			<PinRef compName="D13" pinName="41"/>
			<PinRef compName="D20" pinName="6"/>
			<PinRef compName="D14" pinName="41"/>
			<PinRef compName="D11" pinName="41"/>
			<PinRef compName="D18" pinName="15"/>
			<PinRef compName="D15" pinName="41"/>
		</Net>
		<Net name="81">
			<PinRef compName="D16" pinName="3"/>
			<PinRef compName="D12" pinName="3"/>
			<PinRef compName="D17" pinName="3"/>
			<PinRef compName="D13" pinName="3"/>
			<PinRef compName="D20" pinName="5"/>
			<PinRef compName="D14" pinName="3"/>
			<PinRef compName="D11" pinName="3"/>
			<PinRef compName="D18" pinName="16"/>
			<PinRef compName="D15" pinName="3"/>
		</Net>
		<Net name="80">
			<PinRef compName="D16" pinName="2"/>
			<PinRef compName="D12" pinName="2"/>
			<PinRef compName="D17" pinName="2"/>
			<PinRef compName="D13" pinName="2"/>
			<PinRef compName="D20" pinName="4"/>
			<PinRef compName="D14" pinName="2"/>
			<PinRef compName="D11" pinName="2"/>
			<PinRef compName="D18" pinName="17"/>
			<PinRef compName="D15" pinName="2"/>
		</Net>
		<Net name="79">
			<PinRef compName="D16" pinName="1"/>
			<PinRef compName="D12" pinName="1"/>
			<PinRef compName="D17" pinName="1"/>
			<PinRef compName="D13" pinName="1"/>
			<PinRef compName="D20" pinName="3"/>
			<PinRef compName="D14" pinName="1"/>
			<PinRef compName="D11" pinName="1"/>
			<PinRef compName="D18" pinName="18"/>
			<PinRef compName="D15" pinName="1"/>
		</Net>
		<Net name="78">
			<PinRef compName="P43" pinName="1"/>
			<PinRef compName="D15" pinName="6"/>
			<PinRef compName="D15" pinName="7"/>
		</Net>
		<Net name="77">
			<PinRef compName="P53" pinName="1"/>
			<PinRef compName="D15" pinName="35"/>
			<PinRef compName="D15" pinName="36"/>
		</Net>
		<Net name="76">
			<PinRef compName="D14" pinName="6"/>
			<PinRef compName="D14" pinName="7"/>
			<PinRef compName="P81" pinName="1"/>
		</Net>
		<Net name="75">
			<PinRef compName="P70" pinName="1"/>
			<PinRef compName="D14" pinName="35"/>
			<PinRef compName="D14" pinName="36"/>
		</Net>
		<Net name="74">
			<PinRef compName="D13" pinName="6"/>
			<PinRef compName="D13" pinName="7"/>
			<PinRef compName="P42" pinName="1"/>
		</Net>
		<Net name="73">
			<PinRef compName="P40" pinName="1"/>
			<PinRef compName="D13" pinName="35"/>
			<PinRef compName="D13" pinName="36"/>
		</Net>
		<Net name="72">
			<PinRef compName="D12" pinName="6"/>
			<PinRef compName="D12" pinName="7"/>
			<PinRef compName="P46" pinName="1"/>
		</Net>
		<Net name="71">
			<PinRef compName="D12" pinName="35"/>
			<PinRef compName="D12" pinName="36"/>
			<PinRef compName="P45" pinName="1"/>
		</Net>
		<Net name="70">
			<PinRef compName="D11" pinName="6"/>
			<PinRef compName="D11" pinName="7"/>
			<PinRef compName="P41" pinName="1"/>
		</Net>
		<Net name="69">
			<PinRef compName="P44" pinName="1"/>
			<PinRef compName="D11" pinName="35"/>
			<PinRef compName="D11" pinName="36"/>
		</Net>
		<Net name="NET00032">
			<PinRef compName="D8" pinName="8"/>
			<PinRef compName="D8" pinName="12"/>
		</Net>
		<Net name="NET00030">
			<PinRef compName="D7" pinName="8"/>
			<PinRef compName="D7" pinName="12"/>
		</Net>
		<Net name="108">
			<PinRef compName="P34" pinName="1"/>
			<PinRef compName="D8" pinName="5"/>
			<PinRef compName="D8" pinName="11"/>
		</Net>
		<Net name="+5B">
			<PinRef compName="D1" pinName="19"/>
			<PinRef compName="D1" pinName="24"/>
			<PinRef compName="D16" pinName="8"/>
			<PinRef compName="D16" pinName="26"/>
			<PinRef compName="D16" pinName="34"/>
			<PinRef compName="D16" pinName="42"/>
			<PinRef compName="D19" pinName="20"/>
			<PinRef compName="C10" pinName="2"/>
			<PinRef compName="C1" pinName="2"/>
			<PinRef compName="D7" pinName="1"/>
			<PinRef compName="D7" pinName="4"/>
			<PinRef compName="D7" pinName="10"/>
			<PinRef compName="D7" pinName="13"/>
			<PinRef compName="D7" pinName="14"/>
			<PinRef compName="D12" pinName="8"/>
			<PinRef compName="D12" pinName="26"/>
			<PinRef compName="D12" pinName="34"/>
			<PinRef compName="D12" pinName="42"/>
			<PinRef compName="D9" pinName="14"/>
			<PinRef compName="C5" pinName="2"/>
			<PinRef compName="R4" pinName="2"/>
			<PinRef compName="C12" pinName="1"/>
			<PinRef compName="DR1" pinName="9"/>
			<PinRef compName="D17" pinName="8"/>
			<PinRef compName="D17" pinName="26"/>
			<PinRef compName="D17" pinName="34"/>
			<PinRef compName="D17" pinName="42"/>
			<PinRef compName="D6" pinName="14"/>
			<PinRef compName="C8" pinName="2"/>
			<PinRef compName="C2" pinName="2"/>
			<PinRef compName="P80" pinName="1"/>
			<PinRef compName="D3" pinName="19"/>
			<PinRef compName="D3" pinName="24"/>
			<PinRef compName="D13" pinName="8"/>
			<PinRef compName="D13" pinName="26"/>
			<PinRef compName="D13" pinName="34"/>
			<PinRef compName="D13" pinName="42"/>
			<PinRef compName="D10" pinName="14"/>
			<PinRef compName="C6" pinName="2"/>
			<PinRef compName="R6" pinName="2"/>
			<PinRef compName="P52" pinName="1"/>
			<PinRef compName="P79" pinName="1"/>
			<PinRef compName="D20" pinName="2"/>
			<PinRef compName="D20" pinName="22"/>
			<PinRef compName="D20" pinName="40"/>
			<PinRef compName="D20" pinName="42"/>
			<PinRef compName="DR3" pinName="9"/>
			<PinRef compName="D14" pinName="8"/>
			<PinRef compName="D14" pinName="26"/>
			<PinRef compName="D14" pinName="34"/>
			<PinRef compName="D14" pinName="42"/>
			<PinRef compName="D5" pinName="14"/>
			<PinRef compName="P36" pinName="1"/>
			<PinRef compName="C9" pinName="2"/>
			<PinRef compName="C3" pinName="2"/>
			<PinRef compName="D2" pinName="19"/>
			<PinRef compName="D2" pinName="24"/>
			<PinRef compName="D11" pinName="8"/>
			<PinRef compName="D11" pinName="26"/>
			<PinRef compName="D11" pinName="34"/>
			<PinRef compName="D11" pinName="42"/>
			<PinRef compName="D18" pinName="20"/>
			<PinRef compName="C7" pinName="2"/>
			<PinRef compName="D8" pinName="1"/>
			<PinRef compName="D8" pinName="4"/>
			<PinRef compName="D8" pinName="10"/>
			<PinRef compName="D8" pinName="13"/>
			<PinRef compName="D8" pinName="14"/>
			<PinRef compName="DR2" pinName="9"/>
			<PinRef compName="D15" pinName="8"/>
			<PinRef compName="D15" pinName="26"/>
			<PinRef compName="D15" pinName="34"/>
			<PinRef compName="D15" pinName="42"/>
			<PinRef compName="D4" pinName="14"/>
			<PinRef compName="C4" pinName="2"/>
			<PinRef compName="R5" pinName="2"/>
		</Net>
		<Net name="NET00031">
			<PinRef compName="D8" pinName="2"/>
			<PinRef compName="D8" pinName="6"/>
		</Net>
		<Net name="37">
			<PinRef compName="D20" pinName="15"/>
			<PinRef compName="P21" pinName="1"/>
		</Net>
		<Net name="NET00026">
			<PinRef compName="D7" pinName="2"/>
			<PinRef compName="D7" pinName="6"/>
		</Net>
		<Net name="57">
			<PinRef compName="R4" pinName="1"/>
			<PinRef compName="D10" pinName="6"/>
			<PinRef compName="D20" pinName="1"/>
		</Net>
		<Net name="109">
			<PinRef compName="D7" pinName="9"/>
			<PinRef compName="P39" pinName="1"/>
			<PinRef compName="D8" pinName="3"/>
		</Net>
		<Net name="68">
			<PinRef compName="D16" pinName="4"/>
			<PinRef compName="D7" pinName="5"/>
			<PinRef compName="D7" pinName="11"/>
			<PinRef compName="D12" pinName="4"/>
			<PinRef compName="D17" pinName="4"/>
			<PinRef compName="P35" pinName="1"/>
			<PinRef compName="D13" pinName="4"/>
			<PinRef compName="D14" pinName="4"/>
			<PinRef compName="D11" pinName="4"/>
			<PinRef compName="D15" pinName="4"/>
		</Net>
		<Net name="107">
			<PinRef compName="D17" pinName="27"/>
			<PinRef compName="D17" pinName="28"/>
			<PinRef compName="D5" pinName="4"/>
			<PinRef compName="D2" pinName="13"/>
			<PinRef compName="12" pinName="1"/>
			<PinRef compName="DR2" pinName="4"/>
		</Net>
		<Net name="67">
			<PinRef compName="D16" pinName="5"/>
			<PinRef compName="D12" pinName="5"/>
			<PinRef compName="D17" pinName="5"/>
			<PinRef compName="D6" pinName="1"/>
			<PinRef compName="D3" pinName="9"/>
			<PinRef compName="D13" pinName="5"/>
			<PinRef compName="DR3" pinName="1"/>
			<PinRef compName="D14" pinName="5"/>
			<PinRef compName="D11" pinName="5"/>
			<PinRef compName="D15" pinName="5"/>
		</Net>
		<Net name="106">
			<PinRef compName="D17" pinName="14"/>
			<PinRef compName="D17" pinName="15"/>
			<PinRef compName="D5" pinName="3"/>
			<PinRef compName="11" pinName="1"/>
			<PinRef compName="D2" pinName="11"/>
			<PinRef compName="DR2" pinName="3"/>
		</Net>
		<Net name="66">
			<PinRef compName="D16" pinName="25"/>
			<PinRef compName="D12" pinName="25"/>
			<PinRef compName="D17" pinName="25"/>
			<PinRef compName="D13" pinName="25"/>
			<PinRef compName="P12" pinName="1"/>
			<PinRef compName="D14" pinName="25"/>
			<PinRef compName="D11" pinName="25"/>
			<PinRef compName="D15" pinName="25"/>
		</Net>
		<Net name="104">
			<PinRef compName="D5" pinName="2"/>
			<PinRef compName="D2" pinName="10"/>
			<PinRef compName="DR2" pinName="2"/>
			<PinRef compName="D15" pinName="27"/>
			<PinRef compName="D15" pinName="28"/>
		</Net>
		<Net name="103">
			<PinRef compName="D5" pinName="1"/>
			<PinRef compName="D2" pinName="9"/>
			<PinRef compName="DR2" pinName="1"/>
			<PinRef compName="D15" pinName="14"/>
			<PinRef compName="D15" pinName="15"/>
		</Net>
		<Net name="102">
			<PinRef compName="D1" pinName="17"/>
			<PinRef compName="DR1" pinName="8"/>
			<PinRef compName="D14" pinName="27"/>
			<PinRef compName="D14" pinName="28"/>
			<PinRef compName="D4" pinName="12"/>
		</Net>
		<Net name="101">
			<PinRef compName="D1" pinName="16"/>
			<PinRef compName="DR1" pinName="7"/>
			<PinRef compName="D14" pinName="14"/>
			<PinRef compName="D14" pinName="15"/>
			<PinRef compName="D4" pinName="11"/>
		</Net>
		<Net name="100">
			<PinRef compName="D1" pinName="15"/>
			<PinRef compName="DR1" pinName="6"/>
			<PinRef compName="D13" pinName="27"/>
			<PinRef compName="D13" pinName="28"/>
			<PinRef compName="D4" pinName="6"/>
		</Net>
		<Net name="99">
			<PinRef compName="D1" pinName="14"/>
			<PinRef compName="DR1" pinName="5"/>
			<PinRef compName="D13" pinName="14"/>
			<PinRef compName="D13" pinName="15"/>
			<PinRef compName="D4" pinName="5"/>
		</Net>
		<Net name="98">
			<PinRef compName="D1" pinName="13"/>
			<PinRef compName="D12" pinName="27"/>
			<PinRef compName="D12" pinName="28"/>
			<PinRef compName="DR1" pinName="4"/>
			<PinRef compName="D4" pinName="4"/>
		</Net>
		<Net name="97">
			<PinRef compName="D1" pinName="11"/>
			<PinRef compName="D12" pinName="14"/>
			<PinRef compName="D12" pinName="15"/>
			<PinRef compName="DR1" pinName="3"/>
			<PinRef compName="D4" pinName="3"/>
		</Net>
		<Net name="96">
			<PinRef compName="D1" pinName="10"/>
			<PinRef compName="DR1" pinName="2"/>
			<PinRef compName="D11" pinName="27"/>
			<PinRef compName="D11" pinName="28"/>
			<PinRef compName="D4" pinName="2"/>
		</Net>
		<Net name="NET00005">
			<PinRef compName="D9" pinName="6"/>
			<PinRef compName="D10" pinName="3"/>
		</Net>
		<Net name="95">
			<PinRef compName="D1" pinName="9"/>
			<PinRef compName="DR1" pinName="1"/>
			<PinRef compName="D11" pinName="14"/>
			<PinRef compName="D11" pinName="15"/>
			<PinRef compName="D4" pinName="1"/>
		</Net>
		<Net name="NET00003">
			<PinRef compName="D9" pinName="3"/>
			<PinRef compName="D9" pinName="4"/>
			<PinRef compName="D10" pinName="1"/>
		</Net>
		<Net name="NET00002">
			<PinRef compName="D9" pinName="5"/>
			<PinRef compName="D6" pinName="8"/>
		</Net>
		<Net name="NET00001">
			<PinRef compName="D9" pinName="2"/>
			<PinRef compName="D5" pinName="8"/>
		</Net>
		<Net name="NET00000">
			<PinRef compName="D9" pinName="1"/>
			<PinRef compName="D4" pinName="8"/>
		</Net>
	</NetList>

	<HiSpeedRules version="3.0">
		<RulesImpedances>
			<Impedance name="Z0_50" Z0="50">
				<LayerRule width="0.2">
					<LayerRef name="1"/>
				</LayerRule>
				<LayerRule width="0.2">
					<LayerRef name="2"/>
				</LayerRule>
				<LayerRule width="0.2">
					<LayerRef name="3"/>
				</LayerRule>
				<LayerRule width="0.2">
					<LayerRef name="4"/>
				</LayerRule>
			</Impedance>
			<ImpedanceDiff name="ZDiff_100" Z0="100">
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="1"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="2"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="3"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="4"/>
				</LayerRule>
			</ImpedanceDiff>
		</RulesImpedances>
		<SignalSearchSettings maxNetsInCluster="5" createPinPairs="on">
			<RulesDiffSignalNetsNames>
				<RuleDiffSignalNetsNames enabled="on" negStr="#"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="+" negStr="-"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="P" negStr="N"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="p" negStr="n"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="H" negStr="L"/>
				<RuleDiffSignalNetsNames enabled="on" negStr="_B"/>
			</RulesDiffSignalNetsNames>
			<ExcludedNets minPinsNumber="20">
				<NetRef name="GND"/>
				<NetRef name="+5B"/>
			</ExcludedNets>
		</SignalSearchSettings>
	</HiSpeedRules>

	<Rules version="2.0">
		<RulesWidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.2" widthNom="0.2">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
			</WidthOfWires>
		</RulesWidthOfWires>
		<RulesClearancesNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0.2" clrnNom="0.3">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
					<AllNets/>
				</ObjectsAffected>
			</ClearanceNetToNet>
		</RulesClearancesNetToNet>
		<RulesClearancesCompToComp>
			<ClearanceCompToComp enabled="on" clrn="0.25">
				<ObjectsAffected>
					<AllComps/>
					<AllComps/>
				</ObjectsAffected>
			</ClearanceCompToComp>
		</RulesClearancesCompToComp>
		<RulesClearancesToBoard wires="0.3" comps="0.3"/>
		<RulesViastacksOfNets>
			<ViastacksOfNets enabled="on">
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
				<Viastacks>
					<AllViastacks/>
				</Viastacks>
			</ViastacksOfNets>
		</RulesViastacksOfNets>
		<NetProperties>
			<NetProperty flexfix="off" route="on">
				<NetRef name="1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="56"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="55"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="54"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="58"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="53"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="32"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="31"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="30"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="29"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="28"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="26"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="27"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="25"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="24"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="23"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="22"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="21"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="20"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="18"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="19"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="52"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="51"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="50"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="48"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="16"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="17"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="GND"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="60"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="33"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="59"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="47"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="46"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="45"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="44"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="43"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="42"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="34"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="41"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="40"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="39"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="38"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="35"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="117"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="36"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="116"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="115"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="114"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="113"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="112"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="110"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="111"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="94"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="93"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="92"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="91"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="90"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="89"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="88"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="87"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="86"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="85"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="84"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="83"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="82"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="81"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="80"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="79"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="78"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="77"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="76"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="75"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="74"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="73"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="72"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="71"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="70"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="69"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00032"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00030"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="108"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+5B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00031"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="37"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00026"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="57"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="109"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="68"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="107"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="67"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="106"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="66"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="104"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="103"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="102"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="101"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="100"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="99"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="98"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="97"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="96"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00005"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="95"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00003"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00002"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00001"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00000"/>
			</NetProperty>
		</NetProperties>
		<PadConnectSettings mode="AutoConnect"/>
	</Rules>

	<Connectivity version="1.3">
		<Vias>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="1"/>
				<Org x="53.3281" y="26.256"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="1"/>
				<Org x="87.1626" y="27.3705"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="1"/>
				<Org x="35.5196" y="30.7365"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="56"/>
				<Org x="42.0161" y="35.15"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="56"/>
				<Org x="37.0537" y="45.2481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="55"/>
				<Org x="35.552" y="45.2481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="55"/>
				<Org x="40.4001" y="38.784"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="54"/>
				<Org x="35.552" y="42.0161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="58"/>
				<Org x="11.312" y="27.472"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="58"/>
				<Org x="63.0241" y="35.552"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="53"/>
				<Org x="38.5101" y="39.058"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="52"/>
				<Org x="32.32" y="45.2481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="51"/>
				<Org x="40.4001" y="34.336"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="50"/>
				<Org x="14.544" y="48.758"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="50"/>
				<Org x="38.784" y="33.936"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="48"/>
				<Org x="61.4081" y="35.15"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="48"/>
				<Org x="58.1761" y="42.0161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="15"/>
				<Org x="40.4001" y="96.9601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="13"/>
				<Org x="51.7121" y="50.0961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="13"/>
				<Org x="84.0321" y="50.0961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="12"/>
				<Org x="87.2641" y="92.1121"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="11"/>
				<Org x="82.0161" y="52.1121"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="11"/>
				<Org x="37.168" y="50.0961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="11"/>
				<Org x="46.8641" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="10"/>
				<Org x="84.0321" y="51.7121"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="10"/>
				<Org x="54.9441" y="50.0961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="9"/>
				<Org x="45.2481" y="53.2357"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="9"/>
				<Org x="79.1841" y="45.2481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="9"/>
				<Org x="40.4001" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="7"/>
				<Org x="45.2555" y="30.7115"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="7"/>
				<Org x="27.472" y="25.856"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="6"/>
				<Org x="28.5" y="30.758"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="6"/>
				<Org x="80.8001" y="30.704"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="6"/>
				<Org x="48.4727" y="30.7654"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="5"/>
				<Org x="48.4801" y="32.1048"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="5"/>
				<Org x="29.75" y="32.3445"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="5"/>
				<Org x="80.8001" y="25.856"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="2"/>
				<Org x="51.7121" y="30.704"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="2"/>
				<Org x="35.4315" y="27.3515"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="3"/>
				<Org x="51.6365" y="27.3965"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="3"/>
				<Org x="35.552" y="25.856"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="4"/>
				<Org x="50.0961" y="32.5048"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="GND"/>
				<Org x="25.1732" y="53.6628"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="GND"/>
				<Org x="58.1761" y="33.542"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="GND"/>
				<Org x="22.624" y="67.8721"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="GND"/>
				<Org x="67.8721" y="88.8801"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="GND"/>
				<Org x="19.392" y="88.8801"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="GND"/>
				<Org x="51.142" y="85.6481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="GND"/>
				<Org x="74.3361" y="35.552"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="GND"/>
				<Org x="92.1121" y="35.552"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="GND"/>
				<Org x="82.4161" y="85.6481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="GND"/>
				<Org x="93.7281" y="54.9441"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="60"/>
				<Org x="33.936" y="75.9521"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="60"/>
				<Org x="27.472" y="67.8721"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="33"/>
				<Org x="40.4001" y="87.2641"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="59"/>
				<Org x="32.32" y="70.5384"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="47"/>
				<Org x="45.2481" y="98.5761"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="46"/>
				<Org x="42.0161" y="101.8081"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="45"/>
				<Org x="46.5" y="99.3841"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="44"/>
				<Org x="43.6321" y="90.4961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="43"/>
				<Org x="50.0961" y="95.803"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="42"/>
				<Org x="48.4801" y="96.9601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="34"/>
				<Org x="42.0161" y="88.8801"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="41"/>
				<Org x="43.6321" y="88.8801"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="40"/>
				<Org x="32.32" y="96.9601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="39"/>
				<Org x="33.936" y="96.9601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="38"/>
				<Org x="29" y="99.25"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="35"/>
				<Org x="42.0161" y="91.3041"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="117"/>
				<Org x="21.008" y="90.4961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="117"/>
				<Org x="40.0001" y="90.4961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="117"/>
				<Org x="42.0161" y="79.1841"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="36"/>
				<Org x="37.168" y="96.892"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="116"/>
				<Org x="51.7121" y="96.9601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="115"/>
				<Org x="30.704" y="96.9601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="114"/>
				<Org x="54.9441" y="42.4161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="114"/>
				<Org x="54.9441" y="96.9601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="113"/>
				<Org x="54.9441" y="45.2481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="113"/>
				<Org x="56.5601" y="96.9601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="113"/>
				<Org x="53.3281" y="33.936"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="112"/>
				<Org x="62.2161" y="85.6481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="110"/>
				<Org x="56.5601" y="45.2481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="110"/>
				<Org x="58.1761" y="79.1841"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="110"/>
				<Org x="56.5601" y="38.784"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="111"/>
				<Org x="64.6401" y="101.8081"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="94"/>
				<Org x="77.5681" y="75.958"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="94"/>
				<Org x="48.5018" y="85.6263"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="94"/>
				<Org x="77.5681" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="94"/>
				<Org x="19.392" y="70.842"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="94"/>
				<Org x="72.7201" y="43.6321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="94"/>
				<Org x="48.5688" y="70.842"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="93"/>
				<Org x="72.386" y="57.842"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="93"/>
				<Org x="22.624" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="93"/>
				<Org x="72.7201" y="50.0961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="93"/>
				<Org x="21.008" y="70.842"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="93"/>
				<Org x="50.0961" y="90.4961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="92"/>
				<Org x="71.1041" y="53.6594"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="92"/>
				<Org x="50.0961" y="88.8801"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="92"/>
				<Org x="24.24" y="59.7921"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="92"/>
				<Org x="80.8001" y="63.0241"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="91"/>
				<Org x="69.8362" y="56.9623"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="91"/>
				<Org x="58.1761" y="57.842"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="91"/>
				<Org x="82.4161" y="59.7921"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="91"/>
				<Org x="30.1384" y="57.1258"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="91"/>
				<Org x="51.142" y="87.6641"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="90"/>
				<Org x="28.9111" y="54.1744"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="90"/>
				<Org x="64.2649" y="56.1849"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="90"/>
				<Org x="87.2641" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="90"/>
				<Org x="53.3281" y="82.4161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="90"/>
				<Org x="87.1339" y="59.7921"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="90"/>
				<Org x="24.4767" y="78.9474"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="89"/>
				<Org x="59.7921" y="57.842"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="89"/>
				<Org x="88.8801" y="58.1761"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="89"/>
				<Org x="66.5389" y="58.4589"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="89"/>
				<Org x="32.5544" y="57.5495"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="89"/>
				<Org x="25.856" y="80.8001"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="89"/>
				<Org x="56.5601" y="88.8801"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="88"/>
				<Org x="67.8721" y="55.8096"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="88"/>
				<Org x="85.6481" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="88"/>
				<Org x="30.704" y="54.9441"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="88"/>
				<Org x="54.9441" y="82.4161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="88"/>
				<Org x="85.2481" y="69.4881"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="88"/>
				<Org x="29.088" y="84.0321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="87"/>
				<Org x="27.1892" y="53.0452"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="87"/>
				<Org x="26.8274" y="82.8161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="87"/>
				<Org x="63.0241" y="58.1761"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="87"/>
				<Org x="85.6481" y="61.4081"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="87"/>
				<Org x="56.5601" y="87.2641"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="86"/>
				<Org x="74.1208" y="55.3521"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="86"/>
				<Org x="14.944" y="43.6321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="86"/>
				<Org x="45.2481" y="59.3921"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="86"/>
				<Org x="75.9521" y="95.7441"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="86"/>
				<Org x="11.312" y="74.3361"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="86"/>
				<Org x="16.16" y="61.4081"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="86"/>
				<Org x="73.1201" y="74.3361"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="86"/>
				<Org x="32.5871" y="74.7201"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="85"/>
				<Org x="72.7201" y="77.9681"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="85"/>
				<Org x="48.4801" y="59.7921"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="85"/>
				<Org x="72.7201" y="96.9601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="85"/>
				<Org x="17.776" y="77.5681"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="85"/>
				<Org x="19.2997" y="43.6321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="85"/>
				<Org x="75.9521" y="60.458"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="85"/>
				<Org x="42.0161" y="74.3361"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="84"/>
				<Org x="20.608" y="42.0161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="84"/>
				<Org x="75.5521" y="94.5281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="84"/>
				<Org x="48.4801" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="84"/>
				<Org x="75.9521" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="84"/>
				<Org x="19.392" y="75.958"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="84"/>
				<Org x="74.3361" y="79.1841"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="84"/>
				<Org x="48.458" y="75.958"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="83"/>
				<Org x="52.1121" y="61.7501"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="83"/>
				<Org x="72.3201" y="76.7521"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="83"/>
				<Org x="77.5206" y="61.5479"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="83"/>
				<Org x="12.928" y="72.7201"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="83"/>
				<Org x="27.472" y="84.6034"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="83"/>
				<Org x="29.088" y="72.7201"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="83"/>
				<Org x="77.5681" y="95.3441"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="83"/>
				<Org x="19.392" y="42.0161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="82"/>
				<Org x="79.4474" y="60.058"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="82"/>
				<Org x="19.792" y="59.7921"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="82"/>
				<Org x="30.704" y="81.75"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="82"/>
				<Org x="50.0961" y="61.4081"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="82"/>
				<Org x="79.1841" y="77.5681"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="82"/>
				<Org x="22.624" y="42.0161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="82"/>
				<Org x="79.1841" y="95.3441"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="82"/>
				<Org x="30.5711" y="74.469"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="82"/>
				<Org x="20.9537" y="75.958"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="81"/>
				<Org x="80.9086" y="58.5341"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="81"/>
				<Org x="51.5914" y="58.5341"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="81"/>
				<Org x="82.4161" y="77.5681"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="81"/>
				<Org x="24.24" y="51.7121"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="81"/>
				<Org x="22.624" y="79.1841"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="81"/>
				<Org x="19.392" y="48.609"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="81"/>
				<Org x="64.6401" y="87.2641"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="81"/>
				<Org x="49.674" y="78.0694"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="80"/>
				<Org x="82.4161" y="53.7281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="80"/>
				<Org x="78.3011" y="92.8451"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="80"/>
				<Org x="51.7121" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="80"/>
				<Org x="84.0321" y="77.5681"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="80"/>
				<Org x="24.24" y="43.6321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="80"/>
				<Org x="33.936" y="79.1841"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="80"/>
				<Org x="51.75" y="76.1927"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="79"/>
				<Org x="50.0961" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="79"/>
				<Org x="84.0321" y="53.3281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="79"/>
				<Org x="17.776" y="71.1041"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="79"/>
				<Org x="80.8953" y="76.0473"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="79"/>
				<Org x="24.24" y="45.2481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="79"/>
				<Org x="75.9521" y="92.1121"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="79"/>
				<Org x="29.088" y="79.1841"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="79"/>
				<Org x="46.8641" y="77.5681"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="76"/>
				<Org x="56.5601" y="67.8601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="76"/>
				<Org x="58.1761" y="75.9521"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="75"/>
				<Org x="54.5441" y="68.25"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="72"/>
				<Org x="87.6641" y="70.9327"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="72"/>
				<Org x="67.8721" y="75.1441"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="72"/>
				<Org x="85.6481" y="75.958"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="71"/>
				<Org x="64.6401" y="69.25"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="70"/>
				<Org x="25.856" y="61.4081"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="70"/>
				<Org x="33.936" y="61.4081"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="69"/>
				<Org x="25.856" y="87.2641"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="69"/>
				<Org x="12.928" y="59.7921"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="NET00030"/>
				<Org x="84.0321" y="86.5"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="NET00030"/>
				<Org x="84.0321" y="92.1121"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="108"/>
				<Org x="93.9298" y="91.9871"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="108"/>
				<Org x="79.1358" y="88.9284"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="73.1201" y="54.5441"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="51.5889" y="40.6648"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="74.3361" y="49.8303"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="45.2481" y="61.8081"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="92.1121" y="69.4881"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="37.168" y="91.7254"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="95.3441" y="90.4961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="38.784" y="84.0321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="27.472" y="45.2481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="87.2641" y="32.1353"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="32.32" y="50.0961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="43.6321" y="48.4801"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="79.1841" y="93.7281"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="17.776" y="66.2561"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="11.312" y="96.9601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="63.0241" y="43.6321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="38.784" y="63.0241"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="61.458" y="63.0241"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="58.1761" y="38.784"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="9.696" y="67.8721"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="74.3361" y="87.2641"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="+5B"/>
				<Org x="45.2481" y="75.958"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="37"/>
				<Org x="25.856" y="95.3441"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="NET00026"/>
				<Org x="88.8801" y="92.75"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="NET00026"/>
				<Org x="88.8801" y="85.6481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="57"/>
				<Org x="17.5" y="85.6481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="57"/>
				<Org x="35.552" y="84.508"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="109"/>
				<Org x="79.1841" y="87.2641"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="109"/>
				<Org x="79.2359" y="92.0603"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="109"/>
				<Org x="77.5681" y="98.5761"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="68"/>
				<Org x="25.856" y="59.658"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="68"/>
				<Org x="61.4081" y="87.2641"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="68"/>
				<Org x="24.24" y="71.1041"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="68"/>
				<Org x="51.7121" y="69.4881"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="68"/>
				<Org x="80.8001" y="71.1041"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="107"/>
				<Org x="56.5601" y="43.6321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="67"/>
				<Org x="36.495" y="33.936"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="67"/>
				<Org x="25.856" y="40.4001"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="67"/>
				<Org x="54.9441" y="63.0241"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="67"/>
				<Org x="84.0321" y="71.1041"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="106"/>
				<Org x="32.458" y="62.25"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="106"/>
				<Org x="22.624" y="43.6321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="106"/>
				<Org x="54.9441" y="43.6321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="106"/>
				<Org x="55.3441" y="40.4001"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="66"/>
				<Org x="74.242" y="56.9681"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="66"/>
				<Org x="64.7629" y="95.6798"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="66"/>
				<Org x="17.776" y="59.7921"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="66"/>
				<Org x="46.8641" y="66.2561"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="104"/>
				<Org x="56" y="31.512"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="104"/>
				<Org x="44.0321" y="42.25"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="103"/>
				<Org x="53.6049" y="40.4001"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="102"/>
				<Org x="71.1041" y="45.2481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="102"/>
				<Org x="85.6481" y="33.936"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="102"/>
				<Org x="42.0161" y="56.5601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="101"/>
				<Org x="88.8339" y="43.6782"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="101"/>
				<Org x="68.7843" y="61.725"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="101"/>
				<Org x="72.7201" y="45.2481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="101"/>
				<Org x="84.0321" y="33.936"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="100"/>
				<Org x="82.4161" y="33.936"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="100"/>
				<Org x="82.4161" y="42.0161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="100"/>
				<Org x="87.2641" y="50.0961"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="100"/>
				<Org x="74.3361" y="69.4881"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="99"/>
				<Org x="80.8001" y="38.784"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="99"/>
				<Org x="80.8001" y="42.0161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="98"/>
				<Org x="71.4522" y="55.7273"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="98"/>
				<Org x="69.6709" y="63.2069"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="98"/>
				<Org x="87.2641" y="35.552"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="98"/>
				<Org x="88.8801" y="42.0161"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="97"/>
				<Org x="90.4961" y="40.4001"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="96"/>
				<Org x="87.2641" y="38.784"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="96"/>
				<Org x="12.928" y="71.1041"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="96"/>
				<Org x="16.16" y="71.2939"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="95"/>
				<Org x="30.7676" y="52.0485"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="95"/>
				<Org x="88.6" y="35.417"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="NET00003"/>
				<Org x="11.312" y="80.8001"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="NET00003"/>
				<Org x="12.928" y="56.5601"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="NET00002"/>
				<Org x="12.928" y="43.6321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="NET00001"/>
				<Org x="16.3914" y="50.3274"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_[Default]"/>
				<NetRef name="NET00000"/>
				<Org x="17.776" y="40.4001"/>
			</Via>
		</Vias>
		<Wires>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="34.75" y="29"/>
					<TrackLine>
						<End x="34.75" y="30.35"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1365" y="30.7365"/>
					</TrackLine>
					<TrackLine>
						<End x="35.5196" y="30.7365"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="86.5" y="29"/>
					<TrackLine>
						<End x="86.5" y="27.65"/>
					</TrackLine>
					<TrackLine>
						<End x="86.7795" y="27.3705"/>
					</TrackLine>
					<TrackLine>
						<End x="87.1626" y="27.3705"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="53.5" y="29"/>
					<TrackLine>
						<End x="53.5" y="27.443"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3281" y="27.271"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3281" y="26.256"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="56"/>
				<Subwire width="0.2">
					<Start x="37.0537" y="45.2481"/>
					<TrackLine>
						<End x="36.2457" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2174" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="34.744" y="44.9134"/>
					</TrackLine>
					<TrackLine>
						<End x="34.744" y="45.5827"/>
					</TrackLine>
					<TrackLine>
						<End x="34.75" y="45.5887"/>
					</TrackLine>
					<TrackLine>
						<End x="34.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="55"/>
				<Subwire width="0.2">
					<Start x="36" y="47.7"/>
					<TrackLine>
						<End x="36" y="45.696"/>
					</TrackLine>
					<TrackLine>
						<End x="35.552" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="54"/>
				<Subwire width="0.2">
					<Start x="37.25" y="47.7"/>
					<TrackLine>
						<End x="37.25" y="46.1944"/>
					</TrackLine>
					<TrackLine>
						<End x="37.8617" y="45.5827"/>
					</TrackLine>
					<TrackLine>
						<End x="37.8617" y="44.3257"/>
					</TrackLine>
					<TrackLine>
						<End x="35.552" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="11.312" y="27.472"/>
					<TrackLine>
						<End x="10.504" y="27.472"/>
					</TrackLine>
					<TrackLine>
						<End x="8.888" y="29.088"/>
					</TrackLine>
					<TrackLine>
						<End x="8.888" y="70.2961"/>
					</TrackLine>
					<TrackLine>
						<End x="12.5" y="73.9081"/>
					</TrackLine>
					<TrackLine>
						<End x="12.5" y="83.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="62.75" y="29"/>
					<TrackLine>
						<End x="62.75" y="32.41"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="32.6841"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="35.552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="53"/>
				<Subwire width="0.2">
					<Start x="38.5101" y="39.058"/>
					<TrackLine>
						<End x="38.5101" y="43.103"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5" y="43.113"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="32"/>
				<Subwire width="0.2">
					<Start x="72.75" y="29"/>
					<TrackLine>
						<End x="72.75" y="27.2049"/>
					</TrackLine>
					<TrackLine>
						<End x="76.39" y="23.5649"/>
					</TrackLine>
					<TrackLine>
						<End x="76.39" y="19.29"/>
					</TrackLine>
					<TrackLine>
						<End x="77.84" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="31"/>
				<Subwire width="0.2">
					<Start x="71.5" y="29"/>
					<TrackLine>
						<End x="71.5" y="25.9149"/>
					</TrackLine>
					<TrackLine>
						<End x="74.03" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="74.03" y="19.11"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="30"/>
				<Subwire width="0.2">
					<Start x="70.25" y="29"/>
					<TrackLine>
						<End x="70.25" y="25.9149"/>
					</TrackLine>
					<TrackLine>
						<End x="71.49" y="24.6749"/>
					</TrackLine>
					<TrackLine>
						<End x="71.49" y="19.11"/>
					</TrackLine>
					<TrackLine>
						<End x="72.76" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="29"/>
				<Subwire width="0.2">
					<Start x="69" y="29"/>
					<TrackLine>
						<End x="69" y="23.9006"/>
					</TrackLine>
					<TrackLine>
						<End x="69.17" y="23.7306"/>
					</TrackLine>
					<TrackLine>
						<End x="69.17" y="18.89"/>
					</TrackLine>
					<TrackLine>
						<End x="70.22" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="28"/>
				<Subwire width="0.2">
					<Start x="67.75" y="29"/>
					<TrackLine>
						<End x="67.75" y="24.5849"/>
					</TrackLine>
					<TrackLine>
						<End x="68.73" y="23.6049"/>
					</TrackLine>
					<TrackLine>
						<End x="68.73" y="18.89"/>
					</TrackLine>
					<TrackLine>
						<End x="67.68" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="26"/>
				<Subwire width="0.2">
					<Start x="65.25" y="29"/>
					<TrackLine>
						<End x="65.25" y="26.0549"/>
					</TrackLine>
					<TrackLine>
						<End x="63.87" y="24.6749"/>
					</TrackLine>
					<TrackLine>
						<End x="63.87" y="19.11"/>
					</TrackLine>
					<TrackLine>
						<End x="62.6" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="27"/>
				<Subwire width="0.2">
					<Start x="66.5" y="29"/>
					<TrackLine>
						<End x="66.5" y="19.2"/>
					</TrackLine>
					<TrackLine>
						<End x="65.14" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="25"/>
				<Subwire width="0.2">
					<Start x="64" y="29"/>
					<TrackLine>
						<End x="64" y="26.0549"/>
					</TrackLine>
					<TrackLine>
						<End x="61.33" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="61.33" y="19.11"/>
					</TrackLine>
					<TrackLine>
						<End x="60.06" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="52"/>
				<Subwire width="0.2">
					<Start x="32.32" y="45.2481"/>
					<TrackLine>
						<End x="32.32" y="44.1054"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1754" y="38.25"/>
					</TrackLine>
					<TrackLine>
						<End x="38.8448" y="38.25"/>
					</TrackLine>
					<TrackLine>
						<End x="39.4551" y="38.8603"/>
					</TrackLine>
					<TrackLine>
						<End x="39.4551" y="38.9818"/>
					</TrackLine>
					<TrackLine>
						<End x="39.75" y="39.2767"/>
					</TrackLine>
					<TrackLine>
						<End x="39.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="51"/>
				<Subwire width="0.2">
					<Start x="38.5" y="29"/>
					<TrackLine>
						<End x="38.5" y="32.436"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4001" y="34.336"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="38.784" y="33.936"/>
					<TrackLine>
						<End x="37.25" y="32.402"/>
					</TrackLine>
					<TrackLine>
						<End x="37.25" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="16.25" y="83.25"/>
					<TrackLine>
						<End x="16.25" y="76.9299"/>
					</TrackLine>
					<TrackLine>
						<End x="14.552" y="75.2319"/>
					</TrackLine>
					<TrackLine>
						<End x="14.552" y="70.6279"/>
					</TrackLine>
					<TrackLine>
						<End x="14.95" y="70.2299"/>
					</TrackLine>
					<TrackLine>
						<End x="14.95" y="60.1057"/>
					</TrackLine>
					<TrackLine>
						<End x="14.544" y="59.6997"/>
					</TrackLine>
					<TrackLine>
						<End x="14.544" y="48.758"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="53.5" y="47.7"/>
					<TrackLine>
						<End x="53.5" y="42.7174"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6094" y="41.6081"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2788" y="41.6081"/>
					</TrackLine>
					<TrackLine>
						<End x="55.6868" y="42.0161"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="16"/>
				<Subwire width="0.2">
					<Start x="37.2" y="15.3"/>
					<TrackLine>
						<End x="35.93" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="24.2351" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="20.69" y="20.1151"/>
					</TrackLine>
					<TrackLine>
						<End x="20.69" y="20.8449"/>
					</TrackLine>
					<TrackLine>
						<End x="19.7849" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="11.4351" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="8.488" y="24.6971"/>
					</TrackLine>
					<TrackLine>
						<End x="8.488" y="82.128"/>
					</TrackLine>
					<TrackLine>
						<End x="10.9601" y="84.6"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="84.6"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="83.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="15"/>
				<Subwire width="0.2">
					<Start x="42.75" y="93.75"/>
					<TrackLine>
						<End x="42.75" y="95.3"/>
					</TrackLine>
					<TrackLine>
						<End x="41.6612" y="96.3888"/>
					</TrackLine>
					<TrackLine>
						<End x="40.9714" y="96.3888"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4001" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="14"/>
				<Subwire width="0.2">
					<Start x="31" y="47.7"/>
					<TrackLine>
						<End x="31" y="40.8734"/>
					</TrackLine>
					<TrackLine>
						<End x="25.3" y="35.1734"/>
					</TrackLine>
					<TrackLine>
						<End x="25.3" y="26.3197"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3997" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="27.4749" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="28.31" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="28.31" y="22.6551"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2151" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4849" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="33.39" y="20.8449"/>
					</TrackLine>
					<TrackLine>
						<End x="33.39" y="20.1151"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2251" y="19.28"/>
					</TrackLine>
					<TrackLine>
						<End x="35.0949" y="19.28"/>
					</TrackLine>
					<TrackLine>
						<End x="35.855" y="20.0401"/>
					</TrackLine>
					<TrackLine>
						<End x="35.855" y="20.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7729" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="41.01" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="42.28" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="49.75" y="47.7"/>
					<TrackLine>
						<End x="49.75" y="49.1101"/>
					</TrackLine>
					<TrackLine>
						<End x="50.725" y="50.0851"/>
					</TrackLine>
					<TrackLine>
						<End x="50.725" y="50.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="50.725" y="50.375"/>
					<TrackLine>
						<End x="49.375" y="50.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="82.75" y="49.275"/>
					<TrackLine>
						<End x="83.211" y="49.275"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="82.75" y="49.275"/>
					<TrackLine>
						<End x="82.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="82.75" y="50.625"/>
					<TrackLine>
						<End x="82.75" y="49.275"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="51.7121" y="50.0961"/>
					<TrackLine>
						<End x="51.4331" y="50.375"/>
					</TrackLine>
					<TrackLine>
						<End x="50.725" y="50.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="12"/>
				<Subwire width="0.2">
					<Start x="60.06" y="23.02"/>
					<TrackLine>
						<End x="60.06" y="56.3547"/>
					</TrackLine>
					<TrackLine>
						<End x="63.4281" y="59.7228"/>
					</TrackLine>
					<TrackLine>
						<End x="63.4281" y="87.1948"/>
					</TrackLine>
					<TrackLine>
						<End x="64" y="87.7667"/>
					</TrackLine>
					<TrackLine>
						<End x="64" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="12"/>
				<Subwire width="0.2">
					<Start x="64" y="93.75"/>
					<TrackLine>
						<End x="64" y="95.3"/>
					</TrackLine>
					<TrackLine>
						<End x="63.9549" y="95.3451"/>
					</TrackLine>
					<TrackLine>
						<End x="63.9549" y="96.0145"/>
					</TrackLine>
					<TrackLine>
						<End x="67.7245" y="99.7841"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5921" y="99.7841"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="92.1121"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="35.625" y="52.125"/>
					<TrackLine>
						<End x="36.975" y="52.125"/>
					</TrackLine>
					<TrackLine>
						<End x="37.168" y="51.932"/>
					</TrackLine>
					<TrackLine>
						<End x="37.168" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="29.75" y="47.7"/>
					<TrackLine>
						<End x="29.75" y="49.05"/>
					</TrackLine>
					<TrackLine>
						<End x="31.1405" y="50.4405"/>
					</TrackLine>
					<TrackLine>
						<End x="31.4337" y="50.4405"/>
					</TrackLine>
					<TrackLine>
						<End x="33.1181" y="52.125"/>
					</TrackLine>
					<TrackLine>
						<End x="35.625" y="52.125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="82.0161" y="52.1121"/>
					<TrackLine>
						<End x="81.0121" y="52.1121"/>
					</TrackLine>
					<TrackLine>
						<End x="80.875" y="51.975"/>
					</TrackLine>
					<TrackLine>
						<End x="80.875" y="50.625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="80.875" y="50.625"/>
					<TrackLine>
						<End x="80.875" y="49.275"/>
					</TrackLine>
					<TrackLine>
						<End x="81.1" y="49.05"/>
					</TrackLine>
					<TrackLine>
						<End x="81.5" y="49.05"/>
					</TrackLine>
					<TrackLine>
						<End x="81.5" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="46.875" y="50.375"/>
					<TrackLine>
						<End x="47.525" y="50.375"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5" y="49.4"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="46.875" y="50.375"/>
					<TrackLine>
						<End x="46.875" y="51.7921"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8641" y="51.803"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8641" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="52.25" y="47.7"/>
					<TrackLine>
						<End x="52.25" y="41.1464"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3969" y="40.9995"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3969" y="40.3302"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9236" y="39.8568"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2825" y="39.8568"/>
					</TrackLine>
					<TrackLine>
						<End x="41.837" y="43.3023"/>
					</TrackLine>
					<TrackLine>
						<End x="41.837" y="47.2529"/>
					</TrackLine>
					<TrackLine>
						<End x="39.9209" y="49.169"/>
					</TrackLine>
					<TrackLine>
						<End x="36.9524" y="49.169"/>
					</TrackLine>
					<TrackLine>
						<End x="36.36" y="49.7614"/>
					</TrackLine>
					<TrackLine>
						<End x="36.36" y="50.115"/>
					</TrackLine>
					<TrackLine>
						<End x="36.225" y="50.25"/>
					</TrackLine>
					<TrackLine>
						<End x="34.875" y="50.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="85.25" y="50.75"/>
					<TrackLine>
						<End x="85.25" y="52.1"/>
					</TrackLine>
					<TrackLine>
						<End x="84.42" y="52.1"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="51.7121"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="85.25" y="47.7"/>
					<TrackLine>
						<End x="85.25" y="50.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="54.875" y="52.875"/>
					<TrackLine>
						<End x="54.875" y="51.2491"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="51.18"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="52.25" y="47.7"/>
					<TrackLine>
						<End x="52.25" y="49.05"/>
					</TrackLine>
					<TrackLine>
						<End x="53.2961" y="50.0961"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="33.5" y="47.7"/>
					<TrackLine>
						<End x="33.5" y="50.225"/>
					</TrackLine>
					<TrackLine>
						<End x="33.525" y="50.25"/>
					</TrackLine>
					<TrackLine>
						<End x="34.875" y="50.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="35.625" y="53.375"/>
					<TrackLine>
						<End x="33.8025" y="53.375"/>
					</TrackLine>
					<TrackLine>
						<End x="31.268" y="50.8405"/>
					</TrackLine>
					<TrackLine>
						<End x="29.0405" y="50.8405"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="49.05"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="43.025" y="50.375"/>
					<TrackLine>
						<End x="43.025" y="51.0126"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="53.2357"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="44.375" y="50.375"/>
					<TrackLine>
						<End x="43.025" y="50.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="43.025" y="50.375"/>
					<TrackLine>
						<End x="43.025" y="50.0851"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6285" y="49.4815"/>
					</TrackLine>
					<TrackLine>
						<End x="45.5685" y="49.4815"/>
					</TrackLine>
					<TrackLine>
						<End x="46" y="49.05"/>
					</TrackLine>
					<TrackLine>
						<End x="46" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="35.625" y="53.375"/>
					<TrackLine>
						<End x="39.5451" y="53.375"/>
					</TrackLine>
					<TrackLine>
						<End x="39.5921" y="53.3281"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4001" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="79" y="47.7"/>
					<TrackLine>
						<End x="79" y="46.2951"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="46.111"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="79" y="47.7"/>
					<TrackLine>
						<End x="79" y="50.625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="26" y="29"/>
					<TrackLine>
						<End x="26" y="26.1854"/>
					</TrackLine>
					<TrackLine>
						<End x="27.5654" y="24.62"/>
					</TrackLine>
					<TrackLine>
						<End x="32.1549" y="24.62"/>
					</TrackLine>
					<TrackLine>
						<End x="33.315" y="23.4599"/>
					</TrackLine>
					<TrackLine>
						<End x="33.315" y="22.6679"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1629" y="21.82"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1571" y="21.82"/>
					</TrackLine>
					<TrackLine>
						<End x="36.005" y="22.6679"/>
					</TrackLine>
					<TrackLine>
						<End x="36.005" y="23.4599"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7651" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="36.8857" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="41.6657" y="29"/>
					</TrackLine>
					<TrackLine>
						<End x="44.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="71.42" y="17.3429"/>
					<TrackLine>
						<End x="70.7171" y="16.64"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5629" y="16.64"/>
					</TrackLine>
					<TrackLine>
						<End x="58.79" y="17.4129"/>
					</TrackLine>
					<TrackLine>
						<End x="58.79" y="18.2671"/>
					</TrackLine>
					<TrackLine>
						<End x="57.8971" y="19.16"/>
					</TrackLine>
					<TrackLine>
						<End x="57.2051" y="19.16"/>
					</TrackLine>
					<TrackLine>
						<End x="56.325" y="20.0401"/>
					</TrackLine>
					<TrackLine>
						<End x="56.325" y="20.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4071" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0129" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="51.17" y="22.5929"/>
					</TrackLine>
					<TrackLine>
						<End x="51.17" y="23.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3971" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="48.18" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="44.75" y="27.65"/>
					</TrackLine>
					<TrackLine>
						<End x="44.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="71.42" y="17.3429"/>
					<TrackLine>
						<End x="72.1929" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1871" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="74.03" y="15.7271"/>
					</TrackLine>
					<TrackLine>
						<End x="74.03" y="14.8729"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8029" y="14.1"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3371" y="14.1"/>
					</TrackLine>
					<TrackLine>
						<End x="79.11" y="14.8729"/>
					</TrackLine>
					<TrackLine>
						<End x="79.11" y="15.7271"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9529" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8071" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="81.58" y="17.3429"/>
					</TrackLine>
					<TrackLine>
						<End x="81.58" y="18.3371"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7571" y="19.16"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0651" y="19.16"/>
					</TrackLine>
					<TrackLine>
						<End x="79.11" y="20.1151"/>
					</TrackLine>
					<TrackLine>
						<End x="79.11" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="77.75" y="24.7449"/>
					</TrackLine>
					<TrackLine>
						<End x="77.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="71.42" y="17.3429"/>
					<TrackLine>
						<End x="71.42" y="18.3371"/>
					</TrackLine>
					<TrackLine>
						<End x="70.7171" y="19.04"/>
					</TrackLine>
					<TrackLine>
						<End x="70.46" y="19.04"/>
					</TrackLine>
					<TrackLine>
						<End x="70.22" y="19.28"/>
					</TrackLine>
					<TrackLine>
						<End x="70.22" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="27.25" y="29"/>
					<TrackLine>
						<End x="27.25" y="27.268"/>
					</TrackLine>
					<TrackLine>
						<End x="27.472" y="27.046"/>
					</TrackLine>
					<TrackLine>
						<End x="27.472" y="25.856"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="79" y="29"/>
					<TrackLine>
						<End x="79" y="30.35"/>
					</TrackLine>
					<TrackLine>
						<End x="77.4601" y="30.35"/>
					</TrackLine>
					<TrackLine>
						<End x="76.79" y="29.68"/>
					</TrackLine>
					<TrackLine>
						<End x="76.79" y="19.8951"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5251" y="19.16"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2171" y="19.16"/>
					</TrackLine>
					<TrackLine>
						<End x="79.04" y="18.3371"/>
					</TrackLine>
					<TrackLine>
						<End x="79.04" y="17.3429"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3371" y="16.64"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8029" y="16.64"/>
					</TrackLine>
					<TrackLine>
						<End x="74.03" y="17.4129"/>
					</TrackLine>
					<TrackLine>
						<End x="74.03" y="18.2671"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2571" y="19.04"/>
					</TrackLine>
					<TrackLine>
						<End x="73" y="19.04"/>
					</TrackLine>
					<TrackLine>
						<End x="72.76" y="19.28"/>
					</TrackLine>
					<TrackLine>
						<End x="72.76" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="46" y="29"/>
					<TrackLine>
						<End x="46" y="30.35"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6385" y="30.7115"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2555" y="30.7115"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="47.25" y="29"/>
					<TrackLine>
						<End x="47.25" y="30.35"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6654" y="30.7654"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4727" y="30.7654"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="80.25" y="29"/>
					<TrackLine>
						<End x="80.25" y="30.35"/>
					</TrackLine>
					<TrackLine>
						<End x="80.604" y="30.704"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="30.704"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="28.5" y="29"/>
					<TrackLine>
						<End x="28.5" y="30.758"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="5"/>
				<Subwire width="0.2">
					<Start x="48.5" y="29"/>
					<TrackLine>
						<End x="48.5" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2807" y="30.4307"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2807" y="31.3042"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="32.1048"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="5"/>
				<Subwire width="0.2">
					<Start x="29.75" y="29"/>
					<TrackLine>
						<End x="29.75" y="32.3445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="5"/>
				<Subwire width="0.2">
					<Start x="81.5" y="29"/>
					<TrackLine>
						<End x="81.5" y="26.5559"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="25.856"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="2"/>
				<Subwire width="0.2">
					<Start x="33.5" y="29"/>
					<TrackLine>
						<End x="33.5" y="27.65"/>
					</TrackLine>
					<TrackLine>
						<End x="33.7985" y="27.3515"/>
					</TrackLine>
					<TrackLine>
						<End x="35.4315" y="27.3515"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="2"/>
				<Subwire width="0.2">
					<Start x="52.25" y="29"/>
					<TrackLine>
						<End x="52.25" y="30.35"/>
					</TrackLine>
					<TrackLine>
						<End x="51.896" y="30.704"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="30.704"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="2"/>
				<Subwire width="0.2">
					<Start x="85.25" y="29"/>
					<TrackLine>
						<End x="85.25" y="24.4449"/>
					</TrackLine>
					<TrackLine>
						<End x="84.41" y="23.6049"/>
					</TrackLine>
					<TrackLine>
						<End x="84.41" y="21.68"/>
					</TrackLine>
					<TrackLine>
						<End x="85.46" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="85.46" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="32.25" y="29"/>
					<TrackLine>
						<End x="32.25" y="27.65"/>
					</TrackLine>
					<TrackLine>
						<End x="34.044" y="25.856"/>
					</TrackLine>
					<TrackLine>
						<End x="35.552" y="25.856"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="51" y="29"/>
					<TrackLine>
						<End x="51" y="27.65"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2535" y="27.3965"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6365" y="27.3965"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="84" y="29"/>
					<TrackLine>
						<End x="84" y="21.71"/>
					</TrackLine>
					<TrackLine>
						<End x="82.92" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="82.92" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="4"/>
				<Subwire width="0.2">
					<Start x="31" y="29"/>
					<TrackLine>
						<End x="31" y="30.35"/>
					</TrackLine>
					<TrackLine>
						<End x="35.794" y="35.144"/>
					</TrackLine>
					<TrackLine>
						<End x="40.807" y="35.144"/>
					</TrackLine>
					<TrackLine>
						<End x="42.875" y="33.0761"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5247" y="33.0761"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="32.5048"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="4"/>
				<Subwire width="0.2">
					<Start x="49.75" y="29"/>
					<TrackLine>
						<End x="49.75" y="30.8504"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="31.1964"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="32.5048"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="4"/>
				<Subwire width="0.2">
					<Start x="82.75" y="29"/>
					<TrackLine>
						<End x="82.75" y="26.5559"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="25.4559"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="21.9"/>
					</TrackLine>
					<TrackLine>
						<End x="80.38" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="80.38" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="67.8721" y="88.8801"/>
					<TrackLine>
						<End x="68.492" y="89.5"/>
					</TrackLine>
					<TrackLine>
						<End x="71.875" y="89.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="91.5" y="29"/>
					<TrackLine>
						<End x="91.5" y="34.9399"/>
					</TrackLine>
					<TrackLine>
						<End x="92.1121" y="35.552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="22.25" y="74"/>
					<TrackLine>
						<End x="22.25" y="75.8044"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="79.3044"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="83.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="19.392" y="88.8801"/>
					<TrackLine>
						<End x="18.75" y="88.2381"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="83.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="72.75" y="93.75"/>
					<TrackLine>
						<End x="72.75" y="91.9871"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0621" y="91.675"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0621" y="91.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="71.875" y="90.275"/>
					</TrackLine>
					<TrackLine>
						<End x="71.875" y="89.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="58.5" y="29"/>
					<TrackLine>
						<End x="58.5" y="31.38"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="31.704"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="33.542"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="10.25" y="31"/>
					<TrackLine>
						<End x="10.25" y="30.225"/>
					</TrackLine>
					<TrackLine>
						<End x="12.12" y="28.355"/>
					</TrackLine>
					<TrackLine>
						<End x="12.12" y="27.1373"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8" y="26.8173"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="39.75" y="29"/>
					<TrackLine>
						<End x="39.75" y="27.65"/>
					</TrackLine>
					<TrackLine>
						<End x="36.72" y="24.62"/>
					</TrackLine>
					<TrackLine>
						<End x="36.26" y="24.62"/>
					</TrackLine>
					<TrackLine>
						<End x="34.66" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="11.25" y="45.75"/>
					<TrackLine>
						<End x="11.25" y="36.19"/>
					</TrackLine>
					<TrackLine>
						<End x="10.25" y="35.19"/>
					</TrackLine>
					<TrackLine>
						<End x="10.25" y="31"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="51.25" y="74"/>
					<TrackLine>
						<End x="51.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="50.942" y="75.858"/>
					</TrackLine>
					<TrackLine>
						<End x="50.942" y="76.5274"/>
					</TrackLine>
					<TrackLine>
						<End x="51.142" y="76.7274"/>
					</TrackLine>
					<TrackLine>
						<End x="51.142" y="85.6481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="81.25" y="74"/>
					<TrackLine>
						<End x="81.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="81.7033" y="75.4033"/>
					</TrackLine>
					<TrackLine>
						<End x="81.7033" y="76.9995"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="77.7029"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="81" y="86.5"/>
					<TrackLine>
						<End x="82.35" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="86.4339"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="85.6481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="74" y="29"/>
					<TrackLine>
						<End x="74" y="32.379"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="32.7151"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="35.552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="22.25" y="74"/>
					<TrackLine>
						<End x="22.25" y="70.7521"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="70.378"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="67.8721"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="91.5" y="29"/>
					<TrackLine>
						<End x="91.5" y="24.13"/>
					</TrackLine>
					<TrackLine>
						<End x="90.54" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="90.54" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="64" y="47.75"/>
					<TrackLine>
						<End x="64" y="45.8881"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="35.552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="60"/>
				<Subwire width="0.2">
					<Start x="33.936" y="75.9521"/>
					<TrackLine>
						<End x="33.128" y="76.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="33.128" y="89.7555"/>
					</TrackLine>
					<TrackLine>
						<End x="34" y="90.6275"/>
					</TrackLine>
					<TrackLine>
						<End x="34" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="60"/>
				<Subwire width="0.2">
					<Start x="33.936" y="75.9521"/>
					<TrackLine>
						<End x="33.936" y="71.0117"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6547" y="69.7304"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9017" y="69.7304"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7821" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="29.3015" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="28.95" y="69.4985"/>
					</TrackLine>
					<TrackLine>
						<End x="28.95" y="69.3501"/>
					</TrackLine>
					<TrackLine>
						<End x="27.472" y="67.8721"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="33"/>
				<Subwire width="0.2">
					<Start x="39" y="93.75"/>
					<TrackLine>
						<End x="39" y="92.2"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8959" y="91.3041"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3347" y="91.3041"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8081" y="90.8308"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8081" y="88.7424"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4001" y="88.3344"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4001" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="59"/>
				<Subwire width="0.2">
					<Start x="31.5" y="93.75"/>
					<TrackLine>
						<End x="31.5" y="82.0967"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6456" y="81.9511"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6456" y="74.519"/>
					</TrackLine>
					<TrackLine>
						<End x="32.32" y="73.8445"/>
					</TrackLine>
					<TrackLine>
						<End x="32.32" y="70.5384"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="47"/>
				<Subwire width="0.2">
					<Start x="45.25" y="93.75"/>
					<TrackLine>
						<End x="45.25" y="96.5331"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="98.5761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="46"/>
				<Subwire width="0.2">
					<Start x="44" y="93.75"/>
					<TrackLine>
						<End x="44" y="99.8242"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="101.8081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="45"/>
				<Subwire width="0.2">
					<Start x="46.5" y="93.75"/>
					<TrackLine>
						<End x="46.5" y="99.3841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="44"/>
				<Subwire width="0.2">
					<Start x="43.6321" y="90.4961"/>
					<TrackLine>
						<End x="47.2961" y="90.4961"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="92.2"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="43"/>
				<Subwire width="0.2">
					<Start x="50.25" y="93.75"/>
					<TrackLine>
						<End x="50.25" y="95.6491"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="95.803"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="42"/>
				<Subwire width="0.2">
					<Start x="51.5" y="93.75"/>
					<TrackLine>
						<End x="51.5" y="95.5418"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0817" y="96.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="34"/>
				<Subwire width="0.2">
					<Start x="40.25" y="93.75"/>
					<TrackLine>
						<End x="40.25" y="91.9545"/>
					</TrackLine>
					<TrackLine>
						<End x="41.2081" y="90.9965"/>
					</TrackLine>
					<TrackLine>
						<End x="41.2081" y="89.6881"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="41"/>
				<Subwire width="0.2">
					<Start x="47.75" y="93.75"/>
					<TrackLine>
						<End x="47.75" y="92.2"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8541" y="91.3041"/>
					</TrackLine>
					<TrackLine>
						<End x="43.2974" y="91.3041"/>
					</TrackLine>
					<TrackLine>
						<End x="42.8241" y="90.8308"/>
					</TrackLine>
					<TrackLine>
						<End x="42.8241" y="89.6881"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6321" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="40"/>
				<Subwire width="0.2">
					<Start x="35.25" y="93.75"/>
					<TrackLine>
						<End x="35.25" y="96.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2707" y="97.7681"/>
					</TrackLine>
					<TrackLine>
						<End x="33.128" y="97.7681"/>
					</TrackLine>
					<TrackLine>
						<End x="32.32" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="39"/>
				<Subwire width="0.2">
					<Start x="33.936" y="96.9601"/>
					<TrackLine>
						<End x="32.75" y="95.7741"/>
					</TrackLine>
					<TrackLine>
						<End x="32.75" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="38"/>
				<Subwire width="0.2">
					<Start x="29" y="99.25"/>
					<TrackLine>
						<End x="29" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="35"/>
				<Subwire width="0.2">
					<Start x="41.5" y="93.75"/>
					<TrackLine>
						<End x="41.5" y="91.8202"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="91.3041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="117"/>
				<Subwire width="0.2">
					<Start x="38" y="86.5"/>
					<TrackLine>
						<End x="38.2875" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0001" y="88.2125"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0001" y="88.5001"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0001" y="90.4961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="117"/>
				<Subwire width="0.2">
					<Start x="18.75" y="94.45"/>
					<TrackLine>
						<End x="18.75" y="92.7541"/>
					</TrackLine>
					<TrackLine>
						<End x="21.008" y="90.4961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="36"/>
				<Subwire width="0.2">
					<Start x="37.75" y="93.75"/>
					<TrackLine>
						<End x="37.75" y="96.31"/>
					</TrackLine>
					<TrackLine>
						<End x="37.168" y="96.892"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="116"/>
				<Subwire width="0.2">
					<Start x="52.75" y="93.75"/>
					<TrackLine>
						<End x="52.75" y="95.9222"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="115"/>
				<Subwire width="0.2">
					<Start x="30.704" y="96.9601"/>
					<TrackLine>
						<End x="36.36" y="102.6161"/>
					</TrackLine>
					<TrackLine>
						<End x="47.1987" y="102.6161"/>
					</TrackLine>
					<TrackLine>
						<End x="54" y="95.8149"/>
					</TrackLine>
					<TrackLine>
						<End x="54" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="17.5" y="94.45"/>
					<TrackLine>
						<End x="17.5" y="95.8"/>
					</TrackLine>
					<TrackLine>
						<End x="23" y="101.3"/>
					</TrackLine>
					<TrackLine>
						<End x="29.3416" y="101.3"/>
					</TrackLine>
					<TrackLine>
						<End x="31.4578" y="103.4161"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4881" y="103.4161"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="54.75" y="47.7"/>
					<TrackLine>
						<End x="54.75" y="46.1967"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1361" y="45.5827"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1361" y="43.2241"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="42.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="56" y="47.7"/>
					<TrackLine>
						<End x="56" y="46.304"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="112"/>
				<Subwire width="0.2">
					<Start x="61.5" y="93.75"/>
					<TrackLine>
						<End x="61.5" y="88.3149"/>
					</TrackLine>
					<TrackLine>
						<End x="62.2161" y="87.5988"/>
					</TrackLine>
					<TrackLine>
						<End x="62.2161" y="85.6481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="57.25" y="47.7"/>
					<TrackLine>
						<End x="57.25" y="45.938"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="111"/>
				<Subwire width="0.2">
					<Start x="62.75" y="93.75"/>
					<TrackLine>
						<End x="62.75" y="95.3753"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6401" y="97.2654"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6401" y="101.8081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="48.25" y="74"/>
					<TrackLine>
						<End x="48.25" y="72.2094"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5688" y="71.8906"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5688" y="70.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="74" y="47.75"/>
					<TrackLine>
						<End x="74" y="44.912"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="19.25" y="74"/>
					<TrackLine>
						<End x="19.25" y="72.121"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="71.979"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="70.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="78.25" y="74"/>
					<TrackLine>
						<End x="78.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="77.842" y="75.958"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5681" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="48.25" y="74"/>
					<TrackLine>
						<End x="48.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="47.65" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="47.65" y="76.752"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6721" y="76.7741"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6721" y="77.7759"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5018" y="78.6056"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5018" y="85.6263"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="49.25" y="74"/>
					<TrackLine>
						<End x="49.25" y="75.6073"/>
					</TrackLine>
					<TrackLine>
						<End x="49.266" y="75.6233"/>
					</TrackLine>
					<TrackLine>
						<End x="49.266" y="76.8137"/>
					</TrackLine>
					<TrackLine>
						<End x="48.866" y="77.2137"/>
					</TrackLine>
					<TrackLine>
						<End x="48.866" y="78.4041"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3098" y="78.848"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3098" y="87.2423"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="87.2641"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="89.6881"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="90.4961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="79.25" y="74"/>
					<TrackLine>
						<End x="79.25" y="64.8986"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1441" y="60.7927"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1441" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="72.386" y="57.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="20.25" y="74"/>
					<TrackLine>
						<End x="20.25" y="71.6"/>
					</TrackLine>
					<TrackLine>
						<End x="21.008" y="70.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="72.75" y="47.75"/>
					<TrackLine>
						<End x="72.75" y="49.1791"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="49.209"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="71.5" y="47.75"/>
					<TrackLine>
						<End x="71.5" y="50.7778"/>
					</TrackLine>
					<TrackLine>
						<End x="71.1041" y="51.1737"/>
					</TrackLine>
					<TrackLine>
						<End x="71.1041" y="53.6594"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="50.25" y="74"/>
					<TrackLine>
						<End x="50.25" y="77.5027"/>
					</TrackLine>
					<TrackLine>
						<End x="50.482" y="77.7347"/>
					</TrackLine>
					<TrackLine>
						<End x="50.482" y="81.7848"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="82.1707"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="80.25" y="74"/>
					<TrackLine>
						<End x="80.25" y="71.6967"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9921" y="71.4388"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9921" y="63.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="63.0241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="24.24" y="59.7921"/>
					<TrackLine>
						<End x="24.24" y="65.1065"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="67.5305"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="71.1767"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="71.7427"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="82.25" y="74"/>
					<TrackLine>
						<End x="82.25" y="66.6081"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="66.442"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="52.25" y="74"/>
					<TrackLine>
						<End x="52.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="52.558" y="75.858"/>
					</TrackLine>
					<TrackLine>
						<End x="52.558" y="79.2854"/>
					</TrackLine>
					<TrackLine>
						<End x="52.235" y="79.6084"/>
					</TrackLine>
					<TrackLine>
						<End x="52.235" y="86.5711"/>
					</TrackLine>
					<TrackLine>
						<End x="51.142" y="87.6641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="30.1384" y="57.1258"/>
					<TrackLine>
						<End x="27.35" y="59.9141"/>
					</TrackLine>
					<TrackLine>
						<End x="27.35" y="64.2888"/>
					</TrackLine>
					<TrackLine>
						<End x="23.25" y="68.3888"/>
					</TrackLine>
					<TrackLine>
						<End x="23.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="70.25" y="47.75"/>
					<TrackLine>
						<End x="70.25" y="52.4203"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8362" y="52.834"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8362" y="56.9623"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="52.25" y="74"/>
					<TrackLine>
						<End x="52.25" y="70.0928"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1281" y="69.2148"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1281" y="67.253"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="64.629"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="62.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="60.4582"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="57.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="64.2649" y="56.1849"/>
					<TrackLine>
						<End x="64.2649" y="57.3275"/>
					</TrackLine>
					<TrackLine>
						<End x="66.2042" y="59.2669"/>
					</TrackLine>
					<TrackLine>
						<End x="66.8736" y="59.2669"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0282" y="57.1123"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0282" y="56.3619"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0801" y="56.31"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0801" y="55.3093"/>
					</TrackLine>
					<TrackLine>
						<End x="69" y="55.2292"/>
					</TrackLine>
					<TrackLine>
						<End x="69" y="47.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="24.25" y="74"/>
					<TrackLine>
						<End x="24.25" y="76.7314"/>
					</TrackLine>
					<TrackLine>
						<End x="24.4767" y="76.9581"/>
					</TrackLine>
					<TrackLine>
						<End x="24.4767" y="78.9474"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="83.25" y="74"/>
					<TrackLine>
						<End x="83.25" y="71.4647"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2241" y="71.4388"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2241" y="62.1237"/>
					</TrackLine>
					<TrackLine>
						<End x="85.5557" y="59.7921"/>
					</TrackLine>
					<TrackLine>
						<End x="87.1339" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="53.25" y="74"/>
					<TrackLine>
						<End x="53.25" y="78.54"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3281" y="78.6181"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3281" y="82.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="66.5389" y="58.4589"/>
					<TrackLine>
						<End x="68.6282" y="56.3696"/>
					</TrackLine>
					<TrackLine>
						<End x="68.6282" y="56.1962"/>
					</TrackLine>
					<TrackLine>
						<End x="68.6801" y="56.1443"/>
					</TrackLine>
					<TrackLine>
						<End x="68.6801" y="55.475"/>
					</TrackLine>
					<TrackLine>
						<End x="67.75" y="54.5449"/>
					</TrackLine>
					<TrackLine>
						<End x="67.75" y="47.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="84.25" y="74"/>
					<TrackLine>
						<End x="84.25" y="75.7026"/>
					</TrackLine>
					<TrackLine>
						<End x="85.3134" y="76.766"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9828" y="76.766"/>
					</TrackLine>
					<TrackLine>
						<End x="86.8531" y="75.8957"/>
					</TrackLine>
					<TrackLine>
						<End x="86.8531" y="61.7813"/>
					</TrackLine>
					<TrackLine>
						<End x="88.8801" y="59.7542"/>
					</TrackLine>
					<TrackLine>
						<End x="88.8801" y="58.1761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="56.5601" y="88.8801"/>
					<TrackLine>
						<End x="54.1361" y="86.4561"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1361" y="82.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="54.25" y="81.9675"/>
					</TrackLine>
					<TrackLine>
						<End x="54.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="25.25" y="74"/>
					<TrackLine>
						<End x="25.25" y="78.5781"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="79.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="80.8001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="26.25" y="74"/>
					<TrackLine>
						<End x="26.25" y="79.0124"/>
					</TrackLine>
					<TrackLine>
						<End x="26.664" y="79.4264"/>
					</TrackLine>
					<TrackLine>
						<End x="26.664" y="81.1348"/>
					</TrackLine>
					<TrackLine>
						<End x="26.0194" y="81.7794"/>
					</TrackLine>
					<TrackLine>
						<End x="26.0194" y="83.1508"/>
					</TrackLine>
					<TrackLine>
						<End x="26.5784" y="83.7098"/>
					</TrackLine>
					<TrackLine>
						<End x="27.721" y="83.7098"/>
					</TrackLine>
					<TrackLine>
						<End x="28.0434" y="84.0321"/>
					</TrackLine>
					<TrackLine>
						<End x="29.088" y="84.0321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="55.25" y="74"/>
					<TrackLine>
						<End x="55.25" y="78.4261"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="78.732"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="82.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="85.25" y="74"/>
					<TrackLine>
						<End x="85.25" y="71.374"/>
					</TrackLine>
					<TrackLine>
						<End x="85.2481" y="69.4881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="66.5" y="47.75"/>
					<TrackLine>
						<End x="66.5" y="54.4376"/>
					</TrackLine>
					<TrackLine>
						<End x="67.8721" y="55.8096"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="65.25" y="47.75"/>
					<TrackLine>
						<End x="65.25" y="54.057"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="56.283"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="58.1761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="86.25" y="74"/>
					<TrackLine>
						<End x="86.25" y="69.3473"/>
					</TrackLine>
					<TrackLine>
						<End x="85.6481" y="68.7454"/>
					</TrackLine>
					<TrackLine>
						<End x="85.6481" y="61.4081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="27.25" y="74"/>
					<TrackLine>
						<End x="27.25" y="81.1145"/>
					</TrackLine>
					<TrackLine>
						<End x="26.8274" y="81.5371"/>
					</TrackLine>
					<TrackLine>
						<End x="26.8274" y="82.8161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="27.25" y="74"/>
					<TrackLine>
						<End x="27.25" y="70.4475"/>
					</TrackLine>
					<TrackLine>
						<End x="26.264" y="69.4615"/>
					</TrackLine>
					<TrackLine>
						<End x="26.264" y="66.041"/>
					</TrackLine>
					<TrackLine>
						<End x="27.75" y="64.555"/>
					</TrackLine>
					<TrackLine>
						<End x="27.75" y="60.5044"/>
					</TrackLine>
					<TrackLine>
						<End x="30.3207" y="57.9338"/>
					</TrackLine>
					<TrackLine>
						<End x="30.473" y="57.9338"/>
					</TrackLine>
					<TrackLine>
						<End x="30.9464" y="57.4604"/>
					</TrackLine>
					<TrackLine>
						<End x="30.9464" y="56.7911"/>
					</TrackLine>
					<TrackLine>
						<End x="30.473" y="56.3178"/>
					</TrackLine>
					<TrackLine>
						<End x="29.6537" y="56.3178"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1892" y="53.8532"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1892" y="53.0452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="56.25" y="74"/>
					<TrackLine>
						<End x="56.25" y="80.848"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="81.1581"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="75.25" y="56.5"/>
					<TrackLine>
						<End x="75.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5229" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="74.1208" y="55.3521"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="45.25" y="56.5"/>
					<TrackLine>
						<End x="45.25" y="58.3161"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="59.3921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="16.16" y="61.4081"/>
					<TrackLine>
						<End x="16.16" y="59.37"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="59.28"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="17.776" y="77.5681"/>
					<TrackLine>
						<End x="17.2047" y="76.9968"/>
					</TrackLine>
					<TrackLine>
						<End x="16.8825" y="76.9968"/>
					</TrackLine>
					<TrackLine>
						<End x="14.952" y="75.0662"/>
					</TrackLine>
					<TrackLine>
						<End x="14.952" y="70.7936"/>
					</TrackLine>
					<TrackLine>
						<End x="15.352" y="70.3936"/>
					</TrackLine>
					<TrackLine>
						<End x="15.352" y="63.3588"/>
					</TrackLine>
					<TrackLine>
						<End x="16.968" y="61.7428"/>
					</TrackLine>
					<TrackLine>
						<End x="16.968" y="59.4574"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="59.1754"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="17.25" y="56.5"/>
					<TrackLine>
						<End x="17.25" y="50.0344"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9" y="49.3844"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9" y="48.2743"/>
					</TrackLine>
					<TrackLine>
						<End x="19.45" y="46.7243"/>
					</TrackLine>
					<TrackLine>
						<End x="19.45" y="44.81"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2997" y="44.6597"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2997" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="76.25" y="56.5"/>
					<TrackLine>
						<End x="76.25" y="58.701"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9521" y="58.999"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9521" y="60.458"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="46.25" y="56.5"/>
					<TrackLine>
						<End x="46.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="47.4207" y="59.2207"/>
					</TrackLine>
					<TrackLine>
						<End x="47.9087" y="59.2207"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="20.608" y="42.0161"/>
					<TrackLine>
						<End x="20.608" y="46.2503"/>
					</TrackLine>
					<TrackLine>
						<End x="18.584" y="48.2743"/>
					</TrackLine>
					<TrackLine>
						<End x="18.584" y="49.2661"/>
					</TrackLine>
					<TrackLine>
						<End x="18.25" y="49.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="18.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="47.25" y="56.5"/>
					<TrackLine>
						<End x="47.25" y="54.5581"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="77.25" y="56.5"/>
					<TrackLine>
						<End x="77.25" y="54.626"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9521" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="48.25" y="56.5"/>
					<TrackLine>
						<End x="48.25" y="58.4193"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="59.4574"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="61.7428"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7614" y="62.2161"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4307" y="62.2161"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8967" y="61.7501"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1121" y="61.7501"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="19.25" y="56.5"/>
					<TrackLine>
						<End x="19.25" y="49.8937"/>
					</TrackLine>
					<TrackLine>
						<End x="20.85" y="48.2937"/>
					</TrackLine>
					<TrackLine>
						<End x="20.85" y="47.5064"/>
					</TrackLine>
					<TrackLine>
						<End x="21.416" y="46.9403"/>
					</TrackLine>
					<TrackLine>
						<End x="21.416" y="41.6814"/>
					</TrackLine>
					<TrackLine>
						<End x="20.9427" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="77.5206" y="61.5479"/>
					<TrackLine>
						<End x="78.25" y="60.8185"/>
					</TrackLine>
					<TrackLine>
						<End x="78.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="49.25" y="56.5"/>
					<TrackLine>
						<End x="49.25" y="58.5404"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="59.3864"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="61.4081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="79.25" y="56.5"/>
					<TrackLine>
						<End x="79.25" y="58.5513"/>
					</TrackLine>
					<TrackLine>
						<End x="79.4474" y="58.7487"/>
					</TrackLine>
					<TrackLine>
						<End x="79.4474" y="60.058"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="20.25" y="56.5"/>
					<TrackLine>
						<End x="20.25" y="58.288"/>
					</TrackLine>
					<TrackLine>
						<End x="19.792" y="58.746"/>
					</TrackLine>
					<TrackLine>
						<End x="19.792" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="83.25" y="56.5"/>
					<TrackLine>
						<End x="83.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="82.8744" y="58.4256"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0742" y="58.4256"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9657" y="58.5341"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9086" y="58.5341"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="24.25" y="56.5"/>
					<TrackLine>
						<End x="24.25" y="53.74"/>
					</TrackLine>
					<TrackLine>
						<End x="24.24" y="53.73"/>
					</TrackLine>
					<TrackLine>
						<End x="24.24" y="51.7121"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="53.25" y="56.5"/>
					<TrackLine>
						<End x="53.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7659" y="58.5341"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5914" y="58.5341"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="82.25" y="56.5"/>
					<TrackLine>
						<End x="82.25" y="54.8261"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="54.66"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="53.7281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="23.25" y="56.5"/>
					<TrackLine>
						<End x="23.25" y="53.8448"/>
					</TrackLine>
					<TrackLine>
						<End x="23.432" y="53.6628"/>
					</TrackLine>
					<TrackLine>
						<End x="23.432" y="47.1987"/>
					</TrackLine>
					<TrackLine>
						<End x="25.048" y="45.5827"/>
					</TrackLine>
					<TrackLine>
						<End x="25.048" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="24.24" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="52.25" y="56.5"/>
					<TrackLine>
						<End x="52.25" y="54.812"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="54.2741"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="80.8953" y="76.0473"/>
					<TrackLine>
						<End x="80.8953" y="76.9995"/>
					</TrackLine>
					<TrackLine>
						<End x="77.8639" y="80.031"/>
					</TrackLine>
					<TrackLine>
						<End x="77.8639" y="91.0083"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7601" y="92.1121"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9521" y="92.1121"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="81.25" y="56.5"/>
					<TrackLine>
						<End x="81.25" y="53.7515"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0814" y="52.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="82.3508" y="52.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5141" y="52.7567"/>
					</TrackLine>
					<TrackLine>
						<End x="83.4608" y="52.7567"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="22.25" y="56.5"/>
					<TrackLine>
						<End x="22.25" y="54.0967"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="53.6628"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="47.6721"/>
					</TrackLine>
					<TrackLine>
						<End x="24.24" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="17.776" y="71.1041"/>
					<TrackLine>
						<End x="17.776" y="69.5805"/>
					</TrackLine>
					<TrackLine>
						<End x="22.25" y="65.1065"/>
					</TrackLine>
					<TrackLine>
						<End x="22.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="51.25" y="56.5"/>
					<TrackLine>
						<End x="51.25" y="54.482"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="78"/>
				<Subwire width="0.2">
					<Start x="59.5" y="61.25"/>
					<TrackLine>
						<End x="59.5" y="58.6926"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9841" y="58.1767"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9841" y="57.5073"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9768" y="56.5"/>
					</TrackLine>
					<TrackLine>
						<End x="56.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="78"/>
				<Subwire width="0.2">
					<Start x="59" y="93.75"/>
					<TrackLine>
						<End x="59" y="73.2159"/>
					</TrackLine>
					<TrackLine>
						<End x="57.95" y="72.1659"/>
					</TrackLine>
					<TrackLine>
						<End x="57.95" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="77"/>
				<Subwire width="0.2">
					<Start x="42" y="61.25"/>
					<TrackLine>
						<End x="40.45" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="32.1464" y="52.9464"/>
					</TrackLine>
					<TrackLine>
						<End x="32.1464" y="52.2846"/>
					</TrackLine>
					<TrackLine>
						<End x="31.1023" y="51.2405"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4329" y="51.2405"/>
					</TrackLine>
					<TrackLine>
						<End x="29.896" y="51.7774"/>
					</TrackLine>
					<TrackLine>
						<End x="29.896" y="55.2788"/>
					</TrackLine>
					<TrackLine>
						<End x="30.535" y="55.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="30.6387" y="55.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="31.3464" y="56.6254"/>
					</TrackLine>
					<TrackLine>
						<End x="31.3464" y="57.6261"/>
					</TrackLine>
					<TrackLine>
						<End x="29.1724" y="59.8001"/>
					</TrackLine>
					<TrackLine>
						<End x="29.02" y="59.8001"/>
					</TrackLine>
					<TrackLine>
						<End x="28.15" y="60.6701"/>
					</TrackLine>
					<TrackLine>
						<End x="28.15" y="64.7207"/>
					</TrackLine>
					<TrackLine>
						<End x="26.664" y="66.2067"/>
					</TrackLine>
					<TrackLine>
						<End x="26.664" y="69.0465"/>
					</TrackLine>
					<TrackLine>
						<End x="28.065" y="70.4475"/>
					</TrackLine>
					<TrackLine>
						<End x="28.065" y="80.5851"/>
					</TrackLine>
					<TrackLine>
						<End x="29.896" y="82.4161"/>
					</TrackLine>
					<TrackLine>
						<End x="29.896" y="84.3668"/>
					</TrackLine>
					<TrackLine>
						<End x="28.329" y="85.9338"/>
					</TrackLine>
					<TrackLine>
						<End x="26.0437" y="85.9338"/>
					</TrackLine>
					<TrackLine>
						<End x="25.048" y="86.9294"/>
					</TrackLine>
					<TrackLine>
						<End x="25.048" y="96.4407"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6234" y="103.0161"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5339" y="103.0161"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="95.3"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="77"/>
				<Subwire width="0.2">
					<Start x="42" y="61.25"/>
					<TrackLine>
						<End x="42" y="62.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="76"/>
				<Subwire width="0.2">
					<Start x="57.75" y="93.75"/>
					<TrackLine>
						<End x="57.75" y="89.3986"/>
					</TrackLine>
					<TrackLine>
						<End x="57.7681" y="89.3805"/>
					</TrackLine>
					<TrackLine>
						<End x="57.7681" y="86.7637"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="86.3637"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="76.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="75.9521"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="76"/>
				<Subwire width="0.2">
					<Start x="56.5601" y="67.8601"/>
					<TrackLine>
						<End x="56.5601" y="71.9459"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="73.5619"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="75.9521"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="75"/>
				<Subwire width="0.2">
					<Start x="56.5" y="93.75"/>
					<TrackLine>
						<End x="56.5" y="90.0829"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="89.2148"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="86.9294"/>
					</TrackLine>
					<TrackLine>
						<End x="56.9601" y="86.5214"/>
					</TrackLine>
					<TrackLine>
						<End x="56.9601" y="72.9115"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5441" y="70.4955"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5441" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="74"/>
				<Subwire width="0.2">
					<Start x="89.5" y="61.25"/>
					<TrackLine>
						<End x="89.5" y="58.6989"/>
					</TrackLine>
					<TrackLine>
						<End x="89.6881" y="58.5108"/>
					</TrackLine>
					<TrackLine>
						<End x="89.6881" y="57.8414"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3467" y="56.5"/>
					</TrackLine>
					<TrackLine>
						<End x="86.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="74"/>
				<Subwire width="0.2">
					<Start x="69" y="93.75"/>
					<TrackLine>
						<End x="69" y="95.3"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0841" y="99.3841"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9028" y="99.3841"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2241" y="94.0628"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2241" y="81.1437"/>
					</TrackLine>
					<TrackLine>
						<End x="88.4721" y="75.8957"/>
					</TrackLine>
					<TrackLine>
						<End x="88.4721" y="70.5863"/>
					</TrackLine>
					<TrackLine>
						<End x="87.55" y="69.6642"/>
					</TrackLine>
					<TrackLine>
						<End x="87.55" y="61.65"/>
					</TrackLine>
					<TrackLine>
						<End x="87.95" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="89.5" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="73"/>
				<Subwire width="0.2">
					<Start x="72" y="62.25"/>
					<TrackLine>
						<End x="69.4851" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="66.5" y="65.2351"/>
					</TrackLine>
					<TrackLine>
						<End x="66.5" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="73"/>
				<Subwire width="0.2">
					<Start x="72" y="62.25"/>
					<TrackLine>
						<End x="72" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="72"/>
				<Subwire width="0.2">
					<Start x="67.75" y="93.75"/>
					<TrackLine>
						<End x="67.75" y="89.9007"/>
					</TrackLine>
					<TrackLine>
						<End x="67.0641" y="89.2148"/>
					</TrackLine>
					<TrackLine>
						<End x="67.0641" y="88.5454"/>
					</TrackLine>
					<TrackLine>
						<End x="67.8721" y="87.7374"/>
					</TrackLine>
					<TrackLine>
						<End x="67.8721" y="75.1441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="71"/>
				<Subwire width="0.2">
					<Start x="65.25" y="93.75"/>
					<TrackLine>
						<End x="65.25" y="87.7969"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4481" y="87.5988"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4481" y="86.9294"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6401" y="86.1214"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6401" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="25.856" y="61.4081"/>
					<TrackLine>
						<End x="25.856" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9901" y="60.466"/>
					</TrackLine>
					<TrackLine>
						<End x="26.1907" y="60.466"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="59.4067"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="36.5" y="93.75"/>
					<TrackLine>
						<End x="36.5" y="92.2"/>
					</TrackLine>
					<TrackLine>
						<End x="34.8125" y="90.5125"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4507" y="90.5125"/>
					</TrackLine>
					<TrackLine>
						<End x="34.275" y="90.3368"/>
					</TrackLine>
					<TrackLine>
						<End x="34.275" y="82.863"/>
					</TrackLine>
					<TrackLine>
						<End x="34.744" y="82.394"/>
					</TrackLine>
					<TrackLine>
						<End x="34.744" y="71.254"/>
					</TrackLine>
					<TrackLine>
						<End x="33.936" y="70.446"/>
					</TrackLine>
					<TrackLine>
						<End x="33.936" y="61.4081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="30.5" y="61.25"/>
					<TrackLine>
						<End x="32.97" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="33.128" y="61.4081"/>
					</TrackLine>
					<TrackLine>
						<End x="33.936" y="61.4081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="69"/>
				<Subwire width="0.2">
					<Start x="30.25" y="93.75"/>
					<TrackLine>
						<End x="30.25" y="91.6581"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="69"/>
				<Subwire width="0.2">
					<Start x="13" y="61.25"/>
					<TrackLine>
						<End x="13" y="59.8641"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="69"/>
				<Subwire width="0.2">
					<Start x="13" y="62.25"/>
					<TrackLine>
						<End x="13" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="NET00032"/>
				<Subwire width="0.2">
					<Start x="92.2" y="91.5"/>
					<TrackLine>
						<End x="90.85" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="90.85" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="108"/>
				<Subwire width="0.2">
					<Start x="79.1358" y="89"/>
					<TrackLine>
						<End x="81" y="89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="108"/>
				<Subwire width="0.2">
					<Start x="79.1358" y="89"/>
					<TrackLine>
						<End x="79.1358" y="88.9284"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="108"/>
				<Subwire width="0.2">
					<Start x="71.5" y="93.75"/>
					<TrackLine>
						<End x="71.5" y="95.3"/>
					</TrackLine>
					<TrackLine>
						<End x="74.29" y="95.3"/>
					</TrackLine>
					<TrackLine>
						<End x="74.722" y="94.8679"/>
					</TrackLine>
					<TrackLine>
						<End x="74.722" y="94.2155"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6174" y="93.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1178" y="93.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1358" y="90.3021"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1358" y="89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="108"/>
				<Subwire width="0.2">
					<Start x="92.2" y="90.25"/>
					<TrackLine>
						<End x="93.55" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="93.9298" y="90.6298"/>
					</TrackLine>
					<TrackLine>
						<End x="93.9298" y="91.9871"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="21.25" y="56.5"/>
					<TrackLine>
						<End x="21.25" y="47.6721"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="47.106"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="20.9" y="40.292"/>
					</TrackLine>
					<TrackLine>
						<End x="20.9" y="38.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="32.32" y="50.0961"/>
					<TrackLine>
						<End x="32.32" y="49.2041"/>
					</TrackLine>
					<TrackLine>
						<End x="32.25" y="49.134"/>
					</TrackLine>
					<TrackLine>
						<End x="32.25" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="30.5" y="62.25"/>
					<TrackLine>
						<End x="28.95" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="28.95" y="61.0015"/>
					</TrackLine>
					<TrackLine>
						<End x="29.3514" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="36.36" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="38.784" y="63.0241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="17.776" y="66.2561"/>
					<TrackLine>
						<End x="17.776" y="62.9508"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="59.4768"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="44.75" y="47.7"/>
					<TrackLine>
						<End x="44.05" y="47.7"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6321" y="48.1179"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6321" y="48.4801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="76.25" y="74"/>
					<TrackLine>
						<End x="76.25" y="78.4129"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="80.3268"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="79.1841" y="93.7281"/>
					<TrackLine>
						<End x="78.0414" y="93.7281"/>
					</TrackLine>
					<TrackLine>
						<End x="77.4931" y="93.1798"/>
					</TrackLine>
					<TrackLine>
						<End x="77.4931" y="92.5105"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5358" y="90.4678"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5358" y="90.3642"/>
					</TrackLine>
					<TrackLine>
						<End x="79.65" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="90.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.1121" y="69.4881"/>
					<TrackLine>
						<End x="92.1121" y="48.7278"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="48.64"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="44.1933"/>
					</TrackLine>
					<TrackLine>
						<End x="88.4068" y="40.4001"/>
					</TrackLine>
					<TrackLine>
						<End x="87.7374" y="40.4001"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4561" y="39.1187"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4561" y="35.2174"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="34.4094"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="32.1353"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.1121" y="69.4881"/>
					<TrackLine>
						<End x="91.0604" y="69.4881"/>
					</TrackLine>
					<TrackLine>
						<End x="90.6985" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3015" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="87.95" y="69.4985"/>
					</TrackLine>
					<TrackLine>
						<End x="87.95" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="89.5" y="62.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="50.25" y="56.5"/>
					<TrackLine>
						<End x="50.25" y="58.5404"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9201" y="61.2104"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9201" y="62.0848"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3888" y="62.6161"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0561" y="62.6161"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="61.8081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="13" y="63.25"/>
					<TrackLine>
						<End x="11.45" y="63.25"/>
					</TrackLine>
					<TrackLine>
						<End x="9.696" y="65.004"/>
					</TrackLine>
					<TrackLine>
						<End x="9.696" y="67.8721"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="72" y="63.25"/>
					<TrackLine>
						<End x="73.55" y="63.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="73.55" y="63.25"/>
					<TrackLine>
						<End x="73.55" y="60.7144"/>
					</TrackLine>
					<TrackLine>
						<End x="71.178" y="58.3424"/>
					</TrackLine>
					<TrackLine>
						<End x="71.178" y="57.3416"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1201" y="55.3996"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1201" y="54.5441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="76.25" y="74"/>
					<TrackLine>
						<End x="76.25" y="65.95"/>
					</TrackLine>
					<TrackLine>
						<End x="73.55" y="63.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.784" y="84.0321"/>
					<TrackLine>
						<End x="45.2481" y="77.5681"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74" y="93.75"/>
					<TrackLine>
						<End x="74" y="92.2"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7379" y="91.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9379" y="91.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="76.125" y="90.275"/>
					</TrackLine>
					<TrackLine>
						<End x="76.125" y="89.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74.3361" y="87.2641"/>
					<TrackLine>
						<End x="74.6641" y="87.2641"/>
					</TrackLine>
					<TrackLine>
						<End x="76.125" y="88.725"/>
					</TrackLine>
					<TrackLine>
						<End x="76.125" y="89.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="59.5" y="62.25"/>
					<TrackLine>
						<End x="61.05" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="61.458" y="62.658"/>
					</TrackLine>
					<TrackLine>
						<End x="61.458" y="63.0241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="42" y="63.25"/>
					<TrackLine>
						<End x="40.45" y="63.25"/>
					</TrackLine>
					<TrackLine>
						<End x="40.2241" y="63.0241"/>
					</TrackLine>
					<TrackLine>
						<End x="38.784" y="63.0241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="62.75" y="47.75"/>
					<TrackLine>
						<End x="62.75" y="45.5571"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="45.283"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="11.25" y="94.45"/>
					<TrackLine>
						<End x="11.25" y="95.9451"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="96.0071"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81" y="94"/>
					<TrackLine>
						<End x="79.456" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="93.7281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38" y="89.575"/>
					<TrackLine>
						<End x="37.7125" y="89.575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="37.168" y="91.7254"/>
					<TrackLine>
						<End x="37.168" y="90.8236"/>
					</TrackLine>
					<TrackLine>
						<End x="36.8629" y="90.5184"/>
					</TrackLine>
					<TrackLine>
						<End x="36.8629" y="90.4246"/>
					</TrackLine>
					<TrackLine>
						<End x="37.7125" y="89.575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="37.7125" y="89.575"/>
					<TrackLine>
						<End x="35.5" y="89.575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="18.75" y="34.55"/>
					<TrackLine>
						<End x="18.75" y="33.2"/>
					</TrackLine>
					<TrackLine>
						<End x="16.55" y="31"/>
					</TrackLine>
					<TrackLine>
						<End x="14.5" y="31"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="16.88" y="23.02"/>
					<TrackLine>
						<End x="16.88" y="27.845"/>
					</TrackLine>
					<TrackLine>
						<End x="14.5" y="30.225"/>
					</TrackLine>
					<TrackLine>
						<End x="14.5" y="31"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="95.3441" y="90.4961"/>
					<TrackLine>
						<End x="95.3441" y="91.7155"/>
					</TrackLine>
					<TrackLine>
						<End x="94.2645" y="92.7951"/>
					</TrackLine>
					<TrackLine>
						<End x="93.5951" y="92.7951"/>
					</TrackLine>
					<TrackLine>
						<End x="93.55" y="92.75"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="51.5889" y="40.6648"/>
					<TrackLine>
						<End x="51.5889" y="45.7611"/>
					</TrackLine>
					<TrackLine>
						<End x="51" y="46.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="51" y="46.35"/>
					<TrackLine>
						<End x="44.75" y="46.35"/>
					</TrackLine>
					<TrackLine>
						<End x="44.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="51" y="47.7"/>
					<TrackLine>
						<End x="51" y="46.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="93.55" y="89"/>
					<TrackLine>
						<End x="94.4748" y="89.9248"/>
					</TrackLine>
					<TrackLine>
						<End x="94.7728" y="89.9248"/>
					</TrackLine>
					<TrackLine>
						<End x="95.3441" y="90.4961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="93.55" y="89"/>
					<TrackLine>
						<End x="93.55" y="86.2101"/>
					</TrackLine>
					<TrackLine>
						<End x="92.1121" y="84.7722"/>
					</TrackLine>
					<TrackLine>
						<End x="92.1121" y="69.4881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.2" y="89"/>
					<TrackLine>
						<End x="93.55" y="89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="20.9" y="38.05"/>
					<TrackLine>
						<End x="18.75" y="35.9"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="34.55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="20.9" y="38.05"/>
					<TrackLine>
						<End x="24.6487" y="38.05"/>
					</TrackLine>
					<TrackLine>
						<End x="27.472" y="40.8734"/>
					</TrackLine>
					<TrackLine>
						<End x="27.472" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="26" y="47.7"/>
					<TrackLine>
						<End x="26" y="46.35"/>
					</TrackLine>
					<TrackLine>
						<End x="26.5306" y="45.8194"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9007" y="45.8194"/>
					</TrackLine>
					<TrackLine>
						<End x="27.472" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="17.25" y="74"/>
					<TrackLine>
						<End x="17.25" y="71.7208"/>
					</TrackLine>
					<TrackLine>
						<End x="16.968" y="71.4388"/>
					</TrackLine>
					<TrackLine>
						<End x="16.968" y="69.8228"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="69.0148"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="66.2561"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="46.25" y="74"/>
					<TrackLine>
						<End x="46.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="45.842" y="75.958"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="84" y="47.7"/>
					<TrackLine>
						<End x="84" y="46.35"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0901" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8494" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="77.75" y="45.5395"/>
					</TrackLine>
					<TrackLine>
						<End x="77.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74.3361" y="49.8303"/>
					<TrackLine>
						<End x="74.3361" y="52.5201"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="80.25" y="56.5"/>
					<TrackLine>
						<End x="80.25" y="54.8673"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9028" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="52.5201"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74.3361" y="52.5201"/>
					<TrackLine>
						<End x="73.1201" y="53.7361"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1201" y="54.5441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="77.75" y="47.7"/>
					<TrackLine>
						<End x="76.4664" y="47.7"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="49.8303"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.2" y="94"/>
					<TrackLine>
						<End x="92.2" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="NET00031"/>
				<Subwire width="0.2">
					<Start x="81" y="87.75"/>
					<TrackLine>
						<End x="82.35" y="87.75"/>
					</TrackLine>
					<TrackLine>
						<End x="82.35" y="92.75"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="37"/>
				<Subwire width="0.2">
					<Start x="27.75" y="93.75"/>
					<TrackLine>
						<End x="27.75" y="95.3"/>
					</TrackLine>
					<TrackLine>
						<End x="27.7059" y="95.3441"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="95.3441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="57"/>
				<Subwire width="0.2">
					<Start x="35.5" y="86.5"/>
					<TrackLine>
						<End x="35.5" y="85.4653"/>
					</TrackLine>
					<TrackLine>
						<End x="35.552" y="85.4132"/>
					</TrackLine>
					<TrackLine>
						<End x="35.552" y="84.508"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="57"/>
				<Subwire width="0.2">
					<Start x="17.5" y="83.25"/>
					<TrackLine>
						<End x="17.5" y="85.6481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="77.5681" y="98.5761"/>
					<TrackLine>
						<End x="75.1441" y="96.1521"/>
					</TrackLine>
					<TrackLine>
						<End x="71.1021" y="96.1521"/>
					</TrackLine>
					<TrackLine>
						<End x="70.25" y="95.3"/>
					</TrackLine>
					<TrackLine>
						<End x="70.25" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="81" y="91.5"/>
					<TrackLine>
						<End x="79.65" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2359" y="91.9141"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2359" y="92.0603"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="25.25" y="56.5"/>
					<TrackLine>
						<End x="25.25" y="59.052"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="59.658"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="84.25" y="56.5"/>
					<TrackLine>
						<End x="84.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="83.4744" y="58.8256"/>
					</TrackLine>
					<TrackLine>
						<End x="82.2399" y="58.8256"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6081" y="59.4574"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6081" y="63.3588"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="64.1668"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="71.1041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="54.25" y="56.5"/>
					<TrackLine>
						<End x="54.25" y="62.0848"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="64.6227"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="69.4881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="60.25" y="93.75"/>
					<TrackLine>
						<End x="60.25" y="88.4222"/>
					</TrackLine>
					<TrackLine>
						<End x="61.4081" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="58.5" y="47.7"/>
					<TrackLine>
						<End x="58.5" y="45.572"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="58.5" y="47.7"/>
					<TrackLine>
						<End x="58.5" y="50.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="25.856" y="40.4001"/>
					<TrackLine>
						<End x="25.856" y="45.794"/>
					</TrackLine>
					<TrackLine>
						<End x="25.3" y="46.35"/>
					</TrackLine>
					<TrackLine>
						<End x="25.3" y="50.6434"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="51.5934"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="84.0321" y="71.1041"/>
					<TrackLine>
						<End x="84.0321" y="61.8814"/>
					</TrackLine>
					<TrackLine>
						<End x="85.3134" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="87.4686" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="87.9419" y="60.1268"/>
					</TrackLine>
					<TrackLine>
						<End x="87.9419" y="59.4574"/>
					</TrackLine>
					<TrackLine>
						<End x="87.4686" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="86.1841" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="55.25" y="56.5"/>
					<TrackLine>
						<End x="55.25" y="59.9801"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="60.286"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="63.0241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="36" y="29"/>
					<TrackLine>
						<End x="36" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="36.495" y="30.145"/>
					</TrackLine>
					<TrackLine>
						<End x="36.495" y="33.936"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="22.25" y="38.75"/>
					<TrackLine>
						<End x="23.6" y="38.75"/>
					</TrackLine>
					<TrackLine>
						<End x="23.6" y="42.6561"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="57.25" y="29"/>
					<TrackLine>
						<End x="57.25" y="34.1781"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3441" y="36.084"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3441" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="77.25" y="74"/>
					<TrackLine>
						<End x="77.25" y="63.8487"/>
					</TrackLine>
					<TrackLine>
						<End x="71.578" y="58.1767"/>
					</TrackLine>
					<TrackLine>
						<End x="71.578" y="57.5073"/>
					</TrackLine>
					<TrackLine>
						<End x="72.1173" y="56.9681"/>
					</TrackLine>
					<TrackLine>
						<End x="74.242" y="56.9681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="17.776" y="59.7921"/>
					<TrackLine>
						<End x="17.776" y="61.5004"/>
					</TrackLine>
					<TrackLine>
						<End x="15.752" y="63.5244"/>
					</TrackLine>
					<TrackLine>
						<End x="15.752" y="70.5593"/>
					</TrackLine>
					<TrackLine>
						<End x="15.352" y="70.9593"/>
					</TrackLine>
					<TrackLine>
						<End x="15.352" y="74.9005"/>
					</TrackLine>
					<TrackLine>
						<End x="16.0015" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="18.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="18.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="47.25" y="74"/>
					<TrackLine>
						<End x="47.25" y="69.95"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8641" y="69.5641"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8641" y="66.2561"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="42" y="69.25"/>
					<TrackLine>
						<End x="43.55" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="43.55" y="54.2085"/>
					</TrackLine>
					<TrackLine>
						<End x="42.625" y="53.2835"/>
					</TrackLine>
					<TrackLine>
						<End x="42.625" y="48.3444"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0321" y="46.9374"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0321" y="42.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="56" y="29"/>
					<TrackLine>
						<End x="56" y="31.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="45.25" y="74"/>
					<TrackLine>
						<End x="45.25" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="42" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="42" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="59.5" y="68.25"/>
					<TrackLine>
						<End x="61.05" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="62.266" y="67.034"/>
					</TrackLine>
					<TrackLine>
						<End x="62.266" y="59.1732"/>
					</TrackLine>
					<TrackLine>
						<End x="59.66" y="56.5672"/>
					</TrackLine>
					<TrackLine>
						<End x="59.66" y="42.3573"/>
					</TrackLine>
					<TrackLine>
						<End x="58.5108" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4129" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6049" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="54.75" y="29"/>
					<TrackLine>
						<End x="54.75" y="33.6568"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6049" y="34.8019"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6049" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="59.5" y="68.25"/>
					<TrackLine>
						<End x="59.5" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="85.6481" y="33.936"/>
					<TrackLine>
						<End x="85.6481" y="39.4421"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5" y="40.294"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="88.8339" y="43.6782"/>
					<TrackLine>
						<End x="87.75" y="44.7622"/>
					</TrackLine>
					<TrackLine>
						<End x="87.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="72" y="69.25"/>
					<TrackLine>
						<End x="74.098" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="69.4881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="75.25" y="74"/>
					<TrackLine>
						<End x="75.25" y="70.402"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="69.4881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="89" y="47.7"/>
					<TrackLine>
						<End x="89" y="49.05"/>
					</TrackLine>
					<TrackLine>
						<End x="88.5253" y="49.5247"/>
					</TrackLine>
					<TrackLine>
						<End x="87.8355" y="49.5247"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="80.8001" y="38.784"/>
					<TrackLine>
						<End x="84.8401" y="34.744"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8401" y="33.6014"/>
					</TrackLine>
					<TrackLine>
						<End x="85.3134" y="33.128"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9828" y="33.128"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4561" y="33.6014"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4561" y="34.6517"/>
					</TrackLine>
					<TrackLine>
						<End x="86.0561" y="35.0517"/>
					</TrackLine>
					<TrackLine>
						<End x="86.0561" y="39.2844"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0721" y="41.3004"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0721" y="42.3507"/>
					</TrackLine>
					<TrackLine>
						<End x="88.5685" y="42.8471"/>
					</TrackLine>
					<TrackLine>
						<End x="89.1455" y="42.8471"/>
					</TrackLine>
					<TrackLine>
						<End x="90.25" y="43.9516"/>
					</TrackLine>
					<TrackLine>
						<End x="90.25" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="90.25" y="47.7"/>
					<TrackLine>
						<End x="90.25" y="60.2015"/>
					</TrackLine>
					<TrackLine>
						<End x="91.05" y="61.0015"/>
					</TrackLine>
					<TrackLine>
						<End x="91.05" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="89.5" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="89.5" y="69.25"/>
					<TrackLine>
						<End x="89.5" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="88.8801" y="42.0161"/>
					<TrackLine>
						<End x="91.5" y="44.6359"/>
					</TrackLine>
					<TrackLine>
						<End x="91.5" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="90.25" y="29"/>
					<TrackLine>
						<End x="90.25" y="34.848"/>
					</TrackLine>
					<TrackLine>
						<End x="90.4961" y="35.0941"/>
					</TrackLine>
					<TrackLine>
						<End x="90.4961" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="87.2641" y="38.784"/>
					<TrackLine>
						<End x="89.408" y="36.6402"/>
					</TrackLine>
					<TrackLine>
						<End x="89.408" y="35.0823"/>
					</TrackLine>
					<TrackLine>
						<End x="89" y="34.6743"/>
					</TrackLine>
					<TrackLine>
						<End x="89" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="16.16" y="71.2939"/>
					<TrackLine>
						<End x="16.16" y="72.231"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="72.321"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="13" y="69.25"/>
					<TrackLine>
						<End x="13" y="70.0371"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="70.109"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="71.1041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="NET00005"/>
				<Subwire width="0.2">
					<Start x="13.75" y="83.25"/>
					<TrackLine>
						<End x="13.75" y="70.6279"/>
					</TrackLine>
					<TrackLine>
						<End x="14.55" y="69.8279"/>
					</TrackLine>
					<TrackLine>
						<End x="14.55" y="60.2714"/>
					</TrackLine>
					<TrackLine>
						<End x="12.12" y="57.8414"/>
					</TrackLine>
					<TrackLine>
						<End x="12.12" y="56.2254"/>
					</TrackLine>
					<TrackLine>
						<End x="12.5" y="55.8454"/>
					</TrackLine>
					<TrackLine>
						<End x="12.5" y="45.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="30.5" y="68.25"/>
					<TrackLine>
						<End x="28.95" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="28.55" y="67.85"/>
					</TrackLine>
					<TrackLine>
						<End x="28.55" y="60.8358"/>
					</TrackLine>
					<TrackLine>
						<End x="29.1857" y="60.2001"/>
					</TrackLine>
					<TrackLine>
						<End x="29.3381" y="60.2001"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7464" y="57.7918"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7464" y="53.0273"/>
					</TrackLine>
					<TrackLine>
						<End x="30.7676" y="52.0485"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="87.75" y="29"/>
					<TrackLine>
						<End x="87.75" y="31.4785"/>
					</TrackLine>
					<TrackLine>
						<End x="88.6" y="32.3285"/>
					</TrackLine>
					<TrackLine>
						<End x="88.6" y="35.417"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="30.5" y="68.25"/>
					<TrackLine>
						<End x="30.5" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="NET00003"/>
				<Subwire width="0.2">
					<Start x="11.25" y="83.25"/>
					<TrackLine>
						<End x="11.25" y="81.7851"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="81.723"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="80.8001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="NET00003"/>
				<Subwire width="0.2">
					<Start x="15" y="45.75"/>
					<TrackLine>
						<End x="15" y="47.1593"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="49.2313"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="56.5601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="NET00003"/>
				<Subwire width="0.2">
					<Start x="15" y="45.75"/>
					<TrackLine>
						<End x="16.25" y="45.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.2">
					<Start x="13.75" y="45.75"/>
					<TrackLine>
						<End x="13.75" y="44.4"/>
					</TrackLine>
					<TrackLine>
						<End x="13.5534" y="44.2034"/>
					</TrackLine>
					<TrackLine>
						<End x="13.4994" y="44.2034"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="NET00001"/>
				<Subwire width="0.2">
					<Start x="17.5" y="45.75"/>
					<TrackLine>
						<End x="17.5" y="49.2188"/>
					</TrackLine>
					<TrackLine>
						<End x="16.3914" y="50.3274"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="1"/>
				<NetRef name="NET00000"/>
				<Subwire width="0.2">
					<Start x="18.75" y="45.75"/>
					<TrackLine>
						<End x="18.75" y="44.2251"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="43.2511"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="87.1626" y="27.3705"/>
					<TrackLine>
						<End x="64.5454" y="27.3705"/>
					</TrackLine>
					<TrackLine>
						<End x="63.431" y="26.256"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3281" y="26.256"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="84.0321" y="50.0961"/>
					<TrackLine>
						<End x="75.7446" y="50.0961"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6708" y="49.0223"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7859" y="49.0223"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="46.8641" y="53.3281"/>
					<TrackLine>
						<End x="48.5407" y="51.6514"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2892" y="51.6514"/>
					</TrackLine>
					<TrackLine>
						<End x="79.7498" y="52.1121"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0161" y="52.1121"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="54.9441" y="50.0961"/>
					<TrackLine>
						<End x="71.5774" y="50.0961"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6221" y="51.1407"/>
					</TrackLine>
					<TrackLine>
						<End x="83.4608" y="51.1407"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="51.7121"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="45.2481" y="53.2357"/>
					<TrackLine>
						<End x="52.0277" y="46.4561"/>
					</TrackLine>
					<TrackLine>
						<End x="71.0388" y="46.4561"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9121" y="45.5827"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9121" y="44.9134"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3854" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3761" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="45.2555" y="30.7115"/>
					<TrackLine>
						<End x="36.6372" y="30.7115"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7818" y="25.856"/>
					</TrackLine>
					<TrackLine>
						<End x="27.472" y="25.856"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="80.8001" y="30.704"/>
					<TrackLine>
						<End x="53.4204" y="30.704"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2124" y="31.912"/>
					</TrackLine>
					<TrackLine>
						<End x="50.646" y="31.912"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4993" y="30.7654"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4727" y="30.7654"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="5"/>
				<Subwire width="0.2">
					<Start x="80.8001" y="25.856"/>
					<TrackLine>
						<End x="63.5967" y="25.856"/>
					</TrackLine>
					<TrackLine>
						<End x="63.1887" y="25.448"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9934" y="25.448"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5201" y="25.9213"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5201" y="31.0387"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0467" y="31.512"/>
					</TrackLine>
					<TrackLine>
						<End x="51.054" y="31.512"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4993" y="29.9574"/>
					</TrackLine>
					<TrackLine>
						<End x="48.138" y="29.9574"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6647" y="30.4307"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6647" y="31.2894"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="32.1048"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="2"/>
				<Subwire width="0.2">
					<Start x="51.7121" y="30.704"/>
					<TrackLine>
						<End x="48.3595" y="27.3515"/>
					</TrackLine>
					<TrackLine>
						<End x="35.4315" y="27.3515"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="51.6365" y="27.3965"/>
					<TrackLine>
						<End x="51.6365" y="26.2392"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="51.6365" y="26.2392"/>
					<TrackLine>
						<End x="53.6557" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1949" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="74.03" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="74.03" y="22.6551"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9351" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="82.92" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="82.92" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="51.6365" y="26.2392"/>
					<TrackLine>
						<End x="51.2534" y="25.856"/>
					</TrackLine>
					<TrackLine>
						<End x="35.552" y="25.856"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="74.3361" y="35.552"/>
					<TrackLine>
						<End x="78.0527" y="35.552"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8767" y="32.728"/>
					</TrackLine>
					<TrackLine>
						<End x="86.1485" y="32.728"/>
					</TrackLine>
					<TrackLine>
						<End x="87.1966" y="33.7762"/>
					</TrackLine>
					<TrackLine>
						<End x="90.3362" y="33.7762"/>
					</TrackLine>
					<TrackLine>
						<End x="92.1121" y="35.552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="11.8" y="23.02"/>
					<TrackLine>
						<End x="11.8" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="12.85" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="33.46" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="34.66" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="58.1761" y="33.542"/>
					<TrackLine>
						<End x="54.0767" y="33.542"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6628" y="33.128"/>
					</TrackLine>
					<TrackLine>
						<End x="51.8044" y="33.128"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6197" y="33.3128"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5454" y="33.3128"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8678" y="31.6352"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8678" y="31.1811"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7182" y="29.0315"/>
					</TrackLine>
					<TrackLine>
						<End x="35.9688" y="29.0315"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6235" y="27.6862"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6235" y="27.0168"/>
					</TrackLine>
					<TrackLine>
						<End x="34.66" y="26.9804"/>
					</TrackLine>
					<TrackLine>
						<End x="34.66" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="67.8721" y="88.8801"/>
					<TrackLine>
						<End x="78.0414" y="88.8801"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8252" y="88.0963"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9679" y="88.0963"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="85.6481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="117"/>
				<Subwire width="0.2">
					<Start x="40.0001" y="90.4961"/>
					<TrackLine>
						<End x="21.008" y="90.4961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="48.5688" y="70.842"/>
					<TrackLine>
						<End x="61.8616" y="70.842"/>
					</TrackLine>
					<TrackLine>
						<End x="67.3717" y="76.3521"/>
					</TrackLine>
					<TrackLine>
						<End x="69.9264" y="76.3521"/>
					</TrackLine>
					<TrackLine>
						<End x="70.3344" y="75.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6548" y="75.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6687" y="75.958"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5681" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="50.0961" y="90.4961"/>
					<TrackLine>
						<End x="53.8014" y="90.4961"/>
					</TrackLine>
					<TrackLine>
						<End x="56.2254" y="88.0721"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8948" y="88.0721"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="87.5988"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="86.4561"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1361" y="83.2241"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1361" y="77.4361"/>
					</TrackLine>
					<TrackLine>
						<End x="48.6121" y="71.9121"/>
					</TrackLine>
					<TrackLine>
						<End x="22.0781" y="71.9121"/>
					</TrackLine>
					<TrackLine>
						<End x="21.008" y="70.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="80.8001" y="63.0241"/>
					<TrackLine>
						<End x="77.426" y="59.65"/>
					</TrackLine>
					<TrackLine>
						<End x="73.4178" y="59.65"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2178" y="59.85"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0381" y="59.85"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8881" y="61.0001"/>
					</TrackLine>
					<TrackLine>
						<End x="40.6424" y="61.0001"/>
					</TrackLine>
					<TrackLine>
						<End x="40.1753" y="60.533"/>
					</TrackLine>
					<TrackLine>
						<End x="24.981" y="60.533"/>
					</TrackLine>
					<TrackLine>
						<End x="24.24" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="82.4161" y="59.7921"/>
					<TrackLine>
						<End x="82.4161" y="58.3333"/>
					</TrackLine>
					<TrackLine>
						<End x="81.409" y="57.3261"/>
					</TrackLine>
					<TrackLine>
						<End x="77.951" y="57.3261"/>
					</TrackLine>
					<TrackLine>
						<End x="77.501" y="57.7761"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5946" y="57.7761"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7207" y="58.65"/>
					</TrackLine>
					<TrackLine>
						<End x="71.5239" y="58.65"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8362" y="56.9623"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="69.8362" y="56.9623"/>
					<TrackLine>
						<End x="68.9934" y="56.9623"/>
					</TrackLine>
					<TrackLine>
						<End x="68.5381" y="57.4176"/>
					</TrackLine>
					<TrackLine>
						<End x="67.206" y="57.4176"/>
					</TrackLine>
					<TrackLine>
						<End x="67.0393" y="57.2509"/>
					</TrackLine>
					<TrackLine>
						<End x="66.0386" y="57.2509"/>
					</TrackLine>
					<TrackLine>
						<End x="65.8966" y="57.3929"/>
					</TrackLine>
					<TrackLine>
						<End x="63.5519" y="57.3929"/>
					</TrackLine>
					<TrackLine>
						<End x="63.1931" y="57.034"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9841" y="57.034"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="57.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="30.1384" y="57.1258"/>
					<TrackLine>
						<End x="30.7097" y="56.5544"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2618" y="56.5544"/>
					</TrackLine>
					<TrackLine>
						<End x="42.5075" y="59.8001"/>
					</TrackLine>
					<TrackLine>
						<End x="44.5134" y="59.8001"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9134" y="60.2001"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3637" y="60.2001"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2931" y="57.2707"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6047" y="57.2707"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="57.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="28.9111" y="54.1744"/>
					<TrackLine>
						<End x="30.331" y="54.1744"/>
					</TrackLine>
					<TrackLine>
						<End x="30.3694" y="54.1361"/>
					</TrackLine>
					<TrackLine>
						<End x="37.8837" y="54.1361"/>
					</TrackLine>
					<TrackLine>
						<End x="41.5157" y="57.7681"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6643" y="57.7681"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2475" y="56.1849"/>
					</TrackLine>
					<TrackLine>
						<End x="64.2649" y="56.1849"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="64.2649" y="56.1849"/>
					<TrackLine>
						<End x="67.1046" y="56.1849"/>
					</TrackLine>
					<TrackLine>
						<End x="67.5374" y="56.6176"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2068" y="56.6176"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0701" y="55.7543"/>
					</TrackLine>
					<TrackLine>
						<End x="70.3366" y="55.7543"/>
					</TrackLine>
					<TrackLine>
						<End x="71.1176" y="56.5353"/>
					</TrackLine>
					<TrackLine>
						<End x="71.7869" y="56.5353"/>
					</TrackLine>
					<TrackLine>
						<End x="72.2862" y="56.036"/>
					</TrackLine>
					<TrackLine>
						<End x="72.2862" y="54.2353"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7854" y="53.7361"/>
					</TrackLine>
					<TrackLine>
						<End x="74.086" y="53.7361"/>
					</TrackLine>
					<TrackLine>
						<End x="75.686" y="55.3361"/>
					</TrackLine>
					<TrackLine>
						<End x="86.0641" y="55.3361"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="54.1361"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="24.4767" y="78.9474"/>
					<TrackLine>
						<End x="27.143" y="78.9474"/>
					</TrackLine>
					<TrackLine>
						<End x="28.5877" y="80.3921"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5944" y="80.3921"/>
					</TrackLine>
					<TrackLine>
						<End x="49.6184" y="82.4161"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3281" y="82.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="32.5544" y="57.5495"/>
					<TrackLine>
						<End x="37.9918" y="57.5495"/>
					</TrackLine>
					<TrackLine>
						<End x="40.6424" y="60.2001"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3477" y="60.2001"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7477" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="46.5294" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4033" y="57.7261"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6871" y="57.7261"/>
					</TrackLine>
					<TrackLine>
						<End x="57.611" y="58.65"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9841" y="58.65"/>
					</TrackLine>
					<TrackLine>
						<End x="59.7921" y="57.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="66.5389" y="58.4589"/>
					<TrackLine>
						<End x="65.3962" y="58.4589"/>
					</TrackLine>
					<TrackLine>
						<End x="64.8711" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="60.9341" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="59.7921" y="57.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="85.6481" y="53.3281"/>
					<TrackLine>
						<End x="84.4401" y="54.5361"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0174" y="54.5361"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3328" y="52.8514"/>
					</TrackLine>
					<TrackLine>
						<End x="70.7694" y="52.8514"/>
					</TrackLine>
					<TrackLine>
						<End x="70.2961" y="53.3248"/>
					</TrackLine>
					<TrackLine>
						<End x="70.2961" y="53.3856"/>
					</TrackLine>
					<TrackLine>
						<End x="67.8721" y="55.8096"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="85.2481" y="69.4881"/>
					<TrackLine>
						<End x="85.2481" y="71.0308"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3668" y="71.9121"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5529" y="71.9121"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9369" y="70.2961"/>
					</TrackLine>
					<TrackLine>
						<End x="71.5774" y="70.2961"/>
					</TrackLine>
					<TrackLine>
						<End x="67.0641" y="74.8094"/>
					</TrackLine>
					<TrackLine>
						<End x="67.0641" y="75.4788"/>
					</TrackLine>
					<TrackLine>
						<End x="67.5374" y="75.9521"/>
					</TrackLine>
					<TrackLine>
						<End x="69.7607" y="75.9521"/>
					</TrackLine>
					<TrackLine>
						<End x="70.1687" y="75.5441"/>
					</TrackLine>
					<TrackLine>
						<End x="76.8393" y="75.5441"/>
					</TrackLine>
					<TrackLine>
						<End x="77.2334" y="75.15"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9028" y="75.15"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3761" y="75.6233"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3761" y="76.2927"/>
					</TrackLine>
					<TrackLine>
						<End x="72.2527" y="82.4161"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="82.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="85.6481" y="61.4081"/>
					<TrackLine>
						<End x="82.8894" y="61.4081"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6081" y="60.1268"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6081" y="59.2173"/>
					</TrackLine>
					<TrackLine>
						<End x="81.7166" y="59.1089"/>
					</TrackLine>
					<TrackLine>
						<End x="81.7166" y="58.1994"/>
					</TrackLine>
					<TrackLine>
						<End x="81.2433" y="57.7261"/>
					</TrackLine>
					<TrackLine>
						<End x="78.1167" y="57.7261"/>
					</TrackLine>
					<TrackLine>
						<End x="77.6667" y="58.1761"/>
					</TrackLine>
					<TrackLine>
						<End x="73.7603" y="58.1761"/>
					</TrackLine>
					<TrackLine>
						<End x="72.8864" y="59.05"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2727" y="59.05"/>
					</TrackLine>
					<TrackLine>
						<End x="66.8736" y="57.6509"/>
					</TrackLine>
					<TrackLine>
						<End x="66.2042" y="57.6509"/>
					</TrackLine>
					<TrackLine>
						<End x="66.0623" y="57.7929"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4966" y="57.7929"/>
					</TrackLine>
					<TrackLine>
						<End x="65.1134" y="58.1761"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="58.1761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="26.8274" y="82.8161"/>
					<TrackLine>
						<End x="49.4527" y="82.8161"/>
					</TrackLine>
					<TrackLine>
						<End x="53.9007" y="87.2641"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="74.1208" y="55.3521"/>
					<TrackLine>
						<End x="73.3128" y="55.3521"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6862" y="55.9787"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6862" y="56.2017"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9526" y="56.9353"/>
					</TrackLine>
					<TrackLine>
						<End x="70.9519" y="56.9353"/>
					</TrackLine>
					<TrackLine>
						<End x="70.1709" y="56.1543"/>
					</TrackLine>
					<TrackLine>
						<End x="69.2358" y="56.1543"/>
					</TrackLine>
					<TrackLine>
						<End x="68.3725" y="57.0176"/>
					</TrackLine>
					<TrackLine>
						<End x="67.3717" y="57.0176"/>
					</TrackLine>
					<TrackLine>
						<End x="67.205" y="56.8509"/>
					</TrackLine>
					<TrackLine>
						<End x="65.8729" y="56.8509"/>
					</TrackLine>
					<TrackLine>
						<End x="65.7309" y="56.9929"/>
					</TrackLine>
					<TrackLine>
						<End x="63.7176" y="56.9929"/>
					</TrackLine>
					<TrackLine>
						<End x="63.3588" y="56.634"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3641" y="56.634"/>
					</TrackLine>
					<TrackLine>
						<End x="46.606" y="59.3921"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="59.3921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="32.5871" y="74.7201"/>
					<TrackLine>
						<End x="31.528" y="73.661"/>
					</TrackLine>
					<TrackLine>
						<End x="22.685" y="73.661"/>
					</TrackLine>
					<TrackLine>
						<End x="22.0099" y="74.3361"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="74.3361"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="42.0161" y="74.3361"/>
					<TrackLine>
						<End x="36.6947" y="74.3361"/>
					</TrackLine>
					<TrackLine>
						<End x="33.4627" y="77.5681"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="77.5681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="75.9521" y="53.3281"/>
					<TrackLine>
						<End x="75.0755" y="52.4514"/>
					</TrackLine>
					<TrackLine>
						<End x="51.446" y="52.4514"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="52.9934"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="53.6628"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4307" y="54.1361"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="54.1361"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="48.458" y="75.958"/>
					<TrackLine>
						<End x="46.0281" y="73.5281"/>
					</TrackLine>
					<TrackLine>
						<End x="35.0696" y="73.5281"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8317" y="76.766"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2" y="76.766"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="18.584" y="69.2052"/>
					<TrackLine>
						<End x="18.584" y="51.7582"/>
					</TrackLine>
					<TrackLine>
						<End x="18.4917" y="51.6659"/>
					</TrackLine>
					<TrackLine>
						<End x="18.4917" y="42.9164"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="18.584" y="69.2052"/>
					<TrackLine>
						<End x="17.4932" y="70.2961"/>
					</TrackLine>
					<TrackLine>
						<End x="15.352" y="70.2961"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="72.7201"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="52.1121" y="61.7501"/>
					<TrackLine>
						<End x="49.2301" y="64.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8547" y="64.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1298" y="69.357"/>
					</TrackLine>
					<TrackLine>
						<End x="21.3503" y="69.357"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2" y="70.5073"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="20.2" y="70.5073"/>
					<TrackLine>
						<End x="18.898" y="69.2052"/>
					</TrackLine>
					<TrackLine>
						<End x="18.584" y="69.2052"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="29.088" y="72.7201"/>
					<TrackLine>
						<End x="21.7434" y="72.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2" y="71.1767"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2" y="70.5073"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="52.1121" y="61.7501"/>
					<TrackLine>
						<End x="54.194" y="63.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="67.8615" y="63.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="69.5743" y="62.1193"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9493" y="62.1193"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5206" y="61.5479"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="50.0961" y="61.4081"/>
					<TrackLine>
						<End x="46.7907" y="61.4081"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3667" y="63.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1373" y="63.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0973" y="59.7921"/>
					</TrackLine>
					<TrackLine>
						<End x="19.792" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="20.9537" y="75.958"/>
					<TrackLine>
						<End x="22.4427" y="74.469"/>
					</TrackLine>
					<TrackLine>
						<End x="30.5711" y="74.469"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="51.5914" y="58.5341"/>
					<TrackLine>
						<End x="56.6871" y="58.5341"/>
					</TrackLine>
					<TrackLine>
						<End x="57.603" y="59.45"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0521" y="59.45"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2521" y="59.25"/>
					</TrackLine>
					<TrackLine>
						<End x="77.1585" y="59.25"/>
					</TrackLine>
					<TrackLine>
						<End x="77.8744" y="58.5341"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9086" y="58.5341"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="64.6401" y="87.2641"/>
					<TrackLine>
						<End x="72.7201" y="87.2641"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="77.5681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="24.24" y="51.7121"/>
					<TrackLine>
						<End x="22.4951" y="51.7121"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="48.609"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="49.674" y="78.0694"/>
					<TrackLine>
						<End x="47.7513" y="79.9921"/>
					</TrackLine>
					<TrackLine>
						<End x="28.7534" y="79.9921"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9007" y="78.1394"/>
					</TrackLine>
					<TrackLine>
						<End x="23.6687" y="78.1394"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="79.1841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="24.24" y="43.6321"/>
					<TrackLine>
						<End x="31.512" y="50.9041"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2174" y="50.9041"/>
					</TrackLine>
					<TrackLine>
						<End x="41.6814" y="57.3681"/>
					</TrackLine>
					<TrackLine>
						<End x="46.4155" y="57.3681"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2475" y="54.5361"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3121" y="54.5361"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="54.1361"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="33.936" y="79.1841"/>
					<TrackLine>
						<End x="40.8734" y="79.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="41.6814" y="78.3761"/>
					</TrackLine>
					<TrackLine>
						<End x="47.7117" y="78.3761"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8951" y="76.1927"/>
					</TrackLine>
					<TrackLine>
						<End x="51.75" y="76.1927"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="84.0321" y="53.3281"/>
					<TrackLine>
						<End x="83.4608" y="52.7567"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5141" y="52.7567"/>
					</TrackLine>
					<TrackLine>
						<End x="82.3508" y="52.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9921" y="52.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1235" y="52.0514"/>
					</TrackLine>
					<TrackLine>
						<End x="50.5647" y="52.0514"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="46.8641" y="77.5681"/>
					<TrackLine>
						<End x="34.4094" y="77.5681"/>
					</TrackLine>
					<TrackLine>
						<End x="32.7934" y="79.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="29.088" y="79.1841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="72"/>
				<Subwire width="0.2">
					<Start x="85.6481" y="75.958"/>
					<TrackLine>
						<End x="81.9487" y="75.958"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7407" y="74.75"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0677" y="74.75"/>
					</TrackLine>
					<TrackLine>
						<End x="76.6736" y="75.1441"/>
					</TrackLine>
					<TrackLine>
						<End x="70.003" y="75.1441"/>
					</TrackLine>
					<TrackLine>
						<End x="67.8721" y="75.1441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="33.936" y="61.4081"/>
					<TrackLine>
						<End x="25.856" y="61.4081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="108"/>
				<Subwire width="0.2">
					<Start x="79.1358" y="88.9284"/>
					<TrackLine>
						<End x="86.2012" y="88.9284"/>
					</TrackLine>
					<TrackLine>
						<End x="89.2599" y="91.9871"/>
					</TrackLine>
					<TrackLine>
						<End x="93.9298" y="91.9871"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="43.6321" y="48.4801"/>
					<TrackLine>
						<End x="37.6414" y="48.4801"/>
					</TrackLine>
					<TrackLine>
						<End x="36.0254" y="50.0961"/>
					</TrackLine>
					<TrackLine>
						<End x="32.32" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="32.32" y="50.0961"/>
					<TrackLine>
						<End x="27.472" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="37.168" y="91.7254"/>
					<TrackLine>
						<End x="28.3321" y="91.7254"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0973" y="96.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.784" y="63.0241"/>
					<TrackLine>
						<End x="40.0001" y="61.8081"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="61.8081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="51.5889" y="40.6648"/>
					<TrackLine>
						<End x="52.6617" y="39.592"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="39.592"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="38.784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="57"/>
				<Subwire width="0.2">
					<Start x="35.552" y="84.508"/>
					<TrackLine>
						<End x="29.7548" y="84.508"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6147" y="85.6481"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="85.6481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="61.4081" y="87.2641"/>
					<TrackLine>
						<End x="63.4974" y="87.2641"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9454" y="82.8161"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6473" y="82.8161"/>
					</TrackLine>
					<TrackLine>
						<End x="81.7033" y="76.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8372" y="76.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8431" y="76.766"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9828" y="76.766"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4561" y="76.2927"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4561" y="75.6233"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9369" y="71.1041"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="71.1041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="24.24" y="71.1041"/>
					<TrackLine>
						<End x="27.2604" y="71.1041"/>
					</TrackLine>
					<TrackLine>
						<End x="28.8764" y="69.4881"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="69.4881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="54.9441" y="63.0241"/>
					<TrackLine>
						<End x="52.8621" y="60.9421"/>
					</TrackLine>
					<TrackLine>
						<End x="51.741" y="60.9421"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4511" y="64.2321"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0893" y="64.2321"/>
					</TrackLine>
					<TrackLine>
						<End x="18.984" y="60.1268"/>
					</TrackLine>
					<TrackLine>
						<End x="18.984" y="58.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="25.048" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="25.048" y="49.2881"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="41.6814"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0973" y="40.4001"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="54.9441" y="63.0241"/>
					<TrackLine>
						<End x="60.3153" y="63.0241"/>
					</TrackLine>
					<TrackLine>
						<End x="62.4224" y="60.917"/>
					</TrackLine>
					<TrackLine>
						<End x="72.1937" y="60.917"/>
					</TrackLine>
					<TrackLine>
						<End x="72.5427" y="61.266"/>
					</TrackLine>
					<TrackLine>
						<End x="76.4733" y="61.266"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9994" y="60.7399"/>
					</TrackLine>
					<TrackLine>
						<End x="77.8553" y="60.7399"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1604" y="62.045"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1604" y="66.2323"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="71.1041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="22.624" y="43.6321"/>
					<TrackLine>
						<End x="23.432" y="42.8241"/>
					</TrackLine>
					<TrackLine>
						<End x="34.0191" y="42.8241"/>
					</TrackLine>
					<TrackLine>
						<End x="34.8271" y="43.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="71.1041" y="45.2481"/>
					<TrackLine>
						<End x="71.1041" y="44.1054"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8494" y="36.36"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2241" y="36.36"/>
					</TrackLine>
					<TrackLine>
						<End x="85.6481" y="33.936"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="71.1041" y="45.2481"/>
					<TrackLine>
						<End x="57.7028" y="45.2481"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8948" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="51.285" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="55.325"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="56.5601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="88.8339" y="43.6782"/>
					<TrackLine>
						<End x="81.8966" y="43.6782"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5188" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8494" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0414" y="45.2481"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="88.8801" y="42.0161"/>
					<TrackLine>
						<End x="89.6419" y="42.7779"/>
					</TrackLine>
					<TrackLine>
						<End x="89.6419" y="49.3342"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4561" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4561" y="53.6628"/>
					</TrackLine>
					<TrackLine>
						<End x="85.1828" y="54.9361"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8517" y="54.9361"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2517" y="53.3361"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6197" y="53.3361"/>
					</TrackLine>
					<TrackLine>
						<End x="71.4522" y="54.5035"/>
					</TrackLine>
					<TrackLine>
						<End x="71.4522" y="55.7273"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="2"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="12.928" y="71.1041"/>
					<TrackLine>
						<End x="12.928" y="62.2161"/>
					</TrackLine>
					<TrackLine>
						<End x="17.1994" y="57.9447"/>
					</TrackLine>
					<TrackLine>
						<End x="17.1994" y="43.066"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0973" y="37.168"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0024" y="37.168"/>
					</TrackLine>
					<TrackLine>
						<End x="81.0424" y="33.128"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9828" y="33.128"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4561" y="33.6014"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4561" y="37.976"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="38.784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="87.1626" y="27.3705"/>
					<TrackLine>
						<End x="87.1626" y="23.8175"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="23.6049"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="21.68"/>
					</TrackLine>
					<TrackLine>
						<End x="88" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="88" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="56"/>
				<Subwire width="0.2">
					<Start x="37.0537" y="45.2481"/>
					<TrackLine>
						<End x="42.0161" y="40.2857"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="35.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="55"/>
				<Subwire width="0.2">
					<Start x="40.4001" y="38.784"/>
					<TrackLine>
						<End x="40.4001" y="40.4001"/>
					</TrackLine>
					<TrackLine>
						<End x="35.552" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="58.1761" y="42.0161"/>
					<TrackLine>
						<End x="61.4081" y="38.784"/>
					</TrackLine>
					<TrackLine>
						<End x="61.4081" y="35.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="51.7121" y="50.0961"/>
					<TrackLine>
						<End x="51.7121" y="41.9307"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8678" y="37.0864"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8678" y="31.1811"/>
					</TrackLine>
					<TrackLine>
						<End x="44.82" y="29.1333"/>
					</TrackLine>
					<TrackLine>
						<End x="44.82" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="46.8641" y="53.3281"/>
					<TrackLine>
						<End x="43.6321" y="50.0961"/>
					</TrackLine>
					<TrackLine>
						<End x="37.168" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="37.168" y="50.0961"/>
					<TrackLine>
						<End x="34.6235" y="47.5515"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6235" y="25.1977"/>
					</TrackLine>
					<TrackLine>
						<End x="36.005" y="23.8162"/>
					</TrackLine>
					<TrackLine>
						<End x="36.005" y="21.675"/>
					</TrackLine>
					<TrackLine>
						<End x="37.2" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="54.9441" y="50.0961"/>
					<TrackLine>
						<End x="52.5201" y="47.6721"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5201" y="33.6014"/>
					</TrackLine>
					<TrackLine>
						<End x="58.6594" y="27.462"/>
					</TrackLine>
					<TrackLine>
						<End x="59.7929" y="27.462"/>
					</TrackLine>
					<TrackLine>
						<End x="63.87" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="63.87" y="21.9"/>
					</TrackLine>
					<TrackLine>
						<End x="65.14" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="65.14" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="79.1841" y="45.2481"/>
					<TrackLine>
						<End x="79.1841" y="33.8982"/>
					</TrackLine>
					<TrackLine>
						<End x="74.03" y="28.7441"/>
					</TrackLine>
					<TrackLine>
						<End x="74.03" y="14.8729"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2571" y="14.1"/>
					</TrackLine>
					<TrackLine>
						<End x="72.2629" y="14.1"/>
					</TrackLine>
					<TrackLine>
						<End x="71.49" y="14.8729"/>
					</TrackLine>
					<TrackLine>
						<End x="71.49" y="15.7271"/>
					</TrackLine>
					<TrackLine>
						<End x="70.6471" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="69.7929" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="68.95" y="17.4129"/>
					</TrackLine>
					<TrackLine>
						<End x="68.95" y="19.06"/>
					</TrackLine>
					<TrackLine>
						<End x="67.68" y="20.33"/>
					</TrackLine>
					<TrackLine>
						<End x="67.68" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="75.3" y="20.48"/>
					<TrackLine>
						<End x="75.3" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="76.57" y="21.9"/>
					</TrackLine>
					<TrackLine>
						<End x="76.57" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="27.615"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="30.704"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="5"/>
				<Subwire width="0.2">
					<Start x="80.8001" y="25.856"/>
					<TrackLine>
						<End x="79.11" y="24.1659"/>
					</TrackLine>
					<TrackLine>
						<End x="79.11" y="21.9"/>
					</TrackLine>
					<TrackLine>
						<End x="77.84" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="77.84" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="93.7281" y="54.9441"/>
					<TrackLine>
						<End x="93.7281" y="66.3704"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0641" y="72.0344"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0641" y="80.0001"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="85.6481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="25.1732" y="53.6628"/>
					<TrackLine>
						<End x="25.1732" y="59.1982"/>
					</TrackLine>
					<TrackLine>
						<End x="25.048" y="59.3233"/>
					</TrackLine>
					<TrackLine>
						<End x="25.048" y="61.1078"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="63.5318"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="67.8721"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="93.7281" y="54.9441"/>
					<TrackLine>
						<End x="93.7281" y="37.168"/>
					</TrackLine>
					<TrackLine>
						<End x="92.1121" y="35.552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="32.12" y="17.84"/>
					<TrackLine>
						<End x="33.39" y="19.11"/>
					</TrackLine>
					<TrackLine>
						<End x="33.39" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="34.66" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="90.54" y="20.48"/>
					<TrackLine>
						<End x="90.54" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="80.38" y="17.84"/>
					<TrackLine>
						<End x="80.38" y="15.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="32.12" y="17.84"/>
					<TrackLine>
						<End x="32.12" y="15.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="117"/>
				<Subwire width="0.2">
					<Start x="42.0161" y="79.1841"/>
					<TrackLine>
						<End x="42.0161" y="86.7908"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0001" y="88.8068"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0001" y="90.4961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="116"/>
				<Subwire width="0.2">
					<Start x="27.04" y="23.02"/>
					<TrackLine>
						<End x="27.04" y="22.87"/>
					</TrackLine>
					<TrackLine>
						<End x="28.31" y="21.6"/>
					</TrackLine>
					<TrackLine>
						<End x="28.31" y="17.4129"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6229" y="14.1"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6171" y="14.1"/>
					</TrackLine>
					<TrackLine>
						<End x="33.39" y="14.8729"/>
					</TrackLine>
					<TrackLine>
						<End x="33.39" y="15.7271"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2329" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="35.0871" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="35.93" y="17.4129"/>
					</TrackLine>
					<TrackLine>
						<End x="35.93" y="18.2671"/>
					</TrackLine>
					<TrackLine>
						<End x="36.8229" y="19.16"/>
					</TrackLine>
					<TrackLine>
						<End x="37.5771" y="19.16"/>
					</TrackLine>
					<TrackLine>
						<End x="38.47" y="20.0529"/>
					</TrackLine>
					<TrackLine>
						<End x="38.47" y="30.4613"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="42.8953"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="55.8708"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7834" y="55.9914"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7834" y="59.9108"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="60.0314"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="61.7428"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7768" y="62.8701"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7768" y="75.7819"/>
					</TrackLine>
					<TrackLine>
						<End x="48.866" y="76.6927"/>
					</TrackLine>
					<TrackLine>
						<End x="48.866" y="81.6259"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3098" y="82.0698"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3098" y="87.2423"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="87.2641"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="92.3632"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="94.7872"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="115"/>
				<Subwire width="0.2">
					<Start x="32.12" y="23.02"/>
					<TrackLine>
						<End x="32.12" y="43.9053"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1624" y="45.9477"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1624" y="58.2156"/>
					</TrackLine>
					<TrackLine>
						<End x="33.128" y="59.2499"/>
					</TrackLine>
					<TrackLine>
						<End x="33.128" y="61.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="33.266" y="61.898"/>
					</TrackLine>
					<TrackLine>
						<End x="33.266" y="70.7351"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6456" y="72.3555"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6456" y="81.9511"/>
					</TrackLine>
					<TrackLine>
						<End x="30.704" y="82.8927"/>
					</TrackLine>
					<TrackLine>
						<End x="30.704" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="54.9441" y="96.9601"/>
					<TrackLine>
						<End x="55.7521" y="97.7681"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8948" y="97.7681"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="97.2948"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="93.4858"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3521" y="91.4698"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3521" y="86.2944"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1521" y="85.4944"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1521" y="68.5948"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="68.1948"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="67.5254"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1521" y="67.1254"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1521" y="49.5957"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="49.1957"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="44.9134"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2788" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6094" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1361" y="43.9667"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1361" y="43.2241"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="42.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="54.9441" y="45.2481"/>
					<TrackLine>
						<End x="54.1361" y="45.2481"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7361" y="44.8481"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7361" y="41.9465"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4129" y="41.2696"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4129" y="40.0654"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3281" y="38.9805"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3281" y="33.936"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="54.9441" y="45.2481"/>
					<TrackLine>
						<End x="54.9441" y="48.9534"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="49.7614"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="66.9597"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3521" y="67.3597"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3521" y="68.3604"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="68.7604"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="84.8594"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9521" y="85.6594"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9521" y="91.8778"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="93.4858"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="56.5601" y="38.784"/>
					<TrackLine>
						<End x="56.5601" y="42.4894"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="43.2974"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="58.1761" y="79.1841"/>
					<TrackLine>
						<End x="57.3681" y="78.3761"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="67.5254"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="66.7174"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="77.5681" y="53.3281"/>
					<TrackLine>
						<End x="77.5681" y="59.3214"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1286" y="60.8819"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1286" y="62.214"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5681" y="63.7745"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5681" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="77.5681" y="53.3281"/>
					<TrackLine>
						<End x="77.5681" y="47.6721"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5281" y="43.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="72.386" y="57.842"/>
					<TrackLine>
						<End x="72.386" y="55.5184"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9121" y="55.0444"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9121" y="54.0437"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="53.2357"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="22.624" y="53.3281"/>
					<TrackLine>
						<End x="22.624" y="62.1581"/>
					</TrackLine>
					<TrackLine>
						<End x="21.008" y="63.7741"/>
					</TrackLine>
					<TrackLine>
						<End x="21.008" y="70.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="71.1041" y="53.6594"/>
					<TrackLine>
						<End x="70.5327" y="54.2308"/>
					</TrackLine>
					<TrackLine>
						<End x="70.5327" y="56.5162"/>
					</TrackLine>
					<TrackLine>
						<End x="70.6442" y="56.6277"/>
					</TrackLine>
					<TrackLine>
						<End x="70.6442" y="61.0493"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7715" y="62.9221"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7715" y="78.6887"/>
					</TrackLine>
					<TrackLine>
						<End x="63.4281" y="84.0321"/>
					</TrackLine>
					<TrackLine>
						<End x="63.4281" y="91.8005"/>
					</TrackLine>
					<TrackLine>
						<End x="57.0604" y="98.1681"/>
					</TrackLine>
					<TrackLine>
						<End x="55.0094" y="98.1681"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1361" y="97.2948"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1361" y="92.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="24.4767" y="78.9474"/>
					<TrackLine>
						<End x="24.4767" y="74.8094"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="73.4301"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="64.7978"/>
					</TrackLine>
					<TrackLine>
						<End x="28.9111" y="61.7428"/>
					</TrackLine>
					<TrackLine>
						<End x="28.9111" y="54.1744"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="87.2641" y="53.3281"/>
					<TrackLine>
						<End x="87.2641" y="56.495"/>
					</TrackLine>
					<TrackLine>
						<End x="87.1339" y="56.6252"/>
					</TrackLine>
					<TrackLine>
						<End x="87.1339" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="56.5601" y="88.8801"/>
					<TrackLine>
						<End x="55.7521" y="88.0721"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="86.9294"/>
					</TrackLine>
					<TrackLine>
						<End x="59.7921" y="82.8894"/>
					</TrackLine>
					<TrackLine>
						<End x="59.7921" y="57.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="25.856" y="80.8001"/>
					<TrackLine>
						<End x="25.856" y="74.8094"/>
					</TrackLine>
					<TrackLine>
						<End x="30.712" y="69.9534"/>
					</TrackLine>
					<TrackLine>
						<End x="30.712" y="59.3918"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5544" y="57.5495"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="29.088" y="84.0321"/>
					<TrackLine>
						<End x="29.088" y="80.8925"/>
					</TrackLine>
					<TrackLine>
						<End x="30.296" y="79.6845"/>
					</TrackLine>
					<TrackLine>
						<End x="30.296" y="78.6837"/>
					</TrackLine>
					<TrackLine>
						<End x="29.7631" y="78.1508"/>
					</TrackLine>
					<TrackLine>
						<End x="29.7631" y="73.661"/>
					</TrackLine>
					<TrackLine>
						<End x="31.112" y="72.3121"/>
					</TrackLine>
					<TrackLine>
						<End x="31.112" y="60.1345"/>
					</TrackLine>
					<TrackLine>
						<End x="33.3624" y="57.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="33.3624" y="57.2148"/>
					</TrackLine>
					<TrackLine>
						<End x="32.889" y="56.7415"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5015" y="56.7415"/>
					</TrackLine>
					<TrackLine>
						<End x="30.704" y="54.9441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="85.2481" y="69.4881"/>
					<TrackLine>
						<End x="85.2481" y="62.1508"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8401" y="61.7428"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8401" y="61.0734"/>
					</TrackLine>
					<TrackLine>
						<End x="85.6481" y="60.2654"/>
					</TrackLine>
					<TrackLine>
						<End x="85.6481" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="63.0241" y="58.1761"/>
					<TrackLine>
						<End x="63.0241" y="80.8001"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="73.1201" y="74.3361"/>
					<TrackLine>
						<End x="76.7601" y="77.9761"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7601" y="94.9361"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9521" y="95.7441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="73.1201" y="74.3361"/>
					<TrackLine>
						<End x="73.1201" y="67.6568"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7286" y="62.0483"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7286" y="61.0476"/>
					</TrackLine>
					<TrackLine>
						<End x="75.45" y="57.7689"/>
					</TrackLine>
					<TrackLine>
						<End x="75.45" y="55.8732"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9288" y="55.3521"/>
					</TrackLine>
					<TrackLine>
						<End x="74.1208" y="55.3521"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="32.5871" y="74.7201"/>
					<TrackLine>
						<End x="32.5871" y="72.053"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="59.3921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="13.736" y="58.9841"/>
					<TrackLine>
						<End x="12.5933" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="60.2654"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="74.3361"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="14.944" y="43.6321"/>
					<TrackLine>
						<End x="14.944" y="47.2153"/>
					</TrackLine>
					<TrackLine>
						<End x="13.736" y="48.4233"/>
					</TrackLine>
					<TrackLine>
						<End x="13.736" y="58.9841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="13.736" y="58.9841"/>
					<TrackLine>
						<End x="16.16" y="61.4081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="75.9521" y="60.458"/>
					<TrackLine>
						<End x="75.9521" y="62.5508"/>
					</TrackLine>
					<TrackLine>
						<End x="71.5121" y="66.9908"/>
					</TrackLine>
					<TrackLine>
						<End x="71.5121" y="77.5681"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9121" y="77.9681"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="77.9681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="72.7201" y="96.9601"/>
					<TrackLine>
						<End x="72.7201" y="77.9681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="42.0161" y="74.3361"/>
					<TrackLine>
						<End x="42.0161" y="63.8974"/>
					</TrackLine>
					<TrackLine>
						<End x="46.1214" y="59.7921"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="74.3361" y="79.1841"/>
					<TrackLine>
						<End x="74.3361" y="76.6948"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3121" y="74.6708"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3121" y="67.8991"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3286" y="61.8826"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3286" y="61.2132"/>
					</TrackLine>
					<TrackLine>
						<End x="75.05" y="57.9346"/>
					</TrackLine>
					<TrackLine>
						<End x="75.05" y="56.6334"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5767" y="56.1601"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5934" y="56.1601"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3121" y="54.8788"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3121" y="54.2094"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1934" y="53.3281"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9521" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="48.458" y="75.958"/>
					<TrackLine>
						<End x="48.458" y="72.0955"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3768" y="71.1767"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3768" y="66.1694"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="66.0807"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="60.6924"/>
					</TrackLine>
					<TrackLine>
						<End x="49.6881" y="60.2924"/>
					</TrackLine>
					<TrackLine>
						<End x="49.6881" y="58.0797"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="56.8717"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="20.608" y="42.0161"/>
					<TrackLine>
						<End x="20.608" y="44.8583"/>
					</TrackLine>
					<TrackLine>
						<End x="18.584" y="46.8823"/>
					</TrackLine>
					<TrackLine>
						<End x="18.584" y="71.1767"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="71.9847"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="74.3361" y="79.1841"/>
					<TrackLine>
						<End x="74.3361" y="86.1214"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1441" y="86.9294"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1441" y="87.5988"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9808" y="87.7621"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9808" y="93.9568"/>
					</TrackLine>
					<TrackLine>
						<End x="75.5521" y="94.5281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="27.472" y="84.6034"/>
					<TrackLine>
						<End x="27.472" y="83.3141"/>
					</TrackLine>
					<TrackLine>
						<End x="28.688" y="82.0981"/>
					</TrackLine>
					<TrackLine>
						<End x="28.688" y="80.7268"/>
					</TrackLine>
					<TrackLine>
						<End x="29.896" y="79.5188"/>
					</TrackLine>
					<TrackLine>
						<End x="29.896" y="78.8494"/>
					</TrackLine>
					<TrackLine>
						<End x="29.088" y="78.0414"/>
					</TrackLine>
					<TrackLine>
						<End x="29.088" y="72.7201"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="72.3201" y="76.7521"/>
					<TrackLine>
						<End x="72.3201" y="75.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9121" y="74.8365"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9121" y="67.1565"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5206" y="61.5479"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="77.5681" y="95.3441"/>
					<TrackLine>
						<End x="76.3601" y="96.5521"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6174" y="96.5521"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5281" y="94.4628"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5281" y="77.1521"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1281" y="76.7521"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3201" y="76.7521"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="20.9537" y="75.958"/>
					<TrackLine>
						<End x="20.9537" y="71.9303"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2" y="71.1767"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2" y="70.5073"/>
					</TrackLine>
					<TrackLine>
						<End x="19.792" y="70.0993"/>
					</TrackLine>
					<TrackLine>
						<End x="19.792" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="79.1841" y="77.5681"/>
					<TrackLine>
						<End x="79.1841" y="63.0487"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0188" y="62.214"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0188" y="60.6293"/>
					</TrackLine>
					<TrackLine>
						<End x="79.4474" y="60.058"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="79.1841" y="95.3441"/>
					<TrackLine>
						<End x="77.4931" y="93.6531"/>
					</TrackLine>
					<TrackLine>
						<End x="77.4931" y="87.2467"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="85.5557"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="77.5681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="30.704" y="81.75"/>
					<TrackLine>
						<End x="30.704" y="78.526"/>
					</TrackLine>
					<TrackLine>
						<End x="30.5711" y="78.3931"/>
					</TrackLine>
					<TrackLine>
						<End x="30.5711" y="74.469"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="22.624" y="42.0161"/>
					<TrackLine>
						<End x="21.816" y="42.8241"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="47.3277"/>
					</TrackLine>
					<TrackLine>
						<End x="19.792" y="49.3517"/>
					</TrackLine>
					<TrackLine>
						<End x="19.792" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="49.674" y="78.0694"/>
					<TrackLine>
						<End x="49.674" y="76.4504"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="75.2203"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="62.3084"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3041" y="61.9084"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3041" y="61.4154"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5914" y="61.1281"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5914" y="58.5341"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="80.9086" y="58.5341"/>
					<TrackLine>
						<End x="80.9086" y="59.5684"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="61.076"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="77.5681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="22.624" y="79.1841"/>
					<TrackLine>
						<End x="22.624" y="69.0148"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="68.2068"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="63.5318"/>
					</TrackLine>
					<TrackLine>
						<End x="23.024" y="62.3238"/>
					</TrackLine>
					<TrackLine>
						<End x="23.024" y="56.9681"/>
					</TrackLine>
					<TrackLine>
						<End x="24.24" y="55.7521"/>
					</TrackLine>
					<TrackLine>
						<End x="24.24" y="51.7121"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="84.0321" y="77.5681"/>
					<TrackLine>
						<End x="84.0321" y="81.2734"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3011" y="87.0044"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3011" y="92.8451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="51.7121" y="53.3281"/>
					<TrackLine>
						<End x="51.7121" y="57.5121"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9201" y="58.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9201" y="69.4228"/>
					</TrackLine>
					<TrackLine>
						<End x="51.75" y="70.5928"/>
					</TrackLine>
					<TrackLine>
						<End x="51.75" y="76.1927"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="82.4161" y="53.7281"/>
					<TrackLine>
						<End x="82.4161" y="58.6494"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2241" y="59.4574"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2241" y="71.4388"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="72.2468"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="77.5681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="46.8641" y="77.5681"/>
					<TrackLine>
						<End x="46.8641" y="76.0724"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0561" y="75.2644"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0561" y="63.3588"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="60.1268"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="58.2454"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6721" y="56.6294"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6721" y="52.9934"/>
					</TrackLine>
					<TrackLine>
						<End x="48.1454" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2881" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="84.0321" y="53.3281"/>
					<TrackLine>
						<End x="83.4608" y="52.7567"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5141" y="52.7567"/>
					</TrackLine>
					<TrackLine>
						<End x="82.3508" y="52.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0814" y="52.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1006" y="54.9009"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1006" y="59.5684"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6081" y="61.076"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6081" y="71.4388"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8953" y="72.1515"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8953" y="76.0473"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="17.776" y="71.1041"/>
					<TrackLine>
						<End x="17.776" y="75.4847"/>
					</TrackLine>
					<TrackLine>
						<End x="23.8994" y="81.6081"/>
					</TrackLine>
					<TrackLine>
						<End x="26.664" y="81.6081"/>
					</TrackLine>
					<TrackLine>
						<End x="29.088" y="79.1841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="72"/>
				<Subwire width="0.2">
					<Start x="87.6641" y="70.9327"/>
					<TrackLine>
						<End x="87.6641" y="73.942"/>
					</TrackLine>
					<TrackLine>
						<End x="85.6481" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="69"/>
				<Subwire width="0.2">
					<Start x="25.856" y="87.2641"/>
					<TrackLine>
						<End x="15.352" y="76.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="15.352" y="72.3854"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="69.9614"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="NET00030"/>
				<Subwire width="0.2">
					<Start x="84.0321" y="92.1121"/>
					<TrackLine>
						<End x="84.0321" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="61.458" y="63.0241"/>
					<TrackLine>
						<End x="61.458" y="58.5995"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="57.0334"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="37.168" y="91.7254"/>
					<TrackLine>
						<End x="38.784" y="90.1094"/>
					</TrackLine>
					<TrackLine>
						<End x="38.784" y="84.0321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="82.92" y="23.02"/>
					<TrackLine>
						<End x="82.92" y="24.2706"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="28.6147"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="32.1353"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74.3361" y="49.8303"/>
					<TrackLine>
						<End x="74.3361" y="45.7214"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0548" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3854" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="71.56" y="43.6146"/>
					</TrackLine>
					<TrackLine>
						<End x="71.56" y="16.5"/>
					</TrackLine>
					<TrackLine>
						<End x="72.76" y="15.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="45.2481" y="61.8081"/>
					<TrackLine>
						<End x="45.2481" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="NET00026"/>
				<Subwire width="0.2">
					<Start x="88.8801" y="92.75"/>
					<TrackLine>
						<End x="88.8801" y="85.6481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="79.2359" y="92.0603"/>
					<TrackLine>
						<End x="79.9438" y="91.3525"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9438" y="88.0238"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="79.2359" y="92.0603"/>
					<TrackLine>
						<End x="79.9921" y="92.8164"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9921" y="96.1521"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5681" y="98.5761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="24.24" y="71.1041"/>
					<TrackLine>
						<End x="24.24" y="64.1668"/>
					</TrackLine>
					<TrackLine>
						<End x="26.664" y="61.7428"/>
					</TrackLine>
					<TrackLine>
						<End x="26.664" y="60.466"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="59.658"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="32.458" y="62.25"/>
					<TrackLine>
						<End x="32.458" y="59.3542"/>
					</TrackLine>
					<TrackLine>
						<End x="33.7624" y="58.0499"/>
					</TrackLine>
					<TrackLine>
						<End x="33.7624" y="56.5228"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="45.3845"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="55.3441" y="40.4001"/>
					<TrackLine>
						<End x="55.3441" y="41.6734"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="42.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="42.8241"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="46.8641" y="66.2561"/>
					<TrackLine>
						<End x="46.8641" y="75.5067"/>
					</TrackLine>
					<TrackLine>
						<End x="47.683" y="76.3256"/>
					</TrackLine>
					<TrackLine>
						<End x="47.683" y="92.2472"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="95.4683"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="97.2948"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1774" y="98.5681"/>
					</TrackLine>
					<TrackLine>
						<End x="61.8746" y="98.5681"/>
					</TrackLine>
					<TrackLine>
						<End x="64.7629" y="95.6798"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="14.34" y="23.02"/>
					<TrackLine>
						<End x="14.34" y="39.996"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="43.4321"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="84.0321" y="33.936"/>
					<TrackLine>
						<End x="84.0321" y="38.8764"/>
					</TrackLine>
					<TrackLine>
						<End x="88.8339" y="43.6782"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="72.7201" y="45.2481"/>
					<TrackLine>
						<End x="72.7201" y="48.9534"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7843" y="52.8891"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7843" y="61.725"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="87.2641" y="50.0961"/>
					<TrackLine>
						<End x="87.2641" y="46.8641"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="82.4161" y="42.0161"/>
					<TrackLine>
						<End x="82.4161" y="33.936"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="80.8001" y="42.0161"/>
					<TrackLine>
						<End x="80.8001" y="38.784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="71.4522" y="55.7273"/>
					<TrackLine>
						<End x="71.4522" y="61.4255"/>
					</TrackLine>
					<TrackLine>
						<End x="69.6709" y="63.2069"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="88.8801" y="42.0161"/>
					<TrackLine>
						<End x="88.8801" y="37.168"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="35.552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="3"/>
				<NetRef name="NET00003"/>
				<Subwire width="0.2">
					<Start x="12.928" y="56.5601"/>
					<TrackLine>
						<End x="10.504" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="10.504" y="74.6708"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="75.4788"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="80.8001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="53.3281" y="26.256"/>
					<TrackLine>
						<End x="48.5682" y="26.256"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0877" y="30.7365"/>
					</TrackLine>
					<TrackLine>
						<End x="35.5196" y="30.7365"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="56"/>
				<Subwire width="0.2">
					<Start x="40.95" y="43.5"/>
					<TrackLine>
						<End x="38.8018" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0537" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="56"/>
				<Subwire width="0.2">
					<Start x="38.75" y="36.5"/>
					<TrackLine>
						<End x="38.75" y="35.15"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="35.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="55"/>
				<Subwire width="0.2">
					<Start x="40.95" y="44.75"/>
					<TrackLine>
						<End x="38.6944" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="37.3884" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="36.36" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="35.552" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="55"/>
				<Subwire width="0.2">
					<Start x="37.5" y="36.5"/>
					<TrackLine>
						<End x="37.5" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="39.466" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4001" y="38.784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="54"/>
				<Subwire width="0.2">
					<Start x="35.552" y="42.0161"/>
					<TrackLine>
						<End x="33.528" y="44.0401"/>
					</TrackLine>
					<TrackLine>
						<End x="33.528" y="45.7484"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0265" y="47.25"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="47.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="54"/>
				<Subwire width="0.2">
					<Start x="36.25" y="36.5"/>
					<TrackLine>
						<End x="36.25" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="36.65" y="38.25"/>
					</TrackLine>
					<TrackLine>
						<End x="38.8448" y="38.25"/>
					</TrackLine>
					<TrackLine>
						<End x="39.3181" y="38.7233"/>
					</TrackLine>
					<TrackLine>
						<End x="39.3181" y="39.3927"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6947" y="42.0161"/>
					</TrackLine>
					<TrackLine>
						<End x="35.552" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="63.0241" y="35.552"/>
					<TrackLine>
						<End x="63.0241" y="34.744"/>
					</TrackLine>
					<TrackLine>
						<End x="62.222" y="33.942"/>
					</TrackLine>
					<TrackLine>
						<End x="60.9077" y="33.942"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4997" y="34.35"/>
					</TrackLine>
					<TrackLine>
						<End x="57.8414" y="34.35"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="33.8767"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="32.418"/>
					</TrackLine>
					<TrackLine>
						<End x="57.608" y="32.1781"/>
					</TrackLine>
					<TrackLine>
						<End x="57.608" y="30.846"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6661" y="29.904"/>
					</TrackLine>
					<TrackLine>
						<End x="53.9546" y="29.904"/>
					</TrackLine>
					<TrackLine>
						<End x="50.5459" y="33.3128"/>
					</TrackLine>
					<TrackLine>
						<End x="41.7928" y="33.3128"/>
					</TrackLine>
					<TrackLine>
						<End x="41.2081" y="32.728"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2906" y="32.728"/>
					</TrackLine>
					<TrackLine>
						<End x="30.8661" y="33.1525"/>
					</TrackLine>
					<TrackLine>
						<End x="29.4153" y="33.1525"/>
					</TrackLine>
					<TrackLine>
						<End x="27.692" y="31.4292"/>
					</TrackLine>
					<TrackLine>
						<End x="27.692" y="31.042"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="29.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="26.25" y="29.6"/>
					<TrackLine>
						<End x="13.44" y="29.6"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="27.472"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="26.25" y="29.6"/>
					<TrackLine>
						<End x="26.25" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="63.25" y="37.5"/>
					<TrackLine>
						<End x="63.25" y="35.778"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="35.552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="53"/>
				<Subwire width="0.2">
					<Start x="36.208" y="39.058"/>
					<TrackLine>
						<End x="38.5101" y="39.058"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="53"/>
				<Subwire width="0.2">
					<Start x="35" y="36.5"/>
					<TrackLine>
						<End x="35" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="36.208" y="39.058"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="53"/>
				<Subwire width="0.2">
					<Start x="36.208" y="39.058"/>
					<TrackLine>
						<End x="34.15" y="41.116"/>
					</TrackLine>
					<TrackLine>
						<End x="34.15" y="42.6101"/>
					</TrackLine>
					<TrackLine>
						<End x="33.128" y="43.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="33.128" y="45.5827"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6547" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9854" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9293" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="46"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="24"/>
				<Subwire width="0.2">
					<Start x="16.25" y="28.25"/>
					<TrackLine>
						<End x="16.25" y="24.0249"/>
					</TrackLine>
					<TrackLine>
						<End x="15.61" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="15.61" y="21.9"/>
					</TrackLine>
					<TrackLine>
						<End x="14.34" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="14.34" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="23"/>
				<Subwire width="0.2">
					<Start x="17.5" y="28.25"/>
					<TrackLine>
						<End x="17.5" y="24.0349"/>
					</TrackLine>
					<TrackLine>
						<End x="17.93" y="23.6049"/>
					</TrackLine>
					<TrackLine>
						<End x="17.93" y="21.68"/>
					</TrackLine>
					<TrackLine>
						<End x="16.88" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="16.88" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="22"/>
				<Subwire width="0.2">
					<Start x="18.75" y="28.25"/>
					<TrackLine>
						<End x="18.75" y="23.9849"/>
					</TrackLine>
					<TrackLine>
						<End x="18.37" y="23.6049"/>
					</TrackLine>
					<TrackLine>
						<End x="18.37" y="21.68"/>
					</TrackLine>
					<TrackLine>
						<End x="19.42" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="19.42" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="21"/>
				<Subwire width="0.2">
					<Start x="20" y="28.25"/>
					<TrackLine>
						<End x="20" y="24.0749"/>
					</TrackLine>
					<TrackLine>
						<End x="20.69" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="20.69" y="21.9"/>
					</TrackLine>
					<TrackLine>
						<End x="21.96" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="21.96" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="20"/>
				<Subwire width="0.2">
					<Start x="21.25" y="28.25"/>
					<TrackLine>
						<End x="21.25" y="25.3649"/>
					</TrackLine>
					<TrackLine>
						<End x="23.23" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="23.23" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="24.5" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="18"/>
				<Subwire width="0.2">
					<Start x="23.75" y="28.25"/>
					<TrackLine>
						<End x="23.75" y="26.9"/>
					</TrackLine>
					<TrackLine>
						<End x="26.43" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="27.4749" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="28.31" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="28.31" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="29.58" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="19"/>
				<Subwire width="0.2">
					<Start x="27.04" y="20.48"/>
					<TrackLine>
						<End x="25.77" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="25.77" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="22.5" y="26.6549"/>
					</TrackLine>
					<TrackLine>
						<End x="22.5" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="52"/>
				<Subwire width="0.2">
					<Start x="32.32" y="44.75"/>
					<TrackLine>
						<End x="29.75" y="44.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="52"/>
				<Subwire width="0.2">
					<Start x="32.32" y="44.75"/>
					<TrackLine>
						<End x="32.32" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="52"/>
				<Subwire width="0.2">
					<Start x="33.75" y="36.5"/>
					<TrackLine>
						<End x="33.75" y="42.4444"/>
					</TrackLine>
					<TrackLine>
						<End x="32.32" y="43.8744"/>
					</TrackLine>
					<TrackLine>
						<End x="32.32" y="44.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="51"/>
				<Subwire width="0.2">
					<Start x="40.4001" y="34.336"/>
					<TrackLine>
						<End x="39.5267" y="34.336"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1128" y="34.75"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5358" y="34.75"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1417" y="35.144"/>
					</TrackLine>
					<TrackLine>
						<End x="32.506" y="35.144"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5" y="35.15"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="51"/>
				<Subwire width="0.2">
					<Start x="29.75" y="43.5"/>
					<TrackLine>
						<End x="31.1" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5" y="42.1"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="29.75" y="42.25"/>
					<TrackLine>
						<End x="31.1" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="31.25" y="42.1"/>
					</TrackLine>
					<TrackLine>
						<End x="31.25" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="29.75" y="42.25"/>
					<TrackLine>
						<End x="25.282" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="23.84" y="40.8081"/>
					</TrackLine>
					<TrackLine>
						<End x="20.0343" y="40.8081"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6343" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="16.2253" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="14.136" y="43.2974"/>
					</TrackLine>
					<TrackLine>
						<End x="14.136" y="48.0233"/>
					</TrackLine>
					<TrackLine>
						<End x="13.9727" y="48.1867"/>
					</TrackLine>
					<TrackLine>
						<End x="14.544" y="48.758"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="38.784" y="33.936"/>
					<TrackLine>
						<End x="37.976" y="34.744"/>
					</TrackLine>
					<TrackLine>
						<End x="31.656" y="34.744"/>
					</TrackLine>
					<TrackLine>
						<End x="31.25" y="35.15"/>
					</TrackLine>
					<TrackLine>
						<End x="31.25" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="57.75" y="36.5"/>
					<TrackLine>
						<End x="57.75" y="35.15"/>
					</TrackLine>
					<TrackLine>
						<End x="61.4081" y="35.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="60.2" y="43.5"/>
					<TrackLine>
						<End x="58.85" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="42.8261"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="15"/>
				<Subwire width="0.2">
					<Start x="40.75" y="99.25"/>
					<TrackLine>
						<End x="40.75" y="97.3101"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4001" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="17"/>
				<Subwire width="0.2">
					<Start x="25" y="28.25"/>
					<TrackLine>
						<End x="25" y="26.9"/>
					</TrackLine>
					<TrackLine>
						<End x="25.236" y="26.664"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8067" y="26.664"/>
					</TrackLine>
					<TrackLine>
						<End x="30.85" y="23.6208"/>
					</TrackLine>
					<TrackLine>
						<End x="30.85" y="21.9"/>
					</TrackLine>
					<TrackLine>
						<End x="32.12" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="32.12" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="12"/>
				<Subwire width="0.2">
					<Start x="92.2" y="91.5"/>
					<TrackLine>
						<End x="87.8762" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="92.1121"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="40.4001" y="53.3281"/>
					<TrackLine>
						<End x="42.7779" y="53.3281"/>
					</TrackLine>
					<TrackLine>
						<End x="42.8702" y="53.2357"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="53.2357"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="72.76" y="20.48"/>
					<TrackLine>
						<End x="72.76" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="71.64" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="59.6951" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="58.79" y="22.6551"/>
					</TrackLine>
					<TrackLine>
						<End x="58.79" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9549" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5068" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5223" y="28.2045"/>
					</TrackLine>
					<TrackLine>
						<End x="47.7624" y="28.2045"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2555" y="30.7115"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="48.4727" y="30.7654"/>
					<TrackLine>
						<End x="47.6935" y="31.5445"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1849" y="31.5445"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3984" y="30.758"/>
					</TrackLine>
					<TrackLine>
						<End x="28.5" y="30.758"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="5"/>
				<Subwire width="0.2">
					<Start x="48.4801" y="32.1048"/>
					<TrackLine>
						<End x="31.3482" y="32.1048"/>
					</TrackLine>
					<TrackLine>
						<End x="31.1084" y="32.3445"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="32.3445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="2"/>
				<Subwire width="0.2">
					<Start x="85.46" y="20.48"/>
					<TrackLine>
						<End x="85.46" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="84.34" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5551" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="22.6551"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0149" y="25.02"/>
					</TrackLine>
					<TrackLine>
						<End x="58.273" y="25.02"/>
					</TrackLine>
					<TrackLine>
						<End x="52.589" y="30.704"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7121" y="30.704"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="4"/>
				<Subwire width="0.2">
					<Start x="80.38" y="20.48"/>
					<TrackLine>
						<End x="80.38" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="79.26" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="77.4751" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="76.57" y="22.6551"/>
					</TrackLine>
					<TrackLine>
						<End x="76.57" y="23.3849"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3349" y="24.62"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1073" y="24.62"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3228" y="29.4045"/>
					</TrackLine>
					<TrackLine>
						<End x="51.8689" y="29.4045"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="31.1774"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="32.5048"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="29.75" y="48.5"/>
					<TrackLine>
						<End x="31.3422" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="34.744" y="45.0981"/>
					</TrackLine>
					<TrackLine>
						<End x="34.744" y="44.9134"/>
					</TrackLine>
					<TrackLine>
						<End x="39.3574" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="42.1657" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="42.8241" y="40.9584"/>
					</TrackLine>
					<TrackLine>
						<End x="42.8241" y="42.9741"/>
					</TrackLine>
					<TrackLine>
						<End x="44.225" y="44.375"/>
					</TrackLine>
					<TrackLine>
						<End x="45" y="44.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="25" y="48.35"/>
					<TrackLine>
						<End x="22.058" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="20.991" y="49.417"/>
					</TrackLine>
					<TrackLine>
						<End x="19.0573" y="49.417"/>
					</TrackLine>
					<TrackLine>
						<End x="18.3598" y="48.7194"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7253" y="48.7194"/>
					</TrackLine>
					<TrackLine>
						<End x="14.8787" y="49.566"/>
					</TrackLine>
					<TrackLine>
						<End x="14.2093" y="49.566"/>
					</TrackLine>
					<TrackLine>
						<End x="13.5727" y="48.9293"/>
					</TrackLine>
					<TrackLine>
						<End x="13.5727" y="48.021"/>
					</TrackLine>
					<TrackLine>
						<End x="13.736" y="47.8576"/>
					</TrackLine>
					<TrackLine>
						<End x="13.736" y="42.8241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="68.25" y="36.25"/>
					<TrackLine>
						<End x="73.6381" y="36.25"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="35.552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="23.5" y="94.75"/>
					<TrackLine>
						<End x="23.5" y="95.525"/>
					</TrackLine>
					<TrackLine>
						<End x="24.6871" y="96.7121"/>
					</TrackLine>
					<TrackLine>
						<End x="27.72" y="96.7121"/>
					</TrackLine>
					<TrackLine>
						<End x="28.68" y="95.7521"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4364" y="95.7521"/>
					</TrackLine>
					<TrackLine>
						<End x="35.75" y="97.0657"/>
					</TrackLine>
					<TrackLine>
						<End x="35.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="83.2241" y="52.9934"/>
					<TrackLine>
						<End x="83.2241" y="54.0628"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7508" y="54.5361"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6639" y="54.5361"/>
					</TrackLine>
					<TrackLine>
						<End x="81.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="81.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="83.2241" y="52.9934"/>
					<TrackLine>
						<End x="83.1508" y="52.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="81.1042" y="52.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5042" y="51.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5774" y="51.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="52.9934"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="53.6628"/>
					</TrackLine>
					<TrackLine>
						<End x="51.25" y="54.0087"/>
					</TrackLine>
					<TrackLine>
						<End x="51.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="22.25" y="56.5"/>
					<TrackLine>
						<End x="22.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="22.6639" y="54.5361"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1244" y="54.5361"/>
					</TrackLine>
					<TrackLine>
						<End x="23.9977" y="53.6628"/>
					</TrackLine>
					<TrackLine>
						<End x="25.1732" y="53.6628"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="25" y="48.35"/>
					<TrackLine>
						<End x="25.15" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="25" y="47"/>
					<TrackLine>
						<End x="25" y="48.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="7.75" y="53"/>
					<TrackLine>
						<End x="7.75" y="47.6674"/>
					</TrackLine>
					<TrackLine>
						<End x="12.5933" y="42.8241"/>
					</TrackLine>
					<TrackLine>
						<End x="13.736" y="42.8241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="68.25" y="36.25"/>
					<TrackLine>
						<End x="65.0957" y="36.25"/>
					</TrackLine>
					<TrackLine>
						<End x="62.3877" y="33.542"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="33.542"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="23.5" y="94.75"/>
					<TrackLine>
						<End x="23.5" y="93.975"/>
					</TrackLine>
					<TrackLine>
						<End x="22.3129" y="92.7879"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1571" y="92.7879"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="90.0228"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="91.75" y="27"/>
					<TrackLine>
						<End x="91.75" y="24.38"/>
					</TrackLine>
					<TrackLine>
						<End x="90.54" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="90.54" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="49" y="48.5"/>
					<TrackLine>
						<End x="47.65" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="45" y="45.85"/>
					</TrackLine>
					<TrackLine>
						<End x="45" y="44.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="94.375" y="37.875"/>
					<TrackLine>
						<End x="94.375" y="37.1"/>
					</TrackLine>
					<TrackLine>
						<End x="92.827" y="35.552"/>
					</TrackLine>
					<TrackLine>
						<End x="92.1121" y="35.552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="51.142" y="85.6481"/>
					<TrackLine>
						<End x="51.95" y="84.8401"/>
					</TrackLine>
					<TrackLine>
						<End x="51.95" y="84.7515"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3015" y="84.4"/>
					</TrackLine>
					<TrackLine>
						<End x="55.0157" y="84.4"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="86.7524"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="57.3681" y="88.8801"/>
					<TrackLine>
						<End x="57.3681" y="89.2148"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5829" y="90"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5" y="90"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="57.3681" y="88.8801"/>
					<TrackLine>
						<End x="67.8721" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="86" y="41"/>
					<TrackLine>
						<End x="89.9534" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="90.1614" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="91.817" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="94.375" y="38.65"/>
					</TrackLine>
					<TrackLine>
						<End x="94.375" y="37.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="90.54" y="20.48"/>
					<TrackLine>
						<End x="87.9" y="17.84"/>
					</TrackLine>
					<TrackLine>
						<End x="80.38" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="88" y="23.02"/>
					<TrackLine>
						<End x="90.54" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="77.84" y="15.3"/>
					<TrackLine>
						<End x="80.38" y="15.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="82.4161" y="85.6481"/>
					<TrackLine>
						<End x="87.7374" y="85.6481"/>
					</TrackLine>
					<TrackLine>
						<End x="88.5454" y="84.8401"/>
					</TrackLine>
					<TrackLine>
						<End x="91.2401" y="84.8401"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="85.8"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="92.2" y="85.8"/>
					<TrackLine>
						<End x="92.5" y="85.5"/>
					</TrackLine>
					<TrackLine>
						<End x="92.5" y="75.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="92.2" y="86.5"/>
					<TrackLine>
						<End x="92.2" y="85.8"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="36.25" y="67.25"/>
					<TrackLine>
						<End x="34.2" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="32.05" y="69.4"/>
					</TrackLine>
					<TrackLine>
						<End x="32.05" y="69.4985"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6985" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="28.3073" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="26.3293" y="67.8721"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="67.8721"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="55.7521" y="69.058"/>
					<TrackLine>
						<End x="56.5441" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6985" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="63.2985" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="66.25" y="67.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="55.7521" y="69.058"/>
					<TrackLine>
						<End x="53.317" y="69.058"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9391" y="68.6801"/>
					</TrackLine>
					<TrackLine>
						<End x="47.8729" y="68.6801"/>
					</TrackLine>
					<TrackLine>
						<End x="46.703" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="39.625" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="37.025" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="36.25" y="67.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="90.0881" y="54.9441"/>
					<TrackLine>
						<End x="90.0881" y="58.6764"/>
					</TrackLine>
					<TrackLine>
						<End x="89.3805" y="59.3841"/>
					</TrackLine>
					<TrackLine>
						<End x="88.8148" y="59.3841"/>
					</TrackLine>
					<TrackLine>
						<End x="83.9668" y="64.2321"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7806" y="64.2321"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1985" y="60.65"/>
					</TrackLine>
					<TrackLine>
						<End x="64.5213" y="60.65"/>
					</TrackLine>
					<TrackLine>
						<End x="64.1872" y="60.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="61.0326" y="60.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6985" y="60.65"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3015" y="60.65"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="63.1994"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="69.058"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="83.2241" y="52.9934"/>
					<TrackLine>
						<End x="83.6974" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="84.7477" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="85.1477" y="52.1201"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="52.1201"/>
					</TrackLine>
					<TrackLine>
						<End x="90.0881" y="54.9441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="90.0881" y="54.9441"/>
					<TrackLine>
						<End x="93.7281" y="54.9441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="13.736" y="42.8241"/>
					<TrackLine>
						<End x="13.736" y="31.0387"/>
					</TrackLine>
					<TrackLine>
						<End x="10.504" y="27.8067"/>
					</TrackLine>
					<TrackLine>
						<End x="10.504" y="27.1373"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8" y="25.8414"/>
					</TrackLine>
					<TrackLine>
						<End x="12.12" y="25.8414"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="12.12" y="25.8414"/>
					<TrackLine>
						<End x="12.12" y="24.54"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8" y="24.22"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="15" y="28.25"/>
					<TrackLine>
						<End x="14.3" y="28.25"/>
					</TrackLine>
					<TrackLine>
						<End x="14.3" y="28.0213"/>
					</TrackLine>
					<TrackLine>
						<End x="12.12" y="25.8414"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="36.75" y="99.25"/>
					<TrackLine>
						<End x="35.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="36.75" y="99.25"/>
					<TrackLine>
						<End x="37.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="60"/>
				<Subwire width="0.2">
					<Start x="27.472" y="67.8721"/>
					<TrackLine>
						<End x="28.85" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="30.5" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="60"/>
				<Subwire width="0.2">
					<Start x="27.25" y="74"/>
					<TrackLine>
						<End x="28.3938" y="74"/>
					</TrackLine>
					<TrackLine>
						<End x="30.3459" y="75.9521"/>
					</TrackLine>
					<TrackLine>
						<End x="33.936" y="75.9521"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="33"/>
				<Subwire width="0.2">
					<Start x="29.5" y="90.5"/>
					<TrackLine>
						<End x="36.1194" y="90.5"/>
					</TrackLine>
					<TrackLine>
						<End x="39.3552" y="87.2641"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4001" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="59"/>
				<Subwire width="0.2">
					<Start x="32.32" y="70.5384"/>
					<TrackLine>
						<End x="28.2309" y="70.5384"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9425" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="13" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="59"/>
				<Subwire width="0.2">
					<Start x="13" y="69.25"/>
					<TrackLine>
						<End x="13" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="47"/>
				<Subwire width="0.2">
					<Start x="41.75" y="99.25"/>
					<TrackLine>
						<End x="41.75" y="97.7"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3719" y="97.7"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2481" y="98.5761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="46"/>
				<Subwire width="0.2">
					<Start x="42.75" y="99.25"/>
					<TrackLine>
						<End x="42.75" y="101.0742"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="101.8081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="45"/>
				<Subwire width="0.2">
					<Start x="46.5" y="99.3841"/>
					<TrackLine>
						<End x="44.9134" y="99.3841"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7792" y="99.25"/>
					</TrackLine>
					<TrackLine>
						<End x="43.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="44"/>
				<Subwire width="0.2">
					<Start x="47" y="94.5"/>
					<TrackLine>
						<End x="45.45" y="94.5"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6321" y="92.6821"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6321" y="90.4961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="43"/>
				<Subwire width="0.2">
					<Start x="47" y="93.5"/>
					<TrackLine>
						<End x="48.55" y="93.5"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5247" y="94.4747"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5247" y="95.2317"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="95.803"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="42"/>
				<Subwire width="0.2">
					<Start x="47" y="92.5"/>
					<TrackLine>
						<End x="48.55" y="92.5"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="94.8541"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9041" y="96.1377"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0817" y="96.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="34"/>
				<Subwire width="0.2">
					<Start x="29.5" y="91.5"/>
					<TrackLine>
						<End x="35.685" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3049" y="88.8801"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="41"/>
				<Subwire width="0.2">
					<Start x="47" y="91.5"/>
					<TrackLine>
						<End x="45.45" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4401" y="90.4901"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4401" y="89.6881"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6321" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="40"/>
				<Subwire width="0.2">
					<Start x="34.75" y="99.25"/>
					<TrackLine>
						<End x="34.75" y="96.6314"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2707" y="96.1521"/>
					</TrackLine>
					<TrackLine>
						<End x="33.128" y="96.1521"/>
					</TrackLine>
					<TrackLine>
						<End x="32.32" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="39"/>
				<Subwire width="0.2">
					<Start x="33.75" y="99.25"/>
					<TrackLine>
						<End x="33.75" y="97.1462"/>
					</TrackLine>
					<TrackLine>
						<End x="33.936" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="38"/>
				<Subwire width="0.2">
					<Start x="32.75" y="99.25"/>
					<TrackLine>
						<End x="29" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="35"/>
				<Subwire width="0.2">
					<Start x="29.5" y="92.5"/>
					<TrackLine>
						<End x="35.2507" y="92.5"/>
					</TrackLine>
					<TrackLine>
						<End x="36.8334" y="90.9174"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3907" y="90.9174"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7774" y="91.3041"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="91.3041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="117"/>
				<Subwire width="0.2">
					<Start x="39.75" y="81.75"/>
					<TrackLine>
						<End x="39.75" y="80.2"/>
					</TrackLine>
					<TrackLine>
						<End x="40.7659" y="79.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="79.1841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="36"/>
				<Subwire width="0.2">
					<Start x="29.5" y="93.5"/>
					<TrackLine>
						<End x="33.776" y="93.5"/>
					</TrackLine>
					<TrackLine>
						<End x="37.168" y="96.892"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="54.9441" y="96.9601"/>
					<TrackLine>
						<End x="54.1361" y="97.7681"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9879" y="97.7681"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3719" y="96.1521"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0654" y="96.1521"/>
					</TrackLine>
					<TrackLine>
						<End x="39.5921" y="96.6254"/>
					</TrackLine>
					<TrackLine>
						<End x="39.5921" y="97.2948"/>
					</TrackLine>
					<TrackLine>
						<End x="39.75" y="97.4528"/>
					</TrackLine>
					<TrackLine>
						<End x="39.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="60.2" y="44.75"/>
					<TrackLine>
						<End x="58.85" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="57.7761" y="43.6761"/>
					</TrackLine>
					<TrackLine>
						<End x="57.7761" y="42.8241"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="42.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="57.3681" y="42.4161"/>
					<TrackLine>
						<End x="54.9441" y="42.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="56.5" y="36.5"/>
					<TrackLine>
						<End x="56.5" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="56.626" y="37.976"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8948" y="37.976"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="38.4494"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="42.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="55.25" y="36.5"/>
					<TrackLine>
						<End x="55.25" y="35.15"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6074" y="34.5074"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8994" y="34.5074"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3281" y="33.936"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="49" y="47.25"/>
					<TrackLine>
						<End x="55.7008" y="47.25"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="45.5827"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="44.9134"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8948" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="56.2254" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="44.9134"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="45.2481"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="58.25" y="99.25"/>
					<TrackLine>
						<End x="58.25" y="97.7"/>
					</TrackLine>
					<TrackLine>
						<End x="57.5101" y="96.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="53.5" y="96"/>
					<TrackLine>
						<End x="55.6" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="112"/>
				<Subwire width="0.2">
					<Start x="66.25" y="81.75"/>
					<TrackLine>
						<End x="66.25" y="85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="112"/>
				<Subwire width="0.2">
					<Start x="71" y="85"/>
					<TrackLine>
						<End x="66.25" y="85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="112"/>
				<Subwire width="0.2">
					<Start x="66.25" y="85"/>
					<TrackLine>
						<End x="65.6019" y="85.6481"/>
					</TrackLine>
					<TrackLine>
						<End x="62.2161" y="85.6481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="49" y="46"/>
					<TrackLine>
						<End x="54.5533" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6094" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="54" y="36.5"/>
					<TrackLine>
						<End x="54" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="54.934" y="38.784"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5601" y="38.784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="58.25" y="81.75"/>
					<TrackLine>
						<End x="58.25" y="80.2"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="80.1261"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="79.1841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="58.25" y="81.75"/>
					<TrackLine>
						<End x="59.25" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="111"/>
				<Subwire width="0.2">
					<Start x="65.25" y="99.25"/>
					<TrackLine>
						<End x="65.25" y="101.1982"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6401" y="101.8081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="111"/>
				<Subwire width="0.2">
					<Start x="66.25" y="99.25"/>
					<TrackLine>
						<End x="65.25" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="48.25" y="56.5"/>
					<TrackLine>
						<End x="48.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="47.85" y="54.55"/>
					</TrackLine>
					<TrackLine>
						<End x="40.7197" y="54.55"/>
					</TrackLine>
					<TrackLine>
						<End x="35.736" y="59.5338"/>
					</TrackLine>
					<TrackLine>
						<End x="29.6404" y="59.5338"/>
					</TrackLine>
					<TrackLine>
						<End x="28.5741" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="21.8001" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="19.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="19.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="48.25" y="56.5"/>
					<TrackLine>
						<End x="48.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="48.7841" y="58.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2184" y="58.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3764" y="59.7421"/>
					</TrackLine>
					<TrackLine>
						<End x="56.9466" y="59.7421"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6387" y="59.05"/>
					</TrackLine>
					<TrackLine>
						<End x="61.3613" y="59.05"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6953" y="59.3841"/>
					</TrackLine>
					<TrackLine>
						<End x="63.5244" y="59.3841"/>
					</TrackLine>
					<TrackLine>
						<End x="65.8909" y="57.0176"/>
					</TrackLine>
					<TrackLine>
						<End x="68.3725" y="57.0176"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4708" y="54.9193"/>
					</TrackLine>
					<TrackLine>
						<End x="71.5526" y="54.9193"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7358" y="53.7361"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="53.7361"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7361" y="54.1361"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7601" y="54.1361"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5681" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="78.25" y="56.5"/>
					<TrackLine>
						<End x="78.25" y="54.01"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5681" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="53.5" y="93"/>
					<TrackLine>
						<End x="51.4573" y="93"/>
					</TrackLine>
					<TrackLine>
						<End x="48.9573" y="90.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="90.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="47" y="90.5"/>
					<TrackLine>
						<End x="45.45" y="90.5"/>
					</TrackLine>
					<TrackLine>
						<End x="45.45" y="86.2515"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0752" y="85.6263"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5018" y="85.6263"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="48.5688" y="70.842"/>
					<TrackLine>
						<End x="34.509" y="70.842"/>
					</TrackLine>
					<TrackLine>
						<End x="34.0046" y="71.3464"/>
					</TrackLine>
					<TrackLine>
						<End x="27.6199" y="71.3464"/>
					</TrackLine>
					<TrackLine>
						<End x="26.3075" y="70.034"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2" y="70.034"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="70.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="79.25" y="56.5"/>
					<TrackLine>
						<End x="79.25" y="53.8673"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9028" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="73.3862" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="71.4388" y="54.4674"/>
					</TrackLine>
					<TrackLine>
						<End x="70.357" y="54.4674"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2068" y="56.6176"/>
					</TrackLine>
					<TrackLine>
						<End x="65.7252" y="56.6176"/>
					</TrackLine>
					<TrackLine>
						<End x="63.3588" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="61.861" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="61.527" y="58.65"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3563" y="58.65"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6642" y="59.3421"/>
					</TrackLine>
					<TrackLine>
						<End x="50.5421" y="59.3421"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="22.624" y="53.3281"/>
					<TrackLine>
						<End x="23.7667" y="53.3281"/>
					</TrackLine>
					<TrackLine>
						<End x="25.8543" y="51.2405"/>
					</TrackLine>
					<TrackLine>
						<End x="31.1904" y="51.2405"/>
					</TrackLine>
					<TrackLine>
						<End x="31.654" y="51.7041"/>
					</TrackLine>
					<TrackLine>
						<End x="48.9614" y="51.7041"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3774" y="49.2881"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2788" y="49.2881"/>
					</TrackLine>
					<TrackLine>
						<End x="56.0868" y="50.0961"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="79.25" y="56.5"/>
					<TrackLine>
						<End x="79.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="78.85" y="58.45"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3502" y="58.45"/>
					</TrackLine>
					<TrackLine>
						<End x="73.7422" y="57.842"/>
					</TrackLine>
					<TrackLine>
						<End x="72.386" y="57.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="50.0961" y="90.4961"/>
					<TrackLine>
						<End x="49.1" y="89.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="89.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="50.0961" y="90.4961"/>
					<TrackLine>
						<End x="51.6" y="92"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5" y="92"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="20.25" y="56.5"/>
					<TrackLine>
						<End x="20.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="21.3006" y="53.8994"/>
					</TrackLine>
					<TrackLine>
						<End x="22.0527" y="53.8994"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="53.3281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="80.25" y="56.5"/>
					<TrackLine>
						<End x="80.25" y="54.3016"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0685" y="52.1201"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6435" y="52.1201"/>
					</TrackLine>
					<TrackLine>
						<End x="71.1041" y="53.6594"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="80.25" y="56.5"/>
					<TrackLine>
						<End x="80.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1006" y="58.1994"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1006" y="59.0028"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="59.7023"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="63.0241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="24.24" y="59.7921"/>
					<TrackLine>
						<End x="25.1821" y="58.85"/>
					</TrackLine>
					<TrackLine>
						<End x="32.3965" y="58.85"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0965" y="54.15"/>
					</TrackLine>
					<TrackLine>
						<End x="49.45" y="54.15"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="24.24" y="59.7921"/>
					<TrackLine>
						<End x="22.9921" y="59.7921"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="53.5" y="91"/>
					<TrackLine>
						<End x="51.95" y="91"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6674" y="89.7174"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6674" y="89.4515"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="47" y="88.5"/>
					<TrackLine>
						<End x="48.729" y="88.5"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1091" y="88.8801"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="88.8801"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="23.25" y="56.5"/>
					<TrackLine>
						<End x="23.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="23.2639" y="54.9361"/>
					</TrackLine>
					<TrackLine>
						<End x="25.0426" y="54.9361"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9812" y="53.9974"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9812" y="52.5449"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6888" y="51.8372"/>
					</TrackLine>
					<TrackLine>
						<End x="28.8479" y="51.8372"/>
					</TrackLine>
					<TrackLine>
						<End x="31.512" y="54.5013"/>
					</TrackLine>
					<TrackLine>
						<End x="31.512" y="55.7521"/>
					</TrackLine>
					<TrackLine>
						<End x="30.1384" y="57.1258"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="52.25" y="56.5"/>
					<TrackLine>
						<End x="52.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="52.65" y="58.45"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6642" y="58.45"/>
					</TrackLine>
					<TrackLine>
						<End x="57.2722" y="57.842"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="57.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="51.142" y="87.6641"/>
					<TrackLine>
						<End x="49.5241" y="87.6641"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3599" y="87.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="87.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="53.5" y="89"/>
					<TrackLine>
						<End x="51.95" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7133" y="88.7633"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7133" y="88.2354"/>
					</TrackLine>
					<TrackLine>
						<End x="51.142" y="87.6641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="82.4161" y="59.7921"/>
					<TrackLine>
						<End x="82.4161" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="82.25" y="58.818"/>
					</TrackLine>
					<TrackLine>
						<End x="82.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="28.9111" y="54.1744"/>
					<TrackLine>
						<End x="28.9111" y="57.2032"/>
					</TrackLine>
					<TrackLine>
						<End x="27.6642" y="58.45"/>
					</TrackLine>
					<TrackLine>
						<End x="24.65" y="58.45"/>
					</TrackLine>
					<TrackLine>
						<End x="24.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="24.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="49.934" y="86.5"/>
					<TrackLine>
						<End x="49.934" y="85.1477"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0943" y="82.9874"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7567" y="82.9874"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3281" y="82.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="47" y="86.5"/>
					<TrackLine>
						<End x="49.934" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="49.934" y="86.5"/>
					<TrackLine>
						<End x="50.2901" y="86.8561"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4767" y="86.8561"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1257" y="87.5052"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1257" y="87.5757"/>
					</TrackLine>
					<TrackLine>
						<End x="52.55" y="88"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5" y="88"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="87.2641" y="53.3281"/>
					<TrackLine>
						<End x="86.4561" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="85.3134" y="52.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8401" y="52.9934"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8401" y="53.6628"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3668" y="54.1361"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0639" y="54.1361"/>
					</TrackLine>
					<TrackLine>
						<End x="83.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="83.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="64.2649" y="56.1849"/>
					<TrackLine>
						<End x="61.3933" y="56.1849"/>
					</TrackLine>
					<TrackLine>
						<End x="59.7584" y="54.55"/>
					</TrackLine>
					<TrackLine>
						<End x="53.65" y="54.55"/>
					</TrackLine>
					<TrackLine>
						<End x="53.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="53.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="25.25" y="56.5"/>
					<TrackLine>
						<End x="25.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="27.4985" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9765" y="57.572"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9765" y="53.9663"/>
					</TrackLine>
					<TrackLine>
						<End x="28.5764" y="53.3664"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2457" y="53.3664"/>
					</TrackLine>
					<TrackLine>
						<End x="29.7191" y="53.8397"/>
					</TrackLine>
					<TrackLine>
						<End x="29.7191" y="55.4557"/>
					</TrackLine>
					<TrackLine>
						<End x="29.3304" y="55.8444"/>
					</TrackLine>
					<TrackLine>
						<End x="29.3304" y="57.4604"/>
					</TrackLine>
					<TrackLine>
						<End x="29.9908" y="58.1208"/>
					</TrackLine>
					<TrackLine>
						<End x="31.983" y="58.1208"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5544" y="57.5495"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="43.75" y="81.75"/>
					<TrackLine>
						<End x="43.75" y="79.7754"/>
					</TrackLine>
					<TrackLine>
						<End x="41.9507" y="77.9761"/>
					</TrackLine>
					<TrackLine>
						<End x="28.68" y="77.9761"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="80.8001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="54.25" y="56.5"/>
					<TrackLine>
						<End x="54.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="56.4985" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="57.5145" y="57.034"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9841" y="57.034"/>
					</TrackLine>
					<TrackLine>
						<End x="59.7921" y="57.842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="66.5389" y="58.4589"/>
					<TrackLine>
						<End x="71.8602" y="58.4589"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6513" y="59.25"/>
					</TrackLine>
					<TrackLine>
						<End x="79.7821" y="59.25"/>
					</TrackLine>
					<TrackLine>
						<End x="80.2554" y="59.7233"/>
					</TrackLine>
					<TrackLine>
						<End x="80.2554" y="61.4094"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9921" y="61.6727"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9921" y="63.3588"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4654" y="63.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="81.1348" y="63.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2241" y="61.7428"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2241" y="59.202"/>
					</TrackLine>
					<TrackLine>
						<End x="84.25" y="58.1761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="84.25" y="56.5"/>
					<TrackLine>
						<End x="84.25" y="58.1761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="84.25" y="58.1761"/>
					<TrackLine>
						<End x="88.8801" y="58.1761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="56.5601" y="88.8801"/>
					<TrackLine>
						<End x="55.9887" y="88.3088"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9887" y="87.9387"/>
					</TrackLine>
					<TrackLine>
						<End x="55.05" y="87"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5" y="87"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="30.704" y="54.9441"/>
					<TrackLine>
						<End x="30.1327" y="54.3727"/>
					</TrackLine>
					<TrackLine>
						<End x="30.1327" y="53.6877"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6823" y="52.2372"/>
					</TrackLine>
					<TrackLine>
						<End x="26.8545" y="52.2372"/>
					</TrackLine>
					<TrackLine>
						<End x="26.3812" y="52.7105"/>
					</TrackLine>
					<TrackLine>
						<End x="26.3812" y="54.1631"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="54.2943"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="53.5" y="86"/>
					<TrackLine>
						<End x="51.9328" y="86"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4767" y="86.4561"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8073" y="86.4561"/>
					</TrackLine>
					<TrackLine>
						<End x="50.334" y="85.9828"/>
					</TrackLine>
					<TrackLine>
						<End x="50.334" y="85.3134"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6474" y="84"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3602" y="84"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="82.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="85.6481" y="53.3281"/>
					<TrackLine>
						<End x="85.6481" y="54.5519"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="42.75" y="81.75"/>
					<TrackLine>
						<End x="42.75" y="83.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="42.75" y="83.3"/>
					<TrackLine>
						<End x="50.9737" y="83.3"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6656" y="81.6081"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1361" y="81.6081"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9441" y="82.4161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="29.088" y="84.0321"/>
					<TrackLine>
						<End x="30.7719" y="85.716"/>
					</TrackLine>
					<TrackLine>
						<End x="40.334" y="85.716"/>
					</TrackLine>
					<TrackLine>
						<End x="42.75" y="83.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="67.8721" y="55.8096"/>
					<TrackLine>
						<End x="65.7828" y="55.8096"/>
					</TrackLine>
					<TrackLine>
						<End x="64.5996" y="56.9929"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6356" y="56.9929"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5928" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="56.25" y="56.5"/>
					<TrackLine>
						<End x="59.5928" y="56.5"/>
					</TrackLine>
					<TrackLine>
						<End x="61.2688" y="58.1761"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="58.1761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="27.25" y="56.5"/>
					<TrackLine>
						<End x="27.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1892" y="54.8892"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1892" y="53.0452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="56.5601" y="87.2641"/>
					<TrackLine>
						<End x="55.9887" y="86.6928"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9887" y="85.9387"/>
					</TrackLine>
					<TrackLine>
						<End x="55.05" y="85"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5" y="85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="86.25" y="56.5"/>
					<TrackLine>
						<End x="88.3467" y="56.5"/>
					</TrackLine>
					<TrackLine>
						<End x="89.6881" y="57.8414"/>
					</TrackLine>
					<TrackLine>
						<End x="89.6881" y="58.5108"/>
					</TrackLine>
					<TrackLine>
						<End x="89.2148" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="86.7992" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="85.6481" y="60.1352"/>
					</TrackLine>
					<TrackLine>
						<End x="85.6481" y="61.4081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="26.8274" y="82.8161"/>
					<TrackLine>
						<End x="29.0147" y="82.8161"/>
					</TrackLine>
					<TrackLine>
						<End x="31.5146" y="85.316"/>
					</TrackLine>
					<TrackLine>
						<End x="39.734" y="85.316"/>
					</TrackLine>
					<TrackLine>
						<End x="41.75" y="83.3"/>
					</TrackLine>
					<TrackLine>
						<End x="41.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="32.5871" y="74.7201"/>
					<TrackLine>
						<End x="41.2574" y="74.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="41.6814" y="75.1441"/>
					</TrackLine>
					<TrackLine>
						<End x="42.3507" y="75.1441"/>
					</TrackLine>
					<TrackLine>
						<End x="43.4948" y="74"/>
					</TrackLine>
					<TrackLine>
						<End x="45.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="14.944" y="43.6321"/>
					<TrackLine>
						<End x="14.944" y="45.594"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="45.65"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="47"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="75.25" y="74"/>
					<TrackLine>
						<End x="74.4571" y="74"/>
					</TrackLine>
					<TrackLine>
						<End x="74.121" y="74.3361"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1201" y="74.3361"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="16.25" y="74"/>
					<TrackLine>
						<End x="14.0531" y="74"/>
					</TrackLine>
					<TrackLine>
						<End x="13.717" y="74.3361"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="74.3361"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="29.5" y="89.5"/>
					<TrackLine>
						<End x="26.9492" y="89.5"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="78.8008"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="71" y="96"/>
					<TrackLine>
						<End x="73.7191" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="73.975" y="95.7441"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9521" y="95.7441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="75.9521" y="60.458"/>
					<TrackLine>
						<End x="74.6072" y="60.458"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9992" y="59.85"/>
					</TrackLine>
					<TrackLine>
						<End x="64.1899" y="59.85"/>
					</TrackLine>
					<TrackLine>
						<End x="63.8558" y="60.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="61.364" y="60.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="61.0299" y="59.85"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9701" y="59.85"/>
					</TrackLine>
					<TrackLine>
						<End x="57.278" y="60.5421"/>
					</TrackLine>
					<TrackLine>
						<End x="50.045" y="60.5421"/>
					</TrackLine>
					<TrackLine>
						<End x="49.295" y="59.7921"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4801" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="16.25" y="47"/>
					<TrackLine>
						<End x="16.25" y="45.65"/>
					</TrackLine>
					<TrackLine>
						<End x="18.2679" y="43.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2997" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="46.25" y="74"/>
					<TrackLine>
						<End x="46.25" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="43.9021" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="74.3361"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="76.25" y="74"/>
					<TrackLine>
						<End x="76.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8319" y="77.9681"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="77.9681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="17.776" y="77.5681"/>
					<TrackLine>
						<End x="17.776" y="76.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="76.2341"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="29.5" y="88.5"/>
					<TrackLine>
						<End x="27.95" y="88.5"/>
					</TrackLine>
					<TrackLine>
						<End x="26.664" y="87.214"/>
					</TrackLine>
					<TrackLine>
						<End x="26.664" y="86.4561"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="77.5681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="71" y="95"/>
					<TrackLine>
						<End x="69.45" y="95"/>
					</TrackLine>
					<TrackLine>
						<End x="69.45" y="96.2485"/>
					</TrackLine>
					<TrackLine>
						<End x="70.1616" y="96.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="20.608" y="42.0161"/>
					<TrackLine>
						<End x="20.608" y="43.4664"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6343" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="18.7099" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="45.65"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="47"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="47.25" y="74"/>
					<TrackLine>
						<End x="47.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="47.658" y="75.958"/>
					</TrackLine>
					<TrackLine>
						<End x="48.458" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="77.25" y="74"/>
					<TrackLine>
						<End x="77.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="76.65" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="76.65" y="76.8702"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="79.1841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="18.25" y="74"/>
					<TrackLine>
						<End x="18.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="18.658" y="75.958"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="29.5" y="87.5"/>
					<TrackLine>
						<End x="27.95" y="87.5"/>
					</TrackLine>
					<TrackLine>
						<End x="27.064" y="86.614"/>
					</TrackLine>
					<TrackLine>
						<End x="27.064" y="85.3381"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="77.6661"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="71" y="94"/>
					<TrackLine>
						<End x="73.383" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9111" y="94.5281"/>
					</TrackLine>
					<TrackLine>
						<End x="75.5521" y="94.5281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="48.25" y="74"/>
					<TrackLine>
						<End x="48.25" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="47.85" y="72.05"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6747" y="72.05"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2747" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="33.7145" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="31.5791" y="74.5854"/>
					</TrackLine>
					<TrackLine>
						<End x="31.5791" y="74.6037"/>
					</TrackLine>
					<TrackLine>
						<End x="30.9058" y="75.277"/>
					</TrackLine>
					<TrackLine>
						<End x="30.2365" y="75.277"/>
					</TrackLine>
					<TrackLine>
						<End x="29.088" y="74.1286"/>
					</TrackLine>
					<TrackLine>
						<End x="29.088" y="72.7201"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="19.392" y="42.0161"/>
					<TrackLine>
						<End x="20.2" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="20.9427" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="21.416" y="41.6814"/>
					</TrackLine>
					<TrackLine>
						<End x="21.416" y="43.2241"/>
					</TrackLine>
					<TrackLine>
						<End x="19.8" y="44.8401"/>
					</TrackLine>
					<TrackLine>
						<End x="19.5599" y="44.8401"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="45.65"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="47"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="72.3201" y="76.7521"/>
					<TrackLine>
						<End x="72.3201" y="74.6788"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3121" y="74.6708"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3121" y="74.0014"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8635" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="78.25" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="78.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="71" y="93"/>
					<TrackLine>
						<End x="73.8173" y="93"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5374" y="93.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9441" y="93.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5681" y="95.3441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="27.472" y="84.6034"/>
					<TrackLine>
						<End x="28.0434" y="85.1748"/>
					</TrackLine>
					<TrackLine>
						<End x="28.7748" y="85.1748"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="85.9"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="19.25" y="74"/>
					<TrackLine>
						<End x="19.25" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="16.0015" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7314" y="72.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="72.7201"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="79.4474" y="60.058"/>
					<TrackLine>
						<End x="77.6813" y="60.058"/>
					</TrackLine>
					<TrackLine>
						<End x="76.4733" y="61.266"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8495" y="61.266"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8335" y="60.25"/>
					</TrackLine>
					<TrackLine>
						<End x="64.3556" y="60.25"/>
					</TrackLine>
					<TrackLine>
						<End x="64.0215" y="60.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="61.1983" y="60.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8642" y="60.25"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1358" y="60.25"/>
					</TrackLine>
					<TrackLine>
						<End x="57.4437" y="60.9421"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7774" y="60.9421"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3114" y="61.4081"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0961" y="61.4081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="49.25" y="74"/>
					<TrackLine>
						<End x="49.25" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="48.45" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="34.509" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="34.109" y="72.05"/>
					</TrackLine>
					<TrackLine>
						<End x="32.9901" y="72.05"/>
					</TrackLine>
					<TrackLine>
						<End x="30.5711" y="74.469"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="71" y="92"/>
					<TrackLine>
						<End x="73.383" y="92"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7031" y="93.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5791" y="93.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3871" y="94.1281"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9681" y="94.1281"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="95.3441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="79.25" y="74"/>
					<TrackLine>
						<End x="79.25" y="76.6942"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="76.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="77.5681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="20.25" y="74"/>
					<TrackLine>
						<End x="20.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="20.658" y="75.958"/>
					</TrackLine>
					<TrackLine>
						<End x="20.9537" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="20" y="47"/>
					<TrackLine>
						<End x="20" y="45.2058"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="43.3897"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="42.8241"/>
					</TrackLine>
					<TrackLine>
						<End x="22.624" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="32.75" y="81.75"/>
					<TrackLine>
						<End x="30.704" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="83.25" y="74"/>
					<TrackLine>
						<End x="83.25" y="76.7342"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="77.5681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="21.25" y="47"/>
					<TrackLine>
						<End x="21.25" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="20.991" y="48.609"/>
					</TrackLine>
					<TrackLine>
						<End x="19.392" y="48.609"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="22.624" y="79.1841"/>
					<TrackLine>
						<End x="24.25" y="77.5581"/>
					</TrackLine>
					<TrackLine>
						<End x="24.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="71" y="88"/>
					<TrackLine>
						<End x="68.7003" y="88"/>
					</TrackLine>
					<TrackLine>
						<End x="68.3725" y="87.6721"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9665" y="87.6721"/>
					</TrackLine>
					<TrackLine>
						<End x="67.5585" y="87.2641"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6401" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="53.25" y="74"/>
					<TrackLine>
						<End x="53.25" y="75.8354"/>
					</TrackLine>
					<TrackLine>
						<End x="51.0159" y="78.0694"/>
					</TrackLine>
					<TrackLine>
						<End x="49.674" y="78.0694"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="22.624" y="79.1841"/>
					<TrackLine>
						<End x="25.048" y="81.6081"/>
					</TrackLine>
					<TrackLine>
						<End x="27.947" y="81.6081"/>
					</TrackLine>
					<TrackLine>
						<End x="29.3551" y="80.2"/>
					</TrackLine>
					<TrackLine>
						<End x="33.75" y="80.2"/>
					</TrackLine>
					<TrackLine>
						<End x="33.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="51.7121" y="53.3281"/>
					<TrackLine>
						<End x="70.2928" y="53.3281"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9008" y="51.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2342" y="51.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="80.2422" y="53.7281"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="53.7281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="23.25" y="74"/>
					<TrackLine>
						<End x="23.25" y="77.4154"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="78.8494"/>
					</TrackLine>
					<TrackLine>
						<End x="21.816" y="79.5188"/>
					</TrackLine>
					<TrackLine>
						<End x="24.3053" y="82.0081"/>
					</TrackLine>
					<TrackLine>
						<End x="29.6497" y="82.0081"/>
					</TrackLine>
					<TrackLine>
						<End x="30.9416" y="83.3"/>
					</TrackLine>
					<TrackLine>
						<End x="34.75" y="83.3"/>
					</TrackLine>
					<TrackLine>
						<End x="34.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="34.75" y="81.75"/>
					<TrackLine>
						<End x="34.75" y="79.9981"/>
					</TrackLine>
					<TrackLine>
						<End x="33.936" y="79.1841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="24.24" y="43.6321"/>
					<TrackLine>
						<End x="22.5" y="45.3721"/>
					</TrackLine>
					<TrackLine>
						<End x="22.5" y="47"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="82.25" y="74"/>
					<TrackLine>
						<End x="82.25" y="76.2134"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6081" y="76.8553"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6081" y="77.9028"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0814" y="78.3761"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2241" y="78.3761"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="77.5681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="71" y="89"/>
					<TrackLine>
						<End x="74.456" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3011" y="92.8451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="52.25" y="74"/>
					<TrackLine>
						<End x="52.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3213" y="75.6213"/>
					</TrackLine>
					<TrackLine>
						<End x="51.75" y="76.1927"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="35.75" y="81.75"/>
					<TrackLine>
						<End x="35.75" y="79.8554"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2707" y="78.3761"/>
					</TrackLine>
					<TrackLine>
						<End x="33.6014" y="78.3761"/>
					</TrackLine>
					<TrackLine>
						<End x="32.7934" y="79.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="29.088" y="79.1841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="46.8641" y="77.5681"/>
					<TrackLine>
						<End x="49.0326" y="77.5681"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3393" y="77.2614"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5386" y="77.2614"/>
					</TrackLine>
					<TrackLine>
						<End x="51.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="51.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="23.75" y="47"/>
					<TrackLine>
						<End x="23.75" y="45.65"/>
					</TrackLine>
					<TrackLine>
						<End x="24.1519" y="45.2481"/>
					</TrackLine>
					<TrackLine>
						<End x="24.24" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="22.25" y="74"/>
					<TrackLine>
						<End x="22.25" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="21.45" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="19.0573" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="18.584" y="71.1767"/>
					</TrackLine>
					<TrackLine>
						<End x="18.584" y="71.1041"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="71.1041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="81.25" y="74"/>
					<TrackLine>
						<End x="81.25" y="75.6927"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8953" y="76.0473"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="71" y="90"/>
					<TrackLine>
						<End x="72.9487" y="90"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0608" y="92.1121"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9521" y="92.1121"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="76"/>
				<Subwire width="0.2">
					<Start x="56.25" y="74"/>
					<TrackLine>
						<End x="56.85" y="74"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6047" y="74.7547"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6047" y="75.3808"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="75.9521"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="76"/>
				<Subwire width="0.2">
					<Start x="56.5601" y="67.8601"/>
					<TrackLine>
						<End x="57.95" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="75"/>
				<Subwire width="0.2">
					<Start x="42" y="68.25"/>
					<TrackLine>
						<End x="54.5441" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="75"/>
				<Subwire width="0.2">
					<Start x="42" y="69.25"/>
					<TrackLine>
						<End x="42" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="72"/>
				<Subwire width="0.2">
					<Start x="86.25" y="74"/>
					<TrackLine>
						<End x="86.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="85.842" y="75.958"/>
					</TrackLine>
					<TrackLine>
						<End x="85.6481" y="75.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="72"/>
				<Subwire width="0.2">
					<Start x="89.5" y="69.25"/>
					<TrackLine>
						<End x="89.5" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="88.9886" y="70.3614"/>
					</TrackLine>
					<TrackLine>
						<End x="88.2355" y="70.3614"/>
					</TrackLine>
					<TrackLine>
						<End x="87.6641" y="70.9327"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="71"/>
				<Subwire width="0.2">
					<Start x="72" y="69.25"/>
					<TrackLine>
						<End x="64.6401" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="71"/>
				<Subwire width="0.2">
					<Start x="72" y="69.25"/>
					<TrackLine>
						<End x="72" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="NET00030"/>
				<Subwire width="0.2">
					<Start x="84.0321" y="92.1121"/>
					<TrackLine>
						<End x="83.42" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="91.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="NET00030"/>
				<Subwire width="0.2">
					<Start x="81" y="86.5"/>
					<TrackLine>
						<End x="84.0321" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="76.25" y="56.5"/>
					<TrackLine>
						<End x="76.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8441" y="54.5441"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1201" y="54.5441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.2" y="94"/>
					<TrackLine>
						<End x="93.55" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="95.3441" y="92.2059"/>
					</TrackLine>
					<TrackLine>
						<End x="95.3441" y="90.4961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="45" y="40.125"/>
					<TrackLine>
						<End x="47.1037" y="40.125"/>
					</TrackLine>
					<TrackLine>
						<End x="47.7287" y="39.5"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4241" y="39.5"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5889" y="40.6648"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="71" y="91"/>
					<TrackLine>
						<End x="73.383" y="91"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3031" y="92.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="77.2141" y="92.9201"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0221" y="93.7281"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="93.7281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74.3361" y="87.2641"/>
					<TrackLine>
						<End x="74.3361" y="86.3557"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9157" y="78.7761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81.9157" y="78.7761"/>
					<TrackLine>
						<End x="80.0873" y="76.9477"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0873" y="75.7127"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="30.5" y="68.25"/>
					<TrackLine>
						<End x="32.05" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2879" y="66.0121"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2879" y="64.1871"/>
					</TrackLine>
					<TrackLine>
						<End x="35.475" y="63"/>
					</TrackLine>
					<TrackLine>
						<End x="36.25" y="63"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="37.025" y="63"/>
					<TrackLine>
						<End x="38.76" y="63"/>
					</TrackLine>
					<TrackLine>
						<End x="38.784" y="63.0241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="37.025" y="63"/>
					<TrackLine>
						<End x="38.2121" y="64.1871"/>
					</TrackLine>
					<TrackLine>
						<End x="38.2121" y="65.0121"/>
					</TrackLine>
					<TrackLine>
						<End x="40.45" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="42" y="67.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81" y="89"/>
					<TrackLine>
						<End x="80.35" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="79.6136" y="89.7364"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8011" y="89.7364"/>
					</TrackLine>
					<TrackLine>
						<End x="76.3287" y="87.2641"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="37.168" y="91.7254"/>
					<TrackLine>
						<End x="38.75" y="93.3073"/>
					</TrackLine>
					<TrackLine>
						<End x="38.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="17.25" y="56.5"/>
					<TrackLine>
						<End x="17.25" y="59.1754"/>
					</TrackLine>
					<TrackLine>
						<End x="16.968" y="59.4574"/>
					</TrackLine>
					<TrackLine>
						<End x="16.968" y="65.4481"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="66.2561"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="45.2481" y="75.958"/>
					<TrackLine>
						<End x="46.85" y="75.958"/>
					</TrackLine>
					<TrackLine>
						<End x="47.658" y="76.766"/>
					</TrackLine>
					<TrackLine>
						<End x="49.034" y="76.766"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="36.75" y="81.75"/>
					<TrackLine>
						<End x="36.75" y="80.2"/>
					</TrackLine>
					<TrackLine>
						<End x="38.75" y="80.2"/>
					</TrackLine>
					<TrackLine>
						<End x="38.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="40.75" y="81.75"/>
					<TrackLine>
						<End x="40.75" y="83.3"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0179" y="84.0321"/>
					</TrackLine>
					<TrackLine>
						<End x="38.784" y="84.0321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.784" y="84.0321"/>
					<TrackLine>
						<End x="38.75" y="83.9981"/>
					</TrackLine>
					<TrackLine>
						<End x="38.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.2" y="90.25"/>
					<TrackLine>
						<End x="93.92" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="94.1661" y="90.4961"/>
					</TrackLine>
					<TrackLine>
						<End x="95.3441" y="90.4961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="11.45" y="67.8721"/>
					<TrackLine>
						<End x="9.696" y="67.8721"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="11.45" y="67.8721"/>
					<TrackLine>
						<End x="11.45" y="69.4985"/>
					</TrackLine>
					<TrackLine>
						<End x="12.0245" y="70.073"/>
					</TrackLine>
					<TrackLine>
						<End x="16.0818" y="70.073"/>
					</TrackLine>
					<TrackLine>
						<End x="16.968" y="70.9593"/>
					</TrackLine>
					<TrackLine>
						<End x="16.968" y="71.4388"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5792" y="72.05"/>
					</TrackLine>
					<TrackLine>
						<End x="20.85" y="72.05"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="13" y="67.25"/>
					<TrackLine>
						<End x="11.45" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="11.45" y="67.8721"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="40" y="36.5"/>
					<TrackLine>
						<End x="40.7" y="36.5"/>
					</TrackLine>
					<TrackLine>
						<End x="43.0379" y="38.8379"/>
					</TrackLine>
					<TrackLine>
						<End x="43.0379" y="38.9379"/>
					</TrackLine>
					<TrackLine>
						<End x="44.225" y="40.125"/>
					</TrackLine>
					<TrackLine>
						<End x="45" y="40.125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="62.9625" y="40.575"/>
					<TrackLine>
						<End x="63.25" y="40.575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="60.2" y="41"/>
					<TrackLine>
						<End x="61.575" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="62" y="40.575"/>
					</TrackLine>
					<TrackLine>
						<End x="62.9625" y="40.575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="62.9625" y="40.575"/>
					<TrackLine>
						<End x="61.1715" y="38.784"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="38.784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="59" y="36.5"/>
					<TrackLine>
						<End x="59" y="37.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1761" y="38.784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="66.25" y="63"/>
					<TrackLine>
						<End x="63.245" y="63"/>
					</TrackLine>
					<TrackLine>
						<End x="63.221" y="63.0241"/>
					</TrackLine>
					<TrackLine>
						<End x="61.458" y="63.0241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="59.5" y="68.25"/>
					<TrackLine>
						<End x="61.05" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="61.458" y="67.842"/>
					</TrackLine>
					<TrackLine>
						<End x="61.458" y="63.0241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="89.5" y="68.25"/>
					<TrackLine>
						<End x="91.05" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="91.5408" y="68.7408"/>
					</TrackLine>
					<TrackLine>
						<End x="91.5408" y="68.9167"/>
					</TrackLine>
					<TrackLine>
						<End x="92.1121" y="69.4881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="68.25" y="43.5367"/>
					<TrackLine>
						<End x="68.1546" y="43.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0241" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="19.25" y="94.75"/>
					<TrackLine>
						<End x="13.5221" y="94.75"/>
					</TrackLine>
					<TrackLine>
						<End x="11.312" y="96.9601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="12" y="53"/>
					<TrackLine>
						<End x="15.3" y="53"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81" y="94"/>
					<TrackLine>
						<End x="79.456" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="93.7281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="26.25" y="47"/>
					<TrackLine>
						<End x="26.25" y="45.65"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6519" y="45.2481"/>
					</TrackLine>
					<TrackLine>
						<End x="27.472" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="68.25" y="40.5"/>
					<TrackLine>
						<End x="65.375" y="40.5"/>
					</TrackLine>
					<TrackLine>
						<End x="65.3" y="40.575"/>
					</TrackLine>
					<TrackLine>
						<End x="63.25" y="40.575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="68.25" y="40.5"/>
					<TrackLine>
						<End x="68.25" y="43.5367"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.5" y="71.5"/>
					<TrackLine>
						<End x="92.5" y="69.876"/>
					</TrackLine>
					<TrackLine>
						<End x="92.1121" y="69.4881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81.9157" y="78.7761"/>
					<TrackLine>
						<End x="84.5384" y="78.7761"/>
					</TrackLine>
					<TrackLine>
						<End x="90.5379" y="72.7766"/>
					</TrackLine>
					<TrackLine>
						<End x="90.5379" y="72.6871"/>
					</TrackLine>
					<TrackLine>
						<End x="91.725" y="71.5"/>
					</TrackLine>
					<TrackLine>
						<End x="92.5" y="71.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="43.6321" y="48.4801"/>
					<TrackLine>
						<End x="42.4241" y="47.2721"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4241" y="41.1241"/>
					</TrackLine>
					<TrackLine>
						<End x="42.3" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="40.95" y="41"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="30.5" y="68.25"/>
					<TrackLine>
						<End x="28.95" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="28.28" y="67.58"/>
					</TrackLine>
					<TrackLine>
						<End x="28.28" y="67.5374"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9987" y="66.2561"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="66.2561"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="13" y="67.25"/>
					<TrackLine>
						<End x="16.7821" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="66.2561"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="65.25" y="81.75"/>
					<TrackLine>
						<End x="65.25" y="83.3"/>
					</TrackLine>
					<TrackLine>
						<End x="63.7099" y="84.8401"/>
					</TrackLine>
					<TrackLine>
						<End x="61.8814" y="84.8401"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6001" y="86.1214"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6001" y="87.5988"/>
					</TrackLine>
					<TrackLine>
						<End x="61.0734" y="88.0721"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2068" y="88.0721"/>
					</TrackLine>
					<TrackLine>
						<End x="69.45" y="89.3153"/>
					</TrackLine>
					<TrackLine>
						<End x="69.45" y="91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="69.45" y="91"/>
					<TrackLine>
						<End x="71" y="91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="72" y="67.25"/>
					<TrackLine>
						<End x="70.45" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2121" y="65.0121"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2121" y="64.1871"/>
					</TrackLine>
					<TrackLine>
						<End x="67.025" y="63"/>
					</TrackLine>
					<TrackLine>
						<End x="66.25" y="63"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="64.25" y="97.3354"/>
					<TrackLine>
						<End x="65.5709" y="96.0145"/>
					</TrackLine>
					<TrackLine>
						<End x="65.5709" y="94.8791"/>
					</TrackLine>
					<TrackLine>
						<End x="69.45" y="91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="64.25" y="97.3354"/>
					<TrackLine>
						<End x="58.7629" y="97.3354"/>
					</TrackLine>
					<TrackLine>
						<End x="56.4276" y="95"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5" y="95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="64.25" y="99.25"/>
					<TrackLine>
						<End x="64.25" y="97.3354"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="45.2481" y="61.8081"/>
					<TrackLine>
						<End x="46.25" y="60.8061"/>
					</TrackLine>
					<TrackLine>
						<End x="46.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74.8" y="48.5"/>
					<TrackLine>
						<End x="74.8" y="49.3664"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3361" y="49.8303"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="68.25" y="43.5367"/>
					<TrackLine>
						<End x="73.2133" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="91.75" y="32.4"/>
					<TrackLine>
						<End x="87.5288" y="32.4"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="32.1353"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="86" y="36.5"/>
					<TrackLine>
						<End x="87.0875" y="36.5"/>
					</TrackLine>
					<TrackLine>
						<End x="88.4625" y="37.875"/>
					</TrackLine>
					<TrackLine>
						<End x="90.125" y="37.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="91.75" y="32.4"/>
					<TrackLine>
						<End x="91.75" y="34.45"/>
					</TrackLine>
					<TrackLine>
						<End x="91.5" y="34.45"/>
					</TrackLine>
					<TrackLine>
						<End x="90.125" y="35.825"/>
					</TrackLine>
					<TrackLine>
						<End x="90.125" y="37.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.2" y="94"/>
					<TrackLine>
						<End x="81" y="94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81" y="94"/>
					<TrackLine>
						<End x="81" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="36.25" y="63"/>
					<TrackLine>
						<End x="37.025" y="63"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="37"/>
				<Subwire width="0.2">
					<Start x="29.5" y="94.5"/>
					<TrackLine>
						<End x="26.7002" y="94.5"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="95.3441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="NET00026"/>
				<Subwire width="0.2">
					<Start x="92.2" y="87.75"/>
					<TrackLine>
						<End x="90.85" y="87.75"/>
					</TrackLine>
					<TrackLine>
						<End x="89.4515" y="86.3515"/>
					</TrackLine>
					<TrackLine>
						<End x="89.4515" y="86.2194"/>
					</TrackLine>
					<TrackLine>
						<End x="88.8801" y="85.6481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="NET00026"/>
				<Subwire width="0.2">
					<Start x="92.2" y="92.75"/>
					<TrackLine>
						<End x="88.8801" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="57"/>
				<Subwire width="0.2">
					<Start x="35.552" y="84.508"/>
					<TrackLine>
						<End x="36.542" y="84.508"/>
					</TrackLine>
					<TrackLine>
						<End x="37.75" y="83.3"/>
					</TrackLine>
					<TrackLine>
						<End x="37.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="81" y="87.75"/>
					<TrackLine>
						<End x="79.65" y="87.75"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="87.2841"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1841" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="81" y="90.25"/>
					<TrackLine>
						<End x="85.975" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="87.225" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="81" y="90.25"/>
					<TrackLine>
						<End x="77.376" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="75.726" y="88.6"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5293" y="88.6"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9293" y="87"/>
					</TrackLine>
					<TrackLine>
						<End x="71" y="87"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="84.25" y="74"/>
					<TrackLine>
						<End x="84.25" y="75.7026"/>
					</TrackLine>
					<TrackLine>
						<End x="85.3134" y="76.766"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9828" y="76.766"/>
					</TrackLine>
					<TrackLine>
						<End x="86.85" y="75.8988"/>
					</TrackLine>
					<TrackLine>
						<End x="86.85" y="72.7793"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3668" y="70.2961"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6081" y="70.2961"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="71.1041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="71" y="87"/>
					<TrackLine>
						<End x="67.8601" y="87"/>
					</TrackLine>
					<TrackLine>
						<End x="67.3162" y="86.4561"/>
					</TrackLine>
					<TrackLine>
						<End x="62.2161" y="86.4561"/>
					</TrackLine>
					<TrackLine>
						<End x="61.4081" y="87.2641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="25.25" y="74"/>
					<TrackLine>
						<End x="25.25" y="72.1141"/>
					</TrackLine>
					<TrackLine>
						<End x="24.24" y="71.1041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="51.7121" y="69.4881"/>
					<TrackLine>
						<End x="54.25" y="72.026"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="54.25" y="74"/>
					<TrackLine>
						<End x="54.25" y="72.026"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="54.25" y="72.026"/>
					<TrackLine>
						<End x="71.9949" y="72.026"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9169" y="71.1041"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="71.1041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="56.5601" y="43.6321"/>
					<TrackLine>
						<End x="57.3681" y="43.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3681" y="43.8338"/>
					</TrackLine>
					<TrackLine>
						<End x="57.7681" y="44.2338"/>
					</TrackLine>
					<TrackLine>
						<End x="57.7681" y="45.7484"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4165" y="48.1"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4341" y="48.1"/>
					</TrackLine>
					<TrackLine>
						<End x="50.246" y="49.2881"/>
					</TrackLine>
					<TrackLine>
						<End x="35.552" y="49.2881"/>
					</TrackLine>
					<TrackLine>
						<End x="33.936" y="50.9041"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9854" y="50.9041"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2983" y="50.217"/>
					</TrackLine>
					<TrackLine>
						<End x="18.726" y="50.217"/>
					</TrackLine>
					<TrackLine>
						<End x="18.0284" y="49.5194"/>
					</TrackLine>
					<TrackLine>
						<End x="16.0567" y="49.5194"/>
					</TrackLine>
					<TrackLine>
						<End x="14.6261" y="50.95"/>
					</TrackLine>
					<TrackLine>
						<End x="10.9007" y="50.95"/>
					</TrackLine>
					<TrackLine>
						<End x="10.725" y="51.1257"/>
					</TrackLine>
					<TrackLine>
						<End x="10.725" y="54.8743"/>
					</TrackLine>
					<TrackLine>
						<End x="11.2518" y="55.401"/>
					</TrackLine>
					<TrackLine>
						<End x="12.9117" y="55.401"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0106" y="56.5"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="52.75" y="36.5"/>
					<TrackLine>
						<End x="52.75" y="34.5007"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5201" y="34.2707"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5201" y="33.6014"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3974" y="32.724"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9307" y="32.724"/>
					</TrackLine>
					<TrackLine>
						<End x="56.808" y="31.8467"/>
					</TrackLine>
					<TrackLine>
						<End x="56.808" y="31.1774"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3347" y="30.704"/>
					</TrackLine>
					<TrackLine>
						<End x="54.286" y="30.704"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8773" y="34.1128"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1816" y="34.1128"/>
					</TrackLine>
					<TrackLine>
						<End x="47.9" y="35.3944"/>
					</TrackLine>
					<TrackLine>
						<End x="47.9" y="37.8814"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1186" y="39.1"/>
					</TrackLine>
					<TrackLine>
						<End x="51.1667" y="39.1"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3969" y="40.3302"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3969" y="40.9995"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9236" y="41.4728"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2542" y="41.4728"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7809" y="40.9995"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7809" y="40.5753"/>
					</TrackLine>
					<TrackLine>
						<End x="50.1056" y="39.9"/>
					</TrackLine>
					<TrackLine>
						<End x="47.8944" y="39.9"/>
					</TrackLine>
					<TrackLine>
						<End x="47.25" y="40.5444"/>
					</TrackLine>
					<TrackLine>
						<End x="47.25" y="41.0243"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8533" y="41.421"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7184" y="41.421"/>
					</TrackLine>
					<TrackLine>
						<End x="43.2241" y="41.9153"/>
					</TrackLine>
					<TrackLine>
						<End x="43.2241" y="42.5847"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7184" y="43.079"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8533" y="43.079"/>
					</TrackLine>
					<TrackLine>
						<End x="47.05" y="43.2757"/>
					</TrackLine>
					<TrackLine>
						<End x="47.05" y="44.15"/>
					</TrackLine>
					<TrackLine>
						<End x="47.65" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="44.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="56.5601" y="43.6321"/>
					<TrackLine>
						<End x="55.7521" y="43.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7521" y="43.9667"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2788" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6094" y="44.4401"/>
					</TrackLine>
					<TrackLine>
						<End x="54.2994" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="44.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="13" y="61.25"/>
					<TrackLine>
						<End x="13" y="60.65"/>
					</TrackLine>
					<TrackLine>
						<End x="13.0499" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="13.6999" y="60.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="55.25" y="75.55"/>
					<TrackLine>
						<End x="51.9226" y="78.8774"/>
					</TrackLine>
					<TrackLine>
						<End x="44.5221" y="78.8774"/>
					</TrackLine>
					<TrackLine>
						<End x="43.2207" y="77.5761"/>
					</TrackLine>
					<TrackLine>
						<End x="28.2761" y="77.5761"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="75.55"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="55.25" y="74"/>
					<TrackLine>
						<End x="55.25" y="75.55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="29.75" y="41"/>
					<TrackLine>
						<End x="26.456" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="25.856" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="29.75" y="41"/>
					<TrackLine>
						<End x="29.75" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="30" y="40.05"/>
					</TrackLine>
					<TrackLine>
						<End x="30" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="55.25" y="75.55"/>
					<TrackLine>
						<End x="56.4601" y="76.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2068" y="76.7601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="68.2068" y="76.7601"/>
					<TrackLine>
						<End x="72.55" y="81.1033"/>
					</TrackLine>
					<TrackLine>
						<End x="72.55" y="86"/>
					</TrackLine>
					<TrackLine>
						<End x="71" y="86"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="68.2068" y="76.7601"/>
					<TrackLine>
						<End x="72.9169" y="72.05"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0862" y="72.05"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="71.1041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="85.25" y="74"/>
					<TrackLine>
						<End x="85.25" y="72.322"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="71.1041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="30" y="36.5"/>
					<TrackLine>
						<End x="30" y="35.15"/>
					</TrackLine>
					<TrackLine>
						<End x="31.214" y="33.936"/>
					</TrackLine>
					<TrackLine>
						<End x="36.495" y="33.936"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="54.9441" y="43.6321"/>
					<TrackLine>
						<End x="52.3091" y="43.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="52.177" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="43.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="30.5" y="62.25"/>
					<TrackLine>
						<End x="32.458" y="62.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="51.5" y="36.5"/>
					<TrackLine>
						<End x="51.5" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="52.794" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3441" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="30.5" y="62.25"/>
					<TrackLine>
						<End x="30.5" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="74.242" y="56.9681"/>
					<TrackLine>
						<End x="71.5452" y="56.9681"/>
					</TrackLine>
					<TrackLine>
						<End x="70.743" y="57.7703"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2473" y="57.7703"/>
					</TrackLine>
					<TrackLine>
						<End x="68.1279" y="57.6509"/>
					</TrackLine>
					<TrackLine>
						<End x="65.8233" y="57.6509"/>
					</TrackLine>
					<TrackLine>
						<End x="63.6901" y="59.7841"/>
					</TrackLine>
					<TrackLine>
						<End x="61.5297" y="59.7841"/>
					</TrackLine>
					<TrackLine>
						<End x="61.1956" y="59.45"/>
					</TrackLine>
					<TrackLine>
						<End x="57.8044" y="59.45"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1123" y="60.1421"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2107" y="60.1421"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0527" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="48.1454" y="58.9841"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="47.25" y="56.5"/>
					<TrackLine>
						<End x="47.25" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8854" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="35.9017" y="59.9338"/>
					</TrackLine>
					<TrackLine>
						<End x="30.0177" y="59.9338"/>
					</TrackLine>
					<TrackLine>
						<End x="27.7354" y="62.2161"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2" y="62.2161"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="59.7921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="48.1454" y="58.9841"/>
					<TrackLine>
						<End x="46.8641" y="60.2654"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8641" y="66.2561"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="48.1454" y="58.9841"/>
					<TrackLine>
						<End x="47.25" y="58.0887"/>
					</TrackLine>
					<TrackLine>
						<End x="47.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="77.25" y="56.5"/>
					<TrackLine>
						<End x="77.25" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5159" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="74.242" y="57.7761"/>
					</TrackLine>
					<TrackLine>
						<End x="74.242" y="56.9681"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="17.776" y="59.7921"/>
					<TrackLine>
						<End x="17.776" y="58.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="18.25" y="58.5101"/>
					</TrackLine>
					<TrackLine>
						<End x="18.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="53.5" y="94"/>
					<TrackLine>
						<End x="55.9933" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6731" y="95.6798"/>
					</TrackLine>
					<TrackLine>
						<End x="64.7629" y="95.6798"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="47.65" y="42.25"/>
					<TrackLine>
						<End x="49" y="42.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="47.65" y="42.25"/>
					<TrackLine>
						<End x="44.0321" y="42.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="50.25" y="35.15"/>
					<TrackLine>
						<End x="48.7101" y="35.15"/>
					</TrackLine>
					<TrackLine>
						<End x="48.3" y="35.56"/>
					</TrackLine>
					<TrackLine>
						<End x="48.3" y="37.7157"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2343" y="38.65"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2824" y="38.65"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7969" y="40.1645"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7969" y="41.1652"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0893" y="41.8728"/>
					</TrackLine>
					<TrackLine>
						<End x="51.0885" y="41.8728"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3809" y="41.1652"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3809" y="40.741"/>
					</TrackLine>
					<TrackLine>
						<End x="49.94" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="48.06" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="47.65" y="40.7101"/>
					</TrackLine>
					<TrackLine>
						<End x="47.65" y="42.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="50.25" y="35.15"/>
					<TrackLine>
						<End x="50.8872" y="34.5128"/>
					</TrackLine>
					<TrackLine>
						<End x="51.043" y="34.5128"/>
					</TrackLine>
					<TrackLine>
						<End x="54.0437" y="31.512"/>
					</TrackLine>
					<TrackLine>
						<End x="56" y="31.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="50.25" y="36.5"/>
					<TrackLine>
						<End x="50.25" y="35.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="49" y="36.5"/>
					<TrackLine>
						<End x="49" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4" y="38.25"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4549" y="38.25"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6049" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="49" y="41"/>
					<TrackLine>
						<End x="49.65" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9228" y="42.2728"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5401" y="42.2728"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6049" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6049" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="84.75" y="36.5"/>
					<TrackLine>
						<End x="84.75" y="34.8341"/>
					</TrackLine>
					<TrackLine>
						<End x="85.6481" y="33.936"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="42" y="61.25"/>
					<TrackLine>
						<End x="42" y="60.65"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="60.6339"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0161" y="56.5601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="42.0161" y="56.5601"/>
					<TrackLine>
						<End x="43.707" y="56.5601"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7671" y="56.5"/>
					</TrackLine>
					<TrackLine>
						<End x="45.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="74.8" y="46"/>
					<TrackLine>
						<End x="73.1108" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0548" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9121" y="46.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="71.1041" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="83.5" y="36.5"/>
					<TrackLine>
						<End x="83.5" y="34.4681"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0321" y="33.936"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="74.8" y="44.75"/>
					<TrackLine>
						<End x="73.2181" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7201" y="45.2481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="59.5" y="62.25"/>
					<TrackLine>
						<End x="61.0894" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6144" y="61.725"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7843" y="61.725"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="59.5" y="62.25"/>
					<TrackLine>
						<End x="59.5" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="74.3361" y="69.4881"/>
					<TrackLine>
						<End x="79.4634" y="69.4881"/>
					</TrackLine>
					<TrackLine>
						<End x="89.1674" y="59.7841"/>
					</TrackLine>
					<TrackLine>
						<End x="90.0308" y="59.7841"/>
					</TrackLine>
					<TrackLine>
						<End x="94.5361" y="55.2788"/>
					</TrackLine>
					<TrackLine>
						<End x="94.5361" y="54.6094"/>
					</TrackLine>
					<TrackLine>
						<End x="90.0228" y="50.0961"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="50.0961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="86" y="42.25"/>
					<TrackLine>
						<End x="84.054" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="83.8201" y="42.0161"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4161" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="82.4161" y="33.936"/>
					<TrackLine>
						<End x="82.4161" y="34.9839"/>
					</TrackLine>
					<TrackLine>
						<End x="82.25" y="35.15"/>
					</TrackLine>
					<TrackLine>
						<End x="82.25" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="81" y="36.5"/>
					<TrackLine>
						<End x="81" y="38.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="38.784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="86" y="43.5"/>
					<TrackLine>
						<End x="82.284" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8001" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="86" y="44.75"/>
					<TrackLine>
						<End x="87.35" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0259" y="44.0741"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0259" y="42.8702"/>
					</TrackLine>
					<TrackLine>
						<End x="88.8801" y="42.0161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="87.2641" y="35.552"/>
					<TrackLine>
						<End x="87.2641" y="34.4094"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9828" y="33.128"/>
					</TrackLine>
					<TrackLine>
						<End x="81.772" y="33.128"/>
					</TrackLine>
					<TrackLine>
						<End x="79.75" y="35.15"/>
					</TrackLine>
					<TrackLine>
						<End x="79.75" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="75.25" y="56.5"/>
					<TrackLine>
						<End x="74.9101" y="56.1601"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9073" y="56.1601"/>
					</TrackLine>
					<TrackLine>
						<End x="73.7688" y="56.2986"/>
					</TrackLine>
					<TrackLine>
						<End x="72.0236" y="56.2986"/>
					</TrackLine>
					<TrackLine>
						<End x="71.4522" y="55.7273"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="72" y="61.25"/>
					<TrackLine>
						<End x="70.45" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="69.6709" y="62.0291"/>
					</TrackLine>
					<TrackLine>
						<End x="69.6709" y="63.2069"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="89.5" y="61.25"/>
					<TrackLine>
						<End x="89.5" y="60.65"/>
					</TrackLine>
					<TrackLine>
						<End x="89.9659" y="60.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="90.1965" y="60.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="94.9361" y="55.4444"/>
					</TrackLine>
					<TrackLine>
						<End x="94.9361" y="53.5861"/>
					</TrackLine>
					<TrackLine>
						<End x="87.35" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="46"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="78.5" y="36.5"/>
					<TrackLine>
						<End x="78.5" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="80.242" y="39.592"/>
					</TrackLine>
					<TrackLine>
						<End x="81.1348" y="39.592"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7508" y="37.976"/>
					</TrackLine>
					<TrackLine>
						<End x="87.5988" y="37.976"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0721" y="38.4494"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0721" y="39.3603"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="86" y="46"/>
					<TrackLine>
						<End x="83.6414" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9921" y="42.3507"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9921" y="41.6814"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4654" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="81.7698" y="41.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0318" y="39.946"/>
					</TrackLine>
					<TrackLine>
						<End x="87.4864" y="39.946"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0721" y="39.3603"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="88.0721" y="39.3603"/>
					<TrackLine>
						<End x="89.1118" y="40.4001"/>
					</TrackLine>
					<TrackLine>
						<End x="90.4961" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="89.5" y="61.25"/>
					<TrackLine>
						<End x="89.5" y="62.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="77.25" y="36.5"/>
					<TrackLine>
						<End x="77.25" y="37.85"/>
					</TrackLine>
					<TrackLine>
						<End x="79.392" y="39.992"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5921" y="39.992"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="79.5921" y="39.992"/>
					<TrackLine>
						<End x="79.5921" y="42.5164"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3257" y="47.25"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="47.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="79.5921" y="39.992"/>
					<TrackLine>
						<End x="81.7698" y="39.992"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9778" y="38.784"/>
					</TrackLine>
					<TrackLine>
						<End x="87.2641" y="38.784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="12.928" y="71.1041"/>
					<TrackLine>
						<End x="14.4491" y="71.1041"/>
					</TrackLine>
					<TrackLine>
						<End x="14.6389" y="71.2939"/>
					</TrackLine>
					<TrackLine>
						<End x="16.16" y="71.2939"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="30.7676" y="52.0485"/>
					<TrackLine>
						<End x="31.3389" y="52.6199"/>
					</TrackLine>
					<TrackLine>
						<End x="39.9656" y="52.6199"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4814" y="52.1041"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0176" y="52.1041"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2176" y="50.9041"/>
					</TrackLine>
					<TrackLine>
						<End x="74.405" y="50.9041"/>
					</TrackLine>
					<TrackLine>
						<End x="76.15" y="49.159"/>
					</TrackLine>
					<TrackLine>
						<End x="76.15" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="88.6" y="35.417"/>
					<TrackLine>
						<End x="88.0287" y="34.8457"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0287" y="34.6082"/>
					</TrackLine>
					<TrackLine>
						<End x="86.1485" y="32.728"/>
					</TrackLine>
					<TrackLine>
						<End x="78.422" y="32.728"/>
					</TrackLine>
					<TrackLine>
						<End x="76" y="35.15"/>
					</TrackLine>
					<TrackLine>
						<End x="76" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="76" y="36.5"/>
					<TrackLine>
						<End x="76" y="40.56"/>
					</TrackLine>
					<TrackLine>
						<End x="76.15" y="40.7101"/>
					</TrackLine>
					<TrackLine>
						<End x="76.15" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="76.15" y="48.5"/>
					<TrackLine>
						<End x="86" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.2">
					<Start x="40.95" y="48.5"/>
					<TrackLine>
						<End x="32.6591" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="31.3422" y="49.817"/>
					</TrackLine>
					<TrackLine>
						<End x="18.8917" y="49.817"/>
					</TrackLine>
					<TrackLine>
						<End x="18.1941" y="49.1194"/>
					</TrackLine>
					<TrackLine>
						<End x="15.891" y="49.1194"/>
					</TrackLine>
					<TrackLine>
						<End x="15.0444" y="49.966"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0436" y="49.966"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="48.8504"/>
					</TrackLine>
					<TrackLine>
						<End x="12.928" y="43.6321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="NET00001"/>
				<Subwire width="0.2">
					<Start x="60.2" y="48.5"/>
					<TrackLine>
						<End x="51.5998" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="48.7957" y="51.3041"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8197" y="51.3041"/>
					</TrackLine>
					<TrackLine>
						<End x="31.1528" y="50.6372"/>
					</TrackLine>
					<TrackLine>
						<End x="18.5805" y="50.6372"/>
					</TrackLine>
					<TrackLine>
						<End x="18.2707" y="50.3274"/>
					</TrackLine>
					<TrackLine>
						<End x="16.3914" y="50.3274"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="4"/>
				<NetRef name="NET00000"/>
				<Subwire width="0.2">
					<Start x="74.8" y="41"/>
					<TrackLine>
						<End x="71.8993" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="69.7305" y="38.8313"/>
					</TrackLine>
					<TrackLine>
						<End x="62.5945" y="38.8313"/>
					</TrackLine>
					<TrackLine>
						<End x="62.025" y="38.2618"/>
					</TrackLine>
					<TrackLine>
						<End x="62.025" y="36.207"/>
					</TrackLine>
					<TrackLine>
						<End x="62.2161" y="36.0159"/>
					</TrackLine>
					<TrackLine>
						<End x="62.2161" y="34.8153"/>
					</TrackLine>
					<TrackLine>
						<End x="61.7428" y="34.342"/>
					</TrackLine>
					<TrackLine>
						<End x="61.0734" y="34.342"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6654" y="34.75"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6757" y="34.75"/>
					</TrackLine>
					<TrackLine>
						<End x="56.9681" y="34.0424"/>
					</TrackLine>
					<TrackLine>
						<End x="56.9681" y="32.2523"/>
					</TrackLine>
					<TrackLine>
						<End x="57.208" y="32.0124"/>
					</TrackLine>
					<TrackLine>
						<End x="57.208" y="31.0117"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5004" y="30.304"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1203" y="30.304"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7116" y="33.7128"/>
					</TrackLine>
					<TrackLine>
						<End x="41.6271" y="33.7128"/>
					</TrackLine>
					<TrackLine>
						<End x="41.0424" y="33.128"/>
					</TrackLine>
					<TrackLine>
						<End x="31.4563" y="33.128"/>
					</TrackLine>
					<TrackLine>
						<End x="24.1843" y="40.4001"/>
					</TrackLine>
					<TrackLine>
						<End x="17.776" y="40.4001"/>
					</TrackLine>
				</Subwire>
			</Wire>
		</Wires>
	</Connectivity>

	<Settings version="1.3">
		<Autoroute/>
		<Autoproc/>
		<Placement>
			<PlacementArea>
				<Dot x="0" y="0"/>
				<Dot x="0" y="0"/>
			</PlacementArea>
		</Placement>
		<Labels rotateWithComp="on"/>
	</Settings>

	<DisplayControl version="1.3">
		<View scale="7.34677" scrollHorz="51" scrollVert="56"/>
		<ActiveLayer name="1"/>
		<Units preference="Metric"/>
		<Colors hilightRate="42" darkRate="0"
		 background="#030b10" board="#d4d4d4" netLines="#af7d3a"
		 keepoutPlaceBoth="#f79646" keepoutWireAll="#ff0000" keepoutPlaceTop="#259500" keepoutPlaceBot="#00aaaa"
		 compsBound="#ffffff" compsName="#ffffff" pinsName="#bad3ef" pinsNet="#bad3ef"
		 clrThroughPads="#c0c0c0" clrThroughVias="#949494" clrBurriedVias="#949494" clrBlindVias="#949494" clrFixedVias="#7070b8"
		 drcViolation="#ffffff" narrow="#ff00ff" trimmed="#038bef"/>
		<Show
		 showBoardOutline="on"
		 showWires="on"
		 showCoppers="on"
		 showTexts="on"
		 throughVia="on" burriedVia="on" blindVia="on" fixedVia="on"
		 showVias="on"
		 showSignalLayers="on" showTopMechLayers="on" showBotMechLayers="on"
		 showTopMechDetails="on" showBotMechDetails="on"
		 showMetalPads="on" showTopMechPads="on" showBotMechPads="on"
		 showNetLines="on" showMountingHoles="on"
		 showComponents="on" showCompTop="on" showCompBot="on" showCompsDes="on" showPinsName="on" showPinsNet="on"
		 showLabelRefDes="on" showLabelPartName="on" showLabelOther="on"
		 showViolations="on" showTrimmed="on" showDRCViolations="on"
		 showKeepouts="on" showRouteKeepouts="on"
		 showSerpentArea="on"/>
		<Grid gridColor="#f2f2f2" gridKind="Dots" saveProportion="on">
			<GridSpace x="5000" y="5000"/>
		</Grid>
		<LayersVisualOptions>
			<LayerOptions>
				<LayerRef name="Board"/>
				<Colors details="#ffffff" pads="#ffffff" fix="#ffffff"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="ASSEMBLY_TOP_ASSY"/>
				<Colors details="#259500" pads="#259500" fix="#165900"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="ASSEMBLY_TOP"/>
				<Colors details="#51271a" pads="#401f14" fix="#51271a"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="SOLDERPASTE_TOP"/>
				<Colors details="#af583a" pads="#8c462e" fix="#af583a"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="SILKSCREEN_TOP"/>
				<Colors details="#50281b" pads="#402015" fix="#50281b"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="SOLDERMASK_TOP"/>
				<Colors details="#b15738" pads="#8d452c" fix="#b15738"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="1"/>
				<Colors details="#a52310" pads="#841c0c" fix="#631509"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="2"/>
				<Colors details="#075f78" pads="#054c60" fix="#043948"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="3"/>
				<Colors details="#ce7946" pads="#a46038" fix="#7b482a"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="4"/>
				<Colors details="#0f7140" pads="#0c5a33" fix="#094326"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="SOLDERMASK_BOTTOM"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="SILKSCREEN_BOTTOM"/>
				<Colors details="#122e1c" pads="#0e2416" fix="#122e1c"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="SOLDERPASTE_BOTTOM"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="ASSEMBLY_BOTTOM"/>
				<Colors details="#122e1b" pads="#0e2415" fix="#122e1b"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="ASSEMBLY_BOTTOM_ASSY"/>
				<Colors details="#00aaaa" pads="#00aaaa" fix="#006666"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="DRILLDRAWING_THRU"/>
				<Colors details="#00aa00" pads="#00aa00" fix="#00aa00"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
		</LayersVisualOptions>
		<ColorNets enabled="on" colorizeWire="on" colorizePad="on" colorizeCopper="on" colorizeVia="on" colorizeNetline="on"/>
		<FilterNetlines enabled="off"/>
	</DisplayControl>

	<DialogSettings version="1.1">
		<DRCSettings logFileName="drc.log" messageLimit="1000"
		 tolerance="0.0025"
		 checkClearances="on"
		 textToCopper="on" textToKeepout="on" textToWire="on" textToVia="on" textToPad="on" textToBoard="on"
		 copperToCopper="on" copperToKeepout="on" copperToWire="on" copperToVia="on" copperToPad="on" copperToBoard="on"
		 wireToKeepout="on" viaToKeepout="on" padToKeepout="on"
		 wireToWire="on" wireToVia="on" wireToPad="on" wireToBoard="on"
		 viaToVia="on" viaToPad="on" viaToBoard="on"
		 padToPad="on" padToBoard="on"/>
		<BOMSettings outFile="" count="on" partName="on" footprint="on" refDes="on"/>
		<MessageFilter
		 W5003="on"
		 W5012="on"
		 W5013="on"
		 W5014="on"
		 W5015="on"
		 W5016="on"
		 W5017="on"
		 W5018="on"
		 W5023="on"
		 W5024="on"
		 W5026="on"
		 W5034="on"
		 W5036="on"
		 W5037="on"/>
	</DialogSettings>
</TopoR_PCB_File>