<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : Arcs.fst                       -->
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
					<Pin pinNum="1" name="14" pinSymName="DI1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="11" pinSymName="DI2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="5" pinSymName="DI3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="2" pinSymName="DI4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="7" pinSymName="C1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="9" pinSymName="C2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="13" pinSymName="DO1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="15" pinSymName="B1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="10" pinSymName="DO2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="12" pinSymName="B2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="6" pinSymName="DO3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="4" pinSymName="B3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="3" pinSymName="DO4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="1" pinSymName="B4" pinEqual="0" gate="1" gateEqual="1"/>
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
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="1"/>
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
					<Pin pinNum="1" name="A1" pinSymName="1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="A2" pinSymName="1" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="3" name="A3" pinSymName="1" pinEqual="0" gate="3" gateEqual="1"/>
					<Pin pinNum="4" name="A4" pinSymName="1" pinEqual="0" gate="4" gateEqual="1"/>
					<Pin pinNum="5" name="A5" pinSymName="1" pinEqual="0" gate="5" gateEqual="1"/>
					<Pin pinNum="6" name="A6" pinSymName="1" pinEqual="0" gate="6" gateEqual="1"/>
					<Pin pinNum="7" name="A7" pinSymName="1" pinEqual="0" gate="7" gateEqual="1"/>
					<Pin pinNum="8" name="A8" pinSymName="1" pinEqual="0" gate="8" gateEqual="1"/>
					<Pin pinNum="9" name="A9" pinSymName="1" pinEqual="0" gate="9" gateEqual="1"/>
					<Pin pinNum="10" name="A10" pinSymName="1" pinEqual="0" gate="10" gateEqual="1"/>
					<Pin pinNum="11" name="A11" pinSymName="1" pinEqual="0" gate="11" gateEqual="1"/>
					<Pin pinNum="12" name="A12" pinSymName="1" pinEqual="0" gate="12" gateEqual="1"/>
					<Pin pinNum="13" name="A13" pinSymName="1" pinEqual="0" gate="13" gateEqual="1"/>
					<Pin pinNum="14" name="A14" pinSymName="1" pinEqual="0" gate="14" gateEqual="1"/>
					<Pin pinNum="15" name="A15" pinSymName="1" pinEqual="0" gate="15" gateEqual="1"/>
					<Pin pinNum="16" name="A16" pinSymName="1" pinEqual="0" gate="16" gateEqual="1"/>
					<Pin pinNum="17" name="A17" pinSymName="1" pinEqual="0" gate="17" gateEqual="1"/>
					<Pin pinNum="18" name="A18" pinSymName="1" pinEqual="0" gate="18" gateEqual="1"/>
					<Pin pinNum="19" name="A19" pinSymName="1" pinEqual="0" gate="19" gateEqual="1"/>
					<Pin pinNum="20" name="A20" pinSymName="1" pinEqual="0" gate="20" gateEqual="1"/>
					<Pin pinNum="21" name="A21" pinSymName="1" pinEqual="0" gate="21" gateEqual="1"/>
					<Pin pinNum="22" name="A22" pinSymName="1" pinEqual="0" gate="22" gateEqual="1"/>
					<Pin pinNum="23" name="A23" pinSymName="1" pinEqual="0" gate="23" gateEqual="1"/>
					<Pin pinNum="24" name="A24" pinSymName="1" pinEqual="0" gate="24" gateEqual="1"/>
					<Pin pinNum="25" name="A25" pinSymName="1" pinEqual="0" gate="25" gateEqual="1"/>
					<Pin pinNum="26" name="A26" pinSymName="1" pinEqual="0" gate="26" gateEqual="1"/>
					<Pin pinNum="27" name="A27" pinSymName="1" pinEqual="0" gate="27" gateEqual="1"/>
					<Pin pinNum="28" name="A28" pinSymName="1" pinEqual="0" gate="28" gateEqual="1"/>
					<Pin pinNum="29" name="A29" pinSymName="1" pinEqual="0" gate="29" gateEqual="1"/>
					<Pin pinNum="30" name="A30" pinSymName="1" pinEqual="0" gate="30" gateEqual="1"/>
					<Pin pinNum="31" name="A31" pinSymName="1" pinEqual="0" gate="31" gateEqual="1"/>
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
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="1" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="1" pinEqual="0" gate="3" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="1" pinEqual="0" gate="4" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="1" pinEqual="0" gate="5" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="1" pinEqual="0" gate="6" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="1" pinEqual="0" gate="7" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="1" pinEqual="0" gate="8" gateEqual="1"/>
					<Pin pinNum="9" name="9" pinSymName="1" pinEqual="0" gate="9" gateEqual="1"/>
					<Pin pinNum="10" name="10" pinSymName="1" pinEqual="0" gate="10" gateEqual="1"/>
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
					<Pin pinNum="1" name="19" pinSymName="EDB" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="1" pinSymName="SEDB" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="2" pinSymName="DB0" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="3" pinSymName="DB1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="4" pinSymName="DB2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="5" pinSymName="DB3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="6" pinSymName="DB4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="7" pinSymName="DB5" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="8" pinSymName="DB6" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="9" pinSymName="DB7" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="18" pinSymName="DI/O0" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="17" pinSymName="DI/O1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="16" pinSymName="DI/O2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="15" pinSymName="DI/O3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="15" name="14" pinSymName="DI/O4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="16" name="13" pinSymName="DI/O5" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="17" name="12" pinSymName="DI/O6" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="18" name="11" pinSymName="DI/O7" pinEqual="0" gate="1" gateEqual="1"/>
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
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="1" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="1" pinEqual="0" gate="3" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="1" pinEqual="0" gate="4" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="1" pinEqual="0" gate="5" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="1" pinEqual="0" gate="6" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="1" pinEqual="0" gate="7" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="1" pinEqual="0" gate="8" gateEqual="1"/>
					<Pin pinNum="9" name="9" pinSymName="1" pinEqual="0" gate="9" gateEqual="1"/>
					<Pin pinNum="10" name="10" pinSymName="1" pinEqual="0" gate="10" gateEqual="1"/>
					<Pin pinNum="11" name="11" pinSymName="1" pinEqual="0" gate="11" gateEqual="1"/>
					<Pin pinNum="12" name="12" pinSymName="1" pinEqual="0" gate="12" gateEqual="1"/>
					<Pin pinNum="13" name="13" pinSymName="1" pinEqual="0" gate="13" gateEqual="1"/>
					<Pin pinNum="14" name="14" pinSymName="1" pinEqual="0" gate="14" gateEqual="1"/>
					<Pin pinNum="15" name="15" pinSymName="1" pinEqual="0" gate="15" gateEqual="1"/>
					<Pin pinNum="16" name="16" pinSymName="1" pinEqual="0" gate="16" gateEqual="1"/>
					<Pin pinNum="17" name="17" pinSymName="1" pinEqual="0" gate="17" gateEqual="1"/>
					<Pin pinNum="18" name="18" pinSymName="1" pinEqual="0" gate="18" gateEqual="1"/>
					<Pin pinNum="19" name="19" pinSymName="1" pinEqual="0" gate="19" gateEqual="1"/>
					<Pin pinNum="20" name="20" pinSymName="1" pinEqual="0" gate="20" gateEqual="1"/>
					<Pin pinNum="21" name="21" pinSymName="1" pinEqual="0" gate="21" gateEqual="1"/>
					<Pin pinNum="22" name="22" pinSymName="1" pinEqual="0" gate="22" gateEqual="1"/>
					<Pin pinNum="23" name="23" pinSymName="1" pinEqual="0" gate="23" gateEqual="1"/>
					<Pin pinNum="24" name="24" pinSymName="1" pinEqual="0" gate="24" gateEqual="1"/>
					<Pin pinNum="25" name="25" pinSymName="1" pinEqual="0" gate="25" gateEqual="1"/>
					<Pin pinNum="26" name="26" pinSymName="1" pinEqual="0" gate="26" gateEqual="1"/>
					<Pin pinNum="27" name="27" pinSymName="1" pinEqual="0" gate="27" gateEqual="1"/>
					<Pin pinNum="28" name="28" pinSymName="1" pinEqual="0" gate="28" gateEqual="1"/>
					<Pin pinNum="29" name="29" pinSymName="1" pinEqual="0" gate="29" gateEqual="1"/>
					<Pin pinNum="30" name="30" pinSymName="1" pinEqual="0" gate="30" gateEqual="1"/>
					<Pin pinNum="31" name="31" pinSymName="1" pinEqual="0" gate="31" gateEqual="1"/>
					<Pin pinNum="32" name="32" pinSymName="1" pinEqual="0" gate="32" gateEqual="1"/>
					<Pin pinNum="33" name="33" pinSymName="1" pinEqual="0" gate="33" gateEqual="1"/>
					<Pin pinNum="34" name="34" pinSymName="1" pinEqual="0" gate="34" gateEqual="1"/>
					<Pin pinNum="35" name="35" pinSymName="1" pinEqual="0" gate="35" gateEqual="1"/>
					<Pin pinNum="36" name="36" pinSymName="1" pinEqual="0" gate="36" gateEqual="1"/>
					<Pin pinNum="37" name="37" pinSymName="1" pinEqual="0" gate="37" gateEqual="1"/>
					<Pin pinNum="38" name="38" pinSymName="1" pinEqual="0" gate="38" gateEqual="1"/>
					<Pin pinNum="39" name="39" pinSymName="1" pinEqual="0" gate="39" gateEqual="1"/>
					<Pin pinNum="40" name="40" pinSymName="1" pinEqual="0" gate="40" gateEqual="1"/>
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
					<Pin pinNum="1" name="B1" pinSymName="1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="B2" pinSymName="1" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="3" name="B3" pinSymName="1" pinEqual="0" gate="3" gateEqual="1"/>
					<Pin pinNum="4" name="B4" pinSymName="1" pinEqual="0" gate="4" gateEqual="1"/>
					<Pin pinNum="5" name="B5" pinSymName="1" pinEqual="0" gate="5" gateEqual="1"/>
					<Pin pinNum="6" name="B6" pinSymName="1" pinEqual="0" gate="6" gateEqual="1"/>
					<Pin pinNum="7" name="B7" pinSymName="1" pinEqual="0" gate="7" gateEqual="1"/>
					<Pin pinNum="8" name="B8" pinSymName="1" pinEqual="0" gate="8" gateEqual="1"/>
					<Pin pinNum="9" name="B9" pinSymName="1" pinEqual="0" gate="9" gateEqual="1"/>
					<Pin pinNum="10" name="B10" pinSymName="1" pinEqual="0" gate="10" gateEqual="1"/>
					<Pin pinNum="11" name="B11" pinSymName="1" pinEqual="0" gate="11" gateEqual="1"/>
					<Pin pinNum="12" name="B12" pinSymName="1" pinEqual="0" gate="12" gateEqual="1"/>
					<Pin pinNum="13" name="B13" pinSymName="1" pinEqual="0" gate="13" gateEqual="1"/>
					<Pin pinNum="14" name="B14" pinSymName="1" pinEqual="0" gate="14" gateEqual="1"/>
					<Pin pinNum="15" name="B15" pinSymName="1" pinEqual="0" gate="15" gateEqual="1"/>
					<Pin pinNum="16" name="B16" pinSymName="1" pinEqual="0" gate="16" gateEqual="1"/>
					<Pin pinNum="17" name="B17" pinSymName="1" pinEqual="0" gate="17" gateEqual="1"/>
					<Pin pinNum="18" name="B18" pinSymName="1" pinEqual="0" gate="18" gateEqual="1"/>
					<Pin pinNum="19" name="B19" pinSymName="1" pinEqual="0" gate="19" gateEqual="1"/>
					<Pin pinNum="20" name="B20" pinSymName="1" pinEqual="0" gate="20" gateEqual="1"/>
					<Pin pinNum="21" name="B21" pinSymName="1" pinEqual="0" gate="21" gateEqual="1"/>
					<Pin pinNum="22" name="B22" pinSymName="1" pinEqual="0" gate="22" gateEqual="1"/>
					<Pin pinNum="23" name="B23" pinSymName="1" pinEqual="0" gate="23" gateEqual="1"/>
					<Pin pinNum="24" name="B24" pinSymName="1" pinEqual="0" gate="24" gateEqual="1"/>
					<Pin pinNum="25" name="B25" pinSymName="1" pinEqual="0" gate="25" gateEqual="1"/>
					<Pin pinNum="26" name="B26" pinSymName="1" pinEqual="0" gate="26" gateEqual="1"/>
					<Pin pinNum="27" name="B27" pinSymName="1" pinEqual="0" gate="27" gateEqual="1"/>
					<Pin pinNum="28" name="B28" pinSymName="1" pinEqual="0" gate="28" gateEqual="1"/>
					<Pin pinNum="29" name="B29" pinSymName="1" pinEqual="0" gate="29" gateEqual="1"/>
					<Pin pinNum="30" name="B30" pinSymName="1" pinEqual="0" gate="30" gateEqual="1"/>
					<Pin pinNum="31" name="B31" pinSymName="1" pinEqual="0" gate="31" gateEqual="1"/>
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
					<Pin pinNum="1" name="18" pinSymName="A0" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="17" pinSymName="A1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="16" pinSymName="A2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="15" pinSymName="A3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="14" pinSymName="A4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="13" pinSymName="A5" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="12" pinSymName="A6" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="11" pinSymName="A7" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="1" pinSymName="T" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="19" pinSymName="OE" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="2" pinSymName="B0" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="3" pinSymName="B1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="4" pinSymName="B2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="5" pinSymName="B3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="15" name="6" pinSymName="B4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="16" name="7" pinSymName="B5" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="17" name="8" pinSymName="B6" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="18" name="9" pinSymName="B7" pinEqual="0" gate="1" gateEqual="1"/>
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
			<CompInstance name="C6" uniqueId="ASUMDHCG" side="Top">
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
			<CompInstance name="X4" uniqueId="KOKDMQTN" side="Top" angle="90" fixed="on">
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
			<CompInstance name="C1" uniqueId="YLELDAML" side="Top" angle="90">
				<ComponentRef name="K17B-2_1"/>
				<FootprintRef name="K17B-2_1"/>
				<Org x="206.7447" y="55.9997"/>
				<Attributes>
					<Attribute name="Type" value="K17B-2"/>
					<Attribute name="FP" value="K17B-2"/>
					<Attribute name="PDIF_TY" value="11000"/>
					<Attribute name="DEVICE" value="K17B-2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C2" uniqueId="VSFLUNKZ" side="Top" angle="270">
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
			<CompInstance name="C7" uniqueId="AMNQUMOB" side="Top" angle="270">
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
			<CompInstance name="C3" uniqueId="ACCAHCOY" side="Top" angle="90">
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
			<CompInstance name="C5" uniqueId="AVXVQUJQ" side="Top" angle="270">
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
			<CompInstance name="D6" uniqueId="FMGYMJRP" side="Top" angle="270">
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
			<CompInstance name="D12" uniqueId="UKBDXBMQ" side="Top" angle="180">
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
			<CompInstance name="D11" uniqueId="FVGOBILH" side="Top" angle="180">
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
			<CompInstance name="D13" uniqueId="XOBGCQPK" side="Top" angle="180">
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
			<CompInstance name="D7" uniqueId="PHWYZQJR" side="Top" angle="180">
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
			<CompInstance name="C4" uniqueId="SUJKJTRC" side="Top">
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
			<CompInstance name="D15" uniqueId="MNXBWYHN" side="Top">
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
			<CompInstance name="D4" uniqueId="TTBQURMN" side="Top" angle="180">
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
			<CompInstance name="D10" uniqueId="VYOWZQBD" side="Top" angle="180">
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
			<CompInstance name="D14" uniqueId="ZGKMUBDT" side="Top" angle="180">
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
			<CompInstance name="D9" uniqueId="PWNMPKXQ" side="Top" angle="180">
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
			<CompInstance name="X3" uniqueId="HQSSJNPW" side="Top" angle="180" fixed="on">
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
			<CompInstance name="D8" uniqueId="VZTRNLRV" side="Top" angle="180">
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
			<CompInstance name="D2" uniqueId="IKGDLJMX" side="Top" angle="180">
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
			<CompInstance name="D1" uniqueId="ZJKHTDBO" side="Top" angle="270">
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
			<CompInstance name="X1" uniqueId="FURUJAQS" side="Top" fixed="on">
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
			<CompInstance name="X2" uniqueId="CBIILEJY" side="Bottom" fixed="on">
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
			<CompInstance name="D3" uniqueId="FCYPBALS" side="Top" angle="180">
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
			<CompInstance name="D5" uniqueId="ZPJOUCCL" side="Top" angle="270">
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
			<PinRef compName="D15" pinName="14"/>
			<PinRef compName="D1" pinName="39"/>
		</Net>
		<Net name="D0">
			<PinRef compName="D15" pinName="2"/>
			<PinRef compName="D1" pinName="50"/>
		</Net>
		<Net name="BAD4">
			<PinRef compName="D7" pinName="6"/>
			<PinRef compName="X3" pinName="9"/>
			<PinRef compName="D8" pinName="6"/>
			<PinRef compName="D2" pinName="6"/>
		</Net>
		<Net name="AD5">
			<PinRef compName="D2" pinName="17"/>
			<PinRef compName="D1" pinName="7"/>
		</Net>
		<Net name="D4">
			<PinRef compName="D15" pinName="15"/>
			<PinRef compName="D1" pinName="21"/>
		</Net>
		<Net name="IRQ_B">
			<PinRef compName="D6" pinName="12"/>
			<PinRef compName="D1" pinName="42"/>
		</Net>
		<Net name="ADR21">
			<PinRef compName="D4" pinName="11"/>
			<PinRef compName="D1" pinName="30"/>
		</Net>
		<Net name="AD14">
			<PinRef compName="D1" pinName="70"/>
			<PinRef compName="D3" pinName="12"/>
		</Net>
		<Net name="#TCLK">
			<PinRef compName="X4" pinName="1"/>
			<PinRef compName="D1" pinName="54"/>
		</Net>
		<Net name="DB">
			<PinRef compName="D4" pinName="1"/>
			<PinRef compName="D2" pinName="1"/>
			<PinRef compName="D1" pinName="81"/>
		</Net>
		<Net name="P1">
			<PinRef compName="D13" pinName="10"/>
			<PinRef compName="D1" pinName="4"/>
		</Net>
		<Net name="ADR20">
			<PinRef compName="D4" pinName="14"/>
			<PinRef compName="D1" pinName="43"/>
		</Net>
		<Net name="EB1">
			<PinRef compName="D6" pinName="7"/>
			<PinRef compName="D4" pinName="19"/>
			<PinRef compName="D2" pinName="19"/>
			<PinRef compName="D1" pinName="51"/>
			<PinRef compName="D5" pinName="7"/>
		</Net>
		<Net name="D2">
			<PinRef compName="D15" pinName="3"/>
			<PinRef compName="D1" pinName="49"/>
		</Net>
		<Net name="BAD7">
			<PinRef compName="D7" pinName="9"/>
			<PinRef compName="X3" pinName="15"/>
			<PinRef compName="D8" pinName="9"/>
			<PinRef compName="D2" pinName="9"/>
		</Net>
		<Net name="A8">
			<PinRef compName="D1" pinName="37"/>
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
			<PinRef compName="D6" pinName="10"/>
			<PinRef compName="D1" pinName="55"/>
		</Net>
		<Net name="A0">
			<PinRef compName="D1" pinName="47"/>
			<PinRef compName="X1" pinName="31"/>
		</Net>
		<Net name="A5">
			<PinRef compName="D1" pinName="35"/>
			<PinRef compName="X1" pinName="26"/>
		</Net>
		<Net name="AD4">
			<PinRef compName="D2" pinName="16"/>
			<PinRef compName="D1" pinName="8"/>
		</Net>
		<Net name="BDIN">
			<PinRef compName="D12" pinName="10"/>
			<PinRef compName="D11" pinName="10"/>
			<PinRef compName="X3" pinName="20"/>
			<PinRef compName="D5" pinName="15"/>
		</Net>
		<Net name="AD3">
			<PinRef compName="D2" pinName="15"/>
			<PinRef compName="D1" pinName="9"/>
		</Net>
		<Net name="OSC">
			<PinRef compName="D1" pinName="89"/>
			<PinRef compName="X2" pinName="30"/>
		</Net>
		<Net name="ADR17">
			<PinRef compName="D4" pinName="12"/>
			<PinRef compName="D1" pinName="23"/>
		</Net>
		<Net name="SIA">
			<PinRef compName="D1" pinName="80"/>
			<PinRef compName="D5" pinName="12"/>
		</Net>
		<Net name="BAD3">
			<PinRef compName="D7" pinName="5"/>
			<PinRef compName="X3" pinName="7"/>
			<PinRef compName="D8" pinName="5"/>
			<PinRef compName="D2" pinName="5"/>
		</Net>
		<Net name="#TDI">
			<PinRef compName="X4" pinName="5"/>
			<PinRef compName="D1" pinName="16"/>
		</Net>
		<Net name="BSIA">
			<PinRef compName="D10" pinName="9"/>
			<PinRef compName="D9" pinName="9"/>
			<PinRef compName="X3" pinName="33"/>
			<PinRef compName="D5" pinName="2"/>
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
			<PinRef compName="D2" pinName="13"/>
			<PinRef compName="D1" pinName="24"/>
		</Net>
		<Net name="BA21">
			<PinRef compName="D12" pinName="8"/>
			<PinRef compName="D11" pinName="8"/>
			<PinRef compName="D4" pinName="8"/>
			<PinRef compName="X3" pinName="14"/>
		</Net>
		<Net name="-IOW">
			<PinRef compName="D1" pinName="100"/>
			<PinRef compName="X2" pinName="13"/>
		</Net>
		<Net name="A1">
			<PinRef compName="D1" pinName="94"/>
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
			<PinRef compName="D4" pinName="13"/>
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
			<PinRef compName="D1" pinName="99"/>
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
			<PinRef compName="D1" pinName="78"/>
			<PinRef compName="D5" pinName="11"/>
		</Net>
		<Net name="ADR19">
			<PinRef compName="D4" pinName="16"/>
			<PinRef compName="D1" pinName="44"/>
		</Net>
		<Net name="BAD5">
			<PinRef compName="D7" pinName="7"/>
			<PinRef compName="X3" pinName="11"/>
			<PinRef compName="D8" pinName="7"/>
			<PinRef compName="D2" pinName="7"/>
		</Net>
		<Net name="DOUT">
			<PinRef compName="D1" pinName="79"/>
			<PinRef compName="D5" pinName="5"/>
		</Net>
		<Net name="#TMS">
			<PinRef compName="X4" pinName="3"/>
			<PinRef compName="D1" pinName="27"/>
		</Net>
		<Net name="OE_BF">
			<PinRef compName="D15" pinName="1"/>
			<PinRef compName="D1" pinName="1"/>
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
			<PinRef compName="D15" pinName="9"/>
			<PinRef compName="X1" pinName="4"/>
		</Net>
		<Net name="SD1">
			<PinRef compName="D15" pinName="5"/>
			<PinRef compName="X1" pinName="8"/>
		</Net>
		<Net name="ADR16">
			<PinRef compName="D4" pinName="18"/>
			<PinRef compName="D1" pinName="58"/>
		</Net>
		<Net name="AD6">
			<PinRef compName="D2" pinName="14"/>
			<PinRef compName="D1" pinName="10"/>
		</Net>
		<Net name="BA17">
			<PinRef compName="D12" pinName="4"/>
			<PinRef compName="D11" pinName="4"/>
			<PinRef compName="D4" pinName="4"/>
			<PinRef compName="X3" pinName="6"/>
		</Net>
		<Net name="AD15">
			<PinRef compName="D1" pinName="71"/>
			<PinRef compName="D3" pinName="11"/>
		</Net>
		<Net name="IAKO">
			<PinRef compName="D1" pinName="82"/>
			<PinRef compName="D5" pinName="4"/>
		</Net>
		<Net name="AD12">
			<PinRef compName="D1" pinName="66"/>
			<PinRef compName="D3" pinName="14"/>
		</Net>
		<Net name="AD10">
			<PinRef compName="D1" pinName="14"/>
			<PinRef compName="D3" pinName="16"/>
		</Net>
		<Net name="RPLY">
			<PinRef compName="D6" pinName="14"/>
			<PinRef compName="D13" pinName="4"/>
			<PinRef compName="D14" pinName="4"/>
			<PinRef compName="X3" pinName="34"/>
		</Net>
		<Net name="A2">
			<PinRef compName="D1" pinName="31"/>
			<PinRef compName="X1" pinName="29"/>
		</Net>
		<Net name="AD9">
			<PinRef compName="D1" pinName="12"/>
			<PinRef compName="D3" pinName="17"/>
		</Net>
		<Net name="AD8">
			<PinRef compName="D1" pinName="11"/>
			<PinRef compName="D3" pinName="18"/>
		</Net>
		<Net name="D7">
			<PinRef compName="D15" pinName="13"/>
			<PinRef compName="D1" pinName="22"/>
		</Net>
		<Net name="SD4">
			<PinRef compName="D15" pinName="8"/>
			<PinRef compName="X1" pinName="5"/>
		</Net>
		<Net name="RPLY_I">
			<PinRef compName="D6" pinName="6"/>
			<PinRef compName="D1" pinName="75"/>
		</Net>
		<Net name="AD11">
			<PinRef compName="D1" pinName="15"/>
			<PinRef compName="D3" pinName="15"/>
		</Net>
		<Net name="BSEL">
			<PinRef compName="D12" pinName="9"/>
			<PinRef compName="D11" pinName="9"/>
			<PinRef compName="D4" pinName="9"/>
			<PinRef compName="X3" pinName="18"/>
		</Net>
		<Net name="AD0">
			<PinRef compName="D2" pinName="11"/>
			<PinRef compName="D1" pinName="26"/>
		</Net>
		<Net name="SD0">
			<PinRef compName="D15" pinName="4"/>
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
			<PinRef compName="D1" pinName="34"/>
			<PinRef compName="X1" pinName="27"/>
		</Net>
		<Net name="AD7">
			<PinRef compName="D2" pinName="18"/>
			<PinRef compName="D1" pinName="6"/>
		</Net>
		<Net name="D6">
			<PinRef compName="D15" pinName="16"/>
			<PinRef compName="D1" pinName="19"/>
		</Net>
		<Net name="-IOR">
			<PinRef compName="D1" pinName="38"/>
			<PinRef compName="X2" pinName="14"/>
		</Net>
		<Net name="RES">
			<PinRef compName="D1" pinName="48"/>
			<PinRef compName="X2" pinName="2"/>
		</Net>
		<Net name="#TDO">
			<PinRef compName="X4" pinName="2"/>
			<PinRef compName="D1" pinName="73"/>
		</Net>
		<Net name="A6">
			<PinRef compName="D1" pinName="96"/>
			<PinRef compName="X1" pinName="25"/>
		</Net>
		<Net name="ADR18">
			<PinRef compName="D4" pinName="17"/>
			<PinRef compName="D1" pinName="64"/>
		</Net>
		<Net name="SD3">
			<PinRef compName="D15" pinName="7"/>
			<PinRef compName="X1" pinName="6"/>
		</Net>
		<Net name="AEN">
			<PinRef compName="D1" pinName="2"/>
			<PinRef compName="X1" pinName="11"/>
		</Net>
		<Net name="A7">
			<PinRef compName="D1" pinName="98"/>
			<PinRef compName="X1" pinName="24"/>
		</Net>
		<Net name="AD1">
			<PinRef compName="D2" pinName="12"/>
			<PinRef compName="D1" pinName="25"/>
		</Net>
		<Net name="A3">
			<PinRef compName="D1" pinName="95"/>
			<PinRef compName="X1" pinName="28"/>
		</Net>
		<Net name="SD2">
			<PinRef compName="D15" pinName="6"/>
			<PinRef compName="X1" pinName="7"/>
		</Net>
		<Net name="D3">
			<PinRef compName="D15" pinName="17"/>
			<PinRef compName="D1" pinName="17"/>
		</Net>
		<Net name="WTBT">
			<PinRef compName="D4" pinName="15"/>
			<PinRef compName="D1" pinName="85"/>
		</Net>
		<Net name="AD13">
			<PinRef compName="D1" pinName="65"/>
			<PinRef compName="D3" pinName="13"/>
		</Net>
		<Net name="D5">
			<PinRef compName="D15" pinName="18"/>
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
			<PinRef compName="D5" pinName="14"/>
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
					<LayerRef name="Bottom"/>
				</LayerRule>
				<LayerRule width="0.2">
					<LayerRef name="Top"/>
				</LayerRule>
			</Impedance>
			<ImpedanceDiff name="ZDiff_100" Z0="100">
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
				<ViastackRef name="(Default)"/>
				<NetRef name="+5B"/>
				<Org x="181.1033" y="67.9179"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="0B"/>
				<Org x="190.8866" y="51.8459"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="+5B"/>
				<Org x="174.6107" y="63.648"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="+5B"/>
				<Org x="196.1956" y="76.2535"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="+5B"/>
				<Org x="190.7133" y="68.0959"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD13"/>
				<Org x="185.7859" y="67.5313"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="WTBT"/>
				<Org x="197.4421" y="61.4376"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D3"/>
				<Org x="181.7674" y="56.0187"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="A3"/>
				<Org x="181.7848" y="39.563"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="A3"/>
				<Org x="168.6497" y="36.358"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD1"/>
				<Org x="181.4292" y="76.47"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="ADR18"/>
				<Org x="187.2162" y="62.0025"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="#TDO"/>
				<Org x="187.75" y="57.1953"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="RES"/>
				<Org x="190.6355" y="42.1785"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="-IOR"/>
				<Org x="184.8795" y="38.5677"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D6"/>
				<Org x="179.3109" y="56.7836"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD7"/>
				<Org x="192.4003" y="76.5534"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD0"/>
				<Org x="180.4489" y="77.5594"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="RPLY_I"/>
				<Org x="192.6075" y="58.9867"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D7"/>
				<Org x="178.9188" y="58.4967"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD12"/>
				<Org x="187.1634" y="67.4752"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="IAKO"/>
				<Org x="197.19" y="57.134"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD15"/>
				<Org x="187.6535" y="58.5834"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD6"/>
				<Org x="190.7605" y="81.4371"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="ADR16"/>
				<Org x="178.7637" y="65.7851"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="DOUT"/>
				<Org x="193.0952" y="55.4653"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="ADR19"/>
				<Org x="177.3907" y="64.2227"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="DIN"/>
				<Org x="193.075" y="51.8245"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="SEL"/>
				<Org x="191.7826" y="66.0455"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="A1"/>
				<Org x="178.183" y="43.4441"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="A1"/>
				<Org x="163.7492" y="36.4889"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="-IOW"/>
				<Org x="202.662" y="36.358"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD2"/>
				<Org x="182.5053" y="75.4751"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="IRQ7"/>
				<Org x="180.4011" y="55.9731"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="SIA"/>
				<Org x="194.3492" y="54.3893"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="ADR17"/>
				<Org x="178.3117" y="67.8609"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="OSC"/>
				<Org x="189.8243" y="55.888"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD3"/>
				<Org x="191.311" y="80.0729"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD4"/>
				<Org x="191.7782" y="78.6833"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REST"/>
				<Org x="187.2251" y="50.9706"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="A8"/>
				<Org x="177.0054" y="38.2017"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="A8"/>
				<Org x="179.3546" y="36.358"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D2"/>
				<Org x="191.7473" y="43.0948"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="EB1"/>
				<Org x="195.9636" y="52.4282"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="ADR20"/>
				<Org x="176.6287" y="65.3455"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="DB"/>
				<Org x="198.0068" y="58.9494"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="#TCLK"/>
				<Org x="174.7593" y="56.525"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD14"/>
				<Org x="188.5311" y="67.1887"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="ADR21"/>
				<Org x="177.9422" y="74.9528"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="IRQ_B"/>
				<Org x="175.4902" y="64.6398"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D4"/>
				<Org x="180.0827" y="57.8818"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="AD5"/>
				<Org x="191.0539" y="75.9733"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D0"/>
				<Org x="190.7773" y="44.9763"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D1"/>
				<Org x="193.6502" y="44.1953"/>
			</Via>
		</Vias>
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA16"/>
				<Subwire width="0.3">
					<Start x="215.36" y="122.94"/>
					<TrackLine>
						<End x="216.4599" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="215.36" y="120.4"/>
						<End x="216.63" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="217.9" y="120.4"/>
						<End x="216.6746" y="120.0663"/>
					</TrackArc>
					<TrackLine>
						<End x="217.8561" y="115.7285"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="216.65" y="115.4"/>
						<End x="217.9" y="115.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="217.9" y="97.9"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="216.65" y="97.9"/>
						<End x="217.8285" y="97.4833"/>
					</TrackArcCW>
					<TrackLine>
						<End x="216.65" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.3">
					<Start x="172.9" y="62.7"/>
					<TrackLine>
						<End x="172.1" y="62.7"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.1" y="61.4"/>
						<End x="170.8954" y="61.8889"/>
					</TrackArc>
					<TrackLine>
						<End x="168.8569" y="56.8662"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.1" y="55.55"/>
						<End x="168.7919" y="54.4071"/>
					</TrackArc>
					<TrackLine>
						<End x="171.624" y="46.2092"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.9" y="46.65"/>
						<End x="171.9794" y="45.6626"/>
					</TrackArc>
					<TrackLine>
						<End x="176.4045" y="41.5366"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.183" y="43.4441"/>
						<End x="178.0663" y="40.8387"/>
					</TrackArc>
					<TrackLine>
						<End x="181.8344" y="40.6699"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7848" y="39.563"/>
						<End x="181.973" y="40.6549"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.0835" y="40.4635"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.15" y="46.65"/>
						<End x="184.8532" y="40.4117"/>
					</TrackArc>
					<TrackLine>
						<End x="190.7596" y="41.0775"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.6355" y="42.1785"/>
						<End x="191.3402" y="41.3235"/>
					</TrackArc>
					<TrackLine>
						<End x="192.452" y="42.2398"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7473" y="43.0948"/>
						<End x="192.7098" y="42.546"/>
					</TrackArc>
					<TrackLine>
						<End x="193.6502" y="44.1953"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.3">
					<Start x="172.9" y="55.55"/>
					<TrackLine>
						<End x="173.7" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8009" y="52.7496"/>
					</TrackLine>
					<TrackArc>
						<Center x="175.2" y="52.8"/>
						<End x="173.883" y="52.325"/>
					</TrackArc>
					<TrackLine>
						<End x="175.581" y="47.6169"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.9" y="46.65"/>
						<End x="175.7215" y="47.052"/>
					</TrackArcCW>
					<TrackLine>
						<End x="175.821" y="46.3538"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.9" y="46.65"/>
						<End x="177.9163" y="44.5501"/>
					</TrackArc>
					<TrackLine>
						<End x="178.1744" y="44.5521"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.183" y="43.4441"/>
						<End x="178.424" y="44.5256"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.428" y="43.4104"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.15" y="46.65"/>
						<End x="184.9593" y="43.4311"/>
					</TrackArc>
					<TrackLine>
						<End x="189.662" y="44.6134"/>
					</TrackLine>
					<TrackArc>
						<Center x="189.15" y="46.65"/>
						<End x="189.8094" y="44.6562"/>
					</TrackArc>
					<TrackLine>
						<End x="190.7773" y="44.9763"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD4"/>
				<Subwire width="0.3">
					<Start x="207.74" y="120.4"/>
					<TrackLine>
						<End x="209.15" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD5"/>
				<Subwire width="0.3">
					<Start x="189.5" y="69.85"/>
					<TrackLine>
						<End x="189.5" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.8" y="70.65"/>
						<End x="189.5558" y="71.0268"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.0539" y="75.9733"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.3">
					<Start x="180.4" y="69.85"/>
					<TrackLine>
						<End x="180.4" y="69.05"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.75" y="69.05"/>
						<End x="180.3954" y="68.9728"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.3862" y="68.8962"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.1" y="69.05"/>
						<End x="180.3215" y="68.6188"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.1881" y="68.241"/>
					</TrackLine>
					<TrackArc>
						<Center x="181.1033" y="67.9179"/>
						<End x="180.3861" y="67.2641"/>
					</TrackArc>
					<TrackLine>
						<End x="180.3862" y="67.2641"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.7637" y="65.7851"/>
						<End x="180.7444" y="66.732"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.097" y="65.9945"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.3907" y="64.2227"/>
						<End x="181.3636" y="63.1779"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.3052" y="59.1532"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.75" y="57.1953"/>
						<End x="180.0827" y="57.8818"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IRQ_B"/>
				<Subwire width="0.3">
					<Start x="172.9" y="60.75"/>
					<TrackLine>
						<End x="173.7" y="60.75"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.7" y="62.05"/>
						<End x="174.9023" y="61.5555"/>
					</TrackArc>
					<TrackLine>
						<End x="175.5962" y="63.2427"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.6107" y="63.648"/>
						<End x="175.6533" y="63.8684"/>
					</TrackArc>
					<TrackLine>
						<End x="175.4902" y="64.6398"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="174.55" y="69.85"/>
					<TrackLine>
						<End x="174.55" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="175.2" y="70.65"/>
						<End x="174.6833" y="71.0444"/>
					</TrackArcCW>
					<TrackLine>
						<End x="176.1192" y="72.9254"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.1" y="70.65"/>
						<End x="176.3241" y="73.1713"/>
					</TrackArcCW>
					<TrackLine>
						<End x="177.9422" y="74.9528"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD14"/>
				<Subwire width="0.3">
					<Start x="188.5311" y="67.1887"/>
					<TrackLine>
						<End x="189.5655" y="62.5234"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.2162" y="62.0025"/>
						<End x="187.5215" y="59.6155"/>
					</TrackArcCW>
					<TrackLine>
						<End x="187.5215" y="59.6158"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.6535" y="58.5834"/>
						<End x="186.7251" y="59.0539"/>
					</TrackArc>
					<TrackLine>
						<End x="186.1851" y="57.9884"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.75" y="57.1953"/>
						<End x="186.1128" y="56.5648"/>
					</TrackArc>
					<TrackLine>
						<End x="186.8566" y="54.6336"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="186.25" y="54.4"/>
						<End x="186.9" y="54.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.9" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="#TCLK"/>
				<Subwire width="0.3">
					<Start x="176.5" y="53.6"/>
					<TrackLine>
						<End x="176.5" y="54.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="175.85" y="54.4"/>
						<End x="176.3257" y="54.843"/>
					</TrackArc>
					<TrackLine>
						<End x="174.7593" y="56.525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DB"/>
				<Subwire width="0.3">
					<Start x="195" y="55.55"/>
					<TrackLine>
						<End x="195.8" y="55.55"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="56.85"/>
						<End x="196.3265" y="55.6614"/>
					</TrackArc>
					<TrackLine>
						<End x="197.5937" y="56.2227"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.19" y="57.134"/>
						<End x="198.1816" y="57.2351"/>
					</TrackArc>
					<TrackLine>
						<End x="198.0068" y="58.9494"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="191.45" y="69.85"/>
					<TrackLine>
						<End x="191.45" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.75" y="70.65"/>
						<End x="191.5334" y="71.1082"/>
					</TrackArcCW>
					<TrackLine>
						<End x="193.4372" y="76.1629"/>
					</TrackLine>
					<TrackArc>
						<Center x="192.4003" y="76.5534"/>
						<End x="193.458" y="76.8833"/>
					</TrackArc>
					<TrackLine>
						<End x="193.452" y="76.9026"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="196.65" y="77.9"/>
						<End x="193.434" y="76.9625"/>
					</TrackArcCW>
					<TrackLine>
						<End x="192.8419" y="78.9934"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7782" y="78.6833"/>
						<End x="192.8284" y="79.0364"/>
					</TrackArc>
					<TrackLine>
						<End x="192.3612" y="80.426"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.311" y="80.0729"/>
						<End x="192.3385" y="80.4875"/>
					</TrackArc>
					<TrackLine>
						<End x="191.788" y="81.8517"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.7605" y="81.4371"/>
						<End x="191.7683" y="81.8976"/>
					</TrackArc>
					<TrackLine>
						<End x="189.2631" y="87.3805"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.4" y="87.9"/>
						<End x="189.15" y="87.9"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="187.9" y="87.9"/>
						<End x="188.2861" y="89.0889"/>
					</TrackArc>
					<TrackLine>
						<End x="172.5139" y="94.2111"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.9" y="95.4"/>
						<End x="171.65" y="95.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="170.4" y="95.4"/>
						<End x="171.4825" y="96.025"/>
					</TrackArc>
					<TrackLine>
						<End x="169.3175" y="99.775"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="170.4" y="100.4"/>
						<End x="169.15" y="100.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="167.9" y="100.4"/>
						<End x="169.011" y="100.9729"/>
					</TrackArc>
					<TrackLine>
						<End x="164.15" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR20"/>
				<Subwire width="0.3">
					<Start x="172.9" y="60.1"/>
					<TrackLine>
						<End x="173.7" y="60.1"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.7" y="62.05"/>
						<End x="175.4299" y="61.15"/>
					</TrackArc>
					<TrackLine>
						<End x="175.696" y="61.6615"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.7" y="62.7"/>
						<End x="175.7775" y="61.8359"/>
					</TrackArc>
					<TrackLine>
						<End x="176.2479" y="62.967"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.6107" y="63.648"/>
						<End x="176.3815" y="63.5552"/>
					</TrackArc>
					<TrackLine>
						<End x="176.4191" y="64.2736"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.3907" y="64.2227"/>
						<End x="176.4404" y="64.4313"/>
					</TrackArcCW>
					<TrackLine>
						<End x="176.4405" y="64.4312"/>
					</TrackLine>
					<TrackArc>
						<Center x="175.4902" y="64.6398"/>
						<End x="176.4431" y="64.4437"/>
					</TrackArc>
					<TrackLine>
						<End x="176.6287" y="65.3455"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="174.55" y="53.6"/>
					<TrackLine>
						<End x="174.55" y="52.8"/>
					</TrackLine>
					<TrackArc>
						<Center x="175.2" y="52.8"/>
						<End x="174.5885" y="52.5795"/>
					</TrackArc>
					<TrackLine>
						<End x="176.2865" y="47.8713"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.9" y="46.65"/>
						<End x="176.464" y="47.1578"/>
					</TrackArcCW>
					<TrackLine>
						<End x="176.5635" y="46.4596"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.9" y="46.65"/>
						<End x="177.9105" y="45.3"/>
					</TrackArc>
					<TrackLine>
						<End x="178.1686" y="45.302"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.183" y="43.4441"/>
						<End x="178.5891" y="45.2572"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.8466" y="44.3035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7848" y="39.563"/>
						<End x="182.8775" y="44.2965"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.5698" y="44.1367"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.15" y="46.65"/>
						<End x="184.8161" y="44.1581"/>
					</TrackArc>
					<TrackLine>
						<End x="189.4827" y="45.4055"/>
					</TrackLine>
					<TrackArc>
						<Center x="189.15" y="46.65"/>
						<End x="190.048" y="45.7264"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="190.7773" y="44.9763"/>
						<End x="190.0593" y="45.7373"/>
					</TrackArcCW>
					<TrackLine>
						<End x="194.6932" y="50.1094"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.075" y="51.8245"/>
						<End x="195.2094" y="50.8221"/>
					</TrackArc>
					<TrackLine>
						<End x="195.9636" y="52.4282"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="216.65" y="77.9"/>
					<TrackLine>
						<End x="219.235" y="75.771"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="217.9" y="74.15"/>
						<End x="219.9207" y="74.7217"/>
					</TrackArcCW>
					<TrackLine>
						<End x="221.601" y="68.7825"/>
					</TrackLine>
					<TrackArc>
						<Center x="222.9" y="69.15"/>
						<End x="221.7638" y="68.421"/>
					</TrackArc>
					<TrackLine>
						<End x="222.9" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="172.9" y="56.2"/>
					<TrackLine>
						<End x="172.1" y="56.2"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.1" y="55.55"/>
						<End x="171.5019" y="55.2954"/>
					</TrackArc>
					<TrackLine>
						<End x="174.8322" y="47.4726"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.9" y="46.65"/>
						<End x="174.979" y="46.9462"/>
					</TrackArcCW>
					<TrackLine>
						<End x="175.0785" y="46.248"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.9" y="46.65"/>
						<End x="175.6485" y="44.9026"/>
					</TrackArc>
					<TrackLine>
						<End x="177.3077" y="42.7648"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.183" y="43.4441"/>
						<End x="178.1334" y="42.3372"/>
					</TrackArc>
					<TrackLine>
						<End x="181.9015" y="42.1684"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7848" y="39.563"/>
						<End x="182.278" y="42.1239"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.2426" y="41.9382"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.15" y="46.65"/>
						<End x="185.2609" y="41.982"/>
					</TrackArc>
					<TrackLine>
						<End x="190.3917" y="43.203"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.6355" y="42.1785"/>
						<End x="190.7724" y="43.2227"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.7473" y="43.0948"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD7"/>
				<Subwire width="0.3">
					<Start x="200.12" y="120.4"/>
					<TrackLine>
						<End x="201.65" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="177.0054" y="38.2017"/>
					<TrackLine>
						<End x="170.8354" y="44.6853"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.9" y="46.65"/>
						<End x="170.2062" y="45.7194"/>
					</TrackArcCW>
					<TrackLine>
						<End x="167.3741" y="53.9173"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="55.55"/>
						<End x="167.4846" y="57.4731"/>
					</TrackArcCW>
					<TrackLine>
						<End x="169.3308" y="61.9038"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="60.75"/>
						<End x="169.7353" y="62.5962"/>
					</TrackArcCW>
					<TrackLine>
						<End x="170.0506" y="63"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="61.4"/>
						<End x="172.1" y="64"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.9" y="64"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="179.37" y="32.6"/>
					<TrackLine>
						<End x="179.3546" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3546" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3546" y="36.358"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="186.65" y="115.4"/>
					<TrackLine>
						<End x="187" y="115.4"/>
					</TrackLine>
					<TrackLine>
						<End x="187.4" y="115.4"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="195" y="62.05"/>
					<TrackLine>
						<End x="194.2" y="62.05"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="194.2" y="62.7"/>
						<End x="194.1553" y="62.0515"/>
					</TrackArcCW>
					<TrackLine>
						<End x="193.6013" y="62.0897"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="195" y="62.7"/>
					<TrackLine>
						<End x="194.2" y="62.7"/>
					</TrackLine>
					<TrackLine>
						<End x="193.6001" y="62.6897"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="181.05" y="53.6"/>
					<TrackLine>
						<End x="181.05" y="54.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="180.4" y="54.4"/>
						<End x="181.0236" y="54.5833"/>
					</TrackArc>
					<TrackLine>
						<End x="180.9221" y="54.9286"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="161.69" y="83.06"/>
					<TrackLine>
						<End x="162.9327" y="81.5279"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="161.69" y="80.52"/>
						<End x="162.9327" y="79.5121"/>
					</TrackArcCW>
					<TrackLine>
						<End x="161.69" y="77.98"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="191.65" y="105.4"/>
					<TrackLine>
						<End x="192" y="105.05"/>
					</TrackLine>
					<TrackLine>
						<End x="192" y="104.65"/>
					</TrackLine>
					<TrackArc>
						<Center x="192.4" y="104.65"/>
						<End x="192.0383" y="104.4792"/>
					</TrackArc>
					<TrackLine>
						<End x="195.5488" y="97.0469"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.65" y="96.15"/>
						<End x="195.7438" y="96.3112"/>
					</TrackArcCW>
					<TrackLine>
						<End x="196.3047" y="89.0272"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.9" y="89.15"/>
						<End x="196.3072" y="88.9983"/>
					</TrackArc>
					<TrackLine>
						<End x="196.65" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="172.9" y="46.65"/>
					<TrackLine>
						<End x="169.7721" y="54.6385"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="55.55"/>
						<End x="169.9821" y="56.8783"/>
					</TrackArcCW>
					<TrackLine>
						<End x="171.2573" y="58.9116"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="193.6244" y="65.7808"/>
					<TrackLine>
						<End x="192.5623" y="66.8327"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7826" y="66.0455"/>
						<End x="191.5724" y="67.1334"/>
					</TrackArc>
					<TrackLine>
						<End x="190.9235" y="67.008"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.7133" y="68.0959"/>
						<End x="189.9017" y="67.3416"/>
					</TrackArcCW>
					<TrackLine>
						<End x="189.3427" y="67.943"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.5311" y="67.1887"/>
						<End x="188.5419" y="68.2966"/>
					</TrackArc>
					<TrackLine>
						<End x="188.1927" y="68.3"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.2" y="69.05"/>
						<End x="188.0732" y="68.3108"/>
					</TrackArcCW>
					<TrackLine>
						<End x="187.3287" y="68.4385"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.1634" y="67.4752"/>
						<End x="187.0021" y="68.4393"/>
					</TrackArc>
					<TrackLine>
						<End x="187.0022" y="68.439"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="186.9" y="69.05"/>
						<End x="186.8958" y="68.4306"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.2458" y="68.435"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="186.25" y="69.05"/>
						<End x="186.0739" y="68.4608"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.0646" y="68.4635"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.7859" y="67.5313"/>
						<End x="185.9926" y="68.4821"/>
					</TrackArc>
					<TrackLine>
						<End x="185.6176" y="68.5636"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="193.6013" y="62.0897"/>
					<TrackLine>
						<End x="193.6011" y="62.0855"/>
					</TrackLine>
					<TrackArc>
						<Center x="194.2" y="62.05"/>
						<End x="193.967" y="61.4971"/>
					</TrackArc>
					<TrackLine>
						<End x="194.0833" y="61.4481"/>
					</TrackLine>
					<TrackLine>
						<End x="194.2" y="61.4"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="61.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="228.5234" y="66.4012"/>
					<TrackLine>
						<End x="222.9" y="64.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="171.2573" y="58.9116"/>
							<Dot x="171.4895" y="59.0043"/>
							<Dot x="171.2872" y="59.5109"/>
							<Dot x="171.0355" y="59.0269"/>
						</Teardrop>
					</Teardrops>
					<Start x="171.2573" y="58.9116"/>
					<TrackLine>
						<End x="171.3509" y="60.7874"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="60.75"/>
						<End x="171.3589" y="60.8654"/>
					</TrackArcCW>
					<TrackLine>
						<End x="171.4577" y="61.5"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="61.4"/>
						<End x="172.1" y="62.05"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.9" y="62.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="206.7447" y="55.9997"/>
					<TrackLine>
						<End x="207.9" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="193.6244" y="65.7808"/>
					<TrackArc>
						<Center x="194.2" y="65.3"/>
						<End x="193.45" y="65.3"/>
					</TrackArc>
					<TrackLine>
						<End x="193.45" y="63.35"/>
					</TrackLine>
					<TrackArc>
						<Center x="194.2" y="63.35"/>
						<End x="193.4754" y="63.1564"/>
					</TrackArc>
					<TrackLine>
						<End x="193.6001" y="62.6897"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="230.4" y="69.15"/>
					<TrackLine>
						<End x="231.6294" y="70.626"/>
					</TrackLine>
					<TrackArc>
						<Center x="230.4" y="71.65"/>
						<End x="232" y="71.65"/>
					</TrackArc>
					<TrackLine>
						<End x="232" y="81.65"/>
					</TrackLine>
					<TrackArc>
						<Center x="230.4" y="81.65"/>
						<End x="231.7017" y="82.5803"/>
					</TrackArc>
					<TrackLine>
						<End x="227.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="195" y="61.4"/>
					<TrackLine>
						<End x="195.8" y="61.4"/>
					</TrackLine>
					<TrackLine>
						<End x="195.9789" y="61.3464"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.8" y="60.75"/>
						<End x="195.9789" y="60.1536"/>
					</TrackArcCW>
					<TrackLine>
						<End x="195.8" y="60.1"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="60.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="193.6001" y="62.6897"/>
					<TrackLine>
						<End x="193.6013" y="62.0897"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="185.6" y="69.85"/>
					<TrackLine>
						<End x="185.6" y="69.05"/>
					</TrackLine>
					<TrackArc>
						<Center x="186.25" y="69.05"/>
						<End x="185.6004" y="69.0259"/>
					</TrackArc>
					<TrackLine>
						<End x="185.6176" y="68.5636"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="185.6176" y="68.5636"/>
					<TrackLine>
						<End x="185.6014" y="68.5607"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.7859" y="67.5313"/>
						<End x="184.7425" y="67.6016"/>
					</TrackArc>
					<TrackLine>
						<End x="184.4826" y="63.7449"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.3907" y="64.2227"/>
						<End x="184.3233" y="62.6534"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.315" y="58.1993"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.75" y="57.1953"/>
						<End x="183.2209" y="57.6008"/>
					</TrackArc>
					<TrackLine>
						<End x="183.221" y="57.6008"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="183.0916" y="56.9468"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.7119" y="55.7252"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="181.7262" y="55.0304"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.7263" y="55.0306"/>
					</TrackLine>
					<TrackArc>
						<Center x="181.7" y="54.4"/>
						<End x="181.6153" y="55.0254"/>
					</TrackArc>
					<TrackLine>
						<End x="180.977" y="54.939"/>
					</TrackLine>
					<TrackArc>
						<Center x="181.05" y="54.4"/>
						<End x="180.9221" y="54.9287"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="195" y="60.1"/>
					<TrackLine>
						<End x="194.2" y="60.1"/>
					</TrackLine>
					<TrackArc>
						<Center x="194.2" y="59.45"/>
						<End x="193.5532" y="59.3853"/>
					</TrackArc>
					<TrackLine>
						<End x="193.5833" y="59.0843"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.6075" y="58.9867"/>
						<End x="193.4249" y="58.4449"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.1484" y="55.0103"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.8243" y="55.888"/>
						<End x="190.9962" y="54.8154"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.9961" y="54.8154"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.45" y="54.4"/>
						<End x="190.8675" y="54.5984"/>
					</TrackArc>
					<TrackLine>
						<End x="190.8" y="54.4"/>
					</TrackLine>
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
							<Dot x="171.2573" y="58.9116"/>
							<Dot x="171.329" y="58.6721"/>
							<Dot x="171.8515" y="58.8285"/>
							<Dot x="171.392" y="59.1223"/>
						</Teardrop>
					</Teardrops>
					<Start x="172.9" y="58.8"/>
					<TrackLine>
						<End x="172.1" y="58.8"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="59.45"/>
						<End x="172.0099" y="58.8063"/>
					</TrackArcCW>
					<TrackLine>
						<End x="171.2573" y="58.9116"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="228.5234" y="66.4012"/>
					<TrackLine>
						<End x="228.947" y="67.3199"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="230.4" y="66.65"/>
						<End x="229.1706" y="67.674"/>
					</TrackArcCW>
					<TrackLine>
						<End x="230.4" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="184.15" y="46.65"/>
					<TrackLine>
						<End x="188.3151" y="49.1663"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.2251" y="50.9706"/>
						<End x="188.7792" y="49.5464"/>
					</TrackArc>
					<TrackLine>
						<End x="190.8866" y="51.8459"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="230.4" y="64.15"/>
					<TrackLine>
						<End x="228.5234" y="66.4012"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="180.9221" y="54.9286"/>
					<TrackLine>
						<End x="180.5004" y="54.9992"/>
					</TrackLine>
					<TrackArc>
						<Center x="180.4" y="54.4"/>
						<End x="180.4004" y="55.0076"/>
					</TrackArc>
					<TrackLine>
						<End x="180.4004" y="55.0074"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.4011" y="55.9731"/>
						<End x="179.8583" y="55.1745"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.2551" y="55.5845"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.45" y="54.4"/>
						<End x="179.0963" y="55.6781"/>
					</TrackArc>
					<TrackLine>
						<End x="178.822" y="55.8168"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.3109" y="56.7836"/>
						<End x="178.2575" y="56.5304"/>
					</TrackArcCW>
					<TrackLine>
						<End x="177.8468" y="58.2391"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.9188" y="58.4967"/>
						<End x="178.0075" y="59.1172"/>
					</TrackArcCW>
					<TrackLine>
						<End x="178.0076" y="59.1171"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.7" y="62.05"/>
						<End x="178.529" y="60.091"/>
					</TrackArc>
					<TrackLine>
						<End x="179.8074" y="63.2423"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.3907" y="64.2227"/>
						<End x="179.954" y="64.7035"/>
					</TrackArc>
					<TrackLine>
						<End x="179.7176" y="65.964"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.7637" y="65.7851"/>
						<End x="178.8418" y="66.7525"/>
					</TrackArc>
					<TrackLine>
						<End x="178.2262" y="66.8021"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.3117" y="67.8609"/>
						<End x="177.5706" y="67.1"/>
					</TrackArcCW>
					<TrackLine>
						<End x="176.0465" y="68.5844"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="176.5" y="69.05"/>
						<End x="175.85" y="69.05"/>
					</TrackArcCW>
					<TrackLine>
						<End x="175.85" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="41.65"/>
					<TrackLine>
						<End x="226.424" y="42.8794"/>
					</TrackLine>
					<TrackArc>
						<Center x="225.4" y="41.65"/>
						<End x="225.8293" y="43.1913"/>
					</TrackArc>
					<TrackLine>
						<End x="209.9707" y="47.6087"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.4" y="49.15"/>
						<End x="209.376" y="47.9206"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.9" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="190.8" y="53.6"/>
					<TrackLine>
						<End x="190.8" y="52.8"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.45" y="52.8"/>
						<End x="190.8028" y="52.7393"/>
					</TrackArc>
					<TrackLine>
						<End x="190.8866" y="51.8459"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="195" y="65.95"/>
					<TrackLine>
						<End x="194.2" y="65.95"/>
					</TrackLine>
					<TrackArc>
						<Center x="194.2" y="65.3"/>
						<End x="193.9755" y="65.91"/>
					</TrackArc>
					<TrackLine>
						<End x="193.6244" y="65.7808"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="115.4"/>
					<TrackLine>
						<End x="222" y="115.05"/>
					</TrackLine>
					<TrackLine>
						<End x="222" y="114.65"/>
					</TrackLine>
					<TrackArc>
						<Center x="222.4" y="114.65"/>
						<End x="222.08" y="114.41"/>
					</TrackArc>
					<TrackLine>
						<End x="227.9" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="106.65"/>
					<TrackLine>
						<End x="229.4159" y="102.162"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="227.9" y="101.65"/>
						<End x="229.5" y="101.65"/>
					</TrackArcCW>
					<TrackLine>
						<End x="229.5" y="92.9"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="227.9" y="92.9"/>
						<End x="229.4159" y="92.388"/>
					</TrackArcCW>
					<TrackLine>
						<End x="227.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD1"/>
				<Subwire width="0.3">
					<Start x="215.36" y="120.4"/>
					<TrackLine>
						<End x="216.65" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA18"/>
				<Subwire width="0.3">
					<Start x="210.28" y="122.94"/>
					<TrackLine>
						<End x="211.3799" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.28" y="120.4"/>
						<End x="211.55" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="212.82" y="120.4"/>
						<End x="211.6005" y="120.0453"/>
					</TrackArc>
					<TrackLine>
						<End x="212.8503" y="115.7491"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="211.65" y="115.4"/>
						<End x="212.9" y="115.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="212.9" y="97.9"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="211.65" y="97.9"/>
						<End x="212.8285" y="97.4833"/>
					</TrackArcCW>
					<TrackLine>
						<End x="211.65" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REST"/>
				<Subwire width="0.3">
					<Start x="177.15" y="53.6"/>
					<TrackLine>
						<End x="177.15" y="52.8"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.8" y="52.8"/>
						<End x="177.7" y="52.1577"/>
					</TrackArc>
					<TrackLine>
						<End x="178.3346" y="52.0589"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.45" y="52.8"/>
						<End x="178.3589" y="52.0556"/>
					</TrackArc>
					<TrackLine>
						<End x="187.2251" y="50.9706"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A0"/>
				<Subwire width="0.3">
					<Start x="159.05" y="32.6"/>
					<TrackLine>
						<End x="159.9" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="159.9" y="35.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="160.05" y="35.4"/>
						<End x="159.9029" y="35.4295"/>
					</TrackArcCW>
					<TrackLine>
						<End x="164.2564" y="57.124"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="55.55"/>
						<End x="164.6332" y="58.4218"/>
					</TrackArcCW>
					<TrackLine>
						<End x="166.5933" y="63.5179"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="61.4"/>
						<End x="168.3301" y="65.9385"/>
					</TrackArcCW>
					<TrackLine>
						<End x="171.2054" y="68.3269"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="67.25"/>
						<End x="172.1" y="68.65"/>
					</TrackArcCW>
					<TrackArcCW>
						<Center x="172.1" y="67.9"/>
						<End x="172.1164" y="68.6498"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.7156" y="68.6148"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="173.7" y="67.9"/>
						<End x="174.121" y="68.4779"/>
					</TrackArcCW>
					<TrackLine>
						<End x="174.129" y="68.4721"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1342" y="68.4683"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2625" y="66.2322"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="176.6287" y="65.3455"/>
						<End x="177.625" y="65.7873"/>
					</TrackArcCW>
					<TrackLine>
						<End x="177.813" y="65.3635"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.7637" y="65.7851"/>
						<End x="178.0772" y="65.0039"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="177.3907" y="64.2227"/>
						<End x="178.3633" y="63.8545"/>
					</TrackArcCW>
					<TrackLine>
						<End x="177.1812" y="60.732"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="173.7" y="62.05"/>
						<End x="175.9928" y="59.1177"/>
					</TrackArcCW>
					<TrackLine>
						<End x="174.1004" y="57.6379"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="173.7" y="58.15"/>
						<End x="173.7" y="57.5"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.9" y="57.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A5"/>
				<Subwire width="0.3">
					<Start x="171.75" y="32.6"/>
					<TrackLine>
						<End x="170.9" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="170.9" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="170.75" y="35.4"/>
						<End x="170.8961" y="35.4341"/>
					</TrackArc>
					<TrackLine>
						<End x="166.5009" y="54.2415"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="55.55"/>
						<End x="166.7333" y="57.6141"/>
					</TrackArcCW>
					<TrackLine>
						<End x="168.6933" y="62.7103"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="61.4"/>
						<End x="170.6962" y="64.7692"/>
					</TrackArcCW>
					<TrackLine>
						<End x="171.85" y="65.25"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="64.65"/>
						<End x="172.1" y="65.3"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.9" y="65.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD4"/>
				<Subwire width="0.3">
					<Start x="188.85" y="69.85"/>
					<TrackLine>
						<End x="188.85" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.8" y="70.65"/>
						<End x="188.8914" y="71.0495"/>
					</TrackArcCW>
					<TrackLine>
						<End x="189.9694" y="76.2003"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="191.0539" y="75.9733"/>
						<End x="190.1835" y="76.6589"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.7782" y="78.6833"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BDIN"/>
				<Subwire width="0.3">
					<Start x="195.04" y="122.94"/>
					<TrackLine>
						<End x="196.1399" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.04" y="120.4"/>
						<End x="196.31" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="197.58" y="120.4"/>
						<End x="196.3128" y="120.3161"/>
					</TrackArc>
					<TrackLine>
						<End x="197.8029" y="97.8108"/>
					</TrackLine>
					<TrackArc>
						<Center x="199.15" y="97.9"/>
						<End x="197.8905" y="97.414"/>
					</TrackArc>
					<TrackLine>
						<End x="199.15" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BDIN"/>
				<Subwire width="0.3">
					<Start x="217.9" y="71.65"/>
					<TrackLine>
						<End x="219.0362" y="73.421"/>
					</TrackLine>
					<TrackArc>
						<Center x="217.9" y="74.15"/>
						<End x="218.1359" y="75.4792"/>
					</TrackArc>
					<TrackLine>
						<End x="211.4315" y="76.6692"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="211.65" y="77.9"/>
						<End x="210.4" y="77.9"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="209.15" y="77.9"/>
						<End x="209.957" y="78.8546"/>
					</TrackArc>
					<TrackLine>
						<End x="203.343" y="84.4454"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="204.15" y="85.4"/>
						<End x="202.9" y="85.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="201.65" y="85.4"/>
						<End x="202.2832" y="86.4777"/>
					</TrackArc>
					<TrackLine>
						<End x="199.7161" y="87.986"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.4" y="89.15"/>
						<End x="199.671" y="88.0138"/>
					</TrackArcCW>
					<TrackLine>
						<End x="197.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD3"/>
				<Subwire width="0.3">
					<Start x="188.2" y="69.85"/>
					<TrackLine>
						<End x="188.2" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.85" y="70.65"/>
						<End x="188.2107" y="70.7672"/>
					</TrackArcCW>
					<TrackLine>
						<End x="189.2263" y="76.3083"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="191.0539" y="75.9733"/>
						<End x="189.4525" y="76.9155"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.8232" y="79.2452"/>
					</TrackLine>
					<TrackLine>
						<End x="191.311" y="80.0729"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="OSC"/>
				<Subwire width="0.3">
					<Start x="189.8243" y="55.888"/>
					<TrackLine>
						<End x="191.6159" y="59.4811"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.6075" y="58.9867"/>
						<End x="192.1769" y="60.0076"/>
					</TrackArcCW>
					<TrackLine>
						<End x="193.6948" y="60.6478"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="194.2" y="59.45"/>
						<End x="194.2" y="60.75"/>
					</TrackArcCW>
					<TrackLine>
						<End x="195" y="60.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR17"/>
				<Subwire width="0.3">
					<Start x="179.1" y="69.85"/>
					<TrackLine>
						<End x="179.1" y="69.05"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0639" y="68.9012"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.45" y="69.05"/>
						<End x="178.9445" y="68.6569"/>
					</TrackArcCW>
					<TrackLine>
						<End x="178.3117" y="67.8609"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SIA"/>
				<Subwire width="0.3">
					<Start x="194.3492" y="54.3893"/>
					<TrackLine>
						<End x="193.4" y="54.3893"/>
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
					<Start x="210.28" y="120.4"/>
					<TrackLine>
						<End x="211.65" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="#TDI"/>
				<Subwire width="0.3">
					<Start x="183.65" y="69.85"/>
					<TrackLine>
						<End x="183.65" y="70.65"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="70.6549"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6133" y="75.4835"/>
					</TrackLine>
					<TrackArc>
						<Center x="182.5053" y="75.4751"/>
						<End x="183.294" y="76.2533"/>
					</TrackArc>
					<TrackLine>
						<End x="181.2376" y="78.3376"/>
					</TrackLine>
					<TrackArc>
						<Center x="180.4489" y="77.5594"/>
						<End x="180.3331" y="78.6613"/>
					</TrackArc>
					<TrackLine>
						<End x="161.8227" y="76.7169"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="161.69" y="77.98"/>
						<End x="161.055" y="76.8801"/>
					</TrackArcCW>
					<TrackLine>
						<End x="159.15" y="77.98"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="170.4" y="100.4"/>
					<TrackLine>
						<End x="171.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BIAKO"/>
				<Subwire width="0.3">
					<Start x="210.4" y="74.15"/>
					<TrackLine>
						<End x="209.8" y="74.75"/>
					</TrackLine>
					<TrackLine>
						<End x="209.65" y="74.75"/>
					</TrackLine>
					<TrackLine>
						<End x="209.6456" y="74.7501"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1631" y="75.146"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="196.1956" y="76.2535"/>
						<End x="195.4182" y="75.464"/>
					</TrackArcCW>
					<TrackLine>
						<End x="194.8257" y="76.0474"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="196.65" y="77.9"/>
						<End x="194.1197" y="77.3021"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.6835" y="87.6126"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.9" y="87.9"/>
						<End x="191.65" y="87.9"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="190.4" y="87.9"/>
						<End x="191.4" y="88.65"/>
					</TrackArc>
					<TrackLine>
						<End x="186.9" y="94.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.9" y="95.4"/>
						<End x="186.65" y="95.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="185.4" y="95.4"/>
						<End x="186.15" y="96.4"/>
					</TrackArc>
					<TrackLine>
						<End x="182.15" y="99.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.9" y="100.4"/>
						<End x="181.65" y="100.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="180.4" y="100.4"/>
						<End x="181.3134" y="101.2533"/>
					</TrackArc>
					<TrackLine>
						<End x="178.2366" y="104.5467"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.15" y="105.4"/>
						<End x="177.9" y="105.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="176.65" y="105.4"/>
						<End x="177.8603" y="105.7125"/>
					</TrackArc>
					<TrackLine>
						<End x="176.65" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA20"/>
				<Subwire width="0.3">
					<Start x="205.2" y="122.94"/>
					<TrackLine>
						<End x="206.2999" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.2" y="120.4"/>
						<End x="206.47" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="207.74" y="120.4"/>
						<End x="206.5268" y="120.0244"/>
					</TrackArc>
					<TrackLine>
						<End x="207.8441" y="115.7697"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.65" y="115.4"/>
						<End x="207.9" y="115.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.9" y="97.9"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.65" y="97.9"/>
						<End x="207.8285" y="97.4833"/>
					</TrackArcCW>
					<TrackLine>
						<End x="206.65" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DCLO"/>
				<Subwire width="0.3">
					<Start x="182.34" y="122.94"/>
					<TrackLine>
						<End x="183.4399" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.34" y="120.4"/>
						<End x="183.5139" y="119.9154"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.65" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DCLO"/>
				<Subwire width="0.3">
					<Start x="230.4" y="79.15"/>
					<TrackLine>
						<End x="220.7647" y="87.1867"/>
					</TrackLine>
					<TrackArc>
						<Center x="219.9" y="86.15"/>
						<End x="220.1382" y="87.4788"/>
					</TrackArc>
					<TrackLine>
						<End x="217.6794" y="87.9196"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="217.9" y="89.15"/>
						<End x="216.65" y="89.15"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="215.4" y="89.15"/>
						<End x="215.825" y="90.3255"/>
					</TrackArc>
					<TrackLine>
						<End x="213.614" y="91.1249"/>
					</TrackLine>
					<TrackArc>
						<Center x="212.9" y="89.15"/>
						<End x="213.2766" y="91.216"/>
					</TrackArc>
					<TrackLine>
						<End x="203.9259" y="92.9203"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="204.15" y="94.15"/>
						<End x="202.9" y="94.15"/>
					</TrackArcCW>
					<TrackLine>
						<End x="202.9" y="115.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="201.65" y="115.4"/>
						<End x="202.8376" y="115.7901"/>
					</TrackArc>
					<TrackLine>
						<End x="201.4534" y="120.0036"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="202.66" y="120.4"/>
						<End x="201.39" y="120.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="201.39" y="120.4076"/>
					</TrackLine>
					<TrackLine>
						<End x="201.3748" y="122.9475"/>
					</TrackLine>
					<TrackArc>
						<Center x="200.12" y="122.94"/>
						<End x="200.1196" y="124.1948"/>
					</TrackArc>
					<TrackLine>
						<End x="199.1089" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8499" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="197.5803" y="124.1948"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5037" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3099" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0403" y="124.1948"/>
					</TrackLine>
					<TrackLine>
						<End x="193.8985" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7699" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="192.5003" y="124.1948"/>
					</TrackLine>
					<TrackLine>
						<End x="191.2933" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="191.2299" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="189.9597" y="124.1948"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6901" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6679" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="187.4197" y="124.1948"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1501" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="186.0627" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8803" y="124.1948"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.88" y="122.94"/>
						<End x="184.2601" y="124.031"/>
					</TrackArc>
					<TrackLine>
						<End x="182.34" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BWTBT"/>
				<Subwire width="0.3">
					<Start x="217.9" y="122.94"/>
					<TrackLine>
						<End x="219.0435" y="121.1175"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="217.9" y="120.4"/>
						<End x="219.2158" y="120.7019"/>
					</TrackArcCW>
					<TrackLine>
						<End x="220.3683" y="115.6796"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="219.15" y="115.4"/>
						<End x="220.3911" y="115.2508"/>
					</TrackArcCW>
					<TrackLine>
						<End x="220.3271" y="114.7189"/>
					</TrackLine>
					<TrackArc>
						<Center x="220.9" y="114.65"/>
						<End x="220.323" y="114.65"/>
					</TrackArc>
					<TrackLine>
						<End x="220.323" y="109.9"/>
					</TrackLine>
					<TrackArc>
						<Center x="220.9" y="109.9"/>
						<End x="220.3271" y="109.8311"/>
					</TrackArc>
					<TrackLine>
						<End x="220.3911" y="109.2992"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="219.15" y="109.15"/>
						<End x="220.3911" y="109.0008"/>
					</TrackArcCW>
					<TrackLine>
						<End x="220.3271" y="108.4689"/>
					</TrackLine>
					<TrackArc>
						<Center x="220.9" y="108.4"/>
						<End x="220.323" y="108.4"/>
					</TrackArc>
					<TrackLine>
						<End x="220.323" y="106.15"/>
					</TrackLine>
					<TrackArc>
						<Center x="220.9" y="106.15"/>
						<End x="220.3271" y="106.0811"/>
					</TrackArc>
					<TrackLine>
						<End x="220.3911" y="105.5492"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="219.15" y="105.4"/>
						<End x="220.3911" y="105.2508"/>
					</TrackArcCW>
					<TrackLine>
						<End x="220.3271" y="104.7189"/>
					</TrackLine>
					<TrackArc>
						<Center x="220.9" y="104.65"/>
						<End x="220.323" y="104.6434"/>
					</TrackArc>
					<TrackLine>
						<End x="220.3999" y="97.9143"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="219.15" y="97.9"/>
						<End x="220.3285" y="97.4833"/>
					</TrackArcCW>
					<TrackLine>
						<End x="219.15" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="180.4011" y="55.9731"/>
					<TrackLine>
						<End x="181.0759" y="56.6794"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="181.1218" y="56.7243"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.1327" y="56.7342"/>
					</TrackLine>
					<TrackArc>
						<Center x="180.0827" y="57.8818"/>
						<End x="181.598" y="57.531"/>
					</TrackArc>
					<TrackLine>
						<End x="182.8542" y="62.958"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.3907" y="64.2227"/>
						<End x="182.9787" y="64.6961"/>
					</TrackArc>
					<TrackLine>
						<End x="182.857" y="66.1319"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.7637" y="65.7851"/>
						<End x="182.8523" y="66.1837"/>
					</TrackArc>
					<TrackLine>
						<End x="182.6684" y="68.0705"/>
					</TrackLine>
					<TrackArc>
						<Center x="181.1033" y="67.9179"/>
						<End x="182.5402" y="68.5567"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="183.65" y="69.05"/>
						<End x="182.5336" y="68.5718"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.4328" y="68.8071"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="183" y="69.05"/>
						<End x="182.4143" y="68.8559"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.35" y="69.05"/>
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
					<Start x="212.82" y="120.4"/>
					<TrackLine>
						<End x="214.15" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD6"/>
				<Subwire width="0.3">
					<Start x="202.66" y="120.4"/>
					<TrackLine>
						<End x="204.15" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD2"/>
				<Subwire width="0.3">
					<Start x="178.45" y="69.85"/>
					<TrackLine>
						<End x="178.45" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.1" y="70.65"/>
						<End x="178.6738" y="71.1408"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.1439" y="72.4173"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.9422" y="74.9528"/>
						<End x="180.6419" y="72.9559"/>
					</TrackArc>
					<TrackLine>
						<End x="182.5053" y="75.4751"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA21"/>
				<Subwire width="0.3">
					<Start x="202.66" y="122.94"/>
					<TrackLine>
						<End x="203.7599" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="202.66" y="120.4"/>
						<End x="203.93" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="205.2" y="120.4"/>
						<End x="203.9901" y="120.014"/>
					</TrackArc>
					<TrackLine>
						<End x="205.3409" y="115.7799"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="204.15" y="115.4"/>
						<End x="205.4" y="115.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="205.4" y="97.9"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="204.15" y="97.9"/>
						<End x="205.3285" y="97.4833"/>
					</TrackArcCW>
					<TrackLine>
						<End x="204.15" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-IOW"/>
				<Subwire width="0.3">
					<Start x="202.662" y="36.358"/>
					<TrackLine>
						<End x="202.5501" y="49.125"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.4" y="49.15"/>
						<End x="202.5587" y="49.373"/>
					</TrackArcCW>
					<TrackLine>
						<End x="203.1013" y="56.2857"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="55.9997"/>
						<End x="203.2041" y="56.9056"/>
					</TrackArcCW>
					<TrackLine>
						<End x="203.2042" y="56.9056"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="58.8"/>
						<End x="203.3624" y="57.6948"/>
					</TrackArc>
					<TrackLine>
						<End x="203.4299" y="58.1568"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="203.4054" y="59.8942"/>
					</TrackArc>
					<TrackLine>
						<End x="202.9661" y="62.4044"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.4421" y="61.4376"/>
						<End x="199.2727" y="66.7384"/>
					</TrackArc>
					<TrackLine>
						<End x="196.0122" y="67.8644"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="67.25"/>
						<End x="195.8" y="67.9"/>
					</TrackArc>
					<TrackLine>
						<End x="195" y="67.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="161.59" y="32.6"/>
					<TrackLine>
						<End x="162.44" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="162.44" y="35.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="162.59" y="35.4"/>
						<End x="162.465" y="35.4829"/>
					</TrackArcCW>
					<TrackLine>
						<End x="162.63" y="35.7317"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="163.13" y="35.4"/>
						<End x="162.8142" y="35.9102"/>
					</TrackArcCW>
					<TrackLine>
						<End x="163.7492" y="36.4889"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="178.183" y="43.4441"/>
					<TrackLine>
						<End x="182.2392" y="42.8901"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7848" y="39.563"/>
						<End x="182.4562" y="42.8532"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.3385" y="42.6732"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.15" y="46.65"/>
						<End x="185.0565" y="42.6937"/>
					</TrackArc>
					<TrackLine>
						<End x="190.245" y="43.8826"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.6355" y="42.1785"/>
						<End x="190.724" y="43.9246"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.724" y="43.9245"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.7773" y="44.9763"/>
						<End x="191.6392" y="44.3711"/>
					</TrackArc>
					<TrackLine>
						<End x="195.6186" y="50.0385"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.075" y="51.8245"/>
						<End x="195.684" y="50.1354"/>
					</TrackArc>
					<TrackLine>
						<End x="196.8125" y="51.8786"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.9636" y="52.4282"/>
						<End x="196.8817" y="52.0042"/>
					</TrackArc>
					<TrackLine>
						<End x="196.8896" y="52.0213"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.4" y="50.4"/>
						<End x="197.3286" y="52.749"/>
					</TrackArcCW>
					<TrackLine>
						<End x="199.3934" y="55.4488"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.19" y="57.134"/>
						<End x="199.9447" y="56.807"/>
					</TrackArc>
					<TrackLine>
						<End x="199.9454" y="56.8142"/>
					</TrackLine>
					<TrackLine>
						<End x="200.1701" y="58.6903"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="200.0541" y="59.6949"/>
					</TrackArc>
					<TrackLine>
						<End x="199.1879" y="62.0734"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.4421" y="61.4376"/>
						<End x="198.0993" y="63.1755"/>
					</TrackArc>
					<TrackLine>
						<End x="196.0299" y="63.958"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="63.35"/>
						<End x="195.8" y="64"/>
					</TrackArc>
					<TrackLine>
						<End x="195" y="64"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SEL"/>
				<Subwire width="0.3">
					<Start x="189.5" y="53.6"/>
					<TrackLine>
						<End x="189.5" y="54.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.85" y="54.4"/>
						<End x="189.4299" y="54.6936"/>
					</TrackArc>
					<TrackLine>
						<End x="189.2973" y="54.9556"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.2" y="54.4"/>
						<End x="189.1117" y="55.2255"/>
					</TrackArc>
					<TrackLine>
						<End x="189.1031" y="55.235"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.8243" y="55.888"/>
						<End x="188.8967" y="56.1814"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.4178" y="60.9897"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.2162" y="62.0025"/>
						<End x="190.4587" y="61.1293"/>
					</TrackArc>
					<TrackLine>
						<End x="191.7826" y="66.0455"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD12"/>
				<Subwire width="0.3">
					<Start x="187.42" y="120.4"/>
					<TrackLine>
						<End x="183.2702" y="116.2879"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.15" y="115.4"/>
						<End x="182.9" y="115.4"/>
					</TrackArc>
					<TrackLine>
						<End x="182.9" y="110.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.65" y="110.4"/>
						<End x="182.8603" y="110.0875"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A9"/>
				<Subwire width="0.3">
					<Start x="181.91" y="32.6"/>
					<TrackLine>
						<End x="182.76" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="182.76" y="35.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.91" y="35.4"/>
						<End x="182.785" y="35.4829"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.95" y="35.7317"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="183.45" y="35.4"/>
						<End x="183.4543" y="36"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.8611" y="35.99"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.8795" y="38.5677"/>
						<End x="185.7224" y="36.1316"/>
					</TrackArc>
					<TrackLine>
						<End x="191.9787" y="38.2963"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.6355" y="42.1785"/>
						<End x="193.2482" y="39.0084"/>
					</TrackArc>
					<TrackLine>
						<End x="194.36" y="39.9247"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7473" y="43.0948"/>
						<End x="194.8938" y="40.4537"/>
					</TrackArc>
					<TrackLine>
						<End x="196.2222" y="42.0364"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.6502" y="44.1953"/>
						<End x="196.8578" y="43.2016"/>
					</TrackArc>
					<TrackLine>
						<End x="199.2028" y="50.7709"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.4" y="50.4"/>
						<End x="199.3984" y="51.1534"/>
					</TrackArcCW>
					<TrackLine>
						<End x="200.8348" y="53.0631"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="56.85"/>
						<End x="200.9455" y="53.2149"/>
					</TrackArc>
					<TrackLine>
						<End x="201.5421" y="54.0594"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.19" y="57.134"/>
						<End x="202.4815" y="56.5058"/>
					</TrackArc>
					<TrackLine>
						<End x="202.4813" y="56.5058"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="55.9997"/>
						<End x="202.5854" y="57.0639"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="195.8" y="58.8"/>
						<End x="202.7743" y="58.1557"/>
					</TrackArc>
					<TrackLine>
						<End x="202.8067" y="58.506"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="202.7228" y="59.9467"/>
					</TrackArc>
					<TrackLine>
						<End x="202.195" y="62.4427"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.4421" y="61.4376"/>
						<End x="199.2138" y="65.961"/>
					</TrackArc>
					<TrackLine>
						<End x="196.037" y="67.2052"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="66.6"/>
						<End x="195.8" y="67.25"/>
					</TrackArc>
					<TrackLine>
						<End x="195" y="67.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD9"/>
				<Subwire width="0.3">
					<Start x="195.04" y="120.4"/>
					<TrackLine>
						<End x="194.2459" y="110.2942"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.9" y="110.4"/>
						<End x="193.5691" y="109.2275"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.2309" y="107.3225"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.9" y="106.15"/>
						<End x="189.6452" y="106.6479"/>
					</TrackArc>
					<TrackLine>
						<End x="189.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD15"/>
				<Subwire width="0.3">
					<Start x="172.9" y="95.4"/>
					<TrackLine>
						<End x="172.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DIN"/>
				<Subwire width="0.3">
					<Start x="193.075" y="51.8245"/>
					<TrackLine>
						<End x="192.4021" y="52.251"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.75" y="52.8"/>
						<End x="192.1" y="52.8"/>
					</TrackArcCW>
					<TrackLine>
						<End x="192.1" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="172.9" y="59.45"/>
					<TrackLine>
						<End x="173.7" y="59.45"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.7" y="62.05"/>
						<End x="175.7494" y="60.45"/>
					</TrackArc>
					<TrackLine>
						<End x="176.0647" y="60.8538"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.7" y="62.7"/>
						<End x="176.3848" y="61.3614"/>
					</TrackArc>
					<TrackLine>
						<End x="176.9447" y="62.4843"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.6107" y="63.648"/>
						<End x="177.1656" y="63.1244"/>
					</TrackArc>
					<TrackLine>
						<End x="177.3907" y="64.2227"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD5"/>
				<Subwire width="0.3">
					<Start x="205.2" y="120.4"/>
					<TrackLine>
						<End x="206.65" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DOUT"/>
				<Subwire width="0.3">
					<Start x="193.0952" y="55.4653"/>
					<TrackLine>
						<End x="192.789" y="54.6218"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.4" y="54.4"/>
						<End x="192.75" y="54.4"/>
					</TrackArc>
					<TrackLine>
						<End x="192.75" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="#TMS"/>
				<Subwire width="0.3">
					<Start x="176.5" y="69.85"/>
					<TrackLine>
						<End x="176.5" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.1" y="70.65"/>
						<End x="177.1456" y="72.3647"/>
					</TrackArcCW>
					<TrackLine>
						<End x="178.7751" y="74.2221"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.9422" y="74.9528"/>
						<End x="177.8131" y="76.0532"/>
					</TrackArc>
					<TrackLine>
						<End x="161.838" y="74.1787"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="161.69" y="75.44"/>
						<End x="161.055" y="74.3401"/>
					</TrackArcCW>
					<TrackLine>
						<End x="159.15" y="75.44"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="OE_BF"/>
				<Subwire width="0.3">
					<Start x="193.4" y="69.85"/>
					<TrackLine>
						<End x="193.4" y="69.4"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="69.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.8" y="67.25"/>
						<End x="196.5018" y="69.2822"/>
					</TrackArcCW>
					<TrackLine>
						<End x="199.7623" y="68.1563"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="197.4421" y="61.4376"/>
						<End x="204.4914" y="62.3491"/>
					</TrackArcCW>
					<TrackLine>
						<End x="204.6735" y="60.9409"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="198.4751" y="60.1394"/>
						<End x="204.7094" y="60.5826"/>
					</TrackArcCW>
					<TrackLine>
						<End x="204.7912" y="59.4317"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="198.0068" y="58.9494"/>
						<End x="204.6384" y="57.4388"/>
					</TrackArcCW>
					<TrackLine>
						<End x="204.4972" y="56.8189"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.8" y="58.8"/>
						<End x="204.4417" y="56.589"/>
					</TrackArcCW>
					<TrackLine>
						<End x="204.4416" y="56.589"/>
					</TrackLine>
					<TrackArc>
						<Center x="206.7447" y="55.9997"/>
						<End x="204.3699" y="56.1094"/>
					</TrackArc>
					<TrackLine>
						<End x="204.0514" y="49.2123"/>
					</TrackLine>
					<TrackArc>
						<Center x="205.4" y="49.15"/>
						<End x="204.0585" y="48.9991"/>
					</TrackArc>
					<TrackLine>
						<End x="204.7991" y="42.4168"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="204.65" y="42.4"/>
						<End x="204.8" y="42.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="204.8" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD7"/>
				<Subwire width="0.3">
					<Start x="232.71" y="32.6"/>
					<TrackLine>
						<End x="231.86" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="231.86" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="231.71" y="35.4"/>
						<End x="231.8542" y="35.4411"/>
					</TrackArc>
					<TrackLine>
						<End x="229.9195" y="42.2259"/>
					</TrackLine>
					<TrackArc>
						<Center x="227.9" y="41.65"/>
						<End x="229.916" y="42.238"/>
					</TrackArc>
					<TrackLine>
						<End x="227.9" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD6"/>
				<Subwire width="0.3">
					<Start x="230.17" y="32.6"/>
					<TrackLine>
						<End x="229.32" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="229.32" y="35.4017"/>
					</TrackLine>
					<TrackLine>
						<End x="229.2499" y="41.6651"/>
					</TrackLine>
					<TrackArc>
						<Center x="227.9" y="41.65"/>
						<End x="229.089" y="42.2893"/>
					</TrackArc>
					<TrackLine>
						<End x="225.4" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD5"/>
				<Subwire width="0.3">
					<Start x="227.63" y="32.6"/>
					<TrackLine>
						<End x="226.78" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="226.78" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="226.63" y="35.4"/>
						<End x="226.7765" y="35.4324"/>
					</TrackArc>
					<TrackLine>
						<End x="225.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD1"/>
				<Subwire width="0.3">
					<Start x="217.47" y="32.6"/>
					<TrackLine>
						<End x="216.62" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="216.62" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="216.47" y="35.4"/>
						<End x="216.6172" y="35.4288"/>
					</TrackArc>
					<TrackLine>
						<End x="215.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR16"/>
				<Subwire width="0.3">
					<Start x="179.1" y="53.6"/>
					<TrackLine>
						<End x="179.1" y="54.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.45" y="54.4"/>
						<End x="178.8123" y="54.9397"/>
					</TrackArc>
					<TrackLine>
						<End x="178.3028" y="55.2817"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.3109" y="56.7836"/>
						<End x="177.5567" y="56.342"/>
					</TrackArcCW>
					<TrackLine>
						<End x="177.1278" y="58.0458"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.9188" y="58.4967"/>
						<End x="177.3895" y="59.5322"/>
					</TrackArcCW>
					<TrackLine>
						<End x="177.3987" y="59.5458"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.7" y="62.05"/>
						<End x="177.8418" y="60.3775"/>
					</TrackArc>
					<TrackLine>
						<End x="179.1135" y="63.527"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.3907" y="64.2227"/>
						<End x="179.1136" y="64.9181"/>
					</TrackArc>
					<TrackLine>
						<End x="178.7637" y="65.7851"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD6"/>
				<Subwire width="0.3">
					<Start x="187.55" y="69.85"/>
					<TrackLine>
						<End x="187.55" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.2" y="70.65"/>
						<End x="187.5585" y="70.7548"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.48" y="76.3939"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="191.0539" y="75.9733"/>
						<End x="188.6904" y="77.0758"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.3069" y="80.5413"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="191.311" y="80.0729"/>
						<End x="190.3228" y="80.574"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.7605" y="81.4371"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA17"/>
				<Subwire width="0.3">
					<Start x="212.82" y="122.94"/>
					<TrackLine>
						<End x="213.9199" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="212.82" y="120.4"/>
						<End x="214.09" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="215.36" y="120.4"/>
						<End x="214.1375" y="120.0558"/>
					</TrackArc>
					<TrackLine>
						<End x="215.3532" y="115.7388"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="214.15" y="115.4"/>
						<End x="215.4" y="115.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="215.4" y="97.9"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="214.15" y="97.9"/>
						<End x="215.3285" y="97.4833"/>
					</TrackArcCW>
					<TrackLine>
						<End x="214.15" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD15"/>
				<Subwire width="0.3">
					<Start x="187.6535" y="58.5834"/>
					<TrackLine>
						<End x="187.0085" y="57.9474"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.75" y="57.1953"/>
						<End x="186.7559" y="56.8385"/>
					</TrackArc>
					<TrackLine>
						<End x="187.4736" y="54.8392"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="186.25" y="54.4"/>
						<End x="187.55" y="54.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="187.55" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IAKO"/>
				<Subwire width="0.3">
					<Start x="197.19" y="57.134"/>
					<TrackLine>
						<End x="196.2074" y="56.3435"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.8" y="56.85"/>
						<End x="195.8" y="56.2"/>
					</TrackArcCW>
					<TrackLine>
						<End x="195" y="56.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="187.1634" y="67.4752"/>
					<TrackLine>
						<End x="188.8467" y="62.561"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.2162" y="62.0025"/>
						<End x="187.4349" y="60.2929"/>
					</TrackArcCW>
					<TrackLine>
						<End x="187.4348" y="60.293"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.6535" y="58.5834"/>
						<End x="186.1265" y="59.3825"/>
					</TrackArc>
					<TrackLine>
						<End x="185.577" y="58.3325"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.75" y="57.1953"/>
						<End x="185.3072" y="57.414"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="184.8296" y="55.65"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.4173" y="54.7729"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="184.3773" y="54.6913"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="184.95" y="54.4"/>
						<End x="184.3149" y="54.4973"/>
					</TrackArc>
					<TrackLine>
						<End x="184.3" y="54.4"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD10"/>
				<Subwire width="0.3">
					<Start x="182.9" y="87.9"/>
					<TrackLine>
						<End x="185.0713" y="75.941"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.5053" y="75.4751"/>
						<End x="185.1118" y="75.3859"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.9504" y="70.6722"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.6" y="70.65"/>
						<End x="184.95" y="70.65"/>
					</TrackArc>
					<TrackLine>
						<End x="184.95" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RPLY"/>
				<Subwire width="0.3">
					<Start x="179.15" y="110.4"/>
					<TrackLine>
						<End x="180.3603" y="105.7125"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.15" y="105.4"/>
						<End x="180.4" y="105.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="181.65" y="105.4"/>
						<End x="181.6" y="104.151"/>
					</TrackArc>
					<TrackLine>
						<End x="184.096" y="104.0511"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.15" y="105.4"/>
						<End x="184.15" y="104.05"/>
					</TrackArc>
					<TrackLine>
						<End x="186.65" y="104.05"/>
					</TrackLine>
					<TrackArc>
						<Center x="186.65" y="105.4"/>
						<End x="186.704" y="104.0511"/>
					</TrackArc>
					<TrackLine>
						<End x="189.2" y="104.151"/>
					</TrackLine>
					<TrackArc>
						<Center x="189.15" y="105.4"/>
						<End x="190.3911" y="105.5492"/>
					</TrackArc>
					<TrackLine>
						<End x="190.3271" y="106.0811"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.9" y="106.15"/>
						<End x="190.8668" y="106.726"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.2655" y="106.749"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="191.3" y="106.15"/>
						<End x="191.3" y="106.75"/>
					</TrackArcCW>
					<TrackLine>
						<End x="192.4" y="106.75"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.4" y="106.15"/>
						<End x="192.9583" y="106.3698"/>
					</TrackArcCW>
					<TrackLine>
						<End x="196.5345" y="97.2856"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.65" y="96.15"/>
						<End x="196.5533" y="97.2366"/>
					</TrackArcCW>
					<TrackLine>
						<End x="197.8857" y="93.6768"/>
					</TrackLine>
					<TrackArc>
						<Center x="199.15" y="94.15"/>
						<End x="198.9214" y="92.8195"/>
					</TrackArc>
					<TrackLine>
						<End x="213.1116" y="90.382"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="212.9" y="89.15"/>
						<End x="214.15" y="89.15"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="215.4" y="89.15"/>
						<End x="214.975" y="87.9745"/>
					</TrackArc>
					<TrackLine>
						<End x="217.186" y="87.1751"/>
					</TrackLine>
					<TrackArc>
						<Center x="217.9" y="89.15"/>
						<End x="217.6143" y="87.0695"/>
					</TrackArc>
					<TrackLine>
						<End x="219.9816" y="86.7444"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="219.9" y="86.15"/>
						<End x="220.321" y="86.5775"/>
					</TrackArcCW>
					<TrackLine>
						<End x="230.4" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A2"/>
				<Subwire width="0.3">
					<Start x="164.13" y="32.6"/>
					<TrackLine>
						<End x="164.8572" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="164.8572" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="164.8572" y="36.4893"/>
					</TrackLine>
					<TrackLine>
						<End x="164.85" y="55.5473"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="55.55"/>
						<End x="165.3332" y="58.1526"/>
					</TrackArcCW>
					<TrackLine>
						<End x="167.2933" y="63.2487"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="61.4"/>
						<End x="168.8093" y="65.3615"/>
					</TrackArcCW>
					<TrackLine>
						<End x="171.6847" y="67.75"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="67.25"/>
						<End x="172.1" y="67.9"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.9" y="67.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD9"/>
				<Subwire width="0.3">
					<Start x="185.4" y="87.9"/>
					<TrackLine>
						<End x="186.2492" y="70.682"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="185.6" y="70.65"/>
						<End x="186.25" y="70.65"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.25" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD8"/>
				<Subwire width="0.3">
					<Start x="187.9" y="87.9"/>
					<TrackLine>
						<End x="186.9022" y="70.7254"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.2" y="70.65"/>
						<End x="186.9" y="70.65"/>
					</TrackArc>
					<TrackLine>
						<End x="186.9" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.3">
					<Start x="179.75" y="69.85"/>
					<TrackLine>
						<End x="179.75" y="69.05"/>
					</TrackLine>
					<TrackLine>
						<End x="179.7454" y="68.9956"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.1" y="69.05"/>
						<End x="179.7249" y="68.8796"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.5762" y="68.3344"/>
					</TrackLine>
					<TrackArc>
						<Center x="181.1033" y="67.9179"/>
						<End x="179.928" y="66.8576"/>
					</TrackArc>
					<TrackLine>
						<End x="179.939" y="66.8454"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.7637" y="65.7851"/>
						<End x="180.2752" y="66.2552"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.5972" y="65.2201"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.3907" y="64.2227"/>
						<End x="180.5547" y="63.0978"/>
					</TrackArcCW>
					<TrackLine>
						<End x="178.9188" y="58.4967"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD4"/>
				<Subwire width="0.3">
					<Start x="225.09" y="32.6"/>
					<TrackLine>
						<End x="224.24" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="224.24" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="224.09" y="35.4"/>
						<End x="224.2367" y="35.4315"/>
					</TrackArc>
					<TrackLine>
						<End x="222.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RPLY_I"/>
				<Subwire width="0.3">
					<Start x="190.15" y="53.6"/>
					<TrackLine>
						<End x="190.15" y="54.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.8" y="54.4"/>
						<End x="190.2194" y="54.6922"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.3508" y="54.9533"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="191.45" y="54.4"/>
						<End x="190.5422" y="55.2309"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.5423" y="55.2308"/>
					</TrackLine>
					<TrackArc>
						<Center x="189.8243" y="55.888"/>
						<End x="190.6803" y="55.4248"/>
					</TrackArc>
					<TrackLine>
						<End x="192.6075" y="58.9867"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD11"/>
				<Subwire width="0.3">
					<Start x="180.4" y="87.9"/>
					<TrackLine>
						<End x="184.2714" y="76.0522"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.5053" y="75.4751"/>
						<End x="184.3631" y="75.4506"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.3001" y="70.6671"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.6" y="70.65"/>
						<End x="184.3" y="70.65"/>
					</TrackArc>
					<TrackLine>
						<End x="184.3" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BSEL"/>
				<Subwire width="0.3">
					<Start x="197.58" y="122.94"/>
					<TrackLine>
						<End x="198.6799" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="197.58" y="120.4"/>
						<End x="198.85" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="200.12" y="120.4"/>
						<End x="198.9169" y="119.9933"/>
					</TrackArc>
					<TrackLine>
						<End x="200.3342" y="115.8003"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="199.15" y="115.4"/>
						<End x="200.4" y="115.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="200.4" y="97.9"/>
					</TrackLine>
					<TrackArc>
						<Center x="201.65" y="97.9"/>
						<End x="200.4715" y="97.4833"/>
					</TrackArc>
					<TrackLine>
						<End x="201.65" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD0"/>
				<Subwire width="0.3">
					<Start x="177.15" y="69.85"/>
					<TrackLine>
						<End x="177.15" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.1" y="70.65"/>
						<End x="177.6892" y="71.9961"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.2865" y="73.6702"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.9422" y="74.9528"/>
						<End x="179.7528" y="74.536"/>
					</TrackArc>
					<TrackLine>
						<End x="180.4489" y="77.5594"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD0"/>
				<Subwire width="0.3">
					<Start x="214.93" y="32.6"/>
					<TrackLine>
						<End x="214.08" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="214.08" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="213.93" y="35.4"/>
						<End x="214.0774" y="35.4279"/>
					</TrackArc>
					<TrackLine>
						<End x="212.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="181.05" y="69.85"/>
					<TrackLine>
						<End x="181.05" y="69.05"/>
					</TrackLine>
					<TrackArc>
						<Center x="183.65" y="69.05"/>
						<End x="181.0532" y="68.9203"/>
					</TrackArc>
					<TrackLine>
						<End x="181.1033" y="67.9179"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="182.4614" y="46.5647"/>
					<TrackLine>
						<End x="182.6845" y="46.0339"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.15" y="46.65"/>
						<End x="184.6554" y="45.1428"/>
					</TrackArc>
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
							<Dot x="198.4751" y="60.1394"/>
							<Dot x="198.3034" y="60.3211"/>
							<Dot x="197.907" y="59.9463"/>
							<Dot x="198.4496" y="59.8907"/>
						</Teardrop>
					</Teardrops>
					<Start x="198.4751" y="60.1394"/>
					<TrackLine>
						<End x="197.6927" y="59.8735"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="197.0349" y="59.0389"/>
					</TrackArc>
					<TrackLine>
						<End x="197.0027" y="58.6892"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.8" y="58.8"/>
						<End x="196.4201" y="57.7635"/>
					</TrackArcCW>
					<TrackLine>
						<End x="196.1337" y="57.5922"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.8" y="58.15"/>
						<End x="195.8" y="57.5"/>
					</TrackArcCW>
					<TrackLine>
						<End x="195" y="57.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="206.7447" y="60.9997"/>
					<TrackLine>
						<End x="205.3235" y="56.4429"/>
					</TrackLine>
					<TrackArc>
						<Center x="206.7447" y="55.9997"/>
						<End x="205.2563" y="55.9683"/>
					</TrackArc>
					<TrackLine>
						<End x="205.4" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="217.9" y="74.15"/>
					<TrackLine>
						<End x="211.3304" y="75.6764"/>
					</TrackLine>
					<TrackArc>
						<Center x="211.15" y="74.9"/>
						<End x="211.2062" y="75.6951"/>
					</TrackArc>
					<TrackLine>
						<End x="210.46" y="75.7479"/>
					</TrackLine>
					<TrackArc>
						<Center x="210.4" y="74.9"/>
						<End x="210.4301" y="75.7495"/>
					</TrackArc>
					<TrackLine>
						<End x="196.1956" y="76.2535"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="87.9"/>
					<TrackLine>
						<End x="195.0846" y="77.569"/>
					</TrackLine>
					<TrackArc>
						<Center x="196.65" y="77.9"/>
						<End x="195.7114" y="76.6042"/>
					</TrackArc>
					<TrackLine>
						<End x="196.1956" y="76.2535"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="172.9" y="61.4"/>
					<TrackLine>
						<End x="173.7" y="61.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.7" y="62.05"/>
						<End x="174.342" y="61.9485"/>
					</TrackArc>
					<TrackLine>
						<End x="174.6107" y="63.648"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="110.4"/>
					<TrackLine>
						<End x="187.4" y="110.4"/>
					</TrackLine>
					<TrackLine>
						<End x="187" y="110.4"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="172.9" y="64.65"/>
					<TrackLine>
						<End x="173.7" y="64.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="173.7" y="64"/>
						<End x="174.2785" y="64.2964"/>
					</TrackArcCW>
					<TrackLine>
						<End x="174.6107" y="63.648"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="109.15"/>
					<TrackLine>
						<End x="222" y="108.8"/>
					</TrackLine>
					<TrackLine>
						<End x="222" y="108.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="222.4" y="108.4"/>
						<End x="222.1018" y="108.1334"/>
					</TrackArc>
					<TrackLine>
						<End x="227.9" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="182.4614" y="46.5647"/>
							<Dot x="182.7079" y="46.5234"/>
							<Dot x="182.798" y="47.0614"/>
							<Dot x="182.3317" y="46.7784"/>
						</Teardrop>
					</Teardrops>
					<Start x="182.4614" y="46.5647"/>
					<TrackLine>
						<End x="183.0324" y="47.4073"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="184.15" y="46.65"/>
						<End x="183.5382" y="47.8534"/>
					</TrackArcCW>
					<TrackLine>
						<End x="187.7272" y="49.9829"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.2251" y="50.9706"/>
						<End x="187.0402" y="52.0631"/>
					</TrackArc>
					<TrackLine>
						<End x="187.0252" y="52.0605"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="186.9" y="52.8"/>
						<End x="186.7846" y="52.0589"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.15" y="52.1577"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="186.25" y="52.8"/>
						<End x="185.6" y="52.8"/>
					</TrackArcCW>
					<TrackLine>
						<End x="185.6" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="190.8" y="69.85"/>
					<TrackLine>
						<End x="190.8" y="69.05"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.15" y="69.05"/>
						<End x="190.7972" y="68.9893"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.7133" y="68.0959"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="190.4" y="100.4"/>
					<TrackLine>
						<End x="190.75" y="100.05"/>
					</TrackLine>
					<TrackLine>
						<End x="190.75" y="99.65"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.15" y="99.65"/>
						<End x="190.9061" y="99.3329"/>
					</TrackArc>
					<TrackLine>
						<End x="194.1682" y="96.8237"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.65" y="96.15"/>
						<End x="194.5" y="96.15"/>
					</TrackArcCW>
					<TrackLine>
						<End x="194.5" y="94.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.65" y="94.65"/>
						<End x="194.4764" y="94.4511"/>
					</TrackArcCW>
					<TrackLine>
						<End x="192.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="175.85" y="53.6"/>
					<TrackLine>
						<End x="175.85" y="52.8"/>
					</TrackLine>
					<TrackArc>
						<Center x="176.5" y="52.8"/>
						<End x="175.8845" y="52.5912"/>
					</TrackArc>
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
						<End x="182.4614" y="46.5647"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="198.4751" y="60.1394"/>
							<Dot x="198.7081" y="60.23"/>
							<Dot x="198.5106" y="60.7383"/>
							<Dot x="198.2545" y="60.2568"/>
						</Teardrop>
					</Teardrops>
					<Start x="198.4751" y="60.1394"/>
					<TrackLine>
						<End x="198.5482" y="61.372"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.4421" y="61.4376"/>
						<End x="197.9065" y="62.4436"/>
					</TrackArc>
					<TrackLine>
						<End x="196.0724" y="63.2902"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="62.7"/>
						<End x="195.8" y="63.35"/>
					</TrackArc>
					<TrackLine>
						<End x="195" y="63.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="189.15" y="46.65"/>
					<TrackLine>
						<End x="193.9614" y="50.7957"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.075" y="51.8245"/>
						<End x="194.3985" y="51.5206"/>
					</TrackArc>
					<TrackLine>
						<End x="194.4548" y="51.7653"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.4" y="50.4"/>
						<End x="194.5516" y="52.1338"/>
					</TrackArcCW>
					<TrackLine>
						<End x="194.7459" y="52.7892"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.9636" y="52.4282"/>
						<End x="195.2362" y="53.4694"/>
					</TrackArcCW>
					<TrackLine>
						<End x="198.2697" y="55.5885"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.19" y="57.134"/>
						<End x="199.0644" y="56.9313"/>
					</TrackArc>
					<TrackLine>
						<End x="199.2678" y="58.813"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="198.6179" y="60.0609"/>
					</TrackArc>
					<TrackLine>
						<End x="198.4751" y="60.1394"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD0"/>
				<Subwire width="0.3">
					<Start x="217.9" y="120.4"/>
					<TrackLine>
						<End x="219.15" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA19"/>
				<Subwire width="0.3">
					<Start x="207.74" y="122.94"/>
					<TrackLine>
						<End x="208.8399" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="207.74" y="120.4"/>
						<End x="209.01" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="210.28" y="120.4"/>
						<End x="209.0636" y="120.0348"/>
					</TrackArc>
					<TrackLine>
						<End x="210.3472" y="115.7594"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="209.15" y="115.4"/>
						<End x="210.4" y="115.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="210.4" y="97.9"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="209.15" y="97.9"/>
						<End x="210.3285" y="97.4833"/>
					</TrackArcCW>
					<TrackLine>
						<End x="209.15" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A4"/>
				<Subwire width="0.3">
					<Start x="169.21" y="32.6"/>
					<TrackLine>
						<End x="169.7577" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="169.7577" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="169.7577" y="36.358"/>
					</TrackLine>
					<TrackArc>
						<Center x="168.6497" y="36.358"/>
						<End x="169.7303" y="36.603"/>
					</TrackArc>
					<TrackLine>
						<End x="165.7608" y="54.1129"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="55.55"/>
						<End x="166.0332" y="57.8833"/>
					</TrackArcCW>
					<TrackLine>
						<End x="167.9933" y="62.9795"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="61.4"/>
						<End x="170.7787" y="65.5969"/>
					</TrackArcCW>
					<TrackLine>
						<End x="171.7096" y="65.89"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="64.65"/>
						<End x="172.1" y="65.95"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.9" y="65.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD7"/>
				<Subwire width="0.3">
					<Start x="190.15" y="69.85"/>
					<TrackLine>
						<End x="190.15" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.8" y="70.65"/>
						<End x="190.1973" y="70.8934"/>
					</TrackArcCW>
					<TrackLine>
						<End x="192.0813" y="75.5584"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.0539" y="75.9733"/>
						<End x="192.11" y="75.6383"/>
					</TrackArc>
					<TrackLine>
						<End x="192.4003" y="76.5534"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.3">
					<Start x="181.7" y="69.85"/>
					<TrackLine>
						<End x="181.7" y="69.05"/>
					</TrackLine>
					<TrackArc>
						<Center x="182.35" y="69.05"/>
						<End x="181.7649" y="68.7669"/>
					</TrackArc>
					<TrackLine>
						<End x="181.9722" y="68.3383"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.1033" y="67.9179"/>
						<End x="182.0674" y="67.9662"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.2426" y="64.4656"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.3907" y="64.2227"/>
						<End x="182.141" y="63.2056"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.4364" y="59.9145"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.6535" y="58.5834"/>
						<End x="181.403" y="59.7474"/>
					</TrackArc>
					<TrackLine>
						<End x="181.0229" y="57.7067"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="180.2399" y="56.9384"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.3109" y="56.7836"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-IOR"/>
				<Subwire width="0.3">
					<Start x="184.8795" y="38.5677"/>
					<TrackLine>
						<End x="181.8254" y="38.4557"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7848" y="39.563"/>
						<End x="181.3699" y="38.5356"/>
					</TrackArcCW>
					<TrackLine>
						<End x="176.9256" y="40.3304"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.183" y="43.4441"/>
						<End x="175.893" y="40.9881"/>
					</TrackArcCW>
					<TrackLine>
						<End x="171.4679" y="45.1141"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.9" y="46.65"/>
						<End x="170.9151" y="45.9643"/>
					</TrackArcCW>
					<TrackLine>
						<End x="168.083" y="54.1622"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="55.55"/>
						<End x="168.1769" y="57.1846"/>
					</TrackArcCW>
					<TrackLine>
						<End x="170.0231" y="61.6154"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="60.75"/>
						<End x="170.104" y="61.7885"/>
					</TrackArcCW>
					<TrackLine>
						<End x="170.3701" y="62.3"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="61.4"/>
						<End x="172.1" y="63.35"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.9" y="63.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="190.6355" y="42.1785"/>
					<TrackLine>
						<End x="185.1198" y="41.1975"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="184.15" y="46.65"/>
						<End x="183.1577" y="41.2015"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.1177" y="41.3909"/>
					</TrackLine>
					<TrackArc>
						<Center x="181.7848" y="39.563"/>
						<End x="181.868" y="41.4191"/>
					</TrackArc>
					<TrackLine>
						<End x="178.0998" y="41.588"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.183" y="43.4441"/>
						<End x="176.7152" y="42.3049"/>
					</TrackArcCW>
					<TrackLine>
						<End x="175.056" y="44.4428"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.9" y="46.65"/>
						<End x="174.336" y="46.1422"/>
					</TrackArcCW>
					<TrackLine>
						<End x="174.2365" y="46.8404"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.9" y="46.65"/>
						<End x="174.1483" y="47.1642"/>
					</TrackArc>
					<TrackLine>
						<End x="170.898" y="55.0549"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.1" y="55.55"/>
						<End x="172.1" y="56.85"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.9" y="56.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="#TDO"/>
				<Subwire width="0.3">
					<Start x="188.85" y="53.6"/>
					<TrackLine>
						<End x="188.85" y="54.4"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7817" y="54.5993"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.2" y="54.4"/>
						<End x="188.6558" y="54.8127"/>
					</TrackArc>
					<TrackLine>
						<End x="188.6472" y="54.8223"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.8243" y="55.888"/>
						<End x="188.3092" y="55.4127"/>
					</TrackArcCW>
					<TrackLine>
						<End x="187.75" y="57.1953"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A6"/>
				<Subwire width="0.3">
					<Start x="174.29" y="32.6"/>
					<TrackLine>
						<End x="175.14" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="175.14" y="35.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="175.29" y="35.4"/>
						<End x="175.165" y="35.4829"/>
					</TrackArcCW>
					<TrackLine>
						<End x="175.33" y="35.7317"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="175.83" y="35.4"/>
						<End x="175.5029" y="35.903"/>
					</TrackArcCW>
					<TrackLine>
						<End x="177.6094" y="37.2728"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.0054" y="38.2017"/>
						<End x="177.7915" y="37.4208"/>
					</TrackArc>
					<TrackLine>
						<End x="178.0364" y="37.6674"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.3546" y="36.358"/>
						<End x="179.8252" y="38.1554"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.3142" y="37.7656"/>
					</TrackLine>
					<TrackArc>
						<Center x="181.7848" y="39.563"/>
						<End x="181.6453" y="37.7102"/>
					</TrackArc>
					<TrackLine>
						<End x="184.7971" y="37.4729"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.8795" y="38.5677"/>
						<End x="185.2416" y="37.5312"/>
					</TrackArc>
					<TrackLine>
						<End x="191.4957" y="39.7165"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.6355" y="42.1785"/>
						<End x="192.2942" y="40.1659"/>
					</TrackArc>
					<TrackLine>
						<End x="193.406" y="41.0822"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7473" y="43.0948"/>
						<End x="193.7449" y="41.4181"/>
					</TrackArc>
					<TrackLine>
						<End x="195.0733" y="43.0008"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.6502" y="44.1953"/>
						<End x="195.4111" y="43.6026"/>
					</TrackArc>
					<TrackLine>
						<End x="197.9737" y="51.2166"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.4" y="50.4"/>
						<End x="198.3533" y="51.9377"/>
					</TrackArcCW>
					<TrackLine>
						<End x="200.429" y="54.7005"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.19" y="57.134"/>
						<End x="201.2131" y="56.6564"/>
					</TrackArc>
					<TrackLine>
						<End x="201.2129" y="56.6564"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="55.9997"/>
						<End x="201.2837" y="57.0991"/>
					</TrackArcCW>
					<TrackLine>
						<End x="201.3992" y="57.6727"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="58.8"/>
						<End x="201.4986" y="59.1858"/>
					</TrackArc>
					<TrackLine>
						<End x="201.4985" y="59.1858"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="201.3714" y="59.9121"/>
					</TrackArc>
					<TrackLine>
						<End x="200.6705" y="62.3614"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.4421" y="61.4376"/>
						<End x="198.2705" y="64.6918"/>
					</TrackArc>
					<TrackLine>
						<End x="195.9604" y="65.2799"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="64.65"/>
						<End x="195.8" y="65.3"/>
					</TrackArc>
					<TrackLine>
						<End x="195" y="65.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR18"/>
				<Subwire width="0.3">
					<Start x="183" y="53.6"/>
					<TrackLine>
						<End x="183" y="54.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="184.3" y="54.4"/>
						<End x="183.0448" y="54.7383"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.0888" y="54.9017"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="184.95" y="54.4"/>
						<End x="183.2319" y="55.2739"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="181.7674" y="56.0187"/>
						<End x="183.318" y="55.4754"/>
					</TrackArc>
					<TrackLine>
						<End x="183.7152" y="56.6091"/>
					</TrackLine>
					<TrackArc>
						<Center x="180.0827" y="57.8818"/>
						<End x="183.9164" y="57.5385"/>
					</TrackArc>
					<TrackLine>
						<End x="183.9163" y="57.5386"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.75" y="57.1953"/>
						<End x="184.0631" y="58.3005"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.4369" y="59.5476"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.6535" y="58.5834"/>
						<End x="186.4867" y="61.7322"/>
					</TrackArcCW>
					<TrackLine>
						<End x="187.2162" y="62.0025"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD3"/>
				<Subwire width="0.3">
					<Start x="222.55" y="32.6"/>
					<TrackLine>
						<End x="221.7" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="221.55" y="35.4"/>
						<End x="221.6968" y="35.4306"/>
					</TrackArc>
					<TrackLine>
						<End x="220.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AEN"/>
				<Subwire width="0.3">
					<Start x="209.85" y="32.6"/>
					<TrackLine>
						<End x="209" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="209" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="208.85" y="35.4"/>
						<End x="208.975" y="35.4829"/>
					</TrackArc>
					<TrackLine>
						<End x="208.81" y="35.7317"/>
					</TrackLine>
					<TrackArc>
						<Center x="208.31" y="35.4"/>
						<End x="208.7408" y="35.8176"/>
					</TrackArc>
					<TrackLine>
						<End x="204.2192" y="40.4824"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="204.65" y="40.9"/>
						<End x="204.0525" y="40.8452"/>
					</TrackArcCW>
					<TrackLine>
						<End x="203.3088" y="48.9583"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.4" y="49.15"/>
						<End x="203.3041" y="49.2806"/>
					</TrackArcCW>
					<TrackLine>
						<End x="203.7345" y="56.1873"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="55.9997"/>
						<End x="203.8228" y="56.7473"/>
					</TrackArcCW>
					<TrackLine>
						<End x="203.8229" y="56.7473"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="58.8"/>
						<End x="203.936" y="57.2553"/>
					</TrackArc>
					<TrackLine>
						<End x="204.0401" y="57.8039"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="204.0895" y="59.7945"/>
					</TrackArc>
					<TrackLine>
						<End x="203.7396" y="62.3126"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.4421" y="61.4376"/>
						<End x="199.5175" y="67.4473"/>
					</TrackArc>
					<TrackLine>
						<End x="196.257" y="68.5733"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="67.25"/>
						<End x="195.8" y="68.65"/>
					</TrackArc>
					<TrackArc>
						<Center x="195.8" y="67.9"/>
						<End x="195.7768" y="68.6496"/>
					</TrackArc>
					<TrackLine>
						<End x="194.1783" y="68.6002"/>
					</TrackLine>
					<TrackArc>
						<Center x="194.2" y="67.9"/>
						<End x="193.9672" y="68.5607"/>
					</TrackArc>
					<TrackLine>
						<End x="193.616" y="68.4369"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.4" y="69.05"/>
						<End x="192.75" y="69.05"/>
					</TrackArcCW>
					<TrackLine>
						<End x="192.75" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A7"/>
				<Subwire width="0.3">
					<Start x="176.83" y="32.6"/>
					<TrackLine>
						<End x="177.68" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="177.68" y="35.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.83" y="35.4"/>
						<End x="177.6949" y="35.4651"/>
					</TrackArcCW>
					<TrackLine>
						<End x="178.3563" y="36.8387"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.3546" y="36.358"/>
						<End x="179.6352" y="37.4299"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.1243" y="37.04"/>
					</TrackLine>
					<TrackArc>
						<Center x="181.7848" y="39.563"/>
						<End x="181.5972" y="36.9618"/>
					</TrackArc>
					<TrackLine>
						<End x="184.7473" y="36.7346"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.8795" y="38.5677"/>
						<End x="185.4831" y="36.8317"/>
					</TrackArc>
					<TrackLine>
						<End x="191.7383" y="39.0068"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.6355" y="42.1785"/>
						<End x="192.7712" y="39.5872"/>
					</TrackArc>
					<TrackLine>
						<End x="193.883" y="40.5035"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7473" y="43.0948"/>
						<End x="194.3193" y="40.9359"/>
					</TrackArc>
					<TrackLine>
						<End x="195.6478" y="42.5186"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.6502" y="44.1953"/>
						<End x="196.1318" y="43.3933"/>
					</TrackArc>
					<TrackLine>
						<End x="198.5857" y="50.9863"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.4" y="50.4"/>
						<End x="198.8708" y="51.5388"/>
					</TrackArcCW>
					<TrackLine>
						<End x="200.9515" y="54.3328"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.19" y="57.134"/>
						<End x="201.8472" y="56.5811"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="206.7447" y="55.9997"/>
						<End x="201.9667" y="57.2222"/>
					</TrackArcCW>
					<TrackLine>
						<End x="201.9668" y="57.2222"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="58.8"/>
						<End x="202.1652" y="58.744"/>
					</TrackArc>
					<TrackLine>
						<End x="202.1666" y="58.9128"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="202.044" y="59.9526"/>
					</TrackArc>
					<TrackLine>
						<End x="201.4289" y="62.4283"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.4421" y="61.4376"/>
						<End x="199.1089" y="65.1923"/>
					</TrackArc>
					<TrackLine>
						<End x="196.0637" y="66.5441"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="65.95"/>
						<End x="195.8" y="66.6"/>
					</TrackArc>
					<TrackLine>
						<End x="195" y="66.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD1"/>
				<Subwire width="0.3">
					<Start x="177.8" y="69.85"/>
					<TrackLine>
						<End x="177.8" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.1" y="70.65"/>
						<End x="178.2007" y="71.5887"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.7464" y="73.0696"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.9422" y="74.9528"/>
						<End x="180.3396" y="73.926"/>
					</TrackArc>
					<TrackLine>
						<End x="181.4292" y="76.47"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="181.7848" y="39.563"/>
					<TrackLine>
						<End x="184.3478" y="39.6353"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.15" y="46.65"/>
						<End x="184.924" y="39.6753"/>
					</TrackArc>
					<TrackLine>
						<End x="190.8404" y="40.3318"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.6355" y="42.1785"/>
						<End x="191.8172" y="40.7447"/>
					</TrackArc>
					<TrackLine>
						<End x="192.929" y="41.661"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7473" y="43.0948"/>
						<End x="193.1704" y="41.9003"/>
					</TrackArc>
					<TrackLine>
						<End x="194.4989" y="43.483"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.6502" y="44.1953"/>
						<End x="194.696" y="43.8293"/>
					</TrackArc>
					<TrackLine>
						<End x="197.3671" y="51.4615"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.4" y="50.4"/>
						<End x="197.8392" y="52.341"/>
					</TrackArcCW>
					<TrackLine>
						<End x="199.9096" y="55.0726"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.19" y="57.134"/>
						<End x="200.5788" y="56.7317"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="206.7447" y="55.9997"/>
						<End x="200.5887" y="56.811"/>
					</TrackArcCW>
					<TrackLine>
						<End x="200.8217" y="58.5784"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="200.7073" y="59.8261"/>
					</TrackArc>
					<TrackLine>
						<End x="199.9227" y="62.2429"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.4421" y="61.4376"/>
						<End x="198.2178" y="63.9276"/>
					</TrackArc>
					<TrackLine>
						<End x="195.9933" y="64.6206"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="64"/>
						<End x="195.8" y="64.65"/>
					</TrackArc>
					<TrackLine>
						<End x="195" y="64.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="166.67" y="32.6"/>
					<TrackLine>
						<End x="167.52" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="167.52" y="35.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="167.67" y="35.4"/>
						<End x="167.545" y="35.4829"/>
					</TrackArcCW>
					<TrackLine>
						<End x="167.71" y="35.7317"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.21" y="35.4"/>
						<End x="167.9041" y="35.9162"/>
					</TrackArcCW>
					<TrackLine>
						<End x="168.6497" y="36.358"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD2"/>
				<Subwire width="0.3">
					<Start x="220.01" y="32.6"/>
					<TrackLine>
						<End x="219.16" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="219.16" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="219.01" y="35.4"/>
						<End x="219.157" y="35.4297"/>
					</TrackArc>
					<TrackLine>
						<End x="217.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.3">
					<Start x="183" y="69.85"/>
					<TrackLine>
						<End x="183" y="69.05"/>
					</TrackLine>
					<TrackLine>
						<End x="183.0826" y="68.8335"/>
					</TrackLine>
					<TrackArc>
						<Center x="183.65" y="69.05"/>
						<End x="183.095" y="68.8033"/>
					</TrackArc>
					<TrackLine>
						<End x="183.0952" y="68.8034"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.1033" y="67.9179"/>
						<End x="183.2491" y="68.3012"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.546" y="66.6394"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.7637" y="65.7851"/>
						<End x="183.6044" y="66.1952"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.726" y="64.7595"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.3907" y="64.2227"/>
						<End x="183.6071" y="62.8884"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.6214" y="58.2961"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.75" y="57.1953"/>
						<End x="182.5255" y="57.6631"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="182.0816" y="56.4607"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.7674" y="56.0187"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="WTBT"/>
				<Subwire width="0.3">
					<Start x="195" y="58.15"/>
					<TrackLine>
						<End x="195.8" y="58.15"/>
					</TrackLine>
					<TrackLine>
						<End x="196.0234" y="58.2389"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="58.8"/>
						<End x="196.4033" y="58.7727"/>
					</TrackArc>
					<TrackLine>
						<End x="196.4145" y="59.0214"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="198.0068" y="58.9494"/>
						<End x="196.695" y="59.8547"/>
					</TrackArcCW>
					<TrackLine>
						<End x="196.8248" y="60.0428"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.8" y="60.75"/>
						<End x="196.947" y="60.2655"/>
					</TrackArc>
					<TrackLine>
						<End x="197.4421" y="61.4376"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="185.7859" y="67.5313"/>
					<TrackLine>
						<End x="188.1594" y="62.4424"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.2162" y="62.0025"/>
						<End x="187.3482" y="60.9701"/>
					</TrackArcCW>
					<TrackLine>
						<End x="187.3482" y="60.9704"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.6535" y="58.5834"/>
						<End x="185.5362" y="59.7268"/>
					</TrackArc>
					<TrackLine>
						<End x="184.9776" y="58.6925"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.75" y="57.1953"/>
						<End x="184.6117" y="57.4763"/>
					</TrackArc>
					<TrackLine>
						<End x="184.6118" y="57.4763"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="184.2962" y="56.1721"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.8853" y="55.1593"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="183.8046" y="54.9825"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="184.95" y="54.4"/>
						<End x="183.6947" y="54.6745"/>
					</TrackArc>
					<TrackLine>
						<End x="183.665" y="54.5388"/>
					</TrackLine>
					<TrackArc>
						<Center x="184.3" y="54.4"/>
						<End x="183.65" y="54.4"/>
					</TrackArc>
					<TrackLine>
						<End x="183.65" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.3">
					<Start x="192.1" y="69.85"/>
					<TrackLine>
						<End x="192.1" y="70.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.75" y="70.65"/>
						<End x="192.65" y="71.2923"/>
					</TrackArcCW>
					<TrackLine>
						<End x="193.2846" y="71.3911"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.4" y="70.65"/>
						<End x="193.6731" y="71.3485"/>
					</TrackArcCW>
					<TrackLine>
						<End x="200.3035" y="68.7561"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="197.4421" y="61.4376"/>
						<End x="203.1916" y="66.794"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.7325" y="61.9199"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="60.9997"/>
						<End x="208.0704" y="61.2548"/>
					</TrackArcCW>
					<TrackLine>
						<End x="210.4" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD8"/>
				<Subwire width="0.3">
					<Start x="197.58" y="120.4"/>
					<TrackLine>
						<End x="199.15" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="192.5" y="122.94"/>
					<TrackLine>
						<End x="191.4001" y="121.035"/>
					</TrackLine>
					<TrackArc>
						<Center x="192.5" y="120.4"/>
						<End x="191.23" y="120.4"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="189.96" y="120.4"/>
						<End x="190.5515" y="119.2762"/>
					</TrackArcCW>
					<TrackLine>
						<End x="185.6206" y="116.681"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.9" y="116.15"/>
						<End x="185.5019" y="116.5989"/>
					</TrackArc>
					<TrackLine>
						<End x="184.15" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA16"/>
				<Subwire width="0.3">
					<Start x="214.15" y="85.4"/>
					<TrackLine>
						<End x="215.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA16"/>
				<Subwire width="0.3">
					<Start x="216.65" y="94.15"/>
					<TrackLine>
						<End x="215.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.3">
					<Start x="193.6502" y="44.1953"/>
					<TrackLine>
						<End x="200.3709" y="44.0503"/>
					</TrackLine>
					<TrackArc>
						<Center x="200.4" y="45.4"/>
						<End x="200.4" y="44.05"/>
					</TrackArc>
					<TrackArc>
						<Center x="200.4" y="50.4"/>
						<End x="201.7714" y="44.1999"/>
					</TrackArc>
					<TrackLine>
						<End x="218.1916" y="47.8319"/>
					</TrackLine>
					<TrackArc>
						<Center x="217.9" y="49.15"/>
						<End x="218.629" y="48.0138"/>
					</TrackArc>
					<TrackLine>
						<End x="220.4" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.3">
					<Start x="190.7773" y="44.9763"/>
					<TrackLine>
						<End x="192.3207" y="44.0325"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="191.7473" y="43.0948"/>
						<End x="192.6971" y="43.648"/>
					</TrackArcCW>
					<TrackLine>
						<End x="192.7004" y="43.6421"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.6502" y="44.1953"/>
						<End x="193.6417" y="43.0962"/>
					</TrackArc>
					<TrackLine>
						<End x="206.1546" y="43"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.15" y="42.4"/>
						<End x="206.5481" y="42.8489"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD4"/>
				<Subwire width="0.3">
					<Start x="209.15" y="105.4"/>
					<TrackLine>
						<End x="209.15" y="109.15"/>
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
				<NetRef name="AD5"/>
				<Subwire width="0.3">
					<Start x="191.0539" y="75.9733"/>
					<TrackLine>
						<End x="191.3442" y="76.8884"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.4003" y="76.5534"/>
						<End x="192.0358" y="77.5997"/>
					</TrackArcCW>
					<TrackLine>
						<End x="192.1427" y="77.637"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7782" y="78.6833"/>
						<End x="192.5507" y="77.889"/>
					</TrackArc>
					<TrackLine>
						<End x="194.6631" y="79.9432"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="196.65" y="77.9"/>
						<End x="195.5704" y="80.5376"/>
					</TrackArcCW>
					<TrackLine>
						<End x="204.6235" y="84.2432"/>
					</TrackLine>
					<TrackArc>
						<Center x="204.15" y="85.4"/>
						<End x="205.4" y="85.4"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="206.65" y="85.4"/>
						<End x="205.4814" y="85.8438"/>
					</TrackArcCW>
					<TrackLine>
						<End x="206.5686" y="88.7062"/>
					</TrackLine>
					<TrackArc>
						<Center x="205.4" y="89.15"/>
						<End x="206.65" y="89.15"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="207.9" y="89.15"/>
						<End x="206.6925" y="89.4731"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.8575" y="93.8269"/>
					</TrackLine>
					<TrackArc>
						<Center x="206.65" y="94.15"/>
						<End x="207.9" y="94.15"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="209.15" y="94.15"/>
						<End x="208.7005" y="95.3164"/>
					</TrackArcCW>
					<TrackLine>
						<End x="212.1355" y="96.6403"/>
					</TrackLine>
					<TrackArc>
						<Center x="211.65" y="97.9"/>
						<End x="212.379" y="96.7638"/>
					</TrackArc>
					<TrackLine>
						<End x="214.15" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.3">
					<Start x="180.0827" y="57.8818"/>
					<TrackLine>
						<End x="181.9952" y="57.6077"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="183.2808" y="56.5537"/>
					</TrackArcCW>
					<TrackLine>
						<End x="185.4733" y="50.3514"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.2251" y="50.9706"/>
						<End x="187.5937" y="49.1495"/>
					</TrackArc>
					<TrackLine>
						<End x="188.6027" y="49.3538"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.15" y="46.65"/>
						<End x="190.3571" y="49.1305"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.4946" y="48.5769"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.075" y="51.8245"/>
						<End x="192.5769" y="48.2473"/>
					</TrackArc>
					<TrackLine>
						<End x="195.3281" y="47.8642"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.9636" y="52.4282"/>
						<End x="196.0477" y="47.821"/>
					</TrackArc>
					<TrackLine>
						<End x="200.3544" y="47.8996"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.4" y="45.4"/>
						<End x="200.4" y="47.9"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="200.4" y="50.4"/>
						<End x="202.6848" y="49.3853"/>
					</TrackArc>
					<TrackLine>
						<End x="203.0448" y="50.1959"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.4" y="49.15"/>
						<End x="205.1186" y="51.7116"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.5888" y="51.983"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="207.9" y="49.15"/>
						<End x="207.9" y="52"/>
					</TrackArcCW>
					<TrackLine>
						<End x="210.4" y="52"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.4" y="49.15"/>
						<End x="211.255" y="51.8687"/>
					</TrackArcCW>
					<TrackLine>
						<End x="215.805" y="50.4378"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="215.4" y="49.15"/>
						<End x="216.129" y="50.2862"/>
					</TrackArcCW>
					<TrackLine>
						<End x="217.9" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IRQ_B"/>
				<Subwire width="0.3">
					<Start x="175.4902" y="64.6398"/>
					<TrackLine>
						<End x="176.7496" y="63.5088"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.3907" y="64.2227"/>
						<End x="177.6381" y="63.2956"/>
					</TrackArc>
					<TrackLine>
						<End x="177.6381" y="63.2957"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.9188" y="58.4967"/>
						<End x="178.0984" y="63.3954"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.1304" y="63.5682"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="181.9801" y="63.3262"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.0613" y="62.6009"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="185.4786" y="61.9191"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.6861" y="61.1597"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.2162" y="62.0025"/>
						<End x="187.0956" y="61.0141"/>
					</TrackArc>
					<TrackLine>
						<End x="187.9375" y="60.9114"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.6535" y="58.5834"/>
						<End x="189.0631" y="60.4578"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.7445" y="58.4414"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.8243" y="55.888"/>
						<End x="191.9538" y="58.2696"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.9607" y="58.2634"/>
					</TrackLine>
					<TrackArc>
						<Center x="192.6075" y="58.9867"/>
						<End x="192.3944" y="58.0401"/>
					</TrackArc>
					<TrackLine>
						<End x="193.6131" y="57.7657"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.0952" y="55.4653"/>
						<End x="193.9466" y="57.6642"/>
					</TrackArcCW>
					<TrackLine>
						<End x="195.3995" y="57.1017"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="194.3492" y="54.3893"/>
						<End x="196.4331" y="56.4184"/>
					</TrackArcCW>
					<TrackLine>
						<End x="196.4438" y="56.4074"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.19" y="57.134"/>
						<End x="197.5783" y="56.1676"/>
					</TrackArc>
					<TrackLine>
						<End x="198.9096" y="56.7025"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="199.6202" y="57.1437"/>
					</TrackArc>
					<TrackLine>
						<End x="203.0135" y="60.1756"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="55.9997"/>
						<End x="203.3979" y="60.4896"/>
					</TrackArcCW>
					<TrackLine>
						<End x="209.6529" y="65.1522"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.4" y="64.15"/>
						<End x="210.4" y="65.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="217.9" y="65.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="217.9" y="66.65"/>
						<End x="218.525" y="65.5675"/>
					</TrackArc>
					<TrackLine>
						<End x="222.275" y="67.7325"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="222.9" y="66.65"/>
						<End x="222.9" y="67.9"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="222.9" y="69.15"/>
						<End x="223.4778" y="68.0416"/>
					</TrackArc>
					<TrackLine>
						<End x="230.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="177.9422" y="74.9528"/>
					<TrackLine>
						<End x="181.9518" y="73.7015"/>
					</TrackLine>
					<TrackArc>
						<Center x="182.5053" y="75.4751"/>
						<End x="182.6134" y="73.6202"/>
					</TrackArc>
					<TrackLine>
						<End x="191.162" y="74.1184"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.0539" y="75.9733"/>
						<End x="191.7891" y="74.2669"/>
					</TrackArc>
					<TrackLine>
						<End x="193.1355" y="74.847"/>
					</TrackLine>
					<TrackArc>
						<Center x="192.4003" y="76.5534"/>
						<End x="193.7515" y="75.2781"/>
					</TrackArc>
					<TrackLine>
						<End x="195.3898" y="77.014"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="196.1956" y="76.2535"/>
						<End x="195.574" y="77.1707"/>
					</TrackArcCW>
					<TrackLine>
						<End x="196.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD14"/>
				<Subwire width="0.3">
					<Start x="172.9" y="87.9"/>
					<TrackLine>
						<End x="175.3775" y="74.4793"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.9422" y="74.9528"/>
						<End x="176.4555" y="72.81"/>
					</TrackArc>
					<TrackLine>
						<End x="185.2263" y="66.7248"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.7859" y="67.5313"/>
						<End x="185.757" y="66.5501"/>
					</TrackArc>
					<TrackLine>
						<End x="187.1349" y="66.5095"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.1634" y="67.4752"/>
						<End x="187.674" y="66.6551"/>
					</TrackArc>
					<TrackLine>
						<End x="188.5311" y="67.1887"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="#TCLK"/>
				<Subwire width="0.3">
					<Start x="174.7593" y="56.525"/>
					<TrackLine>
						<End x="159.15" y="72.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="DB"/>
				<Subwire width="0.3">
					<Start x="221.65" y="105.4"/>
					<TrackLine>
						<End x="221.05" y="104.8"/>
					</TrackLine>
					<TrackLine>
						<End x="221.05" y="104.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="220.9" y="104.65"/>
						<End x="221.0493" y="104.6355"/>
					</TrackArcCW>
					<TrackLine>
						<End x="220.4059" y="98.021"/>
					</TrackLine>
					<TrackArc>
						<Center x="221.65" y="97.9"/>
						<End x="220.4" y="97.9"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="219.15" y="97.9"/>
						<End x="220.3996" y="97.8677"/>
					</TrackArcCW>
					<TrackLine>
						<End x="220.3232" y="94.9149"/>
					</TrackLine>
					<TrackArc>
						<Center x="220.9" y="94.9"/>
						<End x="220.3271" y="94.8311"/>
					</TrackArc>
					<TrackLine>
						<End x="220.3911" y="94.2992"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="219.15" y="94.15"/>
						<End x="220.335" y="93.7521"/>
					</TrackArcCW>
					<TrackLine>
						<End x="219.103" y="90.0837"/>
					</TrackLine>
					<TrackArc>
						<Center x="219.65" y="89.9"/>
						<End x="219.0771" y="89.8311"/>
					</TrackArc>
					<TrackLine>
						<End x="219.1411" y="89.2992"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="217.9" y="89.15"/>
						<End x="219.1411" y="89.0008"/>
					</TrackArcCW>
					<TrackLine>
						<End x="219.0771" y="88.4689"/>
					</TrackLine>
					<TrackArc>
						<Center x="219.65" y="88.4"/>
						<End x="219.073" y="88.4"/>
					</TrackArc>
					<TrackLine>
						<End x="219.073" y="86.15"/>
					</TrackLine>
					<TrackLine>
						<End x="219.073" y="86"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="DB"/>
				<Subwire width="0.3">
					<Start x="198.0068" y="58.9494"/>
					<TrackLine>
						<End x="209.5329" y="70.0503"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.4" y="69.15"/>
						<End x="210.4" y="70.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="210.4" y="71.65"/>
						<End x="211.2839" y="70.7661"/>
					</TrackArc>
					<TrackLine>
						<End x="217.5339" y="77.0161"/>
					</TrackLine>
					<TrackArc>
						<Center x="216.65" y="77.9"/>
						<End x="217.9" y="77.9"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="219.15" y="77.9"/>
						<End x="217.9059" y="78.021"/>
					</TrackArcCW>
					<TrackLine>
						<End x="218.5493" y="84.6355"/>
					</TrackLine>
					<TrackArc>
						<Center x="218.4" y="84.65"/>
						<End x="218.55" y="84.65"/>
					</TrackArc>
					<TrackLine>
						<End x="218.55" y="84.8"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR20"/>
				<Subwire width="0.3">
					<Start x="176.6287" y="65.3455"/>
					<TrackLine>
						<End x="177.4959" y="65.2574"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.3907" y="64.2227"/>
						<End x="177.8662" y="65.1476"/>
					</TrackArcCW>
					<TrackLine>
						<End x="178.3168" y="64.9159"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.7637" y="65.7851"/>
						<End x="178.8752" y="64.8142"/>
					</TrackArc>
					<TrackLine>
						<End x="179.2809" y="64.8608"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="181.9946" y="64.6415"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.7892" y="64.4168"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.4011" y="55.9731"/>
						<End x="184.1021" y="63.9293"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.1089" y="63.9262"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.7859" y="67.5313"/>
						<End x="185.8478" y="63.5557"/>
					</TrackArc>
					<TrackLine>
						<End x="187.1917" y="63.5766"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.2162" y="62.0025"/>
						<End x="187.219" y="63.5768"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.5248" y="63.5745"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.5311" y="67.1887"/>
						<End x="189.2369" y="63.6441"/>
					</TrackArc>
					<TrackLine>
						<End x="192.1455" y="64.2233"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7826" y="66.0455"/>
						<End x="193.1918" y="64.8346"/>
					</TrackArc>
					<TrackLine>
						<End x="203.2427" y="76.5314"/>
					</TrackLine>
					<TrackArc>
						<Center x="201.65" y="77.9"/>
						<End x="203.414" y="76.7606"/>
					</TrackArc>
					<TrackLine>
						<End x="204.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="195.9636" y="52.4282"/>
					<TrackLine>
						<End x="197.7687" y="52.6618"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.19" y="57.134"/>
						<End x="199.4459" y="53.2293"/>
					</TrackArc>
					<TrackLine>
						<End x="200.8447" y="54.0375"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="201.5603" y="54.5275"/>
					</TrackArc>
					<TrackLine>
						<End x="205.4292" y="57.6366"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="55.9997"/>
						<End x="206.4485" y="58.0787"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.1467" y="58.1782"/>
					</TrackLine>
					<TrackArc>
						<Center x="206.7447" y="60.9997"/>
						<End x="207.5894" y="58.2778"/>
					</TrackArc>
					<TrackLine>
						<End x="210.4" y="59.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="219.15" y="97.9"/>
					<TrackLine>
						<End x="217.9715" y="94.5667"/>
					</TrackLine>
					<TrackArc>
						<Center x="219.15" y="94.15"/>
						<End x="217.9" y="94.15"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="216.65" y="94.15"/>
						<End x="217.8575" y="93.8269"/>
					</TrackArcCW>
					<TrackLine>
						<End x="216.6925" y="89.4731"/>
					</TrackLine>
					<TrackArc>
						<Center x="217.9" y="89.15"/>
						<End x="216.65" y="89.15"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="215.4" y="89.15"/>
						<End x="216.5686" y="88.7062"/>
					</TrackArcCW>
					<TrackLine>
						<End x="215.4814" y="85.8438"/>
					</TrackLine>
					<TrackArc>
						<Center x="216.65" y="85.4"/>
						<End x="215.4175" y="85.1917"/>
					</TrackArc>
					<TrackLine>
						<End x="216.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="210.4" y="59.15"/>
					<TrackLine>
						<End x="217.3222" y="62.7584"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="217.9" y="61.65"/>
						<End x="217.9" y="62.9"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="217.9" y="64.15"/>
						<End x="218.6949" y="63.1853"/>
					</TrackArc>
					<TrackLine>
						<End x="222.9" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="191.7473" y="43.0948"/>
					<TrackLine>
						<End x="192.7878" y="42.5496"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.6502" y="44.1953"/>
						<End x="193.3388" y="42.3636"/>
					</TrackArc>
					<TrackLine>
						<End x="203.3924" y="40.6544"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="202.662" y="36.358"/>
						<End x="204.3997" y="40.3545"/>
					</TrackArcCW>
					<TrackLine>
						<End x="204.4108" y="40.3498"/>
					</TrackLine>
					<TrackArc>
						<Center x="204.65" y="40.9"/>
						<End x="204.65" y="40.3"/>
					</TrackArc>
					<TrackLine>
						<End x="207.9" y="40.3"/>
					</TrackLine>
					<TrackArc>
						<Center x="207.9" y="41.65"/>
						<End x="208.629" y="40.5138"/>
					</TrackArc>
					<TrackLine>
						<End x="210.4" y="41.65"/>
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
				<NetRef name="BAD7"/>
				<Subwire width="0.3">
					<Start x="201.65" y="105.4"/>
					<TrackLine>
						<End x="201.65" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="179.3546" y="36.358"/>
					<TrackLine>
						<End x="177.0054" y="38.2017"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="199.1873" y="119.0164"/>
							<Dot x="199.3782" y="119.1777"/>
							<Dot x="199.0262" y="119.5944"/>
							<Dot x="198.9404" y="119.0557"/>
						</Teardrop>
					</Teardrops>
					<Start x="199.1873" y="119.0164"/>
					<TrackLine>
						<End x="198.8967" y="120.0589"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.12" y="120.4"/>
						<End x="199.0201" y="121.035"/>
					</TrackArcCW>
					<TrackLine>
						<End x="200.12" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="200.4" y="50.4"/>
					<TrackArc>
						<Center x="200.4" y="45.4"/>
						<End x="200.3087" y="50.3992"/>
					</TrackArc>
					<TrackLine>
						<End x="196.0021" y="50.3206"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.9636" y="52.4282"/>
						<End x="195.7721" y="50.3289"/>
					</TrackArcCW>
					<TrackLine>
						<End x="194.2225" y="50.4703"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.6502" y="44.1953"/>
						<End x="193.9212" y="50.4905"/>
					</TrackArc>
					<TrackLine>
						<End x="193.0192" y="50.5293"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.075" y="51.8245"/>
						<End x="192.2969" y="50.7876"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.8866" y="51.8459"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="191.65" y="105.4"/>
					<TrackLine>
						<End x="191.3" y="105.75"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3" y="106.15"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3" y="110.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.9" y="110.4"/>
						<End x="191.3841" y="110.912"/>
					</TrackArcCW>
					<TrackLine>
						<End x="192.9" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="235.25" y="32.6"/>
					<TrackLine>
						<End x="234.65" y="35"/>
					</TrackLine>
					<TrackLine>
						<End x="234.65" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="234.25" y="35.4"/>
						<End x="234.5833" y="35.6211"/>
					</TrackArc>
					<TrackLine>
						<End x="234.4183" y="35.8699"/>
					</TrackLine>
					<TrackArc>
						<Center x="233.71" y="35.4"/>
						<End x="234.2718" y="36.0379"/>
					</TrackArc>
					<TrackLine>
						<End x="227.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="206.7447" y="55.9997"/>
					<TrackLine>
						<End x="210.4" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="199.15" y="105.4"/>
					<TrackLine>
						<End x="197.7029" y="108.4673"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="199.15" y="109.15"/>
						<End x="197.6338" y="108.6391"/>
					</TrackArcCW>
					<TrackLine>
						<End x="195.5342" y="114.8699"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="220.4" y="89.15"/>
					<TrackLine>
						<End x="220.75" y="88.8"/>
					</TrackLine>
					<TrackLine>
						<End x="221.15" y="88.8"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="221.15" y="88.4"/>
						<End x="221.2031" y="88.7965"/>
					</TrackArcCW>
					<TrackLine>
						<End x="227.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="195.5342" y="114.8699"/>
					<TrackLine>
						<End x="192.9" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="200.4" y="50.4"/>
					<TrackLine>
						<End x="201.0508" y="51.5698"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.4" y="49.15"/>
						<End x="202.6592" y="53.3044"/>
					</TrackArcCW>
					<TrackLine>
						<End x="206.7447" y="55.9997"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="170.4" y="95.4"/>
					<TrackLine>
						<End x="161.69" y="83.06"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="199.1873" y="119.0164"/>
					<TrackLine>
						<End x="195.5342" y="114.8699"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="217.9" y="56.65"/>
					<TrackLine>
						<End x="210.4" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="186.65" y="115.4"/>
					<TrackLine>
						<End x="187" y="116"/>
					</TrackLine>
					<TrackLine>
						<End x="187" y="116.15"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5895" y="119.9049"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.42" y="120.4"/>
						<End x="188.69" y="120.4"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="189.96" y="120.4"/>
						<End x="188.8601" y="121.035"/>
					</TrackArcCW>
					<TrackLine>
						<End x="189.96" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="176.2569" y="59.1972"/>
					<TrackLine>
						<End x="176.1155" y="56.4551"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="174.7593" y="56.525"/>
						<End x="176.0476" y="56.0957"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.9" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="172.9" y="46.65"/>
					<TrackLine>
						<End x="162.419" y="38.1242"/>
					</TrackLine>
					<TrackArc>
						<Center x="163.7492" y="36.4889"/>
						<End x="162.3625" y="38.0766"/>
					</TrackArc>
					<TrackLine>
						<End x="160.0309" y="36.0402"/>
					</TrackLine>
					<TrackArc>
						<Center x="160.59" y="35.4"/>
						<End x="159.8817" y="35.8699"/>
					</TrackArc>
					<TrackLine>
						<End x="159.7167" y="35.6211"/>
					</TrackLine>
					<TrackArc>
						<Center x="160.05" y="35.4"/>
						<End x="159.65" y="35.4"/>
					</TrackArc>
					<TrackLine>
						<End x="159.65" y="35"/>
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
					<Start x="222.9" y="64.15"/>
					<TrackLine>
						<End x="219.258" y="58.304"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="217.9" y="59.15"/>
						<End x="219.1294" y="58.126"/>
					</TrackArcCW>
					<TrackLine>
						<End x="217.9" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="115.4"/>
					<TrackLine>
						<End x="221.3" y="115.75"/>
					</TrackLine>
					<TrackLine>
						<End x="220.9" y="115.75"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="220.9" y="116.15"/>
						<End x="220.5349" y="115.9866"/>
					</TrackArcCW>
					<TrackLine>
						<End x="220.5225" y="116.0144"/>
					</TrackLine>
					<TrackArc>
						<Center x="219.15" y="115.4"/>
						<End x="219.2718" y="116.8988"/>
					</TrackArc>
					<TrackLine>
						<End x="205.0097" y="118.0577"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.2" y="120.4"/>
						<End x="204.8531" y="118.0758"/>
					</TrackArcCW>
					<TrackLine>
						<End x="199.8838" y="118.8175"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.12" y="120.4"/>
						<End x="199.639" y="118.874"/>
					</TrackArcCW>
					<TrackLine>
						<End x="199.1873" y="119.0164"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="212.39" y="32.6"/>
					<TrackLine>
						<End x="211.79" y="35"/>
					</TrackLine>
					<TrackLine>
						<End x="211.79" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="211.39" y="35.4"/>
						<End x="211.7233" y="35.6211"/>
					</TrackArc>
					<TrackLine>
						<End x="211.5583" y="35.8699"/>
					</TrackLine>
					<TrackArc>
						<Center x="210.85" y="35.4"/>
						<End x="210.9845" y="36.2393"/>
					</TrackArc>
					<TrackLine>
						<End x="204.0805" y="37.3453"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="204.65" y="40.9"/>
						<End x="203.2145" y="37.5986"/>
					</TrackArcCW>
					<TrackLine>
						<End x="203.2035" y="37.6034"/>
					</TrackLine>
					<TrackArc>
						<Center x="202.662" y="36.358"/>
						<End x="202.8641" y="37.7009"/>
					</TrackArc>
					<TrackLine>
						<End x="190.2474" y="39.5995"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.6355" y="42.1785"/>
						<End x="188.5278" y="40.6425"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.15" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="176.2569" y="59.1972"/>
					<TrackLine>
						<End x="174.8051" y="60.11"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.3907" y="64.2227"/>
						<End x="174.7369" y="60.1536"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.0495" y="61.2541"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="174.6107" y="63.648"/>
						<End x="172.2097" y="62.0977"/>
					</TrackArcCW>
					<TrackLine>
						<End x="163.0341" y="76.3079"/>
					</TrackLine>
					<TrackArc>
						<Center x="161.69" y="75.44"/>
						<End x="162.9327" y="76.4479"/>
					</TrackArc>
					<TrackLine>
						<End x="161.69" y="77.98"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="176.2569" y="59.1972"/>
					<TrackLine>
						<End x="178.1136" y="60.1188"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.9188" y="58.4967"/>
						<End x="178.8063" y="60.3042"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.9276" y="60.374"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="180.8784" y="60.2486"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.9548" y="59.5505"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="184.3173" y="58.7356"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.911" y="56.3014"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.75" y="57.1953"/>
						<End x="188.7407" y="56.4731"/>
					</TrackArc>
					<TrackLine>
						<End x="188.8382" y="56.6068"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.8243" y="55.888"/>
						<End x="191.0437" y="55.8401"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.8866" y="51.8459"/>
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
				<NetRef name="BAD1"/>
				<Subwire width="0.3">
					<Start x="216.65" y="105.4"/>
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
						<End x="210.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA18"/>
				<Subwire width="0.3">
					<Start x="209.15" y="85.4"/>
					<TrackLine>
						<End x="210.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REST"/>
				<Subwire width="0.3">
					<Start x="187.2251" y="50.9706"/>
					<TrackLine>
						<End x="189.4013" y="50.8401"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.15" y="46.65"/>
						<End x="191.2008" y="50.3125"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.9831" y="49.8745"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.075" y="51.8245"/>
						<End x="192.8697" y="49.5991"/>
					</TrackArc>
					<TrackLine>
						<End x="194.1379" y="49.4821"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.6502" y="44.1953"/>
						<End x="194.1607" y="49.4799"/>
					</TrackArcCW>
					<TrackLine>
						<End x="195.6647" y="49.3346"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.9636" y="52.4282"/>
						<End x="195.8569" y="49.322"/>
					</TrackArc>
					<TrackLine>
						<End x="200.3577" y="49.1674"/>
					</TrackLine>
					<TrackArc>
						<Center x="200.4" y="50.4"/>
						<End x="201.5607" y="49.9831"/>
					</TrackArc>
					<TrackLine>
						<End x="201.7344" y="50.4667"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.4" y="49.15"/>
						<End x="204.691" y="52.9798"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.1081" y="53.4273"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="207.9" y="49.15"/>
						<End x="207.164" y="53.4373"/>
					</TrackArcCW>
					<TrackLine>
						<End x="218.1284" y="55.3195"/>
					</TrackLine>
					<TrackArc>
						<Center x="217.9" y="56.65"/>
						<End x="218.8292" y="55.6707"/>
					</TrackArc>
					<TrackLine>
						<End x="230.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD4"/>
				<Subwire width="0.3">
					<Start x="191.7782" y="78.6833"/>
					<TrackLine>
						<End x="194.4477" y="80.7478"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="196.65" y="77.9"/>
						<End x="195.1996" y="81.1949"/>
					</TrackArcCW>
					<TrackLine>
						<End x="202.1536" y="84.2559"/>
					</TrackLine>
					<TrackArc>
						<Center x="201.65" y="85.4"/>
						<End x="202.9" y="85.4"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="204.15" y="85.4"/>
						<End x="202.9814" y="85.8438"/>
					</TrackArcCW>
					<TrackLine>
						<End x="204.0686" y="88.7062"/>
					</TrackLine>
					<TrackArc>
						<Center x="202.9" y="89.15"/>
						<End x="204.15" y="89.15"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="205.4" y="89.15"/>
						<End x="204.1925" y="89.4731"/>
					</TrackArcCW>
					<TrackLine>
						<End x="205.3575" y="93.8269"/>
					</TrackLine>
					<TrackArc>
						<Center x="204.15" y="94.15"/>
						<End x="205.4" y="94.15"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="206.65" y="94.15"/>
						<End x="206.2005" y="95.3164"/>
					</TrackArcCW>
					<TrackLine>
						<End x="209.6355" y="96.6403"/>
					</TrackLine>
					<TrackArc>
						<Center x="209.15" y="97.9"/>
						<End x="209.879" y="96.7638"/>
					</TrackArc>
					<TrackLine>
						<End x="211.65" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDIN"/>
				<Subwire width="0.3">
					<Start x="199.15" y="94.15"/>
					<TrackLine>
						<End x="197.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD3"/>
				<Subwire width="0.3">
					<Start x="191.311" y="80.0729"/>
					<TrackLine>
						<End x="195.5408" y="86.1695"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="196.65" y="85.4"/>
						<End x="195.9661" y="86.564"/>
					</TrackArcCW>
					<TrackLine>
						<End x="198.5332" y="88.0723"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.9" y="89.15"/>
						<End x="199.15" y="89.15"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="200.4" y="89.15"/>
						<End x="199.1925" y="89.4731"/>
					</TrackArcCW>
					<TrackLine>
						<End x="200.3575" y="93.8269"/>
					</TrackLine>
					<TrackArc>
						<Center x="199.15" y="94.15"/>
						<End x="200.3938" y="94.0252"/>
					</TrackArc>
					<TrackLine>
						<End x="200.4187" y="94.2736"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="201.65" y="94.15"/>
						<End x="201.65" y="95.3875"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="201.65" y="97.9"/>
						<End x="202.0646" y="95.4219"/>
					</TrackArc>
					<TrackLine>
						<End x="204.4965" y="95.8288"/>
					</TrackLine>
					<TrackArc>
						<Center x="204.15" y="97.9"/>
						<End x="204.78" y="95.8967"/>
					</TrackArc>
					<TrackLine>
						<End x="207.055" y="96.6122"/>
					</TrackLine>
					<TrackArc>
						<Center x="206.65" y="97.9"/>
						<End x="207.379" y="96.7638"/>
					</TrackArc>
					<TrackLine>
						<End x="209.15" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="OSC"/>
				<Subwire width="0.3">
					<Start x="161.59" y="32.6"/>
					<TrackLine>
						<End x="162.44" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="162.44" y="35.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="162.59" y="35.4"/>
						<End x="162.4422" y="35.4254"/>
					</TrackArcCW>
					<TrackLine>
						<End x="162.6572" y="36.6766"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="163.7492" y="36.4889"/>
						<End x="163.0726" y="37.3663"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.7244" y="45.581"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.9" y="46.65"/>
						<End x="174.1915" y="46.257"/>
					</TrackArc>
					<TrackLine>
						<End x="178.0009" y="58.776"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.9188" y="58.4967"/>
						<End x="178.8831" y="59.4555"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.0225" y="59.498"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="180.5938" y="59.4162"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.6689" y="58.725"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="183.8734" y="57.9427"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.0091" y="55.6049"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.75" y="57.1953"/>
						<End x="189.3239" y="55.4395"/>
					</TrackArc>
					<TrackLine>
						<End x="189.8243" y="55.888"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR17"/>
				<Subwire width="0.3">
					<Start x="178.3117" y="67.8609"/>
					<TrackLine>
						<End x="182.1716" y="66.2393"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.9188" y="58.4967"/>
						<End x="182.5878" y="66.051"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.5937" y="65.0767"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.7859" y="67.5313"/>
						<End x="185.7667" y="64.8026"/>
					</TrackArc>
					<TrackLine>
						<End x="187.1445" y="64.7929"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.1634" y="67.4752"/>
						<End x="187.4808" y="64.8116"/>
					</TrackArc>
					<TrackLine>
						<End x="188.7957" y="64.9683"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.5311" y="67.1887"/>
						<End x="190.3888" y="65.9441"/>
					</TrackArc>
					<TrackLine>
						<End x="190.8675" y="66.6586"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="191.7826" y="66.0455"/>
						<End x="191.0077" y="66.8284"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.4927" y="67.3084"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.7133" y="68.0959"/>
						<End x="191.612" y="67.4478"/>
					</TrackArc>
					<TrackLine>
						<End x="199.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SIA"/>
				<Subwire width="0.3">
					<Start x="217.9" y="64.15"/>
					<TrackLine>
						<End x="210.9778" y="60.5416"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.4" y="61.65"/>
						<End x="210.4" y="60.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="210.4" y="59.15"/>
						<End x="209.8128" y="60.2535"/>
					</TrackArc>
					<TrackLine>
						<End x="207.7312" y="59.1458"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="60.9997"/>
						<End x="207.0409" y="58.9207"/>
					</TrackArcCW>
					<TrackLine>
						<End x="206.3427" y="58.8212"/>
					</TrackLine>
					<TrackArc>
						<Center x="206.7447" y="55.9997"/>
						<End x="204.9314" y="58.1985"/>
					</TrackArc>
					<TrackLine>
						<End x="201.1784" y="55.1035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="198.0068" y="58.9494"/>
						<End x="200.3751" y="54.5629"/>
					</TrackArcCW>
					<TrackLine>
						<End x="198.9837" y="53.8117"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="197.19" y="57.134"/>
						<End x="195.3659" y="53.8283"/>
					</TrackArcCW>
					<TrackLine>
						<End x="194.3492" y="54.3893"/>
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
				<NetRef name="BAD3"/>
				<Subwire width="0.3">
					<Start x="211.65" y="105.4"/>
					<TrackLine>
						<End x="211.65" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="177.26" y="120.4"/>
					<TrackLine>
						<End x="177.8896" y="115.5613"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="176.65" y="115.4"/>
						<End x="177.9" y="115.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="177.9" y="110.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="176.65" y="110.4"/>
						<End x="177.3637" y="109.3738"/>
					</TrackArcCW>
					<TrackLine>
						<End x="171.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="210.4" y="71.65"/>
					<TrackLine>
						<End x="211.5989" y="73.0019"/>
					</TrackLine>
					<TrackArc>
						<Center x="211.15" y="73.4"/>
						<End x="211.6056" y="73.0096"/>
					</TrackArc>
					<TrackLine>
						<End x="215.0992" y="77.0867"/>
					</TrackLine>
					<TrackArc>
						<Center x="214.15" y="77.9"/>
						<End x="214.575" y="79.0755"/>
					</TrackArc>
					<TrackLine>
						<End x="212.364" y="79.8749"/>
					</TrackLine>
					<TrackArc>
						<Center x="211.65" y="77.9"/>
						<End x="211.965" y="79.9762"/>
					</TrackArc>
					<TrackLine>
						<End x="207.0775" y="80.7178"/>
					</TrackLine>
					<TrackArc>
						<Center x="206.65" y="77.9"/>
						<End x="206.2225" y="80.7178"/>
					</TrackArc>
					<TrackLine>
						<End x="196.4475" y="79.2347"/>
					</TrackLine>
					<TrackArc>
						<Center x="196.65" y="77.9"/>
						<End x="195.6002" y="78.7488"/>
					</TrackArc>
					<TrackLine>
						<End x="193.2619" y="75.8568"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.4003" y="76.5534"/>
						<End x="192.8387" y="75.5358"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.4923" y="74.9557"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="191.0539" y="75.9733"/>
						<End x="191.1184" y="74.8672"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.5698" y="74.369"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.5053" y="75.4751"/>
						<End x="181.7531" y="74.6615"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.677" y="75.6564"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.4292" y="76.47"/>
						<End x="180.6056" y="75.7289"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.6253" y="76.8183"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.4489" y="77.5594"/>
						<End x="179.3411" y="77.5389"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.1502" y="87.8769"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.4" y="87.9"/>
						<End x="179.15" y="87.9"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="177.9" y="87.9"/>
						<End x="178.707" y="88.8546"/>
					</TrackArc>
					<TrackLine>
						<End x="172.093" y="94.4454"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.9" y="95.4"/>
						<End x="171.65" y="95.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="170.4" y="95.4"/>
						<End x="171.6103" y="95.7125"/>
					</TrackArc>
					<TrackLine>
						<End x="170.4" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BIAKO"/>
				<Subwire width="0.3">
					<Start x="174.72" y="122.94"/>
					<TrackLine>
						<End x="175.8199" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="174.72" y="120.4"/>
						<End x="175.99" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="177.26" y="120.4"/>
						<End x="176.0013" y="120.231"/>
					</TrackArc>
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
						<End x="176.65" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA20"/>
				<Subwire width="0.3">
					<Start x="204.15" y="85.4"/>
					<TrackLine>
						<End x="205.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA20"/>
				<Subwire width="0.3">
					<Start x="206.65" y="94.15"/>
					<TrackLine>
						<End x="205.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="DCLO"/>
				<Subwire width="0.3">
					<Start x="181.65" y="115.4"/>
					<TrackLine>
						<End x="181.65" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BWTBT"/>
				<Subwire width="0.3">
					<Start x="219.15" y="94.15"/>
					<TrackLine>
						<End x="217.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BWTBT"/>
				<Subwire width="0.3">
					<Start x="216.65" y="85.4"/>
					<TrackLine>
						<End x="217.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="184.45" y="32.6"/>
					<TrackLine>
						<End x="183.6" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="183.45" y="35.4"/>
						<End x="183.5982" y="35.4231"/>
					</TrackArc>
					<TrackLine>
						<End x="180.4011" y="55.9731"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD2"/>
				<Subwire width="0.3">
					<Start x="214.15" y="105.4"/>
					<TrackLine>
						<End x="214.15" y="109.15"/>
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
				<NetRef name="BAD6"/>
				<Subwire width="0.3">
					<Start x="204.15" y="105.4"/>
					<TrackLine>
						<End x="204.15" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BIRQ"/>
				<Subwire width="0.3">
					<Start x="169.15" y="105.4"/>
					<TrackLine>
						<End x="169.7591" y="101.9627"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BIRQ"/>
				<Subwire width="0.3">
					<Start x="174.72" y="120.4"/>
					<TrackLine>
						<End x="172.9821" y="115.8456"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.15" y="115.4"/>
						<End x="172.9" y="115.4"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="171.65" y="115.4"/>
						<End x="172.7325" y="114.775"/>
					</TrackArcCW>
					<TrackLine>
						<End x="170.5675" y="111.025"/>
					</TrackLine>
					<TrackArc>
						<Center x="171.65" y="110.4"/>
						<End x="170.4" y="110.4"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="169.15" y="110.4"/>
						<End x="170.3603" y="110.0875"/>
					</TrackArcCW>
					<TrackLine>
						<End x="169.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BIRQ"/>
				<Subwire width="0.3">
					<Start x="169.7591" y="101.9627"/>
					<TrackLine>
						<End x="167.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BIRQ"/>
				<Subwire width="0.3">
					<Start x="222.9" y="74.15"/>
					<TrackLine>
						<End x="229.5691" y="80.0839"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="230.4" y="79.15"/>
						<End x="230.4" y="80.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="230.4" y="81.65"/>
						<End x="231.6411" y="81.7989"/>
					</TrackArc>
					<TrackLine>
						<End x="229.2404" y="101.8108"/>
					</TrackLine>
					<TrackArc>
						<Center x="227.9" y="101.65"/>
						<End x="228.6398" y="102.7792"/>
					</TrackArc>
					<TrackLine>
						<End x="222.7288" y="106.6519"/>
					</TrackLine>
					<TrackArc>
						<Center x="222.4" y="106.15"/>
						<End x="222.4" y="106.75"/>
					</TrackArc>
					<TrackLine>
						<End x="221.05" y="106.75"/>
					</TrackLine>
					<TrackArc>
						<Center x="221.05" y="106.15"/>
						<End x="220.958" y="106.7429"/>
					</TrackArc>
					<TrackLine>
						<End x="220.8115" y="106.7202"/>
					</TrackLine>
					<TrackArc>
						<Center x="220.9" y="106.15"/>
						<End x="220.3271" y="106.0811"/>
					</TrackArc>
					<TrackLine>
						<End x="220.3911" y="105.5492"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="219.15" y="105.4"/>
						<End x="219.4432" y="104.1849"/>
					</TrackArcCW>
					<TrackLine>
						<End x="198.8334" y="99.2123"/>
					</TrackLine>
					<TrackArc>
						<Center x="199.15" y="97.9"/>
						<End x="198.34" y="98.98"/>
					</TrackArc>
					<TrackLine>
						<End x="196.54" y="97.63"/>
					</TrackLine>
					<TrackArc>
						<Center x="199.15" y="94.15"/>
						<End x="195.4417" y="96.424"/>
					</TrackArc>
					<TrackLine>
						<End x="194.1615" y="94.3363"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.65" y="94.65"/>
						<End x="193.65" y="94.05"/>
					</TrackArcCW>
					<TrackLine>
						<End x="177.9" y="94.05"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.9" y="95.4"/>
						<End x="177.846" y="94.0511"/>
					</TrackArcCW>
					<TrackLine>
						<End x="175.35" y="94.151"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="175.4" y="95.4"/>
						<End x="174.15" y="95.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="172.9" y="95.4"/>
						<End x="173.9825" y="96.025"/>
					</TrackArc>
					<TrackLine>
						<End x="171.8175" y="99.775"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.9" y="100.4"/>
						<End x="171.65" y="100.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="170.4" y="100.4"/>
						<End x="170.8268" y="101.5749"/>
					</TrackArc>
					<TrackLine>
						<End x="169.7591" y="101.9627"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD2"/>
				<Subwire width="0.3">
					<Start x="182.5053" y="75.4751"/>
					<TrackLine>
						<End x="191.3943" y="87.1425"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.4" y="87.9"/>
						<End x="191.65" y="87.9"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="192.9" y="87.9"/>
						<End x="191.9929" y="88.76"/>
					</TrackArcCW>
					<TrackLine>
						<End x="195.7182" y="92.6891"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.65" y="94.65"/>
						<End x="195.9448" y="92.9599"/>
					</TrackArc>
					<TrackLine>
						<End x="197.6403" y="95.2619"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="199.15" y="94.15"/>
						<End x="199.15" y="96.025"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="199.15" y="97.9"/>
						<End x="199.8057" y="96.1434"/>
					</TrackArc>
					<TrackLine>
						<End x="200.7713" y="96.5038"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="201.65" y="94.15"/>
						<End x="201.65" y="96.6625"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="201.65" y="97.9"/>
						<End x="202.2626" y="96.8247"/>
					</TrackArc>
					<TrackLine>
						<End x="204.15" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA21"/>
				<Subwire width="0.3">
					<Start x="204.15" y="94.15"/>
					<TrackLine>
						<End x="202.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA21"/>
				<Subwire width="0.3">
					<Start x="201.65" y="85.4"/>
					<TrackLine>
						<End x="202.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-IOW"/>
				<Subwire width="0.3">
					<Start x="204.77" y="32.6"/>
					<TrackLine>
						<End x="203.92" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="203.92" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="203.77" y="35.4"/>
						<End x="203.895" y="35.4829"/>
					</TrackArc>
					<TrackLine>
						<End x="203.73" y="35.7317"/>
					</TrackLine>
					<TrackArc>
						<Center x="203.23" y="35.4"/>
						<End x="203.5" y="35.9358"/>
					</TrackArc>
					<TrackLine>
						<End x="202.662" y="36.358"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="163.7492" y="36.4889"/>
					<TrackLine>
						<End x="167.5711" y="38.4549"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.6497" y="36.358"/>
						<End x="167.6467" y="38.492"/>
					</TrackArcCW>
					<TrackLine>
						<End x="178.183" y="43.4441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD14"/>
				<Subwire width="0.3">
					<Start x="175.4" y="100.4"/>
					<TrackLine>
						<End x="176.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD14"/>
				<Subwire width="0.3">
					<Start x="182.34" y="120.4"/>
					<TrackLine>
						<End x="182.892" y="115.5411"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.65" y="115.4"/>
						<End x="182.9" y="115.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.9" y="110.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.65" y="110.4"/>
						<End x="182.3637" y="109.3738"/>
					</TrackArcCW>
					<TrackLine>
						<End x="176.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD14"/>
				<Subwire width="0.3">
					<Start x="175.4" y="95.4"/>
					<TrackLine>
						<End x="175.4" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD10"/>
				<Subwire width="0.3">
					<Start x="192.5" y="120.4"/>
					<TrackLine>
						<End x="188.6775" y="109.2135"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.4" y="109.65"/>
						<End x="188.5893" y="109.0113"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD10"/>
				<Subwire width="0.3">
					<Start x="185.4" y="95.4"/>
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
						<End x="186.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SEL"/>
				<Subwire width="0.3">
					<Start x="191.7826" y="66.0455"/>
					<TrackLine>
						<End x="201.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="177.9" y="100.4"/>
					<TrackLine>
						<End x="179.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="184.88" y="120.4"/>
					<TrackLine>
						<End x="185.3261" y="116.0906"/>
					</TrackLine>
					<TrackLine>
						<End x="185.3271" y="116.0811"/>
					</TrackLine>
					<TrackLine>
						<End x="185.3911" y="115.5492"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="184.15" y="115.4"/>
						<End x="185.3911" y="115.2508"/>
					</TrackArcCW>
					<TrackLine>
						<End x="185.3271" y="114.7189"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.9" y="114.65"/>
						<End x="185.323" y="114.65"/>
					</TrackArc>
					<TrackLine>
						<End x="185.323" y="111.15"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.9" y="111.15"/>
						<End x="185.3271" y="111.0811"/>
					</TrackArc>
					<TrackLine>
						<End x="185.3911" y="110.5492"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="184.15" y="110.4"/>
						<End x="184.8637" y="109.3738"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="177.9" y="95.4"/>
					<TrackLine>
						<End x="177.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD12"/>
				<Subwire width="0.3">
					<Start x="180.4" y="100.4"/>
					<TrackLine>
						<End x="181.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD12"/>
				<Subwire width="0.3">
					<Start x="180.4" y="95.4"/>
					<TrackLine>
						<End x="180.4" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="189.96" y="120.4"/>
					<TrackLine>
						<End x="187.9904" y="109.5429"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.4" y="109.65"/>
						<End x="187.8327" y="109.2344"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="182.9" y="95.4"/>
					<TrackLine>
						<End x="182.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="182.9" y="100.4"/>
					<TrackLine>
						<End x="184.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD9"/>
				<Subwire width="0.3">
					<Start x="189.15" y="105.4"/>
					<TrackLine>
						<End x="187.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD9"/>
				<Subwire width="0.3">
					<Start x="187.9" y="95.4"/>
					<TrackLine>
						<End x="187.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD15"/>
				<Subwire width="0.3">
					<Start x="179.8" y="120.4"/>
					<TrackLine>
						<End x="180.3908" y="115.5512"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.15" y="115.4"/>
						<End x="180.4" y="115.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.4" y="110.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="179.15" y="110.4"/>
						<End x="179.8637" y="109.3738"/>
					</TrackArcCW>
					<TrackLine>
						<End x="174.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD15"/>
				<Subwire width="0.3">
					<Start x="172.9" y="100.4"/>
					<TrackLine>
						<End x="174.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="DIN"/>
				<Subwire width="0.3">
					<Start x="217.9" y="61.65"/>
					<TrackLine>
						<End x="210.9778" y="58.0416"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.4" y="59.15"/>
						<End x="210.4" y="57.9"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="210.4" y="56.65"/>
						<End x="210.212" y="57.8858"/>
					</TrackArc>
					<TrackLine>
						<End x="207.2862" y="57.4407"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="60.9997"/>
						<End x="207.2525" y="57.4357"/>
					</TrackArcCW>
					<TrackLine>
						<End x="206.5543" y="57.3362"/>
					</TrackLine>
					<TrackArc>
						<Center x="206.7447" y="55.9997"/>
						<End x="205.9121" y="57.0624"/>
					</TrackArc>
					<TrackLine>
						<End x="201.9295" y="53.9423"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="198.0068" y="58.9494"/>
						<End x="201.3309" y="53.5264"/>
					</TrackArcCW>
					<TrackLine>
						<End x="199.9283" y="52.6667"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="197.19" y="57.134"/>
						<End x="198.7412" y="52.1291"/>
					</TrackArcCW>
					<TrackLine>
						<End x="196.2916" y="51.3699"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.9636" y="52.4282"/>
						<End x="195.7665" y="51.3379"/>
					</TrackArcCW>
					<TrackLine>
						<End x="193.075" y="51.8245"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="177.3907" y="64.2227"/>
					<TrackLine>
						<End x="178.7232" y="64.1889"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.7637" y="65.7851"/>
						<End x="178.913" y="64.1954"/>
					</TrackArc>
					<TrackLine>
						<End x="179.4848" y="64.2491"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="181.7781" y="64.0483"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.562" y="63.8328"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.4011" y="55.9731"/>
						<End x="183.839" y="63.3639"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.8459" y="63.3607"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.7859" y="67.5313"/>
						<End x="185.9115" y="62.9333"/>
					</TrackArc>
					<TrackLine>
						<End x="187.1898" y="62.9682"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.2162" y="62.0025"/>
						<End x="187.2878" y="62.9659"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.2121" y="62.8972"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.5311" y="67.1887"/>
						<End x="189.2852" y="62.952"/>
					</TrackArc>
					<TrackLine>
						<End x="192.2396" y="63.4779"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7826" y="66.0455"/>
						<End x="193.7308" y="64.3117"/>
					</TrackArc>
					<TrackLine>
						<End x="205.0838" y="77.069"/>
					</TrackLine>
					<TrackArc>
						<Center x="204.15" y="77.9"/>
						<End x="205.4" y="77.9"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="206.65" y="77.9"/>
						<End x="207.275" y="78.9825"/>
					</TrackArcCW>
					<TrackLine>
						<End x="209.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD5"/>
				<Subwire width="0.3">
					<Start x="206.65" y="105.4"/>
					<TrackLine>
						<End x="206.65" y="109.15"/>
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
					<Start x="210.4" y="64.15"/>
					<TrackLine>
						<End x="207.8769" y="60.2645"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="60.9997"/>
						<End x="206.9351" y="59.6632"/>
					</TrackArcCW>
					<TrackLine>
						<End x="206.2369" y="59.5637"/>
					</TrackLine>
					<TrackArc>
						<Center x="206.7447" y="55.9997"/>
						<End x="204.4186" y="58.7473"/>
					</TrackArc>
					<TrackLine>
						<End x="200.7834" y="55.6697"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="198.0068" y="58.9494"/>
						<End x="199.5849" y="54.9525"/>
					</TrackArcCW>
					<TrackLine>
						<End x="198.2581" y="54.4286"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="197.19" y="57.134"/>
						<End x="195.1061" y="55.1049"/>
					</TrackArcCW>
					<TrackLine>
						<End x="195.0954" y="55.1159"/>
					</TrackLine>
					<TrackArc>
						<Center x="194.3492" y="54.3893"/>
						<End x="194.3775" y="55.4304"/>
					</TrackArc>
					<TrackLine>
						<End x="193.0952" y="55.4653"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR16"/>
				<Subwire width="0.3">
					<Start x="178.7637" y="65.7851"/>
					<TrackArcCW>
						<Center x="178.9188" y="58.4967"/>
						<End x="179.6717" y="65.7478"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.8864" y="65.6217"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="183.2289" y="64.9989"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.2011" y="64.5692"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.4011" y="55.9731"/>
						<End x="184.3651" y="64.4948"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.3719" y="64.4916"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.7859" y="67.5313"/>
						<End x="185.8" y="64.1788"/>
					</TrackArc>
					<TrackLine>
						<End x="187.1773" y="64.1846"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.1634" y="67.4752"/>
						<End x="187.3544" y="64.1901"/>
					</TrackArc>
					<TrackLine>
						<End x="188.7009" y="64.2684"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.5311" y="67.1887"/>
						<End x="189.1616" y="64.3323"/>
					</TrackArc>
					<TrackLine>
						<End x="192.0214" y="64.9635"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7826" y="66.0455"/>
						<End x="192.6276" y="65.3288"/>
					</TrackArc>
					<TrackLine>
						<End x="202.6033" y="77.0915"/>
					</TrackLine>
					<TrackArc>
						<Center x="201.65" y="77.9"/>
						<End x="202.9" y="77.9"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="204.15" y="77.9"/>
						<End x="203.725" y="79.0755"/>
					</TrackArcCW>
					<TrackLine>
						<End x="205.936" y="79.8749"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.65" y="77.9"/>
						<End x="206.965" y="79.9762"/>
					</TrackArcCW>
					<TrackLine>
						<End x="211.8525" y="79.2347"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="211.65" y="77.9"/>
						<End x="212.379" y="79.0362"/>
					</TrackArcCW>
					<TrackLine>
						<End x="214.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD6"/>
				<Subwire width="0.3">
					<Start x="190.7605" y="81.4371"/>
					<TrackLine>
						<End x="194.072" y="87.23"/>
					</TrackLine>
					<TrackArc>
						<Center x="192.9" y="87.9"/>
						<End x="194.0922" y="87.2667"/>
					</TrackArc>
					<TrackLine>
						<End x="198.0571" y="94.7305"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="199.15" y="94.15"/>
						<End x="199.15" y="95.3875"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="199.15" y="97.9"/>
						<End x="200.0287" y="95.5462"/>
					</TrackArc>
					<TrackLine>
						<End x="200.9943" y="95.9066"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="201.65" y="94.15"/>
						<End x="201.65" y="96.025"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="201.65" y="97.9"/>
						<End x="202.0438" y="96.0668"/>
					</TrackArc>
					<TrackLine>
						<End x="204.4335" y="96.5801"/>
					</TrackLine>
					<TrackArc>
						<Center x="204.15" y="97.9"/>
						<End x="204.879" y="96.7638"/>
					</TrackArc>
					<TrackLine>
						<End x="206.65" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA17"/>
				<Subwire width="0.3">
					<Start x="214.15" y="94.15"/>
					<TrackLine>
						<End x="212.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA17"/>
				<Subwire width="0.3">
					<Start x="211.65" y="85.4"/>
					<TrackLine>
						<End x="212.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD15"/>
				<Subwire width="0.3">
					<Start x="170.4" y="87.9"/>
					<TrackLine>
						<End x="173.1481" y="64.3663"/>
					</TrackLine>
					<TrackArc>
						<Center x="175.4902" y="64.6398"/>
						<End x="173.4277" y="63.4969"/>
					</TrackArc>
					<TrackLine>
						<End x="173.6415" y="63.111"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.6107" y="63.648"/>
						<End x="174.1934" y="62.6216"/>
					</TrackArc>
					<TrackLine>
						<End x="174.6022" y="62.4554"/>
					</TrackLine>
					<TrackArc>
						<Center x="175.4902" y="64.6398"/>
						<End x="174.6305" y="62.4441"/>
					</TrackArc>
					<TrackLine>
						<End x="176.42" y="61.7435"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.3907" y="64.2227"/>
						<End x="178.0772" y="61.6502"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="178.9188" y="58.4967"/>
						<End x="178.5502" y="61.7397"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.6303" y="61.8625"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="181.3091" y="61.6958"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.1539" y="61.4241"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.4011" y="55.9731"/>
						<End x="182.329" y="61.3647"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.4389" y="60.9678"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.7859" y="67.5313"/>
						<End x="183.4887" y="60.9502"/>
					</TrackArc>
					<TrackLine>
						<End x="183.4888" y="60.9502"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="184.6406" y="60.3808"/>
					</TrackArcCW>
					<TrackLine>
						<End x="185.6919" y="59.6883"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.2162" y="62.0025"/>
						<End x="185.8641" y="59.5837"/>
					</TrackArc>
					<TrackLine>
						<End x="187.6535" y="58.5834"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IAKO"/>
				<Subwire width="0.3">
					<Start x="210.4" y="66.65"/>
					<TrackLine>
						<End x="209.2606" y="65.914"/>
					</TrackLine>
					<TrackArc>
						<Center x="210.4" y="64.15"/>
						<End x="209.1235" y="65.8175"/>
					</TrackArc>
					<TrackLine>
						<End x="202.8849" y="61.042"/>
					</TrackLine>
					<TrackArc>
						<Center x="206.7447" y="55.9997"/>
						<End x="202.4487" y="60.6759"/>
					</TrackArc>
					<TrackLine>
						<End x="199.1797" y="57.6727"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="198.0068" y="58.9494"/>
						<End x="198.1643" y="57.2229"/>
					</TrackArcCW>
					<TrackLine>
						<End x="197.19" y="57.134"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="177.9" y="87.9"/>
					<TrackLine>
						<End x="176.838" y="75.044"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.9422" y="74.9528"/>
						<End x="177.3621" y="74.0088"/>
					</TrackArc>
					<TrackLine>
						<End x="186.366" y="68.4753"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="185.7859" y="67.5313"/>
						<End x="186.7025" y="68.1538"/>
					</TrackArcCW>
					<TrackLine>
						<End x="187.1634" y="67.4752"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RPLY"/>
				<Subwire width="0.3">
					<Start x="179.15" y="115.4"/>
					<TrackLine>
						<End x="179.15" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RPLY"/>
				<Subwire width="0.3">
					<Start x="177.26" y="122.94"/>
					<TrackLine>
						<End x="178.3599" y="121.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.26" y="120.4"/>
						<End x="178.53" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="179.8" y="120.4"/>
						<End x="178.54" y="120.2412"/>
					</TrackArc>
					<TrackLine>
						<End x="179.15" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.3">
					<Start x="178.9188" y="58.4967"/>
					<TrackLine>
						<End x="179.433" y="58.6864"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.3907" y="64.2227"/>
						<End x="179.6967" y="58.7909"/>
					</TrackArc>
					<TrackLine>
						<End x="179.6967" y="58.791"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="180.3923" y="58.8197"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.4661" y="58.1352"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="183.8542" y="56.8016"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.1877" y="50.5814"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.2251" y="50.9706"/>
						<End x="187.4145" y="49.8789"/>
					</TrackArc>
					<TrackLine>
						<End x="188.5553" y="50.0769"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.15" y="46.65"/>
						<End x="190.7538" y="49.7363"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.7271" y="49.2305"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.075" y="51.8245"/>
						<End x="192.7359" y="48.9209"/>
					</TrackArc>
					<TrackLine>
						<End x="195.5161" y="48.5962"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.9636" y="52.4282"/>
						<End x="195.9316" y="48.5703"/>
					</TrackArc>
					<TrackLine>
						<End x="200.3845" y="48.5334"/>
					</TrackLine>
					<TrackArc>
						<Center x="200.4" y="50.4"/>
						<End x="202.1292" y="49.6969"/>
					</TrackArc>
					<TrackLine>
						<End x="202.4024" y="50.3688"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.4" y="49.15"/>
						<End x="204.9287" y="52.3514"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.3757" y="52.7116"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="207.9" y="49.15"/>
						<End x="207.9" y="52.75"/>
					</TrackArcCW>
					<TrackLine>
						<End x="210.4" y="52.75"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.4" y="49.15"/>
						<End x="211.21" y="52.6577"/>
					</TrackArcCW>
					<TrackLine>
						<End x="220.7038" y="50.4654"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="220.4" y="49.15"/>
						<End x="221.129" y="50.2862"/>
					</TrackArcCW>
					<TrackLine>
						<End x="222.9" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RPLY_I"/>
				<Subwire width="0.3">
					<Start x="192.6075" y="58.9867"/>
					<TrackLine>
						<End x="197.3696" y="58.1131"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="197.19" y="57.134"/>
						<End x="197.5984" y="58.0418"/>
					</TrackArcCW>
					<TrackLine>
						<End x="197.5984" y="58.0416"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="198.6822" y="58.2182"/>
					</TrackArc>
					<TrackLine>
						<End x="201.9275" y="61.2155"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="55.9997"/>
						<End x="202.2041" y="61.458"/>
					</TrackArcCW>
					<TrackLine>
						<End x="209.6006" y="67.611"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.4" y="66.65"/>
						<End x="210.4" y="67.9"/>
					</TrackArcCW>
					<TrackLine>
						<End x="217.9" y="67.9"/>
					</TrackLine>
					<TrackArc>
						<Center x="217.9" y="69.15"/>
						<End x="218.2125" y="67.9397"/>
					</TrackArc>
					<TrackLine>
						<End x="222.9" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSEL"/>
				<Subwire width="0.3">
					<Start x="201.65" y="94.15"/>
					<TrackLine>
						<End x="200.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSEL"/>
				<Subwire width="0.3">
					<Start x="199.15" y="85.4"/>
					<TrackLine>
						<End x="200.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD0"/>
				<Subwire width="0.3">
					<Start x="180.4489" y="77.5594"/>
					<TrackLine>
						<End x="186.4619" y="87.2405"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.4" y="87.9"/>
						<End x="186.65" y="87.9"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="187.9" y="87.9"/>
						<End x="187.228" y="88.954"/>
					</TrackArcCW>
					<TrackLine>
						<End x="194.3758" y="93.5117"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.65" y="94.65"/>
						<End x="194.8008" y="93.9443"/>
					</TrackArc>
					<TrackLine>
						<End x="196.0811" y="96.032"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="199.15" y="94.15"/>
						<End x="198.142" y="97.606"/>
					</TrackArcCW>
					<TrackLine>
						<End x="199.15" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="94.15"/>
					<TrackLine>
						<End x="222" y="93.8"/>
					</TrackLine>
					<TrackLine>
						<End x="222.4" y="93.8"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="222.4" y="93.4"/>
						<End x="222.465" y="93.7947"/>
					</TrackArcCW>
					<TrackLine>
						<End x="227.9" y="92.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="219.15" y="77.9"/>
					<TrackLine>
						<End x="221.3774" y="82.7545"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="222.15" y="82.4"/>
						<End x="222.011" y="83.2386"/>
					</TrackArcCW>
					<TrackLine>
						<End x="228.246" y="84.2717"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="174.6107" y="63.648"/>
					<TrackArcCW>
						<Center x="175.4902" y="64.6398"/>
						<End x="174.4865" y="65.5057"/>
					</TrackArcCW>
					<TrackLine>
						<End x="177.2834" y="68.7479"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.3117" y="67.8609"/>
						<End x="178.9478" y="69.0607"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.1033" y="67.9179"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="97.9"/>
					<TrackLine>
						<End x="221.65" y="94.9"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="94.5"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="200.4" y="45.4"/>
					<TrackArc>
						<Center x="200.4" y="50.4"/>
						<End x="204.8118" y="48.0471"/>
					</TrackArc>
					<TrackLine>
						<End x="205.4" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="219.15" y="77.9"/>
					<TrackLine>
						<End x="217.9" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="101.65"/>
					<TrackLine>
						<End x="227.9" y="92.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="164.13" y="32.6"/>
					<TrackLine>
						<End x="164.73" y="35"/>
					</TrackLine>
					<TrackLine>
						<End x="164.73" y="35.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="165.13" y="35.4"/>
						<End x="164.8101" y="35.6402"/>
					</TrackArcCW>
					<TrackLine>
						<End x="164.8352" y="35.6736"/>
					</TrackLine>
					<TrackArc>
						<Center x="163.7492" y="36.4889"/>
						<End x="164.9306" y="35.8192"/>
					</TrackArc>
					<TrackLine>
						<End x="164.9305" y="35.8192"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="165.67" y="35.4"/>
						<End x="165.2819" y="36.1562"/>
					</TrackArcCW>
					<TrackLine>
						<End x="168.0297" y="37.5662"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.6497" y="36.358"/>
						<End x="168.1102" y="37.6043"/>
					</TrackArcCW>
					<TrackLine>
						<End x="178.7225" y="42.1978"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.183" y="43.4441"/>
						<End x="179.359" y="44.1232"/>
					</TrackArc>
					<TrackLine>
						<End x="177.9" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="230.17" y="32.6"/>
					<TrackLine>
						<End x="229.57" y="35"/>
					</TrackLine>
					<TrackLine>
						<End x="229.57" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="229.17" y="35.4"/>
						<End x="229.5033" y="35.6211"/>
					</TrackArc>
					<TrackLine>
						<End x="229.3383" y="35.8699"/>
					</TrackLine>
					<TrackArc>
						<Center x="228.63" y="35.4"/>
						<End x="228.7106" y="36.2462"/>
					</TrackArc>
					<TrackLine>
						<End x="204.427" y="38.5606"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="204.65" y="40.9"/>
						<End x="203.7129" y="38.7449"/>
					</TrackArcCW>
					<TrackLine>
						<End x="203.7019" y="38.7497"/>
					</TrackLine>
					<TrackArc>
						<Center x="202.662" y="36.358"/>
						<End x="203.0501" y="38.937"/>
					</TrackArc>
					<TrackLine>
						<End x="190.4334" y="40.8356"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.6355" y="42.1785"/>
						<End x="189.278" y="42.14"/>
					</TrackArcCW>
					<TrackLine>
						<End x="189.15" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="228.246" y="84.2717"/>
					<TrackLine>
						<End x="229.3978" y="87.3373"/>
					</TrackLine>
					<TrackArc>
						<Center x="227.9" y="87.9"/>
						<End x="229.4159" y="88.412"/>
					</TrackArc>
					<TrackLine>
						<End x="227.9" y="92.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="174.6107" y="63.648"/>
					<TrackArc>
						<Center x="175.4902" y="64.6398"/>
						<End x="174.892" y="63.4568"/>
					</TrackArc>
					<TrackLine>
						<End x="176.5735" y="62.6066"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.3907" y="64.2227"/>
						<End x="177.8577" y="62.4729"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="178.9188" y="58.4967"/>
						<End x="178.3472" y="62.5722"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.4041" y="62.7204"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.0827" y="57.8818"/>
						<End x="181.6781" y="62.5"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.7581" y="61.7814"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="185.0658" y="61.1464"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.1973" y="60.4185"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.2162" y="62.0025"/>
						<End x="186.7956" y="60.1667"/>
					</TrackArc>
					<TrackLine>
						<End x="187.9554" y="59.901"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.6535" y="58.5834"/>
						<End x="188.4228" y="59.6949"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.1518" y="57.806"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.8243" y="55.888"/>
						<End x="191.383" y="57.6234"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.3829" y="57.6233"/>
					</TrackLine>
					<TrackArc>
						<Center x="192.6075" y="58.9867"/>
						<End x="192.0326" y="57.2466"/>
					</TrackArc>
					<TrackLine>
						<End x="193.5213" y="56.7547"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5306" y="56.7516"/>
					</TrackLine>
					<TrackLine>
						<End x="194.9825" y="56.2601"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="194.3492" y="54.3893"/>
						<End x="195.7697" y="55.7617"/>
					</TrackArcCW>
					<TrackLine>
						<End x="195.7695" y="55.7616"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.19" y="57.134"/>
						<End x="197.921" y="55.2991"/>
					</TrackArc>
					<TrackLine>
						<End x="199.2501" y="55.8286"/>
					</TrackLine>
					<TrackArc>
						<Center x="198.0068" y="58.9494"/>
						<End x="200.211" y="56.4144"/>
					</TrackArc>
					<TrackLine>
						<End x="203.7264" y="59.471"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="206.7447" y="55.9997"/>
						<End x="204.9419" y="60.2317"/>
					</TrackArcCW>
					<TrackLine>
						<End x="206.7447" y="60.9997"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="228.246" y="84.2717"/>
					<TrackLine>
						<End x="230.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="190.7133" y="68.0959"/>
					<TrackLine>
						<End x="190.1186" y="67.3185"/>
					</TrackLine>
					<TrackArc>
						<Center x="191.7826" y="66.0455"/>
						<End x="189.9603" y="67.0793"/>
					</TrackArc>
					<TrackLine>
						<End x="189.6593" y="66.5487"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.5311" y="67.1887"/>
						<End x="188.7638" y="65.9126"/>
					</TrackArcCW>
					<TrackLine>
						<End x="187.4907" y="65.6805"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.1634" y="67.4752"/>
						<End x="187.13" y="65.6512"/>
					</TrackArcCW>
					<TrackLine>
						<End x="185.752" y="65.6764"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="185.7859" y="67.5313"/>
						<End x="184.9156" y="65.8929"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.1033" y="67.9179"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="200.4" y="45.4"/>
					<TrackLine>
						<End x="196.0933" y="45.3214"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="195.9636" y="52.4282"/>
						<End x="194.5117" y="45.4701"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.8643" y="46.0225"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.075" y="51.8245"/>
						<End x="191.1897" y="46.2053"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.1897" y="46.2054"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.7773" y="44.9763"/>
						<End x="191.0484" y="46.244"/>
					</TrackArc>
					<TrackLine>
						<End x="189.15" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="110.4"/>
					<TrackLine>
						<End x="193.2471" y="106.2203"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.4" y="106.15"/>
						<End x="193.25" y="106.15"/>
					</TrackArcCW>
					<TrackLine>
						<End x="193.25" y="104.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="192.4" y="104.65"/>
						<End x="193.16" y="104.2693"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.5076" y="100.9708"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="191.15" y="101.15"/>
						<End x="191.15" y="100.75"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.75" y="100.75"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="196.1956" y="76.2535"/>
					<TrackLine>
						<End x="190.7133" y="68.0959"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD0"/>
				<Subwire width="0.3">
					<Start x="219.15" y="105.4"/>
					<TrackLine>
						<End x="219.15" y="109.15"/>
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
						<End x="207.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA19"/>
				<Subwire width="0.3">
					<Start x="206.65" y="85.4"/>
					<TrackLine>
						<End x="207.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD7"/>
				<Subwire width="0.3">
					<Start x="192.4003" y="76.5534"/>
					<TrackLine>
						<End x="195.1474" y="79.3671"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="196.65" y="77.9"/>
						<End x="196.105" y="79.928"/>
					</TrackArcCW>
					<TrackLine>
						<End x="211.9744" y="84.1928"/>
					</TrackLine>
					<TrackArc>
						<Center x="211.65" y="85.4"/>
						<End x="212.9" y="85.4"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="214.15" y="85.4"/>
						<End x="212.9814" y="85.8438"/>
					</TrackArcCW>
					<TrackLine>
						<End x="214.0686" y="88.7062"/>
					</TrackLine>
					<TrackArc>
						<Center x="212.9" y="89.15"/>
						<End x="214.15" y="89.15"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="215.4" y="89.15"/>
						<End x="214.1925" y="89.4731"/>
					</TrackArcCW>
					<TrackLine>
						<End x="215.3575" y="93.8269"/>
					</TrackLine>
					<TrackArc>
						<Center x="214.15" y="94.15"/>
						<End x="215.4" y="94.15"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="216.65" y="94.15"/>
						<End x="215.4715" y="94.5667"/>
					</TrackArcCW>
					<TrackLine>
						<End x="216.65" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.3">
					<Start x="179.3109" y="56.7836"/>
					<TrackLine>
						<End x="180.2303" y="56.9255"/>
					</TrackLine>
					<TrackArc>
						<Center x="180.0827" y="57.8818"/>
						<End x="180.2419" y="56.9273"/>
					</TrackArc>
					<TrackLine>
						<End x="180.2419" y="56.9276"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.4011" y="55.9731"/>
						<End x="180.3596" y="56.9398"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.5723" y="56.9919"/>
					</TrackLine>
					<TrackArc>
						<Center x="181.1033" y="67.9179"/>
						<End x="181.694" y="56.9978"/>
					</TrackArc>
					<TrackLine>
						<End x="181.7144" y="56.9989"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.7674" y="56.0187"/>
						<End x="182.699" y="56.3279"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.7499" y="50.149"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.2251" y="50.9706"/>
						<End x="187.8238" y="48.4323"/>
					</TrackArc>
					<TrackLine>
						<End x="188.6819" y="48.6346"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.15" y="46.65"/>
						<End x="189.9994" y="48.5037"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.2837" y="47.9153"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.075" y="51.8245"/>
						<End x="192.3873" y="47.5797"/>
					</TrackArc>
					<TrackLine>
						<End x="195.1067" y="47.1392"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.9636" y="52.4282"/>
						<End x="196.2099" y="47.0759"/>
					</TrackArc>
					<TrackLine>
						<End x="200.3142" y="47.2647"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.4" y="45.4"/>
						<End x="200.4" y="47.2667"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="200.4" y="50.4"/>
						<End x="203.2284" y="49.0517"/>
					</TrackArc>
					<TrackLine>
						<End x="203.6687" y="49.9753"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.4" y="49.15"/>
						<End x="205.2604" y="51.0629"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.7471" y="51.2444"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="207.9" y="49.15"/>
						<End x="207.9" y="51.25"/>
					</TrackArcCW>
					<TrackLine>
						<End x="210.4" y="51.25"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.4" y="49.15"/>
						<End x="211.03" y="51.1533"/>
					</TrackArcCW>
					<TrackLine>
						<End x="213.305" y="50.4378"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="212.9" y="49.15"/>
						<End x="213.629" y="50.2862"/>
					</TrackArcCW>
					<TrackLine>
						<End x="215.4" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-IOR"/>
				<Subwire width="0.3">
					<Start x="202.23" y="32.6"/>
					<TrackLine>
						<End x="201.38" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="201.38" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="201.23" y="35.4"/>
						<End x="201.355" y="35.4829"/>
					</TrackArc>
					<TrackLine>
						<End x="201.19" y="35.7317"/>
					</TrackLine>
					<TrackArc>
						<Center x="200.69" y="35.4"/>
						<End x="200.7859" y="35.9923"/>
					</TrackArc>
					<TrackLine>
						<End x="184.8795" y="38.5677"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="232.71" y="32.6"/>
					<TrackLine>
						<End x="231.86" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="231.86" y="35.4"/>
					</TrackLine>
					<TrackArc>
						<Center x="231.71" y="35.4"/>
						<End x="231.835" y="35.4829"/>
					</TrackArc>
					<TrackLine>
						<End x="231.67" y="35.7317"/>
					</TrackLine>
					<TrackArc>
						<Center x="231.17" y="35.4"/>
						<End x="231.4653" y="35.9223"/>
					</TrackArc>
					<TrackLine>
						<End x="229.5404" y="37.0105"/>
					</TrackLine>
					<TrackArc>
						<Center x="228.63" y="35.4"/>
						<End x="228.8055" y="37.2417"/>
					</TrackArc>
					<TrackLine>
						<End x="204.5219" y="39.5561"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="204.65" y="40.9"/>
						<End x="204.1117" y="39.662"/>
					</TrackArcCW>
					<TrackLine>
						<End x="204.1007" y="39.6668"/>
					</TrackLine>
					<TrackArc>
						<Center x="202.662" y="36.358"/>
						<End x="203.2667" y="39.915"/>
					</TrackArc>
					<TrackLine>
						<End x="193.2131" y="41.6242"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="193.6502" y="44.1953"/>
						<End x="193.0994" y="41.6461"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.6355" y="42.1785"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="#TDO"/>
				<Subwire width="0.3">
					<Start x="187.75" y="57.1953"/>
					<TrackLine>
						<End x="187.0426" y="57.6669"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="187.6535" y="58.5834"/>
						<End x="186.9592" y="57.7283"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.6667" y="59.5896"/>
					</TrackLine>
					<TrackArc>
						<Center x="181.7674" y="56.0187"/>
						<End x="183.2451" y="60.3746"/>
					</TrackArc>
					<TrackLine>
						<End x="181.1675" y="61.0794"/>
					</TrackLine>
					<TrackArc>
						<Center x="180.0827" y="57.8818"/>
						<End x="179.7881" y="61.2455"/>
					</TrackArc>
					<TrackLine>
						<End x="178.6865" y="61.149"/>
					</TrackLine>
					<TrackArc>
						<Center x="178.9188" y="58.4967"/>
						<End x="178.2323" y="61.0692"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="177.3907" y="64.2227"/>
						<End x="176.4378" y="61.101"/>
					</TrackArcCW>
					<TrackLine>
						<End x="174.5829" y="61.6672"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="175.4902" y="64.6398"/>
						<End x="174.3197" y="61.7606"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.911" y="61.9268"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="174.6107" y="63.648"/>
						<End x="173.0473" y="62.6441"/>
					</TrackArcCW>
					<TrackLine>
						<End x="162.7586" y="78.6662"/>
					</TrackLine>
					<TrackArc>
						<Center x="161.69" y="77.98"/>
						<End x="160.42" y="77.98"/>
					</TrackArc>
					<TrackLine>
						<End x="160.42" y="75.44"/>
					</TrackLine>
					<TrackArc>
						<Center x="161.69" y="75.44"/>
						<End x="160.5901" y="74.805"/>
					</TrackArc>
					<TrackLine>
						<End x="161.69" y="72.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR18"/>
				<Subwire width="0.3">
					<Start x="187.2162" y="62.0025"/>
					<TrackArc>
						<Center x="188.5311" y="67.1887"/>
						<End x="187.6702" y="61.9081"/>
					</TrackArc>
					<TrackLine>
						<End x="197.2638" y="60.344"/>
					</TrackLine>
					<TrackArc>
						<Center x="197.4421" y="61.4376"/>
						<End x="198.3292" y="60.7737"/>
					</TrackArc>
					<TrackLine>
						<End x="209.1696" y="75.2595"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="209.65" y="74.9"/>
						<End x="209.2131" y="75.3113"/>
					</TrackArcCW>
					<TrackLine>
						<End x="211.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD1"/>
				<Subwire width="0.3">
					<Start x="181.4292" y="76.47"/>
					<TrackLine>
						<End x="188.9242" y="87.1835"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.9" y="87.9"/>
						<End x="189.15" y="87.9"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="190.4" y="87.9"/>
						<End x="189.6351" y="88.8887"/>
					</TrackArcCW>
					<TrackLine>
						<End x="194.935" y="92.9891"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.65" y="94.65"/>
						<End x="195.2921" y="93.341"/>
					</TrackArc>
					<TrackLine>
						<End x="197.1853" y="95.7161"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="199.15" y="94.15"/>
						<End x="199.15" y="96.6625"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="199.15" y="97.9"/>
						<End x="199.7626" y="96.8247"/>
					</TrackArc>
					<TrackLine>
						<End x="201.65" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="168.6497" y="36.358"/>
					<TrackLine>
						<End x="176.6286" y="39.2437"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.0054" y="38.2017"/>
						<End x="176.9471" y="39.3082"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.7848" y="39.563"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.3">
					<Start x="181.7674" y="56.0187"/>
					<TrackLine>
						<End x="184.0773" y="49.8011"/>
					</TrackLine>
					<TrackArc>
						<Center x="187.2251" y="50.9706"/>
						<End x="188.1208" y="47.7343"/>
					</TrackArc>
					<TrackLine>
						<End x="188.798" y="47.9217"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="189.15" y="46.65"/>
						<End x="189.6743" y="47.8609"/>
					</TrackArcCW>
					<TrackLine>
						<End x="191.0927" y="47.2467"/>
					</TrackLine>
					<TrackArc>
						<Center x="193.075" y="51.8245"/>
						<End x="192.167" y="46.9192"/>
					</TrackArc>
					<TrackLine>
						<End x="194.8518" y="46.4222"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.9636" y="52.4282"/>
						<End x="196.422" y="46.3374"/>
					</TrackArc>
					<TrackLine>
						<End x="200.3075" y="46.6298"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="200.4" y="45.4"/>
						<End x="200.4" y="46.6333"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="200.4" y="50.4"/>
						<End x="203.7609" y="48.6992"/>
					</TrackArc>
					<TrackLine>
						<End x="204.2766" y="49.7185"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.4" y="49.15"/>
						<End x="205.3542" y="50.4082"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207.8509" y="50.4991"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="207.9" y="49.15"/>
						<End x="207.9" y="50.5"/>
					</TrackArcCW>
					<TrackLine>
						<End x="210.4" y="50.5"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="210.4" y="49.15"/>
						<End x="211.129" y="50.2862"/>
					</TrackArcCW>
					<TrackLine>
						<End x="212.9" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="WTBT"/>
				<Subwire width="0.3">
					<Start x="197.4421" y="61.4376"/>
					<TrackLine>
						<End x="206.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="175.4" y="87.9"/>
					<TrackLine>
						<End x="176.0868" y="74.8551"/>
					</TrackLine>
					<TrackArc>
						<Center x="177.9422" y="74.9528"/>
						<End x="176.9165" y="73.4036"/>
					</TrackArc>
					<TrackLine>
						<End x="185.7859" y="67.5313"/>
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
					<Start x="190.4" y="95.4"/>
					<TrackLine>
						<End x="200.0091" y="104.492"/>
					</TrackLine>
					<TrackArc>
						<Center x="199.15" y="105.4"/>
						<End x="200.3285" y="105.8167"/>
					</TrackArc>
					<TrackLine>
						<End x="199.15" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="217.9" y="69.15"/>
					<TrackLine>
						<End x="222.1051" y="72.6147"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="222.9" y="71.65"/>
						<End x="222.9" y="72.9"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="222.9" y="74.15"/>
						<End x="223.65" y="73.15"/>
					</TrackArc>
					<TrackLine>
						<End x="229.65" y="77.65"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="230.4" y="76.65"/>
						<End x="230.4" y="77.9"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="230.4" y="79.15"/>
						<End x="231.5755" y="78.725"/>
					</TrackArc>
					<TrackLine>
						<End x="232.3749" y="80.936"/>
					</TrackLine>
					<TrackArc>
						<Center x="230.4" y="81.65"/>
						<End x="232.4838" y="81.9105"/>
					</TrackArc>
					<TrackLine>
						<End x="229.9838" y="101.9105"/>
					</TrackLine>
					<TrackArc>
						<Center x="227.9" y="101.65"/>
						<End x="229.9762" y="101.965"/>
					</TrackArc>
					<TrackLine>
						<End x="229.2347" y="106.8525"/>
					</TrackLine>
					<TrackArc>
						<Center x="227.9" y="106.65"/>
						<End x="229.0194" y="107.4046"/>
					</TrackArc>
					<TrackLine>
						<End x="222.8975" y="116.4854"/>
					</TrackLine>
					<TrackArc>
						<Center x="222.4" y="116.15"/>
						<End x="222.6426" y="116.6988"/>
					</TrackArc>
					<TrackLine>
						<End x="220.2012" y="117.778"/>
					</TrackLine>
					<TrackArc>
						<Center x="219.15" y="115.4"/>
						<End x="219.3576" y="117.9917"/>
					</TrackArc>
					<TrackLine>
						<End x="205.0986" y="119.1341"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="205.2" y="120.4"/>
						<End x="203.93" y="120.4"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="202.66" y="120.4"/>
						<End x="202.66" y="121.67"/>
					</TrackArc>
					<TrackArcCW>
						<Center x="202.66" y="122.94"/>
						<End x="201.3976" y="122.8013"/>
					</TrackArcCW>
					<TrackLine>
						<End x="201.3673" y="123.0771"/>
					</TrackLine>
					<TrackArc>
						<Center x="200.12" y="122.94"/>
						<End x="200.1196" y="124.1948"/>
					</TrackArc>
					<TrackLine>
						<End x="199.1089" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8499" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="197.5803" y="124.1948"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5037" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3099" y="124.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0403" y="124.1948"/>
					</TrackLine>
					<TrackArc>
						<Center x="195.04" y="122.94"/>
						<End x="194.4201" y="124.031"/>
					</TrackArc>
					<TrackLine>
						<End x="192.5" y="122.94"/>
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
		</Wires>
	</Connectivity>

	<Settings version="1.3">
		<Autoroute wireShape="Arcs"
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