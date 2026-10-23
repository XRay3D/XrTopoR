<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : arz_4L.fst                     -->
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
			<Layer name="Int 1" type="Signal" thickness="0"/>
			<Layer name="Int 2" type="Signal" thickness="0"/>
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
						<Start x="-0.1" y="-0.1"/>
						<SegmentLine>
							<End x="-0.1" y="112.1"/>
						</SegmentLine>
						<SegmentLine>
							<End x="102.1" y="112.1"/>
						</SegmentLine>
						<SegmentLine>
							<End x="102.1" y="-0.1"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-0.1" y="-0.1"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.1">
					<Polyline>
						<Start x="5" y="5"/>
						<SegmentLine>
							<End x="5" y="107"/>
						</SegmentLine>
						<SegmentLine>
							<End x="97" y="107"/>
						</SegmentLine>
						<SegmentLine>
							<End x="97" y="5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5" y="5"/>
						</SegmentLine>
					</Polyline>
				</Shape>
			</Contour>
		</BoardOutline>
	</Constructive>

	<ComponentsOnBoard version="1.3">
		<Components>
			<CompInstance name="C12" uniqueId="JADCNBDN" side="Bottom" angle="270">
				<ComponentRef name="C12"/>
				<FootprintRef name="16-4.7_auto"/>
				<Org x="91.75" y="27"/>
			</CompInstance>
			<CompInstance name="D20" uniqueId="RRAHFZGL" side="Bottom" angle="270">
				<ComponentRef name="D20"/>
				<FootprintRef name="Н1806ХМ1-241_Primary"/>
				<Org x="37.75" y="81.75"/>
			</CompInstance>
			<CompInstance name="D8" uniqueId="GMZEJJHK" side="Top">
				<ComponentRef name="D8"/>
				<FootprintRef name="1533ТМ2_Primary"/>
				<Org x="81" y="94"/>
			</CompInstance>
			<CompInstance name="D7" uniqueId="INSPTAIZ" side="Bottom">
				<ComponentRef name="D7"/>
				<FootprintRef name="1533ТМ2_Primary"/>
				<Org x="92.2" y="94"/>
			</CompInstance>
			<CompInstance name="D3" uniqueId="KXRADBTC" side="Top" angle="90">
				<ComponentRef name="D3"/>
				<FootprintRef name="556PT5_Primary"/>
				<Org x="26" y="29"/>
			</CompInstance>
			<CompInstance name="D2" uniqueId="AIQYXUCC" side="Top" angle="90">
				<ComponentRef name="D2"/>
				<FootprintRef name="556PT5_Primary"/>
				<Org x="44.3934" y="29.1388"/>
			</CompInstance>
			<CompInstance name="D1" uniqueId="MJEZLOLG" side="Top" angle="90">
				<ComponentRef name="D1"/>
				<FootprintRef name="556PT5_Primary"/>
				<Org x="77.75" y="29"/>
			</CompInstance>
			<CompInstance name="DR1" uniqueId="ODJGJJDP" side="Bottom" angle="90">
				<ComponentRef name="DR1"/>
				<FootprintRef name="Б19К-2_Primary"/>
				<Org x="76" y="36.5"/>
			</CompInstance>
			<CompInstance name="DR3" uniqueId="UTHPEZZN" side="Bottom" angle="90">
				<ComponentRef name="DR3"/>
				<FootprintRef name="Б19К-2_Primary"/>
				<Org x="30" y="36.5"/>
			</CompInstance>
			<CompInstance name="DR2" uniqueId="JHKJHHLZ" side="Bottom" angle="90">
				<ComponentRef name="DR2"/>
				<FootprintRef name="Б19К-2_Primary"/>
				<Org x="49" y="36.5"/>
			</CompInstance>
			<CompInstance name="D12" uniqueId="SBXTJWKH" side="Bottom" angle="90">
				<ComponentRef name="D12"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="81.25" y="74"/>
			</CompInstance>
			<CompInstance name="D13" uniqueId="ZYGOLUJW" side="Top" angle="90">
				<ComponentRef name="D13"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="81.25" y="56.5"/>
			</CompInstance>
			<CompInstance name="D11" uniqueId="DBIJPMBV" side="Top" angle="90">
				<ComponentRef name="D11"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="22.25" y="56.5"/>
			</CompInstance>
			<CompInstance name="D16" uniqueId="FTKOQMVP" side="Bottom">
				<ComponentRef name="D16"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="71" y="90"/>
			</CompInstance>
			<CompInstance name="D17" uniqueId="IOHIJBBE" side="Bottom" angle="90">
				<ComponentRef name="D17"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="22.25" y="74"/>
			</CompInstance>
			<CompInstance name="D14" uniqueId="HHVDWNNU" side="Bottom" angle="90">
				<ComponentRef name="D14"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="51.25" y="74"/>
			</CompInstance>
			<CompInstance name="D15" uniqueId="XBVKDGXZ" side="Top" angle="90">
				<ComponentRef name="D15"/>
				<FootprintRef name="H1806XM1-242_Primary"/>
				<Org x="51.25" y="56.5"/>
			</CompInstance>
			<CompInstance name="D9" uniqueId="PHKGLXED" side="Top" angle="270">
				<ComponentRef name="D9"/>
				<FootprintRef name="533ЛЛ1_Primary"/>
				<Org x="18.75" y="45.75"/>
			</CompInstance>
			<CompInstance name="D10" uniqueId="RKWNJJZP" side="Top" angle="90">
				<ComponentRef name="D10"/>
				<FootprintRef name="1533ЛН2_Primary"/>
				<Org x="11.25" y="83.25"/>
			</CompInstance>
			<CompInstance name="D18" uniqueId="JYFXBQYB" side="Bottom" angle="270">
				<ComponentRef name="D18"/>
				<FootprintRef name="1533АП6_Primary"/>
				<Org x="26.25" y="28.25"/>
			</CompInstance>
			<CompInstance name="D19" uniqueId="EVDYCKTX" side="Top" angle="90">
				<ComponentRef name="D19"/>
				<FootprintRef name="1533АП6_Primary"/>
				<Org x="62.75" y="29"/>
			</CompInstance>
			<CompInstance name="D6" uniqueId="AJJNMOVP" side="Bottom" angle="180">
				<ComponentRef name="D6"/>
				<FootprintRef name="1533ЛА2_Primary"/>
				<Org x="29.75" y="41"/>
			</CompInstance>
			<CompInstance name="D5" uniqueId="NLGJQMRP" side="Bottom" angle="180">
				<ComponentRef name="D5"/>
				<FootprintRef name="1533ЛА2_Primary"/>
				<Org x="49" y="41"/>
			</CompInstance>
			<CompInstance name="D4" uniqueId="UZLEDOOO" side="Bottom">
				<ComponentRef name="D4"/>
				<FootprintRef name="1533ЛА2_Primary"/>
				<Org x="86" y="48.5"/>
			</CompInstance>
			<CompInstance name="P29" uniqueId="EJJVMPRH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P29"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="45.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P28" uniqueId="FXCJPISL" side="Top" angle="90" fixed="on">
				<ComponentRef name="P28"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="46.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P25" uniqueId="BMWQADII" side="Top" angle="90" fixed="on">
				<ComponentRef name="P25"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="44" y="93.75"/>
			</CompInstance>
			<CompInstance name="P24" uniqueId="LDZQCSZG" side="Top" angle="90" fixed="on">
				<ComponentRef name="P24"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="35.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P27" uniqueId="QJNJARPT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P27"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="49" y="93.75"/>
			</CompInstance>
			<CompInstance name="P26" uniqueId="BTHULIXL" side="Top" angle="90" fixed="on">
				<ComponentRef name="P26"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="50.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P21" uniqueId="OFUTHDAX" side="Top" angle="90" fixed="on">
				<ComponentRef name="P21"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="27.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P20" uniqueId="WKUKEQCY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P20"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="37.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P23" uniqueId="GWPIJOEI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P23"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="32.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P22" uniqueId="FJBUZNSM" side="Top" angle="90" fixed="on">
				<ComponentRef name="P22"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="29" y="93.75"/>
			</CompInstance>
			<CompInstance name="P53" uniqueId="FIEUZQVL" side="Top" angle="90" fixed="on">
				<ComponentRef name="P53"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="55.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P56" uniqueId="GYKCUBXX" side="Top" angle="90" fixed="on">
				<ComponentRef name="P56"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="52.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P57" uniqueId="LUOSMXLN" side="Top" angle="90" fixed="on">
				<ComponentRef name="P57"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="54" y="93.75"/>
			</CompInstance>
			<CompInstance name="P54" uniqueId="GNOQJCKN" side="Top" angle="90" fixed="on">
				<ComponentRef name="P54"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="61.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P55" uniqueId="CHVCALXQ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P55"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="31.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P19" uniqueId="CRUWDSAC" side="Top" angle="90" fixed="on">
				<ComponentRef name="P19"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="41.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P14" uniqueId="OIPGVHTF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P14"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="40.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P13" uniqueId="QLGYODIQ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P13"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="39" y="93.75"/>
			</CompInstance>
			<CompInstance name="P85" uniqueId="XGVPTBEB" side="Top" angle="90" fixed="on">
				<ComponentRef name="P85"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="64" y="93.75"/>
			</CompInstance>
			<CompInstance name="P82" uniqueId="TQEXMCJE" side="Top" angle="90" fixed="on">
				<ComponentRef name="P82"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="62.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P81" uniqueId="YJPBETZF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P81"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="57.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P43" uniqueId="YOQSRTOP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P43"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="59" y="93.75"/>
			</CompInstance>
			<CompInstance name="P42" uniqueId="AGSFXTRC" side="Top" angle="90" fixed="on">
				<ComponentRef name="P42"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="69" y="93.75"/>
			</CompInstance>
			<CompInstance name="P41" uniqueId="HNKBGDEV" side="Top" angle="90" fixed="on">
				<ComponentRef name="P41"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="36.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P40" uniqueId="CRPVKTTR" side="Top" angle="90" fixed="on">
				<ComponentRef name="P40"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="66.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P47" uniqueId="YZXQYBRJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P47"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="34" y="93.75"/>
			</CompInstance>
			<CompInstance name="P46" uniqueId="RFXLOEOL" side="Top" angle="90" fixed="on">
				<ComponentRef name="P46"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="67.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P45" uniqueId="DNMMQZBV" side="Top" angle="90" fixed="on">
				<ComponentRef name="P45"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="65.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P44" uniqueId="JVCUOMOG" side="Top" angle="90" fixed="on">
				<ComponentRef name="P44"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="30.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P70" uniqueId="SOSEYMOS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P70"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="56.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P39" uniqueId="IBBRIWWC" side="Top" angle="90" fixed="on">
				<ComponentRef name="P39"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="70.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P34" uniqueId="HJCQELSQ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P34"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="71.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="P35" uniqueId="LLHSJYQK" side="Top" angle="90" fixed="on">
				<ComponentRef name="P35"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="60.25" y="93.75"/>
			</CompInstance>
			<CompInstance name="P36" uniqueId="MRNUYVNJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P36"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="74" y="93.75"/>
			</CompInstance>
			<CompInstance name="P37" uniqueId="FZQCOHJK" side="Top" angle="90" fixed="on">
				<ComponentRef name="P37"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="72.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P30" uniqueId="ELZOFIEP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P30"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="42.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P31" uniqueId="LNCKXWGM" side="Top" angle="90" fixed="on">
				<ComponentRef name="P31"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="47.75" y="93.75"/>
			</CompInstance>
			<CompInstance name="P32" uniqueId="VPLEITYF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P32"/>
				<FootprintRef name="PLD-10_2_2"/>
				<Org x="51.5" y="93.75"/>
			</CompInstance>
			<CompInstance name="C10" uniqueId="BLFHRVRE" side="Bottom" angle="90">
				<ComponentRef name="C10"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="92.5" y="75.75"/>
			</CompInstance>
			<CompInstance name="C8" uniqueId="KTKJYUGC" side="Bottom">
				<ComponentRef name="C8"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="94.375" y="37.875"/>
			</CompInstance>
			<CompInstance name="C9" uniqueId="DYYGCUPT" side="Top">
				<ComponentRef name="C9"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="71.875" y="89.5"/>
			</CompInstance>
			<CompInstance name="C4" uniqueId="NXAZFRAY" side="Bottom" angle="270">
				<ComponentRef name="C4"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="68.25" y="36.25"/>
			</CompInstance>
			<CompInstance name="C5" uniqueId="BOXZYFUZ" side="Bottom" angle="180">
				<ComponentRef name="C5"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="7.75" y="53"/>
			</CompInstance>
			<CompInstance name="C6" uniqueId="GKSKXJBO" side="Bottom" angle="90">
				<ComponentRef name="C6"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="45" y="44.375"/>
			</CompInstance>
			<CompInstance name="C7" uniqueId="WEDJLWEI" side="Bottom" angle="90">
				<ComponentRef name="C7"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="36.25" y="67.25"/>
			</CompInstance>
			<CompInstance name="C1" uniqueId="KSEQRJIB" side="Bottom">
				<ComponentRef name="C1"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="23.5" y="94.75"/>
			</CompInstance>
			<CompInstance name="C2" uniqueId="RZRNITNQ" side="Top">
				<ComponentRef name="C2"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="10.25" y="31"/>
			</CompInstance>
			<CompInstance name="C3" uniqueId="EFPPZQJL" side="Bottom" angle="90">
				<ComponentRef name="C3"/>
				<FootprintRef name="0,1М_auto"/>
				<Org x="66.25" y="67.25"/>
			</CompInstance>
			<CompInstance name="R5" uniqueId="DSZLBCZG" side="Bottom" angle="270">
				<ComponentRef name="R5"/>
				<FootprintRef name="Р1-12-0,25_auto"/>
				<Org x="63.25" y="37.5"/>
			</CompInstance>
			<CompInstance name="R4" uniqueId="QKOVWUPI" side="Top" angle="90">
				<ComponentRef name="R4"/>
				<FootprintRef name="Р1-12-0,25_auto"/>
				<Org x="35.5" y="86.5"/>
			</CompInstance>
			<CompInstance name="R6" uniqueId="UEAFCRDT" side="Top" angle="90">
				<ComponentRef name="R6"/>
				<FootprintRef name="Р1-12-0,25_auto"/>
				<Org x="38" y="86.5"/>
			</CompInstance>
			<CompInstance name="12" uniqueId="LANCTCLH" side="Top" angle="180">
				<ComponentRef name="12"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="58.5" y="51"/>
			</CompInstance>
			<CompInstance name="13" uniqueId="YEWBMWCX" side="Top" angle="180">
				<ComponentRef name="13"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="79" y="51.25"/>
			</CompInstance>
			<CompInstance name="10" uniqueId="SERPPIKJ" side="Top" angle="180">
				<ComponentRef name="10"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="80.875" y="51.25"/>
			</CompInstance>
			<CompInstance name="11" uniqueId="ZNJCAOUV" side="Top" angle="270">
				<ComponentRef name="11"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="41.6962" y="34.9758"/>
			</CompInstance>
			<CompInstance name="9" uniqueId="BMXYXMRJ" side="Top" angle="180">
				<ComponentRef name="9"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="82.75" y="51.25"/>
			</CompInstance>
			<CompInstance name="8" uniqueId="XCMVVMVF" side="Top">
				<ComponentRef name="8"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="85.25" y="50.125"/>
			</CompInstance>
			<CompInstance name="7" uniqueId="DCVCQQTQ" side="Top" angle="180">
				<ComponentRef name="7"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="54.875" y="53.5"/>
			</CompInstance>
			<CompInstance name="6" uniqueId="STMBSMEA" side="Top" angle="270">
				<ComponentRef name="6"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="48.75" y="50.375"/>
			</CompInstance>
			<CompInstance name="5" uniqueId="ZQUFJHQY" side="Top" angle="270">
				<ComponentRef name="5"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="46.25" y="50.375"/>
			</CompInstance>
			<CompInstance name="4" uniqueId="DGIOUYOR" side="Top" angle="270">
				<ComponentRef name="4"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="43.75" y="50.375"/>
			</CompInstance>
			<CompInstance name="3" uniqueId="XXVCAKXV" side="Top" angle="90">
				<ComponentRef name="3"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="35.5" y="50.1514"/>
			</CompInstance>
			<CompInstance name="2" uniqueId="TCGLBWMO" side="Top" angle="90">
				<ComponentRef name="2"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="35.5274" y="51.5008"/>
			</CompInstance>
			<CompInstance name="1" uniqueId="BXUDFIXE" side="Top" angle="270">
				<ComponentRef name="1"/>
				<FootprintRef name="PL25_Primary"/>
				<Org x="34.3432" y="52.948"/>
			</CompInstance>
			<CompInstance name="K4" uniqueId="HKOBQZRN" side="Top" fixed="on">
				<ComponentRef name="K4"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="28.5" y="102"/>
			</CompInstance>
			<CompInstance name="K5" uniqueId="NXDPOPVD" side="Top" fixed="on">
				<ComponentRef name="K5"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="73.5" y="102"/>
			</CompInstance>
			<CompInstance name="K6" uniqueId="OZHUPQFA" side="Top" fixed="on">
				<ComponentRef name="K6"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="10.5" y="15.25"/>
			</CompInstance>
			<CompInstance name="K1" uniqueId="NKDAVHBD" side="Top" fixed="on">
				<ComponentRef name="K1"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="90.5" y="15.25"/>
			</CompInstance>
			<CompInstance name="K2" uniqueId="PYWATGJH" side="Top" fixed="on">
				<ComponentRef name="K2"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="14.3" y="101"/>
			</CompInstance>
			<CompInstance name="K3" uniqueId="ZSRIVJSR" side="Top" fixed="on">
				<ComponentRef name="K3"/>
				<FootprintRef name="KREST1_Primary"/>
				<Org x="88" y="101"/>
			</CompInstance>
			<CompInstance name="P69" uniqueId="DJEUFCOS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P69"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="67.68" y="17.84"/>
			</CompInstance>
			<CompInstance name="P68" uniqueId="LWSFZOHY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P68"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="65.14" y="17.84"/>
			</CompInstance>
			<CompInstance name="P60" uniqueId="QQRXCZTA" side="Top" angle="90" fixed="on">
				<ComponentRef name="P60"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="24.5" y="20.48"/>
			</CompInstance>
			<CompInstance name="P65" uniqueId="HYGFSYOX" side="Top" angle="90" fixed="on">
				<ComponentRef name="P65"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="72.76" y="17.84"/>
			</CompInstance>
			<CompInstance name="P64" uniqueId="UZNTLNIF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P64"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="77.84" y="17.84"/>
			</CompInstance>
			<CompInstance name="P67" uniqueId="XCRFDUKL" side="Top" angle="90" fixed="on">
				<ComponentRef name="P67"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="60.06" y="17.84"/>
			</CompInstance>
			<CompInstance name="P66" uniqueId="MNZOEBPP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P66"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="75.3" y="17.84"/>
			</CompInstance>
			<CompInstance name="P59" uniqueId="MGOFWSRR" side="Top" angle="90" fixed="on">
				<ComponentRef name="P59"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="27.04" y="20.48"/>
			</CompInstance>
			<CompInstance name="P52" uniqueId="TJJEMCFM" side="Top" angle="90" fixed="on">
				<ComponentRef name="P52"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="72.76" y="15.3"/>
			</CompInstance>
			<CompInstance name="P50" uniqueId="LLFYBZAN" side="Top" angle="90" fixed="on">
				<ComponentRef name="P50"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="70.22" y="17.84"/>
			</CompInstance>
			<CompInstance name="P51" uniqueId="ERNACDMI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P51"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="62.6" y="17.84"/>
			</CompInstance>
			<CompInstance name="P18" uniqueId="TPGAMBUH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P18"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="44.82" y="23.02"/>
			</CompInstance>
			<CompInstance name="P15" uniqueId="OOCMNTXB" side="Top" angle="90" fixed="on">
				<ComponentRef name="P15"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="90.54" y="20.48"/>
			</CompInstance>
			<CompInstance name="P10" uniqueId="RKRSPSRK" side="Top" angle="90" fixed="on">
				<ComponentRef name="P10"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="37.2" y="20.48"/>
			</CompInstance>
			<CompInstance name="P11" uniqueId="KSBWLEOH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P11"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="42.28" y="23.02"/>
			</CompInstance>
			<CompInstance name="P48" uniqueId="TMLIGBCU" side="Top" angle="90" fixed="on">
				<ComponentRef name="P48"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="29.58" y="20.48"/>
			</CompInstance>
			<CompInstance name="P78" uniqueId="HPQJWGSZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P78"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="34.66" y="23.02"/>
			</CompInstance>
			<CompInstance name="P71" uniqueId="YKCJTOWE" side="Top" angle="90" fixed="on">
				<ComponentRef name="P71"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="77.84" y="15.3"/>
			</CompInstance>
			<CompInstance name="P72" uniqueId="WEQVYBKT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P72"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="80.38" y="15.3"/>
			</CompInstance>
			<CompInstance name="P73" uniqueId="SKBZESOP" side="Top" angle="90" fixed="on">
				<ComponentRef name="P73"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="32.12" y="17.84"/>
			</CompInstance>
			<CompInstance name="P74" uniqueId="UDJBFYTS" side="Top" angle="90" fixed="on">
				<ComponentRef name="P74"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="80.38" y="17.84"/>
			</CompInstance>
			<CompInstance name="P38" uniqueId="SLAIMANC" side="Top" angle="90" fixed="on">
				<ComponentRef name="P38"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="32.12" y="15.3"/>
			</CompInstance>
			<CompInstance name="P33" uniqueId="AXISCKSF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P33"/>
				<FootprintRef name="PLD-10_1_2"/>
				<Org x="37.2" y="15.3"/>
			</CompInstance>
			<CompInstance name="P61" uniqueId="GLTEBPDY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P61"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="19.42" y="20.48"/>
			</CompInstance>
			<CompInstance name="P63" uniqueId="ITZJGAQT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P63"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="14.34" y="20.48"/>
			</CompInstance>
			<CompInstance name="P62" uniqueId="FFJBHJFJ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P62"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="16.88" y="20.48"/>
			</CompInstance>
			<CompInstance name="P58" uniqueId="VGPRUKCC" side="Top" angle="90" fixed="on">
				<ComponentRef name="P58"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="32.12" y="20.48"/>
			</CompInstance>
			<CompInstance name="P16" uniqueId="COODPZCO" side="Top" angle="90" fixed="on">
				<ComponentRef name="P16"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="60.06" y="23.02"/>
			</CompInstance>
			<CompInstance name="P17" uniqueId="GTYUZWTH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P17"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="65.14" y="20.48"/>
			</CompInstance>
			<CompInstance name="P12" uniqueId="EGHWNKWD" side="Top" angle="90" fixed="on">
				<ComponentRef name="P12"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="14.34" y="23.02"/>
			</CompInstance>
			<CompInstance name="P87" uniqueId="IDHECAHR" side="Top" angle="90" fixed="on">
				<ComponentRef name="P87"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="32.12" y="23.02"/>
			</CompInstance>
			<CompInstance name="P86" uniqueId="FZCGJJGZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P86"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="27.04" y="23.02"/>
			</CompInstance>
			<CompInstance name="P80" uniqueId="NEMJESTY" side="Top" angle="90" fixed="on">
				<ComponentRef name="P80"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="16.88" y="23.02"/>
			</CompInstance>
			<CompInstance name="P9" uniqueId="VRADEWYA" side="Top" angle="90" fixed="on">
				<ComponentRef name="P9"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="67.68" y="20.48"/>
			</CompInstance>
			<CompInstance name="P49" uniqueId="XJDUXGHV" side="Top" angle="90" fixed="on">
				<ComponentRef name="P49"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="21.96" y="20.48"/>
			</CompInstance>
			<CompInstance name="P8" uniqueId="OQOUULWI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P8"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="70.22" y="20.48"/>
			</CompInstance>
			<CompInstance name="P7" uniqueId="IKKPBYYI" side="Top" angle="90" fixed="on">
				<ComponentRef name="P7"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="72.76" y="20.48"/>
			</CompInstance>
			<CompInstance name="P6" uniqueId="VWONQQVN" side="Top" angle="90" fixed="on">
				<ComponentRef name="P6"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="75.3" y="20.48"/>
			</CompInstance>
			<CompInstance name="P5" uniqueId="GDMLTWSZ" side="Top" angle="90" fixed="on">
				<ComponentRef name="P5"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="77.84" y="20.48"/>
			</CompInstance>
			<CompInstance name="P4" uniqueId="GABLECCF" side="Top" angle="90" fixed="on">
				<ComponentRef name="P4"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="80.38" y="20.48"/>
			</CompInstance>
			<CompInstance name="P3" uniqueId="UYRYAOYW" side="Top" angle="90" fixed="on">
				<ComponentRef name="P3"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="82.92" y="20.48"/>
			</CompInstance>
			<CompInstance name="P2" uniqueId="XRDEUBEH" side="Top" angle="90" fixed="on">
				<ComponentRef name="P2"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="85.46" y="20.48"/>
			</CompInstance>
			<CompInstance name="P1" uniqueId="YPCKGEHT" side="Top" angle="90" fixed="on">
				<ComponentRef name="P1"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="88" y="20.48"/>
			</CompInstance>
			<CompInstance name="P79" uniqueId="UHBAUEPN" side="Top" angle="90" fixed="on">
				<ComponentRef name="P79"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="82.92" y="23.02"/>
			</CompInstance>
			<CompInstance name="P75" uniqueId="BGMVFEPE" side="Top" angle="90" fixed="on">
				<ComponentRef name="P75"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="88" y="23.02"/>
			</CompInstance>
			<CompInstance name="P76" uniqueId="QKRJNNNO" side="Top" angle="90" fixed="on">
				<ComponentRef name="P76"/>
				<FootprintRef name="PLD-10_2"/>
				<Org x="90.54" y="23.02"/>
			</CompInstance>
			<CompInstance name="P77" uniqueId="JNHUKGMV" side="Top" angle="90" fixed="on">
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
					<LayerRef name="Int 2"/>
				</LayerRule>
				<LayerRule width="0.2">
					<LayerRef name="Int 1"/>
				</LayerRule>
				<LayerRule width="0.2">
					<LayerRef name="Bottom"/>
				</LayerRule>
				<LayerRule width="0.2">
					<LayerRef name="Top"/>
				</LayerRule>
			</Impedance>
			<ImpedanceDiff name="ZDiff_100" Z0="100">
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Int 2"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Int 1"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Bottom"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Top"/>
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
				<NetRef name="56"/>
				<Org x="36.9026" y="44.8107"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="54"/>
				<Org x="36.6957" y="49.3627"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="58"/>
				<Org x="63.3151" y="27.2959"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="58"/>
				<Org x="23.7577" y="44.6404"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="51"/>
				<Org x="33.8584" y="34.642"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="50"/>
				<Org x="32.5424" y="34.642"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="50"/>
				<Org x="27.892" y="43.485"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="48"/>
				<Org x="58.4328" y="43.5959"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="15"/>
				<Org x="42.0654" y="95.8518"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="14"/>
				<Org x="31.5896" y="46.0318"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="11"/>
				<Org x="53.7736" y="44.4219"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="9"/>
				<Org x="45.6237" y="49.407"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="9"/>
				<Org x="71.2456" y="43.77"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="60"/>
				<Org x="29.6622" y="76.6728"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="33"/>
				<Org x="38.4215" y="95.5275"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="59"/>
				<Org x="13.6664" y="70.8149"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="47"/>
				<Org x="42.3274" y="97.1806"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="46"/>
				<Org x="43.4457" y="95.6127"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="45"/>
				<Org x="45.4591" y="95.9981"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="44"/>
				<Org x="48.3796" y="95.6788"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="43"/>
				<Org x="49.6957" y="95.6127"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="42"/>
				<Org x="50.274" y="91.692"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="34"/>
				<Org x="37.2761" y="96.107"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="41"/>
				<Org x="48.958" y="91.692"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="40"/>
				<Org x="34.2959" y="97.3258"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="39"/>
				<Org x="32.9595" y="97.0886"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="38"/>
				<Org x="31.6088" y="97.1685"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="35"/>
				<Org x="36.2286" y="96.7856"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="117"/>
				<Org x="37.8285" y="85.1545"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="36"/>
				<Org x="35.2649" y="95.8326"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="116"/>
				<Org x="32.6764" y="59.7012"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="110"/>
				<Org x="58.0529" y="79.7806"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="94"/>
				<Org x="45.1022" y="84.3431"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="93"/>
				<Org x="46.3897" y="84.1098"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="92"/>
				<Org x="46.5917" y="85.425"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="82"/>
				<Org x="32.3899" y="79.7816"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="81"/>
				<Org x="23.0443" y="52.4531"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="80"/>
				<Org x="23.0818" y="51.1206"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="79"/>
				<Org x="22.1552" y="54.3708"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="76"/>
				<Org x="56.4415" y="76.0709"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="75"/>
				<Org x="52.0999" y="81.6298"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="72"/>
				<Org x="84.9209" y="76.5657"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="71"/>
				<Org x="69.4417" y="69.7055"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="77.0662" y="91.958"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="37"/>
				<Org x="28.3043" y="95.6127"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="57"/>
				<Org x="36.5125" y="85.1545"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="109"/>
				<Org x="68.9918" y="91.5"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="106"/>
				<Org x="33.9924" y="59.7795"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="101"/>
				<Org x="83.9454" y="38.258"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="100"/>
				<Org x="73.8756" y="67.75"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="99"/>
				<Org x="89.6957" y="46.0373"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="98"/>
				<Org x="87.7738" y="45.0912"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="97"/>
				<Org x="80.4918" y="38.8697"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="NET00002"/>
				<Org x="35.3568" y="41.0009"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="NET00001"/>
				<Org x="61.9928" y="41.9309"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="NET00000"/>
				<Org x="73.3118" y="40.2712"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="104"/>
				<Org x="44.0621" y="68.532"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="37.5275" y="88.2461"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="112"/>
				<Org x="66.7296" y="84.4048"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="84.9976" y="64.7488"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="83"/>
				<Org x="48.4237" y="69.9638"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="55"/>
				<Org x="36.648" y="46.0692"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="53"/>
				<Org x="34.0273" y="44.2432"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="103"/>
				<Org x="56.938" y="65.9144"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="50.8311" y="84.9866"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="107"/>
				<Org x="16.5291" y="59.0973"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="95"/>
				<Org x="76.9916" y="38.3648"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="96"/>
				<Org x="78.3292" y="38.455"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="100"/>
				<Org x="89.52" y="49.4"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="102"/>
				<Org x="84.3916" y="40.2326"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="103"/>
				<Org x="51.7564" y="33.8277"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="104"/>
				<Org x="50.7002" y="39.8336"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="66"/>
				<Org x="47.4803" y="59.6387"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="66"/>
				<Org x="72.3394" y="59.642"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="66"/>
				<Org x="18.8572" y="58.5744"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="106"/>
				<Org x="50.8645" y="34.8027"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="67"/>
				<Org x="30.4197" y="38.2683"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="67"/>
				<Org x="27.5479" y="58.5576"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="67"/>
				<Org x="55.7915" y="58.446"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="67"/>
				<Org x="84.8972" y="58.458"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="107"/>
				<Org x="53.1116" y="45.6141"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="68"/>
				<Org x="83.2512" y="59.6775"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="68"/>
				<Org x="27.436" y="59.8864"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="68"/>
				<Org x="54.1544" y="58.8916"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="109"/>
				<Org x="79.2581" y="89.625"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="44.3595" y="66.5127"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="+5B"/>
				<Org x="27.0158" y="45.5195"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="111"/>
				<Org x="64.8655" y="97.2829"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="13"/>
				<Org x="50.7729" y="49.6492"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="13"/>
				<Org x="55.1057" y="42.8815"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="79"/>
				<Org x="80.1585" y="64.2008"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="79"/>
				<Org x="49.9696" y="62.0217"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="79"/>
				<Org x="24.4888" y="64.106"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="80"/>
				<Org x="80.4236" y="61.9631"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="80"/>
				<Org x="50.8378" y="60.5799"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="80"/>
				<Org x="25.0527" y="62.7889"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="81"/>
				<Org x="81.3607" y="61.1519"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="81"/>
				<Org x="26.4616" y="61.6284"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="81"/>
				<Org x="52.4614" y="60.2649"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="82"/>
				<Org x="48.6245" y="68.2724"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="82"/>
				<Org x="80.175" y="65.8324"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="82"/>
				<Org x="20.2629" y="68.0337"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="83"/>
				<Org x="19.824" y="69.3565"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="83"/>
				<Org x="79.1817" y="67.1318"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="84"/>
				<Org x="79.5423" y="68.442"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="84"/>
				<Org x="46.7607" y="70.2756"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="84"/>
				<Org x="18.1864" y="69.8173"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="85"/>
				<Org x="78.8101" y="69.5403"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="85"/>
				<Org x="46.4546" y="71.969"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="85"/>
				<Org x="17.9984" y="71.0762"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="86"/>
				<Org x="77.8916" y="68.7024"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="86"/>
				<Org x="17.1625" y="71.9711"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="86"/>
				<Org x="45.2525" y="71.3249"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="85.426" y="66.0865"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="55.5684" y="68.8532"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="66.9442" y="52.3847"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="87"/>
				<Org x="35.2315" y="73.5826"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="67.1746" y="51.0684"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="34.7712" y="71.7125"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="88"/>
				<Org x="54.5892" y="65.9316"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="52"/>
				<Org x="32.2856" y="43.5307"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="36.0977" y="71.6444"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="53.3016" y="67.2622"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="89"/>
				<Org x="84.0325" y="62.3879"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="83.136" y="63.2792"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="27.3735" y="63.3092"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="90"/>
				<Org x="53.048" y="62.0895"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="113"/>
				<Org x="55.4683" y="95.9482"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="24.2871" y="71.7472"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="50.0884" y="86.1223"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="67.232" y="49.7288"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="91"/>
				<Org x="83.0941" y="71.5244"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="92"/>
				<Org x="51.6097" y="64.2596"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="92"/>
				<Org x="23.0586" y="65.52"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="92"/>
				<Org x="76.0021" y="63.4423"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="93"/>
				<Org x="49.2856" y="63.6734"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="93"/>
				<Org x="22.1633" y="64.5381"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="93"/>
				<Org x="75.159" y="62.5443"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="94"/>
				<Org x="21.3557" y="66.3917"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="94"/>
				<Org x="49.0302" y="65.4934"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="94"/>
				<Org x="74.7696" y="64.5089"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="110"/>
				<Org x="55.08" y="45.6842"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="113"/>
				<Org x="56.127" y="46.3881"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="114"/>
				<Org x="54.9477" y="49.5015"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="114"/>
				<Org x="38.7773" y="87.9372"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="19.8674" y="84.0731"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="22.0053" y="71.9629"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="75.108" y="29.5023"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="81.6197" y="59.8866"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="89.2145" y="78.7978"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="49.4119" y="87.321"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="GND"/>
				<Org x="64.5543" y="49.4127"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="10"/>
				<Org x="67.0371" y="42.283"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="11"/>
				<Org x="36.6616" y="51.1813"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="11"/>
				<Org x="47.5233" y="49.4361"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="12"/>
				<Org x="90.3477" y="91.717"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="95"/>
				<Org x="32.504" y="68.2505"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="7"/>
				<Org x="77.9416" y="27.1377"/>
			</Via>
			<Via>
				<ViastackRef name="CCTVIA_(Default)"/>
				<NetRef name="102"/>
				<Org x="44.699" y="58.4227"/>
			</Via>
		</Vias>
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="86.5" y="29"/>
					<TrackLine>
						<End x="86.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="86.85" y="22.3937"/>
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
				<LayerRef name="Top"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="86.5" y="29"/>
					<TrackLine>
						<End x="86.5" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="85.5814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="84.5446" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="82.611" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="80.6775" y="32.6394"/>
					</TrackLine>
					<TrackLine>
						<End x="79.7088" y="33.0641"/>
					</TrackLine>
					<TrackLine>
						<End x="78.779" y="33.4492"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7751" y="33.45"/>
					</TrackLine>
					<TrackLine>
						<End x="76.193" y="33.9103"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0744" y="33.95"/>
					</TrackLine>
					<TrackLine>
						<End x="65.0744" y="33.95"/>
					</TrackLine>
					<TrackLine>
						<End x="62.9256" y="33.95"/>
					</TrackLine>
					<TrackLine>
						<End x="62.8252" y="33.93"/>
					</TrackLine>
					<TrackLine>
						<End x="61.8043" y="33.5072"/>
					</TrackLine>
					<TrackLine>
						<End x="61.7191" y="33.4503"/>
					</TrackLine>
					<TrackLine>
						<End x="60.9562" y="32.8135"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5865" y="31.4438"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2447" y="30.6185"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2447" y="28.0326"/>
					</TrackLine>
					<TrackLine>
						<End x="58.5996" y="27.3875"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3796" y="27.315"/>
					</TrackLine>
					<TrackLine>
						<End x="56.4072" y="27.315"/>
					</TrackLine>
					<TrackLine>
						<End x="54.0681" y="27.7034"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1434" y="28.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1434" y="29.1388"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1"/>
				<Subwire width="0.2">
					<Start x="53.1434" y="29.1388"/>
					<TrackLine>
						<End x="53.1434" y="29.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2248" y="30.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="51.188" y="31.0827"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2544" y="31.9305"/>
					</TrackLine>
					<TrackLine>
						<End x="47.3209" y="32.7782"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3522" y="33.2029"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4224" y="33.588"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4185" y="33.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.3683" y="33.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.3644" y="33.588"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4346" y="33.2029"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4313" y="33.2007"/>
					</TrackLine>
					<TrackLine>
						<End x="40.9815" y="31.7509"/>
					</TrackLine>
					<TrackLine>
						<End x="40.9793" y="31.7476"/>
					</TrackLine>
					<TrackLine>
						<End x="40.5942" y="30.8178"/>
					</TrackLine>
					<TrackLine>
						<End x="40.5934" y="30.8139"/>
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
						<End x="35.74" y="45.6931"/>
					</TrackLine>
					<TrackLine>
						<End x="36.2719" y="45.1612"/>
					</TrackLine>
					<TrackLine>
						<End x="36.9026" y="44.8107"/>
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
						<End x="36.648" y="46.0692"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="54"/>
				<Subwire width="0.2">
					<Start x="37.25" y="47.7"/>
					<TrackLine>
						<End x="37.25" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6957" y="49.3627"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="23.7577" y="44.6404"/>
					<TrackLine>
						<End x="14.1931" y="54.4956"/>
					</TrackLine>
					<TrackLine>
						<End x="10.85" y="60.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="9.85" y="63.5411"/>
					</TrackLine>
					<TrackLine>
						<End x="9.85" y="64.9589"/>
					</TrackLine>
					<TrackLine>
						<End x="9.85" y="69.9589"/>
					</TrackLine>
					<TrackLine>
						<End x="12.5" y="82.6"/>
					</TrackLine>
					<TrackLine>
						<End x="12.5" y="83.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="62.75" y="29"/>
					<TrackLine>
						<End x="62.75" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="63.3151" y="27.2959"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="53"/>
				<Subwire width="0.2">
					<Start x="34.0273" y="44.2432"/>
					<TrackLine>
						<End x="36.5269" y="43.9037"/>
					</TrackLine>
					<TrackLine>
						<End x="37.2783" y="43.9037"/>
					</TrackLine>
					<TrackLine>
						<End x="37.8096" y="44.435"/>
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
						<End x="74.8596" y="19.2667"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2367" y="19.8896"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2367" y="23.735"/>
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
					<Start x="75.3" y="17.84"/>
					<TrackLine>
						<End x="73.8563" y="19.6853"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8233" y="19.765"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8233" y="23.6104"/>
					</TrackLine>
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
					<Start x="72.76" y="17.84"/>
					<TrackLine>
						<End x="71.6967" y="19.8896"/>
					</TrackLine>
					<TrackLine>
						<End x="71.6967" y="23.735"/>
					</TrackLine>
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
						<End x="71.2833" y="19.8896"/>
					</TrackLine>
					<TrackLine>
						<End x="71.2833" y="20.7704"/>
					</TrackLine>
					<TrackLine>
						<End x="71.2833" y="23.6104"/>
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
						<End x="68.83" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="68.83" y="20.8063"/>
					</TrackLine>
					<TrackLine>
						<End x="68.83" y="23.6463"/>
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
						<End x="63.75" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="63.99" y="23.6463"/>
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
						<End x="66.29" y="19.8537"/>
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
						<End x="64.2231" y="26.9198"/>
					</TrackLine>
					<TrackLine>
						<End x="64.2231" y="27.672"/>
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
					<Start x="32.2856" y="43.5307"/>
					<TrackLine>
						<End x="33.6573" y="43.3499"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3973" y="43.3499"/>
					</TrackLine>
					<TrackLine>
						<End x="37.4535" y="43.4048"/>
					</TrackLine>
					<TrackLine>
						<End x="37.5072" y="43.427"/>
					</TrackLine>
					<TrackLine>
						<End x="38.2863" y="44.2061"/>
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
					<Start x="33.8584" y="34.642"/>
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
					<Start x="16.25" y="83.25"/>
					<TrackLine>
						<End x="16.25" y="82.6"/>
					</TrackLine>
					<TrackLine>
						<End x="10.417" y="70.0211"/>
					</TrackLine>
					<TrackLine>
						<End x="10.35" y="69.8594"/>
					</TrackLine>
					<TrackLine>
						<End x="10.35" y="64.8594"/>
					</TrackLine>
					<TrackLine>
						<End x="10.35" y="63.6406"/>
					</TrackLine>
					<TrackLine>
						<End x="11.35" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="14.617" y="54.7789"/>
					</TrackLine>
					<TrackLine>
						<End x="15.4789" y="53.917"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4101" y="44.134"/>
					</TrackLine>
					<TrackLine>
						<End x="27.892" y="43.485"/>
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
						<End x="32.5424" y="34.642"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="53.1434" y="47.8388"/>
					<TrackLine>
						<End x="53.1434" y="47.1888"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2036" y="45.9902"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2036" y="45.238"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8656" y="44.0458"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3975" y="43.5139"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1497" y="43.5139"/>
					</TrackLine>
					<TrackLine>
						<End x="54.731" y="43.7862"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4804" y="43.7862"/>
					</TrackLine>
					<TrackLine>
						<End x="58.4328" y="43.5959"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="16"/>
				<Subwire width="0.2">
					<Start x="37.2" y="15.3"/>
					<TrackLine>
						<End x="35.1876" y="16.5685"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1839" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="31.5961" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="18.9437" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="18.27" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="18" y="21.0939"/>
					</TrackLine>
					<TrackLine>
						<End x="17.3439" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="11.3361" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="10.68" y="22.4061"/>
					</TrackLine>
					<TrackLine>
						<End x="8.875" y="29.0843"/>
					</TrackLine>
					<TrackLine>
						<End x="8.35" y="63.2427"/>
					</TrackLine>
					<TrackLine>
						<End x="8.35" y="65.2573"/>
					</TrackLine>
					<TrackLine>
						<End x="8.35" y="70.2573"/>
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
						<End x="13.0299" y="85.2"/>
					</TrackLine>
					<TrackLine>
						<End x="13.0446" y="85.1939"/>
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
						<End x="42.0654" y="95.8518"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="14"/>
				<Subwire width="0.2">
					<Start x="31.5896" y="46.0318"/>
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
					<Start x="49.3934" y="47.8388"/>
					<TrackLine>
						<End x="49.3934" y="48.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="50.312" y="49.2888"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7729" y="49.6492"/>
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
					<Start x="50.7729" y="49.6492"/>
					<TrackLine>
						<End x="50.025" y="50.375"/>
					</TrackLine>
					<TrackLine>
						<End x="49.375" y="50.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="55.1057" y="42.8815"/>
					<TrackLine>
						<End x="58.0567" y="42.6879"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8089" y="42.6879"/>
					</TrackLine>
					<TrackLine>
						<End x="61.1038" y="43.7402"/>
					</TrackLine>
					<TrackLine>
						<End x="61.342" y="43.8389"/>
					</TrackLine>
					<TrackLine>
						<End x="62.6436" y="43.8389"/>
					</TrackLine>
					<TrackLine>
						<End x="67.4132" y="43.191"/>
					</TrackLine>
					<TrackLine>
						<End x="70.6943" y="42.362"/>
					</TrackLine>
					<TrackLine>
						<End x="71.7969" y="42.362"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0744" y="42.8"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1748" y="42.82"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1957" y="43.2428"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8314" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="82.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="82.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="12"/>
				<Subwire width="0.2">
					<Start x="90.3477" y="91.717"/>
					<TrackLine>
						<End x="82.1946" y="95.2939"/>
					</TrackLine>
					<TrackLine>
						<End x="82.1799" y="95.3"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5299" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2799" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="72.2201" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="64.9186" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="64" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="64" y="93.75"/>
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
						<End x="75.9588" y="43.6859"/>
					</TrackLine>
					<TrackLine>
						<End x="75.029" y="43.3008"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0251" y="43.3"/>
					</TrackLine>
					<TrackLine>
						<End x="71.6217" y="42.862"/>
					</TrackLine>
					<TrackLine>
						<End x="70.8695" y="42.862"/>
					</TrackLine>
					<TrackLine>
						<End x="67.5884" y="43.691"/>
					</TrackLine>
					<TrackLine>
						<End x="62.7431" y="44.3389"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8089" y="44.5039"/>
					</TrackLine>
					<TrackLine>
						<End x="58.0567" y="44.5039"/>
					</TrackLine>
					<TrackLine>
						<End x="55.63" y="44.2828"/>
					</TrackLine>
					<TrackLine>
						<End x="54.53" y="44.2828"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7736" y="44.4219"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="34.9024" y="51.5008"/>
					<TrackLine>
						<End x="35.5524" y="51.5008"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6616" y="51.1813"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="34.9024" y="51.5008"/>
					<TrackLine>
						<End x="34.2524" y="51.5008"/>
					</TrackLine>
					<TrackLine>
						<End x="30.6686" y="49.15"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="48.1434" y="47.8388"/>
					<TrackLine>
						<End x="48.1434" y="48.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5233" y="49.4361"/>
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
					<Start x="46.875" y="50.375"/>
					<TrackLine>
						<End x="47.5233" y="50.375"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5233" y="49.4361"/>
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
						<End x="51.8934" y="48.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="51.8934" y="47.8388"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="67.0371" y="42.283"/>
					<TrackLine>
						<End x="62.5441" y="43.3389"/>
					</TrackLine>
					<TrackLine>
						<End x="61.4415" y="43.3389"/>
					</TrackLine>
					<TrackLine>
						<End x="61.3871" y="43.3164"/>
					</TrackLine>
					<TrackLine>
						<End x="59.0385" y="42.2104"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9841" y="42.1879"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4818" y="41.9735"/>
					</TrackLine>
					<TrackLine>
						<End x="54.7296" y="41.9735"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1679" y="43.0364"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3881" y="43.8162"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7261" y="45.0084"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2143" y="45.9536"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="51.2143" y="45.9536"/>
					<TrackLine>
						<End x="51.8934" y="47.1888"/>
					</TrackLine>
					<TrackLine>
						<End x="51.8934" y="47.8388"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="34.875" y="50.1514"/>
					<TrackLine>
						<End x="35.525" y="50.1514"/>
					</TrackLine>
					<TrackLine>
						<End x="36.3196" y="50.2707"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0718" y="50.2707"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0814" y="49.15"/>
					</TrackLine>
					<TrackLine>
						<End x="44.062" y="46.3888"/>
					</TrackLine>
					<TrackLine>
						<End x="45.0988" y="45.8949"/>
					</TrackLine>
					<TrackLine>
						<End x="45.1135" y="45.8888"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8635" y="45.8888"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9233" y="45.8888"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2143" y="45.9536"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="34.875" y="50.1514"/>
					<TrackLine>
						<End x="34.225" y="50.1514"/>
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
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="85.25" y="47.7"/>
					<TrackLine>
						<End x="85.25" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3314" y="46.25"/>
					</TrackLine>
					<TrackLine>
						<End x="76.4325" y="42.7997"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3207" y="42.3392"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1236" y="42.3"/>
					</TrackLine>
					<TrackLine>
						<End x="71.8964" y="41.862"/>
					</TrackLine>
					<TrackLine>
						<End x="70.5948" y="41.862"/>
					</TrackLine>
					<TrackLine>
						<End x="67.0371" y="42.283"/>
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
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="79" y="47.7"/>
					<TrackLine>
						<End x="79" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6775" y="44.1106"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9277" y="43.8"/>
					</TrackLine>
					<TrackLine>
						<End x="71.2456" y="43.77"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="45.6237" y="49.407"/>
					<TrackLine>
						<End x="45.6434" y="48.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6434" y="47.8388"/>
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
						<End x="35.6182" y="52.948"/>
					</TrackLine>
					<TrackLine>
						<End x="34.9682" y="52.948"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="34.9682" y="52.948"/>
					<TrackLine>
						<End x="34.3182" y="52.948"/>
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
					<Start x="45.6237" y="49.407"/>
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
					<Start x="44.3934" y="29.1388"/>
					<TrackLine>
						<End x="44.3934" y="28.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6452" y="27.2747"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="58.6367" y="23.7143"/>
					<TrackLine>
						<End x="60.173" y="24.9947"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6375" y="26.4592"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6513" y="26.4798"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0445" y="27.4289"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0493" y="27.4532"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0493" y="29.9402"/>
					</TrackLine>
					<TrackLine>
						<End x="62.4598" y="30.3507"/>
					</TrackLine>
					<TrackLine>
						<End x="63.6686" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="64.3314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4841" y="30.4103"/>
					</TrackLine>
					<TrackLine>
						<End x="77.75" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="77.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="26" y="29"/>
					<TrackLine>
						<End x="26" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="27.9554" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="29.889" y="26.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="31.8225" y="25.3606"/>
					</TrackLine>
					<TrackLine>
						<End x="32.7912" y="24.9359"/>
					</TrackLine>
					<TrackLine>
						<End x="33.721" y="24.5508"/>
					</TrackLine>
					<TrackLine>
						<End x="34.8952" y="24.3008"/>
					</TrackLine>
					<TrackLine>
						<End x="34.9493" y="24.29"/>
					</TrackLine>
					<TrackLine>
						<End x="38.6993" y="24.29"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8007" y="24.29"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8548" y="24.3008"/>
					</TrackLine>
					<TrackLine>
						<End x="41.832" y="24.7055"/>
					</TrackLine>
					<TrackLine>
						<End x="41.8779" y="24.7362"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6452" y="27.2747"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="8"/>
				<Subwire width="0.2">
					<Start x="58.6367" y="23.7143"/>
					<TrackLine>
						<End x="58.67" y="23.3463"/>
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
						<End x="67.1561" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2039" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="68.2076" y="16.5715"/>
					</TrackLine>
					<TrackLine>
						<End x="68.9485" y="17.3124"/>
					</TrackLine>
					<TrackLine>
						<End x="68.95" y="17.3161"/>
					</TrackLine>
					<TrackLine>
						<End x="68.95" y="18.3639"/>
					</TrackLine>
					<TrackLine>
						<End x="68.9515" y="18.3676"/>
					</TrackLine>
					<TrackLine>
						<End x="70.22" y="20.33"/>
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
					<Start x="44.6452" y="27.2747"/>
					<TrackLine>
						<End x="52.1144" y="24.6896"/>
					</TrackLine>
					<TrackLine>
						<End x="53.2526" y="24.3209"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3305" y="24.3054"/>
					</TrackLine>
					<TrackLine>
						<End x="55.8257" y="24.2569"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9702" y="24.2569"/>
					</TrackLine>
					<TrackLine>
						<End x="58.6367" y="23.7143"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="79" y="29"/>
					<TrackLine>
						<End x="79" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6593" y="30.9103"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5299" y="30.95"/>
					</TrackLine>
					<TrackLine>
						<End x="64.5299" y="30.95"/>
					</TrackLine>
					<TrackLine>
						<End x="63.4701" y="30.95"/>
					</TrackLine>
					<TrackLine>
						<End x="62.2938" y="30.7513"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6487" y="30.1062"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6487" y="27.5203"/>
					</TrackLine>
					<TrackLine>
						<End x="61.3069" y="26.695"/>
					</TrackLine>
					<TrackLine>
						<End x="59.9372" y="25.3253"/>
					</TrackLine>
					<TrackLine>
						<End x="59.1119" y="24.9835"/>
					</TrackLine>
					<TrackLine>
						<End x="57.918" y="24.6938"/>
					</TrackLine>
					<TrackLine>
						<End x="55.8688" y="24.6938"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3865" y="24.7908"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2157" y="25.1888"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4659" y="25.4994"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5324" y="26.3471"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5988" y="27.1949"/>
					</TrackLine>
					<TrackLine>
						<End x="46.562" y="27.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6434" y="28.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6434" y="29.1388"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="45.6434" y="29.1388"/>
					<TrackLine>
						<End x="45.6434" y="29.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7248" y="30.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="44.062" y="30.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5934" y="30.1202"/>
					</TrackLine>
					<TrackLine>
						<End x="43.55" y="28.6249"/>
					</TrackLine>
					<TrackLine>
						<End x="43.34" y="27.3646"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9853" y="26.5083"/>
					</TrackLine>
					<TrackLine>
						<End x="41.5917" y="25.1147"/>
					</TrackLine>
					<TrackLine>
						<End x="40.7354" y="24.76"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7646" y="24.76"/>
					</TrackLine>
					<TrackLine>
						<End x="35.0146" y="24.76"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8223" y="25.05"/>
					</TrackLine>
					<TrackLine>
						<End x="33.0725" y="25.3606"/>
					</TrackLine>
					<TrackLine>
						<End x="31.139" y="26.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2054" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1686" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="27.25" y="29"/>
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
						<End x="77.9416" y="27.1377"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="80.25" y="29"/>
					<TrackLine>
						<End x="80.25" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="79.3314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2946" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2799" y="30.95"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7588" y="31.4103"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6293" y="31.45"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6293" y="31.45"/>
					</TrackLine>
					<TrackLine>
						<End x="63.3707" y="31.45"/>
					</TrackLine>
					<TrackLine>
						<End x="62.18" y="31.152"/>
					</TrackLine>
					<TrackLine>
						<End x="62.091" y="31.1152"/>
					</TrackLine>
					<TrackLine>
						<End x="61.2848" y="30.309"/>
					</TrackLine>
					<TrackLine>
						<End x="61.248" y="30.22"/>
					</TrackLine>
					<TrackLine>
						<End x="61.248" y="27.6"/>
					</TrackLine>
					<TrackLine>
						<End x="60.9672" y="26.922"/>
					</TrackLine>
					<TrackLine>
						<End x="59.7102" y="25.665"/>
					</TrackLine>
					<TrackLine>
						<End x="59.0322" y="25.3842"/>
					</TrackLine>
					<TrackLine>
						<End x="57.8327" y="25.1306"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9541" y="25.1306"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4831" y="25.2763"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3152" y="25.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7492" y="25.9233"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7824" y="26.3471"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8488" y="27.1949"/>
					</TrackLine>
					<TrackLine>
						<End x="47.812" y="27.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8934" y="28.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8934" y="29.1388"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="6"/>
				<Subwire width="0.2">
					<Start x="46.8934" y="29.1388"/>
					<TrackLine>
						<End x="46.8934" y="29.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9748" y="30.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="44.938" y="31.0827"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9233" y="31.0888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.8635" y="31.0888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.8488" y="31.0827"/>
					</TrackLine>
					<TrackLine>
						<End x="43.0995" y="30.3334"/>
					</TrackLine>
					<TrackLine>
						<End x="43.0934" y="30.3187"/>
					</TrackLine>
					<TrackLine>
						<End x="43.05" y="28.7223"/>
					</TrackLine>
					<TrackLine>
						<End x="42.87" y="27.4581"/>
					</TrackLine>
					<TrackLine>
						<End x="42.5868" y="26.7745"/>
					</TrackLine>
					<TrackLine>
						<End x="41.3255" y="25.5132"/>
					</TrackLine>
					<TrackLine>
						<End x="40.6419" y="25.23"/>
					</TrackLine>
					<TrackLine>
						<End x="38.8581" y="25.23"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1081" y="25.23"/>
					</TrackLine>
					<TrackLine>
						<End x="33.9218" y="25.55"/>
					</TrackLine>
					<TrackLine>
						<End x="33.3558" y="25.7845"/>
					</TrackLine>
					<TrackLine>
						<End x="32.389" y="26.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4554" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="29.4186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="28.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="28.5" y="29"/>
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
					<Start x="48.1434" y="29.1388"/>
					<TrackLine>
						<End x="48.1434" y="29.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="47.2248" y="30.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="46.188" y="31.0827"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2212" y="31.5066"/>
					</TrackLine>
					<TrackLine>
						<End x="45.0227" y="31.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.7641" y="31.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5656" y="31.5066"/>
					</TrackLine>
					<TrackLine>
						<End x="42.6756" y="30.6166"/>
					</TrackLine>
					<TrackLine>
						<End x="42.5934" y="30.4181"/>
					</TrackLine>
					<TrackLine>
						<End x="42.55" y="28.8218"/>
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
					<Start x="48.1434" y="29.1388"/>
					<TrackLine>
						<End x="48.1434" y="28.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="49.062" y="27.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0988" y="27.1949"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0324" y="26.3471"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4146" y="26.1888"/>
					</TrackLine>
					<TrackLine>
						<End x="53.5797" y="25.7617"/>
					</TrackLine>
					<TrackLine>
						<End x="56.041" y="25.5675"/>
					</TrackLine>
					<TrackLine>
						<End x="57.7458" y="25.5675"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9525" y="25.7848"/>
					</TrackLine>
					<TrackLine>
						<End x="59.4833" y="26.0046"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6276" y="27.1489"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8474" y="27.6797"/>
					</TrackLine>
					<TrackLine>
						<End x="60.8474" y="30.2997"/>
					</TrackLine>
					<TrackLine>
						<End x="60.9452" y="30.5359"/>
					</TrackLine>
					<TrackLine>
						<End x="61.8641" y="31.4548"/>
					</TrackLine>
					<TrackLine>
						<End x="62.1003" y="31.5526"/>
					</TrackLine>
					<TrackLine>
						<End x="63.2712" y="31.95"/>
					</TrackLine>
					<TrackLine>
						<End x="64.7288" y="31.95"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7288" y="31.95"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8583" y="31.9103"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3793" y="31.45"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5778" y="31.3678"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5446" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="81.5" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="81.5" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="2"/>
				<Subwire width="0.2">
					<Start x="51.8934" y="29.1388"/>
					<TrackLine>
						<End x="51.8934" y="29.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9748" y="30.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="49.938" y="31.0827"/>
					</TrackLine>
					<TrackLine>
						<End x="48.0044" y="31.9305"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0709" y="32.7782"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3211" y="33.0888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.4657" y="33.0888"/>
					</TrackLine>
					<TrackLine>
						<End x="42.7159" y="32.7782"/>
					</TrackLine>
					<TrackLine>
						<End x="41.404" y="31.4663"/>
					</TrackLine>
					<TrackLine>
						<End x="41.0934" y="30.7165"/>
					</TrackLine>
					<TrackLine>
						<End x="41.05" y="29.1201"/>
					</TrackLine>
					<TrackLine>
						<End x="40.99" y="27.8364"/>
					</TrackLine>
					<TrackLine>
						<End x="40.2636" y="27.11"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2364" y="27.11"/>
					</TrackLine>
					<TrackLine>
						<End x="35.4864" y="27.11"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="33.5" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="33.5" y="29"/>
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
						<End x="76.1438" y="33.4103"/>
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
						<End x="62.0379" y="33.0619"/>
					</TrackLine>
					<TrackLine>
						<End x="61.1832" y="32.4738"/>
					</TrackLine>
					<TrackLine>
						<End x="59.9262" y="31.2168"/>
					</TrackLine>
					<TrackLine>
						<End x="59.6454" y="30.5388"/>
					</TrackLine>
					<TrackLine>
						<End x="59.6454" y="27.9188"/>
					</TrackLine>
					<TrackLine>
						<End x="59.6086" y="27.8298"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8024" y="27.0236"/>
					</TrackLine>
					<TrackLine>
						<End x="58.7134" y="26.9868"/>
					</TrackLine>
					<TrackLine>
						<End x="57.485" y="26.8782"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3018" y="26.8782"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8693" y="27.218"/>
					</TrackLine>
					<TrackLine>
						<End x="53.8654" y="27.2196"/>
					</TrackLine>
					<TrackLine>
						<End x="52.812" y="27.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="51.8934" y="28.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="51.8934" y="29.1388"/>
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
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="50.6434" y="29.1388"/>
					<TrackLine>
						<End x="50.6434" y="29.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7248" y="30.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="48.688" y="31.0827"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7544" y="31.9305"/>
					</TrackLine>
					<TrackLine>
						<End x="45.7876" y="32.3543"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2216" y="32.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5652" y="32.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9992" y="32.3543"/>
					</TrackLine>
					<TrackLine>
						<End x="41.8279" y="31.183"/>
					</TrackLine>
					<TrackLine>
						<End x="41.5934" y="30.617"/>
					</TrackLine>
					<TrackLine>
						<End x="41.55" y="29.0207"/>
					</TrackLine>
					<TrackLine>
						<End x="41.46" y="27.7386"/>
					</TrackLine>
					<TrackLine>
						<End x="41.3915" y="27.5732"/>
					</TrackLine>
					<TrackLine>
						<End x="40.5268" y="26.7085"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3614" y="26.64"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1386" y="26.64"/>
					</TrackLine>
					<TrackLine>
						<End x="35.3886" y="26.64"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2201" y="27.05"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2054" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="33.1686" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="32.25" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="32.25" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3"/>
				<Subwire width="0.2">
					<Start x="84" y="29"/>
					<TrackLine>
						<End x="84" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0446" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="80.111" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1442" y="32.2155"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5782" y="32.45"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0572" y="32.9103"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9277" y="32.95"/>
					</TrackLine>
					<TrackLine>
						<End x="64.9277" y="32.95"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0723" y="32.95"/>
					</TrackLine>
					<TrackLine>
						<End x="62.3225" y="32.6394"/>
					</TrackLine>
					<TrackLine>
						<End x="61.4101" y="32.1342"/>
					</TrackLine>
					<TrackLine>
						<End x="60.2658" y="30.9899"/>
					</TrackLine>
					<TrackLine>
						<End x="60.046" y="30.4591"/>
					</TrackLine>
					<TrackLine>
						<End x="60.046" y="27.8391"/>
					</TrackLine>
					<TrackLine>
						<End x="59.9482" y="27.6029"/>
					</TrackLine>
					<TrackLine>
						<End x="59.0293" y="26.684"/>
					</TrackLine>
					<TrackLine>
						<End x="58.7931" y="26.5862"/>
					</TrackLine>
					<TrackLine>
						<End x="57.572" y="26.4413"/>
					</TrackLine>
					<TrackLine>
						<End x="56.2148" y="26.4413"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7728" y="26.7325"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6135" y="27.1888"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5988" y="27.1949"/>
					</TrackLine>
					<TrackLine>
						<End x="51.562" y="27.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6434" y="28.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6434" y="29.1388"/>
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
				<NetRef name="4"/>
				<Subwire width="0.2">
					<Start x="49.3934" y="29.1388"/>
					<TrackLine>
						<End x="49.3934" y="29.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4748" y="30.5888"/>
					</TrackLine>
					<TrackLine>
						<End x="47.438" y="31.0827"/>
					</TrackLine>
					<TrackLine>
						<End x="45.5044" y="31.9305"/>
					</TrackLine>
					<TrackLine>
						<End x="45.1222" y="32.0888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.6646" y="32.0888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.2824" y="31.9305"/>
					</TrackLine>
					<TrackLine>
						<End x="42.2517" y="30.8998"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0934" y="30.5176"/>
					</TrackLine>
					<TrackLine>
						<End x="42.05" y="28.9212"/>
					</TrackLine>
					<TrackLine>
						<End x="41.93" y="27.6451"/>
					</TrackLine>
					<TrackLine>
						<End x="41.7899" y="27.307"/>
					</TrackLine>
					<TrackLine>
						<End x="40.793" y="26.3101"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4549" y="26.17"/>
					</TrackLine>
					<TrackLine>
						<End x="39.0451" y="26.17"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2951" y="26.17"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1207" y="26.55"/>
					</TrackLine>
					<TrackLine>
						<End x="33.9222" y="26.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="32.9554" y="27.0561"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9186" y="27.55"/>
					</TrackLine>
					<TrackLine>
						<End x="31" y="28.35"/>
					</TrackLine>
					<TrackLine>
						<End x="31" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="4"/>
				<Subwire width="0.2">
					<Start x="82.75" y="29"/>
					<TrackLine>
						<End x="82.75" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8314" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7946" y="30.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="78.861" y="31.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4788" y="31.95"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9577" y="32.4103"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8282" y="32.45"/>
					</TrackLine>
					<TrackLine>
						<End x="64.8282" y="32.45"/>
					</TrackLine>
					<TrackLine>
						<End x="63.1718" y="32.45"/>
					</TrackLine>
					<TrackLine>
						<End x="62.6058" y="32.2155"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6371" y="31.7945"/>
					</TrackLine>
					<TrackLine>
						<End x="60.6055" y="30.7629"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4467" y="30.3794"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4467" y="27.7594"/>
					</TrackLine>
					<TrackLine>
						<End x="60.2879" y="27.3759"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2563" y="26.3443"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8728" y="26.1855"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6589" y="26.0044"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1279" y="26.0044"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6762" y="26.2471"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5141" y="26.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3156" y="26.771"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3488" y="27.1949"/>
					</TrackLine>
					<TrackLine>
						<End x="50.312" y="27.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3934" y="28.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3934" y="29.1388"/>
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
					<Start x="81" y="86.5"/>
					<TrackLine>
						<End x="80.35" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9843" y="87.35"/>
					</TrackLine>
					<TrackLine>
						<End x="72.8914" y="87.85"/>
					</TrackLine>
					<TrackLine>
						<End x="72.85" y="87.85"/>
					</TrackLine>
					<TrackLine>
						<End x="72.75" y="87.85"/>
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
					<Start x="64" y="47.75"/>
					<TrackLine>
						<End x="64" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="64.5543" y="49.4127"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="74" y="29"/>
					<TrackLine>
						<End x="74" y="29.5023"/>
					</TrackLine>
					<TrackLine>
						<End x="75.108" y="29.5023"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="39.5309" y="34.5584"/>
					<TrackLine>
						<End x="39.75" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="39.75" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="10.25" y="31"/>
					<TrackLine>
						<End x="11.125" y="29.35"/>
					</TrackLine>
					<TrackLine>
						<End x="11.125" y="29.25"/>
					</TrackLine>
					<TrackLine>
						<End x="11.125" y="29.2086"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8" y="23.17"/>
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
					<Start x="18.75" y="83.25"/>
					<TrackLine>
						<End x="18.75" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="19.8674" y="84.0731"/>
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
					<Start x="39.5309" y="34.5584"/>
					<TrackLine>
						<End x="41.3398" y="35.7758"/>
					</TrackLine>
					<TrackLine>
						<End x="42.0026" y="35.7758"/>
					</TrackLine>
					<TrackLine>
						<End x="43.3026" y="35.7758"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2406" y="35.7107"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3621" y="35.2132"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1434" y="29.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1434" y="29.1388"/>
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
						<End x="82.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="75.2399"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="73.3399"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="72.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="86.334" y="65.7104"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9056" y="64.3727"/>
					</TrackLine>
					<TrackLine>
						<End x="84.9405" y="62.0118"/>
					</TrackLine>
					<TrackLine>
						<End x="84.4086" y="61.4799"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6197" y="59.8866"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="22.25" y="74"/>
					<TrackLine>
						<End x="22.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="22.0053" y="71.9629"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="13.6517" y="40.2499"/>
					<TrackLine>
						<End x="30.7958" y="39.1763"/>
					</TrackLine>
					<TrackLine>
						<End x="39.5309" y="34.5584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="13.6517" y="40.2499"/>
					<TrackLine>
						<End x="11.25" y="45.1"/>
					</TrackLine>
					<TrackLine>
						<End x="11.25" y="45.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="10.25" y="31"/>
					<TrackLine>
						<End x="10.45" y="32.65"/>
					</TrackLine>
					<TrackLine>
						<End x="10.45" y="32.75"/>
					</TrackLine>
					<TrackLine>
						<End x="10.45" y="35.5314"/>
					</TrackLine>
					<TrackLine>
						<End x="13.6517" y="40.2499"/>
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
						<End x="89.2145" y="78.7978"/>
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
					<Start x="51.25" y="74"/>
					<TrackLine>
						<End x="51.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4231" y="84.4353"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1804" y="85.7462"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1804" y="86.4984"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4119" y="87.321"/>
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
						<End x="34.9186" y="92.1"/>
					</TrackLine>
					<TrackLine>
						<End x="37.2211" y="91.605"/>
					</TrackLine>
					<TrackLine>
						<End x="39.4733" y="91.605"/>
					</TrackLine>
					<TrackLine>
						<End x="39.522" y="91.5848"/>
					</TrackLine>
					<TrackLine>
						<End x="40.2973" y="90.8095"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3175" y="90.7608"/>
					</TrackLine>
					<TrackLine>
						<End x="40.6853" y="88.588"/>
					</TrackLine>
					<TrackLine>
						<End x="40.6853" y="87.2864"/>
					</TrackLine>
					<TrackLine>
						<End x="40.325" y="85.3127"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3037" y="85.2613"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6378" y="84.2655"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7175" y="83.3452"/>
					</TrackLine>
					<TrackLine>
						<End x="32.766" y="78.8736"/>
					</TrackLine>
					<TrackLine>
						<End x="29.6622" y="76.6728"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="33"/>
				<Subwire width="0.2">
					<Start x="39" y="93.75"/>
					<TrackLine>
						<End x="39" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4215" y="95.5275"/>
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
						<End x="32.4186" y="92.1"/>
					</TrackLine>
					<TrackLine>
						<End x="34.7201" y="91.6"/>
					</TrackLine>
					<TrackLine>
						<End x="37.1222" y="91.1075"/>
					</TrackLine>
					<TrackLine>
						<End x="39.2957" y="91.1075"/>
					</TrackLine>
					<TrackLine>
						<End x="39.82" y="90.5832"/>
					</TrackLine>
					<TrackLine>
						<End x="40.1853" y="88.4885"/>
					</TrackLine>
					<TrackLine>
						<End x="40.1853" y="87.3859"/>
					</TrackLine>
					<TrackLine>
						<End x="39.825" y="85.4897"/>
					</TrackLine>
					<TrackLine>
						<End x="39.214" y="84.5488"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4342" y="83.769"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3798" y="83.7465"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7529" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="15.05" y="75.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="13.6664" y="70.8149"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="47"/>
				<Subwire width="0.2">
					<Start x="45.25" y="93.75"/>
					<TrackLine>
						<End x="45.25" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="44.5511" y="95.622"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3537" y="95.9888"/>
					</TrackLine>
					<TrackLine>
						<End x="43.8218" y="96.5207"/>
					</TrackLine>
					<TrackLine>
						<End x="42.3274" y="97.1806"/>
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
						<End x="43.4457" y="95.6127"/>
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
						<End x="45.4591" y="95.9981"/>
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
						<End x="48.3796" y="95.6788"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="43"/>
				<Subwire width="0.2">
					<Start x="50.25" y="93.75"/>
					<TrackLine>
						<End x="50.25" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="49.6957" y="95.6127"/>
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
						<End x="50.274" y="91.692"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="34"/>
				<Subwire width="0.2">
					<Start x="40.25" y="93.75"/>
					<TrackLine>
						<End x="40.25" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="39.3295" y="95.9036"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7976" y="96.4355"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0454" y="96.4355"/>
					</TrackLine>
					<TrackLine>
						<End x="37.2761" y="96.107"/>
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
						<End x="48.958" y="91.692"/>
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
						<End x="34.8888" y="94.9246"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3569" y="95.4565"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2959" y="97.3258"/>
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
						<End x="32.9595" y="97.0886"/>
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
						<End x="31.6088" y="97.1685"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="35"/>
				<Subwire width="0.2">
					<Start x="41.5" y="93.75"/>
					<TrackLine>
						<End x="41.5" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="39.0272" y="96.913"/>
					</TrackLine>
					<TrackLine>
						<End x="38.9728" y="96.9355"/>
					</TrackLine>
					<TrackLine>
						<End x="37.6522" y="97.015"/>
					</TrackLine>
					<TrackLine>
						<End x="36.9" y="97.015"/>
					</TrackLine>
					<TrackLine>
						<End x="36.2286" y="96.7856"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="117"/>
				<Subwire width="0.2">
					<Start x="37.8285" y="85.1545"/>
					<TrackLine>
						<End x="37.8285" y="85.8625"/>
					</TrackLine>
					<TrackLine>
						<End x="37.8285" y="85.9625"/>
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
					<Start x="18.75" y="94.45"/>
					<TrackLine>
						<End x="18.75" y="93.8"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2022" y="88.0375"/>
					</TrackLine>
					<TrackLine>
						<End x="36.4862" y="87.5267"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0269" y="87.0375"/>
					</TrackLine>
					<TrackLine>
						<End x="37.075" y="87.0375"/>
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
				<NetRef name="36"/>
				<Subwire width="0.2">
					<Start x="37.75" y="93.75"/>
					<TrackLine>
						<End x="37.75" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="36.9194" y="95.2458"/>
					</TrackLine>
					<TrackLine>
						<End x="36.812" y="95.3532"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2649" y="95.8326"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="116"/>
				<Subwire width="0.2">
					<Start x="32.6764" y="59.7012"/>
					<TrackLine>
						<End x="43.7167" y="84.9488"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4965" y="85.7286"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6501" y="90.784"/>
					</TrackLine>
					<TrackLine>
						<End x="51.182" y="91.3159"/>
					</TrackLine>
					<TrackLine>
						<End x="52.75" y="92.9"/>
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
						<End x="33.27" y="21.1063"/>
					</TrackLine>
					<TrackLine>
						<End x="33.51" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1837" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1839" y="19.11"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1876" y="19.1085"/>
					</TrackLine>
					<TrackLine>
						<End x="35.9285" y="18.3676"/>
					</TrackLine>
					<TrackLine>
						<End x="35.93" y="18.3639"/>
					</TrackLine>
					<TrackLine>
						<End x="35.93" y="17.3161"/>
					</TrackLine>
					<TrackLine>
						<End x="35.9315" y="17.3124"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6724" y="16.5715"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6761" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="37.7239" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="37.7276" y="16.5685"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4685" y="15.8276"/>
					</TrackLine>
					<TrackLine>
						<End x="38.47" y="15.8239"/>
					</TrackLine>
					<TrackLine>
						<End x="38.47" y="14.7761"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4685" y="14.7724"/>
					</TrackLine>
					<TrackLine>
						<End x="37.7276" y="14.0315"/>
					</TrackLine>
					<TrackLine>
						<End x="37.7239" y="14.03"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1899" y="14"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1301" y="14"/>
					</TrackLine>
					<TrackLine>
						<End x="31.5901" y="14"/>
					</TrackLine>
					<TrackLine>
						<End x="11.3237" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="10.65" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="8.375" y="28.8772"/>
					</TrackLine>
					<TrackLine>
						<End x="7.85" y="63.1855"/>
					</TrackLine>
					<TrackLine>
						<End x="7.85" y="65.3145"/>
					</TrackLine>
					<TrackLine>
						<End x="7.85" y="70.3145"/>
					</TrackLine>
					<TrackLine>
						<End x="10.45" y="95.4314"/>
					</TrackLine>
					<TrackLine>
						<End x="10.9186" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="11.9554" y="96.3939"/>
					</TrackLine>
					<TrackLine>
						<End x="11.9701" y="96.4"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2327" y="98.0765"/>
					</TrackLine>
					<TrackLine>
						<End x="33.9198" y="98.2338"/>
					</TrackLine>
					<TrackLine>
						<End x="34.672" y="98.2338"/>
					</TrackLine>
					<TrackLine>
						<End x="42.7035" y="98.0886"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0718" y="96.5207"/>
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
					<Start x="17.5" y="94.45"/>
					<TrackLine>
						<End x="17.5" y="95.1"/>
					</TrackLine>
					<TrackLine>
						<End x="18.4186" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="19.0814" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="27.2054" y="91.6061"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4093" y="88.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="36.6671" y="87.9633"/>
					</TrackLine>
					<TrackLine>
						<End x="37.1927" y="87.4378"/>
					</TrackLine>
					<TrackLine>
						<End x="37.8623" y="87.4378"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7773" y="87.9372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="54.9477" y="49.5015"/>
					<TrackLine>
						<End x="54.3934" y="48.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3934" y="47.8388"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="55.6434" y="47.8388"/>
					<TrackLine>
						<End x="55.6434" y="47.1888"/>
					</TrackLine>
					<TrackLine>
						<End x="56.127" y="46.3881"/>
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
						<End x="66.7296" y="84.4048"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="55.08" y="45.6842"/>
					<TrackLine>
						<End x="55.7509" y="45.4801"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5031" y="45.4801"/>
					</TrackLine>
					<TrackLine>
						<End x="57.035" y="46.012"/>
					</TrackLine>
					<TrackLine>
						<End x="57.035" y="46.7642"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8934" y="47.1888"/>
					</TrackLine>
					<TrackLine>
						<End x="56.8934" y="47.8388"/>
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
						<End x="64.8655" y="97.2829"/>
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
						<End x="72.55" y="54.7417"/>
					</TrackLine>
					<TrackLine>
						<End x="72.55" y="56.3583"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6042" y="58.2476"/>
					</TrackLine>
					<TrackLine>
						<End x="72.8152" y="58.7569"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4998" y="60.5344"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5519" y="60.6601"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5519" y="61.8399"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4998" y="61.9656"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3507" y="62.2095"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3507" y="62.8791"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6165" y="63.6472"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6165" y="63.9892"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7696" y="64.5089"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="21.3557" y="66.3917"/>
					<TrackLine>
						<End x="21.1709" y="68.4098"/>
					</TrackLine>
					<TrackLine>
						<End x="20.732" y="69.7326"/>
					</TrackLine>
					<TrackLine>
						<End x="19.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="19.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="49.0302" y="65.4934"/>
					<TrackLine>
						<End x="49.5325" y="67.8963"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5325" y="68.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3317" y="70.3399"/>
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
					<Start x="48.25" y="74"/>
					<TrackLine>
						<End x="48.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="45.1022" y="84.3431"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="74.7696" y="64.5089"/>
					<TrackLine>
						<End x="75.4836" y="67.1589"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4836" y="69.4527"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6584" y="69.8746"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1694" y="70.9848"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3656" y="72.181"/>
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
				<LayerRef name="Top"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="49.2856" y="63.6734"/>
					<TrackLine>
						<End x="49.9382" y="65.1173"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0325" y="67.7211"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0325" y="68.8237"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8317" y="70.5151"/>
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
						<End x="46.3897" y="84.1098"/>
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
						<End x="20.5973" y="71.4116"/>
					</TrackLine>
					<TrackLine>
						<End x="20.6198" y="71.3572"/>
					</TrackLine>
					<TrackLine>
						<End x="21.2095" y="69.9622"/>
					</TrackLine>
					<TrackLine>
						<End x="21.232" y="69.9078"/>
					</TrackLine>
					<TrackLine>
						<End x="21.6709" y="68.585"/>
					</TrackLine>
					<TrackLine>
						<End x="22.2637" y="66.7678"/>
					</TrackLine>
					<TrackLine>
						<End x="22.2637" y="66.0156"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1506" y="65.8961"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1506" y="65.1439"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1633" y="64.5381"/>
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
						<End x="78.5399" y="72.35"/>
					</TrackLine>
					<TrackLine>
						<End x="77.6467" y="71.7604"/>
					</TrackLine>
					<TrackLine>
						<End x="76.59" y="70.7037"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9975" y="69.648"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8836" y="69.3731"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8836" y="67.0793"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6349" y="65.2972"/>
					</TrackLine>
					<TrackLine>
						<End x="75.5825" y="64.1722"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1892" y="63.779"/>
					</TrackLine>
					<TrackLine>
						<End x="75.159" y="62.5443"/>
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
						<End x="73.6686" y="46.3"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3314" y="46.3"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8" y="46.7686"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8" y="47.4314"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8" y="48.7314"/>
					</TrackLine>
					<TrackLine>
						<End x="73.05" y="54.8411"/>
					</TrackLine>
					<TrackLine>
						<End x="73.05" y="56.2589"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0933" y="58.1503"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2298" y="58.4798"/>
					</TrackLine>
					<TrackLine>
						<End x="74.9702" y="60.2202"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1067" y="60.5497"/>
					</TrackLine>
					<TrackLine>
						<End x="75.15" y="61.5411"/>
					</TrackLine>
					<TrackLine>
						<End x="75.159" y="62.5443"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="51.6097" y="64.2596"/>
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
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="21.25" y="74"/>
					<TrackLine>
						<End x="21.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="21.0973" y="72.339"/>
					</TrackLine>
					<TrackLine>
						<End x="21.0973" y="71.5868"/>
					</TrackLine>
					<TrackLine>
						<End x="21.732" y="70.0073"/>
					</TrackLine>
					<TrackLine>
						<End x="22.7637" y="66.943"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0586" y="65.52"/>
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
						<End x="72.4186" y="46.3"/>
					</TrackLine>
					<TrackLine>
						<End x="73.4554" y="45.8061"/>
					</TrackLine>
					<TrackLine>
						<End x="73.4701" y="45.8"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5299" y="45.8"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5446" y="45.8061"/>
					</TrackLine>
					<TrackLine>
						<End x="75.2939" y="46.5554"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3" y="46.5701"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3" y="47.6299"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3" y="48.9299"/>
					</TrackLine>
					<TrackLine>
						<End x="73.55" y="54.9406"/>
					</TrackLine>
					<TrackLine>
						<End x="73.55" y="56.1594"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5825" y="58.053"/>
					</TrackLine>
					<TrackLine>
						<End x="73.6445" y="58.2027"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3848" y="59.9431"/>
					</TrackLine>
					<TrackLine>
						<End x="75.5958" y="60.4524"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0119" y="62.191"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0119" y="62.8976"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0021" y="63.4423"/>
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
						<End x="79.5399" y="72.35"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7471" y="71.85"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9277" y="71.3398"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0106" y="70.4227"/>
					</TrackLine>
					<TrackLine>
						<End x="76.3366" y="69.4214"/>
					</TrackLine>
					<TrackLine>
						<End x="76.2836" y="69.2935"/>
					</TrackLine>
					<TrackLine>
						<End x="76.2836" y="66.9997"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0922" y="65.2522"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0922" y="63.9745"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0021" y="63.4423"/>
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
						<End x="47.2977" y="84.4859"/>
					</TrackLine>
					<TrackLine>
						<End x="46.5917" y="85.425"/>
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
						<End x="69.3314" y="49.2"/>
					</TrackLine>
					<TrackLine>
						<End x="67.232" y="49.7288"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="23.25" y="74"/>
					<TrackLine>
						<End x="23.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="24.2871" y="71.7472"/>
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
						<End x="50.6919" y="81.0785"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9231" y="84.6105"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9231" y="85.3627"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0884" y="86.1223"/>
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
						<End x="83.0941" y="71.5244"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="82.2216" y="69.6771"/>
					<TrackLine>
						<End x="83.136" y="63.2792"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="24.25" y="74"/>
					<TrackLine>
						<End x="24.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="24.662" y="72.6522"/>
					</TrackLine>
					<TrackLine>
						<End x="25.1921" y="72.1221"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3735" y="63.3092"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="53.048" y="62.0895"/>
					<TrackLine>
						<End x="52.3936" y="66.8861"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3936" y="67.6383"/>
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
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="53.25" y="74"/>
					<TrackLine>
						<End x="53.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="51.1919" y="81.2537"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8311" y="84.9866"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="69" y="47.75"/>
					<TrackLine>
						<End x="69" y="47.1"/>
					</TrackLine>
					<TrackLine>
						<End x="69.9186" y="46.3"/>
					</TrackLine>
					<TrackLine>
						<End x="73.3707" y="45.3"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6293" y="45.3"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8278" y="45.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7178" y="46.2722"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8" y="46.4707"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8" y="47.7293"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8" y="49.0293"/>
					</TrackLine>
					<TrackLine>
						<End x="74.05" y="55.0529"/>
					</TrackLine>
					<TrackLine>
						<End x="74.05" y="56.0471"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0717" y="57.9381"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7995" y="59.666"/>
					</TrackLine>
					<TrackLine>
						<End x="76.085" y="60.3551"/>
					</TrackLine>
					<TrackLine>
						<End x="76.8107" y="63.1074"/>
					</TrackLine>
					<TrackLine>
						<End x="76.8107" y="63.7772"/>
					</TrackLine>
					<TrackLine>
						<End x="76.767" y="64.8832"/>
					</TrackLine>
					<TrackLine>
						<End x="76.6836" y="68.202"/>
					</TrackLine>
					<TrackLine>
						<End x="76.6836" y="69.2028"/>
					</TrackLine>
					<TrackLine>
						<End x="77.4312" y="70.1417"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2087" y="70.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2603" y="70.9406"/>
					</TrackLine>
					<TrackLine>
						<End x="79.3599" y="70.9406"/>
					</TrackLine>
					<TrackLine>
						<End x="79.4115" y="70.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="82.2216" y="69.6771"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="82.2216" y="69.6771"/>
					<TrackLine>
						<End x="83.4702" y="70.6164"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0021" y="71.1483"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0021" y="71.9005"/>
					</TrackLine>
					<TrackLine>
						<End x="83.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="83.25" y="74"/>
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
						<End x="25.9601" y="72.35"/>
					</TrackLine>
					<TrackLine>
						<End x="26.7529" y="71.85"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3951" y="70.8045"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1473" y="70.8045"/>
					</TrackLine>
					<TrackLine>
						<End x="36.0977" y="71.6444"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="54.25" y="74"/>
					<TrackLine>
						<End x="54.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3016" y="67.2622"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="67.75" y="47.75"/>
					<TrackLine>
						<End x="67.75" y="47.1"/>
					</TrackLine>
					<TrackLine>
						<End x="68.6686" y="46.3"/>
					</TrackLine>
					<TrackLine>
						<End x="69.7054" y="45.8061"/>
					</TrackLine>
					<TrackLine>
						<End x="69.7201" y="45.8"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2712" y="44.8"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7288" y="44.8"/>
					</TrackLine>
					<TrackLine>
						<End x="75.111" y="44.9583"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1417" y="45.989"/>
					</TrackLine>
					<TrackLine>
						<End x="76.3" y="46.3712"/>
					</TrackLine>
					<TrackLine>
						<End x="76.3" y="47.8288"/>
					</TrackLine>
					<TrackLine>
						<End x="76.3" y="49.1288"/>
					</TrackLine>
					<TrackLine>
						<End x="74.55" y="55.2601"/>
					</TrackLine>
					<TrackLine>
						<End x="74.55" y="55.8399"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5608" y="57.7355"/>
					</TrackLine>
					<TrackLine>
						<End x="76.2142" y="59.3889"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5741" y="60.2578"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0567" y="62.334"/>
					</TrackLine>
					<TrackLine>
						<End x="77.2113" y="62.9414"/>
					</TrackLine>
					<TrackLine>
						<End x="77.2113" y="63.9432"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0836" y="68.3677"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0836" y="69.0371"/>
					</TrackLine>
					<TrackLine>
						<End x="77.906" y="69.9148"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4356" y="70.4444"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1846" y="70.4444"/>
					</TrackLine>
					<TrackLine>
						<End x="79.7142" y="69.9148"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4503" y="68.8181"/>
					</TrackLine>
					<TrackLine>
						<End x="82.228" y="62.9031"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7599" y="62.3712"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5121" y="62.3712"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0325" y="62.3879"/>
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
						<End x="84.5021" y="72.0757"/>
					</TrackLine>
					<TrackLine>
						<End x="84.5021" y="70.9731"/>
					</TrackLine>
					<TrackLine>
						<End x="84.018" y="66.6378"/>
					</TrackLine>
					<TrackLine>
						<End x="84.018" y="65.5352"/>
					</TrackLine>
					<TrackLine>
						<End x="84.044" y="63.6553"/>
					</TrackLine>
					<TrackLine>
						<End x="84.044" y="62.9031"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0325" y="62.3879"/>
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
						<End x="66.324" y="49.3527"/>
					</TrackLine>
					<TrackLine>
						<End x="66.324" y="50.1049"/>
					</TrackLine>
					<TrackLine>
						<End x="67.1746" y="51.0684"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="26.25" y="74"/>
					<TrackLine>
						<End x="26.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9601" y="72.35"/>
					</TrackLine>
					<TrackLine>
						<End x="34.7712" y="71.7125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="55.25" y="74"/>
					<TrackLine>
						<End x="55.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6604" y="69.2293"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5892" y="65.9316"/>
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
						<End x="84.518" y="66.4626"/>
					</TrackLine>
					<TrackLine>
						<End x="84.518" y="65.7104"/>
					</TrackLine>
					<TrackLine>
						<End x="84.9976" y="64.7488"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="27.25" y="74"/>
					<TrackLine>
						<End x="27.25" y="73.5826"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2315" y="73.5826"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="56.25" y="74"/>
					<TrackLine>
						<End x="56.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5684" y="68.8532"/>
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
						<End x="65.4623" y="49.0366"/>
					</TrackLine>
					<TrackLine>
						<End x="65.824" y="50.2801"/>
					</TrackLine>
					<TrackLine>
						<End x="66.2666" y="51.4445"/>
					</TrackLine>
					<TrackLine>
						<End x="66.9442" y="52.3847"/>
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
						<End x="85.426" y="66.0865"/>
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
						<End x="76.6726" y="59.0329"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7186" y="59.1017"/>
					</TrackLine>
					<TrackLine>
						<End x="77.1339" y="60.1043"/>
					</TrackLine>
					<TrackLine>
						<End x="77.15" y="60.1855"/>
					</TrackLine>
					<TrackLine>
						<End x="77.6119" y="62.8508"/>
					</TrackLine>
					<TrackLine>
						<End x="77.6119" y="64.0338"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5491" y="66.5358"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5491" y="67.7278"/>
					</TrackLine>
					<TrackLine>
						<End x="77.8916" y="68.7024"/>
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
						<End x="15.6211" y="58.7212"/>
					</TrackLine>
					<TrackLine>
						<End x="15.6211" y="59.4734"/>
					</TrackLine>
					<TrackLine>
						<End x="16.7784" y="70.3686"/>
					</TrackLine>
					<TrackLine>
						<End x="17.1625" y="71.9711"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="45.25" y="56.5"/>
					<TrackLine>
						<End x="45.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="45.607" y="58.0466"/>
					</TrackLine>
					<TrackLine>
						<End x="45.607" y="58.7988"/>
					</TrackLine>
					<TrackLine>
						<End x="45.5723" y="58.9879"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4701" y="69.0833"/>
					</TrackLine>
					<TrackLine>
						<End x="45.3527" y="69.7243"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2525" y="71.3249"/>
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
						<End x="77.1616" y="58.8648"/>
					</TrackLine>
					<TrackLine>
						<End x="77.6146" y="59.9585"/>
					</TrackLine>
					<TrackLine>
						<End x="77.65" y="60.1362"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0125" y="62.7711"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0125" y="64.1135"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9692" y="66.6296"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9692" y="67.634"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7019" y="68.3668"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7169" y="68.7839"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8101" y="69.5403"/>
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
						<End x="46.107" y="58.974"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0723" y="59.0874"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9701" y="69.1828"/>
					</TrackLine>
					<TrackLine>
						<End x="45.8565" y="69.9011"/>
					</TrackLine>
					<TrackLine>
						<End x="45.8565" y="70.6501"/>
					</TrackLine>
					<TrackLine>
						<End x="46.1567" y="70.9504"/>
					</TrackLine>
					<TrackLine>
						<End x="46.4546" y="71.969"/>
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
						<End x="17.4371" y="58.7212"/>
					</TrackLine>
					<TrackLine>
						<End x="17.4371" y="59.4734"/>
					</TrackLine>
					<TrackLine>
						<End x="17.2784" y="69.4412"/>
					</TrackLine>
					<TrackLine>
						<End x="17.2784" y="70.1934"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9984" y="71.0762"/>
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
						<End x="78.0954" y="59.8126"/>
					</TrackLine>
					<TrackLine>
						<End x="78.15" y="60.087"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4132" y="62.6914"/>
					</TrackLine>
					<TrackLine>
						<End x="78.4132" y="64.1932"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3714" y="66.7962"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3714" y="67.4674"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8461" y="67.9421"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5423" y="68.442"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="18.25" y="56.5"/>
					<TrackLine>
						<End x="18.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9492" y="58.1983"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9492" y="58.9505"/>
					</TrackLine>
					<TrackLine>
						<End x="18.1864" y="69.8173"/>
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
						<End x="46.5723" y="59.2626"/>
					</TrackLine>
					<TrackLine>
						<End x="46.5723" y="60.0148"/>
					</TrackLine>
					<TrackLine>
						<End x="46.6222" y="66.2437"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7607" y="70.2756"/>
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
						<End x="48.3883" y="59.2626"/>
					</TrackLine>
					<TrackLine>
						<End x="48.3883" y="60.0148"/>
					</TrackLine>
					<TrackLine>
						<End x="48.0616" y="61.3709"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6222" y="64.9421"/>
					</TrackLine>
					<TrackLine>
						<End x="47.6222" y="66.0447"/>
					</TrackLine>
					<TrackLine>
						<End x="47.7165" y="68.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4237" y="69.9638"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="19.25" y="56.5"/>
					<TrackLine>
						<End x="19.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="19.7652" y="58.1983"/>
					</TrackLine>
					<TrackLine>
						<End x="19.7652" y="58.9505"/>
					</TrackLine>
					<TrackLine>
						<End x="19.3549" y="67.6576"/>
					</TrackLine>
					<TrackLine>
						<End x="19.3549" y="68.4098"/>
					</TrackLine>
					<TrackLine>
						<End x="19.824" y="69.3565"/>
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
						<End x="78.65" y="60.0377"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8138" y="62.6117"/>
					</TrackLine>
					<TrackLine>
						<End x="78.9154" y="64.7157"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1817" y="66.5765"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1817" y="67.1318"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="48.6245" y="68.2724"/>
					<TrackLine>
						<End x="48.1222" y="65.8695"/>
					</TrackLine>
					<TrackLine>
						<End x="48.1222" y="65.1173"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5616" y="61.4704"/>
					</TrackLine>
					<TrackLine>
						<End x="48.8883" y="60.19"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="49.25" y="56.5"/>
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
						<End x="79.2144" y="61.4622"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2144" y="62.464"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2932" y="63.4125"/>
					</TrackLine>
					<TrackLine>
						<End x="79.3329" y="64.5428"/>
					</TrackLine>
					<TrackLine>
						<End x="80.175" y="65.8324"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="20.25" y="56.5"/>
					<TrackLine>
						<End x="20.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2652" y="58.0231"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2652" y="59.1257"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2629" y="68.0337"/>
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
						<End x="26.4616" y="61.6284"/>
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
						<End x="82.5399" y="58.15"/>
					</TrackLine>
					<TrackLine>
						<End x="81.2482" y="58.9898"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7229" y="59.5151"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7229" y="60.2581"/>
					</TrackLine>
					<TrackLine>
						<End x="81.3607" y="61.1519"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="23.0443" y="52.4531"/>
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
					<Start x="53.25" y="56.5"/>
					<TrackLine>
						<End x="53.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4614" y="60.2649"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="23.0818" y="51.1206"/>
					<TrackLine>
						<End x="22.1363" y="52.077"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1363" y="52.8292"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0632" y="53.9947"/>
					</TrackLine>
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
					<Start x="80.4236" y="61.9631"/>
					<TrackLine>
						<End x="80.4236" y="61.3749"/>
					</TrackLine>
					<TrackLine>
						<End x="80.3665" y="61.0881"/>
					</TrackLine>
					<TrackLine>
						<End x="80.2341" y="60.4335"/>
					</TrackLine>
					<TrackLine>
						<End x="80.2341" y="59.3397"/>
					</TrackLine>
					<TrackLine>
						<End x="80.2532" y="59.2935"/>
					</TrackLine>
					<TrackLine>
						<End x="81.0266" y="58.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="81.5399" y="58.15"/>
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
				<LayerRef name="Top"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="52.25" y="56.5"/>
					<TrackLine>
						<End x="52.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8378" y="60.5799"/>
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
						<End x="25.0527" y="62.7889"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="22.1552" y="54.3708"/>
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
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="81.25" y="56.5"/>
					<TrackLine>
						<End x="81.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8388" y="59.0167"/>
					</TrackLine>
					<TrackLine>
						<End x="79.7453" y="59.2425"/>
					</TrackLine>
					<TrackLine>
						<End x="79.615" y="61.6282"/>
					</TrackLine>
					<TrackLine>
						<End x="79.615" y="62.298"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1585" y="64.2008"/>
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
						<End x="49.9298" y="60.2038"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9298" y="60.956"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9696" y="62.0217"/>
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
						<End x="24.1447" y="63.165"/>
					</TrackLine>
					<TrackLine>
						<End x="24.4888" y="64.106"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="78"/>
				<Subwire width="0.2">
					<Start x="56.25" y="56.5"/>
					<TrackLine>
						<End x="56.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6995" y="58.0699"/>
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
				<LayerRef name="Top"/>
				<NetRef name="78"/>
				<Subwire width="0.2">
					<Start x="59" y="93.75"/>
					<TrackLine>
						<End x="59" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="61.15" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="61.15" y="62.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="61.15" y="61.9601"/>
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
				<LayerRef name="Top"/>
				<NetRef name="77"/>
				<Subwire width="0.2">
					<Start x="55.25" y="93.75"/>
					<TrackLine>
						<End x="55.25" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3314" y="92.1"/>
					</TrackLine>
					<TrackLine>
						<End x="46.2156" y="86.333"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7261" y="85.2511"/>
					</TrackLine>
					<TrackLine>
						<End x="44.1942" y="84.7192"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="63.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="62.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="41.05" y="62.25"/>
					</TrackLine>
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
						<End x="42" y="62.25"/>
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
						<End x="56.4415" y="76.0709"/>
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
						<End x="52.0999" y="81.6298"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="74"/>
				<Subwire width="0.2">
					<Start x="69" y="93.75"/>
					<TrackLine>
						<End x="69" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="68.0838" y="91.8761"/>
					</TrackLine>
					<TrackLine>
						<End x="68.0838" y="91.1239"/>
					</TrackLine>
					<TrackLine>
						<End x="70.5" y="87.5843"/>
					</TrackLine>
					<TrackLine>
						<End x="70.7343" y="87.35"/>
					</TrackLine>
					<TrackLine>
						<End x="85.297" y="77.4737"/>
					</TrackLine>
					<TrackLine>
						<End x="86.7471" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="87.45" y="75.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="87.45" y="73.5471"/>
					</TrackLine>
					<TrackLine>
						<End x="87.45" y="72.5529"/>
					</TrackLine>
					<TrackLine>
						<End x="87.35" y="69.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="87.35" y="63.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="87.35" y="62.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="87.9506" y="61.2775"/>
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
						<End x="87.9506" y="61.2775"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="74"/>
				<Subwire width="0.2">
					<Start x="87.9506" y="61.2775"/>
					<TrackLine>
						<End x="88.55" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="89.5" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="73"/>
				<Subwire width="0.2">
					<Start x="72" y="62.25"/>
					<TrackLine>
						<End x="72" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="73"/>
				<Subwire width="0.2">
					<Start x="66.5" y="93.75"/>
					<TrackLine>
						<End x="66.5" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="68.1376" y="84.9561"/>
					</TrackLine>
					<TrackLine>
						<End x="70.3497" y="70.0816"/>
					</TrackLine>
					<TrackLine>
						<End x="70.35" y="62.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="71.05" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="72" y="62.25"/>
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
						<End x="67.5838" y="92.0513"/>
					</TrackLine>
					<TrackLine>
						<End x="67.5838" y="90.9487"/>
					</TrackLine>
					<TrackLine>
						<End x="67.6063" y="90.8943"/>
					</TrackLine>
					<TrackLine>
						<End x="70" y="87.3772"/>
					</TrackLine>
					<TrackLine>
						<End x="70.5272" y="86.85"/>
					</TrackLine>
					<TrackLine>
						<End x="84.9209" y="76.5657"/>
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
						<End x="67.6376" y="84.7809"/>
					</TrackLine>
					<TrackLine>
						<End x="69.4417" y="69.7055"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="30.5" y="61.25"/>
					<TrackLine>
						<End x="29.55" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="70"/>
				<Subwire width="0.2">
					<Start x="29.55" y="61.25"/>
					<TrackLine>
						<End x="28.85" y="61.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="28.85" y="62.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="28.85" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2601" y="69.95"/>
					</TrackLine>
					<TrackLine>
						<End x="35.3225" y="70.3045"/>
					</TrackLine>
					<TrackLine>
						<End x="36.4738" y="70.7364"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0057" y="71.2683"/>
					</TrackLine>
					<TrackLine>
						<End x="40.825" y="85.2133"/>
					</TrackLine>
					<TrackLine>
						<End x="41.1853" y="87.1869"/>
					</TrackLine>
					<TrackLine>
						<End x="41.1853" y="88.6875"/>
					</TrackLine>
					<TrackLine>
						<End x="40.815" y="90.8597"/>
					</TrackLine>
					<TrackLine>
						<End x="40.7191" y="91.0913"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8038" y="92.0066"/>
					</TrackLine>
					<TrackLine>
						<End x="39.5722" y="92.1025"/>
					</TrackLine>
					<TrackLine>
						<End x="37.4197" y="92.1025"/>
					</TrackLine>
					<TrackLine>
						<End x="36.5" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="36.5" y="93.75"/>
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
						<End x="27.924" y="57.6496"/>
					</TrackLine>
					<TrackLine>
						<End x="28.4559" y="58.1815"/>
					</TrackLine>
					<TrackLine>
						<End x="29.55" y="61.25"/>
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
						<End x="31.1686" y="92.1"/>
					</TrackLine>
					<TrackLine>
						<End x="32.2054" y="91.6061"/>
					</TrackLine>
					<TrackLine>
						<End x="32.2201" y="91.6"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6207" y="91.1"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0232" y="90.61"/>
					</TrackLine>
					<TrackLine>
						<End x="39.0896" y="90.61"/>
					</TrackLine>
					<TrackLine>
						<End x="39.3225" y="90.3771"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6853" y="88.3133"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6853" y="87.5611"/>
					</TrackLine>
					<TrackLine>
						<End x="39.325" y="85.6968"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7365" y="84.7784"/>
					</TrackLine>
					<TrackLine>
						<End x="38.2046" y="84.2465"/>
					</TrackLine>
					<TrackLine>
						<End x="15.6406" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="15.4789" y="76.583"/>
					</TrackLine>
					<TrackLine>
						<End x="14.617" y="75.7211"/>
					</TrackLine>
					<TrackLine>
						<End x="10.85" y="69.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="10.85" y="64.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="10.85" y="63.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="11.35" y="62.9601"/>
					</TrackLine>
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
					<Start x="13" y="62.25"/>
					<TrackLine>
						<End x="13" y="61.25"/>
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
					<Start x="71.5" y="93.75"/>
					<TrackLine>
						<End x="71.5" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="72.4186" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0814" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="74.3314" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9814" y="94.8"/>
					</TrackLine>
					<TrackLine>
						<End x="82.45" y="94.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9439" y="93.2946"/>
					</TrackLine>
					<TrackLine>
						<End x="82.95" y="93.2799"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5467" y="91.4076"/>
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
						<End x="82.45" y="89.9186"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5467" y="91.4076"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="108"/>
				<Subwire width="0.2">
					<Start x="83.5467" y="91.4076"/>
					<TrackLine>
						<End x="91.55" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="90.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="14.5" y="31"/>
					<TrackLine>
						<End x="15.375" y="32.65"/>
					</TrackLine>
					<TrackLine>
						<End x="15.475" y="32.65"/>
					</TrackLine>
					<TrackLine>
						<End x="17.8314" y="33.1"/>
					</TrackLine>
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
					<Start x="42.4453" y="58.9384"/>
					<TrackLine>
						<End x="33.0525" y="58.7932"/>
					</TrackLine>
					<TrackLine>
						<End x="32.3003" y="58.7932"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0136" y="58.8811"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="35.5" y="89.575"/>
					<TrackLine>
						<End x="36.325" y="89.575"/>
					</TrackLine>
					<TrackLine>
						<End x="36.425" y="89.575"/>
					</TrackLine>
					<TrackLine>
						<End x="37.075" y="89.575"/>
					</TrackLine>
					<TrackLine>
						<End x="37.175" y="89.575"/>
					</TrackLine>
					<TrackLine>
						<End x="38" y="89.575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="50.25" y="56.5"/>
					<TrackLine>
						<End x="50.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0618" y="54.9515"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="77.0662" y="91.958"/>
					<TrackLine>
						<End x="80.35" y="94"/>
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
					<Start x="38" y="89.575"/>
					<TrackLine>
						<End x="37.5275" y="89.0375"/>
					</TrackLine>
					<TrackLine>
						<End x="37.5275" y="88.9375"/>
					</TrackLine>
					<TrackLine>
						<End x="37.5275" y="88.2461"/>
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
						<End x="45.5399" y="72.35"/>
					</TrackLine>
					<TrackLine>
						<End x="44.8764" y="72.2329"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3445" y="71.701"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3445" y="70.9488"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9701" y="68.9081"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9701" y="68.1559"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3595" y="66.5127"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="25.3975" y="49.7187"/>
					<TrackLine>
						<End x="22.7057" y="50.2126"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1738" y="50.7445"/>
					</TrackLine>
					<TrackLine>
						<End x="21.6588" y="51.8474"/>
					</TrackLine>
					<TrackLine>
						<End x="20.4998" y="54.4776"/>
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
						<End x="78.2" y="51.6064"/>
					</TrackLine>
					<TrackLine>
						<End x="78.6686" y="52.075"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5495" y="53.5251"/>
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
						<End x="91.6594" y="85.302"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="77.0662" y="91.958"/>
					<TrackLine>
						<End x="77" y="91.2914"/>
					</TrackLine>
					<TrackLine>
						<End x="77" y="91.25"/>
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
						<End x="27.0158" y="45.5195"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="25.3975" y="49.7187"/>
					<TrackLine>
						<End x="32.0136" y="58.8811"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="44.3934" y="47.8388"/>
					<TrackLine>
						<End x="44.3934" y="47.1888"/>
					</TrackLine>
					<TrackLine>
						<End x="45.312" y="46.3888"/>
					</TrackLine>
					<TrackLine>
						<End x="49.062" y="46.3888"/>
					</TrackLine>
					<TrackLine>
						<End x="49.7248" y="46.3888"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6434" y="47.1888"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6434" y="47.8388"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="83.4013" y="52.3973"/>
					<TrackLine>
						<End x="86.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="55.2601"/>
					</TrackLine>
					<TrackLine>
						<End x="91.15" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="91.15" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="90.45" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="89.5" y="62.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.2" y="94"/>
					<TrackLine>
						<End x="92.2" y="92.75"/>
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
						<End x="32.4976" y="46.4079"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4976" y="45.6557"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9657" y="45.1238"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2135" y="45.1238"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0158" y="45.5195"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="42.4453" y="58.9384"/>
					<TrackLine>
						<End x="44.55" y="55.2601"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="48.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0618" y="54.9515"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="91.6594" y="85.302"/>
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
						<End x="93.65" y="91.8314"/>
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
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="83.4013" y="52.3973"/>
					<TrackLine>
						<End x="80.5495" y="53.5251"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="80.5495" y="53.5251"/>
					<TrackLine>
						<End x="80.25" y="55.55"/>
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
					<Start x="62.0666" y="51.901"/>
					<TrackLine>
						<End x="62.75" y="48.4"/>
					</TrackLine>
					<TrackLine>
						<End x="62.75" y="47.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74" y="93.75"/>
					<TrackLine>
						<End x="74" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0662" y="91.958"/>
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
						<End x="15.375" y="29.2086"/>
					</TrackLine>
					<TrackLine>
						<End x="15.375" y="29.25"/>
					</TrackLine>
					<TrackLine>
						<End x="15.375" y="29.35"/>
					</TrackLine>
					<TrackLine>
						<End x="14.5" y="31"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="32.0136" y="58.8811"/>
					<TrackLine>
						<End x="31.7684" y="59.3251"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7684" y="60.0773"/>
					</TrackLine>
					<TrackLine>
						<End x="32.15" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="32.15" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="31.45" y="62.25"/>
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
					<Start x="42" y="63.25"/>
					<TrackLine>
						<End x="42.95" y="63.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="42.95" y="63.25"/>
					<TrackLine>
						<End x="43.65" y="62.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="43.65" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="43.65" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4453" y="58.9384"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="72" y="63.25"/>
					<TrackLine>
						<End x="72.95" y="63.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="72.95" y="63.25"/>
					<TrackLine>
						<End x="73.5539" y="63.9999"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5539" y="65.0125"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6836" y="67.4153"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6836" y="69.6118"/>
					</TrackLine>
					<TrackLine>
						<End x="74.907" y="70.6008"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3003" y="71.5503"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="73.05"/>
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
						<End x="12.05" y="63.25"/>
					</TrackLine>
					<TrackLine>
						<End x="11.35" y="63.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="11.35" y="64.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="11.35" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="11.7601" y="69.95"/>
					</TrackLine>
					<TrackLine>
						<End x="12.3399" y="69.95"/>
					</TrackLine>
					<TrackLine>
						<End x="13.2992" y="69.9284"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0336" y="69.9284"/>
					</TrackLine>
					<TrackLine>
						<End x="14.5529" y="70.4477"/>
					</TrackLine>
					<TrackLine>
						<End x="15.55" y="75.2399"/>
					</TrackLine>
					<TrackLine>
						<End x="15.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5399" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="11.25" y="94.45"/>
					<TrackLine>
						<End x="11.25" y="95.1"/>
					</TrackLine>
					<TrackLine>
						<End x="12.1686" y="95.9"/>
					</TrackLine>
					<TrackLine>
						<End x="18.2201" y="96.4"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2799" y="96.4"/>
					</TrackLine>
					<TrackLine>
						<End x="19.2946" y="96.3939"/>
					</TrackLine>
					<TrackLine>
						<End x="27.4186" y="92.1"/>
					</TrackLine>
					<TrackLine>
						<End x="34.5336" y="90.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="34.575" y="90.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="34.675" y="90.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="35.5" y="89.575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="20.4998" y="54.4776"/>
					<TrackLine>
						<End x="21.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="21.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="81" y="94"/>
					<TrackLine>
						<End x="81.65" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="82.45" y="93.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="82.45" y="91.8314"/>
					</TrackLine>
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
					<Start x="62.0666" y="51.901"/>
					<TrackLine>
						<End x="71.9633" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2264" y="60.5827"/>
					</TrackLine>
					<TrackLine>
						<End x="73.6173" y="60.9736"/>
					</TrackLine>
					<TrackLine>
						<End x="73.6173" y="61.5264"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5502" y="61.953"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5503" y="62.4987"/>
					</TrackLine>
					<TrackLine>
						<End x="72.95" y="63.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="52.1648" y="53.2999"/>
					<TrackLine>
						<End x="51.6333" y="49.2928"/>
					</TrackLine>
					<TrackLine>
						<End x="51.1293" y="48.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6434" y="48.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6434" y="47.8388"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="91.6594" y="85.302"/>
					<TrackLine>
						<End x="90.1225" y="78.4217"/>
					</TrackLine>
					<TrackLine>
						<End x="87.85" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="87.85" y="63.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="87.85" y="62.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="88.55" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="89.5" y="62.25"/>
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
						<End x="16.8278" y="72.7792"/>
					</TrackLine>
					<TrackLine>
						<End x="16.3544" y="72.3058"/>
					</TrackLine>
					<TrackLine>
						<End x="15.1211" y="59.6486"/>
					</TrackLine>
					<TrackLine>
						<End x="15.1211" y="58.546"/>
					</TrackLine>
					<TrackLine>
						<End x="15.55" y="55.2601"/>
					</TrackLine>
					<TrackLine>
						<End x="15.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="20.4998" y="54.4776"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="44.3595" y="66.5127"/>
					<TrackLine>
						<End x="43.65" y="63.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="42.95" y="63.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="26" y="47.7"/>
					<TrackLine>
						<End x="26" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="25.3975" y="49.7187"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="83.4013" y="52.3973"/>
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
					<Start x="52.1648" y="53.2999"/>
					<TrackLine>
						<End x="54.5436" y="54.325"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2064" y="54.325"/>
					</TrackLine>
					<TrackLine>
						<End x="62.0666" y="51.901"/>
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
						<End x="63.6686" y="46.3"/>
					</TrackLine>
					<TrackLine>
						<End x="71.6217" y="44.678"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1718" y="44.3"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8282" y="44.3"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3942" y="44.5345"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5655" y="45.7058"/>
					</TrackLine>
					<TrackLine>
						<End x="77.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="77.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="50.0618" y="54.9515"/>
					<TrackLine>
						<End x="52.1648" y="53.2999"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="59.5" y="62.25"/>
					<TrackLine>
						<End x="58.55" y="62.25"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4241" y="61.1815"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6719" y="61.1815"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3117" y="62.8476"/>
					</TrackLine>
					<TrackLine>
						<End x="49.6275" y="62.8476"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1437" y="62.3638"/>
					</TrackLine>
					<TrackLine>
						<End x="49.1437" y="61.6796"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3883" y="60.2895"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4298" y="60.0286"/>
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
				<NetRef name="NET00031"/>
				<Subwire width="0.2">
					<Start x="81" y="87.75"/>
					<TrackLine>
						<End x="80.35" y="87.75"/>
					</TrackLine>
					<TrackLine>
						<End x="78.882" y="88.717"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3501" y="89.2489"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3501" y="90.0011"/>
					</TrackLine>
					<TrackLine>
						<End x="79.55" y="91.8314"/>
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
						<End x="36.325" y="85.8211"/>
					</TrackLine>
					<TrackLine>
						<End x="36.5125" y="85.1545"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="57"/>
				<Subwire width="0.2">
					<Start x="35.5" y="86.5"/>
					<TrackLine>
						<End x="34.675" y="85.9625"/>
					</TrackLine>
					<TrackLine>
						<End x="34.575" y="85.9625"/>
					</TrackLine>
					<TrackLine>
						<End x="34.5336" y="85.9625"/>
					</TrackLine>
					<TrackLine>
						<End x="19.4913" y="84.9811"/>
					</TrackLine>
					<TrackLine>
						<End x="18.4186" y="84.7"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5" y="83.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="70.25" y="93.75"/>
					<TrackLine>
						<End x="70.25" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="68.9918" y="91.5"/>
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
						<End x="79.55" y="90.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2581" y="89.625"/>
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
						<End x="54.1544" y="58.8916"/>
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
						<End x="27.436" y="59.8864"/>
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
						<End x="61.65" y="69.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="61.65" y="62.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="61.65" y="61.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="61.15" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="56.95" y="55.2601"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="54.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="54.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="83.2512" y="59.6775"/>
					<TrackLine>
						<End x="84.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="84.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="58.1434" y="47.8388"/>
					<TrackLine>
						<End x="58.1434" y="47.1888"/>
					</TrackLine>
					<TrackLine>
						<End x="57.5125" y="45.7824"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7327" y="45.0026"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6783" y="44.9801"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4547" y="44.7795"/>
					</TrackLine>
					<TrackLine>
						<End x="54.7053" y="44.7795"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1497" y="45.3299"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1116" y="45.6141"/>
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
						<End x="58.1434" y="48.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1434" y="47.8388"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="26.25" y="56.5"/>
					<TrackLine>
						<End x="26.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9601" y="58.15"/>
					</TrackLine>
					<TrackLine>
						<End x="27.5479" y="58.5576"/>
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
						<End x="31.6344" y="34.2659"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4197" y="38.2683"/>
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
						<End x="84.8972" y="58.458"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="55.7915" y="58.446"/>
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
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="56.8934" y="29.1388"/>
					<TrackLine>
						<End x="56.8934" y="29.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6644" y="34.2038"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1325" y="34.7357"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8645" y="34.8027"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="42.3212" y="34.9758"/>
					<TrackLine>
						<End x="42.9712" y="34.9758"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8645" y="34.8027"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="47.4803" y="59.6387"/>
					<TrackLine>
						<End x="47.1222" y="64.8426"/>
					</TrackLine>
					<TrackLine>
						<End x="47.1222" y="66.1442"/>
					</TrackLine>
					<TrackLine>
						<End x="47.2165" y="68.8237"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5922" y="69.9312"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5922" y="70.62"/>
					</TrackLine>
					<TrackLine>
						<End x="47.3626" y="72.3451"/>
					</TrackLine>
					<TrackLine>
						<End x="47.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="47.25" y="74"/>
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
						<End x="18.9064" y="71.4523"/>
					</TrackLine>
					<TrackLine>
						<End x="19.0052" y="70.1565"/>
					</TrackLine>
					<TrackLine>
						<End x="19.0052" y="69.4781"/>
					</TrackLine>
					<TrackLine>
						<End x="18.8549" y="68.585"/>
					</TrackLine>
					<TrackLine>
						<End x="18.8549" y="67.4824"/>
					</TrackLine>
					<TrackLine>
						<End x="18.8572" y="58.5744"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="72.3394" y="59.642"/>
					<TrackLine>
						<End x="73.42" y="60.1154"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0846" y="60.78"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0846" y="61.72"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9505" y="62.0437"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9505" y="63.0449"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9577" y="63.8326"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9577" y="64.8452"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0836" y="67.2496"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0836" y="69.5322"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4021" y="70.4895"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7291" y="71.279"/>
					</TrackLine>
					<TrackLine>
						<End x="77.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="77.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="55.6434" y="29.1388"/>
					<TrackLine>
						<End x="55.6434" y="28.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5882" y="27.7519"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1986" y="27.7519"/>
					</TrackLine>
					<TrackLine>
						<End x="58.4336" y="27.7881"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8441" y="28.1986"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8441" y="28.779"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8441" y="30.079"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7002" y="39.8336"/>
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
						<End x="44.6468" y="72.7104"/>
					</TrackLine>
					<TrackLine>
						<End x="43.867" y="71.9306"/>
					</TrackLine>
					<TrackLine>
						<End x="43.8445" y="71.8762"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5424" y="69.3682"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="43.5424" y="69.3682"/>
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
					<Start x="44.0621" y="68.532"/>
					<TrackLine>
						<End x="43.5424" y="69.3682"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="59.5" y="68.25"/>
					<TrackLine>
						<End x="59.5" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="56.938" y="65.9144"/>
					<TrackLine>
						<End x="57.85" y="67.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="58.55" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="54.3934" y="29.1388"/>
					<TrackLine>
						<End x="54.3934" y="29.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7564" y="33.8277"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="84.3916" y="40.2326"/>
					<TrackLine>
						<End x="86.5" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="83.9454" y="38.258"/>
					<TrackLine>
						<End x="85.2996" y="39.8565"/>
					</TrackLine>
					<TrackLine>
						<End x="86.8658" y="45.4673"/>
					</TrackLine>
					<TrackLine>
						<End x="87.75" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="87.75" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="73.5363" y="69.1952"/>
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
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="89" y="47.7"/>
					<TrackLine>
						<End x="89" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="89.52" y="49.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="73.5363" y="69.1952"/>
					<TrackLine>
						<End x="73.5363" y="69.7822"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5584" y="69.8934"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9854" y="70.9243"/>
					</TrackLine>
					<TrackLine>
						<End x="75.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="75.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="73.8756" y="67.75"/>
					<TrackLine>
						<End x="73.5363" y="69.1952"/>
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
						<End x="91.15" y="67.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="91.65" y="61.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="91.65" y="60.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="90.428" y="49.0239"/>
					</TrackLine>
					<TrackLine>
						<End x="90.25" y="48.35"/>
					</TrackLine>
					<TrackLine>
						<End x="90.25" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="89.6957" y="46.0373"/>
					<TrackLine>
						<End x="90.25" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="90.25" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="89.5" y="69.25"/>
					<TrackLine>
						<End x="89.5" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="87.7738" y="45.0912"/>
					<TrackLine>
						<End x="90.0718" y="45.1293"/>
					</TrackLine>
					<TrackLine>
						<End x="90.6037" y="45.6612"/>
					</TrackLine>
					<TrackLine>
						<End x="91.5" y="47.05"/>
					</TrackLine>
					<TrackLine>
						<End x="91.5" y="47.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="80.4918" y="38.8697"/>
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
					<Start x="14.5489" y="69.1702"/>
					<TrackLine>
						<End x="15.0519" y="70.2092"/>
					</TrackLine>
					<TrackLine>
						<End x="15.0744" y="70.2636"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7545" y="72.5224"/>
					</TrackLine>
					<TrackLine>
						<End x="15.777" y="72.5768"/>
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
				<LayerRef name="Top"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="14.5489" y="69.1702"/>
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
					<Start x="78.3292" y="38.455"/>
					<TrackLine>
						<End x="88.0814" y="30.45"/>
					</TrackLine>
					<TrackLine>
						<End x="89" y="29.65"/>
					</TrackLine>
					<TrackLine>
						<End x="89" y="29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="78.3292" y="38.455"/>
					<TrackLine>
						<End x="77.3677" y="39.2728"/>
					</TrackLine>
					<TrackLine>
						<End x="73.6879" y="41.1792"/>
					</TrackLine>
					<TrackLine>
						<End x="66.661" y="41.375"/>
					</TrackLine>
					<TrackLine>
						<End x="62.3689" y="42.8389"/>
					</TrackLine>
					<TrackLine>
						<End x="61.6167" y="42.8389"/>
					</TrackLine>
					<TrackLine>
						<End x="59.3218" y="41.7866"/>
					</TrackLine>
					<TrackLine>
						<End x="59.0836" y="41.6879"/>
					</TrackLine>
					<TrackLine>
						<End x="55.657" y="41.4735"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5544" y="41.4735"/>
					</TrackLine>
					<TrackLine>
						<End x="51.351" y="41.7416"/>
					</TrackLine>
					<TrackLine>
						<End x="35.9988" y="42.8647"/>
					</TrackLine>
					<TrackLine>
						<End x="34.7148" y="42.8647"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6617" y="42.6227"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9095" y="42.6227"/>
					</TrackLine>
					<TrackLine>
						<End x="28.2681" y="44.393"/>
					</TrackLine>
					<TrackLine>
						<End x="26.6397" y="44.6115"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7529" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="15.05" y="55.0529"/>
					</TrackLine>
					<TrackLine>
						<End x="14.6211" y="58.4465"/>
					</TrackLine>
					<TrackLine>
						<End x="14.6211" y="59.7481"/>
					</TrackLine>
					<TrackLine>
						<End x="14.65" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="14.65" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="14.65" y="68.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="14.5489" y="69.1702"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00005"/>
				<Subwire width="0.2">
					<Start x="13.75" y="83.25"/>
					<TrackLine>
						<End x="13.75" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="12.8314" y="84.7"/>
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
						<End x="8.85" y="70.1578"/>
					</TrackLine>
					<TrackLine>
						<End x="8.85" y="65.1578"/>
					</TrackLine>
					<TrackLine>
						<End x="8.85" y="63.3422"/>
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
					<Start x="76.9916" y="38.3648"/>
					<TrackLine>
						<End x="77.9531" y="37.547"/>
					</TrackLine>
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
					<Start x="30.5" y="68.25"/>
					<TrackLine>
						<End x="31.45" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="32.504" y="68.2505"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="30.5" y="68.25"/>
					<TrackLine>
						<End x="30.5" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00003"/>
				<Subwire width="0.2">
					<Start x="16.25" y="45.75"/>
					<TrackLine>
						<End x="15" y="45.75"/>
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
						<End x="9.35" y="70.0583"/>
					</TrackLine>
					<TrackLine>
						<End x="9.35" y="65.0583"/>
					</TrackLine>
					<TrackLine>
						<End x="9.35" y="63.4417"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="46.4"/>
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
					<Start x="35.3568" y="41.0009"/>
					<TrackLine>
						<End x="31.5353" y="41.1227"/>
					</TrackLine>
					<TrackLine>
						<End x="27.2412" y="41.577"/>
					</TrackLine>
					<TrackLine>
						<End x="14.6686" y="44.3"/>
					</TrackLine>
					<TrackLine>
						<End x="13.75" y="45.1"/>
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
					<Start x="61.9928" y="41.9309"/>
					<TrackLine>
						<End x="59.1831" y="41.1879"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7565" y="40.9735"/>
					</TrackLine>
					<TrackLine>
						<End x="54.4549" y="40.9735"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2515" y="41.2416"/>
					</TrackLine>
					<TrackLine>
						<End x="35.9023" y="42.3794"/>
					</TrackLine>
					<TrackLine>
						<End x="34.8113" y="42.3794"/>
					</TrackLine>
					<TrackLine>
						<End x="32.8369" y="42.1227"/>
					</TrackLine>
					<TrackLine>
						<End x="31.7343" y="42.1227"/>
					</TrackLine>
					<TrackLine>
						<End x="27.5159" y="42.577"/>
					</TrackLine>
					<TrackLine>
						<End x="23.3816" y="43.7324"/>
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
					<Start x="73.3118" y="40.2712"/>
					<TrackLine>
						<End x="54.3554" y="40.4735"/>
					</TrackLine>
					<TrackLine>
						<End x="51.0763" y="40.7416"/>
					</TrackLine>
					<TrackLine>
						<End x="35.7268" y="41.8942"/>
					</TrackLine>
					<TrackLine>
						<End x="34.9868" y="41.8942"/>
					</TrackLine>
					<TrackLine>
						<End x="32.9364" y="41.6227"/>
					</TrackLine>
					<TrackLine>
						<End x="31.6348" y="41.6227"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3407" y="42.077"/>
					</TrackLine>
					<TrackLine>
						<End x="23.2064" y="43.2324"/>
					</TrackLine>
					<TrackLine>
						<End x="23.152" y="43.2549"/>
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
				<LayerRef name="Int 1"/>
				<NetRef name="14"/>
				<Subwire width="0.2">
					<Start x="42.28" y="23.02"/>
					<TrackLine>
						<End x="34.4488" y="40.6248"/>
					</TrackLine>
					<TrackLine>
						<End x="33.1564" y="43.8825"/>
					</TrackLine>
					<TrackLine>
						<End x="33.1565" y="43.8914"/>
					</TrackLine>
					<TrackLine>
						<End x="31.5896" y="46.0318"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="50.7729" y="49.6492"/>
					<TrackLine>
						<End x="54.0196" y="45.9902"/>
					</TrackLine>
					<TrackLine>
						<End x="54.172" y="45.3081"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6816" y="44.798"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1057" y="42.8815"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="53.7736" y="44.4219"/>
					<TrackLine>
						<End x="52.7355" y="44.7061"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5233" y="49.4361"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="71.2456" y="43.77"/>
					<TrackLine>
						<End x="64.2853" y="38.2751"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
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
						<End x="64.2853" y="38.2751"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="9"/>
				<Subwire width="0.2">
					<Start x="64.2853" y="38.2751"/>
					<TrackLine>
						<End x="54.7296" y="41.9735"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6237" y="49.407"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="7"/>
				<Subwire width="0.2">
					<Start x="77.9416" y="27.1377"/>
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
				<LayerRef name="Int 1"/>
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
				<LayerRef name="Int 1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="24.0314" y="80.0408"/>
					<TrackLine>
						<End x="19.8674" y="84.0731"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="77.84" y="15.3"/>
					<TrackLine>
						<End x="80.38" y="15.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="80.38" y="17.84"/>
					<TrackLine>
						<End x="81.1699" y="16.9334"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="88" y="23.02"/>
					<TrackLine>
						<End x="90.54" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="81.1699" y="16.9334"/>
					<TrackLine>
						<End x="80.38" y="15.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="90.54" y="20.48"/>
					<TrackLine>
						<End x="88.4763" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="81.1699" y="16.9334"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="49.4119" y="87.321"/>
					<TrackLine>
						<End x="24.0314" y="80.0408"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="24.0314" y="80.0408"/>
					<TrackLine>
						<End x="22.0053" y="71.9629"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="116"/>
				<Subwire width="0.2">
					<Start x="27.04" y="23.02"/>
					<TrackLine>
						<End x="27.04" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6764" y="59.7012"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="49.0302" y="65.4934"/>
					<TrackLine>
						<End x="54.2131" y="65.0236"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7696" y="64.5089"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="75.159" y="62.5443"/>
					<TrackLine>
						<End x="53.5993" y="63.4975"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4967" y="63.4975"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9858" y="63.3516"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2336" y="63.3516"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2856" y="63.6734"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="76.0021" y="63.4423"/>
					<TrackLine>
						<End x="51.6097" y="64.2596"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="24.2871" y="71.7472"/>
					<TrackLine>
						<End x="28.7542" y="77.0489"/>
					</TrackLine>
					<TrackLine>
						<End x="31.4819" y="80.1577"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0138" y="80.6896"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7658" y="83.2018"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0884" y="86.1223"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="83.0941" y="71.5244"/>
					<TrackLine>
						<End x="51.2072" y="85.8946"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0884" y="86.1223"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="83.136" y="63.2792"/>
					<TrackLine>
						<End x="80.0475" y="62.8711"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7103" y="61.1363"/>
					</TrackLine>
					<TrackLine>
						<End x="74.6077" y="61.1363"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9902" y="61.55"/>
					</TrackLine>
					<TrackLine>
						<End x="53.048" y="62.0895"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="53.3016" y="67.2622"/>
					<TrackLine>
						<End x="48.2484" y="67.3644"/>
					</TrackLine>
					<TrackLine>
						<End x="45.8717" y="68.4663"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4382" y="69.44"/>
					</TrackLine>
					<TrackLine>
						<End x="36.0977" y="71.6444"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="84.0325" y="62.3879"/>
					<TrackLine>
						<End x="84.044" y="62.9031"/>
					</TrackLine>
					<TrackLine>
						<End x="84.044" y="63.6553"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5121" y="64.1872"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4964" y="65.0166"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8371" y="65.0166"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1457" y="65.4169"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3016" y="67.2622"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="34.7712" y="71.7125"/>
					<TrackLine>
						<End x="35.1897" y="71.2683"/>
					</TrackLine>
					<TrackLine>
						<End x="35.7216" y="70.7364"/>
					</TrackLine>
					<TrackLine>
						<End x="43.686" y="67.624"/>
					</TrackLine>
					<TrackLine>
						<End x="48.0732" y="66.8644"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5892" y="65.9316"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="55.5684" y="68.8532"/>
					<TrackLine>
						<End x="48.9748" y="69.1181"/>
					</TrackLine>
					<TrackLine>
						<End x="48.0734" y="69.1181"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3846" y="69.3676"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9511" y="70.3413"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7129" y="70.44"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2315" y="73.5826"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="77.8916" y="68.7024"/>
					<TrackLine>
						<End x="74.5264" y="69.658"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8178" y="70.6135"/>
					</TrackLine>
					<TrackLine>
						<End x="48.975" y="71.3718"/>
					</TrackLine>
					<TrackLine>
						<End x="47.8724" y="71.3718"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8053" y="71.1223"/>
					</TrackLine>
					<TrackLine>
						<End x="46.1039" y="71.1223"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2525" y="71.3249"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="78.8101" y="69.5403"/>
					<TrackLine>
						<End x="69.993" y="71.1135"/>
					</TrackLine>
					<TrackLine>
						<End x="46.4546" y="71.969"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="79.5423" y="68.442"/>
					<TrackLine>
						<End x="78.2677" y="67.7944"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5155" y="67.7944"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4813" y="69.1355"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4269" y="69.158"/>
					</TrackLine>
					<TrackLine>
						<End x="73.3243" y="69.158"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8178" y="68.7975"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0656" y="68.7975"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1197" y="70.2612"/>
					</TrackLine>
					<TrackLine>
						<End x="48.7998" y="70.8718"/>
					</TrackLine>
					<TrackLine>
						<End x="48.0476" y="70.8718"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7607" y="70.2756"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="48.4237" y="69.9638"/>
					<TrackLine>
						<End x="55.9445" y="69.7612"/>
					</TrackLine>
					<TrackLine>
						<End x="68.8904" y="68.2975"/>
					</TrackLine>
					<TrackLine>
						<End x="69.993" y="68.2975"/>
					</TrackLine>
					<TrackLine>
						<End x="73.4995" y="68.658"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2517" y="68.658"/>
					</TrackLine>
					<TrackLine>
						<End x="77.2859" y="67.3169"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3403" y="67.2944"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1817" y="67.1318"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="48.6245" y="68.2724"/>
					<TrackLine>
						<End x="46.2094" y="68.8676"/>
					</TrackLine>
					<TrackLine>
						<End x="46.155" y="68.8901"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6678" y="69.9175"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6134" y="69.94"/>
					</TrackLine>
					<TrackLine>
						<End x="36.4738" y="72.5524"/>
					</TrackLine>
					<TrackLine>
						<End x="34.8554" y="72.6746"/>
					</TrackLine>
					<TrackLine>
						<End x="32.203" y="74.3976"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="80.175" y="65.8324"/>
					<TrackLine>
						<End x="79.733" y="65.7238"/>
					</TrackLine>
					<TrackLine>
						<End x="78.6304" y="65.7238"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1923" y="67.9452"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6777" y="68.1702"/>
					</TrackLine>
					<TrackLine>
						<End x="48.6245" y="68.2724"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="32.203" y="74.3976"/>
					<TrackLine>
						<End x="20.2629" y="68.0337"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="32.3899" y="79.7816"/>
					<TrackLine>
						<End x="32.203" y="74.3976"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="52.4614" y="60.2649"/>
					<TrackLine>
						<End x="55.1407" y="60.354"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9633" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7155" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4087" y="60.1363"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9093" y="60.1363"/>
					</TrackLine>
					<TrackLine>
						<End x="81.3607" y="61.1519"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="50.8378" y="60.5799"/>
					<TrackLine>
						<End x="52.0853" y="61.1729"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8375" y="61.1729"/>
					</TrackLine>
					<TrackLine>
						<End x="72.8907" y="61.05"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5082" y="60.6363"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8098" y="60.6363"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4236" y="61.9631"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="80.1585" y="64.2008"/>
					<TrackLine>
						<End x="75.5351" y="61.6363"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7829" y="61.6363"/>
					</TrackLine>
					<TrackLine>
						<End x="73.0897" y="62.05"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4241" y="62.9975"/>
					</TrackLine>
					<TrackLine>
						<End x="52.6719" y="62.9975"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9696" y="62.0217"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="16.88" y="23.02"/>
					<TrackLine>
						<End x="16.88" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0158" y="45.5195"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="72.76" y="15.3"/>
					<TrackLine>
						<End x="74.7724" y="16.5685"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7761" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8239" y="16.57"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8276" y="16.5715"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5685" y="17.3124"/>
					</TrackLine>
					<TrackLine>
						<End x="76.57" y="17.3161"/>
					</TrackLine>
					<TrackLine>
						<End x="76.57" y="18.3639"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5715" y="18.3676"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3124" y="19.1085"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3161" y="19.11"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3163" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="78.99" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="79.26" y="21.0939"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9161" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8439" y="21.75"/>
					</TrackLine>
					<TrackLine>
						<End x="82.92" y="22.87"/>
					</TrackLine>
					<TrackLine>
						<End x="82.92" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="109"/>
				<Subwire width="0.2">
					<Start x="68.9918" y="91.5"/>
					<TrackLine>
						<End x="79.2581" y="89.625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="54.1544" y="58.8916"/>
					<TrackLine>
						<End x="55.4154" y="59.354"/>
					</TrackLine>
					<TrackLine>
						<End x="56.1676" y="59.354"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9633" y="58.734"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7155" y="58.734"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9958" y="58.9786"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2512" y="59.6775"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="53.1116" y="45.6141"/>
					<TrackLine>
						<End x="47.8994" y="50.3441"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3685" y="60.6875"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8121" y="60.7944"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0599" y="60.7944"/>
					</TrackLine>
					<TrackLine>
						<End x="26.8377" y="60.7204"/>
					</TrackLine>
					<TrackLine>
						<End x="18.4811" y="59.4824"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5291" y="59.0973"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="55.7915" y="58.446"/>
					<TrackLine>
						<End x="71.7881" y="58.234"/>
					</TrackLine>
					<TrackLine>
						<End x="72.8907" y="58.234"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8972" y="58.458"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="50.8645" y="34.8027"/>
					<TrackLine>
						<End x="33.9924" y="59.7795"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="14.34" y="23.02"/>
					<TrackLine>
						<End x="14.34" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="18.8572" y="58.5744"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="72.3394" y="59.642"/>
					<TrackLine>
						<End x="56.3428" y="59.854"/>
					</TrackLine>
					<TrackLine>
						<End x="55.2402" y="59.854"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7783" y="59.7996"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8375" y="59.3569"/>
					</TrackLine>
					<TrackLine>
						<End x="52.0853" y="59.3569"/>
					</TrackLine>
					<TrackLine>
						<End x="47.4803" y="59.6387"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="44.699" y="58.4227"/>
					<TrackLine>
						<End x="64.1782" y="48.5047"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3916" y="40.2326"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="89.52" y="49.4"/>
					<TrackLine>
						<End x="84.9405" y="62.764"/>
					</TrackLine>
					<TrackLine>
						<End x="84.544" y="63.8305"/>
					</TrackLine>
					<TrackLine>
						<End x="84.5215" y="63.8849"/>
					</TrackLine>
					<TrackLine>
						<End x="83.7417" y="64.6647"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5108" y="66.643"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8392" y="66.643"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5175" y="66.3212"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8459" y="66.3212"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8756" y="67.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="76.9916" y="38.3648"/>
					<TrackLine>
						<End x="72.1536" y="44.1461"/>
					</TrackLine>
					<TrackLine>
						<End x="71.6217" y="44.678"/>
					</TrackLine>
					<TrackLine>
						<End x="63.9486" y="48.0272"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3229" y="57.5147"/>
					</TrackLine>
					<TrackLine>
						<End x="32.504" y="68.2505"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="13"/>
				<Subwire width="0.2">
					<Start x="44.82" y="23.02"/>
					<TrackLine>
						<End x="52.6644" y="33.4516"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1057" y="42.8815"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="12"/>
				<Subwire width="0.2">
					<Start x="60.06" y="23.02"/>
					<TrackLine>
						<End x="60.06" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="62.9008" y="41.5548"/>
					</TrackLine>
					<TrackLine>
						<End x="63.6463" y="49.7888"/>
					</TrackLine>
					<TrackLine>
						<End x="65.5587" y="52.9904"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7836" y="67.3739"/>
					</TrackLine>
					<TrackLine>
						<End x="90.3477" y="91.717"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="41.9519" y="46.9821"/>
					<TrackLine>
						<End x="45.9998" y="48.499"/>
					</TrackLine>
					<TrackLine>
						<End x="47.5233" y="49.4361"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="41.9519" y="46.9821"/>
					<TrackLine>
						<End x="36.6616" y="51.1813"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="11"/>
				<Subwire width="0.2">
					<Start x="37.2" y="20.48"/>
					<TrackLine>
						<End x="38.35" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="41.9519" y="46.9821"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="10"/>
				<Subwire width="0.2">
					<Start x="65.14" y="20.48"/>
					<TrackLine>
						<End x="65.14" y="20.63"/>
					</TrackLine>
					<TrackLine>
						<End x="66.29" y="22.3937"/>
					</TrackLine>
					<TrackLine>
						<End x="67.0371" y="42.283"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="89.2145" y="78.7978"/>
					<TrackLine>
						<End x="86.334" y="65.7104"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9056" y="64.3727"/>
					</TrackLine>
					<TrackLine>
						<End x="84.9405" y="62.0118"/>
					</TrackLine>
					<TrackLine>
						<End x="84.4086" y="61.4799"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6197" y="59.8866"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="32.12" y="17.84"/>
					<TrackLine>
						<End x="31.3785" y="16.8857"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="64.5543" y="49.4127"/>
					<TrackLine>
						<End x="66.8559" y="48.8208"/>
					</TrackLine>
					<TrackLine>
						<End x="70.8274" y="48.0217"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="32.12" y="17.84"/>
					<TrackLine>
						<End x="33.27" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="33.51" y="21.1063"/>
					</TrackLine>
					<TrackLine>
						<End x="34.66" y="23.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="31.3785" y="16.8857"/>
					<TrackLine>
						<End x="18.9437" y="19.18"/>
					</TrackLine>
					<TrackLine>
						<End x="18.27" y="19.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="18" y="21.0939"/>
					</TrackLine>
					<TrackLine>
						<End x="17.3439" y="21.75"/>
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
				<LayerRef name="Int 2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="32.12" y="15.3"/>
					<TrackLine>
						<End x="31.3785" y="16.8857"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="75.108" y="29.5023"/>
					<TrackLine>
						<End x="78.3177" y="28.0457"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9363" y="24.32"/>
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
				<LayerRef name="Int 2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="75.108" y="29.5023"/>
					<TrackLine>
						<End x="72.4038" y="39.8951"/>
					</TrackLine>
					<TrackLine>
						<End x="72.1536" y="44.1461"/>
					</TrackLine>
					<TrackLine>
						<End x="70.8274" y="48.0217"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="70.8274" y="48.0217"/>
					<TrackLine>
						<End x="81.6197" y="59.8866"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="54.9477" y="49.5015"/>
					<TrackLine>
						<End x="57.1995" y="57.8947"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1995" y="58.9973"/>
					</TrackLine>
					<TrackLine>
						<End x="57.177" y="59.0517"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7773" y="87.9372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="56.127" y="46.3881"/>
					<TrackLine>
						<End x="56.8557" y="48.8507"/>
					</TrackLine>
					<TrackLine>
						<End x="58.6995" y="57.5963"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9609" y="79.4045"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9609" y="80.1567"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4683" y="95.9482"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="58.0529" y="79.7806"/>
					<TrackLine>
						<End x="58.1995" y="59.1963"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1995" y="57.6957"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3557" y="48.9502"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3332" y="48.8958"/>
					</TrackLine>
					<TrackLine>
						<End x="55.219" y="46.7642"/>
					</TrackLine>
					<TrackLine>
						<End x="55.08" y="45.6842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="21.3557" y="66.3917"/>
					<TrackLine>
						<End x="22.6825" y="66.428"/>
					</TrackLine>
					<TrackLine>
						<End x="23.4347" y="66.428"/>
					</TrackLine>
					<TrackLine>
						<End x="43.9834" y="65.6047"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0302" y="65.4934"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="49.2856" y="63.6734"/>
					<TrackLine>
						<End x="24.8649" y="65.014"/>
					</TrackLine>
					<TrackLine>
						<End x="24.1127" y="65.014"/>
					</TrackLine>
					<TrackLine>
						<End x="23.4347" y="64.612"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1633" y="64.5381"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="23.0586" y="65.52"/>
					<TrackLine>
						<End x="25.0401" y="65.514"/>
					</TrackLine>
					<TrackLine>
						<End x="48.6541" y="64.5854"/>
					</TrackLine>
					<TrackLine>
						<End x="49.6617" y="64.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6097" y="64.2596"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="67.232" y="49.7288"/>
					<TrackLine>
						<End x="66.7985" y="50.1604"/>
					</TrackLine>
					<TrackLine>
						<End x="66.2666" y="50.6923"/>
					</TrackLine>
					<TrackLine>
						<End x="66.0362" y="52.0086"/>
					</TrackLine>
					<TrackLine>
						<End x="66.0362" y="52.7608"/>
					</TrackLine>
					<TrackLine>
						<End x="66.5681" y="53.2927"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7155" y="58.734"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2474" y="59.2659"/>
					</TrackLine>
					<TrackLine>
						<End x="76.067" y="62.1682"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9101" y="63.0662"/>
					</TrackLine>
					<TrackLine>
						<End x="79.3644" y="66.1682"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9923" y="66.796"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0941" y="71.5244"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="27.3735" y="63.3092"/>
					<TrackLine>
						<End x="48.1311" y="61.5467"/>
					</TrackLine>
					<TrackLine>
						<End x="49.6313" y="61.205"/>
					</TrackLine>
					<TrackLine>
						<End x="50.3079" y="61.205"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4995" y="61.3966"/>
					</TrackLine>
					<TrackLine>
						<End x="53.048" y="62.0895"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="67.1746" y="51.0684"/>
					<TrackLine>
						<End x="80.0583" y="62.845"/>
					</TrackLine>
					<TrackLine>
						<End x="80.6995" y="62.845"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7347" y="62.8596"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7599" y="64.1872"/>
					</TrackLine>
					<TrackLine>
						<End x="84.9976" y="64.7488"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="85.426" y="66.0865"/>
					<TrackLine>
						<End x="82.5303" y="64.6647"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5238" y="63.3189"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8826" y="63.3189"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8474" y="63.3043"/>
					</TrackLine>
					<TrackLine>
						<End x="66.9442" y="52.3847"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="17.1625" y="71.9711"/>
					<TrackLine>
						<End x="17.6223" y="71.9842"/>
					</TrackLine>
					<TrackLine>
						<End x="18.3745" y="71.9842"/>
					</TrackLine>
					<TrackLine>
						<End x="21.6292" y="71.0549"/>
					</TrackLine>
					<TrackLine>
						<End x="23.911" y="70.8392"/>
					</TrackLine>
					<TrackLine>
						<End x="35.7216" y="70.7364"/>
					</TrackLine>
					<TrackLine>
						<End x="36.4738" y="70.7364"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2525" y="71.3249"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="17.9984" y="71.0762"/>
					<TrackLine>
						<End x="20.3753" y="70.7645"/>
					</TrackLine>
					<TrackLine>
						<End x="21.454" y="70.5549"/>
					</TrackLine>
					<TrackLine>
						<End x="23.7358" y="70.3392"/>
					</TrackLine>
					<TrackLine>
						<End x="35.5464" y="70.2364"/>
					</TrackLine>
					<TrackLine>
						<End x="36.649" y="70.2364"/>
					</TrackLine>
					<TrackLine>
						<End x="43.4113" y="70.44"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7129" y="70.44"/>
					</TrackLine>
					<TrackLine>
						<End x="44.878" y="70.4207"/>
					</TrackLine>
					<TrackLine>
						<End x="45.627" y="70.4207"/>
					</TrackLine>
					<TrackLine>
						<End x="46.1567" y="70.9504"/>
					</TrackLine>
					<TrackLine>
						<End x="46.4546" y="71.969"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="46.7607" y="70.2756"/>
					<TrackLine>
						<End x="45.8038" y="69.9169"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7012" y="69.9169"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6134" y="69.94"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5108" y="69.94"/>
					</TrackLine>
					<TrackLine>
						<End x="36.7485" y="69.7364"/>
					</TrackLine>
					<TrackLine>
						<End x="35.4469" y="69.7364"/>
					</TrackLine>
					<TrackLine>
						<End x="23.6363" y="69.8392"/>
					</TrackLine>
					<TrackLine>
						<End x="21.3545" y="70.0549"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2001" y="70.2645"/>
					</TrackLine>
					<TrackLine>
						<End x="19.4479" y="70.2645"/>
					</TrackLine>
					<TrackLine>
						<End x="18.1864" y="69.8173"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="19.824" y="69.3565"/>
					<TrackLine>
						<End x="35.3474" y="69.2364"/>
					</TrackLine>
					<TrackLine>
						<End x="36.848" y="69.2364"/>
					</TrackLine>
					<TrackLine>
						<End x="43.686" y="69.44"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4382" y="69.44"/>
					</TrackLine>
					<TrackLine>
						<End x="44.6017" y="69.4169"/>
					</TrackLine>
					<TrackLine>
						<End x="46.3846" y="69.3676"/>
					</TrackLine>
					<TrackLine>
						<End x="47.1368" y="69.3676"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4237" y="69.9638"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="52.4614" y="60.2649"/>
					<TrackLine>
						<End x="51.2139" y="59.6719"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4617" y="59.6719"/>
					</TrackLine>
					<TrackLine>
						<End x="47.8564" y="60.5467"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4616" y="61.6284"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="25.0527" y="62.7889"/>
					<TrackLine>
						<End x="26.8377" y="62.5364"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9974" y="62.4012"/>
					</TrackLine>
					<TrackLine>
						<End x="48.0316" y="61.0467"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4183" y="60.6137"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8378" y="60.5799"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="24.4888" y="64.106"/>
					<TrackLine>
						<End x="26.9974" y="64.2172"/>
					</TrackLine>
					<TrackLine>
						<End x="27.7496" y="64.2172"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9696" y="62.0217"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="27.436" y="59.8864"/>
					<TrackLine>
						<End x="32.3003" y="58.7932"/>
					</TrackLine>
					<TrackLine>
						<End x="33.0525" y="58.7932"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3229" y="59.3307"/>
					</TrackLine>
					<TrackLine>
						<End x="45.0751" y="59.3307"/>
					</TrackLine>
					<TrackLine>
						<End x="47.1042" y="58.7307"/>
					</TrackLine>
					<TrackLine>
						<End x="47.8564" y="58.7307"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1544" y="58.8916"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="27.5479" y="58.5576"/>
					<TrackLine>
						<End x="34.0744" y="52.2342"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="34.0744" y="52.2342"/>
					<TrackLine>
						<End x="32.4976" y="45.6557"/>
					</TrackLine>
					<TrackLine>
						<End x="31.3776" y="43.9068"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4197" y="38.2683"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="55.7915" y="58.446"/>
					<TrackLine>
						<End x="54.5305" y="57.9836"/>
					</TrackLine>
					<TrackLine>
						<End x="34.0744" y="52.2342"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="18.8572" y="58.5744"/>
					<TrackLine>
						<End x="26.8377" y="60.7204"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0599" y="60.7944"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8121" y="60.7944"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3685" y="60.6875"/>
					</TrackLine>
					<TrackLine>
						<End x="45.2503" y="59.8307"/>
					</TrackLine>
					<TrackLine>
						<End x="47.4803" y="59.6387"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="50.7002" y="39.8336"/>
					<TrackLine>
						<End x="52.2036" y="45.9902"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6995" y="58.0699"/>
					</TrackLine>
					<TrackLine>
						<End x="56.6995" y="58.8221"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5177" y="64.6357"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9858" y="65.1676"/>
					</TrackLine>
					<TrackLine>
						<End x="49.4063" y="66.4014"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0621" y="68.532"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="103"/>
				<Subwire width="0.2">
					<Start x="51.7564" y="33.8277"/>
					<TrackLine>
						<End x="54.1977" y="43.2576"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6816" y="44.0458"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6816" y="44.798"/>
					</TrackLine>
					<TrackLine>
						<End x="54.172" y="45.3081"/>
					</TrackLine>
					<TrackLine>
						<End x="54.172" y="46.0603"/>
					</TrackLine>
					<TrackLine>
						<End x="55.8557" y="49.1254"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6995" y="57.7952"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6995" y="59.0968"/>
					</TrackLine>
					<TrackLine>
						<End x="56.938" y="65.9144"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="56"/>
				<Subwire width="0.2">
					<Start x="36.9026" y="44.8107"/>
					<TrackLine>
						<End x="39.3491" y="43.0726"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="56"/>
				<Subwire width="0.2">
					<Start x="39.3491" y="43.0726"/>
					<TrackLine>
						<End x="40.3" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="40.95" y="43.5"/>
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
						<End x="39.3491" y="43.0726"/>
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
						<End x="35.9946" y="44.4346"/>
					</TrackLine>
					<TrackLine>
						<End x="35.9946" y="45.1868"/>
					</TrackLine>
					<TrackLine>
						<End x="36.648" y="46.0692"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="55"/>
				<Subwire width="0.2">
					<Start x="36.648" y="46.0692"/>
					<TrackLine>
						<End x="40.3" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="40.95" y="44.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="54"/>
				<Subwire width="0.2">
					<Start x="34.1771" y="46.5083"/>
					<TrackLine>
						<End x="36.6957" y="49.3627"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="54"/>
				<Subwire width="0.2">
					<Start x="34.1771" y="46.5083"/>
					<TrackLine>
						<End x="30.4" y="47.25"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="47.25"/>
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
						<End x="34.4488" y="40.6248"/>
					</TrackLine>
					<TrackLine>
						<End x="34.4488" y="41.377"/>
					</TrackLine>
					<TrackLine>
						<End x="34.9353" y="43.8671"/>
					</TrackLine>
					<TrackLine>
						<End x="34.9353" y="44.6193"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1771" y="46.5083"/>
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
						<End x="60.0703" y="32.5881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="60.0703" y="32.5881"/>
					<TrackLine>
						<End x="52.3077" y="32.4197"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2051" y="32.4197"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9911" y="33.234"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2828" y="33.4434"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="63.3151" y="27.2959"/>
					<TrackLine>
						<End x="60.0703" y="32.5881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="26.25" y="28.25"/>
					<TrackLine>
						<End x="26.25" y="28.9"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2828" y="33.4434"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="58"/>
				<Subwire width="0.2">
					<Start x="29.2828" y="33.4434"/>
					<TrackLine>
						<End x="23.7577" y="44.6404"/>
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
						<End x="33.9488" y="40.4496"/>
					</TrackLine>
					<TrackLine>
						<End x="33.9488" y="41.5522"/>
					</TrackLine>
					<TrackLine>
						<End x="34.0273" y="44.2432"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="53"/>
				<Subwire width="0.2">
					<Start x="29.75" y="46"/>
					<TrackLine>
						<End x="30.4" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="30.6816" y="45.6557"/>
					</TrackLine>
					<TrackLine>
						<End x="31.2135" y="45.1238"/>
					</TrackLine>
					<TrackLine>
						<End x="34.0273" y="44.2432"/>
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
						<End x="32.2856" y="43.5307"/>
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
						<End x="32.2856" y="43.5307"/>
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
						<End x="32.5" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5" y="36.5"/>
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
						<End x="32.9185" y="35.55"/>
					</TrackLine>
					<TrackLine>
						<End x="33.4186" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8584" y="34.642"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="27.892" y="43.485"/>
					<TrackLine>
						<End x="29.1" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="29.75" y="42.25"/>
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
						<End x="31.3277" y="38.6444"/>
					</TrackLine>
					<TrackLine>
						<End x="31.3277" y="37.8922"/>
					</TrackLine>
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
				<NetRef name="50"/>
				<Subwire width="0.2">
					<Start x="32.5424" y="34.642"/>
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
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="57.75" y="36.5"/>
					<TrackLine>
						<End x="57.75" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="58.4328" y="43.5959"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="48"/>
				<Subwire width="0.2">
					<Start x="58.4328" y="43.5959"/>
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
				<NetRef name="15"/>
				<Subwire width="0.2">
					<Start x="42.0654" y="95.8518"/>
					<TrackLine>
						<End x="41.4194" y="96.8045"/>
					</TrackLine>
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
					<Start x="92.2" y="91.5"/>
					<TrackLine>
						<End x="91.55" y="91.5"/>
					</TrackLine>
					<TrackLine>
						<End x="90.3477" y="91.717"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="89.2145" y="78.7978"/>
					<TrackLine>
						<End x="91.55" y="86.5"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="86.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="36.75" y="99.25"/>
					<TrackLine>
						<End x="35.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="17.2535" y="43.1168"/>
					<TrackLine>
						<End x="15" y="28.9"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="45" y="44.375"/>
					<TrackLine>
						<End x="43.35" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="43.35" y="45.35"/>
					</TrackLine>
					<TrackLine>
						<End x="43.35" y="45.3914"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4" y="48.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="41.9314" y="49.3"/>
					</TrackLine>
					<TrackLine>
						<End x="38.9963" y="51.2752"/>
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
						<End x="52.1663" y="52.4243"/>
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
					<Start x="81.25" y="56.5"/>
					<TrackLine>
						<End x="81.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6197" y="59.8866"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="75.108" y="29.5023"/>
					<TrackLine>
						<End x="69.9" y="35.2336"/>
					</TrackLine>
					<TrackLine>
						<End x="69.9" y="35.275"/>
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
					<Start x="25.9937" y="48.928"/>
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
						<End x="31.2327" y="96.2605"/>
					</TrackLine>
					<TrackLine>
						<End x="32.5834" y="96.1806"/>
					</TrackLine>
					<TrackLine>
						<End x="33.3356" y="96.1806"/>
					</TrackLine>
					<TrackLine>
						<End x="34.6565" y="96.4553"/>
					</TrackLine>
					<TrackLine>
						<End x="35.1664" y="96.9652"/>
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
					<Start x="89.2145" y="78.7978"/>
					<TrackLine>
						<End x="90.85" y="76.7664"/>
					</TrackLine>
					<TrackLine>
						<End x="90.85" y="76.725"/>
					</TrackLine>
					<TrackLine>
						<End x="90.85" y="76.625"/>
					</TrackLine>
					<TrackLine>
						<End x="92.5" y="75.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="37.75" y="99.25"/>
					<TrackLine>
						<End x="36.75" y="99.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="25.9937" y="48.928"/>
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
						<End x="19.8674" y="84.0731"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="17.2535" y="43.1168"/>
					<TrackLine>
						<End x="23.3816" y="45.5484"/>
					</TrackLine>
					<TrackLine>
						<End x="24.0814" y="45.55"/>
					</TrackLine>
					<TrackLine>
						<End x="25" y="46.35"/>
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
					<Start x="29.75" y="48.5"/>
					<TrackLine>
						<End x="30.4" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="36.3196" y="50.2707"/>
					</TrackLine>
					<TrackLine>
						<End x="37.0377" y="50.2733"/>
					</TrackLine>
					<TrackLine>
						<End x="38.9963" y="51.2752"/>
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
						<End x="49.4119" y="87.321"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="45" y="44.375"/>
					<TrackLine>
						<End x="46.65" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="46.65" y="45.35"/>
					</TrackLine>
					<TrackLine>
						<End x="46.65" y="45.3914"/>
					</TrackLine>
					<TrackLine>
						<End x="47.55" y="47.5814"/>
					</TrackLine>
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
					<Start x="7.75" y="53"/>
					<TrackLine>
						<End x="8.625" y="51.35"/>
					</TrackLine>
					<TrackLine>
						<End x="8.625" y="51.25"/>
					</TrackLine>
					<TrackLine>
						<End x="8.625" y="50.4814"/>
					</TrackLine>
					<TrackLine>
						<End x="8.8138" y="50.0257"/>
					</TrackLine>
					<TrackLine>
						<End x="9.9007" y="48.9388"/>
					</TrackLine>
					<TrackLine>
						<End x="17.2535" y="43.1168"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="38.9963" y="51.2752"/>
					<TrackLine>
						<End x="39.8667" y="61.3824"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8667" y="62.6676"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8667" y="64.6176"/>
					</TrackLine>
					<TrackLine>
						<End x="39.7743" y="64.8406"/>
					</TrackLine>
					<TrackLine>
						<End x="38.8656" y="65.7493"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0414" y="66.375"/>
					</TrackLine>
					<TrackLine>
						<End x="38" y="66.375"/>
					</TrackLine>
					<TrackLine>
						<End x="37.9" y="66.375"/>
					</TrackLine>
					<TrackLine>
						<End x="36.25" y="67.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="11.8" y="23.02"/>
					<TrackLine>
						<End x="11.8" y="23.17"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="27.6"/>
					</TrackLine>
					<TrackLine>
						<End x="15" y="28.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="64.5543" y="49.4127"/>
					<TrackLine>
						<End x="52.1663" y="52.4243"/>
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
					<Start x="22.0053" y="71.9629"/>
					<TrackLine>
						<End x="23.9666" y="65.8961"/>
					</TrackLine>
					<TrackLine>
						<End x="23.9666" y="65.1439"/>
					</TrackLine>
					<TrackLine>
						<End x="23.5808" y="64.4821"/>
					</TrackLine>
					<TrackLine>
						<End x="23.5713" y="63.9868"/>
					</TrackLine>
					<TrackLine>
						<End x="22.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="22.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="86" y="41"/>
					<TrackLine>
						<End x="86.65" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="91.2657" y="40.025"/>
					</TrackLine>
					<TrackLine>
						<End x="93.3586" y="39.525"/>
					</TrackLine>
					<TrackLine>
						<End x="93.4" y="39.525"/>
					</TrackLine>
					<TrackLine>
						<End x="93.5" y="39.525"/>
					</TrackLine>
					<TrackLine>
						<End x="94.375" y="37.875"/>
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
						<End x="22.5313" y="55.2788"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0632" y="54.7469"/>
					</TrackLine>
					<TrackLine>
						<End x="24.4298" y="53.0588"/>
					</TrackLine>
					<TrackLine>
						<End x="24.4523" y="53.0044"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9937" y="48.928"/>
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
						<End x="68.5337" y="70.0816"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0656" y="70.6135"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8178" y="70.6135"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2399" y="69.95"/>
					</TrackLine>
					<TrackLine>
						<End x="73.65" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7407" y="68.1083"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7407" y="67.8044"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0286" y="67.1094"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5156" y="61.587"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0475" y="61.0551"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9846" y="60.2439"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6197" y="59.8866"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.2">
					<Start x="52.1663" y="52.4243"/>
					<TrackLine>
						<End x="49.8649" y="50.0253"/>
					</TrackLine>
					<TrackLine>
						<End x="49.65" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="49" y="48.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="60"/>
				<Subwire width="0.2">
					<Start x="29.6622" y="76.6728"/>
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
					<Start x="38.4215" y="95.5275"/>
					<TrackLine>
						<End x="36.1539" y="94.0233"/>
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
					<Start x="13.6664" y="70.8149"/>
					<TrackLine>
						<End x="13.6664" y="69.25"/>
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
					<Start x="13" y="68.25"/>
					<TrackLine>
						<End x="13" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="47"/>
				<Subwire width="0.2">
					<Start x="42.3274" y="97.1806"/>
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
					<Start x="43.4457" y="95.6127"/>
					<TrackLine>
						<End x="43.2354" y="97.5567"/>
					</TrackLine>
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
					<Start x="45.4591" y="95.9981"/>
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
					<Start x="48.3796" y="95.6788"/>
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
					<Start x="49.6957" y="95.6127"/>
					<TrackLine>
						<End x="48.65" y="94.2101"/>
					</TrackLine>
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
					<Start x="50.274" y="91.692"/>
					<TrackLine>
						<End x="49.3341" y="92.6"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5819" y="92.6"/>
					</TrackLine>
					<TrackLine>
						<End x="47.95" y="92.5"/>
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
					<Start x="37.2761" y="96.107"/>
					<TrackLine>
						<End x="36.6504" y="95.2269"/>
					</TrackLine>
					<TrackLine>
						<End x="35.8706" y="94.4471"/>
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
					<Start x="48.958" y="91.692"/>
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
					<Start x="34.2959" y="97.3258"/>
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
					<Start x="32.9595" y="97.0886"/>
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
					<Start x="31.6088" y="97.1685"/>
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
					<Start x="36.2286" y="96.7856"/>
					<TrackLine>
						<End x="36.1729" y="95.4565"/>
					</TrackLine>
					<TrackLine>
						<End x="35.641" y="94.9246"/>
					</TrackLine>
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
					<Start x="39.75" y="81.75"/>
					<TrackLine>
						<End x="39.75" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="37.8285" y="85.1545"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="36"/>
				<Subwire width="0.2">
					<Start x="35.2649" y="95.8326"/>
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
					<Start x="58.0718" y="44.7703"/>
					<TrackLine>
						<End x="59.55" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="60.2" y="44.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="58.0718" y="44.7703"/>
					<TrackLine>
						<End x="57.5248" y="43.972"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="39.75" y="99.25"/>
					<TrackLine>
						<End x="39.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8295" y="96.0788"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8295" y="94.9762"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7773" y="87.9372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="114"/>
				<Subwire width="0.2">
					<Start x="54.9477" y="49.5015"/>
					<TrackLine>
						<End x="57.035" y="46.7642"/>
					</TrackLine>
					<TrackLine>
						<End x="58.0718" y="44.7703"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="49" y="47.25"/>
					<TrackLine>
						<End x="49.65" y="47.25"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6629" y="47.0221"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4561" y="46.5922"/>
					</TrackLine>
					<TrackLine>
						<End x="56.127" y="46.3881"/>
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
						<End x="56.5137" y="42.3302"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5137" y="43.4328"/>
					</TrackLine>
					<TrackLine>
						<End x="56.127" y="46.3881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="113"/>
				<Subwire width="0.2">
					<Start x="53.5" y="96"/>
					<TrackLine>
						<End x="54.45" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4683" y="95.9482"/>
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
						<End x="55.4683" y="95.9482"/>
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
						<End x="66.7296" y="84.4048"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="112"/>
				<Subwire width="0.2">
					<Start x="66.25" y="81.75"/>
					<TrackLine>
						<End x="66.25" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="66.7296" y="84.4048"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="110"/>
				<Subwire width="0.2">
					<Start x="59.25" y="81.75"/>
					<TrackLine>
						<End x="58.25" y="81.75"/>
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
						<End x="56.0137" y="42.5054"/>
					</TrackLine>
					<TrackLine>
						<End x="56.0137" y="43.2576"/>
					</TrackLine>
					<TrackLine>
						<End x="55.08" y="45.6842"/>
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
						<End x="52.7355" y="46.5221"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4877" y="46.5221"/>
					</TrackLine>
					<TrackLine>
						<End x="55.08" y="45.6842"/>
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
						<End x="58.0529" y="79.7806"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="111"/>
				<Subwire width="0.2">
					<Start x="65.25" y="99.25"/>
					<TrackLine>
						<End x="65.25" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="64.8655" y="97.2829"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="111"/>
				<Subwire width="0.2">
					<Start x="66.25" y="99.25"/>
					<TrackLine>
						<End x="65.25" y="99.25"/>
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
						<End x="48.3883" y="59.2626"/>
					</TrackLine>
					<TrackLine>
						<End x="48.3883" y="60.0148"/>
					</TrackLine>
					<TrackLine>
						<End x="48.3776" y="63.2973"/>
					</TrackLine>
					<TrackLine>
						<End x="48.3776" y="64.0495"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0302" y="65.4934"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="45.1022" y="84.3431"/>
					<TrackLine>
						<End x="44.417" y="85.7289"/>
					</TrackLine>
					<TrackLine>
						<End x="44.35" y="85.8906"/>
					</TrackLine>
					<TrackLine>
						<End x="44.35" y="87.1094"/>
					</TrackLine>
					<TrackLine>
						<End x="44.35" y="88.1094"/>
					</TrackLine>
					<TrackLine>
						<End x="44.417" y="88.2711"/>
					</TrackLine>
					<TrackLine>
						<End x="44.85" y="88.9971"/>
					</TrackLine>
					<TrackLine>
						<End x="45.35" y="89.7899"/>
					</TrackLine>
					<TrackLine>
						<End x="46.05" y="90.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="90.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="94"/>
				<Subwire width="0.2">
					<Start x="74.7696" y="64.5089"/>
					<TrackLine>
						<End x="74.251" y="62.9204"/>
					</TrackLine>
					<TrackLine>
						<End x="74.251" y="62.1682"/>
					</TrackLine>
					<TrackLine>
						<End x="78.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="78.25" y="56.5"/>
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
						<End x="19.7652" y="58.1983"/>
					</TrackLine>
					<TrackLine>
						<End x="21.3557" y="66.3917"/>
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
						<End x="51.85" y="92.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="51.182" y="91.3159"/>
					</TrackLine>
					<TrackLine>
						<End x="50.6501" y="90.784"/>
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
					<Start x="46.3897" y="84.1098"/>
					<TrackLine>
						<End x="46.0102" y="84.7192"/>
					</TrackLine>
					<TrackLine>
						<End x="45.6837" y="85.0489"/>
					</TrackLine>
					<TrackLine>
						<End x="44.85" y="86.0029"/>
					</TrackLine>
					<TrackLine>
						<End x="44.85" y="86.9971"/>
					</TrackLine>
					<TrackLine>
						<End x="44.85" y="87.9971"/>
					</TrackLine>
					<TrackLine>
						<End x="45.35" y="88.7899"/>
					</TrackLine>
					<TrackLine>
						<End x="46.05" y="89.5"/>
					</TrackLine>
					<TrackLine>
						<End x="47" y="89.5"/>
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
						<End x="51.85" y="91.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6595" y="91.0863"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8797" y="90.3065"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8253" y="90.284"/>
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
				<NetRef name="93"/>
				<Subwire width="0.2">
					<Start x="75.159" y="62.5443"/>
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
					<Start x="22.1633" y="64.5381"/>
					<TrackLine>
						<End x="20.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="20.25" y="56.5"/>
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
						<End x="49.0616" y="61.6456"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0616" y="62.3978"/>
					</TrackLine>
					<TrackLine>
						<End x="49.2856" y="63.6734"/>
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
						<End x="23.0713" y="64.162"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0713" y="64.9142"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0586" y="65.52"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="92"/>
				<Subwire width="0.2">
					<Start x="46.5917" y="85.425"/>
					<TrackLine>
						<End x="45.7601" y="85.8"/>
					</TrackLine>
					<TrackLine>
						<End x="45.35" y="86.2101"/>
					</TrackLine>
					<TrackLine>
						<End x="45.35" y="86.7899"/>
					</TrackLine>
					<TrackLine>
						<End x="45.35" y="87.7899"/>
					</TrackLine>
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
					<Start x="76.0021" y="63.4423"/>
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
					<Start x="53.5" y="91"/>
					<TrackLine>
						<End x="52.55" y="91"/>
					</TrackLine>
					<TrackLine>
						<End x="51.163" y="89.8827"/>
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
						<End x="51.6496" y="60.2436"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6496" y="60.9162"/>
					</TrackLine>
					<TrackLine>
						<End x="51.64" y="61.5382"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6097" y="64.2596"/>
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
						<End x="25.5536" y="62.0045"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9607" y="62.4128"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9607" y="63.165"/>
					</TrackLine>
					<TrackLine>
						<End x="25.8968" y="64.6573"/>
					</TrackLine>
					<TrackLine>
						<End x="24.2871" y="71.7472"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="82.25" y="56.5"/>
					<TrackLine>
						<End x="82.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4355" y="59.5487"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4355" y="60.2245"/>
					</TrackLine>
					<TrackLine>
						<End x="82.2555" y="61.5225"/>
					</TrackLine>
					<TrackLine>
						<End x="82.1641" y="61.745"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8634" y="62.7548"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8634" y="63.8036"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8653" y="63.8082"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5796" y="64.5457"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7852" y="65.0419"/>
					</TrackLine>
					<TrackLine>
						<End x="83.4454" y="67.3815"/>
					</TrackLine>
					<TrackLine>
						<End x="83.4503" y="67.4062"/>
					</TrackLine>
					<TrackLine>
						<End x="83.4503" y="69.4778"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0941" y="71.5244"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="91"/>
				<Subwire width="0.2">
					<Start x="67.232" y="49.7288"/>
					<TrackLine>
						<End x="52.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="52.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="52.25" y="56.5"/>
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
						<End x="48.5039" y="86.9449"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0358" y="86.413"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0884" y="86.1223"/>
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
						<End x="51.85" y="88.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="50.0884" y="86.1223"/>
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
						<End x="52.8524" y="58.3417"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8449" y="58.3598"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8449" y="59.4234"/>
					</TrackLine>
					<TrackLine>
						<End x="52.8524" y="59.4415"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3201" y="59.9092"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3201" y="60.6206"/>
					</TrackLine>
					<TrackLine>
						<End x="53.048" y="62.0895"/>
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
						<End x="51.85" y="87.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8311" y="84.9866"/>
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
						<End x="26.528" y="60.2625"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3696" y="61.2523"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3735" y="63.3092"/>
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
						<End x="49.7123" y="85.2143"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8311" y="84.9866"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="90"/>
				<Subwire width="0.2">
					<Start x="83.25" y="56.5"/>
					<TrackLine>
						<End x="83.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="83.6824" y="58.9612"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0626" y="59.3414"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0626" y="60.0136"/>
					</TrackLine>
					<TrackLine>
						<End x="83.1377" y="62.0173"/>
					</TrackLine>
					<TrackLine>
						<End x="83.136" y="63.2792"/>
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
						<End x="36.0977" y="71.6444"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="84.25" y="56.5"/>
					<TrackLine>
						<End x="84.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0858" y="58.1219"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0858" y="58.7941"/>
					</TrackLine>
					<TrackLine>
						<End x="84.466" y="59.1743"/>
					</TrackLine>
					<TrackLine>
						<End x="84.466" y="60.1807"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0325" y="62.3879"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="36.0977" y="71.6444"/>
					<TrackLine>
						<End x="34.178" y="68.3584"/>
					</TrackLine>
					<TrackLine>
						<End x="34.178" y="67.6462"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1" y="66.9114"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1" y="66.4407"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1" y="66.1093"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3343" y="65.875"/>
					</TrackLine>
					<TrackLine>
						<End x="38.4498" y="65.375"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5448" y="65.35"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5871" y="65.3325"/>
					</TrackLine>
					<TrackLine>
						<End x="39.3575" y="64.5621"/>
					</TrackLine>
					<TrackLine>
						<End x="39.375" y="64.5198"/>
					</TrackLine>
					<TrackLine>
						<End x="39.375" y="62.5698"/>
					</TrackLine>
					<TrackLine>
						<End x="39.375" y="61.4802"/>
					</TrackLine>
					<TrackLine>
						<End x="39.3575" y="61.4379"/>
					</TrackLine>
					<TrackLine>
						<End x="38.5871" y="60.6675"/>
					</TrackLine>
					<TrackLine>
						<End x="34.8814" y="57.9702"/>
					</TrackLine>
					<TrackLine>
						<End x="27.7471" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="26.7529" y="54.35"/>
					</TrackLine>
					<TrackLine>
						<End x="25.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="25.25" y="55.55"/>
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
					<Start x="54.25" y="56.5"/>
					<TrackLine>
						<End x="54.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="53.2957" y="58.5359"/>
					</TrackLine>
					<TrackLine>
						<End x="53.2957" y="59.2473"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7634" y="59.715"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7709" y="59.7331"/>
					</TrackLine>
					<TrackLine>
						<End x="53.956" y="61.7134"/>
					</TrackLine>
					<TrackLine>
						<End x="53.956" y="62.4656"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1812" y="65.3803"/>
					</TrackLine>
					<TrackLine>
						<End x="53.1812" y="66.4829"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3016" y="67.2622"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="89"/>
				<Subwire width="0.2">
					<Start x="53.5" y="87"/>
					<TrackLine>
						<End x="54.45" y="87"/>
					</TrackLine>
					<TrackLine>
						<End x="55.15" y="86.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5196" y="85.443"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5196" y="84.557"/>
					</TrackLine>
					<TrackLine>
						<End x="54.893" y="83.9304"/>
					</TrackLine>
					<TrackLine>
						<End x="51.4819" y="83.0786"/>
					</TrackLine>
					<TrackLine>
						<End x="47.0405" y="82.2018"/>
					</TrackLine>
					<TrackLine>
						<End x="43.75" y="82.2018"/>
					</TrackLine>
					<TrackLine>
						<End x="43.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="84.9976" y="64.7488"/>
					<TrackLine>
						<End x="85.4405" y="62.9392"/>
					</TrackLine>
					<TrackLine>
						<End x="85.8052" y="58.8341"/>
					</TrackLine>
					<TrackLine>
						<End x="85.8052" y="58.0819"/>
					</TrackLine>
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
					<Start x="55.25" y="56.5"/>
					<TrackLine>
						<End x="55.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="54.9729" y="58.1069"/>
					</TrackLine>
					<TrackLine>
						<End x="54.973" y="59.2307"/>
					</TrackLine>
					<TrackLine>
						<End x="54.956" y="62.7403"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5892" y="65.9316"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="53.5" y="86"/>
					<TrackLine>
						<End x="54.45" y="86"/>
					</TrackLine>
					<TrackLine>
						<End x="55.0848" y="85.2629"/>
					</TrackLine>
					<TrackLine>
						<End x="55.0848" y="84.7371"/>
					</TrackLine>
					<TrackLine>
						<End x="54.7129" y="84.3652"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3824" y="83.5786"/>
					</TrackLine>
					<TrackLine>
						<End x="46.941" y="82.7018"/>
					</TrackLine>
					<TrackLine>
						<End x="45.8384" y="82.7018"/>
					</TrackLine>
					<TrackLine>
						<End x="44.5509" y="82.9351"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4965" y="82.9576"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0399" y="83.4"/>
					</TrackLine>
					<TrackLine>
						<End x="43.4601" y="83.4"/>
					</TrackLine>
					<TrackLine>
						<End x="42.75" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="42.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="67.1746" y="51.0684"/>
					<TrackLine>
						<End x="55.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="26.25" y="56.5"/>
					<TrackLine>
						<End x="26.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="27.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="34.5981" y="58.394"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3659" y="61.1417"/>
					</TrackLine>
					<TrackLine>
						<End x="38.8833" y="61.6591"/>
					</TrackLine>
					<TrackLine>
						<End x="38.8833" y="62.3909"/>
					</TrackLine>
					<TrackLine>
						<End x="38.8833" y="64.3409"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3659" y="64.8583"/>
					</TrackLine>
					<TrackLine>
						<End x="38.2728" y="64.875"/>
					</TrackLine>
					<TrackLine>
						<End x="34.1272" y="65.375"/>
					</TrackLine>
					<TrackLine>
						<End x="33.6" y="65.9022"/>
					</TrackLine>
					<TrackLine>
						<End x="33.6" y="66.6478"/>
					</TrackLine>
					<TrackLine>
						<End x="33.6" y="67.1185"/>
					</TrackLine>
					<TrackLine>
						<End x="33.756" y="67.7319"/>
					</TrackLine>
					<TrackLine>
						<End x="33.756" y="68.5746"/>
					</TrackLine>
					<TrackLine>
						<End x="34.7712" y="71.7125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="88"/>
				<Subwire width="0.2">
					<Start x="34.7712" y="71.7125"/>
					<TrackLine>
						<End x="36.1395" y="73.2065"/>
					</TrackLine>
					<TrackLine>
						<End x="42.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="42.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="56.7587" y="57.7895"/>
					<TrackLine>
						<End x="56.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="56.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="66.9442" y="52.3847"/>
					<TrackLine>
						<End x="56.7587" y="57.7895"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="87"/>
				<Subwire width="0.2">
					<Start x="35.2315" y="73.5826"/>
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
					<Start x="85.426" y="66.0865"/>
					<TrackLine>
						<End x="85.9056" y="65.1249"/>
					</TrackLine>
					<TrackLine>
						<End x="86.3052" y="59.0093"/>
					</TrackLine>
					<TrackLine>
						<End x="86.3052" y="57.9067"/>
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
					<Start x="53.5" y="85"/>
					<TrackLine>
						<End x="52.55" y="85"/>
					</TrackLine>
					<TrackLine>
						<End x="51.2072" y="84.0786"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7658" y="83.2018"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0136" y="83.2018"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7261" y="83.4351"/>
					</TrackLine>
					<TrackLine>
						<End x="44.2471" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="43.2529" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4601" y="83.4"/>
					</TrackLine>
					<TrackLine>
						<End x="41.75" y="82.7"/>
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
					<Start x="56.7587" y="57.7895"/>
					<TrackLine>
						<End x="56.6995" y="58.8221"/>
					</TrackLine>
					<TrackLine>
						<End x="56.03" y="65.5383"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9972" y="66.4829"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5684" y="68.8532"/>
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
						<End x="34.3685" y="58.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1622" y="61.6333"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3917" y="61.8628"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3917" y="62.1872"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3917" y="64.1372"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1622" y="64.3667"/>
					</TrackLine>
					<TrackLine>
						<End x="33.9502" y="64.875"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8988" y="64.8963"/>
					</TrackLine>
					<TrackLine>
						<End x="33.1213" y="65.6738"/>
					</TrackLine>
					<TrackLine>
						<End x="33.1" y="65.7252"/>
					</TrackLine>
					<TrackLine>
						<End x="33.1" y="66.8248"/>
					</TrackLine>
					<TrackLine>
						<End x="33.1" y="67.2955"/>
					</TrackLine>
					<TrackLine>
						<End x="33.334" y="67.9067"/>
					</TrackLine>
					<TrackLine>
						<End x="33.334" y="68.7481"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8632" y="72.0886"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2315" y="73.5826"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="77.8916" y="68.7024"/>
					<TrackLine>
						<End x="77.3854" y="69.76"/>
					</TrackLine>
					<TrackLine>
						<End x="75.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="75.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="17.1625" y="71.9711"/>
					<TrackLine>
						<End x="16.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="73.7229"/>
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
						<End x="10.4393" y="49.1667"/>
					</TrackLine>
					<TrackLine>
						<End x="10.1367" y="49.292"/>
					</TrackLine>
					<TrackLine>
						<End x="9.167" y="50.2617"/>
					</TrackLine>
					<TrackLine>
						<End x="9.0417" y="50.5643"/>
					</TrackLine>
					<TrackLine>
						<End x="9.0417" y="50.5842"/>
					</TrackLine>
					<TrackLine>
						<End x="9.0417" y="51.9158"/>
					</TrackLine>
					<TrackLine>
						<End x="9.0417" y="55.4357"/>
					</TrackLine>
					<TrackLine>
						<End x="9.35" y="70.0583"/>
					</TrackLine>
					<TrackLine>
						<End x="9.5692" y="70.5876"/>
					</TrackLine>
					<TrackLine>
						<End x="11.0093" y="72.2703"/>
					</TrackLine>
					<TrackLine>
						<End x="12.211" y="73.472"/>
					</TrackLine>
					<TrackLine>
						<End x="12.8167" y="73.7229"/>
					</TrackLine>
					<TrackLine>
						<End x="16.25" y="73.7229"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="86"/>
				<Subwire width="0.2">
					<Start x="45.25" y="74"/>
					<TrackLine>
						<End x="45.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="52.476" y="80.7218"/>
					</TrackLine>
					<TrackLine>
						<End x="55.3566" y="83.1642"/>
					</TrackLine>
					<TrackLine>
						<End x="57.097" y="84.9045"/>
					</TrackLine>
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
					<Start x="45.2525" y="71.3249"/>
					<TrackLine>
						<End x="45.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="45.25" y="74"/>
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
					<Start x="16.25" y="73.7229"/>
					<TrackLine>
						<End x="16.25" y="74"/>
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
						<End x="57.3434" y="84.5358"/>
					</TrackLine>
					<TrackLine>
						<End x="55.603" y="82.7955"/>
					</TrackLine>
					<TrackLine>
						<End x="52.7056" y="80.2443"/>
					</TrackLine>
					<TrackLine>
						<End x="46.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="46.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="46.25" y="74"/>
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
						<End x="15.3314" y="48.45"/>
					</TrackLine>
					<TrackLine>
						<End x="10.5222" y="49.5833"/>
					</TrackLine>
					<TrackLine>
						<End x="10.3727" y="49.6452"/>
					</TrackLine>
					<TrackLine>
						<End x="9.5202" y="50.4977"/>
					</TrackLine>
					<TrackLine>
						<End x="9.4583" y="50.6472"/>
					</TrackLine>
					<TrackLine>
						<End x="9.4583" y="50.6671"/>
					</TrackLine>
					<TrackLine>
						<End x="9.4583" y="51.8329"/>
					</TrackLine>
					<TrackLine>
						<End x="9.4583" y="55.3528"/>
					</TrackLine>
					<TrackLine>
						<End x="9.85" y="69.9589"/>
					</TrackLine>
					<TrackLine>
						<End x="9.9931" y="70.3044"/>
					</TrackLine>
					<TrackLine>
						<End x="11.4332" y="71.9871"/>
					</TrackLine>
					<TrackLine>
						<End x="12.4942" y="73.0481"/>
					</TrackLine>
					<TrackLine>
						<End x="12.9161" y="73.2229"/>
					</TrackLine>
					<TrackLine>
						<End x="14.4167" y="73.2229"/>
					</TrackLine>
					<TrackLine>
						<End x="14.8386" y="73.0481"/>
					</TrackLine>
					<TrackLine>
						<End x="15.8996" y="71.9871"/>
					</TrackLine>
					<TrackLine>
						<End x="16.2545" y="71.595"/>
					</TrackLine>
					<TrackLine>
						<End x="16.7864" y="71.0631"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5386" y="71.0631"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9984" y="71.0762"/>
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
						<End x="17.5228" y="72.841"/>
					</TrackLine>
					<TrackLine>
						<End x="18.0324" y="72.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="18.0324" y="71.6108"/>
					</TrackLine>
					<TrackLine>
						<End x="17.9984" y="71.0762"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="85"/>
				<Subwire width="0.2">
					<Start x="46.4546" y="71.969"/>
					<TrackLine>
						<End x="46.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="46.25" y="74"/>
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
					<Start x="78.8101" y="69.5403"/>
					<TrackLine>
						<End x="76.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="74"/>
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
						<End x="47.3626" y="72.3451"/>
					</TrackLine>
					<TrackLine>
						<End x="47.3626" y="71.5929"/>
					</TrackLine>
					<TrackLine>
						<End x="46.7607" y="70.2756"/>
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
					<Start x="77.25" y="74"/>
					<TrackLine>
						<End x="77.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="75.15" y="88.9078"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8547" y="89.6208"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0069" y="91.0544"/>
					</TrackLine>
					<TrackLine>
						<End x="73.583" y="91.7711"/>
					</TrackLine>
					<TrackLine>
						<End x="73.15" y="92.4971"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="93.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="71.95" y="94"/>
					</TrackLine>
					<TrackLine>
						<End x="71" y="94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="18.1864" y="69.8173"/>
					<TrackLine>
						<End x="18.9064" y="70.7001"/>
					</TrackLine>
					<TrackLine>
						<End x="18.9064" y="71.4523"/>
					</TrackLine>
					<TrackLine>
						<End x="18.5705" y="72.5224"/>
					</TrackLine>
					<TrackLine>
						<End x="18.548" y="72.5768"/>
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
					<Start x="17.5" y="47"/>
					<TrackLine>
						<End x="17.5" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5814" y="48.45"/>
					</TrackLine>
					<TrackLine>
						<End x="15.5446" y="48.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="15.5299" y="48.95"/>
					</TrackLine>
					<TrackLine>
						<End x="10.6072" y="50"/>
					</TrackLine>
					<TrackLine>
						<End x="9.875" y="50.7322"/>
					</TrackLine>
					<TrackLine>
						<End x="9.875" y="50.7737"/>
					</TrackLine>
					<TrackLine>
						<End x="9.875" y="51.7263"/>
					</TrackLine>
					<TrackLine>
						<End x="9.875" y="55.2678"/>
					</TrackLine>
					<TrackLine>
						<End x="10.35" y="69.8594"/>
					</TrackLine>
					<TrackLine>
						<End x="10.417" y="70.0211"/>
					</TrackLine>
					<TrackLine>
						<End x="11.8571" y="71.7039"/>
					</TrackLine>
					<TrackLine>
						<End x="12.7774" y="72.6242"/>
					</TrackLine>
					<TrackLine>
						<End x="13.0156" y="72.7229"/>
					</TrackLine>
					<TrackLine>
						<End x="14.3172" y="72.7229"/>
					</TrackLine>
					<TrackLine>
						<End x="14.5554" y="72.6242"/>
					</TrackLine>
					<TrackLine>
						<End x="15.4757" y="71.7039"/>
					</TrackLine>
					<TrackLine>
						<End x="15.777" y="71.3654"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5568" y="70.5856"/>
					</TrackLine>
					<TrackLine>
						<End x="18.1864" y="69.8173"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="84"/>
				<Subwire width="0.2">
					<Start x="77.25" y="74"/>
					<TrackLine>
						<End x="77.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="79.6701" y="69.8965"/>
					</TrackLine>
					<TrackLine>
						<End x="79.6701" y="69.1841"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5423" y="68.442"/>
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
						<End x="48.4237" y="69.9638"/>
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
					<Start x="18.75" y="47"/>
					<TrackLine>
						<End x="18.75" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="17.8314" y="48.45"/>
					</TrackLine>
					<TrackLine>
						<End x="16.7946" y="48.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="15.8278" y="49.3678"/>
					</TrackLine>
					<TrackLine>
						<End x="15.6293" y="49.45"/>
					</TrackLine>
					<TrackLine>
						<End x="10.7798" y="50.4167"/>
					</TrackLine>
					<TrackLine>
						<End x="10.2917" y="50.9048"/>
					</TrackLine>
					<TrackLine>
						<End x="10.2917" y="50.9463"/>
					</TrackLine>
					<TrackLine>
						<End x="10.2917" y="51.5537"/>
					</TrackLine>
					<TrackLine>
						<End x="10.2917" y="55.0952"/>
					</TrackLine>
					<TrackLine>
						<End x="10.85" y="69.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="12.2809" y="71.4206"/>
					</TrackLine>
					<TrackLine>
						<End x="13.0607" y="72.2004"/>
					</TrackLine>
					<TrackLine>
						<End x="13.1151" y="72.2229"/>
					</TrackLine>
					<TrackLine>
						<End x="14.2177" y="72.2229"/>
					</TrackLine>
					<TrackLine>
						<End x="14.2721" y="72.2004"/>
					</TrackLine>
					<TrackLine>
						<End x="15.0519" y="71.4206"/>
					</TrackLine>
					<TrackLine>
						<End x="15.3532" y="71.0821"/>
					</TrackLine>
					<TrackLine>
						<End x="16.2735" y="70.1618"/>
					</TrackLine>
					<TrackLine>
						<End x="17.8103" y="68.9093"/>
					</TrackLine>
					<TrackLine>
						<End x="18.5625" y="68.9093"/>
					</TrackLine>
					<TrackLine>
						<End x="19.824" y="69.3565"/>
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
						<End x="19.824" y="69.3565"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="78.25" y="74"/>
					<TrackLine>
						<End x="78.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1143" y="70.0917"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1222" y="70.0726"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4503" y="68.8181"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4503" y="68.0659"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9184" y="67.534"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1817" y="67.1318"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="83"/>
				<Subwire width="0.2">
					<Start x="79.1817" y="67.1318"/>
					<TrackLine>
						<End x="77.5333" y="67.8373"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0265" y="68.3441"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0265" y="68.648"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7386" y="69.343"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8547" y="70.8708"/>
					</TrackLine>
					<TrackLine>
						<End x="74.55" y="72.7601"/>
					</TrackLine>
					<TrackLine>
						<End x="74.55" y="73.3399"/>
					</TrackLine>
					<TrackLine>
						<End x="74.55" y="75.2399"/>
					</TrackLine>
					<TrackLine>
						<End x="74.65" y="84.1917"/>
					</TrackLine>
					<TrackLine>
						<End x="74.65" y="85.8083"/>
					</TrackLine>
					<TrackLine>
						<End x="74.65" y="88.8083"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4308" y="89.3376"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0069" y="90.0544"/>
					</TrackLine>
					<TrackLine>
						<End x="73.583" y="90.7711"/>
					</TrackLine>
					<TrackLine>
						<End x="73.15" y="91.4971"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="92.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="71.95" y="93"/>
					</TrackLine>
					<TrackLine>
						<End x="71" y="93"/>
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
						<End x="19.0814" y="48.45"/>
					</TrackLine>
					<TrackLine>
						<End x="18.0446" y="48.9439"/>
					</TrackLine>
					<TrackLine>
						<End x="16.111" y="49.7917"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7288" y="49.95"/>
					</TrackLine>
					<TrackLine>
						<End x="10.9593" y="50.85"/>
					</TrackLine>
					<TrackLine>
						<End x="10.725" y="51.0843"/>
					</TrackLine>
					<TrackLine>
						<End x="10.7083" y="51.1188"/>
					</TrackLine>
					<TrackLine>
						<End x="10.7083" y="51.3812"/>
					</TrackLine>
					<TrackLine>
						<End x="10.7083" y="54.8812"/>
					</TrackLine>
					<TrackLine>
						<End x="11.35" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="12.7584" y="71.191"/>
					</TrackLine>
					<TrackLine>
						<End x="13.2903" y="71.7229"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0425" y="71.7229"/>
					</TrackLine>
					<TrackLine>
						<End x="14.5744" y="71.191"/>
					</TrackLine>
					<TrackLine>
						<End x="14.9293" y="70.7989"/>
					</TrackLine>
					<TrackLine>
						<End x="15.9903" y="69.7379"/>
					</TrackLine>
					<TrackLine>
						<End x="17.5807" y="68.4318"/>
					</TrackLine>
					<TrackLine>
						<End x="17.6351" y="68.4093"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2629" y="68.0337"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="48.6245" y="68.2724"/>
					<TrackLine>
						<End x="49.3317" y="69.5877"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3317" y="70.3399"/>
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
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="79.25" y="74"/>
					<TrackLine>
						<End x="79.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4975" y="70.3478"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5742" y="70.1625"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9503" y="68.9933"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9503" y="67.8907"/>
					</TrackLine>
					<TrackLine>
						<End x="80.175" y="65.8324"/>
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
						<End x="20.732" y="69.7326"/>
					</TrackLine>
					<TrackLine>
						<End x="20.732" y="68.9804"/>
					</TrackLine>
					<TrackLine>
						<End x="20.2629" y="68.0337"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="32.75" y="81.75"/>
					<TrackLine>
						<End x="32.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="32.3899" y="79.7816"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="82"/>
				<Subwire width="0.2">
					<Start x="71" y="92"/>
					<TrackLine>
						<End x="71.95" y="92"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="91.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="73.15" y="90.4971"/>
					</TrackLine>
					<TrackLine>
						<End x="73.583" y="89.7711"/>
					</TrackLine>
					<TrackLine>
						<End x="74.0069" y="89.0544"/>
					</TrackLine>
					<TrackLine>
						<End x="74.15" y="88.7089"/>
					</TrackLine>
					<TrackLine>
						<End x="74.15" y="85.7089"/>
					</TrackLine>
					<TrackLine>
						<End x="74.15" y="84.2911"/>
					</TrackLine>
					<TrackLine>
						<End x="74.05" y="75.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="74.05" y="73.5471"/>
					</TrackLine>
					<TrackLine>
						<End x="74.05" y="72.5529"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4308" y="70.5876"/>
					</TrackLine>
					<TrackLine>
						<End x="76.351" y="69.084"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5693" y="68.5571"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5693" y="68.1681"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5788" y="68.1452"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3344" y="67.3896"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8056" y="66.2238"/>
					</TrackLine>
					<TrackLine>
						<End x="80.175" y="65.8324"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="26.4616" y="61.6284"/>
					<TrackLine>
						<End x="26.4607" y="63.3402"/>
					</TrackLine>
					<TrackLine>
						<End x="26.3968" y="64.7568"/>
					</TrackLine>
					<TrackLine>
						<End x="25.1921" y="72.1221"/>
					</TrackLine>
					<TrackLine>
						<End x="24.662" y="72.6522"/>
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
					<Start x="53.25" y="74"/>
					<TrackLine>
						<End x="53.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3936" y="67.6383"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3936" y="66.8861"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5177" y="64.6357"/>
					</TrackLine>
					<TrackLine>
						<End x="52.5177" y="63.8835"/>
					</TrackLine>
					<TrackLine>
						<End x="52.14" y="62.4656"/>
					</TrackLine>
					<TrackLine>
						<End x="52.14" y="61.7134"/>
					</TrackLine>
					<TrackLine>
						<End x="52.4614" y="60.2649"/>
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
						<End x="22.1738" y="51.4967"/>
					</TrackLine>
					<TrackLine>
						<End x="23.0443" y="52.4531"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="83.25" y="74"/>
					<TrackLine>
						<End x="83.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="82.2341" y="71.8806"/>
					</TrackLine>
					<TrackLine>
						<End x="82.2341" y="71.1682"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9503" y="69.3912"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9503" y="67.4928"/>
					</TrackLine>
					<TrackLine>
						<End x="82.3448" y="65.1295"/>
					</TrackLine>
					<TrackLine>
						<End x="82.2063" y="64.7951"/>
					</TrackLine>
					<TrackLine>
						<End x="81.4988" y="64.0531"/>
					</TrackLine>
					<TrackLine>
						<End x="81.4311" y="63.8896"/>
					</TrackLine>
					<TrackLine>
						<End x="81.4311" y="63.6764"/>
					</TrackLine>
					<TrackLine>
						<End x="81.3607" y="61.1519"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="81"/>
				<Subwire width="0.2">
					<Start x="71" y="88"/>
					<TrackLine>
						<End x="70.05" y="88"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6795" y="84.2044"/>
					</TrackLine>
					<TrackLine>
						<End x="57.5896" y="84.1672"/>
					</TrackLine>
					<TrackLine>
						<End x="56.7828" y="83.3604"/>
					</TrackLine>
					<TrackLine>
						<End x="53.25" y="74.95"/>
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
					<Start x="33.75" y="81.75"/>
					<TrackLine>
						<End x="33.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="33.2979" y="79.4055"/>
					</TrackLine>
					<TrackLine>
						<End x="32.766" y="78.8736"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2861" y="77.5808"/>
					</TrackLine>
					<TrackLine>
						<End x="24.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="24.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="24.25" y="74"/>
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
						<End x="50.7017" y="64.6357"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7017" y="63.8835"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8776" y="62.3978"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8776" y="61.6456"/>
					</TrackLine>
					<TrackLine>
						<End x="50.8378" y="60.5799"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="82.25" y="74"/>
					<TrackLine>
						<End x="82.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="81.7899" y="72.0758"/>
					</TrackLine>
					<TrackLine>
						<End x="81.782" y="72.0567"/>
					</TrackLine>
					<TrackLine>
						<End x="81.782" y="70.9921"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4503" y="69.2917"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4503" y="67.5923"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9043" y="65.2171"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8329" y="65.0447"/>
					</TrackLine>
					<TrackLine>
						<End x="81.1323" y="64.298"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9988" y="63.9756"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9988" y="63.8527"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4236" y="61.9631"/>
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
						<End x="23.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4601" y="83.4"/>
					</TrackLine>
					<TrackLine>
						<End x="33.0399" y="83.4"/>
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
					<Start x="71" y="89"/>
					<TrackLine>
						<End x="71.95" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="88.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="85.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="84.7101"/>
					</TrackLine>
					<TrackLine>
						<End x="72.55" y="75.7583"/>
					</TrackLine>
					<TrackLine>
						<End x="72.55" y="73.8583"/>
					</TrackLine>
					<TrackLine>
						<End x="72.55" y="72.2417"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7692" y="71.7124"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1884" y="68.3072"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1979" y="68.2843"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1979" y="67.8953"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4162" y="67.3684"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4236" y="61.9631"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="80"/>
				<Subwire width="0.2">
					<Start x="25.0527" y="62.7889"/>
					<TrackLine>
						<End x="25.3968" y="63.7299"/>
					</TrackLine>
					<TrackLine>
						<End x="25.3968" y="64.4821"/>
					</TrackLine>
					<TrackLine>
						<End x="24.9666" y="66.1708"/>
					</TrackLine>
					<TrackLine>
						<End x="23.3905" y="71.3758"/>
					</TrackLine>
					<TrackLine>
						<End x="23.3905" y="72.5097"/>
					</TrackLine>
					<TrackLine>
						<End x="23.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="23.25" y="74"/>
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
						<End x="23.0818" y="51.1206"/>
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
						<End x="22.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="32.2529" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="33.2471" y="83.9"/>
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
					<Start x="51.25" y="74"/>
					<TrackLine>
						<End x="51.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2017" y="64.8109"/>
					</TrackLine>
					<TrackLine>
						<End x="50.1936" y="63.2973"/>
					</TrackLine>
					<TrackLine>
						<End x="49.9696" y="62.0217"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="24.4888" y="64.106"/>
					<TrackLine>
						<End x="24.4666" y="66.0713"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9019" y="71.2004"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9019" y="72.3343"/>
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
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="23.75" y="47"/>
					<TrackLine>
						<End x="23.75" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="23.9898" y="50.7445"/>
					</TrackLine>
					<TrackLine>
						<End x="23.9898" y="51.4967"/>
					</TrackLine>
					<TrackLine>
						<End x="23.9523" y="52.8292"/>
					</TrackLine>
					<TrackLine>
						<End x="23.4204" y="53.3611"/>
					</TrackLine>
					<TrackLine>
						<End x="22.1552" y="54.3708"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="81.25" y="74"/>
					<TrackLine>
						<End x="81.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="81.33" y="70.9022"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9503" y="69.1923"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9503" y="67.6917"/>
					</TrackLine>
					<TrackLine>
						<End x="81.4639" y="65.3047"/>
					</TrackLine>
					<TrackLine>
						<End x="81.4595" y="65.2941"/>
					</TrackLine>
					<TrackLine>
						<End x="80.7133" y="64.5479"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1585" y="64.2008"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="79"/>
				<Subwire width="0.2">
					<Start x="71" y="90"/>
					<TrackLine>
						<End x="71.95" y="90"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="89.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="73.15" y="88.4971"/>
					</TrackLine>
					<TrackLine>
						<End x="73.15" y="85.4971"/>
					</TrackLine>
					<TrackLine>
						<End x="73.15" y="84.5029"/>
					</TrackLine>
					<TrackLine>
						<End x="73.05" y="75.6589"/>
					</TrackLine>
					<TrackLine>
						<End x="73.05" y="73.7589"/>
					</TrackLine>
					<TrackLine>
						<End x="73.05" y="72.3411"/>
					</TrackLine>
					<TrackLine>
						<End x="73.1931" y="71.9956"/>
					</TrackLine>
					<TrackLine>
						<End x="74.583" y="70.0211"/>
					</TrackLine>
					<TrackLine>
						<End x="75.5759" y="68.5661"/>
					</TrackLine>
					<TrackLine>
						<End x="75.655" y="68.3752"/>
					</TrackLine>
					<TrackLine>
						<End x="75.655" y="67.9862"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8037" y="67.6273"/>
					</TrackLine>
					<TrackLine>
						<End x="76.8165" y="66.6145"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2927" y="65.3225"/>
					</TrackLine>
					<TrackLine>
						<End x="79.5693" y="64.4469"/>
					</TrackLine>
					<TrackLine>
						<End x="80.1585" y="64.2008"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="76"/>
				<Subwire width="0.2">
					<Start x="56.4415" y="76.0709"/>
					<TrackLine>
						<End x="56.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="56.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="76"/>
				<Subwire width="0.2">
					<Start x="56.25" y="74"/>
					<TrackLine>
						<End x="56.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="58.55" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="59.5" y="69.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="75"/>
				<Subwire width="0.2">
					<Start x="42" y="69.25"/>
					<TrackLine>
						<End x="42" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="75"/>
				<Subwire width="0.2">
					<Start x="52.0999" y="81.6298"/>
					<TrackLine>
						<End x="44.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="44.55" y="75.2399"/>
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
				<NetRef name="72"/>
				<Subwire width="0.2">
					<Start x="84.9209" y="76.5657"/>
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
					<Start x="72" y="69.25"/>
					<TrackLine>
						<End x="72" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="71"/>
				<Subwire width="0.2">
					<Start x="69.4417" y="69.7055"/>
					<TrackLine>
						<End x="71.05" y="69.25"/>
					</TrackLine>
					<TrackLine>
						<End x="72" y="69.25"/>
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
						<End x="78.3501" y="89.2489"/>
					</TrackLine>
					<TrackLine>
						<End x="78.3501" y="90.0011"/>
					</TrackLine>
					<TrackLine>
						<End x="78.882" y="90.533"/>
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
					<Start x="42" y="67.25"/>
					<TrackLine>
						<End x="42.95" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="44.3595" y="66.5127"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="63.25" y="40.575"/>
					<TrackLine>
						<End x="62.425" y="40.3611"/>
					</TrackLine>
					<TrackLine>
						<End x="62.325" y="40.3611"/>
					</TrackLine>
					<TrackLine>
						<End x="61.1878" y="40.3611"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="87.922" y="34.8135"/>
					<TrackLine>
						<End x="86.1758" y="35.154"/>
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
						<End x="77.0662" y="91.958"/>
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
						<End x="38.7501" y="100.7995"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="59.5" y="68.25"/>
					<TrackLine>
						<End x="60.45" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="61.042" y="68.3474"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="46.25" y="56.5"/>
					<TrackLine>
						<End x="46.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0049" y="65.6234"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="17.3997" y="65.3096"/>
					<TrackLine>
						<End x="13.95" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="13" y="67.25"/>
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
					<Start x="80.25" y="74"/>
					<TrackLine>
						<End x="80.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8568" y="85.2071"/>
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
						<End x="27.0158" y="45.5195"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.75" y="81.75"/>
					<TrackLine>
						<End x="38.75" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1726" y="80.4008"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="87.922" y="34.8135"/>
					<TrackLine>
						<End x="89.05" y="36.1664"/>
					</TrackLine>
					<TrackLine>
						<End x="89.1086" y="36.225"/>
					</TrackLine>
					<TrackLine>
						<End x="89.15" y="36.225"/>
					</TrackLine>
					<TrackLine>
						<End x="89.25" y="36.225"/>
					</TrackLine>
					<TrackLine>
						<End x="90.125" y="37.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="86.1758" y="35.154"/>
					<TrackLine>
						<End x="81.5456" y="31.3289"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="74.8" y="48.5"/>
					<TrackLine>
						<End x="74.15" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="71.8178" y="48.0736"/>
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
						<End x="61.042" y="68.3474"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="41.9524" y="40.3712"/>
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
					<Start x="39.1726" y="80.4008"/>
					<TrackLine>
						<End x="39.464" y="80.1095"/>
					</TrackLine>
					<TrackLine>
						<End x="40.036" y="80.1095"/>
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
					<Start x="89.4331" y="91.5753"/>
					<TrackLine>
						<End x="89.4397" y="91.3409"/>
					</TrackLine>
					<TrackLine>
						<End x="89.9716" y="90.809"/>
					</TrackLine>
					<TrackLine>
						<End x="91.55" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2" y="90.25"/>
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
						<End x="81.5456" y="31.3289"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="61.1878" y="40.3611"/>
					<TrackLine>
						<End x="60.85" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="60.2" y="41"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="86" y="36.5"/>
					<TrackLine>
						<End x="86" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="86.1758" y="35.154"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="17.3997" y="65.3096"/>
					<TrackLine>
						<End x="17.4371" y="59.4734"/>
					</TrackLine>
					<TrackLine>
						<End x="17.4371" y="58.7212"/>
					</TrackLine>
					<TrackLine>
						<End x="17.25" y="57.45"/>
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
					<Start x="89.4331" y="91.5753"/>
					<TrackLine>
						<End x="89.4397" y="92.0931"/>
					</TrackLine>
					<TrackLine>
						<End x="89.9716" y="92.625"/>
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
					<Start x="21.25" y="74"/>
					<TrackLine>
						<End x="21.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="21.0973" y="72.339"/>
					</TrackLine>
					<TrackLine>
						<End x="21.0973" y="71.5868"/>
					</TrackLine>
					<TrackLine>
						<End x="21.232" y="69.9078"/>
					</TrackLine>
					<TrackLine>
						<End x="21.232" y="68.8052"/>
					</TrackLine>
					<TrackLine>
						<End x="21.1709" y="67.6576"/>
					</TrackLine>
					<TrackLine>
						<End x="20.639" y="67.1257"/>
					</TrackLine>
					<TrackLine>
						<End x="17.3997" y="65.3096"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="46.0049" y="65.6234"/>
					<TrackLine>
						<End x="44.3595" y="66.5127"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="39.1726" y="80.4008"/>
					<TrackLine>
						<End x="38.9907" y="80.2189"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0399" y="80.1"/>
					</TrackLine>
					<TrackLine>
						<End x="37.4601" y="80.1"/>
					</TrackLine>
					<TrackLine>
						<End x="37.1648" y="80.2143"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="68.25" y="40.5"/>
					<TrackLine>
						<End x="69.9" y="41.375"/>
					</TrackLine>
					<TrackLine>
						<End x="69.9" y="41.475"/>
					</TrackLine>
					<TrackLine>
						<End x="69.9" y="41.5164"/>
					</TrackLine>
					<TrackLine>
						<End x="70.3376" y="44.1461"/>
					</TrackLine>
					<TrackLine>
						<End x="71.8178" y="48.0736"/>
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
						<End x="55.8444" y="95.0402"/>
					</TrackLine>
					<TrackLine>
						<End x="63.8449" y="97.0398"/>
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
						<End x="37.1648" y="80.2143"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="91.75" y="32.4"/>
					<TrackLine>
						<End x="88.15" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="88.15" y="34.15"/>
					</TrackLine>
					<TrackLine>
						<End x="88.15" y="34.1914"/>
					</TrackLine>
					<TrackLine>
						<End x="87.922" y="34.8135"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="61.1878" y="40.3611"/>
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
					<Start x="41.9524" y="40.3712"/>
					<TrackLine>
						<End x="43.25" y="40.3712"/>
					</TrackLine>
					<TrackLine>
						<End x="43.35" y="40.3712"/>
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
					<Start x="12" y="53"/>
					<TrackLine>
						<End x="12.875" y="54.65"/>
					</TrackLine>
					<TrackLine>
						<End x="12.975" y="54.65"/>
					</TrackLine>
					<TrackLine>
						<End x="13.0164" y="54.65"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5399" y="54.85"/>
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
					<Start x="81" y="94"/>
					<TrackLine>
						<End x="81" y="92.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="63.25" y="40.575"/>
					<TrackLine>
						<End x="64.075" y="40.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="64.175" y="40.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="66.5" y="40.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="66.6" y="40.5375"/>
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
					<Start x="81.5456" y="31.3289"/>
					<TrackLine>
						<End x="75.2712" y="33.55"/>
					</TrackLine>
					<TrackLine>
						<End x="74.889" y="33.7083"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8583" y="34.739"/>
					</TrackLine>
					<TrackLine>
						<End x="70.1" y="39.5664"/>
					</TrackLine>
					<TrackLine>
						<End x="70.0414" y="39.625"/>
					</TrackLine>
					<TrackLine>
						<End x="70" y="39.625"/>
					</TrackLine>
					<TrackLine>
						<End x="69.9" y="39.625"/>
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
					<Start x="80.8568" y="85.2071"/>
					<TrackLine>
						<End x="81.9814" y="85.7"/>
					</TrackLine>
					<TrackLine>
						<End x="82.45" y="86.1686"/>
					</TrackLine>
					<TrackLine>
						<End x="82.45" y="86.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="82.45" y="88.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="40.75" y="81.75"/>
					<TrackLine>
						<End x="40.75" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="37.8693" y="87.5611"/>
					</TrackLine>
					<TrackLine>
						<End x="37.5275" y="88.2461"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="61.042" y="68.3474"/>
					<TrackLine>
						<End x="64.4" y="63.9336"/>
					</TrackLine>
					<TrackLine>
						<End x="64.4586" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="64.5" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="64.6" y="63.875"/>
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
					<Start x="77.0662" y="91.958"/>
					<TrackLine>
						<End x="77.8501" y="89.0737"/>
					</TrackLine>
					<TrackLine>
						<End x="77.8726" y="89.0193"/>
					</TrackLine>
					<TrackLine>
						<End x="79.55" y="86.1686"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0186" y="85.7"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8568" y="85.2071"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="50.25" y="74"/>
					<TrackLine>
						<End x="50.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8317" y="69.4125"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5325" y="67.8963"/>
					</TrackLine>
					<TrackLine>
						<End x="49.0006" y="67.3644"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0049" y="65.6234"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="64.25" y="99.25"/>
					<TrackLine>
						<End x="64.25" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="63.9575" y="97.659"/>
					</TrackLine>
					<TrackLine>
						<End x="63.8449" y="97.0398"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="37.1648" y="80.2143"/>
					<TrackLine>
						<End x="33.3857" y="72.3182"/>
					</TrackLine>
					<TrackLine>
						<End x="33.3632" y="72.2638"/>
					</TrackLine>
					<TrackLine>
						<End x="32.072" y="68.9924"/>
					</TrackLine>
					<TrackLine>
						<End x="31.674" y="68.5943"/>
					</TrackLine>
					<TrackLine>
						<End x="31.45" y="68.25"/>
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
						<End x="75.5399" y="58.15"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9633" y="58.734"/>
					</TrackLine>
					<TrackLine>
						<End x="71.4314" y="59.2659"/>
					</TrackLine>
					<TrackLine>
						<End x="71.4314" y="60.0181"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9633" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2399" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="73.65" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="73.65" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="73.65" y="66.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="72.95" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="72" y="67.25"/>
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
						<End x="21.9601" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="31.9789" y="84.333"/>
					</TrackLine>
					<TrackLine>
						<End x="32.1406" y="84.4"/>
					</TrackLine>
					<TrackLine>
						<End x="33.3594" y="84.4"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3594" y="84.4"/>
					</TrackLine>
					<TrackLine>
						<End x="34.5211" y="84.333"/>
					</TrackLine>
					<TrackLine>
						<End x="35.2471" y="83.9"/>
					</TrackLine>
					<TrackLine>
						<End x="36.0399" y="83.4"/>
					</TrackLine>
					<TrackLine>
						<End x="36.75" y="82.7"/>
					</TrackLine>
					<TrackLine>
						<End x="36.75" y="81.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="53.5" y="95"/>
					<TrackLine>
						<End x="52.55" y="95"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0399" y="100.9"/>
					</TrackLine>
					<TrackLine>
						<End x="40.0399" y="100.9"/>
					</TrackLine>
					<TrackLine>
						<End x="39.4601" y="100.9"/>
					</TrackLine>
					<TrackLine>
						<End x="38.7501" y="100.7995"/>
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
						<End x="89.4331" y="91.5753"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="45" y="40.125"/>
					<TrackLine>
						<End x="46.65" y="39.25"/>
					</TrackLine>
					<TrackLine>
						<End x="46.65" y="39.15"/>
					</TrackLine>
					<TrackLine>
						<End x="46.65" y="39.1086"/>
					</TrackLine>
					<TrackLine>
						<End x="48.2" y="35.5186"/>
					</TrackLine>
					<TrackLine>
						<End x="49.479" y="34.197"/>
					</TrackLine>
					<TrackLine>
						<End x="50.2588" y="33.4172"/>
					</TrackLine>
					<TrackLine>
						<End x="51.3803" y="32.9197"/>
					</TrackLine>
					<TrackLine>
						<End x="52.1325" y="32.9197"/>
					</TrackLine>
					<TrackLine>
						<End x="58.0814" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="59" y="35.85"/>
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
					<Start x="71" y="91"/>
					<TrackLine>
						<End x="71.95" y="91"/>
					</TrackLine>
					<TrackLine>
						<End x="72.65" y="90.2899"/>
					</TrackLine>
					<TrackLine>
						<End x="73.15" y="89.4971"/>
					</TrackLine>
					<TrackLine>
						<End x="73.583" y="88.7711"/>
					</TrackLine>
					<TrackLine>
						<End x="73.65" y="88.6094"/>
					</TrackLine>
					<TrackLine>
						<End x="73.65" y="85.6094"/>
					</TrackLine>
					<TrackLine>
						<End x="73.65" y="84.3906"/>
					</TrackLine>
					<TrackLine>
						<End x="73.55" y="75.5594"/>
					</TrackLine>
					<TrackLine>
						<End x="73.55" y="73.6594"/>
					</TrackLine>
					<TrackLine>
						<End x="73.55" y="72.4406"/>
					</TrackLine>
					<TrackLine>
						<End x="73.617" y="72.2789"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0069" y="70.3044"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9635" y="68.8251"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1122" y="68.4662"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1122" y="68.0772"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1913" y="67.8863"/>
					</TrackLine>
					<TrackLine>
						<End x="77.0755" y="67.0021"/>
					</TrackLine>
					<TrackLine>
						<End x="78.576" y="65.7463"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8371" y="65.0166"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5129" y="65.0166"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9908" y="65.4945"/>
					</TrackLine>
					<TrackLine>
						<End x="81.4503" y="67.7912"/>
					</TrackLine>
					<TrackLine>
						<End x="81.4503" y="69.0928"/>
					</TrackLine>
					<TrackLine>
						<End x="80.878" y="70.8123"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="80.25" y="74"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="66.25" y="63"/>
					<TrackLine>
						<End x="67.9" y="63.875"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="63.975"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="64.0164"/>
					</TrackLine>
					<TrackLine>
						<End x="70.35" y="66.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="71.05" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="72" y="67.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="63.8449" y="97.0398"/>
					<TrackLine>
						<End x="63.9575" y="96.9068"/>
					</TrackLine>
					<TrackLine>
						<End x="64.4894" y="96.3749"/>
					</TrackLine>
					<TrackLine>
						<End x="65.2416" y="96.3749"/>
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
						<End x="77.0662" y="91.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="31.45" y="68.25"/>
					<TrackLine>
						<End x="31.6736" y="67.9065"/>
					</TrackLine>
					<TrackLine>
						<End x="32.0724" y="67.5078"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6" y="65.6258"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6974" y="65.3906"/>
					</TrackLine>
					<TrackLine>
						<End x="33.6156" y="64.4724"/>
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
					<Start x="40" y="36.5"/>
					<TrackLine>
						<End x="40" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="39.0814" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="34.2345" y="33.734"/>
					</TrackLine>
					<TrackLine>
						<End x="33.4823" y="33.734"/>
					</TrackLine>
					<TrackLine>
						<End x="32.1663" y="33.734"/>
					</TrackLine>
					<TrackLine>
						<End x="29.6686" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="29.2" y="35.5186"/>
					</TrackLine>
					<TrackLine>
						<End x="26.984" y="43.1089"/>
					</TrackLine>
					<TrackLine>
						<End x="26.984" y="43.8611"/>
					</TrackLine>
					<TrackLine>
						<End x="27.0158" y="45.5195"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="92.5" y="71.5"/>
					<TrackLine>
						<End x="94.15" y="72.375"/>
					</TrackLine>
					<TrackLine>
						<End x="94.15" y="72.475"/>
					</TrackLine>
					<TrackLine>
						<End x="94.15" y="72.5164"/>
					</TrackLine>
					<TrackLine>
						<End x="94.65" y="74.6093"/>
					</TrackLine>
					<TrackLine>
						<End x="94.65" y="74.9407"/>
					</TrackLine>
					<TrackLine>
						<End x="94.65" y="76.8907"/>
					</TrackLine>
					<TrackLine>
						<End x="94.15" y="92.0299"/>
					</TrackLine>
					<TrackLine>
						<End x="94.1439" y="92.0446"/>
					</TrackLine>
					<TrackLine>
						<End x="93.65" y="93.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="92.85" y="94"/>
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
					<Start x="71.8178" y="48.0736"/>
					<TrackLine>
						<End x="67.8522" y="52.7608"/>
					</TrackLine>
					<TrackLine>
						<End x="67.3203" y="53.2927"/>
					</TrackLine>
					<TrackLine>
						<End x="58.2601" y="60.55"/>
					</TrackLine>
					<TrackLine>
						<End x="57.85" y="60.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="57.85" y="61.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="57.85" y="67.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="58.55" y="68.25"/>
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
					<Start x="76.25" y="56.5"/>
					<TrackLine>
						<End x="76.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="85.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="86.95" y="55.2601"/>
					</TrackLine>
					<TrackLine>
						<End x="87.85" y="67.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="88.55" y="68.25"/>
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
					<Start x="40.95" y="41"/>
					<TrackLine>
						<End x="41.6" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="41.9524" y="40.3712"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.75" y="99.25"/>
					<TrackLine>
						<End x="38.75" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="39.3295" y="95.9036"/>
					</TrackLine>
					<TrackLine>
						<End x="39.3295" y="95.1514"/>
					</TrackLine>
					<TrackLine>
						<End x="37.5275" y="88.2461"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.2">
					<Start x="38.7501" y="100.7995"/>
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
						<End x="20.1836" y="96.6"/>
					</TrackLine>
					<TrackLine>
						<End x="20.125" y="96.5414"/>
					</TrackLine>
					<TrackLine>
						<End x="20.125" y="96.5"/>
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
						<End x="93.65" y="89.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="93.65" y="91.8314"/>
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
					<Start x="36.5125" y="85.1545"/>
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
					<Start x="81" y="87.75"/>
					<TrackLine>
						<End x="80.35" y="87.75"/>
					</TrackLine>
					<TrackLine>
						<End x="79.55" y="88.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2581" y="89.625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="54.25" y="74"/>
					<TrackLine>
						<End x="54.25" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1604" y="69.4045"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1604" y="68.3019"/>
					</TrackLine>
					<TrackLine>
						<End x="54.2096" y="67.6383"/>
					</TrackLine>
					<TrackLine>
						<End x="54.2096" y="66.8861"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6812" y="66.3077"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6812" y="65.5555"/>
					</TrackLine>
					<TrackLine>
						<End x="54.456" y="62.6408"/>
					</TrackLine>
					<TrackLine>
						<End x="54.456" y="61.5382"/>
					</TrackLine>
					<TrackLine>
						<End x="54.3694" y="59.6141"/>
					</TrackLine>
					<TrackLine>
						<End x="54.1544" y="58.8916"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="85.7527" y="86.85"/>
					<TrackLine>
						<End x="81.65" y="90.25"/>
					</TrackLine>
					<TrackLine>
						<End x="81" y="90.25"/>
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
						<End x="25.6726" y="72.3529"/>
					</TrackLine>
					<TrackLine>
						<End x="25.6951" y="72.2985"/>
					</TrackLine>
					<TrackLine>
						<End x="28.2815" y="63.6853"/>
					</TrackLine>
					<TrackLine>
						<End x="28.2815" y="62.9331"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8696" y="61.0771"/>
					</TrackLine>
					<TrackLine>
						<End x="27.436" y="59.8864"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="68"/>
				<Subwire width="0.2">
					<Start x="85.7527" y="86.85"/>
					<TrackLine>
						<End x="84.0129" y="76.9418"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0129" y="76.1896"/>
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
					<Start x="92.2" y="89"/>
					<TrackLine>
						<End x="91.55" y="89"/>
					</TrackLine>
					<TrackLine>
						<End x="85.7527" y="86.85"/>
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
						<End x="57.807" y="83.7696"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1804" y="83.143"/>
					</TrackLine>
					<TrackLine>
						<End x="54.25" y="74.95"/>
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
					<Start x="83.2512" y="59.6775"/>
					<TrackLine>
						<End x="82.7423" y="61.698"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7238" y="61.7427"/>
					</TrackLine>
					<TrackLine>
						<End x="82.6694" y="61.7971"/>
					</TrackLine>
					<TrackLine>
						<End x="82.6509" y="61.8418"/>
					</TrackLine>
					<TrackLine>
						<End x="82.2957" y="62.9311"/>
					</TrackLine>
					<TrackLine>
						<End x="82.2957" y="63.6273"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9531" y="64.2961"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2257" y="64.9543"/>
					</TrackLine>
					<TrackLine>
						<End x="83.9262" y="67.2357"/>
					</TrackLine>
					<TrackLine>
						<End x="83.9503" y="67.357"/>
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
						<End x="16.5291" y="59.0973"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="16.25" y="56.5"/>
					<TrackLine>
						<End x="16.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5291" y="59.0973"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="51.4136" y="44.1336"/>
					<TrackLine>
						<End x="52.75" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="52.75" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="51.4136" y="44.1336"/>
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
				<NetRef name="107"/>
				<Subwire width="0.2">
					<Start x="53.1116" y="45.6141"/>
					<TrackLine>
						<End x="51.4136" y="44.1336"/>
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
						<End x="54.6604" y="69.2293"/>
					</TrackLine>
					<TrackLine>
						<End x="54.6604" y="68.4771"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4972" y="66.3077"/>
					</TrackLine>
					<TrackLine>
						<End x="55.53" y="65.3631"/>
					</TrackLine>
					<TrackLine>
						<End x="55.7915" y="58.446"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="29.75" y="41"/>
					<TrackLine>
						<End x="30.4" y="41"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4197" y="38.2683"/>
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
						<End x="28.7815" y="63.8605"/>
					</TrackLine>
					<TrackLine>
						<End x="28.7815" y="62.7579"/>
					</TrackLine>
					<TrackLine>
						<End x="28.344" y="59.5103"/>
					</TrackLine>
					<TrackLine>
						<End x="27.5479" y="58.5576"/>
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
						<End x="30.4197" y="38.2683"/>
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
						<End x="84.4503" y="67.3077"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0896" y="65.1249"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0896" y="64.3727"/>
					</TrackLine>
					<TrackLine>
						<End x="84.9405" y="62.764"/>
					</TrackLine>
					<TrackLine>
						<End x="85.1592" y="60.3283"/>
					</TrackLine>
					<TrackLine>
						<End x="85.1592" y="59.0267"/>
					</TrackLine>
					<TrackLine>
						<End x="85.0605" y="58.7885"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8972" y="58.458"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="67"/>
				<Subwire width="0.2">
					<Start x="71" y="86"/>
					<TrackLine>
						<End x="70.05" y="86"/>
					</TrackLine>
					<TrackLine>
						<End x="66.3535" y="85.3128"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9871" y="83.3348"/>
					</TrackLine>
					<TrackLine>
						<End x="57.6152" y="82.9629"/>
					</TrackLine>
					<TrackLine>
						<End x="55.5335" y="76.447"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="55.25" y="74"/>
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
						<End x="50.8645" y="34.8027"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="49" y="43.5"/>
					<TrackLine>
						<End x="49.65" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="50.45" y="42.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6082" y="40.2097"/>
					</TrackLine>
					<TrackLine>
						<End x="51.6082" y="39.4575"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="51.5" y="36.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="30.5" y="62.25"/>
					<TrackLine>
						<End x="30.5" y="61.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="106"/>
				<Subwire width="0.2">
					<Start x="33.9924" y="59.7795"/>
					<TrackLine>
						<End x="33.0525" y="60.6092"/>
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
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="18.25" y="56.5"/>
					<TrackLine>
						<End x="18.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="18.8572" y="58.5744"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="66"/>
				<Subwire width="0.2">
					<Start x="47.25" y="56.5"/>
					<TrackLine>
						<End x="47.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="47.4803" y="59.6387"/>
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
						<End x="55.9544" y="85.5705"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9544" y="84.4295"/>
					</TrackLine>
					<TrackLine>
						<End x="55.9172" y="84.3396"/>
					</TrackLine>
					<TrackLine>
						<End x="55.1104" y="83.5328"/>
					</TrackLine>
					<TrackLine>
						<End x="55.0205" y="83.4956"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7238" y="82.5378"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7529" y="76.15"/>
					</TrackLine>
					<TrackLine>
						<End x="44.05" y="75.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="69.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="66.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="40.35" y="65.9601"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3583" y="64.7154"/>
					</TrackLine>
					<TrackLine>
						<End x="40.3583" y="60.9635"/>
					</TrackLine>
					<TrackLine>
						<End x="44.55" y="55.2601"/>
					</TrackLine>
					<TrackLine>
						<End x="44.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9601" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="46.5399" y="54.85"/>
					</TrackLine>
					<TrackLine>
						<End x="47.25" y="55.55"/>
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
						<End x="72.3394" y="59.642"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="104"/>
				<Subwire width="0.2">
					<Start x="50.7002" y="39.8336"/>
					<TrackLine>
						<End x="50.25" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="50.25" y="36.5"/>
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
						<End x="50.45" y="41.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="50.7002" y="39.8336"/>
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
						<End x="49.9565" y="34.4266"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4884" y="33.8947"/>
					</TrackLine>
					<TrackLine>
						<End x="51.7564" y="33.8277"/>
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
					<Start x="84.75" y="36.5"/>
					<TrackLine>
						<End x="84.75" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8534" y="37.8819"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8534" y="38.6341"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3916" y="40.2326"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="74.8" y="46"/>
					<TrackLine>
						<End x="74.15" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="73.35" y="45.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="72.4038" y="40.6473"/>
					</TrackLine>
					<TrackLine>
						<End x="72.4038" y="39.8951"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2" y="35.2207"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2822" y="35.0222"/>
					</TrackLine>
					<TrackLine>
						<End x="75.1722" y="34.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="75.3707" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="77.8707" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1293" y="34.05"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7799" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7946" y="34.5561"/>
					</TrackLine>
					<TrackLine>
						<End x="83.8314" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="84.75" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="84.75" y="36.5"/>
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
						<End x="44.699" y="58.4227"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="102"/>
				<Subwire width="0.2">
					<Start x="44.699" y="58.4227"/>
					<TrackLine>
						<End x="45.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="45.25" y="56.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="59.5" y="62.25"/>
					<TrackLine>
						<End x="59.5" y="61.25"/>
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
						<End x="83.9454" y="38.258"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="83.5" y="36.5"/>
					<TrackLine>
						<End x="83.5" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5814" y="35.05"/>
					</TrackLine>
					<TrackLine>
						<End x="79.0299" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9701" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4701" y="34.55"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4554" y="34.5561"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7061" y="35.3054"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7" y="35.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7" y="36.3799"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7" y="37.6799"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7061" y="37.6946"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="40.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="41.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="43.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="75.45" y="44.75"/>
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
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="101"/>
				<Subwire width="0.2">
					<Start x="75.45" y="44.75"/>
					<TrackLine>
						<End x="76.25" y="45.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="46.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="76.25" y="48.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7814" y="49.3"/>
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
				<NetRef name="100"/>
				<Subwire width="0.2">
					<Start x="86" y="42.25"/>
					<TrackLine>
						<End x="86.65" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="90.0718" y="45.1293"/>
					</TrackLine>
					<TrackLine>
						<End x="90.6037" y="45.6612"/>
					</TrackLine>
					<TrackLine>
						<End x="90.6037" y="46.4134"/>
					</TrackLine>
					<TrackLine>
						<End x="89.52" y="49.4"/>
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
						<End x="83.4836" y="40.6087"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0155" y="41.1406"/>
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
					<Start x="81" y="36.5"/>
					<TrackLine>
						<End x="81" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8773" y="38.264"/>
					</TrackLine>
					<TrackLine>
						<End x="83.0061" y="40.8383"/>
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
				<NetRef name="99"/>
				<Subwire width="0.2">
					<Start x="86" y="43.5"/>
					<TrackLine>
						<End x="86.65" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="88.1499" y="44.1832"/>
					</TrackLine>
					<TrackLine>
						<End x="88.6818" y="44.7151"/>
					</TrackLine>
					<TrackLine>
						<End x="89.6957" y="46.0373"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="86" y="44.75"/>
					<TrackLine>
						<End x="86.65" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="87.7738" y="45.0912"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="72" y="61.25"/>
					<TrackLine>
						<End x="71.05" y="61.25"/>
					</TrackLine>
					<TrackLine>
						<End x="70.9314" y="60.1933"/>
					</TrackLine>
					<TrackLine>
						<End x="70.9314" y="59.0907"/>
					</TrackLine>
					<TrackLine>
						<End x="70.9539" y="59.0363"/>
					</TrackLine>
					<TrackLine>
						<End x="71.7337" y="58.2565"/>
					</TrackLine>
					<TrackLine>
						<End x="71.7881" y="58.234"/>
					</TrackLine>
					<TrackLine>
						<End x="75.25" y="57.45"/>
					</TrackLine>
					<TrackLine>
						<End x="75.25" y="56.5"/>
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
						<End x="80.6686" y="37.95"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8679" y="37.9617"/>
					</TrackLine>
					<TrackLine>
						<End x="81.3998" y="38.4936"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5823" y="41.1216"/>
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
				<NetRef name="98"/>
				<Subwire width="0.2">
					<Start x="75.25" y="56.5"/>
					<TrackLine>
						<End x="75.25" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="76.75" y="49.0299"/>
					</TrackLine>
					<TrackLine>
						<End x="76.75" y="41.5299"/>
					</TrackLine>
					<TrackLine>
						<End x="76.75" y="40.4701"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7439" y="40.4554"/>
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
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="78.5" y="36.5"/>
					<TrackLine>
						<End x="78.5" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="79.4186" y="37.95"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4918" y="38.8697"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="97"/>
				<Subwire width="0.2">
					<Start x="89.5" y="62.25"/>
					<TrackLine>
						<End x="89.5" y="61.25"/>
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
						<End x="80.4918" y="38.8697"/>
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
						<End x="78.3292" y="38.455"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="96"/>
				<Subwire width="0.2">
					<Start x="78.3292" y="38.455"/>
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
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="86" y="48.5"/>
					<TrackLine>
						<End x="85.35" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="84.55" y="47.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9916" y="38.3648"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="95"/>
				<Subwire width="0.2">
					<Start x="76.9916" y="38.3648"/>
					<TrackLine>
						<End x="76" y="37.15"/>
					</TrackLine>
					<TrackLine>
						<End x="76" y="36.5"/>
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
						<End x="36.2719" y="46.9772"/>
					</TrackLine>
					<TrackLine>
						<End x="35.74" y="46.4453"/>
					</TrackLine>
					<TrackLine>
						<End x="35.4946" y="45.362"/>
					</TrackLine>
					<TrackLine>
						<End x="35.3568" y="41.0009"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NET00001"/>
				<Subwire width="0.2">
					<Start x="60.2" y="48.5"/>
					<TrackLine>
						<End x="60.85" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="61.65" y="47.5814"/>
					</TrackLine>
					<TrackLine>
						<End x="61.9928" y="41.9309"/>
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
						<End x="73.3118" y="40.2712"/>
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
				<LayerRef name="Int 1"/>
				<Colors details="#075f78" pads="#054c60" fix="#043948"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Int 2"/>
				<Colors details="#ce7946" pads="#a46038" fix="#7b482a"/>
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