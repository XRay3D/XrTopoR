<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : arz_2L.fst                     -->
<!--   Format  : TopoR PCB file                 -->
<!--   Version : 1.2.0                          -->
<!--   Program : TopoR 32 Layer 7.0.18313 Alpha -->
<!--   Date    : Monday, April 09, 2018         -->
<!--   Time    : 18:13                          -->
<!--********************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.2.0</Version>
		<Program>TopoR 32 Layer 7.0.18313 Alpha</Program>
		<Date>Monday, April 09, 2018 18:13</Date>
		<OriginalFormat>Specctra</OriginalFormat>
		<OriginalFile>M:\MY\TO_BENCH_2014\TEST\ARZ3\arz3.DSN</OriginalFile>
		<Units dist="mm" time="ps"/>
	</Header>

	<Layers version="1.1">
		<StackUpLayers>
			<Layer name="Paste Top" type="Paste" thickness="0"/>
			<Layer name="Mask Top" type="Mask" thickness="0"/>
			<Layer name="Top_outline" type="Assy" compsOutline="on"/>
			<Layer name="Top" type="Signal" thickness="0"/>
			<Layer name="Bottom" type="Signal" thickness="0"/>
			<Layer name="Bottom_outline" type="Assy" compsOutline="on"/>
			<Layer name="Mask Bottom" type="Mask" thickness="0"/>
			<Layer name="Paste Bottom" type="Paste" thickness="0"/>
		</StackUpLayers>
	</Layers>

	<TextStyles version="1.0">
		<TextStyle name="Default" fontName="default" height="1"/>
	</TextStyles>

	<LocalLibrary version="1.4">
		<Padstacks>
			<Padstack name="via15" holeDiameter="0.8" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="X1.3Y1.3R0.6" holeDiameter="0.8" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="CCTVIA_(Default)" holeDiameter="0.6" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.016">
						<LayerTypeRef type="Signal"/>
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
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="RX3.5Y7.4T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="3.5" height="7.4">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="EX1.8Y1.8R1.1" holeDiameter="1.1" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.8">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.8">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="EX1.5Y1.8R1.1" holeDiameter="0.9" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadOval diameter="1.5">
						<LayerTypeRef type="Signal"/>
						<Stretch x="0" y="-0.3"/>
					</PadOval>
					<PadOval diameter="1.5">
						<LayerTypeRef type="Plane"/>
						<Stretch x="0" y="-0.3"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="krest" holeDiameter="0.5" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="0.8">
						<LayerTypeRef type="Signal"/>
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
						<LayerRef name="Top"/>
						<Stretch x="1.3" y="0"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="RX1.275Y1.85T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.275" height="1.85">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="OX2.5Y0.6T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadOval diameter="0.6">
						<LayerRef name="Top"/>
						<Stretch x="1.9" y="0"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="OX0.8Y2.5T" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadOval diameter="0.8">
						<LayerRef name="Top"/>
						<Stretch x="0" y="-1.7"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="EX1.7Y1.7R1.0" holeDiameter="1" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.7">
						<LayerTypeRef type="Signal"/>
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
						<LayerRef name="Top"/>
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
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="X1.3Y1.3R0.6" holeDiameter="0.8">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.3">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="CCTVIA_(Default)" holeDiameter="0.6">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.016">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="EX1.8Y1.8R1.1" holeDiameter="1.1">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.8">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="EX1.5Y1.8R1.1" holeDiameter="0.9">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.5">
						<LayerTypeRef type="Signal"/>
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
						<LayerRef name="Top_outline"/>
						<Rect>
							<Dot x="-0.725" y="3.425"/>
							<Dot x="8.56" y="-3.425"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="Н1806ХМ1-241_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="10" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="7.75" y="-8.25"/>
					</Pad>
					<Pad padNum="3" name="33" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="7.75" y="9.25"/>
					</Pad>
					<Pad padNum="4" name="37">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="6"/>
					</Pad>
					<Pad padNum="5" name="38">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="5"/>
					</Pad>
					<Pad padNum="6" name="39">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="4"/>
					</Pad>
					<Pad padNum="7" name="40">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="3"/>
					</Pad>
					<Pad padNum="8" name="41">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="2"/>
					</Pad>
					<Pad padNum="9" name="42">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="1"/>
					</Pad>
					<Pad padNum="10" name="2">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-1"/>
					</Pad>
					<Pad padNum="11" name="3">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-2"/>
					</Pad>
					<Pad padNum="12" name="4">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-3"/>
					</Pad>
					<Pad padNum="13" name="5">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-4"/>
					</Pad>
					<Pad padNum="14" name="6">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="15" name="21">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="16" name="11" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="8.75" y="-8.25"/>
					</Pad>
					<Pad padNum="17" name="12" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="9.75" y="-8.25"/>
					</Pad>
					<Pad padNum="18" name="14" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="11.75" y="-8.25"/>
					</Pad>
					<Pad padNum="19" name="13" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="10.75" y="-8.25"/>
					</Pad>
					<Pad padNum="20" name="15" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="12.75" y="-8.25"/>
					</Pad>
					<Pad padNum="21" name="9" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="6.75" y="-8.25"/>
					</Pad>
					<Pad padNum="22" name="8" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="5.75" y="-8.25"/>
					</Pad>
					<Pad padNum="23" name="7" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="4.75" y="-8.25"/>
					</Pad>
					<Pad padNum="24" name="27">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="6"/>
					</Pad>
					<Pad padNum="25" name="26">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="5"/>
					</Pad>
					<Pad padNum="26" name="25">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="4"/>
					</Pad>
					<Pad padNum="27" name="24">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="3"/>
					</Pad>
					<Pad padNum="28" name="22">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="1"/>
					</Pad>
					<Pad padNum="29" name="23">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="2"/>
					</Pad>
					<Pad padNum="30" name="20">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-1"/>
					</Pad>
					<Pad padNum="31" name="19">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-2"/>
					</Pad>
					<Pad padNum="32" name="18">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-3"/>
					</Pad>
					<Pad padNum="33" name="17">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-4"/>
					</Pad>
					<Pad padNum="34" name="16">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-5"/>
					</Pad>
					<Pad padNum="35" name="29" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="11.75" y="9.25"/>
					</Pad>
					<Pad padNum="36" name="32" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="8.75" y="9.25"/>
					</Pad>
					<Pad padNum="37" name="31" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="9.75" y="9.25"/>
					</Pad>
					<Pad padNum="38" name="30" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="10.75" y="9.25"/>
					</Pad>
					<Pad padNum="39" name="28" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="12.75" y="9.25"/>
					</Pad>
					<Pad padNum="40" name="34" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="6.75" y="9.25"/>
					</Pad>
					<Pad padNum="41" name="35" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="5.75" y="9.25"/>
					</Pad>
					<Pad padNum="42" name="36" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="4.75" y="9.25"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="Top_outline"/>
						<Rect>
							<Dot x="-1.1" y="10.35"/>
							<Dot x="18.6" y="-9.35"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="1533ТМ2_Primary">
				<Pads>
					<Pad padNum="1" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-2.5"/>
					</Pad>
					<Pad padNum="2" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="0"/>
					</Pad>
					<Pad padNum="3" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-1.25"/>
					</Pad>
					<Pad padNum="4" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-5"/>
					</Pad>
					<Pad padNum="6" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="9" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="10" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="11" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="12" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="13" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="14" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="Top_outline"/>
						<Rect>
							<Dot x="-0.9" y="1.25"/>
							<Dot x="12.1" y="-8.75"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="556PT5_Primary">
				<Pads>
					<Pad padNum="1" name="24">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="0"/>
					</Pad>
					<Pad padNum="2" name="23">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-1.25"/>
					</Pad>
					<Pad padNum="3" name="22">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-2.5"/>
					</Pad>
					<Pad padNum="4" name="21">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="20">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-5"/>
					</Pad>
					<Pad padNum="6" name="19">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="18">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="17">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-8.75"/>
					</Pad>
					<Pad padNum="9" name="16">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-10"/>
					</Pad>
					<Pad padNum="10" name="15">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-11.25"/>
					</Pad>
					<Pad padNum="11" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-12.5"/>
					</Pad>
					<Pad padNum="12" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.7" y="-13.75"/>
					</Pad>
					<Pad padNum="13" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="14" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="15" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="16" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="17" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="18" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="19" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
					<Pad padNum="20" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-13.75"/>
					</Pad>
					<Pad padNum="21" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-12.5"/>
					</Pad>
					<Pad padNum="22" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-11.25"/>
					</Pad>
					<Pad padNum="23" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-10"/>
					</Pad>
					<Pad padNum="24" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-8.75"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="Top_outline"/>
						<Rect>
							<Dot x="-0.9" y="0.925"/>
							<Dot x="19.65" y="-14.675"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="Б19К-2_Primary">
				<Pads>
					<Pad padNum="1" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="2" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="3" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="4" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="5" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
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
						<LayerRef name="Top_outline"/>
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
					<Pad padNum="2" name="10" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="7.75" y="-8.25"/>
					</Pad>
					<Pad padNum="3" name="33" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="7.75" y="9.25"/>
					</Pad>
					<Pad padNum="4" name="37">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="6"/>
					</Pad>
					<Pad padNum="5" name="38">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="5"/>
					</Pad>
					<Pad padNum="6" name="39">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="4"/>
					</Pad>
					<Pad padNum="7" name="40">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="3"/>
					</Pad>
					<Pad padNum="8" name="41">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="2"/>
					</Pad>
					<Pad padNum="9" name="42">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="1"/>
					</Pad>
					<Pad padNum="10" name="2">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-1"/>
					</Pad>
					<Pad padNum="11" name="3">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-2"/>
					</Pad>
					<Pad padNum="12" name="4">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-3"/>
					</Pad>
					<Pad padNum="13" name="5">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-4"/>
					</Pad>
					<Pad padNum="14" name="6">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="15" name="21">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="16" name="11" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="8.75" y="-8.25"/>
					</Pad>
					<Pad padNum="17" name="12" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="9.75" y="-8.25"/>
					</Pad>
					<Pad padNum="18" name="14" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="11.75" y="-8.25"/>
					</Pad>
					<Pad padNum="19" name="13" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="10.75" y="-8.25"/>
					</Pad>
					<Pad padNum="20" name="15" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="12.75" y="-8.25"/>
					</Pad>
					<Pad padNum="21" name="9" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="6.75" y="-8.25"/>
					</Pad>
					<Pad padNum="22" name="8" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="5.75" y="-8.25"/>
					</Pad>
					<Pad padNum="23" name="7" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="4.75" y="-8.25"/>
					</Pad>
					<Pad padNum="24" name="27">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="6"/>
					</Pad>
					<Pad padNum="25" name="26">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="5"/>
					</Pad>
					<Pad padNum="26" name="25">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="4"/>
					</Pad>
					<Pad padNum="27" name="24">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="3"/>
					</Pad>
					<Pad padNum="28" name="22">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="1"/>
					</Pad>
					<Pad padNum="29" name="23">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="2"/>
					</Pad>
					<Pad padNum="30" name="20">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-1"/>
					</Pad>
					<Pad padNum="31" name="19">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-2"/>
					</Pad>
					<Pad padNum="32" name="18">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-3"/>
					</Pad>
					<Pad padNum="33" name="17">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-4"/>
					</Pad>
					<Pad padNum="34" name="16">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="17.5" y="-5"/>
					</Pad>
					<Pad padNum="35" name="29" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="11.75" y="9.25"/>
					</Pad>
					<Pad padNum="36" name="32" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="8.75" y="9.25"/>
					</Pad>
					<Pad padNum="37" name="31" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="9.75" y="9.25"/>
					</Pad>
					<Pad padNum="38" name="30" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="10.75" y="9.25"/>
					</Pad>
					<Pad padNum="39" name="28" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="12.75" y="9.25"/>
					</Pad>
					<Pad padNum="40" name="34" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="6.75" y="9.25"/>
					</Pad>
					<Pad padNum="41" name="35" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="5.75" y="9.25"/>
					</Pad>
					<Pad padNum="42" name="36" angle="90">
						<PadstackRef name="OX2.5Y0.6T"/>
						<Org x="4.75" y="9.25"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="Top_outline"/>
						<Rect>
							<Dot x="-1.1" y="10.35"/>
							<Dot x="18.6" y="-9.35"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="533ЛЛ1_Primary">
				<Pads>
					<Pad padNum="1" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-2.5"/>
					</Pad>
					<Pad padNum="2" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="0"/>
					</Pad>
					<Pad padNum="3" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-1.25"/>
					</Pad>
					<Pad padNum="4" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-5"/>
					</Pad>
					<Pad padNum="6" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="9" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="10" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="11" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="12" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="13" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="14" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="Top_outline"/>
						<Rect>
							<Dot x="-0.9" y="1.25"/>
							<Dot x="12.1" y="-8.75"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="1533ЛН2_Primary">
				<Pads>
					<Pad padNum="1" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-2.5"/>
					</Pad>
					<Pad padNum="2" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="0"/>
					</Pad>
					<Pad padNum="3" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-1.25"/>
					</Pad>
					<Pad padNum="4" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-5"/>
					</Pad>
					<Pad padNum="6" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="9" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="10" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="11" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="12" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="13" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="14" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="Top_outline"/>
						<Rect>
							<Dot x="-0.9" y="1.25"/>
							<Dot x="12.1" y="-8.75"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="1533АП6_Primary">
				<Pads>
					<Pad padNum="1" name="16">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-5"/>
					</Pad>
					<Pad padNum="2" name="17">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-3.75"/>
					</Pad>
					<Pad padNum="3" name="18">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-2.5"/>
					</Pad>
					<Pad padNum="4" name="19">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-1.25"/>
					</Pad>
					<Pad padNum="5" name="20">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="0"/>
					</Pad>
					<Pad padNum="6" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-11.25"/>
					</Pad>
					<Pad padNum="7" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-10"/>
					</Pad>
					<Pad padNum="8" name="15">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-6.25"/>
					</Pad>
					<Pad padNum="9" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-7.5"/>
					</Pad>
					<Pad padNum="10" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="18.75" y="-8.75"/>
					</Pad>
					<Pad padNum="11" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="12" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="13" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="14" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="15" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="16" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-8.75"/>
					</Pad>
					<Pad padNum="17" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="18" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
					<Pad padNum="19" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-10"/>
					</Pad>
					<Pad padNum="20" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-11.25"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="Top_outline"/>
						<Rect>
							<Dot x="-0.9" y="0.875"/>
							<Dot x="19.65" y="-12.125"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="1533ЛА2_Primary">
				<Pads>
					<Pad padNum="1" name="12">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-2.5"/>
					</Pad>
					<Pad padNum="2" name="14">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="0"/>
					</Pad>
					<Pad padNum="3" name="13">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-1.25"/>
					</Pad>
					<Pad padNum="4" name="11">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-3.75"/>
					</Pad>
					<Pad padNum="5" name="10">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-5"/>
					</Pad>
					<Pad padNum="6" name="9">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-6.25"/>
					</Pad>
					<Pad padNum="7" name="8">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="11.2" y="-7.5"/>
					</Pad>
					<Pad padNum="8" name="3">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-2.5"/>
					</Pad>
					<Pad padNum="9" name="1">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="10" name="2">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-1.25"/>
					</Pad>
					<Pad padNum="11" name="4">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-3.75"/>
					</Pad>
					<Pad padNum="12" name="5">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-5"/>
					</Pad>
					<Pad padNum="13" name="6">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-6.25"/>
					</Pad>
					<Pad padNum="14" name="7">
						<PadstackRef name="OX2.1Y0.8T"/>
						<Org x="0" y="-7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="Top_outline"/>
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
			<Footprint name="0,1М_auto">
				<Pads>
					<Pad padNum="1" name="2">
						<PadstackRef name="RX1.95Y3.5T"/>
						<Org x="4.25" y="0"/>
					</Pad>
					<Pad padNum="2" name="1">
						<PadstackRef name="RX1.95Y3.5T"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="Top_outline"/>
						<Rect>
							<Dot x="0.25" y="1.475"/>
							<Dot x="4" y="-1.475"/>
						</Rect>
					</Detail>
				</Details>
			</Footprint>
			<Footprint name="Р1-12-0,25_auto">
				<Pads>
					<Pad padNum="1" name="2">
						<PadstackRef name="RX1.275Y1.85T"/>
						<Org x="3.075" y="0"/>
					</Pad>
					<Pad padNum="2" name="1">
						<PadstackRef name="RX1.275Y1.85T"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="Top_outline"/>
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
						<LayerRef name="Top_outline"/>
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
						<PadstackRef name="EX1.8Y1.8R1.1"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="PLD-10_2">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="EX1.5Y1.8R1.1"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
		</Footprints>
		<Components>
			<Component name="P77">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P76">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P75">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P79">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P2">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P3">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P4">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P5">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P6">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P7">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P8">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P49">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P9">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P80">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P86">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P87">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P12">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P17">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P16">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P58">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P62">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P63">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P61">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P33">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P38">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P74">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P73">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P72">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P71">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P78">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P48">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P11">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P10">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P15">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P18">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P51">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P50">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P52">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P59">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P66">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P67">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P64">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P65">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P60">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P68">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P69">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K3">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K2">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K6">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K5">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="K4">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="2">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="3">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="4">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="5">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="6">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="7">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="8">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="9">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="11">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="10">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="13">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="12">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="R6">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="R4">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="R5">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C3">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C2">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C1">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C7">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C6">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C5">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C4">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C9">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C8">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C10">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P32">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P31">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P30">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P37">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P36">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P35">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P34">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P39">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P70">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P44">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P45">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P46">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P47">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P40">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P41">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P42">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P43">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P81">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P82">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P85">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P13">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P14">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P19">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P55">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P54">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P57">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P56">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P53">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P22">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P23">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P20">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P21">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P26">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P27">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P24">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P25">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P28">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="P29">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D4">
				<Pins>
					<Pin pinNum="1" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D5">
				<Pins>
					<Pin pinNum="1" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D6">
				<Pins>
					<Pin pinNum="1" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D19">
				<Pins>
					<Pin pinNum="1" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D18">
				<Pins>
					<Pin pinNum="1" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D10">
				<Pins>
					<Pin pinNum="1" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D9">
				<Pins>
					<Pin pinNum="1" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D15">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="33" pinSymName="33" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="37" pinSymName="37" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="38" pinSymName="38" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="39" pinSymName="39" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="40" pinSymName="40" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="41" pinSymName="41" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="42" pinSymName="42" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="27" pinSymName="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="26" pinSymName="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="25" pinSymName="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="29" pinSymName="29" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="32" pinSymName="32" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="31" pinSymName="31" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="30" pinSymName="30" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="28" pinSymName="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="34" pinSymName="34" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="35" pinSymName="35" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="36" pinSymName="36" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D14">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="33" pinSymName="33" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="37" pinSymName="37" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="38" pinSymName="38" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="39" pinSymName="39" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="40" pinSymName="40" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="41" pinSymName="41" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="42" pinSymName="42" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="27" pinSymName="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="26" pinSymName="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="25" pinSymName="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="29" pinSymName="29" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="32" pinSymName="32" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="31" pinSymName="31" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="30" pinSymName="30" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="28" pinSymName="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="34" pinSymName="34" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="35" pinSymName="35" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="36" pinSymName="36" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D17">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="33" pinSymName="33" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="37" pinSymName="37" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="38" pinSymName="38" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="39" pinSymName="39" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="40" pinSymName="40" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="41" pinSymName="41" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="42" pinSymName="42" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="27" pinSymName="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="26" pinSymName="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="25" pinSymName="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="29" pinSymName="29" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="32" pinSymName="32" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="31" pinSymName="31" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="30" pinSymName="30" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="28" pinSymName="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="34" pinSymName="34" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="35" pinSymName="35" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="36" pinSymName="36" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D16">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="33" pinSymName="33" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="37" pinSymName="37" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="38" pinSymName="38" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="39" pinSymName="39" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="40" pinSymName="40" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="41" pinSymName="41" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="42" pinSymName="42" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="27" pinSymName="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="26" pinSymName="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="25" pinSymName="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="29" pinSymName="29" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="32" pinSymName="32" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="31" pinSymName="31" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="30" pinSymName="30" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="28" pinSymName="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="34" pinSymName="34" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="35" pinSymName="35" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="36" pinSymName="36" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D11">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="33" pinSymName="33" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="37" pinSymName="37" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="38" pinSymName="38" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="39" pinSymName="39" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="40" pinSymName="40" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="41" pinSymName="41" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="42" pinSymName="42" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="27" pinSymName="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="26" pinSymName="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="25" pinSymName="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="29" pinSymName="29" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="32" pinSymName="32" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="31" pinSymName="31" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="30" pinSymName="30" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="28" pinSymName="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="34" pinSymName="34" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="35" pinSymName="35" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="36" pinSymName="36" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D13">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="33" pinSymName="33" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="37" pinSymName="37" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="38" pinSymName="38" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="39" pinSymName="39" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="40" pinSymName="40" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="41" pinSymName="41" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="42" pinSymName="42" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="27" pinSymName="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="26" pinSymName="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="25" pinSymName="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="29" pinSymName="29" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="32" pinSymName="32" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="31" pinSymName="31" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="30" pinSymName="30" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="28" pinSymName="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="34" pinSymName="34" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="35" pinSymName="35" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="36" pinSymName="36" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D12">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="33" pinSymName="33" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="37" pinSymName="37" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="38" pinSymName="38" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="39" pinSymName="39" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="40" pinSymName="40" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="41" pinSymName="41" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="42" pinSymName="42" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="27" pinSymName="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="26" pinSymName="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="25" pinSymName="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="29" pinSymName="29" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="32" pinSymName="32" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="31" pinSymName="31" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="30" pinSymName="30" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="28" pinSymName="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="34" pinSymName="34" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="35" pinSymName="35" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="36" pinSymName="36" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="DR2">
				<Pins>
					<Pin pinNum="1" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="DR3">
				<Pins>
					<Pin pinNum="1" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="DR1">
				<Pins>
					<Pin pinNum="1" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D1">
				<Pins>
					<Pin pinNum="1" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D2">
				<Pins>
					<Pin pinNum="1" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D3">
				<Pins>
					<Pin pinNum="1" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D7">
				<Pins>
					<Pin pinNum="1" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D8">
				<Pins>
					<Pin pinNum="1" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="D20">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="33" pinSymName="33" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="37" pinSymName="37" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="38" pinSymName="38" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="39" pinSymName="39" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="40" pinSymName="40" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="41" pinSymName="41" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="42" pinSymName="42" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="21" pinSymName="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="27" pinSymName="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="26" pinSymName="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="25" pinSymName="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="24" pinSymName="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="22" pinSymName="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="23" pinSymName="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="20" pinSymName="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="19" pinSymName="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="18" pinSymName="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="17" pinSymName="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="29" pinSymName="29" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="32" pinSymName="32" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="31" pinSymName="31" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="30" pinSymName="30" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="28" pinSymName="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="34" pinSymName="34" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="35" pinSymName="35" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="36" pinSymName="36" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="C12">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="P77"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P76"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P75"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P79"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P1"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P2"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P3"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P4"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P5"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P6"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P7"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P8"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P49"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P9"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P80"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P86"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P87"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P12"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P17"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P16"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P58"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P62"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P63"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P61"/>
				<FootprintRef name="PLD-10_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P33"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P38"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P74"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P73"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P72"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P71"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P78"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P48"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P11"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P10"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P15"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P18"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P51"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P50"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P52"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P59"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P66"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P67"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P64"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P65"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P60"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P68"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P69"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K3"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K2"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K6"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K5"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="K4"/>
				<FootprintRef name="KREST1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="1"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="2"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="3"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="4"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="5"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="6"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="7"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="8"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="9"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="11"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="10"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="13"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="12"/>
				<FootprintRef name="PL25_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="R6"/>
				<FootprintRef name="Р1-12-0,25_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R4"/>
				<FootprintRef name="Р1-12-0,25_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R5"/>
				<FootprintRef name="Р1-12-0,25_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C3"/>
				<FootprintRef name="0,1М_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C2"/>
				<FootprintRef name="0,1М_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C1"/>
				<FootprintRef name="0,1М_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C7"/>
				<FootprintRef name="0,1М_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C6"/>
				<FootprintRef name="0,1М_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C5"/>
				<FootprintRef name="0,1М_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C4"/>
				<FootprintRef name="0,1М_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C9"/>
				<FootprintRef name="0,1М_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C8"/>
				<FootprintRef name="0,1М_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C10"/>
				<FootprintRef name="0,1М_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="P32"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P31"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P30"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P37"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P36"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P35"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P34"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P39"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P70"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P44"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P45"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P46"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P47"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P40"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P41"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P42"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P43"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P81"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P82"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P85"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P13"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P14"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P19"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P55"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P54"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P57"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P56"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P53"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P22"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P23"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P20"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P21"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P26"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P27"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P24"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P25"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P28"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="P29"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="D4"/>
				<FootprintRef name="1533ЛА2_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D5"/>
				<FootprintRef name="1533ЛА2_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D6"/>
				<FootprintRef name="1533ЛА2_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D19"/>
				<FootprintRef name="1533АП6_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
				<Pinpack pinNum="19" padNum="19"/>
				<Pinpack pinNum="20" padNum="20"/>
			</Package>
			<Package>
				<ComponentRef name="D18"/>
				<FootprintRef name="1533АП6_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
				<Pinpack pinNum="19" padNum="19"/>
				<Pinpack pinNum="20" padNum="20"/>
			</Package>
			<Package>
				<ComponentRef name="D10"/>
				<FootprintRef name="1533ЛН2_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D9"/>
				<FootprintRef name="533ЛЛ1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D15"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<Pinpack pinNum="25" padNum="25"/>
				<Pinpack pinNum="26" padNum="26"/>
				<Pinpack pinNum="27" padNum="27"/>
				<Pinpack pinNum="28" padNum="28"/>
				<Pinpack pinNum="29" padNum="29"/>
				<Pinpack pinNum="30" padNum="30"/>
				<Pinpack pinNum="31" padNum="31"/>
				<Pinpack pinNum="32" padNum="32"/>
				<Pinpack pinNum="33" padNum="33"/>
				<Pinpack pinNum="34" padNum="34"/>
				<Pinpack pinNum="35" padNum="35"/>
				<Pinpack pinNum="36" padNum="36"/>
				<Pinpack pinNum="37" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="39" padNum="39"/>
				<Pinpack pinNum="40" padNum="40"/>
				<Pinpack pinNum="41" padNum="41"/>
				<Pinpack pinNum="42" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D14"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<Pinpack pinNum="25" padNum="25"/>
				<Pinpack pinNum="26" padNum="26"/>
				<Pinpack pinNum="27" padNum="27"/>
				<Pinpack pinNum="28" padNum="28"/>
				<Pinpack pinNum="29" padNum="29"/>
				<Pinpack pinNum="30" padNum="30"/>
				<Pinpack pinNum="31" padNum="31"/>
				<Pinpack pinNum="32" padNum="32"/>
				<Pinpack pinNum="33" padNum="33"/>
				<Pinpack pinNum="34" padNum="34"/>
				<Pinpack pinNum="35" padNum="35"/>
				<Pinpack pinNum="36" padNum="36"/>
				<Pinpack pinNum="37" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="39" padNum="39"/>
				<Pinpack pinNum="40" padNum="40"/>
				<Pinpack pinNum="41" padNum="41"/>
				<Pinpack pinNum="42" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D17"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<Pinpack pinNum="25" padNum="25"/>
				<Pinpack pinNum="26" padNum="26"/>
				<Pinpack pinNum="27" padNum="27"/>
				<Pinpack pinNum="28" padNum="28"/>
				<Pinpack pinNum="29" padNum="29"/>
				<Pinpack pinNum="30" padNum="30"/>
				<Pinpack pinNum="31" padNum="31"/>
				<Pinpack pinNum="32" padNum="32"/>
				<Pinpack pinNum="33" padNum="33"/>
				<Pinpack pinNum="34" padNum="34"/>
				<Pinpack pinNum="35" padNum="35"/>
				<Pinpack pinNum="36" padNum="36"/>
				<Pinpack pinNum="37" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="39" padNum="39"/>
				<Pinpack pinNum="40" padNum="40"/>
				<Pinpack pinNum="41" padNum="41"/>
				<Pinpack pinNum="42" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D16"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<Pinpack pinNum="25" padNum="25"/>
				<Pinpack pinNum="26" padNum="26"/>
				<Pinpack pinNum="27" padNum="27"/>
				<Pinpack pinNum="28" padNum="28"/>
				<Pinpack pinNum="29" padNum="29"/>
				<Pinpack pinNum="30" padNum="30"/>
				<Pinpack pinNum="31" padNum="31"/>
				<Pinpack pinNum="32" padNum="32"/>
				<Pinpack pinNum="33" padNum="33"/>
				<Pinpack pinNum="34" padNum="34"/>
				<Pinpack pinNum="35" padNum="35"/>
				<Pinpack pinNum="36" padNum="36"/>
				<Pinpack pinNum="37" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="39" padNum="39"/>
				<Pinpack pinNum="40" padNum="40"/>
				<Pinpack pinNum="41" padNum="41"/>
				<Pinpack pinNum="42" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D11"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<Pinpack pinNum="25" padNum="25"/>
				<Pinpack pinNum="26" padNum="26"/>
				<Pinpack pinNum="27" padNum="27"/>
				<Pinpack pinNum="28" padNum="28"/>
				<Pinpack pinNum="29" padNum="29"/>
				<Pinpack pinNum="30" padNum="30"/>
				<Pinpack pinNum="31" padNum="31"/>
				<Pinpack pinNum="32" padNum="32"/>
				<Pinpack pinNum="33" padNum="33"/>
				<Pinpack pinNum="34" padNum="34"/>
				<Pinpack pinNum="35" padNum="35"/>
				<Pinpack pinNum="36" padNum="36"/>
				<Pinpack pinNum="37" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="39" padNum="39"/>
				<Pinpack pinNum="40" padNum="40"/>
				<Pinpack pinNum="41" padNum="41"/>
				<Pinpack pinNum="42" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D13"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<Pinpack pinNum="25" padNum="25"/>
				<Pinpack pinNum="26" padNum="26"/>
				<Pinpack pinNum="27" padNum="27"/>
				<Pinpack pinNum="28" padNum="28"/>
				<Pinpack pinNum="29" padNum="29"/>
				<Pinpack pinNum="30" padNum="30"/>
				<Pinpack pinNum="31" padNum="31"/>
				<Pinpack pinNum="32" padNum="32"/>
				<Pinpack pinNum="33" padNum="33"/>
				<Pinpack pinNum="34" padNum="34"/>
				<Pinpack pinNum="35" padNum="35"/>
				<Pinpack pinNum="36" padNum="36"/>
				<Pinpack pinNum="37" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="39" padNum="39"/>
				<Pinpack pinNum="40" padNum="40"/>
				<Pinpack pinNum="41" padNum="41"/>
				<Pinpack pinNum="42" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="D12"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<Pinpack pinNum="25" padNum="25"/>
				<Pinpack pinNum="26" padNum="26"/>
				<Pinpack pinNum="27" padNum="27"/>
				<Pinpack pinNum="28" padNum="28"/>
				<Pinpack pinNum="29" padNum="29"/>
				<Pinpack pinNum="30" padNum="30"/>
				<Pinpack pinNum="31" padNum="31"/>
				<Pinpack pinNum="32" padNum="32"/>
				<Pinpack pinNum="33" padNum="33"/>
				<Pinpack pinNum="34" padNum="34"/>
				<Pinpack pinNum="35" padNum="35"/>
				<Pinpack pinNum="36" padNum="36"/>
				<Pinpack pinNum="37" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="39" padNum="39"/>
				<Pinpack pinNum="40" padNum="40"/>
				<Pinpack pinNum="41" padNum="41"/>
				<Pinpack pinNum="42" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="DR2"/>
				<FootprintRef name="Б19К-2_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
			</Package>
			<Package>
				<ComponentRef name="DR3"/>
				<FootprintRef name="Б19К-2_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
			</Package>
			<Package>
				<ComponentRef name="DR1"/>
				<FootprintRef name="Б19К-2_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
			</Package>
			<Package>
				<ComponentRef name="D1"/>
				<FootprintRef name="556PT5_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<ComponentRef name="D2"/>
				<FootprintRef name="556PT5_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<ComponentRef name="D3"/>
				<FootprintRef name="556PT5_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<ComponentRef name="D7"/>
				<FootprintRef name="1533ТМ2_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D8"/>
				<FootprintRef name="1533ТМ2_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="D20"/>
				<FootprintRef name="Н1806ХМ1-241_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
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
				<Pinpack pinNum="25" padNum="25"/>
				<Pinpack pinNum="26" padNum="26"/>
				<Pinpack pinNum="27" padNum="27"/>
				<Pinpack pinNum="28" padNum="28"/>
				<Pinpack pinNum="29" padNum="29"/>
				<Pinpack pinNum="30" padNum="30"/>
				<Pinpack pinNum="31" padNum="31"/>
				<Pinpack pinNum="32" padNum="32"/>
				<Pinpack pinNum="33" padNum="33"/>
				<Pinpack pinNum="34" padNum="34"/>
				<Pinpack pinNum="35" padNum="35"/>
				<Pinpack pinNum="36" padNum="36"/>
				<Pinpack pinNum="37" padNum="37"/>
				<Pinpack pinNum="38" padNum="38"/>
				<Pinpack pinNum="39" padNum="39"/>
				<Pinpack pinNum="40" padNum="40"/>
				<Pinpack pinNum="41" padNum="41"/>
				<Pinpack pinNum="42" padNum="42"/>
			</Package>
			<Package>
				<ComponentRef name="C12"/>
				<FootprintRef name="16-4.7_auto"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
		</Packages>
	</LocalLibrary>

	<Constructive version="1.2">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.1">
					<Polyline>
						<Start x="-0.1" y="112.1"/>
						<SegmentLine>
							<End x="102.1" y="112.1"/>
						</SegmentLine>
						<SegmentLine>
							<End x="102.1" y="-0.1"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-0.1" y="-0.1"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-0.1" y="112.1"/>
						</SegmentLine>
					</Polyline>
				</Shape>
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
			<CompInstance name="C12" uniqueId="SGEEUNUB" side="Bottom" angle="270">
				<ComponentRef name="C12"/>
				<FootprintRef name="16-4.7_auto"/>
				<Org x="91.75" y="27"/>
			</CompInstance>
			<CompInstance name="D20" uniqueId="CXPOKWES" side="Bottom" angle="270">
				<ComponentRef name="D20"/>
				<FootprintRef name="Н1806ХМ1-241_Primary"/>
				<Org x="37.75" y="81.75"/>
			</CompInstance>
			<CompInstance name="D8" uniqueId="HTHMUFPK" side="Top">
				<ComponentRef name="D8"/>
				<FootprintRef name="1533ТМ2_Primary"/>
				<Org x="81" y="94"/>
			</CompInstance>
			<CompInstance name="D7" uniqueId="JEMCVQIB" side="Bottom">
				<ComponentRef name="D7"/>
				<FootprintRef name="1533ТМ2_Primary"/>
				<Org x="92.2" y="94"/>
			</CompInstance>
			<CompInstance name="D3" uniqueId="RBUXEKPU" side="Top" angle="90">
				<ComponentRef name="D3"/>
				<FootprintRef name="556PT5_Primary"/>
				<Org x="26" y="29"/>
			</CompInstance>
			<CompInstance name="D2" uniqueId="YXFBKDRL" side="Top" angle="90">
				<ComponentRef name="D2"/>
				<FootprintRef name="556PT5_Primary"/>
				<Org x="44.75" y="29"/>
			</CompInstance>
			<CompInstance name="D1" uniqueId="SPUXXFUO" side="Top" angle="90">
				<ComponentRef name="D1"/>
				<FootprintRef name="556PT5_Primary"/>
				<Org x="77.75" y="29"/>
			</CompInstance>
			<CompInstance name="DR1" uniqueId="EXXNAEFI" side="Bottom" angle="90">
				<ComponentRef name="DR1"/>
				<FootprintRef name="Б19К-2_Primary"/>
				<Org x="76" y="36.5"/>
			</CompInstance>
			<CompInstance name="DR3" uniqueId="SRYXXCWX" side="Bottom" angle="90">
				<ComponentRef name="DR3"/>
				<FootprintRef name="Б19К-2_Primary"/>
				<Org x="30" y="36.5"/>
			</CompInstance>
			<CompInstance name="DR2" uniqueId="ZEBKUHHT" side="Bottom" angle="90">
				<ComponentRef name="DR2"/>
				<FootprintRef name="Б19К-2_Primary"/>
				<Org x="49" y="36.5"/>
			</CompInstance>
			<CompInstance name="D12" uniqueId="ZNEPVVZL" side="Bottom" angle="90">
				<ComponentRef name="D12"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="81.25" y="74"/>
			</CompInstance>
			<CompInstance name="D13" uniqueId="IGDIQVBV" side="Top" angle="90">
				<ComponentRef name="D13"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="81.25" y="56.5"/>
			</CompInstance>
			<CompInstance name="D11" uniqueId="UTTULUKT" side="Top" angle="90">
				<ComponentRef name="D11"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="22.25" y="56.5"/>
			</CompInstance>
			<CompInstance name="D16" uniqueId="HHVHMNJA" side="Bottom">
				<ComponentRef name="D16"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="71" y="90"/>
			</CompInstance>
			<CompInstance name="D17" uniqueId="XFSHAUIC" side="Bottom" angle="90">
				<ComponentRef name="D17"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="22.25" y="74"/>
			</CompInstance>
			<CompInstance name="D14" uniqueId="IQRNELHC" side="Bottom" angle="90">
				<ComponentRef name="D14"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="51.25" y="74"/>
			</CompInstance>
			<CompInstance name="D15" uniqueId="TRNVGNHG" side="Top" angle="90">
				<ComponentRef name="D15"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="51.25" y="56.5"/>
			</CompInstance>
			<CompInstance name="D9" uniqueId="XEMWNBWG" side="Top" angle="270">
				<ComponentRef name="D9"/>
				<FootprintRef name="533ЛЛ1_Primary"/>
				<Org x="18.75" y="45.75"/>
			</CompInstance>
			<CompInstance name="D10" uniqueId="HELXUCJA" side="Top" angle="90">
				<ComponentRef name="D10"/>
				<FootprintRef name="1533ЛН2_Primary"/>
				<Org x="11.25" y="83.25"/>
			</CompInstance>
			<CompInstance name="D18" uniqueId="LTRFSXQF" side="Bottom" angle="270">
				<ComponentRef name="D18"/>
				<FootprintRef name="1533АП6_Primary"/>
				<Org x="26.25" y="28.25"/>
			</CompInstance>
			<CompInstance name="D19" uniqueId="WJXRIESF" side="Top" angle="90">
				<ComponentRef name="D19"/>
				<FootprintRef name="1533АП6_Primary"/>
				<Org x="62.75" y="29"/>
			</CompInstance>
			<CompInstance name="D6" uniqueId="KXSNMNTM" side="Bottom" angle="180">
				<ComponentRef name="D6"/>
				<FootprintRef name="1533ЛА2_Primary"/>
				<Org x="29.75" y="41"/>
			</CompInstance>
			<CompInstance name="D5" uniqueId="VQNEZNDQ" side="Bottom" angle="180">
				<ComponentRef name="D5"/>
				<FootprintRef name="1533ЛА2_Primary"/>
				<Org x="49" y="41"/>
			</CompInstance>
			<CompInstance name="D4" uniqueId="RMRLZZCY" side="Bottom">
				<ComponentRef name="D4"/>
				<FootprintRef name="1533ЛА2_Primary"/>
				<Org x="86" y="48.5"/>
			</CompInstance>
			<CompInstance name="P29" uniqueId="PSVCLQEU" side="Top" angle="90" fixed="on">
				<ComponentRef name="P29"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="45.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P28" uniqueId="IPWHBZZS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P28"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="46.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P25" uniqueId="BKWMAXVD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P25"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="44" y="93.75"/>
			</CompInstance>
			<CompInstance name="P24" uniqueId="GIEDZBFV" side="Top" angle="90" fixed="on">
				<ComponentRef name="P24"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="35.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P27" uniqueId="BEXGZBZZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P27"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="49" y="93.75"/>
			</CompInstance>
			<CompInstance name="P26" uniqueId="FILADJMD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P26"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="50.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P21" uniqueId="SBZZAREP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P21"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="27.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P20" uniqueId="FPWSRGUQ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P20"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="37.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P23" uniqueId="XVVQNFMD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P23"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="32.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P22" uniqueId="PEYJDBRT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P22"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="29" y="93.75"/>
			</CompInstance>
			<CompInstance name="P53" uniqueId="MIBZUYVI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P53"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="55.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P56" uniqueId="EZFJFKAN" side="Top" angle="90" fixed="on">
				<ComponentRef name="P56"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="52.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P57" uniqueId="XIBRHHQP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P57"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="54" y="93.75"/>
			</CompInstance>
			<CompInstance name="P54" uniqueId="KDFGIIWP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P54"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="61.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P55" uniqueId="OKQVDKNU" side="Top" angle="90" fixed="on">
				<ComponentRef name="P55"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="31.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P19" uniqueId="UUNNLCDR" side="Top" angle="90" fixed="on">
				<ComponentRef name="P19"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="41.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P14" uniqueId="WCGWJBIZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P14"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="40.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P13" uniqueId="XYHNWPHS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P13"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="39" y="93.75"/>
			</CompInstance>
			<CompInstance name="P85" uniqueId="MYPPDFER" side="Top" angle="90" fixed="on">
				<ComponentRef name="P85"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="64" y="93.75"/>
			</CompInstance>
			<CompInstance name="P82" uniqueId="NMGOCKEK" side="Top" angle="90" fixed="on">
				<ComponentRef name="P82"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="62.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P81" uniqueId="RQQJUAFB" side="Top" angle="90" fixed="on">
				<ComponentRef name="P81"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="57.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P43" uniqueId="RKAEGFGG" side="Top" angle="90" fixed="on">
				<ComponentRef name="P43"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="59" y="93.75"/>
			</CompInstance>
			<CompInstance name="P42" uniqueId="PSPTBVHZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P42"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="69" y="93.75"/>
			</CompInstance>
			<CompInstance name="P41" uniqueId="GTOGOBUB" side="Top" angle="90" fixed="on">
				<ComponentRef name="P41"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="36.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P40" uniqueId="ACBRUVPX" side="Top" angle="90" fixed="on">
				<ComponentRef name="P40"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="66.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P47" uniqueId="LOKSBJQZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P47"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="34" y="93.75"/>
			</CompInstance>
			<CompInstance name="P46" uniqueId="XVHRWQFY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P46"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="67.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P45" uniqueId="KICOXEWH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P45"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="65.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P44" uniqueId="LKPMKFFR" side="Top" angle="90" fixed="on">
				<ComponentRef name="P44"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="30.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P70" uniqueId="FXVCQZVP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P70"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="56.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P39" uniqueId="OSOLINNM" side="Top" angle="90" fixed="on">
				<ComponentRef name="P39"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="70.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P34" uniqueId="RHANOJZW" side="Top" angle="90" fixed="on">
				<ComponentRef name="P34"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="71.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P35" uniqueId="ERASGAQD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P35"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="60.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P36" uniqueId="DWCTBLMT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P36"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="74" y="93.75"/>
			</CompInstance>
			<CompInstance name="P37" uniqueId="GFPHHXWA" side="Top" angle="90" fixed="on">
				<ComponentRef name="P37"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="72.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P30" uniqueId="SNHMULKX" side="Top" angle="90" fixed="on">
				<ComponentRef name="P30"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="42.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P31" uniqueId="OOWESEKF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P31"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="47.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P32" uniqueId="MYNSVMVJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P32"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="51.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="C10" uniqueId="ZJKSQDOH" side="Bottom" angle="90">
				<ComponentRef name="C10"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="92.5" y="75.75"/>
			</CompInstance>
			<CompInstance name="C8" uniqueId="QNNSSRCZ" side="Bottom">
				<ComponentRef name="C8"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="94.375" y="37.875"/>
			</CompInstance>
			<CompInstance name="C9" uniqueId="OWLZTDBD" side="Top">
				<ComponentRef name="C9"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="71.875" y="89.5"/>
			</CompInstance>
			<CompInstance name="C4" uniqueId="XYXFFVJE" side="Bottom" angle="270">
				<ComponentRef name="C4"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="68.25" y="36.25"/>
			</CompInstance>
			<CompInstance name="C5" uniqueId="TYFRHALG" side="Bottom" angle="180">
				<ComponentRef name="C5"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="7.75" y="53"/>
			</CompInstance>
			<CompInstance name="C6" uniqueId="VAZHGOVV" side="Bottom" angle="90">
				<ComponentRef name="C6"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="45" y="44.375"/>
			</CompInstance>
			<CompInstance name="C7" uniqueId="FSMKOMWY" side="Bottom" angle="90">
				<ComponentRef name="C7"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="36.25" y="67.25"/>
			</CompInstance>
			<CompInstance name="C1" uniqueId="ZJRMQVDX" side="Bottom">
				<ComponentRef name="C1"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="23.5" y="94.75"/>
			</CompInstance>
			<CompInstance name="C2" uniqueId="MBQMJQRL" side="Top">
				<ComponentRef name="C2"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="10.25" y="31"/>
			</CompInstance>
			<CompInstance name="C3" uniqueId="RJWQMRIW" side="Bottom" angle="90">
				<ComponentRef name="C3"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="66.25" y="67.25"/>
			</CompInstance>
			<CompInstance name="R5" uniqueId="ILLCGTIK" side="Bottom" angle="270">
				<ComponentRef name="R5"/>
				<FootprintRef name="Р1-12-0,25_auto"/>
				<Org x="63.25" y="37.5"/>
			</CompInstance>
			<CompInstance name="R4" uniqueId="EGZWKKZG" side="Top" angle="90">
				<ComponentRef name="R4"/>
				<FootprintRef name="Р1-12-0,25_auto"/>
				<Org x="35.5" y="86.5"/>
			</CompInstance>
			<CompInstance name="R6" uniqueId="CICHMRIY" side="Top" angle="90">
				<ComponentRef name="R6"/>
				<FootprintRef name="Р1-12-0,25_auto"/>
				<Org x="38" y="86.5"/>
			</CompInstance>
			<CompInstance name="12" uniqueId="NOYCEVDV" side="Top" angle="180">
				<ComponentRef name="12"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="58.5" y="51"/>
			</CompInstance>
			<CompInstance name="13" uniqueId="RDBBZWAC" side="Top" angle="180">
				<ComponentRef name="13"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="79" y="51.25"/>
			</CompInstance>
			<CompInstance name="10" uniqueId="FHANGEUG" side="Top" angle="180">
				<ComponentRef name="10"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="80.875" y="51.25"/>
			</CompInstance>
			<CompInstance name="11" uniqueId="ORWNFPBI" side="Top" angle="270">
				<ComponentRef name="11"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="21.625" y="38.75"/>
			</CompInstance>
			<CompInstance name="9" uniqueId="HEMMGUWI" side="Top" angle="180">
				<ComponentRef name="9"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="82.75" y="51.25"/>
			</CompInstance>
			<CompInstance name="8" uniqueId="BMBWDOCP" side="Top">
				<ComponentRef name="8"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="85.25" y="50.125"/>
			</CompInstance>
			<CompInstance name="7" uniqueId="ZHSJOAZE" side="Top" angle="180">
				<ComponentRef name="7"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="54.875" y="53.5"/>
			</CompInstance>
			<CompInstance name="6" uniqueId="CFZNHNVP" side="Top" angle="270">
				<ComponentRef name="6"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="48.75" y="50.375"/>
			</CompInstance>
			<CompInstance name="5" uniqueId="LCHCQRPI" side="Top" angle="270">
				<ComponentRef name="5"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="46.25" y="50.375"/>
			</CompInstance>
			<CompInstance name="4" uniqueId="BGPOQBDM" side="Top" angle="270">
				<ComponentRef name="4"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="43.75" y="50.375"/>
			</CompInstance>
			<CompInstance name="3" uniqueId="JBTKBFBI" side="Top" angle="90">
				<ComponentRef name="3"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="35.5" y="50.25"/>
			</CompInstance>
			<CompInstance name="2" uniqueId="PTXJHIZC" side="Top" angle="90">
				<ComponentRef name="2"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="36.25" y="52.125"/>
			</CompInstance>
			<CompInstance name="1" uniqueId="ESQZAAIR" side="Top" angle="270">
				<ComponentRef name="1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="35" y="53.375"/>
			</CompInstance>
			<CompInstance name="K4" uniqueId="VPJZEIMU" side="Top" fixed="on">
				<ComponentRef name="K4"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="28.5" y="102"/>
			</CompInstance>
			<CompInstance name="K5" uniqueId="XOTZJGZZ" side="Top" fixed="on">
				<ComponentRef name="K5"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="73.5" y="102"/>
			</CompInstance>
			<CompInstance name="K6" uniqueId="NQGRJMLW" side="Top" fixed="on">
				<ComponentRef name="K6"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="10.5" y="15.25"/>
			</CompInstance>
			<CompInstance name="K1" uniqueId="QRPNNHHU" side="Top" fixed="on">
				<ComponentRef name="K1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="90.5" y="15.25"/>
			</CompInstance>
			<CompInstance name="K2" uniqueId="ASRGZPJV" side="Top" fixed="on">
				<ComponentRef name="K2"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="14.3" y="101"/>
			</CompInstance>
			<CompInstance name="K3" uniqueId="EKVQLGSB" side="Top" fixed="on">
				<ComponentRef name="K3"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="88" y="101"/>
			</CompInstance>
			<CompInstance name="P69" uniqueId="AZWJBBPT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P69"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="67.68" y="17.84"/>
			</CompInstance>
			<CompInstance name="P68" uniqueId="ANAEYBSC" side="Top" angle="90" fixed="on">
				<ComponentRef name="P68"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="65.14" y="17.84"/>
			</CompInstance>
			<CompInstance name="P60" uniqueId="SXOSVWDF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P60"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="24.5" y="20.48"/>
			</CompInstance>
			<CompInstance name="P65" uniqueId="VLVLLOEA" side="Top" angle="90" fixed="on">
				<ComponentRef name="P65"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="72.76" y="17.84"/>
			</CompInstance>
			<CompInstance name="P64" uniqueId="KVWQBJJN" side="Top" angle="90" fixed="on">
				<ComponentRef name="P64"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="77.84" y="17.84"/>
			</CompInstance>
			<CompInstance name="P67" uniqueId="XGOSLPQZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P67"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="60.06" y="17.84"/>
			</CompInstance>
			<CompInstance name="P66" uniqueId="NWVZBQIL" side="Top" angle="90" fixed="on">
				<ComponentRef name="P66"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="75.3" y="17.84"/>
			</CompInstance>
			<CompInstance name="P59" uniqueId="MLVPHTEV" side="Top" angle="90" fixed="on">
				<ComponentRef name="P59"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="27.04" y="20.48"/>
			</CompInstance>
			<CompInstance name="P52" uniqueId="OGAYGYKF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P52"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="72.76" y="15.3"/>
			</CompInstance>
			<CompInstance name="P50" uniqueId="PFGEIZZE" side="Top" angle="90" fixed="on">
				<ComponentRef name="P50"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="70.22" y="17.84"/>
			</CompInstance>
			<CompInstance name="P51" uniqueId="ZTFIRFOI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P51"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="62.6" y="17.84"/>
			</CompInstance>
			<CompInstance name="P18" uniqueId="MWVYRAHD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P18"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="44.82" y="23.02"/>
			</CompInstance>
			<CompInstance name="P15" uniqueId="YHPOUAQY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P15"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="90.54" y="20.48"/>
			</CompInstance>
			<CompInstance name="P10" uniqueId="HLZXJLSO" side="Top" angle="90" fixed="on">
				<ComponentRef name="P10"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="37.2" y="20.48"/>
			</CompInstance>
			<CompInstance name="P11" uniqueId="HMHTPNTP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P11"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="42.28" y="23.02"/>
			</CompInstance>
			<CompInstance name="P48" uniqueId="DSBRUMTC" side="Top" angle="90" fixed="on">
				<ComponentRef name="P48"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="29.58" y="20.48"/>
			</CompInstance>
			<CompInstance name="P78" uniqueId="FAMDGQLS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P78"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="34.66" y="23.02"/>
			</CompInstance>
			<CompInstance name="P71" uniqueId="QYEZJARB" side="Top" angle="90" fixed="on">
				<ComponentRef name="P71"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="77.84" y="15.3"/>
			</CompInstance>
			<CompInstance name="P72" uniqueId="TLVSDNAS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P72"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="80.38" y="15.3"/>
			</CompInstance>
			<CompInstance name="P73" uniqueId="PGLRVHZI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P73"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="32.12" y="17.84"/>
			</CompInstance>
			<CompInstance name="P74" uniqueId="SKCSKVTQ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P74"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="80.38" y="17.84"/>
			</CompInstance>
			<CompInstance name="P38" uniqueId="IOZHTZAY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P38"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="32.12" y="15.3"/>
			</CompInstance>
			<CompInstance name="P33" uniqueId="BSLQLFAJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P33"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="37.2" y="15.3"/>
			</CompInstance>
			<CompInstance name="P61" uniqueId="QOROFPBS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P61"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="19.42" y="20.48"/>
			</CompInstance>
			<CompInstance name="P63" uniqueId="CRDSBHID" side="Top" angle="90" fixed="on">
				<ComponentRef name="P63"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="14.34" y="20.48"/>
			</CompInstance>
			<CompInstance name="P62" uniqueId="YPQVBVCX" side="Top" angle="90" fixed="on">
				<ComponentRef name="P62"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="16.88" y="20.48"/>
			</CompInstance>
			<CompInstance name="P58" uniqueId="OQKVYRWR" side="Top" angle="90" fixed="on">
				<ComponentRef name="P58"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="32.12" y="20.48"/>
			</CompInstance>
			<CompInstance name="P16" uniqueId="CONCZUQN" side="Top" angle="90" fixed="on">
				<ComponentRef name="P16"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="60.06" y="23.02"/>
			</CompInstance>
			<CompInstance name="P17" uniqueId="YYUZTGSE" side="Top" angle="90" fixed="on">
				<ComponentRef name="P17"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="65.14" y="20.48"/>
			</CompInstance>
			<CompInstance name="P12" uniqueId="FTAYFQZU" side="Top" angle="90" fixed="on">
				<ComponentRef name="P12"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="14.34" y="23.02"/>
			</CompInstance>
			<CompInstance name="P87" uniqueId="SNRIGHAR" side="Top" angle="90" fixed="on">
				<ComponentRef name="P87"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="32.12" y="23.02"/>
			</CompInstance>
			<CompInstance name="P86" uniqueId="KIYOPHZT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P86"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="27.04" y="23.02"/>
			</CompInstance>
			<CompInstance name="P80" uniqueId="POSZJEKX" side="Top" angle="90" fixed="on">
				<ComponentRef name="P80"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="16.88" y="23.02"/>
			</CompInstance>
			<CompInstance name="P9" uniqueId="JRNLJKOD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P9"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="67.68" y="20.48"/>
			</CompInstance>
			<CompInstance name="P49" uniqueId="IYMRMSFW" side="Top" angle="90" fixed="on">
				<ComponentRef name="P49"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="21.96" y="20.48"/>
			</CompInstance>
			<CompInstance name="P8" uniqueId="RLHUJDOW" side="Top" angle="90" fixed="on">
				<ComponentRef name="P8"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="70.22" y="20.48"/>
			</CompInstance>
			<CompInstance name="P7" uniqueId="SCEZYAOS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P7"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="72.76" y="20.48"/>
			</CompInstance>
			<CompInstance name="P6" uniqueId="GGLYRGHP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P6"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="75.3" y="20.48"/>
			</CompInstance>
			<CompInstance name="P5" uniqueId="YXMNPESU" side="Top" angle="90" fixed="on">
				<ComponentRef name="P5"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="77.84" y="20.48"/>
			</CompInstance>
			<CompInstance name="P4" uniqueId="OGOAVQSI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P4"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="80.38" y="20.48"/>
			</CompInstance>
			<CompInstance name="P3" uniqueId="UYCPOJTM" side="Top" angle="90" fixed="on">
				<ComponentRef name="P3"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="82.92" y="20.48"/>
			</CompInstance>
			<CompInstance name="P2" uniqueId="NPQFLUFH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P2"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="85.46" y="20.48"/>
			</CompInstance>
			<CompInstance name="P1" uniqueId="RESEWLUT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="88" y="20.48"/>
			</CompInstance>
			<CompInstance name="P79" uniqueId="LMXAHHRY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P79"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="82.92" y="23.02"/>
			</CompInstance>
			<CompInstance name="P75" uniqueId="CQPKWFAT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P75"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="88" y="23.02"/>
			</CompInstance>
			<CompInstance name="P76" uniqueId="XJCJPPGT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P76"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="90.54" y="23.02"/>
			</CompInstance>
			<CompInstance name="P77" uniqueId="PFWTOIBQ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P77"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="11.8" y="23.02"/>
			</CompInstance>
		</Components>
		<FreePads>
			<FreePad name="FP1" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="75.3" y="15.3"/>
			</FreePad>
			<FreePad name="FP2" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="75.3" y="23.02"/>
			</FreePad>
			<FreePad name="FP3" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="67.68" y="23.02"/>
			</FreePad>
			<FreePad name="FP4" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="67.68" y="15.3"/>
			</FreePad>
			<FreePad name="FP5" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="60.06" y="15.3"/>
			</FreePad>
			<FreePad name="FP6" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="44.82" y="15.3"/>
			</FreePad>
			<FreePad name="FP7" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="52.44" y="23.02"/>
			</FreePad>
			<FreePad name="FP8" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="52.44" y="15.3"/>
			</FreePad>
			<FreePad name="FP9" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="37.2" y="23.02"/>
			</FreePad>
			<FreePad name="FP10" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="29.58" y="23.02"/>
			</FreePad>
			<FreePad name="FP11" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="21.96" y="23.02"/>
			</FreePad>
			<FreePad name="FP12" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="44.82" y="20.48"/>
			</FreePad>
			<FreePad name="FP13" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="37.2" y="17.84"/>
			</FreePad>
			<FreePad name="FP14" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="44.82" y="17.84"/>
			</FreePad>
			<FreePad name="FP15" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="60.06" y="20.48"/>
			</FreePad>
			<FreePad name="FP16" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="52.44" y="20.48"/>
			</FreePad>
			<FreePad name="FP17" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="52.44" y="17.84"/>
			</FreePad>
			<FreePad name="FP18" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="85.46" y="23.02"/>
			</FreePad>
			<FreePad name="FP19" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="80.38" y="23.02"/>
			</FreePad>
			<FreePad name="FP20" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="77.84" y="23.02"/>
			</FreePad>
			<FreePad name="FP21" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="72.76" y="23.02"/>
			</FreePad>
			<FreePad name="FP22" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="70.22" y="15.3"/>
			</FreePad>
			<FreePad name="FP23" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="70.22" y="23.02"/>
			</FreePad>
			<FreePad name="FP24" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="65.14" y="15.3"/>
			</FreePad>
			<FreePad name="FP25" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="65.14" y="23.02"/>
			</FreePad>
			<FreePad name="FP26" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="62.6" y="23.02"/>
			</FreePad>
			<FreePad name="FP27" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="62.6" y="15.3"/>
			</FreePad>
			<FreePad name="FP28" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="57.52" y="15.3"/>
			</FreePad>
			<FreePad name="FP29" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="57.52" y="23.02"/>
			</FreePad>
			<FreePad name="FP30" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="54.98" y="15.3"/>
			</FreePad>
			<FreePad name="FP31" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="54.98" y="23.02"/>
			</FreePad>
			<FreePad name="FP32" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="49.9" y="15.3"/>
			</FreePad>
			<FreePad name="FP33" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="49.9" y="23.02"/>
			</FreePad>
			<FreePad name="FP34" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="47.36" y="23.02"/>
			</FreePad>
			<FreePad name="FP35" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="47.36" y="15.3"/>
			</FreePad>
			<FreePad name="FP36" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="39.74" y="15.3"/>
			</FreePad>
			<FreePad name="FP37" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="42.28" y="15.3"/>
			</FreePad>
			<FreePad name="FP38" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="39.74" y="23.02"/>
			</FreePad>
			<FreePad name="FP39" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="34.66" y="15.3"/>
			</FreePad>
			<FreePad name="FP40" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="24.5" y="23.02"/>
			</FreePad>
			<FreePad name="FP41" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="19.42" y="23.02"/>
			</FreePad>
			<FreePad name="FP42" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="62.6" y="20.48"/>
			</FreePad>
			<FreePad name="FP43" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="57.52" y="17.84"/>
			</FreePad>
			<FreePad name="FP44" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="57.52" y="20.48"/>
			</FreePad>
			<FreePad name="FP45" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="54.98" y="17.84"/>
			</FreePad>
			<FreePad name="FP46" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="54.98" y="20.48"/>
			</FreePad>
			<FreePad name="FP47" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="49.9" y="17.84"/>
			</FreePad>
			<FreePad name="FP48" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="49.9" y="20.48"/>
			</FreePad>
			<FreePad name="FP49" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="47.36" y="20.48"/>
			</FreePad>
			<FreePad name="FP50" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="47.36" y="17.82"/>
			</FreePad>
			<FreePad name="FP51" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="42.28" y="20.48"/>
			</FreePad>
			<FreePad name="FP52" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="39.74" y="20.48"/>
			</FreePad>
			<FreePad name="FP53" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="39.74" y="17.84"/>
			</FreePad>
			<FreePad name="FP54" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="42.28" y="17.84"/>
			</FreePad>
			<FreePad name="FP55" side="Top" fixed="on">
				<PadstackRef name="EX1.8Y1.8R1.1"/>
				<Org x="34.66" y="17.84"/>
			</FreePad>
			<FreePad name="FP56" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="34.66" y="20.48"/>
			</FreePad>
			<FreePad name="FP57" side="Top" fixed="on">
				<PadstackRef name="EX1.5Y1.8R1.1"/>
				<Org x="11.8" y="20.48"/>
			</FreePad>
		</FreePads>
	</ComponentsOnBoard>

	<NetList version="2.0">
		<Net name="1">
			<PinRef compName="D3" pinName="8"/>
			<PinRef compName="D2" pinName="8"/>
			<PinRef compName="D1" pinName="8"/>
			<PinRef compName="P1" pinName="1"/>
		</Net>
		<Net name="56">
			<PinRef compName="D3" pinName="17"/>
			<PinRef compName="DR3" pinName="8"/>
			<PinRef compName="D6" pinName="12"/>
		</Net>
		<Net name="55">
			<PinRef compName="D3" pinName="16"/>
			<PinRef compName="DR3" pinName="7"/>
			<PinRef compName="D6" pinName="11"/>
		</Net>
		<Net name="54">
			<PinRef compName="D3" pinName="15"/>
			<PinRef compName="DR3" pinName="6"/>
			<PinRef compName="D6" pinName="6"/>
		</Net>
		<Net name="58">
			<PinRef compName="D10" pinName="2"/>
			<PinRef compName="D18" pinName="1"/>
			<PinRef compName="D19" pinName="1"/>
			<PinRef compName="R5" pinName="1"/>
		</Net>
		<Net name="53">
			<PinRef compName="D3" pinName="14"/>
			<PinRef compName="DR3" pinName="5"/>
			<PinRef compName="D6" pinName="5"/>
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
			<PinRef compName="D18" pinName="9"/>
			<PinRef compName="P63" pinName="1"/>
		</Net>
		<Net name="23">
			<PinRef compName="D18" pinName="8"/>
			<PinRef compName="P62" pinName="1"/>
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
			<PinRef compName="D18" pinName="3"/>
			<PinRef compName="P48" pinName="1"/>
		</Net>
		<Net name="19">
			<PinRef compName="D18" pinName="4"/>
			<PinRef compName="P59" pinName="1"/>
		</Net>
		<Net name="52">
			<PinRef compName="D3" pinName="13"/>
			<PinRef compName="DR3" pinName="4"/>
			<PinRef compName="D6" pinName="4"/>
		</Net>
		<Net name="51">
			<PinRef compName="D3" pinName="11"/>
			<PinRef compName="DR3" pinName="3"/>
			<PinRef compName="D6" pinName="3"/>
		</Net>
		<Net name="50">
			<PinRef compName="D3" pinName="10"/>
			<PinRef compName="DR3" pinName="2"/>
			<PinRef compName="D10" pinName="5"/>
			<PinRef compName="D6" pinName="2"/>
		</Net>
		<Net name="48">
			<PinRef compName="D2" pinName="17"/>
			<PinRef compName="DR2" pinName="8"/>
			<PinRef compName="D5" pinName="12"/>
		</Net>
		<Net name="16">
			<PinRef compName="D10" pinName="4"/>
			<PinRef compName="P33" pinName="1"/>
		</Net>
		<Net name="15">
			<PinRef compName="D20" pinName="24"/>
			<PinRef compName="P30" pinName="1"/>
		</Net>
		<Net name="14">
			<PinRef compName="D3" pinName="20"/>
			<PinRef compName="P11" pinName="1"/>
		</Net>
		<Net name="13">
			<PinRef compName="D2" pinName="20"/>
			<PinRef compName="D1" pinName="20"/>
			<PinRef compName="9" pinName="1"/>
			<PinRef compName="6" pinName="1"/>
			<PinRef compName="P18" pinName="1"/>
		</Net>
		<Net name="17">
			<PinRef compName="D18" pinName="2"/>
			<PinRef compName="P58" pinName="1"/>
		</Net>
		<Net name="12">
			<PinRef compName="D7" pinName="3"/>
			<PinRef compName="P85" pinName="1"/>
			<PinRef compName="P16" pinName="1"/>
		</Net>
		<Net name="11">
			<PinRef compName="D3" pinName="21"/>
			<PinRef compName="D2" pinName="21"/>
			<PinRef compName="D1" pinName="21"/>
			<PinRef compName="10" pinName="1"/>
			<PinRef compName="5" pinName="1"/>
			<PinRef compName="2" pinName="1"/>
			<PinRef compName="P10" pinName="1"/>
		</Net>
		<Net name="10">
			<PinRef compName="D3" pinName="18"/>
			<PinRef compName="D2" pinName="18"/>
			<PinRef compName="D1" pinName="18"/>
			<PinRef compName="8" pinName="1"/>
			<PinRef compName="7" pinName="1"/>
			<PinRef compName="3" pinName="1"/>
			<PinRef compName="P17" pinName="1"/>
		</Net>
		<Net name="9">
			<PinRef compName="D3" pinName="23"/>
			<PinRef compName="D2" pinName="23"/>
			<PinRef compName="D1" pinName="23"/>
			<PinRef compName="13" pinName="1"/>
			<PinRef compName="4" pinName="1"/>
			<PinRef compName="1" pinName="1"/>
			<PinRef compName="P9" pinName="1"/>
		</Net>
		<Net name="8">
			<PinRef compName="D3" pinName="1"/>
			<PinRef compName="D2" pinName="1"/>
			<PinRef compName="D1" pinName="1"/>
			<PinRef compName="P8" pinName="1"/>
		</Net>
		<Net name="7">
			<PinRef compName="D3" pinName="2"/>
			<PinRef compName="D2" pinName="2"/>
			<PinRef compName="D1" pinName="2"/>
			<PinRef compName="P7" pinName="1"/>
		</Net>
		<Net name="6">
			<PinRef compName="D3" pinName="3"/>
			<PinRef compName="D2" pinName="3"/>
			<PinRef compName="D1" pinName="3"/>
			<PinRef compName="P6" pinName="1"/>
		</Net>
		<Net name="5">
			<PinRef compName="D3" pinName="4"/>
			<PinRef compName="D2" pinName="4"/>
			<PinRef compName="D1" pinName="4"/>
			<PinRef compName="P5" pinName="1"/>
		</Net>
		<Net name="2">
			<PinRef compName="D3" pinName="7"/>
			<PinRef compName="D2" pinName="7"/>
			<PinRef compName="D1" pinName="7"/>
			<PinRef compName="P2" pinName="1"/>
		</Net>
		<Net name="3">
			<PinRef compName="D3" pinName="6"/>
			<PinRef compName="D2" pinName="6"/>
			<PinRef compName="D1" pinName="6"/>
			<PinRef compName="P3" pinName="1"/>
		</Net>
		<Net name="4">
			<PinRef compName="D3" pinName="5"/>
			<PinRef compName="D2" pinName="5"/>
			<PinRef compName="D1" pinName="5"/>
			<PinRef compName="P4" pinName="1"/>
		</Net>
		<Net name="GND">
			<PinRef compName="C12" pinName="2"/>
			<PinRef compName="D20" pinName="21"/>
			<PinRef compName="D20" pinName="20"/>
			<PinRef compName="D20" pinName="19"/>
			<PinRef compName="D8" pinName="7"/>
			<PinRef compName="D7" pinName="7"/>
			<PinRef compName="D3" pinName="12"/>
			<PinRef compName="D2" pinName="12"/>
			<PinRef compName="D1" pinName="12"/>
			<PinRef compName="D12" pinName="21"/>
			<PinRef compName="D13" pinName="21"/>
			<PinRef compName="D11" pinName="21"/>
			<PinRef compName="D16" pinName="21"/>
			<PinRef compName="D17" pinName="21"/>
			<PinRef compName="D14" pinName="21"/>
			<PinRef compName="D15" pinName="21"/>
			<PinRef compName="D9" pinName="7"/>
			<PinRef compName="D10" pinName="7"/>
			<PinRef compName="D18" pinName="19"/>
			<PinRef compName="D18" pinName="10"/>
			<PinRef compName="D19" pinName="19"/>
			<PinRef compName="D19" pinName="10"/>
			<PinRef compName="D6" pinName="7"/>
			<PinRef compName="D5" pinName="7"/>
			<PinRef compName="D4" pinName="7"/>
			<PinRef compName="P37" pinName="1"/>
			<PinRef compName="C10" pinName="1"/>
			<PinRef compName="C8" pinName="1"/>
			<PinRef compName="C9" pinName="1"/>
			<PinRef compName="C4" pinName="1"/>
			<PinRef compName="C5" pinName="1"/>
			<PinRef compName="C6" pinName="1"/>
			<PinRef compName="C7" pinName="1"/>
			<PinRef compName="C1" pinName="1"/>
			<PinRef compName="C2" pinName="1"/>
			<PinRef compName="C3" pinName="1"/>
			<PinRef compName="P15" pinName="1"/>
			<PinRef compName="P78" pinName="1"/>
			<PinRef compName="P71" pinName="1"/>
			<PinRef compName="P72" pinName="1"/>
			<PinRef compName="P73" pinName="1"/>
			<PinRef compName="P74" pinName="1"/>
			<PinRef compName="P38" pinName="1"/>
			<PinRef compName="P75" pinName="1"/>
			<PinRef compName="P76" pinName="1"/>
			<PinRef compName="P77" pinName="1"/>
		</Net>
		<Net name="60">
			<PinRef compName="D17" pinName="6"/>
			<PinRef compName="D17" pinName="7"/>
			<PinRef compName="P47" pinName="1"/>
		</Net>
		<Net name="33">
			<PinRef compName="D20" pinName="11"/>
			<PinRef compName="P13" pinName="1"/>
		</Net>
		<Net name="59">
			<PinRef compName="D17" pinName="35"/>
			<PinRef compName="D17" pinName="36"/>
			<PinRef compName="P55" pinName="1"/>
		</Net>
		<Net name="47">
			<PinRef compName="D20" pinName="25"/>
			<PinRef compName="P29" pinName="1"/>
		</Net>
		<Net name="46">
			<PinRef compName="D20" pinName="26"/>
			<PinRef compName="P25" pinName="1"/>
		</Net>
		<Net name="45">
			<PinRef compName="D20" pinName="27"/>
			<PinRef compName="P28" pinName="1"/>
		</Net>
		<Net name="44">
			<PinRef compName="D20" pinName="28"/>
			<PinRef compName="P27" pinName="1"/>
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
			<PinRef compName="D20" pinName="31"/>
			<PinRef compName="P31" pinName="1"/>
		</Net>
		<Net name="40">
			<PinRef compName="D20" pinName="18"/>
			<PinRef compName="P24" pinName="1"/>
		</Net>
		<Net name="39">
			<PinRef compName="D20" pinName="17"/>
			<PinRef compName="P23" pinName="1"/>
		</Net>
		<Net name="38">
			<PinRef compName="D20" pinName="16"/>
			<PinRef compName="P22" pinName="1"/>
		</Net>
		<Net name="35">
			<PinRef compName="D20" pinName="13"/>
			<PinRef compName="P19" pinName="1"/>
		</Net>
		<Net name="117">
			<PinRef compName="D20" pinName="41"/>
			<PinRef compName="D10" pinName="8"/>
			<PinRef compName="R6" pinName="1"/>
		</Net>
		<Net name="36">
			<PinRef compName="D20" pinName="14"/>
			<PinRef compName="P20" pinName="1"/>
		</Net>
		<Net name="116">
			<PinRef compName="P56" pinName="1"/>
			<PinRef compName="P86" pinName="1"/>
		</Net>
		<Net name="115">
			<PinRef compName="P57" pinName="1"/>
			<PinRef compName="P87" pinName="1"/>
		</Net>
		<Net name="114">
			<PinRef compName="D20" pinName="23"/>
			<PinRef compName="D2" pinName="16"/>
			<PinRef compName="DR2" pinName="7"/>
			<PinRef compName="D10" pinName="9"/>
			<PinRef compName="D5" pinName="11"/>
		</Net>
		<Net name="113">
			<PinRef compName="D2" pinName="15"/>
			<PinRef compName="DR2" pinName="6"/>
			<PinRef compName="D16" pinName="27"/>
			<PinRef compName="D16" pinName="28"/>
			<PinRef compName="D5" pinName="6"/>
		</Net>
		<Net name="112">
			<PinRef compName="D16" pinName="6"/>
			<PinRef compName="D16" pinName="7"/>
			<PinRef compName="P54" pinName="1"/>
		</Net>
		<Net name="110">
			<PinRef compName="D2" pinName="14"/>
			<PinRef compName="DR2" pinName="5"/>
			<PinRef compName="D16" pinName="14"/>
			<PinRef compName="D16" pinName="15"/>
			<PinRef compName="D5" pinName="5"/>
		</Net>
		<Net name="111">
			<PinRef compName="D16" pinName="35"/>
			<PinRef compName="D16" pinName="36"/>
			<PinRef compName="P82" pinName="1"/>
		</Net>
		<Net name="94">
			<PinRef compName="D20" pinName="32"/>
			<PinRef compName="D12" pinName="24"/>
			<PinRef compName="D13" pinName="24"/>
			<PinRef compName="D11" pinName="24"/>
			<PinRef compName="D16" pinName="24"/>
			<PinRef compName="D17" pinName="24"/>
			<PinRef compName="D14" pinName="24"/>
			<PinRef compName="D15" pinName="24"/>
			<PinRef compName="D19" pinName="11"/>
		</Net>
		<Net name="93">
			<PinRef compName="D20" pinName="33"/>
			<PinRef compName="D12" pinName="23"/>
			<PinRef compName="D13" pinName="23"/>
			<PinRef compName="D11" pinName="23"/>
			<PinRef compName="D16" pinName="23"/>
			<PinRef compName="D17" pinName="23"/>
			<PinRef compName="D14" pinName="23"/>
			<PinRef compName="D15" pinName="23"/>
			<PinRef compName="D19" pinName="12"/>
		</Net>
		<Net name="92">
			<PinRef compName="D20" pinName="34"/>
			<PinRef compName="D12" pinName="22"/>
			<PinRef compName="D13" pinName="22"/>
			<PinRef compName="D11" pinName="22"/>
			<PinRef compName="D16" pinName="22"/>
			<PinRef compName="D17" pinName="22"/>
			<PinRef compName="D14" pinName="22"/>
			<PinRef compName="D15" pinName="22"/>
			<PinRef compName="D19" pinName="13"/>
		</Net>
		<Net name="91">
			<PinRef compName="D20" pinName="35"/>
			<PinRef compName="D12" pinName="20"/>
			<PinRef compName="D13" pinName="20"/>
			<PinRef compName="D11" pinName="20"/>
			<PinRef compName="D16" pinName="20"/>
			<PinRef compName="D17" pinName="20"/>
			<PinRef compName="D14" pinName="20"/>
			<PinRef compName="D15" pinName="20"/>
			<PinRef compName="D19" pinName="14"/>
		</Net>
		<Net name="90">
			<PinRef compName="D20" pinName="36"/>
			<PinRef compName="D12" pinName="19"/>
			<PinRef compName="D13" pinName="19"/>
			<PinRef compName="D11" pinName="19"/>
			<PinRef compName="D16" pinName="19"/>
			<PinRef compName="D17" pinName="19"/>
			<PinRef compName="D14" pinName="19"/>
			<PinRef compName="D15" pinName="19"/>
			<PinRef compName="D19" pinName="15"/>
		</Net>
		<Net name="89">
			<PinRef compName="D20" pinName="37"/>
			<PinRef compName="D12" pinName="18"/>
			<PinRef compName="D13" pinName="18"/>
			<PinRef compName="D11" pinName="18"/>
			<PinRef compName="D16" pinName="18"/>
			<PinRef compName="D17" pinName="18"/>
			<PinRef compName="D14" pinName="18"/>
			<PinRef compName="D15" pinName="18"/>
			<PinRef compName="D19" pinName="16"/>
		</Net>
		<Net name="88">
			<PinRef compName="D20" pinName="38"/>
			<PinRef compName="D12" pinName="17"/>
			<PinRef compName="D13" pinName="17"/>
			<PinRef compName="D11" pinName="17"/>
			<PinRef compName="D16" pinName="17"/>
			<PinRef compName="D17" pinName="17"/>
			<PinRef compName="D14" pinName="17"/>
			<PinRef compName="D15" pinName="17"/>
			<PinRef compName="D19" pinName="17"/>
		</Net>
		<Net name="87">
			<PinRef compName="D20" pinName="39"/>
			<PinRef compName="D12" pinName="16"/>
			<PinRef compName="D13" pinName="16"/>
			<PinRef compName="D11" pinName="16"/>
			<PinRef compName="D16" pinName="16"/>
			<PinRef compName="D17" pinName="16"/>
			<PinRef compName="D14" pinName="16"/>
			<PinRef compName="D15" pinName="16"/>
			<PinRef compName="D19" pinName="18"/>
		</Net>
		<Net name="86">
			<PinRef compName="D20" pinName="10"/>
			<PinRef compName="D12" pinName="37"/>
			<PinRef compName="D13" pinName="37"/>
			<PinRef compName="D11" pinName="37"/>
			<PinRef compName="D16" pinName="37"/>
			<PinRef compName="D17" pinName="37"/>
			<PinRef compName="D14" pinName="37"/>
			<PinRef compName="D15" pinName="37"/>
			<PinRef compName="D18" pinName="11"/>
		</Net>
		<Net name="85">
			<PinRef compName="D20" pinName="9"/>
			<PinRef compName="D12" pinName="38"/>
			<PinRef compName="D13" pinName="38"/>
			<PinRef compName="D11" pinName="38"/>
			<PinRef compName="D16" pinName="38"/>
			<PinRef compName="D17" pinName="38"/>
			<PinRef compName="D14" pinName="38"/>
			<PinRef compName="D15" pinName="38"/>
			<PinRef compName="D18" pinName="12"/>
		</Net>
		<Net name="84">
			<PinRef compName="D20" pinName="8"/>
			<PinRef compName="D12" pinName="39"/>
			<PinRef compName="D13" pinName="39"/>
			<PinRef compName="D11" pinName="39"/>
			<PinRef compName="D16" pinName="39"/>
			<PinRef compName="D17" pinName="39"/>
			<PinRef compName="D14" pinName="39"/>
			<PinRef compName="D15" pinName="39"/>
			<PinRef compName="D18" pinName="13"/>
		</Net>
		<Net name="83">
			<PinRef compName="D20" pinName="7"/>
			<PinRef compName="D12" pinName="40"/>
			<PinRef compName="D13" pinName="40"/>
			<PinRef compName="D11" pinName="40"/>
			<PinRef compName="D16" pinName="40"/>
			<PinRef compName="D17" pinName="40"/>
			<PinRef compName="D14" pinName="40"/>
			<PinRef compName="D15" pinName="40"/>
			<PinRef compName="D18" pinName="14"/>
		</Net>
		<Net name="82">
			<PinRef compName="D20" pinName="6"/>
			<PinRef compName="D12" pinName="41"/>
			<PinRef compName="D13" pinName="41"/>
			<PinRef compName="D11" pinName="41"/>
			<PinRef compName="D16" pinName="41"/>
			<PinRef compName="D17" pinName="41"/>
			<PinRef compName="D14" pinName="41"/>
			<PinRef compName="D15" pinName="41"/>
			<PinRef compName="D18" pinName="15"/>
		</Net>
		<Net name="81">
			<PinRef compName="D20" pinName="5"/>
			<PinRef compName="D12" pinName="3"/>
			<PinRef compName="D13" pinName="3"/>
			<PinRef compName="D11" pinName="3"/>
			<PinRef compName="D16" pinName="3"/>
			<PinRef compName="D17" pinName="3"/>
			<PinRef compName="D14" pinName="3"/>
			<PinRef compName="D15" pinName="3"/>
			<PinRef compName="D18" pinName="16"/>
		</Net>
		<Net name="80">
			<PinRef compName="D20" pinName="4"/>
			<PinRef compName="D12" pinName="2"/>
			<PinRef compName="D13" pinName="2"/>
			<PinRef compName="D11" pinName="2"/>
			<PinRef compName="D16" pinName="2"/>
			<PinRef compName="D17" pinName="2"/>
			<PinRef compName="D14" pinName="2"/>
			<PinRef compName="D15" pinName="2"/>
			<PinRef compName="D18" pinName="17"/>
		</Net>
		<Net name="79">
			<PinRef compName="D20" pinName="3"/>
			<PinRef compName="D12" pinName="1"/>
			<PinRef compName="D13" pinName="1"/>
			<PinRef compName="D11" pinName="1"/>
			<PinRef compName="D16" pinName="1"/>
			<PinRef compName="D17" pinName="1"/>
			<PinRef compName="D14" pinName="1"/>
			<PinRef compName="D15" pinName="1"/>
			<PinRef compName="D18" pinName="18"/>
		</Net>
		<Net name="78">
			<PinRef compName="D15" pinName="6"/>
			<PinRef compName="D15" pinName="7"/>
			<PinRef compName="P43" pinName="1"/>
		</Net>
		<Net name="77">
			<PinRef compName="D15" pinName="35"/>
			<PinRef compName="D15" pinName="36"/>
			<PinRef compName="P53" pinName="1"/>
		</Net>
		<Net name="76">
			<PinRef compName="D14" pinName="6"/>
			<PinRef compName="D14" pinName="7"/>
			<PinRef compName="P81" pinName="1"/>
		</Net>
		<Net name="75">
			<PinRef compName="D14" pinName="35"/>
			<PinRef compName="D14" pinName="36"/>
			<PinRef compName="P70" pinName="1"/>
		</Net>
		<Net name="74">
			<PinRef compName="D13" pinName="6"/>
			<PinRef compName="D13" pinName="7"/>
			<PinRef compName="P42" pinName="1"/>
		</Net>
		<Net name="73">
			<PinRef compName="D13" pinName="35"/>
			<PinRef compName="D13" pinName="36"/>
			<PinRef compName="P40" pinName="1"/>
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
			<PinRef compName="D11" pinName="35"/>
			<PinRef compName="D11" pinName="36"/>
			<PinRef compName="P44" pinName="1"/>
		</Net>
		<Net name="NET00032">
			<PinRef compName="D8" pinName="12"/>
			<PinRef compName="D8" pinName="8"/>
		</Net>
		<Net name="NET00030">
			<PinRef compName="D7" pinName="12"/>
			<PinRef compName="D7" pinName="8"/>
		</Net>
		<Net name="108">
			<PinRef compName="D8" pinName="11"/>
			<PinRef compName="D8" pinName="5"/>
			<PinRef compName="P34" pinName="1"/>
		</Net>
		<Net name="+5B">
			<PinRef compName="C12" pinName="1"/>
			<PinRef compName="D20" pinName="40"/>
			<PinRef compName="D20" pinName="42"/>
			<PinRef compName="D20" pinName="2"/>
			<PinRef compName="D20" pinName="22"/>
			<PinRef compName="D8" pinName="14"/>
			<PinRef compName="D8" pinName="13"/>
			<PinRef compName="D8" pinName="10"/>
			<PinRef compName="D8" pinName="1"/>
			<PinRef compName="D8" pinName="4"/>
			<PinRef compName="D7" pinName="14"/>
			<PinRef compName="D7" pinName="13"/>
			<PinRef compName="D7" pinName="10"/>
			<PinRef compName="D7" pinName="1"/>
			<PinRef compName="D7" pinName="4"/>
			<PinRef compName="D3" pinName="24"/>
			<PinRef compName="D3" pinName="19"/>
			<PinRef compName="D2" pinName="24"/>
			<PinRef compName="D2" pinName="19"/>
			<PinRef compName="D1" pinName="24"/>
			<PinRef compName="D1" pinName="19"/>
			<PinRef compName="DR1" pinName="9"/>
			<PinRef compName="DR3" pinName="9"/>
			<PinRef compName="DR2" pinName="9"/>
			<PinRef compName="D12" pinName="42"/>
			<PinRef compName="D12" pinName="8"/>
			<PinRef compName="D12" pinName="26"/>
			<PinRef compName="D12" pinName="34"/>
			<PinRef compName="D13" pinName="42"/>
			<PinRef compName="D13" pinName="8"/>
			<PinRef compName="D13" pinName="26"/>
			<PinRef compName="D13" pinName="34"/>
			<PinRef compName="D11" pinName="42"/>
			<PinRef compName="D11" pinName="8"/>
			<PinRef compName="D11" pinName="26"/>
			<PinRef compName="D11" pinName="34"/>
			<PinRef compName="D16" pinName="42"/>
			<PinRef compName="D16" pinName="8"/>
			<PinRef compName="D16" pinName="26"/>
			<PinRef compName="D16" pinName="34"/>
			<PinRef compName="D17" pinName="42"/>
			<PinRef compName="D17" pinName="8"/>
			<PinRef compName="D17" pinName="26"/>
			<PinRef compName="D17" pinName="34"/>
			<PinRef compName="D14" pinName="42"/>
			<PinRef compName="D14" pinName="8"/>
			<PinRef compName="D14" pinName="26"/>
			<PinRef compName="D14" pinName="34"/>
			<PinRef compName="D15" pinName="42"/>
			<PinRef compName="D15" pinName="8"/>
			<PinRef compName="D15" pinName="26"/>
			<PinRef compName="D15" pinName="34"/>
			<PinRef compName="D9" pinName="14"/>
			<PinRef compName="D10" pinName="14"/>
			<PinRef compName="D18" pinName="20"/>
			<PinRef compName="D19" pinName="20"/>
			<PinRef compName="D6" pinName="14"/>
			<PinRef compName="D5" pinName="14"/>
			<PinRef compName="D4" pinName="14"/>
			<PinRef compName="P36" pinName="1"/>
			<PinRef compName="C10" pinName="2"/>
			<PinRef compName="C8" pinName="2"/>
			<PinRef compName="C9" pinName="2"/>
			<PinRef compName="C4" pinName="2"/>
			<PinRef compName="C5" pinName="2"/>
			<PinRef compName="C6" pinName="2"/>
			<PinRef compName="C7" pinName="2"/>
			<PinRef compName="C1" pinName="2"/>
			<PinRef compName="C2" pinName="2"/>
			<PinRef compName="C3" pinName="2"/>
			<PinRef compName="R5" pinName="2"/>
			<PinRef compName="R4" pinName="2"/>
			<PinRef compName="R6" pinName="2"/>
			<PinRef compName="P52" pinName="1"/>
			<PinRef compName="P80" pinName="1"/>
			<PinRef compName="P79" pinName="1"/>
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
			<PinRef compName="D20" pinName="1"/>
			<PinRef compName="D10" pinName="6"/>
			<PinRef compName="R4" pinName="1"/>
		</Net>
		<Net name="109">
			<PinRef compName="D8" pinName="3"/>
			<PinRef compName="D7" pinName="9"/>
			<PinRef compName="P39" pinName="1"/>
		</Net>
		<Net name="68">
			<PinRef compName="D7" pinName="11"/>
			<PinRef compName="D7" pinName="5"/>
			<PinRef compName="D12" pinName="4"/>
			<PinRef compName="D13" pinName="4"/>
			<PinRef compName="D11" pinName="4"/>
			<PinRef compName="D16" pinName="4"/>
			<PinRef compName="D17" pinName="4"/>
			<PinRef compName="D14" pinName="4"/>
			<PinRef compName="D15" pinName="4"/>
			<PinRef compName="P35" pinName="1"/>
		</Net>
		<Net name="107">
			<PinRef compName="D2" pinName="13"/>
			<PinRef compName="DR2" pinName="4"/>
			<PinRef compName="D17" pinName="27"/>
			<PinRef compName="D17" pinName="28"/>
			<PinRef compName="D5" pinName="4"/>
			<PinRef compName="12" pinName="1"/>
		</Net>
		<Net name="67">
			<PinRef compName="D3" pinName="9"/>
			<PinRef compName="DR3" pinName="1"/>
			<PinRef compName="D12" pinName="5"/>
			<PinRef compName="D13" pinName="5"/>
			<PinRef compName="D11" pinName="5"/>
			<PinRef compName="D16" pinName="5"/>
			<PinRef compName="D17" pinName="5"/>
			<PinRef compName="D14" pinName="5"/>
			<PinRef compName="D15" pinName="5"/>
			<PinRef compName="D6" pinName="1"/>
		</Net>
		<Net name="106">
			<PinRef compName="D2" pinName="11"/>
			<PinRef compName="DR2" pinName="3"/>
			<PinRef compName="D17" pinName="14"/>
			<PinRef compName="D17" pinName="15"/>
			<PinRef compName="D5" pinName="3"/>
			<PinRef compName="11" pinName="1"/>
		</Net>
		<Net name="66">
			<PinRef compName="D12" pinName="25"/>
			<PinRef compName="D13" pinName="25"/>
			<PinRef compName="D11" pinName="25"/>
			<PinRef compName="D16" pinName="25"/>
			<PinRef compName="D17" pinName="25"/>
			<PinRef compName="D14" pinName="25"/>
			<PinRef compName="D15" pinName="25"/>
			<PinRef compName="P12" pinName="1"/>
		</Net>
		<Net name="104">
			<PinRef compName="D2" pinName="10"/>
			<PinRef compName="DR2" pinName="2"/>
			<PinRef compName="D15" pinName="27"/>
			<PinRef compName="D15" pinName="28"/>
			<PinRef compName="D5" pinName="2"/>
		</Net>
		<Net name="103">
			<PinRef compName="D2" pinName="9"/>
			<PinRef compName="DR2" pinName="1"/>
			<PinRef compName="D15" pinName="14"/>
			<PinRef compName="D15" pinName="15"/>
			<PinRef compName="D5" pinName="1"/>
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
			<PinRef compName="DR1" pinName="4"/>
			<PinRef compName="D12" pinName="27"/>
			<PinRef compName="D12" pinName="28"/>
			<PinRef compName="D4" pinName="4"/>
		</Net>
		<Net name="97">
			<PinRef compName="D1" pinName="11"/>
			<PinRef compName="DR1" pinName="3"/>
			<PinRef compName="D12" pinName="14"/>
			<PinRef compName="D12" pinName="15"/>
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
					<LayerRef name="Top"/>
				</LayerRule>
				<LayerRule width="0.2">
					<LayerRef name="Bottom"/>
				</LayerRule>
			</Impedance>
			<ImpedanceDiff name="ZDiff_100" Z0="100">
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Top"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Bottom"/>
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
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="97"/>
				<Org x="80.018" y="38.5812"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="95"/>
				<Org x="76.5543" y="38.1627"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="96"/>
				<Org x="78.0488" y="38.3679"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="56"/>
				<Org x="38.1555" y="43.6978"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="54"/>
				<Org x="36.7834" y="45.9579"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="58"/>
				<Org x="63.4199" y="27.2565"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="31"/>
				<Org x="71.6545" y="27.242"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="30"/>
				<Org x="70.6936" y="26.3417"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="52"/>
				<Org x="34.4228" y="43.3989"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="51"/>
				<Org x="33.9244" y="34.642"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="50"/>
				<Org x="32.6084" y="34.5761"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="48"/>
				<Org x="55.9526" y="44.7258"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="15"/>
				<Org x="41.3207" y="96.9066"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="14"/>
				<Org x="42.0558" y="39.1189"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="12"/>
				<Org x="94.558" y="91.6646"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="9"/>
				<Org x="27.1844" y="44.706"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="9"/>
				<Org x="65.692" y="41.0086"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="50.7688" y="88.9037"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="75.3149" y="68.8301"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="65.792" y="35.4246"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="75.108" y="29.453"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="51.4112" y="63.4042"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="83.312" y="76.8649"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="83.8664" y="86.6036"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="61.2304" y="51.7183"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="13.125" y="44.0165"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="60"/>
				<Org x="30.3256" y="82.3385"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="33"/>
				<Org x="39.1202" y="91.8809"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="59"/>
				<Org x="26.4236" y="88.0822"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="47"/>
				<Org x="43.3675" y="91.9099"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="46"/>
				<Org x="43.5932" y="95.8019"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="45"/>
				<Org x="45.3645" y="96.1289"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="44"/>
				<Org x="48.4457" y="95.6127"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="43"/>
				<Org x="49.8547" y="91.9955"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="42"/>
				<Org x="45.0436" y="91.0384"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="34"/>
				<Org x="35.8304" y="91.5206"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="41"/>
				<Org x="48.7825" y="91.3457"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="40"/>
				<Org x="34.6258" y="97.2695"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="39"/>
				<Org x="33.2997" y="97.0596"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="38"/>
				<Org x="31.5126" y="97.026"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="35"/>
				<Org x="34.2568" y="91.6835"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="117"/>
				<Org x="39.6339" y="85.8143"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="36"/>
				<Org x="37.1466" y="91.9254"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="114"/>
				<Org x="39.2647" y="97.2362"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="114"/>
				<Org x="52.8285" y="50.0296"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="113"/>
				<Org x="51.9358" y="45.8531"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="112"/>
				<Org x="64.9604" y="84.4414"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="110"/>
				<Org x="60.7194" y="77.541"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="110"/>
				<Org x="50.8162" y="45.253"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="94"/>
				<Org x="77.0815" y="70.7188"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="94"/>
				<Org x="72.0288" y="54.9584"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="93"/>
				<Org x="50.3961" y="61.1268"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="93"/>
				<Org x="68.3086" y="45.392"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="93"/>
				<Org x="78.1334" y="68.769"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="93"/>
				<Org x="70.4799" y="54.1931"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="92"/>
				<Org x="65.875" y="46.0165"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="92"/>
				<Org x="50.7207" y="62.3696"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="92"/>
				<Org x="79.6262" y="69.8421"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="92"/>
				<Org x="20.9896" y="70.8968"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="92"/>
				<Org x="70.4114" y="52.5559"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="82.053" y="62.6085"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="45.0317" y="86.3859"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="22.1818" y="71.9901"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="51.4182" y="59.182"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="71.6403" y="52.7245"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="82.8596" y="61.2902"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="46.019" y="85.4884"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="23.7978" y="72.0764"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="73.2563" y="52.724"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="76.0261" y="51.565"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="23.968" y="70.8586"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="83.9002" y="64.6116"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="47.6712" y="83.0452"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="48.1165" y="81.6358"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="77.3452" y="51.4207"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="25.2434" y="69.8481"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="85.0805" y="59.3996"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="57.8297" y="56.958"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="26.3909" y="72.042"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="85.7218" y="61.2808"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="82.646" y="52.9833"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="48.3366" y="80.3116"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="86"/>
				<Org x="65.0844" y="91.3702"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="86"/>
				<Org x="17.1414" y="53.8834"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="85"/>
				<Org x="18.2442" y="54.5343"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="85"/>
				<Org x="65.5203" y="89.9816"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="85"/>
				<Org x="18.962" y="63.5915"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="84"/>
				<Org x="66.7841" y="90.5823"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="83"/>
				<Org x="77.9704" y="60.1942"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="82"/>
				<Org x="79.3809" y="58.611"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="81"/>
				<Org x="21.6875" y="48.758"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="81"/>
				<Org x="52.2978" y="70.6535"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="81"/>
				<Org x="83.5058" y="68.3145"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="80"/>
				<Org x="22.9598" y="53.7929"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="80"/>
				<Org x="81.9424" y="70.623"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="79"/>
				<Org x="22.889" y="51.8598"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="79"/>
				<Org x="81.4213" y="71.939"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="76"/>
				<Org x="61.2668" y="70.7073"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="75"/>
				<Org x="53.7112" y="83.9497"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="72"/>
				<Org x="85.1374" y="77.1527"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="71"/>
				<Org x="69.4417" y="69.6166"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="70"/>
				<Org x="38.9188" y="95.808"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="70"/>
				<Org x="31.2047" y="57.6627"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="69"/>
				<Org x="25.098" y="87.9211"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="14.375" y="92.7165"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="27.3585" y="45.9331"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="69.4269" y="79.7068"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="37"/>
				<Org x="28.3043" y="95.6127"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="57"/>
				<Org x="36.7085" y="84.0156"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="109"/>
				<Org x="77.415" y="92.1478"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="68"/>
				<Org x="84.4525" y="66.4208"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="68"/>
				<Org x="53.0681" y="71.6232"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="107"/>
				<Org x="13.8193" y="53.7064"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="107"/>
				<Org x="50.6801" y="44.037"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="67"/>
				<Org x="26.6995" y="50.5726"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="67"/>
				<Org x="26.7892" y="58.4152"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="67"/>
				<Org x="53.9554" y="70.7808"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="67"/>
				<Org x="31.2924" y="34.642"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="104"/>
				<Org x="50.8614" y="34.8145"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="104"/>
				<Org x="39.1614" y="63.439"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="103"/>
				<Org x="49.5593" y="34.8453"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="103"/>
				<Org x="54.5538" y="49.4739"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="101"/>
				<Org x="76.6775" y="42.8232"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="100"/>
				<Org x="87.6627" y="42.8043"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="100"/>
				<Org x="69.983" y="64.75"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="99"/>
				<Org x="89.6957" y="46.0373"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="98"/>
				<Org x="88.5727" y="45.2357"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="95"/>
				<Org x="43.642" y="56.241"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="NET00002"/>
				<Org x="36.1454" y="38.3945"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="NET00001"/>
				<Org x="55.1837" y="38.7678"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="NET00000"/>
				<Org x="73.0412" y="40.5271"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="94"/>
				<Org x="20.5959" y="68.4541"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="82"/>
				<Org x="47.207" y="64.0237"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="44.6286" y="81.221"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="19.858" y="82.5912"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="65.7094" y="52.3862"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="66"/>
				<Org x="20.2233" y="67.2338"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="43.1793" y="79.8037"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="102"/>
				<Org x="77.6445" y="43.7168"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="84"/>
				<Org x="46.1857" y="61.7292"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="80"/>
				<Org x="23.7708" y="60.5097"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="81"/>
				<Org x="25.8037" y="60.6921"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="70"/>
				<Org x="32.5521" y="60.8744"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="84"/>
				<Org x="68.0775" y="74.4952"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="63.3401" y="53.42"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="84"/>
				<Org x="18.4005" y="65.4004"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="55"/>
				<Org x="38.0478" y="44.9363"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="95"/>
				<Org x="73.217" y="38.6897"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="66.7679" y="51.671"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="69"/>
				<Org x="10.983" y="62.75"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="82"/>
				<Org x="32.4694" y="72.3174"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="58"/>
				<Org x="25.2125" y="31.1813"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="74.2618" y="63.9025"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="83"/>
				<Org x="46.8743" y="62.7847"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="80"/>
				<Org x="52.4638" y="69.4084"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="29.4692" y="80.6144"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="41.8664" y="79.1124"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="50.701" y="84.5729"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="111"/>
				<Org x="65.75" y="97.3744"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="83"/>
				<Org x="18.4702" y="66.7061"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="49.9664" y="85.7911"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="86"/>
				<Org x="66.4378" y="72.3399"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="11"/>
				<Org x="41.38" y="37.9923"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="62.0179" y="53.4102"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="68"/>
				<Org x="27.0514" y="59.6315"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="110"/>
				<Org x="53.8127" y="43.0926"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="40.3097" y="39.8868"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="51.5255" y="83.5661"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="67"/>
				<Org x="73.2154" y="81.6369"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="82"/>
				<Org x="19.471" y="51.251"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="79"/>
				<Org x="51.7712" y="68.3755"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="13"/>
				<Org x="43.1984" y="37.6324"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="79"/>
				<Org x="22.1282" y="59.9879"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="85"/>
				<Org x="67.26" y="73.428"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="28.4894" y="78.2821"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="85"/>
				<Org x="46.0603" y="60.48"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="53"/>
				<Org x="35.6826" y="43.573"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="82"/>
				<Org x="18.7714" y="68.1178"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="93"/>
				<Org x="20.6532" y="69.6772"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="92"/>
				<Org x="45.0356" y="87.6346"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="107"/>
				<Org x="46.2902" y="38.056"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="94"/>
				<Org x="49.2835" y="60.4718"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="49.1649" y="86.8903"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="94"/>
				<Org x="72.639" y="49.508"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="106"/>
				<Org x="52.1875" y="34.6195"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="101"/>
				<Org x="83.8009" y="39.278"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="93"/>
				<Org x="46.8463" y="78.7415"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="57.6363" y="58.2671"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="52.3412" y="82.5848"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="66"/>
				<Org x="75.745" y="70.1673"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="109"/>
				<Org x="79.3662" y="90.8751"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="64.5823" y="53.0094"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="83"/>
				<Org x="18.6205" y="52.1235"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="106"/>
				<Org x="47.8153" y="35.6719"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="76"/>
				<Org x="57.8682" y="75.2012"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="114"/>
				<Org x="56.0391" y="45.942"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="86"/>
				<Org x="17.6404" y="63.5698"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="68"/>
				<Org x="62.325" y="84.3087"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="113"/>
				<Org x="56.3698" y="49.458"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="84"/>
				<Org x="18.8186" y="53.3613"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="56.515" y="59.1562"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="81.7686" y="52.0027"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="55.5406" y="60.0194"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="94"/>
				<Org x="45.6887" y="77.8331"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="43.9184" y="65.7561"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="86"/>
				<Org x="45.6458" y="59.264"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="80.1293" y="67.4727"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="86.6034" y="92.5204"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="67"/>
				<Org x="86.4536" y="71.8483"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="39.633" y="89.2248"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="50"/>
				<Org x="31.0868" y="39.9673"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="15.0917" y="65.564"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="87.5502" y="67.7605"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="66"/>
				<Org x="45.7505" y="76.0239"/>
			</Via>
		</Vias>
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="88" y="20.48"/>
					<TrackLine>
						<End x="88" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="86.85" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="53.5" y="29"/>
					<TrackLine>
						<End x="53.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4311" y="27.58"/>
					</TrackLine>
					<TrackLine>
						<End x="56.9311" y="27.58"/>
					</TrackLine>
					<TrackLine>
						<End x="57.5689" y="27.58"/>
					</TrackLine>
					<TrackLine>
						<End x="58.7923" y="27.6444"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2056" y="28.0577"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2056" y="30.6263"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5534" y="31.4659"/>
					</TrackLine>
					<TrackLine>
						<End x="60.9341" y="32.8466"/>
					</TrackLine>
					<TrackLine>
						<End x="61.7191" y="33.4503"/>
					</TrackLine>
					<TrackLine>
						<End x="61.8043" y="33.5072"/>
					</TrackLine>
					<TrackLine>
						<End x="62.8252" y="33.93"/>
					</TrackLine>
					<TrackLine>
						<End x="62.9256" y="33.95"/>
					</TrackLine>
					<TrackLine>
						<End x="65.0744" y="33.95"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0744" y="33.95"/>
					</TrackLine>
					<TrackLine>
						<End x="76.193" y="33.861"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7751" y="33.45"/>
					</TrackLine>
					<TrackLine>
						<End x="78.779" y="33.4492"/>
					</TrackLine>
					<TrackLine>
						<End x="79.7088" y="33.0641"/>
					</TrackLine>
					<TrackLine>
						<End x="80.6775" y="32.6394"/>
					</TrackLine>
					<TrackLine>
						<End x="82.611" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="84.5446" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="85.5814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="53.5" y="29"/>
					<TrackLine>
						<End x="53.5" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5446" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="49.611" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6775" y="32.6394"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7088" y="33.0641"/>
					</TrackLine>
					<TrackLine>
						<End x="45.779" y="33.4492"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7751" y="33.45"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7249" y="33.45"/>
					</TrackLine>
					<TrackLine>
						<End x="43.721" y="33.4492"/>
					</TrackLine>
					<TrackLine>
						<End x="42.7912" y="33.0641"/>
					</TrackLine>
					<TrackLine>
						<End x="42.7879" y="33.0619"/>
					</TrackLine>
					<TrackLine>
						<End x="41.3381" y="31.6121"/>
					</TrackLine>
					<TrackLine>
						<End x="41.3359" y="31.6088"/>
					</TrackLine>
					<TrackLine>
						<End x="40.9508" y="30.679"/>
					</TrackLine>
					<TrackLine>
						<End x="40.95" y="30.6751"/>
					</TrackLine>
					<TrackLine>
						<End x="40.52" y="28.0311"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0689" y="27.58"/>
					</TrackLine>
					<TrackLine>
						<End x="39.4311" y="27.58"/>
					</TrackLine>
					<TrackLine>
						<End x="35.6811" y="27.58"/>
					</TrackLine>
					<TrackLine>
						<End x="34.75" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="34.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="56"/>
				<Subwire width="0.2">
					<Start x="34.75" y="47.7"/>
					<TrackLine>
						<End x="34.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="35.3754" y="45.4066"/>
					</TrackLine>
					<TrackLine>
						<End x="35.3979" y="45.3522"/>
					</TrackLine>
					<TrackLine>
						<End x="36.1777" y="44.5724"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1555" y="43.6978"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="55"/>
				<Subwire width="0.2">
					<Start x="36" y="47.7"/>
					<TrackLine>
						<End x="36" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="35.8754" y="46.334"/>
					</TrackLine>
					<TrackLine>
						<End x="35.8754" y="45.5818"/>
					</TrackLine>
					<TrackLine>
						<End x="36.4073" y="45.0499"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0478" y="44.9363"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="54"/>
				<Subwire width="0.2">
					<Start x="37.25" y="47.7"/>
					<TrackLine>
						<End x="37.25" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7834" y="45.9579"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="12.5" y="83.25"/>
					<TrackLine>
						<End x="12.5" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="11.5814" y="84.7"/>
					</TrackLine>
					<TrackLine>
						<End x="10.9186" y="84.7"/>
					</TrackLine>
					<TrackLine>
						<End x="10.45" y="84.2314"/>
					</TrackLine>
					<TrackLine>
						<End x="8.075" y="63.5997"/>
					</TrackLine>
					<TrackLine>
						<End x="8.075" y="61.9003"/>
					</TrackLine>
					<TrackLine>
						<End x="9.95" y="44.5701"/>
					</TrackLine>
					<TrackLine>
						<End x="9.9561" y="44.5554"/>
					</TrackLine>
					<TrackLine>
						<End x="10.7054" y="43.8061"/>
					</TrackLine>
					<TrackLine>
						<End x="19.861" y="37.3417"/>
					</TrackLine>
					<TrackLine>
						<End x="20.8917" y="36.311"/>
					</TrackLine>
					<TrackLine>
						<End x="25.2125" y="31.1813"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="63.4199" y="27.2565"/>
					<TrackLine>
						<End x="62.75" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="62.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="53"/>
				<Subwire width="0.2">
					<Start x="35.6826" y="43.573"/>
					<TrackLine>
						<End x="37.7794" y="42.7898"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5316" y="42.7898"/>
					</TrackLine>
					<TrackLine>
						<End x="39.0635" y="43.3217"/>
					</TrackLine>
					<TrackLine>
						<End x="39.0635" y="44.0739"/>
					</TrackLine>
					<TrackLine>
						<End x="38.9558" y="45.3124"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="32"/>
				<Subwire width="0.2">
					<Start x="77.84" y="17.84"/>
					<TrackLine>
						<End x="75.8446" y="19.1339"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8299" y="19.14"/>
					</TrackLine>
					<TrackLine>
						<End x="72.2837" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="69.7796" y="19.2667"/>
					</TrackLine>
					<TrackLine>
						<End x="69.1567" y="19.8896"/>
					</TrackLine>
					<TrackLine>
						<End x="69.1567" y="20.7704"/>
					</TrackLine>
					<TrackLine>
						<End x="69.1567" y="23.6104"/>
					</TrackLine>
					<TrackLine>
						<End x="69.7796" y="24.2333"/>
					</TrackLine>
					<TrackLine>
						<End x="71.0697" y="25.4337"/>
					</TrackLine>
					<TrackLine>
						<End x="72.0306" y="26.334"/>
					</TrackLine>
					<TrackLine>
						<End x="72.5625" y="26.8659"/>
					</TrackLine>
					<TrackLine>
						<End x="72.75" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="72.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="31"/>
				<Subwire width="0.2">
					<Start x="71.6545" y="27.242"/>
					<TrackLine>
						<End x="71.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="71.5" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="30"/>
				<Subwire width="0.2">
					<Start x="70.6936" y="26.3417"/>
					<TrackLine>
						<End x="70.25" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="70.25" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="29"/>
				<Subwire width="0.2">
					<Start x="70.22" y="17.84"/>
					<TrackLine>
						<End x="68.7763" y="19.6853"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7433" y="19.765"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7433" y="20.895"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7433" y="23.735"/>
					</TrackLine>
					<TrackLine>
						<End x="69" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="69" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="28"/>
				<Subwire width="0.2">
					<Start x="67.68" y="17.84"/>
					<TrackLine>
						<End x="66.53" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="66.53" y="20.8063"/>
					</TrackLine>
					<TrackLine>
						<End x="66.53" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="67.75" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="67.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="26"/>
				<Subwire width="0.2">
					<Start x="62.6" y="17.84"/>
					<TrackLine>
						<End x="63.6633" y="19.8896"/>
					</TrackLine>
					<TrackLine>
						<End x="63.6633" y="23.735"/>
					</TrackLine>
					<TrackLine>
						<End x="64.8279" y="26.7052"/>
					</TrackLine>
					<TrackLine>
						<End x="65.25" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="65.25" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="27"/>
				<Subwire width="0.2">
					<Start x="65.14" y="17.84"/>
					<TrackLine>
						<End x="64.0767" y="19.8896"/>
					</TrackLine>
					<TrackLine>
						<End x="64.0767" y="20.7704"/>
					</TrackLine>
					<TrackLine>
						<End x="64.0767" y="23.6104"/>
					</TrackLine>
					<TrackLine>
						<End x="66.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="66.5" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="25"/>
				<Subwire width="0.2">
					<Start x="60.06" y="17.84"/>
					<TrackLine>
						<End x="61.21" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="61.45" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="64.3279" y="26.8804"/>
					</TrackLine>
					<TrackLine>
						<End x="64.3279" y="27.6326"/>
					</TrackLine>
					<TrackLine>
						<End x="64" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="64" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="52"/>
				<Subwire width="0.2">
					<Start x="34.4228" y="43.3989"/>
					<TrackLine>
						<End x="35.3065" y="42.665"/>
					</TrackLine>
					<TrackLine>
						<End x="37.6042" y="42.2898"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7068" y="42.2898"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7612" y="42.3123"/>
					</TrackLine>
					<TrackLine>
						<End x="39.541" y="43.0921"/>
					</TrackLine>
					<TrackLine>
						<End x="39.5635" y="43.1465"/>
					</TrackLine>
					<TrackLine>
						<End x="39.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="39.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="51"/>
				<Subwire width="0.2">
					<Start x="33.9244" y="34.642"/>
					<TrackLine>
						<End x="38.5" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="37.25" y="29"/>
					<TrackLine>
						<End x="37.25" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6084" y="34.5761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="16.25" y="83.25"/>
					<TrackLine>
						<End x="16.25" y="82.6"/>
					</TrackLine>
					<TrackLine>
						<End x="10.85" y="68.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="9.575" y="63.3013"/>
					</TrackLine>
					<TrackLine>
						<End x="9.575" y="62.1987"/>
					</TrackLine>
					<TrackLine>
						<End x="12.4113" y="53.1551"/>
					</TrackLine>
					<TrackLine>
						<End x="12.4338" y="53.1007"/>
					</TrackLine>
					<TrackLine>
						<End x="13.6456" y="51.8524"/>
					</TrackLine>
					<TrackLine>
						<End x="15.1104" y="50.3876"/>
					</TrackLine>
					<TrackLine>
						<End x="15.1314" y="50.3736"/>
					</TrackLine>
					<TrackLine>
						<End x="19.5778" y="48.1178"/>
					</TrackLine>
					<TrackLine>
						<End x="25.729" y="42.0489"/>
					</TrackLine>
					<TrackLine>
						<End x="26.3347" y="41.798"/>
					</TrackLine>
					<TrackLine>
						<End x="31.0868" y="39.9673"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="53.5" y="47.7"/>
					<TrackLine>
						<End x="53.5" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9526" y="44.7258"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="16"/>
				<Subwire width="0.2">
					<Start x="37.2" y="15.3"/>
					<TrackLine>
						<End x="35.9315" y="17.3124"/>
					</TrackLine>
					<TrackLine>
						<End x="35.93" y="17.3161"/>
					</TrackLine>
					<TrackLine>
						<End x="35.93" y="18.3639"/>
					</TrackLine>
					<TrackLine>
						<End x="35.9285" y="18.3676"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1876" y="19.1085"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1839" y="19.11"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1837" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="33.51" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="33.27" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5963" y="24.32"/>
					</TrackLine>
					<TrackLine>
						<End x="26.7054" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="25.6686" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="25.2" y="28.0186"/>
					</TrackLine>
					<TrackLine>
						<End x="20.4678" y="36.0278"/>
					</TrackLine>
					<TrackLine>
						<End x="19.5778" y="36.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="10.4222" y="43.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="9.5322" y="44.2722"/>
					</TrackLine>
					<TrackLine>
						<End x="9.45" y="44.4707"/>
					</TrackLine>
					<TrackLine>
						<End x="7.575" y="61.8008"/>
					</TrackLine>
					<TrackLine>
						<End x="7.575" y="63.6992"/>
					</TrackLine>
					<TrackLine>
						<End x="9.95" y="84.4299"/>
					</TrackLine>
					<TrackLine>
						<End x="9.9561" y="84.4446"/>
					</TrackLine>
					<TrackLine>
						<End x="10.7054" y="85.1939"/>
					</TrackLine>
					<TrackLine>
						<End x="10.7201" y="85.2"/>
					</TrackLine>
					<TrackLine>
						<End x="11.7799" y="85.2"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0814" y="84.7"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="83.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="15"/>
				<Subwire width="0.2">
					<Start x="42.75" y="93.75"/>
					<TrackLine>
						<End x="42.75" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="41.3207" y="96.9066"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="14"/>
				<Subwire width="0.2">
					<Start x="42.0558" y="39.1189"/>
					<TrackLine>
						<End x="40.6858" y="38.9788"/>
					</TrackLine>
					<TrackLine>
						<End x="39.9336" y="38.9788"/>
					</TrackLine>
					<TrackLine>
						<End x="37.6008" y="41.0516"/>
					</TrackLine>
					<TrackLine>
						<End x="36.9951" y="41.3025"/>
					</TrackLine>
					<TrackLine>
						<End x="35.0318" y="41.665"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8715" y="41.9909"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8171" y="42.0134"/>
					</TrackLine>
					<TrackLine>
						<End x="33.0373" y="42.7932"/>
					</TrackLine>
					<TrackLine>
						<End x="31" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="31" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="82.75" y="47.7"/>
					<TrackLine>
						<End x="82.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8314" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7946" y="45.7561"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7799" y="45.75"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3793" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0932" y="45.1248"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0388" y="45.1023"/>
					</TrackLine>
					<TrackLine>
						<End x="66.2977" y="39.6231"/>
					</TrackLine>
					<TrackLine>
						<End x="66.2433" y="39.6006"/>
					</TrackLine>
					<TrackLine>
						<End x="65.1407" y="39.6006"/>
					</TrackLine>
					<TrackLine>
						<End x="55.735" y="40.1758"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6324" y="40.1758"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9141" y="38.964"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1984" y="37.6324"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="82.75" y="47.7"/>
					<TrackLine>
						<End x="82.75" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="82.75" y="49.975"/>
					</TrackLine>
					<TrackLine>
						<End x="82.75" y="50.625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="49.375" y="50.375"/>
					<TrackLine>
						<End x="49.75" y="50.375"/>
					</TrackLine>
					<TrackLine>
						<End x="49.75" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="49.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="49.375" y="50.375"/>
					<TrackLine>
						<End x="48.725" y="50.375"/>
					</TrackLine>
					<TrackLine>
						<End x="47.8564" y="51.175"/>
					</TrackLine>
					<TrackLine>
						<End x="45.5366" y="51.61"/>
					</TrackLine>
					<TrackLine>
						<End x="44.2111" y="51.61"/>
					</TrackLine>
					<TrackLine>
						<End x="44.1802" y="51.6161"/>
					</TrackLine>
					<TrackLine>
						<End x="43.2248" y="52.0119"/>
					</TrackLine>
					<TrackLine>
						<End x="36.8049" y="54.675"/>
					</TrackLine>
					<TrackLine>
						<End x="35.5049" y="54.675"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4451" y="54.675"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4304" y="54.6689"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0756" y="49.6646"/>
					</TrackLine>
					<TrackLine>
						<End x="25.4701" y="49.65"/>
					</TrackLine>
					<TrackLine>
						<End x="25.4554" y="49.6439"/>
					</TrackLine>
					<TrackLine>
						<End x="24.7061" y="48.8946"/>
					</TrackLine>
					<TrackLine>
						<End x="24.7" y="48.8799"/>
					</TrackLine>
					<TrackLine>
						<End x="24.7" y="47.5799"/>
					</TrackLine>
					<TrackLine>
						<End x="24.7" y="46.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="24.7061" y="46.5054"/>
					</TrackLine>
					<TrackLine>
						<End x="25.7989" y="44.1003"/>
					</TrackLine>
					<TrackLine>
						<End x="26.5787" y="43.3205"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6331" y="43.298"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7376" y="41.8753"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9758" y="41.7766"/>
					</TrackLine>
					<TrackLine>
						<End x="33.2506" y="41.1657"/>
					</TrackLine>
					<TrackLine>
						<End x="33.6725" y="40.9909"/>
					</TrackLine>
					<TrackLine>
						<End x="34.8329" y="40.665"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7962" y="40.3025"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0344" y="40.2038"/>
					</TrackLine>
					<TrackLine>
						<End x="39.4207" y="38.0775"/>
					</TrackLine>
					<TrackLine>
						<End x="41.0039" y="37.0843"/>
					</TrackLine>
					<TrackLine>
						<End x="41.7561" y="37.0843"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1984" y="37.6324"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="12"/>
				<Subwire width="0.2">
					<Start x="64" y="93.75"/>
					<TrackLine>
						<End x="64" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="64.9186" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="70.9701" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="72.0299" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5299" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="93.1814" y="94.8"/>
					</TrackLine>
					<TrackLine>
						<End x="93.65" y="94.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="93.8505" y="93.7894"/>
					</TrackLine>
					<TrackLine>
						<End x="94.558" y="91.6646"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="12"/>
				<Subwire width="0.2">
					<Start x="60.06" y="23.02"/>
					<TrackLine>
						<End x="60.06" y="22.87"/>
					</TrackLine>
					<TrackLine>
						<End x="58.91" y="21.1063"/>
					</TrackLine>
					<TrackLine>
						<End x="58.79" y="18.3639"/>
					</TrackLine>
					<TrackLine>
						<End x="58.79" y="17.3161"/>
					</TrackLine>
					<TrackLine>
						<End x="58.7915" y="17.3124"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5324" y="16.5715"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5361" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="63.1239" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="63.1276" y="16.5685"/>
					</TrackLine>
					<TrackLine>
						<End x="63.8685" y="15.8276"/>
					</TrackLine>
					<TrackLine>
						<End x="63.87" y="15.8239"/>
					</TrackLine>
					<TrackLine>
						<End x="63.87" y="14.7761"/>
					</TrackLine>
					<TrackLine>
						<End x="63.8715" y="14.7724"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6124" y="14.0315"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6161" y="14.03"/>
					</TrackLine>
					<TrackLine>
						<End x="67.1501" y="14"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8501" y="14"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9099" y="14"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9246" y="14.0061"/>
					</TrackLine>
					<TrackLine>
						<End x="91.0846" y="19.1861"/>
					</TrackLine>
					<TrackLine>
						<End x="91.8339" y="19.9354"/>
					</TrackLine>
					<TrackLine>
						<End x="91.84" y="19.9501"/>
					</TrackLine>
					<TrackLine>
						<End x="92.19" y="22.2705"/>
					</TrackLine>
					<TrackLine>
						<End x="92.8" y="27.8201"/>
					</TrackLine>
					<TrackLine>
						<End x="94.65" y="87.1207"/>
					</TrackLine>
					<TrackLine>
						<End x="94.65" y="88.3793"/>
					</TrackLine>
					<TrackLine>
						<End x="94.65" y="90.8793"/>
					</TrackLine>
					<TrackLine>
						<End x="94.558" y="91.6646"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="29.75" y="47.7"/>
					<TrackLine>
						<End x="29.75" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="30.6686" y="49.15"/>
					</TrackLine>
					<TrackLine>
						<End x="33.6804" y="51.5439"/>
					</TrackLine>
					<TrackLine>
						<End x="34.975" y="52.125"/>
					</TrackLine>
					<TrackLine>
						<End x="35.625" y="52.125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="81.5" y="47.7"/>
					<TrackLine>
						<End x="81.5" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5814" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2799" y="45.75"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9937" y="45.6248"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7555" y="45.5261"/>
					</TrackLine>
					<TrackLine>
						<End x="66.0681" y="40.1006"/>
					</TrackLine>
					<TrackLine>
						<End x="65.3159" y="40.1006"/>
					</TrackLine>
					<TrackLine>
						<End x="55.8345" y="40.6758"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5329" y="40.6758"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7389" y="39.464"/>
					</TrackLine>
					<TrackLine>
						<End x="42.8223" y="38.5404"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4319" y="38.2109"/>
					</TrackLine>
					<TrackLine>
						<End x="41.38" y="37.9923"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="46.875" y="50.375"/>
					<TrackLine>
						<End x="46.225" y="50.375"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3429" y="51.1425"/>
					</TrackLine>
					<TrackLine>
						<End x="44.165" y="51.1425"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0438" y="51.1666"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6064" y="54.175"/>
					</TrackLine>
					<TrackLine>
						<End x="35.3064" y="54.175"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6436" y="54.175"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9554" y="49.6439"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3052" y="49.1871"/>
					</TrackLine>
					<TrackLine>
						<End x="27.2508" y="49.1646"/>
					</TrackLine>
					<TrackLine>
						<End x="25.6686" y="49.15"/>
					</TrackLine>
					<TrackLine>
						<End x="25.2" y="48.6814"/>
					</TrackLine>
					<TrackLine>
						<End x="25.2" y="47.3814"/>
					</TrackLine>
					<TrackLine>
						<End x="25.2" y="46.7186"/>
					</TrackLine>
					<TrackLine>
						<End x="26.2764" y="44.3299"/>
					</TrackLine>
					<TrackLine>
						<End x="26.8083" y="43.798"/>
					</TrackLine>
					<TrackLine>
						<End x="27.5605" y="43.798"/>
					</TrackLine>
					<TrackLine>
						<End x="29.4796" y="44.7242"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="81.5" y="47.7"/>
					<TrackLine>
						<End x="81.5" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="80.875" y="49.975"/>
					</TrackLine>
					<TrackLine>
						<End x="80.875" y="50.625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="48.5" y="47.7"/>
					<TrackLine>
						<End x="48.5" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="47.525" y="50.375"/>
					</TrackLine>
					<TrackLine>
						<End x="46.875" y="50.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="29.4796" y="44.7242"/>
					<TrackLine>
						<End x="33.5338" y="41.5896"/>
					</TrackLine>
					<TrackLine>
						<End x="33.772" y="41.4909"/>
					</TrackLine>
					<TrackLine>
						<End x="34.9323" y="41.165"/>
					</TrackLine>
					<TrackLine>
						<End x="36.8957" y="40.8025"/>
					</TrackLine>
					<TrackLine>
						<End x="37.3176" y="40.6277"/>
					</TrackLine>
					<TrackLine>
						<End x="39.704" y="38.5013"/>
					</TrackLine>
					<TrackLine>
						<End x="39.7584" y="38.4788"/>
					</TrackLine>
					<TrackLine>
						<End x="41.38" y="37.9923"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="29.75" y="47.7"/>
					<TrackLine>
						<End x="29.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="29.4796" y="44.7242"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="52.25" y="47.7"/>
					<TrackLine>
						<End x="52.25" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6011" y="46.6611"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2899" y="46.35"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4654" y="46.0998"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9694" y="45.6038"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4148" y="44.9943"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="54.875" y="52.875"/>
					<TrackLine>
						<End x="54.875" y="52.225"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4524" y="50.9376"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9205" y="50.4057"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9205" y="49.6535"/>
					</TrackLine>
					<TrackLine>
						<End x="52.25" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="52.25" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="65.14" y="20.48"/>
					<TrackLine>
						<End x="65.14" y="20.33"/>
					</TrackLine>
					<TrackLine>
						<End x="66.4085" y="18.3676"/>
					</TrackLine>
					<TrackLine>
						<End x="66.41" y="18.3639"/>
					</TrackLine>
					<TrackLine>
						<End x="66.41" y="17.3161"/>
					</TrackLine>
					<TrackLine>
						<End x="66.4115" y="17.3124"/>
					</TrackLine>
					<TrackLine>
						<End x="67.1524" y="16.5715"/>
					</TrackLine>
					<TrackLine>
						<End x="67.1561" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8561" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9039" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="88.4763" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="89.15" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="89.27" y="21.0039"/>
					</TrackLine>
					<TrackLine>
						<End x="89.2715" y="21.0076"/>
					</TrackLine>
					<TrackLine>
						<End x="90.0124" y="21.7485"/>
					</TrackLine>
					<TrackLine>
						<End x="90.0161" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="91.0039" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="91.66" y="22.4061"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3" y="28.0186"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3" y="28.6814"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3" y="29.9814"/>
					</TrackLine>
					<TrackLine>
						<End x="91.8314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="80.3941" y="39.4892"/>
					</TrackLine>
					<TrackLine>
						<End x="76.3014" y="41.9152"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7695" y="42.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7695" y="43.1993"/>
					</TrackLine>
					<TrackLine>
						<End x="76.3014" y="43.7312"/>
					</TrackLine>
					<TrackLine>
						<End x="77.2684" y="44.6248"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4788" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8793" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3314" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="85.25" y="47.7"/>
					<TrackLine>
						<End x="85.25" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="50.1"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="50.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="49.4148" y="44.9943"/>
					<TrackLine>
						<End x="45.4701" y="45.75"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4554" y="45.7561"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4186" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0814" y="49.15"/>
					</TrackLine>
					<TrackLine>
						<End x="35.525" y="50.25"/>
					</TrackLine>
					<TrackLine>
						<End x="34.875" y="50.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="85.25" y="50.75"/>
					<TrackLine>
						<End x="85.25" y="51.4"/>
					</TrackLine>
					<TrackLine>
						<End x="83.554" y="53.3594"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0221" y="53.8913"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7529" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8358" y="54.55"/>
					</TrackLine>
					<TrackLine>
						<End x="74.25" y="55.1358"/>
					</TrackLine>
					<TrackLine>
						<End x="74.1789" y="55.6574"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0434" y="55.9845"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0549" y="56.973"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7278" y="57.1085"/>
					</TrackLine>
					<TrackLine>
						<End x="71.3298" y="57.1085"/>
					</TrackLine>
					<TrackLine>
						<End x="69.6302" y="57.1011"/>
					</TrackLine>
					<TrackLine>
						<End x="62.7888" y="54.828"/>
					</TrackLine>
					<TrackLine>
						<End x="62.7344" y="54.8055"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6418" y="54.3182"/>
					</TrackLine>
					<TrackLine>
						<End x="61.1099" y="53.7863"/>
					</TrackLine>
					<TrackLine>
						<End x="60.3224" y="52.0944"/>
					</TrackLine>
					<TrackLine>
						<End x="59.3" y="46.7186"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3606" y="43.9755"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1858" y="43.5536"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1248" y="42.4926"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7029" y="42.3178"/>
					</TrackLine>
					<TrackLine>
						<End x="54.364" y="41.6846"/>
					</TrackLine>
					<TrackLine>
						<End x="53.2614" y="41.6846"/>
					</TrackLine>
					<TrackLine>
						<End x="53.207" y="41.7071"/>
					</TrackLine>
					<TrackLine>
						<End x="50.304" y="43.129"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7721" y="43.6609"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4148" y="44.9943"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="34.875" y="50.25"/>
					<TrackLine>
						<End x="34.225" y="50.25"/>
					</TrackLine>
					<TrackLine>
						<End x="33.5" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="33.5" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="79" y="50.625"/>
					<TrackLine>
						<End x="79" y="49.975"/>
					</TrackLine>
					<TrackLine>
						<End x="79" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="79" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="27.25" y="47.7"/>
					<TrackLine>
						<End x="27.25" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="27.7116" y="46.7856"/>
					</TrackLine>
					<TrackLine>
						<End x="28.211" y="46.2862"/>
					</TrackLine>
					<TrackLine>
						<End x="28.211" y="45.58"/>
					</TrackLine>
					<TrackLine>
						<End x="27.7116" y="45.0806"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1844" y="44.706"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="79" y="47.7"/>
					<TrackLine>
						<End x="79" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0814" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="76.8942" y="46.1248"/>
					</TrackLine>
					<TrackLine>
						<End x="76.4723" y="45.95"/>
					</TrackLine>
					<TrackLine>
						<End x="65.692" y="41.0086"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="35.625" y="53.375"/>
					<TrackLine>
						<End x="34.975" y="53.375"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1686" y="49.15"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="44.375" y="50.375"/>
					<TrackLine>
						<End x="43.725" y="50.375"/>
					</TrackLine>
					<TrackLine>
						<End x="36.275" y="53.375"/>
					</TrackLine>
					<TrackLine>
						<End x="35.625" y="53.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="46" y="47.7"/>
					<TrackLine>
						<End x="46" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="45.025" y="50.375"/>
					</TrackLine>
					<TrackLine>
						<End x="44.375" y="50.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="77.75" y="29"/>
					<TrackLine>
						<End x="77.75" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4841" y="30.361"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="64.3314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="63.6686" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="62.4577" y="30.3556"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0444" y="29.9423"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0444" y="27.3737"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6966" y="26.5341"/>
					</TrackLine>
					<TrackLine>
						<End x="60.3159" y="25.1534"/>
					</TrackLine>
					<TrackLine>
						<End x="59.332" y="24.7055"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3548" y="24.3008"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3007" y="24.29"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1993" y="24.29"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6993" y="24.29"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6452" y="24.3008"/>
					</TrackLine>
					<TrackLine>
						<End x="52.471" y="24.5508"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9201" y="27.4024"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="77.75" y="29"/>
					<TrackLine>
						<End x="77.75" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="72.2837" y="24.32"/>
					</TrackLine>
					<TrackLine>
						<End x="71.61" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="71.37" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="70.22" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="70.22" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="44.9201" y="27.4024"/>
					<TrackLine>
						<End x="41.8779" y="24.7362"/>
					</TrackLine>
					<TrackLine>
						<End x="41.832" y="24.7055"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8548" y="24.3008"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8007" y="24.29"/>
					</TrackLine>
					<TrackLine>
						<End x="38.6993" y="24.29"/>
					</TrackLine>
					<TrackLine>
						<End x="34.9493" y="24.29"/>
					</TrackLine>
					<TrackLine>
						<End x="34.8952" y="24.3008"/>
					</TrackLine>
					<TrackLine>
						<End x="33.721" y="24.5508"/>
					</TrackLine>
					<TrackLine>
						<End x="32.7912" y="24.9359"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8225" y="25.3606"/>
					</TrackLine>
					<TrackLine>
						<End x="29.889" y="26.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9554" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="26" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="26" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="44.75" y="29"/>
					<TrackLine>
						<End x="44.75" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9201" y="27.4024"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="46" y="29"/>
					<TrackLine>
						<End x="46" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="46.9186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="47.9554" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="49.889" y="26.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="51.8225" y="25.3606"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5723" y="25.05"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7646" y="24.76"/>
					</TrackLine>
					<TrackLine>
						<End x="56.2646" y="24.76"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2354" y="24.76"/>
					</TrackLine>
					<TrackLine>
						<End x="59.3956" y="25.2111"/>
					</TrackLine>
					<TrackLine>
						<End x="60.0862" y="25.4971"/>
					</TrackLine>
					<TrackLine>
						<End x="61.3529" y="26.7638"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6389" y="27.4544"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6389" y="30.1102"/>
					</TrackLine>
					<TrackLine>
						<End x="62.2898" y="30.7611"/>
					</TrackLine>
					<TrackLine>
						<End x="63.4701" y="30.95"/>
					</TrackLine>
					<TrackLine>
						<End x="64.5299" y="30.95"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5299" y="30.95"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6593" y="30.861"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="79" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="79" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="79" y="29"/>
					<TrackLine>
						<End x="79" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8237" y="24.32"/>
					</TrackLine>
					<TrackLine>
						<End x="74.15" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="73.91" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="72.76" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="72.76" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="27.25" y="29"/>
					<TrackLine>
						<End x="27.25" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1686" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2054" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="31.139" y="26.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="33.0725" y="25.3606"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8223" y="25.05"/>
					</TrackLine>
					<TrackLine>
						<End x="35.0146" y="24.76"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7646" y="24.76"/>
					</TrackLine>
					<TrackLine>
						<End x="40.7354" y="24.76"/>
					</TrackLine>
					<TrackLine>
						<End x="41.5917" y="25.1147"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9853" y="26.5083"/>
					</TrackLine>
					<TrackLine>
						<End x="43.34" y="27.3646"/>
					</TrackLine>
					<TrackLine>
						<End x="43.95" y="29.9814"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4186" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="45.0814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="46" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="46" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="28.5" y="29"/>
					<TrackLine>
						<End x="28.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="29.4186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4554" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="32.389" y="26.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="33.3558" y="25.7845"/>
					</TrackLine>
					<TrackLine>
						<End x="33.9218" y="25.55"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1081" y="25.23"/>
					</TrackLine>
					<TrackLine>
						<End x="38.8581" y="25.23"/>
					</TrackLine>
					<TrackLine>
						<End x="40.6419" y="25.23"/>
					</TrackLine>
					<TrackLine>
						<End x="41.3255" y="25.5132"/>
					</TrackLine>
					<TrackLine>
						<End x="42.5868" y="26.7745"/>
					</TrackLine>
					<TrackLine>
						<End x="42.87" y="27.4581"/>
					</TrackLine>
					<TrackLine>
						<End x="43.45" y="30.1799"/>
					</TrackLine>
					<TrackLine>
						<End x="43.4561" y="30.1946"/>
					</TrackLine>
					<TrackLine>
						<End x="44.2054" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="44.2201" y="30.95"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2799" y="30.95"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2946" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="47.25" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="47.25" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="47.25" y="29"/>
					<TrackLine>
						<End x="47.25" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="48.1686" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2054" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="51.139" y="26.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1058" y="25.7845"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6718" y="25.55"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8581" y="25.23"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3581" y="25.23"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1419" y="25.23"/>
					</TrackLine>
					<TrackLine>
						<End x="59.315" y="25.6167"/>
					</TrackLine>
					<TrackLine>
						<End x="59.8565" y="25.841"/>
					</TrackLine>
					<TrackLine>
						<End x="61.009" y="26.9935"/>
					</TrackLine>
					<TrackLine>
						<End x="61.2333" y="27.535"/>
					</TrackLine>
					<TrackLine>
						<End x="61.2333" y="30.223"/>
					</TrackLine>
					<TrackLine>
						<End x="61.2724" y="30.3173"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0827" y="31.1276"/>
					</TrackLine>
					<TrackLine>
						<End x="62.177" y="31.1667"/>
					</TrackLine>
					<TrackLine>
						<End x="63.3707" y="31.45"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6293" y="31.45"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6293" y="31.45"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7588" y="31.361"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2799" y="30.95"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2946" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="79.3314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="80.25" y="29"/>
					<TrackLine>
						<End x="80.25" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="76.69" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="76.45" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="5"/>
				<Subwire width="0.2">
					<Start x="81.5" y="29"/>
					<TrackLine>
						<End x="81.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="79.23" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="78.99" y="22.3937"/>
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
				<LayerRef name="Top"/>
				<NetRef name="5"/>
				<Subwire width="0.2">
					<Start x="48.5" y="29"/>
					<TrackLine>
						<End x="48.5" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="46.5446" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="45.5778" y="31.3678"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3793" y="31.45"/>
					</TrackLine>
					<TrackLine>
						<End x="44.1207" y="31.45"/>
					</TrackLine>
					<TrackLine>
						<End x="43.9222" y="31.3678"/>
					</TrackLine>
					<TrackLine>
						<End x="43.0322" y="30.4778"/>
					</TrackLine>
					<TrackLine>
						<End x="42.95" y="30.2793"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4" y="27.5516"/>
					</TrackLine>
					<TrackLine>
						<End x="42.1884" y="27.0407"/>
					</TrackLine>
					<TrackLine>
						<End x="41.0593" y="25.9116"/>
					</TrackLine>
					<TrackLine>
						<End x="40.5484" y="25.7"/>
					</TrackLine>
					<TrackLine>
						<End x="38.9516" y="25.7"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2016" y="25.7"/>
					</TrackLine>
					<TrackLine>
						<End x="34.0212" y="26.05"/>
					</TrackLine>
					<TrackLine>
						<End x="33.639" y="26.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7054" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="30.6686" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="5"/>
				<Subwire width="0.2">
					<Start x="81.5" y="29"/>
					<TrackLine>
						<End x="81.5" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5446" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5778" y="31.3678"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3793" y="31.45"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8583" y="31.861"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7288" y="31.95"/>
					</TrackLine>
					<TrackLine>
						<End x="64.7288" y="31.95"/>
					</TrackLine>
					<TrackLine>
						<End x="63.2712" y="31.95"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0964" y="31.5722"/>
					</TrackLine>
					<TrackLine>
						<End x="61.853" y="31.4714"/>
					</TrackLine>
					<TrackLine>
						<End x="60.9286" y="30.547"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8278" y="30.3036"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8278" y="27.6157"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6652" y="27.2232"/>
					</TrackLine>
					<TrackLine>
						<End x="59.6268" y="26.1848"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2343" y="26.0222"/>
					</TrackLine>
					<TrackLine>
						<End x="58.0484" y="25.7"/>
					</TrackLine>
					<TrackLine>
						<End x="56.4516" y="25.7"/>
					</TrackLine>
					<TrackLine>
						<End x="53.9516" y="25.7"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7712" y="26.05"/>
					</TrackLine>
					<TrackLine>
						<End x="52.389" y="26.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4554" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="2"/>
				<Subwire width="0.2">
					<Start x="33.5" y="29"/>
					<TrackLine>
						<End x="33.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="35.4864" y="27.11"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2364" y="27.11"/>
					</TrackLine>
					<TrackLine>
						<End x="40.2636" y="27.11"/>
					</TrackLine>
					<TrackLine>
						<End x="40.99" y="27.8364"/>
					</TrackLine>
					<TrackLine>
						<End x="41.45" y="30.5777"/>
					</TrackLine>
					<TrackLine>
						<End x="41.7606" y="31.3275"/>
					</TrackLine>
					<TrackLine>
						<End x="43.0725" y="32.6394"/>
					</TrackLine>
					<TrackLine>
						<End x="43.8223" y="32.95"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6777" y="32.95"/>
					</TrackLine>
					<TrackLine>
						<End x="46.4275" y="32.6394"/>
					</TrackLine>
					<TrackLine>
						<End x="48.361" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2946" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="52.25" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="52.25" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="2"/>
				<Subwire width="0.2">
					<Start x="85.46" y="20.48"/>
					<TrackLine>
						<End x="85.46" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3967" y="22.4296"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3967" y="23.3104"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3967" y="23.6104"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="2"/>
				<Subwire width="0.2">
					<Start x="85.25" y="29"/>
					<TrackLine>
						<End x="85.25" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2946" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="81.361" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="79.4275" y="32.6394"/>
					</TrackLine>
					<TrackLine>
						<End x="78.6777" y="32.95"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1438" y="33.361"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0251" y="33.45"/>
					</TrackLine>
					<TrackLine>
						<End x="65.0251" y="33.45"/>
					</TrackLine>
					<TrackLine>
						<End x="62.9749" y="33.45"/>
					</TrackLine>
					<TrackLine>
						<End x="62.971" y="33.4492"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0412" y="33.0641"/>
					</TrackLine>
					<TrackLine>
						<End x="61.1638" y="32.5029"/>
					</TrackLine>
					<TrackLine>
						<End x="59.8971" y="31.2362"/>
					</TrackLine>
					<TrackLine>
						<End x="59.6111" y="30.5456"/>
					</TrackLine>
					<TrackLine>
						<End x="59.6111" y="27.8898"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9602" y="27.2389"/>
					</TrackLine>
					<TrackLine>
						<End x="57.7636" y="27.11"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7364" y="27.11"/>
					</TrackLine>
					<TrackLine>
						<End x="54.2364" y="27.11"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1686" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="52.25" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="52.25" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="32.25" y="29"/>
					<TrackLine>
						<End x="32.25" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="33.1686" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2054" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2201" y="27.05"/>
					</TrackLine>
					<TrackLine>
						<End x="35.3886" y="26.64"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1386" y="26.64"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3614" y="26.64"/>
					</TrackLine>
					<TrackLine>
						<End x="40.5268" y="26.7085"/>
					</TrackLine>
					<TrackLine>
						<End x="41.3915" y="27.5732"/>
					</TrackLine>
					<TrackLine>
						<End x="41.46" y="27.7386"/>
					</TrackLine>
					<TrackLine>
						<End x="41.95" y="30.4782"/>
					</TrackLine>
					<TrackLine>
						<End x="42.1845" y="31.0442"/>
					</TrackLine>
					<TrackLine>
						<End x="43.3558" y="32.2155"/>
					</TrackLine>
					<TrackLine>
						<End x="43.9218" y="32.45"/>
					</TrackLine>
					<TrackLine>
						<End x="45.5782" y="32.45"/>
					</TrackLine>
					<TrackLine>
						<End x="46.1442" y="32.2155"/>
					</TrackLine>
					<TrackLine>
						<End x="47.111" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0446" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="51" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="51" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="84" y="29"/>
					<TrackLine>
						<End x="84" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="83.9833" y="23.735"/>
					</TrackLine>
					<TrackLine>
						<End x="83.9833" y="22.4296"/>
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
				<LayerRef name="Top"/>
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="51" y="29"/>
					<TrackLine>
						<End x="51" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9554" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9701" y="27.05"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1386" y="26.64"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6386" y="26.64"/>
					</TrackLine>
					<TrackLine>
						<End x="57.8614" y="26.64"/>
					</TrackLine>
					<TrackLine>
						<End x="59.073" y="26.8333"/>
					</TrackLine>
					<TrackLine>
						<End x="59.1673" y="26.8724"/>
					</TrackLine>
					<TrackLine>
						<End x="59.9776" y="27.6827"/>
					</TrackLine>
					<TrackLine>
						<End x="60.0167" y="27.777"/>
					</TrackLine>
					<TrackLine>
						<End x="60.0167" y="30.465"/>
					</TrackLine>
					<TrackLine>
						<End x="60.241" y="31.0065"/>
					</TrackLine>
					<TrackLine>
						<End x="61.3935" y="32.159"/>
					</TrackLine>
					<TrackLine>
						<End x="62.3225" y="32.6394"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0723" y="32.95"/>
					</TrackLine>
					<TrackLine>
						<End x="64.9277" y="32.95"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9277" y="32.95"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0572" y="32.861"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5782" y="32.45"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1442" y="32.2155"/>
					</TrackLine>
					<TrackLine>
						<End x="80.111" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0446" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="84" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="84" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="4"/>
				<Subwire width="0.2">
					<Start x="49.75" y="29"/>
					<TrackLine>
						<End x="49.75" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6686" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7054" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6722" y="26.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8707" y="26.55"/>
					</TrackLine>
					<TrackLine>
						<End x="54.0451" y="26.17"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5451" y="26.17"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9549" y="26.17"/>
					</TrackLine>
					<TrackLine>
						<End x="59.1536" y="26.4278"/>
					</TrackLine>
					<TrackLine>
						<End x="59.397" y="26.5286"/>
					</TrackLine>
					<TrackLine>
						<End x="60.3214" y="27.453"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4222" y="27.6964"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4222" y="30.3843"/>
					</TrackLine>
					<TrackLine>
						<End x="60.5848" y="30.7768"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6232" y="31.8152"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0157" y="31.9778"/>
					</TrackLine>
					<TrackLine>
						<End x="63.1718" y="32.45"/>
					</TrackLine>
					<TrackLine>
						<End x="64.8282" y="32.45"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8282" y="32.45"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9577" y="32.361"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4788" y="31.95"/>
					</TrackLine>
					<TrackLine>
						<End x="78.861" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7946" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="82.75" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="82.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="4"/>
				<Subwire width="0.2">
					<Start x="31" y="29"/>
					<TrackLine>
						<End x="31" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="32.9554" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="33.9222" y="26.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1207" y="26.55"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2951" y="26.17"/>
					</TrackLine>
					<TrackLine>
						<End x="39.0451" y="26.17"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4549" y="26.17"/>
					</TrackLine>
					<TrackLine>
						<End x="40.793" y="26.3101"/>
					</TrackLine>
					<TrackLine>
						<End x="41.7899" y="27.307"/>
					</TrackLine>
					<TrackLine>
						<End x="41.93" y="27.6451"/>
					</TrackLine>
					<TrackLine>
						<End x="42.45" y="30.3788"/>
					</TrackLine>
					<TrackLine>
						<End x="42.6083" y="30.761"/>
					</TrackLine>
					<TrackLine>
						<End x="43.639" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0212" y="31.95"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4788" y="31.95"/>
					</TrackLine>
					<TrackLine>
						<End x="45.861" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="47.7946" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="49.75" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="49.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="4"/>
				<Subwire width="0.2">
					<Start x="82.75" y="29"/>
					<TrackLine>
						<End x="82.75" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="81.77" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="81.53" y="22.3937"/>
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
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="11.8" y="23.02"/>
					<TrackLine>
						<End x="11.8" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="11.125" y="29.2086"/>
					</TrackLine>
					<TrackLine>
						<End x="11.125" y="29.25"/>
					</TrackLine>
					<TrackLine>
						<End x="11.125" y="29.35"/>
					</TrackLine>
					<TrackLine>
						<End x="10.25" y="31"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="28.4894" y="78.2821"/>
					<TrackLine>
						<End x="26.4417" y="77.65"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9124" y="77.4308"/>
					</TrackLine>
					<TrackLine>
						<End x="25.1956" y="77.0069"/>
					</TrackLine>
					<TrackLine>
						<End x="24.4789" y="76.583"/>
					</TrackLine>
					<TrackLine>
						<End x="23.7529" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="22.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="22.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="39.75" y="29"/>
					<TrackLine>
						<End x="39.75" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8928" y="31.8457"/>
					</TrackLine>
					<TrackLine>
						<End x="40.9497" y="31.9309"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4691" y="33.4503"/>
					</TrackLine>
					<TrackLine>
						<End x="42.5543" y="33.5072"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5752" y="33.93"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6756" y="33.95"/>
					</TrackLine>
					<TrackLine>
						<End x="48.1914" y="34.7639"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1832" y="35.7533"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9354" y="35.7533"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2375" y="35.7225"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5636" y="35.5275"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3133" y="31.9867"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="58.3133" y="31.9867"/>
					<TrackLine>
						<End x="60.1571" y="33.8305"/>
					</TrackLine>
					<TrackLine>
						<End x="60.3224" y="33.941"/>
					</TrackLine>
					<TrackLine>
						<End x="61.4324" y="34.4007"/>
					</TrackLine>
					<TrackLine>
						<End x="65.792" y="35.4246"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="81" y="86.5"/>
					<TrackLine>
						<End x="81.65" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="83.8664" y="86.6036"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="91.5" y="29"/>
					<TrackLine>
						<End x="91.5" y="28.35"/>
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
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="71.875" y="89.5"/>
					<TrackLine>
						<End x="72.75" y="87.85"/>
					</TrackLine>
					<TrackLine>
						<End x="72.85" y="87.85"/>
					</TrackLine>
					<TrackLine>
						<End x="72.8914" y="87.85"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9843" y="87.35"/>
					</TrackLine>
					<TrackLine>
						<End x="80.35" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="72.75" y="93.75"/>
					<TrackLine>
						<End x="72.75" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="72.75" y="91.25"/>
					</TrackLine>
					<TrackLine>
						<End x="72.75" y="91.15"/>
					</TrackLine>
					<TrackLine>
						<End x="71.875" y="89.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="81.25" y="74"/>
					<TrackLine>
						<End x="81.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="83.312" y="76.8649"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="48.2495" y="87.1358"/>
					<TrackLine>
						<End x="48.2569" y="86.5142"/>
					</TrackLine>
					<TrackLine>
						<End x="48.849" y="83.9332"/>
					</TrackLine>
					<TrackLine>
						<End x="48.9391" y="83.7156"/>
					</TrackLine>
					<TrackLine>
						<End x="49.025" y="83.6298"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0418" y="83.5891"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1446" y="82.8212"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3152" y="82.4093"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4798" y="82.2268"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4984" y="82.182"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4984" y="81.7481"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7446" y="80.8629"/>
					</TrackLine>
					<TrackLine>
						<End x="51.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="51.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="58.5" y="29"/>
					<TrackLine>
						<End x="58.5" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3133" y="31.9867"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="61.2304" y="51.7183"/>
					<TrackLine>
						<End x="64" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="64" y="47.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="48.2495" y="87.1358"/>
					<TrackLine>
						<End x="45.4117" y="88.5426"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6595" y="88.5426"/>
					</TrackLine>
					<TrackLine>
						<End x="40.01" y="84.9063"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2578" y="84.9063"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0093" y="85.4625"/>
					</TrackLine>
					<TrackLine>
						<End x="36.775" y="85.6968"/>
					</TrackLine>
					<TrackLine>
						<End x="36.75" y="85.7279"/>
					</TrackLine>
					<TrackLine>
						<End x="36.75" y="87.2721"/>
					</TrackLine>
					<TrackLine>
						<End x="36.725" y="87.3032"/>
					</TrackLine>
					<TrackLine>
						<End x="36.4907" y="87.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="34.7407" y="87.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4093" y="87.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="34.175" y="87.3032"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7111" y="81.7328"/>
					</TrackLine>
					<TrackLine>
						<End x="30.9313" y="80.953"/>
					</TrackLine>
					<TrackLine>
						<End x="30.8769" y="80.9305"/>
					</TrackLine>
					<TrackLine>
						<End x="29.4692" y="80.6144"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="81.25" y="74"/>
					<TrackLine>
						<End x="81.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="81.0452" y="72.847"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5133" y="72.3151"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5133" y="71.5629"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5342" y="70.2182"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5342" y="69.466"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1293" y="67.4727"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="19.858" y="82.5912"/>
					<TrackLine>
						<End x="29.4692" y="80.6144"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="11.25" y="45.75"/>
					<TrackLine>
						<End x="11.25" y="45.1"/>
					</TrackLine>
					<TrackLine>
						<End x="12.1686" y="44.3"/>
					</TrackLine>
					<TrackLine>
						<End x="13.125" y="44.0165"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="18.75" y="83.25"/>
					<TrackLine>
						<End x="18.75" y="82.6"/>
					</TrackLine>
					<TrackLine>
						<End x="19.858" y="82.5912"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="51.25" y="74"/>
					<TrackLine>
						<End x="51.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4885" y="71.5425"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3898" y="71.3043"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8632" y="69.0263"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8632" y="67.7247"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4112" y="63.4042"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="74" y="29"/>
					<TrackLine>
						<End x="74" y="29.453"/>
					</TrackLine>
					<TrackLine>
						<End x="75.108" y="29.453"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="32.12" y="15.3"/>
					<TrackLine>
						<End x="16.4037" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="15.73" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="15.46" y="21.0939"/>
					</TrackLine>
					<TrackLine>
						<End x="14.8039" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="13.8761" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8" y="22.87"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="75.3149" y="68.8301"/>
					<TrackLine>
						<End x="77.7573" y="67.861"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1293" y="67.4727"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="48.2495" y="87.1358"/>
					<TrackLine>
						<End x="48.2569" y="87.2664"/>
					</TrackLine>
					<TrackLine>
						<End x="48.7888" y="87.7983"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7688" y="88.9037"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="60"/>
				<Subwire width="0.2">
					<Start x="34" y="93.75"/>
					<TrackLine>
						<End x="34" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="33.3488" y="92.0596"/>
					</TrackLine>
					<TrackLine>
						<End x="30.3256" y="82.3385"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="33"/>
				<Subwire width="0.2">
					<Start x="39" y="93.75"/>
					<TrackLine>
						<End x="39" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1202" y="91.8809"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="59"/>
				<Subwire width="0.2">
					<Start x="31.5" y="93.75"/>
					<TrackLine>
						<End x="31.5" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4236" y="88.0822"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="47"/>
				<Subwire width="0.2">
					<Start x="45.25" y="93.75"/>
					<TrackLine>
						<End x="45.25" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3314" y="92.1"/>
					</TrackLine>
					<TrackLine>
						<End x="43.3675" y="91.9099"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="46"/>
				<Subwire width="0.2">
					<Start x="44" y="93.75"/>
					<TrackLine>
						<End x="44" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5932" y="95.8019"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="45"/>
				<Subwire width="0.2">
					<Start x="46.5" y="93.75"/>
					<TrackLine>
						<End x="46.5" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3645" y="96.1289"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="44"/>
				<Subwire width="0.2">
					<Start x="49" y="93.75"/>
					<TrackLine>
						<End x="49" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4457" y="95.6127"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="43"/>
				<Subwire width="0.2">
					<Start x="50.25" y="93.75"/>
					<TrackLine>
						<End x="50.25" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8547" y="91.9955"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="42"/>
				<Subwire width="0.2">
					<Start x="51.5" y="93.75"/>
					<TrackLine>
						<End x="51.5" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7627" y="91.6194"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2308" y="91.0875"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1586" y="90.4377"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4064" y="90.4377"/>
					</TrackLine>
					<TrackLine>
						<End x="45.0436" y="91.0384"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="34"/>
				<Subwire width="0.2">
					<Start x="40.25" y="93.75"/>
					<TrackLine>
						<End x="40.25" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="39.9817" y="91.5241"/>
					</TrackLine>
					<TrackLine>
						<End x="39.477" y="91.0194"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7634" y="91.0194"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4936" y="91.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="37.748" y="91.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="37.5096" y="91.0491"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7836" y="91.0491"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6978" y="91.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="35.8304" y="91.5206"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="41"/>
				<Subwire width="0.2">
					<Start x="47.75" y="93.75"/>
					<TrackLine>
						<End x="47.75" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="48.7825" y="91.3457"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="40"/>
				<Subwire width="0.2">
					<Start x="35.25" y="93.75"/>
					<TrackLine>
						<End x="35.25" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6258" y="97.2695"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="39"/>
				<Subwire width="0.2">
					<Start x="32.75" y="93.75"/>
					<TrackLine>
						<End x="32.75" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="33.2997" y="97.0596"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="38"/>
				<Subwire width="0.2">
					<Start x="29" y="93.75"/>
					<TrackLine>
						<End x="29" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="31.5126" y="97.026"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="35"/>
				<Subwire width="0.2">
					<Start x="41.5" y="93.75"/>
					<TrackLine>
						<End x="41.5" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4267" y="91.3279"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6732" y="90.5744"/>
					</TrackLine>
					<TrackLine>
						<End x="39.653" y="90.566"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5874" y="90.566"/>
					</TrackLine>
					<TrackLine>
						<End x="38.2865" y="90.6125"/>
					</TrackLine>
					<TrackLine>
						<End x="37.9551" y="90.6125"/>
					</TrackLine>
					<TrackLine>
						<End x="37.6853" y="90.5808"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6079" y="90.5808"/>
					</TrackLine>
					<TrackLine>
						<End x="36.4907" y="90.6125"/>
					</TrackLine>
					<TrackLine>
						<End x="35.4543" y="90.6126"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2568" y="91.6835"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="117"/>
				<Subwire width="0.2">
					<Start x="18.75" y="94.45"/>
					<TrackLine>
						<End x="18.75" y="93.8"/>
					</TrackLine>
					<TrackLine>
						<End x="24.19" y="87.545"/>
					</TrackLine>
					<TrackLine>
						<End x="29.4176" y="81.9624"/>
					</TrackLine>
					<TrackLine>
						<End x="29.9495" y="81.4305"/>
					</TrackLine>
					<TrackLine>
						<End x="30.7017" y="81.4305"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2336" y="81.9624"/>
					</TrackLine>
					<TrackLine>
						<End x="33.675" y="87.5103"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2022" y="88.0375"/>
					</TrackLine>
					<TrackLine>
						<End x="34.9478" y="88.0375"/>
					</TrackLine>
					<TrackLine>
						<End x="35.0478" y="88.0375"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6771" y="87.9875"/>
					</TrackLine>
					<TrackLine>
						<End x="37.175" y="87.4896"/>
					</TrackLine>
					<TrackLine>
						<End x="37.175" y="87.1375"/>
					</TrackLine>
					<TrackLine>
						<End x="37.175" y="87.0375"/>
					</TrackLine>
					<TrackLine>
						<End x="38" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="117"/>
				<Subwire width="0.2">
					<Start x="38" y="86.5"/>
					<TrackLine>
						<End x="38.825" y="85.9625"/>
					</TrackLine>
					<TrackLine>
						<End x="38.925" y="85.9625"/>
					</TrackLine>
					<TrackLine>
						<End x="38.9664" y="85.9625"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6339" y="85.8143"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="36"/>
				<Subwire width="0.2">
					<Start x="37.75" y="93.75"/>
					<TrackLine>
						<End x="37.75" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="37.1466" y="91.9254"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="116"/>
				<Subwire width="0.2">
					<Start x="27.04" y="23.02"/>
					<TrackLine>
						<End x="27.04" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="20.0439" y="35.7446"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2946" y="36.4939"/>
					</TrackLine>
					<TrackLine>
						<End x="10.139" y="42.9583"/>
					</TrackLine>
					<TrackLine>
						<End x="9.1083" y="43.989"/>
					</TrackLine>
					<TrackLine>
						<End x="8.95" y="44.3712"/>
					</TrackLine>
					<TrackLine>
						<End x="7.075" y="61.7142"/>
					</TrackLine>
					<TrackLine>
						<End x="7.075" y="63.7858"/>
					</TrackLine>
					<TrackLine>
						<End x="10.45" y="95.4314"/>
					</TrackLine>
					<TrackLine>
						<End x="10.9186" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="30.9613" y="98.434"/>
					</TrackLine>
					<TrackLine>
						<End x="34.0745" y="98.6775"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1771" y="98.6775"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6408" y="98.1442"/>
					</TrackLine>
					<TrackLine>
						<End x="41.6968" y="97.8146"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8218" y="96.5207"/>
					</TrackLine>
					<TrackLine>
						<End x="51.8314" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="52.75" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="52.75" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="115"/>
				<Subwire width="0.2">
					<Start x="32.12" y="23.02"/>
					<TrackLine>
						<End x="32.12" y="22.87"/>
					</TrackLine>
					<TrackLine>
						<End x="30.0439" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="29.1161" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="26.5761" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="25.92" y="22.4061"/>
					</TrackLine>
					<TrackLine>
						<End x="25.65" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="19.55" y="35.5314"/>
					</TrackLine>
					<TrackLine>
						<End x="19.0814" y="36"/>
					</TrackLine>
					<TrackLine>
						<End x="9.8558" y="42.5345"/>
					</TrackLine>
					<TrackLine>
						<End x="8.6845" y="43.7058"/>
					</TrackLine>
					<TrackLine>
						<End x="8.45" y="44.2718"/>
					</TrackLine>
					<TrackLine>
						<End x="6.575" y="61.665"/>
					</TrackLine>
					<TrackLine>
						<End x="6.575" y="63.835"/>
					</TrackLine>
					<TrackLine>
						<End x="9.95" y="95.6299"/>
					</TrackLine>
					<TrackLine>
						<End x="9.9561" y="95.6446"/>
					</TrackLine>
					<TrackLine>
						<End x="10.7054" y="96.3939"/>
					</TrackLine>
					<TrackLine>
						<End x="10.7201" y="96.4"/>
					</TrackLine>
					<TrackLine>
						<End x="30.8618" y="98.934"/>
					</TrackLine>
					<TrackLine>
						<End x="33.975" y="99.1775"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2766" y="99.1775"/>
					</TrackLine>
					<TrackLine>
						<End x="39.816" y="98.6442"/>
					</TrackLine>
					<TrackLine>
						<End x="41.872" y="98.3146"/>
					</TrackLine>
					<TrackLine>
						<End x="48.997" y="97.0207"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0299" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0446" y="95.8939"/>
					</TrackLine>
					<TrackLine>
						<End x="53.0814" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="54" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="54" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="54.75" y="47.7"/>
					<TrackLine>
						<End x="54.75" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="54.2125" y="48.65"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7965" y="49.0659"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8285" y="50.0296"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="54.75" y="47.7"/>
					<TrackLine>
						<End x="54.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="55.6686" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="56.0391" y="45.942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="17.5" y="94.45"/>
					<TrackLine>
						<End x="17.5" y="95.1"/>
					</TrackLine>
					<TrackLine>
						<End x="18.4186" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="31.1365" y="97.934"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2497" y="98.1775"/>
					</TrackLine>
					<TrackLine>
						<End x="35.0019" y="98.1775"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2647" y="97.2362"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="56" y="47.7"/>
					<TrackLine>
						<End x="56" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3698" y="49.458"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="56" y="47.7"/>
					<TrackLine>
						<End x="56" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="56.4011" y="46.8159"/>
					</TrackLine>
					<TrackLine>
						<End x="56.913" y="46.304"/>
					</TrackLine>
					<TrackLine>
						<End x="56.913" y="45.58"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8606" y="44.3497"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3287" y="43.8178"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5765" y="43.8178"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9358" y="45.8531"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="112"/>
				<Subwire width="0.2">
					<Start x="61.5" y="93.75"/>
					<TrackLine>
						<End x="61.5" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="64.9604" y="84.4414"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="50.8162" y="45.253"/>
					<TrackLine>
						<End x="53.8127" y="43.0926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="57.25" y="47.7"/>
					<TrackLine>
						<End x="57.25" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="57.4471" y="46.4933"/>
					</TrackLine>
					<TrackLine>
						<End x="57.4471" y="45.3907"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3606" y="44.1745"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3381" y="44.1201"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5583" y="43.3403"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5039" y="43.3178"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8127" y="43.0926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="57.25" y="47.7"/>
					<TrackLine>
						<End x="57.25" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="57.7" y="51.3564"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4868" y="55.5026"/>
					</TrackLine>
					<TrackLine>
						<End x="60.7377" y="56.1083"/>
					</TrackLine>
					<TrackLine>
						<End x="62.15" y="60.6406"/>
					</TrackLine>
					<TrackLine>
						<End x="62.6748" y="70.156"/>
					</TrackLine>
					<TrackLine>
						<End x="62.6748" y="71.2586"/>
					</TrackLine>
					<TrackLine>
						<End x="60.7194" y="77.541"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="111"/>
				<Subwire width="0.2">
					<Start x="62.75" y="93.75"/>
					<TrackLine>
						<End x="62.75" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="65.75" y="97.3744"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="74" y="47.75"/>
					<TrackLine>
						<End x="74" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0814" y="49.2"/>
					</TrackLine>
					<TrackLine>
						<End x="72.639" y="49.508"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="48.25" y="74"/>
					<TrackLine>
						<End x="48.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6887" y="77.8331"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="20.5959" y="68.4541"/>
					<TrackLine>
						<End x="25.7528" y="68.6182"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4733" y="69.3387"/>
					</TrackLine>
					<TrackLine>
						<End x="26.55" y="70.118"/>
					</TrackLine>
					<TrackLine>
						<End x="26.8149" y="70.7575"/>
					</TrackLine>
					<TrackLine>
						<End x="28.0425" y="71.9851"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1689" y="72.1115"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8637" y="73.7029"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9181" y="73.7254"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6887" y="77.8331"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="72.0288" y="54.9584"/>
					<TrackLine>
						<End x="73.591" y="53.532"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0643" y="53.0587"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0643" y="52.3893"/>
					</TrackLine>
					<TrackLine>
						<End x="72.639" y="49.508"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="19.25" y="74"/>
					<TrackLine>
						<End x="19.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="19.5816" y="70.3455"/>
					</TrackLine>
					<TrackLine>
						<End x="19.7452" y="69.3011"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2771" y="68.7692"/>
					</TrackLine>
					<TrackLine>
						<End x="20.5959" y="68.4541"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="49.2835" y="60.4718"/>
					<TrackLine>
						<End x="49.2823" y="63.535"/>
					</TrackLine>
					<TrackLine>
						<End x="49.115" y="64.6745"/>
					</TrackLine>
					<TrackLine>
						<End x="48.3632" y="67.4263"/>
					</TrackLine>
					<TrackLine>
						<End x="48.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="48.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="77.0815" y="70.7188"/>
					<TrackLine>
						<End x="78.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="78.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="72.75" y="47.75"/>
					<TrackLine>
						<End x="72.75" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="72.2876" y="48.6596"/>
					</TrackLine>
					<TrackLine>
						<End x="71.7906" y="49.1566"/>
					</TrackLine>
					<TrackLine>
						<End x="71.7906" y="49.8594"/>
					</TrackLine>
					<TrackLine>
						<End x="72.4483" y="52.3898"/>
					</TrackLine>
					<TrackLine>
						<End x="72.4483" y="53.0592"/>
					</TrackLine>
					<TrackLine>
						<End x="71.975" y="53.5325"/>
					</TrackLine>
					<TrackLine>
						<End x="71.4883" y="53.6051"/>
					</TrackLine>
					<TrackLine>
						<End x="71.454" y="53.6193"/>
					</TrackLine>
					<TrackLine>
						<End x="71.0171" y="53.9414"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4799" y="54.1931"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="20.25" y="74"/>
					<TrackLine>
						<End x="20.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="20.0816" y="71.2729"/>
					</TrackLine>
					<TrackLine>
						<End x="20.0816" y="70.5207"/>
					</TrackLine>
					<TrackLine>
						<End x="20.6532" y="69.6772"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="79.25" y="74"/>
					<TrackLine>
						<End x="79.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="78.1334" y="68.769"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="72.75" y="47.75"/>
					<TrackLine>
						<End x="72.75" y="47.1"/>
					</TrackLine>
					<TrackLine>
						<End x="71.8314" y="46.3"/>
					</TrackLine>
					<TrackLine>
						<End x="70.7946" y="45.8061"/>
					</TrackLine>
					<TrackLine>
						<End x="70.7799" y="45.8"/>
					</TrackLine>
					<TrackLine>
						<End x="68.3086" y="45.392"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="20.6532" y="69.6772"/>
					<TrackLine>
						<End x="24.9042" y="69.0291"/>
					</TrackLine>
					<TrackLine>
						<End x="25.5826" y="69.0291"/>
					</TrackLine>
					<TrackLine>
						<End x="26.0624" y="69.5089"/>
					</TrackLine>
					<TrackLine>
						<End x="26.15" y="70.1976"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4758" y="70.9841"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8159" y="72.3242"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9423" y="72.4506"/>
					</TrackLine>
					<TrackLine>
						<End x="31.5804" y="74.1267"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8186" y="74.2254"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3126" y="78.7411"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8463" y="78.7415"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="50.3961" y="61.1268"/>
					<TrackLine>
						<End x="49.8127" y="61.9935"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7823" y="63.6344"/>
					</TrackLine>
					<TrackLine>
						<End x="49.615" y="64.774"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8632" y="67.5258"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8632" y="69.2252"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="49.25" y="74"/>
					<TrackLine>
						<End x="49.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8463" y="78.7415"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="71.5" y="47.75"/>
					<TrackLine>
						<End x="71.5" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="71.2535" y="48.9023"/>
					</TrackLine>
					<TrackLine>
						<End x="71.231" y="48.9567"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4114" y="52.5559"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="50.25" y="74"/>
					<TrackLine>
						<End x="50.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2446" y="80.6877"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0115" y="81.6512"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0115" y="82.0065"/>
					</TrackLine>
					<TrackLine>
						<End x="48.897" y="82.1298"/>
					</TrackLine>
					<TrackLine>
						<End x="48.6513" y="82.7231"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5605" y="83.4136"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5311" y="83.443"/>
					</TrackLine>
					<TrackLine>
						<End x="46.927" y="85.8645"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3951" y="86.3964"/>
					</TrackLine>
					<TrackLine>
						<End x="45.0356" y="87.6346"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="20.9896" y="70.8968"/>
					<TrackLine>
						<End x="21.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="80.25" y="74"/>
					<TrackLine>
						<End x="80.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0358" y="72.5447"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0133" y="72.4903"/>
					</TrackLine>
					<TrackLine>
						<End x="79.6262" y="69.8421"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="71.5" y="47.75"/>
					<TrackLine>
						<End x="71.5" y="47.1"/>
					</TrackLine>
					<TrackLine>
						<End x="70.5814" y="46.3"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9325" y="46.3"/>
					</TrackLine>
					<TrackLine>
						<End x="65.875" y="46.0165"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="21.25" y="74"/>
					<TrackLine>
						<End x="21.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="21.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="22.7529" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="23.4789" y="76.583"/>
					</TrackLine>
					<TrackLine>
						<End x="24.1956" y="77.0069"/>
					</TrackLine>
					<TrackLine>
						<End x="25.6292" y="77.8547"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1133" y="79.1901"/>
					</TrackLine>
					<TrackLine>
						<End x="30.0205" y="79.2064"/>
					</TrackLine>
					<TrackLine>
						<End x="30.0749" y="79.2289"/>
					</TrackLine>
					<TrackLine>
						<End x="40.2396" y="84.4288"/>
					</TrackLine>
					<TrackLine>
						<End x="45.0356" y="87.6346"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="50.7207" y="62.3696"/>
					<TrackLine>
						<End x="50.5032" y="63.0281"/>
					</TrackLine>
					<TrackLine>
						<End x="50.115" y="64.8734"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3632" y="67.6252"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3632" y="69.1258"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="52.25" y="74"/>
					<TrackLine>
						<End x="52.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9854" y="81.8449"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9854" y="82.2788"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8927" y="82.5026"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7334" y="82.6886"/>
					</TrackLine>
					<TrackLine>
						<End x="49.6378" y="82.9193"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5232" y="83.6849"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4331" y="83.9025"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3472" y="83.9883"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3304" y="84.029"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0584" y="85.415"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0584" y="86.1672"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1649" y="86.8903"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="23.25" y="74"/>
					<TrackLine>
						<End x="23.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="23.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="24.7529" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="25.4789" y="76.583"/>
					</TrackLine>
					<TrackLine>
						<End x="26.1956" y="77.0069"/>
					</TrackLine>
					<TrackLine>
						<End x="26.5411" y="77.15"/>
					</TrackLine>
					<TrackLine>
						<End x="28.8655" y="77.3741"/>
					</TrackLine>
					<TrackLine>
						<End x="45.0317" y="86.3859"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="70.25" y="47.75"/>
					<TrackLine>
						<End x="70.25" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="66.7679" y="51.671"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="71.6403" y="52.7245"/>
					<TrackLine>
						<End x="70.7505" y="53.3745"/>
					</TrackLine>
					<TrackLine>
						<End x="70.0723" y="53.3745"/>
					</TrackLine>
					<TrackLine>
						<End x="66.7679" y="51.671"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="22.1818" y="71.9901"/>
					<TrackLine>
						<End x="23.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="23.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="82.25" y="74"/>
					<TrackLine>
						<End x="82.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="82.8504" y="70.9991"/>
					</TrackLine>
					<TrackLine>
						<End x="82.8504" y="70.2469"/>
					</TrackLine>
					<TrackLine>
						<End x="82.1203" y="68.9202"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0978" y="68.8658"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0445" y="67.1711"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0373" y="66.8219"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9922" y="65.2624"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9922" y="63.9608"/>
					</TrackLine>
					<TrackLine>
						<End x="82.053" y="62.6085"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="52.25" y="74"/>
					<TrackLine>
						<End x="52.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9123" y="71.2592"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8898" y="71.2048"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3632" y="68.9268"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3632" y="67.8242"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3857" y="67.7698"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2498" y="63.7516"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2498" y="63.0568"/>
					</TrackLine>
					<TrackLine>
						<End x="51.8408" y="62.131"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4314" y="61.1424"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4182" y="61.0763"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4182" y="59.182"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="23.7978" y="72.0764"/>
					<TrackLine>
						<End x="24.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="24.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="83.25" y="74"/>
					<TrackLine>
						<End x="83.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="83.3504" y="71.1743"/>
					</TrackLine>
					<TrackLine>
						<End x="83.3504" y="70.0717"/>
					</TrackLine>
					<TrackLine>
						<End x="83.3279" y="70.0173"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5978" y="68.6906"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5445" y="67.0716"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5373" y="66.7224"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4922" y="65.1629"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4922" y="64.0603"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5147" y="64.0059"/>
					</TrackLine>
					<TrackLine>
						<End x="82.961" y="62.9846"/>
					</TrackLine>
					<TrackLine>
						<End x="82.961" y="62.2324"/>
					</TrackLine>
					<TrackLine>
						<End x="82.8596" y="61.2902"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="53.25" y="74"/>
					<TrackLine>
						<End x="53.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4723" y="81.9418"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4723" y="82.3757"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3055" y="82.7784"/>
					</TrackLine>
					<TrackLine>
						<End x="50.1515" y="82.968"/>
					</TrackLine>
					<TrackLine>
						<End x="50.131" y="83.0174"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0045" y="83.7806"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8411" y="84.1751"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8117" y="84.2045"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8117" y="84.9413"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9664" y="85.7911"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="24.25" y="74"/>
					<TrackLine>
						<End x="24.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="24.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="25.7529" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4789" y="76.583"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6406" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="29.0407" y="76.8741"/>
					</TrackLine>
					<TrackLine>
						<End x="29.0951" y="76.8966"/>
					</TrackLine>
					<TrackLine>
						<End x="46.019" y="85.4884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="53.25" y="74"/>
					<TrackLine>
						<End x="53.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5786" y="72.8556"/>
					</TrackLine>
					<TrackLine>
						<End x="53.9964" y="72.4378"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5362" y="72.129"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3036" y="71.3616"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3194" y="71.3234"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3619" y="70.2561"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3619" y="68.5607"/>
					</TrackLine>
					<TrackLine>
						<End x="55.35" y="68.1578"/>
					</TrackLine>
					<TrackLine>
						<End x="55.35" y="66.3422"/>
					</TrackLine>
					<TrackLine>
						<End x="55.6942" y="64.4769"/>
					</TrackLine>
					<TrackLine>
						<End x="55.6942" y="62.3315"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5406" y="60.0194"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="73.2563" y="52.724"/>
					<TrackLine>
						<End x="72.9207" y="53.2601"/>
					</TrackLine>
					<TrackLine>
						<End x="72.1759" y="54.0049"/>
					</TrackLine>
					<TrackLine>
						<End x="72.167" y="54.0086"/>
					</TrackLine>
					<TrackLine>
						<End x="71.6899" y="54.1402"/>
					</TrackLine>
					<TrackLine>
						<End x="70.8188" y="55.0113"/>
					</TrackLine>
					<TrackLine>
						<End x="70.141" y="55.0113"/>
					</TrackLine>
					<TrackLine>
						<End x="65.7094" y="52.3862"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="69" y="47.75"/>
					<TrackLine>
						<End x="69" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="66.3918" y="50.763"/>
					</TrackLine>
					<TrackLine>
						<End x="65.8599" y="51.2949"/>
					</TrackLine>
					<TrackLine>
						<End x="65.7094" y="52.3862"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="64.5823" y="53.0094"/>
					<TrackLine>
						<End x="64.8014" y="52.0101"/>
					</TrackLine>
					<TrackLine>
						<End x="65.3824" y="51.0653"/>
					</TrackLine>
					<TrackLine>
						<End x="67.75" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="67.75" y="47.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="54.25" y="74"/>
					<TrackLine>
						<End x="54.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9779" y="81.9938"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9593" y="82.0386"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9593" y="82.4725"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7183" y="83.0543"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6243" y="83.1928"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6243" y="83.9394"/>
					</TrackLine>
					<TrackLine>
						<End x="50.701" y="84.5729"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="44.6286" y="81.221"/>
					<TrackLine>
						<End x="41.3151" y="80.5204"/>
					</TrackLine>
					<TrackLine>
						<End x="29.1402" y="76.3741"/>
					</TrackLine>
					<TrackLine>
						<End x="26.7529" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="25.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="25.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="44.6286" y="81.221"/>
					<TrackLine>
						<End x="47.6712" y="83.0452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="84.25" y="74"/>
					<TrackLine>
						<End x="84.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="84.4138" y="68.6906"/>
					</TrackLine>
					<TrackLine>
						<End x="84.4138" y="67.9384"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5445" y="66.7969"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5445" y="66.0447"/>
					</TrackLine>
					<TrackLine>
						<End x="83.9002" y="64.6116"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="56.515" y="59.1562"/>
					<TrackLine>
						<End x="56.3488" y="60.3542"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1731" y="61.5059"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1248" y="64.5193"/>
					</TrackLine>
					<TrackLine>
						<End x="55.85" y="66.4417"/>
					</TrackLine>
					<TrackLine>
						<End x="55.85" y="68.0583"/>
					</TrackLine>
					<TrackLine>
						<End x="55.8599" y="68.4616"/>
					</TrackLine>
					<TrackLine>
						<End x="55.8599" y="70.3552"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7973" y="71.4185"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7087" y="71.6323"/>
					</TrackLine>
					<TrackLine>
						<End x="54.8069" y="72.5341"/>
					</TrackLine>
					<TrackLine>
						<End x="54.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="54.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="25.25" y="74"/>
					<TrackLine>
						<End x="25.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="25.0054" y="72.6477"/>
					</TrackLine>
					<TrackLine>
						<End x="24.9829" y="72.5933"/>
					</TrackLine>
					<TrackLine>
						<End x="24.7058" y="71.7003"/>
					</TrackLine>
					<TrackLine>
						<End x="23.968" y="70.8586"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="76.0261" y="51.565"/>
					<TrackLine>
						<End x="74.4643" y="53.2244"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1931" y="54.4956"/>
					</TrackLine>
					<TrackLine>
						<End x="73.05" y="54.8411"/>
					</TrackLine>
					<TrackLine>
						<End x="72.8723" y="55.3078"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3782" y="55.8019"/>
					</TrackLine>
					<TrackLine>
						<End x="71.6794" y="55.8019"/>
					</TrackLine>
					<TrackLine>
						<End x="69.9286" y="55.6011"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8742" y="55.5786"/>
					</TrackLine>
					<TrackLine>
						<End x="64.5823" y="53.0094"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="85.25" y="74"/>
					<TrackLine>
						<End x="85.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="85.0456" y="72.3996"/>
					</TrackLine>
					<TrackLine>
						<End x="85.0456" y="71.297"/>
					</TrackLine>
					<TrackLine>
						<End x="85.2848" y="67.0386"/>
					</TrackLine>
					<TrackLine>
						<End x="85.3248" y="66.7821"/>
					</TrackLine>
					<TrackLine>
						<End x="85.3248" y="66.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="85.3082" y="64.0603"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8138" y="61.6569"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8138" y="60.9047"/>
					</TrackLine>
					<TrackLine>
						<End x="85.0805" y="59.3996"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="26.25" y="74"/>
					<TrackLine>
						<End x="26.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2397" y="75.8741"/>
					</TrackLine>
					<TrackLine>
						<End x="41.4903" y="80.0204"/>
					</TrackLine>
					<TrackLine>
						<End x="42.2425" y="80.0204"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1793" y="79.8037"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="77.3452" y="51.4207"/>
					<TrackLine>
						<End x="76.9341" y="51.9411"/>
					</TrackLine>
					<TrackLine>
						<End x="76.4022" y="52.473"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4222" y="53.8322"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5322" y="54.7222"/>
					</TrackLine>
					<TrackLine>
						<End x="73.45" y="54.9207"/>
					</TrackLine>
					<TrackLine>
						<End x="73.3079" y="55.4841"/>
					</TrackLine>
					<TrackLine>
						<End x="73.305" y="55.4911"/>
					</TrackLine>
					<TrackLine>
						<End x="72.5615" y="56.2346"/>
					</TrackLine>
					<TrackLine>
						<End x="72.5545" y="56.2375"/>
					</TrackLine>
					<TrackLine>
						<End x="71.5031" y="56.2375"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8291" y="56.1011"/>
					</TrackLine>
					<TrackLine>
						<End x="64.2062" y="53.9174"/>
					</TrackLine>
					<TrackLine>
						<End x="63.3401" y="53.42"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="25.2434" y="69.8481"/>
					<TrackLine>
						<End x="25.2434" y="70.325"/>
					</TrackLine>
					<TrackLine>
						<End x="25.5271" y="72.3998"/>
					</TrackLine>
					<TrackLine>
						<End x="26.0331" y="72.9058"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="66.5" y="47.75"/>
					<TrackLine>
						<End x="66.5" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="63.6743" y="52.6333"/>
					</TrackLine>
					<TrackLine>
						<End x="63.3401" y="53.42"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="55.25" y="74"/>
					<TrackLine>
						<End x="55.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4462" y="82.2141"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4462" y="82.9555"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5255" y="83.5661"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="43.1793" y="79.8037"/>
					<TrackLine>
						<End x="45.0047" y="80.313"/>
					</TrackLine>
					<TrackLine>
						<End x="48.1165" y="81.6358"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="57.6363" y="58.2671"/>
					<TrackLine>
						<End x="57.423" y="59.5323"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8644" y="60.3332"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8503" y="60.3672"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7491" y="60.6205"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6085" y="61.5925"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5554" y="64.5617"/>
					</TrackLine>
					<TrackLine>
						<End x="56.35" y="66.5411"/>
					</TrackLine>
					<TrackLine>
						<End x="56.35" y="67.9589"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3579" y="68.374"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3579" y="70.4428"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3567" y="71.5297"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1829" y="71.9492"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="26.3909" y="72.042"/>
					<TrackLine>
						<End x="27.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="65.25" y="47.75"/>
					<TrackLine>
						<End x="65.25" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0179" y="53.4102"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="27.25" y="74"/>
					<TrackLine>
						<End x="27.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="29.3391" y="75.3741"/>
					</TrackLine>
					<TrackLine>
						<End x="41.8664" y="79.1124"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="82.646" y="52.9833"/>
					<TrackLine>
						<End x="75.6406" y="53.85"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7002" y="54.15"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6488" y="54.1713"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8713" y="54.9488"/>
					</TrackLine>
					<TrackLine>
						<End x="73.85" y="55.0002"/>
					</TrackLine>
					<TrackLine>
						<End x="73.7434" y="55.5707"/>
					</TrackLine>
					<TrackLine>
						<End x="73.6742" y="55.7378"/>
					</TrackLine>
					<TrackLine>
						<End x="72.8082" y="56.6038"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6411" y="56.673"/>
					</TrackLine>
					<TrackLine>
						<End x="71.4165" y="56.673"/>
					</TrackLine>
					<TrackLine>
						<End x="69.7296" y="56.6011"/>
					</TrackLine>
					<TrackLine>
						<End x="62.964" y="54.328"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0179" y="53.4102"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="52.3412" y="82.5848"/>
					<TrackLine>
						<End x="56.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="56.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="86.25" y="74"/>
					<TrackLine>
						<End x="86.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="85.5456" y="72.2244"/>
					</TrackLine>
					<TrackLine>
						<End x="85.5456" y="71.4722"/>
					</TrackLine>
					<TrackLine>
						<End x="85.7492" y="67.131"/>
					</TrackLine>
					<TrackLine>
						<End x="85.7892" y="66.958"/>
					</TrackLine>
					<TrackLine>
						<End x="85.8082" y="65.2624"/>
					</TrackLine>
					<TrackLine>
						<End x="85.8082" y="63.9608"/>
					</TrackLine>
					<TrackLine>
						<End x="85.7218" y="61.2808"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="48.3366" y="80.3116"/>
					<TrackLine>
						<End x="43.5554" y="78.8957"/>
					</TrackLine>
					<TrackLine>
						<End x="42.8032" y="78.8957"/>
					</TrackLine>
					<TrackLine>
						<End x="41.8664" y="79.1124"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="57.8297" y="56.958"/>
					<TrackLine>
						<End x="58.5443" y="57.891"/>
					</TrackLine>
					<TrackLine>
						<End x="58.5443" y="58.6432"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9005" y="59.7619"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1804" y="60.6548"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1607" y="60.7024"/>
					</TrackLine>
					<TrackLine>
						<End x="57.0438" y="61.6791"/>
					</TrackLine>
					<TrackLine>
						<End x="56.9859" y="64.6041"/>
					</TrackLine>
					<TrackLine>
						<End x="56.85" y="66.6406"/>
					</TrackLine>
					<TrackLine>
						<End x="56.85" y="67.8594"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8559" y="68.3249"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8559" y="70.4919"/>
					</TrackLine>
					<TrackLine>
						<End x="56.855" y="71.6288"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6054" y="72.2315"/>
					</TrackLine>
					<TrackLine>
						<End x="56.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="56.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="45.6458" y="59.264"/>
					<TrackLine>
						<End x="44.8681" y="58.2482"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="17.6404" y="63.5698"/>
					<TrackLine>
						<End x="18.5873" y="64.496"/>
					</TrackLine>
					<TrackLine>
						<End x="18.7752" y="64.4959"/>
					</TrackLine>
					<TrackLine>
						<End x="20.9736" y="64.8258"/>
					</TrackLine>
					<TrackLine>
						<End x="26.168" y="66.5634"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9122" y="66.8716"/>
					</TrackLine>
					<TrackLine>
						<End x="28.2199" y="68.1793"/>
					</TrackLine>
					<TrackLine>
						<End x="28.5281" y="68.9235"/>
					</TrackLine>
					<TrackLine>
						<End x="28.55" y="69.6642"/>
					</TrackLine>
					<TrackLine>
						<End x="29.1358" y="70.25"/>
					</TrackLine>
					<TrackLine>
						<End x="29.3041" y="70.3528"/>
					</TrackLine>
					<TrackLine>
						<End x="30.9597" y="70.4338"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9403" y="70.4338"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6338" y="69.7403"/>
					</TrackLine>
					<TrackLine>
						<End x="36.9282" y="62.2668"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5692" y="59.9124"/>
					</TrackLine>
					<TrackLine>
						<End x="39.7124" y="58.7692"/>
					</TrackLine>
					<TrackLine>
						<End x="40.2417" y="58.55"/>
					</TrackLine>
					<TrackLine>
						<End x="44.8681" y="58.2482"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="66.4378" y="72.3399"/>
					<TrackLine>
						<End x="66.352" y="73.0519"/>
					</TrackLine>
					<TrackLine>
						<End x="65.8684" y="84.8175"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6123" y="89.6055"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6123" y="90.3577"/>
					</TrackLine>
					<TrackLine>
						<End x="65.0844" y="91.3702"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="17.1414" y="53.8834"/>
					<TrackLine>
						<End x="16.4764" y="55.1618"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="44.8681" y="58.2482"/>
					<TrackLine>
						<End x="45.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="45.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="75.25" y="56.5"/>
					<TrackLine>
						<End x="75.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="70.2789" y="59.617"/>
					</TrackLine>
					<TrackLine>
						<End x="69.417" y="60.4789"/>
					</TrackLine>
					<TrackLine>
						<End x="67.7498" y="63.5778"/>
					</TrackLine>
					<TrackLine>
						<End x="67.575" y="63.9997"/>
					</TrackLine>
					<TrackLine>
						<End x="66.4378" y="72.3399"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="16.25" y="56.5"/>
					<TrackLine>
						<End x="16.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="17.6404" y="63.5698"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="46.25" y="56.5"/>
					<TrackLine>
						<End x="46.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="45.5265" y="54.8825"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9735" y="54.8825"/>
					</TrackLine>
					<TrackLine>
						<End x="44.5825" y="55.2735"/>
					</TrackLine>
					<TrackLine>
						<End x="44.55" y="56.6171"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0181" y="57.149"/>
					</TrackLine>
					<TrackLine>
						<End x="40.1422" y="58.05"/>
					</TrackLine>
					<TrackLine>
						<End x="39.4292" y="58.3453"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1453" y="59.6292"/>
					</TrackLine>
					<TrackLine>
						<End x="36.5043" y="61.9836"/>
					</TrackLine>
					<TrackLine>
						<End x="32.1419" y="69.5366"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7366" y="69.9419"/>
					</TrackLine>
					<TrackLine>
						<End x="31.1634" y="69.9419"/>
					</TrackLine>
					<TrackLine>
						<End x="29.4911" y="69.9014"/>
					</TrackLine>
					<TrackLine>
						<End x="29.3015" y="69.85"/>
					</TrackLine>
					<TrackLine>
						<End x="28.95" y="69.4985"/>
					</TrackLine>
					<TrackLine>
						<End x="28.939" y="68.8417"/>
					</TrackLine>
					<TrackLine>
						<End x="28.5682" y="67.9465"/>
					</TrackLine>
					<TrackLine>
						<End x="27.145" y="66.5233"/>
					</TrackLine>
					<TrackLine>
						<End x="26.2498" y="66.1525"/>
					</TrackLine>
					<TrackLine>
						<End x="21.073" y="64.3258"/>
					</TrackLine>
					<TrackLine>
						<End x="18.962" y="63.5915"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="65.5203" y="89.9816"/>
					<TrackLine>
						<End x="66.3684" y="84.9927"/>
					</TrackLine>
					<TrackLine>
						<End x="67.1695" y="74.1191"/>
					</TrackLine>
					<TrackLine>
						<End x="67.26" y="73.428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="46.25" y="56.5"/>
					<TrackLine>
						<End x="46.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="46.4569" y="58.928"/>
					</TrackLine>
					<TrackLine>
						<End x="46.4569" y="59.6"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0603" y="60.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="18.2442" y="54.5343"/>
					<TrackLine>
						<End x="17.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="76.25" y="56.5"/>
					<TrackLine>
						<End x="76.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="75.5399" y="58.15"/>
					</TrackLine>
					<TrackLine>
						<End x="70.5529" y="60.05"/>
					</TrackLine>
					<TrackLine>
						<End x="69.85" y="60.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="68.1737" y="63.861"/>
					</TrackLine>
					<TrackLine>
						<End x="68.075" y="64.0992"/>
					</TrackLine>
					<TrackLine>
						<End x="67.3458" y="72.716"/>
					</TrackLine>
					<TrackLine>
						<End x="67.26" y="73.428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="17.25" y="56.5"/>
					<TrackLine>
						<End x="17.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="18.962" y="63.5915"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="66.7841" y="90.5823"/>
					<TrackLine>
						<End x="67.5189" y="79.056"/>
					</TrackLine>
					<TrackLine>
						<End x="68.0775" y="74.4952"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="77.25" y="56.5"/>
					<TrackLine>
						<End x="77.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5399" y="58.15"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7471" y="58.65"/>
					</TrackLine>
					<TrackLine>
						<End x="70.7601" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="70.35" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="68.5975" y="64.1443"/>
					</TrackLine>
					<TrackLine>
						<End x="68.575" y="64.1987"/>
					</TrackLine>
					<TrackLine>
						<End x="68.168" y="73.8041"/>
					</TrackLine>
					<TrackLine>
						<End x="68.0775" y="74.4952"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="18.4005" y="65.4004"/>
					<TrackLine>
						<End x="17.2643" y="64.4778"/>
					</TrackLine>
					<TrackLine>
						<End x="16.7324" y="63.9459"/>
					</TrackLine>
					<TrackLine>
						<End x="16.15" y="60.5411"/>
					</TrackLine>
					<TrackLine>
						<End x="15.55" y="57.7399"/>
					</TrackLine>
					<TrackLine>
						<End x="15.55" y="57.6214"/>
					</TrackLine>
					<TrackLine>
						<End x="15.55" y="57.0416"/>
					</TrackLine>
					<TrackLine>
						<End x="15.5671" y="55.2671"/>
					</TrackLine>
					<TrackLine>
						<End x="15.9944" y="54.8397"/>
					</TrackLine>
					<TrackLine>
						<End x="16.1587" y="54.443"/>
					</TrackLine>
					<TrackLine>
						<End x="16.2334" y="53.5073"/>
					</TrackLine>
					<TrackLine>
						<End x="16.7653" y="52.9754"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5175" y="52.9754"/>
					</TrackLine>
					<TrackLine>
						<End x="18.8186" y="53.3613"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="47.25" y="56.5"/>
					<TrackLine>
						<End x="47.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8695" y="59.7203"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8695" y="60.8152"/>
					</TrackLine>
					<TrackLine>
						<End x="46.1857" y="61.7292"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="18.25" y="56.5"/>
					<TrackLine>
						<End x="18.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="18.5833" y="55.353"/>
					</TrackLine>
					<TrackLine>
						<End x="19.0629" y="54.8734"/>
					</TrackLine>
					<TrackLine>
						<End x="19.0629" y="54.1952"/>
					</TrackLine>
					<TrackLine>
						<End x="18.8186" y="53.3613"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="18.4005" y="65.4004"/>
					<TrackLine>
						<End x="19.5725" y="65.3258"/>
					</TrackLine>
					<TrackLine>
						<End x="20.8741" y="65.3258"/>
					</TrackLine>
					<TrackLine>
						<End x="26.0863" y="66.9744"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6794" y="67.2201"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8714" y="68.4121"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1171" y="69.0052"/>
					</TrackLine>
					<TrackLine>
						<End x="28.15" y="69.7998"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1713" y="69.8512"/>
					</TrackLine>
					<TrackLine>
						<End x="28.9488" y="70.6287"/>
					</TrackLine>
					<TrackLine>
						<End x="29.0752" y="70.7551"/>
					</TrackLine>
					<TrackLine>
						<End x="29.1815" y="70.7991"/>
					</TrackLine>
					<TrackLine>
						<End x="30.8454" y="70.9256"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0546" y="70.9256"/>
					</TrackLine>
					<TrackLine>
						<End x="32.2073" y="70.8623"/>
					</TrackLine>
					<TrackLine>
						<End x="33.0623" y="70.0073"/>
					</TrackLine>
					<TrackLine>
						<End x="37.3521" y="62.55"/>
					</TrackLine>
					<TrackLine>
						<End x="38.9931" y="60.1956"/>
					</TrackLine>
					<TrackLine>
						<End x="39.9956" y="59.1931"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3411" y="59.05"/>
					</TrackLine>
					<TrackLine>
						<End x="42.2411" y="59.05"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6589" y="59.05"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0044" y="59.1931"/>
					</TrackLine>
					<TrackLine>
						<End x="45.0069" y="60.1956"/>
					</TrackLine>
					<TrackLine>
						<End x="45.15" y="60.5411"/>
					</TrackLine>
					<TrackLine>
						<End x="45.1919" y="60.8397"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7006" y="61.3484"/>
					</TrackLine>
					<TrackLine>
						<End x="46.1857" y="61.7292"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="18.4702" y="66.7061"/>
					<TrackLine>
						<End x="18.0244" y="66.3084"/>
					</TrackLine>
					<TrackLine>
						<End x="17.4925" y="65.7765"/>
					</TrackLine>
					<TrackLine>
						<End x="16.2549" y="64.1755"/>
					</TrackLine>
					<TrackLine>
						<End x="16.2324" y="64.1211"/>
					</TrackLine>
					<TrackLine>
						<End x="15.65" y="60.6406"/>
					</TrackLine>
					<TrackLine>
						<End x="15.05" y="57.9471"/>
					</TrackLine>
					<TrackLine>
						<End x="15.05" y="57.8286"/>
					</TrackLine>
					<TrackLine>
						<End x="15.05" y="56.8344"/>
					</TrackLine>
					<TrackLine>
						<End x="15.0843" y="55.0672"/>
					</TrackLine>
					<TrackLine>
						<End x="15.5851" y="54.5663"/>
					</TrackLine>
					<TrackLine>
						<End x="15.6759" y="54.347"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7334" y="53.3321"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7559" y="53.2777"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5357" y="52.4979"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5901" y="52.4754"/>
					</TrackLine>
					<TrackLine>
						<End x="18.6205" y="52.1235"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="48.25" y="56.5"/>
					<TrackLine>
						<End x="48.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="47.3853" y="59.5235"/>
					</TrackLine>
					<TrackLine>
						<End x="47.2707" y="59.8001"/>
					</TrackLine>
					<TrackLine>
						<End x="47.2707" y="60.9814"/>
					</TrackLine>
					<TrackLine>
						<End x="47.0501" y="62.0872"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8743" y="62.7847"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="78.25" y="56.5"/>
					<TrackLine>
						<End x="78.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9704" y="60.1942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="18.4702" y="66.7061"/>
					<TrackLine>
						<End x="19.6176" y="65.8483"/>
					</TrackLine>
					<TrackLine>
						<End x="19.672" y="65.8258"/>
					</TrackLine>
					<TrackLine>
						<End x="20.7746" y="65.8258"/>
					</TrackLine>
					<TrackLine>
						<End x="26.0046" y="67.3853"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4466" y="67.5684"/>
					</TrackLine>
					<TrackLine>
						<End x="27.5231" y="68.6449"/>
					</TrackLine>
					<TrackLine>
						<End x="27.7062" y="69.0869"/>
					</TrackLine>
					<TrackLine>
						<End x="27.75" y="69.8793"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8322" y="70.0778"/>
					</TrackLine>
					<TrackLine>
						<End x="28.7222" y="70.9678"/>
					</TrackLine>
					<TrackLine>
						<End x="28.8486" y="71.0942"/>
					</TrackLine>
					<TrackLine>
						<End x="29.1019" y="71.1991"/>
					</TrackLine>
					<TrackLine>
						<End x="30.7476" y="71.4175"/>
					</TrackLine>
					<TrackLine>
						<End x="32.1524" y="71.4175"/>
					</TrackLine>
					<TrackLine>
						<End x="32.486" y="71.2793"/>
					</TrackLine>
					<TrackLine>
						<End x="33.4793" y="70.286"/>
					</TrackLine>
					<TrackLine>
						<End x="37.7759" y="62.8333"/>
					</TrackLine>
					<TrackLine>
						<End x="39.417" y="60.4789"/>
					</TrackLine>
					<TrackLine>
						<End x="40.2789" y="59.617"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4406" y="59.55"/>
					</TrackLine>
					<TrackLine>
						<End x="42.3406" y="59.55"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5594" y="59.55"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7211" y="59.617"/>
					</TrackLine>
					<TrackLine>
						<End x="44.583" y="60.4789"/>
					</TrackLine>
					<TrackLine>
						<End x="44.65" y="60.6406"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7315" y="61.0156"/>
					</TrackLine>
					<TrackLine>
						<End x="44.742" y="61.0409"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2777" y="62.1053"/>
					</TrackLine>
					<TrackLine>
						<End x="45.8096" y="62.6372"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8743" y="62.7847"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="19.25" y="56.5"/>
					<TrackLine>
						<End x="19.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6297" y="55.14"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6522" y="55.0856"/>
					</TrackLine>
					<TrackLine>
						<End x="19.7266" y="53.7374"/>
					</TrackLine>
					<TrackLine>
						<End x="19.7266" y="52.9852"/>
					</TrackLine>
					<TrackLine>
						<End x="19.1947" y="52.4533"/>
					</TrackLine>
					<TrackLine>
						<End x="18.6205" y="52.1235"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="79.25" y="56.5"/>
					<TrackLine>
						<End x="79.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="79.3809" y="58.611"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="47.207" y="64.0237"/>
					<TrackLine>
						<End x="46.4982" y="63.6927"/>
					</TrackLine>
					<TrackLine>
						<End x="45.58" y="63.1147"/>
					</TrackLine>
					<TrackLine>
						<End x="44.8002" y="62.3349"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3517" y="61.3017"/>
					</TrackLine>
					<TrackLine>
						<End x="44.2711" y="61.1072"/>
					</TrackLine>
					<TrackLine>
						<End x="44.15" y="60.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="43.4471" y="60.05"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4529" y="60.05"/>
					</TrackLine>
					<TrackLine>
						<End x="40.5529" y="60.05"/>
					</TrackLine>
					<TrackLine>
						<End x="39.85" y="60.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="38.2534" y="63.0629"/>
					</TrackLine>
					<TrackLine>
						<End x="33.9308" y="70.5876"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4694" y="72.3174"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="49.25" y="56.5"/>
					<TrackLine>
						<End x="49.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="47.7254" y="59.7507"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6719" y="59.88"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6719" y="61.0636"/>
					</TrackLine>
					<TrackLine>
						<End x="47.7823" y="62.4086"/>
					</TrackLine>
					<TrackLine>
						<End x="47.7823" y="63.1608"/>
					</TrackLine>
					<TrackLine>
						<End x="47.207" y="64.0237"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="18.7714" y="68.1178"/>
					<TrackLine>
						<End x="19.3468" y="67.0692"/>
					</TrackLine>
					<TrackLine>
						<End x="19.3467" y="66.8707"/>
					</TrackLine>
					<TrackLine>
						<End x="19.8602" y="66.3572"/>
					</TrackLine>
					<TrackLine>
						<End x="20.5864" y="66.3572"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9228" y="67.7963"/>
					</TrackLine>
					<TrackLine>
						<End x="26.2138" y="67.9168"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1747" y="68.8777"/>
					</TrackLine>
					<TrackLine>
						<End x="27.2952" y="69.1687"/>
					</TrackLine>
					<TrackLine>
						<End x="27.35" y="69.9589"/>
					</TrackLine>
					<TrackLine>
						<End x="27.4931" y="70.3044"/>
					</TrackLine>
					<TrackLine>
						<End x="28.4956" y="71.3069"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6221" y="71.4333"/>
					</TrackLine>
					<TrackLine>
						<End x="29.0224" y="71.5991"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4694" y="72.3174"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="18.7714" y="68.1178"/>
					<TrackLine>
						<End x="18.0941" y="67.6141"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5622" y="67.0822"/>
					</TrackLine>
					<TrackLine>
						<End x="15.8311" y="64.4588"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7324" y="64.2206"/>
					</TrackLine>
					<TrackLine>
						<End x="15.15" y="60.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="14.55" y="58.0594"/>
					</TrackLine>
					<TrackLine>
						<End x="14.55" y="57.9409"/>
					</TrackLine>
					<TrackLine>
						<End x="14.55" y="56.7221"/>
					</TrackLine>
					<TrackLine>
						<End x="14.6014" y="54.9508"/>
					</TrackLine>
					<TrackLine>
						<End x="14.6606" y="54.808"/>
					</TrackLine>
					<TrackLine>
						<End x="15.1757" y="54.2927"/>
					</TrackLine>
					<TrackLine>
						<End x="15.193" y="54.2509"/>
					</TrackLine>
					<TrackLine>
						<End x="15.2334" y="53.2326"/>
					</TrackLine>
					<TrackLine>
						<End x="15.3321" y="52.9944"/>
					</TrackLine>
					<TrackLine>
						<End x="16.2524" y="52.0741"/>
					</TrackLine>
					<TrackLine>
						<End x="18.2444" y="51.2155"/>
					</TrackLine>
					<TrackLine>
						<End x="18.9966" y="51.2155"/>
					</TrackLine>
					<TrackLine>
						<End x="19.471" y="51.251"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="20.25" y="56.5"/>
					<TrackLine>
						<End x="20.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2266" y="52.81"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2041" y="52.7556"/>
					</TrackLine>
					<TrackLine>
						<End x="19.471" y="51.251"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="53.25" y="56.5"/>
					<TrackLine>
						<End x="53.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7471" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="51.0211" y="53.917"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3044" y="53.4931"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9589" y="53.35"/>
					</TrackLine>
					<TrackLine>
						<End x="46.026" y="53.0125"/>
					</TrackLine>
					<TrackLine>
						<End x="44.474" y="53.0125"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0044" y="53.207"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7895" y="59.0169"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7487" y="59.0338"/>
					</TrackLine>
					<TrackLine>
						<End x="28.9406" y="59.55"/>
					</TrackLine>
					<TrackLine>
						<End x="28.7789" y="59.617"/>
					</TrackLine>
					<TrackLine>
						<End x="27.4275" y="60.5395"/>
					</TrackLine>
					<TrackLine>
						<End x="25.8037" y="60.6921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="83.25" y="56.5"/>
					<TrackLine>
						<End x="83.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="83.7676" y="60.9141"/>
					</TrackLine>
					<TrackLine>
						<End x="83.7676" y="61.6663"/>
					</TrackLine>
					<TrackLine>
						<End x="83.461" y="63.1598"/>
					</TrackLine>
					<TrackLine>
						<End x="83.4385" y="63.2142"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9922" y="64.2355"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9922" y="64.9877"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0373" y="66.623"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0445" y="66.9721"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5058" y="68.3145"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="53.25" y="56.5"/>
					<TrackLine>
						<End x="53.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4794" y="58.5007"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4794" y="60.7007"/>
					</TrackLine>
					<TrackLine>
						<End x="53.972" y="62.6235"/>
					</TrackLine>
					<TrackLine>
						<End x="53.972" y="64.1849"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4046" y="65.8126"/>
					</TrackLine>
					<TrackLine>
						<End x="53.35" y="66.087"/>
					</TrackLine>
					<TrackLine>
						<End x="53.2748" y="69.7443"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7997" y="70.2194"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2978" y="70.6535"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="21.6875" y="48.758"/>
					<TrackLine>
						<End x="23.797" y="51.4837"/>
					</TrackLine>
					<TrackLine>
						<End x="24.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="24.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="24.25" y="56.5"/>
					<TrackLine>
						<End x="24.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="25.8037" y="60.6921"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="22.9598" y="53.7929"/>
					<TrackLine>
						<End x="23.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="23.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="82.25" y="56.5"/>
					<TrackLine>
						<End x="82.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="81.145" y="62.2324"/>
					</TrackLine>
					<TrackLine>
						<End x="81.145" y="62.9846"/>
					</TrackLine>
					<TrackLine>
						<End x="81.5373" y="66.9214"/>
					</TrackLine>
					<TrackLine>
						<End x="81.5978" y="68.9653"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9424" y="70.623"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="52.25" y="56.5"/>
					<TrackLine>
						<End x="52.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="53.007" y="58.4404"/>
					</TrackLine>
					<TrackLine>
						<End x="53.0661" y="58.5829"/>
					</TrackLine>
					<TrackLine>
						<End x="53.0661" y="60.7829"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5414" y="62.7092"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5414" y="64.0992"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9558" y="65.6765"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8833" y="66.041"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6792" y="68.7516"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4638" y="69.4084"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="23.25" y="56.5"/>
					<TrackLine>
						<End x="23.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="23.7708" y="60.5097"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="52.25" y="56.5"/>
					<TrackLine>
						<End x="52.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7471" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0211" y="53.917"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8594" y="53.85"/>
					</TrackLine>
					<TrackLine>
						<End x="45.933" y="53.48"/>
					</TrackLine>
					<TrackLine>
						<End x="44.567" y="53.48"/>
					</TrackLine>
					<TrackLine>
						<End x="44.2693" y="53.6033"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0623" y="59.4251"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8445" y="59.5153"/>
					</TrackLine>
					<TrackLine>
						<End x="29.0529" y="60.05"/>
					</TrackLine>
					<TrackLine>
						<End x="27.6571" y="61.017"/>
					</TrackLine>
					<TrackLine>
						<End x="27.6027" y="61.0395"/>
					</TrackLine>
					<TrackLine>
						<End x="26.1798" y="61.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="25.4276" y="61.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="23.7708" y="60.5097"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="81.25" y="56.5"/>
					<TrackLine>
						<End x="81.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="62.0572"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="63.1598"/>
					</TrackLine>
					<TrackLine>
						<End x="81.0373" y="67.0966"/>
					</TrackLine>
					<TrackLine>
						<End x="81.0373" y="67.8488"/>
					</TrackLine>
					<TrackLine>
						<End x="81.0344" y="70.2469"/>
					</TrackLine>
					<TrackLine>
						<End x="81.0344" y="70.9991"/>
					</TrackLine>
					<TrackLine>
						<End x="81.4213" y="71.939"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="51.25" y="56.5"/>
					<TrackLine>
						<End x="51.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9199" y="57.9708"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6294" y="58.6803"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6528" y="60.8651"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1109" y="62.7948"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1109" y="64.0136"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5418" y="65.5509"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7712" y="68.3755"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="22.25" y="56.5"/>
					<TrackLine>
						<End x="22.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1282" y="59.9879"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="51.25" y="56.5"/>
					<TrackLine>
						<End x="51.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="50.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7471" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="45.84" y="53.9475"/>
					</TrackLine>
					<TrackLine>
						<End x="44.66" y="53.9475"/>
					</TrackLine>
					<TrackLine>
						<End x="44.5341" y="53.9996"/>
					</TrackLine>
					<TrackLine>
						<End x="32.3351" y="59.8334"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9403" y="59.9969"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2601" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9404" y="61.4408"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4094" y="62.0776"/>
					</TrackLine>
					<TrackLine>
						<End x="26.355" y="62.1001"/>
					</TrackLine>
					<TrackLine>
						<End x="25.2524" y="62.1001"/>
					</TrackLine>
					<TrackLine>
						<End x="23.3947" y="61.4177"/>
					</TrackLine>
					<TrackLine>
						<End x="22.8628" y="60.8858"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1282" y="59.9879"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="22.889" y="51.8598"/>
					<TrackLine>
						<End x="22.0518" y="53.4168"/>
					</TrackLine>
					<TrackLine>
						<End x="22.0518" y="54.169"/>
					</TrackLine>
					<TrackLine>
						<End x="22.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="22.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="78"/>
				<Subwire width="0.2">
					<Start x="59" y="93.75"/>
					<TrackLine>
						<End x="59" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="59.8114" y="77.1649"/>
					</TrackLine>
					<TrackLine>
						<End x="62.1748" y="71.0834"/>
					</TrackLine>
					<TrackLine>
						<End x="62.1748" y="70.3312"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6429" y="69.7993"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8907" y="69.7993"/>
					</TrackLine>
					<TrackLine>
						<End x="60.7399" y="69.95"/>
					</TrackLine>
					<TrackLine>
						<End x="59.1157" y="69.95"/>
					</TrackLine>
					<TrackLine>
						<End x="58.5359" y="69.95"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2609" y="69.948"/>
					</TrackLine>
					<TrackLine>
						<End x="57.852" y="69.5391"/>
					</TrackLine>
					<TrackLine>
						<End x="57.852" y="68.2268"/>
					</TrackLine>
					<TrackLine>
						<End x="57.85" y="67.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="57.85" y="66.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9146" y="61.9868"/>
					</TrackLine>
					<TrackLine>
						<End x="58.0624" y="61.048"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2028" y="60.9075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="78"/>
				<Subwire width="0.2">
					<Start x="58.2028" y="60.9075"/>
					<TrackLine>
						<End x="58.55" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="78"/>
				<Subwire width="0.2">
					<Start x="56.25" y="56.5"/>
					<TrackLine>
						<End x="56.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="58.381" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="58.4354" y="55.5725"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2152" y="56.3523"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2377" y="56.4067"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5443" y="57.6163"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5443" y="58.9179"/>
					</TrackLine>
					<TrackLine>
						<End x="59.4456" y="59.1561"/>
					</TrackLine>
					<TrackLine>
						<End x="58.7482" y="60.3284"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2028" y="60.9075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="77"/>
				<Subwire width="0.2">
					<Start x="55.25" y="93.75"/>
					<TrackLine>
						<End x="55.25" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8032" y="84.3258"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8032" y="83.5736"/>
					</TrackLine>
					<TrackLine>
						<End x="53.2492" y="82.9609"/>
					</TrackLine>
					<TrackLine>
						<End x="56.95" y="75.2399"/>
					</TrackLine>
					<TrackLine>
						<End x="56.9602" y="74.8251"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3534" y="71.728"/>
					</TrackLine>
					<TrackLine>
						<End x="57.354" y="70.5409"/>
					</TrackLine>
					<TrackLine>
						<End x="57.354" y="68.2759"/>
					</TrackLine>
					<TrackLine>
						<End x="57.35" y="67.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="57.35" y="66.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="57.4165" y="64.6465"/>
					</TrackLine>
					<TrackLine>
						<End x="57.4792" y="61.8065"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6116" y="60.8613"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3243" y="60.0452"/>
					</TrackLine>
					<TrackLine>
						<End x="59.0218" y="58.8728"/>
					</TrackLine>
					<TrackLine>
						<End x="59.0443" y="58.8184"/>
					</TrackLine>
					<TrackLine>
						<End x="59.0443" y="57.7158"/>
					</TrackLine>
					<TrackLine>
						<End x="58.7236" y="56.5877"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2" y="56.0641"/>
					</TrackLine>
					<TrackLine>
						<End x="57.4594" y="56.0641"/>
					</TrackLine>
					<TrackLine>
						<End x="56.9358" y="56.5877"/>
					</TrackLine>
					<TrackLine>
						<End x="56.925" y="57.7296"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5296" y="58.125"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1389" y="58.2482"/>
					</TrackLine>
					<TrackLine>
						<End x="55.607" y="58.7801"/>
					</TrackLine>
					<TrackLine>
						<End x="54.7193" y="59.6792"/>
					</TrackLine>
					<TrackLine>
						<End x="54.7193" y="60.3596"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2609" y="62.3599"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2637" y="62.3739"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2637" y="64.4345"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2609" y="64.4485"/>
					</TrackLine>
					<TrackLine>
						<End x="54.85" y="66.2427"/>
					</TrackLine>
					<TrackLine>
						<End x="54.85" y="68.2573"/>
					</TrackLine>
					<TrackLine>
						<End x="54.8639" y="68.6597"/>
					</TrackLine>
					<TrackLine>
						<End x="54.8639" y="70.1571"/>
					</TrackLine>
					<TrackLine>
						<End x="54.8414" y="71.1478"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3224" y="71.6668"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8257" y="72.0256"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4067" y="72.4406"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7295" y="72.4406"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2507" y="71.9618"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3898" y="71.0296"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8632" y="68.7516"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8632" y="67.9994"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6789" y="63.9313"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6803" y="63.9279"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6803" y="62.8805"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2395" y="60.9473"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2278" y="58.8467"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7535" y="58.3724"/>
					</TrackLine>
					<TrackLine>
						<End x="51.0829" y="58.3724"/>
					</TrackLine>
					<TrackLine>
						<End x="48.9483" y="59.6626"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4743" y="60.1366"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4743" y="60.807"/>
					</TrackLine>
					<TrackLine>
						<End x="48.7823" y="62.1339"/>
					</TrackLine>
					<TrackLine>
						<End x="48.7823" y="63.4355"/>
					</TrackLine>
					<TrackLine>
						<End x="48.615" y="64.575"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5925" y="64.6294"/>
					</TrackLine>
					<TrackLine>
						<End x="47.8127" y="65.4092"/>
					</TrackLine>
					<TrackLine>
						<End x="47.7583" y="65.4317"/>
					</TrackLine>
					<TrackLine>
						<End x="46.6557" y="65.4317"/>
					</TrackLine>
					<TrackLine>
						<End x="46.6013" y="65.4092"/>
					</TrackLine>
					<TrackLine>
						<End x="42.95" y="62.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="77"/>
				<Subwire width="0.2">
					<Start x="42.95" y="62.25"/>
					<TrackLine>
						<End x="42" y="62.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="77"/>
				<Subwire width="0.2">
					<Start x="42" y="61.25"/>
					<TrackLine>
						<End x="42.95" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1158" y="61.3497"/>
					</TrackLine>
					<TrackLine>
						<End x="43.3503" y="61.5842"/>
					</TrackLine>
					<TrackLine>
						<End x="43.3503" y="61.9158"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1158" y="62.1503"/>
					</TrackLine>
					<TrackLine>
						<End x="42.95" y="62.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="76"/>
				<Subwire width="0.2">
					<Start x="61.2668" y="70.7073"/>
					<TrackLine>
						<End x="57.8682" y="75.2012"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="76"/>
				<Subwire width="0.2">
					<Start x="57.75" y="93.75"/>
					<TrackLine>
						<End x="57.75" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="57.8682" y="75.2012"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="75"/>
				<Subwire width="0.2">
					<Start x="56.5" y="93.75"/>
					<TrackLine>
						<End x="56.5" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7112" y="83.9497"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="74"/>
				<Subwire width="0.2">
					<Start x="86.25" y="56.5"/>
					<TrackLine>
						<End x="86.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="87.95" y="61.2776"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="74"/>
				<Subwire width="0.2">
					<Start x="87.95" y="61.2776"/>
					<TrackLine>
						<End x="87.35" y="62.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="86.7179" y="67.1427"/>
					</TrackLine>
					<TrackLine>
						<End x="86.6779" y="67.3992"/>
					</TrackLine>
					<TrackLine>
						<End x="86.6779" y="68.1218"/>
					</TrackLine>
					<TrackLine>
						<End x="87.3616" y="71.4722"/>
					</TrackLine>
					<TrackLine>
						<End x="87.45" y="72.5834"/>
					</TrackLine>
					<TrackLine>
						<End x="87.45" y="73.5776"/>
					</TrackLine>
					<TrackLine>
						<End x="87.45" y="75.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="86.0454" y="77.5288"/>
					</TrackLine>
					<TrackLine>
						<End x="85.5135" y="78.0607"/>
					</TrackLine>
					<TrackLine>
						<End x="70.5272" y="86.85"/>
					</TrackLine>
					<TrackLine>
						<End x="70" y="87.3772"/>
					</TrackLine>
					<TrackLine>
						<End x="69" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="69" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="74"/>
				<Subwire width="0.2">
					<Start x="89.5" y="61.25"/>
					<TrackLine>
						<End x="88.55" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="87.95" y="61.2776"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="73"/>
				<Subwire width="0.2">
					<Start x="72" y="62.25"/>
					<TrackLine>
						<End x="71.05" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="70.63" y="62.0031"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="73"/>
				<Subwire width="0.2">
					<Start x="70.63" y="62.0031"/>
					<TrackLine>
						<End x="69.075" y="64.3739"/>
					</TrackLine>
					<TrackLine>
						<End x="69.075" y="65.1261"/>
					</TrackLine>
					<TrackLine>
						<End x="69.853" y="68.7458"/>
					</TrackLine>
					<TrackLine>
						<End x="70.3482" y="69.2411"/>
					</TrackLine>
					<TrackLine>
						<End x="70.3482" y="69.9921"/>
					</TrackLine>
					<TrackLine>
						<End x="69.4855" y="75.0465"/>
					</TrackLine>
					<TrackLine>
						<End x="68.5189" y="79.3307"/>
					</TrackLine>
					<TrackLine>
						<End x="68.1921" y="91.1336"/>
					</TrackLine>
					<TrackLine>
						<End x="68.1696" y="91.188"/>
					</TrackLine>
					<TrackLine>
						<End x="66.5" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="66.5" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="73"/>
				<Subwire width="0.2">
					<Start x="72" y="61.25"/>
					<TrackLine>
						<End x="71.05" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="70.8841" y="61.3495"/>
					</TrackLine>
					<TrackLine>
						<End x="70.6495" y="61.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="70.63" y="62.0031"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="72"/>
				<Subwire width="0.2">
					<Start x="67.75" y="93.75"/>
					<TrackLine>
						<End x="67.75" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="68.5934" y="91.4713"/>
					</TrackLine>
					<TrackLine>
						<End x="68.6921" y="91.2331"/>
					</TrackLine>
					<TrackLine>
						<End x="69.5" y="87.2002"/>
					</TrackLine>
					<TrackLine>
						<End x="69.5213" y="87.1488"/>
					</TrackLine>
					<TrackLine>
						<End x="70.2988" y="86.3713"/>
					</TrackLine>
					<TrackLine>
						<End x="83.9177" y="78.2504"/>
					</TrackLine>
					<TrackLine>
						<End x="85.1374" y="77.1527"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="71"/>
				<Subwire width="0.2">
					<Start x="65.25" y="93.75"/>
					<TrackLine>
						<End x="65.25" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="66.1686" y="92.1"/>
					</TrackLine>
					<TrackLine>
						<End x="67.1602" y="91.4903"/>
					</TrackLine>
					<TrackLine>
						<End x="67.6921" y="90.9584"/>
					</TrackLine>
					<TrackLine>
						<End x="68.0189" y="79.1555"/>
					</TrackLine>
					<TrackLine>
						<End x="68.9855" y="74.8713"/>
					</TrackLine>
					<TrackLine>
						<End x="69.4417" y="69.6166"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="27.25" y="56.5"/>
					<TrackLine>
						<End x="27.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2047" y="57.6627"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="36.5" y="93.75"/>
					<TrackLine>
						<End x="36.5" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="37.4186" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="38.9188" y="95.808"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="30.5" y="61.25"/>
					<TrackLine>
						<End x="31.45" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5521" y="60.8744"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="69"/>
				<Subwire width="0.2">
					<Start x="30.25" y="93.75"/>
					<TrackLine>
						<End x="30.25" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="26.0475" y="88.9902"/>
					</TrackLine>
					<TrackLine>
						<End x="25.5156" y="88.4583"/>
					</TrackLine>
					<TrackLine>
						<End x="25.098" y="87.9211"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="69"/>
				<Subwire width="0.2">
					<Start x="10.983" y="62.75"/>
					<TrackLine>
						<End x="12.05" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="13" y="62.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="69"/>
				<Subwire width="0.2">
					<Start x="13" y="61.25"/>
					<TrackLine>
						<End x="12.05" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8841" y="61.3495"/>
					</TrackLine>
					<TrackLine>
						<End x="11.6495" y="61.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="11.35" y="61.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="10.983" y="62.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00032"/>
				<Subwire width="0.2">
					<Start x="92.2" y="86.5"/>
					<TrackLine>
						<End x="92.85" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="93.65" y="87.4186"/>
					</TrackLine>
					<TrackLine>
						<End x="93.65" y="88.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="93.65" y="90.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="93.1725" y="91.0589"/>
					</TrackLine>
					<TrackLine>
						<End x="92.85" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="91.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="108"/>
				<Subwire width="0.2">
					<Start x="92.2" y="90.25"/>
					<TrackLine>
						<End x="91.55" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="84.7854" y="86.9079"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="108"/>
				<Subwire width="0.2">
					<Start x="84.7854" y="86.9079"/>
					<TrackLine>
						<End x="84.7744" y="86.2275"/>
					</TrackLine>
					<TrackLine>
						<End x="84.2425" y="85.6956"/>
					</TrackLine>
					<TrackLine>
						<End x="83.4903" y="85.6956"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0186" y="85.7"/>
					</TrackLine>
					<TrackLine>
						<End x="70.7343" y="87.35"/>
					</TrackLine>
					<TrackLine>
						<End x="70.5" y="87.5843"/>
					</TrackLine>
					<TrackLine>
						<End x="70.5" y="87.9157"/>
					</TrackLine>
					<TrackLine>
						<End x="70.5" y="91.4157"/>
					</TrackLine>
					<TrackLine>
						<End x="71.5" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="71.5" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="108"/>
				<Subwire width="0.2">
					<Start x="81" y="89"/>
					<TrackLine>
						<End x="81.65" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="84.2425" y="87.5116"/>
					</TrackLine>
					<TrackLine>
						<End x="84.7744" y="86.9797"/>
					</TrackLine>
					<TrackLine>
						<End x="84.7854" y="86.9079"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="82.723" y="92.3271"/>
					<TrackLine>
						<End x="82.45" y="93.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="77.75" y="47.7"/>
					<TrackLine>
						<End x="77.75" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2266" y="51.0556"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2266" y="51.5954"/>
					</TrackLine>
					<TrackLine>
						<End x="78.6796" y="52.0484"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5436" y="52.075"/>
					</TrackLine>
					<TrackLine>
						<End x="81.2064" y="52.075"/>
					</TrackLine>
					<TrackLine>
						<End x="81.7686" y="52.0027"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81" y="94"/>
					<TrackLine>
						<End x="80.35" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3109" y="91.7767"/>
					</TrackLine>
					<TrackLine>
						<End x="77.7861" y="91.2519"/>
					</TrackLine>
					<TrackLine>
						<End x="77.1414" y="91.15"/>
					</TrackLine>
					<TrackLine>
						<End x="77.1" y="91.15"/>
					</TrackLine>
					<TrackLine>
						<End x="77" y="91.15"/>
					</TrackLine>
					<TrackLine>
						<End x="76.125" y="89.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="26" y="47.7"/>
					<TrackLine>
						<End x="26" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9186" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3585" y="45.9331"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="69.4269" y="79.7068"/>
					<TrackLine>
						<End x="75.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="13" y="63.25"/>
					<TrackLine>
						<End x="13.95" y="63.25"/>
					</TrackLine>
					<TrackLine>
						<End x="14.4835" y="63.229"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="86.6034" y="92.5204"/>
					<TrackLine>
						<End x="91.55" y="92.75"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="42" y="63.25"/>
					<TrackLine>
						<End x="42.95" y="63.25"/>
					</TrackLine>
					<TrackLine>
						<End x="43.65" y="63.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="43.9184" y="65.7561"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74.2618" y="63.9025"/>
					<TrackLine>
						<End x="72.95" y="63.25"/>
					</TrackLine>
					<TrackLine>
						<End x="72" y="63.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="62.75" y="47.75"/>
					<TrackLine>
						<End x="62.75" y="47.1"/>
					</TrackLine>
					<TrackLine>
						<End x="62.8499" y="46.3052"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="16.88" y="23.02"/>
					<TrackLine>
						<End x="16.88" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="15.775" y="29.3743"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7122" y="29.4372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.2" y="94"/>
					<TrackLine>
						<End x="92.85" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="93.0573" y="93.8755"/>
					</TrackLine>
					<TrackLine>
						<End x="93.3505" y="93.5823"/>
					</TrackLine>
					<TrackLine>
						<End x="93.3505" y="93.1677"/>
					</TrackLine>
					<TrackLine>
						<End x="93.0573" y="92.8745"/>
					</TrackLine>
					<TrackLine>
						<End x="92.85" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.85" y="92.75"/>
					<TrackLine>
						<End x="92.2" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="15.7122" y="29.4372"/>
					<TrackLine>
						<End x="18.75" y="33.9"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="34.55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.2" y="89"/>
					<TrackLine>
						<End x="91.55" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="90.75" y="88.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="90.75" y="86.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="90.75" y="86.1686"/>
					</TrackLine>
					<TrackLine>
						<End x="91.2186" y="85.7"/>
					</TrackLine>
					<TrackLine>
						<End x="91.6486" y="85.3064"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="82.723" y="92.3271"/>
					<TrackLine>
						<End x="82.45" y="91.1686"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="90.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="11.25" y="94.45"/>
					<TrackLine>
						<End x="11.25" y="93.8"/>
					</TrackLine>
					<TrackLine>
						<End x="12.1686" y="93"/>
					</TrackLine>
					<TrackLine>
						<End x="14.375" y="92.7165"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="86.6034" y="92.5204"/>
					<TrackLine>
						<End x="82.723" y="92.3271"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="76.125" y="89.5"/>
					<TrackLine>
						<End x="75.25" y="91.15"/>
					</TrackLine>
					<TrackLine>
						<End x="75.25" y="91.25"/>
					</TrackLine>
					<TrackLine>
						<End x="75.25" y="91.2914"/>
					</TrackLine>
					<TrackLine>
						<End x="74" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="74" y="93.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="14.5" y="31"/>
					<TrackLine>
						<End x="15.375" y="29.4372"/>
					</TrackLine>
					<TrackLine>
						<End x="15.475" y="29.4372"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7122" y="29.4372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38" y="89.575"/>
					<TrackLine>
						<End x="38.825" y="89.2248"/>
					</TrackLine>
					<TrackLine>
						<End x="38.925" y="89.2248"/>
					</TrackLine>
					<TrackLine>
						<End x="39.633" y="89.2248"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81.7686" y="52.0027"/>
					<TrackLine>
						<End x="82.4186" y="52.075"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0814" y="52.075"/>
					</TrackLine>
					<TrackLine>
						<End x="83.55" y="51.6064"/>
					</TrackLine>
					<TrackLine>
						<End x="84" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="84" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="76.25" y="74"/>
					<TrackLine>
						<End x="76.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="74.837" y="70.5434"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4069" y="69.2062"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2618" y="63.9025"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="14.4835" y="63.229"/>
					<TrackLine>
						<End x="15.0917" y="65.564"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="17.25" y="74"/>
					<TrackLine>
						<End x="17.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="15.0917" y="65.564"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="44.75" y="47.7"/>
					<TrackLine>
						<End x="44.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6686" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="48.1686" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8314" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="50.056" y="46.3112"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2797" y="46.5348"/>
					</TrackLine>
					<TrackLine>
						<End x="51" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="51" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="30.5" y="62.25"/>
					<TrackLine>
						<End x="31.45" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="32.9282" y="61.7824"/>
					</TrackLine>
					<TrackLine>
						<End x="38.8329" y="57.5274"/>
					</TrackLine>
					<TrackLine>
						<End x="38.9017" y="57.4814"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7799" y="54.415"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7201" y="54.415"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="46.25" y="74"/>
					<TrackLine>
						<End x="46.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="43.9184" y="65.7561"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="87.5502" y="67.7605"/>
					<TrackLine>
						<End x="87.85" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="91.6486" y="85.3064"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74.2618" y="63.9025"/>
					<TrackLine>
						<End x="78.3465" y="61.1022"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8784" y="60.5703"/>
					</TrackLine>
					<TrackLine>
						<End x="80.2889" y="58.9871"/>
					</TrackLine>
					<TrackLine>
						<End x="80.2889" y="58.2349"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="62.8499" y="46.3052"/>
					<TrackLine>
						<End x="57.408" y="42.0687"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8023" y="41.8178"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4635" y="41.1846"/>
					</TrackLine>
					<TrackLine>
						<End x="41.6797" y="40.0269"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3097" y="39.8868"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="89.5" y="62.25"/>
					<TrackLine>
						<End x="88.55" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="87.85" y="62.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="87.5502" y="67.7605"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="59.5" y="62.25"/>
					<TrackLine>
						<End x="60.45" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="61.15" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="61.15" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="59.7377" y="56.3072"/>
					</TrackLine>
					<TrackLine>
						<End x="59.639" y="56.069"/>
					</TrackLine>
					<TrackLine>
						<End x="58.7187" y="55.1487"/>
					</TrackLine>
					<TrackLine>
						<End x="58.4805" y="55.05"/>
					</TrackLine>
					<TrackLine>
						<End x="54.7471" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5436" y="54.325"/>
					</TrackLine>
					<TrackLine>
						<End x="54.075" y="53.8564"/>
					</TrackLine>
					<TrackLine>
						<End x="51.443" y="50.6353"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4205" y="50.5809"/>
					</TrackLine>
					<TrackLine>
						<End x="51" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="51" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="44.75" y="47.7"/>
					<TrackLine>
						<End x="44.75" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="35.8564" y="51.05"/>
					</TrackLine>
					<TrackLine>
						<End x="34.5564" y="51.05"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8936" y="51.05"/>
					</TrackLine>
					<TrackLine>
						<End x="33.425" y="50.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="32.25" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="32.25" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="77.75" y="47.7"/>
					<TrackLine>
						<End x="77.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="68.6847" y="44.484"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9325" y="44.484"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4989" y="45.1085"/>
					</TrackLine>
					<TrackLine>
						<End x="62.8499" y="46.3052"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="35.5" y="89.575"/>
					<TrackLine>
						<End x="36.325" y="89.0375"/>
					</TrackLine>
					<TrackLine>
						<End x="36.425" y="89.0375"/>
					</TrackLine>
					<TrackLine>
						<End x="36.4664" y="89.0375"/>
					</TrackLine>
					<TrackLine>
						<End x="36.525" y="88.9789"/>
					</TrackLine>
					<TrackLine>
						<End x="36.675" y="88.7718"/>
					</TrackLine>
					<TrackLine>
						<End x="36.9093" y="88.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7593" y="88.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="39.0907" y="88.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="39.325" y="88.7718"/>
					</TrackLine>
					<TrackLine>
						<End x="39.633" y="89.2248"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="42" y="63.25"/>
					<TrackLine>
						<End x="41.05" y="63.25"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="62.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="40.7601" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="42.6601" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="43.2399" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="43.65" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3764" y="62.6182"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2967" y="63.5385"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8309" y="64.9317"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5831" y="64.9317"/>
					</TrackLine>
					<TrackLine>
						<End x="48.115" y="64.3998"/>
					</TrackLine>
					<TrackLine>
						<End x="48.2823" y="63.336"/>
					</TrackLine>
					<TrackLine>
						<End x="48.2823" y="62.2334"/>
					</TrackLine>
					<TrackLine>
						<End x="48.0731" y="60.9732"/>
					</TrackLine>
					<TrackLine>
						<End x="48.0731" y="59.9704"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="91.6486" y="85.3064"/>
					<TrackLine>
						<End x="93.1814" y="85.7"/>
					</TrackLine>
					<TrackLine>
						<End x="93.65" y="86.1686"/>
					</TrackLine>
					<TrackLine>
						<End x="94.1439" y="87.2054"/>
					</TrackLine>
					<TrackLine>
						<End x="94.15" y="87.2201"/>
					</TrackLine>
					<TrackLine>
						<End x="94.15" y="88.2799"/>
					</TrackLine>
					<TrackLine>
						<End x="94.15" y="90.7799"/>
					</TrackLine>
					<TrackLine>
						<End x="94.1439" y="90.7946"/>
					</TrackLine>
					<TrackLine>
						<End x="93.65" y="91.2885"/>
					</TrackLine>
					<TrackLine>
						<End x="93.65" y="91.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="92.85" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="21.25" y="56.5"/>
					<TrackLine>
						<End x="21.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="21.2202" y="59.6118"/>
					</TrackLine>
					<TrackLine>
						<End x="21.2202" y="60.364"/>
					</TrackLine>
					<TrackLine>
						<End x="21.7521" y="60.8959"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1651" y="61.8952"/>
					</TrackLine>
					<TrackLine>
						<End x="23.2195" y="61.9177"/>
					</TrackLine>
					<TrackLine>
						<End x="25.1529" y="62.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4545" y="62.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="29.55" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="30.5" y="62.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="32.25" y="47.7"/>
					<TrackLine>
						<End x="32.25" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="33.5148" y="43.0228"/>
					</TrackLine>
					<TrackLine>
						<End x="34.0467" y="42.4909"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1313" y="42.165"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0946" y="41.8025"/>
					</TrackLine>
					<TrackLine>
						<End x="37.8841" y="41.4755"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3097" y="39.8868"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="21.25" y="56.5"/>
					<TrackLine>
						<End x="21.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="20.7266" y="52.7105"/>
					</TrackLine>
					<TrackLine>
						<End x="20.379" y="50.8749"/>
					</TrackLine>
					<TrackLine>
						<End x="19.8471" y="50.343"/>
					</TrackLine>
					<TrackLine>
						<End x="19.0949" y="50.343"/>
					</TrackLine>
					<TrackLine>
						<End x="18.0692" y="50.7155"/>
					</TrackLine>
					<TrackLine>
						<End x="18.0148" y="50.738"/>
					</TrackLine>
					<TrackLine>
						<End x="15.9692" y="51.6502"/>
					</TrackLine>
					<TrackLine>
						<End x="14.9082" y="52.7112"/>
					</TrackLine>
					<TrackLine>
						<End x="14.7334" y="53.1331"/>
					</TrackLine>
					<TrackLine>
						<End x="14.7102" y="54.0754"/>
					</TrackLine>
					<TrackLine>
						<End x="14.2513" y="54.5345"/>
					</TrackLine>
					<TrackLine>
						<End x="14.1186" y="54.8548"/>
					</TrackLine>
					<TrackLine>
						<End x="14.05" y="56.6226"/>
					</TrackLine>
					<TrackLine>
						<End x="14.05" y="58.0404"/>
					</TrackLine>
					<TrackLine>
						<End x="14.05" y="58.1589"/>
					</TrackLine>
					<TrackLine>
						<End x="14.65" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="14.65" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="14.65" y="62.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="14.4835" y="63.229"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00031"/>
				<Subwire width="0.2">
					<Start x="81" y="87.75"/>
					<TrackLine>
						<End x="80.35" y="87.75"/>
					</TrackLine>
					<TrackLine>
						<End x="79.55" y="88.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4703" y="90.504"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4703" y="91.2462"/>
					</TrackLine>
					<TrackLine>
						<End x="78.9951" y="91.771"/>
					</TrackLine>
					<TrackLine>
						<End x="80.35" y="92.75"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="37"/>
				<Subwire width="0.2">
					<Start x="27.75" y="93.75"/>
					<TrackLine>
						<End x="27.75" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="28.3043" y="95.6127"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="57"/>
				<Subwire width="0.2">
					<Start x="35.5" y="86.5"/>
					<TrackLine>
						<End x="36.325" y="85.9625"/>
					</TrackLine>
					<TrackLine>
						<End x="36.325" y="85.8625"/>
					</TrackLine>
					<TrackLine>
						<End x="36.325" y="85.5104"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7085" y="84.0156"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="57"/>
				<Subwire width="0.2">
					<Start x="17.5" y="83.25"/>
					<TrackLine>
						<End x="17.5" y="82.6"/>
					</TrackLine>
					<TrackLine>
						<End x="18.4186" y="81.8"/>
					</TrackLine>
					<TrackLine>
						<End x="29.0931" y="79.7064"/>
					</TrackLine>
					<TrackLine>
						<End x="29.8453" y="79.7064"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2146" y="80.5292"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7085" y="84.0156"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="81" y="91.5"/>
					<TrackLine>
						<End x="80.35" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="79.3662" y="90.8751"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="70.25" y="93.75"/>
					<TrackLine>
						<End x="70.25" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="71.1686" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="71.8314" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3314" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8" y="94.9314"/>
					</TrackLine>
					<TrackLine>
						<End x="77.415" y="92.1478"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="60.25" y="93.75"/>
					<TrackLine>
						<End x="60.25" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="62.325" y="84.3087"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="84.25" y="56.5"/>
					<TrackLine>
						<End x="84.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="84.1725" y="59.0235"/>
					</TrackLine>
					<TrackLine>
						<End x="84.1725" y="59.7757"/>
					</TrackLine>
					<TrackLine>
						<End x="84.2676" y="60.7389"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3138" y="61.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8082" y="64.2355"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8082" y="64.9877"/>
					</TrackLine>
					<TrackLine>
						<End x="84.4525" y="66.4208"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="25.25" y="56.5"/>
					<TrackLine>
						<End x="25.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="25.8812" y="58.7913"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4131" y="59.3232"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0514" y="59.6315"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="84.25" y="56.5"/>
					<TrackLine>
						<End x="84.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0015" y="54.95"/>
					</TrackLine>
					<TrackLine>
						<End x="74.65" y="55.3015"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6145" y="55.744"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4127" y="56.2313"/>
					</TrackLine>
					<TrackLine>
						<End x="73.3017" y="57.3423"/>
					</TrackLine>
					<TrackLine>
						<End x="69.9956" y="59.1931"/>
					</TrackLine>
					<TrackLine>
						<End x="68.9931" y="60.1956"/>
					</TrackLine>
					<TrackLine>
						<End x="67.3259" y="63.2946"/>
					</TrackLine>
					<TrackLine>
						<End x="67.075" y="63.9003"/>
					</TrackLine>
					<TrackLine>
						<End x="62.325" y="84.3087"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="54.25" y="56.5"/>
					<TrackLine>
						<End x="54.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8927" y="59.4203"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8927" y="60.6185"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4026" y="62.5379"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4026" y="64.2705"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8854" y="65.9585"/>
					</TrackLine>
					<TrackLine>
						<End x="53.85" y="66.1362"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6779" y="69.9113"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1444" y="70.4449"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1266" y="70.9968"/>
					</TrackLine>
					<TrackLine>
						<End x="53.0681" y="71.6232"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="54.25" y="56.5"/>
					<TrackLine>
						<End x="54.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7471" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0211" y="53.917"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3044" y="53.4931"/>
					</TrackLine>
					<TrackLine>
						<End x="50.5876" y="53.0692"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0583" y="52.85"/>
					</TrackLine>
					<TrackLine>
						<End x="46.119" y="52.545"/>
					</TrackLine>
					<TrackLine>
						<End x="44.381" y="52.545"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7396" y="52.8107"/>
					</TrackLine>
					<TrackLine>
						<End x="31.5731" y="58.5522"/>
					</TrackLine>
					<TrackLine>
						<End x="28.8411" y="59.05"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0514" y="59.6315"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="58.5" y="47.7"/>
					<TrackLine>
						<End x="58.5" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="57.8606" y="44.075"/>
					</TrackLine>
					<TrackLine>
						<End x="57.7619" y="43.8368"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8416" y="42.9165"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6034" y="42.8178"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1888" y="42.1846"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4366" y="42.1846"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6801" y="44.037"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="58.5" y="50.375"/>
					<TrackLine>
						<End x="58.5" y="49.725"/>
					</TrackLine>
					<TrackLine>
						<End x="58.5" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="58.5" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="13.8193" y="53.7064"/>
					<TrackLine>
						<End x="14.4843" y="52.428"/>
					</TrackLine>
					<TrackLine>
						<End x="15.686" y="51.2263"/>
					</TrackLine>
					<TrackLine>
						<End x="20.1442" y="48.9655"/>
					</TrackLine>
					<TrackLine>
						<End x="26.2954" y="42.8967"/>
					</TrackLine>
					<TrackLine>
						<End x="26.5336" y="42.798"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6381" y="41.3753"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6925" y="41.3528"/>
					</TrackLine>
					<TrackLine>
						<End x="32.9674" y="40.7418"/>
					</TrackLine>
					<TrackLine>
						<End x="33.5731" y="40.4909"/>
					</TrackLine>
					<TrackLine>
						<End x="34.7334" y="40.165"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6967" y="39.8025"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7511" y="39.78"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1375" y="37.6536"/>
					</TrackLine>
					<TrackLine>
						<End x="40.7743" y="36.6068"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8287" y="36.5843"/>
					</TrackLine>
					<TrackLine>
						<End x="41.9313" y="36.5843"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5745" y="36.7244"/>
					</TrackLine>
					<TrackLine>
						<End x="46.2902" y="38.056"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="26.7892" y="58.4152"/>
					<TrackLine>
						<End x="26.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="26.6995" y="50.5726"/>
					<TrackLine>
						<End x="27.7918" y="53.7889"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="36" y="29"/>
					<TrackLine>
						<End x="36" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7004" y="34.2"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2924" y="34.642"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="27.7918" y="53.7889"/>
					<TrackLine>
						<End x="26.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="53.9554" y="70.7808"/>
					<TrackLine>
						<End x="54.2681" y="70.294"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3659" y="70.058"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3659" y="68.7588"/>
					</TrackLine>
					<TrackLine>
						<End x="54.35" y="68.3145"/>
					</TrackLine>
					<TrackLine>
						<End x="54.35" y="66.1855"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3661" y="66.1043"/>
					</TrackLine>
					<TrackLine>
						<End x="54.8331" y="64.3561"/>
					</TrackLine>
					<TrackLine>
						<End x="54.8331" y="62.4523"/>
					</TrackLine>
					<TrackLine>
						<End x="54.306" y="60.5308"/>
					</TrackLine>
					<TrackLine>
						<End x="54.306" y="59.508"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="85.25" y="56.5"/>
					<TrackLine>
						<End x="85.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9885" y="59.0235"/>
					</TrackLine>
					<TrackLine>
						<End x="86.6298" y="60.9047"/>
					</TrackLine>
					<TrackLine>
						<End x="86.6298" y="61.6569"/>
					</TrackLine>
					<TrackLine>
						<End x="86.2535" y="67.0503"/>
					</TrackLine>
					<TrackLine>
						<End x="86.2135" y="67.2233"/>
					</TrackLine>
					<TrackLine>
						<End x="86.2135" y="68.2977"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4536" y="71.8483"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="86.4536" y="71.8483"/>
					<TrackLine>
						<End x="86.95" y="72.7906"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="73.3704"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="75.2399"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="84.7613" y="76.2447"/>
					</TrackLine>
					<TrackLine>
						<End x="84.2294" y="76.7766"/>
					</TrackLine>
					<TrackLine>
						<End x="84.22" y="77.241"/>
					</TrackLine>
					<TrackLine>
						<End x="83.6881" y="77.7729"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2154" y="81.6369"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="55.25" y="56.5"/>
					<TrackLine>
						<End x="55.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3451" y="54.825"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3304" y="54.8189"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7471" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="53.0211" y="53.917"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3044" y="53.4931"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8708" y="52.6453"/>
					</TrackLine>
					<TrackLine>
						<End x="50.1578" y="52.35"/>
					</TrackLine>
					<TrackLine>
						<End x="46.212" y="52.0775"/>
					</TrackLine>
					<TrackLine>
						<End x="44.288" y="52.0775"/>
					</TrackLine>
					<TrackLine>
						<End x="43.4748" y="52.4143"/>
					</TrackLine>
					<TrackLine>
						<End x="37.1028" y="55.0928"/>
					</TrackLine>
					<TrackLine>
						<End x="36.9043" y="55.175"/>
					</TrackLine>
					<TrackLine>
						<End x="35.6043" y="55.175"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3457" y="55.175"/>
					</TrackLine>
					<TrackLine>
						<End x="27.7918" y="53.7889"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="22.25" y="38.75"/>
					<TrackLine>
						<End x="22.9" y="38.75"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4308" y="34.5843"/>
					</TrackLine>
					<TrackLine>
						<End x="42.3292" y="34.5843"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0481" y="34.7244"/>
					</TrackLine>
					<TrackLine>
						<End x="47.8153" y="35.6719"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="57.25" y="29"/>
					<TrackLine>
						<End x="57.25" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1875" y="34.6195"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="20.2233" y="67.2338"/>
					<TrackLine>
						<End x="25.8411" y="68.2072"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9811" y="68.2652"/>
					</TrackLine>
					<TrackLine>
						<End x="26.8263" y="69.1104"/>
					</TrackLine>
					<TrackLine>
						<End x="26.8843" y="69.2504"/>
					</TrackLine>
					<TrackLine>
						<End x="26.95" y="70.0385"/>
					</TrackLine>
					<TrackLine>
						<End x="27.154" y="70.531"/>
					</TrackLine>
					<TrackLine>
						<End x="28.269" y="71.646"/>
					</TrackLine>
					<TrackLine>
						<End x="28.3955" y="71.7724"/>
					</TrackLine>
					<TrackLine>
						<End x="28.9428" y="71.9991"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0933" y="73.2254"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7505" y="76.0239"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="77.25" y="74"/>
					<TrackLine>
						<End x="77.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1735" y="71.0949"/>
					</TrackLine>
					<TrackLine>
						<End x="75.745" y="70.1673"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="47.25" y="74"/>
					<TrackLine>
						<End x="47.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="46.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7505" y="76.0239"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="18.25" y="74"/>
					<TrackLine>
						<End x="18.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2452" y="69.1259"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2677" y="69.0715"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6794" y="68.4939"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6879" y="68.078"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2233" y="67.2338"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="42" y="69.25"/>
					<TrackLine>
						<End x="41.05" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="68.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1614" y="63.439"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="45.25" y="74"/>
					<TrackLine>
						<End x="45.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="42.95" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="42" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="50.8614" y="34.8145"/>
					<TrackLine>
						<End x="51.2795" y="34.2434"/>
					</TrackLine>
					<TrackLine>
						<End x="51.8114" y="33.7115"/>
					</TrackLine>
					<TrackLine>
						<End x="56" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="56" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="59.5" y="68.25"/>
					<TrackLine>
						<End x="60.45" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="60.45" y="68.25"/>
					<TrackLine>
						<End x="61.15" y="67.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="61.65" y="61.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="61.65" y="60.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="60.2377" y="56.2077"/>
					</TrackLine>
					<TrackLine>
						<End x="60.0629" y="55.7858"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5538" y="49.4739"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="59.5" y="69.25"/>
					<TrackLine>
						<End x="60.45" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6159" y="69.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8505" y="68.9159"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8505" y="68.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6159" y="68.3495"/>
					</TrackLine>
					<TrackLine>
						<End x="60.45" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="49.5593" y="34.8453"/>
					<TrackLine>
						<End x="49.9534" y="34.4384"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4853" y="33.9065"/>
					</TrackLine>
					<TrackLine>
						<End x="54.75" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="54.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="86.5" y="47.7"/>
					<TrackLine>
						<End x="86.5" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="85.5814" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="84.5446" y="45.7561"/>
					</TrackLine>
					<TrackLine>
						<End x="84.5299" y="45.75"/>
					</TrackLine>
					<TrackLine>
						<End x="77.6445" y="43.7168"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="87.75" y="47.7"/>
					<TrackLine>
						<End x="87.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="83.8009" y="39.278"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="76.6775" y="42.8232"/>
					<TrackLine>
						<End x="83.8009" y="39.278"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="72" y="69.25"/>
					<TrackLine>
						<End x="71.05" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="70.8246" y="69.0126"/>
					</TrackLine>
					<TrackLine>
						<End x="70.3515" y="68.5393"/>
					</TrackLine>
					<TrackLine>
						<End x="69.983" y="64.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="89" y="47.7"/>
					<TrackLine>
						<End x="89" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="87.6647" y="45.6118"/>
					</TrackLine>
					<TrackLine>
						<End x="87.6627" y="42.8043"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="75.25" y="74"/>
					<TrackLine>
						<End x="75.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="72.95" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="72" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="90.25" y="47.7"/>
					<TrackLine>
						<End x="90.25" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="91.15" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="91.15" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="91.15" y="67.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="90.8537" y="68.4172"/>
					</TrackLine>
					<TrackLine>
						<End x="90.7688" y="68.5022"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="90.25" y="47.7"/>
					<TrackLine>
						<End x="90.25" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="89.6957" y="46.0373"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="90.7688" y="68.5022"/>
					<TrackLine>
						<End x="90.8505" y="68.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="90.8505" y="68.9159"/>
					</TrackLine>
					<TrackLine>
						<End x="90.6159" y="69.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="90.45" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="89.5" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="89.5" y="68.25"/>
					<TrackLine>
						<End x="90.45" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="90.6159" y="68.3495"/>
					</TrackLine>
					<TrackLine>
						<End x="90.7688" y="68.5022"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="91.5" y="47.7"/>
					<TrackLine>
						<End x="91.5" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="90.6037" y="45.6612"/>
					</TrackLine>
					<TrackLine>
						<End x="90.0718" y="45.1293"/>
					</TrackLine>
					<TrackLine>
						<End x="89.3196" y="45.1293"/>
					</TrackLine>
					<TrackLine>
						<End x="88.5727" y="45.2357"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="80.018" y="38.5812"/>
					<TrackLine>
						<End x="90.25" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="90.25" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="89" y="29"/>
					<TrackLine>
						<End x="89" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0488" y="38.3679"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="16.25" y="74"/>
					<TrackLine>
						<End x="16.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="13.95" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="13" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="13" y="69.25"/>
					<TrackLine>
						<End x="12.05" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="11.35" y="68.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="10.075" y="63.1261"/>
					</TrackLine>
					<TrackLine>
						<End x="10.075" y="62.3739"/>
					</TrackLine>
					<TrackLine>
						<End x="12.9113" y="53.3303"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0604" y="52.1447"/>
					</TrackLine>
					<TrackLine>
						<End x="15.4027" y="50.8024"/>
					</TrackLine>
					<TrackLine>
						<End x="19.861" y="48.5417"/>
					</TrackLine>
					<TrackLine>
						<End x="26.0122" y="42.4728"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4341" y="42.298"/>
					</TrackLine>
					<TrackLine>
						<End x="31.4629" y="40.8753"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6841" y="40.3179"/>
					</TrackLine>
					<TrackLine>
						<End x="33.4736" y="39.9909"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6221" y="39.6699"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6468" y="39.665"/>
					</TrackLine>
					<TrackLine>
						<End x="36.5215" y="39.3025"/>
					</TrackLine>
					<TrackLine>
						<End x="38.8543" y="37.2297"/>
					</TrackLine>
					<TrackLine>
						<End x="40.491" y="36.183"/>
					</TrackLine>
					<TrackLine>
						<End x="40.7292" y="36.0843"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0308" y="36.0843"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7497" y="36.2244"/>
					</TrackLine>
					<TrackLine>
						<End x="46.661" y="37.1609"/>
					</TrackLine>
					<TrackLine>
						<End x="46.9483" y="37.4484"/>
					</TrackLine>
					<TrackLine>
						<End x="47.1722" y="37.5411"/>
					</TrackLine>
					<TrackLine>
						<End x="54.8076" y="39.6758"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5598" y="39.6758"/>
					</TrackLine>
					<TrackLine>
						<End x="65.0412" y="39.1006"/>
					</TrackLine>
					<TrackLine>
						<End x="66.3428" y="39.1006"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6651" y="41.4351"/>
					</TrackLine>
					<TrackLine>
						<End x="73.4173" y="41.4351"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0488" y="38.3679"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00005"/>
				<Subwire width="0.2">
					<Start x="13.75" y="83.25"/>
					<TrackLine>
						<End x="13.75" y="82.6"/>
					</TrackLine>
					<TrackLine>
						<End x="10.35" y="68.8594"/>
					</TrackLine>
					<TrackLine>
						<End x="9.075" y="63.4008"/>
					</TrackLine>
					<TrackLine>
						<End x="9.075" y="62.0992"/>
					</TrackLine>
					<TrackLine>
						<End x="12.5" y="46.4"/>
					</TrackLine>
					<TrackLine>
						<End x="12.5" y="45.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="43.642" y="56.241"/>
					<TrackLine>
						<End x="40.0427" y="57.55"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1459" y="57.9215"/>
					</TrackLine>
					<TrackLine>
						<End x="37.7215" y="59.3459"/>
					</TrackLine>
					<TrackLine>
						<End x="36.0804" y="61.7003"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0405" y="68.2919"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="32.0405" y="68.2919"/>
					<TrackLine>
						<End x="32.0405" y="68.4946"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8505" y="68.9159"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6159" y="69.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="31.45" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="30.5" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="30.5" y="68.25"/>
					<TrackLine>
						<End x="31.45" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0405" y="68.2919"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="76.5543" y="38.1627"/>
					<TrackLine>
						<End x="86.8314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="87.75" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="87.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="73.217" y="38.6897"/>
					<TrackLine>
						<End x="76.5543" y="38.1627"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00003"/>
				<Subwire width="0.2">
					<Start x="15" y="45.75"/>
					<TrackLine>
						<End x="15" y="46.4"/>
					</TrackLine>
					<TrackLine>
						<End x="15.1245" y="46.6073"/>
					</TrackLine>
					<TrackLine>
						<End x="15.4177" y="46.9005"/>
					</TrackLine>
					<TrackLine>
						<End x="15.8323" y="46.9005"/>
					</TrackLine>
					<TrackLine>
						<End x="16.1255" y="46.6073"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="46.4"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="45.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00003"/>
				<Subwire width="0.2">
					<Start x="11.25" y="83.25"/>
					<TrackLine>
						<End x="11.25" y="82.6"/>
					</TrackLine>
					<TrackLine>
						<End x="8.575" y="63.5003"/>
					</TrackLine>
					<TrackLine>
						<End x="8.575" y="61.9997"/>
					</TrackLine>
					<TrackLine>
						<End x="10.45" y="44.7686"/>
					</TrackLine>
					<TrackLine>
						<End x="10.9186" y="44.3"/>
					</TrackLine>
					<TrackLine>
						<End x="12.7489" y="43.1085"/>
					</TrackLine>
					<TrackLine>
						<End x="13.5011" y="43.1085"/>
					</TrackLine>
					<TrackLine>
						<End x="14.033" y="43.6404"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="45.1"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="45.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.2">
					<Start x="36.1454" y="38.3945"/>
					<TrackLine>
						<End x="30.7107" y="39.0593"/>
					</TrackLine>
					<TrackLine>
						<End x="25.4457" y="41.625"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2946" y="47.6939"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2799" y="47.7"/>
					</TrackLine>
					<TrackLine>
						<End x="18.2201" y="47.7"/>
					</TrackLine>
					<TrackLine>
						<End x="15.2106" y="47.4005"/>
					</TrackLine>
					<TrackLine>
						<End x="14.6686" y="47.2"/>
					</TrackLine>
					<TrackLine>
						<End x="13.75" y="46.4"/>
					</TrackLine>
					<TrackLine>
						<End x="13.75" y="45.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00001"/>
				<Subwire width="0.2">
					<Start x="55.1837" y="38.7678"/>
					<TrackLine>
						<End x="47.2691" y="37.054"/>
					</TrackLine>
					<TrackLine>
						<End x="47.2242" y="37.0354"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8813" y="36.6925"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8364" y="36.6739"/>
					</TrackLine>
					<TrackLine>
						<End x="43.8492" y="35.7244"/>
					</TrackLine>
					<TrackLine>
						<End x="42.1303" y="35.5843"/>
					</TrackLine>
					<TrackLine>
						<End x="40.6297" y="35.5843"/>
					</TrackLine>
					<TrackLine>
						<End x="30.5355" y="38.5593"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4811" y="38.5818"/>
					</TrackLine>
					<TrackLine>
						<End x="25.1744" y="41.1962"/>
					</TrackLine>
					<TrackLine>
						<End x="25.1534" y="41.2102"/>
					</TrackLine>
					<TrackLine>
						<End x="19.0814" y="47.2"/>
					</TrackLine>
					<TrackLine>
						<End x="18.4186" y="47.2"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="46.4"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="45.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00000"/>
				<Subwire width="0.2">
					<Start x="73.0412" y="40.5271"/>
					<TrackLine>
						<End x="66.4423" y="38.6006"/>
					</TrackLine>
					<TrackLine>
						<End x="47.4445" y="36.567"/>
					</TrackLine>
					<TrackLine>
						<End x="47.1572" y="36.2795"/>
					</TrackLine>
					<TrackLine>
						<End x="46.9333" y="36.1868"/>
					</TrackLine>
					<TrackLine>
						<End x="43.9487" y="35.2244"/>
					</TrackLine>
					<TrackLine>
						<End x="42.2297" y="35.0843"/>
					</TrackLine>
					<TrackLine>
						<End x="40.5303" y="35.0843"/>
					</TrackLine>
					<TrackLine>
						<End x="30.436" y="38.0593"/>
					</TrackLine>
					<TrackLine>
						<End x="30.1978" y="38.158"/>
					</TrackLine>
					<TrackLine>
						<End x="24.9376" y="40.7531"/>
					</TrackLine>
					<TrackLine>
						<End x="24.8347" y="40.8218"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="45.1"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="45.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="56"/>
				<Subwire width="0.2">
					<Start x="40.95" y="43.5"/>
					<TrackLine>
						<End x="40.3" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1555" y="43.6978"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="56"/>
				<Subwire width="0.2">
					<Start x="38.75" y="36.5"/>
					<TrackLine>
						<End x="38.75" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1555" y="43.6978"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="55"/>
				<Subwire width="0.2">
					<Start x="37.5" y="36.5"/>
					<TrackLine>
						<End x="37.5" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="37.3333" y="43.3572"/>
					</TrackLine>
					<TrackLine>
						<End x="37.3333" y="44.0384"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0478" y="44.9363"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="55"/>
				<Subwire width="0.2">
					<Start x="40.95" y="44.75"/>
					<TrackLine>
						<End x="40.3" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0478" y="44.9363"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="54"/>
				<Subwire width="0.2">
					<Start x="29.75" y="47.25"/>
					<TrackLine>
						<End x="30.4" y="47.25"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7834" y="45.9579"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="54"/>
				<Subwire width="0.2">
					<Start x="36.25" y="36.5"/>
					<TrackLine>
						<End x="36.25" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="35.773" y="37.4955"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2464" y="38.0221"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2464" y="38.7669"/>
					</TrackLine>
					<TrackLine>
						<End x="36.5048" y="43.2324"/>
					</TrackLine>
					<TrackLine>
						<End x="36.5048" y="44.2974"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6398" y="45.4876"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7834" y="45.9579"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="63.25" y="37.5"/>
					<TrackLine>
						<End x="62.425" y="36.9625"/>
					</TrackLine>
					<TrackLine>
						<End x="62.425" y="36.8625"/>
					</TrackLine>
					<TrackLine>
						<End x="62.425" y="36.8211"/>
					</TrackLine>
					<TrackLine>
						<End x="61.05" y="29.2778"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="61.05" y="29.2778"/>
					<TrackLine>
						<End x="46.8361" y="24.29"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8324" y="24.2885"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0915" y="23.5476"/>
					</TrackLine>
					<TrackLine>
						<End x="46.09" y="23.5439"/>
					</TrackLine>
					<TrackLine>
						<End x="46.09" y="22.4961"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0885" y="22.4924"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3476" y="21.7515"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3439" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2161" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2124" y="21.7485"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4715" y="21.0076"/>
					</TrackLine>
					<TrackLine>
						<End x="38.47" y="21.0039"/>
					</TrackLine>
					<TrackLine>
						<End x="38.47" y="19.9561"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4685" y="19.9524"/>
					</TrackLine>
					<TrackLine>
						<End x="37.7276" y="19.2115"/>
					</TrackLine>
					<TrackLine>
						<End x="37.7239" y="19.21"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6761" y="19.21"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6724" y="19.2115"/>
					</TrackLine>
					<TrackLine>
						<End x="35.9315" y="19.9524"/>
					</TrackLine>
					<TrackLine>
						<End x="35.93" y="19.9561"/>
					</TrackLine>
					<TrackLine>
						<End x="35.93" y="21.0039"/>
					</TrackLine>
					<TrackLine>
						<End x="35.96" y="22.4901"/>
					</TrackLine>
					<TrackLine>
						<End x="35.96" y="23.5499"/>
					</TrackLine>
					<TrackLine>
						<End x="35.9539" y="23.5646"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2046" y="24.3139"/>
					</TrackLine>
					<TrackLine>
						<End x="26.7054" y="29.4324"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="26.7054" y="29.4324"/>
					<TrackLine>
						<End x="26.25" y="28.9"/>
					</TrackLine>
					<TrackLine>
						<End x="26.25" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="61.05" y="29.2778"/>
					<TrackLine>
						<End x="63.4199" y="27.2565"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="25.2125" y="31.1813"/>
					<TrackLine>
						<End x="26.7054" y="29.4324"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="53"/>
				<Subwire width="0.2">
					<Start x="35.6826" y="43.573"/>
					<TrackLine>
						<End x="34.7989" y="44.3069"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="46"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="53"/>
				<Subwire width="0.2">
					<Start x="35" y="36.5"/>
					<TrackLine>
						<End x="35" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="34.7374" y="37.8432"/>
					</TrackLine>
					<TrackLine>
						<End x="34.7374" y="38.9458"/>
					</TrackLine>
					<TrackLine>
						<End x="35.6826" y="43.573"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="31"/>
				<Subwire width="0.2">
					<Start x="75.3" y="17.84"/>
					<TrackLine>
						<End x="74.15" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="73.91" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="71.6545" y="27.242"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="30"/>
				<Subwire width="0.2">
					<Start x="72.76" y="17.84"/>
					<TrackLine>
						<End x="71.61" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="71.37" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="70.6936" y="26.3417"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="24"/>
				<Subwire width="0.2">
					<Start x="14.34" y="20.48"/>
					<TrackLine>
						<End x="14.34" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="15.49" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="27.6"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="23"/>
				<Subwire width="0.2">
					<Start x="16.88" y="20.48"/>
					<TrackLine>
						<End x="16.88" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9433" y="22.4296"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9433" y="23.3104"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9433" y="23.6104"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="27.6"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="22"/>
				<Subwire width="0.2">
					<Start x="19.42" y="20.48"/>
					<TrackLine>
						<End x="19.42" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="18.3567" y="22.4296"/>
					</TrackLine>
					<TrackLine>
						<End x="18.3567" y="23.3104"/>
					</TrackLine>
					<TrackLine>
						<End x="18.3567" y="23.6104"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="27.6"/>
					</TrackLine>
					<TrackLine>
						<End x="18.75" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="21"/>
				<Subwire width="0.2">
					<Start x="21.96" y="20.48"/>
					<TrackLine>
						<End x="21.96" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="20.81" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="20" y="27.6"/>
					</TrackLine>
					<TrackLine>
						<End x="20" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="20"/>
				<Subwire width="0.2">
					<Start x="24.5" y="20.48"/>
					<TrackLine>
						<End x="23.35" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="23.11" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="27.6"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="18"/>
				<Subwire width="0.2">
					<Start x="29.58" y="20.48"/>
					<TrackLine>
						<End x="28.43" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="28.19" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="27.5163" y="24.32"/>
					</TrackLine>
					<TrackLine>
						<End x="24.6686" y="26.8"/>
					</TrackLine>
					<TrackLine>
						<End x="23.75" y="27.6"/>
					</TrackLine>
					<TrackLine>
						<End x="23.75" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="19"/>
				<Subwire width="0.2">
					<Start x="27.04" y="20.48"/>
					<TrackLine>
						<End x="25.89" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="25.65" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="22.5" y="27.6"/>
					</TrackLine>
					<TrackLine>
						<End x="22.5" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="52"/>
				<Subwire width="0.2">
					<Start x="29.75" y="44.75"/>
					<TrackLine>
						<End x="30.4" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4228" y="43.3989"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="52"/>
				<Subwire width="0.2">
					<Start x="33.75" y="36.5"/>
					<TrackLine>
						<End x="33.75" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4228" y="43.3989"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="51"/>
				<Subwire width="0.2">
					<Start x="32.5" y="36.5"/>
					<TrackLine>
						<End x="32.5" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="32.9845" y="35.4841"/>
					</TrackLine>
					<TrackLine>
						<End x="33.4186" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="33.9244" y="34.642"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="51"/>
				<Subwire width="0.2">
					<Start x="29.75" y="43.5"/>
					<TrackLine>
						<End x="30.4" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2" y="42.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6939" y="41.5446"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7" y="41.5299"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9948" y="40.3434"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="29.75" y="42.25"/>
					<TrackLine>
						<End x="30.4" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2" y="41.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2" y="40.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="31.0868" y="39.9673"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="32.6084" y="34.5761"/>
					<TrackLine>
						<End x="32.2004" y="35.0181"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6685" y="35.55"/>
					</TrackLine>
					<TrackLine>
						<End x="31.25" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="31.25" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="31.0868" y="39.9673"/>
					<TrackLine>
						<End x="31.25" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="31.25" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="57.75" y="36.5"/>
					<TrackLine>
						<End x="57.75" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="58.364" y="42.9724"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="58.364" y="42.9724"/>
					<TrackLine>
						<End x="59.55" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="60.2" y="43.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="55.9526" y="44.7258"/>
					<TrackLine>
						<End x="58.364" y="42.9724"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="15"/>
				<Subwire width="0.2">
					<Start x="41.3207" y="96.9066"/>
					<TrackLine>
						<End x="40.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="40.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="14"/>
				<Subwire width="0.2">
					<Start x="42.28" y="23.02"/>
					<TrackLine>
						<End x="42.288" y="37.6162"/>
					</TrackLine>
					<TrackLine>
						<End x="42.288" y="38.3684"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0558" y="39.1189"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="44.82" y="23.02"/>
					<TrackLine>
						<End x="43.1984" y="37.6324"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="17"/>
				<Subwire width="0.2">
					<Start x="32.12" y="20.48"/>
					<TrackLine>
						<End x="32.12" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="30.97" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="30.73" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="30.0563" y="24.32"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9186" y="26.8"/>
					</TrackLine>
					<TrackLine>
						<End x="25" y="27.6"/>
					</TrackLine>
					<TrackLine>
						<End x="25" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="12"/>
				<Subwire width="0.2">
					<Start x="94.558" y="91.6646"/>
					<TrackLine>
						<End x="92.85" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="91.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="37.2" y="20.48"/>
					<TrackLine>
						<End x="38.35" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="38.59" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="41.3" y="35.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="41.38" y="37.9923"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="65.692" y="41.0086"/>
					<TrackLine>
						<End x="64.3057" y="38.5552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="67.68" y="20.48"/>
					<TrackLine>
						<End x="67.68" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="66.53" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="64.384" y="34.8733"/>
					</TrackLine>
					<TrackLine>
						<End x="64.384" y="35.9759"/>
					</TrackLine>
					<TrackLine>
						<End x="64.575" y="36.6968"/>
					</TrackLine>
					<TrackLine>
						<End x="64.575" y="37.0282"/>
					</TrackLine>
					<TrackLine>
						<End x="64.575" y="38.3032"/>
					</TrackLine>
					<TrackLine>
						<End x="64.3407" y="38.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="64.3057" y="38.5552"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="64.3057" y="38.5552"/>
					<TrackLine>
						<End x="62.1593" y="38.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="61.925" y="38.3032"/>
					</TrackLine>
					<TrackLine>
						<End x="59.8" y="35.5186"/>
					</TrackLine>
					<TrackLine>
						<End x="59.3314" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2946" y="34.5561"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2799" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8383" y="32.7115"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6117" y="32.4065"/>
					</TrackLine>
					<TrackLine>
						<End x="50.1111" y="32.4065"/>
					</TrackLine>
					<TrackLine>
						<End x="48.809" y="32.4373"/>
					</TrackLine>
					<TrackLine>
						<End x="48.3871" y="32.6121"/>
					</TrackLine>
					<TrackLine>
						<End x="46.9263" y="33.8626"/>
					</TrackLine>
					<TrackLine>
						<End x="46.006" y="34.7829"/>
					</TrackLine>
					<TrackLine>
						<End x="44.1064" y="38.0085"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5745" y="38.5404"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1843" y="38.75"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1079" y="38.8069"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9069" y="39.0079"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9069" y="39.4714"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4083" y="39.97"/>
					</TrackLine>
					<TrackLine>
						<End x="41.7033" y="39.97"/>
					</TrackLine>
					<TrackLine>
						<End x="41.2047" y="39.4714"/>
					</TrackLine>
					<TrackLine>
						<End x="40.5403" y="38.3401"/>
					</TrackLine>
					<TrackLine>
						<End x="40.5403" y="37.6445"/>
					</TrackLine>
					<TrackLine>
						<End x="40.7317" y="37.4531"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8" y="36.4552"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8" y="36.1814"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8" y="35.5186"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3314" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2946" y="34.5561"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2799" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4757" y="33.234"/>
					</TrackLine>
					<TrackLine>
						<End x="33.1597" y="33.1681"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0571" y="33.1681"/>
					</TrackLine>
					<TrackLine>
						<End x="30.7411" y="33.234"/>
					</TrackLine>
					<TrackLine>
						<End x="30.6867" y="33.2565"/>
					</TrackLine>
					<TrackLine>
						<End x="29.9069" y="34.0363"/>
					</TrackLine>
					<TrackLine>
						<End x="28.7061" y="35.3054"/>
					</TrackLine>
					<TrackLine>
						<End x="28.7" y="35.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3" y="41.6207"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1844" y="44.706"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="36.75" y="99.25"/>
					<TrackLine>
						<End x="36.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="36.8495" y="98.1341"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0841" y="97.8995"/>
					</TrackLine>
					<TrackLine>
						<End x="37.1977" y="97.8995"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="45.775" y="47.0133"/>
					<TrackLine>
						<End x="48.35" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="37.1977" y="97.8995"/>
					<TrackLine>
						<End x="37.4159" y="97.8995"/>
					</TrackLine>
					<TrackLine>
						<End x="37.6505" y="98.1341"/>
					</TrackLine>
					<TrackLine>
						<End x="37.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="37.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="36.0669" y="97.7729"/>
					<TrackLine>
						<End x="36.5016" y="97.7003"/>
					</TrackLine>
					<TrackLine>
						<End x="36.9984" y="97.7003"/>
					</TrackLine>
					<TrackLine>
						<End x="37.1977" y="97.8995"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="75.108" y="29.453"/>
					<TrackLine>
						<End x="70.1" y="35.3164"/>
					</TrackLine>
					<TrackLine>
						<End x="70.0414" y="35.375"/>
					</TrackLine>
					<TrackLine>
						<End x="70" y="35.375"/>
					</TrackLine>
					<TrackLine>
						<End x="69.9" y="35.375"/>
					</TrackLine>
					<TrackLine>
						<End x="68.25" y="36.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="14.3145" y="29.0809"/>
					<TrackLine>
						<End x="15.8025" y="42.0313"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="91.75" y="27"/>
					<TrackLine>
						<End x="90.54" y="24.95"/>
					</TrackLine>
					<TrackLine>
						<End x="90.54" y="24.85"/>
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
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="14.3145" y="29.0809"/>
					<TrackLine>
						<End x="11.8" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="94.375" y="37.875"/>
					<TrackLine>
						<End x="93.5" y="39.525"/>
					</TrackLine>
					<TrackLine>
						<End x="93.4" y="39.525"/>
					</TrackLine>
					<TrackLine>
						<End x="93.3586" y="39.525"/>
					</TrackLine>
					<TrackLine>
						<End x="90.0145" y="42.2694"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="23.5" y="94.75"/>
					<TrackLine>
						<End x="24.375" y="96.4"/>
					</TrackLine>
					<TrackLine>
						<End x="24.475" y="96.4"/>
					</TrackLine>
					<TrackLine>
						<End x="24.5164" y="96.4"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9282" y="96.5207"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6804" y="96.5207"/>
					</TrackLine>
					<TrackLine>
						<End x="31.1365" y="96.118"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8887" y="96.118"/>
					</TrackLine>
					<TrackLine>
						<End x="33.6758" y="96.1516"/>
					</TrackLine>
					<TrackLine>
						<End x="35.0019" y="96.3615"/>
					</TrackLine>
					<TrackLine>
						<End x="35.5338" y="96.8934"/>
					</TrackLine>
					<TrackLine>
						<End x="36.0669" y="97.7729"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="53.5" y="90"/>
					<TrackLine>
						<End x="52.55" y="90"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7688" y="88.9037"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="83.312" y="76.8649"/>
					<TrackLine>
						<End x="86.4012" y="81.671"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="28.4894" y="78.2821"/>
					<TrackLine>
						<End x="29.4692" y="80.6144"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="92.5" y="75.75"/>
					<TrackLine>
						<End x="90.85" y="76.625"/>
					</TrackLine>
					<TrackLine>
						<End x="90.85" y="76.725"/>
					</TrackLine>
					<TrackLine>
						<End x="90.85" y="76.7664"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3661" y="81.5761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="32.12" y="15.3"/>
					<TrackLine>
						<End x="32.12" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="90.54" y="23.02"/>
					<TrackLine>
						<End x="90.54" y="22.87"/>
					</TrackLine>
					<TrackLine>
						<End x="90.54" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="80.38" y="15.3"/>
					<TrackLine>
						<End x="81.1699" y="16.9335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="81.1699" y="16.9335"/>
					<TrackLine>
						<End x="88.4763" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="90.54" y="20.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="86.4012" y="81.671"/>
					<TrackLine>
						<End x="83.8664" y="86.6036"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="91.75" y="27"/>
					<TrackLine>
						<End x="88.15" y="29.05"/>
					</TrackLine>
					<TrackLine>
						<End x="88.05" y="29.05"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0086" y="29.05"/>
					</TrackLine>
					<TrackLine>
						<End x="75.108" y="29.453"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="36.0669" y="97.7729"/>
					<TrackLine>
						<End x="35.8495" y="98.1341"/>
					</TrackLine>
					<TrackLine>
						<End x="35.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="35.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="34.66" y="23.02"/>
					<TrackLine>
						<End x="33.51" y="21.1063"/>
					</TrackLine>
					<TrackLine>
						<End x="33.27" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="32.12" y="17.84"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="15.8025" y="42.0313"/>
					<TrackLine>
						<End x="13.125" y="44.0165"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="45.775" y="47.0133"/>
					<TrackLine>
						<End x="41.9314" y="49.3"/>
					</TrackLine>
					<TrackLine>
						<End x="40.6314" y="49.3"/>
					</TrackLine>
					<TrackLine>
						<End x="39.9686" y="49.3"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="22.25" y="56.5"/>
					<TrackLine>
						<End x="22.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="23.3359" y="54.7009"/>
					</TrackLine>
					<TrackLine>
						<End x="23.8678" y="54.169"/>
					</TrackLine>
					<TrackLine>
						<End x="26.048" y="51.3959"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="91.75" y="27"/>
					<TrackLine>
						<End x="88.15" y="24.95"/>
					</TrackLine>
					<TrackLine>
						<End x="88.15" y="24.85"/>
					</TrackLine>
					<TrackLine>
						<End x="88.15" y="24.8086"/>
					</TrackLine>
					<TrackLine>
						<End x="88" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="88" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="66.25" y="67.25"/>
					<TrackLine>
						<End x="67.9" y="68.125"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="68.225"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="68.2664"/>
					</TrackLine>
					<TrackLine>
						<End x="68.5337" y="69.9927"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0656" y="70.5246"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8178" y="70.5246"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2399" y="69.95"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3149" y="68.8301"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="90.0145" y="42.2694"/>
					<TrackLine>
						<End x="86.65" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="41"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="77.84" y="15.3"/>
					<TrackLine>
						<End x="80.38" y="15.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="25" y="47"/>
					<TrackLine>
						<End x="25" y="46.35"/>
					</TrackLine>
					<TrackLine>
						<End x="24.0814" y="45.55"/>
					</TrackLine>
					<TrackLine>
						<End x="15.8025" y="42.0313"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="45" y="44.375"/>
					<TrackLine>
						<End x="45.775" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="45.775" y="45.35"/>
					</TrackLine>
					<TrackLine>
						<End x="45.775" y="47.0133"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="68.25" y="36.25"/>
					<TrackLine>
						<End x="66.6" y="35.4246"/>
					</TrackLine>
					<TrackLine>
						<End x="66.5" y="35.4246"/>
					</TrackLine>
					<TrackLine>
						<End x="65.792" y="35.4246"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="51.25" y="56.5"/>
					<TrackLine>
						<End x="51.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="61.2304" y="51.7183"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="92.2" y="86.5"/>
					<TrackLine>
						<End x="91.55" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3661" y="81.5761"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="94.375" y="37.875"/>
					<TrackLine>
						<End x="95.25" y="36.225"/>
					</TrackLine>
					<TrackLine>
						<End x="95.25" y="36.125"/>
					</TrackLine>
					<TrackLine>
						<End x="95.25" y="36.0836"/>
					</TrackLine>
					<TrackLine>
						<End x="95.85" y="34.3157"/>
					</TrackLine>
					<TrackLine>
						<End x="95.85" y="30.8157"/>
					</TrackLine>
					<TrackLine>
						<End x="95.85" y="30.4843"/>
					</TrackLine>
					<TrackLine>
						<End x="95.55" y="29.1086"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4914" y="29.05"/>
					</TrackLine>
					<TrackLine>
						<End x="95.45" y="29.05"/>
					</TrackLine>
					<TrackLine>
						<End x="95.35" y="29.05"/>
					</TrackLine>
					<TrackLine>
						<End x="91.75" y="27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="26.048" y="51.3959"/>
					<TrackLine>
						<End x="25.7915" y="50.9487"/>
					</TrackLine>
					<TrackLine>
						<End x="25" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="25" y="47"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="88.3661" y="81.5761"/>
					<TrackLine>
						<End x="86.4012" y="81.671"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="23.5" y="94.75"/>
					<TrackLine>
						<End x="22.625" y="93.1"/>
					</TrackLine>
					<TrackLine>
						<End x="22.625" y="93"/>
					</TrackLine>
					<TrackLine>
						<End x="22.625" y="92.9586"/>
					</TrackLine>
					<TrackLine>
						<End x="19.858" y="82.5912"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="26.048" y="51.3959"/>
					<TrackLine>
						<End x="26.3234" y="51.4806"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0756" y="51.4806"/>
					</TrackLine>
					<TrackLine>
						<End x="27.6075" y="50.9487"/>
					</TrackLine>
					<TrackLine>
						<End x="29.1" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="36.25" y="67.25"/>
					<TrackLine>
						<End x="34.6" y="68.125"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6" y="68.225"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6" y="68.2664"/>
					</TrackLine>
					<TrackLine>
						<End x="31.5614" y="71.9413"/>
					</TrackLine>
					<TrackLine>
						<End x="28.4894" y="78.2821"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="15" y="28.25"/>
					<TrackLine>
						<End x="15" y="28.9"/>
					</TrackLine>
					<TrackLine>
						<End x="14.3145" y="29.0809"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="19.858" y="82.5912"/>
					<TrackLine>
						<End x="14.617" y="75.7211"/>
					</TrackLine>
					<TrackLine>
						<End x="10.85" y="69.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="10.6709" y="69.3515"/>
					</TrackLine>
					<TrackLine>
						<End x="10.6495" y="69.2999"/>
					</TrackLine>
					<TrackLine>
						<End x="8.625" y="54.7914"/>
					</TrackLine>
					<TrackLine>
						<End x="8.625" y="54.75"/>
					</TrackLine>
					<TrackLine>
						<End x="8.625" y="54.65"/>
					</TrackLine>
					<TrackLine>
						<End x="7.75" y="53"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="51.4112" y="63.4042"/>
					<TrackLine>
						<End x="51.6287" y="62.7457"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6587" y="61.6498"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6587" y="60.6038"/>
					</TrackLine>
					<TrackLine>
						<End x="50.842" y="59.7504"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6088" y="59.5173"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6088" y="58.8467"/>
					</TrackLine>
					<TrackLine>
						<End x="51.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="51.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="80.38" y="17.84"/>
					<TrackLine>
						<End x="81.1699" y="16.9335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="92.5" y="75.75"/>
					<TrackLine>
						<End x="94.15" y="74.875"/>
					</TrackLine>
					<TrackLine>
						<End x="94.15" y="74.775"/>
					</TrackLine>
					<TrackLine>
						<End x="94.15" y="74.7336"/>
					</TrackLine>
					<TrackLine>
						<End x="94.65" y="72.6407"/>
					</TrackLine>
					<TrackLine>
						<End x="94.65" y="70.6907"/>
					</TrackLine>
					<TrackLine>
						<End x="94.65" y="70.3593"/>
					</TrackLine>
					<TrackLine>
						<End x="90.6037" y="45.6612"/>
					</TrackLine>
					<TrackLine>
						<End x="90.0145" y="42.2694"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="77.84" y="15.3"/>
					<TrackLine>
						<End x="75.8446" y="14.0061"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8299" y="14"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7701" y="14"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1301" y="14"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1154" y="14.0061"/>
					</TrackLine>
					<TrackLine>
						<End x="32.12" y="15.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="32.12" y="15.3"/>
					<TrackLine>
						<End x="11.2005" y="18.68"/>
					</TrackLine>
					<TrackLine>
						<End x="11.0572" y="18.7394"/>
					</TrackLine>
					<TrackLine>
						<End x="10.2094" y="19.5872"/>
					</TrackLine>
					<TrackLine>
						<End x="10.15" y="19.7305"/>
					</TrackLine>
					<TrackLine>
						<End x="9.65" y="22.1711"/>
					</TrackLine>
					<TrackLine>
						<End x="8.625" y="51.2086"/>
					</TrackLine>
					<TrackLine>
						<End x="8.625" y="51.25"/>
					</TrackLine>
					<TrackLine>
						<End x="8.625" y="51.35"/>
					</TrackLine>
					<TrackLine>
						<End x="7.75" y="53"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="81.25" y="56.5"/>
					<TrackLine>
						<End x="81.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1293" y="67.4727"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="60"/>
				<Subwire width="0.2">
					<Start x="30.3256" y="82.3385"/>
					<TrackLine>
						<End x="29.0931" y="81.5224"/>
					</TrackLine>
					<TrackLine>
						<End x="28.5612" y="80.9905"/>
					</TrackLine>
					<TrackLine>
						<End x="27.5814" y="78.6582"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="60"/>
				<Subwire width="0.2">
					<Start x="27.25" y="74"/>
					<TrackLine>
						<End x="27.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="29.55" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="30.5" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="33"/>
				<Subwire width="0.2">
					<Start x="39.1202" y="91.8809"/>
					<TrackLine>
						<End x="37.5227" y="91.0174"/>
					</TrackLine>
					<TrackLine>
						<End x="36.2065" y="90.6126"/>
					</TrackLine>
					<TrackLine>
						<End x="34.8081" y="90.2755"/>
					</TrackLine>
					<TrackLine>
						<End x="33.7055" y="90.2755"/>
					</TrackLine>
					<TrackLine>
						<End x="30.45" y="90.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="90.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="59"/>
				<Subwire width="0.2">
					<Start x="26.4236" y="88.0822"/>
					<TrackLine>
						<End x="26.006" y="87.545"/>
					</TrackLine>
					<TrackLine>
						<End x="15.55" y="75.2399"/>
					</TrackLine>
					<TrackLine>
						<End x="13.95" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="13" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="59"/>
				<Subwire width="0.2">
					<Start x="13" y="69.25"/>
					<TrackLine>
						<End x="12.05" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8841" y="69.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="11.6495" y="68.9159"/>
					</TrackLine>
					<TrackLine>
						<End x="11.6495" y="68.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8841" y="68.3495"/>
					</TrackLine>
					<TrackLine>
						<End x="12.05" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="13" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="47"/>
				<Subwire width="0.2">
					<Start x="43.3675" y="91.9099"/>
					<TrackLine>
						<End x="42.2287" y="97.2827"/>
					</TrackLine>
					<TrackLine>
						<End x="41.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="41.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="46"/>
				<Subwire width="0.2">
					<Start x="43.5932" y="95.8019"/>
					<TrackLine>
						<End x="42.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="42.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="45"/>
				<Subwire width="0.2">
					<Start x="45.3645" y="96.1289"/>
					<TrackLine>
						<End x="43.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="43.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="44"/>
				<Subwire width="0.2">
					<Start x="48.4457" y="95.6127"/>
					<TrackLine>
						<End x="47.95" y="94.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="94.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="43"/>
				<Subwire width="0.2">
					<Start x="49.8547" y="91.9955"/>
					<TrackLine>
						<End x="47.95" y="93.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="93.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="42"/>
				<Subwire width="0.2">
					<Start x="45.0436" y="91.0384"/>
					<TrackLine>
						<End x="45.35" y="91.7899"/>
					</TrackLine>
					<TrackLine>
						<End x="46.05" y="92.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="92.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="34"/>
				<Subwire width="0.2">
					<Start x="35.8304" y="91.5206"/>
					<TrackLine>
						<End x="34.6329" y="90.7755"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8807" y="90.7755"/>
					</TrackLine>
					<TrackLine>
						<End x="30.45" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="91.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="41"/>
				<Subwire width="0.2">
					<Start x="48.7825" y="91.3457"/>
					<TrackLine>
						<End x="47.95" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="91.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="40"/>
				<Subwire width="0.2">
					<Start x="34.6258" y="97.2695"/>
					<TrackLine>
						<End x="34.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="34.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="39"/>
				<Subwire width="0.2">
					<Start x="33.2997" y="97.0596"/>
					<TrackLine>
						<End x="33.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="33.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="38"/>
				<Subwire width="0.2">
					<Start x="31.5126" y="97.026"/>
					<TrackLine>
						<End x="32.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="32.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="35"/>
				<Subwire width="0.2">
					<Start x="34.2568" y="91.6835"/>
					<TrackLine>
						<End x="30.45" y="92.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="92.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="117"/>
				<Subwire width="0.2">
					<Start x="39.6339" y="85.8143"/>
					<TrackLine>
						<End x="39.75" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="39.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="36"/>
				<Subwire width="0.2">
					<Start x="37.1466" y="91.9254"/>
					<TrackLine>
						<End x="36.2065" y="92.4286"/>
					</TrackLine>
					<TrackLine>
						<End x="30.45" y="93.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="93.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="52.8285" y="50.0296"/>
					<TrackLine>
						<End x="45.1956" y="53.4931"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4789" y="53.917"/>
					</TrackLine>
					<TrackLine>
						<End x="43.0363" y="54.8555"/>
					</TrackLine>
					<TrackLine>
						<End x="42.2565" y="55.6353"/>
					</TrackLine>
					<TrackLine>
						<End x="39.85" y="60.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="39.85" y="61.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="39.85" y="62.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="39.9963" y="63.0932"/>
					</TrackLine>
					<TrackLine>
						<End x="39.9963" y="63.7848"/>
					</TrackLine>
					<TrackLine>
						<End x="39.9827" y="63.8079"/>
					</TrackLine>
					<TrackLine>
						<End x="39.85" y="64.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6495" y="68.2001"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6495" y="69.2999"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6709" y="69.3515"/>
					</TrackLine>
					<TrackLine>
						<End x="39.85" y="69.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3032" y="78.4388"/>
					</TrackLine>
					<TrackLine>
						<End x="45.037" y="79.6305"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9082" y="80.686"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9117" y="80.6945"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9117" y="81.7475"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9082" y="81.756"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6497" y="82.0145"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9394" y="83.1927"/>
					</TrackLine>
					<TrackLine>
						<End x="44.2427" y="83.8894"/>
					</TrackLine>
					<TrackLine>
						<End x="43.8595" y="84.1527"/>
					</TrackLine>
					<TrackLine>
						<End x="42.7985" y="85.2137"/>
					</TrackLine>
					<TrackLine>
						<End x="42.6237" y="85.6356"/>
					</TrackLine>
					<TrackLine>
						<End x="41.0282" y="92.5317"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8268" y="96.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2647" y="97.2362"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="56.5" y="36.5"/>
					<TrackLine>
						<End x="56.5" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="55.6096" y="43.7213"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5279" y="43.9186"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1445" y="44.3911"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1445" y="45.0605"/>
					</TrackLine>
					<TrackLine>
						<End x="55.6179" y="45.5339"/>
					</TrackLine>
					<TrackLine>
						<End x="56.0391" y="45.942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="60.2" y="44.75"/>
					<TrackLine>
						<End x="59.55" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="56.0391" y="45.942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="39.2647" y="97.2362"/>
					<TrackLine>
						<End x="39.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="39.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="58.25" y="99.25"/>
					<TrackLine>
						<End x="58.25" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="54.45" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5" y="96"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="51.9358" y="45.8531"/>
					<TrackLine>
						<End x="49.65" y="47.25"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="47.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="53.5" y="96"/>
					<TrackLine>
						<End x="52.55" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8218" y="96.5207"/>
					</TrackLine>
					<TrackLine>
						<End x="48.0696" y="96.5207"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7601" y="95.2"/>
					</TrackLine>
					<TrackLine>
						<End x="45.35" y="94.7899"/>
					</TrackLine>
					<TrackLine>
						<End x="44.2682" y="91.5368"/>
					</TrackLine>
					<TrackLine>
						<End x="44.1429" y="91.4115"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1276" y="88.2854"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1237" y="87.0367"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1237" y="85.7351"/>
					</TrackLine>
					<TrackLine>
						<End x="43.2224" y="85.4969"/>
					</TrackLine>
					<TrackLine>
						<End x="44.1427" y="84.5766"/>
					</TrackLine>
					<TrackLine>
						<End x="44.5121" y="84.3195"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3695" y="83.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0206" y="82.2623"/>
					</TrackLine>
					<TrackLine>
						<End x="46.2792" y="82.0039"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3493" y="81.8345"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3493" y="80.6075"/>
					</TrackLine>
					<TrackLine>
						<End x="46.2792" y="80.4381"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4608" y="79.3472"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7807" y="78.2092"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="40.1495" y="69.123"/>
					</TrackLine>
					<TrackLine>
						<End x="40.1495" y="68.377"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="64.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4164" y="63.9876"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4231" y="63.9616"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4231" y="62.9164"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="62.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="42.734" y="55.8649"/>
					</TrackLine>
					<TrackLine>
						<End x="43.2659" y="55.333"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7529" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4789" y="53.917"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6406" y="53.85"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1051" y="50.8819"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1595" y="50.8594"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9393" y="50.0796"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3698" y="49.458"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="55.25" y="36.5"/>
					<TrackLine>
						<End x="55.25" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="54.2757" y="38.3917"/>
					</TrackLine>
					<TrackLine>
						<End x="54.2757" y="39.1439"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6837" y="42.7318"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6837" y="43.4534"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3973" y="44.0066"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3443" y="44.1346"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3443" y="45.317"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6919" y="46.4813"/>
					</TrackLine>
					<TrackLine>
						<End x="54.7052" y="46.5133"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3698" y="49.458"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="112"/>
				<Subwire width="0.2">
					<Start x="64.9604" y="84.4414"/>
					<TrackLine>
						<End x="66.25" y="82.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="112"/>
				<Subwire width="0.2">
					<Start x="66.25" y="82.7"/>
					<TrackLine>
						<End x="66.25" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="112"/>
				<Subwire width="0.2">
					<Start x="71" y="85"/>
					<TrackLine>
						<End x="70.05" y="85"/>
					</TrackLine>
					<TrackLine>
						<End x="66.25" y="82.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="54" y="36.5"/>
					<TrackLine>
						<End x="54" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7757" y="38.2165"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7757" y="39.3191"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8127" y="43.0926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="58.25" y="81.75"/>
					<TrackLine>
						<End x="58.25" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3495" y="80.6341"/>
					</TrackLine>
					<TrackLine>
						<End x="58.5841" y="80.3995"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8135" y="80.3879"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="49" y="46"/>
					<TrackLine>
						<End x="49.65" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8162" y="45.253"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="58.8135" y="80.3879"/>
					<TrackLine>
						<End x="60.7194" y="77.541"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="59.25" y="81.75"/>
					<TrackLine>
						<End x="59.25" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="59.1505" y="80.6341"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9159" y="80.3995"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8135" y="80.3879"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="111"/>
				<Subwire width="0.2">
					<Start x="66.25" y="99.25"/>
					<TrackLine>
						<End x="66.25" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="65.75" y="97.3744"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="111"/>
				<Subwire width="0.2">
					<Start x="65.75" y="97.3744"/>
					<TrackLine>
						<End x="65.25" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="65.25" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="19.25" y="56.5"/>
					<TrackLine>
						<End x="19.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="20.87" y="62.9407"/>
					</TrackLine>
					<TrackLine>
						<End x="21.0895" y="66.875"/>
					</TrackLine>
					<TrackLine>
						<End x="21.0895" y="67.5926"/>
					</TrackLine>
					<TrackLine>
						<End x="20.5959" y="68.4541"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="48.25" y="56.5"/>
					<TrackLine>
						<End x="48.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0102" y="59.9323"/>
					</TrackLine>
					<TrackLine>
						<End x="49.185" y="60.3542"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2835" y="60.4718"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="47" y="90.5"/>
					<TrackLine>
						<End x="46.05" y="90.5"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4299" y="89.0201"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6501" y="88.2403"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6276" y="88.1859"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6237" y="86.9372"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6237" y="85.8346"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6462" y="85.7802"/>
					</TrackLine>
					<TrackLine>
						<End x="44.426" y="85.0004"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7923" y="84.7388"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7888" y="83.7423"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3916" y="82.5102"/>
					</TrackLine>
					<TrackLine>
						<End x="46.6501" y="82.2517"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7868" y="81.9216"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7868" y="80.5204"/>
					</TrackLine>
					<TrackLine>
						<End x="46.6501" y="80.1903"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9383" y="79.1176"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6887" y="77.8331"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="72.639" y="49.508"/>
					<TrackLine>
						<End x="70.7292" y="49.508"/>
					</TrackLine>
					<TrackLine>
						<End x="69.5769" y="49.7243"/>
					</TrackLine>
					<TrackLine>
						<End x="68.9993" y="49.9636"/>
					</TrackLine>
					<TrackLine>
						<End x="67.8191" y="51.1438"/>
					</TrackLine>
					<TrackLine>
						<End x="67.5798" y="51.7214"/>
					</TrackLine>
					<TrackLine>
						<End x="67.5798" y="52.0073"/>
					</TrackLine>
					<TrackLine>
						<End x="67.0949" y="52.9919"/>
					</TrackLine>
					<TrackLine>
						<End x="66.3916" y="53.8984"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4713" y="54.8187"/>
					</TrackLine>
					<TrackLine>
						<End x="64.5123" y="55.6532"/>
					</TrackLine>
					<TrackLine>
						<End x="58.7518" y="60.4155"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3666" y="60.575"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2704" y="60.575"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7807" y="64.2962"/>
					</TrackLine>
					<TrackLine>
						<End x="51.0417" y="64.2962"/>
					</TrackLine>
					<TrackLine>
						<End x="50.5192" y="63.7737"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9073" y="62.7065"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5137" y="61.4923"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2835" y="60.4718"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="78.25" y="56.5"/>
					<TrackLine>
						<End x="78.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0624" y="59.8181"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7254" y="68.2177"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7254" y="69.3203"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0815" y="70.7188"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="78.25" y="56.5"/>
					<TrackLine>
						<End x="78.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="76.4269" y="54.6737"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7194" y="54.4167"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7806" y="54.4167"/>
					</TrackLine>
					<TrackLine>
						<End x="74.353" y="54.8442"/>
					</TrackLine>
					<TrackLine>
						<End x="73.98" y="54.9987"/>
					</TrackLine>
					<TrackLine>
						<End x="72.5326" y="54.9987"/>
					</TrackLine>
					<TrackLine>
						<End x="72.0288" y="54.9584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="53.5" y="93"/>
					<TrackLine>
						<End x="52.55" y="93"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2308" y="91.0875"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1586" y="90.4377"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4064" y="90.4377"/>
					</TrackLine>
					<TrackLine>
						<End x="47.95" y="90.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="90.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="78.1334" y="68.769"/>
					<TrackLine>
						<End x="78.2213" y="66.8219"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8784" y="60.5703"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8784" y="59.8181"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4729" y="58.9871"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4729" y="58.2349"/>
					</TrackLine>
					<TrackLine>
						<End x="79.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="79.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="49.25" y="56.5"/>
					<TrackLine>
						<End x="49.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8061" y="59.7739"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8597" y="59.9034"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0929" y="60.1365"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3961" y="61.1268"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="70.4799" y="54.1931"/>
					<TrackLine>
						<End x="71.6908" y="54.1424"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3668" y="54.1424"/>
					</TrackLine>
					<TrackLine>
						<End x="72.5237" y="54.2993"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6604" y="54.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8522" y="54.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9889" y="54.2993"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5355" y="54.0018"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6605" y="53.95"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8395" y="53.95"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5212" y="54.1995"/>
					</TrackLine>
					<TrackLine>
						<End x="77.7471" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="79.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="79.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="68.3086" y="45.392"/>
					<TrackLine>
						<End x="66.2511" y="45.1085"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4989" y="45.1085"/>
					</TrackLine>
					<TrackLine>
						<End x="64.967" y="45.6404"/>
					</TrackLine>
					<TrackLine>
						<End x="62.5678" y="49.3278"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6778" y="50.2178"/>
					</TrackLine>
					<TrackLine>
						<End x="61.4793" y="50.3"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6791" y="50.3103"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4035" y="52.3819"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6406" y="53.85"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4789" y="53.917"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7529" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="20.25" y="56.5"/>
					<TrackLine>
						<End x="20.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="20.7202" y="60.5392"/>
					</TrackLine>
					<TrackLine>
						<End x="21.37" y="62.8412"/>
					</TrackLine>
					<TrackLine>
						<End x="21.5478" y="66.6991"/>
					</TrackLine>
					<TrackLine>
						<End x="21.5478" y="67.7685"/>
					</TrackLine>
					<TrackLine>
						<End x="21.4296" y="68.7994"/>
					</TrackLine>
					<TrackLine>
						<End x="20.6532" y="69.6772"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="47" y="89.5"/>
					<TrackLine>
						<End x="46.05" y="89.5"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6595" y="88.5426"/>
					</TrackLine>
					<TrackLine>
						<End x="44.1276" y="88.0107"/>
					</TrackLine>
					<TrackLine>
						<End x="44.1237" y="86.762"/>
					</TrackLine>
					<TrackLine>
						<End x="44.1237" y="86.0098"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6556" y="85.4779"/>
					</TrackLine>
					<TrackLine>
						<End x="45.0725" y="85.1582"/>
					</TrackLine>
					<TrackLine>
						<End x="46.2082" y="84.0225"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8256" y="82.6949"/>
					</TrackLine>
					<TrackLine>
						<End x="47.021" y="82.4996"/>
					</TrackLine>
					<TrackLine>
						<End x="47.2244" y="82.0086"/>
					</TrackLine>
					<TrackLine>
						<End x="47.2244" y="80.4334"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8463" y="78.7415"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="53.5" y="92"/>
					<TrackLine>
						<End x="52.55" y="92"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4604" y="90.61"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3882" y="89.9602"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3338" y="89.9377"/>
					</TrackLine>
					<TrackLine>
						<End x="47.95" y="89.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="89.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="53.5" y="91"/>
					<TrackLine>
						<End x="52.55" y="91"/>
					</TrackLine>
					<TrackLine>
						<End x="47.95" y="88.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="88.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="50.25" y="56.5"/>
					<TrackLine>
						<End x="50.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2075" y="58.6805"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2075" y="59.6835"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4942" y="59.9703"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2314" y="60.7808"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2314" y="61.4728"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7207" y="62.3696"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="70.4114" y="52.5559"/>
					<TrackLine>
						<End x="70.7597" y="53.0893"/>
					</TrackLine>
					<TrackLine>
						<End x="71.2755" y="53.6051"/>
					</TrackLine>
					<TrackLine>
						<End x="72.5358" y="53.7344"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7493" y="53.948"/>
					</TrackLine>
					<TrackLine>
						<End x="73.7633" y="53.948"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2711" y="53.6061"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5676" y="53.4833"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9324" y="53.4833"/>
					</TrackLine>
					<TrackLine>
						<End x="76.6155" y="53.7254"/>
					</TrackLine>
					<TrackLine>
						<End x="77.8594" y="53.85"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0211" y="53.917"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7471" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="79.6262" y="69.8421"/>
					<TrackLine>
						<End x="79.5414" y="68.2177"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5189" y="68.1633"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2213" y="67.8488"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2213" y="67.0966"/>
					</TrackLine>
					<TrackLine>
						<End x="80.2889" y="58.9871"/>
					</TrackLine>
					<TrackLine>
						<End x="80.2889" y="58.2349"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="21.25" y="56.5"/>
					<TrackLine>
						<End x="21.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="21.2202" y="59.6118"/>
					</TrackLine>
					<TrackLine>
						<End x="21.2202" y="60.364"/>
					</TrackLine>
					<TrackLine>
						<End x="21.87" y="62.7418"/>
					</TrackLine>
					<TrackLine>
						<End x="22.006" y="66.6079"/>
					</TrackLine>
					<TrackLine>
						<End x="22.006" y="67.8597"/>
					</TrackLine>
					<TrackLine>
						<End x="21.8553" y="68.9029"/>
					</TrackLine>
					<TrackLine>
						<End x="21.8553" y="68.9758"/>
					</TrackLine>
					<TrackLine>
						<End x="21.4777" y="70.0187"/>
					</TrackLine>
					<TrackLine>
						<End x="20.9896" y="70.8968"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="45.0356" y="87.6346"/>
					<TrackLine>
						<End x="46.05" y="88.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="88.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="65.875" y="46.0165"/>
					<TrackLine>
						<End x="62.9917" y="49.611"/>
					</TrackLine>
					<TrackLine>
						<End x="61.961" y="50.6417"/>
					</TrackLine>
					<TrackLine>
						<End x="61.5788" y="50.8"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8543" y="50.8103"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7529" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="53.5" y="89"/>
					<TrackLine>
						<End x="52.55" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="51.1449" y="87.9957"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1649" y="86.8903"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="23.25" y="56.5"/>
					<TrackLine>
						<End x="23.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9495" y="60.1695"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9495" y="60.3281"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9225" y="68.042"/>
					</TrackLine>
					<TrackLine>
						<End x="22.7068" y="69.0723"/>
					</TrackLine>
					<TrackLine>
						<End x="22.7068" y="69.1453"/>
					</TrackLine>
					<TrackLine>
						<End x="22.3106" y="70.2576"/>
					</TrackLine>
					<TrackLine>
						<End x="22.3106" y="70.2782"/>
					</TrackLine>
					<TrackLine>
						<End x="22.2626" y="71.4213"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1818" y="71.9901"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="45.0317" y="86.3859"/>
					<TrackLine>
						<End x="45.3942" y="86.7716"/>
					</TrackLine>
					<TrackLine>
						<End x="45.8994" y="87.2768"/>
					</TrackLine>
					<TrackLine>
						<End x="46.05" y="87.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="87.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="52.25" y="56.5"/>
					<TrackLine>
						<End x="52.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4182" y="59.182"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="82.053" y="62.6085"/>
					<TrackLine>
						<End x="81.9516" y="61.6663"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9516" y="60.9141"/>
					</TrackLine>
					<TrackLine>
						<End x="82.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="82.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="82.25" y="56.5"/>
					<TrackLine>
						<End x="82.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6125" y="55.009"/>
					</TrackLine>
					<TrackLine>
						<End x="81.5146" y="54.9112"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3044" y="53.4931"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9589" y="53.35"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7098" y="53.2512"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0252" y="53.0167"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4748" y="53.0167"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0068" y="53.2105"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5943" y="53.54"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9183" y="53.54"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7614" y="53.3831"/>
					</TrackLine>
					<TrackLine>
						<End x="71.6403" y="52.7245"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="66.7679" y="51.671"/>
					<TrackLine>
						<End x="66.6174" y="52.7623"/>
					</TrackLine>
					<TrackLine>
						<End x="65.9678" y="53.6151"/>
					</TrackLine>
					<TrackLine>
						<End x="65.188" y="54.3949"/>
					</TrackLine>
					<TrackLine>
						<End x="64.2291" y="55.2293"/>
					</TrackLine>
					<TrackLine>
						<End x="58.4827" y="60.0128"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2722" y="60.1"/>
					</TrackLine>
					<TrackLine>
						<End x="58.0737" y="60.1"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1207" y="60.5417"/>
					</TrackLine>
					<TrackLine>
						<End x="57.0663" y="60.5642"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9167" y="60.9274"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1645" y="60.9274"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4182" y="59.182"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="47" y="87.5"/>
					<TrackLine>
						<End x="47.95" y="87.5"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1649" y="86.8903"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="24.25" y="56.5"/>
					<TrackLine>
						<End x="24.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="24.5844" y="60.1727"/>
					</TrackLine>
					<TrackLine>
						<End x="24.5844" y="60.8467"/>
					</TrackLine>
					<TrackLine>
						<End x="23.8389" y="68.2243"/>
					</TrackLine>
					<TrackLine>
						<End x="23.5582" y="69.2416"/>
					</TrackLine>
					<TrackLine>
						<End x="23.5582" y="69.3146"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1443" y="70.5174"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1443" y="71.1998"/>
					</TrackLine>
					<TrackLine>
						<End x="23.4212" y="71.4767"/>
					</TrackLine>
					<TrackLine>
						<End x="23.7978" y="72.0764"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="53.5" y="88"/>
					<TrackLine>
						<End x="52.55" y="88"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9664" y="85.7911"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="47" y="86.5"/>
					<TrackLine>
						<End x="47.95" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="48.7888" y="85.9823"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9664" y="85.7911"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="82.8596" y="61.2902"/>
					<TrackLine>
						<End x="83.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="83.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="83.25" y="56.5"/>
					<TrackLine>
						<End x="83.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5357" y="54.8603"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0317" y="54.7077"/>
					</TrackLine>
					<TrackLine>
						<End x="81.861" y="54.637"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6964" y="54.4724"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5876" y="53.0692"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0583" y="52.85"/>
					</TrackLine>
					<TrackLine>
						<End x="76.8041" y="52.777"/>
					</TrackLine>
					<TrackLine>
						<End x="76.127" y="52.505"/>
					</TrackLine>
					<TrackLine>
						<End x="74.373" y="52.505"/>
					</TrackLine>
					<TrackLine>
						<End x="73.55" y="52.724"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2563" y="52.724"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="65.7094" y="52.3862"/>
					<TrackLine>
						<End x="65.4903" y="53.3855"/>
					</TrackLine>
					<TrackLine>
						<End x="64.9584" y="53.9174"/>
					</TrackLine>
					<TrackLine>
						<End x="63.9458" y="54.8055"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2137" y="59.6102"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1777" y="59.6251"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9555" y="59.6251"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8911" y="60.0642"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1389" y="60.0642"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5406" y="60.0194"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="53.25" y="56.5"/>
					<TrackLine>
						<End x="53.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5406" y="60.0194"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="46.019" y="85.4884"/>
					<TrackLine>
						<End x="46.05" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="47.6712" y="83.0452"/>
					<TrackLine>
						<End x="50.701" y="84.5729"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="54.25" y="56.5"/>
					<TrackLine>
						<End x="54.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9601" y="58.15"/>
					</TrackLine>
					<TrackLine>
						<End x="56.515" y="59.1562"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="83.9002" y="64.6116"/>
					<TrackLine>
						<End x="84.1725" y="59.0235"/>
					</TrackLine>
					<TrackLine>
						<End x="84.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="84.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="23.968" y="70.8586"/>
					<TrackLine>
						<End x="23.984" y="69.3993"/>
					</TrackLine>
					<TrackLine>
						<End x="23.984" y="69.3264"/>
					</TrackLine>
					<TrackLine>
						<End x="24.2858" y="68.3427"/>
					</TrackLine>
					<TrackLine>
						<End x="24.2971" y="68.2859"/>
					</TrackLine>
					<TrackLine>
						<End x="24.9901" y="61.0148"/>
					</TrackLine>
					<TrackLine>
						<End x="24.9901" y="60.3551"/>
					</TrackLine>
					<TrackLine>
						<End x="25.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="25.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="64.5823" y="53.0094"/>
					<TrackLine>
						<End x="64.2481" y="53.7961"/>
					</TrackLine>
					<TrackLine>
						<End x="63.7162" y="54.328"/>
					</TrackLine>
					<TrackLine>
						<End x="58.0021" y="59.1501"/>
					</TrackLine>
					<TrackLine>
						<End x="57.861" y="59.1501"/>
					</TrackLine>
					<TrackLine>
						<End x="56.515" y="59.1562"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="53.5" y="87"/>
					<TrackLine>
						<End x="52.55" y="87"/>
					</TrackLine>
					<TrackLine>
						<End x="51.85" y="86.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="50.701" y="84.5729"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="43.75" y="81.75"/>
					<TrackLine>
						<End x="43.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6286" y="81.221"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="84.25" y="56.5"/>
					<TrackLine>
						<End x="84.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7385" y="54.3706"/>
					</TrackLine>
					<TrackLine>
						<End x="82.119" y="54.2689"/>
					</TrackLine>
					<TrackLine>
						<End x="82.1096" y="54.265"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9171" y="54.0726"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8708" y="52.6453"/>
					</TrackLine>
					<TrackLine>
						<End x="78.1578" y="52.35"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9798" y="52.3029"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0261" y="51.565"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="53.5" y="86"/>
					<TrackLine>
						<End x="52.55" y="86"/>
					</TrackLine>
					<TrackLine>
						<End x="51.85" y="85.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5255" y="83.5661"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="85.25" y="56.5"/>
					<TrackLine>
						<End x="85.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="84.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="83.7471" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0036" y="53.9433"/>
					</TrackLine>
					<TrackLine>
						<End x="82.8533" y="53.881"/>
					</TrackLine>
					<TrackLine>
						<End x="82.2952" y="53.8301"/>
					</TrackLine>
					<TrackLine>
						<End x="82.1657" y="53.7006"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1541" y="52.2215"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3452" y="51.4207"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="85.0805" y="59.3996"/>
					<TrackLine>
						<End x="85.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="85.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="63.3401" y="53.42"/>
					<TrackLine>
						<End x="62.394" y="54.3182"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2058" y="57.866"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6363" y="58.2671"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="48.1165" y="81.6358"/>
					<TrackLine>
						<End x="51.5255" y="83.5661"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="55.25" y="56.5"/>
					<TrackLine>
						<End x="55.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9601" y="58.15"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6363" y="58.2671"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="42.75" y="81.75"/>
					<TrackLine>
						<End x="42.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="43.1793" y="79.8037"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="26.25" y="56.5"/>
					<TrackLine>
						<End x="26.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="25.8812" y="58.0391"/>
					</TrackLine>
					<TrackLine>
						<End x="25.8812" y="58.7913"/>
					</TrackLine>
					<TrackLine>
						<End x="26.2353" y="59.9695"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6198" y="60.3541"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6198" y="61.0301"/>
					</TrackLine>
					<TrackLine>
						<End x="25.6216" y="68.4164"/>
					</TrackLine>
					<TrackLine>
						<End x="25.5594" y="68.729"/>
					</TrackLine>
					<TrackLine>
						<End x="25.2434" y="69.8481"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="56.25" y="56.5"/>
					<TrackLine>
						<End x="56.25" y="56.958"/>
					</TrackLine>
					<TrackLine>
						<End x="57.8297" y="56.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="86.25" y="56.5"/>
					<TrackLine>
						<End x="86.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="85.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="82.646" y="52.9833"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="41.8664" y="79.1124"/>
					<TrackLine>
						<End x="41.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="41.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="27.25" y="56.5"/>
					<TrackLine>
						<End x="27.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="27.6972" y="58.0391"/>
					</TrackLine>
					<TrackLine>
						<End x="28.4369" y="59.0258"/>
					</TrackLine>
					<TrackLine>
						<End x="28.4594" y="59.0802"/>
					</TrackLine>
					<TrackLine>
						<End x="28.4594" y="60.1828"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1514" y="70.4989"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0527" y="70.7371"/>
					</TrackLine>
					<TrackLine>
						<End x="26.3909" y="72.042"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="57.8297" y="56.958"/>
					<TrackLine>
						<End x="62.0179" y="53.4102"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="85.7218" y="61.2808"/>
					<TrackLine>
						<End x="85.9885" y="59.7757"/>
					</TrackLine>
					<TrackLine>
						<End x="86.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="86.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="52.3412" y="82.5848"/>
					<TrackLine>
						<End x="48.3366" y="80.3116"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="53.5" y="85"/>
					<TrackLine>
						<End x="52.55" y="85"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4335" y="83.19"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3412" y="82.5848"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="15" y="47"/>
					<TrackLine>
						<End x="15" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="16.7125" y="52.7743"/>
					</TrackLine>
					<TrackLine>
						<End x="17.1414" y="53.8834"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="17.6404" y="63.5698"/>
					<TrackLine>
						<End x="17.015" y="64.7947"/>
					</TrackLine>
					<TrackLine>
						<End x="16.9925" y="64.8491"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5622" y="66.0553"/>
					</TrackLine>
					<TrackLine>
						<End x="16.3634" y="67.3675"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="65.0844" y="91.3702"/>
					<TrackLine>
						<End x="70.05" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="71" y="96"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="16.25" y="74"/>
					<TrackLine>
						<End x="16.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="26.917" y="87.2711"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3316" y="87.7061"/>
					</TrackLine>
					<TrackLine>
						<End x="27.35" y="87.9971"/>
					</TrackLine>
					<TrackLine>
						<End x="27.85" y="88.7899"/>
					</TrackLine>
					<TrackLine>
						<End x="28.55" y="89.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="89.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="75.25" y="74"/>
					<TrackLine>
						<End x="75.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="66.4378" y="72.3399"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="45.25" y="74"/>
					<TrackLine>
						<End x="45.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2378" y="65.2224"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2288" y="65.2005"/>
					</TrackLine>
					<TrackLine>
						<End x="45.1239" y="65.0956"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9761" y="64.7387"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7777" y="62.2805"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7777" y="61.1779"/>
					</TrackLine>
					<TrackLine>
						<End x="45.1523" y="60.1039"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6458" y="59.264"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="45.6458" y="59.264"/>
					<TrackLine>
						<End x="46.4364" y="59.572"/>
					</TrackLine>
					<TrackLine>
						<End x="46.9683" y="60.1039"/>
					</TrackLine>
					<TrackLine>
						<End x="48.6186" y="61.9392"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1196" y="63.0657"/>
					</TrackLine>
					<TrackLine>
						<End x="49.6425" y="64.266"/>
					</TrackLine>
					<TrackLine>
						<End x="50.5494" y="65.1729"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7699" y="65.2643"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6209" y="65.4675"/>
					</TrackLine>
					<TrackLine>
						<End x="53.2266" y="65.7184"/>
					</TrackLine>
					<TrackLine>
						<End x="54.2025" y="66.3274"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7511" y="67.6144"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1218" y="68.9851"/>
					</TrackLine>
					<TrackLine>
						<End x="57.4804" y="69.693"/>
					</TrackLine>
					<TrackLine>
						<End x="58.107" y="70.3196"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6611" y="72.0928"/>
					</TrackLine>
					<TrackLine>
						<End x="60.7155" y="72.1153"/>
					</TrackLine>
					<TrackLine>
						<End x="66.4378" y="72.3399"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="46.25" y="74"/>
					<TrackLine>
						<End x="46.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6936" y="65.1317"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6152" y="64.9424"/>
					</TrackLine>
					<TrackLine>
						<End x="45.5102" y="64.8374"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4318" y="64.6481"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2777" y="62.1053"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2777" y="61.3531"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0603" y="60.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="46.0603" y="60.48"/>
					<TrackLine>
						<End x="46.5618" y="60.8212"/>
					</TrackLine>
					<TrackLine>
						<End x="47.4511" y="61.4426"/>
					</TrackLine>
					<TrackLine>
						<End x="48.2164" y="62.2079"/>
					</TrackLine>
					<TrackLine>
						<End x="48.7758" y="63.2954"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8313" y="63.4293"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0671" y="64.1417"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2321" y="64.5402"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2752" y="65.5833"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6737" y="65.7483"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5215" y="65.9675"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9434" y="66.1423"/>
					</TrackLine>
					<TrackLine>
						<End x="53.9192" y="66.7513"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5002" y="67.99"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7462" y="69.236"/>
					</TrackLine>
					<TrackLine>
						<End x="57.0828" y="69.9104"/>
					</TrackLine>
					<TrackLine>
						<End x="57.8896" y="70.7172"/>
					</TrackLine>
					<TrackLine>
						<End x="60.3778" y="72.5166"/>
					</TrackLine>
					<TrackLine>
						<End x="60.616" y="72.6153"/>
					</TrackLine>
					<TrackLine>
						<End x="67.26" y="73.428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="17.25" y="74"/>
					<TrackLine>
						<End x="17.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="16.8634" y="68.7686"/>
					</TrackLine>
					<TrackLine>
						<End x="16.8634" y="67.467"/>
					</TrackLine>
					<TrackLine>
						<End x="17.0622" y="66.1548"/>
					</TrackLine>
					<TrackLine>
						<End x="17.4925" y="65.0243"/>
					</TrackLine>
					<TrackLine>
						<End x="18.0244" y="64.4924"/>
					</TrackLine>
					<TrackLine>
						<End x="18.962" y="63.5915"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="16.25" y="47"/>
					<TrackLine>
						<End x="16.25" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="17.2296" y="52.6714"/>
					</TrackLine>
					<TrackLine>
						<End x="17.2495" y="52.7196"/>
					</TrackLine>
					<TrackLine>
						<End x="17.98" y="53.536"/>
					</TrackLine>
					<TrackLine>
						<End x="17.98" y="53.7087"/>
					</TrackLine>
					<TrackLine>
						<End x="18.2442" y="54.5343"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="76.25" y="74"/>
					<TrackLine>
						<End x="76.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="75.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="68.4536" y="73.5872"/>
					</TrackLine>
					<TrackLine>
						<End x="67.26" y="73.428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="17.25" y="74"/>
					<TrackLine>
						<End x="17.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="27.35" y="86.9971"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8091" y="87.4765"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8316" y="87.5309"/>
					</TrackLine>
					<TrackLine>
						<End x="27.85" y="87.7899"/>
					</TrackLine>
					<TrackLine>
						<End x="28.55" y="88.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="88.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="71" y="95"/>
					<TrackLine>
						<End x="70.05" y="95"/>
					</TrackLine>
					<TrackLine>
						<End x="66.4198" y="91.4618"/>
					</TrackLine>
					<TrackLine>
						<End x="65.9046" y="90.9466"/>
					</TrackLine>
					<TrackLine>
						<End x="65.5203" y="89.9816"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="18.25" y="74"/>
					<TrackLine>
						<End x="18.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="27.85" y="86.7899"/>
					</TrackLine>
					<TrackLine>
						<End x="28.55" y="87.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="87.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="47.25" y="74"/>
					<TrackLine>
						<End x="47.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="46.1493" y="65.0411"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0015" y="64.6842"/>
					</TrackLine>
					<TrackLine>
						<End x="45.8966" y="64.5793"/>
					</TrackLine>
					<TrackLine>
						<End x="45.8876" y="64.5574"/>
					</TrackLine>
					<TrackLine>
						<End x="45.8876" y="63.49"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9663" y="62.4086"/>
					</TrackLine>
					<TrackLine>
						<End x="46.1857" y="61.7292"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="18.8186" y="53.3613"/>
					<TrackLine>
						<End x="18.248" y="53.0229"/>
					</TrackLine>
					<TrackLine>
						<End x="17.7211" y="52.496"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="47"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="18.4005" y="65.4004"/>
					<TrackLine>
						<End x="17.5622" y="66.33"/>
					</TrackLine>
					<TrackLine>
						<End x="17.3634" y="67.5665"/>
					</TrackLine>
					<TrackLine>
						<End x="17.3634" y="68.6691"/>
					</TrackLine>
					<TrackLine>
						<End x="18.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="18.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="68.0775" y="74.4952"/>
					<TrackLine>
						<End x="66.8839" y="74.336"/>
					</TrackLine>
					<TrackLine>
						<End x="60.5165" y="73.1153"/>
					</TrackLine>
					<TrackLine>
						<End x="60.0946" y="72.9405"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6434" y="71.0858"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7142" y="70.1566"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3707" y="69.4869"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2493" y="68.3655"/>
					</TrackLine>
					<TrackLine>
						<End x="53.636" y="67.1752"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6602" y="66.5662"/>
					</TrackLine>
					<TrackLine>
						<End x="52.422" y="66.4675"/>
					</TrackLine>
					<TrackLine>
						<End x="50.5774" y="66.2323"/>
					</TrackLine>
					<TrackLine>
						<End x="50.001" y="65.9936"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8218" y="64.8144"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5831" y="64.238"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4259" y="63.5188"/>
					</TrackLine>
					<TrackLine>
						<End x="47.7567" y="62.4192"/>
					</TrackLine>
					<TrackLine>
						<End x="47.2398" y="61.9023"/>
					</TrackLine>
					<TrackLine>
						<End x="46.1857" y="61.7292"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="71" y="94"/>
					<TrackLine>
						<End x="70.05" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="69.35" y="93.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="66.7841" y="90.5823"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="77.25" y="74"/>
					<TrackLine>
						<End x="77.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7471" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7529" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="68.0775" y="74.4952"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="18.75" y="47"/>
					<TrackLine>
						<End x="18.75" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="18.563" y="50.8749"/>
					</TrackLine>
					<TrackLine>
						<End x="18.563" y="51.6271"/>
					</TrackLine>
					<TrackLine>
						<End x="18.6205" y="52.1235"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="19.25" y="74"/>
					<TrackLine>
						<End x="19.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="28.55" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="71" y="93"/>
					<TrackLine>
						<End x="70.05" y="93"/>
					</TrackLine>
					<TrackLine>
						<End x="69.35" y="92.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="67.6921" y="90.2062"/>
					</TrackLine>
					<TrackLine>
						<End x="67.1602" y="89.6743"/>
					</TrackLine>
					<TrackLine>
						<End x="65.8964" y="89.0736"/>
					</TrackLine>
					<TrackLine>
						<End x="61.3758" y="87.7167"/>
					</TrackLine>
					<TrackLine>
						<End x="60.5863" y="87.3897"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3459" y="86.0285"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6044" y="85.6417"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3083" y="84.3456"/>
					</TrackLine>
					<TrackLine>
						<End x="55.0063" y="83.6165"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9927" y="83.4235"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9894" y="83.4156"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1505" y="81.6958"/>
					</TrackLine>
					<TrackLine>
						<End x="48.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="48.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="48.25" y="74"/>
					<TrackLine>
						<End x="48.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="46.605" y="64.9504"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3878" y="64.4261"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3433" y="64.3815"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3433" y="63.6659"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8743" y="62.7847"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="77.9704" y="60.1942"/>
					<TrackLine>
						<End x="77.2254" y="68.3929"/>
					</TrackLine>
					<TrackLine>
						<End x="77.2254" y="69.1451"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9895" y="70.3427"/>
					</TrackLine>
					<TrackLine>
						<End x="78.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="78.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="46.8743" y="62.7847"/>
					<TrackLine>
						<End x="47.5439" y="63.2103"/>
					</TrackLine>
					<TrackLine>
						<End x="48.0204" y="63.6868"/>
					</TrackLine>
					<TrackLine>
						<End x="48.099" y="64.3343"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4114" y="65.0886"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7268" y="66.404"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4811" y="66.7164"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3225" y="66.9675"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3769" y="66.99"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3528" y="67.5991"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9983" y="68.741"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9952" y="69.7379"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3455" y="70.403"/>
					</TrackLine>
					<TrackLine>
						<End x="57.397" y="71.4545"/>
					</TrackLine>
					<TrackLine>
						<End x="59.8114" y="73.3644"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4171" y="73.6153"/>
					</TrackLine>
					<TrackLine>
						<End x="67.7014" y="75.4032"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6406" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8594" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0211" y="76.583"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7471" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="78.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="78.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="19.25" y="74"/>
					<TrackLine>
						<End x="19.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="17.8634" y="68.4939"/>
					</TrackLine>
					<TrackLine>
						<End x="17.8634" y="67.7417"/>
					</TrackLine>
					<TrackLine>
						<End x="18.4702" y="66.7061"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="50.4611" y="67.835"/>
					<TrackLine>
						<End x="49.3802" y="66.9"/>
					</TrackLine>
					<TrackLine>
						<End x="47.9154" y="65.4352"/>
					</TrackLine>
					<TrackLine>
						<End x="47.9014" y="65.4142"/>
					</TrackLine>
					<TrackLine>
						<End x="47.207" y="64.0237"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="50.4611" y="67.835"/>
					<TrackLine>
						<End x="49.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="20.25" y="74"/>
					<TrackLine>
						<End x="20.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6041" y="71.5025"/>
					</TrackLine>
					<TrackLine>
						<End x="19.5816" y="71.4481"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2452" y="70.2285"/>
					</TrackLine>
					<TrackLine>
						<End x="18.7714" y="68.1178"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="71" y="92"/>
					<TrackLine>
						<End x="70.05" y="92"/>
					</TrackLine>
					<TrackLine>
						<End x="69.35" y="91.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="68.1696" y="89.9766"/>
					</TrackLine>
					<TrackLine>
						<End x="67.3898" y="89.1968"/>
					</TrackLine>
					<TrackLine>
						<End x="66.126" y="88.5961"/>
					</TrackLine>
					<TrackLine>
						<End x="66.0716" y="88.5736"/>
					</TrackLine>
					<TrackLine>
						<End x="61.4753" y="87.2167"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8696" y="86.9658"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6292" y="85.6047"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8507" y="85.2731"/>
					</TrackLine>
					<TrackLine>
						<End x="55.6769" y="84.0993"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4411" y="83.53"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4295" y="83.3366"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3597" y="83.1682"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5744" y="81.4126"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="20" y="47"/>
					<TrackLine>
						<End x="20" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="19.471" y="51.251"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="79.25" y="74"/>
					<TrackLine>
						<End x="79.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="77.7471" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0211" y="76.583"/>
					</TrackLine>
					<TrackLine>
						<End x="76.3044" y="77.0069"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9589" y="77.15"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5411" y="77.15"/>
					</TrackLine>
					<TrackLine>
						<End x="67.5262" y="75.9032"/>
					</TrackLine>
					<TrackLine>
						<End x="60.3176" y="74.1153"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5281" y="73.7883"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1507" y="71.8231"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9769" y="70.6493"/>
					</TrackLine>
					<TrackLine>
						<End x="55.6197" y="69.9887"/>
					</TrackLine>
					<TrackLine>
						<End x="54.7475" y="69.1165"/>
					</TrackLine>
					<TrackLine>
						<End x="53.0695" y="68.0229"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1473" y="67.4675"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3951" y="67.4675"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4611" y="67.835"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="79.3809" y="58.611"/>
					<TrackLine>
						<End x="79.3784" y="60.7455"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7213" y="66.9214"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7213" y="68.024"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7438" y="68.0784"/>
					</TrackLine>
					<TrackLine>
						<End x="79.0406" y="68.3932"/>
					</TrackLine>
					<TrackLine>
						<End x="79.0406" y="69.1448"/>
					</TrackLine>
					<TrackLine>
						<End x="78.719" y="69.4663"/>
					</TrackLine>
					<TrackLine>
						<End x="78.719" y="70.2179"/>
					</TrackLine>
					<TrackLine>
						<End x="79.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="79.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="32.4694" y="72.3174"/>
					<TrackLine>
						<End x="32.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="32.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="25.8037" y="60.6921"/>
					<TrackLine>
						<End x="24.7554" y="68.331"/>
					</TrackLine>
					<TrackLine>
						<End x="24.7265" y="68.4763"/>
					</TrackLine>
					<TrackLine>
						<End x="24.4352" y="69.5133"/>
					</TrackLine>
					<TrackLine>
						<End x="24.4352" y="70.1829"/>
					</TrackLine>
					<TrackLine>
						<End x="24.7762" y="70.5238"/>
					</TrackLine>
					<TrackLine>
						<End x="24.7762" y="71.1934"/>
					</TrackLine>
					<TrackLine>
						<End x="24.6824" y="71.4309"/>
					</TrackLine>
					<TrackLine>
						<End x="24.6501" y="72.4294"/>
					</TrackLine>
					<TrackLine>
						<End x="24.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="24.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="52.2978" y="70.6535"/>
					<TrackLine>
						<End x="52.1704" y="71.2514"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1704" y="71.995"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6963" y="72.5209"/>
					</TrackLine>
					<TrackLine>
						<End x="53.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="53.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="83.5058" y="68.3145"/>
					<TrackLine>
						<End x="83.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="83.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="24.25" y="74"/>
					<TrackLine>
						<End x="24.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="28.0837" y="81.2201"/>
					</TrackLine>
					<TrackLine>
						<End x="29.4176" y="82.7146"/>
					</TrackLine>
					<TrackLine>
						<End x="29.9495" y="83.2465"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4601" y="83.4"/>
					</TrackLine>
					<TrackLine>
						<End x="33.0399" y="83.4"/>
					</TrackLine>
					<TrackLine>
						<End x="33.75" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="33.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="21.25" y="47"/>
					<TrackLine>
						<End x="21.25" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="21.6875" y="48.758"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="53.25" y="74"/>
					<TrackLine>
						<End x="53.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="56.2941" y="80.338"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7251" y="81.3785"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1765" y="82.9891"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1804" y="83.143"/>
					</TrackLine>
					<TrackLine>
						<End x="57.807" y="83.7696"/>
					</TrackLine>
					<TrackLine>
						<End x="61.9489" y="85.2167"/>
					</TrackLine>
					<TrackLine>
						<End x="66.4695" y="86.5736"/>
					</TrackLine>
					<TrackLine>
						<End x="70.05" y="88"/>
					</TrackLine>
					<TrackLine>
						<End x="71" y="88"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="71" y="88"/>
					<TrackLine>
						<End x="71.95" y="88"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="87.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9283" y="76.2603"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7074" y="75.4812"/>
					</TrackLine>
					<TrackLine>
						<End x="83.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="83.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="22.5" y="47"/>
					<TrackLine>
						<End x="22.5" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="22.5955" y="48.3819"/>
					</TrackLine>
					<TrackLine>
						<End x="22.5955" y="49.1341"/>
					</TrackLine>
					<TrackLine>
						<End x="21.981" y="51.4837"/>
					</TrackLine>
					<TrackLine>
						<End x="21.981" y="52.2359"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9598" y="53.7929"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="52.25" y="74"/>
					<TrackLine>
						<End x="52.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6826" y="72.2289"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6601" y="72.1745"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3898" y="71.0296"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3898" y="70.2774"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9217" y="69.7455"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4638" y="69.4084"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="82.25" y="74"/>
					<TrackLine>
						<End x="82.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="81.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7471" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="76.8708" y="77.8547"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1578" y="78.15"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3422" y="78.15"/>
					</TrackLine>
					<TrackLine>
						<End x="67.3272" y="76.9032"/>
					</TrackLine>
					<TrackLine>
						<End x="60.0605" y="75.0912"/>
					</TrackLine>
					<TrackLine>
						<End x="59.02" y="74.6602"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9171" y="74.5915"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6581" y="72.5603"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2397" y="71.1419"/>
					</TrackLine>
					<TrackLine>
						<End x="54.8064" y="70.4283"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3079" y="69.9298"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4638" y="69.4084"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="52.25" y="74"/>
					<TrackLine>
						<End x="52.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="55.851" y="80.5748"/>
					</TrackLine>
					<TrackLine>
						<End x="56.2443" y="81.5243"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7397" y="83.076"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7456" y="83.2705"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7828" y="83.3604"/>
					</TrackLine>
					<TrackLine>
						<End x="57.5896" y="84.1672"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6795" y="84.2044"/>
					</TrackLine>
					<TrackLine>
						<End x="61.7737" y="85.7167"/>
					</TrackLine>
					<TrackLine>
						<End x="66.37" y="87.0736"/>
					</TrackLine>
					<TrackLine>
						<End x="66.9757" y="87.3245"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2395" y="87.9252"/>
					</TrackLine>
					<TrackLine>
						<End x="70.05" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="71" y="89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="23.25" y="74"/>
					<TrackLine>
						<End x="23.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="27.6599" y="81.5034"/>
					</TrackLine>
					<TrackLine>
						<End x="28.9401" y="82.9442"/>
					</TrackLine>
					<TrackLine>
						<End x="29.7199" y="83.724"/>
					</TrackLine>
					<TrackLine>
						<End x="29.7743" y="83.7465"/>
					</TrackLine>
					<TrackLine>
						<End x="32.2529" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="33.2471" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="34.0399" y="83.4"/>
					</TrackLine>
					<TrackLine>
						<End x="34.75" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="34.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="23.25" y="74"/>
					<TrackLine>
						<End x="23.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9898" y="72.4111"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9898" y="71.6554"/>
					</TrackLine>
					<TrackLine>
						<End x="22.7286" y="71.372"/>
					</TrackLine>
					<TrackLine>
						<End x="22.7286" y="70.3452"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1325" y="69.2299"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1325" y="69.1569"/>
					</TrackLine>
					<TrackLine>
						<End x="23.3807" y="68.1331"/>
					</TrackLine>
					<TrackLine>
						<End x="23.7708" y="60.5097"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="81.9424" y="70.623"/>
					<TrackLine>
						<End x="82.3293" y="71.5629"/>
					</TrackLine>
					<TrackLine>
						<End x="82.3293" y="72.3151"/>
					</TrackLine>
					<TrackLine>
						<End x="82.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="82.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="81.4213" y="71.939"/>
					<TrackLine>
						<End x="81.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="81.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="71" y="90"/>
					<TrackLine>
						<End x="70.05" y="90"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9563" y="88.3491"/>
					</TrackLine>
					<TrackLine>
						<End x="66.6925" y="87.7484"/>
					</TrackLine>
					<TrackLine>
						<End x="66.2706" y="87.5736"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6742" y="86.2167"/>
					</TrackLine>
					<TrackLine>
						<End x="57.593" y="84.6392"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3434" y="84.5358"/>
					</TrackLine>
					<TrackLine>
						<End x="56.4142" y="83.6066"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3108" y="83.357"/>
					</TrackLine>
					<TrackLine>
						<End x="56.303" y="83.1629"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7492" y="81.6356"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4222" y="80.8461"/>
					</TrackLine>
					<TrackLine>
						<End x="51.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="51.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="22.25" y="74"/>
					<TrackLine>
						<End x="22.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="27.236" y="81.7866"/>
					</TrackLine>
					<TrackLine>
						<End x="28.5163" y="83.2275"/>
					</TrackLine>
					<TrackLine>
						<End x="29.4366" y="84.1478"/>
					</TrackLine>
					<TrackLine>
						<End x="29.6748" y="84.2465"/>
					</TrackLine>
					<TrackLine>
						<End x="32.1406" y="84.4"/>
					</TrackLine>
					<TrackLine>
						<End x="33.3594" y="84.4"/>
					</TrackLine>
					<TrackLine>
						<End x="33.5211" y="84.333"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2471" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="35.0399" y="83.4"/>
					</TrackLine>
					<TrackLine>
						<End x="35.75" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="35.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="51.7712" y="68.3755"/>
					<TrackLine>
						<End x="52.8399" y="68.5004"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4965" y="69.4921"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2441" y="70.2397"/>
					</TrackLine>
					<TrackLine>
						<End x="55.6083" y="70.8956"/>
					</TrackLine>
					<TrackLine>
						<End x="56.9044" y="72.1917"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2358" y="74.2031"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2568" y="74.2171"/>
					</TrackLine>
					<TrackLine>
						<End x="60.2063" y="74.6104"/>
					</TrackLine>
					<TrackLine>
						<End x="67.4267" y="76.4032"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4417" y="77.65"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0583" y="77.65"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5876" y="77.4308"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="81.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="81.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="23.75" y="47"/>
					<TrackLine>
						<End x="23.75" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="22.889" y="51.8598"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="51.25" y="74"/>
					<TrackLine>
						<End x="51.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8898" y="71.2048"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8898" y="70.1022"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9123" y="70.0478"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7712" y="68.3755"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="22.1282" y="59.9879"/>
					<TrackLine>
						<End x="22.37" y="62.6423"/>
					</TrackLine>
					<TrackLine>
						<End x="22.4642" y="66.5168"/>
					</TrackLine>
					<TrackLine>
						<End x="22.4642" y="67.9508"/>
					</TrackLine>
					<TrackLine>
						<End x="22.2811" y="68.9876"/>
					</TrackLine>
					<TrackLine>
						<End x="22.2811" y="69.0606"/>
					</TrackLine>
					<TrackLine>
						<End x="21.8941" y="70.1748"/>
					</TrackLine>
					<TrackLine>
						<End x="21.8941" y="70.1912"/>
					</TrackLine>
					<TrackLine>
						<End x="21.7976" y="71.2315"/>
					</TrackLine>
					<TrackLine>
						<End x="21.3738" y="71.6554"/>
					</TrackLine>
					<TrackLine>
						<End x="21.3738" y="72.3248"/>
					</TrackLine>
					<TrackLine>
						<End x="21.8471" y="72.7981"/>
					</TrackLine>
					<TrackLine>
						<End x="22.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="22.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="76"/>
				<Subwire width="0.2">
					<Start x="59.5" y="69.25"/>
					<TrackLine>
						<End x="60.45" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="61.2668" y="70.7073"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="76"/>
				<Subwire width="0.2">
					<Start x="56.25" y="74"/>
					<TrackLine>
						<End x="56.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="57.8682" y="75.2012"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="75"/>
				<Subwire width="0.2">
					<Start x="53.7112" y="83.9497"/>
					<TrackLine>
						<End x="53.2492" y="82.2087"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7173" y="81.6768"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0634" y="76.9285"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3758" y="76.9285"/>
					</TrackLine>
					<TrackLine>
						<End x="44.8459" y="76.3986"/>
					</TrackLine>
					<TrackLine>
						<End x="44.05" y="75.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="42.95" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="42" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="75"/>
				<Subwire width="0.2">
					<Start x="42" y="69.25"/>
					<TrackLine>
						<End x="41.05" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8841" y="69.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="40.6495" y="68.9159"/>
					</TrackLine>
					<TrackLine>
						<End x="40.6495" y="68.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8841" y="68.3495"/>
					</TrackLine>
					<TrackLine>
						<End x="41.05" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="42" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="72"/>
				<Subwire width="0.2">
					<Start x="85.1374" y="77.1527"/>
					<TrackLine>
						<End x="86.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="86.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="72"/>
				<Subwire width="0.2">
					<Start x="89.5" y="69.25"/>
					<TrackLine>
						<End x="88.55" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="87.3616" y="72.2244"/>
					</TrackLine>
					<TrackLine>
						<End x="86.8297" y="72.7563"/>
					</TrackLine>
					<TrackLine>
						<End x="86.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="86.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="71"/>
				<Subwire width="0.2">
					<Start x="69.4417" y="69.6166"/>
					<TrackLine>
						<End x="70.6345" y="68.817"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="71"/>
				<Subwire width="0.2">
					<Start x="70.6345" y="68.817"/>
					<TrackLine>
						<End x="70.6495" y="68.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="70.8841" y="68.3495"/>
					</TrackLine>
					<TrackLine>
						<End x="71.05" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="72" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="71"/>
				<Subwire width="0.2">
					<Start x="72" y="69.25"/>
					<TrackLine>
						<End x="71.05" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="70.8841" y="69.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="70.6495" y="68.9159"/>
					</TrackLine>
					<TrackLine>
						<End x="70.6345" y="68.817"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="32.5521" y="60.8744"/>
					<TrackLine>
						<End x="33.0548" y="60.2451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="33.0548" y="60.2451"/>
					<TrackLine>
						<End x="31.2047" y="57.6627"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="38.9188" y="95.808"/>
					<TrackLine>
						<End x="40.5057" y="92.4866"/>
					</TrackLine>
					<TrackLine>
						<End x="40.5282" y="92.4322"/>
					</TrackLine>
					<TrackLine>
						<End x="42.1237" y="85.5362"/>
					</TrackLine>
					<TrackLine>
						<End x="42.3746" y="84.9305"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5763" y="83.7288"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0378" y="83.3947"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4447" y="82.9878"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2788" y="81.7666"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4742" y="81.5713"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4742" y="80.8707"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6131" y="79.9137"/>
					</TrackLine>
					<TrackLine>
						<End x="43.8794" y="78.7221"/>
					</TrackLine>
					<TrackLine>
						<End x="39.417" y="70.0211"/>
					</TrackLine>
					<TrackLine>
						<End x="39.247" y="69.6347"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1495" y="69.3993"/>
					</TrackLine>
					<TrackLine>
						<End x="38.9" y="65.9022"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3461" y="63.8316"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3267" y="63.7847"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3267" y="63.0933"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4" y="62.2907"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4" y="62.1907"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4" y="61.8593"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1657" y="61.625"/>
					</TrackLine>
					<TrackLine>
						<End x="33.0548" y="60.2451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="69"/>
				<Subwire width="0.2">
					<Start x="25.098" y="87.9211"/>
					<TrackLine>
						<End x="20.766" y="82.2151"/>
					</TrackLine>
					<TrackLine>
						<End x="15.05" y="75.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="11.35" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="11.1495" y="69.123"/>
					</TrackLine>
					<TrackLine>
						<End x="10.983" y="62.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NET00030"/>
				<Subwire width="0.2">
					<Start x="81" y="86.5"/>
					<TrackLine>
						<End x="80.35" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="79.55" y="87.4186"/>
					</TrackLine>
					<TrackLine>
						<End x="76.507" y="91.7717"/>
					</TrackLine>
					<TrackLine>
						<End x="76.507" y="92.5239"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0389" y="93.0558"/>
					</TrackLine>
					<TrackLine>
						<End x="77.7911" y="93.0558"/>
					</TrackLine>
					<TrackLine>
						<End x="80.35" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="91.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="40.3097" y="39.8868"/>
					<TrackLine>
						<End x="39.972" y="38.5436"/>
					</TrackLine>
					<TrackLine>
						<End x="39.972" y="37.441"/>
					</TrackLine>
					<TrackLine>
						<End x="40" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="40" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="36.75" y="81.75"/>
					<TrackLine>
						<End x="36.75" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="36.3324" y="83.1076"/>
					</TrackLine>
					<TrackLine>
						<End x="35.8005" y="83.6395"/>
					</TrackLine>
					<TrackLine>
						<End x="35.5961" y="84.4288"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81" y="92.75"/>
					<TrackLine>
						<End x="80.35" y="92.75"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1427" y="92.8745"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8495" y="93.1677"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8494" y="93.4591"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.8738" y="80.2018"/>
					<TrackLine>
						<End x="38.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="38.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="89.5" y="68.25"/>
					<TrackLine>
						<End x="88.55" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="87.5502" y="67.7605"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="14.375" y="92.7165"/>
					<TrackLine>
						<End x="18.2336" y="93.1"/>
					</TrackLine>
					<TrackLine>
						<End x="18.275" y="93.1"/>
					</TrackLine>
					<TrackLine>
						<End x="18.375" y="93.1"/>
					</TrackLine>
					<TrackLine>
						<End x="19.25" y="94.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.8738" y="80.2018"/>
					<TrackLine>
						<End x="39.4601" y="80.1"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0399" y="80.1"/>
					</TrackLine>
					<TrackLine>
						<End x="40.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="40.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="60.2" y="41"/>
					<TrackLine>
						<End x="59.55" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="59" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="59" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="85.3649" y="65.314"/>
					<TrackLine>
						<End x="87.5502" y="67.7605"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.2" y="90.25"/>
					<TrackLine>
						<End x="91.55" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="90.75" y="91.1686"/>
					</TrackLine>
					<TrackLine>
						<End x="90.4769" y="92.3277"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="35.5961" y="84.4288"/>
					<TrackLine>
						<End x="39.633" y="89.2248"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="26.25" y="47"/>
					<TrackLine>
						<End x="26.25" y="46.35"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3585" y="45.9331"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="75.3143" y="93.0793"/>
					<TrackLine>
						<End x="74.8093" y="91.5763"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.5" y="71.5"/>
					<TrackLine>
						<End x="90.85" y="70.625"/>
					</TrackLine>
					<TrackLine>
						<End x="90.85" y="70.525"/>
					</TrackLine>
					<TrackLine>
						<End x="91.15" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="91.15" y="68.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="90.45" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="89.5" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="82.92" y="23.02"/>
					<TrackLine>
						<End x="82.92" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8563" y="24.32"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3163" y="24.32"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3637" y="24.32"/>
					</TrackLine>
					<TrackLine>
						<End x="76.8056" y="23.7658"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74.8093" y="91.5763"/>
					<TrackLine>
						<End x="71.95" y="91"/>
					</TrackLine>
					<TrackLine>
						<End x="71" y="91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="36.75" y="81.75"/>
					<TrackLine>
						<End x="36.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="37.4601" y="80.1"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3422" y="79.8911"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="85.9238" y="35.1505"/>
					<TrackLine>
						<End x="88.0086" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="88.05" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="88.15" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="91.75" y="32.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="90.4769" y="92.3277"/>
					<TrackLine>
						<End x="90.75" y="93.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="91.55" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81" y="92.75"/>
					<TrackLine>
						<End x="81.65" y="92.75"/>
					</TrackLine>
					<TrackLine>
						<End x="86.6034" y="92.5204"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="63.25" y="40.575"/>
					<TrackLine>
						<End x="64.075" y="41.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="64.175" y="41.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="64.2164" y="41.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="65.3159" y="41.9166"/>
					</TrackLine>
					<TrackLine>
						<End x="66.0681" y="41.9166"/>
					</TrackLine>
					<TrackLine>
						<End x="66.5414" y="41.575"/>
					</TrackLine>
					<TrackLine>
						<End x="66.6" y="41.5164"/>
					</TrackLine>
					<TrackLine>
						<End x="66.6" y="41.475"/>
					</TrackLine>
					<TrackLine>
						<End x="66.6" y="41.375"/>
					</TrackLine>
					<TrackLine>
						<End x="68.25" y="40.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="15.0917" y="65.564"/>
					<TrackLine>
						<End x="16.7324" y="63.1937"/>
					</TrackLine>
					<TrackLine>
						<End x="17.2643" y="62.6618"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9247" y="62.205"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="79.8494" y="93.4591"/>
					<TrackLine>
						<End x="79.8495" y="93.5823"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1427" y="93.8755"/>
					</TrackLine>
					<TrackLine>
						<End x="80.35" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="40.95" y="41"/>
					<TrackLine>
						<End x="40.3097" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3097" y="39.8868"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="13" y="67.25"/>
					<TrackLine>
						<End x="13.95" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="14.65" y="66.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="15.0917" y="65.564"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="42" y="67.25"/>
					<TrackLine>
						<End x="42.95" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="43.65" y="66.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="43.9184" y="65.7561"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.75" y="99.25"/>
					<TrackLine>
						<End x="38.75" y="100.2"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7499" y="100.8"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="90.125" y="37.875"/>
					<TrackLine>
						<End x="90.9375" y="36.225"/>
					</TrackLine>
					<TrackLine>
						<End x="90.9375" y="36.125"/>
					</TrackLine>
					<TrackLine>
						<End x="90.9375" y="34.15"/>
					</TrackLine>
					<TrackLine>
						<End x="90.9375" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="91.75" y="32.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="66.25" y="63"/>
					<TrackLine>
						<End x="64.6" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6" y="63.975"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6" y="64.0164"/>
					</TrackLine>
					<TrackLine>
						<End x="61.15" y="67.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="60.45" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="12" y="53"/>
					<TrackLine>
						<End x="12.875" y="52.7984"/>
					</TrackLine>
					<TrackLine>
						<End x="12.975" y="52.7984"/>
					</TrackLine>
					<TrackLine>
						<End x="14.1954" y="52.7984"/>
					</TrackLine>
					<TrackLine>
						<End x="16.4986" y="54.9498"/>
					</TrackLine>
					<TrackLine>
						<End x="16.6408" y="55.0919"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="75.3143" y="93.0793"/>
					<TrackLine>
						<End x="76.8637" y="93.5558"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9663" y="93.5558"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8494" y="93.4591"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="72" y="67.25"/>
					<TrackLine>
						<End x="72.95" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="73.65" y="66.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2618" y="63.9025"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="85.9238" y="35.1505"/>
					<TrackLine>
						<End x="86" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="86.6034" y="92.5204"/>
					<TrackLine>
						<End x="90.4769" y="92.3277"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="64.0994" y="97.7021"/>
					<TrackLine>
						<End x="64.25" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="64.25" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="64.0994" y="97.7021"/>
					<TrackLine>
						<End x="65.3739" y="96.4664"/>
					</TrackLine>
					<TrackLine>
						<End x="66.1261" y="96.4664"/>
					</TrackLine>
					<TrackLine>
						<End x="69.7601" y="96.7"/>
					</TrackLine>
					<TrackLine>
						<End x="70.3399" y="96.7"/>
					</TrackLine>
					<TrackLine>
						<End x="72.2399" y="96.7"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="96.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3143" y="93.0793"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="40.95" y="41"/>
					<TrackLine>
						<End x="41.6" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="43.25" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="43.35" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="45" y="40.125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.7499" y="100.8"/>
					<TrackLine>
						<End x="38.0399" y="100.9"/>
					</TrackLine>
					<TrackLine>
						<End x="33.0399" y="100.9"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4601" y="100.9"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2664" y="96.4"/>
					</TrackLine>
					<TrackLine>
						<End x="20.225" y="96.4"/>
					</TrackLine>
					<TrackLine>
						<End x="20.125" y="96.4"/>
					</TrackLine>
					<TrackLine>
						<End x="19.25" y="94.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.3422" y="79.8911"/>
					<TrackLine>
						<End x="38.8738" y="80.2018"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="17.9247" y="62.205"/>
					<TrackLine>
						<End x="19.3381" y="62.6835"/>
					</TrackLine>
					<TrackLine>
						<End x="19.87" y="63.2154"/>
					</TrackLine>
					<TrackLine>
						<End x="19.87" y="63.9676"/>
					</TrackLine>
					<TrackLine>
						<End x="19.3974" y="66.8917"/>
					</TrackLine>
					<TrackLine>
						<End x="19.3974" y="67.5759"/>
					</TrackLine>
					<TrackLine>
						<End x="19.5973" y="67.7757"/>
					</TrackLine>
					<TrackLine>
						<End x="19.7452" y="70.0533"/>
					</TrackLine>
					<TrackLine>
						<End x="20.0816" y="71.2729"/>
					</TrackLine>
					<TrackLine>
						<End x="20.7963" y="72.5958"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="68.25" y="40.5"/>
					<TrackLine>
						<End x="69.9" y="39.625"/>
					</TrackLine>
					<TrackLine>
						<End x="70" y="39.625"/>
					</TrackLine>
					<TrackLine>
						<End x="70.0414" y="39.625"/>
					</TrackLine>
					<TrackLine>
						<End x="70.1" y="39.5664"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8583" y="34.739"/>
					</TrackLine>
					<TrackLine>
						<End x="74.889" y="33.7083"/>
					</TrackLine>
					<TrackLine>
						<End x="75.2712" y="33.55"/>
					</TrackLine>
					<TrackLine>
						<End x="77.7712" y="33.55"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2288" y="33.55"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0299" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9238" y="35.1505"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="76.8056" y="23.7658"/>
					<TrackLine>
						<End x="76.69" y="23.3463"/>
					</TrackLine>
					<TrackLine>
						<End x="76.57" y="18.3639"/>
					</TrackLine>
					<TrackLine>
						<End x="76.57" y="17.3161"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5685" y="17.3124"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8276" y="16.5715"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8239" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7761" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7724" y="16.5685"/>
					</TrackLine>
					<TrackLine>
						<End x="72.76" y="15.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="68.25" y="40.5"/>
					<TrackLine>
						<End x="66.6" y="39.625"/>
					</TrackLine>
					<TrackLine>
						<End x="66.6" y="39.525"/>
					</TrackLine>
					<TrackLine>
						<End x="66.6" y="39.4836"/>
					</TrackLine>
					<TrackLine>
						<End x="64.884" y="35.8007"/>
					</TrackLine>
					<TrackLine>
						<End x="64.884" y="35.0485"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4159" y="34.5166"/>
					</TrackLine>
					<TrackLine>
						<End x="76.8056" y="23.7658"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="85.3649" y="65.314"/>
					<TrackLine>
						<End x="86.6298" y="61.6569"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="57.7399"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="55.8399"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="55.2601"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0221" y="52.0753"/>
					</TrackLine>
					<TrackLine>
						<End x="81.7686" y="52.0027"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="53.5" y="95"/>
					<TrackLine>
						<End x="54.45" y="95"/>
					</TrackLine>
					<TrackLine>
						<End x="64.0994" y="97.7021"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81.7686" y="52.0027"/>
					<TrackLine>
						<End x="77.7213" y="50.5127"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9691" y="50.5127"/>
					</TrackLine>
					<TrackLine>
						<End x="75.65" y="50.657"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8112" y="51.7412"/>
					</TrackLine>
					<TrackLine>
						<End x="73.3893" y="51.916"/>
					</TrackLine>
					<TrackLine>
						<End x="71.8887" y="51.916"/>
					</TrackLine>
					<TrackLine>
						<End x="70.7477" y="51.744"/>
					</TrackLine>
					<TrackLine>
						<End x="70.0751" y="51.744"/>
					</TrackLine>
					<TrackLine>
						<End x="69.5995" y="52.2196"/>
					</TrackLine>
					<TrackLine>
						<End x="69.5995" y="53.4202"/>
					</TrackLine>
					<TrackLine>
						<End x="69.5719" y="53.817"/>
					</TrackLine>
					<TrackLine>
						<End x="69.5719" y="54.5692"/>
					</TrackLine>
					<TrackLine>
						<End x="70.1038" y="55.1011"/>
					</TrackLine>
					<TrackLine>
						<End x="71.6527" y="55.8664"/>
					</TrackLine>
					<TrackLine>
						<End x="72.4049" y="55.8664"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0729" y="55.4653"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6173" y="55.2398"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9738" y="54.8833"/>
					</TrackLine>
					<TrackLine>
						<End x="75.5262" y="54.8833"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="66.25" y="63"/>
					<TrackLine>
						<End x="67.9" y="62.125"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="62.025"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="61.9836"/>
					</TrackLine>
					<TrackLine>
						<End x="68.0719" y="53.4428"/>
					</TrackLine>
					<TrackLine>
						<End x="68.3877" y="52.2645"/>
					</TrackLine>
					<TrackLine>
						<End x="68.3877" y="51.8821"/>
					</TrackLine>
					<TrackLine>
						<End x="68.504" y="51.6014"/>
					</TrackLine>
					<TrackLine>
						<End x="69.4569" y="50.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="69.7376" y="50.5322"/>
					</TrackLine>
					<TrackLine>
						<End x="71.0852" y="50.5322"/>
					</TrackLine>
					<TrackLine>
						<End x="72.1386" y="50.716"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1394" y="50.716"/>
					</TrackLine>
					<TrackLine>
						<End x="73.847" y="50.0084"/>
					</TrackLine>
					<TrackLine>
						<End x="74.15" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="30.5" y="68.25"/>
					<TrackLine>
						<End x="31.45" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="32.15" y="67.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4" y="63.9336"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4586" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="34.5" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="36.25" y="63"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="17.25" y="56.5"/>
					<TrackLine>
						<End x="17.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9247" y="62.205"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="39.633" y="89.2248"/>
					<TrackLine>
						<End x="40.0282" y="91.5048"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0282" y="92.257"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0108" y="95.4319"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0108" y="96.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3567" y="97.6123"/>
					</TrackLine>
					<TrackLine>
						<End x="38.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="38.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="60.2" y="41"/>
					<TrackLine>
						<End x="60.85" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="62.325" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="62.425" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="63.25" y="40.575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="43.9184" y="65.7561"/>
					<TrackLine>
						<End x="43.799" y="64.9729"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7777" y="62.4795"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7777" y="60.9789"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4338" y="58.762"/>
					</TrackLine>
					<TrackLine>
						<End x="45.1438" y="58.052"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4994" y="58.052"/>
					</TrackLine>
					<TrackLine>
						<End x="46.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="46.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="72" y="67.25"/>
					<TrackLine>
						<End x="71.05" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="70.35" y="66.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="69.075" y="65.1261"/>
					</TrackLine>
					<TrackLine>
						<End x="68.1" y="63.9336"/>
					</TrackLine>
					<TrackLine>
						<End x="68.0414" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="68" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="66.25" y="63"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="21.25" y="74"/>
					<TrackLine>
						<End x="21.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="26.8121" y="82.0698"/>
					</TrackLine>
					<TrackLine>
						<End x="28.0924" y="83.5107"/>
					</TrackLine>
					<TrackLine>
						<End x="29.1534" y="84.5717"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5753" y="84.7465"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0411" y="84.9"/>
					</TrackLine>
					<TrackLine>
						<End x="33.4589" y="84.9"/>
					</TrackLine>
					<TrackLine>
						<End x="35.5961" y="84.4288"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="16.88" y="23.02"/>
					<TrackLine>
						<End x="16.88" y="22.87"/>
					</TrackLine>
					<TrackLine>
						<End x="15.73" y="21.1063"/>
					</TrackLine>
					<TrackLine>
						<End x="15.49" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="14.8163" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="13.8637" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="11.3237" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="10.65" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="10.15" y="22.2705"/>
					</TrackLine>
					<TrackLine>
						<End x="10.15" y="23.4695"/>
					</TrackLine>
					<TrackLine>
						<End x="10.15" y="23.7695"/>
					</TrackLine>
					<TrackLine>
						<End x="11.125" y="51.2086"/>
					</TrackLine>
					<TrackLine>
						<End x="11.125" y="51.25"/>
					</TrackLine>
					<TrackLine>
						<End x="11.125" y="51.35"/>
					</TrackLine>
					<TrackLine>
						<End x="12" y="53"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="40" y="36.5"/>
					<TrackLine>
						<End x="40" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="39.0814" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3005" y="33.734"/>
					</TrackLine>
					<TrackLine>
						<End x="32.9845" y="33.6681"/>
					</TrackLine>
					<TrackLine>
						<End x="32.2323" y="33.6681"/>
					</TrackLine>
					<TrackLine>
						<End x="30.9163" y="33.734"/>
					</TrackLine>
					<TrackLine>
						<End x="30.3844" y="34.2659"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2" y="35.5186"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8" y="41.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8" y="42.7799"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8005" y="44.0298"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8065" y="44.0443"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9949" y="44.3703"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9949" y="45.0417"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3585" y="45.9331"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="36.25" y="63"/>
					<TrackLine>
						<End x="37.9" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="37.9" y="63.975"/>
					</TrackLine>
					<TrackLine>
						<End x="37.9" y="64.0164"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4" y="66.1093"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4" y="66.4407"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4" y="68.3907"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3422" y="79.8911"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="80.25" y="74"/>
					<TrackLine>
						<End x="80.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5133" y="71.5629"/>
					</TrackLine>
					<TrackLine>
						<End x="81.0344" y="70.2469"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5479" y="66.0461"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0778" y="65.5162"/>
					</TrackLine>
					<TrackLine>
						<End x="84.2749" y="65.5162"/>
					</TrackLine>
					<TrackLine>
						<End x="85.3649" y="65.314"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81" y="89"/>
					<TrackLine>
						<End x="81.65" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="82.45" y="88.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="82.45" y="86.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="82.45" y="86.1686"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9814" y="85.7"/>
					</TrackLine>
					<TrackLine>
						<End x="81.3186" y="85.7"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0186" y="85.7"/>
					</TrackLine>
					<TrackLine>
						<End x="79.55" y="86.1686"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8093" y="91.5763"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="50.25" y="74"/>
					<TrackLine>
						<End x="50.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9983" y="81.1294"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2492" y="81.7351"/>
					</TrackLine>
					<TrackLine>
						<End x="55.8662" y="83.2498"/>
					</TrackLine>
					<TrackLine>
						<End x="55.8759" y="83.4435"/>
					</TrackLine>
					<TrackLine>
						<End x="56.0455" y="83.853"/>
					</TrackLine>
					<TrackLine>
						<End x="57.097" y="84.9045"/>
					</TrackLine>
					<TrackLine>
						<End x="57.5065" y="85.0741"/>
					</TrackLine>
					<TrackLine>
						<End x="61.5747" y="86.7167"/>
					</TrackLine>
					<TrackLine>
						<End x="66.1711" y="88.0736"/>
					</TrackLine>
					<TrackLine>
						<End x="66.4093" y="88.1723"/>
					</TrackLine>
					<TrackLine>
						<End x="67.6731" y="88.773"/>
					</TrackLine>
					<TrackLine>
						<End x="70.05" y="91"/>
					</TrackLine>
					<TrackLine>
						<End x="71" y="91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="76.25" y="56.5"/>
					<TrackLine>
						<End x="76.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2618" y="63.9025"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="65.25" y="81.75"/>
					<TrackLine>
						<End x="65.25" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="65.9601" y="80.1"/>
					</TrackLine>
					<TrackLine>
						<End x="69.4269" y="79.7068"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="59" y="36.5"/>
					<TrackLine>
						<End x="59" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="58.0814" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7388" y="33.2115"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5122" y="32.9065"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2106" y="32.9065"/>
					</TrackLine>
					<TrackLine>
						<End x="48.9085" y="32.9373"/>
					</TrackLine>
					<TrackLine>
						<End x="48.6703" y="33.036"/>
					</TrackLine>
					<TrackLine>
						<End x="47.2096" y="34.2864"/>
					</TrackLine>
					<TrackLine>
						<End x="46.4298" y="35.0662"/>
					</TrackLine>
					<TrackLine>
						<End x="46.4073" y="35.1206"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3822" y="37.6799"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3822" y="39.15"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3822" y="39.25"/>
					</TrackLine>
					<TrackLine>
						<End x="45" y="40.125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="64.25" y="99.25"/>
					<TrackLine>
						<End x="64.25" y="100.2"/>
					</TrackLine>
					<TrackLine>
						<End x="63.5399" y="100.9"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0399" y="100.9"/>
					</TrackLine>
					<TrackLine>
						<End x="39.4601" y="100.9"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7499" y="100.8"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="37"/>
				<Subwire width="0.2">
					<Start x="28.3043" y="95.6127"/>
					<TrackLine>
						<End x="28.55" y="94.5"/>
					</TrackLine>
					<TrackLine>
						<End x="29.5" y="94.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NET00026"/>
				<Subwire width="0.2">
					<Start x="92.2" y="87.75"/>
					<TrackLine>
						<End x="92.85" y="87.75"/>
					</TrackLine>
					<TrackLine>
						<End x="93.65" y="88.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="95.466" y="91.2885"/>
					</TrackLine>
					<TrackLine>
						<End x="95.466" y="92.0407"/>
					</TrackLine>
					<TrackLine>
						<End x="94.9341" y="92.5726"/>
					</TrackLine>
					<TrackLine>
						<End x="92.85" y="92.75"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="57"/>
				<Subwire width="0.2">
					<Start x="36.7085" y="84.0156"/>
					<TrackLine>
						<End x="37.75" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="37.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="77.415" y="92.1478"/>
					<TrackLine>
						<End x="79.3662" y="90.8751"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="81" y="87.75"/>
					<TrackLine>
						<End x="80.35" y="87.75"/>
					</TrackLine>
					<TrackLine>
						<End x="79.55" y="88.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="79.3662" y="90.8751"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="83.4258" y="87.9338"/>
					<TrackLine>
						<End x="82.9584" y="86.9797"/>
					</TrackLine>
					<TrackLine>
						<End x="82.95" y="85.9701"/>
					</TrackLine>
					<TrackLine>
						<End x="82.405" y="77.2406"/>
					</TrackLine>
					<TrackLine>
						<End x="82.405" y="76.4892"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9363" y="75.9579"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="84.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="84.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="53.0681" y="71.6232"/>
					<TrackLine>
						<End x="54.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="54.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="83.4258" y="87.9338"/>
					<TrackLine>
						<End x="91.55" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="54.25" y="74"/>
					<TrackLine>
						<End x="54.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7372" y="80.1011"/>
					</TrackLine>
					<TrackLine>
						<End x="57.2059" y="81.2326"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6085" y="82.8909"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6132" y="82.9145"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6152" y="82.9629"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9871" y="83.3348"/>
					</TrackLine>
					<TrackLine>
						<End x="62.325" y="84.3087"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="25.25" y="74"/>
					<TrackLine>
						<End x="25.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="25.1159" y="72.5669"/>
					</TrackLine>
					<TrackLine>
						<End x="25.1159" y="71.5171"/>
					</TrackLine>
					<TrackLine>
						<End x="25.1182" y="71.5116"/>
					</TrackLine>
					<TrackLine>
						<End x="25.2407" y="71.389"/>
					</TrackLine>
					<TrackLine>
						<End x="26.1514" y="70.2242"/>
					</TrackLine>
					<TrackLine>
						<End x="27.2117" y="61.2434"/>
					</TrackLine>
					<TrackLine>
						<End x="27.2117" y="60.1408"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0514" y="59.6315"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="81" y="90.25"/>
					<TrackLine>
						<End x="81.65" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="82.45" y="89.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="83.4258" y="87.9338"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="71" y="87"/>
					<TrackLine>
						<End x="70.05" y="87"/>
					</TrackLine>
					<TrackLine>
						<End x="64.5843" y="85.3494"/>
					</TrackLine>
					<TrackLine>
						<End x="62.325" y="84.3087"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="84.4525" y="66.4208"/>
					<TrackLine>
						<End x="84.4138" y="68.6906"/>
					</TrackLine>
					<TrackLine>
						<End x="84.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="84.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="13" y="61.25"/>
					<TrackLine>
						<End x="13.95" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="52.75" y="36.5"/>
					<TrackLine>
						<End x="52.75" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="53.0955" y="34.9956"/>
					</TrackLine>
					<TrackLine>
						<End x="53.0955" y="34.2434"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5636" y="33.7115"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4127" y="33.4065"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3101" y="33.4065"/>
					</TrackLine>
					<TrackLine>
						<End x="49.008" y="33.4373"/>
					</TrackLine>
					<TrackLine>
						<End x="48.9536" y="33.4598"/>
					</TrackLine>
					<TrackLine>
						<End x="47.4392" y="34.7639"/>
					</TrackLine>
					<TrackLine>
						<End x="46.9073" y="35.2958"/>
					</TrackLine>
					<TrackLine>
						<End x="46.2902" y="38.056"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="49" y="44.75"/>
					<TrackLine>
						<End x="48.35" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="47.55" y="43.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="47.0561" y="42.7946"/>
					</TrackLine>
					<TrackLine>
						<End x="47.05" y="42.7799"/>
					</TrackLine>
					<TrackLine>
						<End x="47.05" y="41.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="47.1167" y="41.2519"/>
					</TrackLine>
					<TrackLine>
						<End x="47.1167" y="40.4892"/>
					</TrackLine>
					<TrackLine>
						<End x="47.15" y="39.4157"/>
					</TrackLine>
					<TrackLine>
						<End x="47.15" y="39.3157"/>
					</TrackLine>
					<TrackLine>
						<End x="47.15" y="38.9843"/>
					</TrackLine>
					<TrackLine>
						<End x="46.2902" y="38.056"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="16.25" y="56.5"/>
					<TrackLine>
						<End x="16.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="13.8193" y="53.7064"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="50.6801" y="44.037"/>
					<TrackLine>
						<End x="49.65" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="44.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="55.25" y="74"/>
					<TrackLine>
						<End x="55.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="53.9554" y="70.7808"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="31.2924" y="34.642"/>
					<TrackLine>
						<End x="30" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="30" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="26.25" y="74"/>
					<TrackLine>
						<End x="26.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="26.0423" y="72.8835"/>
					</TrackLine>
					<TrackLine>
						<End x="25.5494" y="72.3906"/>
					</TrackLine>
					<TrackLine>
						<End x="25.5494" y="71.6934"/>
					</TrackLine>
					<TrackLine>
						<End x="25.6082" y="71.6346"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6289" y="70.4538"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6514" y="70.3994"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9594" y="60.0076"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9594" y="59.2554"/>
					</TrackLine>
					<TrackLine>
						<End x="27.4275" y="58.7235"/>
					</TrackLine>
					<TrackLine>
						<End x="26.7892" y="58.4152"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="85.25" y="74"/>
					<TrackLine>
						<End x="85.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="86.4536" y="71.8483"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="30" y="36.5"/>
					<TrackLine>
						<End x="30" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="30" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="41"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="29.75" y="41"/>
					<TrackLine>
						<End x="29.1" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="28.3" y="41.9186"/>
					</TrackLine>
					<TrackLine>
						<End x="28.3" y="42.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="28.3002" y="43.8313"/>
					</TrackLine>
					<TrackLine>
						<End x="28.3975" y="44.2035"/>
					</TrackLine>
					<TrackLine>
						<End x="28.3975" y="45.2085"/>
					</TrackLine>
					<TrackLine>
						<End x="28.3" y="45.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="28.2665" y="46.3092"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6995" y="50.5726"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="55.25" y="74"/>
					<TrackLine>
						<End x="55.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="57.4921" y="76.1092"/>
					</TrackLine>
					<TrackLine>
						<End x="61.0955" y="76.633"/>
					</TrackLine>
					<TrackLine>
						<End x="69.803" y="78.7988"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2154" y="81.6369"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="71" y="86"/>
					<TrackLine>
						<End x="71.95" y="86"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="85.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2154" y="81.6369"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="49" y="43.5"/>
					<TrackLine>
						<End x="48.35" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47.55" y="42.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="47.55" y="41.9186"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5833" y="41.4452"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5833" y="40.6824"/>
					</TrackLine>
					<TrackLine>
						<End x="47.65" y="39.6228"/>
					</TrackLine>
					<TrackLine>
						<End x="47.8153" y="35.6719"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="30.5" y="62.25"/>
					<TrackLine>
						<End x="31.45" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6159" y="62.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8505" y="61.9159"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8505" y="61.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6159" y="61.3495"/>
					</TrackLine>
					<TrackLine>
						<End x="31.45" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="30.5" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="30.5" y="61.25"/>
					<TrackLine>
						<End x="30.2967" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="30.2967" y="57.2866"/>
					</TrackLine>
					<TrackLine>
						<End x="30.8286" y="56.7547"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9814" y="49.3"/>
					</TrackLine>
					<TrackLine>
						<End x="50.45" y="48.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7439" y="46.1878"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7439" y="45.5184"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7038" y="44.1817"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5514" y="43.8137"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5514" y="43.6761"/>
					</TrackLine>
					<TrackLine>
						<End x="51.041" y="43.1657"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3192" y="43.1657"/>
					</TrackLine>
					<TrackLine>
						<End x="49.65" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="43.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="51.5" y="36.5"/>
					<TrackLine>
						<End x="51.5" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1875" y="34.6195"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="52.1875" y="34.6195"/>
					<TrackLine>
						<End x="51.2375" y="33.9065"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4853" y="33.9065"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1832" y="33.9373"/>
					</TrackLine>
					<TrackLine>
						<End x="48.6513" y="34.4692"/>
					</TrackLine>
					<TrackLine>
						<End x="47.8153" y="35.6719"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="75.745" y="70.1673"/>
					<TrackLine>
						<End x="69.993" y="71.0246"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6429" y="71.6153"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8907" y="71.6153"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2871" y="69.8848"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9152" y="69.5129"/>
					</TrackLine>
					<TrackLine>
						<End x="57.5038" y="68.7501"/>
					</TrackLine>
					<TrackLine>
						<End x="57.485" y="68.722"/>
					</TrackLine>
					<TrackLine>
						<End x="56.0142" y="67.2512"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4948" y="65.9126"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4738" y="65.8986"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5099" y="65.2945"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7204" y="64.9675"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8662" y="64.7803"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8235" y="64.7626"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0528" y="63.9919"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5018" y="62.8745"/>
					</TrackLine>
					<TrackLine>
						<End x="49.18" y="62.0548"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0208" y="61.6704"/>
					</TrackLine>
					<TrackLine>
						<End x="48.3755" y="60.8479"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7819" y="58.3964"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="46.7819" y="58.3964"/>
					<TrackLine>
						<End x="47.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="47.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="53.5" y="94"/>
					<TrackLine>
						<End x="54.45" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="55.15" y="93.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="55.15" y="86.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="55.15" y="85.7101"/>
					</TrackLine>
					<TrackLine>
						<End x="55.0848" y="84.7371"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9397" y="84.5919"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5715" y="83.703"/>
					</TrackLine>
					<TrackLine>
						<End x="54.556" y="83.5998"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7267" y="81.9791"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9469" y="81.1993"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7505" y="76.0239"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="18.25" y="56.5"/>
					<TrackLine>
						<End x="18.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="20.37" y="63.0402"/>
					</TrackLine>
					<TrackLine>
						<End x="20.37" y="64.1428"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2233" y="67.2338"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="77.25" y="56.5"/>
					<TrackLine>
						<End x="77.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5624" y="59.6429"/>
					</TrackLine>
					<TrackLine>
						<End x="76.2254" y="68.1182"/>
					</TrackLine>
					<TrackLine>
						<End x="76.2229" y="69.2062"/>
					</TrackLine>
					<TrackLine>
						<End x="75.745" y="70.1673"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="45.7505" y="76.0239"/>
					<TrackLine>
						<End x="44.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="44.55" y="75.2399"/>
					</TrackLine>
					<TrackLine>
						<End x="44.55" y="73.3399"/>
					</TrackLine>
					<TrackLine>
						<End x="44.55" y="72.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7821" y="66.1139"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7821" y="65.3983"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7376" y="65.3537"/>
					</TrackLine>
					<TrackLine>
						<End x="44.5204" y="64.8294"/>
					</TrackLine>
					<TrackLine>
						<End x="44.2777" y="62.38"/>
					</TrackLine>
					<TrackLine>
						<End x="44.2777" y="61.0784"/>
					</TrackLine>
					<TrackLine>
						<End x="44.8358" y="58.9285"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3103" y="58.454"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6659" y="58.454"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7819" y="58.3964"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="14.34" y="23.02"/>
					<TrackLine>
						<End x="14.34" y="22.87"/>
					</TrackLine>
					<TrackLine>
						<End x="12.2639" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="11.3361" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="10.68" y="22.4061"/>
					</TrackLine>
					<TrackLine>
						<End x="10.65" y="22.6937"/>
					</TrackLine>
					<TrackLine>
						<End x="10.65" y="23.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="12.217" y="44.3926"/>
					</TrackLine>
					<TrackLine>
						<End x="16.3332" y="54.2182"/>
					</TrackLine>
					<TrackLine>
						<End x="16.8066" y="54.6916"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5013" y="54.9434"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9068" y="55.3489"/>
					</TrackLine>
					<TrackLine>
						<End x="18.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="18.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="49" y="42.25"/>
					<TrackLine>
						<End x="49.65" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2168" y="42.7024"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2443" y="42.7138"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0033" y="43.4728"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0147" y="43.5003"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0147" y="43.7215"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0966" y="43.9193"/>
					</TrackLine>
					<TrackLine>
						<End x="53.144" y="45.3526"/>
					</TrackLine>
					<TrackLine>
						<End x="53.144" y="46.3536"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9351" y="48.998"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="50.25" y="36.5"/>
					<TrackLine>
						<End x="50.25" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="52.789" y="42.9479"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9414" y="43.3159"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9414" y="43.4535"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8303" y="44.9073"/>
					</TrackLine>
					<TrackLine>
						<End x="53.9442" y="45.1823"/>
					</TrackLine>
					<TrackLine>
						<End x="53.9442" y="45.3966"/>
					</TrackLine>
					<TrackLine>
						<End x="54.2223" y="46.5747"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3071" y="46.7793"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4165" y="49.1166"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4165" y="49.8312"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9111" y="50.3366"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1965" y="50.3366"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6911" y="49.8312"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6912" y="49.6723"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1858" y="49.1669"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9351" y="48.998"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="50.25" y="36.5"/>
					<TrackLine>
						<End x="50.25" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8614" y="34.8145"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="52.9351" y="48.998"/>
					<TrackLine>
						<End x="52.4524" y="49.1216"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9124" y="53.0692"/>
					</TrackLine>
					<TrackLine>
						<End x="44.1956" y="53.4931"/>
					</TrackLine>
					<TrackLine>
						<End x="42.753" y="54.4317"/>
					</TrackLine>
					<TrackLine>
						<End x="41.8327" y="55.352"/>
					</TrackLine>
					<TrackLine>
						<End x="39.417" y="60.4789"/>
					</TrackLine>
					<TrackLine>
						<End x="39.35" y="60.6406"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1614" y="63.439"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="54.5538" y="49.4739"/>
					<TrackLine>
						<End x="53.7526" y="46.6681"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5441" y="45.4762"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5441" y="45.2619"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4911" y="45.1339"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4895" y="43.6568"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4781" y="43.6293"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4781" y="43.4081"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3962" y="43.2103"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5068" y="42.3209"/>
					</TrackLine>
					<TrackLine>
						<End x="49.65" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="41"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="49" y="36.5"/>
					<TrackLine>
						<End x="49" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5593" y="34.8453"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="49" y="41"/>
					<TrackLine>
						<End x="49" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="74.1022" y="39.2304"/>
					<TrackLine>
						<End x="73.5931" y="39.5977"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6651" y="39.6191"/>
					</TrackLine>
					<TrackLine>
						<End x="72.1332" y="40.151"/>
					</TrackLine>
					<TrackLine>
						<End x="70.9" y="41.8478"/>
					</TrackLine>
					<TrackLine>
						<End x="70.3728" y="42.375"/>
					</TrackLine>
					<TrackLine>
						<End x="65.2693" y="44.631"/>
					</TrackLine>
					<TrackLine>
						<End x="64.4895" y="45.4108"/>
					</TrackLine>
					<TrackLine>
						<End x="62.1439" y="49.0446"/>
					</TrackLine>
					<TrackLine>
						<End x="61.3946" y="49.7939"/>
					</TrackLine>
					<TrackLine>
						<End x="61.3799" y="49.8"/>
					</TrackLine>
					<TrackLine>
						<End x="60.5796" y="49.8103"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3041" y="51.8819"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="45.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="45.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="74.1022" y="39.2304"/>
					<TrackLine>
						<End x="75.7814" y="40.2"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="40.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5855" y="42.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="77.6445" y="43.7168"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="42" y="61.25"/>
					<TrackLine>
						<End x="42.95" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7378" y="58.6132"/>
					</TrackLine>
					<TrackLine>
						<End x="43.8365" y="58.375"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7568" y="57.4547"/>
					</TrackLine>
					<TrackLine>
						<End x="44.995" y="57.356"/>
					</TrackLine>
					<TrackLine>
						<End x="45.25" y="57.356"/>
					</TrackLine>
					<TrackLine>
						<End x="45.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="84.75" y="36.5"/>
					<TrackLine>
						<End x="84.75" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="83.8314" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="81.5299" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1293" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="77.8707" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3707" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1722" y="34.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2822" y="35.0222"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2" y="35.2207"/>
					</TrackLine>
					<TrackLine>
						<End x="74.125" y="39.0658"/>
					</TrackLine>
					<TrackLine>
						<End x="74.1022" y="39.2304"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="74.8" y="46"/>
					<TrackLine>
						<End x="75.45" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="77.6445" y="43.7168"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="83.5" y="36.5"/>
					<TrackLine>
						<End x="83.5" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="83.8009" y="39.278"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="59.5" y="62.25"/>
					<TrackLine>
						<End x="58.55" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3841" y="62.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1495" y="61.9159"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1495" y="61.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="58.3841" y="61.3495"/>
					</TrackLine>
					<TrackLine>
						<End x="58.55" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="74.8" y="44.75"/>
					<TrackLine>
						<End x="74.15" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="73.35" y="45.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="73.35" y="46.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="73.35" y="48.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="73.447" y="49.1733"/>
					</TrackLine>
					<TrackLine>
						<End x="73.447" y="49.8427"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9737" y="50.316"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3043" y="50.316"/>
					</TrackLine>
					<TrackLine>
						<End x="71.1656" y="50.1283"/>
					</TrackLine>
					<TrackLine>
						<End x="69.6572" y="50.1283"/>
					</TrackLine>
					<TrackLine>
						<End x="69.2281" y="50.3061"/>
					</TrackLine>
					<TrackLine>
						<End x="68.1616" y="51.3726"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9838" y="51.8017"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9838" y="52.1746"/>
					</TrackLine>
					<TrackLine>
						<End x="67.5187" y="53.2752"/>
					</TrackLine>
					<TrackLine>
						<End x="66.8155" y="54.1816"/>
					</TrackLine>
					<TrackLine>
						<End x="60.45" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="74.8" y="44.75"/>
					<TrackLine>
						<End x="75.45" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="43.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="76.6775" y="42.8232"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="69.983" y="64.75"/>
					<TrackLine>
						<End x="68.5719" y="54.8439"/>
					</TrackLine>
					<TrackLine>
						<End x="68.5719" y="53.5423"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7916" y="52.3448"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7916" y="51.9624"/>
					</TrackLine>
					<TrackLine>
						<End x="68.8464" y="51.8302"/>
					</TrackLine>
					<TrackLine>
						<End x="69.6857" y="50.9909"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8179" y="50.9361"/>
					</TrackLine>
					<TrackLine>
						<End x="71.0049" y="50.9361"/>
					</TrackLine>
					<TrackLine>
						<End x="72.0479" y="51.116"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2301" y="51.116"/>
					</TrackLine>
					<TrackLine>
						<End x="73.358" y="51.063"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1371" y="49.7557"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7814" y="49.3"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="48.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5525" y="44.0929"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5525" y="43.3407"/>
					</TrackLine>
					<TrackLine>
						<End x="78.063" y="42.2175"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7439" y="40.4554"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1688" y="38.7684"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7061" y="37.6946"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7" y="37.6799"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7" y="36.3799"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7" y="35.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7061" y="35.3054"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4554" y="34.5561"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4701" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9701" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="79.0299" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="81.3314" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="82.25" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="82.25" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="87.6627" y="42.8043"/>
					<TrackLine>
						<End x="86.65" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="42.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="82.25" y="36.5"/>
					<TrackLine>
						<End x="82.25" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="82.8929" y="39.6541"/>
					</TrackLine>
					<TrackLine>
						<End x="85.35" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="42.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="89.6957" y="46.0373"/>
					<TrackLine>
						<End x="89.4807" y="44.8596"/>
					</TrackLine>
					<TrackLine>
						<End x="88.9488" y="44.3277"/>
					</TrackLine>
					<TrackLine>
						<End x="86.65" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="43.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="81" y="36.5"/>
					<TrackLine>
						<End x="81" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4154" y="39.8837"/>
					</TrackLine>
					<TrackLine>
						<End x="84.55" y="42.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="85.35" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="43.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="75.25" y="56.5"/>
					<TrackLine>
						<End x="75.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="73.3738" y="58.2105"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="88.5727" y="45.2357"/>
					<TrackLine>
						<End x="86.65" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="44.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="73.3738" y="58.2105"/>
					<TrackLine>
						<End x="69.8742" y="55.5786"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0944" y="54.7988"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0719" y="54.7444"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0719" y="53.6418"/>
					</TrackLine>
					<TrackLine>
						<End x="69.1174" y="53.3354"/>
					</TrackLine>
					<TrackLine>
						<End x="69.1955" y="52.4252"/>
					</TrackLine>
					<TrackLine>
						<End x="69.1955" y="52.0523"/>
					</TrackLine>
					<TrackLine>
						<End x="69.9078" y="51.34"/>
					</TrackLine>
					<TrackLine>
						<End x="70.915" y="51.34"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9683" y="51.516"/>
					</TrackLine>
					<TrackLine>
						<End x="73.3097" y="51.516"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5846" y="51.4021"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9946" y="49.7939"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7439" y="49.0446"/>
					</TrackLine>
					<TrackLine>
						<End x="79.03" y="44.3225"/>
					</TrackLine>
					<TrackLine>
						<End x="79.0525" y="44.2681"/>
					</TrackLine>
					<TrackLine>
						<End x="79.0525" y="43.1655"/>
					</TrackLine>
					<TrackLine>
						<End x="79.03" y="43.1111"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4868" y="41.9342"/>
					</TrackLine>
					<TrackLine>
						<End x="77.1678" y="40.1722"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6463" y="38.5388"/>
					</TrackLine>
					<TrackLine>
						<End x="75.2" y="37.4814"/>
					</TrackLine>
					<TrackLine>
						<End x="75.2" y="36.1814"/>
					</TrackLine>
					<TrackLine>
						<End x="75.2" y="35.5186"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6686" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="78.1686" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8314" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="79.75" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="79.75" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="72" y="61.25"/>
					<TrackLine>
						<End x="72.95" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="73.3738" y="58.2105"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="79.75" y="36.5"/>
					<TrackLine>
						<End x="79.75" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="80.3938" y="37.674"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9252" y="38.2054"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9916" y="40.167"/>
					</TrackLine>
					<TrackLine>
						<End x="84.55" y="43.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="85.35" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="44.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="89.5" y="61.25"/>
					<TrackLine>
						<End x="88.55" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="88.55" y="61.25"/>
					<TrackLine>
						<End x="87.45" y="46.9186"/>
					</TrackLine>
					<TrackLine>
						<End x="86.65" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="46"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="86" y="46"/>
					<TrackLine>
						<End x="85.35" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="84.55" y="45.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="80.018" y="38.5812"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="80.018" y="38.5812"/>
					<TrackLine>
						<End x="78.5" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="89.5" y="62.25"/>
					<TrackLine>
						<End x="88.55" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3841" y="62.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="88.1495" y="61.9159"/>
					</TrackLine>
					<TrackLine>
						<End x="88.1495" y="61.5841"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3841" y="61.3495"/>
					</TrackLine>
					<TrackLine>
						<End x="88.55" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="78.0488" y="38.3679"/>
					<TrackLine>
						<End x="77.25" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="77.25" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="86" y="47.25"/>
					<TrackLine>
						<End x="85.35" y="47.25"/>
					</TrackLine>
					<TrackLine>
						<End x="84.55" y="46.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0488" y="38.3679"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="76" y="36.5"/>
					<TrackLine>
						<End x="76" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5543" y="38.1627"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="73.217" y="38.6897"/>
					<TrackLine>
						<End x="72.4355" y="39.1416"/>
					</TrackLine>
					<TrackLine>
						<End x="71.6557" y="39.9214"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4" y="41.6407"/>
					</TrackLine>
					<TrackLine>
						<End x="70.1657" y="41.875"/>
					</TrackLine>
					<TrackLine>
						<End x="64.986" y="44.2072"/>
					</TrackLine>
					<TrackLine>
						<End x="64.0657" y="45.1275"/>
					</TrackLine>
					<TrackLine>
						<End x="61.65" y="48.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="61.1814" y="49.3"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4801" y="49.3103"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2046" y="51.3819"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7529" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="44.55" y="55.2601"/>
					</TrackLine>
					<TrackLine>
						<End x="43.642" y="56.241"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="76.5543" y="38.1627"/>
					<TrackLine>
						<End x="84.55" y="47.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="85.35" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="86" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.2">
					<Start x="40.95" y="48.5"/>
					<TrackLine>
						<End x="40.3" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="37.5916" y="45.6231"/>
					</TrackLine>
					<TrackLine>
						<End x="37.2396" y="45.2711"/>
					</TrackLine>
					<TrackLine>
						<End x="36.919" y="44.21"/>
					</TrackLine>
					<TrackLine>
						<End x="36.9191" y="43.0608"/>
					</TrackLine>
					<TrackLine>
						<End x="36.1454" y="38.3945"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NET00001"/>
				<Subwire width="0.2">
					<Start x="60.2" y="48.5"/>
					<TrackLine>
						<End x="59.55" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="55.6756" y="46.8196"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1615" y="46.3055"/>
					</TrackLine>
					<TrackLine>
						<End x="54.7444" y="45.2263"/>
					</TrackLine>
					<TrackLine>
						<End x="54.7444" y="44.2253"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1354" y="43.6564"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1467" y="43.6292"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1837" y="38.7678"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NET00000"/>
				<Subwire width="0.2">
					<Start x="74.8" y="41"/>
					<TrackLine>
						<End x="74.15" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0412" y="40.5271"/>
					</TrackLine>
				</Subwire>
			</Wire>
		</Wires>
	</Connectivity>

	<Settings version="1.3">
		<Autoroute autoEqu="Pins"/>
		<Autoproc automove="MoveViasWithRefine"/>
		<Placement>
			<PlacementArea>
				<Dot x="0" y="0"/>
				<Dot x="0" y="0"/>
			</PlacementArea>
		</Placement>
		<Labels rotateWithComp="on"/>
	</Settings>

	<DisplayControl version="1.3">
		<View scale="6.67947" scrollHorz="51" scrollVert="56"/>
		<ActiveLayer name="Top"/>
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
				<LayerRef name="Top_outline"/>
				<Colors details="#259500" pads="#259500" fix="#165900"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Top"/>
				<Colors details="#a52310" pads="#841c0c" fix="#631509"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Bottom"/>
				<Colors details="#0f7140" pads="#0c5a33" fix="#094326"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Bottom_outline"/>
				<Colors details="#00aaaa" pads="#00aaaa" fix="#006666"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Mask Top"/>
				<Colors details="#b15738" pads="#8d452c" fix="#b15738"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Paste Top"/>
				<Colors details="#af583a" pads="#8c462e" fix="#af583a"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Mask Bottom"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Paste Bottom"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
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