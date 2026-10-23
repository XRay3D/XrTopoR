<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : MinVia.fst                     -->
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
		<OriginalFile>.\Z80 - routed.PCB</OriginalFile>
		<Units dist="mm" time="ps"/>
	</Header>

	<Layers version="1.1">
		<StackUpLayers>
			<Layer name="TopAssy" type="Assy" compsOutline="on"/>
			<Layer name="MECH4" type="Mechanical" thickness="0"/>
			<Layer name="MECH16" type="Mechanical" thickness="0"/>
			<Layer name="TopPaste" type="Paste" thickness="0"/>
			<Layer name="TopSilk" type="Silk" thickness="0"/>
			<Layer name="TopMask" type="Mask" thickness="0"/>
			<Layer name="Top" type="Signal" thickness="0"/>
			<Layer name="Bottom" type="Signal" thickness="0"/>
			<Layer name="BotMask" type="Mask" thickness="0"/>
			<Layer name="BotSilk" type="Silk" thickness="0"/>
			<Layer name="BotPaste" type="Paste" thickness="0"/>
			<Layer name="BotAssy" type="Assy" compsOutline="on"/>
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
					<Label name="Value" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-1.778" y="2.286"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-7.747" y="-8.001"/>
					</Label>
					<Label name="RefDes" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="2.54" y="5.08"/>
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
					<Label name="Value" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-1.778" y="1.778"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-7.747" y="-8.001"/>
					</Label>
					<Label name="RefDes" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="2.54" y="5.08"/>
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
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="3.937" y="-0.508"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.6416" y="-5.4356"/>
					</Label>
					<Label name="RefDes" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="14.478" y="-0.762"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DIP14_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="P:SX50Y50D25A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-10.16"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-7.62"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-5.08"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-2.54"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-12.7"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-15.24"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-15.24"/>
					</Pad>
					<Pad padNum="14" name="14">
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
					<Label name="Value" align="LB" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.318" y="-10.414"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.762" y="-19.4056"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="1.143" y="1.778"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DIP16_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="P:SX50Y50D25A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-15.24"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-12.7"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-10.16"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-7.62"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-5.08"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="-2.54"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-12.7"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-15.24"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-17.78"/>
					</Pad>
					<Pad padNum="16" name="16">
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
					<Label name="Value" align="LB" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.318" y="-11.684"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.762" y="-21.9456"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="1.27" y="-20.701"/>
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
					<Label name="Value" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="6.35" y="0.508"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.6416" y="-4.4196"/>
					</Label>
					<Label name="RefDes" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="7.62" y="-2.032"/>
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
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-1.7018" y="-0.508"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.6416" y="-4.4196"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-2.54" y="1.905"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DIP40_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="P:SX50Y50D25A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-22.86"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-25.4"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-27.94"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-30.48"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-33.02"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-35.56"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-38.1"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-40.64"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-43.18"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-45.72"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-48.26"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-48.26"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-45.72"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-43.18"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-40.64"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-38.1"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-35.56"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-33.02"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-30.48"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-27.94"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-25.4"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-22.86"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-20.32"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-17.78"/>
					</Pad>
					<Pad padNum="28" name="28">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-15.24"/>
					</Pad>
					<Pad padNum="29" name="29">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-12.7"/>
					</Pad>
					<Pad padNum="30" name="30">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-10.16"/>
					</Pad>
					<Pad padNum="31" name="31">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-7.62"/>
					</Pad>
					<Pad padNum="32" name="32">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-5.08"/>
					</Pad>
					<Pad padNum="33" name="33">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-2.54"/>
					</Pad>
					<Pad padNum="34" name="34">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="35" name="35">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="36" name="36">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="37" name="37">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-12.7"/>
					</Pad>
					<Pad padNum="38" name="38">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-15.24"/>
					</Pad>
					<Pad padNum="39" name="39">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-17.78"/>
					</Pad>
					<Pad padNum="40" name="40">
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
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.2418" y="-24.638"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.762" y="-52.4256"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-1.016" y="-51.181"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DB9RA/F_1">
				<Pads>
					<Pad padNum="1" name="1" angle="270">
						<PadstackRef name="P:EX150Y150D32A"/>
						<Org x="-6.985" y="1.27"/>
					</Pad>
					<Pad padNum="2" name="2" angle="270">
						<PadstackRef name="P:EX150Y150D32A"/>
						<Org x="18.0594" y="1.27"/>
					</Pad>
					<Pad padNum="3" name="3" angle="270">
						<PadstackRef name="P:SX50Y50D32A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="4" name="4" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="2.7686" y="0"/>
					</Pad>
					<Pad padNum="5" name="5" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="5.5372" y="0"/>
					</Pad>
					<Pad padNum="6" name="6" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="8.3058" y="0"/>
					</Pad>
					<Pad padNum="7" name="7" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="11.0744" y="0"/>
					</Pad>
					<Pad padNum="8" name="8" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="1.397" y="2.54"/>
					</Pad>
					<Pad padNum="9" name="9" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="4.1656" y="2.54"/>
					</Pad>
					<Pad padNum="10" name="10" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="6.9342" y="2.54"/>
					</Pad>
					<Pad padNum="11" name="11" angle="270">
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
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.191" y="3.937"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-10.2616" y="-4.8006"/>
					</Label>
					<Label name="RefDes" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-12.065" y="5.588"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DB9RA/F_2">
				<Pads>
					<Pad padNum="1" name="1" angle="270">
						<PadstackRef name="P:EX150Y150D32A"/>
						<Org x="18.0594" y="1.27"/>
					</Pad>
					<Pad padNum="2" name="2" angle="270">
						<PadstackRef name="P:EX150Y150D32A"/>
						<Org x="-6.985" y="1.27"/>
					</Pad>
					<Pad padNum="3" name="3" angle="270">
						<PadstackRef name="P:SX50Y50D32A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="4" name="4" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="2.7686" y="0"/>
					</Pad>
					<Pad padNum="5" name="5" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="5.5372" y="0"/>
					</Pad>
					<Pad padNum="6" name="6" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="8.3058" y="0"/>
					</Pad>
					<Pad padNum="7" name="7" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="11.0744" y="0"/>
					</Pad>
					<Pad padNum="8" name="8" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="1.397" y="2.54"/>
					</Pad>
					<Pad padNum="9" name="9" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="4.1656" y="2.54"/>
					</Pad>
					<Pad padNum="10" name="10" angle="270">
						<PadstackRef name="P:EX50Y50D32A"/>
						<Org x="6.9342" y="2.54"/>
					</Pad>
					<Pad padNum="11" name="11" angle="270">
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
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.191" y="3.937"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-10.2616" y="-4.8006"/>
					</Label>
					<Label name="RefDes" align="LB" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-4.064" y="-2.286"/>
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
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="0.3302" y="-0.508"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.0066" y="-4.8006"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="7.874" y="-0.508"/>
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
					<Label name="Value" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="4.7498" y="0.508"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.0066" y="-4.8006"/>
					</Label>
					<Label name="RefDes" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-2.667" y="0.508"/>
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
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="3.2258" y="-0.508"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.9144" y="-3.9116"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="3.81" y="-0.762"/>
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
					<Label name="Value" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="6.4262" y="0.508"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.9144" y="-3.9116"/>
					</Label>
					<Label name="RefDes" align="LB" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-1.27" y="-1.143"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DIP28_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="P:SX50Y50D25A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-22.86"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-25.4"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-27.94"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-30.48"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-33.02"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-33.02"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-30.48"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-27.94"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-25.4"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-22.86"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-20.32"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-17.78"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-15.24"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-12.7"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-10.16"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-7.62"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-5.08"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="-2.54"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-12.7"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-15.24"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="P:EX50Y50D25A"/>
						<Org x="0" y="-17.78"/>
					</Pad>
					<Pad padNum="28" name="28">
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
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="5.7658" y="-17.018"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.762" y="-37.1856"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="0.381" y="2.032"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="IDC40P_1">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="P:EX100Y100D28A"/>
						<Org x="-5.08" y="1.778"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90">
						<PadstackRef name="P:EX100Y100D28A"/>
						<Org x="53.34" y="1.778"/>
					</Pad>
					<Pad padNum="3" name="3" angle="90">
						<PadstackRef name="P:SX50Y50D28A"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="4" name="4" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="10.16" y="2.54"/>
					</Pad>
					<Pad padNum="5" name="5" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="12.7" y="0"/>
					</Pad>
					<Pad padNum="6" name="6" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="12.7" y="2.54"/>
					</Pad>
					<Pad padNum="7" name="7" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="8" name="8" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="15.24" y="2.54"/>
					</Pad>
					<Pad padNum="9" name="9" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="17.78" y="0"/>
					</Pad>
					<Pad padNum="10" name="10" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="17.78" y="2.54"/>
					</Pad>
					<Pad padNum="11" name="11" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="20.32" y="0"/>
					</Pad>
					<Pad padNum="12" name="12" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="20.32" y="2.54"/>
					</Pad>
					<Pad padNum="13" name="13" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="22.86" y="0"/>
					</Pad>
					<Pad padNum="14" name="14" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="0" y="2.54"/>
					</Pad>
					<Pad padNum="15" name="15" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="22.86" y="2.54"/>
					</Pad>
					<Pad padNum="16" name="16" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="25.4" y="0"/>
					</Pad>
					<Pad padNum="17" name="17" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="25.4" y="2.54"/>
					</Pad>
					<Pad padNum="18" name="18" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="27.94" y="0"/>
					</Pad>
					<Pad padNum="19" name="19" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="27.94" y="2.54"/>
					</Pad>
					<Pad padNum="20" name="20" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="30.48" y="0"/>
					</Pad>
					<Pad padNum="21" name="21" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="30.48" y="2.54"/>
					</Pad>
					<Pad padNum="22" name="22" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="33.02" y="0"/>
					</Pad>
					<Pad padNum="23" name="23" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="33.02" y="2.54"/>
					</Pad>
					<Pad padNum="24" name="24" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="35.56" y="0"/>
					</Pad>
					<Pad padNum="25" name="25" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="2.54" y="0"/>
					</Pad>
					<Pad padNum="26" name="26" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="35.56" y="2.54"/>
					</Pad>
					<Pad padNum="27" name="27" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="38.1" y="0"/>
					</Pad>
					<Pad padNum="28" name="28" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="38.1" y="2.54"/>
					</Pad>
					<Pad padNum="29" name="29" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="40.64" y="0"/>
					</Pad>
					<Pad padNum="30" name="30" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="40.64" y="2.54"/>
					</Pad>
					<Pad padNum="31" name="31" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="43.18" y="0"/>
					</Pad>
					<Pad padNum="32" name="32" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="43.18" y="2.54"/>
					</Pad>
					<Pad padNum="33" name="33" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="45.72" y="0"/>
					</Pad>
					<Pad padNum="34" name="34" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="45.72" y="2.54"/>
					</Pad>
					<Pad padNum="35" name="35" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="48.26" y="0"/>
					</Pad>
					<Pad padNum="36" name="36" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="2.54" y="2.54"/>
					</Pad>
					<Pad padNum="37" name="37" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="48.26" y="2.54"/>
					</Pad>
					<Pad padNum="38" name="38" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="5.08" y="0"/>
					</Pad>
					<Pad padNum="39" name="39" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="5.08" y="2.54"/>
					</Pad>
					<Pad padNum="40" name="40" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="41" name="41" angle="90">
						<PadstackRef name="P:EX50Y50D28A"/>
						<Org x="7.62" y="2.54"/>
					</Pad>
					<Pad padNum="42" name="42" angle="90">
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
					<Label name="Value" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="26.924" y="8.128"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-11.5316" y="-4.1656"/>
					</Label>
					<Label name="RefDes" align="LB" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H50W6"/>
						<Org x="-7.239" y="-4.318"/>
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
						<Start x="112.268" y="228.981"/>
						<SegmentLine>
							<End x="112.268" y="137.668"/>
						</SegmentLine>
						<SegmentLine>
							<End x="229.108" y="137.668"/>
						</SegmentLine>
						<SegmentLine>
							<End x="229.108" y="228.981"/>
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
			<CompInstance name="R6" uniqueId="VZUTMSSX" side="Top" angle="270">
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_2"/>
				<Org x="216.154" y="150.876"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-1.27" y="-1.143"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AXIAL0.4"/>
					<Attribute name="Value" value="4k7"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XTAL1" uniqueId="UDRNAVCL" side="Top" angle="270" fixed="on">
				<ComponentRef name="XTAL1_1"/>
				<FootprintRef name="XTAL1_1"/>
				<Org x="121.666" y="147.828"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="7.62" y="-2.032"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="XTAL1"/>
					<Attribute name="Value" value="4.00 MHz"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C1" uniqueId="IDRCJOLF" side="Top">
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
			<CompInstance name="C9" uniqueId="GGULPGJH" side="Top" angle="180">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_2"/>
				<Org x="133.858" y="178.0113"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-2.667" y="0.762"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C10" uniqueId="QVNGOFRV" side="Top" angle="180">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_2"/>
				<Org x="133.858" y="183.0913"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-2.667" y="0.508"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C7" uniqueId="THIHVFCA" side="Top" angle="90">
				<ComponentRef name="RB.2_.4_1"/>
				<FootprintRef name="RB.2/.4_1"/>
				<Org x="140.97" y="195.072"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="2.54" y="5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RB.2_.4"/>
					<Attribute name="Value" value="100uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C5" uniqueId="ZJDJKCNY" side="Top">
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
			<CompInstance name="C6" uniqueId="IPRILMTH" side="Top">
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
			<CompInstance name="C4" uniqueId="QOXFEEBO" side="Top">
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
			<CompInstance name="SW2" uniqueId="CKYRPIET" side="Top" angle="180" fixed="on">
				<ComponentRef name="RAD0.2_1"/>
				<FootprintRef name="RAD0.2_2"/>
				<Org x="226.314" y="140.716"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="4.445" y="-2.413"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RAD0.2"/>
					<Attribute name="Value" value="PUSH"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J2" uniqueId="YZJGLUFM" side="Top" angle="90" fixed="on">
				<ComponentRef name="DB9RA_F_1"/>
				<FootprintRef name="DB9RA/F_1"/>
				<Org x="122.174" y="174.752"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-12.065" y="5.588"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DB9RA_F"/>
					<Attribute name="Value" value="DB9"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XTAL2" uniqueId="TPQRICDH" side="Top" angle="90" fixed="on">
				<ComponentRef name="XTAL1_1"/>
				<FootprintRef name="XTAL1_2"/>
				<Org x="121.666" y="154.432"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-2.54" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="XTAL1"/>
					<Attribute name="Value" value="4.915 MHz"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U8" uniqueId="IBIPSPEM" side="Top">
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
			<CompInstance name="SW1" uniqueId="AIMTCVJV" side="Top">
				<ComponentRef name="DIP16_1"/>
				<FootprintRef name="DIP16_1"/>
				<Org x="146.8502" y="227.0445"/>
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
			<CompInstance name="U12" uniqueId="NZEOHXIM" side="Top">
				<ComponentRef name="DIP16_1"/>
				<FootprintRef name="DIP16_1"/>
				<Org x="136.0742" y="227.1523"/>
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
			<CompInstance name="U6" uniqueId="TTFQZLDC" side="Top">
				<ComponentRef name="DIP40_1"/>
				<FootprintRef name="DIP40_1"/>
				<Org x="158.4403" y="226.9784"/>
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
			<CompInstance name="U7" uniqueId="XZSIEOIJ" side="Top">
				<ComponentRef name="DIP40_1"/>
				<FootprintRef name="DIP40_1"/>
				<Org x="198.2893" y="226.9526"/>
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
			<CompInstance name="C8" uniqueId="KXASIJYQ" side="Top" angle="90">
				<ComponentRef name="RB.2_.4_1"/>
				<FootprintRef name="RB.2/.4_2"/>
				<Org x="223.266" y="152.908"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="2.54" y="5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RB.2_.4"/>
					<Attribute name="Value" value="10uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J1" uniqueId="RTMSXGTN" side="Top" angle="90" fixed="on">
				<ComponentRef name="FLY4_1"/>
				<FootprintRef name="FLY4_1"/>
				<Org x="114.554" y="141.732"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="14.478" y="-0.762"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="FLY4"/>
					<Attribute name="Value" value="4PIN"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U1" uniqueId="FLGQJCPY" side="Top">
				<ComponentRef name="DIP28_1"/>
				<FootprintRef name="DIP28_1"/>
				<Org x="139.446" y="174.9096"/>
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
			<CompInstance name="U9" uniqueId="FIFXVFZR" side="Top">
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
			<CompInstance name="U2" uniqueId="EOVEDOMH" side="Top">
				<ComponentRef name="DIP28_1"/>
				<FootprintRef name="DIP28_1"/>
				<Org x="158.6421" y="173.7228"/>
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
			<CompInstance name="U4" uniqueId="DDSTEBVK" side="Top">
				<ComponentRef name="DIP28_1"/>
				<FootprintRef name="DIP28_1"/>
				<Org x="197.4398" y="172.5391"/>
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
			<CompInstance name="R5" uniqueId="TXXDPEJS" side="Top">
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
			<CompInstance name="R7" uniqueId="JZLQFWHI" side="Top">
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
			<CompInstance name="R1" uniqueId="YIGBJMGR" side="Top">
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_1"/>
				<Org x="125.73" y="172.4233"/>
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
			<CompInstance name="R2" uniqueId="AFLKPLOP" side="Top">
				<ComponentRef name="AXIAL0.4_1"/>
				<FootprintRef name="AXIAL0.4_1"/>
				<Org x="125.73" y="174.9633"/>
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
			<CompInstance name="R3" uniqueId="PVGAHJGW" side="Top">
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
			<CompInstance name="R4" uniqueId="XGDFBAMV" side="Top">
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
			<CompInstance name="C3" uniqueId="LKFDOYAZ" side="Top">
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
			<CompInstance name="J3" uniqueId="IPWIJVNE" side="Top" angle="90" fixed="on">
				<ComponentRef name="DB9RA_F_1"/>
				<FootprintRef name="DB9RA/F_2"/>
				<Org x="122.174" y="208.28"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-4.064" y="-2.286"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DB9RA_F"/>
					<Attribute name="Value" value="DB9"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U11" uniqueId="SEJZXVDI" side="Top">
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
			<CompInstance name="U10" uniqueId="KGJIVYYV" side="Top">
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
			<CompInstance name="J4" uniqueId="XUSJJLFY" side="Top" angle="270" fixed="on">
				<ComponentRef name="IDC40P_1"/>
				<FootprintRef name="IDC40P_1"/>
				<Org x="218.186" y="217.932"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H50W6"/>
							<Org x="-7.239" y="-4.318"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IDC40P"/>
					<Attribute name="Value" value="40 PIN"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U5" uniqueId="QHGCPIDI" side="Top">
				<ComponentRef name="DIP40_1"/>
				<FootprintRef name="DIP40_1"/>
				<Org x="178.8313" y="226.7628"/>
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
			<CompInstance name="U3" uniqueId="MIMMBMTN" side="Top">
				<ComponentRef name="DIP28_1"/>
				<FootprintRef name="DIP28_1"/>
				<Org x="178.054" y="172.6436"/>
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
			<PinRef compName="U7" pinName="30"/>
			<PinRef compName="U1" pinName="20"/>
			<PinRef compName="U2" pinName="20"/>
			<PinRef compName="U4" pinName="20"/>
			<PinRef compName="U5" pinName="15"/>
			<PinRef compName="U3" pinName="20"/>
		</Net>
		<Net name="VCC">
			<PinRef compName="R6" pinName="1"/>
			<PinRef compName="C1" pinName="2"/>
			<PinRef compName="C7" pinName="1"/>
			<PinRef compName="C5" pinName="2"/>
			<PinRef compName="C6" pinName="2"/>
			<PinRef compName="C4" pinName="2"/>
			<PinRef compName="U8" pinName="8"/>
			<PinRef compName="U8" pinName="13"/>
			<PinRef compName="U12" pinName="8"/>
			<PinRef compName="U6" pinName="37"/>
			<PinRef compName="U6" pinName="40"/>
			<PinRef compName="U7" pinName="19"/>
			<PinRef compName="J1" pinName="2"/>
			<PinRef compName="U1" pinName="1"/>
			<PinRef compName="U1" pinName="21"/>
			<PinRef compName="U9" pinName="6"/>
			<PinRef compName="U2" pinName="1"/>
			<PinRef compName="U2" pinName="21"/>
			<PinRef compName="U4" pinName="19"/>
			<PinRef compName="U4" pinName="21"/>
			<PinRef compName="R5" pinName="1"/>
			<PinRef compName="R7" pinName="1"/>
			<PinRef compName="C3" pinName="2"/>
			<PinRef compName="U10" pinName="6"/>
			<PinRef compName="U5" pinName="3"/>
			<PinRef compName="U5" pinName="9"/>
			<PinRef compName="U5" pinName="17"/>
			<PinRef compName="U5" pinName="18"/>
			<PinRef compName="U3" pinName="19"/>
			<PinRef compName="U3" pinName="21"/>
		</Net>
		<Net name="NETJ3_2">
			<PinRef compName="J3" pinName="4"/>
			<PinRef compName="U10" pinName="9"/>
		</Net>
		<Net name="NETJ2_2">
			<PinRef compName="J2" pinName="4"/>
			<PinRef compName="U10" pinName="1"/>
		</Net>
		<Net name="NETU6_26">
			<PinRef compName="U6" pinName="19"/>
			<PinRef compName="U11" pinName="9"/>
			<PinRef compName="U11" pinName="10"/>
		</Net>
		<Net name="RESET">
			<PinRef compName="R6" pinName="2"/>
			<PinRef compName="SW2" pinName="2"/>
			<PinRef compName="U6" pinName="14"/>
			<PinRef compName="C8" pinName="1"/>
			<PinRef compName="U5" pinName="19"/>
		</Net>
		<Net name="RD">
			<PinRef compName="U6" pinName="26"/>
			<PinRef compName="U7" pinName="36"/>
			<PinRef compName="U5" pinName="14"/>
		</Net>
		<Net name="RAWBAUD">
			<PinRef compName="U12" pinName="2"/>
			<PinRef compName="U9" pinName="13"/>
		</Net>
		<Net name="NETR4_2">
			<PinRef compName="XTAL2" pinName="2"/>
			<PinRef compName="U9" pinName="2"/>
			<PinRef compName="U9" pinName="14"/>
			<PinRef compName="R4" pinName="2"/>
		</Net>
		<Net name="NETR3_1">
			<PinRef compName="XTAL2" pinName="1"/>
			<PinRef compName="U9" pinName="5"/>
			<PinRef compName="R3" pinName="1"/>
		</Net>
		<Net name="NETR2_2">
			<PinRef compName="XTAL1" pinName="2"/>
			<PinRef compName="U9" pinName="9"/>
			<PinRef compName="U9" pinName="10"/>
			<PinRef compName="R2" pinName="2"/>
		</Net>
		<Net name="NETR1_1">
			<PinRef compName="XTAL1" pinName="1"/>
			<PinRef compName="U9" pinName="1"/>
			<PinRef compName="R1" pinName="1"/>
		</Net>
		<Net name="PPISEL">
			<PinRef compName="U8" pinName="2"/>
			<PinRef compName="U7" pinName="37"/>
		</Net>
		<Net name="PC3">
			<PinRef compName="U7" pinName="9"/>
			<PinRef compName="J4" pinName="19"/>
		</Net>
		<Net name="PC2">
			<PinRef compName="U7" pinName="8"/>
			<PinRef compName="J4" pinName="17"/>
		</Net>
		<Net name="PC1">
			<PinRef compName="U7" pinName="7"/>
			<PinRef compName="J4" pinName="15"/>
		</Net>
		<Net name="PC0">
			<PinRef compName="U7" pinName="6"/>
			<PinRef compName="J4" pinName="12"/>
		</Net>
		<Net name="PB7">
			<PinRef compName="U7" pinName="18"/>
			<PinRef compName="J4" pinName="37"/>
		</Net>
		<Net name="PB6">
			<PinRef compName="U7" pinName="17"/>
			<PinRef compName="J4" pinName="34"/>
		</Net>
		<Net name="PB5">
			<PinRef compName="U7" pinName="16"/>
			<PinRef compName="J4" pinName="32"/>
		</Net>
		<Net name="PB4">
			<PinRef compName="U7" pinName="15"/>
			<PinRef compName="J4" pinName="30"/>
		</Net>
		<Net name="PB3">
			<PinRef compName="U7" pinName="14"/>
			<PinRef compName="J4" pinName="28"/>
		</Net>
		<Net name="PB2">
			<PinRef compName="U7" pinName="13"/>
			<PinRef compName="J4" pinName="26"/>
		</Net>
		<Net name="PB1">
			<PinRef compName="U7" pinName="11"/>
			<PinRef compName="J4" pinName="23"/>
		</Net>
		<Net name="PB0">
			<PinRef compName="U7" pinName="10"/>
			<PinRef compName="J4" pinName="21"/>
		</Net>
		<Net name="PA7">
			<PinRef compName="U7" pinName="31"/>
			<PinRef compName="J4" pinName="14"/>
		</Net>
		<Net name="PA6">
			<PinRef compName="U7" pinName="32"/>
			<PinRef compName="J4" pinName="36"/>
		</Net>
		<Net name="PA5">
			<PinRef compName="U7" pinName="33"/>
			<PinRef compName="J4" pinName="39"/>
		</Net>
		<Net name="PA4">
			<PinRef compName="U7" pinName="35"/>
			<PinRef compName="J4" pinName="41"/>
		</Net>
		<Net name="PA3">
			<PinRef compName="U7" pinName="1"/>
			<PinRef compName="J4" pinName="4"/>
		</Net>
		<Net name="PA2">
			<PinRef compName="U7" pinName="12"/>
			<PinRef compName="J4" pinName="6"/>
		</Net>
		<Net name="PA1">
			<PinRef compName="U7" pinName="23"/>
			<PinRef compName="J4" pinName="8"/>
		</Net>
		<Net name="PA0">
			<PinRef compName="U7" pinName="34"/>
			<PinRef compName="J4" pinName="10"/>
		</Net>
		<Net name="NETU5_19">
			<PinRef compName="U8" pinName="11"/>
			<PinRef compName="U8" pinName="12"/>
			<PinRef compName="U5" pinName="11"/>
		</Net>
		<Net name="MEM3SEL">
			<PinRef compName="U8" pinName="4"/>
			<PinRef compName="U4" pinName="13"/>
		</Net>
		<Net name="MEM2SEL">
			<PinRef compName="U8" pinName="5"/>
			<PinRef compName="U3" pinName="13"/>
		</Net>
		<Net name="MEM1SEL">
			<PinRef compName="U8" pinName="6"/>
			<PinRef compName="U2" pinName="13"/>
		</Net>
		<Net name="MEM0SEL">
			<PinRef compName="U8" pinName="7"/>
			<PinRef compName="U1" pinName="13"/>
		</Net>
		<Net name="NETJ3_3">
			<PinRef compName="J3" pinName="5"/>
			<PinRef compName="U11" pinName="11"/>
		</Net>
		<Net name="NETJ2_3">
			<PinRef compName="J2" pinName="5"/>
			<PinRef compName="U11" pinName="8"/>
		</Net>
		<Net name="INT">
			<PinRef compName="U6" pinName="36"/>
			<PinRef compName="R7" pinName="2"/>
			<PinRef compName="U5" pinName="8"/>
		</Net>
		<Net name="GND">
			<PinRef compName="C1" pinName="1"/>
			<PinRef compName="C7" pinName="2"/>
			<PinRef compName="C5" pinName="1"/>
			<PinRef compName="C6" pinName="1"/>
			<PinRef compName="C4" pinName="1"/>
			<PinRef compName="SW2" pinName="1"/>
			<PinRef compName="J2" pinName="7"/>
			<PinRef compName="U8" pinName="15"/>
			<PinRef compName="U12" pinName="3"/>
			<PinRef compName="U12" pinName="15"/>
			<PinRef compName="U6" pinName="10"/>
			<PinRef compName="U6" pinName="11"/>
			<PinRef compName="U6" pinName="15"/>
			<PinRef compName="U6" pinName="16"/>
			<PinRef compName="U6" pinName="25"/>
			<PinRef compName="U7" pinName="29"/>
			<PinRef compName="U7" pinName="38"/>
			<PinRef compName="C8" pinName="2"/>
			<PinRef compName="J1" pinName="1"/>
			<PinRef compName="U1" pinName="6"/>
			<PinRef compName="U1" pinName="15"/>
			<PinRef compName="U9" pinName="12"/>
			<PinRef compName="U2" pinName="6"/>
			<PinRef compName="U2" pinName="15"/>
			<PinRef compName="U4" pinName="6"/>
			<PinRef compName="U4" pinName="15"/>
			<PinRef compName="C3" pinName="1"/>
			<PinRef compName="J3" pinName="7"/>
			<PinRef compName="U11" pinName="12"/>
			<PinRef compName="U10" pinName="12"/>
			<PinRef compName="J4" pinName="3"/>
			<PinRef compName="J4" pinName="5"/>
			<PinRef compName="J4" pinName="7"/>
			<PinRef compName="J4" pinName="9"/>
			<PinRef compName="J4" pinName="11"/>
			<PinRef compName="J4" pinName="13"/>
			<PinRef compName="J4" pinName="16"/>
			<PinRef compName="J4" pinName="18"/>
			<PinRef compName="J4" pinName="20"/>
			<PinRef compName="J4" pinName="22"/>
			<PinRef compName="J4" pinName="24"/>
			<PinRef compName="J4" pinName="25"/>
			<PinRef compName="J4" pinName="27"/>
			<PinRef compName="J4" pinName="29"/>
			<PinRef compName="J4" pinName="31"/>
			<PinRef compName="J4" pinName="33"/>
			<PinRef compName="J4" pinName="35"/>
			<PinRef compName="J4" pinName="38"/>
			<PinRef compName="J4" pinName="40"/>
			<PinRef compName="J4" pinName="42"/>
			<PinRef compName="U5" pinName="22"/>
			<PinRef compName="U3" pinName="6"/>
			<PinRef compName="U3" pinName="15"/>
		</Net>
		<Net name="D7">
			<PinRef compName="U6" pinName="34"/>
			<PinRef compName="U7" pinName="20"/>
			<PinRef compName="U1" pinName="11"/>
			<PinRef compName="U2" pinName="11"/>
			<PinRef compName="U4" pinName="11"/>
			<PinRef compName="U5" pinName="5"/>
			<PinRef compName="U3" pinName="11"/>
		</Net>
		<Net name="D6">
			<PinRef compName="U6" pinName="31"/>
			<PinRef compName="U7" pinName="21"/>
			<PinRef compName="U1" pinName="10"/>
			<PinRef compName="U2" pinName="10"/>
			<PinRef compName="U4" pinName="10"/>
			<PinRef compName="U5" pinName="2"/>
			<PinRef compName="U3" pinName="10"/>
		</Net>
		<Net name="D5">
			<PinRef compName="U6" pinName="23"/>
			<PinRef compName="U7" pinName="22"/>
			<PinRef compName="U1" pinName="9"/>
			<PinRef compName="U2" pinName="9"/>
			<PinRef compName="U4" pinName="9"/>
			<PinRef compName="U5" pinName="40"/>
			<PinRef compName="U3" pinName="9"/>
		</Net>
		<Net name="D4">
			<PinRef compName="U6" pinName="32"/>
			<PinRef compName="U7" pinName="24"/>
			<PinRef compName="U1" pinName="8"/>
			<PinRef compName="U2" pinName="8"/>
			<PinRef compName="U4" pinName="8"/>
			<PinRef compName="U5" pinName="38"/>
			<PinRef compName="U3" pinName="8"/>
		</Net>
		<Net name="D3">
			<PinRef compName="U6" pinName="12"/>
			<PinRef compName="U7" pinName="25"/>
			<PinRef compName="U1" pinName="7"/>
			<PinRef compName="U2" pinName="7"/>
			<PinRef compName="U4" pinName="7"/>
			<PinRef compName="U5" pinName="39"/>
			<PinRef compName="U3" pinName="7"/>
		</Net>
		<Net name="D2">
			<PinRef compName="U6" pinName="33"/>
			<PinRef compName="U7" pinName="26"/>
			<PinRef compName="U1" pinName="5"/>
			<PinRef compName="U2" pinName="5"/>
			<PinRef compName="U4" pinName="5"/>
			<PinRef compName="U5" pinName="4"/>
			<PinRef compName="U3" pinName="5"/>
		</Net>
		<Net name="D1">
			<PinRef compName="U6" pinName="1"/>
			<PinRef compName="U7" pinName="27"/>
			<PinRef compName="U1" pinName="4"/>
			<PinRef compName="U2" pinName="4"/>
			<PinRef compName="U4" pinName="4"/>
			<PinRef compName="U5" pinName="7"/>
			<PinRef compName="U3" pinName="4"/>
		</Net>
		<Net name="D0">
			<PinRef compName="U6" pinName="35"/>
			<PinRef compName="U7" pinName="28"/>
			<PinRef compName="U1" pinName="3"/>
			<PinRef compName="U2" pinName="3"/>
			<PinRef compName="U4" pinName="3"/>
			<PinRef compName="U5" pinName="6"/>
			<PinRef compName="U3" pinName="3"/>
		</Net>
		<Net name="CPUCLK">
			<PinRef compName="U6" pinName="13"/>
			<PinRef compName="U9" pinName="11"/>
			<PinRef compName="R5" pinName="2"/>
			<PinRef compName="U5" pinName="37"/>
		</Net>
		<Net name="NETC10_2">
			<PinRef compName="C10" pinName="2"/>
			<PinRef compName="U9" pinName="8"/>
			<PinRef compName="R2" pinName="1"/>
		</Net>
		<Net name="NETC10_1">
			<PinRef compName="C10" pinName="1"/>
			<PinRef compName="U9" pinName="7"/>
			<PinRef compName="R1" pinName="2"/>
		</Net>
		<Net name="NETC9_2">
			<PinRef compName="C9" pinName="2"/>
			<PinRef compName="U9" pinName="3"/>
			<PinRef compName="R4" pinName="1"/>
		</Net>
		<Net name="NETC9_1">
			<PinRef compName="C9" pinName="1"/>
			<PinRef compName="U9" pinName="4"/>
			<PinRef compName="R3" pinName="2"/>
		</Net>
		<Net name="NETSW1_9">
			<PinRef compName="SW1" pinName="2"/>
			<PinRef compName="SW1" pinName="3"/>
			<PinRef compName="SW1" pinName="4"/>
			<PinRef compName="SW1" pinName="5"/>
			<PinRef compName="SW1" pinName="6"/>
			<PinRef compName="SW1" pinName="7"/>
			<PinRef compName="SW1" pinName="8"/>
			<PinRef compName="SW1" pinName="16"/>
			<PinRef compName="U6" pinName="5"/>
			<PinRef compName="U6" pinName="6"/>
			<PinRef compName="U6" pinName="20"/>
		</Net>
		<Net name="A15">
			<PinRef compName="U8" pinName="10"/>
			<PinRef compName="U5" pinName="36"/>
		</Net>
		<Net name="A14">
			<PinRef compName="U8" pinName="9"/>
			<PinRef compName="U5" pinName="34"/>
		</Net>
		<Net name="A13">
			<PinRef compName="U8" pinName="1"/>
			<PinRef compName="U5" pinName="23"/>
		</Net>
		<Net name="A12">
			<PinRef compName="U1" pinName="12"/>
			<PinRef compName="U2" pinName="12"/>
			<PinRef compName="U4" pinName="12"/>
			<PinRef compName="U5" pinName="12"/>
			<PinRef compName="U3" pinName="12"/>
		</Net>
		<Net name="A11">
			<PinRef compName="U1" pinName="16"/>
			<PinRef compName="U2" pinName="16"/>
			<PinRef compName="U4" pinName="16"/>
			<PinRef compName="U5" pinName="1"/>
			<PinRef compName="U3" pinName="16"/>
		</Net>
		<Net name="A10">
			<PinRef compName="U1" pinName="14"/>
			<PinRef compName="U2" pinName="14"/>
			<PinRef compName="U4" pinName="14"/>
			<PinRef compName="U5" pinName="35"/>
			<PinRef compName="U3" pinName="14"/>
		</Net>
		<Net name="A9">
			<PinRef compName="U1" pinName="17"/>
			<PinRef compName="U2" pinName="17"/>
			<PinRef compName="U4" pinName="17"/>
			<PinRef compName="U5" pinName="33"/>
			<PinRef compName="U3" pinName="17"/>
		</Net>
		<Net name="A8">
			<PinRef compName="U1" pinName="18"/>
			<PinRef compName="U2" pinName="18"/>
			<PinRef compName="U4" pinName="18"/>
			<PinRef compName="U5" pinName="32"/>
			<PinRef compName="U3" pinName="18"/>
		</Net>
		<Net name="A7">
			<PinRef compName="U1" pinName="22"/>
			<PinRef compName="U2" pinName="22"/>
			<PinRef compName="U4" pinName="22"/>
			<PinRef compName="U5" pinName="31"/>
			<PinRef compName="U3" pinName="22"/>
		</Net>
		<Net name="A6">
			<PinRef compName="U1" pinName="23"/>
			<PinRef compName="U2" pinName="23"/>
			<PinRef compName="U4" pinName="23"/>
			<PinRef compName="U5" pinName="30"/>
			<PinRef compName="U3" pinName="23"/>
		</Net>
		<Net name="A5">
			<PinRef compName="U1" pinName="24"/>
			<PinRef compName="U2" pinName="24"/>
			<PinRef compName="U4" pinName="24"/>
			<PinRef compName="U5" pinName="29"/>
			<PinRef compName="U3" pinName="24"/>
		</Net>
		<Net name="A4">
			<PinRef compName="U1" pinName="25"/>
			<PinRef compName="U2" pinName="25"/>
			<PinRef compName="U4" pinName="25"/>
			<PinRef compName="U5" pinName="28"/>
			<PinRef compName="U3" pinName="25"/>
		</Net>
		<Net name="A3">
			<PinRef compName="U1" pinName="26"/>
			<PinRef compName="U2" pinName="26"/>
			<PinRef compName="U4" pinName="26"/>
			<PinRef compName="U5" pinName="27"/>
			<PinRef compName="U3" pinName="26"/>
		</Net>
		<Net name="A2">
			<PinRef compName="U1" pinName="27"/>
			<PinRef compName="U2" pinName="27"/>
			<PinRef compName="U4" pinName="27"/>
			<PinRef compName="U5" pinName="26"/>
			<PinRef compName="U3" pinName="27"/>
		</Net>
		<Net name="A1">
			<PinRef compName="U6" pinName="27"/>
			<PinRef compName="U7" pinName="39"/>
			<PinRef compName="U1" pinName="28"/>
			<PinRef compName="U2" pinName="28"/>
			<PinRef compName="U4" pinName="28"/>
			<PinRef compName="U5" pinName="25"/>
			<PinRef compName="U3" pinName="28"/>
		</Net>
		<Net name="A0">
			<PinRef compName="U6" pinName="28"/>
			<PinRef compName="U7" pinName="40"/>
			<PinRef compName="U1" pinName="2"/>
			<PinRef compName="U2" pinName="2"/>
			<PinRef compName="U4" pinName="2"/>
			<PinRef compName="U5" pinName="24"/>
			<PinRef compName="U3" pinName="2"/>
		</Net>
		<Net name="19200">
			<PinRef compName="SW1" pinName="15"/>
			<PinRef compName="U12" pinName="12"/>
		</Net>
		<Net name="9600">
			<PinRef compName="SW1" pinName="14"/>
			<PinRef compName="U12" pinName="10"/>
		</Net>
		<Net name="4800">
			<PinRef compName="SW1" pinName="13"/>
			<PinRef compName="U12" pinName="9"/>
		</Net>
		<Net name="1200">
			<PinRef compName="SW1" pinName="12"/>
			<PinRef compName="U12" pinName="11"/>
		</Net>
		<Net name="600">
			<PinRef compName="SW1" pinName="11"/>
			<PinRef compName="U12" pinName="5"/>
		</Net>
		<Net name="300">
			<PinRef compName="SW1" pinName="10"/>
			<PinRef compName="U12" pinName="4"/>
		</Net>
		<Net name="150">
			<PinRef compName="SW1" pinName="9"/>
			<PinRef compName="U12" pinName="6"/>
		</Net>
		<Net name="75">
			<PinRef compName="SW1" pinName="1"/>
			<PinRef compName="U12" pinName="7"/>
		</Net>
		<Net name="-12">
			<PinRef compName="J1" pinName="4"/>
			<PinRef compName="U11" pinName="1"/>
		</Net>
		<Net name="+12">
			<PinRef compName="J1" pinName="3"/>
			<PinRef compName="U11" pinName="6"/>
		</Net>
		<Net name="NETU6_12">
			<PinRef compName="U6" pinName="4"/>
			<PinRef compName="U10" pinName="8"/>
		</Net>
		<Net name="NETU6_28">
			<PinRef compName="U6" pinName="21"/>
			<PinRef compName="U10" pinName="11"/>
		</Net>
		<Net name="NETU6_15">
			<PinRef compName="U6" pinName="7"/>
			<PinRef compName="U11" pinName="7"/>
		</Net>
		<Net name="SIOSEL">
			<PinRef compName="U8" pinName="3"/>
			<PinRef compName="U6" pinName="29"/>
		</Net>
		<Net name="M1">
			<PinRef compName="U6" pinName="39"/>
			<PinRef compName="U5" pinName="20"/>
		</Net>
		<Net name="IORQ">
			<PinRef compName="U6" pinName="30"/>
			<PinRef compName="U5" pinName="13"/>
		</Net>
	</NetList>

	<Groups version="1.1">
		<NetGroups>
			<NetGroup name="POWER">
				<NetRef name="VCC"/>
				<NetRef name="GND"/>
			</NetGroup>
		</NetGroups>
	</Groups>

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
		<SignalSearchSettings maxNetsInCluster="5">
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
			<WidthOfWires enabled="on" widthMin="0.25" widthNom="0.25">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.5" widthNom="0.5">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="POWER"/>
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
					<NetGroupRef name="POWER"/>
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
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="WR"/>
				<Subwire width="0.25">
					<Start x="154.686" y="172.3696"/>
					<TrackLine>
						<End x="158.1695" y="170.0418"/>
					</TrackLine>
					<TrackLine>
						<End x="159.1147" y="170.0418"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="171.1828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="WR"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="171.1828"/>
					<TrackLine>
						<End x="177.5814" y="168.9626"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5266" y="168.9626"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="170.1036"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="WR"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="169.9991"/>
					<TrackLine>
						<End x="201.4014" y="174.4746"/>
					</TrackLine>
					<TrackLine>
						<End x="201.3892" y="174.4797"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4774" y="176.9985"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5952" y="177.8807"/>
					</TrackLine>
					<TrackLine>
						<End x="194.0713" y="181.0428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="213.5293" y="191.3926"/>
					<TrackLine>
						<End x="212.7552" y="191.3806"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8124" y="190.1266"/>
					</TrackLine>
					<TrackLine>
						<End x="197.7662" y="190.1186"/>
					</TrackLine>
					<TrackLine>
						<End x="194.0713" y="188.6628"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="187.706" y="175.768"/>
					<TrackLine>
						<End x="193.294" y="172.6436"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="168.402" y="175.768"/>
					<TrackLine>
						<End x="173.8821" y="173.7228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="181.5744" y="189.047"/>
					<TrackLine>
						<End x="178.8313" y="186.1228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="181.5744" y="189.047"/>
					<TrackLine>
						<End x="194.0713" y="186.1228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="158.4403" y="206.6584"/>
					<TrackLine>
						<End x="153.162" y="204.216"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="178.8313" y="201.3628"/>
					<TrackLine>
						<End x="177.5653" y="199.3459"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5653" y="196.8059"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5662" y="195.7575"/>
					</TrackLine>
					<TrackLine>
						<End x="178.306" y="195.0177"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3544" y="195.0088"/>
					</TrackLine>
					<TrackLine>
						<End x="180.0973" y="194.2659"/>
					</TrackLine>
					<TrackLine>
						<End x="181.5744" y="189.047"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="154.686" y="200.152"/>
					<TrackLine>
						<End x="153.162" y="204.216"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="187.706" y="175.768"/>
					<TrackLine>
						<End x="183.1794" y="174.3496"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="173.7228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="158.6421" y="173.7228"/>
					<TrackLine>
						<End x="159.0271" y="174.1078"/>
					</TrackLine>
					<TrackLine>
						<End x="159.2771" y="174.1078"/>
					</TrackLine>
					<TrackLine>
						<End x="159.3807" y="174.1078"/>
					</TrackLine>
					<TrackLine>
						<End x="163.8754" y="174.3496"/>
					</TrackLine>
					<TrackLine>
						<End x="168.402" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="114.554" y="145.542"/>
					<TrackLine>
						<End x="122.2776" y="153.0377"/>
					</TrackLine>
					<TrackLine>
						<End x="123.0603" y="153.8204"/>
					</TrackLine>
					<TrackLine>
						<End x="123.0844" y="153.8786"/>
					</TrackLine>
					<TrackLine>
						<End x="124.3116" y="161.0814"/>
					</TrackLine>
					<TrackLine>
						<End x="124.3357" y="161.1396"/>
					</TrackLine>
					<TrackLine>
						<End x="125.73" y="163.068"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETJ3_2"/>
				<Subwire width="0.25">
					<Start x="126.746" y="193.548"/>
					<TrackLine>
						<End x="125.0519" y="195.2761"/>
					</TrackLine>
					<TrackLine>
						<End x="124.974" y="195.4642"/>
					</TrackLine>
					<TrackLine>
						<End x="123.315" y="209.1246"/>
					</TrackLine>
					<TrackLine>
						<End x="122.174" y="211.0486"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RESET"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="191.2028"/>
					<TrackLine>
						<End x="192.9303" y="189.1354"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9303" y="188.1902"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="187.5218"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5439" y="187.2638"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2123" y="186.5954"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1483" y="178.22"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8167" y="177.5516"/>
					</TrackLine>
					<TrackLine>
						<End x="202.4586" y="177.0614"/>
					</TrackLine>
					<TrackLine>
						<End x="202.4708" y="177.0563"/>
					</TrackLine>
					<TrackLine>
						<End x="206.4692" y="174.4797"/>
					</TrackLine>
					<TrackLine>
						<End x="206.4814" y="174.4746"/>
					</TrackLine>
					<TrackLine>
						<End x="213.1524" y="173.6801"/>
					</TrackLine>
					<TrackLine>
						<End x="217.7134" y="171.071"/>
					</TrackLine>
					<TrackLine>
						<End x="218.6586" y="170.813"/>
					</TrackLine>
					<TrackLine>
						<End x="219.327" y="170.1446"/>
					</TrackLine>
					<TrackLine>
						<End x="219.585" y="169.1994"/>
					</TrackLine>
					<TrackLine>
						<End x="221.6614" y="165.4062"/>
					</TrackLine>
					<TrackLine>
						<End x="221.74" y="165.2165"/>
					</TrackLine>
					<TrackLine>
						<End x="223.266" y="152.908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RD"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="178.5028"/>
					<TrackLine>
						<End x="179.3039" y="184.7238"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3587" y="184.9818"/>
					</TrackLine>
					<TrackLine>
						<End x="177.6903" y="185.6502"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8213" y="204.591"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6803" y="206.6584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETR4_2"/>
				<Subwire width="0.25">
					<Start x="135.89" y="145.288"/>
					<TrackLine>
						<End x="137.031" y="147.3554"/>
					</TrackLine>
					<TrackLine>
						<End x="137.031" y="148.3006"/>
					</TrackLine>
					<TrackLine>
						<End x="137.031" y="155.9206"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="160.528"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETR3_1"/>
				<Subwire width="0.25">
					<Start x="125.73" y="168.148"/>
					<TrackLine>
						<End x="124.4417" y="166.1488"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4366" y="166.1366"/>
					</TrackLine>
					<TrackLine>
						<End x="122.9594" y="158.9834"/>
					</TrackLine>
					<TrackLine>
						<End x="121.666" y="154.432"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETR2_2"/>
				<Subwire width="0.25">
					<Start x="135.89" y="174.9633"/>
					<TrackLine>
						<End x="137.1483" y="172.9445"/>
					</TrackLine>
					<TrackLine>
						<End x="137.1483" y="171.9021"/>
					</TrackLine>
					<TrackLine>
						<End x="134.6017" y="168.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="134.5966" y="168.6766"/>
					</TrackLine>
					<TrackLine>
						<End x="129.411" y="149.8954"/>
					</TrackLine>
					<TrackLine>
						<End x="128.27" y="147.828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETR1_1"/>
				<Subwire width="0.25">
					<Start x="128.27" y="155.448"/>
					<TrackLine>
						<End x="127.76" y="154.938"/>
					</TrackLine>
					<TrackLine>
						<End x="127.76" y="154.813"/>
					</TrackLine>
					<TrackLine>
						<End x="127.76" y="154.7612"/>
					</TrackLine>
					<TrackLine>
						<End x="121.666" y="147.828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PPISEL"/>
				<Subwire width="0.25">
					<Start x="198.2893" y="214.2526"/>
					<TrackLine>
						<End x="197.54" y="214.3896"/>
					</TrackLine>
					<TrackLine>
						<End x="194.4924" y="215.0795"/>
					</TrackLine>
					<TrackLine>
						<End x="193.6502" y="215.0795"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2524" y="213.0461"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4102" y="213.0461"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1014" y="215.2951"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2592" y="215.2951"/>
					</TrackLine>
					<TrackLine>
						<End x="172.6636" y="214.6995"/>
					</TrackLine>
					<TrackLine>
						<End x="159.9235" y="198.3673"/>
					</TrackLine>
					<TrackLine>
						<End x="159.1114" y="197.5552"/>
					</TrackLine>
					<TrackLine>
						<End x="159.0146" y="197.5151"/>
					</TrackLine>
					<TrackLine>
						<End x="158.0192" y="197.5151"/>
					</TrackLine>
					<TrackLine>
						<End x="155.3571" y="196.1288"/>
					</TrackLine>
					<TrackLine>
						<End x="155.2603" y="196.0887"/>
					</TrackLine>
					<TrackLine>
						<End x="154.2649" y="196.0887"/>
					</TrackLine>
					<TrackLine>
						<End x="153.6693" y="195.4931"/>
					</TrackLine>
					<TrackLine>
						<End x="152.914" y="193.1558"/>
					</TrackLine>
					<TrackLine>
						<End x="152.914" y="190.6158"/>
					</TrackLine>
					<TrackLine>
						<End x="152.914" y="189.3682"/>
					</TrackLine>
					<TrackLine>
						<End x="153.545" y="186.9794"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="184.912"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PC3"/>
				<Subwire width="0.25">
					<Start x="220.726" y="189.992"/>
					<TrackLine>
						<End x="218.6071" y="191.0087"/>
					</TrackLine>
					<TrackLine>
						<End x="217.7649" y="191.0087"/>
					</TrackLine>
					<TrackLine>
						<End x="214.1036" y="189.8693"/>
					</TrackLine>
					<TrackLine>
						<End x="213.1082" y="189.8693"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="186.3126"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PC2"/>
				<Subwire width="0.25">
					<Start x="220.726" y="192.532"/>
					<TrackLine>
						<End x="218.6071" y="191.5153"/>
					</TrackLine>
					<TrackLine>
						<End x="217.6117" y="191.5153"/>
					</TrackLine>
					<TrackLine>
						<End x="213.9504" y="190.3759"/>
					</TrackLine>
					<TrackLine>
						<End x="212.955" y="190.3759"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="188.8526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PC1"/>
				<Subwire width="0.25">
					<Start x="220.726" y="195.072"/>
					<TrackLine>
						<End x="218.6586" y="193.931"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0019" y="192.7916"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="191.3926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PC0"/>
				<Subwire width="0.25">
					<Start x="220.726" y="197.612"/>
					<TrackLine>
						<End x="218.6586" y="196.471"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0019" y="195.3316"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="193.9326"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PB7"/>
				<Subwire width="0.25">
					<Start x="220.726" y="169.672"/>
					<TrackLine>
						<End x="221.867" y="171.7394"/>
					</TrackLine>
					<TrackLine>
						<End x="222.498" y="174.1282"/>
					</TrackLine>
					<TrackLine>
						<End x="223.76" y="178.9572"/>
					</TrackLine>
					<TrackLine>
						<End x="223.76" y="180.7068"/>
					</TrackLine>
					<TrackLine>
						<End x="222.498" y="185.5358"/>
					</TrackLine>
					<TrackLine>
						<End x="221.867" y="187.9246"/>
					</TrackLine>
					<TrackLine>
						<End x="221.1986" y="188.593"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7603" y="188.9753"/>
					</TrackLine>
					<TrackLine>
						<End x="217.6117" y="188.9753"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="188.8526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PB6"/>
				<Subwire width="0.25">
					<Start x="220.726" y="172.212"/>
					<TrackLine>
						<End x="221.867" y="174.2794"/>
					</TrackLine>
					<TrackLine>
						<End x="222.498" y="176.6682"/>
					</TrackLine>
					<TrackLine>
						<End x="223.129" y="179.0827"/>
					</TrackLine>
					<TrackLine>
						<End x="223.129" y="180.5813"/>
					</TrackLine>
					<TrackLine>
						<End x="222.498" y="182.9958"/>
					</TrackLine>
					<TrackLine>
						<End x="221.867" y="185.3846"/>
					</TrackLine>
					<TrackLine>
						<End x="221.1986" y="186.053"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7603" y="186.4353"/>
					</TrackLine>
					<TrackLine>
						<End x="217.6117" y="186.4353"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="186.3126"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PB5"/>
				<Subwire width="0.25">
					<Start x="220.726" y="174.752"/>
					<TrackLine>
						<End x="221.867" y="176.8194"/>
					</TrackLine>
					<TrackLine>
						<End x="222.498" y="179.2082"/>
					</TrackLine>
					<TrackLine>
						<End x="222.498" y="180.4558"/>
					</TrackLine>
					<TrackLine>
						<End x="221.867" y="182.8446"/>
					</TrackLine>
					<TrackLine>
						<End x="221.1986" y="183.513"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7603" y="183.8953"/>
					</TrackLine>
					<TrackLine>
						<End x="217.6117" y="183.8953"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="183.7726"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PB4"/>
				<Subwire width="0.25">
					<Start x="220.726" y="177.292"/>
					<TrackLine>
						<End x="221.867" y="179.3594"/>
					</TrackLine>
					<TrackLine>
						<End x="221.867" y="180.3046"/>
					</TrackLine>
					<TrackLine>
						<End x="221.1986" y="180.973"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="181.2326"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PB3"/>
				<Subwire width="0.25">
					<Start x="220.726" y="179.832"/>
					<TrackLine>
						<End x="218.6586" y="178.691"/>
					</TrackLine>
					<TrackLine>
						<End x="217.7134" y="178.691"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="178.6926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PB2"/>
				<Subwire width="0.25">
					<Start x="220.726" y="182.372"/>
					<TrackLine>
						<End x="218.6071" y="183.3887"/>
					</TrackLine>
					<TrackLine>
						<End x="217.7649" y="183.3887"/>
					</TrackLine>
					<TrackLine>
						<End x="213.0567" y="182.3736"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="178.6926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PB1"/>
				<Subwire width="0.25">
					<Start x="220.726" y="184.912"/>
					<TrackLine>
						<End x="218.6071" y="185.9287"/>
					</TrackLine>
					<TrackLine>
						<End x="217.7649" y="185.9287"/>
					</TrackLine>
					<TrackLine>
						<End x="213.0567" y="184.9136"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="181.2326"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PB0"/>
				<Subwire width="0.25">
					<Start x="220.726" y="187.452"/>
					<TrackLine>
						<End x="218.6071" y="188.4687"/>
					</TrackLine>
					<TrackLine>
						<End x="217.7649" y="188.4687"/>
					</TrackLine>
					<TrackLine>
						<End x="213.0567" y="187.4536"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="183.7726"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PA6"/>
				<Subwire width="0.25">
					<Start x="220.726" y="215.392"/>
					<TrackLine>
						<End x="218.6586" y="216.533"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3414" y="216.791"/>
					</TrackLine>
					<TrackLine>
						<End x="217.045" y="217.0874"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="221.8726"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PA2"/>
				<Subwire width="0.25">
					<Start x="220.726" y="205.232"/>
					<TrackLine>
						<End x="219.585" y="207.2994"/>
					</TrackLine>
					<TrackLine>
						<End x="219.327" y="208.2446"/>
					</TrackLine>
					<TrackLine>
						<End x="218.6586" y="208.913"/>
					</TrackLine>
					<TrackLine>
						<End x="217.7134" y="209.171"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0019" y="212.8536"/>
					</TrackLine>
					<TrackLine>
						<End x="213.0567" y="213.1116"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="224.4126"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PA1"/>
				<Subwire width="0.25">
					<Start x="220.726" y="202.692"/>
					<TrackLine>
						<End x="219.585" y="204.7594"/>
					</TrackLine>
					<TrackLine>
						<End x="219.327" y="205.7046"/>
					</TrackLine>
					<TrackLine>
						<End x="218.6586" y="206.373"/>
					</TrackLine>
					<TrackLine>
						<End x="217.7134" y="206.631"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0019" y="210.3136"/>
					</TrackLine>
					<TrackLine>
						<End x="213.0567" y="210.5716"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="221.8726"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="PA0"/>
				<Subwire width="0.25">
					<Start x="220.726" y="200.152"/>
					<TrackLine>
						<End x="219.585" y="202.2194"/>
					</TrackLine>
					<TrackLine>
						<End x="219.327" y="203.1646"/>
					</TrackLine>
					<TrackLine>
						<End x="218.6586" y="203.833"/>
					</TrackLine>
					<TrackLine>
						<End x="217.7134" y="204.091"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0019" y="207.7736"/>
					</TrackLine>
					<TrackLine>
						<End x="213.0567" y="208.0316"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="219.3326"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETU5_19"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="181.0428"/>
					<TrackLine>
						<End x="178.082" y="181.1798"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1529" y="182.3994"/>
					</TrackLine>
					<TrackLine>
						<End x="158.9129" y="184.9394"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9677" y="184.9394"/>
					</TrackLine>
					<TrackLine>
						<End x="155.1586" y="183.771"/>
					</TrackLine>
					<TrackLine>
						<End x="154.2134" y="183.771"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="189.992"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MEM3SEL"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="152.2191"/>
					<TrackLine>
						<End x="213.6965" y="154.338"/>
					</TrackLine>
					<TrackLine>
						<End x="213.6965" y="155.1802"/>
					</TrackLine>
					<TrackLine>
						<End x="213.1009" y="155.7758"/>
					</TrackLine>
					<TrackLine>
						<End x="212.1055" y="155.7758"/>
					</TrackLine>
					<TrackLine>
						<End x="212.0087" y="155.8159"/>
					</TrackLine>
					<TrackLine>
						<End x="211.1966" y="156.628"/>
					</TrackLine>
					<TrackLine>
						<End x="211.1565" y="156.7248"/>
					</TrackLine>
					<TrackLine>
						<End x="211.1565" y="157.8734"/>
					</TrackLine>
					<TrackLine>
						<End x="211.1966" y="157.9702"/>
					</TrackLine>
					<TrackLine>
						<End x="212.0087" y="158.7823"/>
					</TrackLine>
					<TrackLine>
						<End x="212.1055" y="158.8224"/>
					</TrackLine>
					<TrackLine>
						<End x="213.1009" y="158.8224"/>
					</TrackLine>
					<TrackLine>
						<End x="213.6965" y="159.418"/>
					</TrackLine>
					<TrackLine>
						<End x="213.8208" y="161.9065"/>
					</TrackLine>
					<TrackLine>
						<End x="213.8208" y="162.8517"/>
					</TrackLine>
					<TrackLine>
						<End x="213.6965" y="165.3402"/>
					</TrackLine>
					<TrackLine>
						<End x="213.1009" y="165.9358"/>
					</TrackLine>
					<TrackLine>
						<End x="212.1055" y="165.9358"/>
					</TrackLine>
					<TrackLine>
						<End x="212.0087" y="165.9759"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2844" y="173.6801"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2524" y="182.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="178.257" y="182.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1602" y="182.0996"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1014" y="184.8151"/>
					</TrackLine>
					<TrackLine>
						<End x="173.106" y="184.8151"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9677" y="187.7374"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="189.992"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MEM2SEL"/>
				<Subwire width="0.25">
					<Start x="193.294" y="152.3236"/>
					<TrackLine>
						<End x="196.9672" y="151.0781"/>
					</TrackLine>
					<TrackLine>
						<End x="212.2072" y="151.0781"/>
					</TrackLine>
					<TrackLine>
						<End x="213.1524" y="151.0781"/>
					</TrackLine>
					<TrackLine>
						<End x="213.8208" y="151.7465"/>
					</TrackLine>
					<TrackLine>
						<End x="214.2031" y="154.1848"/>
					</TrackLine>
					<TrackLine>
						<End x="214.2031" y="155.3334"/>
					</TrackLine>
					<TrackLine>
						<End x="214.163" y="155.4302"/>
					</TrackLine>
					<TrackLine>
						<End x="213.3509" y="156.2423"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2541" y="156.2824"/>
					</TrackLine>
					<TrackLine>
						<End x="212.2587" y="156.2824"/>
					</TrackLine>
					<TrackLine>
						<End x="211.6631" y="156.878"/>
					</TrackLine>
					<TrackLine>
						<End x="211.6631" y="157.7202"/>
					</TrackLine>
					<TrackLine>
						<End x="212.2587" y="158.3158"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2541" y="158.3158"/>
					</TrackLine>
					<TrackLine>
						<End x="213.3509" y="158.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="214.163" y="159.168"/>
					</TrackLine>
					<TrackLine>
						<End x="214.2031" y="159.2648"/>
					</TrackLine>
					<TrackLine>
						<End x="214.4518" y="161.7553"/>
					</TrackLine>
					<TrackLine>
						<End x="214.4518" y="163.0029"/>
					</TrackLine>
					<TrackLine>
						<End x="214.2031" y="165.4934"/>
					</TrackLine>
					<TrackLine>
						<End x="214.163" y="165.5902"/>
					</TrackLine>
					<TrackLine>
						<End x="213.3509" y="166.4023"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2541" y="166.4424"/>
					</TrackLine>
					<TrackLine>
						<End x="212.2587" y="166.4424"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5458" y="174.3111"/>
					</TrackLine>
					<TrackLine>
						<End x="179.5024" y="182.526"/>
					</TrackLine>
					<TrackLine>
						<End x="179.4056" y="182.5661"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4102" y="182.5661"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3514" y="185.2816"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2546" y="185.3217"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2592" y="185.3217"/>
					</TrackLine>
					<TrackLine>
						<End x="158.9129" y="190.0194"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9677" y="190.2774"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="192.532"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="INT"/>
				<Subwire width="0.25">
					<Start x="135.89" y="165.608"/>
					<TrackLine>
						<End x="137.1783" y="167.6072"/>
					</TrackLine>
					<TrackLine>
						<End x="137.1834" y="167.6194"/>
					</TrackLine>
					<TrackLine>
						<End x="138.3401" y="171.6647"/>
					</TrackLine>
					<TrackLine>
						<End x="138.3401" y="173.1819"/>
					</TrackLine>
					<TrackLine>
						<End x="137.8144" y="175.6174"/>
					</TrackLine>
					<TrackLine>
						<End x="135.1514" y="183.6199"/>
					</TrackLine>
					<TrackLine>
						<End x="135.1463" y="183.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="134.3988" y="184.3796"/>
					</TrackLine>
					<TrackLine>
						<End x="133.8934" y="184.787"/>
					</TrackLine>
					<TrackLine>
						<End x="133.225" y="185.4554"/>
					</TrackLine>
					<TrackLine>
						<End x="127.887" y="194.0206"/>
					</TrackLine>
					<TrackLine>
						<End x="127.2186" y="194.689"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2734" y="194.947"/>
					</TrackLine>
					<TrackLine>
						<End x="125.605" y="195.6154"/>
					</TrackLine>
					<TrackLine>
						<End x="125.605" y="196.5606"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2734" y="197.229"/>
					</TrackLine>
					<TrackLine>
						<End x="134.8386" y="197.487"/>
					</TrackLine>
					<TrackLine>
						<End x="148.6106" y="202.9226"/>
					</TrackLine>
					<TrackLine>
						<End x="148.6228" y="202.9277"/>
					</TrackLine>
					<TrackLine>
						<End x="149.3703" y="203.6752"/>
					</TrackLine>
					<TrackLine>
						<End x="153.3292" y="209.7371"/>
					</TrackLine>
					<TrackLine>
						<End x="153.9976" y="210.4055"/>
					</TrackLine>
					<TrackLine>
						<End x="154.9428" y="210.6635"/>
					</TrackLine>
					<TrackLine>
						<End x="155.6112" y="211.3319"/>
					</TrackLine>
					<TrackLine>
						<End x="157.2993" y="214.751"/>
					</TrackLine>
					<TrackLine>
						<End x="158.4403" y="216.8184"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="223.266" y="147.828"/>
					<TrackLine>
						<End x="222.475" y="144.2156"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="148.082" y="204.216"/>
					<TrackLine>
						<End x="143.1689" y="208.1072"/>
					</TrackLine>
					<TrackLine>
						<End x="142.4291" y="208.847"/>
					</TrackLine>
					<TrackLine>
						<End x="141.6949" y="209.9668"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="169.672"/>
					<TrackLine>
						<End x="215.2078" y="159.065"/>
					</TrackLine>
					<TrackLine>
						<End x="215.0148" y="158.5989"/>
					</TrackLine>
					<TrackLine>
						<End x="214.6184" y="157.6852"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="158.4403" y="183.7984"/>
					<TrackLine>
						<End x="155.2113" y="181.1069"/>
					</TrackLine>
					<TrackLine>
						<End x="154.1629" y="181.106"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="182.372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="214.6184" y="157.6852"/>
					<TrackLine>
						<End x="223.266" y="147.828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="143.6942" y="214.4523"/>
					<TrackLine>
						<End x="142.4282" y="212.4354"/>
					</TrackLine>
					<TrackLine>
						<End x="141.6949" y="209.9668"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="122.174" y="185.8264"/>
					<TrackLine>
						<End x="126.746" y="185.928"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="126.238" y="212.344"/>
					<TrackLine>
						<End x="136.0742" y="209.3723"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="215.392"/>
					<TrackLine>
						<End x="218.186" y="212.852"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="222.475" y="144.2156"/>
					<TrackLine>
						<End x="226.314" y="140.716"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="212.6798" y="157.2991"/>
					<TrackLine>
						<End x="213.4539" y="157.3111"/>
					</TrackLine>
					<TrackLine>
						<End x="214.6184" y="157.6852"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="141.6949" y="209.9668"/>
					<TrackLine>
						<End x="136.0742" y="209.3723"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="194.0713" y="198.8228"/>
					<TrackLine>
						<End x="197.7662" y="200.2786"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8124" y="200.2786"/>
					</TrackLine>
					<TrackLine>
						<End x="213.0062" y="197.7466"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0524" y="197.7386"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="197.612"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="197.4398" y="139.5191"/>
					<TrackLine>
						<End x="212.1567" y="140.7851"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2051" y="140.794"/>
					</TrackLine>
					<TrackLine>
						<End x="215.5424" y="142.1103"/>
					</TrackLine>
					<TrackLine>
						<End x="215.6006" y="142.1344"/>
					</TrackLine>
					<TrackLine>
						<End x="222.475" y="144.2156"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="201.93" y="175.768"/>
					<TrackLine>
						<End x="206.0409" y="173.8388"/>
					</TrackLine>
					<TrackLine>
						<End x="212.1545" y="171.274"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2029" y="171.2651"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="169.672"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="193.294" y="157.4036"/>
					<TrackLine>
						<End x="178.5771" y="158.6696"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5309" y="158.6696"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="158.4828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="215.392"/>
					<TrackLine>
						<End x="213.5293" y="214.2526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="182.626" y="175.768"/>
					<TrackLine>
						<End x="178.306" y="177.2377"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6803" y="181.2584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="173.8821" y="158.4828"/>
					<TrackLine>
						<End x="159.1652" y="159.7488"/>
					</TrackLine>
					<TrackLine>
						<End x="158.119" y="159.7488"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="159.6696"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="150.8628"/>
					<TrackLine>
						<End x="177.5814" y="150.9246"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5266" y="150.9246"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="149.7836"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.25">
					<Start x="193.294" y="149.7836"/>
					<TrackLine>
						<End x="196.9672" y="148.5381"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9124" y="148.5381"/>
					</TrackLine>
					<TrackLine>
						<End x="212.6798" y="149.6791"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.25">
					<Start x="213.5293" y="193.9326"/>
					<TrackLine>
						<End x="198.7619" y="192.7916"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5439" y="192.6018"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="192.6018"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8313" y="196.2828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="148.3228"/>
					<TrackLine>
						<End x="177.5814" y="148.3846"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5266" y="148.3846"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="147.2436"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.25">
					<Start x="213.5293" y="196.4726"/>
					<TrackLine>
						<End x="198.7619" y="197.6136"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="197.6818"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8313" y="203.9028"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="145.7828"/>
					<TrackLine>
						<End x="177.5814" y="145.8446"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5266" y="145.8446"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="144.7036"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.25">
					<Start x="213.5293" y="199.0126"/>
					<TrackLine>
						<End x="198.7619" y="202.6936"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8167" y="202.6936"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5439" y="200.2218"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="200.2218"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8313" y="206.4428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="211.5228"/>
					<TrackLine>
						<End x="193.6502" y="210.5061"/>
					</TrackLine>
					<TrackLine>
						<End x="194.4924" y="210.5061"/>
					</TrackLine>
					<TrackLine>
						<End x="197.715" y="210.6959"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8636" y="210.6959"/>
					</TrackLine>
					<TrackLine>
						<End x="213.0567" y="205.4916"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0019" y="205.2336"/>
					</TrackLine>
					<TrackLine>
						<End x="214.6703" y="204.5652"/>
					</TrackLine>
					<TrackLine>
						<End x="214.6703" y="203.62"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="201.5526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.25">
					<Start x="193.294" y="142.1636"/>
					<TrackLine>
						<End x="196.9672" y="140.9181"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9124" y="140.9181"/>
					</TrackLine>
					<TrackLine>
						<End x="212.6798" y="142.0591"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.25">
					<Start x="193.294" y="139.6236"/>
					<TrackLine>
						<End x="196.9672" y="138.3781"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9124" y="138.3781"/>
					</TrackLine>
					<TrackLine>
						<End x="212.6798" y="139.5191"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.25">
					<Start x="213.5293" y="204.0926"/>
					<TrackLine>
						<End x="198.7104" y="210.1893"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8682" y="210.1893"/>
					</TrackLine>
					<TrackLine>
						<End x="194.6456" y="209.9995"/>
					</TrackLine>
					<TrackLine>
						<End x="193.6502" y="209.9995"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8313" y="208.9828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.25">
					<Start x="154.686" y="141.8896"/>
					<TrackLine>
						<End x="159.1147" y="141.8438"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="140.7028"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="140.7028"/>
					<TrackLine>
						<End x="177.5814" y="140.7646"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5266" y="140.7646"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="139.6236"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.25">
					<Start x="178.054" y="142.1636"/>
					<TrackLine>
						<End x="192.8214" y="143.3046"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7666" y="143.3046"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4398" y="142.0591"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.25">
					<Start x="139.446" y="144.4296"/>
					<TrackLine>
						<End x="154.2134" y="143.2886"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="143.2428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="143.2428"/>
					<TrackLine>
						<End x="173.4095" y="142.1018"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3547" y="142.1018"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="142.1636"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.25">
					<Start x="173.6803" y="224.4384"/>
					<TrackLine>
						<End x="178.257" y="222.6995"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2524" y="222.6995"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="218.0018"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5439" y="217.7438"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8682" y="215.7759"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8636" y="215.7759"/>
					</TrackLine>
					<TrackLine>
						<End x="198.9604" y="215.7358"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="206.6326"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="145.7828"/>
					<TrackLine>
						<End x="173.4095" y="144.6418"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3547" y="144.6418"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="144.7036"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.25">
					<Start x="158.4403" y="226.9784"/>
					<TrackLine>
						<End x="158.9503" y="226.4684"/>
					</TrackLine>
					<TrackLine>
						<End x="159.0753" y="226.4684"/>
					</TrackLine>
					<TrackLine>
						<End x="159.1271" y="226.4684"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1529" y="225.5794"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4102" y="223.2061"/>
					</TrackLine>
					<TrackLine>
						<End x="179.4056" y="223.2061"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="220.5418"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7619" y="220.4736"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="209.1726"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="148.3228"/>
					<TrackLine>
						<End x="173.4095" y="147.1818"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3547" y="147.1818"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="147.2436"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.25">
					<Start x="213.5293" y="211.7126"/>
					<TrackLine>
						<End x="198.7619" y="223.0136"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="223.0818"/>
					</TrackLine>
					<TrackLine>
						<End x="177.9867" y="225.6218"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6803" y="226.9784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="CPUCLK"/>
				<Subwire width="0.25">
					<Start x="128.27" y="142.748"/>
					<TrackLine>
						<End x="129.411" y="144.8154"/>
					</TrackLine>
					<TrackLine>
						<End x="134.5966" y="161.0566"/>
					</TrackLine>
					<TrackLine>
						<End x="134.6017" y="161.0688"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="163.068"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="CPUCLK"/>
				<Subwire width="0.25">
					<Start x="135.89" y="163.068"/>
					<TrackLine>
						<End x="138.9734" y="165.8906"/>
					</TrackLine>
					<TrackLine>
						<End x="139.9186" y="166.1486"/>
					</TrackLine>
					<TrackLine>
						<End x="150.1468" y="174.4797"/>
					</TrackLine>
					<TrackLine>
						<End x="150.8943" y="175.2272"/>
					</TrackLine>
					<TrackLine>
						<End x="150.8994" y="175.2394"/>
					</TrackLine>
					<TrackLine>
						<End x="151.1876" y="176.7137"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="CPUCLK"/>
				<Subwire width="0.25">
					<Start x="151.1876" y="176.7137"/>
					<TrackLine>
						<End x="146.5934" y="181.231"/>
					</TrackLine>
					<TrackLine>
						<End x="145.925" y="181.8994"/>
					</TrackLine>
					<TrackLine>
						<End x="145.925" y="182.8446"/>
					</TrackLine>
					<TrackLine>
						<End x="145.925" y="190.4646"/>
					</TrackLine>
					<TrackLine>
						<End x="146.5934" y="191.133"/>
					</TrackLine>
					<TrackLine>
						<End x="147.5386" y="191.391"/>
					</TrackLine>
					<TrackLine>
						<End x="154.0149" y="196.5552"/>
					</TrackLine>
					<TrackLine>
						<End x="154.1117" y="196.5953"/>
					</TrackLine>
					<TrackLine>
						<End x="155.1071" y="196.5953"/>
					</TrackLine>
					<TrackLine>
						<End x="157.7692" y="197.9816"/>
					</TrackLine>
					<TrackLine>
						<End x="157.866" y="198.0217"/>
					</TrackLine>
					<TrackLine>
						<End x="158.8614" y="198.0217"/>
					</TrackLine>
					<TrackLine>
						<End x="159.457" y="198.6173"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1971" y="214.9495"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0092" y="215.7616"/>
					</TrackLine>
					<TrackLine>
						<End x="173.106" y="215.8017"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2546" y="215.8017"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8313" y="214.0628"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="CPUCLK"/>
				<Subwire width="0.25">
					<Start x="158.4403" y="178.7184"/>
					<TrackLine>
						<End x="151.1876" y="176.7137"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC10_1"/>
				<Subwire width="0.25">
					<Start x="128.27" y="152.908"/>
					<TrackLine>
						<End x="129.411" y="154.6034"/>
					</TrackLine>
					<TrackLine>
						<End x="133.9656" y="168.8021"/>
					</TrackLine>
					<TrackLine>
						<End x="134.0667" y="169.0463"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="172.4233"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC10_1"/>
				<Subwire width="0.25">
					<Start x="135.89" y="172.4233"/>
					<TrackLine>
						<End x="132.5697" y="177.4705"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5646" y="177.4827"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5646" y="178.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="133.858" y="183.0913"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC9_2"/>
				<Subwire width="0.25">
					<Start x="125.73" y="160.528"/>
					<TrackLine>
						<End x="127.0183" y="162.5272"/>
					</TrackLine>
					<TrackLine>
						<End x="127.0234" y="162.5394"/>
					</TrackLine>
					<TrackLine>
						<End x="128.778" y="178.0113"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETC9_1"/>
				<Subwire width="0.25">
					<Start x="135.89" y="168.148"/>
					<TrackLine>
						<End x="137.6537" y="171.5648"/>
					</TrackLine>
					<TrackLine>
						<End x="137.7442" y="171.7832"/>
					</TrackLine>
					<TrackLine>
						<End x="137.7442" y="173.0634"/>
					</TrackLine>
					<TrackLine>
						<End x="137.1834" y="175.4919"/>
					</TrackLine>
					<TrackLine>
						<End x="137.1783" y="175.5041"/>
					</TrackLine>
					<TrackLine>
						<End x="136.4308" y="176.2516"/>
					</TrackLine>
					<TrackLine>
						<End x="133.858" y="178.0113"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.25">
					<Start x="154.4702" y="219.4245"/>
					<TrackLine>
						<End x="154.4702" y="216.8845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A15"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="216.6028"/>
					<TrackLine>
						<End x="174.1014" y="217.8351"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2592" y="217.8351"/>
					</TrackLine>
					<TrackLine>
						<End x="172.6636" y="217.2395"/>
					</TrackLine>
					<TrackLine>
						<End x="159.5813" y="203.6458"/>
					</TrackLine>
					<TrackLine>
						<End x="158.9129" y="202.9774"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9677" y="202.7194"/>
					</TrackLine>
					<TrackLine>
						<End x="157.2993" y="202.051"/>
					</TrackLine>
					<TrackLine>
						<End x="155.7027" y="199.7309"/>
					</TrackLine>
					<TrackLine>
						<End x="155.1071" y="199.1353"/>
					</TrackLine>
					<TrackLine>
						<End x="154.1117" y="199.1353"/>
					</TrackLine>
					<TrackLine>
						<End x="154.0149" y="199.0952"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="195.072"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A14"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="219.1428"/>
					<TrackLine>
						<End x="174.1014" y="220.3751"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2592" y="220.3751"/>
					</TrackLine>
					<TrackLine>
						<End x="159.1114" y="210.2552"/>
					</TrackLine>
					<TrackLine>
						<End x="159.0146" y="210.2151"/>
					</TrackLine>
					<TrackLine>
						<End x="158.0192" y="210.2151"/>
					</TrackLine>
					<TrackLine>
						<End x="155.2821" y="207.5704"/>
					</TrackLine>
					<TrackLine>
						<End x="152.6212" y="205.5043"/>
					</TrackLine>
					<TrackLine>
						<End x="151.8737" y="204.7568"/>
					</TrackLine>
					<TrackLine>
						<End x="148.207" y="199.3074"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="197.612"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A13"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="221.6828"/>
					<TrackLine>
						<End x="174.1014" y="220.8817"/>
					</TrackLine>
					<TrackLine>
						<End x="173.106" y="220.8817"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0092" y="220.8416"/>
					</TrackLine>
					<TrackLine>
						<End x="158.8614" y="210.7217"/>
					</TrackLine>
					<TrackLine>
						<End x="157.866" y="210.7217"/>
					</TrackLine>
					<TrackLine>
						<End x="157.7692" y="210.6816"/>
					</TrackLine>
					<TrackLine>
						<End x="154.9428" y="208.1235"/>
					</TrackLine>
					<TrackLine>
						<End x="152.2637" y="206.0393"/>
					</TrackLine>
					<TrackLine>
						<End x="151.3387" y="205.1143"/>
					</TrackLine>
					<TrackLine>
						<End x="149.9053" y="203.3177"/>
					</TrackLine>
					<TrackLine>
						<End x="147.576" y="200.8388"/>
					</TrackLine>
					<TrackLine>
						<End x="147.576" y="200.787"/>
					</TrackLine>
					<TrackLine>
						<End x="147.576" y="200.662"/>
					</TrackLine>
					<TrackLine>
						<End x="147.066" y="200.152"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A12"/>
				<Subwire width="0.25">
					<Start x="197.4398" y="169.9991"/>
					<TrackLine>
						<End x="193.7666" y="171.2446"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8214" y="171.2446"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="170.1036"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A12"/>
				<Subwire width="0.25">
					<Start x="178.054" y="170.1036"/>
					<TrackLine>
						<End x="174.3547" y="172.3238"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4095" y="172.3238"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="171.1828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A11"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="159.8391"/>
					<TrackLine>
						<End x="197.9124" y="160.9801"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9672" y="160.9801"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="159.9436"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A11"/>
				<Subwire width="0.25">
					<Start x="193.294" y="159.9436"/>
					<TrackLine>
						<End x="178.5266" y="161.0846"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5814" y="161.0846"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="161.0228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A11"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="161.0228"/>
					<TrackLine>
						<End x="159.1147" y="162.1638"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="162.2096"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A10"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="155.9428"/>
					<TrackLine>
						<End x="159.1147" y="157.0838"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="157.1296"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A10"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="154.7591"/>
					<TrackLine>
						<End x="197.9124" y="155.9001"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9672" y="155.9001"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="154.8636"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A10"/>
				<Subwire width="0.25">
					<Start x="193.294" y="154.8636"/>
					<TrackLine>
						<End x="178.5266" y="156.0046"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5814" y="156.0046"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="155.9428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A9"/>
				<Subwire width="0.25">
					<Start x="193.294" y="162.4836"/>
					<TrackLine>
						<End x="178.5266" y="163.6246"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5814" y="163.6246"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="163.5628"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A9"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="163.5628"/>
					<TrackLine>
						<End x="159.1147" y="164.7038"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="164.7496"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A9"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="162.3791"/>
					<TrackLine>
						<End x="197.9124" y="163.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9672" y="163.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="162.4836"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="164.9191"/>
					<TrackLine>
						<End x="197.9124" y="166.0601"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9672" y="166.0601"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="165.0236"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.25">
					<Start x="193.294" y="165.0236"/>
					<TrackLine>
						<End x="178.5266" y="166.1646"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5814" y="166.1646"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="166.1028"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="166.1028"/>
					<TrackLine>
						<End x="159.1147" y="167.2438"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="167.2896"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A7"/>
				<Subwire width="0.25">
					<Start x="178.054" y="167.5636"/>
					<TrackLine>
						<End x="192.8214" y="166.4226"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7666" y="166.4226"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4398" y="167.4591"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A7"/>
				<Subwire width="0.25">
					<Start x="178.054" y="167.5636"/>
					<TrackLine>
						<End x="174.3547" y="167.5018"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4095" y="167.5018"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="168.6428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A6"/>
				<Subwire width="0.25">
					<Start x="197.4398" y="164.9191"/>
					<TrackLine>
						<End x="193.7666" y="163.8826"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8214" y="163.8826"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="165.0236"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A6"/>
				<Subwire width="0.25">
					<Start x="178.054" y="165.0236"/>
					<TrackLine>
						<End x="174.3547" y="164.9618"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4095" y="164.9618"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="166.1028"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A5"/>
				<Subwire width="0.25">
					<Start x="178.054" y="162.4836"/>
					<TrackLine>
						<End x="174.3547" y="162.4218"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4095" y="162.4218"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="163.5628"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A5"/>
				<Subwire width="0.25">
					<Start x="197.4398" y="162.3791"/>
					<TrackLine>
						<End x="193.7666" y="161.3426"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8214" y="161.3426"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="162.4836"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A4"/>
				<Subwire width="0.25">
					<Start x="197.4398" y="159.8391"/>
					<TrackLine>
						<End x="193.7666" y="158.8026"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8214" y="158.8026"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="159.9436"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A4"/>
				<Subwire width="0.25">
					<Start x="178.054" y="159.9436"/>
					<TrackLine>
						<End x="174.3547" y="159.8818"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4095" y="159.8818"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="161.0228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.25">
					<Start x="197.4398" y="157.2991"/>
					<TrackLine>
						<End x="193.7666" y="156.2626"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8214" y="156.2626"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="157.4036"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.25">
					<Start x="178.054" y="157.4036"/>
					<TrackLine>
						<End x="174.3547" y="157.3418"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4095" y="157.3418"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="158.4828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="158.4828"/>
					<TrackLine>
						<End x="154.2134" y="158.5286"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="159.6696"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A2"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="155.9428"/>
					<TrackLine>
						<End x="154.2134" y="155.9886"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="157.1296"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A2"/>
				<Subwire width="0.25">
					<Start x="197.4398" y="154.7591"/>
					<TrackLine>
						<End x="193.7666" y="153.7226"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8214" y="153.7226"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="154.8636"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A2"/>
				<Subwire width="0.25">
					<Start x="178.054" y="154.8636"/>
					<TrackLine>
						<End x="174.3547" y="154.8018"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4095" y="154.8018"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="155.9428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="153.4028"/>
					<TrackLine>
						<End x="173.4095" y="152.2618"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3547" y="152.2618"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="152.3236"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.25">
					<Start x="198.2893" y="209.1726"/>
					<TrackLine>
						<End x="194.0713" y="203.9028"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.25">
					<Start x="173.6803" y="209.1984"/>
					<TrackLine>
						<End x="174.4296" y="209.0614"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4102" y="207.9661"/>
					</TrackLine>
					<TrackLine>
						<End x="179.4056" y="207.9661"/>
					</TrackLine>
					<TrackLine>
						<End x="194.0713" y="203.9028"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A0"/>
				<Subwire width="0.25">
					<Start x="173.6803" y="211.7384"/>
					<TrackLine>
						<End x="172.6636" y="209.6195"/>
					</TrackLine>
					<TrackLine>
						<End x="172.6636" y="208.7773"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2592" y="208.1817"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2546" y="208.1817"/>
					</TrackLine>
					<TrackLine>
						<End x="178.257" y="207.4595"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2524" y="207.4595"/>
					</TrackLine>
					<TrackLine>
						<End x="194.0713" y="201.3628"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A0"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="150.8628"/>
					<TrackLine>
						<End x="173.4095" y="149.7218"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3547" y="149.7218"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="149.7836"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A0"/>
				<Subwire width="0.25">
					<Start x="198.2893" y="206.6326"/>
					<TrackLine>
						<End x="194.0713" y="201.3628"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="9600"/>
				<Subwire width="0.25">
					<Start x="136.0742" y="222.0723"/>
					<TrackLine>
						<End x="143.0231" y="215.5091"/>
					</TrackLine>
					<TrackLine>
						<End x="143.1199" y="215.469"/>
					</TrackLine>
					<TrackLine>
						<End x="144.1153" y="215.469"/>
					</TrackLine>
					<TrackLine>
						<End x="144.7109" y="214.8734"/>
					</TrackLine>
					<TrackLine>
						<End x="146.8502" y="211.8045"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="4800"/>
				<Subwire width="0.25">
					<Start x="136.0742" y="224.6123"/>
					<TrackLine>
						<End x="142.6775" y="216.5712"/>
					</TrackLine>
					<TrackLine>
						<End x="143.2731" y="215.9756"/>
					</TrackLine>
					<TrackLine>
						<End x="144.2685" y="215.9756"/>
					</TrackLine>
					<TrackLine>
						<End x="144.3653" y="215.9355"/>
					</TrackLine>
					<TrackLine>
						<End x="146.8502" y="214.3445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="300"/>
				<Subwire width="0.25">
					<Start x="143.6942" y="216.9923"/>
					<TrackLine>
						<End x="146.8502" y="221.9645"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="75"/>
				<Subwire width="0.25">
					<Start x="143.6942" y="224.6123"/>
					<TrackLine>
						<End x="146.1634" y="226.5345"/>
					</TrackLine>
					<TrackLine>
						<End x="146.2152" y="226.5345"/>
					</TrackLine>
					<TrackLine>
						<End x="146.3402" y="226.5345"/>
					</TrackLine>
					<TrackLine>
						<End x="146.8502" y="227.0445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NETU6_12"/>
				<Subwire width="0.25">
					<Start x="126.746" y="196.088"/>
					<TrackLine>
						<End x="140.4414" y="193.7786"/>
					</TrackLine>
					<TrackLine>
						<End x="141.4986" y="193.7786"/>
					</TrackLine>
					<TrackLine>
						<End x="147.5386" y="193.931"/>
					</TrackLine>
					<TrackLine>
						<End x="154.2649" y="198.6287"/>
					</TrackLine>
					<TrackLine>
						<End x="155.2603" y="198.6287"/>
					</TrackLine>
					<TrackLine>
						<End x="158.4403" y="199.0384"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SIOSEL"/>
				<Subwire width="0.25">
					<Start x="173.6803" y="214.2784"/>
					<TrackLine>
						<End x="171.9862" y="212.5503"/>
					</TrackLine>
					<TrackLine>
						<End x="159.5813" y="196.0258"/>
					</TrackLine>
					<TrackLine>
						<End x="158.9129" y="195.3574"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9677" y="195.0994"/>
					</TrackLine>
					<TrackLine>
						<End x="155.1586" y="193.931"/>
					</TrackLine>
					<TrackLine>
						<End x="154.2134" y="193.673"/>
					</TrackLine>
					<TrackLine>
						<End x="153.545" y="193.0046"/>
					</TrackLine>
					<TrackLine>
						<End x="153.545" y="190.4646"/>
					</TrackLine>
					<TrackLine>
						<End x="153.545" y="189.5194"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="187.452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="M1"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="193.7428"/>
					<TrackLine>
						<End x="179.3039" y="202.5038"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3587" y="202.7618"/>
					</TrackLine>
					<TrackLine>
						<End x="177.6903" y="203.4302"/>
					</TrackLine>
					<TrackLine>
						<End x="174.697" y="207.0795"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1014" y="207.6751"/>
					</TrackLine>
					<TrackLine>
						<End x="173.106" y="207.6751"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0092" y="207.7152"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1971" y="208.5273"/>
					</TrackLine>
					<TrackLine>
						<End x="172.157" y="208.6241"/>
					</TrackLine>
					<TrackLine>
						<End x="172.157" y="209.7727"/>
					</TrackLine>
					<TrackLine>
						<End x="172.5393" y="212.211"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2077" y="212.8794"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1529" y="212.8794"/>
					</TrackLine>
					<TrackLine>
						<End x="178.257" y="212.5395"/>
					</TrackLine>
					<TrackLine>
						<End x="179.4056" y="212.5395"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5439" y="212.9218"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7104" y="213.2359"/>
					</TrackLine>
					<TrackLine>
						<End x="199.306" y="213.8315"/>
					</TrackLine>
					<TrackLine>
						<End x="199.306" y="214.6737"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7104" y="215.2693"/>
					</TrackLine>
					<TrackLine>
						<End x="197.715" y="215.2693"/>
					</TrackLine>
					<TrackLine>
						<End x="194.6456" y="215.5861"/>
					</TrackLine>
					<TrackLine>
						<End x="193.6502" y="215.5861"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3039" y="217.7438"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2546" y="218.3417"/>
					</TrackLine>
					<TrackLine>
						<End x="173.106" y="218.3417"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0092" y="218.3016"/>
					</TrackLine>
					<TrackLine>
						<End x="159.6097" y="209.5094"/>
					</TrackLine>
					<TrackLine>
						<End x="159.1896" y="209.3354"/>
					</TrackLine>
					<TrackLine>
						<End x="158.4403" y="209.1984"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="WR"/>
				<Subwire width="0.25">
					<Start x="193.294" y="170.1036"/>
					<TrackLine>
						<End x="192.153" y="172.171"/>
					</TrackLine>
					<TrackLine>
						<End x="192.153" y="173.1162"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9303" y="178.9754"/>
					</TrackLine>
					<TrackLine>
						<End x="194.0713" y="181.0428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="WR"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="181.0428"/>
					<TrackLine>
						<End x="194.013" y="181.1011"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3772" y="182.7709"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2993" y="182.959"/>
					</TrackLine>
					<TrackLine>
						<End x="191.6683" y="185.3735"/>
					</TrackLine>
					<TrackLine>
						<End x="191.6683" y="186.8721"/>
					</TrackLine>
					<TrackLine>
						<End x="191.6683" y="212.2721"/>
					</TrackLine>
					<TrackLine>
						<End x="192.548" y="214.6371"/>
					</TrackLine>
					<TrackLine>
						<End x="192.5881" y="214.7339"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4002" y="215.546"/>
					</TrackLine>
					<TrackLine>
						<End x="193.497" y="215.5861"/>
					</TrackLine>
					<TrackLine>
						<End x="194.4924" y="215.5861"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8167" y="217.9336"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7619" y="217.9336"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="216.7926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="125.73" y="163.068"/>
					<TrackLine>
						<End x="125.73" y="165.608"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="135.89" y="155.448"/>
					<TrackLine>
						<End x="131.3957" y="163.1078"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="154.686" y="200.152"/>
					<TrackLine>
						<End x="147.5913" y="196.3469"/>
					</TrackLine>
					<TrackLine>
						<End x="146.5429" y="196.338"/>
					</TrackLine>
					<TrackLine>
						<End x="140.97" y="195.072"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="134.366" y="201.168"/>
					<TrackLine>
						<End x="140.97" y="195.072"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="154.686" y="174.9096"/>
					<TrackLine>
						<End x="157.9035" y="174.1078"/>
					</TrackLine>
					<TrackLine>
						<End x="158.0071" y="174.1078"/>
					</TrackLine>
					<TrackLine>
						<End x="158.2571" y="174.1078"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="173.7228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="147.066" y="187.452"/>
					<TrackLine>
						<End x="148.332" y="185.4351"/>
					</TrackLine>
					<TrackLine>
						<End x="149.606" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="213.5293" y="191.3926"/>
					<TrackLine>
						<End x="212.2633" y="189.3757"/>
					</TrackLine>
					<TrackLine>
						<End x="207.01" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="131.3957" y="163.1078"/>
					<TrackLine>
						<End x="134.4957" y="168.7596"/>
					</TrackLine>
					<TrackLine>
						<End x="137.2843" y="171.8117"/>
					</TrackLine>
					<TrackLine>
						<End x="139.061" y="174.171"/>
					</TrackLine>
					<TrackLine>
						<End x="139.061" y="174.2746"/>
					</TrackLine>
					<TrackLine>
						<End x="139.061" y="174.5246"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="174.9096"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="193.294" y="167.5636"/>
					<TrackLine>
						<End x="194.5042" y="169.6023"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5042" y="170.6049"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="172.6436"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="178.8313" y="186.1228"/>
					<TrackLine>
						<End x="177.5653" y="184.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="173.7228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="125.73" y="163.068"/>
					<TrackLine>
						<End x="131.3957" y="163.1078"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="158.4403" y="206.6584"/>
					<TrackLine>
						<End x="159.7054" y="208.6731"/>
					</TrackLine>
					<TrackLine>
						<End x="159.7063" y="209.7215"/>
					</TrackLine>
					<TrackLine>
						<End x="159.7063" y="212.2615"/>
					</TrackLine>
					<TrackLine>
						<End x="158.4403" y="214.2784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="212.6798" y="172.5391"/>
					<TrackLine>
						<End x="211.6817" y="171.9263"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="211.6817" y="171.9263"/>
					<TrackLine>
						<End x="211.4138" y="170.5222"/>
					</TrackLine>
					<TrackLine>
						<End x="211.4147" y="169.4738"/>
					</TrackLine>
					<TrackLine>
						<End x="212.6798" y="167.4591"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="147.066" y="187.452"/>
					<TrackLine>
						<End x="140.97" y="195.072"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="216.154" y="150.876"/>
					<TrackLine>
						<End x="213.9458" y="165.4422"/>
					</TrackLine>
					<TrackLine>
						<End x="212.6798" y="167.4591"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="139.446" y="174.9096"/>
					<TrackLine>
						<End x="139.831" y="174.5246"/>
					</TrackLine>
					<TrackLine>
						<End x="140.081" y="174.5246"/>
					</TrackLine>
					<TrackLine>
						<End x="140.1846" y="174.5246"/>
					</TrackLine>
					<TrackLine>
						<End x="143.9726" y="174.3496"/>
					</TrackLine>
					<TrackLine>
						<End x="145.0794" y="174.3496"/>
					</TrackLine>
					<TrackLine>
						<End x="149.606" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="143.6942" y="227.1523"/>
					<TrackLine>
						<End x="145.9538" y="225.7785"/>
					</TrackLine>
					<TrackLine>
						<End x="147.3733" y="225.7705"/>
					</TrackLine>
					<TrackLine>
						<End x="148.1153" y="225.0298"/>
					</TrackLine>
					<TrackLine>
						<End x="153.2051" y="218.8992"/>
					</TrackLine>
					<TrackLine>
						<End x="153.9449" y="218.1594"/>
					</TrackLine>
					<TrackLine>
						<End x="154.9933" y="218.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="155.7353" y="217.4098"/>
					</TrackLine>
					<TrackLine>
						<End x="156.6403" y="215.9357"/>
					</TrackLine>
					<TrackLine>
						<End x="157.5576" y="215.0184"/>
					</TrackLine>
					<TrackLine>
						<End x="158.4403" y="214.2784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="154.686" y="174.9096"/>
					<TrackLine>
						<End x="149.606" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="207.01" y="175.768"/>
					<TrackLine>
						<End x="211.6817" y="171.9263"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="VCC"/>
				<Subwire width="0.5">
					<Start x="194.0713" y="188.6628"/>
					<TrackLine>
						<End x="194.0713" y="186.1228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETJ2_2"/>
				<Subwire width="0.25">
					<Start x="126.746" y="201.168"/>
					<TrackLine>
						<End x="126.236" y="200.658"/>
					</TrackLine>
					<TrackLine>
						<End x="126.236" y="200.533"/>
					</TrackLine>
					<TrackLine>
						<End x="126.236" y="200.4812"/>
					</TrackLine>
					<TrackLine>
						<End x="125.605" y="199.1006"/>
					</TrackLine>
					<TrackLine>
						<End x="124.974" y="194.1718"/>
					</TrackLine>
					<TrackLine>
						<End x="124.827" y="191.7741"/>
					</TrackLine>
					<TrackLine>
						<End x="123.946" y="182.434"/>
					</TrackLine>
					<TrackLine>
						<End x="123.315" y="179.8166"/>
					</TrackLine>
					<TrackLine>
						<End x="122.174" y="177.5206"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETU6_26"/>
				<Subwire width="0.25">
					<Start x="126.238" y="217.424"/>
					<TrackLine>
						<End x="126.238" y="219.964"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETU6_26"/>
				<Subwire width="0.25">
					<Start x="126.238" y="219.964"/>
					<TrackLine>
						<End x="127.379" y="222.0314"/>
					</TrackLine>
					<TrackLine>
						<End x="127.379" y="222.9766"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7106" y="223.645"/>
					</TrackLine>
					<TrackLine>
						<End x="125.8169" y="224.0273"/>
					</TrackLine>
					<TrackLine>
						<End x="125.2213" y="224.6229"/>
					</TrackLine>
					<TrackLine>
						<End x="125.2213" y="225.4651"/>
					</TrackLine>
					<TrackLine>
						<End x="125.8169" y="226.0607"/>
					</TrackLine>
					<TrackLine>
						<End x="127.2927" y="226.0607"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3854" y="226.185"/>
					</TrackLine>
					<TrackLine>
						<End x="134.3306" y="226.185"/>
					</TrackLine>
					<TrackLine>
						<End x="135.2296" y="226.0113"/>
					</TrackLine>
					<TrackLine>
						<End x="136.4996" y="226.0113"/>
					</TrackLine>
					<TrackLine>
						<End x="136.9188" y="226.0113"/>
					</TrackLine>
					<TrackLine>
						<End x="143.2216" y="228.2933"/>
					</TrackLine>
					<TrackLine>
						<End x="144.1668" y="228.2933"/>
					</TrackLine>
					<TrackLine>
						<End x="154.9428" y="228.1855"/>
					</TrackLine>
					<TrackLine>
						<End x="155.6112" y="227.5171"/>
					</TrackLine>
					<TrackLine>
						<End x="156.6683" y="218.7346"/>
					</TrackLine>
					<TrackLine>
						<End x="157.2993" y="216.3458"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9677" y="215.6774"/>
					</TrackLine>
					<TrackLine>
						<End x="158.9129" y="215.4194"/>
					</TrackLine>
					<TrackLine>
						<End x="159.5813" y="214.751"/>
					</TrackLine>
					<TrackLine>
						<End x="172.5393" y="196.0258"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2077" y="195.3574"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1212" y="195.0228"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7447" y="194.3993"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7447" y="193.5175"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6803" y="191.4184"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RESET"/>
				<Subwire width="0.25">
					<Start x="220.1963" y="141.7685"/>
					<TrackLine>
						<End x="216.154" y="140.716"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RESET"/>
				<Subwire width="0.25">
					<Start x="173.6803" y="178.7184"/>
					<TrackLine>
						<End x="172.7411" y="174.1954"/>
					</TrackLine>
					<TrackLine>
						<End x="172.7411" y="173.2502"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4095" y="172.5818"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3547" y="172.3238"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0231" y="171.6554"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0231" y="169.1154"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0231" y="168.1702"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9174" y="165.9188"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9174" y="164.1284"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0225" y="161.6093"/>
					</TrackLine>
					<TrackLine>
						<End x="175.651" y="149.0343"/>
					</TrackLine>
					<TrackLine>
						<End x="176.282" y="146.6198"/>
					</TrackLine>
					<TrackLine>
						<End x="177.0373" y="144.2825"/>
					</TrackLine>
					<TrackLine>
						<End x="177.6329" y="143.6869"/>
					</TrackLine>
					<TrackLine>
						<End x="178.6283" y="143.6869"/>
					</TrackLine>
					<TrackLine>
						<End x="192.7197" y="143.1803"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7151" y="143.1803"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9672" y="140.9181"/>
					</TrackLine>
					<TrackLine>
						<End x="216.154" y="140.716"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RESET"/>
				<Subwire width="0.25">
					<Start x="220.1963" y="141.7685"/>
					<TrackLine>
						<End x="221.234" y="140.716"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RESET"/>
				<Subwire width="0.25">
					<Start x="223.266" y="152.908"/>
					<TrackLine>
						<End x="221.9726" y="148.3566"/>
					</TrackLine>
					<TrackLine>
						<End x="220.1963" y="141.7685"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RD"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="178.5028"/>
					<TrackLine>
						<End x="195.1143" y="180.6108"/>
					</TrackLine>
					<TrackLine>
						<End x="195.1143" y="181.4748"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5033" y="182.0858"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="182.4418"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9303" y="183.1102"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2993" y="185.499"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2993" y="186.7466"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2993" y="212.1466"/>
					</TrackLine>
					<TrackLine>
						<End x="193.0546" y="214.4839"/>
					</TrackLine>
					<TrackLine>
						<End x="193.6502" y="215.0795"/>
					</TrackLine>
					<TrackLine>
						<End x="194.6456" y="215.0795"/>
					</TrackLine>
					<TrackLine>
						<End x="194.7424" y="215.1196"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="216.7926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RAWBAUD"/>
				<Subwire width="0.25">
					<Start x="135.89" y="140.208"/>
					<TrackLine>
						<End x="129.2867" y="148.2491"/>
					</TrackLine>
					<TrackLine>
						<End x="128.6911" y="148.8447"/>
					</TrackLine>
					<TrackLine>
						<End x="127.6957" y="148.8447"/>
					</TrackLine>
					<TrackLine>
						<End x="127.5989" y="148.8848"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7868" y="149.6969"/>
					</TrackLine>
					<TrackLine>
						<End x="120.3777" y="158.9712"/>
					</TrackLine>
					<TrackLine>
						<End x="120.3726" y="158.9834"/>
					</TrackLine>
					<TrackLine>
						<End x="118.493" y="167.0161"/>
					</TrackLine>
					<TrackLine>
						<End x="118.493" y="168.5179"/>
					</TrackLine>
					<TrackLine>
						<End x="118.6682" y="168.9409"/>
					</TrackLine>
					<TrackLine>
						<End x="123.315" y="173.9074"/>
					</TrackLine>
					<TrackLine>
						<End x="124.577" y="182.3085"/>
					</TrackLine>
					<TrackLine>
						<End x="125.458" y="191.712"/>
					</TrackLine>
					<TrackLine>
						<End x="125.605" y="194.0206"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2734" y="194.689"/>
					</TrackLine>
					<TrackLine>
						<End x="127.2186" y="194.947"/>
					</TrackLine>
					<TrackLine>
						<End x="127.887" y="195.6154"/>
					</TrackLine>
					<TrackLine>
						<End x="132.6719" y="201.9799"/>
					</TrackLine>
					<TrackLine>
						<End x="133.5541" y="202.8621"/>
					</TrackLine>
					<TrackLine>
						<End x="143.6942" y="211.9123"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETR4_2"/>
				<Subwire width="0.25">
					<Start x="135.89" y="145.288"/>
					<TrackLine>
						<End x="135.89" y="142.748"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETR4_2"/>
				<Subwire width="0.25">
					<Start x="135.89" y="145.288"/>
					<TrackLine>
						<End x="128.9411" y="149.3112"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8443" y="149.3513"/>
					</TrackLine>
					<TrackLine>
						<End x="127.8489" y="149.3513"/>
					</TrackLine>
					<TrackLine>
						<End x="127.2533" y="149.9469"/>
					</TrackLine>
					<TrackLine>
						<End x="121.666" y="159.512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETR3_1"/>
				<Subwire width="0.25">
					<Start x="135.89" y="152.908"/>
					<TrackLine>
						<End x="126.2576" y="161.7965"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2539" y="161.798"/>
					</TrackLine>
					<TrackLine>
						<End x="125.2061" y="161.798"/>
					</TrackLine>
					<TrackLine>
						<End x="125.2024" y="161.7995"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4615" y="162.5404"/>
					</TrackLine>
					<TrackLine>
						<End x="124.46" y="162.5441"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4366" y="165.0794"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4366" y="166.1366"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4417" y="166.1488"/>
					</TrackLine>
					<TrackLine>
						<End x="125.73" y="168.148"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETR2_2"/>
				<Subwire width="0.25">
					<Start x="128.27" y="147.828"/>
					<TrackLine>
						<End x="128.27" y="145.288"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETR2_2"/>
				<Subwire width="0.25">
					<Start x="128.27" y="145.288"/>
					<TrackLine>
						<End x="121.666" y="142.748"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETR1_1"/>
				<Subwire width="0.25">
					<Start x="125.73" y="172.4233"/>
					<TrackLine>
						<End x="124.4366" y="168.6766"/>
					</TrackLine>
					<TrackLine>
						<End x="123.8056" y="166.2621"/>
					</TrackLine>
					<TrackLine>
						<End x="123.8056" y="163.7221"/>
					</TrackLine>
					<TrackLine>
						<End x="123.8056" y="162.4139"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4366" y="159.9994"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4417" y="159.9872"/>
					</TrackLine>
					<TrackLine>
						<End x="127.51" y="156.0312"/>
					</TrackLine>
					<TrackLine>
						<End x="127.5832" y="155.958"/>
					</TrackLine>
					<TrackLine>
						<End x="127.635" y="155.958"/>
					</TrackLine>
					<TrackLine>
						<End x="127.76" y="155.958"/>
					</TrackLine>
					<TrackLine>
						<End x="128.27" y="155.448"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PA7"/>
				<Subwire width="0.25">
					<Start x="220.726" y="217.932"/>
					<TrackLine>
						<End x="219.0306" y="219.073"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="219.3326"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PA5"/>
				<Subwire width="0.25">
					<Start x="220.726" y="212.852"/>
					<TrackLine>
						<End x="221.867" y="214.9194"/>
					</TrackLine>
					<TrackLine>
						<End x="221.867" y="215.8646"/>
					</TrackLine>
					<TrackLine>
						<End x="221.867" y="218.4046"/>
					</TrackLine>
					<TrackLine>
						<End x="221.1986" y="219.073"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="224.4126"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PA4"/>
				<Subwire width="0.25">
					<Start x="220.726" y="210.312"/>
					<TrackLine>
						<End x="221.867" y="212.3794"/>
					</TrackLine>
					<TrackLine>
						<End x="222.498" y="214.7682"/>
					</TrackLine>
					<TrackLine>
						<End x="222.498" y="216.0158"/>
					</TrackLine>
					<TrackLine>
						<End x="222.498" y="218.5558"/>
					</TrackLine>
					<TrackLine>
						<End x="222.4201" y="218.7439"/>
					</TrackLine>
					<TrackLine>
						<End x="221.5379" y="219.6261"/>
					</TrackLine>
					<TrackLine>
						<End x="219.1498" y="221.3146"/>
					</TrackLine>
					<TrackLine>
						<End x="218.2666" y="222.1978"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="226.9526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="PA3"/>
				<Subwire width="0.25">
					<Start x="220.726" y="207.772"/>
					<TrackLine>
						<End x="219.585" y="209.8394"/>
					</TrackLine>
					<TrackLine>
						<End x="219.327" y="213.3246"/>
					</TrackLine>
					<TrackLine>
						<End x="218.6586" y="213.993"/>
					</TrackLine>
					<TrackLine>
						<End x="217.7134" y="214.251"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0019" y="217.9336"/>
					</TrackLine>
					<TrackLine>
						<End x="213.0567" y="218.1916"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8725" y="226.1926"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7993" y="226.2658"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7993" y="226.3176"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7993" y="226.4426"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2893" y="226.9526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETU5_19"/>
				<Subwire width="0.25">
					<Start x="147.066" y="189.992"/>
					<TrackLine>
						<End x="147.066" y="192.532"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MEM1SEL"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="153.4028"/>
					<TrackLine>
						<End x="172.7411" y="155.4702"/>
					</TrackLine>
					<TrackLine>
						<End x="162.0337" y="175.2272"/>
					</TrackLine>
					<TrackLine>
						<End x="159.9235" y="179.3895"/>
					</TrackLine>
					<TrackLine>
						<End x="159.1114" y="180.2016"/>
					</TrackLine>
					<TrackLine>
						<End x="159.0146" y="180.2417"/>
					</TrackLine>
					<TrackLine>
						<End x="158.0192" y="180.2417"/>
					</TrackLine>
					<TrackLine>
						<End x="157.4236" y="180.8373"/>
					</TrackLine>
					<TrackLine>
						<End x="156.2897" y="193.1223"/>
					</TrackLine>
					<TrackLine>
						<End x="156.2374" y="193.2486"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="195.072"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MEM0SEL"/>
				<Subwire width="0.25">
					<Start x="154.686" y="154.5896"/>
					<TrackLine>
						<End x="157.5011" y="158.9554"/>
					</TrackLine>
					<TrackLine>
						<End x="158.1695" y="159.6238"/>
					</TrackLine>
					<TrackLine>
						<End x="159.1147" y="159.8818"/>
					</TrackLine>
					<TrackLine>
						<End x="159.7831" y="160.5502"/>
					</TrackLine>
					<TrackLine>
						<End x="159.7831" y="172.8782"/>
					</TrackLine>
					<TrackLine>
						<End x="159.7831" y="173.2974"/>
					</TrackLine>
					<TrackLine>
						<End x="159.7831" y="174.5674"/>
					</TrackLine>
					<TrackLine>
						<End x="159.457" y="179.1395"/>
					</TrackLine>
					<TrackLine>
						<End x="158.8614" y="179.7351"/>
					</TrackLine>
					<TrackLine>
						<End x="157.866" y="179.7351"/>
					</TrackLine>
					<TrackLine>
						<End x="157.7692" y="179.7752"/>
					</TrackLine>
					<TrackLine>
						<End x="156.9571" y="180.5873"/>
					</TrackLine>
					<TrackLine>
						<End x="156.917" y="180.6841"/>
					</TrackLine>
					<TrackLine>
						<End x="156.6683" y="183.1746"/>
					</TrackLine>
					<TrackLine>
						<End x="155.7429" y="192.9698"/>
					</TrackLine>
					<TrackLine>
						<End x="155.1238" y="193.5889"/>
					</TrackLine>
					<TrackLine>
						<End x="154.2134" y="193.931"/>
					</TrackLine>
					<TrackLine>
						<End x="153.545" y="194.5994"/>
					</TrackLine>
					<TrackLine>
						<End x="153.545" y="195.5446"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="197.612"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETJ3_3"/>
				<Subwire width="0.25">
					<Start x="126.238" y="214.884"/>
					<TrackLine>
						<End x="122.174" y="213.8172"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETJ2_3"/>
				<Subwire width="0.25">
					<Start x="126.238" y="222.504"/>
					<TrackLine>
						<End x="125.097" y="220.4366"/>
					</TrackLine>
					<TrackLine>
						<End x="125.097" y="217.8966"/>
					</TrackLine>
					<TrackLine>
						<End x="125.097" y="216.9514"/>
					</TrackLine>
					<TrackLine>
						<End x="125.7654" y="216.283"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7106" y="216.025"/>
					</TrackLine>
					<TrackLine>
						<End x="127.379" y="215.3566"/>
					</TrackLine>
					<TrackLine>
						<End x="127.379" y="212.8166"/>
					</TrackLine>
					<TrackLine>
						<End x="127.379" y="211.8714"/>
					</TrackLine>
					<TrackLine>
						<End x="124.974" y="199.2518"/>
					</TrackLine>
					<TrackLine>
						<End x="124.343" y="194.2973"/>
					</TrackLine>
					<TrackLine>
						<End x="124.196" y="191.8853"/>
					</TrackLine>
					<TrackLine>
						<End x="123.315" y="182.5852"/>
					</TrackLine>
					<TrackLine>
						<End x="122.174" y="180.2892"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="INT"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="188.6628"/>
					<TrackLine>
						<End x="177.1372" y="190.3909"/>
					</TrackLine>
					<TrackLine>
						<End x="177.0593" y="190.579"/>
					</TrackLine>
					<TrackLine>
						<End x="176.658" y="193.0392"/>
					</TrackLine>
					<TrackLine>
						<End x="176.658" y="194.822"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7973" y="197.948"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7023" y="202.2519"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8213" y="204.591"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1529" y="205.2594"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2077" y="205.5174"/>
					</TrackLine>
					<TrackLine>
						<End x="158.4403" y="216.8184"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="122.174" y="219.3544"/>
					<TrackLine>
						<End x="120.908" y="217.1089"/>
					</TrackLine>
					<TrackLine>
						<End x="120.908" y="214.3403"/>
					</TrackLine>
					<TrackLine>
						<End x="120.9089" y="213.2919"/>
					</TrackLine>
					<TrackLine>
						<End x="121.6509" y="212.5512"/>
					</TrackLine>
					<TrackLine>
						<End x="122.6993" y="212.3137"/>
					</TrackLine>
					<TrackLine>
						<End x="124.7779" y="211.3633"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="192.532"/>
					<TrackLine>
						<End x="218.186" y="189.992"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="207.772"/>
					<TrackLine>
						<End x="218.186" y="205.232"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="182.372"/>
					<TrackLine>
						<End x="218.186" y="179.832"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="187.452"/>
					<TrackLine>
						<End x="218.186" y="184.912"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="169.672"/>
					<TrackLine>
						<End x="218.186" y="172.212"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="195.072"/>
					<TrackLine>
						<End x="218.186" y="192.532"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="158.4403" y="181.2584"/>
					<TrackLine>
						<End x="159.2144" y="181.2464"/>
					</TrackLine>
					<TrackLine>
						<End x="159.6805" y="181.0534"/>
					</TrackLine>
					<TrackLine>
						<End x="160.7753" y="179.9586"/>
					</TrackLine>
					<TrackLine>
						<End x="163.322" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="124.7779" y="211.3633"/>
					<TrackLine>
						<End x="126.238" y="212.344"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="128.27" y="140.208"/>
					<TrackLine>
						<End x="135.3669" y="138.942"/>
					</TrackLine>
					<TrackLine>
						<End x="136.4153" y="138.9429"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="141.8896"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="179.832"/>
					<TrackLine>
						<End x="218.186" y="177.292"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="140.97" y="189.992"/>
					<TrackLine>
						<End x="147.066" y="182.372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="158.4403" y="183.7984"/>
					<TrackLine>
						<End x="158.4403" y="181.2584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="172.7625" y="181.9519"/>
					<TrackLine>
						<End x="163.322" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="189.992"/>
					<TrackLine>
						<End x="218.186" y="187.452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="200.152"/>
					<TrackLine>
						<End x="218.186" y="197.612"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="114.554" y="141.732"/>
					<TrackLine>
						<End x="128.27" y="140.208"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="172.212"/>
					<TrackLine>
						<End x="218.186" y="174.752"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="177.292"/>
					<TrackLine>
						<End x="218.186" y="174.752"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="215.392"/>
					<TrackLine>
						<End x="218.186" y="217.297"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="217.547"/>
					</TrackLine>
					<TrackLine>
						<End x="218.186" y="217.932"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="205.232"/>
					<TrackLine>
						<End x="218.186" y="202.692"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="172.7625" y="181.9519"/>
					<TrackLine>
						<End x="173.6803" y="183.7984"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="126.746" y="185.928"/>
					<TrackLine>
						<End x="133.8429" y="187.194"/>
					</TrackLine>
					<TrackLine>
						<End x="134.8913" y="187.2029"/>
					</TrackLine>
					<TrackLine>
						<End x="140.97" y="189.992"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="173.6803" y="181.2584"/>
					<TrackLine>
						<End x="172.7625" y="181.9519"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="147.066" y="182.372"/>
					<TrackLine>
						<End x="144.526" y="175.768"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="163.322" y="175.768"/>
					<TrackLine>
						<End x="172.617" y="160.4975"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="158.4828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="202.692"/>
					<TrackLine>
						<End x="218.186" y="200.152"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="184.912"/>
					<TrackLine>
						<End x="218.186" y="182.372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="197.612"/>
					<TrackLine>
						<End x="218.186" y="195.072"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="198.2893" y="211.7126"/>
					<TrackLine>
						<End x="213.5293" y="214.2526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="212.852"/>
					<TrackLine>
						<End x="218.186" y="210.312"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="173.6803" y="204.1184"/>
					<TrackLine>
						<End x="174.9463" y="202.1015"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0413" y="197.7986"/>
					</TrackLine>
					<TrackLine>
						<End x="175.9786" y="194.6868"/>
					</TrackLine>
					<TrackLine>
						<End x="175.9786" y="193.23"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9463" y="185.8153"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6803" y="183.7984"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="197.4398" y="139.5191"/>
					<TrackLine>
						<End x="193.8129" y="138.3708"/>
					</TrackLine>
					<TrackLine>
						<End x="192.7751" y="138.3708"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="139.6236"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="122.174" y="185.8264"/>
					<TrackLine>
						<End x="123.44" y="192.0357"/>
					</TrackLine>
					<TrackLine>
						<End x="123.587" y="194.4476"/>
					</TrackLine>
					<TrackLine>
						<End x="124.7779" y="211.3633"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="158.6421" y="140.7028"/>
					<TrackLine>
						<End x="173.359" y="139.4368"/>
					</TrackLine>
					<TrackLine>
						<End x="174.4052" y="139.4368"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="139.6236"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="139.446" y="141.8896"/>
					<TrackLine>
						<End x="154.1629" y="140.6236"/>
					</TrackLine>
					<TrackLine>
						<End x="155.2091" y="140.6236"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="140.7028"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="139.446" y="141.8896"/>
					<TrackLine>
						<End x="138.1809" y="143.9043"/>
					</TrackLine>
					<TrackLine>
						<End x="138.18" y="144.9527"/>
					</TrackLine>
					<TrackLine>
						<End x="138.18" y="155.1127"/>
					</TrackLine>
					<TrackLine>
						<End x="138.9207" y="155.8547"/>
					</TrackLine>
					<TrackLine>
						<End x="139.9691" y="155.8636"/>
					</TrackLine>
					<TrackLine>
						<End x="154.686" y="159.6696"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="218.186" y="210.312"/>
					<TrackLine>
						<End x="218.186" y="207.772"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.25">
					<Start x="158.4403" y="219.3584"/>
					<TrackLine>
						<End x="173.2592" y="218.3417"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2546" y="218.3417"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3514" y="218.3016"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1635" y="217.4895"/>
					</TrackLine>
					<TrackLine>
						<End x="175.2036" y="217.3927"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7394" y="214.9593"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7394" y="213.1765"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8177" y="212.4348"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8177" y="211.042"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7394" y="209.8691"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7394" y="208.0965"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5901" y="202.6409"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5953" y="202.6149"/>
					</TrackLine>
					<TrackLine>
						<End x="177.6903" y="198.3502"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8313" y="196.2828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.25">
					<Start x="154.686" y="152.0496"/>
					<TrackLine>
						<End x="159.1147" y="152.0038"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="150.8628"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="149.6791"/>
					<TrackLine>
						<End x="211.5388" y="151.7465"/>
					</TrackLine>
					<TrackLine>
						<End x="205.7166" y="175.2394"/>
					</TrackLine>
					<TrackLine>
						<End x="205.7166" y="176.2966"/>
					</TrackLine>
					<TrackLine>
						<End x="205.7217" y="176.3088"/>
					</TrackLine>
					<TrackLine>
						<End x="212.3883" y="191.8652"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="193.9326"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="203.9028"/>
					<TrackLine>
						<End x="176.4561" y="207.7157"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2558" y="208.1992"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2558" y="209.7664"/>
					</TrackLine>
					<TrackLine>
						<End x="176.3602" y="210.9341"/>
					</TrackLine>
					<TrackLine>
						<End x="176.3602" y="212.5427"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2558" y="213.2792"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2558" y="215.062"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8177" y="217.5148"/>
					</TrackLine>
					<TrackLine>
						<End x="175.6841" y="217.8373"/>
					</TrackLine>
					<TrackLine>
						<End x="174.6992" y="218.8222"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6803" y="219.3584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="147.1391"/>
					<TrackLine>
						<End x="204.4549" y="152.1851"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.25">
					<Start x="154.686" y="149.5096"/>
					<TrackLine>
						<End x="159.1147" y="149.4638"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="148.3228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.25">
					<Start x="193.294" y="147.2436"/>
					<TrackLine>
						<End x="196.9672" y="148.2801"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9124" y="148.5381"/>
					</TrackLine>
					<TrackLine>
						<End x="204.4549" y="152.1851"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.25">
					<Start x="204.4549" y="152.1851"/>
					<TrackLine>
						<End x="205.0856" y="176.4221"/>
					</TrackLine>
					<TrackLine>
						<End x="212.3883" y="194.4052"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="196.4726"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.25">
					<Start x="154.686" y="146.9696"/>
					<TrackLine>
						<End x="159.1147" y="146.9238"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="145.7828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="206.4428"/>
					<TrackLine>
						<End x="177.8567" y="207.0454"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8939" y="208.0082"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7722" y="208.3019"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7722" y="209.6637"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9027" y="210.8261"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9027" y="212.6507"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7722" y="213.3819"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7722" y="215.1647"/>
					</TrackLine>
					<TrackLine>
						<End x="176.3602" y="217.6227"/>
					</TrackLine>
					<TrackLine>
						<End x="176.144" y="218.1446"/>
					</TrackLine>
					<TrackLine>
						<End x="174.697" y="219.7795"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1014" y="220.3751"/>
					</TrackLine>
					<TrackLine>
						<End x="173.106" y="220.3751"/>
					</TrackLine>
					<TrackLine>
						<End x="158.4403" y="221.8984"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="144.5991"/>
					<TrackLine>
						<End x="217.4423" y="150.3352"/>
					</TrackLine>
					<TrackLine>
						<End x="217.4474" y="150.3474"/>
					</TrackLine>
					<TrackLine>
						<End x="217.4474" y="151.4046"/>
					</TrackLine>
					<TrackLine>
						<End x="215.152" y="168.7972"/>
					</TrackLine>
					<TrackLine>
						<End x="214.6703" y="196.9452"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="199.0126"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.25">
					<Start x="193.294" y="144.7036"/>
					<TrackLine>
						<End x="196.9672" y="145.7401"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9124" y="145.7401"/>
					</TrackLine>
					<TrackLine>
						<End x="212.6798" y="144.5991"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.25">
					<Start x="173.6803" y="221.8984"/>
					<TrackLine>
						<End x="174.4296" y="221.7614"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8497" y="221.5874"/>
					</TrackLine>
					<TrackLine>
						<End x="175.9093" y="220.5278"/>
					</TrackLine>
					<TrackLine>
						<End x="177.0639" y="218.7592"/>
					</TrackLine>
					<TrackLine>
						<End x="177.4452" y="217.8386"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8049" y="215.3355"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8049" y="213.6377"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8313" y="211.5228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.25">
					<Start x="154.686" y="144.4296"/>
					<TrackLine>
						<End x="159.1147" y="144.3838"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8821" y="143.2428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.25">
					<Start x="173.8821" y="143.2428"/>
					<TrackLine>
						<End x="177.4797" y="143.1803"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4751" y="143.1803"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="142.1636"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="142.0591"/>
					<TrackLine>
						<End x="214.3739" y="143.7872"/>
					</TrackLine>
					<TrackLine>
						<End x="218.5122" y="149.6203"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7094" y="150.0964"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7094" y="151.6556"/>
					</TrackLine>
					<TrackLine>
						<End x="216.414" y="169.0482"/>
					</TrackLine>
					<TrackLine>
						<End x="215.9323" y="197.2219"/>
					</TrackLine>
					<TrackLine>
						<End x="215.3013" y="199.6364"/>
					</TrackLine>
					<TrackLine>
						<End x="215.2234" y="199.8245"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="201.5526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.25">
					<Start x="212.6798" y="139.5191"/>
					<TrackLine>
						<End x="215.6254" y="139.4226"/>
					</TrackLine>
					<TrackLine>
						<End x="220.7054" y="139.4226"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7626" y="139.4226"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7748" y="139.4277"/>
					</TrackLine>
					<TrackLine>
						<End x="222.5223" y="140.1752"/>
					</TrackLine>
					<TrackLine>
						<End x="222.5274" y="140.1874"/>
					</TrackLine>
					<TrackLine>
						<End x="224.5594" y="147.2994"/>
					</TrackLine>
					<TrackLine>
						<End x="224.5594" y="148.3566"/>
					</TrackLine>
					<TrackLine>
						<End x="224.5594" y="153.4366"/>
					</TrackLine>
					<TrackLine>
						<End x="224.5543" y="153.4488"/>
					</TrackLine>
					<TrackLine>
						<End x="218.2666" y="163.7778"/>
					</TrackLine>
					<TrackLine>
						<End x="218.188" y="163.9675"/>
					</TrackLine>
					<TrackLine>
						<End x="217.045" y="169.1994"/>
					</TrackLine>
					<TrackLine>
						<End x="216.5633" y="197.3474"/>
					</TrackLine>
					<TrackLine>
						<End x="215.9323" y="199.7619"/>
					</TrackLine>
					<TrackLine>
						<End x="215.7583" y="200.182"/>
					</TrackLine>
					<TrackLine>
						<End x="213.5293" y="204.0926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="208.9828"/>
					<TrackLine>
						<End x="180.5254" y="210.7109"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="210.899"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="212.1466"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="217.2266"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="219.6154"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3039" y="220.2838"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3587" y="220.5418"/>
					</TrackLine>
					<TrackLine>
						<End x="177.6903" y="221.2102"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8213" y="227.451"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1529" y="228.1194"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2077" y="228.1194"/>
					</TrackLine>
					<TrackLine>
						<End x="158.4403" y="224.4384"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.25">
					<Start x="213.5293" y="206.6326"/>
					<TrackLine>
						<End x="212.3883" y="204.5652"/>
					</TrackLine>
					<TrackLine>
						<End x="212.3883" y="202.0252"/>
					</TrackLine>
					<TrackLine>
						<End x="212.3883" y="201.08"/>
					</TrackLine>
					<TrackLine>
						<End x="213.0567" y="200.4116"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0019" y="200.1536"/>
					</TrackLine>
					<TrackLine>
						<End x="214.6703" y="199.4852"/>
					</TrackLine>
					<TrackLine>
						<End x="215.3013" y="197.0964"/>
					</TrackLine>
					<TrackLine>
						<End x="215.783" y="168.9227"/>
					</TrackLine>
					<TrackLine>
						<End x="218.0784" y="151.5301"/>
					</TrackLine>
					<TrackLine>
						<End x="218.0784" y="150.2219"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9773" y="149.9777"/>
					</TrackLine>
					<TrackLine>
						<End x="213.8208" y="144.1265"/>
					</TrackLine>
					<TrackLine>
						<End x="213.1524" y="143.4581"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4398" y="142.0591"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.25">
					<Start x="173.6803" y="224.4384"/>
					<TrackLine>
						<End x="172.6636" y="222.3195"/>
					</TrackLine>
					<TrackLine>
						<End x="172.6636" y="221.4773"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2592" y="220.8817"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2546" y="220.8817"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3514" y="220.8416"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1635" y="220.0295"/>
					</TrackLine>
					<TrackLine>
						<End x="176.6039" y="218.4519"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9027" y="217.7307"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2886" y="215.2674"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2885" y="213.4846"/>
					</TrackLine>
					<TrackLine>
						<End x="177.4452" y="212.7586"/>
					</TrackLine>
					<TrackLine>
						<End x="177.4452" y="210.7182"/>
					</TrackLine>
					<TrackLine>
						<End x="177.308" y="209.5571"/>
					</TrackLine>
					<TrackLine>
						<End x="177.308" y="208.4085"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3481" y="208.3117"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1602" y="207.4996"/>
					</TrackLine>
					<TrackLine>
						<End x="178.257" y="207.4595"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2524" y="207.4595"/>
					</TrackLine>
					<TrackLine>
						<End x="179.848" y="206.8639"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="204.3754"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="201.8354"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="200.8902"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8313" y="198.8228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.25">
					<Start x="197.4398" y="144.5991"/>
					<TrackLine>
						<End x="193.7151" y="143.6869"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8729" y="143.6869"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="144.7036"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.25">
					<Start x="139.446" y="146.9696"/>
					<TrackLine>
						<End x="154.2134" y="145.8286"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="145.7828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="191.2028"/>
					<TrackLine>
						<End x="177.7669" y="193.3019"/>
					</TrackLine>
					<TrackLine>
						<End x="177.7669" y="195.0118"/>
					</TrackLine>
					<TrackLine>
						<End x="177.7551" y="195.071"/>
					</TrackLine>
					<TrackLine>
						<End x="177.0593" y="198.199"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9643" y="202.5029"/>
					</TrackLine>
					<TrackLine>
						<End x="175.223" y="207.9938"/>
					</TrackLine>
					<TrackLine>
						<End x="175.223" y="209.9718"/>
					</TrackLine>
					<TrackLine>
						<End x="175.2753" y="211.1499"/>
					</TrackLine>
					<TrackLine>
						<End x="175.2753" y="212.3269"/>
					</TrackLine>
					<TrackLine>
						<End x="175.223" y="213.0738"/>
					</TrackLine>
					<TrackLine>
						<End x="175.2231" y="214.8566"/>
					</TrackLine>
					<TrackLine>
						<End x="174.697" y="217.2395"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1014" y="217.8351"/>
					</TrackLine>
					<TrackLine>
						<End x="173.106" y="217.8351"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9677" y="218.2174"/>
					</TrackLine>
					<TrackLine>
						<End x="157.2993" y="218.8858"/>
					</TrackLine>
					<TrackLine>
						<End x="157.2993" y="219.831"/>
					</TrackLine>
					<TrackLine>
						<End x="157.2993" y="224.911"/>
					</TrackLine>
					<TrackLine>
						<End x="157.6803" y="226.3952"/>
					</TrackLine>
					<TrackLine>
						<End x="157.7535" y="226.4684"/>
					</TrackLine>
					<TrackLine>
						<End x="157.8053" y="226.4684"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9303" y="226.4684"/>
					</TrackLine>
					<TrackLine>
						<End x="158.4403" y="226.9784"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="191.2028"/>
					<TrackLine>
						<End x="180.5254" y="189.4747"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="189.2866"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="181.6666"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="180.419"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9154" y="178.0538"/>
					</TrackLine>
					<TrackLine>
						<End x="179.4391" y="177.5774"/>
					</TrackLine>
					<TrackLine>
						<End x="176.282" y="173.7496"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4427" y="165.8143"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4427" y="164.2329"/>
					</TrackLine>
					<TrackLine>
						<End x="175.6529" y="161.6463"/>
					</TrackLine>
					<TrackLine>
						<End x="176.282" y="149.1598"/>
					</TrackLine>
					<TrackLine>
						<End x="176.913" y="146.771"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="144.7036"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.25">
					<Start x="139.446" y="149.5096"/>
					<TrackLine>
						<End x="154.2134" y="148.3686"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="148.3228"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.25">
					<Start x="197.4398" y="147.1391"/>
					<TrackLine>
						<End x="193.7666" y="146.1026"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8214" y="146.1026"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="147.2436"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.25">
					<Start x="178.054" y="147.2436"/>
					<TrackLine>
						<End x="176.913" y="149.311"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2832" y="161.7717"/>
					</TrackLine>
					<TrackLine>
						<End x="175.968" y="164.3374"/>
					</TrackLine>
					<TrackLine>
						<End x="175.968" y="165.7098"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2851" y="167.8935"/>
					</TrackLine>
					<TrackLine>
						<End x="176.913" y="173.4882"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9258" y="177.2522"/>
					</TrackLine>
					<TrackLine>
						<End x="180.4289" y="177.7553"/>
					</TrackLine>
					<TrackLine>
						<End x="180.4895" y="177.9017"/>
					</TrackLine>
					<TrackLine>
						<End x="181.2343" y="180.2935"/>
					</TrackLine>
					<TrackLine>
						<End x="181.2343" y="181.7921"/>
					</TrackLine>
					<TrackLine>
						<End x="181.2343" y="189.4121"/>
					</TrackLine>
					<TrackLine>
						<End x="181.0603" y="189.8322"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8313" y="193.7428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.25">
					<Start x="173.6803" y="226.9784"/>
					<TrackLine>
						<End x="174.8213" y="224.911"/>
					</TrackLine>
					<TrackLine>
						<End x="177.7788" y="218.7068"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3953" y="218.0903"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3039" y="217.7438"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="217.0754"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="211.9954"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="211.0502"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3039" y="210.3818"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4102" y="209.9995"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8146" y="209.4039"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8146" y="208.5617"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4102" y="207.9661"/>
					</TrackLine>
					<TrackLine>
						<End x="179.4056" y="207.9661"/>
					</TrackLine>
					<TrackLine>
						<End x="179.5024" y="207.926"/>
					</TrackLine>
					<TrackLine>
						<End x="180.3145" y="207.1139"/>
					</TrackLine>
					<TrackLine>
						<End x="180.3546" y="207.0171"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="204.5266"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="201.9866"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="200.739"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="195.8102"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8313" y="193.7428"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETC10_2"/>
				<Subwire width="0.25">
					<Start x="128.27" y="150.368"/>
					<TrackLine>
						<End x="127.129" y="152.4354"/>
					</TrackLine>
					<TrackLine>
						<End x="123.9067" y="159.6297"/>
					</TrackLine>
					<TrackLine>
						<End x="123.8056" y="159.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="123.1746" y="162.2884"/>
					</TrackLine>
					<TrackLine>
						<End x="123.1746" y="163.8476"/>
					</TrackLine>
					<TrackLine>
						<End x="123.1746" y="166.3876"/>
					</TrackLine>
					<TrackLine>
						<End x="123.315" y="167.0161"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4366" y="172.9519"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4417" y="172.9641"/>
					</TrackLine>
					<TrackLine>
						<End x="125.73" y="174.9633"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETC10_2"/>
				<Subwire width="0.25">
					<Start x="125.73" y="174.9633"/>
					<TrackLine>
						<End x="128.778" y="183.0913"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETC9_2"/>
				<Subwire width="0.25">
					<Start x="135.89" y="147.828"/>
					<TrackLine>
						<End x="129.411" y="156.2926"/>
					</TrackLine>
					<TrackLine>
						<End x="125.73" y="160.528"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETC9_1"/>
				<Subwire width="0.25">
					<Start x="135.89" y="150.368"/>
					<TrackLine>
						<End x="137.031" y="152.4354"/>
					</TrackLine>
					<TrackLine>
						<End x="137.1834" y="159.9994"/>
					</TrackLine>
					<TrackLine>
						<End x="137.1834" y="161.0566"/>
					</TrackLine>
					<TrackLine>
						<End x="137.1834" y="166.1366"/>
					</TrackLine>
					<TrackLine>
						<End x="137.1783" y="166.1488"/>
					</TrackLine>
					<TrackLine>
						<End x="135.89" y="168.148"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.25">
					<Start x="154.4702" y="209.2645"/>
					<TrackLine>
						<End x="154.4702" y="211.8045"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.25">
					<Start x="154.4702" y="227.0445"/>
					<TrackLine>
						<End x="154.4702" y="224.5045"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.25">
					<Start x="158.4403" y="193.9584"/>
					<TrackLine>
						<End x="158.4403" y="196.4984"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.25">
					<Start x="154.4702" y="221.9645"/>
					<TrackLine>
						<End x="154.4702" y="219.4245"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.25">
					<Start x="154.4702" y="214.3445"/>
					<TrackLine>
						<End x="154.4702" y="211.8045"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.25">
					<Start x="154.4702" y="224.5045"/>
					<TrackLine>
						<End x="154.4702" y="221.9645"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.25">
					<Start x="173.6803" y="193.9584"/>
					<TrackLine>
						<End x="158.4403" y="193.9584"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.25">
					<Start x="158.4403" y="196.4984"/>
					<TrackLine>
						<End x="157.2993" y="198.5658"/>
					</TrackLine>
					<TrackLine>
						<End x="157.089" y="200.9013"/>
					</TrackLine>
					<TrackLine>
						<End x="154.4702" y="209.2645"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETSW1_9"/>
				<Subwire width="0.25">
					<Start x="154.4702" y="216.8845"/>
					<TrackLine>
						<End x="154.4702" y="214.3445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A12"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="224.2228"/>
					<TrackLine>
						<End x="179.9723" y="222.1554"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="219.7666"/>
					</TrackLine>
					<TrackLine>
						<End x="181.2343" y="217.3521"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8653" y="189.5376"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8653" y="181.9176"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8653" y="180.168"/>
					</TrackLine>
					<TrackLine>
						<End x="181.0636" y="177.7875"/>
					</TrackLine>
					<TrackLine>
						<End x="180.9156" y="177.4301"/>
					</TrackLine>
					<TrackLine>
						<End x="180.4125" y="176.927"/>
					</TrackLine>
					<TrackLine>
						<End x="180.2413" y="176.5136"/>
					</TrackLine>
					<TrackLine>
						<End x="179.195" y="171.799"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="170.1036"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A12"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="171.1828"/>
					<TrackLine>
						<End x="154.2134" y="171.2286"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="172.3696"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A11"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="226.7628"/>
					<TrackLine>
						<End x="179.3413" y="226.2528"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3413" y="226.1278"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3413" y="226.076"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="224.6954"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6033" y="222.3066"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8653" y="217.4776"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4963" y="189.6631"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4963" y="182.0431"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4963" y="180.0425"/>
					</TrackLine>
					<TrackLine>
						<End x="181.6377" y="177.6733"/>
					</TrackLine>
					<TrackLine>
						<End x="181.4023" y="177.1049"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8992" y="176.6018"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8154" y="176.3994"/>
					</TrackLine>
					<TrackLine>
						<End x="179.195" y="167.091"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5266" y="166.4226"/>
					</TrackLine>
					<TrackLine>
						<End x="177.6252" y="166.0589"/>
					</TrackLine>
					<TrackLine>
						<End x="177.0187" y="165.4524"/>
					</TrackLine>
					<TrackLine>
						<End x="177.0187" y="164.5948"/>
					</TrackLine>
					<TrackLine>
						<End x="177.6252" y="163.9883"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5266" y="163.6246"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8729" y="153.8469"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7151" y="153.8469"/>
					</TrackLine>
					<TrackLine>
						<End x="194.3107" y="154.4425"/>
					</TrackLine>
					<TrackLine>
						<End x="194.3231" y="156.9773"/>
					</TrackLine>
					<TrackLine>
						<End x="194.3231" y="157.8299"/>
					</TrackLine>
					<TrackLine>
						<End x="194.1753" y="157.9778"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="159.9436"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A10"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="226.7628"/>
					<TrackLine>
						<End x="192.9303" y="224.6954"/>
					</TrackLine>
					<TrackLine>
						<End x="189.7951" y="215.2365"/>
					</TrackLine>
					<TrackLine>
						<End x="189.1884" y="212.8805"/>
					</TrackLine>
					<TrackLine>
						<End x="189.1443" y="212.6589"/>
					</TrackLine>
					<TrackLine>
						<End x="189.1443" y="187.2589"/>
					</TrackLine>
					<TrackLine>
						<End x="189.1443" y="184.9867"/>
					</TrackLine>
					<TrackLine>
						<End x="189.629" y="171.6433"/>
					</TrackLine>
					<TrackLine>
						<End x="190.26" y="166.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="192.153" y="156.931"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="154.8636"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A9"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="224.2228"/>
					<TrackLine>
						<End x="192.9303" y="222.1554"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4063" y="215.0631"/>
					</TrackLine>
					<TrackLine>
						<End x="189.7951" y="212.6965"/>
					</TrackLine>
					<TrackLine>
						<End x="189.7753" y="212.5968"/>
					</TrackLine>
					<TrackLine>
						<End x="189.7753" y="187.1968"/>
					</TrackLine>
					<TrackLine>
						<End x="189.7753" y="185.0488"/>
					</TrackLine>
					<TrackLine>
						<End x="190.26" y="171.7688"/>
					</TrackLine>
					<TrackLine>
						<End x="190.891" y="166.8143"/>
					</TrackLine>
					<TrackLine>
						<End x="191.522" y="164.3998"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5999" y="164.2117"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="162.4836"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A8"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="221.6828"/>
					<TrackLine>
						<End x="195.2123" y="219.6154"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2123" y="218.6702"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5439" y="218.0018"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="217.7438"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9303" y="217.0754"/>
					</TrackLine>
					<TrackLine>
						<End x="191.8423" y="215.2322"/>
					</TrackLine>
					<TrackLine>
						<End x="191.6683" y="214.8121"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0373" y="212.3976"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0373" y="186.9976"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0373" y="185.248"/>
					</TrackLine>
					<TrackLine>
						<End x="191.522" y="172.0198"/>
					</TrackLine>
					<TrackLine>
						<End x="192.153" y="167.091"/>
					</TrackLine>
					<TrackLine>
						<End x="193.294" y="165.0236"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A7"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="219.1428"/>
					<TrackLine>
						<End x="192.3772" y="217.4147"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3074" y="215.5896"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0373" y="214.9376"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4063" y="212.5231"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4063" y="187.1231"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4063" y="185.1225"/>
					</TrackLine>
					<TrackLine>
						<End x="190.891" y="171.8943"/>
					</TrackLine>
					<TrackLine>
						<End x="191.522" y="166.9398"/>
					</TrackLine>
					<TrackLine>
						<End x="192.153" y="164.551"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8214" y="163.8826"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7211" y="163.5146"/>
					</TrackLine>
					<TrackLine>
						<End x="194.325" y="162.9107"/>
					</TrackLine>
					<TrackLine>
						<End x="194.325" y="161.4882"/>
					</TrackLine>
					<TrackLine>
						<End x="194.3344" y="158.9501"/>
					</TrackLine>
					<TrackLine>
						<End x="194.6153" y="158.2719"/>
					</TrackLine>
					<TrackLine>
						<End x="194.7983" y="158.0888"/>
					</TrackLine>
					<TrackLine>
						<End x="194.8422" y="157.9828"/>
					</TrackLine>
					<TrackLine>
						<End x="194.8422" y="156.8244"/>
					</TrackLine>
					<TrackLine>
						<End x="194.8173" y="154.2893"/>
					</TrackLine>
					<TrackLine>
						<End x="194.7772" y="154.1925"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9651" y="153.3804"/>
					</TrackLine>
					<TrackLine>
						<End x="193.8683" y="153.3403"/>
					</TrackLine>
					<TrackLine>
						<End x="192.7197" y="153.3403"/>
					</TrackLine>
					<TrackLine>
						<End x="192.6229" y="153.3804"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5266" y="161.0846"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5816" y="161.3432"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9136" y="162.0112"/>
					</TrackLine>
					<TrackLine>
						<End x="176.4934" y="164.4419"/>
					</TrackLine>
					<TrackLine>
						<End x="176.4934" y="165.6053"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5392" y="165.7158"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="167.5636"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A7"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="168.6428"/>
					<TrackLine>
						<End x="154.2134" y="168.6886"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="169.8296"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A6"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="166.1028"/>
					<TrackLine>
						<End x="154.2134" y="166.1486"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="167.2896"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A6"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="216.6028"/>
					<TrackLine>
						<End x="195.7654" y="218.3309"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8433" y="218.519"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8433" y="219.7666"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2123" y="227.2354"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5439" y="227.9038"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="227.9038"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9303" y="227.2354"/>
					</TrackLine>
					<TrackLine>
						<End x="189.1884" y="215.4205"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5816" y="213.0646"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5133" y="212.7211"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1273" y="179.9688"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1075" y="179.8691"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2118" y="177.5591"/>
					</TrackLine>
					<TrackLine>
						<End x="181.889" y="176.7797"/>
					</TrackLine>
					<TrackLine>
						<End x="181.3895" y="176.2802"/>
					</TrackLine>
					<TrackLine>
						<End x="179.826" y="166.9398"/>
					</TrackLine>
					<TrackLine>
						<End x="179.7481" y="166.7517"/>
					</TrackLine>
					<TrackLine>
						<End x="178.054" y="165.0236"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A5"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="214.0628"/>
					<TrackLine>
						<End x="192.9303" y="211.9954"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9303" y="211.0502"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="210.3818"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5439" y="210.1238"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2123" y="209.4554"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8433" y="207.0666"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4743" y="204.6521"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5173" y="200.9288"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7133" y="199.6196"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7133" y="198.4278"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1053" y="197.1576"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1483" y="185.84"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2463" y="184.4856"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2463" y="183.3406"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8573" y="182.7296"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7619" y="182.3736"/>
					</TrackLine>
					<TrackLine>
						<End x="199.4303" y="181.7052"/>
					</TrackLine>
					<TrackLine>
						<End x="199.4303" y="179.1652"/>
					</TrackLine>
					<TrackLine>
						<End x="199.4303" y="178.22"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2118" y="166.8353"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5808" y="164.4465"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4398" y="162.3791"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A5"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="163.5628"/>
					<TrackLine>
						<End x="154.2134" y="163.6086"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="164.7496"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A4"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="211.5228"/>
					<TrackLine>
						<End x="195.7654" y="209.7947"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8433" y="209.6066"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1053" y="204.7776"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1483" y="201.08"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2463" y="199.7256"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2463" y="198.5806"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8573" y="197.9696"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7619" y="197.6136"/>
					</TrackLine>
					<TrackLine>
						<End x="199.4303" y="196.9452"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0613" y="181.8564"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0613" y="179.3164"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0613" y="178.0688"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8428" y="166.7098"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2118" y="164.2953"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5808" y="161.9065"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4398" y="159.8391"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A4"/>
				<Subwire width="0.25">
					<Start x="158.6421" y="161.0228"/>
					<TrackLine>
						<End x="154.2134" y="161.0686"/>
					</TrackLine>
					<TrackLine>
						<End x="139.446" y="162.2096"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A3"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="208.9828"/>
					<TrackLine>
						<End x="195.2123" y="206.9154"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8433" y="204.5266"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8863" y="200.8033"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1803" y="199.5136"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1803" y="198.3218"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4743" y="197.0321"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5173" y="185.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7133" y="184.3796"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7133" y="183.1878"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7614" y="183.0717"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9548" y="182.6495"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2463" y="181.9456"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2463" y="180.14"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1752" y="179.1541"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1752" y="178.2311"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5808" y="173.3837"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5808" y="172.1137"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5808" y="171.6945"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5808" y="166.9865"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9124" y="166.3181"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9777" y="166.0347"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3242" y="165.3812"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3242" y="164.457"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4088" y="163.3745"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4088" y="161.952"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4107" y="159.4128"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5585" y="159.2649"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4398" y="157.2991"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A2"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="206.4428"/>
					<TrackLine>
						<End x="195.2123" y="204.3754"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2553" y="200.6778"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6473" y="199.4076"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6473" y="198.2158"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8433" y="196.9066"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8863" y="185.5633"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1803" y="184.2736"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1803" y="183.0818"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3096" y="182.7698"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5029" y="182.3475"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7133" y="181.8396"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7133" y="180.246"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5712" y="179.3056"/>
					</TrackLine>
					<TrackLine>
						<End x="196.2988" y="173.3837"/>
					</TrackLine>
					<TrackLine>
						<End x="196.2988" y="172.1393"/>
					</TrackLine>
					<TrackLine>
						<End x="196.2988" y="171.7201"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3546" y="170.9837"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3546" y="169.2235"/>
					</TrackLine>
					<TrackLine>
						<End x="195.7186" y="165.5327"/>
					</TrackLine>
					<TrackLine>
						<End x="195.7186" y="164.3055"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8879" y="163.2708"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8879" y="161.7991"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8916" y="159.2599"/>
					</TrackLine>
					<TrackLine>
						<End x="195.9355" y="159.1539"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1185" y="158.9708"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3994" y="158.2926"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4088" y="156.872"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4398" y="154.7591"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="203.9028"/>
					<TrackLine>
						<End x="192.9303" y="201.8354"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9303" y="186.5954"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9303" y="185.6502"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5987" y="184.9818"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5033" y="184.6258"/>
					</TrackLine>
					<TrackLine>
						<End x="195.1143" y="184.0148"/>
					</TrackLine>
					<TrackLine>
						<End x="195.1143" y="182.8698"/>
					</TrackLine>
					<TrackLine>
						<End x="195.4058" y="182.1659"/>
					</TrackLine>
					<TrackLine>
						<End x="195.5992" y="181.7437"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6473" y="181.6276"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6473" y="180.458"/>
					</TrackLine>
					<TrackLine>
						<End x="195.363" y="179.546"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0368" y="173.7971"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0368" y="172.5527"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0368" y="171.3067"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2043" y="170.7549"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2043" y="169.4523"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5074" y="165.7737"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5074" y="164.0645"/>
					</TrackLine>
					<TrackLine>
						<End x="194.8459" y="163.0636"/>
					</TrackLine>
					<TrackLine>
						<End x="194.8459" y="161.5919"/>
					</TrackLine>
					<TrackLine>
						<End x="194.8535" y="159.0534"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0554" y="158.5659"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2384" y="158.3828"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3613" y="158.0861"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3669" y="156.6155"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6208" y="155.5977"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6795" y="154.1377"/>
					</TrackLine>
					<TrackLine>
						<End x="195.9021" y="152.8675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.25">
					<Start x="195.9021" y="152.8675"/>
					<TrackLine>
						<End x="197.4398" y="152.2191"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.25">
					<Start x="139.446" y="154.5896"/>
					<TrackLine>
						<End x="154.2134" y="153.4486"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="153.4028"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.25">
					<Start x="178.054" y="152.3236"/>
					<TrackLine>
						<End x="192.8214" y="151.1826"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7666" y="151.1826"/>
					</TrackLine>
					<TrackLine>
						<End x="195.9021" y="152.8675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A0"/>
				<Subwire width="0.25">
					<Start x="178.054" y="149.7836"/>
					<TrackLine>
						<End x="192.8214" y="148.6426"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7666" y="148.6426"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4398" y="149.6791"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A0"/>
				<Subwire width="0.25">
					<Start x="194.0713" y="201.3628"/>
					<TrackLine>
						<End x="195.1143" y="199.2548"/>
					</TrackLine>
					<TrackLine>
						<End x="195.1143" y="198.1098"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2123" y="196.7554"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2553" y="185.4378"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6473" y="184.1676"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6473" y="182.9758"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8577" y="182.4679"/>
					</TrackLine>
					<TrackLine>
						<End x="196.051" y="182.0456"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1803" y="181.7336"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1803" y="180.352"/>
					</TrackLine>
					<TrackLine>
						<End x="195.9671" y="179.4258"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6678" y="173.6451"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6678" y="172.4007"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6678" y="171.4587"/>
					</TrackLine>
					<TrackLine>
						<End x="195.7795" y="170.8693"/>
					</TrackLine>
					<TrackLine>
						<End x="195.7795" y="169.3379"/>
					</TrackLine>
					<TrackLine>
						<End x="195.113" y="165.6532"/>
					</TrackLine>
					<TrackLine>
						<End x="195.113" y="164.185"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3669" y="163.1672"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3669" y="161.6955"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3725" y="159.1566"/>
					</TrackLine>
					<TrackLine>
						<End x="195.4954" y="158.8599"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6784" y="158.6768"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8803" y="158.1893"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8879" y="156.7191"/>
					</TrackLine>
					<TrackLine>
						<End x="196.2264" y="155.7182"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3046" y="154.2889"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9696" y="153.6239"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9124" y="153.3601"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5808" y="152.6917"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5808" y="151.7465"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4398" y="149.6791"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A0"/>
				<Subwire width="0.25">
					<Start x="139.446" y="152.0496"/>
					<TrackLine>
						<End x="154.2134" y="150.9086"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6421" y="150.8628"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="19200"/>
				<Subwire width="0.25">
					<Start x="136.0742" y="216.9923"/>
					<TrackLine>
						<End x="143.0231" y="212.9691"/>
					</TrackLine>
					<TrackLine>
						<End x="143.1199" y="212.929"/>
					</TrackLine>
					<TrackLine>
						<End x="144.1153" y="212.929"/>
					</TrackLine>
					<TrackLine>
						<End x="144.7109" y="212.3334"/>
					</TrackLine>
					<TrackLine>
						<End x="145.0782" y="211.1807"/>
					</TrackLine>
					<TrackLine>
						<End x="145.1561" y="210.9926"/>
					</TrackLine>
					<TrackLine>
						<End x="146.8502" y="209.2645"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="1200"/>
				<Subwire width="0.25">
					<Start x="136.0742" y="219.5323"/>
					<TrackLine>
						<End x="144.1668" y="218.1333"/>
					</TrackLine>
					<TrackLine>
						<End x="146.8502" y="216.8845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="600"/>
				<Subwire width="0.25">
					<Start x="143.6942" y="219.5323"/>
					<TrackLine>
						<End x="146.8502" y="219.4245"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="150"/>
				<Subwire width="0.25">
					<Start x="143.6942" y="222.0723"/>
					<TrackLine>
						<End x="146.8502" y="224.5045"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12"/>
				<Subwire width="0.25">
					<Start x="126.238" y="227.584"/>
					<TrackLine>
						<End x="125.728" y="227.074"/>
					</TrackLine>
					<TrackLine>
						<End x="125.603" y="227.074"/>
					</TrackLine>
					<TrackLine>
						<End x="125.5512" y="227.074"/>
					</TrackLine>
					<TrackLine>
						<End x="125.2799" y="226.9568"/>
					</TrackLine>
					<TrackLine>
						<End x="124.3252" y="226.0021"/>
					</TrackLine>
					<TrackLine>
						<End x="117.9399" y="218.7947"/>
					</TrackLine>
					<TrackLine>
						<End x="117.862" y="218.6066"/>
					</TrackLine>
					<TrackLine>
						<End x="114.554" y="153.162"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+12"/>
				<Subwire width="0.25">
					<Start x="133.858" y="227.584"/>
					<TrackLine>
						<End x="127.0826" y="226.568"/>
					</TrackLine>
					<TrackLine>
						<End x="127.0311" y="226.5673"/>
					</TrackLine>
					<TrackLine>
						<End x="125.6637" y="226.5673"/>
					</TrackLine>
					<TrackLine>
						<End x="125.5669" y="226.5272"/>
					</TrackLine>
					<TrackLine>
						<End x="124.7548" y="225.7151"/>
					</TrackLine>
					<TrackLine>
						<End x="118.493" y="218.4554"/>
					</TrackLine>
					<TrackLine>
						<End x="115.8474" y="152.6334"/>
					</TrackLine>
					<TrackLine>
						<End x="114.554" y="149.352"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETU6_28"/>
				<Subwire width="0.25">
					<Start x="126.746" y="188.468"/>
					<TrackLine>
						<End x="127.887" y="190.5354"/>
					</TrackLine>
					<TrackLine>
						<End x="133.225" y="201.6406"/>
					</TrackLine>
					<TrackLine>
						<End x="133.8934" y="202.309"/>
					</TrackLine>
					<TrackLine>
						<End x="134.8386" y="202.309"/>
					</TrackLine>
					<TrackLine>
						<End x="155.1586" y="201.293"/>
					</TrackLine>
					<TrackLine>
						<End x="155.827" y="200.6246"/>
					</TrackLine>
					<TrackLine>
						<End x="156.0373" y="198.2891"/>
					</TrackLine>
					<TrackLine>
						<End x="156.8366" y="193.3681"/>
					</TrackLine>
					<TrackLine>
						<End x="157.2993" y="190.9458"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9677" y="190.2774"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2077" y="190.2774"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1529" y="190.2774"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8213" y="190.9458"/>
					</TrackLine>
					<TrackLine>
						<End x="175.2992" y="193.3651"/>
					</TrackLine>
					<TrackLine>
						<End x="175.2992" y="194.5517"/>
					</TrackLine>
					<TrackLine>
						<End x="175.2446" y="194.6836"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6803" y="196.4984"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NETU6_15"/>
				<Subwire width="0.25">
					<Start x="126.238" y="225.044"/>
					<TrackLine>
						<End x="133.3854" y="218.823"/>
					</TrackLine>
					<TrackLine>
						<End x="136.5468" y="218.1333"/>
					</TrackLine>
					<TrackLine>
						<End x="143.2731" y="213.4356"/>
					</TrackLine>
					<TrackLine>
						<End x="144.2685" y="213.4356"/>
					</TrackLine>
					<TrackLine>
						<End x="144.3653" y="213.3955"/>
					</TrackLine>
					<TrackLine>
						<End x="145.1774" y="212.5834"/>
					</TrackLine>
					<TrackLine>
						<End x="145.7092" y="211.3319"/>
					</TrackLine>
					<TrackLine>
						<End x="146.3776" y="210.6635"/>
					</TrackLine>
					<TrackLine>
						<End x="147.3228" y="210.4055"/>
					</TrackLine>
					<TrackLine>
						<End x="153.7028" y="205.5043"/>
					</TrackLine>
					<TrackLine>
						<End x="154.4503" y="204.7568"/>
					</TrackLine>
					<TrackLine>
						<End x="156.3801" y="200.9639"/>
					</TrackLine>
					<TrackLine>
						<End x="156.458" y="200.7758"/>
					</TrackLine>
					<TrackLine>
						<End x="156.6683" y="198.4146"/>
					</TrackLine>
					<TrackLine>
						<End x="157.3834" y="193.5206"/>
					</TrackLine>
					<TrackLine>
						<End x="158.4403" y="191.4184"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IORQ"/>
				<Subwire width="0.25">
					<Start x="178.8313" y="178.5028"/>
					<TrackLine>
						<End x="179.9723" y="180.5702"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="181.5154"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9723" y="189.1354"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3039" y="189.8038"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3587" y="190.0618"/>
					</TrackLine>
					<TrackLine>
						<End x="177.6903" y="190.7302"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2124" y="193.1495"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2124" y="194.9323"/>
					</TrackLine>
					<TrackLine>
						<End x="176.4283" y="198.0735"/>
					</TrackLine>
					<TrackLine>
						<End x="176.3333" y="202.3774"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7199" y="207.8591"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7067" y="207.9257"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7067" y="210.0399"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7328" y="211.3024"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7328" y="212.1744"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7067" y="213.0057"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7067" y="214.7035"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6803" y="216.8184"/>
					</TrackLine>
				</Subwire>
			</Wire>
		</Wires>
	</Connectivity>

	<Settings version="1.3">
		<Autoroute
		 weakCheck="on"/>
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
				<LayerRef name="TopPaste"/>
				<Colors details="#af583a" pads="#8c462e" fix="#af583a"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopSilk"/>
				<Colors details="#50281b" pads="#402015" fix="#50281b"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopMask"/>
				<Colors details="#b15738" pads="#8d452c" fix="#b15738"/>
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
				<LayerRef name="BotMask"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotSilk"/>
				<Colors details="#122e1c" pads="#0e2416" fix="#122e1c"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotPaste"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotAssy"/>
				<Colors details="#00aaaa" pads="#00aaaa" fix="#006666"/>
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