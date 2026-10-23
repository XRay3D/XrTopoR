<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : Arcs_standard_routing.fst      -->
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
		<OriginalFile>.\ADP_SPEC.pcb</OriginalFile>
		<Units dist="mm" time="ps"/>
	</Header>

	<Layers version="1.1">
		<StackUpLayers>
			<Layer name="TopAssy" type="Assy" compsOutline="on"/>
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
		<TextStyle name="(Default)" fontName="QUALITY" height="2.54"/>
		<TextStyle name="(DefaultTTF)" fontName="Arial" height="3.175"/>
		<TextStyle name="T:H236W23" fontName="QUALITY" height="6"/>
		<TextStyle name="T:H39W3" fontName="QUALITY" height="1"/>
		<TextStyle name="T:H19W1" fontName="QUALITY" height="0.5"/>
		<TextStyle name="T:H49W4" fontName="QUALITY" height="1.25"/>
		<TextStyle name="T:H25W2" fontName="QUALITY" height="0.64"/>
		<TextStyle name="T:H68W6" fontName="QUALITY" height="1.75"/>
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
			<Padstack name="C140R.PS" holeDiameter="0.508" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.4">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.4">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.4">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.4">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="C150S.PS" holeDiameter="0.508" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.5" height="1.5">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="1.5" height="1.5">
						<LayerRef name="Bottom"/>
					</PadRect>
					<PadRect width="1.5" height="1.5">
						<LayerTypeRef type="Signal"/>
					</PadRect>
					<PadRect width="1.5" height="1.5">
						<LayerTypeRef type="Plane"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="N150S.PS" holeDiameter="0.5" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.5" height="1.5">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="1.5" height="1.5">
						<LayerRef name="Bottom"/>
					</PadRect>
					<PadRect width="1.5" height="1.5">
						<LayerTypeRef type="Signal"/>
					</PadRect>
					<PadRect width="1.5" height="1.5">
						<LayerTypeRef type="Plane"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="C150R.PS" holeDiameter="0.508" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.5">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.5">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.5">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.5">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="N150R.PS" holeDiameter="0.5" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.5">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.5">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.5">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.5">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="C200L.PS" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="2" height="5.6">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="C35LH.PS" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadOval diameter="0.3">
						<LayerRef name="Top"/>
						<Stretch x="1.6" y="0"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="C35LV.PS" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadOval diameter="0.3">
						<LayerRef name="Top"/>
						<Stretch x="0" y="1.6"/>
					</PadOval>
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
			<Viastack name="C140R.PS" holeDiameter="0.6">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.4">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.4">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.4">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
		</Viastacks>
		<Footprints>
			<Footprint name="K559IP3_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C150S.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="N150R.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="N150R.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C150R.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="7.5"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="N150R.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="N150R.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C150R.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="Љ559€Џ3">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H49W4"/>
						<Org x="8.65" y="5.63"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="4.75"/>
							<Dot x="-1" y="3.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="3.75"/>
							<Dot x="-2" y="2.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="0.5"/>
							<Dot x="19.5" y="0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="19.5" y="0.5"/>
							<Dot x="19.5" y="6.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="19.5" y="6.75"/>
							<Dot x="-2" y="6.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="6.75"/>
							<Dot x="-2" y="0.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="K559IP3_2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="N150S.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="N150R.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="N150R.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="N150R.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C150R.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="7.5"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C150R.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="N150R.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C150R.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="Љ559€Џ3">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H49W4"/>
						<Org x="8.65" y="5.63"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="4.75"/>
							<Dot x="-1" y="3.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="3.75"/>
							<Dot x="-2" y="2.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="0.5"/>
							<Dot x="19.5" y="0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="19.5" y="0.5"/>
							<Dot x="19.5" y="6.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="19.5" y="6.75"/>
							<Dot x="-2" y="6.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="6.75"/>
							<Dot x="-2" y="0.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="NR-10_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C150S.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C150R.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C150R.PS"/>
						<Org x="20" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C150R.PS"/>
						<Org x="22.5" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="Ќђ1-4-9-0,125">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H49W4"/>
						<Org x="11.15" y="0.38"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.5" y="-1.5"/>
							<Dot x="24" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="24" y="-1.5"/>
							<Dot x="24" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="24" y="1.5"/>
							<Dot x="-1.5" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.5" y="1.5"/>
							<Dot x="-1.5" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.5" y="1"/>
							<Dot x="-0.5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.5" y="0"/>
							<Dot x="-1.5" y="-1"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="NR-10_2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C150S.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="N150R.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="N150R.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="N150R.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="N150R.PS"/>
						<Org x="20" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C150R.PS"/>
						<Org x="22.5" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="Ќђ1-4-9-0,125">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H49W4"/>
						<Org x="11.15" y="0.38"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.5" y="-1.5"/>
							<Dot x="24" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="24" y="-1.5"/>
							<Dot x="24" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="24" y="1.5"/>
							<Dot x="-1.5" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.5" y="1.5"/>
							<Dot x="-1.5" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.5" y="1"/>
							<Dot x="-0.5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.5" y="0"/>
							<Dot x="-1.5" y="-1"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="NR-10_3">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C150S.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="N150R.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="N150R.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="N150R.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="N150R.PS"/>
						<Org x="20" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="N150R.PS"/>
						<Org x="22.5" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="Ќђ1-4-9-0,125">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H49W4"/>
						<Org x="11.15" y="0.38"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.5" y="-1.5"/>
							<Dot x="24" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="24" y="-1.5"/>
							<Dot x="24" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="24" y="1.5"/>
							<Dot x="-1.5" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.5" y="1.5"/>
							<Dot x="-1.5" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.5" y="1"/>
							<Dot x="-0.5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.5" y="0"/>
							<Dot x="-1.5" y="-1"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SL_A31_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C200L.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C200L.PS"/>
						<Org x="-2.54" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C200L.PS"/>
						<Org x="-5.08" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C200L.PS"/>
						<Org x="-7.62" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C200L.PS"/>
						<Org x="-10.16" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C200L.PS"/>
						<Org x="-12.7" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C200L.PS"/>
						<Org x="-15.24" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C200L.PS"/>
						<Org x="-17.78" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C200L.PS"/>
						<Org x="-20.32" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C200L.PS"/>
						<Org x="-22.86" y="0"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C200L.PS"/>
						<Org x="-25.4" y="0"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C200L.PS"/>
						<Org x="-27.94" y="0"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="C200L.PS"/>
						<Org x="-30.48" y="0"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C200L.PS"/>
						<Org x="-33.02" y="0"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C200L.PS"/>
						<Org x="-35.56" y="0"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C200L.PS"/>
						<Org x="-38.1" y="0"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="C200L.PS"/>
						<Org x="-40.64" y="0"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="C200L.PS"/>
						<Org x="-43.18" y="0"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="C200L.PS"/>
						<Org x="-45.72" y="0"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="C200L.PS"/>
						<Org x="-48.26" y="0"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="C200L.PS"/>
						<Org x="-50.8" y="0"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="C200L.PS"/>
						<Org x="-53.34" y="0"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="C200L.PS"/>
						<Org x="-55.88" y="0"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="C200L.PS"/>
						<Org x="-58.42" y="0"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="C200L.PS"/>
						<Org x="-60.96" y="0"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="C200L.PS"/>
						<Org x="-63.5" y="0"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="C200L.PS"/>
						<Org x="-66.04" y="0"/>
					</Pad>
					<Pad padNum="28" name="28">
						<PadstackRef name="C200L.PS"/>
						<Org x="-68.58" y="0"/>
					</Pad>
					<Pad padNum="29" name="29">
						<PadstackRef name="C200L.PS"/>
						<Org x="-71.12" y="0"/>
					</Pad>
					<Pad padNum="30" name="30">
						<PadstackRef name="C200L.PS"/>
						<Org x="-73.66" y="0"/>
					</Pad>
					<Pad padNum="31" name="31">
						<PadstackRef name="C200L.PS"/>
						<Org x="-76.2" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2.54" y="0"/>
							<Dot x="-73.66" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-76.2" y="-1.27"/>
							<Dot x="-76.2" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-77.47" y="0"/>
							<Dot x="-74.93" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.27" y="0"/>
							<Dot x="1.27" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="-1.27"/>
							<Dot x="0" y="1.27"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="CABL10_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C150R.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C150R.PS"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.54" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="N150R.PS"/>
						<Org x="2.54" y="-2.54"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C150R.PS"/>
						<Org x="5.08" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C150R.PS"/>
						<Org x="5.08" y="-2.54"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="N150R.PS"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="N150R.PS"/>
						<Org x="7.62" y="-2.54"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="N150R.PS"/>
						<Org x="10.16" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C150R.PS"/>
						<Org x="10.16" y="-2.54"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="1">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="-2" y="0"/>
					</Text>
					<Text text="2">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="-2" y="-2.5"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2.54" y="-3.81"/>
							<Dot x="12.7" y="-3.81"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="12.7" y="-3.81"/>
							<Dot x="12.7" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="12.7" y="1.27"/>
							<Dot x="-2.54" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2.54" y="1.27"/>
							<Dot x="-2.54" y="-3.81"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.27" y="-1.27"/>
							<Dot x="12.7" y="-1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.27" y="-3.81"/>
							<Dot x="-1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="1.27" y="-3.81"/>
							<Dot x="1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.81" y="-3.81"/>
							<Dot x="3.81" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="6.35" y="-3.81"/>
							<Dot x="6.35" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="8.89" y="-3.81"/>
							<Dot x="8.89" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="11.43" y="-3.81"/>
							<Dot x="11.43" y="1.27"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="K1533AP6_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C150S.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C150R.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C150R.PS"/>
						<Org x="20" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C150R.PS"/>
						<Org x="22.5" y="0"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C150R.PS"/>
						<Org x="22.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C150R.PS"/>
						<Org x="20" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C150R.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="C150R.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="Љђ1533AЏ6">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H49W4"/>
						<Org x="11.4" y="5.63"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="0.5"/>
							<Dot x="23.5" y="0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="23.5" y="0.5"/>
							<Dot x="23.5" y="7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="23.5" y="7"/>
							<Dot x="-1" y="7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="7"/>
							<Dot x="-1" y="0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="4.75"/>
							<Dot x="0" y="3.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="3.75"/>
							<Dot x="-1" y="2.75"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="CABL40_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C150R.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C150R.PS"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.54" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.54" y="-2.54"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C150R.PS"/>
						<Org x="5.08" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C150R.PS"/>
						<Org x="5.08" y="-2.54"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.62" y="-2.54"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C150R.PS"/>
						<Org x="10.16" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C150R.PS"/>
						<Org x="10.16" y="-2.54"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.7" y="0"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.7" y="-2.54"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="C150R.PS"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C150R.PS"/>
						<Org x="15.24" y="-2.54"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.78" y="0"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.78" y="-2.54"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="C150R.PS"/>
						<Org x="20.32" y="0"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="C150R.PS"/>
						<Org x="20.32" y="-2.54"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="C150R.PS"/>
						<Org x="22.86" y="0"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="C150R.PS"/>
						<Org x="22.86" y="-2.54"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="C150R.PS"/>
						<Org x="25.4" y="0"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="C150R.PS"/>
						<Org x="25.4" y="-2.54"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="C150R.PS"/>
						<Org x="27.94" y="0"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="C150R.PS"/>
						<Org x="27.94" y="-2.54"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="C150R.PS"/>
						<Org x="30.48" y="0"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="N150R.PS"/>
						<Org x="30.48" y="-2.54"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="C150R.PS"/>
						<Org x="33.02" y="0"/>
					</Pad>
					<Pad padNum="28" name="28">
						<PadstackRef name="N150R.PS"/>
						<Org x="33.02" y="-2.54"/>
					</Pad>
					<Pad padNum="29" name="29">
						<PadstackRef name="C150R.PS"/>
						<Org x="35.56" y="0"/>
					</Pad>
					<Pad padNum="30" name="30">
						<PadstackRef name="C150R.PS"/>
						<Org x="35.56" y="-2.54"/>
					</Pad>
					<Pad padNum="31" name="31">
						<PadstackRef name="C150R.PS"/>
						<Org x="38.1" y="0"/>
					</Pad>
					<Pad padNum="32" name="32">
						<PadstackRef name="N150R.PS"/>
						<Org x="38.1" y="-2.54"/>
					</Pad>
					<Pad padNum="33" name="33">
						<PadstackRef name="C150R.PS"/>
						<Org x="40.64" y="0"/>
					</Pad>
					<Pad padNum="34" name="34">
						<PadstackRef name="C150R.PS"/>
						<Org x="40.64" y="-2.54"/>
					</Pad>
					<Pad padNum="35" name="35">
						<PadstackRef name="C150R.PS"/>
						<Org x="43.18" y="0"/>
					</Pad>
					<Pad padNum="36" name="36">
						<PadstackRef name="C150R.PS"/>
						<Org x="43.18" y="-2.54"/>
					</Pad>
					<Pad padNum="37" name="37">
						<PadstackRef name="N150R.PS"/>
						<Org x="45.72" y="0"/>
					</Pad>
					<Pad padNum="38" name="38">
						<PadstackRef name="N150R.PS"/>
						<Org x="45.72" y="-2.54"/>
					</Pad>
					<Pad padNum="39" name="39">
						<PadstackRef name="N150R.PS"/>
						<Org x="48.26" y="0"/>
					</Pad>
					<Pad padNum="40" name="40">
						<PadstackRef name="N150R.PS"/>
						<Org x="48.26" y="-2.54"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="1">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="-2" y="0"/>
					</Text>
					<Text text="2">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="-2" y="-2.5"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2.54" y="-3.81"/>
							<Dot x="50.8" y="-3.81"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="50.8" y="-3.81"/>
							<Dot x="50.8" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="50.8" y="1.27"/>
							<Dot x="-2.54" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2.54" y="1.27"/>
							<Dot x="-2.54" y="-3.81"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.27" y="-1.27"/>
							<Dot x="49.53" y="-1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.27" y="-3.81"/>
							<Dot x="-1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="1.27" y="-3.81"/>
							<Dot x="1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.81" y="-3.81"/>
							<Dot x="3.81" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="6.35" y="-3.81"/>
							<Dot x="6.35" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="8.89" y="-3.81"/>
							<Dot x="8.89" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="11.43" y="-3.81"/>
							<Dot x="11.43" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="13.97" y="-3.81"/>
							<Dot x="13.97" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="16.51" y="-3.81"/>
							<Dot x="16.51" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="19.05" y="-3.81"/>
							<Dot x="19.05" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="21.59" y="-3.81"/>
							<Dot x="21.59" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="24.13" y="-3.81"/>
							<Dot x="24.13" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="26.67" y="-3.81"/>
							<Dot x="26.67" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="29.21" y="-3.81"/>
							<Dot x="29.21" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="31.75" y="-3.81"/>
							<Dot x="31.75" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="34.29" y="-3.81"/>
							<Dot x="34.29" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="36.83" y="-3.81"/>
							<Dot x="36.83" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="39.37" y="-3.81"/>
							<Dot x="39.37" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="41.91" y="-3.81"/>
							<Dot x="41.91" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="44.45" y="-3.81"/>
							<Dot x="44.45" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="46.99" y="-3.81"/>
							<Dot x="46.99" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="49.53" y="-3.81"/>
							<Dot x="49.53" y="1.27"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="K17B-2_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C150R.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="K10-17">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="1.25" y="1.25"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="-2.5"/>
							<Dot x="7" y="-2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="7" y="-2.5"/>
							<Dot x="7" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="7" y="2.5"/>
							<Dot x="-2" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="2.5"/>
							<Dot x="-2" y="-2.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SL_B31_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C200L.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C200L.PS"/>
						<Org x="2.54" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C200L.PS"/>
						<Org x="5.08" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C200L.PS"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C200L.PS"/>
						<Org x="10.16" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C200L.PS"/>
						<Org x="12.7" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C200L.PS"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C200L.PS"/>
						<Org x="17.78" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C200L.PS"/>
						<Org x="20.32" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C200L.PS"/>
						<Org x="22.86" y="0"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C200L.PS"/>
						<Org x="25.4" y="0"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C200L.PS"/>
						<Org x="27.94" y="0"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="C200L.PS"/>
						<Org x="30.48" y="0"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C200L.PS"/>
						<Org x="33.02" y="0"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C200L.PS"/>
						<Org x="35.56" y="0"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C200L.PS"/>
						<Org x="38.1" y="0"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="C200L.PS"/>
						<Org x="40.64" y="0"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="C200L.PS"/>
						<Org x="43.18" y="0"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="C200L.PS"/>
						<Org x="45.72" y="0"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="C200L.PS"/>
						<Org x="48.26" y="0"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="C200L.PS"/>
						<Org x="50.8" y="0"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="C200L.PS"/>
						<Org x="53.34" y="0"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="C200L.PS"/>
						<Org x="55.88" y="0"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="C200L.PS"/>
						<Org x="58.42" y="0"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="C200L.PS"/>
						<Org x="60.96" y="0"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="C200L.PS"/>
						<Org x="63.5" y="0"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="C200L.PS"/>
						<Org x="66.04" y="0"/>
					</Pad>
					<Pad padNum="28" name="28">
						<PadstackRef name="C200L.PS"/>
						<Org x="68.58" y="0"/>
					</Pad>
					<Pad padNum="29" name="29">
						<PadstackRef name="C200L.PS"/>
						<Org x="71.12" y="0"/>
					</Pad>
					<Pad padNum="30" name="30">
						<PadstackRef name="C200L.PS"/>
						<Org x="73.66" y="0"/>
					</Pad>
					<Pad padNum="31" name="31">
						<PadstackRef name="C200L.PS"/>
						<Org x="76.2" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="73.66" y="0"/>
							<Dot x="2.54" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="-1.27"/>
							<Dot x="0" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.27" y="0"/>
							<Dot x="1.27" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="74.93" y="0"/>
							<Dot x="77.47" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="76.2" y="-1.27"/>
							<Dot x="76.2" y="1.27"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="BotSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="7128100_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="20.5"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="19.85"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="19.2"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="18.55"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="17.9"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="17.25"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="16.6"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="15.95"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="15.3"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="14.65"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="14"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="13.35"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="12.7"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="12.05"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="11.4"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="10.75"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="10.1"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="9.45"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="8.8"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="8.15"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="7.5"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="6.85"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="6.2"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="5.55"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="4.9"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="4.25"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="3.6"/>
					</Pad>
					<Pad padNum="28" name="28">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="2.95"/>
					</Pad>
					<Pad padNum="29" name="29">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="2.3"/>
					</Pad>
					<Pad padNum="30" name="30">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="1.65"/>
					</Pad>
					<Pad padNum="31" name="31">
						<PadstackRef name="C35LV.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="32" name="32">
						<PadstackRef name="C35LV.PS"/>
						<Org x="0.65" y="0"/>
					</Pad>
					<Pad padNum="33" name="33">
						<PadstackRef name="C35LV.PS"/>
						<Org x="1.3" y="0"/>
					</Pad>
					<Pad padNum="34" name="34">
						<PadstackRef name="C35LV.PS"/>
						<Org x="1.95" y="0"/>
					</Pad>
					<Pad padNum="35" name="35">
						<PadstackRef name="C35LV.PS"/>
						<Org x="2.6" y="0"/>
					</Pad>
					<Pad padNum="36" name="36">
						<PadstackRef name="C35LV.PS"/>
						<Org x="3.25" y="0"/>
					</Pad>
					<Pad padNum="37" name="37">
						<PadstackRef name="C35LV.PS"/>
						<Org x="3.9" y="0"/>
					</Pad>
					<Pad padNum="38" name="38">
						<PadstackRef name="C35LV.PS"/>
						<Org x="4.55" y="0"/>
					</Pad>
					<Pad padNum="39" name="39">
						<PadstackRef name="C35LV.PS"/>
						<Org x="5.2" y="0"/>
					</Pad>
					<Pad padNum="40" name="40">
						<PadstackRef name="C35LV.PS"/>
						<Org x="5.85" y="0"/>
					</Pad>
					<Pad padNum="41" name="41">
						<PadstackRef name="C35LV.PS"/>
						<Org x="6.5" y="0"/>
					</Pad>
					<Pad padNum="42" name="42">
						<PadstackRef name="C35LV.PS"/>
						<Org x="7.15" y="0"/>
					</Pad>
					<Pad padNum="43" name="43">
						<PadstackRef name="C35LV.PS"/>
						<Org x="7.8" y="0"/>
					</Pad>
					<Pad padNum="44" name="44">
						<PadstackRef name="C35LV.PS"/>
						<Org x="8.45" y="0"/>
					</Pad>
					<Pad padNum="45" name="45">
						<PadstackRef name="C35LV.PS"/>
						<Org x="9.1" y="0"/>
					</Pad>
					<Pad padNum="46" name="46">
						<PadstackRef name="C35LV.PS"/>
						<Org x="9.75" y="0"/>
					</Pad>
					<Pad padNum="47" name="47">
						<PadstackRef name="C35LV.PS"/>
						<Org x="10.4" y="0"/>
					</Pad>
					<Pad padNum="48" name="48">
						<PadstackRef name="C35LV.PS"/>
						<Org x="11.05" y="0"/>
					</Pad>
					<Pad padNum="49" name="49">
						<PadstackRef name="C35LV.PS"/>
						<Org x="11.7" y="0"/>
					</Pad>
					<Pad padNum="50" name="50">
						<PadstackRef name="C35LV.PS"/>
						<Org x="12.35" y="0"/>
					</Pad>
					<Pad padNum="51" name="51">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="1.65"/>
					</Pad>
					<Pad padNum="52" name="52">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="2.3"/>
					</Pad>
					<Pad padNum="53" name="53">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="2.95"/>
					</Pad>
					<Pad padNum="54" name="54">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="3.6"/>
					</Pad>
					<Pad padNum="55" name="55">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="4.25"/>
					</Pad>
					<Pad padNum="56" name="56">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="4.9"/>
					</Pad>
					<Pad padNum="57" name="57">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="5.55"/>
					</Pad>
					<Pad padNum="58" name="58">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="6.2"/>
					</Pad>
					<Pad padNum="59" name="59">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="6.85"/>
					</Pad>
					<Pad padNum="60" name="60">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="7.5"/>
					</Pad>
					<Pad padNum="61" name="61">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="8.15"/>
					</Pad>
					<Pad padNum="62" name="62">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="8.8"/>
					</Pad>
					<Pad padNum="63" name="63">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="9.45"/>
					</Pad>
					<Pad padNum="64" name="64">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="10.1"/>
					</Pad>
					<Pad padNum="65" name="65">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="10.75"/>
					</Pad>
					<Pad padNum="66" name="66">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="11.4"/>
					</Pad>
					<Pad padNum="67" name="67">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="12.05"/>
					</Pad>
					<Pad padNum="68" name="68">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="12.7"/>
					</Pad>
					<Pad padNum="69" name="69">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="13.35"/>
					</Pad>
					<Pad padNum="70" name="70">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="14"/>
					</Pad>
					<Pad padNum="71" name="71">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="14.65"/>
					</Pad>
					<Pad padNum="72" name="72">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="15.3"/>
					</Pad>
					<Pad padNum="73" name="73">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="15.95"/>
					</Pad>
					<Pad padNum="74" name="74">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="16.6"/>
					</Pad>
					<Pad padNum="75" name="75">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="17.25"/>
					</Pad>
					<Pad padNum="76" name="76">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="17.9"/>
					</Pad>
					<Pad padNum="77" name="77">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="18.55"/>
					</Pad>
					<Pad padNum="78" name="78">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="19.2"/>
					</Pad>
					<Pad padNum="79" name="79">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="19.85"/>
					</Pad>
					<Pad padNum="80" name="80">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="20.5"/>
					</Pad>
					<Pad padNum="81" name="81">
						<PadstackRef name="C35LV.PS"/>
						<Org x="12.35" y="22.1"/>
					</Pad>
					<Pad padNum="82" name="82">
						<PadstackRef name="C35LV.PS"/>
						<Org x="11.7" y="22.1"/>
					</Pad>
					<Pad padNum="83" name="83">
						<PadstackRef name="C35LV.PS"/>
						<Org x="11.05" y="22.1"/>
					</Pad>
					<Pad padNum="84" name="84">
						<PadstackRef name="C35LV.PS"/>
						<Org x="10.4" y="22.1"/>
					</Pad>
					<Pad padNum="85" name="85">
						<PadstackRef name="C35LV.PS"/>
						<Org x="9.75" y="22.1"/>
					</Pad>
					<Pad padNum="86" name="86">
						<PadstackRef name="C35LV.PS"/>
						<Org x="9.1" y="22.1"/>
					</Pad>
					<Pad padNum="87" name="87">
						<PadstackRef name="C35LV.PS"/>
						<Org x="8.45" y="22.1"/>
					</Pad>
					<Pad padNum="88" name="88">
						<PadstackRef name="C35LV.PS"/>
						<Org x="7.8" y="22.1"/>
					</Pad>
					<Pad padNum="89" name="89">
						<PadstackRef name="C35LV.PS"/>
						<Org x="7.15" y="22.1"/>
					</Pad>
					<Pad padNum="90" name="90">
						<PadstackRef name="C35LV.PS"/>
						<Org x="6.5" y="22.1"/>
					</Pad>
					<Pad padNum="91" name="91">
						<PadstackRef name="C35LV.PS"/>
						<Org x="5.85" y="22.1"/>
					</Pad>
					<Pad padNum="92" name="92">
						<PadstackRef name="C35LV.PS"/>
						<Org x="5.2" y="22.1"/>
					</Pad>
					<Pad padNum="93" name="93">
						<PadstackRef name="C35LV.PS"/>
						<Org x="4.55" y="22.1"/>
					</Pad>
					<Pad padNum="94" name="94">
						<PadstackRef name="C35LV.PS"/>
						<Org x="3.9" y="22.1"/>
					</Pad>
					<Pad padNum="95" name="95">
						<PadstackRef name="C35LV.PS"/>
						<Org x="3.25" y="22.1"/>
					</Pad>
					<Pad padNum="96" name="96">
						<PadstackRef name="C35LV.PS"/>
						<Org x="2.6" y="22.1"/>
					</Pad>
					<Pad padNum="97" name="97">
						<PadstackRef name="C35LV.PS"/>
						<Org x="1.95" y="22.1"/>
					</Pad>
					<Pad padNum="98" name="98">
						<PadstackRef name="C35LV.PS"/>
						<Org x="1.3" y="22.1"/>
					</Pad>
					<Pad padNum="99" name="99">
						<PadstackRef name="C35LV.PS"/>
						<Org x="0.65" y="22.1"/>
					</Pad>
					<Pad padNum="100" name="100">
						<PadstackRef name="C35LV.PS"/>
						<Org x="0" y="22.1"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="7128100">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H68W6"/>
						<Org x="5.85" y="17.55"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="12.35" y="1"/>
							<Dot x="12.35" y="-0.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="13.2" y="1.65"/>
							<Dot x="14.95" y="1.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="13.2" y="20.5"/>
							<Dot x="14.95" y="20.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="12.35" y="21.1"/>
							<Dot x="12.35" y="22.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.9" y="20.5"/>
							<Dot x="-2.6" y="20.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="21.1"/>
							<Dot x="0" y="22.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="1"/>
							<Dot x="0" y="-0.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.9" y="1"/>
							<Dot x="13.2" y="1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="13.2" y="1"/>
							<Dot x="13.2" y="21.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="13.2" y="21.1"/>
							<Dot x="-0.9" y="21.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.9" y="21.1"/>
							<Dot x="-0.9" y="1"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="K559IP15_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C150S.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C150R.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C150R.PS"/>
						<Org x="20" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C150R.PS"/>
						<Org x="22.5" y="0"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C150R.PS"/>
						<Org x="22.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C150R.PS"/>
						<Org x="20" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C150R.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="C150R.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="Љђ559€Џ15">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H49W4"/>
						<Org x="11.4" y="5.63"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="0.5"/>
							<Dot x="23.5" y="0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="23.5" y="0.5"/>
							<Dot x="23.5" y="7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="23.5" y="7"/>
							<Dot x="-1" y="7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="7"/>
							<Dot x="-1" y="0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="4.75"/>
							<Dot x="0" y="3.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="3.75"/>
							<Dot x="-1" y="2.75"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="K559IP15_2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="N150S.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C150R.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C150R.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C150R.PS"/>
						<Org x="20" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C150R.PS"/>
						<Org x="22.5" y="0"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C150R.PS"/>
						<Org x="22.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C150R.PS"/>
						<Org x="20" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="C150R.PS"/>
						<Org x="17.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C150R.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C150R.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C150R.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="C150R.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="C150R.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="N150R.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="C150R.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="Љђ559€Џ15">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H49W4"/>
						<Org x="11.4" y="5.63"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="0.5"/>
							<Dot x="23.5" y="0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="23.5" y="0.5"/>
							<Dot x="23.5" y="7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="23.5" y="7"/>
							<Dot x="-1" y="7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="7"/>
							<Dot x="-1" y="0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="4.75"/>
							<Dot x="0" y="3.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="3.75"/>
							<Dot x="-1" y="2.75"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopAssy"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
		</Footprints>
		<Components>
			<Component name="K559IP3_1">
				<Pins>
					<Pin pinNum="1" name="14" pinSymName="DI1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="11" pinSymName="DI2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="5" pinSymName="DI3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="2" pinSymName="DI4" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="7" pinSymName="C1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="9" pinSymName="C2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="13" pinSymName="DO1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="15" pinSymName="B1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="10" pinSymName="DO2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="12" pinSymName="B2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="6" pinSymName="DO3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="4" pinSymName="B3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="3" pinSymName="DO4" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="1" pinSymName="B4" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="15" name="16" pinSymName="16" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="16" name="8" pinSymName="8" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="K559IP3"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="K559IP3"/>
					<Attribute name="PCADIO_LinkName" value="K559IP3"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="K559IP3"/>
				</Attributes>
			</Component>
			<Component name="NR-10_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="4" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="5" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="6" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="7" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="8" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="9" pinSymName="9" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="10" pinSymName="10" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="NR-10"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="NR-10"/>
					<Attribute name="PCADIO_LinkName" value="NR-10"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="NR-10"/>
					<Attribute name="PCADIO_LinkName" value="NR-10"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="NR-10"/>
				</Attributes>
			</Component>
			<Component name="SL_A31_1">
				<Pins>
					<Pin pinNum="1" name="A1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="A2" pinSymName="1" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="3" name="A3" pinSymName="1" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="4" name="A4" pinSymName="1" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="5" name="A5" pinSymName="1" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="6" name="A6" pinSymName="1" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="7" name="A7" pinSymName="1" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="8" name="A8" pinSymName="1" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="9" name="A9" pinSymName="1" pinEqual="1" gate="9" gateEqual="1"/>
					<Pin pinNum="10" name="A10" pinSymName="1" pinEqual="1" gate="10" gateEqual="1"/>
					<Pin pinNum="11" name="A11" pinSymName="1" pinEqual="1" gate="11" gateEqual="1"/>
					<Pin pinNum="12" name="A12" pinSymName="1" pinEqual="1" gate="12" gateEqual="1"/>
					<Pin pinNum="13" name="A13" pinSymName="1" pinEqual="1" gate="13" gateEqual="1"/>
					<Pin pinNum="14" name="A14" pinSymName="1" pinEqual="1" gate="14" gateEqual="1"/>
					<Pin pinNum="15" name="A15" pinSymName="1" pinEqual="1" gate="15" gateEqual="1"/>
					<Pin pinNum="16" name="A16" pinSymName="1" pinEqual="1" gate="16" gateEqual="1"/>
					<Pin pinNum="17" name="A17" pinSymName="1" pinEqual="1" gate="17" gateEqual="1"/>
					<Pin pinNum="18" name="A18" pinSymName="1" pinEqual="1" gate="18" gateEqual="1"/>
					<Pin pinNum="19" name="A19" pinSymName="1" pinEqual="1" gate="19" gateEqual="1"/>
					<Pin pinNum="20" name="A20" pinSymName="1" pinEqual="1" gate="20" gateEqual="1"/>
					<Pin pinNum="21" name="A21" pinSymName="1" pinEqual="1" gate="21" gateEqual="1"/>
					<Pin pinNum="22" name="A22" pinSymName="1" pinEqual="1" gate="22" gateEqual="1"/>
					<Pin pinNum="23" name="A23" pinSymName="1" pinEqual="1" gate="23" gateEqual="1"/>
					<Pin pinNum="24" name="A24" pinSymName="1" pinEqual="1" gate="24" gateEqual="1"/>
					<Pin pinNum="25" name="A25" pinSymName="1" pinEqual="1" gate="25" gateEqual="1"/>
					<Pin pinNum="26" name="A26" pinSymName="1" pinEqual="1" gate="26" gateEqual="1"/>
					<Pin pinNum="27" name="A27" pinSymName="1" pinEqual="1" gate="27" gateEqual="1"/>
					<Pin pinNum="28" name="A28" pinSymName="1" pinEqual="1" gate="28" gateEqual="1"/>
					<Pin pinNum="29" name="A29" pinSymName="1" pinEqual="1" gate="29" gateEqual="1"/>
					<Pin pinNum="30" name="A30" pinSymName="1" pinEqual="1" gate="30" gateEqual="1"/>
					<Pin pinNum="31" name="A31" pinSymName="1" pinEqual="1" gate="31" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SL_A31"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="X"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="SL_A31"/>
				</Attributes>
			</Component>
			<Component name="CABL10_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="1" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="1" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="1" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="1" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="1" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="1" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="1" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="9" name="9" pinSymName="1" pinEqual="1" gate="9" gateEqual="1"/>
					<Pin pinNum="10" name="10" pinSymName="1" pinEqual="1" gate="10" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="CABL10"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="X"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="CABL10"/>
				</Attributes>
			</Component>
			<Component name="K1533AP6_1">
				<Pins>
					<Pin pinNum="1" name="19" pinSymName="EDB" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="1" pinSymName="SEDB" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="2" pinSymName="DB0" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="3" pinSymName="DB1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="4" pinSymName="DB2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="5" pinSymName="DB3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="6" pinSymName="DB4" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="7" pinSymName="DB5" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="8" pinSymName="DB6" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="9" pinSymName="DB7" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="18" pinSymName="DI/O0" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="17" pinSymName="DI/O1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="16" pinSymName="DI/O2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="15" pinSymName="DI/O3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="15" name="14" pinSymName="DI/O4" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="16" name="13" pinSymName="DI/O5" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="17" name="12" pinSymName="DI/O6" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="18" name="11" pinSymName="DI/O7" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="19" name="10" pinSymName="10" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="20" name="20" pinSymName="20" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="K1533AP6"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="K1533AP6"/>
				</Attributes>
			</Component>
			<Component name="CABL40_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="1" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="1" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="1" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="1" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="1" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="1" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="1" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="9" name="9" pinSymName="1" pinEqual="1" gate="9" gateEqual="1"/>
					<Pin pinNum="10" name="10" pinSymName="1" pinEqual="1" gate="10" gateEqual="1"/>
					<Pin pinNum="11" name="11" pinSymName="1" pinEqual="1" gate="11" gateEqual="1"/>
					<Pin pinNum="12" name="12" pinSymName="1" pinEqual="1" gate="12" gateEqual="1"/>
					<Pin pinNum="13" name="13" pinSymName="1" pinEqual="1" gate="13" gateEqual="1"/>
					<Pin pinNum="14" name="14" pinSymName="1" pinEqual="1" gate="14" gateEqual="1"/>
					<Pin pinNum="15" name="15" pinSymName="1" pinEqual="1" gate="15" gateEqual="1"/>
					<Pin pinNum="16" name="16" pinSymName="1" pinEqual="1" gate="16" gateEqual="1"/>
					<Pin pinNum="17" name="17" pinSymName="1" pinEqual="1" gate="17" gateEqual="1"/>
					<Pin pinNum="18" name="18" pinSymName="1" pinEqual="1" gate="18" gateEqual="1"/>
					<Pin pinNum="19" name="19" pinSymName="1" pinEqual="1" gate="19" gateEqual="1"/>
					<Pin pinNum="20" name="20" pinSymName="1" pinEqual="1" gate="20" gateEqual="1"/>
					<Pin pinNum="21" name="21" pinSymName="1" pinEqual="1" gate="21" gateEqual="1"/>
					<Pin pinNum="22" name="22" pinSymName="1" pinEqual="1" gate="22" gateEqual="1"/>
					<Pin pinNum="23" name="23" pinSymName="1" pinEqual="1" gate="23" gateEqual="1"/>
					<Pin pinNum="24" name="24" pinSymName="1" pinEqual="1" gate="24" gateEqual="1"/>
					<Pin pinNum="25" name="25" pinSymName="1" pinEqual="1" gate="25" gateEqual="1"/>
					<Pin pinNum="26" name="26" pinSymName="1" pinEqual="1" gate="26" gateEqual="1"/>
					<Pin pinNum="27" name="27" pinSymName="1" pinEqual="1" gate="27" gateEqual="1"/>
					<Pin pinNum="28" name="28" pinSymName="1" pinEqual="1" gate="28" gateEqual="1"/>
					<Pin pinNum="29" name="29" pinSymName="1" pinEqual="1" gate="29" gateEqual="1"/>
					<Pin pinNum="30" name="30" pinSymName="1" pinEqual="1" gate="30" gateEqual="1"/>
					<Pin pinNum="31" name="31" pinSymName="1" pinEqual="1" gate="31" gateEqual="1"/>
					<Pin pinNum="32" name="32" pinSymName="1" pinEqual="1" gate="32" gateEqual="1"/>
					<Pin pinNum="33" name="33" pinSymName="1" pinEqual="1" gate="33" gateEqual="1"/>
					<Pin pinNum="34" name="34" pinSymName="1" pinEqual="1" gate="34" gateEqual="1"/>
					<Pin pinNum="35" name="35" pinSymName="1" pinEqual="1" gate="35" gateEqual="1"/>
					<Pin pinNum="36" name="36" pinSymName="1" pinEqual="1" gate="36" gateEqual="1"/>
					<Pin pinNum="37" name="37" pinSymName="1" pinEqual="1" gate="37" gateEqual="1"/>
					<Pin pinNum="38" name="38" pinSymName="1" pinEqual="1" gate="38" gateEqual="1"/>
					<Pin pinNum="39" name="39" pinSymName="1" pinEqual="1" gate="39" gateEqual="1"/>
					<Pin pinNum="40" name="40" pinSymName="1" pinEqual="1" gate="40" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="CABL40"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="X"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="CABL40"/>
				</Attributes>
			</Component>
			<Component name="K17B-2_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="K17B-2"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="C"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="K17B-2"/>
				</Attributes>
			</Component>
			<Component name="SL_B31_1">
				<Pins>
					<Pin pinNum="1" name="B1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="B2" pinSymName="1" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="3" name="B3" pinSymName="1" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="4" name="B4" pinSymName="1" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="5" name="B5" pinSymName="1" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="6" name="B6" pinSymName="1" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="7" name="B7" pinSymName="1" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="8" name="B8" pinSymName="1" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="9" name="B9" pinSymName="1" pinEqual="1" gate="9" gateEqual="1"/>
					<Pin pinNum="10" name="B10" pinSymName="1" pinEqual="1" gate="10" gateEqual="1"/>
					<Pin pinNum="11" name="B11" pinSymName="1" pinEqual="1" gate="11" gateEqual="1"/>
					<Pin pinNum="12" name="B12" pinSymName="1" pinEqual="1" gate="12" gateEqual="1"/>
					<Pin pinNum="13" name="B13" pinSymName="1" pinEqual="1" gate="13" gateEqual="1"/>
					<Pin pinNum="14" name="B14" pinSymName="1" pinEqual="1" gate="14" gateEqual="1"/>
					<Pin pinNum="15" name="B15" pinSymName="1" pinEqual="1" gate="15" gateEqual="1"/>
					<Pin pinNum="16" name="B16" pinSymName="1" pinEqual="1" gate="16" gateEqual="1"/>
					<Pin pinNum="17" name="B17" pinSymName="1" pinEqual="1" gate="17" gateEqual="1"/>
					<Pin pinNum="18" name="B18" pinSymName="1" pinEqual="1" gate="18" gateEqual="1"/>
					<Pin pinNum="19" name="B19" pinSymName="1" pinEqual="1" gate="19" gateEqual="1"/>
					<Pin pinNum="20" name="B20" pinSymName="1" pinEqual="1" gate="20" gateEqual="1"/>
					<Pin pinNum="21" name="B21" pinSymName="1" pinEqual="1" gate="21" gateEqual="1"/>
					<Pin pinNum="22" name="B22" pinSymName="1" pinEqual="1" gate="22" gateEqual="1"/>
					<Pin pinNum="23" name="B23" pinSymName="1" pinEqual="1" gate="23" gateEqual="1"/>
					<Pin pinNum="24" name="B24" pinSymName="1" pinEqual="1" gate="24" gateEqual="1"/>
					<Pin pinNum="25" name="B25" pinSymName="1" pinEqual="1" gate="25" gateEqual="1"/>
					<Pin pinNum="26" name="B26" pinSymName="1" pinEqual="1" gate="26" gateEqual="1"/>
					<Pin pinNum="27" name="B27" pinSymName="1" pinEqual="1" gate="27" gateEqual="1"/>
					<Pin pinNum="28" name="B28" pinSymName="1" pinEqual="1" gate="28" gateEqual="1"/>
					<Pin pinNum="29" name="B29" pinSymName="1" pinEqual="1" gate="29" gateEqual="1"/>
					<Pin pinNum="30" name="B30" pinSymName="1" pinEqual="1" gate="30" gateEqual="1"/>
					<Pin pinNum="31" name="B31" pinSymName="1" pinEqual="1" gate="31" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SL_B31"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="X"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="SL_B31"/>
				</Attributes>
			</Component>
			<Component name="7128100_1">
				<Pins>
					<Pin pinNum="1" name="A4" pinSymName="IO1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="A3" pinSymName="IO3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="A2" pinSymName="IO5" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="A1" pinSymName="IO6" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="A100" pinSymName="IO8" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="A99" pinSymName="IO9" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="A98" pinSymName="IO11" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="A96" pinSymName="IO13" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="A95" pinSymName="IO14" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="A94" pinSymName="IO16" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="A16" pinSymName="IO1" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="12" name="A15" pinSymName="IO3" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="13" name="A14" pinSymName="IO5" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="14" name="A12" pinSymName="IO6" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="15" name="A11" pinSymName="IO8" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="16" name="A10" pinSymName="IO9" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="17" name="A9" pinSymName="IO11" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="18" name="A8" pinSymName="IO13" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="19" name="A7" pinSymName="IO14" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="20" name="A6" pinSymName="IO16" pinEqual="1" gate="2" gateEqual="1"/>
					<Pin pinNum="21" name="A27" pinSymName="IO1" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="22" name="A26" pinSymName="IO3" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="23" name="A25" pinSymName="IO5" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="24" name="A24" pinSymName="IO6" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="25" name="A23" pinSymName="IO8" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="26" name="A22" pinSymName="IO9" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="27" name="A21" pinSymName="IO11" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="28" name="A19" pinSymName="IO13" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="29" name="A18" pinSymName="IO14" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="30" name="A17" pinSymName="IO16" pinEqual="1" gate="3" gateEqual="1"/>
					<Pin pinNum="31" name="A39" pinSymName="IO1" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="32" name="A38" pinSymName="IO3" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="33" name="A37" pinSymName="IO5" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="34" name="A35" pinSymName="IO6" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="35" name="A34" pinSymName="IO8" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="36" name="A33" pinSymName="IO9" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="37" name="A32" pinSymName="IO11" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="38" name="A31" pinSymName="IO13" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="39" name="A30" pinSymName="IO14" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="40" name="A29" pinSymName="IO16" pinEqual="1" gate="4" gateEqual="1"/>
					<Pin pinNum="41" name="A42" pinSymName="IO1" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="42" name="A43" pinSymName="IO3" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="43" name="A44" pinSymName="IO5" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="44" name="A46" pinSymName="IO6" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="45" name="A47" pinSymName="IO8" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="46" name="A48" pinSymName="IO9" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="47" name="A49" pinSymName="IO11" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="48" name="A50" pinSymName="IO13" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="49" name="A51" pinSymName="IO14" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="50" name="A52" pinSymName="IO16" pinEqual="1" gate="5" gateEqual="1"/>
					<Pin pinNum="51" name="A54" pinSymName="IO1" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="52" name="A55" pinSymName="IO3" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="53" name="A56" pinSymName="IO5" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="54" name="A57" pinSymName="IO6" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="55" name="A58" pinSymName="IO8" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="56" name="A59" pinSymName="IO9" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="57" name="A60" pinSymName="IO11" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="58" name="A62" pinSymName="IO13" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="59" name="A63" pinSymName="IO14" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="60" name="A64" pinSymName="IO16" pinEqual="1" gate="6" gateEqual="1"/>
					<Pin pinNum="61" name="A65" pinSymName="IO1" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="62" name="A66" pinSymName="IO3" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="63" name="A67" pinSymName="IO5" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="64" name="A69" pinSymName="IO6" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="65" name="A70" pinSymName="IO8" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="66" name="A71" pinSymName="IO9" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="67" name="A72" pinSymName="IO11" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="68" name="A73" pinSymName="IO13" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="69" name="A74" pinSymName="IO14" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="70" name="A75" pinSymName="IO16" pinEqual="1" gate="7" gateEqual="1"/>
					<Pin pinNum="71" name="A77" pinSymName="IO1" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="72" name="A78" pinSymName="IO3" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="73" name="A79" pinSymName="IO5" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="74" name="A80" pinSymName="IO6" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="75" name="A81" pinSymName="IO8" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="76" name="A82" pinSymName="IO9" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="77" name="A83" pinSymName="IO11" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="78" name="A85" pinSymName="IO13" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="79" name="A86" pinSymName="IO14" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="80" name="A87" pinSymName="IO16" pinEqual="1" gate="8" gateEqual="1"/>
					<Pin pinNum="81" name="A13" pinSymName="13" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="82" name="A20" pinSymName="20" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="83" name="A28" pinSymName="28" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="84" name="A36" pinSymName="36" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="85" name="A40" pinSymName="40" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="86" name="A41" pinSymName="41" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="87" name="A45" pinSymName="45" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="88" name="A5" pinSymName="5" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="89" name="A53" pinSymName="53" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="90" name="A61" pinSymName="61" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="91" name="A68" pinSymName="68" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="92" name="A76" pinSymName="76" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="93" name="A84" pinSymName="84" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="94" name="A88" pinSymName="88" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="95" name="A89" pinSymName="89" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="96" name="A90" pinSymName="90" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="97" name="A91" pinSymName="91" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="98" name="A92" pinSymName="92" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="99" name="A93" pinSymName="93" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="100" name="A97" pinSymName="97" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="7128100"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="7128100"/>
				</Attributes>
			</Component>
			<Component name="K559IP15_1">
				<Pins>
					<Pin pinNum="1" name="18" pinSymName="A0" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="17" pinSymName="A1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="16" pinSymName="A2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="15" pinSymName="A3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="14" pinSymName="A4" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="13" pinSymName="A5" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="12" pinSymName="A6" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="11" pinSymName="A7" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="1" pinSymName="T" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="19" pinSymName="OE" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="2" pinSymName="B0" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="3" pinSymName="B1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="4" pinSymName="B2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="5" pinSymName="B3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="15" name="6" pinSymName="B4" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="16" name="7" pinSymName="B5" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="17" name="8" pinSymName="B6" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="18" name="9" pinSymName="B7" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="19" name="10" pinSymName="10" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="20" name="20" pinSymName="20" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="K559IP15"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="K559IP15"/>
					<Attribute name="PCADIO_LinkName" value="K559IP15"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="K559IP15"/>
				</Attributes>
			</Component>
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="K559IP3_1"/>
				<FootprintRef name="K559IP3_1"/>
				<Pinpack pinNum="14" padNum="1"/>
				<Pinpack pinNum="4" padNum="2"/>
				<Pinpack pinNum="13" padNum="3"/>
				<Pinpack pinNum="12" padNum="4"/>
				<Pinpack pinNum="3" padNum="5"/>
				<Pinpack pinNum="11" padNum="6"/>
				<Pinpack pinNum="5" padNum="7"/>
				<Pinpack pinNum="16" padNum="8"/>
				<Pinpack pinNum="6" padNum="9"/>
				<Pinpack pinNum="9" padNum="10"/>
				<Pinpack pinNum="2" padNum="11"/>
				<Pinpack pinNum="10" padNum="12"/>
				<Pinpack pinNum="7" padNum="13"/>
				<Pinpack pinNum="1" padNum="14"/>
				<Pinpack pinNum="8" padNum="15"/>
				<Pinpack pinNum="15" padNum="16"/>
			</Package>
			<Package>
				<ComponentRef name="K559IP3_1"/>
				<FootprintRef name="K559IP3_2"/>
				<Pinpack pinNum="14" padNum="1"/>
				<Pinpack pinNum="4" padNum="2"/>
				<Pinpack pinNum="13" padNum="3"/>
				<Pinpack pinNum="12" padNum="4"/>
				<Pinpack pinNum="3" padNum="5"/>
				<Pinpack pinNum="11" padNum="6"/>
				<Pinpack pinNum="5" padNum="7"/>
				<Pinpack pinNum="16" padNum="8"/>
				<Pinpack pinNum="6" padNum="9"/>
				<Pinpack pinNum="9" padNum="10"/>
				<Pinpack pinNum="2" padNum="11"/>
				<Pinpack pinNum="10" padNum="12"/>
				<Pinpack pinNum="7" padNum="13"/>
				<Pinpack pinNum="1" padNum="14"/>
				<Pinpack pinNum="8" padNum="15"/>
				<Pinpack pinNum="15" padNum="16"/>
			</Package>
			<Package>
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_2"/>
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
			</Package>
			<Package>
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_3"/>
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
			</Package>
			<Package>
				<ComponentRef name="SL_A31_1"/>
				<FootprintRef name="SL_A31_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="CABL10_1"/>
				<FootprintRef name="CABL10_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="K1533AP6_1"/>
				<FootprintRef name="K1533AP6_1"/>
				<Pinpack pinNum="2" padNum="1"/>
				<Pinpack pinNum="3" padNum="2"/>
				<Pinpack pinNum="4" padNum="3"/>
				<Pinpack pinNum="5" padNum="4"/>
				<Pinpack pinNum="6" padNum="5"/>
				<Pinpack pinNum="7" padNum="6"/>
				<Pinpack pinNum="8" padNum="7"/>
				<Pinpack pinNum="9" padNum="8"/>
				<Pinpack pinNum="10" padNum="9"/>
				<Pinpack pinNum="19" padNum="10"/>
				<Pinpack pinNum="18" padNum="11"/>
				<Pinpack pinNum="17" padNum="12"/>
				<Pinpack pinNum="16" padNum="13"/>
				<Pinpack pinNum="15" padNum="14"/>
				<Pinpack pinNum="14" padNum="15"/>
				<Pinpack pinNum="13" padNum="16"/>
				<Pinpack pinNum="12" padNum="17"/>
				<Pinpack pinNum="11" padNum="18"/>
				<Pinpack pinNum="1" padNum="19"/>
				<Pinpack pinNum="20" padNum="20"/>
			</Package>
			<Package>
				<ComponentRef name="CABL40_1"/>
				<FootprintRef name="CABL40_1"/>
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
				<ComponentRef name="K17B-2_1"/>
				<FootprintRef name="K17B-2_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="SL_B31_1"/>
				<FootprintRef name="SL_B31_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="7128100_1"/>
				<FootprintRef name="7128100_1"/>
				<Pinpack pinNum="4" padNum="1"/>
				<Pinpack pinNum="3" padNum="2"/>
				<Pinpack pinNum="2" padNum="3"/>
				<Pinpack pinNum="1" padNum="4"/>
				<Pinpack pinNum="88" padNum="5"/>
				<Pinpack pinNum="20" padNum="6"/>
				<Pinpack pinNum="19" padNum="7"/>
				<Pinpack pinNum="18" padNum="8"/>
				<Pinpack pinNum="17" padNum="9"/>
				<Pinpack pinNum="16" padNum="10"/>
				<Pinpack pinNum="15" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="81" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
				<Pinpack pinNum="12" padNum="15"/>
				<Pinpack pinNum="11" padNum="16"/>
				<Pinpack pinNum="30" padNum="17"/>
				<Pinpack pinNum="29" padNum="18"/>
				<Pinpack pinNum="28" padNum="19"/>
				<Pinpack pinNum="82" padNum="20"/>
				<Pinpack pinNum="27" padNum="21"/>
				<Pinpack pinNum="26" padNum="22"/>
				<Pinpack pinNum="25" padNum="23"/>
				<Pinpack pinNum="24" padNum="24"/>
				<Pinpack pinNum="23" padNum="25"/>
				<Pinpack pinNum="22" padNum="26"/>
				<Pinpack pinNum="21" padNum="27"/>
				<Pinpack pinNum="83" padNum="28"/>
				<Pinpack pinNum="40" padNum="29"/>
				<Pinpack pinNum="39" padNum="30"/>
				<Pinpack pinNum="38" padNum="31"/>
				<Pinpack pinNum="37" padNum="32"/>
				<Pinpack pinNum="36" padNum="33"/>
				<Pinpack pinNum="35" padNum="34"/>
				<Pinpack pinNum="34" padNum="35"/>
				<Pinpack pinNum="84" padNum="36"/>
				<Pinpack pinNum="33" padNum="37"/>
				<Pinpack pinNum="32" padNum="38"/>
				<Pinpack pinNum="31" padNum="39"/>
				<Pinpack pinNum="85" padNum="40"/>
				<Pinpack pinNum="86" padNum="41"/>
				<Pinpack pinNum="41" padNum="42"/>
				<Pinpack pinNum="42" padNum="43"/>
				<Pinpack pinNum="43" padNum="44"/>
				<Pinpack pinNum="87" padNum="45"/>
				<Pinpack pinNum="44" padNum="46"/>
				<Pinpack pinNum="45" padNum="47"/>
				<Pinpack pinNum="46" padNum="48"/>
				<Pinpack pinNum="47" padNum="49"/>
				<Pinpack pinNum="48" padNum="50"/>
				<Pinpack pinNum="49" padNum="51"/>
				<Pinpack pinNum="50" padNum="52"/>
				<Pinpack pinNum="89" padNum="53"/>
				<Pinpack pinNum="51" padNum="54"/>
				<Pinpack pinNum="52" padNum="55"/>
				<Pinpack pinNum="53" padNum="56"/>
				<Pinpack pinNum="54" padNum="57"/>
				<Pinpack pinNum="55" padNum="58"/>
				<Pinpack pinNum="56" padNum="59"/>
				<Pinpack pinNum="57" padNum="60"/>
				<Pinpack pinNum="90" padNum="61"/>
				<Pinpack pinNum="58" padNum="62"/>
				<Pinpack pinNum="59" padNum="63"/>
				<Pinpack pinNum="60" padNum="64"/>
				<Pinpack pinNum="61" padNum="65"/>
				<Pinpack pinNum="62" padNum="66"/>
				<Pinpack pinNum="63" padNum="67"/>
				<Pinpack pinNum="91" padNum="68"/>
				<Pinpack pinNum="64" padNum="69"/>
				<Pinpack pinNum="65" padNum="70"/>
				<Pinpack pinNum="66" padNum="71"/>
				<Pinpack pinNum="67" padNum="72"/>
				<Pinpack pinNum="68" padNum="73"/>
				<Pinpack pinNum="69" padNum="74"/>
				<Pinpack pinNum="70" padNum="75"/>
				<Pinpack pinNum="92" padNum="76"/>
				<Pinpack pinNum="71" padNum="77"/>
				<Pinpack pinNum="72" padNum="78"/>
				<Pinpack pinNum="73" padNum="79"/>
				<Pinpack pinNum="74" padNum="80"/>
				<Pinpack pinNum="75" padNum="81"/>
				<Pinpack pinNum="76" padNum="82"/>
				<Pinpack pinNum="77" padNum="83"/>
				<Pinpack pinNum="93" padNum="84"/>
				<Pinpack pinNum="78" padNum="85"/>
				<Pinpack pinNum="79" padNum="86"/>
				<Pinpack pinNum="80" padNum="87"/>
				<Pinpack pinNum="94" padNum="88"/>
				<Pinpack pinNum="95" padNum="89"/>
				<Pinpack pinNum="96" padNum="90"/>
				<Pinpack pinNum="97" padNum="91"/>
				<Pinpack pinNum="98" padNum="92"/>
				<Pinpack pinNum="99" padNum="93"/>
				<Pinpack pinNum="10" padNum="94"/>
				<Pinpack pinNum="9" padNum="95"/>
				<Pinpack pinNum="8" padNum="96"/>
				<Pinpack pinNum="100" padNum="97"/>
				<Pinpack pinNum="7" padNum="98"/>
				<Pinpack pinNum="6" padNum="99"/>
				<Pinpack pinNum="5" padNum="100"/>
			</Package>
			<Package>
				<ComponentRef name="K559IP15_1"/>
				<FootprintRef name="K559IP15_1"/>
				<Pinpack pinNum="9" padNum="1"/>
				<Pinpack pinNum="11" padNum="2"/>
				<Pinpack pinNum="12" padNum="3"/>
				<Pinpack pinNum="13" padNum="4"/>
				<Pinpack pinNum="14" padNum="5"/>
				<Pinpack pinNum="15" padNum="6"/>
				<Pinpack pinNum="16" padNum="7"/>
				<Pinpack pinNum="17" padNum="8"/>
				<Pinpack pinNum="18" padNum="9"/>
				<Pinpack pinNum="19" padNum="10"/>
				<Pinpack pinNum="8" padNum="11"/>
				<Pinpack pinNum="7" padNum="12"/>
				<Pinpack pinNum="6" padNum="13"/>
				<Pinpack pinNum="5" padNum="14"/>
				<Pinpack pinNum="4" padNum="15"/>
				<Pinpack pinNum="3" padNum="16"/>
				<Pinpack pinNum="2" padNum="17"/>
				<Pinpack pinNum="1" padNum="18"/>
				<Pinpack pinNum="10" padNum="19"/>
				<Pinpack pinNum="20" padNum="20"/>
			</Package>
			<Package>
				<ComponentRef name="K559IP15_1"/>
				<FootprintRef name="K559IP15_2"/>
				<Pinpack pinNum="9" padNum="1"/>
				<Pinpack pinNum="11" padNum="2"/>
				<Pinpack pinNum="12" padNum="3"/>
				<Pinpack pinNum="13" padNum="4"/>
				<Pinpack pinNum="14" padNum="5"/>
				<Pinpack pinNum="15" padNum="6"/>
				<Pinpack pinNum="16" padNum="7"/>
				<Pinpack pinNum="17" padNum="8"/>
				<Pinpack pinNum="18" padNum="9"/>
				<Pinpack pinNum="19" padNum="10"/>
				<Pinpack pinNum="8" padNum="11"/>
				<Pinpack pinNum="7" padNum="12"/>
				<Pinpack pinNum="6" padNum="13"/>
				<Pinpack pinNum="5" padNum="14"/>
				<Pinpack pinNum="4" padNum="15"/>
				<Pinpack pinNum="3" padNum="16"/>
				<Pinpack pinNum="2" padNum="17"/>
				<Pinpack pinNum="1" padNum="18"/>
				<Pinpack pinNum="10" padNum="19"/>
				<Pinpack pinNum="20" padNum="20"/>
			</Package>
		</Packages>
	</LocalLibrary>

	<Constructive version="1.2">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.01">
					<Polyline>
						<Start x="157.4" y="27.8"/>
						<SegmentLine>
							<End x="157.4" y="124.65"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.01">
					<Polyline>
						<Start x="236.9" y="124.65"/>
						<SegmentLine>
							<End x="236.9" y="27.8"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.01">
					<Polyline>
						<Start x="236.9" y="27.8"/>
						<SegmentLine>
							<End x="157.4" y="27.8"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.01">
					<Polyline>
						<Start x="157.4" y="124.65"/>
						<SegmentLine>
							<End x="236.9" y="124.65"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.01">
					<FilledContour>
						<Start x="157.4" y="124.65"/>
						<SegmentLine>
							<End x="157.4" y="27.8"/>
						</SegmentLine>
						<SegmentLine>
							<End x="236.9" y="27.8"/>
						</SegmentLine>
						<SegmentLine>
							<End x="236.9" y="124.65"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
			</Contour>
		</BoardOutline>
		<Keepouts>
			<Keepout>
				<Role>
					<Trace>
						<AllLayers/>
					</Trace>
				</Role>
				<Polyline>
					<Start x="157.45" y="29.1"/>
					<SegmentLine>
						<End x="236.95" y="29.1"/>
					</SegmentLine>
				</Polyline>
			</Keepout>
		</Keepouts>
	</Constructive>

	<ComponentsOnBoard version="1.3">
		<Components>
			<CompInstance name="C6" uniqueId="JGIPEMPX" side="Top">
				<ComponentRef name="K17B-2_1"/>
				<FootprintRef name="K17B-2_1"/>
				<Org x="172.9" y="46.65"/>
				<Attributes>
					<Attribute name="Type" value="K17B-2"/>
					<Attribute name="FP" value="K17B-2"/>
					<Attribute name="PDIF_TY" value="11000"/>
					<Attribute name="DEVICE" value="K17B-2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="X4" uniqueId="LHIWOQAC" side="Top" angle="90" fixed="on">
				<ComponentRef name="CABL10_1"/>
				<FootprintRef name="CABL10_1"/>
				<Org x="159.15" y="72.9"/>
				<Attributes>
					<Attribute name="Type" value="CABL10"/>
					<Attribute name="FP" value="CABLE10"/>
					<Attribute name="PDIF_TY" value="255"/>
					<Attribute name="DEVICE" value="CABL10"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C1" uniqueId="VIWCHRFC" side="Top" angle="90">
				<ComponentRef name="K17B-2_1"/>
				<FootprintRef name="K17B-2_1"/>
				<Org x="205.4" y="56.65"/>
				<Attributes>
					<Attribute name="Type" value="K17B-2"/>
					<Attribute name="FP" value="K17B-2"/>
					<Attribute name="PDIF_TY" value="11000"/>
					<Attribute name="DEVICE" value="K17B-2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C2" uniqueId="EJASSQGH" side="Top" angle="270">
				<ComponentRef name="K17B-2_1"/>
				<FootprintRef name="K17B-2_1"/>
				<Org x="200.4" y="50.4"/>
				<Attributes>
					<Attribute name="Type" value="K17B-2"/>
					<Attribute name="FP" value="K17B-2"/>
					<Attribute name="PDIF_TY" value="11000"/>
					<Attribute name="DEVICE" value="K17B-2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C7" uniqueId="TJJALCGN" side="Top" angle="270">
				<ComponentRef name="K17B-2_1"/>
				<FootprintRef name="K17B-2_1"/>
				<Org x="192.9" y="115.4"/>
				<Attributes>
					<Attribute name="Type" value="K17B-2"/>
					<Attribute name="FP" value="K17B-2"/>
					<Attribute name="PDIF_TY" value="11000"/>
					<Attribute name="DEVICE" value="K17B-2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C3" uniqueId="LNWHCJUN" side="Top" angle="90">
				<ComponentRef name="K17B-2_1"/>
				<FootprintRef name="K17B-2_1"/>
				<Org x="227.9" y="87.9"/>
				<Attributes>
					<Attribute name="Type" value="K17B-2"/>
					<Attribute name="FP" value="K17B-2"/>
					<Attribute name="PDIF_TY" value="11000"/>
					<Attribute name="DEVICE" value="K17B-2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C5" uniqueId="PRKVSEJP" side="Top" angle="270">
				<ComponentRef name="K17B-2_1"/>
				<FootprintRef name="K17B-2_1"/>
				<Org x="227.9" y="106.65"/>
				<Attributes>
					<Attribute name="Type" value="K17B-2"/>
					<Attribute name="FP" value="K17B-2"/>
					<Attribute name="PDIF_TY" value="11000"/>
					<Attribute name="DEVICE" value="K17B-2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D6" uniqueId="ASTEMSMR" side="Top" angle="270">
				<ComponentRef name="K559IP3_1"/>
				<FootprintRef name="K559IP3_2"/>
				<Org x="222.9" y="81.65"/>
				<Attributes>
					<Attribute name="Type" value="K559IP3"/>
					<Attribute name="FP" value="DIP16"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="K559IP3"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D12" uniqueId="MBELRJFS" side="Top" angle="180">
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_1"/>
				<Org x="220.4" y="89.15"/>
				<Attributes>
					<Attribute name="Type" value="NR-10"/>
					<Attribute name="FP" value="NR10"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="NR-10"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D11" uniqueId="KNBUZGWT" side="Top" angle="180">
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_1"/>
				<Org x="221.65" y="94.15"/>
				<Attributes>
					<Attribute name="Type" value="NR-10"/>
					<Attribute name="FP" value="NR10"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="NR-10"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D13" uniqueId="FOEIDBND" side="Top" angle="180">
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_2"/>
				<Org x="186.65" y="110.4"/>
				<Attributes>
					<Attribute name="Type" value="NR-10"/>
					<Attribute name="FP" value="NR10"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="NR-10"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D7" uniqueId="XFOCNNXJ" side="Top" angle="180">
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_1"/>
				<Org x="221.65" y="109.15"/>
				<Attributes>
					<Attribute name="Type" value="NR-10"/>
					<Attribute name="FP" value="NR10"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="NR-10"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C4" uniqueId="DEVLPWFT" side="Top">
				<ComponentRef name="K17B-2_1"/>
				<FootprintRef name="K17B-2_1"/>
				<Org x="184.15" y="46.65"/>
				<Attributes>
					<Attribute name="Type" value="K17B-2"/>
					<Attribute name="FP" value="K17B-2"/>
					<Attribute name="PDIF_TY" value="11000"/>
					<Attribute name="DEVICE" value="K17B-2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D15" uniqueId="GIMVGXPG" side="Top">
				<ComponentRef name="K1533AP6_1"/>
				<FootprintRef name="K1533AP6_1"/>
				<Org x="205.4" y="41.65"/>
				<Attributes>
					<Attribute name="Type" value="K1533AP6"/>
					<Attribute name="FP" value="DIP20"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="K1533AP6"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D4" uniqueId="VBFFZIXN" side="Top" angle="180">
				<ComponentRef name="K559IP15_1"/>
				<FootprintRef name="K559IP15_1"/>
				<Org x="219.15" y="85.4"/>
				<Attributes>
					<Attribute name="Type" value="K559IP15"/>
					<Attribute name="FP" value="DIP20"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="K559IP15"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D10" uniqueId="APZQQJUD" side="Top" angle="180">
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_1"/>
				<Org x="191.65" y="105.4"/>
				<Attributes>
					<Attribute name="Type" value="NR-10"/>
					<Attribute name="FP" value="NR10"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="NR-10"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D14" uniqueId="QTNUTHAD" side="Top" angle="180">
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_3"/>
				<Org x="186.65" y="115.4"/>
				<Attributes>
					<Attribute name="Type" value="NR-10"/>
					<Attribute name="FP" value="NR10"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="NR-10"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D9" uniqueId="NBZBBZJT" side="Top" angle="180">
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_1"/>
				<Org x="190.4" y="100.4"/>
				<Attributes>
					<Attribute name="Type" value="NR-10"/>
					<Attribute name="FP" value="NR10"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="NR-10"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="X3" uniqueId="OBBYWRHW" side="Top" angle="180" fixed="on">
				<ComponentRef name="CABL40_1"/>
				<FootprintRef name="CABL40_1"/>
				<Org x="217.9" y="120.4"/>
				<Attributes>
					<Attribute name="Type" value="CABL40"/>
					<Attribute name="FP" value="CABLE40"/>
					<Attribute name="PDIF_TY" value="255"/>
					<Attribute name="DEVICE" value="CABL40"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D8" uniqueId="TABHIRKN" side="Top" angle="180">
				<ComponentRef name="NR-10_1"/>
				<FootprintRef name="NR-10_1"/>
				<Org x="221.65" y="115.4"/>
				<Attributes>
					<Attribute name="Type" value="NR-10"/>
					<Attribute name="FP" value="NR10"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="NR-10"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D2" uniqueId="IITNZWML" side="Top" angle="180">
				<ComponentRef name="K559IP15_1"/>
				<FootprintRef name="K559IP15_1"/>
				<Org x="221.65" y="105.4"/>
				<Attributes>
					<Attribute name="Type" value="K559IP15"/>
					<Attribute name="FP" value="DIP20"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="K559IP15"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D1" uniqueId="VAUXKVGZ" side="Top" angle="270">
				<ComponentRef name="7128100_1"/>
				<FootprintRef name="7128100_1"/>
				<Org x="172.9" y="67.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopAssy"/>
							<TextStyleRef name="T:H39W3"/>
							<Org x="0" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="7128100"/>
					<Attribute name="PDIF_TY" value="255"/>
					<Attribute name="DEVICE" value="7128100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="X1" uniqueId="TZHGLGAI" side="Top" fixed="on">
				<ComponentRef name="SL_A31_1"/>
				<FootprintRef name="SL_A31_1"/>
				<Org x="235.25" y="32.6"/>
				<Attributes>
					<Attribute name="Type" value="SL_A31"/>
					<Attribute name="FP" value="IBM_A"/>
					<Attribute name="PDIF_TY" value="11000"/>
					<Attribute name="DEVICE" value="SL_A31"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="X2" uniqueId="MEZAHKNU" side="Bottom" fixed="on">
				<ComponentRef name="SL_B31_1"/>
				<FootprintRef name="SL_B31_1"/>
				<Org x="235.25" y="32.6"/>
				<Attributes>
					<Attribute name="Type" value="SL_B31"/>
					<Attribute name="FP" value="IBM_B"/>
					<Attribute name="PDIF_TY" value="11000"/>
					<Attribute name="DEVICE" value="SL_B31"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D3" uniqueId="FWFUCEPY" side="Top" angle="180">
				<ComponentRef name="K559IP15_1"/>
				<FootprintRef name="K559IP15_2"/>
				<Org x="192.9" y="95.4"/>
				<Attributes>
					<Attribute name="Type" value="K559IP15"/>
					<Attribute name="FP" value="DIP20"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="K559IP15"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D5" uniqueId="TVMDTCBW" side="Top" angle="270">
				<ComponentRef name="K559IP3_1"/>
				<FootprintRef name="K559IP3_1"/>
				<Org x="210.4" y="74.15"/>
				<Attributes>
					<Attribute name="Type" value="K559IP3"/>
					<Attribute name="FP" value="DIP16"/>
					<Attribute name="Name" value="DN"/>
					<Attribute name="PDIF_TY" value="10000"/>
					<Attribute name="DEVICE" value="K559IP3"/>
				</Attributes>
			</CompInstance>
		</Components>
	</ComponentsOnBoard>

	<NetList version="2.0">
		<Net name="BA16">
			<PinRef compName="D12" pinName="3"/>
			<PinRef compName="D11" pinName="3"/>
			<PinRef compName="D4" pinName="3"/>
			<PinRef compName="X3" pinName="4"/>
		</Net>
		<Net name="D1">
			<PinRef compName="D15" pinName="3"/>
			<PinRef compName="D1" pinName="39"/>
		</Net>
		<Net name="D0">
			<PinRef compName="D15" pinName="2"/>
			<PinRef compName="D1" pinName="42"/>
		</Net>
		<Net name="BAD4">
			<PinRef compName="D7" pinName="6"/>
			<PinRef compName="X3" pinName="9"/>
			<PinRef compName="D8" pinName="6"/>
			<PinRef compName="D2" pinName="6"/>
		</Net>
		<Net name="AD5">
			<PinRef compName="D2" pinName="13"/>
			<PinRef compName="D1" pinName="7"/>
		</Net>
		<Net name="D4">
			<PinRef compName="D15" pinName="6"/>
			<PinRef compName="D1" pinName="25"/>
		</Net>
		<Net name="IRQ_B">
			<PinRef compName="D6" pinName="6"/>
			<PinRef compName="D1" pinName="48"/>
		</Net>
		<Net name="ADR21">
			<PinRef compName="D4" pinName="12"/>
			<PinRef compName="D1" pinName="38"/>
		</Net>
		<Net name="AD14">
			<PinRef compName="D1" pinName="70"/>
			<PinRef compName="D3" pinName="12"/>
		</Net>
		<Net name="#TCLK">
			<PinRef compName="X4" pinName="1"/>
			<PinRef compName="D1" pinName="64"/>
		</Net>
		<Net name="DB">
			<PinRef compName="D4" pinName="1"/>
			<PinRef compName="D2" pinName="1"/>
			<PinRef compName="D1" pinName="78"/>
		</Net>
		<Net name="P1">
			<PinRef compName="D13" pinName="10"/>
			<PinRef compName="D1" pinName="96"/>
		</Net>
		<Net name="ADR20">
			<PinRef compName="D4" pinName="13"/>
			<PinRef compName="D1" pinName="49"/>
		</Net>
		<Net name="EB1">
			<PinRef compName="D6" pinName="7"/>
			<PinRef compName="D4" pinName="19"/>
			<PinRef compName="D2" pinName="19"/>
			<PinRef compName="D1" pinName="51"/>
			<PinRef compName="D5" pinName="7"/>
		</Net>
		<Net name="D2">
			<PinRef compName="D15" pinName="4"/>
			<PinRef compName="D1" pinName="44"/>
		</Net>
		<Net name="BAD7">
			<PinRef compName="D7" pinName="9"/>
			<PinRef compName="X3" pinName="15"/>
			<PinRef compName="D8" pinName="9"/>
			<PinRef compName="D2" pinName="9"/>
		</Net>
		<Net name="A8">
			<PinRef compName="D1" pinName="30"/>
			<PinRef compName="X1" pinName="23"/>
		</Net>
		<Net name="0B">
			<PinRef compName="C6" pinName="1"/>
			<PinRef compName="X4" pinName="6"/>
			<PinRef compName="X4" pinName="10"/>
			<PinRef compName="C1" pinName="1"/>
			<PinRef compName="C2" pinName="1"/>
			<PinRef compName="C7" pinName="1"/>
			<PinRef compName="C3" pinName="1"/>
			<PinRef compName="C5" pinName="1"/>
			<PinRef compName="D6" pinName="8"/>
			<PinRef compName="D6" pinName="9"/>
			<PinRef compName="D6" pinName="11"/>
			<PinRef compName="D12" pinName="1"/>
			<PinRef compName="C4" pinName="1"/>
			<PinRef compName="D15" pinName="10"/>
			<PinRef compName="D15" pinName="19"/>
			<PinRef compName="D4" pinName="10"/>
			<PinRef compName="D10" pinName="1"/>
			<PinRef compName="D14" pinName="1"/>
			<PinRef compName="X3" pinName="16"/>
			<PinRef compName="X3" pinName="24"/>
			<PinRef compName="D8" pinName="1"/>
			<PinRef compName="D2" pinName="10"/>
			<PinRef compName="D1" pinName="13"/>
			<PinRef compName="D1" pinName="28"/>
			<PinRef compName="D1" pinName="40"/>
			<PinRef compName="D1" pinName="45"/>
			<PinRef compName="D1" pinName="61"/>
			<PinRef compName="D1" pinName="76"/>
			<PinRef compName="D1" pinName="88"/>
			<PinRef compName="D1" pinName="90"/>
			<PinRef compName="D1" pinName="91"/>
			<PinRef compName="D1" pinName="92"/>
			<PinRef compName="D1" pinName="97"/>
			<PinRef compName="X2" pinName="1"/>
			<PinRef compName="X2" pinName="10"/>
			<PinRef compName="X2" pinName="31"/>
			<PinRef compName="D3" pinName="10"/>
			<PinRef compName="D5" pinName="8"/>
			<PinRef compName="D5" pinName="9"/>
		</Net>
		<Net name="BAD1">
			<PinRef compName="D7" pinName="3"/>
			<PinRef compName="X3" pinName="3"/>
			<PinRef compName="D8" pinName="3"/>
			<PinRef compName="D2" pinName="3"/>
		</Net>
		<Net name="BA18">
			<PinRef compName="D12" pinName="5"/>
			<PinRef compName="D11" pinName="5"/>
			<PinRef compName="D4" pinName="5"/>
			<PinRef compName="X3" pinName="8"/>
		</Net>
		<Net name="REST">
			<PinRef compName="D6" pinName="14"/>
			<PinRef compName="D1" pinName="55"/>
		</Net>
		<Net name="A0">
			<PinRef compName="D1" pinName="43"/>
			<PinRef compName="X1" pinName="31"/>
		</Net>
		<Net name="A5">
			<PinRef compName="D1" pinName="37"/>
			<PinRef compName="X1" pinName="26"/>
		</Net>
		<Net name="AD4">
			<PinRef compName="D2" pinName="14"/>
			<PinRef compName="D1" pinName="8"/>
		</Net>
		<Net name="BDIN">
			<PinRef compName="D12" pinName="10"/>
			<PinRef compName="D11" pinName="10"/>
			<PinRef compName="X3" pinName="20"/>
			<PinRef compName="D5" pinName="12"/>
		</Net>
		<Net name="AD3">
			<PinRef compName="D2" pinName="15"/>
			<PinRef compName="D1" pinName="16"/>
		</Net>
		<Net name="OSC">
			<PinRef compName="D1" pinName="89"/>
			<PinRef compName="X2" pinName="30"/>
		</Net>
		<Net name="ADR17">
			<PinRef compName="D4" pinName="16"/>
			<PinRef compName="D1" pinName="21"/>
		</Net>
		<Net name="SIA">
			<PinRef compName="D1" pinName="80"/>
			<PinRef compName="D5" pinName="14"/>
		</Net>
		<Net name="BAD3">
			<PinRef compName="D7" pinName="5"/>
			<PinRef compName="X3" pinName="7"/>
			<PinRef compName="D8" pinName="5"/>
			<PinRef compName="D2" pinName="5"/>
		</Net>
		<Net name="#TDI">
			<PinRef compName="X4" pinName="5"/>
			<PinRef compName="D1" pinName="6"/>
		</Net>
		<Net name="BSIA">
			<PinRef compName="D10" pinName="9"/>
			<PinRef compName="D9" pinName="9"/>
			<PinRef compName="X3" pinName="33"/>
			<PinRef compName="D5" pinName="15"/>
		</Net>
		<Net name="BIAKO">
			<PinRef compName="D13" pinName="5"/>
			<PinRef compName="D14" pinName="5"/>
			<PinRef compName="X3" pinName="36"/>
			<PinRef compName="D5" pinName="1"/>
		</Net>
		<Net name="BA20">
			<PinRef compName="D12" pinName="7"/>
			<PinRef compName="D11" pinName="7"/>
			<PinRef compName="D4" pinName="7"/>
			<PinRef compName="X3" pinName="12"/>
		</Net>
		<Net name="DCLO">
			<PinRef compName="D6" pinName="15"/>
			<PinRef compName="D13" pinName="3"/>
			<PinRef compName="D14" pinName="3"/>
			<PinRef compName="X3" pinName="30"/>
		</Net>
		<Net name="BWTBT">
			<PinRef compName="D12" pinName="2"/>
			<PinRef compName="D11" pinName="2"/>
			<PinRef compName="D4" pinName="2"/>
			<PinRef compName="X3" pinName="2"/>
		</Net>
		<Net name="IRQ7">
			<PinRef compName="D1" pinName="18"/>
			<PinRef compName="X2" pinName="21"/>
		</Net>
		<Net name="BAD2">
			<PinRef compName="D7" pinName="4"/>
			<PinRef compName="X3" pinName="5"/>
			<PinRef compName="D8" pinName="4"/>
			<PinRef compName="D2" pinName="4"/>
		</Net>
		<Net name="BAD6">
			<PinRef compName="D7" pinName="8"/>
			<PinRef compName="X3" pinName="13"/>
			<PinRef compName="D8" pinName="8"/>
			<PinRef compName="D2" pinName="8"/>
		</Net>
		<Net name="BIRQ">
			<PinRef compName="D6" pinName="4"/>
			<PinRef compName="D10" pinName="10"/>
			<PinRef compName="D9" pinName="10"/>
			<PinRef compName="X3" pinName="35"/>
		</Net>
		<Net name="AD2">
			<PinRef compName="D2" pinName="16"/>
			<PinRef compName="D1" pinName="23"/>
		</Net>
		<Net name="BA21">
			<PinRef compName="D12" pinName="8"/>
			<PinRef compName="D11" pinName="8"/>
			<PinRef compName="D4" pinName="8"/>
			<PinRef compName="X3" pinName="14"/>
		</Net>
		<Net name="-IOW">
			<PinRef compName="D1" pinName="4"/>
			<PinRef compName="X2" pinName="13"/>
		</Net>
		<Net name="A1">
			<PinRef compName="D1" pinName="95"/>
			<PinRef compName="X1" pinName="30"/>
		</Net>
		<Net name="BAD14">
			<PinRef compName="D10" pinName="7"/>
			<PinRef compName="D9" pinName="7"/>
			<PinRef compName="X3" pinName="29"/>
			<PinRef compName="D3" pinName="8"/>
		</Net>
		<Net name="BAD10">
			<PinRef compName="D10" pinName="3"/>
			<PinRef compName="D9" pinName="3"/>
			<PinRef compName="X3" pinName="21"/>
			<PinRef compName="D3" pinName="4"/>
		</Net>
		<Net name="SEL">
			<PinRef compName="D4" pinName="11"/>
			<PinRef compName="D1" pinName="74"/>
		</Net>
		<Net name="BAD13">
			<PinRef compName="D10" pinName="6"/>
			<PinRef compName="D9" pinName="6"/>
			<PinRef compName="X3" pinName="27"/>
			<PinRef compName="D3" pinName="7"/>
		</Net>
		<Net name="BAD12">
			<PinRef compName="D10" pinName="5"/>
			<PinRef compName="D9" pinName="5"/>
			<PinRef compName="X3" pinName="25"/>
			<PinRef compName="D3" pinName="6"/>
		</Net>
		<Net name="A9">
			<PinRef compName="D1" pinName="1"/>
			<PinRef compName="X1" pinName="22"/>
		</Net>
		<Net name="BAD11">
			<PinRef compName="D10" pinName="4"/>
			<PinRef compName="D9" pinName="4"/>
			<PinRef compName="X3" pinName="23"/>
			<PinRef compName="D3" pinName="5"/>
		</Net>
		<Net name="BAD9">
			<PinRef compName="D10" pinName="2"/>
			<PinRef compName="D9" pinName="2"/>
			<PinRef compName="X3" pinName="19"/>
			<PinRef compName="D3" pinName="3"/>
		</Net>
		<Net name="BAD15">
			<PinRef compName="D10" pinName="8"/>
			<PinRef compName="D9" pinName="8"/>
			<PinRef compName="X3" pinName="31"/>
			<PinRef compName="D3" pinName="9"/>
		</Net>
		<Net name="DIN">
			<PinRef compName="D1" pinName="79"/>
			<PinRef compName="D5" pinName="11"/>
		</Net>
		<Net name="ADR19">
			<PinRef compName="D4" pinName="14"/>
			<PinRef compName="D1" pinName="50"/>
		</Net>
		<Net name="BAD5">
			<PinRef compName="D7" pinName="7"/>
			<PinRef compName="X3" pinName="11"/>
			<PinRef compName="D8" pinName="7"/>
			<PinRef compName="D2" pinName="7"/>
		</Net>
		<Net name="DOUT">
			<PinRef compName="D1" pinName="82"/>
			<PinRef compName="D5" pinName="5"/>
		</Net>
		<Net name="#TMS">
			<PinRef compName="X4" pinName="3"/>
			<PinRef compName="D1" pinName="17"/>
		</Net>
		<Net name="OE_BF">
			<PinRef compName="D15" pinName="1"/>
			<PinRef compName="D1" pinName="100"/>
		</Net>
		<Net name="SD7">
			<PinRef compName="D15" pinName="11"/>
			<PinRef compName="X1" pinName="2"/>
		</Net>
		<Net name="SD6">
			<PinRef compName="D15" pinName="12"/>
			<PinRef compName="X1" pinName="3"/>
		</Net>
		<Net name="SD5">
			<PinRef compName="D15" pinName="13"/>
			<PinRef compName="X1" pinName="4"/>
		</Net>
		<Net name="SD1">
			<PinRef compName="D15" pinName="17"/>
			<PinRef compName="X1" pinName="8"/>
		</Net>
		<Net name="ADR16">
			<PinRef compName="D4" pinName="17"/>
			<PinRef compName="D1" pinName="54"/>
		</Net>
		<Net name="AD6">
			<PinRef compName="D2" pinName="12"/>
			<PinRef compName="D1" pinName="15"/>
		</Net>
		<Net name="BA17">
			<PinRef compName="D12" pinName="4"/>
			<PinRef compName="D11" pinName="4"/>
			<PinRef compName="D4" pinName="4"/>
			<PinRef compName="X3" pinName="6"/>
		</Net>
		<Net name="AD15">
			<PinRef compName="D1" pinName="65"/>
			<PinRef compName="D3" pinName="11"/>
		</Net>
		<Net name="IAKO">
			<PinRef compName="D1" pinName="81"/>
			<PinRef compName="D5" pinName="2"/>
		</Net>
		<Net name="AD12">
			<PinRef compName="D1" pinName="66"/>
			<PinRef compName="D3" pinName="14"/>
		</Net>
		<Net name="AD10">
			<PinRef compName="D1" pinName="10"/>
			<PinRef compName="D3" pinName="16"/>
		</Net>
		<Net name="RPLY">
			<PinRef compName="D6" pinName="12"/>
			<PinRef compName="D13" pinName="4"/>
			<PinRef compName="D14" pinName="4"/>
			<PinRef compName="X3" pinName="34"/>
		</Net>
		<Net name="A2">
			<PinRef compName="D1" pinName="31"/>
			<PinRef compName="X1" pinName="29"/>
		</Net>
		<Net name="AD9">
			<PinRef compName="D1" pinName="11"/>
			<PinRef compName="D3" pinName="17"/>
		</Net>
		<Net name="AD8">
			<PinRef compName="D1" pinName="12"/>
			<PinRef compName="D3" pinName="18"/>
		</Net>
		<Net name="D7">
			<PinRef compName="D15" pinName="9"/>
			<PinRef compName="D1" pinName="22"/>
		</Net>
		<Net name="SD4">
			<PinRef compName="D15" pinName="14"/>
			<PinRef compName="X1" pinName="5"/>
		</Net>
		<Net name="RPLY_I">
			<PinRef compName="D6" pinName="10"/>
			<PinRef compName="D1" pinName="71"/>
		</Net>
		<Net name="AD11">
			<PinRef compName="D1" pinName="9"/>
			<PinRef compName="D3" pinName="15"/>
		</Net>
		<Net name="BSEL">
			<PinRef compName="D12" pinName="9"/>
			<PinRef compName="D11" pinName="9"/>
			<PinRef compName="D4" pinName="9"/>
			<PinRef compName="X3" pinName="18"/>
		</Net>
		<Net name="AD0">
			<PinRef compName="D2" pinName="18"/>
			<PinRef compName="D1" pinName="27"/>
		</Net>
		<Net name="SD0">
			<PinRef compName="D15" pinName="18"/>
			<PinRef compName="X1" pinName="9"/>
		</Net>
		<Net name="+5B">
			<PinRef compName="C6" pinName="2"/>
			<PinRef compName="C1" pinName="2"/>
			<PinRef compName="C2" pinName="2"/>
			<PinRef compName="C7" pinName="2"/>
			<PinRef compName="C3" pinName="2"/>
			<PinRef compName="C5" pinName="2"/>
			<PinRef compName="D6" pinName="16"/>
			<PinRef compName="D11" pinName="1"/>
			<PinRef compName="D13" pinName="1"/>
			<PinRef compName="D7" pinName="1"/>
			<PinRef compName="C4" pinName="2"/>
			<PinRef compName="D15" pinName="20"/>
			<PinRef compName="D4" pinName="20"/>
			<PinRef compName="D9" pinName="1"/>
			<PinRef compName="D2" pinName="20"/>
			<PinRef compName="D1" pinName="5"/>
			<PinRef compName="D1" pinName="20"/>
			<PinRef compName="D1" pinName="36"/>
			<PinRef compName="D1" pinName="41"/>
			<PinRef compName="D1" pinName="53"/>
			<PinRef compName="D1" pinName="68"/>
			<PinRef compName="D1" pinName="84"/>
			<PinRef compName="D1" pinName="93"/>
			<PinRef compName="X2" pinName="3"/>
			<PinRef compName="X2" pinName="29"/>
			<PinRef compName="D3" pinName="20"/>
			<PinRef compName="D5" pinName="16"/>
		</Net>
		<Net name="BAD0">
			<PinRef compName="D7" pinName="2"/>
			<PinRef compName="X3" pinName="1"/>
			<PinRef compName="D8" pinName="2"/>
			<PinRef compName="D2" pinName="2"/>
		</Net>
		<Net name="BA19">
			<PinRef compName="D12" pinName="6"/>
			<PinRef compName="D11" pinName="6"/>
			<PinRef compName="D4" pinName="6"/>
			<PinRef compName="X3" pinName="10"/>
		</Net>
		<Net name="A4">
			<PinRef compName="D1" pinName="35"/>
			<PinRef compName="X1" pinName="27"/>
		</Net>
		<Net name="AD7">
			<PinRef compName="D2" pinName="11"/>
			<PinRef compName="D1" pinName="14"/>
		</Net>
		<Net name="D6">
			<PinRef compName="D15" pinName="8"/>
			<PinRef compName="D1" pinName="24"/>
		</Net>
		<Net name="-IOR">
			<PinRef compName="D1" pinName="34"/>
			<PinRef compName="X2" pinName="14"/>
		</Net>
		<Net name="RES">
			<PinRef compName="D1" pinName="47"/>
			<PinRef compName="X2" pinName="2"/>
		</Net>
		<Net name="#TDO">
			<PinRef compName="X4" pinName="2"/>
			<PinRef compName="D1" pinName="75"/>
		</Net>
		<Net name="A6">
			<PinRef compName="D1" pinName="94"/>
			<PinRef compName="X1" pinName="25"/>
		</Net>
		<Net name="ADR18">
			<PinRef compName="D4" pinName="15"/>
			<PinRef compName="D1" pinName="58"/>
		</Net>
		<Net name="SD3">
			<PinRef compName="D15" pinName="15"/>
			<PinRef compName="X1" pinName="6"/>
		</Net>
		<Net name="AEN">
			<PinRef compName="D1" pinName="2"/>
			<PinRef compName="X1" pinName="11"/>
		</Net>
		<Net name="A7">
			<PinRef compName="D1" pinName="99"/>
			<PinRef compName="X1" pinName="24"/>
		</Net>
		<Net name="AD1">
			<PinRef compName="D2" pinName="17"/>
			<PinRef compName="D1" pinName="26"/>
		</Net>
		<Net name="A3">
			<PinRef compName="D1" pinName="98"/>
			<PinRef compName="X1" pinName="28"/>
		</Net>
		<Net name="SD2">
			<PinRef compName="D15" pinName="16"/>
			<PinRef compName="X1" pinName="7"/>
		</Net>
		<Net name="D3">
			<PinRef compName="D15" pinName="5"/>
			<PinRef compName="D1" pinName="19"/>
		</Net>
		<Net name="WTBT">
			<PinRef compName="D4" pinName="18"/>
			<PinRef compName="D1" pinName="85"/>
		</Net>
		<Net name="AD13">
			<PinRef compName="D1" pinName="73"/>
			<PinRef compName="D3" pinName="13"/>
		</Net>
		<Net name="D5">
			<PinRef compName="D15" pinName="7"/>
			<PinRef compName="D1" pinName="3"/>
		</Net>
		<Net name="BAD8">
			<PinRef compName="D7" pinName="10"/>
			<PinRef compName="X3" pinName="17"/>
			<PinRef compName="D8" pinName="10"/>
			<PinRef compName="D3" pinName="2"/>
		</Net>
		<Net name="BDOUT">
			<PinRef compName="D13" pinName="2"/>
			<PinRef compName="D14" pinName="2"/>
			<PinRef compName="X3" pinName="22"/>
			<PinRef compName="D5" pinName="4"/>
		</Net>
	</NetList>

	<Groups version="1.1">
		<NetGroups>
			<NetGroup name="POWER">
				<NetRef name="0B"/>
				<NetRef name="+5B"/>
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
				<NetRef name="0B"/>
				<NetRef name="+5B"/>
			</ExcludedNets>
		</SignalSearchSettings>
	</HiSpeedRules>

	<Rules version="2.0">
		<RulesWidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.3" widthNom="0.3">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.3" widthNom="0.8">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="POWER"/>
				</ObjectsAffected>
			</WidthOfWires>
		</RulesWidthOfWires>
		<RulesClearancesNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0.3" clrnNom="0.45">
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
				<NetRef name="BA16"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="IRQ_B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="ADR21"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="#TCLK"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DB"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="P1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="ADR20"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="EB1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="0B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BA18"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REST"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BDIN"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="OSC"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="ADR17"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SIA"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="#TDI"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BSIA"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BIAKO"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BA20"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DCLO"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BWTBT"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="IRQ7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BIRQ"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BA21"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-IOW"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SEL"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DIN"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="ADR19"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DOUT"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="#TMS"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="OE_BF"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="ADR16"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BA17"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="IAKO"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="RPLY"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="RPLY_I"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BSEL"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+5B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BA19"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-IOR"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="RES"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="#TDO"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="ADR18"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AEN"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="WTBT"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="AD13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BAD8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="BDOUT"/>
			</NetProperty>
		</NetProperties>
		<PadConnectSettings mode="AutoConnect"/>
	</Rules>

	<Connectivity version="1.3">
		<Vias>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IAKO"/>
				<Org x="227.75" y="75.4"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="220.4" y="91.1"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="227.9" y="38.75"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SD3"/>
				<Org x="221.65" y="46.3"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD8"/>
				<Org x="190.4" y="107.2"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="#TDI"/>
				<Org x="190.35" y="90.9"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="205.4" y="46.1"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="197.75" y="61.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="-IOW"/>
				<Org x="175.4" y="114.05"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="175.4" y="106.65"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR19"/>
				<Org x="175.95" y="83.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="176" y="61.65"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IAKO"/>
				<Org x="227.75" y="80.4"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="EB1"/>
				<Org x="221.65" y="50.6"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SD6"/>
				<Org x="229.31" y="43.11"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD11"/>
				<Org x="190.35" y="108.95"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD2"/>
				<Org x="205.4" y="80.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="WTBT"/>
				<Org x="214.15" y="62.9"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DOUT"/>
				<Org x="197.35" y="56.6"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="190.94" y="55.42"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IAKO"/>
				<Org x="197.35" y="52.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD12"/>
				<Org x="182.9" y="117.2"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD10"/>
				<Org x="183" y="80.91"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="167.65" y="80.6"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="175.85" y="71.8"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D1"/>
				<Org x="175.65" y="63.4"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="174.65" y="67.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD15"/>
				<Org x="182.3" y="56.85"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D0"/>
				<Org x="174.65" y="60"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="OSC"/>
				<Org x="174.95" y="42.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="168.5" y="44.7"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A3"/>
				<Org x="175.45" y="36.45"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A3"/>
				<Org x="167.55" y="36.45"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BDOUT"/>
				<Org x="224.7" y="69"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SD3"/>
				<Org x="218.55" y="46.3"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="EB1"/>
				<Org x="214.87" y="60.36"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D3"/>
				<Org x="207.9" y="76.05"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BDOUT"/>
				<Org x="209.15" y="60.4"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D2"/>
				<Org x="210.65" y="38.75"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BSIA"/>
				<Org x="202.9" y="83.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D2"/>
				<Org x="199.8" y="38.75"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D2"/>
				<Org x="204.75" y="38.75"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="-IOW"/>
				<Org x="191.45" y="114.05"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DB"/>
				<Org x="196.1" y="53.6"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="185.2" y="68.1"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD11"/>
				<Org x="187.45" y="83.95"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D6"/>
				<Org x="186.7" y="60.7"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="EB1"/>
				<Org x="187.9" y="45.2"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD1"/>
				<Org x="177.75" y="83.95"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD2"/>
				<Org x="179.1" y="75.85"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D3"/>
				<Org x="181.15" y="76.05"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD14"/>
				<Org x="179.9" y="60.45"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR18"/>
				<Org x="171.65" y="91.45"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR18"/>
				<Org x="171.65" y="83"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A0"/>
				<Org x="170.55" y="60.1"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR20"/>
				<Org x="173.15" y="53.15"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="166.65" y="83.55"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR19"/>
				<Org x="164.6" y="76.25"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="163.65" y="38.5"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="231.5" y="89.95"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="233.88" y="64.15"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="231.35" y="47.85"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="235.25" y="43.11"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BDOUT"/>
				<Org x="222.95" y="92.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BIAKO"/>
				<Org x="227.2" y="85.2"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DB"/>
				<Org x="224.21" y="72.94"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RPLY_I"/>
				<Org x="225.35" y="66.65"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="P1"/>
				<Org x="219.15" y="65.4"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DIN"/>
				<Org x="216.05" y="52.2"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="218.9" y="52.2"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD2"/>
				<Org x="207.9" y="80.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="207.5" y="69.75"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="207.9" y="56.65"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="207.8" y="58.95"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BSEL"/>
				<Org x="200.4" y="117.8"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="202.9" y="104"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="201.65" y="90.4"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD13"/>
				<Org x="200.4" y="80.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD13"/>
				<Org x="200.4" y="73.05"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="P1"/>
				<Org x="199.75" y="65.3"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="201.65" y="48.7"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD11"/>
				<Org x="194.35" y="116.85"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="192.9" y="100.4"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="196.25" y="105.65"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="-IOW"/>
				<Org x="192.85" y="85.2"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD4"/>
				<Org x="194.11" y="77.95"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SEL"/>
				<Org x="196.65" y="72.45"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="193.25" y="63.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="193.25" y="67.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SIA"/>
				<Org x="193.25" y="55.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="192.8" y="57.5"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="WTBT"/>
				<Org x="197.15" y="58.95"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="195.6" y="48.7"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DIN"/>
				<Org x="194.9" y="51.85"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="189.15" y="97.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD6"/>
				<Org x="186.65" y="86.29"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD7"/>
				<Org x="187.81" y="90.27"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD7"/>
				<Org x="184.14" y="90.27"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD6"/>
				<Org x="183.79" y="85.13"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD4"/>
				<Org x="189.36" y="77.95"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD10"/>
				<Org x="188.11" y="80.91"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD9"/>
				<Org x="186.9" y="82.15"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D7"/>
				<Org x="186" y="64.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ_B"/>
				<Org x="184.95" y="61.9"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SEL"/>
				<Org x="189.5" y="65.55"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD13"/>
				<Org x="188.25" y="66.8"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RPLY_I"/>
				<Org x="187.55" y="58.95"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD12"/>
				<Org x="184.3" y="58.65"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="185.65" y="51.85"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="188.5" y="50.15"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="186.6" y="46.65"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD15"/>
				<Org x="177.9" y="109.05"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD1"/>
				<Org x="177.75" y="80.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR17"/>
				<Org x="180.4" y="73.75"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="176.5" y="66.15"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR16"/>
				<Org x="177.5" y="55.65"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D4"/>
				<Org x="178.1" y="58.05"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR18"/>
				<Org x="181.1" y="58.65"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="#TCLK"/>
				<Org x="180.55" y="50.2"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="179.2" y="51.85"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="REST"/>
				<Org x="181.1" y="47.2"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="179.35" y="36.75"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="174.15" y="96.65"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD12"/>
				<Org x="174.15" y="78.05"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A5"/>
				<Org x="168.8" y="62.85"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="171.15" y="62.6"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR19"/>
				<Org x="171.15" y="57.2"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="171.4" y="54.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A5"/>
				<Org x="168.8" y="59.95"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="#TDO"/>
				<Org x="172.85" y="51.4"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="172.9" y="40.9"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D2"/>
				<Org x="171.65" y="39.45"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="166.65" y="93.05"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="164.25" y="77.98"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="163.15" y="69.75"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="166.48" y="71.81"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ7"/>
				<Org x="164.7" y="73.55"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A0"/>
				<Org x="163.4" y="63.55"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ7"/>
				<Org x="164" y="65.9"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="163.65" y="59.35"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="-IOR"/>
				<Org x="165.05" y="46.7"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="161.25" y="40.9"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="165.25" y="44.7"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ7"/>
				<Org x="161.25" y="43.25"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="165.25" y="37.05"/>
			</Via>
		</Vias>
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA16"/>
				<Subwire width="0.3">
					<Start x="216.65" y="94.15"/>
					<TrackLine>
						<End x="215.4" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA16"/>
				<Subwire width="0.3">
					<Start x="215.4" y="89.15"/>
					<TrackLine>
						<End x="215.4" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="214.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.3">
					<Start x="175.65" y="63.4"/>
					<TrackLine>
						<End x="174.65" y="63.4"/>
					</TrackLine>
					<TrackLine>
						<End x="174.65" y="62.7"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="62.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.3">
					<Start x="174.65" y="60"/>
					<TrackLine>
						<End x="174.65" y="60.75"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="60.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD4"/>
				<Subwire width="0.3">
					<Start x="209.15" y="115.4"/>
					<TrackLine>
						<End x="209.15" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="207.74" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="207.74" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD4"/>
				<Subwire width="0.3">
					<Start x="209.15" y="109.15"/>
					<TrackLine>
						<End x="209.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD5"/>
				<Subwire width="0.3">
					<Start x="204.15" y="97.9"/>
					<TrackLine>
						<End x="204.15" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="92.7"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="92.7"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="86.35"/>
					</TrackLine>
					<TrackLine>
						<End x="190.55" y="86.35"/>
					</TrackLine>
					<TrackLine>
						<End x="190.55" y="76.4"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5" y="76.4"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.3">
					<Start x="178.1" y="58.05"/>
					<TrackLine>
						<End x="178.1" y="62.35"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8" y="62.35"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IRQ_B"/>
				<Subwire width="0.3">
					<Start x="184.95" y="61.9"/>
					<TrackLine>
						<End x="178.7" y="61.9"/>
					</TrackLine>
					<TrackLine>
						<End x="178.7" y="59.25"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3" y="59.25"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3" y="56.85"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="56.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="174.65" y="67.35"/>
					<TrackLine>
						<End x="174.65" y="66.15"/>
					</TrackLine>
					<TrackLine>
						<End x="174.05" y="66.15"/>
					</TrackLine>
					<TrackLine>
						<End x="174.05" y="63.35"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="63.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="166.65" y="93.05"/>
					<TrackLine>
						<End x="166.65" y="83.55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="201.65" y="90.4"/>
					<TrackLine>
						<End x="195.4" y="90.4"/>
					</TrackLine>
					<TrackLine>
						<End x="195.4" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="199.15" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="199.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="202.9" y="104"/>
					<TrackLine>
						<End x="182.9" y="104"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="106.65"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD14"/>
				<Subwire width="0.3">
					<Start x="179.9" y="60.45"/>
					<TrackLine>
						<End x="185.5" y="60.45"/>
					</TrackLine>
					<TrackLine>
						<End x="185.5" y="57.5"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9" y="57.5"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="#TCLK"/>
				<Subwire width="0.3">
					<Start x="180.55" y="50.2"/>
					<TrackLine>
						<End x="183" y="50.2"/>
					</TrackLine>
					<TrackLine>
						<End x="183" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DB"/>
				<Subwire width="0.3">
					<Start x="221.65" y="105.4"/>
					<TrackLine>
						<End x="224.75" y="105.4"/>
					</TrackLine>
					<TrackLine>
						<End x="224.75" y="72.94"/>
					</TrackLine>
					<TrackLine>
						<End x="224.21" y="72.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DB"/>
				<Subwire width="0.3">
					<Start x="224.21" y="72.94"/>
					<TrackLine>
						<End x="221.6" y="72.94"/>
					</TrackLine>
					<TrackLine>
						<End x="221.6" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DB"/>
				<Subwire width="0.3">
					<Start x="196.1" y="53.6"/>
					<TrackLine>
						<End x="196.1" y="50.65"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1" y="50.65"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="219.15" y="65.4"/>
					<TrackLine>
						<End x="219.15" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="54.8"/>
					</TrackLine>
					<TrackLine>
						<End x="235.05" y="54.8"/>
					</TrackLine>
					<TrackLine>
						<End x="235.05" y="88.75"/>
					</TrackLine>
					<TrackLine>
						<End x="230.25" y="88.75"/>
					</TrackLine>
					<TrackLine>
						<End x="230.25" y="124.15"/>
					</TrackLine>
					<TrackLine>
						<End x="165.4" y="124.15"/>
					</TrackLine>
					<TrackLine>
						<End x="165.4" y="110.4"/>
					</TrackLine>
					<TrackLine>
						<End x="164.15" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="199.75" y="65.3"/>
					<TrackLine>
						<End x="195" y="65.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR20"/>
				<Subwire width="0.3">
					<Start x="173.15" y="53.15"/>
					<TrackLine>
						<End x="173.15" y="54.75"/>
					</TrackLine>
					<TrackLine>
						<End x="174.05" y="54.75"/>
					</TrackLine>
					<TrackLine>
						<End x="174.05" y="56.2"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="56.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="187.9" y="45.2"/>
					<TrackLine>
						<End x="187.9" y="44.3"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1" y="44.3"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1" y="45.35"/>
					</TrackLine>
					<TrackLine>
						<End x="174.75" y="45.35"/>
					</TrackLine>
					<TrackLine>
						<End x="174.75" y="50.9"/>
					</TrackLine>
					<TrackLine>
						<End x="174.55" y="50.9"/>
					</TrackLine>
					<TrackLine>
						<End x="174.55" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="222.9" y="66.65"/>
					<TrackLine>
						<End x="222.9" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="214.87" y="60.36"/>
					<TrackLine>
						<End x="214.87" y="51"/>
					</TrackLine>
					<TrackLine>
						<End x="220.45" y="51"/>
					</TrackLine>
					<TrackLine>
						<End x="220.45" y="50.6"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="50.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="171.65" y="39.45"/>
					<TrackLine>
						<End x="170.45" y="39.45"/>
					</TrackLine>
					<TrackLine>
						<End x="170.45" y="51.7"/>
					</TrackLine>
					<TrackLine>
						<End x="169.95" y="51.7"/>
					</TrackLine>
					<TrackLine>
						<End x="169.95" y="58.4"/>
					</TrackLine>
					<TrackLine>
						<End x="171.75" y="58.4"/>
					</TrackLine>
					<TrackLine>
						<End x="171.75" y="59.45"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="59.45"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="204.75" y="38.75"/>
					<TrackLine>
						<End x="199.8" y="38.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="210.65" y="38.75"/>
					<TrackLine>
						<End x="212.9" y="38.75"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD7"/>
				<Subwire width="0.3">
					<Start x="201.65" y="115.4"/>
					<TrackLine>
						<End x="201.65" y="119.05"/>
					</TrackLine>
					<TrackLine>
						<End x="200.12" y="119.05"/>
					</TrackLine>
					<TrackLine>
						<End x="200.12" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD7"/>
				<Subwire width="0.3">
					<Start x="201.65" y="109.15"/>
					<TrackLine>
						<End x="201.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="179.35" y="36.75"/>
					<TrackLine>
						<End x="179.37" y="36.75"/>
					</TrackLine>
					<TrackLine>
						<End x="179.37" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="163.65" y="38.5"/>
					<TrackLine>
						<End x="163.65" y="59.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="163.15" y="69.75"/>
					<TrackLine>
						<End x="174.55" y="69.75"/>
					</TrackLine>
					<TrackLine>
						<End x="174.55" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="166.48" y="71.81"/>
					<TrackLine>
						<End x="166.48" y="71.8"/>
					</TrackLine>
					<TrackLine>
						<End x="175.85" y="71.8"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="164.25" y="83.05"/>
					<TrackLine>
						<End x="164.25" y="77.98"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="164.25" y="77.98"/>
					<TrackLine>
						<End x="161.69" y="77.98"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="164.25" y="83.05"/>
					<TrackLine>
						<End x="161.69" y="83.05"/>
					</TrackLine>
					<TrackLine>
						<End x="161.69" y="83.06"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="172.9" y="46.65"/>
					<TrackLine>
						<End x="171.4" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="171.4" y="54.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="171.15" y="62.6"/>
					<TrackLine>
						<End x="171.15" y="62.05"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="62.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="181.05" y="51.85"/>
					<TrackLine>
						<End x="179.2" y="51.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="179.2" y="51.85"/>
					<TrackLine>
						<End x="179.1" y="51.85"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1" y="48.75"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="48.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="181.05" y="51.85"/>
							<Dot x="181.2773" y="51.9542"/>
							<Dot x="181.05" y="52.45"/>
							<Dot x="180.8227" y="51.9542"/>
						</Teardrop>
					</Teardrops>
					<Start x="181.05" y="51.85"/>
					<TrackLine>
						<End x="181.05" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="175.85" y="71.8"/>
					<TrackLine>
						<End x="175.85" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="184.15" y="48.75"/>
					<TrackLine>
						<End x="184.15" y="50.15"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5" y="50.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="184.15" y="48.75"/>
					<TrackLine>
						<End x="184.15" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="185.2" y="68.1"/>
					<TrackLine>
						<End x="185.6" y="68.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="185.6" y="68.1"/>
							<Dot x="185.8273" y="68.2042"/>
							<Dot x="185.6" y="68.7"/>
							<Dot x="185.3727" y="68.2042"/>
						</Teardrop>
					</Teardrops>
					<Start x="185.6" y="68.1"/>
					<TrackLine>
						<End x="185.6" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="188.7" y="115.5"/>
					<TrackLine>
						<End x="188.15" y="115.5"/>
					</TrackLine>
					<TrackLine>
						<End x="188.15" y="115.4"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="188.66" y="116.86"/>
							<Dot x="188.8873" y="116.9642"/>
							<Dot x="188.66" y="117.46"/>
							<Dot x="188.4327" y="116.9642"/>
						</Teardrop>
					</Teardrops>
					<Start x="189.96" y="122.94"/>
					<TrackLine>
						<End x="188.66" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="188.66" y="116.86"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="188.66" y="116.86"/>
					<TrackLine>
						<End x="188.7" y="116.86"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7" y="115.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="190.8" y="55.42"/>
					<TrackLine>
						<End x="190.94" y="55.42"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="190.94" y="55.42"/>
					<TrackLine>
						<End x="190.94" y="60.1"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5" y="60.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="190.8" y="55.42"/>
							<Dot x="190.5727" y="55.3158"/>
							<Dot x="190.8" y="54.82"/>
							<Dot x="191.0273" y="55.3158"/>
						</Teardrop>
					</Teardrops>
					<Start x="190.8" y="55.42"/>
					<TrackLine>
						<End x="190.8" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="191.5" y="60.1"/>
							<Dot x="191.6042" y="59.8727"/>
							<Dot x="192.1" y="60.1"/>
							<Dot x="191.6042" y="60.3273"/>
						</Teardrop>
					</Teardrops>
					<Start x="191.5" y="60.1"/>
					<TrackLine>
						<End x="195" y="60.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="197.75" y="62.05"/>
							<Dot x="197.6458" y="62.2773"/>
							<Dot x="197.15" y="62.05"/>
							<Dot x="197.6458" y="61.8227"/>
						</Teardrop>
					</Teardrops>
					<Start x="195" y="62.05"/>
					<TrackLine>
						<End x="197.75" y="62.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="197.75" y="62.05"/>
					<TrackLine>
						<End x="197.75" y="61.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="195" y="62.05"/>
					<TrackLine>
						<End x="195" y="62.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="195" y="62.05"/>
					<TrackLine>
						<End x="195" y="61.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="191.5" y="61.4"/>
							<Dot x="191.6042" y="61.1727"/>
							<Dot x="192.1" y="61.4"/>
							<Dot x="191.6042" y="61.6273"/>
						</Teardrop>
					</Teardrops>
					<Start x="195" y="61.4"/>
					<TrackLine>
						<End x="191.5" y="61.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="191.5" y="61.4"/>
					<TrackLine>
						<End x="191.5" y="65.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="191.5" y="65.95"/>
							<Dot x="191.6042" y="65.7227"/>
							<Dot x="192.1" y="65.95"/>
							<Dot x="191.6042" y="66.1773"/>
						</Teardrop>
					</Teardrops>
					<Start x="191.5" y="65.95"/>
					<TrackLine>
						<End x="195" y="65.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="188.7" y="115.5"/>
					<TrackLine>
						<End x="192.9" y="115.5"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="115.4"/>
					<TrackLine>
						<End x="192.9" y="113.9"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="113.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="199.15" y="105.4"/>
					<TrackLine>
						<End x="199.15" y="105.65"/>
					</TrackLine>
					<TrackLine>
						<End x="196.25" y="105.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="196.25" y="105.65"/>
					<TrackLine>
						<End x="194.8" y="105.65"/>
					</TrackLine>
					<TrackLine>
						<End x="194.8" y="105.4"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="210.4" y="56.65"/>
					<TrackLine>
						<End x="207.9" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="207.9" y="56.65"/>
					<TrackLine>
						<End x="207.9" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="235.25" y="43.11"/>
					<TrackLine>
						<End x="235.25" y="44.55"/>
					</TrackLine>
					<TrackLine>
						<End x="227.9" y="44.55"/>
					</TrackLine>
					<TrackLine>
						<End x="227.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="41.65"/>
					<TrackLine>
						<End x="227.9" y="38.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="233.88" y="64.15"/>
					<TrackLine>
						<End x="232.45" y="64.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="232.45" y="69.15"/>
					<TrackLine>
						<End x="230.4" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="232.45" y="69.15"/>
					<TrackLine>
						<End x="232.5" y="69.15"/>
					</TrackLine>
					<TrackLine>
						<End x="232.5" y="87.9"/>
					</TrackLine>
					<TrackLine>
						<End x="229.4" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="176" y="61.65"/>
					<TrackLine>
						<End x="176" y="58.8"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="58.8"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="191.5" y="60.1"/>
					<TrackLine>
						<End x="191.5" y="61.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="115.4"/>
					<TrackLine>
						<End x="221.65" y="113.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="113.9"/>
					<TrackLine>
						<End x="227.9" y="113.9"/>
					</TrackLine>
					<TrackLine>
						<End x="227.9" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="229.4" y="87.9"/>
					<TrackLine>
						<End x="229.4" y="106.65"/>
					</TrackLine>
					<TrackLine>
						<End x="227.9" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="164.25" y="83.05"/>
					<TrackLine>
						<End x="164.25" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="232.45" y="64.15"/>
					<TrackLine>
						<End x="232.45" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="217.9" y="56.65"/>
					<TrackLine>
						<End x="222.9" y="56.65"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9" y="64.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="222.9" y="64.15"/>
					<TrackLine>
						<End x="230.4" y="64.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="230.4" y="64.15"/>
					<TrackLine>
						<End x="232.45" y="64.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="87.9"/>
					<TrackLine>
						<End x="229.4" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD1"/>
				<Subwire width="0.3">
					<Start x="216.65" y="115.4"/>
					<TrackLine>
						<End x="215.36" y="115.4"/>
					</TrackLine>
					<TrackLine>
						<End x="215.36" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD1"/>
				<Subwire width="0.3">
					<Start x="216.65" y="109.15"/>
					<TrackLine>
						<End x="216.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA18"/>
				<Subwire width="0.3">
					<Start x="211.65" y="94.15"/>
					<TrackLine>
						<End x="210.4" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA18"/>
				<Subwire width="0.3">
					<Start x="210.4" y="89.15"/>
					<TrackLine>
						<End x="210.4" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REST"/>
				<Subwire width="0.3">
					<Start x="181.1" y="47.2"/>
					<TrackLine>
						<End x="181.1" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="177.15" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="177.15" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A0"/>
				<Subwire width="0.3">
					<Start x="170.55" y="60.1"/>
					<TrackLine>
						<End x="172.9" y="60.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A0"/>
				<Subwire width="0.3">
					<Start x="163.4" y="63.55"/>
					<TrackLine>
						<End x="159.05" y="63.55"/>
					</TrackLine>
					<TrackLine>
						<End x="159.05" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A5"/>
				<Subwire width="0.3">
					<Start x="168.8" y="62.85"/>
					<TrackLine>
						<End x="170" y="62.85"/>
					</TrackLine>
					<TrackLine>
						<End x="170" y="64"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="64"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A5"/>
				<Subwire width="0.3">
					<Start x="168.8" y="59.95"/>
					<TrackLine>
						<End x="168.8" y="49.9"/>
					</TrackLine>
					<TrackLine>
						<End x="169.85" y="49.9"/>
					</TrackLine>
					<TrackLine>
						<End x="169.85" y="37.05"/>
					</TrackLine>
					<TrackLine>
						<End x="171.75" y="37.05"/>
					</TrackLine>
					<TrackLine>
						<End x="171.75" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD4"/>
				<Subwire width="0.3">
					<Start x="189.36" y="77.95"/>
					<TrackLine>
						<End x="188.85" y="77.95"/>
					</TrackLine>
					<TrackLine>
						<End x="188.85" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD4"/>
				<Subwire width="0.3">
					<Start x="194.11" y="77.95"/>
					<TrackLine>
						<End x="194.11" y="92.07"/>
					</TrackLine>
					<TrackLine>
						<End x="202.86" y="92.07"/>
					</TrackLine>
					<TrackLine>
						<End x="202.86" y="95.36"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="95.36"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BDIN"/>
				<Subwire width="0.3">
					<Start x="197.9" y="89.15"/>
					<TrackLine>
						<End x="197.9" y="82.15"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="82.15"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="64.15"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="64.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD3"/>
				<Subwire width="0.3">
					<Start x="209.15" y="97.9"/>
					<TrackLine>
						<End x="209.15" y="100.35"/>
					</TrackLine>
					<TrackLine>
						<End x="194.7" y="100.35"/>
					</TrackLine>
					<TrackLine>
						<End x="194.7" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="92.05"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="92.05"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="79.65"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="79.65"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="OSC"/>
				<Subwire width="0.3">
					<Start x="174.95" y="42.35"/>
					<TrackLine>
						<End x="198.55" y="42.35"/>
					</TrackLine>
					<TrackLine>
						<End x="198.55" y="60.15"/>
					</TrackLine>
					<TrackLine>
						<End x="196.15" y="60.15"/>
					</TrackLine>
					<TrackLine>
						<End x="196.15" y="60.75"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="60.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR17"/>
				<Subwire width="0.3">
					<Start x="180.4" y="73.75"/>
					<TrackLine>
						<End x="180.4" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SIA"/>
				<Subwire width="0.3">
					<Start x="193.25" y="55.35"/>
					<TrackLine>
						<End x="193.4" y="55.35"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD3"/>
				<Subwire width="0.3">
					<Start x="211.65" y="115.4"/>
					<TrackLine>
						<End x="211.65" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="210.28" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="210.28" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD3"/>
				<Subwire width="0.3">
					<Start x="211.65" y="109.15"/>
					<TrackLine>
						<End x="211.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="#TDI"/>
				<Subwire width="0.3">
					<Start x="190.35" y="90.9"/>
					<TrackLine>
						<End x="191.65" y="90.9"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="75.45"/>
					</TrackLine>
					<TrackLine>
						<End x="190.15" y="75.45"/>
					</TrackLine>
					<TrackLine>
						<End x="190.15" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="171.65" y="105.4"/>
					<TrackLine>
						<End x="172.9" y="105.4"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="117.25"/>
					</TrackLine>
					<TrackLine>
						<End x="177.26" y="117.25"/>
					</TrackLine>
					<TrackLine>
						<End x="177.26" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="202.9" y="83.35"/>
					<TrackLine>
						<End x="220.4" y="83.35"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BIAKO"/>
				<Subwire width="0.3">
					<Start x="176.65" y="110.4"/>
					<TrackLine>
						<End x="176.65" y="112.85"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6" y="112.85"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6" y="86.4"/>
					</TrackLine>
					<TrackLine>
						<End x="227.2" y="86.4"/>
					</TrackLine>
					<TrackLine>
						<End x="227.2" y="85.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA20"/>
				<Subwire width="0.3">
					<Start x="206.65" y="94.15"/>
					<TrackLine>
						<End x="205.4" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA20"/>
				<Subwire width="0.3">
					<Start x="205.4" y="89.15"/>
					<TrackLine>
						<End x="205.4" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="204.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DCLO"/>
				<Subwire width="0.3">
					<Start x="181.65" y="110.4"/>
					<TrackLine>
						<End x="181.65" y="111.65"/>
					</TrackLine>
					<TrackLine>
						<End x="225.4" y="111.65"/>
					</TrackLine>
					<TrackLine>
						<End x="225.4" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="231.65" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="231.65" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="230.4" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DCLO"/>
				<Subwire width="0.3">
					<Start x="181.65" y="115.4"/>
					<TrackLine>
						<End x="181.65" y="118.95"/>
					</TrackLine>
					<TrackLine>
						<End x="183.55" y="118.95"/>
					</TrackLine>
					<TrackLine>
						<End x="183.55" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="182.34" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BWTBT"/>
				<Subwire width="0.3">
					<Start x="219.15" y="94.15"/>
					<TrackLine>
						<End x="217.9" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BWTBT"/>
				<Subwire width="0.3">
					<Start x="217.9" y="89.15"/>
					<TrackLine>
						<End x="216.65" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="161.25" y="43.25"/>
					<TrackLine>
						<End x="161.25" y="62"/>
					</TrackLine>
					<TrackLine>
						<End x="164.6" y="62"/>
					</TrackLine>
					<TrackLine>
						<End x="164.6" y="64.7"/>
					</TrackLine>
					<TrackLine>
						<End x="164" y="64.7"/>
					</TrackLine>
					<TrackLine>
						<End x="164" y="65.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="164.7" y="73.55"/>
					<TrackLine>
						<End x="176.55" y="73.55"/>
					</TrackLine>
					<TrackLine>
						<End x="176.55" y="81.55"/>
					</TrackLine>
					<TrackLine>
						<End x="179.55" y="81.55"/>
					</TrackLine>
					<TrackLine>
						<End x="179.55" y="77.85"/>
					</TrackLine>
					<TrackLine>
						<End x="182.35" y="77.85"/>
					</TrackLine>
					<TrackLine>
						<End x="182.35" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD2"/>
				<Subwire width="0.3">
					<Start x="214.15" y="115.4"/>
					<TrackLine>
						<End x="214.15" y="120.4"/>
					</TrackLine>
					<TrackLine>
						<End x="212.82" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD2"/>
				<Subwire width="0.3">
					<Start x="214.15" y="109.15"/>
					<TrackLine>
						<End x="214.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD6"/>
				<Subwire width="0.3">
					<Start x="204.15" y="115.4"/>
					<TrackLine>
						<End x="204.15" y="117.85"/>
					</TrackLine>
					<TrackLine>
						<End x="202.66" y="117.85"/>
					</TrackLine>
					<TrackLine>
						<End x="202.66" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD6"/>
				<Subwire width="0.3">
					<Start x="204.15" y="109.15"/>
					<TrackLine>
						<End x="204.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BIRQ"/>
				<Subwire width="0.3">
					<Start x="169.15" y="100.4"/>
					<TrackLine>
						<End x="167.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BIRQ"/>
				<Subwire width="0.3">
					<Start x="169.15" y="105.4"/>
					<TrackLine>
						<End x="169.15" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BIRQ"/>
				<Subwire width="0.3">
					<Start x="169.15" y="105.4"/>
					<TrackLine>
						<End x="170.4" y="105.4"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4" y="118.45"/>
					</TrackLine>
					<TrackLine>
						<End x="174.72" y="118.45"/>
					</TrackLine>
					<TrackLine>
						<End x="174.72" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BIRQ"/>
				<Subwire width="0.3">
					<Start x="169.15" y="100.4"/>
					<TrackLine>
						<End x="169.15" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="176.65" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="176.65" y="102.83"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="102.83"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="74.15"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD2"/>
				<Subwire width="0.3">
					<Start x="179.1" y="75.85"/>
					<TrackLine>
						<End x="179.1" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD2"/>
				<Subwire width="0.3">
					<Start x="207.9" y="80.35"/>
					<TrackLine>
						<End x="205.4" y="80.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA21"/>
				<Subwire width="0.3">
					<Start x="204.15" y="94.15"/>
					<TrackLine>
						<End x="204.15" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA21"/>
				<Subwire width="0.3">
					<Start x="202.9" y="89.15"/>
					<TrackLine>
						<End x="201.65" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="201.65" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-IOW"/>
				<Subwire width="0.3">
					<Start x="192.85" y="85.2"/>
					<TrackLine>
						<End x="192.85" y="74.25"/>
					</TrackLine>
					<TrackLine>
						<End x="191.45" y="74.25"/>
					</TrackLine>
					<TrackLine>
						<End x="191.45" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-IOW"/>
				<Subwire width="0.3">
					<Start x="175.4" y="114.05"/>
					<TrackLine>
						<End x="191.45" y="114.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="161.25" y="40.9"/>
					<TrackLine>
						<End x="161.25" y="39.7"/>
					</TrackLine>
					<TrackLine>
						<End x="161.59" y="39.7"/>
					</TrackLine>
					<TrackLine>
						<End x="161.59" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="172.9" y="40.9"/>
					<TrackLine>
						<End x="172.9" y="43.55"/>
					</TrackLine>
					<TrackLine>
						<End x="176.45" y="43.55"/>
					</TrackLine>
					<TrackLine>
						<End x="176.45" y="43.1"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6" y="43.1"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6" y="48.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="201.65" y="48.7"/>
					<TrackLine>
						<End x="201.65" y="52.25"/>
					</TrackLine>
					<TrackLine>
						<End x="200.35" y="52.25"/>
					</TrackLine>
					<TrackLine>
						<End x="200.35" y="64.1"/>
					</TrackLine>
					<TrackLine>
						<End x="198.15" y="64.1"/>
					</TrackLine>
					<TrackLine>
						<End x="198.15" y="64.65"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="64.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD14"/>
				<Subwire width="0.3">
					<Start x="175.4" y="100.4"/>
					<TrackLine>
						<End x="175.4" y="105.4"/>
					</TrackLine>
					<TrackLine>
						<End x="176.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SEL"/>
				<Subwire width="0.3">
					<Start x="196.65" y="72.45"/>
					<TrackLine>
						<End x="196.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SEL"/>
				<Subwire width="0.3">
					<Start x="189.5" y="65.55"/>
					<TrackLine>
						<End x="189.5" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD12"/>
				<Subwire width="0.3">
					<Start x="180.4" y="100.4"/>
					<TrackLine>
						<End x="180.4" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD12"/>
				<Subwire width="0.3">
					<Start x="182.9" y="117.2"/>
					<TrackLine>
						<End x="187.42" y="117.2"/>
					</TrackLine>
					<TrackLine>
						<End x="187.42" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A9"/>
				<Subwire width="0.3">
					<Start x="181.91" y="32.6"/>
					<TrackLine>
						<End x="181.91" y="36.45"/>
					</TrackLine>
					<TrackLine>
						<End x="206.63" y="36.45"/>
					</TrackLine>
					<TrackLine>
						<End x="206.63" y="68.55"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4" y="68.55"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="184.15" y="105.4"/>
					<TrackLine>
						<End x="184.15" y="108.95"/>
					</TrackLine>
					<TrackLine>
						<End x="190.35" y="108.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="194.35" y="116.85"/>
					<TrackLine>
						<End x="189.96" y="116.85"/>
					</TrackLine>
					<TrackLine>
						<End x="189.96" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="182.9" y="100.4"/>
					<TrackLine>
						<End x="182.9" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD15"/>
				<Subwire width="0.3">
					<Start x="172.9" y="100.4"/>
					<TrackLine>
						<End x="174.15" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD15"/>
				<Subwire width="0.3">
					<Start x="174.15" y="105.4"/>
					<TrackLine>
						<End x="174.15" y="109.05"/>
					</TrackLine>
					<TrackLine>
						<End x="177.9" y="109.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DIN"/>
				<Subwire width="0.3">
					<Start x="194.9" y="51.85"/>
					<TrackLine>
						<End x="192.75" y="51.85"/>
					</TrackLine>
					<TrackLine>
						<End x="192.75" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DIN"/>
				<Subwire width="0.3">
					<Start x="216.05" y="52.2"/>
					<TrackLine>
						<End x="216.05" y="61.65"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="171.15" y="57.2"/>
					<TrackLine>
						<End x="171.15" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="55.55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="175.95" y="83.35"/>
					<TrackLine>
						<End x="175.35" y="83.35"/>
					</TrackLine>
					<TrackLine>
						<End x="175.35" y="76.25"/>
					</TrackLine>
					<TrackLine>
						<End x="164.6" y="76.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD5"/>
				<Subwire width="0.3">
					<Start x="206.65" y="115.4"/>
					<TrackLine>
						<End x="206.65" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="205.2" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="205.2" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD5"/>
				<Subwire width="0.3">
					<Start x="206.65" y="109.15"/>
					<TrackLine>
						<End x="206.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DOUT"/>
				<Subwire width="0.3">
					<Start x="197.35" y="56.6"/>
					<TrackLine>
						<End x="196.15" y="56.6"/>
					</TrackLine>
					<TrackLine>
						<End x="196.15" y="56.2"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="56.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="#TMS"/>
				<Subwire width="0.3">
					<Start x="159.15" y="75.44"/>
					<TrackLine>
						<End x="159.15" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="162.9" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="162.9" y="75.05"/>
					</TrackLine>
					<TrackLine>
						<End x="175.95" y="75.05"/>
					</TrackLine>
					<TrackLine>
						<End x="175.95" y="82.15"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6" y="82.15"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6" y="79.05"/>
					</TrackLine>
					<TrackLine>
						<End x="183" y="79.05"/>
					</TrackLine>
					<TrackLine>
						<End x="183" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="OE_BF"/>
				<Subwire width="0.3">
					<Start x="205.4" y="41.65"/>
					<TrackLine>
						<End x="204.05" y="41.65"/>
					</TrackLine>
					<TrackLine>
						<End x="204.05" y="54.05"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="54.05"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="67.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD7"/>
				<Subwire width="0.3">
					<Start x="227.9" y="49.15"/>
					<TrackLine>
						<End x="227.9" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="236.45" y="46"/>
					</TrackLine>
					<TrackLine>
						<End x="236.45" y="38.85"/>
					</TrackLine>
					<TrackLine>
						<End x="232.71" y="38.85"/>
					</TrackLine>
					<TrackLine>
						<End x="232.71" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD6"/>
				<Subwire width="0.3">
					<Start x="229.31" y="43.11"/>
					<TrackLine>
						<End x="229.31" y="41.95"/>
					</TrackLine>
					<TrackLine>
						<End x="230.17" y="41.95"/>
					</TrackLine>
					<TrackLine>
						<End x="230.17" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD5"/>
				<Subwire width="0.3">
					<Start x="222.9" y="49.15"/>
					<TrackLine>
						<End x="222.9" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="226.65" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="226.65" y="36.45"/>
					</TrackLine>
					<TrackLine>
						<End x="227.63" y="36.45"/>
					</TrackLine>
					<TrackLine>
						<End x="227.63" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD1"/>
				<Subwire width="0.3">
					<Start x="212.9" y="49.15"/>
					<TrackLine>
						<End x="212.9" y="46.5"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="46.5"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="32.6"/>
					</TrackLine>
					<TrackLine>
						<End x="217.47" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR16"/>
				<Subwire width="0.3">
					<Start x="177.5" y="55.65"/>
					<TrackLine>
						<End x="176.5" y="55.65"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD6"/>
				<Subwire width="0.3">
					<Start x="183.79" y="85.13"/>
					<TrackLine>
						<End x="183.79" y="83.97"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3" y="83.97"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD6"/>
				<Subwire width="0.3">
					<Start x="186.65" y="86.29"/>
					<TrackLine>
						<End x="186.65" y="98.52"/>
					</TrackLine>
					<TrackLine>
						<End x="195.86" y="98.52"/>
					</TrackLine>
					<TrackLine>
						<End x="195.86" y="99.71"/>
					</TrackLine>
					<TrackLine>
						<End x="201.65" y="99.71"/>
					</TrackLine>
					<TrackLine>
						<End x="201.65" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA17"/>
				<Subwire width="0.3">
					<Start x="214.15" y="94.15"/>
					<TrackLine>
						<End x="212.9" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA17"/>
				<Subwire width="0.3">
					<Start x="212.9" y="89.15"/>
					<TrackLine>
						<End x="212.9" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD15"/>
				<Subwire width="0.3">
					<Start x="182.3" y="56.85"/>
					<TrackLine>
						<End x="183.65" y="56.85"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IAKO"/>
				<Subwire width="0.3">
					<Start x="197.35" y="52.35"/>
					<TrackLine>
						<End x="197.35" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="196.15" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="196.15" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="55.55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IAKO"/>
				<Subwire width="0.3">
					<Start x="227.75" y="80.4"/>
					<TrackLine>
						<End x="227.75" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="174.15" y="78.05"/>
					<TrackLine>
						<End x="174.15" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="174.75" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="174.75" y="85.75"/>
					</TrackLine>
					<TrackLine>
						<End x="177.9" y="85.75"/>
					</TrackLine>
					<TrackLine>
						<End x="177.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="184.3" y="58.65"/>
					<TrackLine>
						<End x="184.3" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD10"/>
				<Subwire width="0.3">
					<Start x="188.11" y="80.91"/>
					<TrackLine>
						<End x="187.55" y="80.91"/>
					</TrackLine>
					<TrackLine>
						<End x="187.55" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD10"/>
				<Subwire width="0.3">
					<Start x="183" y="80.91"/>
					<TrackLine>
						<End x="183" y="82.07"/>
					</TrackLine>
					<TrackLine>
						<End x="182.63" y="82.07"/>
					</TrackLine>
					<TrackLine>
						<End x="182.63" y="86.29"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="86.29"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RPLY"/>
				<Subwire width="0.3">
					<Start x="179.15" y="110.4"/>
					<TrackLine>
						<End x="179.15" y="112.25"/>
					</TrackLine>
					<TrackLine>
						<End x="226" y="112.25"/>
					</TrackLine>
					<TrackLine>
						<End x="226" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="230.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RPLY"/>
				<Subwire width="0.3">
					<Start x="179.15" y="115.4"/>
					<TrackLine>
						<End x="179.15" y="117.85"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5" y="117.85"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="177.26" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A2"/>
				<Subwire width="0.3">
					<Start x="164.13" y="32.6"/>
					<TrackLine>
						<End x="164.13" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="162.45" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="162.45" y="60.8"/>
					</TrackLine>
					<TrackLine>
						<End x="165.2" y="60.8"/>
					</TrackLine>
					<TrackLine>
						<End x="165.2" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="67.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD9"/>
				<Subwire width="0.3">
					<Start x="186.9" y="82.15"/>
					<TrackLine>
						<End x="186.9" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD8"/>
				<Subwire width="0.3">
					<Start x="187.9" y="87.9"/>
					<TrackLine>
						<End x="187.9" y="85.12"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7" y="85.12"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7" y="75.8"/>
					</TrackLine>
					<TrackLine>
						<End x="186.25" y="75.8"/>
					</TrackLine>
					<TrackLine>
						<End x="186.25" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.3">
					<Start x="186" y="64.35"/>
					<TrackLine>
						<End x="179.75" y="64.35"/>
					</TrackLine>
					<TrackLine>
						<End x="179.75" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD4"/>
				<Subwire width="0.3">
					<Start x="220.4" y="49.15"/>
					<TrackLine>
						<End x="220.4" y="47.5"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="47.5"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="39.45"/>
					</TrackLine>
					<TrackLine>
						<End x="225.09" y="39.45"/>
					</TrackLine>
					<TrackLine>
						<End x="225.09" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RPLY_I"/>
				<Subwire width="0.3">
					<Start x="187.55" y="58.95"/>
					<TrackLine>
						<End x="187.55" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RPLY_I"/>
				<Subwire width="0.3">
					<Start x="225.35" y="66.65"/>
					<TrackLine>
						<End x="230.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD11"/>
				<Subwire width="0.3">
					<Start x="187.45" y="83.95"/>
					<TrackLine>
						<End x="189.3" y="83.95"/>
					</TrackLine>
					<TrackLine>
						<End x="189.3" y="79.75"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2" y="79.75"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BSEL"/>
				<Subwire width="0.3">
					<Start x="200.4" y="89.15"/>
					<TrackLine>
						<End x="199.15" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="199.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BSEL"/>
				<Subwire width="0.3">
					<Start x="200.4" y="117.8"/>
					<TrackLine>
						<End x="198.8" y="117.8"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="197.58" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD0"/>
				<Subwire width="0.3">
					<Start x="216.65" y="97.9"/>
					<TrackLine>
						<End x="216.65" y="102.22"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="102.22"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="98.45"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9" y="98.45"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9" y="68.55"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5" y="68.55"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD0"/>
				<Subwire width="0.3">
					<Start x="210.4" y="49.15"/>
					<TrackLine>
						<End x="210.4" y="44.1"/>
					</TrackLine>
					<TrackLine>
						<End x="214.15" y="44.1"/>
					</TrackLine>
					<TrackLine>
						<End x="214.15" y="32.6"/>
					</TrackLine>
					<TrackLine>
						<End x="214.93" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="168.5" y="61.4"/>
							<Dot x="168.6042" y="61.1727"/>
							<Dot x="169.1" y="61.4"/>
							<Dot x="168.6042" y="61.6273"/>
						</Teardrop>
					</Teardrops>
					<Start x="172.9" y="61.4"/>
					<TrackLine>
						<End x="168.5" y="61.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="168.5" y="61.4"/>
					<TrackLine>
						<End x="167.35" y="61.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="168.5" y="64.65"/>
							<Dot x="168.6042" y="64.4227"/>
							<Dot x="169.1" y="64.65"/>
							<Dot x="168.6042" y="64.8773"/>
						</Teardrop>
					</Teardrops>
					<Start x="172.9" y="64.65"/>
					<TrackLine>
						<End x="168.5" y="64.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="167.35" y="61.4"/>
					<TrackLine>
						<End x="167.35" y="64.65"/>
					</TrackLine>
					<TrackLine>
						<End x="168.5" y="64.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="175.85" y="46.65"/>
					<TrackLine>
						<End x="177.9" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="179.4" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="179.4" y="45.15"/>
					</TrackLine>
					<TrackLine>
						<End x="186.48" y="45.15"/>
					</TrackLine>
					<TrackLine>
						<End x="186.48" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="186.6" y="46.65"/>
					<TrackLine>
						<End x="189.15" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="175.85" y="46.65"/>
							<Dot x="176.0773" y="46.7542"/>
							<Dot x="175.85" y="47.25"/>
							<Dot x="175.6227" y="46.7542"/>
						</Teardrop>
					</Teardrops>
					<Start x="175.85" y="46.65"/>
					<TrackLine>
						<End x="175.85" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="185.65" y="51.85"/>
					<TrackLine>
						<End x="185.6" y="51.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="185.6" y="51.85"/>
							<Dot x="185.8273" y="51.9542"/>
							<Dot x="185.6" y="52.45"/>
							<Dot x="185.3727" y="51.9542"/>
						</Teardrop>
					</Teardrops>
					<Start x="185.6" y="51.85"/>
					<TrackLine>
						<End x="185.6" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="192.8" y="57.5"/>
					<TrackLine>
						<End x="195" y="57.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="193.25" y="63.35"/>
					<TrackLine>
						<End x="195" y="63.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="109.15"/>
					<TrackLine>
						<End x="221.65" y="110.65"/>
					</TrackLine>
					<TrackLine>
						<End x="194.4" y="110.65"/>
					</TrackLine>
					<TrackLine>
						<End x="194.4" y="110.4"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="110.4"/>
					<TrackLine>
						<End x="186.65" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="207.8" y="58.95"/>
					<TrackLine>
						<End x="207.5" y="58.95"/>
					</TrackLine>
					<TrackLine>
						<End x="207.5" y="69.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="97.9"/>
					<TrackLine>
						<End x="221.65" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="231.35" y="52.2"/>
					<TrackLine>
						<End x="231.35" y="47.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="165.25" y="44.7"/>
					<TrackLine>
						<End x="165.25" y="37.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="168.5" y="44.7"/>
					<TrackLine>
						<End x="168.5" y="47.25"/>
					</TrackLine>
					<TrackLine>
						<End x="167.35" y="47.25"/>
					</TrackLine>
					<TrackLine>
						<End x="167.35" y="61.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="190.8" y="68.25"/>
					<TrackLine>
						<End x="186.7" y="68.25"/>
					</TrackLine>
					<TrackLine>
						<End x="186.7" y="66.65"/>
					</TrackLine>
					<TrackLine>
						<End x="181.05" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="181.05" y="66.65"/>
							<Dot x="181.2773" y="66.7542"/>
							<Dot x="181.05" y="67.25"/>
							<Dot x="180.8227" y="66.7542"/>
						</Teardrop>
					</Teardrops>
					<Start x="181.05" y="66.65"/>
					<TrackLine>
						<End x="181.05" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="190.8" y="68.25"/>
							<Dot x="191.0273" y="68.3542"/>
							<Dot x="190.8" y="68.85"/>
							<Dot x="190.5727" y="68.3542"/>
						</Teardrop>
					</Teardrops>
					<Start x="190.8" y="68.25"/>
					<TrackLine>
						<End x="190.8" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="219.15" y="77.9"/>
					<TrackLine>
						<End x="219.15" y="76.4"/>
					</TrackLine>
					<TrackLine>
						<End x="219.4" y="76.4"/>
					</TrackLine>
					<TrackLine>
						<End x="219.4" y="74.15"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="92.9"/>
					<TrackLine>
						<End x="227.9" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="100.4"/>
					<TrackLine>
						<End x="190.4" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="218.9" y="52.2"/>
					<TrackLine>
						<End x="231.35" y="52.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="231.35" y="52.2"/>
					<TrackLine>
						<End x="235.9" y="52.2"/>
					</TrackLine>
					<TrackLine>
						<End x="235.9" y="89.95"/>
					</TrackLine>
					<TrackLine>
						<End x="231.5" y="89.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="61.65"/>
					<TrackLine>
						<End x="203.9" y="61.65"/>
					</TrackLine>
					<TrackLine>
						<End x="203.9" y="54.9"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="54.9"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="49.15"/>
					<TrackLine>
						<End x="205.4" y="46.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="190.8" y="68.25"/>
					<TrackLine>
						<End x="190.8" y="67.35"/>
					</TrackLine>
					<TrackLine>
						<End x="193.25" y="67.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD0"/>
				<Subwire width="0.3">
					<Start x="219.15" y="115.4"/>
					<TrackLine>
						<End x="217.9" y="115.4"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD0"/>
				<Subwire width="0.3">
					<Start x="219.15" y="109.15"/>
					<TrackLine>
						<End x="219.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA19"/>
				<Subwire width="0.3">
					<Start x="209.15" y="94.15"/>
					<TrackLine>
						<End x="207.9" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="207.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA19"/>
				<Subwire width="0.3">
					<Start x="207.9" y="89.15"/>
					<TrackLine>
						<End x="207.9" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A4"/>
				<Subwire width="0.3">
					<Start x="172.9" y="65.3"/>
					<TrackLine>
						<End x="169.95" y="65.3"/>
					</TrackLine>
					<TrackLine>
						<End x="169.95" y="65.5"/>
					</TrackLine>
					<TrackLine>
						<End x="166.45" y="65.5"/>
					</TrackLine>
					<TrackLine>
						<End x="166.45" y="40.65"/>
					</TrackLine>
					<TrackLine>
						<End x="169.21" y="40.65"/>
					</TrackLine>
					<TrackLine>
						<End x="169.21" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD7"/>
				<Subwire width="0.3">
					<Start x="184.14" y="90.27"/>
					<TrackLine>
						<End x="184.14" y="86.29"/>
					</TrackLine>
					<TrackLine>
						<End x="184.95" y="86.29"/>
					</TrackLine>
					<TrackLine>
						<End x="184.95" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD7"/>
				<Subwire width="0.3">
					<Start x="187.81" y="90.27"/>
					<TrackLine>
						<End x="187.81" y="93.87"/>
					</TrackLine>
					<TrackLine>
						<End x="197.66" y="93.87"/>
					</TrackLine>
					<TrackLine>
						<End x="197.66" y="97.9"/>
					</TrackLine>
					<TrackLine>
						<End x="199.15" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.3">
					<Start x="186.7" y="60.7"/>
					<TrackLine>
						<End x="186.7" y="63.1"/>
					</TrackLine>
					<TrackLine>
						<End x="178.45" y="63.1"/>
					</TrackLine>
					<TrackLine>
						<End x="178.45" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-IOR"/>
				<Subwire width="0.3">
					<Start x="165.05" y="46.7"/>
					<TrackLine>
						<End x="165.05" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="165.8" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="165.8" y="66.6"/>
					</TrackLine>
					<TrackLine>
						<End x="171.15" y="66.6"/>
					</TrackLine>
					<TrackLine>
						<End x="171.15" y="65.95"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="65.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="176.5" y="66.15"/>
					<TrackLine>
						<End x="176.5" y="64.95"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2" y="64.95"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2" y="59.85"/>
					</TrackLine>
					<TrackLine>
						<End x="176.6" y="59.85"/>
					</TrackLine>
					<TrackLine>
						<End x="176.6" y="57.5"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="57.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="174.15" y="96.65"/>
					<TrackLine>
						<End x="174.15" y="80.6"/>
					</TrackLine>
					<TrackLine>
						<End x="167.65" y="80.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="220.4" y="91.1"/>
					<TrackLine>
						<End x="220.4" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="207.9" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="207.9" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="96.65"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="96.65"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="99.11"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5" y="99.11"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5" y="97.35"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="97.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="#TDO"/>
				<Subwire width="0.3">
					<Start x="172.85" y="51.4"/>
					<TrackLine>
						<End x="172.85" y="49.1"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="49.1"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5" y="44.75"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5" y="43.7"/>
					</TrackLine>
					<TrackLine>
						<End x="191" y="43.7"/>
					</TrackLine>
					<TrackLine>
						<End x="191" y="49.1"/>
					</TrackLine>
					<TrackLine>
						<End x="190.15" y="49.1"/>
					</TrackLine>
					<TrackLine>
						<End x="190.15" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A6"/>
				<Subwire width="0.3">
					<Start x="174.29" y="32.6"/>
					<TrackLine>
						<End x="174.29" y="41.15"/>
					</TrackLine>
					<TrackLine>
						<End x="199.15" y="41.15"/>
					</TrackLine>
					<TrackLine>
						<End x="199.15" y="62.9"/>
					</TrackLine>
					<TrackLine>
						<End x="196.95" y="62.9"/>
					</TrackLine>
					<TrackLine>
						<End x="196.95" y="64"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="64"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR18"/>
				<Subwire width="0.3">
					<Start x="181.1" y="58.65"/>
					<TrackLine>
						<End x="181.1" y="55.7"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1" y="55.7"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR18"/>
				<Subwire width="0.3">
					<Start x="171.65" y="91.45"/>
					<TrackLine>
						<End x="171.65" y="83"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD3"/>
				<Subwire width="0.3">
					<Start x="218.55" y="46.3"/>
					<TrackLine>
						<End x="218.55" y="47.5"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="47.5"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD3"/>
				<Subwire width="0.3">
					<Start x="221.65" y="46.3"/>
					<TrackLine>
						<End x="221.65" y="38.25"/>
					</TrackLine>
					<TrackLine>
						<End x="222.55" y="38.25"/>
					</TrackLine>
					<TrackLine>
						<End x="222.55" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AEN"/>
				<Subwire width="0.3">
					<Start x="192.75" y="69.85"/>
					<TrackLine>
						<End x="192.75" y="71"/>
					</TrackLine>
					<TrackLine>
						<End x="194.65" y="71"/>
					</TrackLine>
					<TrackLine>
						<End x="194.65" y="70.65"/>
					</TrackLine>
					<TrackLine>
						<End x="206" y="70.65"/>
					</TrackLine>
					<TrackLine>
						<End x="206" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="54"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="54"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="209.85" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="209.85" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A7"/>
				<Subwire width="0.3">
					<Start x="176.83" y="32.6"/>
					<TrackLine>
						<End x="176.83" y="39.95"/>
					</TrackLine>
					<TrackLine>
						<End x="203.45" y="39.95"/>
					</TrackLine>
					<TrackLine>
						<End x="203.45" y="53.45"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3" y="53.45"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="67.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD1"/>
				<Subwire width="0.3">
					<Start x="177.75" y="80.35"/>
					<TrackLine>
						<End x="177.75" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="177.15" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="177.15" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD1"/>
				<Subwire width="0.3">
					<Start x="177.75" y="83.95"/>
					<TrackLine>
						<End x="179.15" y="83.95"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="93.25"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="93.25"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="101.61"/>
					</TrackLine>
					<TrackLine>
						<End x="214.15" y="101.61"/>
					</TrackLine>
					<TrackLine>
						<End x="214.15" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="175.45" y="36.45"/>
					<TrackLine>
						<End x="175.45" y="40.55"/>
					</TrackLine>
					<TrackLine>
						<End x="202.85" y="40.55"/>
					</TrackLine>
					<TrackLine>
						<End x="202.85" y="52.85"/>
					</TrackLine>
					<TrackLine>
						<End x="201.7" y="52.85"/>
					</TrackLine>
					<TrackLine>
						<End x="201.7" y="66.6"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="66.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="167.55" y="36.45"/>
					<TrackLine>
						<End x="166.67" y="36.45"/>
					</TrackLine>
					<TrackLine>
						<End x="166.67" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD2"/>
				<Subwire width="0.3">
					<Start x="215.4" y="49.15"/>
					<TrackLine>
						<End x="215.4" y="47.7"/>
					</TrackLine>
					<TrackLine>
						<End x="217.25" y="47.7"/>
					</TrackLine>
					<TrackLine>
						<End x="217.25" y="44.1"/>
					</TrackLine>
					<TrackLine>
						<End x="219.18" y="44.1"/>
					</TrackLine>
					<TrackLine>
						<End x="219.18" y="32.6"/>
					</TrackLine>
					<TrackLine>
						<End x="220.01" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.3">
					<Start x="181.15" y="76.05"/>
					<TrackLine>
						<End x="181.15" y="74.85"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7" y="74.85"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.3">
					<Start x="207.9" y="76.05"/>
					<TrackLine>
						<End x="212.25" y="76.05"/>
					</TrackLine>
					<TrackLine>
						<End x="212.25" y="52.2"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="52.2"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="45.3"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="45.3"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="WTBT"/>
				<Subwire width="0.3">
					<Start x="197.15" y="58.95"/>
					<TrackLine>
						<End x="197.15" y="58.15"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="58.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="WTBT"/>
				<Subwire width="0.3">
					<Start x="214.15" y="62.9"/>
					<TrackLine>
						<End x="214.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="188.25" y="66.8"/>
					<TrackLine>
						<End x="188.25" y="64.3"/>
					</TrackLine>
					<TrackLine>
						<End x="188.85" y="64.3"/>
					</TrackLine>
					<TrackLine>
						<End x="188.85" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="200.4" y="80.35"/>
					<TrackLine>
						<End x="200.4" y="73.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.3">
					<Start x="220.4" y="41.65"/>
					<TrackLine>
						<End x="220.4" y="44.1"/>
					</TrackLine>
					<TrackLine>
						<End x="219.8" y="44.1"/>
					</TrackLine>
					<TrackLine>
						<End x="219.8" y="47.5"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="47.5"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="71.25"/>
					</TrackLine>
					<TrackLine>
						<End x="195.25" y="71.25"/>
					</TrackLine>
					<TrackLine>
						<End x="195.25" y="72.2"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1" y="72.2"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD8"/>
				<Subwire width="0.3">
					<Start x="199.15" y="109.15"/>
					<TrackLine>
						<End x="199.15" y="107.2"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4" y="107.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD8"/>
				<Subwire width="0.3">
					<Start x="199.15" y="115.4"/>
					<TrackLine>
						<End x="197.58" y="115.4"/>
					</TrackLine>
					<TrackLine>
						<End x="197.58" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="222.95" y="92.35"/>
					<TrackLine>
						<End x="222.95" y="87.25"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="87.25"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="83.95"/>
					</TrackLine>
					<TrackLine>
						<End x="221" y="83.95"/>
					</TrackLine>
					<TrackLine>
						<End x="221" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="224.7" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="224.7" y="69"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="209.15" y="60.4"/>
					<TrackLine>
						<End x="209.15" y="66.65"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA16"/>
				<Subwire width="0.3">
					<Start x="216.65" y="94.15"/>
					<TrackLine>
						<End x="216.65" y="96.6"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="96.6"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="117.85"/>
					</TrackLine>
					<TrackLine>
						<End x="216.6" y="117.85"/>
					</TrackLine>
					<TrackLine>
						<End x="216.6" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="215.36" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.3">
					<Start x="175.65" y="63.4"/>
					<TrackLine>
						<End x="177.2" y="63.4"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2" y="60.45"/>
					</TrackLine>
					<TrackLine>
						<End x="176.3" y="60.45"/>
					</TrackLine>
					<TrackLine>
						<End x="176.3" y="54.25"/>
					</TrackLine>
					<TrackLine>
						<End x="182.35" y="54.25"/>
					</TrackLine>
					<TrackLine>
						<End x="182.35" y="48.25"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3" y="48.25"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3" y="42.8"/>
					</TrackLine>
					<TrackLine>
						<End x="203.45" y="42.8"/>
					</TrackLine>
					<TrackLine>
						<End x="203.45" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="43.5"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.3">
					<Start x="174.65" y="60"/>
					<TrackLine>
						<End x="174.65" y="58.8"/>
					</TrackLine>
					<TrackLine>
						<End x="175.45" y="58.8"/>
					</TrackLine>
					<TrackLine>
						<End x="175.45" y="53.65"/>
					</TrackLine>
					<TrackLine>
						<End x="181.75" y="53.65"/>
					</TrackLine>
					<TrackLine>
						<End x="181.75" y="48.85"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9" y="48.85"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9" y="41.15"/>
					</TrackLine>
					<TrackLine>
						<End x="203.6" y="41.15"/>
					</TrackLine>
					<TrackLine>
						<End x="203.6" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="207.9" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="207.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD4"/>
				<Subwire width="0.3">
					<Start x="209.15" y="115.4"/>
					<TrackLine>
						<End x="209.15" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.3">
					<Start x="178.1" y="58.05"/>
					<TrackLine>
						<End x="178.1" y="56.85"/>
					</TrackLine>
					<TrackLine>
						<End x="178.7" y="56.85"/>
					</TrackLine>
					<TrackLine>
						<End x="178.7" y="55.05"/>
					</TrackLine>
					<TrackLine>
						<End x="183.15" y="55.05"/>
					</TrackLine>
					<TrackLine>
						<End x="183.15" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="43.4"/>
					</TrackLine>
					<TrackLine>
						<End x="202.85" y="43.4"/>
					</TrackLine>
					<TrackLine>
						<End x="202.85" y="44.1"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="44.1"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IRQ_B"/>
				<Subwire width="0.3">
					<Start x="184.95" y="61.9"/>
					<TrackLine>
						<End x="195.05" y="61.9"/>
					</TrackLine>
					<TrackLine>
						<End x="195.05" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="201.65" y="90.4"/>
					<TrackLine>
						<End x="202.9" y="90.4"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="104"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="166.65" y="83.55"/>
					<TrackLine>
						<End x="168.85" y="83.55"/>
					</TrackLine>
					<TrackLine>
						<End x="168.85" y="67.35"/>
					</TrackLine>
					<TrackLine>
						<End x="174.65" y="67.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="175.4" y="106.65"/>
					<TrackLine>
						<End x="166.65" y="106.65"/>
					</TrackLine>
					<TrackLine>
						<End x="166.65" y="93.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD14"/>
				<Subwire width="0.3">
					<Start x="179.9" y="60.45"/>
					<TrackLine>
						<End x="179.9" y="68.55"/>
					</TrackLine>
					<TrackLine>
						<End x="169.45" y="68.55"/>
					</TrackLine>
					<TrackLine>
						<End x="169.45" y="85.95"/>
					</TrackLine>
					<TrackLine>
						<End x="168.55" y="85.95"/>
					</TrackLine>
					<TrackLine>
						<End x="168.55" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="#TCLK"/>
				<Subwire width="0.3">
					<Start x="180.55" y="50.2"/>
					<TrackLine>
						<End x="159.15" y="50.2"/>
					</TrackLine>
					<TrackLine>
						<End x="159.15" y="72.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="DB"/>
				<Subwire width="0.3">
					<Start x="224.21" y="72.94"/>
					<TrackLine>
						<End x="227.15" y="72.94"/>
					</TrackLine>
					<TrackLine>
						<End x="227.15" y="54"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1" y="54"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="219.15" y="65.4"/>
					<TrackLine>
						<End x="200.95" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="200.95" y="65.3"/>
					</TrackLine>
					<TrackLine>
						<End x="199.75" y="65.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR20"/>
				<Subwire width="0.3">
					<Start x="173.15" y="53.15"/>
					<TrackLine>
						<End x="161" y="53.15"/>
					</TrackLine>
					<TrackLine>
						<End x="161" y="71.55"/>
					</TrackLine>
					<TrackLine>
						<End x="162.9" y="71.55"/>
					</TrackLine>
					<TrackLine>
						<End x="162.9" y="89.75"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="89.75"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="175.35" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="175.35" y="78.45"/>
					</TrackLine>
					<TrackLine>
						<End x="186.55" y="78.45"/>
					</TrackLine>
					<TrackLine>
						<End x="186.55" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="201.65" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="201.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="216.65" y="77.9"/>
					<TrackLine>
						<End x="215.4" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="87.25"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="87.25"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="91.6"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="91.6"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="221.65" y="50.6"/>
					<TrackLine>
						<End x="221.65" y="47.5"/>
					</TrackLine>
					<TrackLine>
						<End x="193.2" y="47.5"/>
					</TrackLine>
					<TrackLine>
						<End x="193.2" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9" y="45.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="222.9" y="66.65"/>
					<TrackLine>
						<End x="220.95" y="66.65"/>
					</TrackLine>
					<TrackLine>
						<End x="220.95" y="60.36"/>
					</TrackLine>
					<TrackLine>
						<End x="214.87" y="60.36"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="214.87" y="60.36"/>
					<TrackLine>
						<End x="214.87" y="59.15"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="59.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="199.8" y="38.75"/>
					<TrackLine>
						<End x="198.6" y="38.75"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6" y="38.85"/>
					</TrackLine>
					<TrackLine>
						<End x="172.85" y="38.85"/>
					</TrackLine>
					<TrackLine>
						<End x="172.85" y="39.45"/>
					</TrackLine>
					<TrackLine>
						<End x="171.65" y="39.45"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="210.65" y="38.75"/>
					<TrackLine>
						<End x="204.75" y="38.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD7"/>
				<Subwire width="0.3">
					<Start x="201.65" y="115.4"/>
					<TrackLine>
						<End x="201.65" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="163.65" y="59.35"/>
					<TrackLine>
						<End x="162.2" y="59.35"/>
					</TrackLine>
					<TrackLine>
						<End x="162.2" y="68.55"/>
					</TrackLine>
					<TrackLine>
						<End x="163.15" y="68.55"/>
					</TrackLine>
					<TrackLine>
						<End x="163.15" y="69.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="179.35" y="36.75"/>
					<TrackLine>
						<End x="178.15" y="36.75"/>
					</TrackLine>
					<TrackLine>
						<End x="178.15" y="37.65"/>
					</TrackLine>
					<TrackLine>
						<End x="167.85" y="37.65"/>
					</TrackLine>
					<TrackLine>
						<End x="167.85" y="38.5"/>
					</TrackLine>
					<TrackLine>
						<End x="163.65" y="38.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="164.25" y="77.98"/>
					<TrackLine>
						<End x="166.48" y="77.98"/>
					</TrackLine>
					<TrackLine>
						<End x="166.48" y="71.81"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="166.48" y="71.81"/>
					<TrackLine>
						<End x="166.48" y="65.1"/>
					</TrackLine>
					<TrackLine>
						<End x="171.15" y="65.1"/>
					</TrackLine>
					<TrackLine>
						<End x="171.15" y="62.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="171.15" y="62.6"/>
					<TrackLine>
						<End x="172.8" y="62.6"/>
					</TrackLine>
					<TrackLine>
						<End x="172.8" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="172.9" y="46.65"/>
					<TrackLine>
						<End x="172.9" y="48.15"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6" y="48.15"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6" y="32.6"/>
					</TrackLine>
					<TrackLine>
						<End x="159.05" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="172.8" y="55.15"/>
					<TrackLine>
						<End x="171.4" y="55.15"/>
					</TrackLine>
					<TrackLine>
						<End x="171.4" y="54.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="115.4"/>
					<TrackLine>
						<End x="195.72" y="115.4"/>
					</TrackLine>
					<TrackLine>
						<End x="195.72" y="105.65"/>
					</TrackLine>
					<TrackLine>
						<End x="196.25" y="105.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="196.25" y="105.65"/>
					<TrackLine>
						<End x="196.25" y="86.9"/>
					</TrackLine>
					<TrackLine>
						<End x="196.65" y="86.9"/>
					</TrackLine>
					<TrackLine>
						<End x="196.65" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="87.9"/>
					<TrackLine>
						<End x="226.4" y="87.9"/>
					</TrackLine>
					<TrackLine>
						<End x="226.4" y="87.65"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="87.65"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="233.88" y="64.15"/>
					<TrackLine>
						<End x="233.8" y="64.15"/>
					</TrackLine>
					<TrackLine>
						<End x="233.8" y="43.11"/>
					</TrackLine>
					<TrackLine>
						<End x="235.25" y="43.11"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="235.25" y="43.11"/>
					<TrackLine>
						<End x="235.25" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="172.8" y="55.15"/>
					<TrackLine>
						<End x="172.8" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="190.94" y="55.42"/>
					<TrackLine>
						<End x="190.94" y="50.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="199.15" y="105.4"/>
					<TrackLine>
						<End x="199.15" y="107.69"/>
					</TrackLine>
					<TrackLine>
						<End x="197.69" y="107.69"/>
					</TrackLine>
					<TrackLine>
						<End x="197.69" y="116.86"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8" y="116.86"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="198.8" y="116.86"/>
							<Dot x="199.0273" y="116.9642"/>
							<Dot x="198.8" y="117.46"/>
							<Dot x="198.5727" y="116.9642"/>
						</Teardrop>
					</Teardrops>
					<Start x="198.8" y="116.86"/>
					<TrackLine>
						<End x="198.8" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="200.12" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="179.2" y="51.85"/>
					<TrackLine>
						<End x="174.6" y="51.85"/>
					</TrackLine>
					<TrackLine>
						<End x="174.6" y="55.15"/>
					</TrackLine>
					<TrackLine>
						<End x="172.8" y="55.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="176" y="61.65"/>
					<TrackLine>
						<End x="172.8" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="175.85" y="71.8"/>
					<TrackLine>
						<End x="185.2" y="71.8"/>
					</TrackLine>
					<TrackLine>
						<End x="185.2" y="68.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="188.5" y="50.15"/>
					<TrackLine>
						<End x="190.94" y="50.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="190.94" y="50.15"/>
					<TrackLine>
						<End x="200.4" y="50.15"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="50.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="207.9" y="56.65"/>
					<TrackLine>
						<End x="205.4" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="56.65"/>
					<TrackLine>
						<End x="201" y="56.65"/>
					</TrackLine>
					<TrackLine>
						<End x="201" y="61.35"/>
					</TrackLine>
					<TrackLine>
						<End x="197.75" y="61.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="38.75"/>
					<TrackLine>
						<End x="212.39" y="38.75"/>
					</TrackLine>
					<TrackLine>
						<End x="212.39" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="210.4" y="56.65"/>
					<TrackLine>
						<End x="217.9" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD1"/>
				<Subwire width="0.3">
					<Start x="216.65" y="115.4"/>
					<TrackLine>
						<End x="216.65" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA18"/>
				<Subwire width="0.3">
					<Start x="211.65" y="94.15"/>
					<TrackLine>
						<End x="212.9" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="211.5" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="211.5" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="210.28" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REST"/>
				<Subwire width="0.3">
					<Start x="181.1" y="47.2"/>
					<TrackLine>
						<End x="181.1" y="42.2"/>
					</TrackLine>
					<TrackLine>
						<End x="204.05" y="42.2"/>
					</TrackLine>
					<TrackLine>
						<End x="204.05" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="51.6"/>
					</TrackLine>
					<TrackLine>
						<End x="228.95" y="51.6"/>
					</TrackLine>
					<TrackLine>
						<End x="228.95" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="230.4" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A0"/>
				<Subwire width="0.3">
					<Start x="163.4" y="63.55"/>
					<TrackLine>
						<End x="164.85" y="63.55"/>
					</TrackLine>
					<TrackLine>
						<End x="164.85" y="58.75"/>
					</TrackLine>
					<TrackLine>
						<End x="170.55" y="58.75"/>
					</TrackLine>
					<TrackLine>
						<End x="170.55" y="60.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A5"/>
				<Subwire width="0.3">
					<Start x="168.8" y="62.85"/>
					<TrackLine>
						<End x="168.8" y="59.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD4"/>
				<Subwire width="0.3">
					<Start x="189.36" y="77.95"/>
					<TrackLine>
						<End x="194.11" y="77.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDIN"/>
				<Subwire width="0.3">
					<Start x="197.9" y="89.15"/>
					<TrackLine>
						<End x="197.9" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDIN"/>
				<Subwire width="0.3">
					<Start x="197.9" y="94.15"/>
					<TrackLine>
						<End x="197.9" y="106.82"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6" y="106.82"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6" y="116.85"/>
					</TrackLine>
					<TrackLine>
						<End x="196.25" y="116.85"/>
					</TrackLine>
					<TrackLine>
						<End x="196.25" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="195.04" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDIN"/>
				<Subwire width="0.3">
					<Start x="197.9" y="94.15"/>
					<TrackLine>
						<End x="199.15" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="OSC"/>
				<Subwire width="0.3">
					<Start x="174.95" y="42.35"/>
					<TrackLine>
						<End x="163.05" y="42.35"/>
					</TrackLine>
					<TrackLine>
						<End x="163.05" y="45.05"/>
					</TrackLine>
					<TrackLine>
						<End x="159.45" y="45.05"/>
					</TrackLine>
					<TrackLine>
						<End x="159.45" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="161.59" y="35.85"/>
					</TrackLine>
					<TrackLine>
						<End x="161.59" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR17"/>
				<Subwire width="0.3">
					<Start x="180.4" y="73.75"/>
					<TrackLine>
						<End x="181.6" y="73.75"/>
					</TrackLine>
					<TrackLine>
						<End x="181.6" y="74.85"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="74.85"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SIA"/>
				<Subwire width="0.3">
					<Start x="193.25" y="55.35"/>
					<TrackLine>
						<End x="194.45" y="55.35"/>
					</TrackLine>
					<TrackLine>
						<End x="194.45" y="54.8"/>
					</TrackLine>
					<TrackLine>
						<End x="226.55" y="54.8"/>
					</TrackLine>
					<TrackLine>
						<End x="226.55" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="221.6" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="221.6" y="69.15"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD3"/>
				<Subwire width="0.3">
					<Start x="211.65" y="115.4"/>
					<TrackLine>
						<End x="211.65" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="#TDI"/>
				<Subwire width="0.3">
					<Start x="190.35" y="90.9"/>
					<TrackLine>
						<End x="190.35" y="92.65"/>
					</TrackLine>
					<TrackLine>
						<End x="169.05" y="92.65"/>
					</TrackLine>
					<TrackLine>
						<End x="169.05" y="90.95"/>
					</TrackLine>
					<TrackLine>
						<End x="160.4" y="90.95"/>
					</TrackLine>
					<TrackLine>
						<End x="160.4" y="77.98"/>
					</TrackLine>
					<TrackLine>
						<End x="159.15" y="77.98"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="171.65" y="100.4"/>
					<TrackLine>
						<End x="170.4" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="171.65" y="105.4"/>
					<TrackLine>
						<End x="171.65" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="171.65" y="100.4"/>
					<TrackLine>
						<End x="171.65" y="93.25"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="93.25"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="83.35"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="83.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BIAKO"/>
				<Subwire width="0.3">
					<Start x="227.2" y="85.2"/>
					<TrackLine>
						<End x="227.2" y="84"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="84"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="79.75"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="79.75"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BIAKO"/>
				<Subwire width="0.3">
					<Start x="176.65" y="110.4"/>
					<TrackLine>
						<End x="176.65" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BIAKO"/>
				<Subwire width="0.3">
					<Start x="176.65" y="115.4"/>
					<TrackLine>
						<End x="176.65" y="117.85"/>
					</TrackLine>
					<TrackLine>
						<End x="175.95" y="117.85"/>
					</TrackLine>
					<TrackLine>
						<End x="175.95" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="174.72" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA20"/>
				<Subwire width="0.3">
					<Start x="206.65" y="94.15"/>
					<TrackLine>
						<End x="207.9" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="207.9" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="206.45" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="206.45" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="205.2" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="DCLO"/>
				<Subwire width="0.3">
					<Start x="181.65" y="110.4"/>
					<TrackLine>
						<End x="181.65" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BWTBT"/>
				<Subwire width="0.3">
					<Start x="219.15" y="94.15"/>
					<TrackLine>
						<End x="220.4" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="164" y="65.9"/>
					<TrackLine>
						<End x="164" y="67.1"/>
					</TrackLine>
					<TrackLine>
						<End x="164.7" y="67.1"/>
					</TrackLine>
					<TrackLine>
						<End x="164.7" y="73.55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="161.25" y="43.25"/>
					<TrackLine>
						<End x="160.05" y="43.25"/>
					</TrackLine>
					<TrackLine>
						<End x="160.05" y="39.7"/>
					</TrackLine>
					<TrackLine>
						<End x="169.65" y="39.7"/>
					</TrackLine>
					<TrackLine>
						<End x="169.65" y="38.25"/>
					</TrackLine>
					<TrackLine>
						<End x="184.45" y="38.25"/>
					</TrackLine>
					<TrackLine>
						<End x="184.45" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD2"/>
				<Subwire width="0.3">
					<Start x="214.15" y="115.4"/>
					<TrackLine>
						<End x="214.15" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD6"/>
				<Subwire width="0.3">
					<Start x="204.15" y="115.4"/>
					<TrackLine>
						<End x="204.15" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD2"/>
				<Subwire width="0.3">
					<Start x="205.4" y="80.35"/>
					<TrackLine>
						<End x="205.4" y="76.05"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="76.05"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="77.25"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1" y="77.25"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1" y="75.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD2"/>
				<Subwire width="0.3">
					<Start x="207.9" y="80.35"/>
					<TrackLine>
						<End x="207.9" y="87.25"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="87.25"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="91.6"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="91.6"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="96"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA21"/>
				<Subwire width="0.3">
					<Start x="204.15" y="94.15"/>
					<TrackLine>
						<End x="205.4" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="203.9" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="203.9" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="202.66" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-IOW"/>
				<Subwire width="0.3">
					<Start x="191.45" y="114.05"/>
					<TrackLine>
						<End x="194.75" y="114.05"/>
					</TrackLine>
					<TrackLine>
						<End x="194.75" y="102.8"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2" y="102.8"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2" y="85.2"/>
					</TrackLine>
					<TrackLine>
						<End x="192.85" y="85.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-IOW"/>
				<Subwire width="0.3">
					<Start x="175.4" y="114.05"/>
					<TrackLine>
						<End x="157.9" y="114.05"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9" y="49"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="49"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="40.55"/>
					</TrackLine>
					<TrackLine>
						<End x="202.85" y="40.55"/>
					</TrackLine>
					<TrackLine>
						<End x="202.85" y="36.45"/>
					</TrackLine>
					<TrackLine>
						<End x="204.77" y="36.45"/>
					</TrackLine>
					<TrackLine>
						<End x="204.77" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="161.25" y="40.9"/>
					<TrackLine>
						<End x="172.9" y="40.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="195.6" y="48.7"/>
					<TrackLine>
						<End x="201.65" y="48.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD14"/>
				<Subwire width="0.3">
					<Start x="176.65" y="105.4"/>
					<TrackLine>
						<End x="176.65" y="107.25"/>
					</TrackLine>
					<TrackLine>
						<End x="180.4" y="107.25"/>
					</TrackLine>
					<TrackLine>
						<End x="180.4" y="118.95"/>
					</TrackLine>
					<TrackLine>
						<End x="182.34" y="118.95"/>
					</TrackLine>
					<TrackLine>
						<End x="182.34" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD14"/>
				<Subwire width="0.3">
					<Start x="175.4" y="100.4"/>
					<TrackLine>
						<End x="175.4" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD10"/>
				<Subwire width="0.3">
					<Start x="192.5" y="120.4"/>
					<TrackLine>
						<End x="192.5" y="118.65"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9" y="118.65"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9" y="105.4"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD10"/>
				<Subwire width="0.3">
					<Start x="186.65" y="105.4"/>
					<TrackLine>
						<End x="186.65" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD10"/>
				<Subwire width="0.3">
					<Start x="185.4" y="100.4"/>
					<TrackLine>
						<End x="185.4" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SEL"/>
				<Subwire width="0.3">
					<Start x="196.65" y="72.45"/>
					<TrackLine>
						<End x="189.5" y="72.45"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5" y="65.55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="179.15" y="99.15"/>
					<TrackLine>
						<End x="179.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="177.9" y="99.15"/>
					<TrackLine>
						<End x="177.9" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="177.9" y="100.4"/>
					<TrackLine>
						<End x="177.9" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="177.9" y="99.15"/>
					<TrackLine>
						<End x="179.15" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="179.15" y="99.15"/>
					<TrackLine>
						<End x="184.15" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="102.85"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="102.85"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="117.25"/>
					</TrackLine>
					<TrackLine>
						<End x="184.88" y="117.25"/>
					</TrackLine>
					<TrackLine>
						<End x="184.88" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD12"/>
				<Subwire width="0.3">
					<Start x="180.4" y="100.4"/>
					<TrackLine>
						<End x="181.65" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD12"/>
				<Subwire width="0.3">
					<Start x="181.65" y="105.4"/>
					<TrackLine>
						<End x="181.65" y="106.65"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="106.65"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="117.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="182.9" y="100.4"/>
					<TrackLine>
						<End x="182.9" y="105.4"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="190.35" y="108.95"/>
					<TrackLine>
						<End x="190.35" y="110.15"/>
					</TrackLine>
					<TrackLine>
						<End x="190.25" y="110.15"/>
					</TrackLine>
					<TrackLine>
						<End x="190.25" y="116.85"/>
					</TrackLine>
					<TrackLine>
						<End x="194.35" y="116.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD9"/>
				<Subwire width="0.3">
					<Start x="195.04" y="120.4"/>
					<TrackLine>
						<End x="195.04" y="118.05"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="118.05"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD9"/>
				<Subwire width="0.3">
					<Start x="189.15" y="105.4"/>
					<TrackLine>
						<End x="189.15" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD9"/>
				<Subwire width="0.3">
					<Start x="187.9" y="100.4"/>
					<TrackLine>
						<End x="187.9" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD15"/>
				<Subwire width="0.3">
					<Start x="172.9" y="100.4"/>
					<TrackLine>
						<End x="172.9" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD15"/>
				<Subwire width="0.3">
					<Start x="177.9" y="109.05"/>
					<TrackLine>
						<End x="177.9" y="117.25"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8" y="117.25"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="DIN"/>
				<Subwire width="0.3">
					<Start x="216.05" y="52.2"/>
					<TrackLine>
						<End x="199.15" y="52.2"/>
					</TrackLine>
					<TrackLine>
						<End x="199.15" y="51.15"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1" y="51.15"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1" y="51.85"/>
					</TrackLine>
					<TrackLine>
						<End x="194.9" y="51.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="175.95" y="83.35"/>
					<TrackLine>
						<End x="175.95" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="204.15" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="204.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="164.6" y="76.25"/>
					<TrackLine>
						<End x="164.6" y="75.05"/>
					</TrackLine>
					<TrackLine>
						<End x="163.5" y="75.05"/>
					</TrackLine>
					<TrackLine>
						<End x="163.5" y="70.95"/>
					</TrackLine>
					<TrackLine>
						<End x="161.6" y="70.95"/>
					</TrackLine>
					<TrackLine>
						<End x="161.6" y="57.2"/>
					</TrackLine>
					<TrackLine>
						<End x="171.15" y="57.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD5"/>
				<Subwire width="0.3">
					<Start x="206.65" y="115.4"/>
					<TrackLine>
						<End x="206.65" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="DOUT"/>
				<Subwire width="0.3">
					<Start x="197.35" y="56.6"/>
					<TrackLine>
						<End x="195.95" y="56.6"/>
					</TrackLine>
					<TrackLine>
						<End x="195.95" y="64"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="64"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="64.15"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="64.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SD6"/>
				<Subwire width="0.3">
					<Start x="229.31" y="43.11"/>
					<TrackLine>
						<End x="225.4" y="43.11"/>
					</TrackLine>
					<TrackLine>
						<End x="225.4" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR16"/>
				<Subwire width="0.3">
					<Start x="177.5" y="55.65"/>
					<TrackLine>
						<End x="177.5" y="56.85"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9" y="56.85"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9" y="59.25"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9" y="59.25"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9" y="55.65"/>
					</TrackLine>
					<TrackLine>
						<End x="185.5" y="55.65"/>
					</TrackLine>
					<TrackLine>
						<End x="185.5" y="60.45"/>
					</TrackLine>
					<TrackLine>
						<End x="183.75" y="60.45"/>
					</TrackLine>
					<TrackLine>
						<End x="183.75" y="66.25"/>
					</TrackLine>
					<TrackLine>
						<End x="187" y="66.25"/>
					</TrackLine>
					<TrackLine>
						<End x="187" y="74.25"/>
					</TrackLine>
					<TrackLine>
						<End x="208.75" y="74.25"/>
					</TrackLine>
					<TrackLine>
						<End x="208.75" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD6"/>
				<Subwire width="0.3">
					<Start x="183.79" y="85.13"/>
					<TrackLine>
						<End x="183.79" y="86.29"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="86.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA17"/>
				<Subwire width="0.3">
					<Start x="214.15" y="94.15"/>
					<TrackLine>
						<End x="215.4" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="117.25"/>
					</TrackLine>
					<TrackLine>
						<End x="214.05" y="117.25"/>
					</TrackLine>
					<TrackLine>
						<End x="214.05" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="212.82" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD15"/>
				<Subwire width="0.3">
					<Start x="182.3" y="56.85"/>
					<TrackLine>
						<End x="182.3" y="69.75"/>
					</TrackLine>
					<TrackLine>
						<End x="172.85" y="69.75"/>
					</TrackLine>
					<TrackLine>
						<End x="172.85" y="86.55"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4" y="86.55"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IAKO"/>
				<Subwire width="0.3">
					<Start x="227.75" y="75.4"/>
					<TrackLine>
						<End x="227.75" y="53.4"/>
					</TrackLine>
					<TrackLine>
						<End x="198.55" y="53.4"/>
					</TrackLine>
					<TrackLine>
						<End x="198.55" y="52.35"/>
					</TrackLine>
					<TrackLine>
						<End x="197.35" y="52.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IAKO"/>
				<Subwire width="0.3">
					<Start x="227.75" y="80.4"/>
					<TrackLine>
						<End x="220.4" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="214.65" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="214.65" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="174.15" y="78.05"/>
					<TrackLine>
						<End x="174.15" y="70.35"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="70.35"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="58.65"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3" y="58.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD10"/>
				<Subwire width="0.3">
					<Start x="188.11" y="80.91"/>
					<TrackLine>
						<End x="183" y="80.91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RPLY"/>
				<Subwire width="0.3">
					<Start x="179.15" y="110.4"/>
					<TrackLine>
						<End x="179.15" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD9"/>
				<Subwire width="0.3">
					<Start x="186.9" y="82.15"/>
					<TrackLine>
						<End x="179.55" y="82.15"/>
					</TrackLine>
					<TrackLine>
						<End x="179.55" y="86.35"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="86.35"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="89.11"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="89.11"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.3">
					<Start x="186" y="64.35"/>
					<TrackLine>
						<End x="191.3" y="64.35"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3" y="70.95"/>
					</TrackLine>
					<TrackLine>
						<End x="208.7" y="70.95"/>
					</TrackLine>
					<TrackLine>
						<End x="208.7" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="221" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="221" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="231.65" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="231.65" y="49.65"/>
					</TrackLine>
					<TrackLine>
						<End x="230.15" y="49.65"/>
					</TrackLine>
					<TrackLine>
						<End x="230.15" y="45.5"/>
					</TrackLine>
					<TrackLine>
						<End x="230.5" y="45.5"/>
					</TrackLine>
					<TrackLine>
						<End x="230.5" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="225.4" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="225.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RPLY_I"/>
				<Subwire width="0.3">
					<Start x="225.35" y="66.65"/>
					<TrackLine>
						<End x="225.35" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="195.05" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="195.05" y="58.95"/>
					</TrackLine>
					<TrackLine>
						<End x="187.55" y="58.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD11"/>
				<Subwire width="0.3">
					<Start x="187.45" y="83.95"/>
					<TrackLine>
						<End x="180.4" y="83.95"/>
					</TrackLine>
					<TrackLine>
						<End x="180.4" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSEL"/>
				<Subwire width="0.3">
					<Start x="200.4" y="94.15"/>
					<TrackLine>
						<End x="201.65" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSEL"/>
				<Subwire width="0.3">
					<Start x="200.4" y="89.15"/>
					<TrackLine>
						<End x="200.4" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSEL"/>
				<Subwire width="0.3">
					<Start x="200.4" y="94.15"/>
					<TrackLine>
						<End x="200.4" y="117.8"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="165.25" y="37.05"/>
					<TrackLine>
						<End x="164.13" y="37.05"/>
					</TrackLine>
					<TrackLine>
						<End x="164.13" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="186.6" y="46.65"/>
					<TrackLine>
						<End x="186.6" y="49.35"/>
					</TrackLine>
					<TrackLine>
						<End x="185.65" y="49.35"/>
					</TrackLine>
					<TrackLine>
						<End x="185.65" y="51.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="185.65" y="51.85"/>
					<TrackLine>
						<End x="188.2" y="51.85"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2" y="57.5"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8" y="57.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="110.4"/>
					<TrackLine>
						<End x="192.9" y="108.9"/>
					</TrackLine>
					<TrackLine>
						<End x="193.15" y="108.9"/>
					</TrackLine>
					<TrackLine>
						<End x="193.15" y="103.65"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9" y="103.65"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="100.4"/>
					<TrackLine>
						<End x="194.35" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="194.35" y="91.6"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9" y="91.6"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="219.15" y="77.9"/>
					<TrackLine>
						<End x="219.15" y="83.15"/>
					</TrackLine>
					<TrackLine>
						<End x="230" y="83.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="101.65"/>
					<TrackLine>
						<End x="223.15" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="223.15" y="101.65"/>
					<TrackLine>
						<End x="223.15" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="230" y="83.15"/>
					<TrackLine>
						<End x="230.4" y="83.15"/>
					</TrackLine>
					<TrackLine>
						<End x="230.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="231.5" y="89.95"/>
					<TrackLine>
						<End x="230" y="89.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="177.9" y="44.7"/>
					</TrackLine>
					<TrackLine>
						<End x="168.5" y="44.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="168.5" y="44.7"/>
					<TrackLine>
						<End x="165.25" y="44.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="97.9"/>
					<TrackLine>
						<End x="221.65" y="101.65"/>
					</TrackLine>
					<TrackLine>
						<End x="223.15" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="231.35" y="47.85"/>
					<TrackLine>
						<End x="231.35" y="38.3"/>
					</TrackLine>
					<TrackLine>
						<End x="230.17" y="38.3"/>
					</TrackLine>
					<TrackLine>
						<End x="230.17" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="230" y="89.95"/>
					<TrackLine>
						<End x="230" y="83.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="49.15"/>
					<TrackLine>
						<End x="205.4" y="50.65"/>
					</TrackLine>
					<TrackLine>
						<End x="218.9" y="50.65"/>
					</TrackLine>
					<TrackLine>
						<End x="218.9" y="52.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="207.5" y="69.75"/>
					<TrackLine>
						<End x="193.25" y="69.75"/>
					</TrackLine>
					<TrackLine>
						<End x="193.25" y="67.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="193.25" y="67.35"/>
					<TrackLine>
						<End x="193.25" y="63.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="92.9"/>
					<TrackLine>
						<End x="230" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="230" y="89.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="46.1"/>
					<TrackLine>
						<End x="203.95" y="46.1"/>
					</TrackLine>
					<TrackLine>
						<End x="203.95" y="45.8"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="45.8"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="45.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="200.4" y="45.4"/>
					<TrackLine>
						<End x="195.05" y="45.4"/>
					</TrackLine>
					<TrackLine>
						<End x="195.05" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="61.65"/>
					<TrackLine>
						<End x="205.4" y="58.95"/>
					</TrackLine>
					<TrackLine>
						<End x="207.8" y="58.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD0"/>
				<Subwire width="0.3">
					<Start x="219.15" y="115.4"/>
					<TrackLine>
						<End x="219.15" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA19"/>
				<Subwire width="0.3">
					<Start x="209.15" y="94.15"/>
					<TrackLine>
						<End x="209.15" y="96.6"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="96.6"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="208.95" y="116.65"/>
					</TrackLine>
					<TrackLine>
						<End x="208.95" y="122.94"/>
					</TrackLine>
					<TrackLine>
						<End x="207.74" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD7"/>
				<Subwire width="0.3">
					<Start x="184.14" y="90.27"/>
					<TrackLine>
						<End x="187.81" y="90.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.3">
					<Start x="186.7" y="60.7"/>
					<TrackLine>
						<End x="186.1" y="60.7"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1" y="53.65"/>
					</TrackLine>
					<TrackLine>
						<End x="184.45" y="53.65"/>
					</TrackLine>
					<TrackLine>
						<End x="184.45" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="48.5"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="44"/>
					</TrackLine>
					<TrackLine>
						<End x="202.25" y="44"/>
					</TrackLine>
					<TrackLine>
						<End x="202.25" y="44.7"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9" y="44.7"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-IOR"/>
				<Subwire width="0.3">
					<Start x="165.05" y="46.7"/>
					<TrackLine>
						<End x="164.05" y="46.7"/>
					</TrackLine>
					<TrackLine>
						<End x="164.05" y="43.53"/>
					</TrackLine>
					<TrackLine>
						<End x="176.45" y="43.53"/>
					</TrackLine>
					<TrackLine>
						<End x="176.45" y="39.95"/>
					</TrackLine>
					<TrackLine>
						<End x="202.23" y="39.95"/>
					</TrackLine>
					<TrackLine>
						<End x="202.23" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="189.15" y="97.35"/>
					<TrackLine>
						<End x="189.15" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="96.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="220.4" y="91.1"/>
					<TrackLine>
						<End x="225.3" y="91.1"/>
					</TrackLine>
					<TrackLine>
						<End x="225.3" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="232.7" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="232.7" y="32.6"/>
					</TrackLine>
					<TrackLine>
						<End x="232.71" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="167.65" y="80.6"/>
					<TrackLine>
						<End x="167.65" y="66.15"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5" y="66.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="#TDO"/>
				<Subwire width="0.3">
					<Start x="172.85" y="51.4"/>
					<TrackLine>
						<End x="160.4" y="51.4"/>
					</TrackLine>
					<TrackLine>
						<End x="160.4" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="161.69" y="72.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR18"/>
				<Subwire width="0.3">
					<Start x="171.65" y="83"/>
					<TrackLine>
						<End x="171.65" y="69.15"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1" y="69.15"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1" y="58.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR18"/>
				<Subwire width="0.3">
					<Start x="171.65" y="91.45"/>
					<TrackLine>
						<End x="189.15" y="91.45"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="82.1"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="82.1"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SD3"/>
				<Subwire width="0.3">
					<Start x="218.55" y="46.3"/>
					<TrackLine>
						<End x="221.65" y="46.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD1"/>
				<Subwire width="0.3">
					<Start x="177.75" y="83.95"/>
					<TrackLine>
						<End x="177.75" y="80.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="167.55" y="36.45"/>
					<TrackLine>
						<End x="175.45" y="36.45"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.3">
					<Start x="207.9" y="76.05"/>
					<TrackLine>
						<End x="206.7" y="76.05"/>
					</TrackLine>
					<TrackLine>
						<End x="206.7" y="75.45"/>
					</TrackLine>
					<TrackLine>
						<End x="182.35" y="75.45"/>
					</TrackLine>
					<TrackLine>
						<End x="182.35" y="76.05"/>
					</TrackLine>
					<TrackLine>
						<End x="181.15" y="76.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="WTBT"/>
				<Subwire width="0.3">
					<Start x="214.15" y="62.9"/>
					<TrackLine>
						<End x="196.55" y="62.9"/>
					</TrackLine>
					<TrackLine>
						<End x="196.55" y="60.15"/>
					</TrackLine>
					<TrackLine>
						<End x="197.15" y="60.15"/>
					</TrackLine>
					<TrackLine>
						<End x="197.15" y="58.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="200.4" y="73.05"/>
					<TrackLine>
						<End x="199.2" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2" y="73.65"/>
					</TrackLine>
					<TrackLine>
						<End x="188.25" y="73.65"/>
					</TrackLine>
					<TrackLine>
						<End x="188.25" y="66.8"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="200.4" y="80.35"/>
					<TrackLine>
						<End x="199.2" y="80.35"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2" y="79.75"/>
					</TrackLine>
					<TrackLine>
						<End x="178.95" y="79.75"/>
					</TrackLine>
					<TrackLine>
						<End x="178.95" y="85.75"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4" y="85.75"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD8"/>
				<Subwire width="0.3">
					<Start x="199.15" y="115.4"/>
					<TrackLine>
						<End x="199.15" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD8"/>
				<Subwire width="0.3">
					<Start x="190.4" y="107.2"/>
					<TrackLine>
						<End x="190.4" y="102.85"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="102.85"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="222.95" y="92.35"/>
					<TrackLine>
						<End x="222.95" y="97.75"/>
					</TrackLine>
					<TrackLine>
						<End x="229.75" y="97.75"/>
					</TrackLine>
					<TrackLine>
						<End x="229.75" y="124.15"/>
					</TrackLine>
					<TrackLine>
						<End x="192.5" y="124.15"/>
					</TrackLine>
					<TrackLine>
						<End x="192.5" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="192.5" y="122.94"/>
					<TrackLine>
						<End x="192.5" y="121.65"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="121.65"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="119"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="119"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="184.15" y="115.4"/>
					<TrackLine>
						<End x="184.15" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="224.7" y="69"/>
					<TrackLine>
						<End x="224.7" y="67.8"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="67.8"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="60.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
		</Wires>
	</Connectivity>

	<Settings version="1.3">
		<Autoroute wireShape="Arcs"
		 weakCheck="on"/>
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
		<View scale="7.74439" scrollHorz="197.15" scrollVert="76.225"/>
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