<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : MinVia_standard_routing.fst    -->
<!--   Format  : TopoR PCB file                 -->
<!--   Version : 1.2.0                          -->
<!--   Program : TopoR 32 Layer 7.0.18313 Alpha -->
<!--   Date    : Monday, April 09, 2018         -->
<!--   Time    : 18:15                          -->
<!--********************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.2.0</Version>
		<Program>TopoR 32 Layer 7.0.18313 Alpha</Program>
		<Date>Monday, April 09, 2018 18:15</Date>
		<OriginalFormat>Pcad 2004</OriginalFormat>
		<OriginalFile>.\MinVia_standard_routing.PCB</OriginalFile>
		<Units dist="mm" time="ps"/>
	</Header>

	<Layers version="1.1">
		<StackUpLayers>
			<Layer name="TopMask" type="Mask" thickness="0"/>
			<Layer name="TopSilk" type="Silk" thickness="0"/>
			<Layer name="TopPaste" type="Paste" thickness="0"/>
			<Layer name="TopAssy" type="Assy" compsOutline="on"/>
			<Layer name="MECH4" type="Mechanical" thickness="0"/>
			<Layer name="MECH16" type="Mechanical" thickness="0"/>
			<Layer name="Top" type="Signal" thickness="0"/>
			<Layer name="Bottom" type="Signal" thickness="0"/>
			<Layer name="BotAssy" type="Assy" compsOutline="on"/>
			<Layer name="BotPaste" type="Paste" thickness="0"/>
			<Layer name="BotSilk" type="Silk" thickness="0"/>
			<Layer name="BotMask" type="Mask" thickness="0"/>
		</StackUpLayers>
	</Layers>

	<TextStyles version="1.0">
		<TextStyle name="(Default)" fontName="Quality" height="2.032"/>
		<TextStyle name="(DefaultTTF)" fontName="Arial" height="3.175"/>
		<TextStyle name="T:H90W9" fontName="Quality" height="3.048"/>
		<TextStyle name="T:H40W6" fontName="Quality" height="1.3547"/>
		<TextStyle name="T:H50W6" fontName="Quality" height="1.6933"/>
		<TextStyle name="T:H60W6" fontName="Quality" height="2.032"/>
		<TextStyle name="T:H90W10" fontName="Quality" height="3.048"/>
		<TextStyle name="T:H130W10" fontName="Quality" height="4.4027"/>
		<TextStyle name="T:H70W7" fontName="Quality" height="2.3707"/>
		<TextStyle name="T:H70W7A" fontName="Quality" height="2.3707"/>
		<TextStyle name="T:H35W5" fontName="Quality" height="1.1853"/>
		<TextStyle name="T:H45W5" fontName="Quality" height="1.524"/>
	</TextStyles>

	<LocalLibrary version="1.4">
		<Padstacks>
			<Padstack name="(Default)" holeDiameter="0.9652" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.524">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.524">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.524">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.524">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="P:EX62Y62D30A" holeDiameter="0.762" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.5748">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.5748">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.5748">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.5748">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="P:SX50Y50D28A" holeDiameter="0.7112" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.27" height="1.27">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="1.27" height="1.27">
						<LayerRef name="Bottom"/>
					</PadRect>
					<PadRect width="1.27" height="1.27">
						<LayerTypeRef type="Signal"/>
					</PadRect>
					<PadRect width="1.27" height="1.27">
						<LayerTypeRef type="Plane"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="P:EX50Y50D28A" holeDiameter="0.7112" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.27">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.27">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.27">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.27">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="P:EX100Y100D28A" holeDiameter="0.7112" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="2.54">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="2.54">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="2.54">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="2.54">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="P:SX50Y50D32A" holeDiameter="0.8128" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.27" height="1.27">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="1.27" height="1.27">
						<LayerRef name="Bottom"/>
					</PadRect>
					<PadRect width="1.27" height="1.27">
						<LayerTypeRef type="Signal"/>
					</PadRect>
					<PadRect width="1.27" height="1.27">
						<LayerTypeRef type="Plane"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="P:EX50Y50D32A" holeDiameter="0.8128" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.27">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.27">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.27">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.27">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="P:EX150Y150D32A" holeDiameter="0.8128" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="3.81">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="3.81">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="3.81">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="3.81">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="P:EX50Y50D25A" holeDiameter="0.635" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.27">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.27">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.27">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.27">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="P:SX50Y50D25A" holeDiameter="0.635" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.27" height="1.27">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="1.27" height="1.27">
						<LayerRef name="Bottom"/>
					</PadRect>
					<PadRect width="1.27" height="1.27">
						<LayerTypeRef type="Signal"/>
					</PadRect>
					<PadRect width="1.27" height="1.27">
						<LayerTypeRef type="Plane"/>
					</PadRect>
				</Pads>
			</Padstack>
		</Padstacks>
		<Viastacks>
			<Viastack name="(Default)" holeDiameter="0.4572">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.016">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.016">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.016">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="V:EX40Y40D28A" holeDiameter="0.7112">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.016">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.016">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.016">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
		</Viastacks>
		<Footprints>
			<Footprint name="RB.2/.4_1">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="-5.08" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.254">
						<LayerRef name="TopSilk"/>
						<Circle diameter="10.16">
							<Center x="-2.54" y="0"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.81" y="-1.27"/>
							<Dot x="3.81" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.54" y="0"/>
							<Dot x="5.08" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="2.54" y="5.08"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-7.747" y="-8.001"/>
					</Label>
					<Label name="Value" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-1.778" y="2.286"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="RB.2/.4_2">
				<Pads>
					<Pad padNum="1" name="1" angle="270">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="270">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="-5.08" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.254">
						<LayerRef name="TopSilk"/>
						<Circle diameter="10.16">
							<Center x="-2.54" y="0"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.81" y="-1.27"/>
							<Dot x="3.81" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.54" y="0"/>
							<Dot x="5.08" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="2.54" y="5.08"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-7.747" y="-8.001"/>
					</Label>
					<Label name="Value" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-1.778" y="1.778"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="FLY4_1">
				<Pads>
					<Pad padNum="1" name="1" angle="270">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="270">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="3.81" y="0"/>
					</Pad>
					<Pad padNum="3" name="3" angle="270">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="4" name="4" angle="270">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="11.43" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.54" y="-2.54"/>
							<Dot x="-2.54" y="2.54"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.54" y="-2.54"/>
							<Dot x="13.97" y="-2.54"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.54" y="2.54"/>
							<Dot x="13.97" y="2.54"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="13.97" y="-2.54"/>
							<Dot x="13.97" y="2.54"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="14.478" y="-0.762"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.6416" y="-5.4356"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="3.937" y="-0.508"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DIP14_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="P:SX50Y50D25A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="10">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-10.16"/>
					</Pad>
					<Pad padNum="3" name="11">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-7.62"/>
					</Pad>
					<Pad padNum="4" name="12">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-5.08"/>
					</Pad>
					<Pad padNum="5" name="13">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-2.54"/>
					</Pad>
					<Pad padNum="6" name="14">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="7" name="2">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="8" name="3">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="9" name="4">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="10" name="5">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="11" name="6">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-12.7"/>
					</Pad>
					<Pad padNum="12" name="7">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-15.24"/>
					</Pad>
					<Pad padNum="13" name="8">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-15.24"/>
					</Pad>
					<Pad padNum="14" name="9">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-12.7"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="3.81" y="1.27"/>
							<Start x="3.175" y="1.27"/>
							<End x="4.445" y="1.27"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="1.27"/>
							<Dot x="3.175" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="-16.51"/>
							<Dot x="6.35" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.445" y="1.27"/>
							<Dot x="6.35" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="-16.51"/>
							<Dot x="1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="-16.51"/>
							<Dot x="6.35" y="-16.51"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="1.143" y="1.778"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.762" y="-19.4056"/>
					</Label>
					<Label name="Value" align="LB" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.318" y="-10.414"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DIP16_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="P:SX50Y50D25A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="10">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-15.24"/>
					</Pad>
					<Pad padNum="3" name="11">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-12.7"/>
					</Pad>
					<Pad padNum="4" name="12">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-10.16"/>
					</Pad>
					<Pad padNum="5" name="13">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-7.62"/>
					</Pad>
					<Pad padNum="6" name="14">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-5.08"/>
					</Pad>
					<Pad padNum="7" name="15">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-2.54"/>
					</Pad>
					<Pad padNum="8" name="16">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="9" name="2">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="10" name="3">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="11" name="4">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="12" name="5">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="13" name="6">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-12.7"/>
					</Pad>
					<Pad padNum="14" name="7">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-15.24"/>
					</Pad>
					<Pad padNum="15" name="8">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-17.78"/>
					</Pad>
					<Pad padNum="16" name="9">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-17.78"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="3.81" y="1.27"/>
							<Start x="3.175" y="1.27"/>
							<End x="4.445" y="1.27"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="1.27"/>
							<Dot x="3.175" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="-19.05"/>
							<Dot x="6.35" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="-19.05"/>
							<Dot x="1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.445" y="1.27"/>
							<Dot x="6.35" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="-19.05"/>
							<Dot x="6.35" y="-19.05"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="1.27" y="-20.701"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.762" y="-21.9456"/>
					</Label>
					<Label name="Value" align="LB" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.318" y="-11.684"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="XTAL1_1">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="5.08" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.54" y="-1.524"/>
							<Dot x="7.62" y="-1.524"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.54" y="-1.524"/>
							<Dot x="-2.54" y="1.524"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.54" y="1.524"/>
							<Dot x="7.62" y="1.524"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.62" y="-1.524"/>
							<Dot x="7.62" y="1.524"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="7.62" y="-2.032"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.6416" y="-4.4196"/>
					</Label>
					<Label name="Value" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="6.35" y="0.508"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="XTAL1_2">
				<Pads>
					<Pad padNum="1" name="1" angle="270">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="270">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="5.08" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.54" y="-1.524"/>
							<Dot x="7.62" y="-1.524"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.54" y="-1.524"/>
							<Dot x="-2.54" y="1.524"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.54" y="1.524"/>
							<Dot x="7.62" y="1.524"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.62" y="-1.524"/>
							<Dot x="7.62" y="1.524"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-2.54" y="1.905"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.6416" y="-4.4196"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-1.7018" y="-0.508"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DIP40_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="P:SX50Y50D25A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="10">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-22.86"/>
					</Pad>
					<Pad padNum="3" name="11">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-25.4"/>
					</Pad>
					<Pad padNum="4" name="12">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-27.94"/>
					</Pad>
					<Pad padNum="5" name="13">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-30.48"/>
					</Pad>
					<Pad padNum="6" name="14">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-33.02"/>
					</Pad>
					<Pad padNum="7" name="15">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-35.56"/>
					</Pad>
					<Pad padNum="8" name="16">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-38.1"/>
					</Pad>
					<Pad padNum="9" name="17">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-40.64"/>
					</Pad>
					<Pad padNum="10" name="18">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-43.18"/>
					</Pad>
					<Pad padNum="11" name="19">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-45.72"/>
					</Pad>
					<Pad padNum="12" name="2">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="13" name="20">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-48.26"/>
					</Pad>
					<Pad padNum="14" name="21">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-48.26"/>
					</Pad>
					<Pad padNum="15" name="22">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-45.72"/>
					</Pad>
					<Pad padNum="16" name="23">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-43.18"/>
					</Pad>
					<Pad padNum="17" name="24">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-40.64"/>
					</Pad>
					<Pad padNum="18" name="25">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-38.1"/>
					</Pad>
					<Pad padNum="19" name="26">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-35.56"/>
					</Pad>
					<Pad padNum="20" name="27">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-33.02"/>
					</Pad>
					<Pad padNum="21" name="28">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-30.48"/>
					</Pad>
					<Pad padNum="22" name="29">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-27.94"/>
					</Pad>
					<Pad padNum="23" name="3">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="24" name="30">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-25.4"/>
					</Pad>
					<Pad padNum="25" name="31">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-22.86"/>
					</Pad>
					<Pad padNum="26" name="32">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-20.32"/>
					</Pad>
					<Pad padNum="27" name="33">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-17.78"/>
					</Pad>
					<Pad padNum="28" name="34">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-15.24"/>
					</Pad>
					<Pad padNum="29" name="35">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-12.7"/>
					</Pad>
					<Pad padNum="30" name="36">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-10.16"/>
					</Pad>
					<Pad padNum="31" name="37">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-7.62"/>
					</Pad>
					<Pad padNum="32" name="38">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-5.08"/>
					</Pad>
					<Pad padNum="33" name="39">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-2.54"/>
					</Pad>
					<Pad padNum="34" name="4">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="35" name="40">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="36" name="5">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="37" name="6">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-12.7"/>
					</Pad>
					<Pad padNum="38" name="7">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-15.24"/>
					</Pad>
					<Pad padNum="39" name="8">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-17.78"/>
					</Pad>
					<Pad padNum="40" name="9">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-20.32"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="7.62" y="1.27"/>
							<Start x="6.985" y="1.27"/>
							<End x="8.255" y="1.27"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="-49.53"/>
							<Dot x="1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="-49.53"/>
							<Dot x="13.97" y="-49.53"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="1.27"/>
							<Dot x="6.985" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="13.97" y="-49.53"/>
							<Dot x="13.97" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.255" y="1.27"/>
							<Dot x="13.97" y="1.27"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-1.016" y="-51.181"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.762" y="-52.4256"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.2418" y="-24.638"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DB9RA/F_1">
				<Pads>
					<Pad padNum="1" name="0" angle="270">
						<PadstackRef name="P:EX150Y150D32A"/>
						<Org x="-6.985" y="1.27"/>
					</Pad>
					<Pad padNum="2" name="0_1" angle="270">
						<PadstackRef name="P:EX150Y150D32A"/>
						<Org x="18.0594" y="1.27"/>
					</Pad>
					<Pad padNum="3" name="1" angle="270">
						<PadstackRef name="P:SX50Y50D32A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="4" name="2" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="2.7686" y="0"/>
					</Pad>
					<Pad padNum="5" name="3" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="5.5372" y="0"/>
					</Pad>
					<Pad padNum="6" name="4" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="8.3058" y="0"/>
					</Pad>
					<Pad padNum="7" name="5" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="11.0744" y="0"/>
					</Pad>
					<Pad padNum="8" name="6" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="1.397" y="2.54"/>
					</Pad>
					<Pad padNum="9" name="7" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="4.1656" y="2.54"/>
					</Pad>
					<Pad padNum="10" name="8" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="6.9342" y="2.54"/>
					</Pad>
					<Pad padNum="11" name="9" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="9.7028" y="2.54"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-10.16" y="-1.905"/>
							<Dot x="-10.16" y="10.795"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-10.16" y="10.795"/>
							<Dot x="21.2344" y="10.795"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="21.2344" y="-1.905"/>
							<Dot x="21.2344" y="10.795"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-10.16" y="-1.905"/>
							<Dot x="21.2344" y="-1.905"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-12.065" y="5.588"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-10.2616" y="-4.8006"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.191" y="3.937"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DB9RA/F_2">
				<Pads>
					<Pad padNum="1" name="0" angle="270">
						<PadstackRef name="P:EX150Y150D32A"/>
						<Org x="18.0594" y="1.27"/>
					</Pad>
					<Pad padNum="2" name="0_1" angle="270">
						<PadstackRef name="P:EX150Y150D32A"/>
						<Org x="-6.985" y="1.27"/>
					</Pad>
					<Pad padNum="3" name="1" angle="270">
						<PadstackRef name="P:SX50Y50D32A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="4" name="2" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="2.7686" y="0"/>
					</Pad>
					<Pad padNum="5" name="3" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="5.5372" y="0"/>
					</Pad>
					<Pad padNum="6" name="4" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="8.3058" y="0"/>
					</Pad>
					<Pad padNum="7" name="5" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="11.0744" y="0"/>
					</Pad>
					<Pad padNum="8" name="6" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="1.397" y="2.54"/>
					</Pad>
					<Pad padNum="9" name="7" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="4.1656" y="2.54"/>
					</Pad>
					<Pad padNum="10" name="8" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="6.9342" y="2.54"/>
					</Pad>
					<Pad padNum="11" name="9" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="9.7028" y="2.54"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-10.16" y="-1.905"/>
							<Dot x="-10.16" y="10.795"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-10.16" y="10.795"/>
							<Dot x="21.2344" y="10.795"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="21.2344" y="-1.905"/>
							<Dot x="21.2344" y="10.795"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-10.16" y="-1.905"/>
							<Dot x="21.2344" y="-1.905"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-4.064" y="-2.286"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-10.2616" y="-4.8006"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.191" y="3.937"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="RAD0.2_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="5.08" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.905" y="-1.905"/>
							<Dot x="-1.905" y="1.905"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.905" y="-1.905"/>
							<Dot x="6.985" y="-1.905"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.905" y="1.905"/>
							<Dot x="6.985" y="1.905"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.985" y="-1.905"/>
							<Dot x="6.985" y="1.905"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="7.874" y="-0.508"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.0066" y="-4.8006"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="0.3302" y="-0.508"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="RAD0.2_2">
				<Pads>
					<Pad padNum="1" name="1" angle="180">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="180">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="5.08" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.905" y="-1.905"/>
							<Dot x="-1.905" y="1.905"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.905" y="-1.905"/>
							<Dot x="6.985" y="-1.905"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.905" y="1.905"/>
							<Dot x="6.985" y="1.905"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.985" y="-1.905"/>
							<Dot x="6.985" y="1.905"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-2.667" y="0.508"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.0066" y="-4.8006"/>
					</Label>
					<Label name="Value" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.7498" y="0.508"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="AXIAL0.4_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="10.16" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="2.032" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="-1.016"/>
							<Dot x="2.032" y="1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="-1.016"/>
							<Dot x="8.128" y="-1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="1.016"/>
							<Dot x="8.128" y="1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.128" y="-1.016"/>
							<Dot x="8.128" y="1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.128" y="0"/>
							<Dot x="10.16" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="3.81" y="-0.762"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.9144" y="-3.9116"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="3.2258" y="-0.508"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="AXIAL0.4_2">
				<Pads>
					<Pad padNum="1" name="1" angle="270">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="270">
						<PadstackRef name="P:EX62Y62D30A"/>
						<Org x="10.16" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="2.032" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="-1.016"/>
							<Dot x="2.032" y="1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="-1.016"/>
							<Dot x="8.128" y="-1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="1.016"/>
							<Dot x="8.128" y="1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.128" y="-1.016"/>
							<Dot x="8.128" y="1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.128" y="0"/>
							<Dot x="10.16" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-1.27" y="-1.143"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.9144" y="-3.9116"/>
					</Label>
					<Label name="Value" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="6.4262" y="0.508"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DIP28_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="P:SX50Y50D25A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="10">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-22.86"/>
					</Pad>
					<Pad padNum="3" name="11">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-25.4"/>
					</Pad>
					<Pad padNum="4" name="12">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-27.94"/>
					</Pad>
					<Pad padNum="5" name="13">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-30.48"/>
					</Pad>
					<Pad padNum="6" name="14">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-33.02"/>
					</Pad>
					<Pad padNum="7" name="15">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-33.02"/>
					</Pad>
					<Pad padNum="8" name="16">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-30.48"/>
					</Pad>
					<Pad padNum="9" name="17">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-27.94"/>
					</Pad>
					<Pad padNum="10" name="18">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-25.4"/>
					</Pad>
					<Pad padNum="11" name="19">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-22.86"/>
					</Pad>
					<Pad padNum="12" name="2">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="13" name="20">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-20.32"/>
					</Pad>
					<Pad padNum="14" name="21">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-17.78"/>
					</Pad>
					<Pad padNum="15" name="22">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-15.24"/>
					</Pad>
					<Pad padNum="16" name="23">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-12.7"/>
					</Pad>
					<Pad padNum="17" name="24">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-10.16"/>
					</Pad>
					<Pad padNum="18" name="25">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-7.62"/>
					</Pad>
					<Pad padNum="19" name="26">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-5.08"/>
					</Pad>
					<Pad padNum="20" name="27">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-2.54"/>
					</Pad>
					<Pad padNum="21" name="28">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="22" name="3">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="23" name="4">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="24" name="5">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="25" name="6">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-12.7"/>
					</Pad>
					<Pad padNum="26" name="7">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-15.24"/>
					</Pad>
					<Pad padNum="27" name="8">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-17.78"/>
					</Pad>
					<Pad padNum="28" name="9">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-20.32"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="7.62" y="1.27"/>
							<Start x="6.985" y="1.27"/>
							<End x="8.255" y="1.27"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="-34.29"/>
							<Dot x="13.97" y="-34.29"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="1.27"/>
							<Dot x="6.985" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="13.97" y="-34.29"/>
							<Dot x="13.97" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="-34.29"/>
							<Dot x="1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.255" y="1.27"/>
							<Dot x="13.97" y="1.27"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="0.381" y="2.032"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.762" y="-37.1856"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="5.7658" y="-17.018"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="IDC40P_1">
				<Pads>
					<Pad padNum="1" name="0" angle="90">
						<PadstackRef name="P:EX100Y100D28A"/>
						<Org x="-5.08" y="1.778"/>
					</Pad>
					<Pad padNum="2" name="0_1" angle="90">
						<PadstackRef name="P:EX100Y100D28A"/>
						<Org x="53.34" y="1.778"/>
					</Pad>
					<Pad padNum="3" name="1" angle="90">
						<PadstackRef name="P:SX50Y50D28A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="4" name="10" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="10.16" y="2.54"/>
					</Pad>
					<Pad padNum="5" name="11" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="12.7" y="0"/>
					</Pad>
					<Pad padNum="6" name="12" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="12.7" y="2.54"/>
					</Pad>
					<Pad padNum="7" name="13" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="8" name="14" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="15.24" y="2.54"/>
					</Pad>
					<Pad padNum="9" name="15" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="17.78" y="0"/>
					</Pad>
					<Pad padNum="10" name="16" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="17.78" y="2.54"/>
					</Pad>
					<Pad padNum="11" name="17" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="20.32" y="0"/>
					</Pad>
					<Pad padNum="12" name="18" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="20.32" y="2.54"/>
					</Pad>
					<Pad padNum="13" name="19" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="22.86" y="0"/>
					</Pad>
					<Pad padNum="14" name="2" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="0" y="2.54"/>
					</Pad>
					<Pad padNum="15" name="20" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="22.86" y="2.54"/>
					</Pad>
					<Pad padNum="16" name="21" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="25.4" y="0"/>
					</Pad>
					<Pad padNum="17" name="22" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="25.4" y="2.54"/>
					</Pad>
					<Pad padNum="18" name="23" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="27.94" y="0"/>
					</Pad>
					<Pad padNum="19" name="24" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="27.94" y="2.54"/>
					</Pad>
					<Pad padNum="20" name="25" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="30.48" y="0"/>
					</Pad>
					<Pad padNum="21" name="26" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="30.48" y="2.54"/>
					</Pad>
					<Pad padNum="22" name="27" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="33.02" y="0"/>
					</Pad>
					<Pad padNum="23" name="28" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="33.02" y="2.54"/>
					</Pad>
					<Pad padNum="24" name="29" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="35.56" y="0"/>
					</Pad>
					<Pad padNum="25" name="3" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="2.54" y="0"/>
					</Pad>
					<Pad padNum="26" name="30" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="35.56" y="2.54"/>
					</Pad>
					<Pad padNum="27" name="31" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="38.1" y="0"/>
					</Pad>
					<Pad padNum="28" name="32" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="38.1" y="2.54"/>
					</Pad>
					<Pad padNum="29" name="33" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="40.64" y="0"/>
					</Pad>
					<Pad padNum="30" name="34" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="40.64" y="2.54"/>
					</Pad>
					<Pad padNum="31" name="35" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="43.18" y="0"/>
					</Pad>
					<Pad padNum="32" name="36" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="43.18" y="2.54"/>
					</Pad>
					<Pad padNum="33" name="37" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="45.72" y="0"/>
					</Pad>
					<Pad padNum="34" name="38" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="45.72" y="2.54"/>
					</Pad>
					<Pad padNum="35" name="39" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="48.26" y="0"/>
					</Pad>
					<Pad padNum="36" name="4" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="2.54" y="2.54"/>
					</Pad>
					<Pad padNum="37" name="40" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="48.26" y="2.54"/>
					</Pad>
					<Pad padNum="38" name="5" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="5.08" y="0"/>
					</Pad>
					<Pad padNum="39" name="6" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="5.08" y="2.54"/>
					</Pad>
					<Pad padNum="40" name="7" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="41" name="8" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="7.62" y="2.54"/>
					</Pad>
					<Pad padNum="42" name="9" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="10.16" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.27" y="11.43"/>
							<Dot x="49.53" y="11.43"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="-1.27"/>
							<Dot x="1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.27" y="1.27"/>
							<Dot x="1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-11.43" y="-1.27"/>
							<Dot x="59.69" y="-1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.27" y="-1.27"/>
							<Dot x="-1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-11.43" y="-1.27"/>
							<Dot x="-11.43" y="11.43"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-11.43" y="11.43"/>
							<Dot x="-8.89" y="16.51"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="52.07" y="16.51"/>
							<Dot x="57.15" y="16.51"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="57.15" y="16.51"/>
							<Dot x="59.69" y="11.43"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-3.81" y="16.51"/>
							<Dot x="-1.27" y="11.43"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-8.89" y="16.51"/>
							<Dot x="-3.81" y="16.51"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="59.69" y="-1.27"/>
							<Dot x="59.69" y="11.43"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2032">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="49.53" y="11.43"/>
							<Dot x="52.07" y="16.51"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-7.239" y="-4.318"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-11.5316" y="-4.1656"/>
					</Label>
					<Label name="Value" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="26.924" y="8.128"/>
					</Label>
				</Labels>
			</Footprint>
		</Footprints>
		<Components>
			<Component name="FLY4_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="FLY4"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="FLY4"/>
				</Attributes>
			</Component>
			<Component name="DIP14_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="9" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="DIP14"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="DIP14"/>
				</Attributes>
			</Component>
			<Component name="DIP16_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="9" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="DIP16"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="DIP16"/>
				</Attributes>
			</Component>
			<Component name="XTAL1_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="XTAL1"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="XTAL1"/>
				</Attributes>
			</Component>
			<Component name="DIP40_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="29" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="30" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="31" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="32" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="33" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="34" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="35" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="36" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="37" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="38" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="39" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="40" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="9" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="DIP40"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="DIP40"/>
				</Attributes>
			</Component>
			<Component name="DB9RA_F_1">
				<Pins>
					<Pin pinNum="1" name="0" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="0_1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="9" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="DB9RA/F"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="DB9RA_F"/>
				</Attributes>
			</Component>
			<Component name="RAD0.2_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="RAD0.2"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="RAD0.2"/>
				</Attributes>
			</Component>
			<Component name="AXIAL0.4_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="AXIAL0.4"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="AXIAL0.4"/>
				</Attributes>
			</Component>
			<Component name="DIP28_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="9" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="DIP28"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="DIP28"/>
				</Attributes>
			</Component>
			<Component name="IDC40P_1">
				<Pins>
					<Pin pinNum="1" name="0" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="0_1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="21" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="22" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="23" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="24" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="25" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="26" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="27" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="28" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="29" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="30" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="31" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="32" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="33" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="34" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="35" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="36" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="37" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="38" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="39" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="40" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="9" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="IDC40P"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="IDC40P"/>
				</Attributes>
			</Component>
			<Component name="RB.2_.4_1">
				<Pins>
					<Pin pinNum="1" name="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="RB.2/.4"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="RB.2_.4"/>
				</Attributes>
			</Component>
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="FLY4_1"/>
				<FootprintRef name="FLY4_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
			</Package>
			<Package>
				<ComponentRef name="DIP14_1"/>
				<FootprintRef name="DIP14_1"/>
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
				<ComponentRef name="DIP16_1"/>
				<FootprintRef name="DIP16_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="XTAL1_1"/>
				<FootprintRef name="XTAL1_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="XTAL1_1"/>
				<FootprintRef name="XTAL1_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="DIP40_1"/>
				<FootprintRef name="DIP40_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="DB9RA_F_1"/>
				<FootprintRef name="DB9RA/F_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="DB9RA_F_1"/>
				<FootprintRef name="DB9RA/F_2"/>
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
			</Package>
			<Package>
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="DIP28_1"/>
				<FootprintRef name="DIP28_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="IDC40P_1"/>
				<FootprintRef name="IDC40P_1"/>
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
				<ComponentRef name="RB.2_.4_1"/>
				<FootprintRef name="RB.2/.4_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB.2_.4_1"/>
				<FootprintRef name="RB.2/.4_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
		</Packages>
	</LocalLibrary>

	<Constructive version="1.2">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.3048">
					<Polyline>
						<Start x="112.268" y="137.668"/>
						<SegmentLine>
							<End x="112.268" y="228.981"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.3048">
					<Polyline>
						<Start x="229.108" y="137.668"/>
						<SegmentLine>
							<End x="229.108" y="228.981"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.3048">
					<Polyline>
						<Start x="112.268" y="137.668"/>
						<SegmentLine>
							<End x="229.108" y="137.668"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.3048">
					<Polyline>
						<Start x="112.268" y="228.981"/>
						<SegmentLine>
							<End x="229.108" y="228.981"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.127">
					<FilledContour>
						<Start x="229.108" y="137.668"/>
						<SegmentLine>
							<End x="229.108" y="228.981"/>
						</SegmentLine>
						<SegmentLine>
							<End x="112.268" y="228.981"/>
						</SegmentLine>
						<SegmentLine>
							<End x="112.268" y="137.668"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
			</Contour>
		</BoardOutline>
		<MechLayerObjects>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="149.225" y="76.2"/>
					<SegmentLine>
						<End x="149.225" y="81.28"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="149.225" y="264.16"/>
					<SegmentLine>
						<End x="149.225" y="269.24"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="222.25" y="76.2"/>
					<SegmentLine>
						<End x="222.25" y="81.28"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="222.25" y="264.16"/>
					<SegmentLine>
						<End x="222.25" y="269.24"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="287.02" y="96.52"/>
					<SegmentLine>
						<End x="287.02" y="111.76"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="295.275" y="76.2"/>
					<SegmentLine>
						<End x="295.275" y="81.28"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="295.275" y="264.16"/>
					<SegmentLine>
						<End x="295.275" y="269.24"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="248.92" y="81.28"/>
					<SegmentLine>
						<End x="248.92" y="111.76"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="287.02" y="81.28"/>
					<SegmentLine>
						<End x="287.02" y="96.52"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="340.36" y="81.28"/>
					<SegmentLine>
						<End x="340.36" y="96.52"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="363.22" y="81.28"/>
					<SegmentLine>
						<End x="363.22" y="111.76"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="81.28" y="81.28"/>
					<SegmentLine>
						<End x="81.28" y="264.16"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="363.22" y="81.28"/>
					<SegmentLine>
						<End x="363.22" y="264.16"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="368.3" y="76.2"/>
					<SegmentLine>
						<End x="368.3" y="269.24"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="76.2" y="124.46"/>
					<SegmentLine>
						<End x="81.28" y="124.46"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="76.2" y="172.72"/>
					<SegmentLine>
						<End x="81.28" y="172.72"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="363.22" y="124.46"/>
					<SegmentLine>
						<End x="368.3" y="124.46"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="363.22" y="172.72"/>
					<SegmentLine>
						<End x="368.3" y="172.72"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="76.2" y="220.98"/>
					<SegmentLine>
						<End x="81.28" y="220.98"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="363.22" y="220.98"/>
					<SegmentLine>
						<End x="368.3" y="220.98"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="213.36" y="81.28"/>
					<SegmentLine>
						<End x="213.36" y="111.76"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="76.2" y="76.2"/>
					<SegmentLine>
						<End x="76.2" y="269.24"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="213.36" y="81.28"/>
					<SegmentLine>
						<End x="248.92" y="81.28"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="213.36" y="111.76"/>
					<SegmentLine>
						<End x="248.92" y="111.76"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="287.02" y="111.76"/>
					<SegmentLine>
						<End x="363.22" y="111.76"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="81.28" y="81.28"/>
					<SegmentLine>
						<End x="363.22" y="81.28"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="248.92" y="81.28"/>
					<SegmentLine>
						<End x="363.22" y="81.28"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="248.92" y="88.9"/>
					<SegmentLine>
						<End x="363.22" y="88.9"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="248.92" y="96.52"/>
					<SegmentLine>
						<End x="363.22" y="96.52"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="248.92" y="104.14"/>
					<SegmentLine>
						<End x="287.02" y="104.14"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="248.92" y="111.76"/>
					<SegmentLine>
						<End x="287.02" y="111.76"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="81.28" y="264.16"/>
					<SegmentLine>
						<End x="363.22" y="264.16"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="76.2" y="269.24"/>
					<SegmentLine>
						<End x="368.3" y="269.24"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.127">
				<LayerRef name="MECH16"/>
				<Polyline>
					<Start x="76.2" y="76.2"/>
					<SegmentLine>
						<End x="368.3" y="76.2"/>
					</SegmentLine>
				</Polyline>
			</Detail>
		</MechLayerObjects>
		<Texts>
			<Text text=".GTL" align="LB">
				<LayerRef name="Top"/>
				<TextStyleRef name="T:H90W9"/>
				<Org x="278.003" y="136.652"/>
			</Text>
			<Text text=".GBL" align="LB">
				<LayerRef name="Bottom"/>
				<TextStyleRef name="T:H90W9"/>
				<Org x="278.003" y="136.652"/>
			</Text>
			<Text text=".GTS" align="LB">
				<LayerRef name="TopMask"/>
				<TextStyleRef name="T:H90W9"/>
				<Org x="278.003" y="136.652"/>
			</Text>
			<Text text=".GBS" align="LB">
				<LayerRef name="BotMask"/>
				<TextStyleRef name="T:H90W9"/>
				<Org x="278.003" y="136.652"/>
			</Text>
			<Text text=".GTO" align="LB">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="T:H90W9"/>
				<Org x="278.003" y="136.652"/>
			</Text>
			<Text text=".GTP" align="LB">
				<LayerRef name="TopPaste"/>
				<TextStyleRef name="T:H90W9"/>
				<Org x="278.003" y="136.652"/>
			</Text>
			<Text text=".GBP" align="LB">
				<LayerRef name="BotPaste"/>
				<TextStyleRef name="T:H90W9"/>
				<Org x="278.003" y="136.652"/>
			</Text>
			<Text text="Z80 Processor (Thruhole)" align="LB">
				<LayerRef name="MECH4"/>
				<TextStyleRef name="T:H130W10"/>
				<Org x="295.148" y="101.4304"/>
			</Text>
			<Text text=".LAYER_NAME" align="LB">
				<LayerRef name="MECH4"/>
				<TextStyleRef name="T:H90W10"/>
				<Org x="245.11" y="137.1599"/>
			</Text>
			<Text text="C" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="78.105" y="146.2278"/>
			</Text>
			<Text text="B" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="78.105" y="194.7418"/>
			</Text>
			<Text text="1" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="112.4458" y="77.851"/>
			</Text>
			<Text text="2" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7A"/>
				<Org x="185.0898" y="77.851"/>
			</Text>
			<Text text="4" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7A"/>
				<Org x="331.1398" y="77.851"/>
			</Text>
			<Text text="D" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="78.105" y="98.2218"/>
			</Text>
			<Text text="A" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="78.105" y="242.7986"/>
			</Text>
			<Text text="1" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="112.4458" y="265.811"/>
			</Text>
			<Text text="2" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="185.0898" y="265.811"/>
			</Text>
			<Text text="4" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="331.1398" y="265.811"/>
			</Text>
			<Text text="3" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7A"/>
				<Org x="258.2418" y="77.851"/>
			</Text>
			<Text text="FILE NAME:" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H45W5"/>
				<Org x="250.19" y="86.36"/>
			</Text>
			<Text text="DATE:" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H45W5"/>
				<Org x="250.19" y="93.98"/>
			</Text>
			<Text text="PCB DESIGNER:" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H45W5"/>
				<Org x="250.19" y="101.727"/>
			</Text>
			<Text text="ENGINEER:" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H45W5"/>
				<Org x="250.19" y="109.22"/>
			</Text>
			<Text text="DWG NO:" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H45W5"/>
				<Org x="288.29" y="86.36"/>
			</Text>
			<Text text="PART NO.:" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H45W5"/>
				<Org x="288.29" y="93.98"/>
			</Text>
			<Text text="TITLE:" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H45W5"/>
				<Org x="288.29" y="109.22"/>
			</Text>
			<Text text="SCALE:" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H45W5"/>
				<Org x="341.63" y="86.36"/>
			</Text>
			<Text text="REV:" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H45W5"/>
				<Org x="341.63" y="93.98"/>
			</Text>
			<Text text="C" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="365.125" y="146.2278"/>
			</Text>
			<Text text="B" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="365.125" y="194.7418"/>
			</Text>
			<Text text=".PRINT_DATE" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="251.46" y="90.932"/>
			</Text>
			<Text text="3" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="258.2418" y="265.811"/>
			</Text>
			<Text text="D" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="365.125" y="98.2218"/>
			</Text>
			<Text text="A" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="365.125" y="242.7986"/>
			</Text>
			<Text text=".PCB_FILE_NAME_NO_PATH" align="LB">
				<LayerRef name="MECH16"/>
				<TextStyleRef name="T:H70W7"/>
				<Org x="251.46" y="83.312"/>
			</Text>
		</Texts>
	</Constructive>

	<ComponentsOnBoard version="1.3">
		<Components>
			<CompInstance name="R6" uniqueId="MXUGPPTQ" side="Top" angle="270">
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_2"/>
				<Org x="216.154" y="150.876"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-1.0819" y="1.3224"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AXIAL0.4"/>
					<Attribute name="Value" value="4k7"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XTAL1" uniqueId="YYIMDMKV" side="Top" angle="270">
				<ComponentRef name="XTAL1_1"/>
				<FootprintRef name="XTAL1_1"/>
				<Org x="121.666" y="147.828"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-2.3887" y="-7.5158"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="XTAL1"/>
					<Attribute name="Value" value="4.00 MHz"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C1" uniqueId="OORUIEKT" side="Top">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_1"/>
				<Org x="144.526" y="175.768"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="7.874" y="-0.508"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C9" uniqueId="YYUWBTOC" side="Top" angle="180">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_2"/>
				<Org x="133.858" y="176.276"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="2.6417" y="-0.8454"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C10" uniqueId="LJDZEXEL" side="Top" angle="180">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_2"/>
				<Org x="133.858" y="181.356"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="2.6497" y="-0.5915"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C7" uniqueId="ZOIOVVUE" side="Top" angle="90">
				<ComponentRef name="RB.2_.4_1"/>
				<FootprintRef name="RB.2/.4_1"/>
				<Org x="140.97" y="195.072"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-5.0395" y="2.6195"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RB.2_.4"/>
					<Attribute name="Value" value="100uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C5" uniqueId="GNFGGJUG" side="Top">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_1"/>
				<Org x="148.082" y="204.216"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-4.572" y="0.508"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C6" uniqueId="WIQNPWPL" side="Top">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_1"/>
				<Org x="163.322" y="175.768"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="7.62" y="-0.508"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C4" uniqueId="UGNUVGUS" side="Top">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_1"/>
				<Org x="201.93" y="175.768"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="7.874" y="-0.508"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="SW2" uniqueId="JMCZVYOZ" side="Top" angle="180">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_2"/>
				<Org x="226.314" y="140.716"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-4.367" y="2.5514"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="PUSH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J2" uniqueId="MXSZNRTM" side="Top" angle="90">
				<ComponentRef name="DB9RA_F_1"/>
				<FootprintRef name="DB9RA/F_1"/>
				<Org x="122.174" y="174.752"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-5.7768" y="-11.9757"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DB9RA_F"/>
					<Attribute name="Value" value="DB9"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XTAL2" uniqueId="UHYDLGGM" side="Top" angle="90">
				<ComponentRef name="XTAL1_1"/>
				<FootprintRef name="XTAL1_2"/>
				<Org x="121.666" y="154.432"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-1.9447" y="-2.5098"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="XTAL1"/>
					<Attribute name="Value" value="4.915 MHz"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U8" uniqueId="JOFHDTKG" side="Top">
				<ComponentRef name="DIP16_1"/>
				<FootprintRef name="DIP16_1"/>
				<Org x="147.066" y="200.152"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="2.667" y="-21.082"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP16"/>
					<Attribute name="Value" value="74ACT138"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="SW1" uniqueId="IOFOSQYG" side="Top">
				<ComponentRef name="DIP16_1"/>
				<FootprintRef name="DIP16_1"/>
				<Org x="147.066" y="227.584"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="1.27" y="-20.701"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP16"/>
					<Attribute name="Value" value="DIPSW8"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U12" uniqueId="QZYKUWLS" side="Top">
				<ComponentRef name="DIP16_1"/>
				<FootprintRef name="DIP16_1"/>
				<Org x="136.398" y="227.584"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="1.27" y="-20.828"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP16"/>
					<Attribute name="Value" value="SN74HC4040D"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U6" uniqueId="OGYFUFXD" side="Top">
				<ComponentRef name="DIP40_1"/>
				<FootprintRef name="DIP40_1"/>
				<Org x="158.75" y="227.584"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-1.27" y="-50.8"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP40"/>
					<Attribute name="Value" value="Z80ASIO"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U7" uniqueId="QRWRUOWZ" side="Top">
				<ComponentRef name="DIP40_1"/>
				<FootprintRef name="DIP40_1"/>
				<Org x="196.85" y="227.584"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="0.381" y="-51.308"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP40"/>
					<Attribute name="Value" value="8255"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C8" uniqueId="VDGGCVJW" side="Top" angle="90">
				<ComponentRef name="RB.2_.4_1"/>
				<FootprintRef name="RB.2/.4_2"/>
				<Org x="223.266" y="152.908"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-5.0395" y="2.6195"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RB.2_.4"/>
					<Attribute name="Value" value="10uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J1" uniqueId="WGWMZAFG" side="Top" angle="90">
				<ComponentRef name="FLY4_1"/>
				<FootprintRef name="FLY4_1"/>
				<Org x="114.554" y="141.732"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="0.9893" y="14.4642"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="FLY4"/>
					<Attribute name="Value" value="4PIN"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U1" uniqueId="STZPQXDP" side="Top">
				<ComponentRef name="DIP28_1"/>
				<FootprintRef name="DIP28_1"/>
				<Org x="139.446" y="172.212"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="0.381" y="2.032"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP28"/>
					<Attribute name="Value" value="2764"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U9" uniqueId="XQZAKTHP" side="Top">
				<ComponentRef name="DIP14_1"/>
				<FootprintRef name="DIP14_1"/>
				<Org x="128.27" y="155.448"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="1.016" y="1.651"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP14"/>
					<Attribute name="Value" value="SN74ACT04N"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U2" uniqueId="UWASZATA" side="Top">
				<ComponentRef name="DIP28_1"/>
				<FootprintRef name="DIP28_1"/>
				<Org x="158.75" y="172.212"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-1.27" y="1.524"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP28"/>
					<Attribute name="Value" value="2764"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U4" uniqueId="OWVHYUKY" side="Top">
				<ComponentRef name="DIP28_1"/>
				<FootprintRef name="DIP28_1"/>
				<Org x="197.358" y="172.212"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-0.254" y="1.651"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP28"/>
					<Attribute name="Value" value="6264"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R5" uniqueId="VYCVZNFS" side="Top">
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_1"/>
				<Org x="125.73" y="163.068"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="3.81" y="1.778"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AXIAL0.4"/>
					<Attribute name="Value" value="330R"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R7" uniqueId="PQUUCVGB" side="Top">
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_1"/>
				<Org x="125.73" y="165.608"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="3.81" y="-3.302"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AXIAL0.4"/>
					<Attribute name="Value" value="4k7"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R1" uniqueId="QWUJKZGK" side="Top">
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_1"/>
				<Org x="125.73" y="170.688"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="3.81" y="-0.762"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AXIAL0.4"/>
					<Attribute name="Value" value="470R"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R2" uniqueId="YQNBJVTU" side="Top">
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_1"/>
				<Org x="125.73" y="173.228"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="3.81" y="-0.762"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AXIAL0.4"/>
					<Attribute name="Value" value="470R"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R3" uniqueId="ETEKKGDI" side="Top">
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_1"/>
				<Org x="125.73" y="168.148"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="3.81" y="-0.762"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AXIAL0.4"/>
					<Attribute name="Value" value="470R"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R4" uniqueId="CYKKIKEK" side="Top">
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_1"/>
				<Org x="125.73" y="160.528"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="3.81" y="-0.762"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AXIAL0.4"/>
					<Attribute name="Value" value="470R"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C3" uniqueId="SRDKAPPE" side="Top">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_1"/>
				<Org x="182.626" y="175.768"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="7.874" y="-0.508"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J3" uniqueId="NEBGTEXV" side="Top" angle="90">
				<ComponentRef name="DB9RA_F_1"/>
				<FootprintRef name="DB9RA/F_2"/>
				<Org x="122.174" y="208.28"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="2.2219" y="-4.0994"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DB9RA_F"/>
					<Attribute name="Value" value="DB9"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U11" uniqueId="MGRTHVPU" side="Top">
				<ComponentRef name="DIP14_1"/>
				<FootprintRef name="DIP14_1"/>
				<Org x="126.238" y="227.584"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="1.27" y="-18.288"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP14"/>
					<Attribute name="Value" value="TS1488"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U10" uniqueId="FEXJQESF" side="Top">
				<ComponentRef name="DIP14_1"/>
				<FootprintRef name="DIP14_1"/>
				<Org x="126.746" y="201.168"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="1.143" y="1.778"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP14"/>
					<Attribute name="Value" value="TS1489"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J4" uniqueId="PDRLDTSX" side="Top" angle="270">
				<ComponentRef name="IDC40P_1"/>
				<FootprintRef name="IDC40P_1"/>
				<Org x="218.186" y="217.932"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-3.9722" y="7.4344"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IDC40P"/>
					<Attribute name="Value" value="40 PIN"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U5" uniqueId="FNLJKQOZ" side="Top">
				<ComponentRef name="DIP40_1"/>
				<FootprintRef name="DIP40_1"/>
				<Org x="177.546" y="227.584"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-1.016" y="-51.181"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP40"/>
					<Attribute name="Value" value="Z80ACPU"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U3" uniqueId="BSWDVFGK" side="Top">
				<ComponentRef name="DIP28_1"/>
				<FootprintRef name="DIP28_1"/>
				<Org x="178.054" y="172.212"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-1.524" y="1.524"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DIP28"/>
					<Attribute name="Value" value="6264"/>
				</Attributes>
			</CompInstance>
		</Components>
	</ComponentsOnBoard>

	<NetList version="2.0">
		<Net name="WR">
			<PinRef compName="U7" pinName="36"/>
			<PinRef compName="U1" pinName="27"/>
			<PinRef compName="U2" pinName="27"/>
			<PinRef compName="U4" pinName="27"/>
			<PinRef compName="U5" pinName="22"/>
			<PinRef compName="U3" pinName="27"/>
		</Net>
		<Net name="VCC">
			<PinRef compName="R6" pinName="1"/>
			<PinRef compName="C1" pinName="2"/>
			<PinRef compName="C7" pinName="1"/>
			<PinRef compName="C5" pinName="2"/>
			<PinRef compName="C6" pinName="2"/>
			<PinRef compName="C4" pinName="2"/>
			<PinRef compName="U8" pinName="16"/>
			<PinRef compName="U8" pinName="6"/>
			<PinRef compName="U12" pinName="16"/>
			<PinRef compName="U6" pinName="6"/>
			<PinRef compName="U6" pinName="9"/>
			<PinRef compName="U7" pinName="26"/>
			<PinRef compName="J1" pinName="2"/>
			<PinRef compName="U1" pinName="1"/>
			<PinRef compName="U1" pinName="28"/>
			<PinRef compName="U9" pinName="14"/>
			<PinRef compName="U2" pinName="1"/>
			<PinRef compName="U2" pinName="28"/>
			<PinRef compName="U4" pinName="26"/>
			<PinRef compName="U4" pinName="28"/>
			<PinRef compName="R5" pinName="1"/>
			<PinRef compName="R7" pinName="1"/>
			<PinRef compName="C3" pinName="2"/>
			<PinRef compName="U10" pinName="14"/>
			<PinRef compName="U5" pinName="11"/>
			<PinRef compName="U5" pinName="17"/>
			<PinRef compName="U5" pinName="24"/>
			<PinRef compName="U5" pinName="25"/>
			<PinRef compName="U3" pinName="26"/>
			<PinRef compName="U3" pinName="28"/>
		</Net>
		<Net name="NETJ3_2">
			<PinRef compName="J3" pinName="2"/>
			<PinRef compName="U10" pinName="4"/>
		</Net>
		<Net name="NETJ2_2">
			<PinRef compName="J2" pinName="2"/>
			<PinRef compName="U10" pinName="1"/>
		</Net>
		<Net name="NETU6_26">
			<PinRef compName="U6" pinName="26"/>
			<PinRef compName="U11" pinName="4"/>
			<PinRef compName="U11" pinName="5"/>
		</Net>
		<Net name="RESET">
			<PinRef compName="R6" pinName="2"/>
			<PinRef compName="SW2" pinName="2"/>
			<PinRef compName="U6" pinName="21"/>
			<PinRef compName="C8" pinName="1"/>
			<PinRef compName="U5" pinName="26"/>
		</Net>
		<Net name="RD">
			<PinRef compName="U6" pinName="32"/>
			<PinRef compName="U7" pinName="5"/>
			<PinRef compName="U5" pinName="21"/>
		</Net>
		<Net name="RAWBAUD">
			<PinRef compName="U12" pinName="10"/>
			<PinRef compName="U9" pinName="8"/>
		</Net>
		<Net name="NETR4_2">
			<PinRef compName="XTAL2" pinName="2"/>
			<PinRef compName="U9" pinName="10"/>
			<PinRef compName="U9" pinName="9"/>
			<PinRef compName="R4" pinName="2"/>
		</Net>
		<Net name="NETR3_1">
			<PinRef compName="XTAL2" pinName="1"/>
			<PinRef compName="U9" pinName="13"/>
			<PinRef compName="R3" pinName="1"/>
		</Net>
		<Net name="NETR2_2">
			<PinRef compName="XTAL1" pinName="2"/>
			<PinRef compName="U9" pinName="4"/>
			<PinRef compName="U9" pinName="5"/>
			<PinRef compName="R2" pinName="2"/>
		</Net>
		<Net name="NETR1_1">
			<PinRef compName="XTAL1" pinName="1"/>
			<PinRef compName="U9" pinName="1"/>
			<PinRef compName="R1" pinName="1"/>
		</Net>
		<Net name="PPISEL">
			<PinRef compName="U8" pinName="10"/>
			<PinRef compName="U7" pinName="6"/>
		</Net>
		<Net name="PC3">
			<PinRef compName="U7" pinName="17"/>
			<PinRef compName="J4" pinName="24"/>
		</Net>
		<Net name="PC2">
			<PinRef compName="U7" pinName="16"/>
			<PinRef compName="J4" pinName="22"/>
		</Net>
		<Net name="PC1">
			<PinRef compName="U7" pinName="15"/>
			<PinRef compName="J4" pinName="20"/>
		</Net>
		<Net name="PC0">
			<PinRef compName="U7" pinName="14"/>
			<PinRef compName="J4" pinName="18"/>
		</Net>
		<Net name="PB7">
			<PinRef compName="U7" pinName="25"/>
			<PinRef compName="J4" pinName="40"/>
		</Net>
		<Net name="PB6">
			<PinRef compName="U7" pinName="24"/>
			<PinRef compName="J4" pinName="38"/>
		</Net>
		<Net name="PB5">
			<PinRef compName="U7" pinName="23"/>
			<PinRef compName="J4" pinName="36"/>
		</Net>
		<Net name="PB4">
			<PinRef compName="U7" pinName="22"/>
			<PinRef compName="J4" pinName="34"/>
		</Net>
		<Net name="PB3">
			<PinRef compName="U7" pinName="21"/>
			<PinRef compName="J4" pinName="32"/>
		</Net>
		<Net name="PB2">
			<PinRef compName="U7" pinName="20"/>
			<PinRef compName="J4" pinName="30"/>
		</Net>
		<Net name="PB1">
			<PinRef compName="U7" pinName="19"/>
			<PinRef compName="J4" pinName="28"/>
		</Net>
		<Net name="PB0">
			<PinRef compName="U7" pinName="18"/>
			<PinRef compName="J4" pinName="26"/>
		</Net>
		<Net name="PA7">
			<PinRef compName="U7" pinName="37"/>
			<PinRef compName="J4" pinName="2"/>
		</Net>
		<Net name="PA6">
			<PinRef compName="U7" pinName="38"/>
			<PinRef compName="J4" pinName="4"/>
		</Net>
		<Net name="PA5">
			<PinRef compName="U7" pinName="39"/>
			<PinRef compName="J4" pinName="6"/>
		</Net>
		<Net name="PA4">
			<PinRef compName="U7" pinName="40"/>
			<PinRef compName="J4" pinName="8"/>
		</Net>
		<Net name="PA3">
			<PinRef compName="U7" pinName="1"/>
			<PinRef compName="J4" pinName="10"/>
		</Net>
		<Net name="PA2">
			<PinRef compName="U7" pinName="2"/>
			<PinRef compName="J4" pinName="12"/>
		</Net>
		<Net name="PA1">
			<PinRef compName="U7" pinName="3"/>
			<PinRef compName="J4" pinName="14"/>
		</Net>
		<Net name="PA0">
			<PinRef compName="U7" pinName="4"/>
			<PinRef compName="J4" pinName="16"/>
		</Net>
		<Net name="NETU5_19">
			<PinRef compName="U8" pinName="4"/>
			<PinRef compName="U8" pinName="5"/>
			<PinRef compName="U5" pinName="19"/>
		</Net>
		<Net name="MEM3SEL">
			<PinRef compName="U8" pinName="12"/>
			<PinRef compName="U4" pinName="20"/>
		</Net>
		<Net name="MEM2SEL">
			<PinRef compName="U8" pinName="13"/>
			<PinRef compName="U3" pinName="20"/>
		</Net>
		<Net name="MEM1SEL">
			<PinRef compName="U8" pinName="14"/>
			<PinRef compName="U2" pinName="20"/>
		</Net>
		<Net name="MEM0SEL">
			<PinRef compName="U8" pinName="15"/>
			<PinRef compName="U1" pinName="20"/>
		</Net>
		<Net name="NETJ3_3">
			<PinRef compName="J3" pinName="3"/>
			<PinRef compName="U11" pinName="6"/>
		</Net>
		<Net name="NETJ2_3">
			<PinRef compName="J2" pinName="3"/>
			<PinRef compName="U11" pinName="3"/>
		</Net>
		<Net name="INT">
			<PinRef compName="U6" pinName="5"/>
			<PinRef compName="R7" pinName="2"/>
			<PinRef compName="U5" pinName="16"/>
		</Net>
		<Net name="GND">
			<PinRef compName="C1" pinName="1"/>
			<PinRef compName="C7" pinName="2"/>
			<PinRef compName="C5" pinName="1"/>
			<PinRef compName="C6" pinName="1"/>
			<PinRef compName="C4" pinName="1"/>
			<PinRef compName="SW2" pinName="1"/>
			<PinRef compName="J2" pinName="5"/>
			<PinRef compName="U8" pinName="8"/>
			<PinRef compName="U12" pinName="11"/>
			<PinRef compName="U12" pinName="8"/>
			<PinRef compName="U6" pinName="18"/>
			<PinRef compName="U6" pinName="19"/>
			<PinRef compName="U6" pinName="22"/>
			<PinRef compName="U6" pinName="23"/>
			<PinRef compName="U6" pinName="31"/>
			<PinRef compName="U7" pinName="35"/>
			<PinRef compName="U7" pinName="7"/>
			<PinRef compName="C8" pinName="2"/>
			<PinRef compName="J1" pinName="1"/>
			<PinRef compName="U1" pinName="14"/>
			<PinRef compName="U1" pinName="22"/>
			<PinRef compName="U9" pinName="7"/>
			<PinRef compName="U2" pinName="14"/>
			<PinRef compName="U2" pinName="22"/>
			<PinRef compName="U4" pinName="14"/>
			<PinRef compName="U4" pinName="22"/>
			<PinRef compName="C3" pinName="1"/>
			<PinRef compName="J3" pinName="5"/>
			<PinRef compName="U11" pinName="7"/>
			<PinRef compName="U10" pinName="7"/>
			<PinRef compName="J4" pinName="1"/>
			<PinRef compName="J4" pinName="11"/>
			<PinRef compName="J4" pinName="13"/>
			<PinRef compName="J4" pinName="15"/>
			<PinRef compName="J4" pinName="17"/>
			<PinRef compName="J4" pinName="19"/>
			<PinRef compName="J4" pinName="21"/>
			<PinRef compName="J4" pinName="23"/>
			<PinRef compName="J4" pinName="25"/>
			<PinRef compName="J4" pinName="27"/>
			<PinRef compName="J4" pinName="29"/>
			<PinRef compName="J4" pinName="3"/>
			<PinRef compName="J4" pinName="31"/>
			<PinRef compName="J4" pinName="33"/>
			<PinRef compName="J4" pinName="35"/>
			<PinRef compName="J4" pinName="37"/>
			<PinRef compName="J4" pinName="39"/>
			<PinRef compName="J4" pinName="5"/>
			<PinRef compName="J4" pinName="7"/>
			<PinRef compName="J4" pinName="9"/>
			<PinRef compName="U5" pinName="29"/>
			<PinRef compName="U3" pinName="14"/>
			<PinRef compName="U3" pinName="22"/>
		</Net>
		<Net name="D7">
			<PinRef compName="U6" pinName="4"/>
			<PinRef compName="U7" pinName="27"/>
			<PinRef compName="U1" pinName="19"/>
			<PinRef compName="U2" pinName="19"/>
			<PinRef compName="U4" pinName="19"/>
			<PinRef compName="U5" pinName="13"/>
			<PinRef compName="U3" pinName="19"/>
		</Net>
		<Net name="D6">
			<PinRef compName="U6" pinName="37"/>
			<PinRef compName="U7" pinName="28"/>
			<PinRef compName="U1" pinName="18"/>
			<PinRef compName="U2" pinName="18"/>
			<PinRef compName="U4" pinName="18"/>
			<PinRef compName="U5" pinName="10"/>
			<PinRef compName="U3" pinName="18"/>
		</Net>
		<Net name="D5">
			<PinRef compName="U6" pinName="3"/>
			<PinRef compName="U7" pinName="29"/>
			<PinRef compName="U1" pinName="17"/>
			<PinRef compName="U2" pinName="17"/>
			<PinRef compName="U4" pinName="17"/>
			<PinRef compName="U5" pinName="9"/>
			<PinRef compName="U3" pinName="17"/>
		</Net>
		<Net name="D4">
			<PinRef compName="U6" pinName="38"/>
			<PinRef compName="U7" pinName="30"/>
			<PinRef compName="U1" pinName="16"/>
			<PinRef compName="U2" pinName="16"/>
			<PinRef compName="U4" pinName="16"/>
			<PinRef compName="U5" pinName="7"/>
			<PinRef compName="U3" pinName="16"/>
		</Net>
		<Net name="D3">
			<PinRef compName="U6" pinName="2"/>
			<PinRef compName="U7" pinName="31"/>
			<PinRef compName="U1" pinName="15"/>
			<PinRef compName="U2" pinName="15"/>
			<PinRef compName="U4" pinName="15"/>
			<PinRef compName="U5" pinName="8"/>
			<PinRef compName="U3" pinName="15"/>
		</Net>
		<Net name="D2">
			<PinRef compName="U6" pinName="39"/>
			<PinRef compName="U7" pinName="32"/>
			<PinRef compName="U1" pinName="13"/>
			<PinRef compName="U2" pinName="13"/>
			<PinRef compName="U4" pinName="13"/>
			<PinRef compName="U5" pinName="12"/>
			<PinRef compName="U3" pinName="13"/>
		</Net>
		<Net name="D1">
			<PinRef compName="U6" pinName="1"/>
			<PinRef compName="U7" pinName="33"/>
			<PinRef compName="U1" pinName="12"/>
			<PinRef compName="U2" pinName="12"/>
			<PinRef compName="U4" pinName="12"/>
			<PinRef compName="U5" pinName="15"/>
			<PinRef compName="U3" pinName="12"/>
		</Net>
		<Net name="D0">
			<PinRef compName="U6" pinName="40"/>
			<PinRef compName="U7" pinName="34"/>
			<PinRef compName="U1" pinName="11"/>
			<PinRef compName="U2" pinName="11"/>
			<PinRef compName="U4" pinName="11"/>
			<PinRef compName="U5" pinName="14"/>
			<PinRef compName="U3" pinName="11"/>
		</Net>
		<Net name="CPUCLK">
			<PinRef compName="U6" pinName="20"/>
			<PinRef compName="U9" pinName="6"/>
			<PinRef compName="R5" pinName="2"/>
			<PinRef compName="U5" pinName="6"/>
		</Net>
		<Net name="NETC10_2">
			<PinRef compName="C10" pinName="2"/>
			<PinRef compName="U9" pinName="3"/>
			<PinRef compName="R2" pinName="1"/>
		</Net>
		<Net name="NETC10_1">
			<PinRef compName="C10" pinName="1"/>
			<PinRef compName="U9" pinName="2"/>
			<PinRef compName="R1" pinName="2"/>
		</Net>
		<Net name="NETC9_2">
			<PinRef compName="C9" pinName="2"/>
			<PinRef compName="U9" pinName="11"/>
			<PinRef compName="R4" pinName="1"/>
		</Net>
		<Net name="NETC9_1">
			<PinRef compName="C9" pinName="1"/>
			<PinRef compName="U9" pinName="12"/>
			<PinRef compName="R3" pinName="2"/>
		</Net>
		<Net name="NETSW1_9">
			<PinRef compName="SW1" pinName="10"/>
			<PinRef compName="SW1" pinName="11"/>
			<PinRef compName="SW1" pinName="12"/>
			<PinRef compName="SW1" pinName="13"/>
			<PinRef compName="SW1" pinName="14"/>
			<PinRef compName="SW1" pinName="15"/>
			<PinRef compName="SW1" pinName="16"/>
			<PinRef compName="SW1" pinName="9"/>
			<PinRef compName="U6" pinName="13"/>
			<PinRef compName="U6" pinName="14"/>
			<PinRef compName="U6" pinName="27"/>
		</Net>
		<Net name="A15">
			<PinRef compName="U8" pinName="3"/>
			<PinRef compName="U5" pinName="5"/>
		</Net>
		<Net name="A14">
			<PinRef compName="U8" pinName="2"/>
			<PinRef compName="U5" pinName="4"/>
		</Net>
		<Net name="A13">
			<PinRef compName="U8" pinName="1"/>
			<PinRef compName="U5" pinName="3"/>
		</Net>
		<Net name="A12">
			<PinRef compName="U1" pinName="2"/>
			<PinRef compName="U2" pinName="2"/>
			<PinRef compName="U4" pinName="2"/>
			<PinRef compName="U5" pinName="2"/>
			<PinRef compName="U3" pinName="2"/>
		</Net>
		<Net name="A11">
			<PinRef compName="U1" pinName="23"/>
			<PinRef compName="U2" pinName="23"/>
			<PinRef compName="U4" pinName="23"/>
			<PinRef compName="U5" pinName="1"/>
			<PinRef compName="U3" pinName="23"/>
		</Net>
		<Net name="A10">
			<PinRef compName="U1" pinName="21"/>
			<PinRef compName="U2" pinName="21"/>
			<PinRef compName="U4" pinName="21"/>
			<PinRef compName="U5" pinName="40"/>
			<PinRef compName="U3" pinName="21"/>
		</Net>
		<Net name="A9">
			<PinRef compName="U1" pinName="24"/>
			<PinRef compName="U2" pinName="24"/>
			<PinRef compName="U4" pinName="24"/>
			<PinRef compName="U5" pinName="39"/>
			<PinRef compName="U3" pinName="24"/>
		</Net>
		<Net name="A8">
			<PinRef compName="U1" pinName="25"/>
			<PinRef compName="U2" pinName="25"/>
			<PinRef compName="U4" pinName="25"/>
			<PinRef compName="U5" pinName="38"/>
			<PinRef compName="U3" pinName="25"/>
		</Net>
		<Net name="A7">
			<PinRef compName="U1" pinName="3"/>
			<PinRef compName="U2" pinName="3"/>
			<PinRef compName="U4" pinName="3"/>
			<PinRef compName="U5" pinName="37"/>
			<PinRef compName="U3" pinName="3"/>
		</Net>
		<Net name="A6">
			<PinRef compName="U1" pinName="4"/>
			<PinRef compName="U2" pinName="4"/>
			<PinRef compName="U4" pinName="4"/>
			<PinRef compName="U5" pinName="36"/>
			<PinRef compName="U3" pinName="4"/>
		</Net>
		<Net name="A5">
			<PinRef compName="U1" pinName="5"/>
			<PinRef compName="U2" pinName="5"/>
			<PinRef compName="U4" pinName="5"/>
			<PinRef compName="U5" pinName="35"/>
			<PinRef compName="U3" pinName="5"/>
		</Net>
		<Net name="A4">
			<PinRef compName="U1" pinName="6"/>
			<PinRef compName="U2" pinName="6"/>
			<PinRef compName="U4" pinName="6"/>
			<PinRef compName="U5" pinName="34"/>
			<PinRef compName="U3" pinName="6"/>
		</Net>
		<Net name="A3">
			<PinRef compName="U1" pinName="7"/>
			<PinRef compName="U2" pinName="7"/>
			<PinRef compName="U4" pinName="7"/>
			<PinRef compName="U5" pinName="33"/>
			<PinRef compName="U3" pinName="7"/>
		</Net>
		<Net name="A2">
			<PinRef compName="U1" pinName="8"/>
			<PinRef compName="U2" pinName="8"/>
			<PinRef compName="U4" pinName="8"/>
			<PinRef compName="U5" pinName="32"/>
			<PinRef compName="U3" pinName="8"/>
		</Net>
		<Net name="A1">
			<PinRef compName="U6" pinName="33"/>
			<PinRef compName="U7" pinName="8"/>
			<PinRef compName="U1" pinName="9"/>
			<PinRef compName="U2" pinName="9"/>
			<PinRef compName="U4" pinName="9"/>
			<PinRef compName="U5" pinName="31"/>
			<PinRef compName="U3" pinName="9"/>
		</Net>
		<Net name="A0">
			<PinRef compName="U6" pinName="34"/>
			<PinRef compName="U7" pinName="9"/>
			<PinRef compName="U1" pinName="10"/>
			<PinRef compName="U2" pinName="10"/>
			<PinRef compName="U4" pinName="10"/>
			<PinRef compName="U5" pinName="30"/>
			<PinRef compName="U3" pinName="10"/>
		</Net>
		<Net name="19200">
			<PinRef compName="SW1" pinName="8"/>
			<PinRef compName="U12" pinName="5"/>
		</Net>
		<Net name="9600">
			<PinRef compName="SW1" pinName="7"/>
			<PinRef compName="U12" pinName="3"/>
		</Net>
		<Net name="4800">
			<PinRef compName="SW1" pinName="6"/>
			<PinRef compName="U12" pinName="2"/>
		</Net>
		<Net name="1200">
			<PinRef compName="SW1" pinName="5"/>
			<PinRef compName="U12" pinName="4"/>
		</Net>
		<Net name="600">
			<PinRef compName="SW1" pinName="4"/>
			<PinRef compName="U12" pinName="13"/>
		</Net>
		<Net name="300">
			<PinRef compName="SW1" pinName="3"/>
			<PinRef compName="U12" pinName="12"/>
		</Net>
		<Net name="150">
			<PinRef compName="SW1" pinName="2"/>
			<PinRef compName="U12" pinName="14"/>
		</Net>
		<Net name="75">
			<PinRef compName="SW1" pinName="1"/>
			<PinRef compName="U12" pinName="15"/>
		</Net>
		<Net name="-12">
			<PinRef compName="J1" pinName="4"/>
			<PinRef compName="U11" pinName="1"/>
		</Net>
		<Net name="+12">
			<PinRef compName="J1" pinName="3"/>
			<PinRef compName="U11" pinName="14"/>
		</Net>
		<Net name="NETU6_12">
			<PinRef compName="U6" pinName="12"/>
			<PinRef compName="U10" pinName="3"/>
		</Net>
		<Net name="NETU6_28">
			<PinRef compName="U6" pinName="28"/>
			<PinRef compName="U10" pinName="6"/>
		</Net>
		<Net name="NETU6_15">
			<PinRef compName="U6" pinName="15"/>
			<PinRef compName="U11" pinName="2"/>
		</Net>
		<Net name="SIOSEL">
			<PinRef compName="U8" pinName="11"/>
			<PinRef compName="U6" pinName="35"/>
		</Net>
		<Net name="M1">
			<PinRef compName="U6" pinName="8"/>
			<PinRef compName="U5" pinName="27"/>
		</Net>
		<Net name="IORQ">
			<PinRef compName="U6" pinName="36"/>
			<PinRef compName="U5" pinName="20"/>
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
				<NetRef name="VCC"/>
				<NetRef name="GND"/>
			</ExcludedNets>
		</SignalSearchSettings>
	</HiSpeedRules>

	<Rules version="2.0">
		<RulesWidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.254" widthNom="0.254">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.508" widthNom="0.508">
				<AllLayers/>
				<ObjectsAffected>
					<NetRef name="VCC"/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.508" widthNom="0.508">
				<AllLayers/>
				<ObjectsAffected>
					<NetRef name="GND"/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.381" widthNom="0.381">
				<AllLayers/>
				<ObjectsAffected>
					<NetRef name="-12"/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.381" widthNom="0.381">
				<AllLayers/>
				<ObjectsAffected>
					<NetRef name="+12"/>
				</ObjectsAffected>
			</WidthOfWires>
		</RulesWidthOfWires>
		<RulesClearancesNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0.254" clrnNom="0.381">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
					<AllNets/>
				</ObjectsAffected>
			</ClearanceNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0.254" clrnNom="0.381">
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
			<ViastacksOfNets enabled="on">
				<ObjectsAffected>
					<NetRef name="VCC"/>
				</ObjectsAffected>
				<Viastacks>
					<ViastackRef name="(Default)"/>
				</Viastacks>
			</ViastacksOfNets>
			<ViastacksOfNets enabled="on">
				<ObjectsAffected>
					<NetRef name="GND"/>
				</ObjectsAffected>
				<Viastacks>
					<ViastackRef name="(Default)"/>
				</Viastacks>
			</ViastacksOfNets>
		</RulesViastacksOfNets>
		<NetProperties>
			<NetProperty flexfix="off" route="on">
				<NetRef name="WR"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="VCC"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETJ3_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETJ2_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETU6_26"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="RESET"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="RD"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="RAWBAUD"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETR4_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETR3_1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETR2_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETR1_1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PPISEL"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PC3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PC2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PC1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PC0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PB7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PB6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PB5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PB4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PB3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PB2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PB1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PB0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETU5_19"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="MEM3SEL"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="MEM2SEL"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="MEM1SEL"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="MEM0SEL"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETJ3_3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETJ2_3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="INT"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="GND"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="CPUCLK"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETC10_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETC10_1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETC9_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETC9_1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETSW1_9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="19200"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="9600"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="4800"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="1200"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="600"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="300"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="150"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="75"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETU6_12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETU6_28"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NETU6_15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SIOSEL"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="M1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="IORQ"/>
			</NetProperty>
		</NetProperties>
		<PadConnectSettings mode="AutoConnect"/>
	</Rules>

	<Connectivity version="1.3">
		<Vias>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="A15"/>
				<Org x="150.495" y="209.931"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="INT"/>
				<Org x="157.48" y="186.182"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="PPISEL"/>
				<Org x="156.464" y="210.058"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="NETU6_15"/>
				<Org x="157.226" y="215.011"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="A13"/>
				<Org x="171.958" y="195.834"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="MEM1SEL"/>
				<Org x="171.45" y="194.056"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="MEM2SEL"/>
				<Org x="181.61" y="188.468"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="MEM3SEL"/>
				<Org x="203.454" y="177.8"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="A2"/>
				<Org x="202.438" y="203.454"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="PB6"/>
				<Org x="216.789" y="187.2234"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="D4"/>
				<Org x="169.926" y="213.614"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="D1"/>
				<Org x="180.086" y="220.599"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="NETU5_19"/>
				<Org x="152.146" y="181.356"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="SIOSEL"/>
				<Org x="153.3652" y="207.899"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="IORQ"/>
				<Org x="183.134" y="184.912"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="IORQ"/>
				<Org x="182.118" y="218.44"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="A14"/>
				<Org x="152.146" y="221.488"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="A3"/>
				<Org x="182.626" y="206.248"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="RD"/>
				<Org x="190.754" y="212.725"/>
			</Via>
			<Via>
				<ViastackRef name="V:EX40Y40D28A"/>
				<NetRef name="D2"/>
				<Org x="204.978" y="221.996"/>
			</Via>
		</Vias>
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="WR"/>
				<Subwire width="0.254">
					<Start x="193.294" y="169.672"/>
					<TrackLine>
						<End x="194.691" y="171.069"/>
					</TrackLine>
					<TrackLine>
						<End x="194.691" y="175.006"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5494" y="178.1476"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5494" y="180.6274"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="181.864"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="WR"/>
				<Subwire width="0.254">
					<Start x="212.09" y="217.424"/>
					<TrackLine>
						<End x="203.2" y="226.314"/>
					</TrackLine>
					<TrackLine>
						<End x="192.532" y="226.314"/>
					</TrackLine>
					<TrackLine>
						<End x="191.516" y="225.298"/>
					</TrackLine>
					<TrackLine>
						<End x="191.516" y="224.79"/>
					</TrackLine>
					<TrackLine>
						<End x="192.532" y="223.774"/>
					</TrackLine>
					<TrackLine>
						<End x="193.04" y="223.774"/>
					</TrackLine>
					<TrackLine>
						<End x="193.802" y="223.012"/>
					</TrackLine>
					<TrackLine>
						<End x="193.802" y="221.996"/>
					</TrackLine>
					<TrackLine>
						<End x="193.04" y="221.234"/>
					</TrackLine>
					<TrackLine>
						<End x="192.532" y="221.234"/>
					</TrackLine>
					<TrackLine>
						<End x="189.23" y="217.932"/>
					</TrackLine>
					<TrackLine>
						<End x="189.23" y="185.42"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="181.864"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="125.73" y="163.068"/>
					<TrackLine>
						<End x="125.73" y="165.608"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="135.89" y="155.448"/>
					<TrackLine>
						<End x="135.89" y="156.718"/>
					</TrackLine>
					<TrackLine>
						<End x="138.176" y="159.004"/>
					</TrackLine>
					<TrackLine>
						<End x="138.176" y="170.942"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="140.97" y="195.072"/>
					<TrackLine>
						<End x="140.97" y="224.536"/>
					</TrackLine>
					<TrackLine>
						<End x="144.018" y="227.584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="149.606" y="175.768"/>
					<TrackLine>
						<End x="151.13" y="175.768"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="149.606" y="175.768"/>
					<TrackLine>
						<End x="149.606" y="184.912"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="187.452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="153.162" y="204.216"/>
					<TrackLine>
						<End x="154.686" y="202.692"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="200.152"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="158.75" y="207.264"/>
					<TrackLine>
						<End x="161.036" y="209.55"/>
					</TrackLine>
					<TrackLine>
						<End x="161.036" y="212.598"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="214.884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="177.546" y="186.944"/>
					<TrackLine>
						<End x="179.324" y="188.722"/>
					</TrackLine>
					<TrackLine>
						<End x="179.324" y="200.406"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="202.184"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="193.294" y="172.212"/>
					<TrackLine>
						<End x="188.722" y="172.212"/>
					</TrackLine>
					<TrackLine>
						<End x="187.706" y="173.228"/>
					</TrackLine>
					<TrackLine>
						<End x="187.706" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="193.294" y="167.132"/>
					<TrackLine>
						<End x="191.6696" y="168.7564"/>
					</TrackLine>
					<TrackLine>
						<End x="191.6696" y="170.5876"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="192.786" y="186.944"/>
					<TrackLine>
						<End x="192.786" y="189.484"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="212.598" y="172.212"/>
					<TrackLine>
						<End x="210.82" y="170.434"/>
					</TrackLine>
					<TrackLine>
						<End x="210.82" y="168.91"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="167.132"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="207.01" y="175.768"/>
					<TrackLine>
						<End x="209.042" y="175.768"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="212.598" y="167.132"/>
					<TrackLine>
						<End x="216.154" y="163.576"/>
					</TrackLine>
					<TrackLine>
						<End x="216.154" y="150.876"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETU6_26"/>
				<Subwire width="0.254">
					<Start x="126.238" y="217.424"/>
					<TrackLine>
						<End x="126.238" y="219.964"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RESET"/>
				<Subwire width="0.254">
					<Start x="221.234" y="140.716"/>
					<TrackLine>
						<End x="221.234" y="150.876"/>
					</TrackLine>
					<TrackLine>
						<End x="223.266" y="152.908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RD"/>
				<Subwire width="0.254">
					<Start x="190.754" y="212.725"/>
					<TrackLine>
						<End x="190.754" y="184.912"/>
					</TrackLine>
					<TrackLine>
						<End x="192.278" y="183.388"/>
					</TrackLine>
					<TrackLine>
						<End x="193.421" y="183.388"/>
					</TrackLine>
					<TrackLine>
						<End x="194.056" y="182.753"/>
					</TrackLine>
					<TrackLine>
						<End x="194.056" y="180.594"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="179.324"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RAWBAUD"/>
				<Subwire width="0.254">
					<Start x="144.018" y="212.344"/>
					<TrackLine>
						<End x="143.002" y="211.328"/>
					</TrackLine>
					<TrackLine>
						<End x="143.002" y="194.056"/>
					</TrackLine>
					<TrackLine>
						<End x="137.16" y="188.214"/>
					</TrackLine>
					<TrackLine>
						<End x="137.16" y="170.2562"/>
					</TrackLine>
					<TrackLine>
						<End x="136.3218" y="169.418"/>
					</TrackLine>
					<TrackLine>
						<End x="134.2644" y="169.418"/>
					</TrackLine>
					<TrackLine>
						<End x="132.842" y="167.9956"/>
					</TrackLine>
					<TrackLine>
						<End x="132.842" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="134.366" y="140.208"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="140.208"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETR4_2"/>
				<Subwire width="0.254">
					<Start x="135.89" y="145.288"/>
					<TrackLine>
						<End x="134.112" y="147.066"/>
					</TrackLine>
					<TrackLine>
						<End x="134.112" y="158.75"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="160.528"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETR4_2"/>
				<Subwire width="0.254">
					<Start x="135.89" y="142.748"/>
					<TrackLine>
						<End x="135.89" y="145.288"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETR3_1"/>
				<Subwire width="0.254">
					<Start x="125.73" y="168.148"/>
					<TrackLine>
						<End x="127" y="169.418"/>
					</TrackLine>
					<TrackLine>
						<End x="127" y="171.6024"/>
					</TrackLine>
					<TrackLine>
						<End x="126.6444" y="171.958"/>
					</TrackLine>
					<TrackLine>
						<End x="124.8156" y="171.958"/>
					</TrackLine>
					<TrackLine>
						<End x="123.444" y="170.5864"/>
					</TrackLine>
					<TrackLine>
						<End x="123.444" y="156.21"/>
					</TrackLine>
					<TrackLine>
						<End x="121.666" y="154.432"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETR2_2"/>
				<Subwire width="0.254">
					<Start x="128.27" y="145.288"/>
					<TrackLine>
						<End x="128.27" y="147.828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETR1_1"/>
				<Subwire width="0.254">
					<Start x="121.666" y="147.828"/>
					<TrackLine>
						<End x="121.666" y="150.368"/>
					</TrackLine>
					<TrackLine>
						<End x="126.746" y="155.448"/>
					</TrackLine>
					<TrackLine>
						<End x="128.27" y="155.448"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETR1_1"/>
				<Subwire width="0.254">
					<Start x="128.27" y="155.448"/>
					<TrackLine>
						<End x="124.206" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="124.206" y="169.164"/>
					</TrackLine>
					<TrackLine>
						<End x="125.73" y="170.688"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PPISEL"/>
				<Subwire width="0.254">
					<Start x="154.686" y="184.912"/>
					<TrackLine>
						<End x="155.702" y="185.928"/>
					</TrackLine>
					<TrackLine>
						<End x="155.702" y="189.23"/>
					</TrackLine>
					<TrackLine>
						<End x="156.464" y="189.992"/>
					</TrackLine>
					<TrackLine>
						<End x="156.464" y="210.058"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PB6"/>
				<Subwire width="0.254">
					<Start x="216.789" y="187.2234"/>
					<TrackLine>
						<End x="216.916" y="187.0964"/>
					</TrackLine>
					<TrackLine>
						<End x="216.916" y="169.418"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="168.148"/>
					</TrackLine>
					<TrackLine>
						<End x="218.694" y="168.148"/>
					</TrackLine>
					<TrackLine>
						<End x="219.456" y="168.91"/>
					</TrackLine>
					<TrackLine>
						<End x="219.456" y="170.942"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PA7"/>
				<Subwire width="0.254">
					<Start x="212.09" y="219.964"/>
					<TrackLine>
						<End x="210.566" y="221.488"/>
					</TrackLine>
					<TrackLine>
						<End x="210.566" y="222.504"/>
					</TrackLine>
					<TrackLine>
						<End x="211.836" y="223.774"/>
					</TrackLine>
					<TrackLine>
						<End x="213.233" y="223.774"/>
					</TrackLine>
					<TrackLine>
						<End x="217.043" y="219.964"/>
					</TrackLine>
					<TrackLine>
						<End x="219.964" y="219.964"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="219.202"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="217.932"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PA6"/>
				<Subwire width="0.254">
					<Start x="212.09" y="222.504"/>
					<TrackLine>
						<End x="215.138" y="219.456"/>
					</TrackLine>
					<TrackLine>
						<End x="219.456" y="219.456"/>
					</TrackLine>
					<TrackLine>
						<End x="219.71" y="219.202"/>
					</TrackLine>
					<TrackLine>
						<End x="219.71" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="215.392"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PA5"/>
				<Subwire width="0.254">
					<Start x="212.09" y="225.044"/>
					<TrackLine>
						<End x="212.979" y="225.044"/>
					</TrackLine>
					<TrackLine>
						<End x="217.4641" y="220.5589"/>
					</TrackLine>
					<TrackLine>
						<End x="220.1311" y="220.5589"/>
					</TrackLine>
					<TrackLine>
						<End x="221.742" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="221.742" y="213.868"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="212.852"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PA4"/>
				<Subwire width="0.254">
					<Start x="220.726" y="210.312"/>
					<TrackLine>
						<End x="222.758" y="212.344"/>
					</TrackLine>
					<TrackLine>
						<End x="222.758" y="223.012"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="227.584"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="227.584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PA0"/>
				<Subwire width="0.254">
					<Start x="196.85" y="219.964"/>
					<TrackLine>
						<End x="199.898" y="223.012"/>
					</TrackLine>
					<TrackLine>
						<End x="205.74" y="223.012"/>
					</TrackLine>
					<TrackLine>
						<End x="209.042" y="219.71"/>
					</TrackLine>
					<TrackLine>
						<End x="209.042" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="211.836" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="212.344" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="215.138" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="201.676"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="200.152"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETU5_19"/>
				<Subwire width="0.254">
					<Start x="152.146" y="181.356"/>
					<TrackLine>
						<End x="152.146" y="184.912"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="189.992"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETU5_19"/>
				<Subwire width="0.254">
					<Start x="147.066" y="189.992"/>
					<TrackLine>
						<End x="147.066" y="192.532"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MEM3SEL"/>
				<Subwire width="0.254">
					<Start x="203.454" y="177.8"/>
					<TrackLine>
						<End x="203.708" y="177.546"/>
					</TrackLine>
					<TrackLine>
						<End x="203.708" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="151.892"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MEM2SEL"/>
				<Subwire width="0.254">
					<Start x="181.61" y="188.468"/>
					<TrackLine>
						<End x="181.356" y="188.214"/>
					</TrackLine>
					<TrackLine>
						<End x="181.356" y="156.21"/>
					</TrackLine>
					<TrackLine>
						<End x="185.674" y="151.892"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="151.892"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MEM1SEL"/>
				<Subwire width="0.254">
					<Start x="173.99" y="151.892"/>
					<TrackLine>
						<End x="172.466" y="153.416"/>
					</TrackLine>
					<TrackLine>
						<End x="172.466" y="193.04"/>
					</TrackLine>
					<TrackLine>
						<End x="171.45" y="194.056"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MEM0SEL"/>
				<Subwire width="0.254">
					<Start x="154.686" y="151.892"/>
					<TrackLine>
						<End x="152.654" y="153.924"/>
					</TrackLine>
					<TrackLine>
						<End x="152.654" y="166.624"/>
					</TrackLine>
					<TrackLine>
						<End x="154.432" y="168.402"/>
					</TrackLine>
					<TrackLine>
						<End x="154.94" y="168.402"/>
					</TrackLine>
					<TrackLine>
						<End x="155.702" y="169.164"/>
					</TrackLine>
					<TrackLine>
						<End x="155.702" y="177.8"/>
					</TrackLine>
					<TrackLine>
						<End x="153.162" y="180.34"/>
					</TrackLine>
					<TrackLine>
						<End x="153.162" y="196.088"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="197.612"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETJ2_3"/>
				<Subwire width="0.254">
					<Start x="122.174" y="180.2892"/>
					<TrackLine>
						<End x="123.7742" y="180.2892"/>
					</TrackLine>
					<TrackLine>
						<End x="128.27" y="184.785"/>
					</TrackLine>
					<TrackLine>
						<End x="128.27" y="220.472"/>
					</TrackLine>
					<TrackLine>
						<End x="126.238" y="222.504"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="INT"/>
				<Subwire width="0.254">
					<Start x="157.48" y="186.182"/>
					<TrackLine>
						<End x="157.48" y="187.452"/>
					</TrackLine>
					<TrackLine>
						<End x="158.242" y="188.214"/>
					</TrackLine>
					<TrackLine>
						<End x="160.02" y="188.214"/>
					</TrackLine>
					<TrackLine>
						<End x="162.56" y="190.754"/>
					</TrackLine>
					<TrackLine>
						<End x="162.56" y="213.614"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="217.424"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="122.174" y="219.3544"/>
					<TrackLine>
						<End x="125.3744" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="126.619" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="127.508" y="215.265"/>
					</TrackLine>
					<TrackLine>
						<End x="127.508" y="213.614"/>
					</TrackLine>
					<TrackLine>
						<End x="126.238" y="212.344"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="140.97" y="189.992"/>
					<TrackLine>
						<End x="142.494" y="188.468"/>
					</TrackLine>
					<TrackLine>
						<End x="145.034" y="188.468"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="145.034" y="188.468"/>
					<TrackLine>
						<End x="145.034" y="184.404"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="182.372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="145.034" y="188.468"/>
					<TrackLine>
						<End x="145.034" y="201.168"/>
					</TrackLine>
					<TrackLine>
						<End x="148.082" y="204.216"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="158.75" y="139.192"/>
					<TrackLine>
						<End x="156.464" y="141.478"/>
					</TrackLine>
					<TrackLine>
						<End x="156.464" y="155.194"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="156.972"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="158.75" y="181.864"/>
					<TrackLine>
						<End x="163.322" y="177.292"/>
					</TrackLine>
					<TrackLine>
						<End x="163.322" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="173.99" y="156.972"/>
					<TrackLine>
						<End x="176.022" y="154.94"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="141.224"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="139.192"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="197.358" y="139.192"/>
					<TrackLine>
						<End x="195.58" y="140.97"/>
					</TrackLine>
					<TrackLine>
						<End x="195.58" y="154.686"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="156.972"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="169.672"/>
					<TrackLine>
						<End x="218.186" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="172.212"/>
					<TrackLine>
						<End x="218.186" y="174.752"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="177.292"/>
					<TrackLine>
						<End x="218.186" y="179.832"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="179.832"/>
					<TrackLine>
						<End x="218.186" y="182.372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="184.912"/>
					<TrackLine>
						<End x="218.186" y="187.452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="187.452"/>
					<TrackLine>
						<End x="218.186" y="189.992"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="192.532"/>
					<TrackLine>
						<End x="218.186" y="195.072"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="195.072"/>
					<TrackLine>
						<End x="218.186" y="197.612"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="200.152"/>
					<TrackLine>
						<End x="218.186" y="202.692"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="202.692"/>
					<TrackLine>
						<End x="218.186" y="205.232"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="207.772"/>
					<TrackLine>
						<End x="218.186" y="210.312"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="210.312"/>
					<TrackLine>
						<End x="218.186" y="212.852"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="215.392"/>
					<TrackLine>
						<End x="218.186" y="217.932"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="144.018" y="214.884"/>
					<TrackLine>
						<End x="145.542" y="213.36"/>
					</TrackLine>
					<TrackLine>
						<End x="145.542" y="206.756"/>
					</TrackLine>
					<TrackLine>
						<End x="148.082" y="204.216"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="158.75" y="181.864"/>
					<TrackLine>
						<End x="158.75" y="184.404"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="173.99" y="181.864"/>
					<TrackLine>
						<End x="173.99" y="184.404"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="174.752"/>
					<TrackLine>
						<End x="218.186" y="177.292"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="182.372"/>
					<TrackLine>
						<End x="218.186" y="184.912"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="189.992"/>
					<TrackLine>
						<End x="218.186" y="192.532"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="197.612"/>
					<TrackLine>
						<End x="218.186" y="200.152"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="205.232"/>
					<TrackLine>
						<End x="218.186" y="207.772"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="218.186" y="212.852"/>
					<TrackLine>
						<End x="218.186" y="215.392"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="223.266" y="147.828"/>
					<TrackLine>
						<End x="226.314" y="144.78"/>
					</TrackLine>
					<TrackLine>
						<End x="226.314" y="140.716"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="139.446" y="139.192"/>
					<TrackLine>
						<End x="144.526" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="144.526" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="144.526" y="175.768"/>
					<TrackLine>
						<End x="144.526" y="179.832"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="182.372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="173.99" y="156.972"/>
					<TrackLine>
						<End x="175.26" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="175.26" y="180.594"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="181.864"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="173.99" y="184.404"/>
					<TrackLine>
						<End x="175.133" y="185.547"/>
					</TrackLine>
					<TrackLine>
						<End x="175.133" y="203.581"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="204.724"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.254">
					<Start x="154.686" y="149.352"/>
					<TrackLine>
						<End x="155.702" y="150.368"/>
					</TrackLine>
					<TrackLine>
						<End x="155.702" y="152.654"/>
					</TrackLine>
					<TrackLine>
						<End x="155.194" y="153.162"/>
					</TrackLine>
					<TrackLine>
						<End x="154.432" y="153.162"/>
					</TrackLine>
					<TrackLine>
						<End x="153.416" y="154.178"/>
					</TrackLine>
					<TrackLine>
						<End x="153.416" y="157.226"/>
					</TrackLine>
					<TrackLine>
						<End x="154.432" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="155.194" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="156.464" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="156.464" y="188.976"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="189.738"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="208.026"/>
					</TrackLine>
					<TrackLine>
						<End x="157.734" y="208.534"/>
					</TrackLine>
					<TrackLine>
						<End x="157.734" y="210.82"/>
					</TrackLine>
					<TrackLine>
						<End x="155.956" y="212.598"/>
					</TrackLine>
					<TrackLine>
						<End x="155.956" y="217.17"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="219.964"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.254">
					<Start x="212.09" y="194.564"/>
					<TrackLine>
						<End x="206.756" y="189.23"/>
					</TrackLine>
					<TrackLine>
						<End x="206.756" y="179.451"/>
					</TrackLine>
					<TrackLine>
						<End x="204.978" y="177.673"/>
					</TrackLine>
					<TrackLine>
						<End x="204.978" y="168.656"/>
					</TrackLine>
					<TrackLine>
						<End x="210.566" y="163.068"/>
					</TrackLine>
					<TrackLine>
						<End x="213.106" y="163.068"/>
					</TrackLine>
					<TrackLine>
						<End x="213.614" y="162.56"/>
					</TrackLine>
					<TrackLine>
						<End x="213.614" y="150.368"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="149.352"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.254">
					<Start x="173.99" y="146.812"/>
					<TrackLine>
						<End x="171.704" y="149.098"/>
					</TrackLine>
					<TrackLine>
						<End x="171.704" y="192.151"/>
					</TrackLine>
					<TrackLine>
						<End x="170.434" y="193.421"/>
					</TrackLine>
					<TrackLine>
						<End x="170.434" y="209.296"/>
					</TrackLine>
					<TrackLine>
						<End x="172.212" y="211.074"/>
					</TrackLine>
					<TrackLine>
						<End x="174.244" y="211.074"/>
					</TrackLine>
					<TrackLine>
						<End x="175.006" y="211.836"/>
					</TrackLine>
					<TrackLine>
						<End x="175.006" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="219.964"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.254">
					<Start x="212.09" y="197.104"/>
					<TrackLine>
						<End x="214.122" y="195.072"/>
					</TrackLine>
					<TrackLine>
						<End x="214.122" y="167.132"/>
					</TrackLine>
					<TrackLine>
						<End x="216.789" y="164.465"/>
					</TrackLine>
					<TrackLine>
						<End x="216.789" y="152.273"/>
					</TrackLine>
					<TrackLine>
						<End x="217.424" y="151.638"/>
					</TrackLine>
					<TrackLine>
						<End x="217.424" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="214.884" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="212.344" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="211.074" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="211.074" y="145.288"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="146.812"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.254">
					<Start x="212.598" y="144.272"/>
					<TrackLine>
						<End x="214.376" y="146.05"/>
					</TrackLine>
					<TrackLine>
						<End x="214.376" y="163.068"/>
					</TrackLine>
					<TrackLine>
						<End x="213.868" y="163.576"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="163.576"/>
					</TrackLine>
					<TrackLine>
						<End x="205.486" y="170.18"/>
					</TrackLine>
					<TrackLine>
						<End x="205.486" y="177.165"/>
					</TrackLine>
					<TrackLine>
						<End x="206.121" y="177.8"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="177.8"/>
					</TrackLine>
					<TrackLine>
						<End x="213.106" y="178.816"/>
					</TrackLine>
					<TrackLine>
						<End x="213.106" y="195.072"/>
					</TrackLine>
					<TrackLine>
						<End x="212.344" y="195.834"/>
					</TrackLine>
					<TrackLine>
						<End x="211.582" y="195.834"/>
					</TrackLine>
					<TrackLine>
						<End x="211.074" y="196.342"/>
					</TrackLine>
					<TrackLine>
						<End x="211.074" y="198.628"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="199.644"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.254">
					<Start x="173.99" y="141.732"/>
					<TrackLine>
						<End x="170.942" y="144.78"/>
					</TrackLine>
					<TrackLine>
						<End x="170.942" y="192.024"/>
					</TrackLine>
					<TrackLine>
						<End x="169.926" y="193.04"/>
					</TrackLine>
					<TrackLine>
						<End x="169.926" y="213.614"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.254">
					<Start x="169.926" y="213.614"/>
					<TrackLine>
						<End x="169.926" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="222.504"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.254">
					<Start x="173.99" y="139.192"/>
					<TrackLine>
						<End x="175.006" y="140.208"/>
					</TrackLine>
					<TrackLine>
						<End x="175.006" y="154.94"/>
					</TrackLine>
					<TrackLine>
						<End x="174.244" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="173.482" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="172.974" y="156.21"/>
					</TrackLine>
					<TrackLine>
						<End x="172.974" y="207.772"/>
					</TrackLine>
					<TrackLine>
						<End x="173.482" y="208.28"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="208.28"/>
					</TrackLine>
					<TrackLine>
						<End x="179.07" y="211.328"/>
					</TrackLine>
					<TrackLine>
						<End x="179.07" y="222.504"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8" y="223.774"/>
					</TrackLine>
					<TrackLine>
						<End x="177.038" y="223.774"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="224.282"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="224.917"/>
					</TrackLine>
					<TrackLine>
						<End x="174.879" y="226.568"/>
					</TrackLine>
					<TrackLine>
						<End x="160.274" y="226.568"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="225.044"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.254">
					<Start x="212.598" y="139.192"/>
					<TrackLine>
						<End x="218.186" y="139.192"/>
					</TrackLine>
					<TrackLine>
						<End x="219.456" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="219.456" y="151.384"/>
					</TrackLine>
					<TrackLine>
						<End x="217.805" y="153.035"/>
					</TrackLine>
					<TrackLine>
						<End x="217.805" y="165.1"/>
					</TrackLine>
					<TrackLine>
						<End x="215.646" y="167.259"/>
					</TrackLine>
					<TrackLine>
						<End x="215.646" y="212.852"/>
					</TrackLine>
					<TrackLine>
						<End x="214.884" y="213.614"/>
					</TrackLine>
					<TrackLine>
						<End x="211.836" y="213.614"/>
					</TrackLine>
					<TrackLine>
						<End x="211.074" y="212.852"/>
					</TrackLine>
					<TrackLine>
						<End x="211.074" y="211.836"/>
					</TrackLine>
					<TrackLine>
						<End x="211.836" y="211.074"/>
					</TrackLine>
					<TrackLine>
						<End x="212.344" y="211.074"/>
					</TrackLine>
					<TrackLine>
						<End x="213.106" y="210.312"/>
					</TrackLine>
					<TrackLine>
						<End x="213.106" y="205.74"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="204.724"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.254">
					<Start x="158.75" y="141.732"/>
					<TrackLine>
						<End x="157.226" y="143.256"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="158.496" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="160.02" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="167.005" y="162.687"/>
					</TrackLine>
					<TrackLine>
						<End x="167.005" y="219.202"/>
					</TrackLine>
					<TrackLine>
						<End x="172.847" y="225.044"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="225.044"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.254">
					<Start x="178.054" y="141.732"/>
					<TrackLine>
						<End x="177.038" y="142.748"/>
					</TrackLine>
					<TrackLine>
						<End x="177.038" y="154.94"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="155.956"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="184.404"/>
					</TrackLine>
					<TrackLine>
						<End x="175.768" y="184.658"/>
					</TrackLine>
					<TrackLine>
						<End x="175.768" y="197.866"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="199.644"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.254">
					<Start x="204.978" y="221.996"/>
					<TrackLine>
						<End x="208.026" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="208.026" y="211.328"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="207.264"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.254">
					<Start x="178.054" y="144.272"/>
					<TrackLine>
						<End x="179.07" y="145.288"/>
					</TrackLine>
					<TrackLine>
						<End x="179.07" y="154.94"/>
					</TrackLine>
					<TrackLine>
						<End x="178.308" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="156.718"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="174.498"/>
					</TrackLine>
					<TrackLine>
						<End x="178.562" y="176.276"/>
					</TrackLine>
					<TrackLine>
						<End x="178.562" y="184.912"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8" y="185.674"/>
					</TrackLine>
					<TrackLine>
						<End x="177.292" y="185.674"/>
					</TrackLine>
					<TrackLine>
						<End x="176.276" y="186.69"/>
					</TrackLine>
					<TrackLine>
						<End x="176.276" y="190.754"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="192.024"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.254">
					<Start x="177.546" y="192.024"/>
					<TrackLine>
						<End x="178.562" y="193.04"/>
					</TrackLine>
					<TrackLine>
						<End x="178.562" y="200.152"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8" y="200.914"/>
					</TrackLine>
					<TrackLine>
						<End x="177.292" y="200.914"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="201.676"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="202.692"/>
					</TrackLine>
					<TrackLine>
						<End x="177.292" y="203.454"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8" y="203.454"/>
					</TrackLine>
					<TrackLine>
						<End x="179.578" y="205.232"/>
					</TrackLine>
					<TrackLine>
						<End x="179.578" y="220.091"/>
					</TrackLine>
					<TrackLine>
						<End x="180.086" y="220.599"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.254">
					<Start x="197.358" y="146.812"/>
					<TrackLine>
						<End x="199.644" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="205.994" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="213.868" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="217.932" y="144.526"/>
					</TrackLine>
					<TrackLine>
						<End x="217.932" y="152.019"/>
					</TrackLine>
					<TrackLine>
						<End x="217.297" y="152.654"/>
					</TrackLine>
					<TrackLine>
						<End x="217.297" y="164.719"/>
					</TrackLine>
					<TrackLine>
						<End x="214.884" y="167.132"/>
					</TrackLine>
					<TrackLine>
						<End x="214.884" y="209.55"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="212.344"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="CPUCLK"/>
				<Subwire width="0.254">
					<Start x="128.27" y="142.748"/>
					<TrackLine>
						<End x="132.588" y="138.43"/>
					</TrackLine>
					<TrackLine>
						<End x="135.5852" y="138.43"/>
					</TrackLine>
					<TrackLine>
						<End x="137.16" y="140.0048"/>
					</TrackLine>
					<TrackLine>
						<End x="137.16" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="136.144" y="141.478"/>
					</TrackLine>
					<TrackLine>
						<End x="135.128" y="141.478"/>
					</TrackLine>
					<TrackLine>
						<End x="133.604" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="133.604" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="163.068"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="CPUCLK"/>
				<Subwire width="0.254">
					<Start x="158.75" y="179.324"/>
					<TrackLine>
						<End x="157.226" y="180.848"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="184.404"/>
					</TrackLine>
					<TrackLine>
						<End x="158.496" y="185.674"/>
					</TrackLine>
					<TrackLine>
						<End x="160.02" y="185.674"/>
					</TrackLine>
					<TrackLine>
						<End x="166.243" y="191.897"/>
					</TrackLine>
					<TrackLine>
						<End x="166.243" y="219.583"/>
					</TrackLine>
					<TrackLine>
						<End x="172.72" y="226.06"/>
					</TrackLine>
					<TrackLine>
						<End x="174.625" y="226.06"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="224.663"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="214.884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC10_2"/>
				<Subwire width="0.254">
					<Start x="128.27" y="150.368"/>
					<TrackLine>
						<End x="126.746" y="151.892"/>
					</TrackLine>
					<TrackLine>
						<End x="126.746" y="153.416"/>
					</TrackLine>
					<TrackLine>
						<End x="127.508" y="154.178"/>
					</TrackLine>
					<TrackLine>
						<End x="128.905" y="154.178"/>
					</TrackLine>
					<TrackLine>
						<End x="130.302" y="155.448"/>
					</TrackLine>
					<TrackLine>
						<End x="130.302" y="178.308"/>
					</TrackLine>
					<TrackLine>
						<End x="128.778" y="179.832"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC10_2"/>
				<Subwire width="0.254">
					<Start x="128.778" y="179.832"/>
					<TrackLine>
						<End x="125.73" y="176.784"/>
					</TrackLine>
					<TrackLine>
						<End x="125.73" y="173.228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC10_2"/>
				<Subwire width="0.254">
					<Start x="128.778" y="181.356"/>
					<TrackLine>
						<End x="128.778" y="179.832"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC10_1"/>
				<Subwire width="0.254">
					<Start x="133.858" y="179.832"/>
					<TrackLine>
						<End x="135.382" y="178.308"/>
					</TrackLine>
					<TrackLine>
						<End x="135.382" y="175.768"/>
					</TrackLine>
					<TrackLine>
						<End x="134.112" y="174.498"/>
					</TrackLine>
					<TrackLine>
						<End x="134.112" y="172.466"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="170.688"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC10_1"/>
				<Subwire width="0.254">
					<Start x="133.858" y="179.832"/>
					<TrackLine>
						<End x="133.858" y="181.356"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC10_1"/>
				<Subwire width="0.254">
					<Start x="128.27" y="152.908"/>
					<TrackLine>
						<End x="131.318" y="155.575"/>
					</TrackLine>
					<TrackLine>
						<End x="131.318" y="177.292"/>
					</TrackLine>
					<TrackLine>
						<End x="133.858" y="179.832"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC9_2"/>
				<Subwire width="0.254">
					<Start x="125.73" y="160.528"/>
					<TrackLine>
						<End x="128.778" y="163.576"/>
					</TrackLine>
					<TrackLine>
						<End x="128.778" y="176.276"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC9_1"/>
				<Subwire width="0.254">
					<Start x="135.89" y="150.368"/>
					<TrackLine>
						<End x="134.874" y="151.384"/>
					</TrackLine>
					<TrackLine>
						<End x="134.874" y="157.8356"/>
					</TrackLine>
					<TrackLine>
						<End x="137.16" y="160.1216"/>
					</TrackLine>
					<TrackLine>
						<End x="137.16" y="166.116"/>
					</TrackLine>
					<TrackLine>
						<End x="136.398" y="166.878"/>
					</TrackLine>
					<TrackLine>
						<End x="136.144" y="166.878"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="167.132"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="168.148"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.254">
					<Start x="158.75" y="194.564"/>
					<TrackLine>
						<End x="158.75" y="197.104"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.254">
					<Start x="154.686" y="209.804"/>
					<TrackLine>
						<End x="154.686" y="212.344"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.254">
					<Start x="158.75" y="197.104"/>
					<TrackLine>
						<End x="161.798" y="200.152"/>
					</TrackLine>
					<TrackLine>
						<End x="161.798" y="213.36"/>
					</TrackLine>
					<TrackLine>
						<End x="159.004" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="158.496" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="157.734" y="216.916"/>
					</TrackLine>
					<TrackLine>
						<End x="157.734" y="217.932"/>
					</TrackLine>
					<TrackLine>
						<End x="158.496" y="218.694"/>
					</TrackLine>
					<TrackLine>
						<End x="159.258" y="218.694"/>
					</TrackLine>
					<TrackLine>
						<End x="159.766" y="219.202"/>
					</TrackLine>
					<TrackLine>
						<End x="159.766" y="220.726"/>
					</TrackLine>
					<TrackLine>
						<End x="159.258" y="221.234"/>
					</TrackLine>
					<TrackLine>
						<End x="155.956" y="221.234"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="222.504"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.254">
					<Start x="154.686" y="214.884"/>
					<TrackLine>
						<End x="154.686" y="217.424"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.254">
					<Start x="154.686" y="212.344"/>
					<TrackLine>
						<End x="154.686" y="214.884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.254">
					<Start x="154.686" y="217.424"/>
					<TrackLine>
						<End x="154.686" y="222.504"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.254">
					<Start x="154.686" y="222.504"/>
					<TrackLine>
						<End x="154.686" y="227.584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A15"/>
				<Subwire width="0.254">
					<Start x="147.066" y="195.072"/>
					<TrackLine>
						<End x="150.495" y="198.501"/>
					</TrackLine>
					<TrackLine>
						<End x="150.495" y="209.931"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A14"/>
				<Subwire width="0.254">
					<Start x="147.066" y="197.612"/>
					<TrackLine>
						<End x="149.606" y="200.152"/>
					</TrackLine>
					<TrackLine>
						<End x="149.606" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="152.146" y="221.488"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A13"/>
				<Subwire width="0.254">
					<Start x="171.958" y="195.834"/>
					<TrackLine>
						<End x="171.958" y="207.772"/>
					</TrackLine>
					<TrackLine>
						<End x="172.974" y="208.788"/>
					</TrackLine>
					<TrackLine>
						<End x="174.498" y="208.788"/>
					</TrackLine>
					<TrackLine>
						<End x="176.657" y="210.947"/>
					</TrackLine>
					<TrackLine>
						<End x="177.927" y="210.947"/>
					</TrackLine>
					<TrackLine>
						<End x="178.562" y="211.582"/>
					</TrackLine>
					<TrackLine>
						<End x="178.562" y="221.488"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="222.504"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A12"/>
				<Subwire width="0.254">
					<Start x="178.054" y="169.672"/>
					<TrackLine>
						<End x="180.086" y="171.704"/>
					</TrackLine>
					<TrackLine>
						<End x="180.086" y="217.932"/>
					</TrackLine>
					<TrackLine>
						<End x="181.356" y="219.202"/>
					</TrackLine>
					<TrackLine>
						<End x="181.356" y="221.234"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="225.044"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A11"/>
				<Subwire width="0.254">
					<Start x="177.546" y="227.584"/>
					<TrackLine>
						<End x="184.15" y="220.98"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="161.544"/>
					</TrackLine>
					<TrackLine>
						<End x="192.532" y="153.162"/>
					</TrackLine>
					<TrackLine>
						<End x="193.548" y="153.162"/>
					</TrackLine>
					<TrackLine>
						<End x="194.31" y="153.924"/>
					</TrackLine>
					<TrackLine>
						<End x="194.31" y="154.94"/>
					</TrackLine>
					<TrackLine>
						<End x="193.548" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="193.04" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="191.77" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="191.77" y="157.988"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="159.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A10"/>
				<Subwire width="0.254">
					<Start x="193.294" y="154.432"/>
					<TrackLine>
						<End x="184.912" y="162.814"/>
					</TrackLine>
					<TrackLine>
						<End x="184.912" y="219.71"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="227.584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A9"/>
				<Subwire width="0.254">
					<Start x="212.598" y="162.052"/>
					<TrackLine>
						<End x="209.296" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="204.47" y="166.878"/>
					</TrackLine>
					<TrackLine>
						<End x="204.47" y="215.9"/>
					</TrackLine>
					<TrackLine>
						<End x="201.422" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="196.342" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="195.072" y="220.218"/>
					</TrackLine>
					<TrackLine>
						<End x="195.072" y="222.758"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="225.044"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.254">
					<Start x="193.294" y="164.592"/>
					<TrackLine>
						<End x="187.706" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="185.674" y="166.624"/>
					</TrackLine>
					<TrackLine>
						<End x="185.674" y="215.392"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="222.504"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A7"/>
				<Subwire width="0.254">
					<Start x="192.786" y="219.964"/>
					<TrackLine>
						<End x="190.5" y="217.678"/>
					</TrackLine>
					<TrackLine>
						<End x="190.5" y="214.63"/>
					</TrackLine>
					<TrackLine>
						<End x="191.77" y="213.36"/>
					</TrackLine>
					<TrackLine>
						<End x="191.77" y="186.436"/>
					</TrackLine>
					<TrackLine>
						<End x="192.532" y="185.674"/>
					</TrackLine>
					<TrackLine>
						<End x="193.548" y="185.674"/>
					</TrackLine>
					<TrackLine>
						<End x="195.326" y="183.896"/>
					</TrackLine>
					<TrackLine>
						<End x="195.326" y="169.164"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="167.132"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A6"/>
				<Subwire width="0.254">
					<Start x="197.358" y="164.592"/>
					<TrackLine>
						<End x="198.882" y="166.116"/>
					</TrackLine>
					<TrackLine>
						<End x="198.882" y="184.7342"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9422" y="185.674"/>
					</TrackLine>
					<TrackLine>
						<End x="196.596" y="185.674"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="186.436"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="213.868"/>
					</TrackLine>
					<TrackLine>
						<End x="194.31" y="215.392"/>
					</TrackLine>
					<TrackLine>
						<End x="194.31" y="215.9"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="217.424"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A5"/>
				<Subwire width="0.254">
					<Start x="197.358" y="162.052"/>
					<TrackLine>
						<End x="195.58" y="163.83"/>
					</TrackLine>
					<TrackLine>
						<End x="195.58" y="164.846"/>
					</TrackLine>
					<TrackLine>
						<End x="196.596" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="197.612" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="198.374" y="166.624"/>
					</TrackLine>
					<TrackLine>
						<End x="198.374" y="167.64"/>
					</TrackLine>
					<TrackLine>
						<End x="197.612" y="168.402"/>
					</TrackLine>
					<TrackLine>
						<End x="196.85" y="168.402"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="169.418"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="185.1914"/>
					</TrackLine>
					<TrackLine>
						<End x="195.326" y="185.6994"/>
					</TrackLine>
					<TrackLine>
						<End x="195.326" y="212.344"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="214.884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A4"/>
				<Subwire width="0.254">
					<Start x="192.786" y="212.344"/>
					<TrackLine>
						<End x="192.786" y="213.36"/>
					</TrackLine>
					<TrackLine>
						<End x="191.516" y="214.63"/>
					</TrackLine>
					<TrackLine>
						<End x="191.516" y="217.678"/>
					</TrackLine>
					<TrackLine>
						<End x="192.278" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="197.866" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="200.152" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="200.152" y="162.306"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="159.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.254">
					<Start x="178.054" y="156.972"/>
					<TrackLine>
						<End x="180.594" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="180.594" y="191.008"/>
					</TrackLine>
					<TrackLine>
						<End x="182.372" y="192.786"/>
					</TrackLine>
					<TrackLine>
						<End x="182.372" y="205.994"/>
					</TrackLine>
					<TrackLine>
						<End x="182.626" y="206.248"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A2"/>
				<Subwire width="0.254">
					<Start x="197.358" y="154.432"/>
					<TrackLine>
						<End x="203.2" y="160.274"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2" y="176.657"/>
					</TrackLine>
					<TrackLine>
						<End x="202.438" y="177.419"/>
					</TrackLine>
					<TrackLine>
						<End x="202.438" y="203.454"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.254">
					<Start x="158.75" y="151.892"/>
					<TrackLine>
						<End x="169.672" y="162.814"/>
					</TrackLine>
					<TrackLine>
						<End x="169.672" y="191.77"/>
					</TrackLine>
					<TrackLine>
						<End x="167.894" y="193.548"/>
					</TrackLine>
					<TrackLine>
						<End x="167.894" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="172.974" y="224.028"/>
					</TrackLine>
					<TrackLine>
						<End x="175.006" y="224.028"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="223.52"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="211.328"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="209.804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A0"/>
				<Subwire width="0.254">
					<Start x="158.75" y="149.352"/>
					<TrackLine>
						<End x="170.434" y="161.036"/>
					</TrackLine>
					<TrackLine>
						<End x="170.434" y="191.77"/>
					</TrackLine>
					<TrackLine>
						<End x="168.656" y="193.548"/>
					</TrackLine>
					<TrackLine>
						<End x="168.656" y="218.694"/>
					</TrackLine>
					<TrackLine>
						<End x="173.482" y="223.52"/>
					</TrackLine>
					<TrackLine>
						<End x="174.498" y="223.52"/>
					</TrackLine>
					<TrackLine>
						<End x="175.006" y="223.012"/>
					</TrackLine>
					<TrackLine>
						<End x="175.006" y="221.996"/>
					</TrackLine>
					<TrackLine>
						<End x="174.244" y="221.234"/>
					</TrackLine>
					<TrackLine>
						<End x="173.736" y="221.234"/>
					</TrackLine>
					<TrackLine>
						<End x="172.72" y="220.218"/>
					</TrackLine>
					<TrackLine>
						<End x="172.72" y="213.614"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="212.344"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="300"/>
				<Subwire width="0.254">
					<Start x="144.018" y="217.424"/>
					<TrackLine>
						<End x="145.034" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="145.034" y="220.472"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="222.504"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-12"/>
				<Subwire width="0.381">
					<Start x="114.554" y="153.162"/>
					<TrackLine>
						<End x="114.554" y="215.9"/>
					</TrackLine>
					<TrackLine>
						<End x="126.238" y="227.584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12"/>
				<Subwire width="0.381">
					<Start x="114.554" y="149.352"/>
					<TrackLine>
						<End x="116.586" y="151.384"/>
					</TrackLine>
					<TrackLine>
						<End x="116.586" y="168.91"/>
					</TrackLine>
					<TrackLine>
						<End x="120.0649" y="172.3889"/>
					</TrackLine>
					<TrackLine>
						<End x="122.4779" y="172.3889"/>
					</TrackLine>
					<TrackLine>
						<End x="123.698" y="173.609"/>
					</TrackLine>
					<TrackLine>
						<End x="123.698" y="178.816"/>
					</TrackLine>
					<TrackLine>
						<End x="132.08" y="187.198"/>
					</TrackLine>
					<TrackLine>
						<End x="132.08" y="225.806"/>
					</TrackLine>
					<TrackLine>
						<End x="133.858" y="227.584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETU6_15"/>
				<Subwire width="0.254">
					<Start x="158.75" y="192.024"/>
					<TrackLine>
						<End x="157.734" y="193.04"/>
					</TrackLine>
					<TrackLine>
						<End x="157.734" y="207.772"/>
					</TrackLine>
					<TrackLine>
						<End x="158.496" y="208.534"/>
					</TrackLine>
					<TrackLine>
						<End x="159.004" y="208.534"/>
					</TrackLine>
					<TrackLine>
						<End x="159.766" y="209.296"/>
					</TrackLine>
					<TrackLine>
						<End x="159.766" y="210.312"/>
					</TrackLine>
					<TrackLine>
						<End x="159.004" y="211.074"/>
					</TrackLine>
					<TrackLine>
						<End x="158.496" y="211.074"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="212.344"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="215.011"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SIOSEL"/>
				<Subwire width="0.254">
					<Start x="154.686" y="187.452"/>
					<TrackLine>
						<End x="153.67" y="188.468"/>
					</TrackLine>
					<TrackLine>
						<End x="153.67" y="195.58"/>
					</TrackLine>
					<TrackLine>
						<End x="154.432" y="196.342"/>
					</TrackLine>
					<TrackLine>
						<End x="155.067" y="196.342"/>
					</TrackLine>
					<TrackLine>
						<End x="155.702" y="196.977"/>
					</TrackLine>
					<TrackLine>
						<End x="155.702" y="205.5622"/>
					</TrackLine>
					<TrackLine>
						<End x="153.3652" y="207.899"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IORQ"/>
				<Subwire width="0.254">
					<Start x="182.118" y="218.44"/>
					<TrackLine>
						<End x="183.642" y="216.916"/>
					</TrackLine>
					<TrackLine>
						<End x="183.642" y="185.42"/>
					</TrackLine>
					<TrackLine>
						<End x="183.134" y="184.912"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="WR"/>
				<Subwire width="0.254">
					<Start x="154.686" y="169.672"/>
					<TrackLine>
						<End x="156.21" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="157.48" y="170.942"/>
					</TrackLine>
					<TrackLine>
						<End x="165.608" y="170.942"/>
					</TrackLine>
					<TrackLine>
						<End x="166.878" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="169.672"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="WR"/>
				<Subwire width="0.254">
					<Start x="173.99" y="169.672"/>
					<TrackLine>
						<End x="175.514" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="170.688"/>
					</TrackLine>
					<TrackLine>
						<End x="185.547" y="170.688"/>
					</TrackLine>
					<TrackLine>
						<End x="186.563" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="169.672"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="WR"/>
				<Subwire width="0.254">
					<Start x="193.294" y="169.672"/>
					<TrackLine>
						<End x="195.326" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="196.342" y="170.688"/>
					</TrackLine>
					<TrackLine>
						<End x="203.962" y="170.688"/>
					</TrackLine>
					<TrackLine>
						<End x="204.978" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="169.672"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="114.554" y="145.542"/>
					<TrackLine>
						<End x="116.586" y="147.574"/>
					</TrackLine>
					<TrackLine>
						<End x="116.586" y="151.892"/>
					</TrackLine>
					<TrackLine>
						<End x="121.412" y="156.718"/>
					</TrackLine>
					<TrackLine>
						<End x="134.62" y="156.718"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="155.448"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="125.73" y="165.608"/>
					<TrackLine>
						<End x="132.334" y="172.212"/>
					</TrackLine>
					<TrackLine>
						<End x="132.334" y="177.292"/>
					</TrackLine>
					<TrackLine>
						<End x="132.842" y="177.8"/>
					</TrackLine>
					<TrackLine>
						<End x="137.922" y="177.8"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="176.276"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="140.97" y="195.072"/>
					<TrackLine>
						<End x="142.24" y="196.342"/>
					</TrackLine>
					<TrackLine>
						<End x="150.876" y="196.342"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="200.152"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="140.97" y="195.072"/>
					<TrackLine>
						<End x="140.97" y="200.152"/>
					</TrackLine>
					<TrackLine>
						<End x="139.954" y="201.168"/>
					</TrackLine>
					<TrackLine>
						<End x="134.366" y="201.168"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="140.97" y="195.072"/>
					<TrackLine>
						<End x="145.034" y="191.008"/>
					</TrackLine>
					<TrackLine>
						<End x="145.034" y="189.484"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="187.452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="154.686" y="172.212"/>
					<TrackLine>
						<End x="158.75" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="158.75" y="172.212"/>
					<TrackLine>
						<End x="158.75" y="173.736"/>
					</TrackLine>
					<TrackLine>
						<End x="162.56" y="177.546"/>
					</TrackLine>
					<TrackLine>
						<End x="166.624" y="177.546"/>
					</TrackLine>
					<TrackLine>
						<End x="168.402" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="153.162" y="204.216"/>
					<TrackLine>
						<End x="156.21" y="207.264"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="207.264"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="168.402" y="175.768"/>
					<TrackLine>
						<End x="171.958" y="172.212"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="168.402" y="175.768"/>
					<TrackLine>
						<End x="173.228" y="180.594"/>
					</TrackLine>
					<TrackLine>
						<End x="174.371" y="180.594"/>
					</TrackLine>
					<TrackLine>
						<End x="175.26" y="179.705"/>
					</TrackLine>
					<TrackLine>
						<End x="175.26" y="175.9458"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9618" y="174.244"/>
					</TrackLine>
					<TrackLine>
						<End x="181.61" y="174.244"/>
					</TrackLine>
					<TrackLine>
						<End x="183.642" y="172.212"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="177.546" y="186.944"/>
					<TrackLine>
						<End x="178.816" y="186.944"/>
					</TrackLine>
					<TrackLine>
						<End x="179.578" y="186.182"/>
					</TrackLine>
					<TrackLine>
						<End x="184.658" y="186.182"/>
					</TrackLine>
					<TrackLine>
						<End x="185.42" y="186.944"/>
					</TrackLine>
					<TrackLine>
						<End x="190.754" y="186.944"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="193.294" y="172.212"/>
					<TrackLine>
						<End x="194.31" y="172.212"/>
					</TrackLine>
					<TrackLine>
						<End x="195.58" y="173.482"/>
					</TrackLine>
					<TrackLine>
						<End x="199.136" y="173.482"/>
					</TrackLine>
					<TrackLine>
						<End x="200.406" y="172.212"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="192.786" y="189.484"/>
					<TrackLine>
						<End x="194.183" y="189.484"/>
					</TrackLine>
					<TrackLine>
						<End x="195.453" y="188.214"/>
					</TrackLine>
					<TrackLine>
						<End x="199.136" y="188.214"/>
					</TrackLine>
					<TrackLine>
						<End x="202.946" y="192.024"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="192.024"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="190.754" y="186.944"/>
					<TrackLine>
						<End x="192.786" y="186.944"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="139.446" y="172.212"/>
					<TrackLine>
						<End x="146.05" y="172.212"/>
					</TrackLine>
					<TrackLine>
						<End x="149.606" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.508">
					<Start x="187.706" y="175.768"/>
					<TrackLine>
						<End x="190.754" y="178.816"/>
					</TrackLine>
					<TrackLine>
						<End x="190.754" y="186.944"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETJ3_2"/>
				<Subwire width="0.254">
					<Start x="126.746" y="193.548"/>
					<TrackLine>
						<End x="125.222" y="195.072"/>
					</TrackLine>
					<TrackLine>
						<End x="125.222" y="198.628"/>
					</TrackLine>
					<TrackLine>
						<End x="126.492" y="199.898"/>
					</TrackLine>
					<TrackLine>
						<End x="127.508" y="199.898"/>
					</TrackLine>
					<TrackLine>
						<End x="128.016" y="200.406"/>
					</TrackLine>
					<TrackLine>
						<End x="128.016" y="205.2066"/>
					</TrackLine>
					<TrackLine>
						<End x="122.174" y="211.0486"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETJ2_2"/>
				<Subwire width="0.254">
					<Start x="122.174" y="177.5206"/>
					<TrackLine>
						<End x="120.904" y="178.7906"/>
					</TrackLine>
					<TrackLine>
						<End x="120.904" y="188.214"/>
					</TrackLine>
					<TrackLine>
						<End x="124.206" y="191.516"/>
					</TrackLine>
					<TrackLine>
						<End x="124.206" y="198.628"/>
					</TrackLine>
					<TrackLine>
						<End x="126.746" y="201.168"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETU6_26"/>
				<Subwire width="0.254">
					<Start x="126.238" y="217.424"/>
					<TrackLine>
						<End x="127.254" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="127.254" y="214.376"/>
					</TrackLine>
					<TrackLine>
						<End x="126.492" y="213.614"/>
					</TrackLine>
					<TrackLine>
						<End x="125.984" y="213.614"/>
					</TrackLine>
					<TrackLine>
						<End x="124.714" y="212.344"/>
					</TrackLine>
					<TrackLine>
						<End x="124.714" y="210.312"/>
					</TrackLine>
					<TrackLine>
						<End x="128.778" y="206.248"/>
					</TrackLine>
					<TrackLine>
						<End x="153.67" y="206.248"/>
					</TrackLine>
					<TrackLine>
						<End x="155.702" y="208.28"/>
					</TrackLine>
					<TrackLine>
						<End x="160.274" y="208.28"/>
					</TrackLine>
					<TrackLine>
						<End x="161.29" y="207.264"/>
					</TrackLine>
					<TrackLine>
						<End x="161.29" y="202.184"/>
					</TrackLine>
					<TrackLine>
						<End x="166.37" y="197.104"/>
					</TrackLine>
					<TrackLine>
						<End x="171.958" y="197.104"/>
					</TrackLine>
					<TrackLine>
						<End x="173.228" y="195.834"/>
					</TrackLine>
					<TrackLine>
						<End x="174.244" y="195.834"/>
					</TrackLine>
					<TrackLine>
						<End x="175.006" y="195.072"/>
					</TrackLine>
					<TrackLine>
						<End x="175.006" y="193.04"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="192.024"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RESET"/>
				<Subwire width="0.254">
					<Start x="173.99" y="179.324"/>
					<TrackLine>
						<End x="173.99" y="176.022"/>
					</TrackLine>
					<TrackLine>
						<End x="174.498" y="175.514"/>
					</TrackLine>
					<TrackLine>
						<End x="174.498" y="174.752"/>
					</TrackLine>
					<TrackLine>
						<End x="175.768" y="173.482"/>
					</TrackLine>
					<TrackLine>
						<End x="180.34" y="173.482"/>
					</TrackLine>
					<TrackLine>
						<End x="182.626" y="171.196"/>
					</TrackLine>
					<TrackLine>
						<End x="218.694" y="171.196"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RESET"/>
				<Subwire width="0.254">
					<Start x="218.694" y="171.196"/>
					<TrackLine>
						<End x="219.456" y="171.958"/>
					</TrackLine>
					<TrackLine>
						<End x="219.456" y="175.006"/>
					</TrackLine>
					<TrackLine>
						<End x="218.44" y="176.022"/>
					</TrackLine>
					<TrackLine>
						<End x="210.312" y="176.022"/>
					</TrackLine>
					<TrackLine>
						<End x="207.264" y="179.07"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2" y="179.07"/>
					</TrackLine>
					<TrackLine>
						<End x="201.676" y="177.546"/>
					</TrackLine>
					<TrackLine>
						<End x="196.088" y="177.546"/>
					</TrackLine>
					<TrackLine>
						<End x="194.818" y="178.816"/>
					</TrackLine>
					<TrackLine>
						<End x="194.818" y="187.452"/>
					</TrackLine>
					<TrackLine>
						<End x="193.802" y="188.468"/>
					</TrackLine>
					<TrackLine>
						<End x="192.278" y="188.468"/>
					</TrackLine>
					<TrackLine>
						<End x="191.008" y="189.738"/>
					</TrackLine>
					<TrackLine>
						<End x="191.008" y="190.246"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="192.024"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RESET"/>
				<Subwire width="0.254">
					<Start x="218.694" y="171.196"/>
					<TrackLine>
						<End x="218.44" y="170.942"/>
					</TrackLine>
					<TrackLine>
						<End x="217.932" y="170.942"/>
					</TrackLine>
					<TrackLine>
						<End x="217.17" y="170.18"/>
					</TrackLine>
					<TrackLine>
						<End x="217.17" y="159.004"/>
					</TrackLine>
					<TrackLine>
						<End x="223.266" y="152.908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RESET"/>
				<Subwire width="0.254">
					<Start x="216.154" y="140.716"/>
					<TrackLine>
						<End x="221.234" y="140.716"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RD"/>
				<Subwire width="0.254">
					<Start x="173.99" y="207.264"/>
					<TrackLine>
						<End x="172.974" y="208.28"/>
					</TrackLine>
					<TrackLine>
						<End x="172.974" y="210.312"/>
					</TrackLine>
					<TrackLine>
						<End x="173.736" y="211.074"/>
					</TrackLine>
					<TrackLine>
						<End x="189.103" y="211.074"/>
					</TrackLine>
					<TrackLine>
						<End x="190.754" y="212.725"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RD"/>
				<Subwire width="0.254">
					<Start x="190.754" y="212.725"/>
					<TrackLine>
						<End x="191.897" y="213.868"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="213.868"/>
					</TrackLine>
					<TrackLine>
						<End x="197.866" y="214.376"/>
					</TrackLine>
					<TrackLine>
						<End x="197.866" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="196.85" y="217.424"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETR4_2"/>
				<Subwire width="0.254">
					<Start x="121.666" y="159.512"/>
					<TrackLine>
						<End x="122.936" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="123.698" y="158.75"/>
					</TrackLine>
					<TrackLine>
						<End x="129.54" y="158.75"/>
					</TrackLine>
					<TrackLine>
						<End x="131.318" y="160.528"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="160.528"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETR3_1"/>
				<Subwire width="0.254">
					<Start x="121.666" y="154.432"/>
					<TrackLine>
						<End x="121.92" y="154.178"/>
					</TrackLine>
					<TrackLine>
						<End x="134.62" y="154.178"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="152.908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETR2_2"/>
				<Subwire width="0.254">
					<Start x="121.666" y="142.748"/>
					<TrackLine>
						<End x="124.206" y="145.288"/>
					</TrackLine>
					<TrackLine>
						<End x="128.27" y="145.288"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETR2_2"/>
				<Subwire width="0.254">
					<Start x="128.27" y="147.828"/>
					<TrackLine>
						<End x="133.731" y="147.828"/>
					</TrackLine>
					<TrackLine>
						<End x="134.874" y="148.971"/>
					</TrackLine>
					<TrackLine>
						<End x="136.652" y="148.971"/>
					</TrackLine>
					<TrackLine>
						<End x="137.414" y="149.733"/>
					</TrackLine>
					<TrackLine>
						<End x="137.414" y="161.1884"/>
					</TrackLine>
					<TrackLine>
						<End x="136.8044" y="161.798"/>
					</TrackLine>
					<TrackLine>
						<End x="134.7724" y="161.798"/>
					</TrackLine>
					<TrackLine>
						<End x="133.096" y="163.4744"/>
					</TrackLine>
					<TrackLine>
						<End x="133.096" y="171.45"/>
					</TrackLine>
					<TrackLine>
						<End x="134.874" y="173.228"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="173.228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PPISEL"/>
				<Subwire width="0.254">
					<Start x="156.464" y="210.058"/>
					<TrackLine>
						<End x="157.734" y="211.328"/>
					</TrackLine>
					<TrackLine>
						<End x="164.338" y="211.328"/>
					</TrackLine>
					<TrackLine>
						<End x="168.91" y="215.9"/>
					</TrackLine>
					<TrackLine>
						<End x="193.802" y="215.9"/>
					</TrackLine>
					<TrackLine>
						<End x="194.818" y="214.884"/>
					</TrackLine>
					<TrackLine>
						<End x="196.85" y="214.884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PC3"/>
				<Subwire width="0.254">
					<Start x="196.85" y="186.944"/>
					<TrackLine>
						<End x="210.566" y="186.944"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="188.468"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="188.468"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="189.992"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PC2"/>
				<Subwire width="0.254">
					<Start x="196.85" y="189.484"/>
					<TrackLine>
						<End x="199.136" y="189.484"/>
					</TrackLine>
					<TrackLine>
						<End x="202.692" y="193.04"/>
					</TrackLine>
					<TrackLine>
						<End x="213.106" y="193.04"/>
					</TrackLine>
					<TrackLine>
						<End x="213.614" y="193.548"/>
					</TrackLine>
					<TrackLine>
						<End x="219.71" y="193.548"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="192.532"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PC1"/>
				<Subwire width="0.254">
					<Start x="196.85" y="192.024"/>
					<TrackLine>
						<End x="200.66" y="192.024"/>
					</TrackLine>
					<TrackLine>
						<End x="202.184" y="193.548"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="193.548"/>
					</TrackLine>
					<TrackLine>
						<End x="213.106" y="194.056"/>
					</TrackLine>
					<TrackLine>
						<End x="219.71" y="194.056"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="195.072"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PC0"/>
				<Subwire width="0.254">
					<Start x="196.85" y="194.564"/>
					<TrackLine>
						<End x="197.866" y="195.58"/>
					</TrackLine>
					<TrackLine>
						<End x="215.138" y="195.58"/>
					</TrackLine>
					<TrackLine>
						<End x="215.9" y="196.342"/>
					</TrackLine>
					<TrackLine>
						<End x="219.456" y="196.342"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="197.612"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PB7"/>
				<Subwire width="0.254">
					<Start x="212.09" y="189.484"/>
					<TrackLine>
						<End x="214.122" y="189.484"/>
					</TrackLine>
					<TrackLine>
						<End x="215.9" y="191.262"/>
					</TrackLine>
					<TrackLine>
						<End x="220.98" y="191.262"/>
					</TrackLine>
					<TrackLine>
						<End x="221.996" y="190.246"/>
					</TrackLine>
					<TrackLine>
						<End x="221.996" y="170.942"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="169.672"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PB6"/>
				<Subwire width="0.254">
					<Start x="212.09" y="186.944"/>
					<TrackLine>
						<End x="216.5096" y="186.944"/>
					</TrackLine>
					<TrackLine>
						<End x="216.789" y="187.2234"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PB5"/>
				<Subwire width="0.254">
					<Start x="220.726" y="174.752"/>
					<TrackLine>
						<End x="220.218" y="175.26"/>
					</TrackLine>
					<TrackLine>
						<End x="220.218" y="176.3268"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="177.3428"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="177.8"/>
					</TrackLine>
					<TrackLine>
						<End x="218.694" y="178.308"/>
					</TrackLine>
					<TrackLine>
						<End x="213.614" y="178.308"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="177.292"/>
					</TrackLine>
					<TrackLine>
						<End x="211.582" y="177.292"/>
					</TrackLine>
					<TrackLine>
						<End x="209.042" y="179.832"/>
					</TrackLine>
					<TrackLine>
						<End x="201.93" y="179.832"/>
					</TrackLine>
					<TrackLine>
						<End x="200.152" y="178.054"/>
					</TrackLine>
					<TrackLine>
						<End x="196.596" y="178.054"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="178.816"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="179.832"/>
					</TrackLine>
					<TrackLine>
						<End x="196.596" y="180.594"/>
					</TrackLine>
					<TrackLine>
						<End x="197.104" y="180.594"/>
					</TrackLine>
					<TrackLine>
						<End x="200.914" y="184.404"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="184.404"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PB4"/>
				<Subwire width="0.254">
					<Start x="212.09" y="181.864"/>
					<TrackLine>
						<End x="210.566" y="180.34"/>
					</TrackLine>
					<TrackLine>
						<End x="210.566" y="179.324"/>
					</TrackLine>
					<TrackLine>
						<End x="211.836" y="178.054"/>
					</TrackLine>
					<TrackLine>
						<End x="212.344" y="178.054"/>
					</TrackLine>
					<TrackLine>
						<End x="213.106" y="178.816"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="178.816"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="177.292"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PB3"/>
				<Subwire width="0.254">
					<Start x="212.09" y="179.324"/>
					<TrackLine>
						<End x="214.122" y="179.324"/>
					</TrackLine>
					<TrackLine>
						<End x="215.9" y="181.102"/>
					</TrackLine>
					<TrackLine>
						<End x="219.456" y="181.102"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="179.832"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PB2"/>
				<Subwire width="0.254">
					<Start x="196.85" y="179.324"/>
					<TrackLine>
						<End x="198.628" y="179.324"/>
					</TrackLine>
					<TrackLine>
						<End x="202.692" y="183.388"/>
					</TrackLine>
					<TrackLine>
						<End x="219.71" y="183.388"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="182.372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PB1"/>
				<Subwire width="0.254">
					<Start x="196.85" y="181.864"/>
					<TrackLine>
						<End x="200.406" y="185.42"/>
					</TrackLine>
					<TrackLine>
						<End x="215.646" y="185.42"/>
					</TrackLine>
					<TrackLine>
						<End x="217.17" y="183.896"/>
					</TrackLine>
					<TrackLine>
						<End x="219.71" y="183.896"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="184.912"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PB0"/>
				<Subwire width="0.254">
					<Start x="196.85" y="184.404"/>
					<TrackLine>
						<End x="198.374" y="185.928"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="185.928"/>
					</TrackLine>
					<TrackLine>
						<End x="218.694" y="186.436"/>
					</TrackLine>
					<TrackLine>
						<End x="219.71" y="186.436"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="187.452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PA3"/>
				<Subwire width="0.254">
					<Start x="196.85" y="227.584"/>
					<TrackLine>
						<End x="198.12" y="226.314"/>
					</TrackLine>
					<TrackLine>
						<End x="223.012" y="226.314"/>
					</TrackLine>
					<TrackLine>
						<End x="223.774" y="225.552"/>
					</TrackLine>
					<TrackLine>
						<End x="223.774" y="203.2"/>
					</TrackLine>
					<TrackLine>
						<End x="221.996" y="201.422"/>
					</TrackLine>
					<TrackLine>
						<End x="220.472" y="201.422"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="202.692"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="206.248"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="207.772"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PA2"/>
				<Subwire width="0.254">
					<Start x="196.85" y="225.044"/>
					<TrackLine>
						<End x="207.01" y="225.044"/>
					</TrackLine>
					<TrackLine>
						<End x="208.28" y="223.774"/>
					</TrackLine>
					<TrackLine>
						<End x="215.392" y="223.774"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="219.964"/>
					</TrackLine>
					<TrackLine>
						<End x="221.742" y="219.964"/>
					</TrackLine>
					<TrackLine>
						<End x="223.012" y="218.694"/>
					</TrackLine>
					<TrackLine>
						<End x="223.012" y="207.518"/>
					</TrackLine>
					<TrackLine>
						<End x="220.726" y="205.232"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PA1"/>
				<Subwire width="0.254">
					<Start x="220.726" y="202.692"/>
					<TrackLine>
						<End x="219.71" y="203.708"/>
					</TrackLine>
					<TrackLine>
						<End x="219.71" y="205.74"/>
					</TrackLine>
					<TrackLine>
						<End x="220.472" y="206.502"/>
					</TrackLine>
					<TrackLine>
						<End x="220.98" y="206.502"/>
					</TrackLine>
					<TrackLine>
						<End x="222.25" y="207.772"/>
					</TrackLine>
					<TrackLine>
						<End x="222.25" y="218.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="221.4626" y="219.456"/>
					</TrackLine>
					<TrackLine>
						<End x="216.154" y="219.456"/>
					</TrackLine>
					<TrackLine>
						<End x="214.63" y="220.98"/>
					</TrackLine>
					<TrackLine>
						<End x="204.47" y="220.98"/>
					</TrackLine>
					<TrackLine>
						<End x="202.946" y="222.504"/>
					</TrackLine>
					<TrackLine>
						<End x="196.85" y="222.504"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETU5_19"/>
				<Subwire width="0.254">
					<Start x="152.146" y="181.356"/>
					<TrackLine>
						<End x="155.194" y="181.356"/>
					</TrackLine>
					<TrackLine>
						<End x="156.972" y="183.134"/>
					</TrackLine>
					<TrackLine>
						<End x="176.276" y="183.134"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="181.864"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MEM3SEL"/>
				<Subwire width="0.254">
					<Start x="154.686" y="189.992"/>
					<TrackLine>
						<End x="156.718" y="189.992"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="190.5"/>
					</TrackLine>
					<TrackLine>
						<End x="185.166" y="190.5"/>
					</TrackLine>
					<TrackLine>
						<End x="187.706" y="187.96"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="187.96"/>
					</TrackLine>
					<TrackLine>
						<End x="194.056" y="187.198"/>
					</TrackLine>
					<TrackLine>
						<End x="194.056" y="178.562"/>
					</TrackLine>
					<TrackLine>
						<End x="195.58" y="177.038"/>
					</TrackLine>
					<TrackLine>
						<End x="202.692" y="177.038"/>
					</TrackLine>
					<TrackLine>
						<End x="203.454" y="177.8"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MEM2SEL"/>
				<Subwire width="0.254">
					<Start x="154.686" y="192.532"/>
					<TrackLine>
						<End x="154.686" y="191.77"/>
					</TrackLine>
					<TrackLine>
						<End x="153.162" y="190.246"/>
					</TrackLine>
					<TrackLine>
						<End x="153.162" y="189.992"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="188.468"/>
					</TrackLine>
					<TrackLine>
						<End x="181.61" y="188.468"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MEM1SEL"/>
				<Subwire width="0.254">
					<Start x="154.686" y="195.072"/>
					<TrackLine>
						<End x="156.21" y="195.072"/>
					</TrackLine>
					<TrackLine>
						<End x="156.972" y="195.834"/>
					</TrackLine>
					<TrackLine>
						<End x="164.338" y="195.834"/>
					</TrackLine>
					<TrackLine>
						<End x="164.846" y="195.326"/>
					</TrackLine>
					<TrackLine>
						<End x="170.18" y="195.326"/>
					</TrackLine>
					<TrackLine>
						<End x="171.45" y="194.056"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETJ3_3"/>
				<Subwire width="0.254">
					<Start x="122.174" y="213.8172"/>
					<TrackLine>
						<End x="122.8852" y="213.8172"/>
					</TrackLine>
					<TrackLine>
						<End x="123.952" y="214.884"/>
					</TrackLine>
					<TrackLine>
						<End x="126.238" y="214.884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="INT"/>
				<Subwire width="0.254">
					<Start x="135.89" y="165.608"/>
					<TrackLine>
						<End x="135.89" y="166.624"/>
					</TrackLine>
					<TrackLine>
						<End x="136.144" y="166.878"/>
					</TrackLine>
					<TrackLine>
						<End x="136.906" y="166.878"/>
					</TrackLine>
					<TrackLine>
						<End x="137.414" y="167.386"/>
					</TrackLine>
					<TrackLine>
						<End x="137.414" y="170.688"/>
					</TrackLine>
					<TrackLine>
						<End x="137.922" y="171.196"/>
					</TrackLine>
					<TrackLine>
						<End x="148.59" y="171.196"/>
					</TrackLine>
					<TrackLine>
						<End x="150.876" y="173.482"/>
					</TrackLine>
					<TrackLine>
						<End x="150.876" y="176.276"/>
					</TrackLine>
					<TrackLine>
						<End x="145.796" y="181.356"/>
					</TrackLine>
					<TrackLine>
						<End x="145.796" y="182.626"/>
					</TrackLine>
					<TrackLine>
						<End x="146.812" y="183.642"/>
					</TrackLine>
					<TrackLine>
						<End x="154.94" y="183.642"/>
					</TrackLine>
					<TrackLine>
						<End x="157.48" y="186.182"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="INT"/>
				<Subwire width="0.254">
					<Start x="157.48" y="186.182"/>
					<TrackLine>
						<End x="157.48" y="187.452"/>
					</TrackLine>
					<TrackLine>
						<End x="157.988" y="187.96"/>
					</TrackLine>
					<TrackLine>
						<End x="179.6796" y="187.96"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6956" y="186.944"/>
					</TrackLine>
					<TrackLine>
						<End x="181.5084" y="186.944"/>
					</TrackLine>
					<TrackLine>
						<End x="182.626" y="188.0616"/>
					</TrackLine>
					<TrackLine>
						<End x="182.626" y="188.976"/>
					</TrackLine>
					<TrackLine>
						<End x="182.118" y="189.484"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="189.484"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="114.554" y="141.732"/>
					<TrackLine>
						<End x="116.078" y="140.208"/>
					</TrackLine>
					<TrackLine>
						<End x="133.223" y="140.208"/>
					</TrackLine>
					<TrackLine>
						<End x="134.747" y="138.684"/>
					</TrackLine>
					<TrackLine>
						<End x="138.938" y="138.684"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="139.192"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="122.174" y="185.8264"/>
					<TrackLine>
						<End x="124.206" y="185.8264"/>
					</TrackLine>
					<TrackLine>
						<End x="124.3076" y="185.928"/>
					</TrackLine>
					<TrackLine>
						<End x="126.746" y="185.928"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="126.238" y="212.344"/>
					<TrackLine>
						<End x="128.778" y="209.804"/>
					</TrackLine>
					<TrackLine>
						<End x="136.398" y="209.804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="126.746" y="185.928"/>
					<TrackLine>
						<End x="130.048" y="185.928"/>
					</TrackLine>
					<TrackLine>
						<End x="131.318" y="187.198"/>
					</TrackLine>
					<TrackLine>
						<End x="138.176" y="187.198"/>
					</TrackLine>
					<TrackLine>
						<End x="140.97" y="189.992"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="126.238" y="212.344"/>
					<TrackLine>
						<End x="127.508" y="213.614"/>
					</TrackLine>
					<TrackLine>
						<End x="142.748" y="213.614"/>
					</TrackLine>
					<TrackLine>
						<End x="144.018" y="214.884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="147.066" y="182.372"/>
					<TrackLine>
						<End x="149.352" y="182.372"/>
					</TrackLine>
					<TrackLine>
						<End x="152.146" y="179.578"/>
					</TrackLine>
					<TrackLine>
						<End x="155.194" y="179.578"/>
					</TrackLine>
					<TrackLine>
						<End x="157.48" y="181.864"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="181.864"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="154.686" y="156.972"/>
					<TrackLine>
						<End x="156.1338" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="157.4038" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="165.7858" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="167.0558" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="156.972"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="173.99" y="181.864"/>
					<TrackLine>
						<End x="174.498" y="181.356"/>
					</TrackLine>
					<TrackLine>
						<End x="175.006" y="181.356"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="180.34"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="179.07"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="178.562"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="176.784"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="175.768"/>
					</TrackLine>
					<TrackLine>
						<End x="182.626" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="173.99" y="204.724"/>
					<TrackLine>
						<End x="175.768" y="202.946"/>
					</TrackLine>
					<TrackLine>
						<End x="175.768" y="201.803"/>
					</TrackLine>
					<TrackLine>
						<End x="176.657" y="200.914"/>
					</TrackLine>
					<TrackLine>
						<End x="183.896" y="200.914"/>
					</TrackLine>
					<TrackLine>
						<End x="185.166" y="199.644"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="199.644"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="173.99" y="156.972"/>
					<TrackLine>
						<End x="175.4378" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7078" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="185.2168" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4868" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="156.972"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="193.294" y="156.972"/>
					<TrackLine>
						<End x="194.7418" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="196.0118" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="211.328" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="156.972"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="223.266" y="147.828"/>
					<TrackLine>
						<End x="219.202" y="147.828"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="148.844"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="155.956"/>
					</TrackLine>
					<TrackLine>
						<End x="217.17" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="156.972"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="201.93" y="175.768"/>
					<TrackLine>
						<End x="204.216" y="173.482"/>
					</TrackLine>
					<TrackLine>
						<End x="216.916" y="173.482"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="174.752"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="212.09" y="214.884"/>
					<TrackLine>
						<End x="217.678" y="214.884"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="215.392"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="182.626" y="175.768"/>
					<TrackLine>
						<End x="184.15" y="175.768"/>
					</TrackLine>
					<TrackLine>
						<End x="186.182" y="173.736"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="173.736"/>
					</TrackLine>
					<TrackLine>
						<End x="195.326" y="175.768"/>
					</TrackLine>
					<TrackLine>
						<End x="201.93" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="158.75" y="184.404"/>
					<TrackLine>
						<End x="173.99" y="184.404"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.508">
					<Start x="196.85" y="212.344"/>
					<TrackLine>
						<End x="202.946" y="212.344"/>
					</TrackLine>
					<TrackLine>
						<End x="205.486" y="214.884"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="214.884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.254">
					<Start x="154.686" y="149.352"/>
					<TrackLine>
						<End x="156.21" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="157.48" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="165.862" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="167.132" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="149.352"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.254">
					<Start x="173.99" y="149.352"/>
					<TrackLine>
						<End x="175.514" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="184.912" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="186.182" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="149.352"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.254">
					<Start x="177.546" y="197.104"/>
					<TrackLine>
						<End x="176.53" y="196.088"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="194.056"/>
					</TrackLine>
					<TrackLine>
						<End x="177.292" y="193.294"/>
					</TrackLine>
					<TrackLine>
						<End x="179.324" y="193.294"/>
					</TrackLine>
					<TrackLine>
						<End x="181.61" y="195.58"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="195.58"/>
					</TrackLine>
					<TrackLine>
						<End x="195.58" y="193.294"/>
					</TrackLine>
					<TrackLine>
						<End x="200.66" y="193.294"/>
					</TrackLine>
					<TrackLine>
						<End x="201.93" y="194.564"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="194.564"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.254">
					<Start x="193.294" y="149.352"/>
					<TrackLine>
						<End x="194.818" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="196.088" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="203.708" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="204.978" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="149.352"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.254">
					<Start x="154.686" y="146.812"/>
					<TrackLine>
						<End x="156.21" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="157.48" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="165.862" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="167.132" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="146.812"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.254">
					<Start x="173.99" y="146.812"/>
					<TrackLine>
						<End x="175.514" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="184.912" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="186.182" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="146.812"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.254">
					<Start x="177.546" y="204.724"/>
					<TrackLine>
						<End x="178.562" y="204.724"/>
					</TrackLine>
					<TrackLine>
						<End x="179.324" y="203.962"/>
					</TrackLine>
					<TrackLine>
						<End x="185.42" y="203.962"/>
					</TrackLine>
					<TrackLine>
						<End x="185.928" y="203.454"/>
					</TrackLine>
					<TrackLine>
						<End x="193.04" y="203.454"/>
					</TrackLine>
					<TrackLine>
						<End x="194.056" y="204.47"/>
					</TrackLine>
					<TrackLine>
						<End x="194.056" y="204.978"/>
					</TrackLine>
					<TrackLine>
						<End x="193.04" y="205.994"/>
					</TrackLine>
					<TrackLine>
						<End x="192.532" y="205.994"/>
					</TrackLine>
					<TrackLine>
						<End x="191.77" y="206.756"/>
					</TrackLine>
					<TrackLine>
						<End x="191.77" y="207.772"/>
					</TrackLine>
					<TrackLine>
						<End x="192.278" y="208.28"/>
					</TrackLine>
					<TrackLine>
						<End x="202.946" y="208.28"/>
					</TrackLine>
					<TrackLine>
						<End x="204.216" y="207.01"/>
					</TrackLine>
					<TrackLine>
						<End x="204.216" y="201.422"/>
					</TrackLine>
					<TrackLine>
						<End x="208.534" y="197.104"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="197.104"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.254">
					<Start x="193.294" y="146.812"/>
					<TrackLine>
						<End x="194.818" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="196.088" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="211.328" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="146.812"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.254">
					<Start x="154.686" y="144.272"/>
					<TrackLine>
						<End x="156.21" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="157.48" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="165.862" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="167.132" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="144.272"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.254">
					<Start x="177.546" y="207.264"/>
					<TrackLine>
						<End x="180.848" y="210.566"/>
					</TrackLine>
					<TrackLine>
						<End x="189.738" y="210.566"/>
					</TrackLine>
					<TrackLine>
						<End x="190.246" y="211.074"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="211.074"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.254">
					<Start x="158.75" y="222.504"/>
					<TrackLine>
						<End x="162.814" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="179.324" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="179.832" y="219.456"/>
					</TrackLine>
					<TrackLine>
						<End x="186.182" y="219.456"/>
					</TrackLine>
					<TrackLine>
						<End x="187.198" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="197.866" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="198.374" y="217.932"/>
					</TrackLine>
					<TrackLine>
						<End x="198.374" y="213.868"/>
					</TrackLine>
					<TrackLine>
						<End x="197.866" y="213.36"/>
					</TrackLine>
					<TrackLine>
						<End x="196.342" y="213.36"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="212.852"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="211.074"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.254">
					<Start x="193.294" y="144.272"/>
					<TrackLine>
						<End x="194.818" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="196.088" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="211.328" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="144.272"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.254">
					<Start x="195.834" y="211.074"/>
					<TrackLine>
						<End x="203.454" y="211.074"/>
					</TrackLine>
					<TrackLine>
						<End x="204.724" y="209.804"/>
					</TrackLine>
					<TrackLine>
						<End x="204.724" y="202.946"/>
					</TrackLine>
					<TrackLine>
						<End x="208.026" y="199.644"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="199.644"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.254">
					<Start x="173.99" y="144.272"/>
					<TrackLine>
						<End x="175.387" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="176.657" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="185.293" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="186.563" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="144.272"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.254">
					<Start x="154.686" y="141.732"/>
					<TrackLine>
						<End x="155.702" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="156.972" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="165.862" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="167.132" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="141.732"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.254">
					<Start x="173.99" y="222.504"/>
					<TrackLine>
						<End x="175.006" y="223.52"/>
					</TrackLine>
					<TrackLine>
						<End x="194.31" y="223.52"/>
					</TrackLine>
					<TrackLine>
						<End x="196.342" y="221.488"/>
					</TrackLine>
					<TrackLine>
						<End x="202.692" y="221.488"/>
					</TrackLine>
					<TrackLine>
						<End x="205.232" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="221.234" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="221.742" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="221.742" y="209.804"/>
					</TrackLine>
					<TrackLine>
						<End x="220.98" y="209.042"/>
					</TrackLine>
					<TrackLine>
						<End x="217.932" y="209.042"/>
					</TrackLine>
					<TrackLine>
						<End x="216.408" y="207.518"/>
					</TrackLine>
					<TrackLine>
						<End x="216.408" y="206.502"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="202.184"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.254">
					<Start x="173.99" y="141.732"/>
					<TrackLine>
						<End x="175.514" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="185.293" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="186.563" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="141.732"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.254">
					<Start x="193.294" y="141.732"/>
					<TrackLine>
						<End x="194.818" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="196.088" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="211.328" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="141.732"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.254">
					<Start x="169.926" y="213.614"/>
					<TrackLine>
						<End x="176.276" y="213.614"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="212.344"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.254">
					<Start x="154.686" y="139.192"/>
					<TrackLine>
						<End x="156.718" y="139.192"/>
					</TrackLine>
					<TrackLine>
						<End x="157.988" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="166.116" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="167.386" y="139.192"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="139.192"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.254">
					<Start x="173.99" y="139.192"/>
					<TrackLine>
						<End x="175.514" y="139.192"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="185.293" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="186.563" y="139.192"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="139.192"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.254">
					<Start x="193.294" y="139.192"/>
					<TrackLine>
						<End x="194.818" y="139.192"/>
					</TrackLine>
					<TrackLine>
						<End x="195.326" y="139.7"/>
					</TrackLine>
					<TrackLine>
						<End x="195.326" y="139.954"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="203.962" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="205.232" y="139.192"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="139.192"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.254">
					<Start x="139.446" y="141.732"/>
					<TrackLine>
						<End x="146.05" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="156.718" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="157.988" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="141.732"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.254">
					<Start x="158.75" y="141.732"/>
					<TrackLine>
						<End x="165.989" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="167.259" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="141.732"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.254">
					<Start x="173.99" y="225.044"/>
					<TrackLine>
						<End x="175.006" y="224.028"/>
					</TrackLine>
					<TrackLine>
						<End x="202.946" y="224.028"/>
					</TrackLine>
					<TrackLine>
						<End x="204.978" y="221.996"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.254">
					<Start x="178.054" y="141.732"/>
					<TrackLine>
						<End x="185.293" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="186.563" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="194.564" y="140.462"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="141.732"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="141.732"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.254">
					<Start x="139.446" y="144.272"/>
					<TrackLine>
						<End x="146.05" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="155.956" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="144.272"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.254">
					<Start x="158.75" y="144.272"/>
					<TrackLine>
						<End x="165.862" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="167.132" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="175.387" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="176.657" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="144.272"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.254">
					<Start x="178.054" y="144.272"/>
					<TrackLine>
						<End x="185.293" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="186.563" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="194.564" y="143.002"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="144.272"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="144.272"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.254">
					<Start x="180.086" y="220.599"/>
					<TrackLine>
						<End x="180.467" y="220.98"/>
					</TrackLine>
					<TrackLine>
						<End x="193.802" y="220.98"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="200.914" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="203.454" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="218.694" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="215.9"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="214.884"/>
					</TrackLine>
					<TrackLine>
						<End x="218.44" y="214.122"/>
					</TrackLine>
					<TrackLine>
						<End x="216.408" y="214.122"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="209.804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.254">
					<Start x="158.75" y="227.584"/>
					<TrackLine>
						<End x="160.782" y="227.584"/>
					</TrackLine>
					<TrackLine>
						<End x="167.386" y="220.98"/>
					</TrackLine>
					<TrackLine>
						<End x="179.705" y="220.98"/>
					</TrackLine>
					<TrackLine>
						<End x="180.086" y="220.599"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.254">
					<Start x="139.446" y="146.812"/>
					<TrackLine>
						<End x="146.05" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="155.956" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="146.812"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.254">
					<Start x="158.75" y="146.812"/>
					<TrackLine>
						<End x="165.862" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="167.132" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="175.387" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="176.657" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="146.812"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.254">
					<Start x="211.582" y="208.534"/>
					<TrackLine>
						<End x="214.884" y="208.534"/>
					</TrackLine>
					<TrackLine>
						<End x="217.932" y="211.582"/>
					</TrackLine>
					<TrackLine>
						<End x="218.44" y="211.582"/>
					</TrackLine>
					<TrackLine>
						<End x="219.71" y="212.852"/>
					</TrackLine>
					<TrackLine>
						<End x="219.71" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="219.202" y="216.916"/>
					</TrackLine>
					<TrackLine>
						<End x="217.17" y="216.916"/>
					</TrackLine>
					<TrackLine>
						<End x="215.646" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="204.978" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="202.438" y="220.98"/>
					</TrackLine>
					<TrackLine>
						<End x="195.072" y="220.98"/>
					</TrackLine>
					<TrackLine>
						<End x="194.564" y="221.488"/>
					</TrackLine>
					<TrackLine>
						<End x="173.482" y="221.488"/>
					</TrackLine>
					<TrackLine>
						<End x="172.212" y="222.758"/>
					</TrackLine>
					<TrackLine>
						<End x="172.212" y="225.806"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="227.584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.254">
					<Start x="177.546" y="194.564"/>
					<TrackLine>
						<End x="179.07" y="196.088"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="196.088"/>
					</TrackLine>
					<TrackLine>
						<End x="213.36" y="196.85"/>
					</TrackLine>
					<TrackLine>
						<End x="213.36" y="200.152"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="200.914"/>
					</TrackLine>
					<TrackLine>
						<End x="211.836" y="200.914"/>
					</TrackLine>
					<TrackLine>
						<End x="211.074" y="201.676"/>
					</TrackLine>
					<TrackLine>
						<End x="211.074" y="208.026"/>
					</TrackLine>
					<TrackLine>
						<End x="211.582" y="208.534"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.254">
					<Start x="178.054" y="146.812"/>
					<TrackLine>
						<End x="185.166" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="194.564" y="145.542"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="146.812"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="146.812"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.254">
					<Start x="211.582" y="208.534"/>
					<TrackLine>
						<End x="211.074" y="209.042"/>
					</TrackLine>
					<TrackLine>
						<End x="211.074" y="211.328"/>
					</TrackLine>
					<TrackLine>
						<End x="212.09" y="212.344"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="CPUCLK"/>
				<Subwire width="0.254">
					<Start x="135.89" y="163.068"/>
					<TrackLine>
						<End x="135.89" y="164.084"/>
					</TrackLine>
					<TrackLine>
						<End x="136.144" y="164.338"/>
					</TrackLine>
					<TrackLine>
						<End x="136.906" y="164.338"/>
					</TrackLine>
					<TrackLine>
						<End x="138.176" y="165.608"/>
					</TrackLine>
					<TrackLine>
						<End x="138.176" y="169.926"/>
					</TrackLine>
					<TrackLine>
						<End x="138.938" y="170.688"/>
					</TrackLine>
					<TrackLine>
						<End x="150.114" y="170.688"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="179.324"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETC9_2"/>
				<Subwire width="0.254">
					<Start x="135.89" y="147.828"/>
					<TrackLine>
						<End x="134.62" y="146.558"/>
					</TrackLine>
					<TrackLine>
						<End x="121.92" y="146.558"/>
					</TrackLine>
					<TrackLine>
						<End x="119.126" y="143.764"/>
					</TrackLine>
					<TrackLine>
						<End x="114.046" y="143.764"/>
					</TrackLine>
					<TrackLine>
						<End x="113.03" y="144.78"/>
					</TrackLine>
					<TrackLine>
						<End x="113.03" y="154.051"/>
					</TrackLine>
					<TrackLine>
						<End x="120.523" y="161.544"/>
					</TrackLine>
					<TrackLine>
						<End x="122.682" y="161.544"/>
					</TrackLine>
					<TrackLine>
						<End x="123.698" y="160.528"/>
					</TrackLine>
					<TrackLine>
						<End x="125.73" y="160.528"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETC9_1"/>
				<Subwire width="0.254">
					<Start x="137.0584" y="171.958"/>
					<TrackLine>
						<End x="135.128" y="171.958"/>
					</TrackLine>
					<TrackLine>
						<End x="134.112" y="170.942"/>
					</TrackLine>
					<TrackLine>
						<End x="134.112" y="170.18"/>
					</TrackLine>
					<TrackLine>
						<End x="134.874" y="169.418"/>
					</TrackLine>
					<TrackLine>
						<End x="135.636" y="169.418"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="169.164"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="168.148"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETC9_1"/>
				<Subwire width="0.254">
					<Start x="133.858" y="176.276"/>
					<TrackLine>
						<End x="135.128" y="176.276"/>
					</TrackLine>
					<TrackLine>
						<End x="137.16" y="174.244"/>
					</TrackLine>
					<TrackLine>
						<End x="137.16" y="172.0596"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETC9_1"/>
				<Subwire width="0.254">
					<Start x="137.16" y="172.0596"/>
					<TrackLine>
						<End x="137.16" y="171.958"/>
					</TrackLine>
					<TrackLine>
						<End x="137.0584" y="171.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETC9_1"/>
				<Subwire width="0.254">
					<Start x="137.0584" y="171.958"/>
					<TrackLine>
						<End x="137.16" y="172.0596"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.254">
					<Start x="158.75" y="194.564"/>
					<TrackLine>
						<End x="168.656" y="194.564"/>
					</TrackLine>
					<TrackLine>
						<End x="170.434" y="192.786"/>
					</TrackLine>
					<TrackLine>
						<End x="172.212" y="192.786"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="194.564"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A15"/>
				<Subwire width="0.254">
					<Start x="150.495" y="209.931"/>
					<TrackLine>
						<End x="153.924" y="213.36"/>
					</TrackLine>
					<TrackLine>
						<End x="165.227" y="213.36"/>
					</TrackLine>
					<TrackLine>
						<End x="168.275" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="217.424"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A14"/>
				<Subwire width="0.254">
					<Start x="152.146" y="221.488"/>
					<TrackLine>
						<End x="154.432" y="223.774"/>
					</TrackLine>
					<TrackLine>
						<End x="161.036" y="223.774"/>
					</TrackLine>
					<TrackLine>
						<End x="165.1" y="219.71"/>
					</TrackLine>
					<TrackLine>
						<End x="172.72" y="219.71"/>
					</TrackLine>
					<TrackLine>
						<End x="173.482" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="174.498" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="219.964"/>
					</TrackLine>
					<TrackLine>
						<End x="177.546" y="219.964"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A13"/>
				<Subwire width="0.254">
					<Start x="147.066" y="200.152"/>
					<TrackLine>
						<End x="149.098" y="200.152"/>
					</TrackLine>
					<TrackLine>
						<End x="151.13" y="202.184"/>
					</TrackLine>
					<TrackLine>
						<End x="155.702" y="202.184"/>
					</TrackLine>
					<TrackLine>
						<End x="156.972" y="200.914"/>
					</TrackLine>
					<TrackLine>
						<End x="161.1122" y="200.914"/>
					</TrackLine>
					<TrackLine>
						<End x="165.9382" y="196.088"/>
					</TrackLine>
					<TrackLine>
						<End x="171.704" y="196.088"/>
					</TrackLine>
					<TrackLine>
						<End x="171.958" y="195.834"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A12"/>
				<Subwire width="0.254">
					<Start x="139.446" y="169.672"/>
					<TrackLine>
						<End x="146.812" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="148.082" y="168.402"/>
					</TrackLine>
					<TrackLine>
						<End x="155.702" y="168.402"/>
					</TrackLine>
					<TrackLine>
						<End x="156.972" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="169.672"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A12"/>
				<Subwire width="0.254">
					<Start x="158.75" y="169.672"/>
					<TrackLine>
						<End x="166.116" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="167.386" y="168.402"/>
					</TrackLine>
					<TrackLine>
						<End x="175.006" y="168.402"/>
					</TrackLine>
					<TrackLine>
						<End x="176.276" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="169.672"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A12"/>
				<Subwire width="0.254">
					<Start x="178.054" y="169.672"/>
					<TrackLine>
						<End x="185.293" y="169.672"/>
					</TrackLine>
					<TrackLine>
						<End x="186.563" y="168.402"/>
					</TrackLine>
					<TrackLine>
						<End x="196.088" y="168.402"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="169.672"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A11"/>
				<Subwire width="0.254">
					<Start x="154.686" y="159.512"/>
					<TrackLine>
						<End x="156.21" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="157.48" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="165.862" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="167.132" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="159.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A11"/>
				<Subwire width="0.254">
					<Start x="193.294" y="159.512"/>
					<TrackLine>
						<End x="194.818" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="196.088" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="211.328" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="159.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A11"/>
				<Subwire width="0.254">
					<Start x="173.99" y="159.512"/>
					<TrackLine>
						<End x="175.514" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="185.039" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="186.309" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="159.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A10"/>
				<Subwire width="0.254">
					<Start x="154.686" y="154.432"/>
					<TrackLine>
						<End x="156.21" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="157.48" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="165.735" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="167.005" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="154.432"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A10"/>
				<Subwire width="0.254">
					<Start x="173.99" y="154.432"/>
					<TrackLine>
						<End x="175.768" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="177.038" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="185.166" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="154.432"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A10"/>
				<Subwire width="0.254">
					<Start x="193.294" y="154.432"/>
					<TrackLine>
						<End x="195.326" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="196.596" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="211.328" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="154.432"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A9"/>
				<Subwire width="0.254">
					<Start x="154.686" y="162.052"/>
					<TrackLine>
						<End x="156.21" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="157.48" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="165.989" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="167.259" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="162.052"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A9"/>
				<Subwire width="0.254">
					<Start x="173.99" y="162.052"/>
					<TrackLine>
						<End x="175.514" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="185.166" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="162.052"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A9"/>
				<Subwire width="0.254">
					<Start x="193.294" y="162.052"/>
					<TrackLine>
						<End x="194.818" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="196.088" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="211.328" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="162.052"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A8"/>
				<Subwire width="0.254">
					<Start x="154.686" y="164.592"/>
					<TrackLine>
						<End x="156.21" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="157.48" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="165.989" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="167.259" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="164.592"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A8"/>
				<Subwire width="0.254">
					<Start x="173.99" y="164.592"/>
					<TrackLine>
						<End x="175.641" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="176.911" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="185.166" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="164.592"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A8"/>
				<Subwire width="0.254">
					<Start x="193.294" y="164.592"/>
					<TrackLine>
						<End x="194.818" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="196.088" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="211.328" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="212.598" y="164.592"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A7"/>
				<Subwire width="0.254">
					<Start x="139.446" y="167.132"/>
					<TrackLine>
						<End x="146.05" y="167.132"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="156.464" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="157.734" y="167.132"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="167.132"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A7"/>
				<Subwire width="0.254">
					<Start x="158.75" y="167.132"/>
					<TrackLine>
						<End x="165.989" y="167.132"/>
					</TrackLine>
					<TrackLine>
						<End x="167.259" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="175.768" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="177.038" y="167.132"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="167.132"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A7"/>
				<Subwire width="0.254">
					<Start x="178.054" y="167.132"/>
					<TrackLine>
						<End x="185.166" y="167.132"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="195.072" y="165.862"/>
					</TrackLine>
					<TrackLine>
						<End x="196.342" y="167.132"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="167.132"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A6"/>
				<Subwire width="0.254">
					<Start x="139.446" y="164.592"/>
					<TrackLine>
						<End x="146.05" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="155.956" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="164.592"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A6"/>
				<Subwire width="0.254">
					<Start x="158.75" y="164.592"/>
					<TrackLine>
						<End x="165.989" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="167.259" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="164.592"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A6"/>
				<Subwire width="0.254">
					<Start x="178.054" y="164.592"/>
					<TrackLine>
						<End x="185.166" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="194.564" y="163.322"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="164.592"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="164.592"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A5"/>
				<Subwire width="0.254">
					<Start x="139.446" y="162.052"/>
					<TrackLine>
						<End x="146.05" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="155.956" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="162.052"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A5"/>
				<Subwire width="0.254">
					<Start x="158.75" y="162.052"/>
					<TrackLine>
						<End x="165.989" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="167.259" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="162.052"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A5"/>
				<Subwire width="0.254">
					<Start x="178.054" y="162.052"/>
					<TrackLine>
						<End x="185.166" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="194.564" y="160.782"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="162.052"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="162.052"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A4"/>
				<Subwire width="0.254">
					<Start x="139.446" y="159.512"/>
					<TrackLine>
						<End x="146.05" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="155.956" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="159.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A4"/>
				<Subwire width="0.254">
					<Start x="158.75" y="159.512"/>
					<TrackLine>
						<End x="165.862" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="167.132" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="175.26" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="159.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A4"/>
				<Subwire width="0.254">
					<Start x="178.054" y="159.512"/>
					<TrackLine>
						<End x="185.166" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="194.564" y="158.242"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="159.512"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="159.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A3"/>
				<Subwire width="0.254">
					<Start x="139.446" y="156.972"/>
					<TrackLine>
						<End x="146.05" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="155.956" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="156.972"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A3"/>
				<Subwire width="0.254">
					<Start x="158.75" y="156.972"/>
					<TrackLine>
						<End x="165.608" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="166.878" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="175.768" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="177.038" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="156.972"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A3"/>
				<Subwire width="0.254">
					<Start x="178.054" y="156.972"/>
					<TrackLine>
						<End x="185.166" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="194.564" y="155.702"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="156.972"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="156.972"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A3"/>
				<Subwire width="0.254">
					<Start x="182.626" y="206.248"/>
					<TrackLine>
						<End x="183.642" y="206.248"/>
					</TrackLine>
					<TrackLine>
						<End x="187.198" y="209.804"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="209.804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A2"/>
				<Subwire width="0.254">
					<Start x="139.446" y="154.432"/>
					<TrackLine>
						<End x="146.812" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="148.082" y="153.162"/>
					</TrackLine>
					<TrackLine>
						<End x="155.702" y="153.162"/>
					</TrackLine>
					<TrackLine>
						<End x="156.972" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="154.432"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A2"/>
				<Subwire width="0.254">
					<Start x="158.75" y="154.432"/>
					<TrackLine>
						<End x="165.735" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="167.005" y="153.162"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="153.162"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="154.432"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A2"/>
				<Subwire width="0.254">
					<Start x="178.054" y="154.432"/>
					<TrackLine>
						<End x="185.166" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="153.162"/>
					</TrackLine>
					<TrackLine>
						<End x="194.818" y="153.162"/>
					</TrackLine>
					<TrackLine>
						<End x="196.088" y="154.432"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="154.432"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A2"/>
				<Subwire width="0.254">
					<Start x="192.786" y="207.264"/>
					<TrackLine>
						<End x="196.596" y="203.454"/>
					</TrackLine>
					<TrackLine>
						<End x="202.438" y="203.454"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.254">
					<Start x="139.446" y="151.892"/>
					<TrackLine>
						<End x="146.05" y="151.892"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="156.464" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="157.734" y="151.892"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="151.892"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.254">
					<Start x="158.75" y="151.892"/>
					<TrackLine>
						<End x="165.989" y="151.892"/>
					</TrackLine>
					<TrackLine>
						<End x="167.259" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="151.892"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="151.892"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.254">
					<Start x="173.99" y="209.804"/>
					<TrackLine>
						<End x="176.022" y="207.772"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="207.264"/>
					</TrackLine>
					<TrackLine>
						<End x="177.292" y="205.994"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2572" y="205.994"/>
					</TrackLine>
					<TrackLine>
						<End x="179.5272" y="204.724"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="204.724"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.254">
					<Start x="178.054" y="151.892"/>
					<TrackLine>
						<End x="184.785" y="151.892"/>
					</TrackLine>
					<TrackLine>
						<End x="186.055" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="195.072" y="150.622"/>
					</TrackLine>
					<TrackLine>
						<End x="196.342" y="151.892"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="151.892"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.254">
					<Start x="192.786" y="204.724"/>
					<TrackLine>
						<End x="191.262" y="206.248"/>
					</TrackLine>
					<TrackLine>
						<End x="191.262" y="208.28"/>
					</TrackLine>
					<TrackLine>
						<End x="191.77" y="208.788"/>
					</TrackLine>
					<TrackLine>
						<End x="194.818" y="208.788"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="209.804"/>
					</TrackLine>
					<TrackLine>
						<End x="196.85" y="209.804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A0"/>
				<Subwire width="0.254">
					<Start x="139.446" y="149.352"/>
					<TrackLine>
						<End x="146.05" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="155.956" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="149.352"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A0"/>
				<Subwire width="0.254">
					<Start x="158.75" y="149.352"/>
					<TrackLine>
						<End x="165.862" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="167.132" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="176.784" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="149.352"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A0"/>
				<Subwire width="0.254">
					<Start x="173.99" y="212.344"/>
					<TrackLine>
						<End x="172.212" y="210.566"/>
					</TrackLine>
					<TrackLine>
						<End x="172.212" y="206.756"/>
					</TrackLine>
					<TrackLine>
						<End x="172.974" y="205.994"/>
					</TrackLine>
					<TrackLine>
						<End x="174.752" y="205.994"/>
					</TrackLine>
					<TrackLine>
						<End x="177.292" y="203.454"/>
					</TrackLine>
					<TrackLine>
						<End x="184.912" y="203.454"/>
					</TrackLine>
					<TrackLine>
						<End x="186.182" y="202.184"/>
					</TrackLine>
					<TrackLine>
						<End x="192.786" y="202.184"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A0"/>
				<Subwire width="0.254">
					<Start x="178.054" y="149.352"/>
					<TrackLine>
						<End x="185.166" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="186.436" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="194.564" y="148.082"/>
					</TrackLine>
					<TrackLine>
						<End x="195.834" y="149.352"/>
					</TrackLine>
					<TrackLine>
						<End x="197.358" y="149.352"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A0"/>
				<Subwire width="0.254">
					<Start x="192.786" y="202.184"/>
					<TrackLine>
						<End x="193.802" y="202.184"/>
					</TrackLine>
					<TrackLine>
						<End x="195.072" y="200.914"/>
					</TrackLine>
					<TrackLine>
						<End x="201.676" y="200.914"/>
					</TrackLine>
					<TrackLine>
						<End x="203.708" y="202.946"/>
					</TrackLine>
					<TrackLine>
						<End x="203.708" y="204.47"/>
					</TrackLine>
					<TrackLine>
						<End x="200.914" y="207.264"/>
					</TrackLine>
					<TrackLine>
						<End x="196.85" y="207.264"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="19200"/>
				<Subwire width="0.254">
					<Start x="136.398" y="217.424"/>
					<TrackLine>
						<End x="137.922" y="215.9"/>
					</TrackLine>
					<TrackLine>
						<End x="144.526" y="215.9"/>
					</TrackLine>
					<TrackLine>
						<End x="145.034" y="215.392"/>
					</TrackLine>
					<TrackLine>
						<End x="145.034" y="211.836"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="209.804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="9600"/>
				<Subwire width="0.254">
					<Start x="136.398" y="222.504"/>
					<TrackLine>
						<End x="141.351" y="222.504"/>
					</TrackLine>
					<TrackLine>
						<End x="142.748" y="221.107"/>
					</TrackLine>
					<TrackLine>
						<End x="150.114" y="221.107"/>
					</TrackLine>
					<TrackLine>
						<End x="152.273" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="155.194" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="157.988" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="159.004" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="159.766" y="215.392"/>
					</TrackLine>
					<TrackLine>
						<End x="159.766" y="214.376"/>
					</TrackLine>
					<TrackLine>
						<End x="159.258" y="213.868"/>
					</TrackLine>
					<TrackLine>
						<End x="148.59" y="213.868"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="212.344"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="4800"/>
				<Subwire width="0.254">
					<Start x="136.398" y="225.044"/>
					<TrackLine>
						<End x="135.636" y="225.044"/>
					</TrackLine>
					<TrackLine>
						<End x="134.366" y="226.314"/>
					</TrackLine>
					<TrackLine>
						<End x="125.984" y="226.314"/>
					</TrackLine>
					<TrackLine>
						<End x="124.714" y="225.044"/>
					</TrackLine>
					<TrackLine>
						<End x="124.714" y="224.536"/>
					</TrackLine>
					<TrackLine>
						<End x="125.73" y="223.52"/>
					</TrackLine>
					<TrackLine>
						<End x="128.778" y="223.52"/>
					</TrackLine>
					<TrackLine>
						<End x="133.604" y="218.694"/>
					</TrackLine>
					<TrackLine>
						<End x="136.652" y="218.694"/>
					</TrackLine>
					<TrackLine>
						<End x="138.938" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="145.034" y="216.408"/>
					</TrackLine>
					<TrackLine>
						<End x="145.542" y="215.9"/>
					</TrackLine>
					<TrackLine>
						<End x="145.542" y="215.392"/>
					</TrackLine>
					<TrackLine>
						<End x="146.05" y="214.884"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="214.884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="1200"/>
				<Subwire width="0.254">
					<Start x="136.398" y="219.964"/>
					<TrackLine>
						<End x="141.0716" y="219.964"/>
					</TrackLine>
					<TrackLine>
						<End x="142.5956" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="146.05" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="217.424"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="600"/>
				<Subwire width="0.254">
					<Start x="144.018" y="219.964"/>
					<TrackLine>
						<End x="147.066" y="219.964"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="150"/>
				<Subwire width="0.254">
					<Start x="144.018" y="222.504"/>
					<TrackLine>
						<End x="146.558" y="225.044"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="225.044"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="75"/>
				<Subwire width="0.254">
					<Start x="144.018" y="225.044"/>
					<TrackLine>
						<End x="146.558" y="227.584"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="227.584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETU6_12"/>
				<Subwire width="0.254">
					<Start x="126.746" y="196.088"/>
					<TrackLine>
						<End x="133.096" y="202.438"/>
					</TrackLine>
					<TrackLine>
						<End x="142.748" y="202.438"/>
					</TrackLine>
					<TrackLine>
						<End x="146.304" y="198.882"/>
					</TrackLine>
					<TrackLine>
						<End x="149.86" y="198.882"/>
					</TrackLine>
					<TrackLine>
						<End x="152.4" y="201.422"/>
					</TrackLine>
					<TrackLine>
						<End x="154.94" y="201.422"/>
					</TrackLine>
					<TrackLine>
						<End x="156.718" y="199.644"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="199.644"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETU6_28"/>
				<Subwire width="0.254">
					<Start x="173.99" y="197.104"/>
					<TrackLine>
						<End x="175.514" y="195.58"/>
					</TrackLine>
					<TrackLine>
						<End x="175.514" y="192.024"/>
					</TrackLine>
					<TrackLine>
						<End x="174.498" y="191.008"/>
					</TrackLine>
					<TrackLine>
						<End x="171.45" y="191.008"/>
					</TrackLine>
					<TrackLine>
						<End x="168.91" y="193.548"/>
					</TrackLine>
					<TrackLine>
						<End x="153.67" y="193.548"/>
					</TrackLine>
					<TrackLine>
						<End x="148.59" y="188.468"/>
					</TrackLine>
					<TrackLine>
						<End x="148.59" y="187.452"/>
					</TrackLine>
					<TrackLine>
						<End x="147.32" y="186.182"/>
					</TrackLine>
					<TrackLine>
						<End x="144.272" y="186.182"/>
					</TrackLine>
					<TrackLine>
						<End x="143.002" y="187.452"/>
					</TrackLine>
					<TrackLine>
						<End x="143.002" y="191.008"/>
					</TrackLine>
					<TrackLine>
						<End x="141.732" y="192.278"/>
					</TrackLine>
					<TrackLine>
						<End x="130.556" y="192.278"/>
					</TrackLine>
					<TrackLine>
						<End x="126.746" y="188.468"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETU6_15"/>
				<Subwire width="0.254">
					<Start x="126.238" y="225.044"/>
					<TrackLine>
						<End x="127.254" y="224.028"/>
					</TrackLine>
					<TrackLine>
						<End x="133.858" y="224.028"/>
					</TrackLine>
					<TrackLine>
						<End x="135.128" y="222.758"/>
					</TrackLine>
					<TrackLine>
						<End x="135.128" y="222.25"/>
					</TrackLine>
					<TrackLine>
						<End x="136.144" y="221.234"/>
					</TrackLine>
					<TrackLine>
						<End x="140.716" y="221.234"/>
					</TrackLine>
					<TrackLine>
						<End x="143.002" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="150.749" y="218.948"/>
					</TrackLine>
					<TrackLine>
						<End x="153.543" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="156.083" y="216.154"/>
					</TrackLine>
					<TrackLine>
						<End x="157.226" y="215.011"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SIOSEL"/>
				<Subwire width="0.254">
					<Start x="153.3652" y="207.899"/>
					<TrackLine>
						<End x="154.2542" y="208.788"/>
					</TrackLine>
					<TrackLine>
						<End x="156.464" y="208.788"/>
					</TrackLine>
					<TrackLine>
						<End x="157.734" y="210.058"/>
					</TrackLine>
					<TrackLine>
						<End x="157.734" y="210.312"/>
					</TrackLine>
					<TrackLine>
						<End x="158.242" y="210.82"/>
					</TrackLine>
					<TrackLine>
						<End x="164.973" y="210.82"/>
					</TrackLine>
					<TrackLine>
						<End x="169.037" y="214.884"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="214.884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="M1"/>
				<Subwire width="0.254">
					<Start x="192.786" y="194.564"/>
					<TrackLine>
						<End x="187.198" y="194.564"/>
					</TrackLine>
					<TrackLine>
						<End x="183.642" y="191.008"/>
					</TrackLine>
					<TrackLine>
						<End x="177.038" y="191.008"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="192.024"/>
					</TrackLine>
					<TrackLine>
						<End x="176.022" y="196.596"/>
					</TrackLine>
					<TrackLine>
						<End x="174.244" y="198.374"/>
					</TrackLine>
					<TrackLine>
						<End x="167.386" y="198.374"/>
					</TrackLine>
					<TrackLine>
						<End x="166.37" y="199.39"/>
					</TrackLine>
					<TrackLine>
						<End x="166.37" y="208.788"/>
					</TrackLine>
					<TrackLine>
						<End x="165.354" y="209.804"/>
					</TrackLine>
					<TrackLine>
						<End x="158.75" y="209.804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IORQ"/>
				<Subwire width="0.254">
					<Start x="173.99" y="217.424"/>
					<TrackLine>
						<End x="175.514" y="217.424"/>
					</TrackLine>
					<TrackLine>
						<End x="176.53" y="218.44"/>
					</TrackLine>
					<TrackLine>
						<End x="182.118" y="218.44"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IORQ"/>
				<Subwire width="0.254">
					<Start x="177.546" y="179.324"/>
					<TrackLine>
						<End x="183.134" y="184.912"/>
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
		<View scale="8.18743" scrollHorz="170.688" scrollVert="183.3245"/>
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
				<LayerRef name="TopMask"/>
				<Colors details="#b15738" pads="#8d452c" fix="#b15738"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopSilk"/>
				<Colors details="#50281b" pads="#402015" fix="#50281b"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopPaste"/>
				<Colors details="#af583a" pads="#8c462e" fix="#af583a"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopAssy"/>
				<Colors details="#259500" pads="#259500" fix="#165900"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="MECH4"/>
				<Colors details="#51271a" pads="#401f14" fix="#51271a"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="MECH16"/>
				<Colors details="#51271a" pads="#401f14" fix="#51271a"/>
				<Show details="on" pads="on"/>
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
				<LayerRef name="BotAssy"/>
				<Colors details="#00aaaa" pads="#00aaaa" fix="#006666"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotPaste"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotSilk"/>
				<Colors details="#122e1c" pads="#0e2416" fix="#122e1c"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotMask"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
		</LayersVisualOptions>
		<ColorNets enabled="on" colorizeWire="on" colorizePad="on" colorizeCopper="on" colorizeVia="on" colorizeNetline="on"/>
		<FilterNetlines enabled="off"/>
	</DisplayControl>

	<DialogSettings version="1.1">
		<DRCSettings logFileName="drc.log" messageLimit="1000"
		 tolerance="0.0005"
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