<?xml version="1.0" encoding="UTF-8"?>

<!--***************************************-->
<!--   File    : Arcs_master_f6.fst        -->
<!--   Format  : TopoR PCB file            -->
<!--   Version : 1.2.1                     -->
<!--   Program : TopoR Lite 7.0.18699      -->
<!--   Date    : Monday, November 02, 2026 -->
<!--   Time    : 20:47                     -->
<!--***************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.2.1</Version>
		<Program>TopoR Lite 7.0.18699</Program>
		<Date>Monday, November 02, 2026 20:47</Date>
		<OriginalFormat>Pcad 2004</OriginalFormat>
		<OriginalFile>.\Arcs_master.pcb</OriginalFile>
		<Units dist="mm" time="ps"/>
	</Header>

	<Layers version="1.1">
		<StackUpLayers>
			<Layer name="TopMask" type="Mask" thickness="0"/>
			<Layer name="TopSilk" type="Silk" thickness="0"/>
			<Layer name="TopPaste" type="Paste" thickness="0"/>
			<Layer name="TopAssy" type="Assy" compsOutline="on"/>
			<Layer name="Top" type="Signal" thickness="0"/>
			<Layer name="Bottom" type="Signal" thickness="0"/>
			<Layer name="BotAssy" type="Assy" compsOutline="on"/>
			<Layer name="BotPaste" type="Paste" thickness="0"/>
			<Layer name="BotSilk" type="Silk" thickness="0"/>
			<Layer name="BotMask" type="Mask" thickness="0"/>
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
			<Footprint name="SL_A31_1">
				<Pads>
					<Pad padNum="1" name="A1">
						<PadstackRef name="C200L.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="A2">
						<PadstackRef name="C200L.PS"/>
						<Org x="-2.54" y="0"/>
					</Pad>
					<Pad padNum="3" name="A3">
						<PadstackRef name="C200L.PS"/>
						<Org x="-5.08" y="0"/>
					</Pad>
					<Pad padNum="4" name="A4">
						<PadstackRef name="C200L.PS"/>
						<Org x="-7.62" y="0"/>
					</Pad>
					<Pad padNum="5" name="A5">
						<PadstackRef name="C200L.PS"/>
						<Org x="-10.16" y="0"/>
					</Pad>
					<Pad padNum="6" name="A6">
						<PadstackRef name="C200L.PS"/>
						<Org x="-12.7" y="0"/>
					</Pad>
					<Pad padNum="7" name="A7">
						<PadstackRef name="C200L.PS"/>
						<Org x="-15.24" y="0"/>
					</Pad>
					<Pad padNum="8" name="A8">
						<PadstackRef name="C200L.PS"/>
						<Org x="-17.78" y="0"/>
					</Pad>
					<Pad padNum="9" name="A9">
						<PadstackRef name="C200L.PS"/>
						<Org x="-20.32" y="0"/>
					</Pad>
					<Pad padNum="10" name="A10">
						<PadstackRef name="C200L.PS"/>
						<Org x="-22.86" y="0"/>
					</Pad>
					<Pad padNum="11" name="A11">
						<PadstackRef name="C200L.PS"/>
						<Org x="-25.4" y="0"/>
					</Pad>
					<Pad padNum="12" name="A12">
						<PadstackRef name="C200L.PS"/>
						<Org x="-27.94" y="0"/>
					</Pad>
					<Pad padNum="13" name="A13">
						<PadstackRef name="C200L.PS"/>
						<Org x="-30.48" y="0"/>
					</Pad>
					<Pad padNum="14" name="A14">
						<PadstackRef name="C200L.PS"/>
						<Org x="-33.02" y="0"/>
					</Pad>
					<Pad padNum="15" name="A15">
						<PadstackRef name="C200L.PS"/>
						<Org x="-35.56" y="0"/>
					</Pad>
					<Pad padNum="16" name="A16">
						<PadstackRef name="C200L.PS"/>
						<Org x="-38.1" y="0"/>
					</Pad>
					<Pad padNum="17" name="A17">
						<PadstackRef name="C200L.PS"/>
						<Org x="-40.64" y="0"/>
					</Pad>
					<Pad padNum="18" name="A18">
						<PadstackRef name="C200L.PS"/>
						<Org x="-43.18" y="0"/>
					</Pad>
					<Pad padNum="19" name="A19">
						<PadstackRef name="C200L.PS"/>
						<Org x="-45.72" y="0"/>
					</Pad>
					<Pad padNum="20" name="A20">
						<PadstackRef name="C200L.PS"/>
						<Org x="-48.26" y="0"/>
					</Pad>
					<Pad padNum="21" name="A21">
						<PadstackRef name="C200L.PS"/>
						<Org x="-50.8" y="0"/>
					</Pad>
					<Pad padNum="22" name="A22">
						<PadstackRef name="C200L.PS"/>
						<Org x="-53.34" y="0"/>
					</Pad>
					<Pad padNum="23" name="A23">
						<PadstackRef name="C200L.PS"/>
						<Org x="-55.88" y="0"/>
					</Pad>
					<Pad padNum="24" name="A24">
						<PadstackRef name="C200L.PS"/>
						<Org x="-58.42" y="0"/>
					</Pad>
					<Pad padNum="25" name="A25">
						<PadstackRef name="C200L.PS"/>
						<Org x="-60.96" y="0"/>
					</Pad>
					<Pad padNum="26" name="A26">
						<PadstackRef name="C200L.PS"/>
						<Org x="-63.5" y="0"/>
					</Pad>
					<Pad padNum="27" name="A27">
						<PadstackRef name="C200L.PS"/>
						<Org x="-66.04" y="0"/>
					</Pad>
					<Pad padNum="28" name="A28">
						<PadstackRef name="C200L.PS"/>
						<Org x="-68.58" y="0"/>
					</Pad>
					<Pad padNum="29" name="A29">
						<PadstackRef name="C200L.PS"/>
						<Org x="-71.12" y="0"/>
					</Pad>
					<Pad padNum="30" name="A30">
						<PadstackRef name="C200L.PS"/>
						<Org x="-73.66" y="0"/>
					</Pad>
					<Pad padNum="31" name="A31">
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
					<Text text="2">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="-2" y="-2.5"/>
					</Text>
					<Text text="1">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="-2" y="0"/>
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
					<Text text="2">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="-2" y="-2.5"/>
					</Text>
					<Text text="1">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="-2" y="0"/>
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
			<Footprint name="SL_B31_1">
				<Pads>
					<Pad padNum="1" name="B1">
						<PadstackRef name="C200L.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="B2">
						<PadstackRef name="C200L.PS"/>
						<Org x="2.54" y="0"/>
					</Pad>
					<Pad padNum="3" name="B3">
						<PadstackRef name="C200L.PS"/>
						<Org x="5.08" y="0"/>
					</Pad>
					<Pad padNum="4" name="B4">
						<PadstackRef name="C200L.PS"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="5" name="B5">
						<PadstackRef name="C200L.PS"/>
						<Org x="10.16" y="0"/>
					</Pad>
					<Pad padNum="6" name="B6">
						<PadstackRef name="C200L.PS"/>
						<Org x="12.7" y="0"/>
					</Pad>
					<Pad padNum="7" name="B7">
						<PadstackRef name="C200L.PS"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="8" name="B8">
						<PadstackRef name="C200L.PS"/>
						<Org x="17.78" y="0"/>
					</Pad>
					<Pad padNum="9" name="B9">
						<PadstackRef name="C200L.PS"/>
						<Org x="20.32" y="0"/>
					</Pad>
					<Pad padNum="10" name="B10">
						<PadstackRef name="C200L.PS"/>
						<Org x="22.86" y="0"/>
					</Pad>
					<Pad padNum="11" name="B11">
						<PadstackRef name="C200L.PS"/>
						<Org x="25.4" y="0"/>
					</Pad>
					<Pad padNum="12" name="B12">
						<PadstackRef name="C200L.PS"/>
						<Org x="27.94" y="0"/>
					</Pad>
					<Pad padNum="13" name="B13">
						<PadstackRef name="C200L.PS"/>
						<Org x="30.48" y="0"/>
					</Pad>
					<Pad padNum="14" name="B14">
						<PadstackRef name="C200L.PS"/>
						<Org x="33.02" y="0"/>
					</Pad>
					<Pad padNum="15" name="B15">
						<PadstackRef name="C200L.PS"/>
						<Org x="35.56" y="0"/>
					</Pad>
					<Pad padNum="16" name="B16">
						<PadstackRef name="C200L.PS"/>
						<Org x="38.1" y="0"/>
					</Pad>
					<Pad padNum="17" name="B17">
						<PadstackRef name="C200L.PS"/>
						<Org x="40.64" y="0"/>
					</Pad>
					<Pad padNum="18" name="B18">
						<PadstackRef name="C200L.PS"/>
						<Org x="43.18" y="0"/>
					</Pad>
					<Pad padNum="19" name="B19">
						<PadstackRef name="C200L.PS"/>
						<Org x="45.72" y="0"/>
					</Pad>
					<Pad padNum="20" name="B20">
						<PadstackRef name="C200L.PS"/>
						<Org x="48.26" y="0"/>
					</Pad>
					<Pad padNum="21" name="B21">
						<PadstackRef name="C200L.PS"/>
						<Org x="50.8" y="0"/>
					</Pad>
					<Pad padNum="22" name="B22">
						<PadstackRef name="C200L.PS"/>
						<Org x="53.34" y="0"/>
					</Pad>
					<Pad padNum="23" name="B23">
						<PadstackRef name="C200L.PS"/>
						<Org x="55.88" y="0"/>
					</Pad>
					<Pad padNum="24" name="B24">
						<PadstackRef name="C200L.PS"/>
						<Org x="58.42" y="0"/>
					</Pad>
					<Pad padNum="25" name="B25">
						<PadstackRef name="C200L.PS"/>
						<Org x="60.96" y="0"/>
					</Pad>
					<Pad padNum="26" name="B26">
						<PadstackRef name="C200L.PS"/>
						<Org x="63.5" y="0"/>
					</Pad>
					<Pad padNum="27" name="B27">
						<PadstackRef name="C200L.PS"/>
						<Org x="66.04" y="0"/>
					</Pad>
					<Pad padNum="28" name="B28">
						<PadstackRef name="C200L.PS"/>
						<Org x="68.58" y="0"/>
					</Pad>
					<Pad padNum="29" name="B29">
						<PadstackRef name="C200L.PS"/>
						<Org x="71.12" y="0"/>
					</Pad>
					<Pad padNum="30" name="B30">
						<PadstackRef name="C200L.PS"/>
						<Org x="73.66" y="0"/>
					</Pad>
					<Pad padNum="31" name="B31">
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
					<Label name="RefDes" align="LB">
						<LayerRef name="BotSilk"/>
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
			<Footprint name="7128100_1">
				<Pads>
					<Pad padNum="1" name="A1">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="20.5"/>
					</Pad>
					<Pad padNum="2" name="A2">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="19.85"/>
					</Pad>
					<Pad padNum="3" name="A3">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="19.2"/>
					</Pad>
					<Pad padNum="4" name="A4">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="18.55"/>
					</Pad>
					<Pad padNum="5" name="A5">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="17.9"/>
					</Pad>
					<Pad padNum="6" name="A6">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="17.25"/>
					</Pad>
					<Pad padNum="7" name="A7">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="16.6"/>
					</Pad>
					<Pad padNum="8" name="A8">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="15.95"/>
					</Pad>
					<Pad padNum="9" name="A9">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="15.3"/>
					</Pad>
					<Pad padNum="10" name="A10">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="14.65"/>
					</Pad>
					<Pad padNum="11" name="A11">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="14"/>
					</Pad>
					<Pad padNum="12" name="A12">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="13.35"/>
					</Pad>
					<Pad padNum="13" name="A13">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="12.7"/>
					</Pad>
					<Pad padNum="14" name="A14">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="12.05"/>
					</Pad>
					<Pad padNum="15" name="A15">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="11.4"/>
					</Pad>
					<Pad padNum="16" name="A16">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="10.75"/>
					</Pad>
					<Pad padNum="17" name="A17">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="10.1"/>
					</Pad>
					<Pad padNum="18" name="A18">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="9.45"/>
					</Pad>
					<Pad padNum="19" name="A19">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="8.8"/>
					</Pad>
					<Pad padNum="20" name="A20">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="8.15"/>
					</Pad>
					<Pad padNum="21" name="A21">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="7.5"/>
					</Pad>
					<Pad padNum="22" name="A22">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="6.85"/>
					</Pad>
					<Pad padNum="23" name="A23">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="6.2"/>
					</Pad>
					<Pad padNum="24" name="A24">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="5.55"/>
					</Pad>
					<Pad padNum="25" name="A25">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="4.9"/>
					</Pad>
					<Pad padNum="26" name="A26">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="4.25"/>
					</Pad>
					<Pad padNum="27" name="A27">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="3.6"/>
					</Pad>
					<Pad padNum="28" name="A28">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="2.95"/>
					</Pad>
					<Pad padNum="29" name="A29">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="2.3"/>
					</Pad>
					<Pad padNum="30" name="A30">
						<PadstackRef name="C35LH.PS"/>
						<Org x="-1.95" y="1.65"/>
					</Pad>
					<Pad padNum="31" name="A31">
						<PadstackRef name="C35LV.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="32" name="A32">
						<PadstackRef name="C35LV.PS"/>
						<Org x="0.65" y="0"/>
					</Pad>
					<Pad padNum="33" name="A33">
						<PadstackRef name="C35LV.PS"/>
						<Org x="1.3" y="0"/>
					</Pad>
					<Pad padNum="34" name="A34">
						<PadstackRef name="C35LV.PS"/>
						<Org x="1.95" y="0"/>
					</Pad>
					<Pad padNum="35" name="A35">
						<PadstackRef name="C35LV.PS"/>
						<Org x="2.6" y="0"/>
					</Pad>
					<Pad padNum="36" name="A36">
						<PadstackRef name="C35LV.PS"/>
						<Org x="3.25" y="0"/>
					</Pad>
					<Pad padNum="37" name="A37">
						<PadstackRef name="C35LV.PS"/>
						<Org x="3.9" y="0"/>
					</Pad>
					<Pad padNum="38" name="A38">
						<PadstackRef name="C35LV.PS"/>
						<Org x="4.55" y="0"/>
					</Pad>
					<Pad padNum="39" name="A39">
						<PadstackRef name="C35LV.PS"/>
						<Org x="5.2" y="0"/>
					</Pad>
					<Pad padNum="40" name="A40">
						<PadstackRef name="C35LV.PS"/>
						<Org x="5.85" y="0"/>
					</Pad>
					<Pad padNum="41" name="A41">
						<PadstackRef name="C35LV.PS"/>
						<Org x="6.5" y="0"/>
					</Pad>
					<Pad padNum="42" name="A42">
						<PadstackRef name="C35LV.PS"/>
						<Org x="7.15" y="0"/>
					</Pad>
					<Pad padNum="43" name="A43">
						<PadstackRef name="C35LV.PS"/>
						<Org x="7.8" y="0"/>
					</Pad>
					<Pad padNum="44" name="A44">
						<PadstackRef name="C35LV.PS"/>
						<Org x="8.45" y="0"/>
					</Pad>
					<Pad padNum="45" name="A45">
						<PadstackRef name="C35LV.PS"/>
						<Org x="9.1" y="0"/>
					</Pad>
					<Pad padNum="46" name="A46">
						<PadstackRef name="C35LV.PS"/>
						<Org x="9.75" y="0"/>
					</Pad>
					<Pad padNum="47" name="A47">
						<PadstackRef name="C35LV.PS"/>
						<Org x="10.4" y="0"/>
					</Pad>
					<Pad padNum="48" name="A48">
						<PadstackRef name="C35LV.PS"/>
						<Org x="11.05" y="0"/>
					</Pad>
					<Pad padNum="49" name="A49">
						<PadstackRef name="C35LV.PS"/>
						<Org x="11.7" y="0"/>
					</Pad>
					<Pad padNum="50" name="A50">
						<PadstackRef name="C35LV.PS"/>
						<Org x="12.35" y="0"/>
					</Pad>
					<Pad padNum="51" name="A51">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="1.65"/>
					</Pad>
					<Pad padNum="52" name="A52">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="2.3"/>
					</Pad>
					<Pad padNum="53" name="A53">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="2.95"/>
					</Pad>
					<Pad padNum="54" name="A54">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="3.6"/>
					</Pad>
					<Pad padNum="55" name="A55">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="4.25"/>
					</Pad>
					<Pad padNum="56" name="A56">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="4.9"/>
					</Pad>
					<Pad padNum="57" name="A57">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="5.55"/>
					</Pad>
					<Pad padNum="58" name="A58">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="6.2"/>
					</Pad>
					<Pad padNum="59" name="A59">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="6.85"/>
					</Pad>
					<Pad padNum="60" name="A60">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="7.5"/>
					</Pad>
					<Pad padNum="61" name="A61">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="8.15"/>
					</Pad>
					<Pad padNum="62" name="A62">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="8.8"/>
					</Pad>
					<Pad padNum="63" name="A63">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="9.45"/>
					</Pad>
					<Pad padNum="64" name="A64">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="10.1"/>
					</Pad>
					<Pad padNum="65" name="A65">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="10.75"/>
					</Pad>
					<Pad padNum="66" name="A66">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="11.4"/>
					</Pad>
					<Pad padNum="67" name="A67">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="12.05"/>
					</Pad>
					<Pad padNum="68" name="A68">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="12.7"/>
					</Pad>
					<Pad padNum="69" name="A69">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="13.35"/>
					</Pad>
					<Pad padNum="70" name="A70">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="14"/>
					</Pad>
					<Pad padNum="71" name="A71">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="14.65"/>
					</Pad>
					<Pad padNum="72" name="A72">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="15.3"/>
					</Pad>
					<Pad padNum="73" name="A73">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="15.95"/>
					</Pad>
					<Pad padNum="74" name="A74">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="16.6"/>
					</Pad>
					<Pad padNum="75" name="A75">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="17.25"/>
					</Pad>
					<Pad padNum="76" name="A76">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="17.9"/>
					</Pad>
					<Pad padNum="77" name="A77">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="18.55"/>
					</Pad>
					<Pad padNum="78" name="A78">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="19.2"/>
					</Pad>
					<Pad padNum="79" name="A79">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="19.85"/>
					</Pad>
					<Pad padNum="80" name="A80">
						<PadstackRef name="C35LH.PS"/>
						<Org x="14.3" y="20.5"/>
					</Pad>
					<Pad padNum="81" name="A81">
						<PadstackRef name="C35LV.PS"/>
						<Org x="12.35" y="22.1"/>
					</Pad>
					<Pad padNum="82" name="A82">
						<PadstackRef name="C35LV.PS"/>
						<Org x="11.7" y="22.1"/>
					</Pad>
					<Pad padNum="83" name="A83">
						<PadstackRef name="C35LV.PS"/>
						<Org x="11.05" y="22.1"/>
					</Pad>
					<Pad padNum="84" name="A84">
						<PadstackRef name="C35LV.PS"/>
						<Org x="10.4" y="22.1"/>
					</Pad>
					<Pad padNum="85" name="A85">
						<PadstackRef name="C35LV.PS"/>
						<Org x="9.75" y="22.1"/>
					</Pad>
					<Pad padNum="86" name="A86">
						<PadstackRef name="C35LV.PS"/>
						<Org x="9.1" y="22.1"/>
					</Pad>
					<Pad padNum="87" name="A87">
						<PadstackRef name="C35LV.PS"/>
						<Org x="8.45" y="22.1"/>
					</Pad>
					<Pad padNum="88" name="A88">
						<PadstackRef name="C35LV.PS"/>
						<Org x="7.8" y="22.1"/>
					</Pad>
					<Pad padNum="89" name="A89">
						<PadstackRef name="C35LV.PS"/>
						<Org x="7.15" y="22.1"/>
					</Pad>
					<Pad padNum="90" name="A90">
						<PadstackRef name="C35LV.PS"/>
						<Org x="6.5" y="22.1"/>
					</Pad>
					<Pad padNum="91" name="A91">
						<PadstackRef name="C35LV.PS"/>
						<Org x="5.85" y="22.1"/>
					</Pad>
					<Pad padNum="92" name="A92">
						<PadstackRef name="C35LV.PS"/>
						<Org x="5.2" y="22.1"/>
					</Pad>
					<Pad padNum="93" name="A93">
						<PadstackRef name="C35LV.PS"/>
						<Org x="4.55" y="22.1"/>
					</Pad>
					<Pad padNum="94" name="A94">
						<PadstackRef name="C35LV.PS"/>
						<Org x="3.9" y="22.1"/>
					</Pad>
					<Pad padNum="95" name="A95">
						<PadstackRef name="C35LV.PS"/>
						<Org x="3.25" y="22.1"/>
					</Pad>
					<Pad padNum="96" name="A96">
						<PadstackRef name="C35LV.PS"/>
						<Org x="2.6" y="22.1"/>
					</Pad>
					<Pad padNum="97" name="A97">
						<PadstackRef name="C35LV.PS"/>
						<Org x="1.95" y="22.1"/>
					</Pad>
					<Pad padNum="98" name="A98">
						<PadstackRef name="C35LV.PS"/>
						<Org x="1.3" y="22.1"/>
					</Pad>
					<Pad padNum="99" name="A99">
						<PadstackRef name="C35LV.PS"/>
						<Org x="0.65" y="22.1"/>
					</Pad>
					<Pad padNum="100" name="A100">
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
				<Shape lineWidth="0.127">
					<FilledContour>
						<Start x="236.9" y="27.8"/>
						<SegmentLine>
							<End x="236.9" y="124.65"/>
						</SegmentLine>
						<SegmentLine>
							<End x="157.4" y="124.65"/>
						</SegmentLine>
						<SegmentLine>
							<End x="157.4" y="27.8"/>
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
			<CompInstance name="C6" uniqueId="HOQLKVIZ" side="Top">
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
			<CompInstance name="X4" uniqueId="KONFTROL" side="Top" angle="90" fixed="on">
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
			<CompInstance name="C1" uniqueId="RVZRONZP" side="Top" angle="90">
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
			<CompInstance name="C2" uniqueId="HXPXOKFO" side="Top" angle="270">
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
			<CompInstance name="C7" uniqueId="PBUGVGOM" side="Top" angle="270">
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
			<CompInstance name="C3" uniqueId="BGDJUGVF" side="Top" angle="90">
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
			<CompInstance name="C5" uniqueId="GPAWONOS" side="Top" angle="270">
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
			<CompInstance name="D6" uniqueId="UDMXEQOO" side="Top" angle="270">
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
			<CompInstance name="D12" uniqueId="AZETGEWY" side="Top" angle="180">
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
			<CompInstance name="D11" uniqueId="HZOCQGSM" side="Top" angle="180">
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
			<CompInstance name="D13" uniqueId="CJUQJABG" side="Top" angle="180">
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
			<CompInstance name="D7" uniqueId="RBLPCZAB" side="Top" angle="180">
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
			<CompInstance name="C4" uniqueId="IGDZJIYM" side="Top">
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
			<CompInstance name="D15" uniqueId="YGNETNHQ" side="Top">
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
			<CompInstance name="D4" uniqueId="GZAQZSGL" side="Top" angle="180">
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
			<CompInstance name="D10" uniqueId="ZKRZRIBG" side="Top" angle="180">
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
			<CompInstance name="D14" uniqueId="ITZTXAXF" side="Top" angle="180">
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
			<CompInstance name="D9" uniqueId="IUHDOOEO" side="Top" angle="180">
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
			<CompInstance name="X3" uniqueId="YVFUQVNI" side="Top" angle="180" fixed="on">
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
			<CompInstance name="D8" uniqueId="KIMPHIGP" side="Top" angle="180">
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
			<CompInstance name="D2" uniqueId="TBCFMOQH" side="Top" angle="180">
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
			<CompInstance name="D1" uniqueId="HIBGMYYU" side="Top" angle="270">
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
			<CompInstance name="X1" uniqueId="TMISUYUI" side="Top" fixed="on">
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
			<CompInstance name="X2" uniqueId="TGEGWSDF" side="Bottom" fixed="on">
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
			<CompInstance name="D3" uniqueId="MOFZSWXY" side="Top" angle="180">
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
			<CompInstance name="D5" uniqueId="YGRVZOLN" side="Top" angle="270">
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
			<PinRef compName="D1" pinName="A39"/>
		</Net>
		<Net name="D0">
			<PinRef compName="D15" pinName="2"/>
			<PinRef compName="D1" pinName="A42"/>
		</Net>
		<Net name="BAD4">
			<PinRef compName="D7" pinName="6"/>
			<PinRef compName="X3" pinName="9"/>
			<PinRef compName="D8" pinName="6"/>
			<PinRef compName="D2" pinName="6"/>
		</Net>
		<Net name="AD5">
			<PinRef compName="D2" pinName="13"/>
			<PinRef compName="D1" pinName="A7"/>
		</Net>
		<Net name="D4">
			<PinRef compName="D15" pinName="6"/>
			<PinRef compName="D1" pinName="A25"/>
		</Net>
		<Net name="IRQ_B">
			<PinRef compName="D6" pinName="6"/>
			<PinRef compName="D1" pinName="A48"/>
		</Net>
		<Net name="ADR21">
			<PinRef compName="D4" pinName="12"/>
			<PinRef compName="D1" pinName="A38"/>
		</Net>
		<Net name="AD14">
			<PinRef compName="D1" pinName="A70"/>
			<PinRef compName="D3" pinName="12"/>
		</Net>
		<Net name="#TCLK">
			<PinRef compName="X4" pinName="1"/>
			<PinRef compName="D1" pinName="A64"/>
		</Net>
		<Net name="DB">
			<PinRef compName="D4" pinName="1"/>
			<PinRef compName="D2" pinName="1"/>
			<PinRef compName="D1" pinName="A78"/>
		</Net>
		<Net name="P1">
			<PinRef compName="D13" pinName="10"/>
			<PinRef compName="D1" pinName="A96"/>
		</Net>
		<Net name="ADR20">
			<PinRef compName="D4" pinName="13"/>
			<PinRef compName="D1" pinName="A49"/>
		</Net>
		<Net name="EB1">
			<PinRef compName="D6" pinName="7"/>
			<PinRef compName="D4" pinName="19"/>
			<PinRef compName="D2" pinName="19"/>
			<PinRef compName="D1" pinName="A51"/>
			<PinRef compName="D5" pinName="7"/>
		</Net>
		<Net name="D2">
			<PinRef compName="D15" pinName="4"/>
			<PinRef compName="D1" pinName="A44"/>
		</Net>
		<Net name="BAD7">
			<PinRef compName="D7" pinName="9"/>
			<PinRef compName="X3" pinName="15"/>
			<PinRef compName="D8" pinName="9"/>
			<PinRef compName="D2" pinName="9"/>
		</Net>
		<Net name="A8">
			<PinRef compName="D1" pinName="A30"/>
			<PinRef compName="X1" pinName="A23"/>
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
			<PinRef compName="D1" pinName="A13"/>
			<PinRef compName="D1" pinName="A28"/>
			<PinRef compName="D1" pinName="A40"/>
			<PinRef compName="D1" pinName="A45"/>
			<PinRef compName="D1" pinName="A61"/>
			<PinRef compName="D1" pinName="A76"/>
			<PinRef compName="D1" pinName="A88"/>
			<PinRef compName="D1" pinName="A90"/>
			<PinRef compName="D1" pinName="A91"/>
			<PinRef compName="D1" pinName="A92"/>
			<PinRef compName="D1" pinName="A97"/>
			<PinRef compName="X2" pinName="B1"/>
			<PinRef compName="X2" pinName="B10"/>
			<PinRef compName="X2" pinName="B31"/>
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
			<PinRef compName="D1" pinName="A55"/>
		</Net>
		<Net name="A0">
			<PinRef compName="D1" pinName="A43"/>
			<PinRef compName="X1" pinName="A31"/>
		</Net>
		<Net name="A5">
			<PinRef compName="D1" pinName="A37"/>
			<PinRef compName="X1" pinName="A26"/>
		</Net>
		<Net name="AD4">
			<PinRef compName="D2" pinName="14"/>
			<PinRef compName="D1" pinName="A8"/>
		</Net>
		<Net name="BDIN">
			<PinRef compName="D12" pinName="10"/>
			<PinRef compName="D11" pinName="10"/>
			<PinRef compName="X3" pinName="20"/>
			<PinRef compName="D5" pinName="12"/>
		</Net>
		<Net name="AD3">
			<PinRef compName="D2" pinName="15"/>
			<PinRef compName="D1" pinName="A16"/>
		</Net>
		<Net name="OSC">
			<PinRef compName="D1" pinName="A89"/>
			<PinRef compName="X2" pinName="B30"/>
		</Net>
		<Net name="ADR17">
			<PinRef compName="D4" pinName="16"/>
			<PinRef compName="D1" pinName="A21"/>
		</Net>
		<Net name="SIA">
			<PinRef compName="D1" pinName="A80"/>
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
			<PinRef compName="D1" pinName="A6"/>
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
			<PinRef compName="D1" pinName="A18"/>
			<PinRef compName="X2" pinName="B21"/>
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
			<PinRef compName="D1" pinName="A23"/>
		</Net>
		<Net name="BA21">
			<PinRef compName="D12" pinName="8"/>
			<PinRef compName="D11" pinName="8"/>
			<PinRef compName="D4" pinName="8"/>
			<PinRef compName="X3" pinName="14"/>
		</Net>
		<Net name="-IOW">
			<PinRef compName="D1" pinName="A4"/>
			<PinRef compName="X2" pinName="B13"/>
		</Net>
		<Net name="A1">
			<PinRef compName="D1" pinName="A95"/>
			<PinRef compName="X1" pinName="A30"/>
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
			<PinRef compName="D1" pinName="A74"/>
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
			<PinRef compName="D1" pinName="A1"/>
			<PinRef compName="X1" pinName="A22"/>
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
			<PinRef compName="D1" pinName="A79"/>
			<PinRef compName="D5" pinName="11"/>
		</Net>
		<Net name="ADR19">
			<PinRef compName="D4" pinName="14"/>
			<PinRef compName="D1" pinName="A50"/>
		</Net>
		<Net name="BAD5">
			<PinRef compName="D7" pinName="7"/>
			<PinRef compName="X3" pinName="11"/>
			<PinRef compName="D8" pinName="7"/>
			<PinRef compName="D2" pinName="7"/>
		</Net>
		<Net name="DOUT">
			<PinRef compName="D1" pinName="A82"/>
			<PinRef compName="D5" pinName="5"/>
		</Net>
		<Net name="#TMS">
			<PinRef compName="X4" pinName="3"/>
			<PinRef compName="D1" pinName="A17"/>
		</Net>
		<Net name="OE_BF">
			<PinRef compName="D15" pinName="1"/>
			<PinRef compName="D1" pinName="A100"/>
		</Net>
		<Net name="SD7">
			<PinRef compName="D15" pinName="11"/>
			<PinRef compName="X1" pinName="A2"/>
		</Net>
		<Net name="SD6">
			<PinRef compName="D15" pinName="12"/>
			<PinRef compName="X1" pinName="A3"/>
		</Net>
		<Net name="SD5">
			<PinRef compName="D15" pinName="13"/>
			<PinRef compName="X1" pinName="A4"/>
		</Net>
		<Net name="SD1">
			<PinRef compName="D15" pinName="17"/>
			<PinRef compName="X1" pinName="A8"/>
		</Net>
		<Net name="ADR16">
			<PinRef compName="D4" pinName="17"/>
			<PinRef compName="D1" pinName="A54"/>
		</Net>
		<Net name="AD6">
			<PinRef compName="D2" pinName="12"/>
			<PinRef compName="D1" pinName="A15"/>
		</Net>
		<Net name="BA17">
			<PinRef compName="D12" pinName="4"/>
			<PinRef compName="D11" pinName="4"/>
			<PinRef compName="D4" pinName="4"/>
			<PinRef compName="X3" pinName="6"/>
		</Net>
		<Net name="AD15">
			<PinRef compName="D1" pinName="A65"/>
			<PinRef compName="D3" pinName="11"/>
		</Net>
		<Net name="IAKO">
			<PinRef compName="D1" pinName="A81"/>
			<PinRef compName="D5" pinName="2"/>
		</Net>
		<Net name="AD12">
			<PinRef compName="D1" pinName="A66"/>
			<PinRef compName="D3" pinName="14"/>
		</Net>
		<Net name="AD10">
			<PinRef compName="D1" pinName="A10"/>
			<PinRef compName="D3" pinName="16"/>
		</Net>
		<Net name="RPLY">
			<PinRef compName="D6" pinName="12"/>
			<PinRef compName="D13" pinName="4"/>
			<PinRef compName="D14" pinName="4"/>
			<PinRef compName="X3" pinName="34"/>
		</Net>
		<Net name="A2">
			<PinRef compName="D1" pinName="A31"/>
			<PinRef compName="X1" pinName="A29"/>
		</Net>
		<Net name="AD9">
			<PinRef compName="D1" pinName="A11"/>
			<PinRef compName="D3" pinName="17"/>
		</Net>
		<Net name="AD8">
			<PinRef compName="D1" pinName="A12"/>
			<PinRef compName="D3" pinName="18"/>
		</Net>
		<Net name="D7">
			<PinRef compName="D15" pinName="9"/>
			<PinRef compName="D1" pinName="A22"/>
		</Net>
		<Net name="SD4">
			<PinRef compName="D15" pinName="14"/>
			<PinRef compName="X1" pinName="A5"/>
		</Net>
		<Net name="RPLY_I">
			<PinRef compName="D6" pinName="10"/>
			<PinRef compName="D1" pinName="A71"/>
		</Net>
		<Net name="AD11">
			<PinRef compName="D1" pinName="A9"/>
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
			<PinRef compName="D1" pinName="A27"/>
		</Net>
		<Net name="SD0">
			<PinRef compName="D15" pinName="18"/>
			<PinRef compName="X1" pinName="A9"/>
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
			<PinRef compName="D1" pinName="A5"/>
			<PinRef compName="D1" pinName="A20"/>
			<PinRef compName="D1" pinName="A36"/>
			<PinRef compName="D1" pinName="A41"/>
			<PinRef compName="D1" pinName="A53"/>
			<PinRef compName="D1" pinName="A68"/>
			<PinRef compName="D1" pinName="A84"/>
			<PinRef compName="D1" pinName="A93"/>
			<PinRef compName="X2" pinName="B3"/>
			<PinRef compName="X2" pinName="B29"/>
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
			<PinRef compName="D1" pinName="A35"/>
			<PinRef compName="X1" pinName="A27"/>
		</Net>
		<Net name="AD7">
			<PinRef compName="D2" pinName="11"/>
			<PinRef compName="D1" pinName="A14"/>
		</Net>
		<Net name="D6">
			<PinRef compName="D15" pinName="8"/>
			<PinRef compName="D1" pinName="A24"/>
		</Net>
		<Net name="-IOR">
			<PinRef compName="D1" pinName="A34"/>
			<PinRef compName="X2" pinName="B14"/>
		</Net>
		<Net name="RES">
			<PinRef compName="D1" pinName="A47"/>
			<PinRef compName="X2" pinName="B2"/>
		</Net>
		<Net name="#TDO">
			<PinRef compName="X4" pinName="2"/>
			<PinRef compName="D1" pinName="A75"/>
		</Net>
		<Net name="A6">
			<PinRef compName="D1" pinName="A94"/>
			<PinRef compName="X1" pinName="A25"/>
		</Net>
		<Net name="ADR18">
			<PinRef compName="D4" pinName="15"/>
			<PinRef compName="D1" pinName="A58"/>
		</Net>
		<Net name="SD3">
			<PinRef compName="D15" pinName="15"/>
			<PinRef compName="X1" pinName="A6"/>
		</Net>
		<Net name="AEN">
			<PinRef compName="D1" pinName="A2"/>
			<PinRef compName="X1" pinName="A11"/>
		</Net>
		<Net name="A7">
			<PinRef compName="D1" pinName="A99"/>
			<PinRef compName="X1" pinName="A24"/>
		</Net>
		<Net name="AD1">
			<PinRef compName="D2" pinName="17"/>
			<PinRef compName="D1" pinName="A26"/>
		</Net>
		<Net name="A3">
			<PinRef compName="D1" pinName="A98"/>
			<PinRef compName="X1" pinName="A28"/>
		</Net>
		<Net name="SD2">
			<PinRef compName="D15" pinName="16"/>
			<PinRef compName="X1" pinName="A7"/>
		</Net>
		<Net name="D3">
			<PinRef compName="D15" pinName="5"/>
			<PinRef compName="D1" pinName="A19"/>
		</Net>
		<Net name="WTBT">
			<PinRef compName="D4" pinName="18"/>
			<PinRef compName="D1" pinName="A85"/>
		</Net>
		<Net name="AD13">
			<PinRef compName="D1" pinName="A73"/>
			<PinRef compName="D3" pinName="13"/>
		</Net>
		<Net name="D5">
			<PinRef compName="D15" pinName="7"/>
			<PinRef compName="D1" pinName="A3"/>
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
			<NetGroup name="DEFAULT">
				<NetRef name="WTBT"/>
				<NetRef name="SIA"/>
				<NetRef name="SEL"/>
				<NetRef name="SD7"/>
				<NetRef name="SD6"/>
				<NetRef name="SD5"/>
				<NetRef name="SD4"/>
				<NetRef name="SD3"/>
				<NetRef name="SD2"/>
				<NetRef name="SD1"/>
				<NetRef name="SD0"/>
				<NetRef name="RPLY_I"/>
				<NetRef name="RPLY"/>
				<NetRef name="REST"/>
				<NetRef name="RES"/>
				<NetRef name="P1"/>
				<NetRef name="OSC"/>
				<NetRef name="OE_BF"/>
				<NetRef name="IRQ_B"/>
				<NetRef name="IRQ7"/>
				<NetRef name="IAKO"/>
				<NetRef name="EB1"/>
				<NetRef name="DOUT"/>
				<NetRef name="DIN"/>
				<NetRef name="DCLO"/>
				<NetRef name="DB"/>
				<NetRef name="D7"/>
				<NetRef name="D6"/>
				<NetRef name="D5"/>
				<NetRef name="D4"/>
				<NetRef name="D3"/>
				<NetRef name="D2"/>
				<NetRef name="D1"/>
				<NetRef name="D0"/>
				<NetRef name="BWTBT"/>
				<NetRef name="BSIA"/>
				<NetRef name="BSEL"/>
				<NetRef name="BIRQ"/>
				<NetRef name="BIAKO"/>
				<NetRef name="BDOUT"/>
				<NetRef name="BDIN"/>
				<NetRef name="BAD15"/>
				<NetRef name="BAD14"/>
				<NetRef name="BAD13"/>
				<NetRef name="BAD12"/>
				<NetRef name="BAD11"/>
				<NetRef name="BAD10"/>
				<NetRef name="BAD9"/>
				<NetRef name="BAD8"/>
				<NetRef name="BAD7"/>
				<NetRef name="BAD6"/>
				<NetRef name="BAD5"/>
				<NetRef name="BAD4"/>
				<NetRef name="BAD3"/>
				<NetRef name="BAD2"/>
				<NetRef name="BAD1"/>
				<NetRef name="BAD0"/>
				<NetRef name="BA21"/>
				<NetRef name="BA20"/>
				<NetRef name="BA19"/>
				<NetRef name="BA18"/>
				<NetRef name="BA17"/>
				<NetRef name="BA16"/>
				<NetRef name="AEN"/>
				<NetRef name="ADR21"/>
				<NetRef name="ADR20"/>
				<NetRef name="ADR19"/>
				<NetRef name="ADR18"/>
				<NetRef name="ADR17"/>
				<NetRef name="ADR16"/>
				<NetRef name="AD15"/>
				<NetRef name="AD14"/>
				<NetRef name="AD13"/>
				<NetRef name="AD12"/>
				<NetRef name="AD11"/>
				<NetRef name="AD10"/>
				<NetRef name="AD9"/>
				<NetRef name="AD8"/>
				<NetRef name="AD7"/>
				<NetRef name="AD6"/>
				<NetRef name="AD5"/>
				<NetRef name="AD4"/>
				<NetRef name="AD3"/>
				<NetRef name="AD2"/>
				<NetRef name="AD1"/>
				<NetRef name="AD0"/>
				<NetRef name="A9"/>
				<NetRef name="A8"/>
				<NetRef name="A7"/>
				<NetRef name="A6"/>
				<NetRef name="A5"/>
				<NetRef name="A4"/>
				<NetRef name="A3"/>
				<NetRef name="A2"/>
				<NetRef name="A1"/>
				<NetRef name="A0"/>
				<NetRef name="-IOW"/>
				<NetRef name="-IOR"/>
				<NetRef name="#TMS"/>
				<NetRef name="#TDO"/>
				<NetRef name="#TDI"/>
				<NetRef name="#TCLK"/>
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
			<WidthOfWires enabled="on" widthMin="0.0076" widthNom="0.0076">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.0076" widthNom="0.0203">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="POWER"/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.0076" widthNom="0.0076">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="DEFAULT"/>
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
					<Start x="215.4" y="89.15"/>
					<TrackLine>
						<End x="214.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA16"/>
				<Subwire width="0.3">
					<Start x="216.65" y="94.15"/>
					<TrackLine>
						<End x="215.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.3">
					<Start x="175.65" y="63.4"/>
					<TrackLine>
						<End x="174.2445" y="62.7043"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2342" y="62.7"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7" y="62.7"/>
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
						<End x="174.35" y="60.3692"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9692" y="60.75"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7" y="60.75"/>
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
						<End x="203.6239" y="96.9024"/>
					</TrackLine>
					<TrackLine>
						<End x="202.6476" y="95.9261"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3433" y="95.8"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6059" y="95.5"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5772" y="95.4881"/>
					</TrackLine>
					<TrackLine>
						<End x="194.2228" y="93.3119"/>
					</TrackLine>
					<TrackLine>
						<End x="194.1941" y="93.3"/>
					</TrackLine>
					<TrackLine>
						<End x="189.8239" y="92.17"/>
					</TrackLine>
					<TrackLine>
						<End x="189.08" y="91.4261"/>
					</TrackLine>
					<TrackLine>
						<End x="189.08" y="90.3739"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="190.16" y="81.5934"/>
					</TrackLine>
					<TrackLine>
						<End x="190.66" y="78.4842"/>
					</TrackLine>
					<TrackLine>
						<End x="190.66" y="77.4158"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5" y="71.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5" y="70.65"/>
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
						<End x="177.95" y="59.7865"/>
					</TrackLine>
					<TrackLine>
						<End x="177.95" y="62.3135"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8" y="68.5158"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8" y="69.05"/>
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
						<End x="179.3822" y="61.7"/>
					</TrackLine>
					<TrackLine>
						<End x="178.65" y="60.9678"/>
					</TrackLine>
					<TrackLine>
						<End x="178.65" y="59.9322"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3" y="58.5471"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3" y="57.5529"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5971" y="56.85"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7" y="56.85"/>
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
					<Start x="202.9" y="104"/>
					<TrackLine>
						<End x="186.1059" y="104.05"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6322" y="104.15"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="104.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="105.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="182.1678" y="106.65"/>
					</TrackLine>
					<TrackLine>
						<End x="179.6941" y="106.75"/>
					</TrackLine>
					<TrackLine>
						<End x="177.1941" y="106.75"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1059" y="106.75"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="174.65" y="67.35"/>
					<TrackLine>
						<End x="174.45" y="64.3393"/>
					</TrackLine>
					<TrackLine>
						<End x="174.35" y="63.7308"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9692" y="63.35"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7" y="63.35"/>
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
					<Start x="201.65" y="90.4"/>
					<TrackLine>
						<End x="200.9441" y="90.5"/>
					</TrackLine>
					<TrackLine>
						<End x="198.4441" y="90.5"/>
					</TrackLine>
					<TrackLine>
						<End x="197.3559" y="90.5"/>
					</TrackLine>
					<TrackLine>
						<End x="197.3272" y="90.4881"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5619" y="89.7228"/>
					</TrackLine>
					<TrackLine>
						<End x="196.55" y="89.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3" y="85.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3" y="84.8559"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3119" y="84.8272"/>
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
					<Start x="166.65" y="93.05"/>
					<TrackLine>
						<End x="166.65" y="83.55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD14"/>
				<Subwire width="0.3">
					<Start x="179.9" y="60.45"/>
					<TrackLine>
						<End x="184.8342" y="59.95"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8445" y="59.9457"/>
					</TrackLine>
					<TrackLine>
						<End x="185.5957" y="59.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="185.6" y="59.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9" y="54.6692"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9" y="54.4"/>
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
						<End x="182.6192" y="52.15"/>
					</TrackLine>
					<TrackLine>
						<End x="183" y="52.5308"/>
					</TrackLine>
					<TrackLine>
						<End x="183" y="52.8"/>
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
					<Start x="196.1" y="53.6"/>
					<TrackLine>
						<End x="196.125" y="52.3574"/>
					</TrackLine>
					<TrackLine>
						<End x="196.125" y="51.3426"/>
					</TrackLine>
					<TrackLine>
						<End x="195.4074" y="50.625"/>
					</TrackLine>
					<TrackLine>
						<End x="194.3926" y="50.625"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8555" y="51.5043"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1043" y="52.2555"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1" y="52.2658"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1" y="52.8"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DB"/>
				<Subwire width="0.3">
					<Start x="224.21" y="72.94"/>
					<TrackLine>
						<End x="225" y="75.9567"/>
					</TrackLine>
					<TrackLine>
						<End x="225" y="80.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="225" y="81.4441"/>
					</TrackLine>
					<TrackLine>
						<End x="225" y="82.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="224.9881" y="82.9728"/>
					</TrackLine>
					<TrackLine>
						<End x="224.6199" y="83.8357"/>
					</TrackLine>
					<TrackLine>
						<End x="224.4125" y="84.3358"/>
					</TrackLine>
					<TrackLine>
						<End x="224.4" y="84.3855"/>
					</TrackLine>
					<TrackLine>
						<End x="224.3" y="86.9867"/>
					</TrackLine>
					<TrackLine>
						<End x="224.3" y="88.8133"/>
					</TrackLine>
					<TrackLine>
						<End x="224.7667" y="91.7131"/>
					</TrackLine>
					<TrackLine>
						<End x="224.7667" y="92.9869"/>
					</TrackLine>
					<TrackLine>
						<End x="223.75" y="98.5933"/>
					</TrackLine>
					<TrackLine>
						<End x="222.55" y="104.7121"/>
					</TrackLine>
					<TrackLine>
						<End x="222.4621" y="104.8"/>
					</TrackLine>
					<TrackLine>
						<End x="222.4" y="104.8"/>
					</TrackLine>
					<TrackLine>
						<End x="222.25" y="104.8"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DB"/>
				<Subwire width="0.3">
					<Start x="224.21" y="72.94"/>
					<TrackLine>
						<End x="223.4178" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3822" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="73.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="74.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="221.6625" y="77.1246"/>
					</TrackLine>
					<TrackLine>
						<End x="221.6625" y="78.6754"/>
					</TrackLine>
					<TrackLine>
						<End x="219.75" y="84.5879"/>
					</TrackLine>
					<TrackLine>
						<End x="219.75" y="84.65"/>
					</TrackLine>
					<TrackLine>
						<End x="219.75" y="84.8"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="199.75" y="65.3"/>
					<TrackLine>
						<End x="195.8" y="65.3"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="65.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="219.15" y="65.4"/>
					<TrackLine>
						<End x="219.25" y="64.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="219.25" y="62.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="219.25" y="61.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="58.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="57.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="56.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="234.4094" y="62.872"/>
					</TrackLine>
					<TrackLine>
						<End x="235.158" y="63.6206"/>
					</TrackLine>
					<TrackLine>
						<End x="235.158" y="64.6794"/>
					</TrackLine>
					<TrackLine>
						<End x="233.75" y="77.5324"/>
					</TrackLine>
					<TrackLine>
						<End x="233" y="82.4397"/>
					</TrackLine>
					<TrackLine>
						<End x="232.9971" y="82.4512"/>
					</TrackLine>
					<TrackLine>
						<End x="230.2" y="89.4158"/>
					</TrackLine>
					<TrackLine>
						<End x="230.2" y="90.4842"/>
					</TrackLine>
					<TrackLine>
						<End x="230.5" y="92.1103"/>
					</TrackLine>
					<TrackLine>
						<End x="230.5" y="93.6897"/>
					</TrackLine>
					<TrackLine>
						<End x="230.5" y="102.4397"/>
					</TrackLine>
					<TrackLine>
						<End x="230.4971" y="102.4512"/>
					</TrackLine>
					<TrackLine>
						<End x="229.25" y="107.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="229.2381" y="107.2228"/>
					</TrackLine>
					<TrackLine>
						<End x="218.9109" y="123.3587"/>
					</TrackLine>
					<TrackLine>
						<End x="218.3335" y="123.9375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="P1"/>
				<Subwire width="0.0203">
					<Teardrops>
						<Teardrop>
							<Dot x="168.1645" y="124.365"/>
							<Dot x="168.235" y="124.2654"/>
							<Dot x="168.3365" y="124.3373"/>
							<Dot x="168.2626" y="124.4374"/>
						</Teardrop>
					</Teardrops>
					<Start x="218.3335" y="123.9375"/>
					<TrackLine>
						<End x="218.3187" y="123.9509"/>
					</TrackLine>
					<TrackLine>
						<End x="215.8613" y="124.1502"/>
					</TrackLine>
					<TrackLine>
						<End x="168.7193" y="124.2758"/>
					</TrackLine>
					<TrackLine>
						<End x="168.1645" y="124.365"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="168.1645" y="124.365"/>
					<TrackLine>
						<End x="165.4" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="165.4" y="114.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="164.15" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR20"/>
				<Subwire width="0.3">
					<Start x="173.15" y="53.15"/>
					<TrackLine>
						<End x="173.8436" y="54.6926"/>
					</TrackLine>
					<TrackLine>
						<End x="174.35" y="55.2808"/>
					</TrackLine>
					<TrackLine>
						<End x="174.35" y="55.8192"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9692" y="56.2"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7" y="56.2"/>
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
						<End x="184.9512" y="44.0529"/>
					</TrackLine>
					<TrackLine>
						<End x="184.9397" y="44.05"/>
					</TrackLine>
					<TrackLine>
						<End x="183.3603" y="44.05"/>
					</TrackLine>
					<TrackLine>
						<End x="180.3172" y="44.65"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3559" y="45.3"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3272" y="45.3119"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5619" y="46.0772"/>
					</TrackLine>
					<TrackLine>
						<End x="176.55" y="46.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="174.55" y="52.5308"/>
					</TrackLine>
					<TrackLine>
						<End x="174.55" y="52.8"/>
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
					<Start x="214.87" y="60.36"/>
					<TrackLine>
						<End x="214.8667" y="52.6901"/>
					</TrackLine>
					<TrackLine>
						<End x="214.8667" y="51.7099"/>
					</TrackLine>
					<TrackLine>
						<End x="215.5599" y="51.0167"/>
					</TrackLine>
					<TrackLine>
						<End x="216.0469" y="51.0167"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="50.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="222.9" y="66.65"/>
					<TrackLine>
						<End x="218.4178" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="216.55" y="73.6059"/>
					</TrackLine>
					<TrackLine>
						<End x="216.55" y="74.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="171.65" y="39.45"/>
					<TrackLine>
						<End x="170.3" y="50.6172"/>
					</TrackLine>
					<TrackLine>
						<End x="169.85" y="56.6658"/>
					</TrackLine>
					<TrackLine>
						<End x="169.85" y="57.7342"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8543" y="57.7445"/>
					</TrackLine>
					<TrackLine>
						<End x="170.6055" y="58.4957"/>
					</TrackLine>
					<TrackLine>
						<End x="171.0841" y="58.8198"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8308" y="59.45"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1" y="59.45"/>
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
						<End x="201.7" y="117.2658"/>
					</TrackLine>
					<TrackLine>
						<End x="201.7" y="118.3342"/>
					</TrackLine>
					<TrackLine>
						<End x="201.6957" y="118.3445"/>
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
						<End x="179.35" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="179.35" y="35.25"/>
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
					<Start x="227.9" y="41.65"/>
					<TrackLine>
						<End x="227.76" y="42.5261"/>
					</TrackLine>
					<TrackLine>
						<End x="227.76" y="43.6939"/>
					</TrackLine>
					<TrackLine>
						<End x="227.8023" y="43.7961"/>
					</TrackLine>
					<TrackLine>
						<End x="228.6239" y="44.6177"/>
					</TrackLine>
					<TrackLine>
						<End x="228.7261" y="44.66"/>
					</TrackLine>
					<TrackLine>
						<End x="229.8939" y="44.66"/>
					</TrackLine>
					<TrackLine>
						<End x="235.25" y="43.11"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="166.48" y="71.81"/>
					<TrackLine>
						<End x="175.85" y="71.8"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="161.69" y="83.06"/>
					<TrackLine>
						<End x="163.1689" y="82.4488"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="188.7" y="115.5"/>
					<TrackLine>
						<End x="187.4" y="115.5"/>
					</TrackLine>
					<TrackLine>
						<End x="187" y="115.5"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="179.2" y="51.85"/>
					<TrackLine>
						<End x="179.05" y="50.774"/>
					</TrackLine>
					<TrackLine>
						<End x="179.05" y="49.626"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0847" y="49.5422"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8922" y="48.7347"/>
					</TrackLine>
					<TrackLine>
						<End x="179.976" y="48.7"/>
					</TrackLine>
					<TrackLine>
						<End x="181.124" y="48.7"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="48.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="229.3847" y="88.4968"/>
					<TrackLine>
						<End x="227.9" y="87.9"/>
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
						<End x="194.2" y="61.4"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5" y="61.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="230.4" y="64.15"/>
					<TrackLine>
						<End x="232.8469" y="65.3058"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="190.94" y="55.42"/>
					<TrackLine>
						<End x="191.25" y="58.0839"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5" y="60.1"/>
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
					<Start x="233.88" y="64.15"/>
					<TrackLine>
						<End x="232.8469" y="65.3058"/>
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
						<End x="194.2" y="60.1"/>
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
					<Start x="175.85" y="71.8"/>
					<TrackLine>
						<End x="175.85" y="70.65"/>
					</TrackLine>
					<TrackLine>
						<End x="175.85" y="69.85"/>
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
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="188.7" y="115.5"/>
							<Dot x="188.9271" y="115.6047"/>
							<Dot x="188.6986" y="116.1"/>
							<Dot x="188.4725" y="115.6037"/>
						</Teardrop>
					</Teardrops>
					<Start x="188.7" y="115.5"/>
					<TrackLine>
						<End x="188.69" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="188.69" y="120.9261"/>
					</TrackLine>
					<TrackLine>
						<End x="189.96" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="171.15" y="62.6"/>
					<TrackLine>
						<End x="171.8308" y="62.05"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1" y="62.05"/>
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
					<Start x="192.9" y="115.4"/>
					<TrackLine>
						<End x="192.0339" y="115.6"/>
					</TrackLine>
					<TrackLine>
						<End x="190.8661" y="115.6"/>
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
					<Start x="172.9" y="46.65"/>
					<TrackLine>
						<End x="171.3" y="50.8161"/>
					</TrackLine>
					<TrackLine>
						<End x="171.3" y="51.9839"/>
					</TrackLine>
					<TrackLine>
						<End x="171.4" y="54.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="217.9" y="56.65"/>
					<TrackLine>
						<End x="218.643" y="56.8"/>
					</TrackLine>
					<TrackLine>
						<End x="219.0392" y="56.9641"/>
					</TrackLine>
					<TrackLine>
						<End x="220.0859" y="58.0108"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9" y="64.15"/>
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
				<Subwire width="0.8">
					<Start x="196.25" y="105.65"/>
					<TrackLine>
						<End x="192.4" y="105.65"/>
					</TrackLine>
					<TrackLine>
						<End x="192" y="105.65"/>
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
					<Start x="221.65" y="113.9"/>
					<TrackLine>
						<End x="221.65" y="114.65"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="115.05"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="195" y="62.05"/>
					<TrackLine>
						<End x="195.8" y="62.05"/>
					</TrackLine>
					<TrackLine>
						<End x="196.0692" y="62.05"/>
					</TrackLine>
					<TrackLine>
						<End x="197.75" y="61.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="164.25" y="77.98"/>
					<TrackLine>
						<End x="163.1689" y="82.4488"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="184.15" y="48.75"/>
					<TrackLine>
						<End x="188.5" y="50.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="195" y="61.4"/>
					<TrackLine>
						<End x="195" y="62.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="176" y="61.65"/>
					<TrackLine>
						<End x="175.914" y="59.4764"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1736" y="58.736"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1264" y="58.736"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9692" y="58.8"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7" y="58.8"/>
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
					<Start x="199.15" y="105.4"/>
					<TrackLine>
						<End x="196.25" y="105.65"/>
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
					<TrackLine>
						<End x="185.6" y="68.7808"/>
					</TrackLine>
					<TrackLine>
						<End x="185.2" y="68.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="179.2" y="51.85"/>
					<TrackLine>
						<End x="180.6692" y="52.15"/>
					</TrackLine>
					<TrackLine>
						<End x="181.05" y="52.5308"/>
					</TrackLine>
					<TrackLine>
						<End x="181.05" y="52.8"/>
					</TrackLine>
					<TrackLine>
						<End x="181.05" y="53.6"/>
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
							<Dot x="191.7422" y="61.462"/>
							<Dot x="191.6069" y="61.9904"/>
							<Dot x="191.295" y="61.543"/>
						</Teardrop>
					</Teardrops>
					<Start x="191.5" y="61.4"/>
					<TrackLine>
						<End x="191.95" y="63.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="191.9543" y="63.8945"/>
					</TrackLine>
					<TrackLine>
						<End x="193.55" y="65.5692"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9308" y="65.95"/>
					</TrackLine>
					<TrackLine>
						<End x="194.2" y="65.95"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="65.95"/>
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
					<Start x="222.9" y="64.15"/>
					<TrackLine>
						<End x="230.4" y="64.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="190.8" y="53.6"/>
					<TrackLine>
						<End x="190.8" y="54.4"/>
					</TrackLine>
					<TrackLine>
						<End x="190.8" y="54.6692"/>
					</TrackLine>
					<TrackLine>
						<End x="190.94" y="55.42"/>
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
					<Start x="232.8469" y="65.3058"/>
					<TrackLine>
						<End x="232.45" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="170.4" y="95.4"/>
					<TrackLine>
						<End x="166.0661" y="94.6"/>
					</TrackLine>
					<TrackLine>
						<End x="165.9639" y="94.5577"/>
					</TrackLine>
					<TrackLine>
						<End x="165.1423" y="93.7361"/>
					</TrackLine>
					<TrackLine>
						<End x="165.1" y="93.6339"/>
					</TrackLine>
					<TrackLine>
						<End x="163.1689" y="82.4488"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="106.65"/>
					<TrackLine>
						<End x="229.5" y="102.2438"/>
					</TrackLine>
					<TrackLine>
						<End x="229.5" y="93.4938"/>
					</TrackLine>
					<TrackLine>
						<End x="229.5" y="92.3062"/>
					</TrackLine>
					<TrackLine>
						<End x="229.2" y="90.6831"/>
					</TrackLine>
					<TrackLine>
						<End x="229.2" y="89.2169"/>
					</TrackLine>
					<TrackLine>
						<End x="229.3847" y="88.4968"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="115.4"/>
					<TrackLine>
						<End x="198.5711" y="113.875"/>
					</TrackLine>
					<TrackLine>
						<End x="220.2024" y="113.875"/>
					</TrackLine>
					<TrackLine>
						<End x="220.5776" y="113.8716"/>
					</TrackLine>
					<TrackLine>
						<End x="221.2224" y="113.8716"/>
					</TrackLine>
					<TrackLine>
						<End x="221.6218" y="113.873"/>
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
					<Start x="229.3847" y="88.4968"/>
					<TrackLine>
						<End x="231.9501" y="82.3644"/>
					</TrackLine>
					<TrackLine>
						<End x="232" y="82.2438"/>
					</TrackLine>
					<TrackLine>
						<End x="232.75" y="77.393"/>
					</TrackLine>
					<TrackLine>
						<End x="232.75" y="72.393"/>
					</TrackLine>
					<TrackLine>
						<End x="232.75" y="70.907"/>
					</TrackLine>
					<TrackLine>
						<End x="232.45" y="69.15"/>
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
					<Start x="221.65" y="113.9"/>
					<TrackLine>
						<End x="221.6782" y="113.873"/>
					</TrackLine>
					<TrackLine>
						<End x="222.1104" y="113.7348"/>
					</TrackLine>
					<TrackLine>
						<End x="222.7603" y="113.4654"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9902" y="113.3276"/>
					</TrackLine>
					<TrackLine>
						<End x="223.9942" y="112.6921"/>
					</TrackLine>
					<TrackLine>
						<End x="225.1921" y="111.4942"/>
					</TrackLine>
					<TrackLine>
						<End x="225.2488" y="111.3995"/>
					</TrackLine>
					<TrackLine>
						<End x="227.9" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD1"/>
				<Subwire width="0.3">
					<Start x="216.65" y="115.4"/>
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
					<Start x="210.4" y="89.15"/>
					<TrackLine>
						<End x="209.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA18"/>
				<Subwire width="0.3">
					<Start x="211.65" y="94.15"/>
					<TrackLine>
						<End x="210.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REST"/>
				<Subwire width="0.3">
					<Start x="181.1" y="47.2"/>
					<TrackLine>
						<End x="179.7672" y="47.65"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2975" y="47.8446"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1946" y="48.9475"/>
					</TrackLine>
					<TrackLine>
						<End x="178" y="49.4172"/>
					</TrackLine>
					<TrackLine>
						<End x="177.15" y="52.5308"/>
					</TrackLine>
					<TrackLine>
						<End x="177.15" y="52.8"/>
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
						<End x="172.1" y="60.1"/>
					</TrackLine>
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
						<End x="161.0962" y="60.7582"/>
					</TrackLine>
					<TrackLine>
						<End x="161.0699" y="60.7143"/>
					</TrackLine>
					<TrackLine>
						<End x="160.8625" y="60.2142"/>
					</TrackLine>
					<TrackLine>
						<End x="160.85" y="60.1645"/>
					</TrackLine>
					<TrackLine>
						<End x="159.95" y="43.7842"/>
					</TrackLine>
					<TrackLine>
						<End x="159.9" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="159.9" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="159.9" y="35.25"/>
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
						<End x="170.6364" y="63.84"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8308" y="64"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1" y="64"/>
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
						<End x="170.35" y="38.9158"/>
					</TrackLine>
					<TrackLine>
						<End x="170.9" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="170.9" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="170.9" y="35.25"/>
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
						<End x="189.0377" y="72.3696"/>
					</TrackLine>
					<TrackLine>
						<End x="188.9684" y="71.9356"/>
					</TrackLine>
					<TrackLine>
						<End x="188.85" y="71.3135"/>
					</TrackLine>
					<TrackLine>
						<End x="188.85" y="70.65"/>
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
						<End x="194.55" y="86.0933"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="89.8433"/>
					</TrackLine>
					<TrackLine>
						<End x="195.9261" y="90.1476"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9024" y="91.1239"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2067" y="91.25"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1678" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="93.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="94.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="203.6322" y="95.4"/>
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
						<End x="197.9" y="84.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6322" y="84.15"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3555" y="82.0543"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3658" y="82.05"/>
					</TrackLine>
					<TrackLine>
						<End x="208.4342" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="214.6678" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="78.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="77.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="215.8" y="70.9567"/>
					</TrackLine>
					<TrackLine>
						<End x="216.55" y="66.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="216.5619" y="66.0772"/>
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
						<End x="208.6239" y="98.8976"/>
					</TrackLine>
					<TrackLine>
						<End x="207.6476" y="99.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="207.3433" y="100"/>
					</TrackLine>
					<TrackLine>
						<End x="201.9928" y="100.45"/>
					</TrackLine>
					<TrackLine>
						<End x="199.9706" y="100.75"/>
					</TrackLine>
					<TrackLine>
						<End x="198.3294" y="100.75"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2701" y="100.7351"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4342" y="99.1"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3985" y="99.05"/>
					</TrackLine>
					<TrackLine>
						<End x="190.9015" y="99.05"/>
					</TrackLine>
					<TrackLine>
						<End x="190.5015" y="99.05"/>
					</TrackLine>
					<TrackLine>
						<End x="189.7869" y="99.1667"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5131" y="99.1667"/>
					</TrackLine>
					<TrackLine>
						<End x="188.3129" y="99.0838"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8822" y="96.65"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="95.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="94.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7" y="80.3758"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7043" y="80.3655"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6109" y="77.3857"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6253" y="77.3615"/>
					</TrackLine>
					<TrackLine>
						<End x="183.8261" y="76.8773"/>
					</TrackLine>
					<TrackLine>
						<End x="183.833" y="76.85"/>
					</TrackLine>
					<TrackLine>
						<End x="183.833" y="76.8165"/>
					</TrackLine>
					<TrackLine>
						<End x="183.8377" y="74.6433"/>
					</TrackLine>
					<TrackLine>
						<End x="183.8377" y="72.8567"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6904" y="72.1653"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="71.9124"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="70.65"/>
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
						<End x="183.0822" y="41.8"/>
					</TrackLine>
					<TrackLine>
						<End x="185.2178" y="41.8"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7145" y="42.4"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7642" y="42.4125"/>
					</TrackLine>
					<TrackLine>
						<End x="189.2643" y="42.6199"/>
					</TrackLine>
					<TrackLine>
						<End x="189.3082" y="42.6462"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1445" y="47.4043"/>
					</TrackLine>
					<TrackLine>
						<End x="196.8957" y="48.1555"/>
					</TrackLine>
					<TrackLine>
						<End x="198.4261" y="51.3976"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6457" y="51.8055"/>
					</TrackLine>
					<TrackLine>
						<End x="198.65" y="51.8158"/>
					</TrackLine>
					<TrackLine>
						<End x="198.65" y="52.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="198.65" y="57.1342"/>
					</TrackLine>
					<TrackLine>
						<End x="198.35" y="59.4471"/>
					</TrackLine>
					<TrackLine>
						<End x="197.6471" y="60.15"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2529" y="60.15"/>
					</TrackLine>
					<TrackLine>
						<End x="196.0692" y="60.75"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="60.75"/>
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
						<End x="180.4" y="70.65"/>
					</TrackLine>
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
						<End x="193.4" y="54.6692"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4" y="54.4"/>
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
						<End x="191.65" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="191.55" y="85.7342"/>
					</TrackLine>
					<TrackLine>
						<End x="191.41" y="77.2666"/>
					</TrackLine>
					<TrackLine>
						<End x="190.15" y="70.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="190.15" y="70.65"/>
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
						<End x="172.9" y="109.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="115.9178"/>
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
						<End x="208.5834" y="82.4"/>
					</TrackLine>
					<TrackLine>
						<End x="219.6626" y="79.1375"/>
					</TrackLine>
					<TrackLine>
						<End x="220.3875" y="78.4126"/>
					</TrackLine>
					<TrackLine>
						<End x="220.3875" y="77.3874"/>
					</TrackLine>
					<TrackLine>
						<End x="219.25" y="73.6059"/>
					</TrackLine>
					<TrackLine>
						<End x="219.2381" y="73.5772"/>
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
						<End x="178.5772" y="111.7381"/>
					</TrackLine>
					<TrackLine>
						<End x="178.6059" y="111.75"/>
					</TrackLine>
					<TrackLine>
						<End x="180.9567" y="112.5"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2701" y="113.2351"/>
					</TrackLine>
					<TrackLine>
						<End x="183.3294" y="113.25"/>
					</TrackLine>
					<TrackLine>
						<End x="185.2067" y="113.25"/>
					</TrackLine>
					<TrackLine>
						<End x="186.5933" y="113.25"/>
					</TrackLine>
					<TrackLine>
						<End x="188.0933" y="113.25"/>
					</TrackLine>
					<TrackLine>
						<End x="190.9601" y="112.8672"/>
					</TrackLine>
					<TrackLine>
						<End x="191.9399" y="112.8672"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1275" y="112.8984"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2119" y="112.95"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0881" y="112.95"/>
					</TrackLine>
					<TrackLine>
						<End x="220.0881" y="112.95"/>
					</TrackLine>
					<TrackLine>
						<End x="220.3289" y="112.8895"/>
					</TrackLine>
					<TrackLine>
						<End x="220.6565" y="112.8002"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7268" y="112.8002"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7957" y="112.7829"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3095" y="112.5699"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3704" y="112.5334"/>
					</TrackLine>
					<TrackLine>
						<End x="223.3976" y="111.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="224.3739" y="110.8976"/>
					</TrackLine>
					<TrackLine>
						<End x="224.5" y="110.5933"/>
					</TrackLine>
					<TrackLine>
						<End x="226" y="98.906"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6667" y="93.2778"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6667" y="91.4222"/>
					</TrackLine>
					<TrackLine>
						<End x="226.55" y="88.4441"/>
					</TrackLine>
					<TrackLine>
						<End x="226.55" y="87.3559"/>
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
					<Start x="205.4" y="89.15"/>
					<TrackLine>
						<End x="204.15" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA20"/>
				<Subwire width="0.3">
					<Start x="206.65" y="94.15"/>
					<TrackLine>
						<End x="205.4" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DCLO"/>
				<Subwire width="0.3">
					<Start x="181.65" y="110.4"/>
					<TrackLine>
						<End x="183.5772" y="111.7381"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6059" y="111.75"/>
					</TrackLine>
					<TrackLine>
						<End x="185.6515" y="111.75"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1485" y="111.75"/>
					</TrackLine>
					<TrackLine>
						<End x="187.6485" y="111.75"/>
					</TrackLine>
					<TrackLine>
						<End x="190.6874" y="111.6016"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2126" y="111.6016"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3894" y="111.6328"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4106" y="111.6328"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2119" y="111.6"/>
					</TrackLine>
					<TrackLine>
						<End x="219.9129" y="111.6"/>
					</TrackLine>
					<TrackLine>
						<End x="220.3087" y="111.4781"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4356" y="111.4462"/>
					</TrackLine>
					<TrackLine>
						<End x="221.4541" y="111.3004"/>
					</TrackLine>
					<TrackLine>
						<End x="221.5013" y="111.2809"/>
					</TrackLine>
					<TrackLine>
						<End x="222.6485" y="110.5"/>
					</TrackLine>
					<TrackLine>
						<End x="223" y="110.1485"/>
					</TrackLine>
					<TrackLine>
						<End x="225.4" y="93.1129"/>
					</TrackLine>
					<TrackLine>
						<End x="225.4" y="91.5871"/>
					</TrackLine>
					<TrackLine>
						<End x="225.05" y="88.7206"/>
					</TrackLine>
					<TrackLine>
						<End x="225.05" y="87.0794"/>
					</TrackLine>
					<TrackLine>
						<End x="225.15" y="84.5166"/>
					</TrackLine>
					<TrackLine>
						<End x="225.2684" y="84.2307"/>
					</TrackLine>
					<TrackLine>
						<End x="225.6239" y="83.3976"/>
					</TrackLine>
					<TrackLine>
						<End x="225.75" y="83.0933"/>
					</TrackLine>
					<TrackLine>
						<End x="226.45" y="74.8658"/>
					</TrackLine>
					<TrackLine>
						<End x="226.4543" y="74.8555"/>
					</TrackLine>
					<TrackLine>
						<End x="229.15" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="229.8822" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="230.9178" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="231.65" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="231.75" y="73.6059"/>
					</TrackLine>
					<TrackLine>
						<End x="231.75" y="74.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="231.75" y="77.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="231.7381" y="77.2228"/>
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
						<End x="181.07" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="181.07" y="120.9261"/>
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
					<Start x="217.9" y="89.15"/>
					<TrackLine>
						<End x="217.05" y="86.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BWTBT"/>
				<Subwire width="0.3">
					<Start x="219.15" y="94.15"/>
					<TrackLine>
						<End x="217.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="161.25" y="43.25"/>
					<TrackLine>
						<End x="161.6" y="60.0334"/>
					</TrackLine>
					<TrackLine>
						<End x="161.7184" y="60.3193"/>
					</TrackLine>
					<TrackLine>
						<End x="162.6807" y="61.2816"/>
					</TrackLine>
					<TrackLine>
						<End x="163.9186" y="62.298"/>
					</TrackLine>
					<TrackLine>
						<End x="164.652" y="63.0314"/>
					</TrackLine>
					<TrackLine>
						<End x="164.652" y="64.0686"/>
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
						<End x="174.9645" y="75.25"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0142" y="75.2625"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5143" y="75.4699"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5582" y="75.4962"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7038" y="76.6418"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7301" y="76.6857"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9375" y="77.1858"/>
					</TrackLine>
					<TrackLine>
						<End x="176.95" y="77.2355"/>
					</TrackLine>
					<TrackLine>
						<End x="176.95" y="78.8645"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9375" y="78.9142"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7301" y="79.4143"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7038" y="79.4582"/>
					</TrackLine>
					<TrackLine>
						<End x="176.4543" y="79.8055"/>
					</TrackLine>
					<TrackLine>
						<End x="176.45" y="79.8158"/>
					</TrackLine>
					<TrackLine>
						<End x="176.45" y="80.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="176.4543" y="80.8945"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2055" y="81.6457"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2158" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2842" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2945" y="81.6457"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0457" y="80.8945"/>
					</TrackLine>
					<TrackLine>
						<End x="182.411" y="76.5723"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4393" y="74.4312"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4393" y="73.0688"/>
					</TrackLine>
					<TrackLine>
						<End x="182.35" y="72.0155"/>
					</TrackLine>
					<TrackLine>
						<End x="182.35" y="70.65"/>
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
						<End x="170.4" y="109.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4" y="115.9178"/>
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
						<End x="169.15" y="99.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8822" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="172.3559" y="99.05"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4441" y="99.05"/>
					</TrackLine>
					<TrackLine>
						<End x="175.9178" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="176.65" y="99.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="176.65" y="100.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3822" y="101.65"/>
					</TrackLine>
					<TrackLine>
						<End x="179.7067" y="102.5"/>
					</TrackLine>
					<TrackLine>
						<End x="182.0201" y="103.2351"/>
					</TrackLine>
					<TrackLine>
						<End x="182.0794" y="103.25"/>
					</TrackLine>
					<TrackLine>
						<End x="188.9567" y="103.25"/>
					</TrackLine>
					<TrackLine>
						<End x="190.3433" y="103.25"/>
					</TrackLine>
					<TrackLine>
						<End x="191.8433" y="103.25"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7145" y="103.2"/>
					</TrackLine>
					<TrackLine>
						<End x="200.2487" y="103"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3658" y="102.7"/>
					</TrackLine>
					<TrackLine>
						<End x="207.656" y="102.25"/>
					</TrackLine>
					<TrackLine>
						<End x="222.1941" y="99.25"/>
					</TrackLine>
					<TrackLine>
						<End x="222.2228" y="99.2381"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9881" y="98.4728"/>
					</TrackLine>
					<TrackLine>
						<End x="223" y="98.4441"/>
					</TrackLine>
					<TrackLine>
						<End x="224.1333" y="92.8401"/>
					</TrackLine>
					<TrackLine>
						<End x="224.1333" y="91.8599"/>
					</TrackLine>
					<TrackLine>
						<End x="223.55" y="88.906"/>
					</TrackLine>
					<TrackLine>
						<End x="223.55" y="86.894"/>
					</TrackLine>
					<TrackLine>
						<End x="223.65" y="84.2928"/>
					</TrackLine>
					<TrackLine>
						<End x="223.6985" y="84.0998"/>
					</TrackLine>
					<TrackLine>
						<End x="224.25" y="82.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="224.25" y="81.1485"/>
					</TrackLine>
					<TrackLine>
						<End x="224.25" y="80.6515"/>
					</TrackLine>
					<TrackLine>
						<End x="224.25" y="76.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="224.2381" y="76.0772"/>
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
						<End x="179.1" y="70.65"/>
					</TrackLine>
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
						<End x="192.16" y="77.1355"/>
					</TrackLine>
					<TrackLine>
						<End x="191.45" y="71.3135"/>
					</TrackLine>
					<TrackLine>
						<End x="191.45" y="70.65"/>
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
						<End x="161.25" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="161.25" y="35.25"/>
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
						<End x="173.65" y="42.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6543" y="42.8945"/>
					</TrackLine>
					<TrackLine>
						<End x="174.4055" y="43.6457"/>
					</TrackLine>
					<TrackLine>
						<End x="174.4158" y="43.65"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4842" y="43.65"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1749" y="42.55"/>
					</TrackLine>
					<TrackLine>
						<End x="185.1251" y="42.55"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5834" y="43.15"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8693" y="43.2684"/>
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
						<End x="201.75" y="49.8559"/>
					</TrackLine>
					<TrackLine>
						<End x="201.75" y="50.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="200.6609" y="55.1406"/>
					</TrackLine>
					<TrackLine>
						<End x="200.55" y="55.5822"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8" y="62.0334"/>
					</TrackLine>
					<TrackLine>
						<End x="199.6816" y="62.3193"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7193" y="63.2816"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3445" y="64.6457"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3342" y="64.65"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="64.65"/>
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
						<End x="189.6" y="59.6334"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6" y="58.2666"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5" y="54.6692"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5" y="54.4"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD12"/>
				<Subwire width="0.3">
					<Start x="182.9" y="117.2"/>
					<TrackLine>
						<End x="187.42" y="120.4"/>
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
				<NetRef name="A9"/>
				<Subwire width="0.3">
					<Start x="181.91" y="32.6"/>
					<TrackLine>
						<End x="182.76" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="182.76" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="182.76" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="182.85" y="35.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2015" y="36"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2658" y="40.05"/>
					</TrackLine>
					<TrackLine>
						<End x="206.2485" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="206.3604" y="40.392"/>
					</TrackLine>
					<TrackLine>
						<End x="206.658" y="40.6896"/>
					</TrackLine>
					<TrackLine>
						<End x="206.658" y="41.1104"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="41.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="42.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="206.658" y="42.1896"/>
					</TrackLine>
					<TrackLine>
						<End x="206.7" y="45.5658"/>
					</TrackLine>
					<TrackLine>
						<End x="206.7" y="46.6342"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="48.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="49.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="206.675" y="56.1219"/>
					</TrackLine>
					<TrackLine>
						<End x="206.675" y="57.1781"/>
					</TrackLine>
					<TrackLine>
						<End x="206.5" y="58.4158"/>
					</TrackLine>
					<TrackLine>
						<End x="206.5" y="59.4842"/>
					</TrackLine>
					<TrackLine>
						<End x="206.7" y="61.1158"/>
					</TrackLine>
					<TrackLine>
						<End x="206.7" y="62.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="206.6957" y="62.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="202.8995" y="67.1732"/>
					</TrackLine>
					<TrackLine>
						<End x="201.6232" y="68.4495"/>
					</TrackLine>
					<TrackLine>
						<End x="201.4524" y="68.5519"/>
					</TrackLine>
					<TrackLine>
						<End x="200.8502" y="68.8015"/>
					</TrackLine>
					<TrackLine>
						<End x="200.6572" y="68.85"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4" y="69.05"/>
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
					<Start x="194.35" y="116.85"/>
					<TrackLine>
						<End x="189.96" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="184.15" y="105.4"/>
					<TrackLine>
						<End x="186.0772" y="106.7381"/>
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
						<End x="174.1" y="106.1158"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1" y="107.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1043" y="107.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8555" y="107.9457"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8658" y="107.95"/>
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
						<End x="193.1308" y="52.15"/>
					</TrackLine>
					<TrackLine>
						<End x="192.75" y="52.5308"/>
					</TrackLine>
					<TrackLine>
						<End x="192.75" y="52.8"/>
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
						<End x="215.8" y="55.9567"/>
					</TrackLine>
					<TrackLine>
						<End x="215.8" y="57.3433"/>
					</TrackLine>
					<TrackLine>
						<End x="216.55" y="59.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="216.5619" y="59.7228"/>
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
						<End x="171.45" y="55.9308"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8308" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1" y="55.55"/>
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
						<End x="175.1699" y="81.7143"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9625" y="81.2142"/>
					</TrackLine>
					<TrackLine>
						<End x="174.95" y="81.1645"/>
					</TrackLine>
					<TrackLine>
						<End x="174.95" y="79.5355"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9625" y="79.4858"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1699" y="78.9857"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1962" y="78.9418"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4457" y="78.5945"/>
					</TrackLine>
					<TrackLine>
						<End x="175.45" y="78.5842"/>
					</TrackLine>
					<TrackLine>
						<End x="175.45" y="77.5158"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4457" y="77.5055"/>
					</TrackLine>
					<TrackLine>
						<End x="174.6945" y="76.7543"/>
					</TrackLine>
					<TrackLine>
						<End x="174.6842" y="76.75"/>
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
						<End x="196.0692" y="56.2"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="56.2"/>
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
						<End x="161.1639" y="76.71"/>
					</TrackLine>
					<TrackLine>
						<End x="162.2161" y="76.71"/>
					</TrackLine>
					<TrackLine>
						<End x="164.0555" y="74.9543"/>
					</TrackLine>
					<TrackLine>
						<End x="164.0658" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="165.1342" y="74.95"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8334" y="76"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1193" y="76.1184"/>
					</TrackLine>
					<TrackLine>
						<End x="176.0816" y="77.0807"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2" y="77.3666"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2" y="78.7334"/>
					</TrackLine>
					<TrackLine>
						<End x="176.0816" y="79.0193"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8184" y="79.3807"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7" y="79.6666"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7" y="81.0334"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8184" y="81.3193"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7807" y="82.2816"/>
					</TrackLine>
					<TrackLine>
						<End x="177.0666" y="82.4"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4334" y="82.4"/>
					</TrackLine>
					<TrackLine>
						<End x="178.7193" y="82.2816"/>
					</TrackLine>
					<TrackLine>
						<End x="179.6816" y="81.3193"/>
					</TrackLine>
					<TrackLine>
						<End x="183.0154" y="76.9751"/>
					</TrackLine>
					<TrackLine>
						<End x="183.122" y="76.7178"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1839" y="74.5625"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1839" y="72.9375"/>
					</TrackLine>
					<TrackLine>
						<End x="183.053" y="72.296"/>
					</TrackLine>
					<TrackLine>
						<End x="183" y="71.9639"/>
					</TrackLine>
					<TrackLine>
						<End x="183" y="70.65"/>
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
						<End x="204.8" y="42.25"/>
					</TrackLine>
					<TrackLine>
						<End x="204.8" y="42.4"/>
					</TrackLine>
					<TrackLine>
						<End x="204.8" y="42.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="204.1" y="45.5658"/>
					</TrackLine>
					<TrackLine>
						<End x="204.1" y="46.6342"/>
					</TrackLine>
					<TrackLine>
						<End x="204.15" y="47.9271"/>
					</TrackLine>
					<TrackLine>
						<End x="204.15" y="49.4729"/>
					</TrackLine>
					<TrackLine>
						<End x="204" y="51.3133"/>
					</TrackLine>
					<TrackLine>
						<End x="203.9491" y="51.516"/>
					</TrackLine>
					<TrackLine>
						<End x="202.8029" y="55.8488"/>
					</TrackLine>
					<TrackLine>
						<End x="202.8" y="55.8603"/>
					</TrackLine>
					<TrackLine>
						<End x="202.55" y="66.1145"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5375" y="66.1642"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3301" y="66.6643"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3038" y="66.7082"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1582" y="67.8538"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1143" y="67.8801"/>
					</TrackLine>
					<TrackLine>
						<End x="200.6142" y="68.0875"/>
					</TrackLine>
					<TrackLine>
						<End x="200.5645" y="68.1"/>
					</TrackLine>
					<TrackLine>
						<End x="198.9355" y="68.1"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="67.9"/>
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
						<End x="230.8055" y="46.5543"/>
					</TrackLine>
					<TrackLine>
						<End x="235.7225" y="44.2507"/>
					</TrackLine>
					<TrackLine>
						<End x="236.3907" y="43.5825"/>
					</TrackLine>
					<TrackLine>
						<End x="236.3907" y="42.6375"/>
					</TrackLine>
					<TrackLine>
						<End x="233.56" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="233.56" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="233.56" y="35.25"/>
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
						<End x="229.32" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="229.32" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="229.32" y="35.25"/>
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
						<End x="226.65" y="42.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="226.65" y="41.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6" y="39.2842"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6" y="38.2158"/>
					</TrackLine>
					<TrackLine>
						<End x="226.78" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="226.78" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="226.78" y="35.25"/>
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
						<End x="216.65" y="42.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="35.25"/>
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
						<End x="176.8808" y="55.05"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5" y="54.6692"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5" y="54.4"/>
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
						<End x="184.25" y="81.4278"/>
					</TrackLine>
					<TrackLine>
						<End x="184.25" y="81.3541"/>
					</TrackLine>
					<TrackLine>
						<End x="184.544" y="76.9379"/>
					</TrackLine>
					<TrackLine>
						<End x="184.544" y="76.8864"/>
					</TrackLine>
					<TrackLine>
						<End x="184.5699" y="74.7338"/>
					</TrackLine>
					<TrackLine>
						<End x="184.5699" y="72.7662"/>
					</TrackLine>
					<TrackLine>
						<End x="184.4084" y="72.0182"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3822" y="71.8542"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3" y="71.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3" y="70.65"/>
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
						<End x="186.65" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="186.51" y="89.7358"/>
					</TrackLine>
					<TrackLine>
						<End x="186.51" y="90.8042"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="94.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="95.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9667" y="97.8401"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6599" y="98.5333"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6401" y="98.5333"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2059" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="190.6059" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="191.6941" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5834" y="98.35"/>
					</TrackLine>
					<TrackLine>
						<End x="198.4567" y="100"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8433" y="100"/>
					</TrackLine>
					<TrackLine>
						<End x="200.1476" y="99.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1239" y="98.8976"/>
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
					<Start x="212.9" y="89.15"/>
					<TrackLine>
						<End x="211.65" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA17"/>
				<Subwire width="0.3">
					<Start x="214.15" y="94.15"/>
					<TrackLine>
						<End x="212.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD15"/>
				<Subwire width="0.3">
					<Start x="182.3" y="56.85"/>
					<TrackLine>
						<End x="183.65" y="54.6692"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="54.4"/>
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
					<Start x="227.75" y="80.4"/>
					<TrackLine>
						<End x="227.75" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IAKO"/>
				<Subwire width="0.3">
					<Start x="197.35" y="52.35"/>
					<TrackLine>
						<End x="197.4" y="53.0658"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4" y="54.1342"/>
					</TrackLine>
					<TrackLine>
						<End x="197.3957" y="54.1445"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6445" y="54.8957"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="55.55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="174.15" y="78.05"/>
					<TrackLine>
						<End x="174.2" y="81.2572"/>
					</TrackLine>
					<TrackLine>
						<End x="174.65" y="83.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="174.6543" y="83.8945"/>
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
					<Start x="188.11" y="80.91"/>
					<TrackLine>
						<End x="187.388" y="78.6178"/>
					</TrackLine>
					<TrackLine>
						<End x="187.388" y="77.2822"/>
					</TrackLine>
					<TrackLine>
						<End x="187.6501" y="75.0203"/>
					</TrackLine>
					<TrackLine>
						<End x="187.6501" y="72.4797"/>
					</TrackLine>
					<TrackLine>
						<End x="187.55" y="71.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="187.55" y="70.65"/>
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
						<End x="182.49" y="84.5958"/>
					</TrackLine>
					<TrackLine>
						<End x="182.49" y="85.6642"/>
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
						<End x="181.0772" y="111.7381"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1059" y="111.75"/>
					</TrackLine>
					<TrackLine>
						<End x="183.4567" y="112.5"/>
					</TrackLine>
					<TrackLine>
						<End x="185.3559" y="112.5"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4441" y="112.5"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9441" y="112.5"/>
					</TrackLine>
					<TrackLine>
						<End x="190.8133" y="112.2344"/>
					</TrackLine>
					<TrackLine>
						<End x="192.0867" y="112.2344"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2533" y="112.2656"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2954" y="112.275"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0046" y="112.275"/>
					</TrackLine>
					<TrackLine>
						<End x="220.0046" y="112.275"/>
					</TrackLine>
					<TrackLine>
						<End x="220.1165" y="112.2469"/>
					</TrackLine>
					<TrackLine>
						<End x="220.5214" y="112.1212"/>
					</TrackLine>
					<TrackLine>
						<End x="221.2103" y="112.0503"/>
					</TrackLine>
					<TrackLine>
						<End x="221.6033" y="112.0503"/>
					</TrackLine>
					<TrackLine>
						<End x="221.9261" y="111.9166"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9728" y="111.2381"/>
					</TrackLine>
					<TrackLine>
						<End x="223.7381" y="110.4728"/>
					</TrackLine>
					<TrackLine>
						<End x="223.75" y="110.4441"/>
					</TrackLine>
					<TrackLine>
						<End x="226.0333" y="93.1995"/>
					</TrackLine>
					<TrackLine>
						<End x="226.0333" y="91.5005"/>
					</TrackLine>
					<TrackLine>
						<End x="225.8" y="88.5933"/>
					</TrackLine>
					<TrackLine>
						<End x="225.8" y="87.2067"/>
					</TrackLine>
					<TrackLine>
						<End x="225.9" y="84.6658"/>
					</TrackLine>
					<TrackLine>
						<End x="225.9043" y="84.6555"/>
					</TrackLine>
					<TrackLine>
						<End x="229.0457" y="80.9445"/>
					</TrackLine>
					<TrackLine>
						<End x="229.05" y="80.9342"/>
					</TrackLine>
					<TrackLine>
						<End x="229.05" y="73.6059"/>
					</TrackLine>
					<TrackLine>
						<End x="229.0619" y="73.5772"/>
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
						<End x="178.53" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="178.53" y="120.9261"/>
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
						<End x="163.28" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="163.28" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="163.28" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="162.35" y="37.9658"/>
					</TrackLine>
					<TrackLine>
						<End x="162.35" y="39.0342"/>
					</TrackLine>
					<TrackLine>
						<End x="162.55" y="40.3658"/>
					</TrackLine>
					<TrackLine>
						<End x="162.55" y="41.4342"/>
					</TrackLine>
					<TrackLine>
						<End x="162.55" y="43.7842"/>
					</TrackLine>
					<TrackLine>
						<End x="162.35" y="58.8158"/>
					</TrackLine>
					<TrackLine>
						<End x="162.35" y="59.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="162.3543" y="59.8945"/>
					</TrackLine>
					<TrackLine>
						<End x="163.1055" y="60.6457"/>
					</TrackLine>
					<TrackLine>
						<End x="164.315" y="61.6997"/>
					</TrackLine>
					<TrackLine>
						<End x="165.2503" y="62.635"/>
					</TrackLine>
					<TrackLine>
						<End x="165.3541" y="62.8857"/>
					</TrackLine>
					<TrackLine>
						<End x="165.3833" y="63.7407"/>
					</TrackLine>
					<TrackLine>
						<End x="165.4254" y="63.9083"/>
					</TrackLine>
					<TrackLine>
						<End x="165.6675" y="64.4923"/>
					</TrackLine>
					<TrackLine>
						<End x="165.7564" y="64.6405"/>
					</TrackLine>
					<TrackLine>
						<End x="167.0095" y="65.8936"/>
					</TrackLine>
					<TrackLine>
						<End x="167.1577" y="65.9825"/>
					</TrackLine>
					<TrackLine>
						<End x="167.7417" y="66.2246"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8308" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1" y="67.9"/>
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
						<End x="186.81" y="81.4442"/>
					</TrackLine>
					<TrackLine>
						<End x="186.677" y="78.75"/>
					</TrackLine>
					<TrackLine>
						<End x="186.677" y="77.15"/>
					</TrackLine>
					<TrackLine>
						<End x="186.907" y="74.9613"/>
					</TrackLine>
					<TrackLine>
						<End x="186.907" y="72.5387"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9" y="71.3135"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9" y="70.65"/>
					</TrackLine>
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
						<End x="187.82" y="85.8054"/>
					</TrackLine>
					<TrackLine>
						<End x="187.1346" y="85.12"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9654" y="85.12"/>
					</TrackLine>
					<TrackLine>
						<End x="186.28" y="84.4346"/>
					</TrackLine>
					<TrackLine>
						<End x="185.65" y="82.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="185.65" y="81.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="185.966" y="77.1136"/>
					</TrackLine>
					<TrackLine>
						<End x="185.966" y="77.0621"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1624" y="74.9022"/>
					</TrackLine>
					<TrackLine>
						<End x="186.25" y="70.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="186.25" y="70.65"/>
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
						<End x="180.6358" y="65.65"/>
					</TrackLine>
					<TrackLine>
						<End x="180.05" y="66.2358"/>
					</TrackLine>
					<TrackLine>
						<End x="179.75" y="68.7808"/>
					</TrackLine>
					<TrackLine>
						<End x="179.75" y="69.05"/>
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
						<End x="222.1945" y="47.5957"/>
					</TrackLine>
					<TrackLine>
						<End x="222.9457" y="46.8445"/>
					</TrackLine>
					<TrackLine>
						<End x="222.95" y="46.8342"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="42.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="41.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="224.24" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="224.24" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="224.24" y="35.25"/>
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
						<End x="187.55" y="54.4"/>
					</TrackLine>
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
						<End x="189.4057" y="81.4545"/>
					</TrackLine>
					<TrackLine>
						<End x="189.41" y="81.4442"/>
					</TrackLine>
					<TrackLine>
						<End x="189.41" y="80.3758"/>
					</TrackLine>
					<TrackLine>
						<End x="189.4057" y="80.3655"/>
					</TrackLine>
					<TrackLine>
						<End x="188.099" y="78.4723"/>
					</TrackLine>
					<TrackLine>
						<End x="188.099" y="77.4277"/>
					</TrackLine>
					<TrackLine>
						<End x="188.3324" y="75.0745"/>
					</TrackLine>
					<TrackLine>
						<End x="188.3324" y="72.4255"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2" y="70.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2" y="70.65"/>
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
						<End x="198.85" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="198.85" y="120.9261"/>
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
						<End x="214.7228" y="99.2381"/>
					</TrackLine>
					<TrackLine>
						<End x="214.6941" y="99.25"/>
					</TrackLine>
					<TrackLine>
						<End x="212.3433" y="100"/>
					</TrackLine>
					<TrackLine>
						<End x="207.766" y="101.4491"/>
					</TrackLine>
					<TrackLine>
						<End x="207.5633" y="101.5"/>
					</TrackLine>
					<TrackLine>
						<End x="202.2166" y="101.95"/>
					</TrackLine>
					<TrackLine>
						<End x="200.156" y="102.25"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5834" y="102.45"/>
					</TrackLine>
					<TrackLine>
						<End x="191.6941" y="102.5"/>
					</TrackLine>
					<TrackLine>
						<End x="190.1941" y="102.5"/>
					</TrackLine>
					<TrackLine>
						<End x="189.1059" y="102.5"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2067" y="102.5"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8822" y="101.65"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="100.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="99.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4178" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="176.0933" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6158" y="97.95"/>
					</TrackLine>
					<TrackLine>
						<End x="165.8672" y="95.6"/>
					</TrackLine>
					<TrackLine>
						<End x="165.3975" y="95.4054"/>
					</TrackLine>
					<TrackLine>
						<End x="164.2946" y="94.3025"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9136" y="83.5721"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9136" y="73.4121"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9136" y="72.3879"/>
					</TrackLine>
					<TrackLine>
						<End x="158.6379" y="71.6636"/>
					</TrackLine>
					<TrackLine>
						<End x="162.6055" y="68.4543"/>
					</TrackLine>
					<TrackLine>
						<End x="162.6158" y="68.45"/>
					</TrackLine>
					<TrackLine>
						<End x="163.6842" y="68.45"/>
					</TrackLine>
					<TrackLine>
						<End x="171.5459" y="68.65"/>
					</TrackLine>
					<TrackLine>
						<End x="171.7893" y="68.65"/>
					</TrackLine>
					<TrackLine>
						<End x="172.4107" y="68.65"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9926" y="68.6064"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3086" y="68.4671"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1127" y="68.4671"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5808" y="68.4"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1192" y="68.4"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5" y="68.7808"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5" y="69.05"/>
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
						<End x="210.9261" y="48.1524"/>
					</TrackLine>
					<TrackLine>
						<End x="214.15" y="42.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="214.15" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="214.15" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="214.93" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="219.15" y="77.9"/>
					<TrackLine>
						<End x="217.9" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="167.35" y="61.4"/>
							<Dot x="167.4507" y="61.1712"/>
							<Dot x="167.9499" y="61.3909"/>
							<Dot x="167.4575" y="61.6256"/>
						</Teardrop>
					</Teardrops>
					<Start x="172.9" y="61.4"/>
					<TrackLine>
						<End x="172.1" y="61.4"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8308" y="61.4"/>
					</TrackLine>
					<TrackLine>
						<End x="171.6678" y="61.35"/>
					</TrackLine>
					<TrackLine>
						<End x="170.6322" y="61.35"/>
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
					<Start x="190.8" y="68.25"/>
					<TrackLine>
						<End x="190.5642" y="68.05"/>
					</TrackLine>
					<TrackLine>
						<End x="189.7358" y="68.05"/>
					</TrackLine>
					<TrackLine>
						<End x="189.1018" y="68.0887"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8041" y="68.2"/>
					</TrackLine>
					<TrackLine>
						<End x="187.6959" y="68.2"/>
					</TrackLine>
					<TrackLine>
						<End x="187.6489" y="68.1805"/>
					</TrackLine>
					<TrackLine>
						<End x="185.8784" y="66.6038"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7812" y="66.5635"/>
					</TrackLine>
					<TrackLine>
						<End x="184.6188" y="66.5635"/>
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
							<Dot x="167.35" y="61.4"/>
							<Dot x="167.5906" y="61.4677"/>
							<Dot x="167.4428" y="61.9928"/>
							<Dot x="167.1416" y="61.5381"/>
						</Teardrop>
					</Teardrops>
					<Start x="167.35" y="61.4"/>
					<TrackLine>
						<End x="167.5333" y="62.5707"/>
					</TrackLine>
					<TrackLine>
						<End x="167.5333" y="63.3747"/>
					</TrackLine>
					<TrackLine>
						<End x="168.2753" y="64.1167"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4905" y="64.53"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8308" y="64.65"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1" y="64.65"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="64.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="231.35" y="52.2"/>
					<TrackLine>
						<End x="235.9863" y="63.064"/>
					</TrackLine>
					<TrackLine>
						<End x="236.1361" y="63.4256"/>
					</TrackLine>
					<TrackLine>
						<End x="236.1361" y="64.8744"/>
					</TrackLine>
					<TrackLine>
						<End x="234.75" y="77.656"/>
					</TrackLine>
					<TrackLine>
						<End x="234" y="82.5633"/>
					</TrackLine>
					<TrackLine>
						<End x="233.9491" y="82.766"/>
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
					<Start x="193.25" y="67.35"/>
					<TrackLine>
						<End x="190.8" y="68.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="110.4"/>
					<TrackLine>
						<End x="190.924" y="110.45"/>
					</TrackLine>
					<TrackLine>
						<End x="187.4" y="110.45"/>
					</TrackLine>
					<TrackLine>
						<End x="187" y="110.45"/>
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
						<End x="190.8" y="69.05"/>
					</TrackLine>
					<TrackLine>
						<End x="190.8" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="49.15"/>
					<TrackLine>
						<End x="205" y="51.4369"/>
					</TrackLine>
					<TrackLine>
						<End x="204.9011" y="51.8308"/>
					</TrackLine>
					<TrackLine>
						<End x="203.8" y="56.0562"/>
					</TrackLine>
					<TrackLine>
						<End x="203.8" y="57.2438"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="110.4"/>
					<TrackLine>
						<End x="198.5711" y="110.675"/>
					</TrackLine>
					<TrackLine>
						<End x="199.7289" y="110.675"/>
					</TrackLine>
					<TrackLine>
						<End x="219.7289" y="110.675"/>
					</TrackLine>
					<TrackLine>
						<End x="221.0657" y="110.3"/>
					</TrackLine>
					<TrackLine>
						<End x="221.3" y="110.0657"/>
					</TrackLine>
					<TrackLine>
						<End x="221.3" y="109.9"/>
					</TrackLine>
					<TrackLine>
						<End x="221.3" y="109.5"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="109.15"/>
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
						<End x="181.05" y="69.05"/>
					</TrackLine>
					<TrackLine>
						<End x="181.05" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="185.65" y="51.85"/>
					<TrackLine>
						<End x="185.6" y="52.5308"/>
					</TrackLine>
					<TrackLine>
						<End x="185.6" y="52.8"/>
					</TrackLine>
					<TrackLine>
						<End x="185.6" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="168.5" y="44.7"/>
					<TrackLine>
						<End x="167.25" y="59.3661"/>
					</TrackLine>
					<TrackLine>
						<End x="167.25" y="60.5339"/>
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
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="180.5161" y="45.65"/>
					</TrackLine>
					<TrackLine>
						<End x="183.5562" y="45.05"/>
					</TrackLine>
					<TrackLine>
						<End x="184.7438" y="45.05"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8644" y="45.0999"/>
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
					<Start x="189.15" y="46.65"/>
					<TrackLine>
						<End x="188.4839" y="46.75"/>
					</TrackLine>
					<TrackLine>
						<End x="187.3161" y="46.75"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="175.85" y="52.5308"/>
					</TrackLine>
					<TrackLine>
						<End x="175.85" y="52.8"/>
					</TrackLine>
					<TrackLine>
						<End x="175.85" y="53.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
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
				<Subwire width="0.3">
					<Start x="192.8" y="57.5"/>
					<TrackLine>
						<End x="194.2" y="57.5"/>
					</TrackLine>
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
						<End x="194.2" y="63.35"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="63.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="100.4"/>
					<TrackLine>
						<End x="191.15" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="190.75" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="207.8" y="58.95"/>
					<TrackLine>
						<End x="207.65" y="59.826"/>
					</TrackLine>
					<TrackLine>
						<End x="207.65" y="62.3731"/>
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
					<Start x="165.25" y="44.7"/>
					<TrackLine>
						<End x="165.25" y="37.05"/>
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
				<NetRef name="BAD0"/>
				<Subwire width="0.3">
					<Start x="219.15" y="115.4"/>
					<TrackLine>
						<End x="217.9" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA19"/>
				<Subwire width="0.3">
					<Start x="207.9" y="89.15"/>
					<TrackLine>
						<End x="206.65" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BA19"/>
				<Subwire width="0.3">
					<Start x="209.15" y="94.15"/>
					<TrackLine>
						<End x="207.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A4"/>
				<Subwire width="0.3">
					<Start x="172.9" y="65.3"/>
					<TrackLine>
						<End x="172.1" y="65.3"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8308" y="65.3"/>
					</TrackLine>
					<TrackLine>
						<End x="170.3578" y="65.22"/>
					</TrackLine>
					<TrackLine>
						<End x="168.1299" y="64.8333"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8685" y="64.725"/>
					</TrackLine>
					<TrackLine>
						<End x="166.925" y="63.7815"/>
					</TrackLine>
					<TrackLine>
						<End x="166.8167" y="63.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="166.7582" y="62.6665"/>
					</TrackLine>
					<TrackLine>
						<End x="166.7189" y="62.5101"/>
					</TrackLine>
					<TrackLine>
						<End x="166.4801" y="61.934"/>
					</TrackLine>
					<TrackLine>
						<End x="166.398" y="61.7943"/>
					</TrackLine>
					<TrackLine>
						<End x="166.25" y="60.7328"/>
					</TrackLine>
					<TrackLine>
						<End x="166.25" y="59.1672"/>
					</TrackLine>
					<TrackLine>
						<End x="167.2" y="44.1658"/>
					</TrackLine>
					<TrackLine>
						<End x="168.85" y="36.9842"/>
					</TrackLine>
					<TrackLine>
						<End x="168.85" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="168.85" y="35.25"/>
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
						<End x="184.15" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="185.0857" y="85.6745"/>
					</TrackLine>
					<TrackLine>
						<End x="185.09" y="85.6642"/>
					</TrackLine>
					<TrackLine>
						<End x="185.09" y="84.5958"/>
					</TrackLine>
					<TrackLine>
						<End x="184.95" y="82.8135"/>
					</TrackLine>
					<TrackLine>
						<End x="184.95" y="81.4865"/>
					</TrackLine>
					<TrackLine>
						<End x="185.255" y="77.0258"/>
					</TrackLine>
					<TrackLine>
						<End x="185.255" y="76.9742"/>
					</TrackLine>
					<TrackLine>
						<End x="185.3146" y="74.8258"/>
					</TrackLine>
					<TrackLine>
						<End x="185.3146" y="72.6742"/>
					</TrackLine>
					<TrackLine>
						<End x="185.1386" y="71.8685"/>
					</TrackLine>
					<TrackLine>
						<End x="184.95" y="70.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="184.95" y="70.65"/>
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
						<End x="188.3" y="91.5834"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4184" y="91.8693"/>
					</TrackLine>
					<TrackLine>
						<End x="189.3807" y="92.8316"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6666" y="92.95"/>
					</TrackLine>
					<TrackLine>
						<End x="193.8985" y="94.05"/>
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
						<End x="186.1863" y="62.4121"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4621" y="63.1363"/>
					</TrackLine>
					<TrackLine>
						<End x="180.4263" y="64.9"/>
					</TrackLine>
					<TrackLine>
						<End x="180.2506" y="64.9728"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3728" y="65.8506"/>
					</TrackLine>
					<TrackLine>
						<End x="179.3" y="66.0263"/>
					</TrackLine>
					<TrackLine>
						<End x="178.45" y="68.7808"/>
					</TrackLine>
					<TrackLine>
						<End x="178.45" y="69.05"/>
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
						<End x="165.5" y="60.8263"/>
					</TrackLine>
					<TrackLine>
						<End x="165.6959" y="62.0046"/>
					</TrackLine>
					<TrackLine>
						<End x="165.7541" y="62.145"/>
					</TrackLine>
					<TrackLine>
						<End x="165.8395" y="62.231"/>
					</TrackLine>
					<TrackLine>
						<End x="165.8513" y="62.2506"/>
					</TrackLine>
					<TrackLine>
						<End x="166.0505" y="62.7311"/>
					</TrackLine>
					<TrackLine>
						<End x="166.0561" y="62.7533"/>
					</TrackLine>
					<TrackLine>
						<End x="166.1" y="63.6521"/>
					</TrackLine>
					<TrackLine>
						<End x="166.1077" y="63.6827"/>
					</TrackLine>
					<TrackLine>
						<End x="166.3094" y="64.1692"/>
					</TrackLine>
					<TrackLine>
						<End x="166.3256" y="64.1962"/>
					</TrackLine>
					<TrackLine>
						<End x="167.4538" y="65.3244"/>
					</TrackLine>
					<TrackLine>
						<End x="167.4808" y="65.3406"/>
					</TrackLine>
					<TrackLine>
						<End x="167.9673" y="65.5423"/>
					</TrackLine>
					<TrackLine>
						<End x="167.9979" y="65.55"/>
					</TrackLine>
					<TrackLine>
						<End x="170.2725" y="65.91"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8308" y="65.95"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1" y="65.95"/>
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
					<Start x="174.15" y="96.65"/>
					<TrackLine>
						<End x="174.15" y="94.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4178" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1055" y="92.7457"/>
					</TrackLine>
					<TrackLine>
						<End x="170.3543" y="91.9945"/>
					</TrackLine>
					<TrackLine>
						<End x="170.35" y="91.9842"/>
					</TrackLine>
					<TrackLine>
						<End x="169.05" y="88.4441"/>
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
					<Start x="176.5" y="66.15"/>
					<TrackLine>
						<End x="176.95" y="63.9342"/>
					</TrackLine>
					<TrackLine>
						<End x="177.25" y="62.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="177.25" y="61.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7" y="59.3166"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5816" y="59.0307"/>
					</TrackLine>
					<TrackLine>
						<End x="175.6193" y="58.0684"/>
					</TrackLine>
					<TrackLine>
						<End x="175.3334" y="57.95"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9692" y="57.5"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7" y="57.5"/>
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
					<Start x="220.4" y="91.1"/>
					<TrackLine>
						<End x="220.392" y="93.1896"/>
					</TrackLine>
					<TrackLine>
						<End x="220.392" y="93.6104"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="93.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="94.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="219.6678" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="208.6322" y="96.65"/>
					</TrackLine>
					<TrackLine>
						<End x="207.9" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="207.9" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="207.1678" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="204.6678" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="203.6322" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1678" y="96.65"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1322" y="96.65"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="199.6678" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6322" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7642" y="97.6125"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7145" y="97.6"/>
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
						<End x="175.9261" y="45.6524"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9024" y="44.6761"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2067" y="44.55"/>
					</TrackLine>
					<TrackLine>
						<End x="180.2237" y="43.9"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2676" y="43.3"/>
					</TrackLine>
					<TrackLine>
						<End x="185.0324" y="43.3"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4342" y="43.9"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4445" y="43.9043"/>
					</TrackLine>
					<TrackLine>
						<End x="189.1957" y="44.6555"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4881" y="46.0772"/>
					</TrackLine>
					<TrackLine>
						<End x="190.5" y="46.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="190.5" y="47.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="190.15" y="52.5308"/>
					</TrackLine>
					<TrackLine>
						<End x="190.15" y="52.8"/>
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
						<End x="174.15" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="36.9842"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1543" y="36.9945"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9055" y="37.7457"/>
					</TrackLine>
					<TrackLine>
						<End x="177.9857" y="39.3301"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4858" y="39.5375"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5355" y="39.55"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8072" y="41.65"/>
					</TrackLine>
					<TrackLine>
						<End x="189.0002" y="41.6985"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6024" y="41.9481"/>
					</TrackLine>
					<TrackLine>
						<End x="189.7732" y="42.0505"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5693" y="46.7684"/>
					</TrackLine>
					<TrackLine>
						<End x="197.5316" y="47.7307"/>
					</TrackLine>
					<TrackLine>
						<End x="199.0619" y="50.9728"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2816" y="51.3807"/>
					</TrackLine>
					<TrackLine>
						<End x="199.4" y="51.6666"/>
					</TrackLine>
					<TrackLine>
						<End x="199.4" y="53.0334"/>
					</TrackLine>
					<TrackLine>
						<End x="199.4" y="57.2834"/>
					</TrackLine>
					<TrackLine>
						<End x="199.05" y="61.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="199.0457" y="61.8945"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2945" y="62.6457"/>
					</TrackLine>
					<TrackLine>
						<End x="196.0692" y="64"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="64"/>
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
						<End x="179.1" y="54.6692"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1" y="54.4"/>
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
					<Start x="221.65" y="46.3"/>
					<TrackLine>
						<End x="221.65" y="41.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7" y="35.25"/>
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
						<End x="192.75" y="70.65"/>
					</TrackLine>
					<TrackLine>
						<End x="192.75" y="70.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="193.1308" y="71.3"/>
					</TrackLine>
					<TrackLine>
						<End x="193.6692" y="71.3"/>
					</TrackLine>
					<TrackLine>
						<End x="195.9666" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="197.3334" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="206.9664" y="71.047"/>
					</TrackLine>
					<TrackLine>
						<End x="208.0336" y="71.047"/>
					</TrackLine>
					<TrackLine>
						<End x="208.0428" y="71.0432"/>
					</TrackLine>
					<TrackLine>
						<End x="208.7932" y="70.2928"/>
					</TrackLine>
					<TrackLine>
						<End x="208.797" y="70.2836"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="68.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8822" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="210.9178" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="67.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="62.1271"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="59.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="57.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="56.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="49.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="35.25"/>
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
						<End x="177.68" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="177.68" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="177.68" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="178.05" y="37.2842"/>
					</TrackLine>
					<TrackLine>
						<End x="178.0543" y="37.2945"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8055" y="38.0457"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8158" y="38.05"/>
					</TrackLine>
					<TrackLine>
						<End x="188.9926" y="40.15"/>
					</TrackLine>
					<TrackLine>
						<End x="189.4724" y="40.2705"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2787" y="40.6047"/>
					</TrackLine>
					<TrackLine>
						<End x="190.7031" y="40.859"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8461" y="46.7099"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8625" y="46.7167"/>
					</TrackLine>
					<TrackLine>
						<End x="202.2936" y="46.85"/>
					</TrackLine>
					<TrackLine>
						<End x="202.506" y="46.938"/>
					</TrackLine>
					<TrackLine>
						<End x="203.412" y="47.844"/>
					</TrackLine>
					<TrackLine>
						<End x="203.5" y="48.0564"/>
					</TrackLine>
					<TrackLine>
						<End x="203.5" y="49.3436"/>
					</TrackLine>
					<TrackLine>
						<End x="203.25" y="51.2206"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2351" y="51.2799"/>
					</TrackLine>
					<TrackLine>
						<End x="202.0889" y="55.6127"/>
					</TrackLine>
					<TrackLine>
						<End x="202.05" y="55.7676"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8" y="65.9834"/>
					</TrackLine>
					<TrackLine>
						<End x="201.6816" y="66.2693"/>
					</TrackLine>
					<TrackLine>
						<End x="200.7193" y="67.2316"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4334" y="67.35"/>
					</TrackLine>
					<TrackLine>
						<End x="199.0666" y="67.35"/>
					</TrackLine>
					<TrackLine>
						<End x="196.0692" y="67.25"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="67.25"/>
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
					<Start x="177.75" y="83.95"/>
					<TrackLine>
						<End x="179.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="94.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="100.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3822" y="101.65"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8559" y="101.75"/>
					</TrackLine>
					<TrackLine>
						<End x="189.4015" y="101.75"/>
					</TrackLine>
					<TrackLine>
						<End x="189.8985" y="101.75"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3985" y="101.75"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4342" y="101.7"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0633" y="101.5"/>
					</TrackLine>
					<TrackLine>
						<End x="202.0855" y="101.2"/>
					</TrackLine>
					<TrackLine>
						<End x="207.4706" y="100.75"/>
					</TrackLine>
					<TrackLine>
						<End x="207.5299" y="100.7351"/>
					</TrackLine>
					<TrackLine>
						<End x="212.1941" y="99.25"/>
					</TrackLine>
					<TrackLine>
						<End x="212.2228" y="99.2381"/>
					</TrackLine>
					<TrackLine>
						<End x="214.15" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD1"/>
				<Subwire width="0.3">
					<Start x="177.75" y="80.35"/>
					<TrackLine>
						<End x="177.7" y="77.1428"/>
					</TrackLine>
					<TrackLine>
						<End x="177.15" y="70.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="177.15" y="70.65"/>
					</TrackLine>
					<TrackLine>
						<End x="177.15" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="167.55" y="36.45"/>
					<TrackLine>
						<End x="167.52" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="167.52" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="167.52" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="166.67" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="175.45" y="36.45"/>
					<TrackLine>
						<End x="178.3807" y="38.6816"/>
					</TrackLine>
					<TrackLine>
						<End x="178.6666" y="38.8"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8999" y="40.9"/>
					</TrackLine>
					<TrackLine>
						<End x="189.2363" y="40.9845"/>
					</TrackLine>
					<TrackLine>
						<End x="189.9406" y="41.2764"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2381" y="41.4548"/>
					</TrackLine>
					<TrackLine>
						<End x="199.4402" y="47.3174"/>
					</TrackLine>
					<TrackLine>
						<End x="199.72" y="47.4333"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1471" y="47.5"/>
					</TrackLine>
					<TrackLine>
						<End x="202.85" y="48.2029"/>
					</TrackLine>
					<TrackLine>
						<End x="202.85" y="49.1971"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5" y="51.0933"/>
					</TrackLine>
					<TrackLine>
						<End x="201.3749" y="55.3766"/>
					</TrackLine>
					<TrackLine>
						<End x="201.3" y="55.6749"/>
					</TrackLine>
					<TrackLine>
						<End x="201.05" y="65.8342"/>
					</TrackLine>
					<TrackLine>
						<End x="201.0457" y="65.8445"/>
					</TrackLine>
					<TrackLine>
						<End x="200.2945" y="66.5957"/>
					</TrackLine>
					<TrackLine>
						<End x="200.2842" y="66.6"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="66.6"/>
					</TrackLine>
					<TrackLine>
						<End x="195" y="66.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD2"/>
				<Subwire width="0.3">
					<Start x="215.4" y="49.15"/>
					<TrackLine>
						<End x="215.9261" y="48.1524"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="42.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="41.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="219.16" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="219.16" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="219.16" y="35.25"/>
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
						<End x="181.6946" y="74.2831"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7" y="70.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7" y="70.65"/>
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
						<End x="209.15" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8822" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="210.9178" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="69.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="67.3433"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="65.9567"/>
					</TrackLine>
					<TrackLine>
						<End x="212.3" y="63.5436"/>
					</TrackLine>
					<TrackLine>
						<End x="212.3" y="62.2564"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="59.8433"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="57.3433"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="55.9567"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="49.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="48.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="214.8739" y="42.6476"/>
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
						<End x="196.0692" y="58.15"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8" y="58.15"/>
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
						<End x="188.2" y="66.0842"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2" y="65.0158"/>
					</TrackLine>
					<TrackLine>
						<End x="188.85" y="59.4842"/>
					</TrackLine>
					<TrackLine>
						<End x="188.85" y="54.4"/>
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
						<End x="219.8739" y="42.6476"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="48.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="216.6333" y="49.6608"/>
					</TrackLine>
					<TrackLine>
						<End x="215.9108" y="50.3833"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4131" y="50.3833"/>
					</TrackLine>
					<TrackLine>
						<End x="215.2129" y="50.4662"/>
					</TrackLine>
					<TrackLine>
						<End x="214.3162" y="51.3629"/>
					</TrackLine>
					<TrackLine>
						<End x="214.2333" y="51.5631"/>
					</TrackLine>
					<TrackLine>
						<End x="213.25" y="59.9706"/>
					</TrackLine>
					<TrackLine>
						<End x="212.95" y="62.4029"/>
					</TrackLine>
					<TrackLine>
						<End x="212.95" y="63.3971"/>
					</TrackLine>
					<TrackLine>
						<End x="213.25" y="65.8294"/>
					</TrackLine>
					<TrackLine>
						<End x="213.25" y="67.4706"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="75.1485"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="77.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="78.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="209.6678" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="208.6322" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="208.4306" y="79.0681"/>
					</TrackLine>
					<TrackLine>
						<End x="207.3694" y="79.0681"/>
					</TrackLine>
					<TrackLine>
						<End x="207.1678" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="206.1322" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="78.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="77.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="201.6957" y="72.5055"/>
					</TrackLine>
					<TrackLine>
						<End x="200.9445" y="71.7543"/>
					</TrackLine>
					<TrackLine>
						<End x="200.9342" y="71.75"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1842" y="71.15"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1158" y="71.15"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9342" y="71.95"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8658" y="71.95"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8555" y="71.9457"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1043" y="71.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1" y="71.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1" y="70.65"/>
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
					<Start x="199.15" y="115.4"/>
					<TrackLine>
						<End x="197.58" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BAD8"/>
				<Subwire width="0.3">
					<Start x="199.15" y="109.15"/>
					<TrackLine>
						<End x="190.4" y="107.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="209.15" y="60.4"/>
					<TrackLine>
						<End x="209.05" y="61.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="209.05" y="62.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="209.05" y="64.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="209.0619" y="64.7228"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="222.95" y="92.35"/>
					<TrackLine>
						<End x="221.75" y="88.1515"/>
					</TrackLine>
					<TrackLine>
						<End x="221.3985" y="87.8"/>
					</TrackLine>
					<TrackLine>
						<End x="218.3015" y="86.75"/>
					</TrackLine>
					<TrackLine>
						<End x="218.1896" y="86.658"/>
					</TrackLine>
					<TrackLine>
						<End x="217.892" y="86.3604"/>
					</TrackLine>
					<TrackLine>
						<End x="217.892" y="85.9396"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="85.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="84.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="217.892" y="84.8604"/>
					</TrackLine>
					<TrackLine>
						<End x="217.892" y="84.4396"/>
					</TrackLine>
					<TrackLine>
						<End x="220.9332" y="78.7702"/>
					</TrackLine>
					<TrackLine>
						<End x="221.025" y="78.5485"/>
					</TrackLine>
					<TrackLine>
						<End x="221.025" y="77.2515"/>
					</TrackLine>
					<TrackLine>
						<End x="220.8" y="74.8433"/>
					</TrackLine>
					<TrackLine>
						<End x="220.8" y="73.4567"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3822" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="223.4178" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="69.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="224.7" y="69"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA16"/>
				<Subwire width="0.3">
					<Start x="216.65" y="94.15"/>
					<TrackLine>
						<End x="217.9" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="216.63" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="216.63" y="120.9261"/>
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
						<End x="176.5445" y="62.9457"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2957" y="62.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3" y="62.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3" y="61.1158"/>
					</TrackLine>
					<TrackLine>
						<End x="175.6538" y="56.2928"/>
					</TrackLine>
					<TrackLine>
						<End x="175.6538" y="55.0072"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7412" y="54.7961"/>
					</TrackLine>
					<TrackLine>
						<End x="176.6461" y="53.8912"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8572" y="53.8038"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1428" y="53.8038"/>
					</TrackLine>
					<TrackLine>
						<End x="178.5349" y="53.808"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8651" y="53.808"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1172" y="53.7036"/>
					</TrackLine>
					<TrackLine>
						<End x="181.0536" y="52.7672"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4816" y="51.1693"/>
					</TrackLine>
					<TrackLine>
						<End x="182.6" y="50.8834"/>
					</TrackLine>
					<TrackLine>
						<End x="182.6" y="49.5166"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2833" y="47.2969"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2833" y="46.0031"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3738" y="45.7845"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2845" y="44.8738"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4918" y="42.6462"/>
					</TrackLine>
					<TrackLine>
						<End x="186.5357" y="42.6199"/>
					</TrackLine>
					<TrackLine>
						<End x="187.0358" y="42.4125"/>
					</TrackLine>
					<TrackLine>
						<End x="187.0855" y="42.4"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7145" y="42.4"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8388" y="42.7375"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1975" y="42.7375"/>
					</TrackLine>
					<TrackLine>
						<End x="201.2209" y="42.7434"/>
					</TrackLine>
					<TrackLine>
						<End x="204.1119" y="43.57"/>
					</TrackLine>
					<TrackLine>
						<End x="206.1788" y="43.57"/>
					</TrackLine>
					<TrackLine>
						<End x="207.2067" y="43.75"/>
					</TrackLine>
					<TrackLine>
						<End x="208.5933" y="43.75"/>
					</TrackLine>
					<TrackLine>
						<End x="208.8976" y="43.6239"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8739" y="42.6476"/>
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
						<End x="175.0058" y="54.8783"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1919" y="54.4291"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2791" y="53.3419"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7283" y="53.1558"/>
					</TrackLine>
					<TrackLine>
						<End x="179.7194" y="53.104"/>
					</TrackLine>
					<TrackLine>
						<End x="180.454" y="52.3694"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8457" y="50.7445"/>
					</TrackLine>
					<TrackLine>
						<End x="181.85" y="50.7342"/>
					</TrackLine>
					<TrackLine>
						<End x="181.85" y="49.6658"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8457" y="49.6555"/>
					</TrackLine>
					<TrackLine>
						<End x="181.0945" y="48.9043"/>
					</TrackLine>
					<TrackLine>
						<End x="180.5892" y="48.4333"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8667" y="47.7108"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8667" y="46.6892"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8534" y="44.925"/>
					</TrackLine>
					<TrackLine>
						<End x="180.9608" y="44.7458"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2458" y="43.4608"/>
					</TrackLine>
					<TrackLine>
						<End x="185.5619" y="41.4548"/>
					</TrackLine>
					<TrackLine>
						<End x="185.8594" y="41.2764"/>
					</TrackLine>
					<TrackLine>
						<End x="186.5637" y="40.9845"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9001" y="40.9"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8999" y="40.9"/>
					</TrackLine>
					<TrackLine>
						<End x="199.0087" y="41.3625"/>
					</TrackLine>
					<TrackLine>
						<End x="200.5913" y="41.3625"/>
					</TrackLine>
					<TrackLine>
						<End x="200.6052" y="41.359"/>
					</TrackLine>
					<TrackLine>
						<End x="204.4015" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="205.9015" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="206.3985" y="40.3"/>
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
						<End x="176.3019" y="56.1463"/>
					</TrackLine>
					<TrackLine>
						<End x="176.3019" y="55.1537"/>
					</TrackLine>
					<TrackLine>
						<End x="177.0037" y="54.4519"/>
					</TrackLine>
					<TrackLine>
						<End x="177.9963" y="54.4519"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4026" y="54.512"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9974" y="54.512"/>
					</TrackLine>
					<TrackLine>
						<End x="180.0207" y="54.5061"/>
					</TrackLine>
					<TrackLine>
						<End x="180.5021" y="54.3065"/>
					</TrackLine>
					<TrackLine>
						<End x="180.5227" y="54.2942"/>
					</TrackLine>
					<TrackLine>
						<End x="181.6442" y="53.1727"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1038" y="51.6082"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1301" y="51.5643"/>
					</TrackLine>
					<TrackLine>
						<End x="183.3375" y="51.0642"/>
					</TrackLine>
					<TrackLine>
						<End x="183.35" y="51.0145"/>
					</TrackLine>
					<TrackLine>
						<End x="183.35" y="49.3855"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9167" y="47.1608"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9167" y="46.1392"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6392" y="45.4167"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9307" y="43.2684"/>
					</TrackLine>
					<TrackLine>
						<End x="187.2166" y="43.15"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5834" y="43.15"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7538" y="43.425"/>
					</TrackLine>
					<TrackLine>
						<End x="201.0684" y="43.425"/>
					</TrackLine>
					<TrackLine>
						<End x="203.9806" y="44.23"/>
					</TrackLine>
					<TrackLine>
						<End x="206.0476" y="44.23"/>
					</TrackLine>
					<TrackLine>
						<End x="207.0201" y="44.4851"/>
					</TrackLine>
					<TrackLine>
						<End x="207.0794" y="44.5"/>
					</TrackLine>
					<TrackLine>
						<End x="208.7206" y="44.5"/>
					</TrackLine>
					<TrackLine>
						<End x="215.9441" y="43"/>
					</TrackLine>
					<TrackLine>
						<End x="215.9728" y="42.9881"/>
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
						<End x="186.1658" y="62"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7842" y="62.05"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7945" y="62.0543"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2055" y="66.5957"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2158" y="66.6"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8822" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="67.9"/>
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
					<Start x="166.65" y="83.55"/>
					<TrackLine>
						<End x="168.9457" y="81.1445"/>
					</TrackLine>
					<TrackLine>
						<End x="168.95" y="81.1342"/>
					</TrackLine>
					<TrackLine>
						<End x="171.6345" y="70.4637"/>
					</TrackLine>
					<TrackLine>
						<End x="171.9264" y="69.7594"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1048" y="69.4619"/>
					</TrackLine>
					<TrackLine>
						<End x="173.5119" y="68.0548"/>
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
					<Start x="201.65" y="90.4"/>
					<TrackLine>
						<End x="202.9" y="93.6322"/>
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
					<Start x="175.4" y="106.65"/>
					<TrackLine>
						<End x="174.6941" y="106.75"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6059" y="106.75"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1322" y="106.65"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4" y="105.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4" y="104.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="169.15" y="100.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="169.15" y="99.8822"/>
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
						<End x="177.8" y="66.6842"/>
					</TrackLine>
					<TrackLine>
						<End x="177.7957" y="66.6945"/>
					</TrackLine>
					<TrackLine>
						<End x="177.0445" y="67.4457"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1553" y="68.57"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9824" y="68.57"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8505" y="68.6031"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2918" y="68.8347"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1752" y="68.9047"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9547" y="70.1252"/>
					</TrackLine>
					<TrackLine>
						<End x="172.8847" y="70.2418"/>
					</TrackLine>
					<TrackLine>
						<End x="172.6531" y="70.8005"/>
					</TrackLine>
					<TrackLine>
						<End x="172.62" y="70.9324"/>
					</TrackLine>
					<TrackLine>
						<End x="169.05" y="87.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="169.05" y="88.4441"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0619" y="88.4728"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8272" y="89.2381"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8559" y="89.25"/>
					</TrackLine>
					<TrackLine>
						<End x="170.9441" y="89.25"/>
					</TrackLine>
					<TrackLine>
						<End x="170.9728" y="89.2381"/>
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
						<End x="173.3842" y="50.1"/>
					</TrackLine>
					<TrackLine>
						<End x="172.3158" y="50.1"/>
					</TrackLine>
					<TrackLine>
						<End x="172.3055" y="50.1043"/>
					</TrackLine>
					<TrackLine>
						<End x="169.9918" y="51.7962"/>
					</TrackLine>
					<TrackLine>
						<End x="162.6807" y="57.4184"/>
					</TrackLine>
					<TrackLine>
						<End x="161.7184" y="58.3807"/>
					</TrackLine>
					<TrackLine>
						<End x="160.1481" y="61.8476"/>
					</TrackLine>
					<TrackLine>
						<End x="159.8985" y="62.4498"/>
					</TrackLine>
					<TrackLine>
						<End x="159.85" y="62.6428"/>
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
						<End x="226.6316" y="69.9693"/>
					</TrackLine>
					<TrackLine>
						<End x="226.75" y="69.6834"/>
					</TrackLine>
					<TrackLine>
						<End x="227.4" y="67.3334"/>
					</TrackLine>
					<TrackLine>
						<End x="227.4" y="65.9666"/>
					</TrackLine>
					<TrackLine>
						<End x="227.2816" y="65.6807"/>
					</TrackLine>
					<TrackLine>
						<End x="225.4935" y="62.7108"/>
					</TrackLine>
					<TrackLine>
						<End x="220.279" y="55.3781"/>
					</TrackLine>
					<TrackLine>
						<End x="219.1719" y="54.271"/>
					</TrackLine>
					<TrackLine>
						<End x="219.1651" y="54.2669"/>
					</TrackLine>
					<TrackLine>
						<End x="218.6949" y="54.0719"/>
					</TrackLine>
					<TrackLine>
						<End x="218.6873" y="54.07"/>
					</TrackLine>
					<TrackLine>
						<End x="217.1127" y="54.07"/>
					</TrackLine>
					<TrackLine>
						<End x="216.7071" y="54.1182"/>
					</TrackLine>
					<TrackLine>
						<End x="215.3929" y="54.1182"/>
					</TrackLine>
					<TrackLine>
						<End x="211.2206" y="53.8"/>
					</TrackLine>
					<TrackLine>
						<End x="196.8158" y="53.65"/>
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
						<End x="209.8822" y="65.4"/>
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
						<End x="171.9342" y="53.05"/>
					</TrackLine>
					<TrackLine>
						<End x="170.8658" y="53.05"/>
					</TrackLine>
					<TrackLine>
						<End x="170.8555" y="53.0543"/>
					</TrackLine>
					<TrackLine>
						<End x="170.1043" y="53.8055"/>
					</TrackLine>
					<TrackLine>
						<End x="164.9457" y="59.8945"/>
					</TrackLine>
					<TrackLine>
						<End x="162.1043" y="63.0055"/>
					</TrackLine>
					<TrackLine>
						<End x="162.1" y="63.0158"/>
					</TrackLine>
					<TrackLine>
						<End x="162.1" y="64.0842"/>
					</TrackLine>
					<TrackLine>
						<End x="162.7" y="66.4342"/>
					</TrackLine>
					<TrackLine>
						<End x="162.7043" y="66.4445"/>
					</TrackLine>
					<TrackLine>
						<End x="164.3771" y="69.2417"/>
					</TrackLine>
					<TrackLine>
						<End x="164.3771" y="70.2583"/>
					</TrackLine>
					<TrackLine>
						<End x="164.1" y="70.5374"/>
					</TrackLine>
					<TrackLine>
						<End x="164.0958" y="70.5444"/>
					</TrackLine>
					<TrackLine>
						<End x="163.9008" y="71.0147"/>
					</TrackLine>
					<TrackLine>
						<End x="163.8988" y="71.0226"/>
					</TrackLine>
					<TrackLine>
						<End x="163.4" y="73.0158"/>
					</TrackLine>
					<TrackLine>
						<End x="162.995" y="77.4602"/>
					</TrackLine>
					<TrackLine>
						<End x="162.995" y="78.4998"/>
					</TrackLine>
					<TrackLine>
						<End x="165.3543" y="84.0945"/>
					</TrackLine>
					<TrackLine>
						<End x="168.4261" y="88.8976"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4024" y="89.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="169.7067" y="90"/>
					</TrackLine>
					<TrackLine>
						<End x="171.0933" y="90"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4178" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="174.65" y="82.8158"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7" y="79.6666"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8184" y="79.3807"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7807" y="78.4184"/>
					</TrackLine>
					<TrackLine>
						<End x="177.0666" y="78.3"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8334" y="78.1"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8258" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="189.8942" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6581" y="76.6857"/>
					</TrackLine>
					<TrackLine>
						<End x="197.6419" y="76.6857"/>
					</TrackLine>
					<TrackLine>
						<End x="198.646" y="76.6833"/>
					</TrackLine>
					<TrackLine>
						<End x="199.654" y="76.6833"/>
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
						<End x="215.4" y="84.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="85.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="88.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="89.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="93.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="94.6678"/>
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
					<Start x="222.9" y="66.65"/>
					<TrackLine>
						<End x="221.9024" y="66.1239"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="62.9"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="62.9"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="62.1678"/>
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
					<Start x="221.65" y="50.6"/>
					<TrackLine>
						<End x="219.8559" y="50.5"/>
					</TrackLine>
					<TrackLine>
						<End x="217.4013" y="50.3539"/>
					</TrackLine>
					<TrackLine>
						<End x="216.6961" y="49.6487"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="48.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="215.9178" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="213.4441" y="47.8"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1842" y="47.4"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1158" y="47.4"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0658" y="47.4"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6842" y="47.95"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6158" y="47.95"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6055" y="47.9457"/>
					</TrackLine>
					<TrackLine>
						<End x="187.8543" y="47.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="187.85" y="47.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="187.85" y="46.1158"/>
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
					<Start x="214.87" y="60.36"/>
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
						<End x="189.1147" y="38.65"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6853" y="38.65"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2645" y="39.25"/>
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
						<End x="161.4684" y="62.5807"/>
					</TrackLine>
					<TrackLine>
						<End x="161.35" y="62.8666"/>
					</TrackLine>
					<TrackLine>
						<End x="161.35" y="64.2334"/>
					</TrackLine>
					<TrackLine>
						<End x="161.95" y="66.5834"/>
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
						<End x="175.9842" y="37.75"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9158" y="37.75"/>
					</TrackLine>
					<TrackLine>
						<End x="172.3334" y="37.4"/>
					</TrackLine>
					<TrackLine>
						<End x="170.9666" y="37.4"/>
					</TrackLine>
					<TrackLine>
						<End x="165.7842" y="38.35"/>
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
					<Start x="166.48" y="71.81"/>
					<TrackLine>
						<End x="170.9435" y="63.9609"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1" y="63.5831"/>
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
					<Start x="175.85" y="71.8"/>
					<TrackLine>
						<End x="185.2" y="68.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="172.8" y="55.15"/>
					<TrackLine>
						<End x="171.4" y="54.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="56.65"/>
					<TrackLine>
						<End x="197.75" y="61.35"/>
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
						<End x="195.0184" y="50.2384"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1816" y="50.2384"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6215" y="50.0731"/>
					</TrackLine>
					<TrackLine>
						<End x="198.0785" y="50.0731"/>
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
					<Start x="227.9" y="87.9"/>
					<TrackLine>
						<End x="221.3157" y="88.8"/>
					</TrackLine>
					<TrackLine>
						<End x="221.15" y="88.8"/>
					</TrackLine>
					<TrackLine>
						<End x="220.75" y="88.8"/>
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
					<Start x="196.25" y="105.65"/>
					<TrackLine>
						<End x="196.5" y="96.9706"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5" y="95.4706"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5" y="93.8294"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3" y="89.7438"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3" y="88.5562"/>
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
					<Start x="233.88" y="64.15"/>
					<TrackLine>
						<End x="235.25" y="43.11"/>
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
							<Dot x="199.0289" y="116.9603"/>
							<Dot x="198.81" y="117.4599"/>
							<Dot x="198.5745" y="116.9679"/>
						</Teardrop>
					</Teardrops>
					<Start x="198.8" y="116.86"/>
					<TrackLine>
						<End x="198.85" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="198.85" y="120.9261"/>
					</TrackLine>
					<TrackLine>
						<End x="199.5539" y="121.9424"/>
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
					<Start x="192.9" y="115.4"/>
					<TrackLine>
						<End x="195.0859" y="111.5392"/>
					</TrackLine>
					<TrackLine>
						<End x="195.25" y="111.143"/>
					</TrackLine>
					<TrackLine>
						<End x="195.55" y="108.2367"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6009" y="108.034"/>
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
					<Start x="205.4" y="56.65"/>
					<TrackLine>
						<End x="207.9" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="235.25" y="43.11"/>
					<TrackLine>
						<End x="235.25" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="235.25" y="35"/>
					</TrackLine>
					<TrackLine>
						<End x="235.25" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="38.75"/>
					<TrackLine>
						<End x="213.5779" y="36.25"/>
					</TrackLine>
					<TrackLine>
						<End x="213.08" y="35.7521"/>
					</TrackLine>
					<TrackLine>
						<End x="212.99" y="35.5657"/>
					</TrackLine>
					<TrackLine>
						<End x="212.99" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="212.99" y="35"/>
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
					<Start x="172.8" y="61.65"/>
					<TrackLine>
						<End x="172.85" y="60.8331"/>
					</TrackLine>
					<TrackLine>
						<End x="172.85" y="59.3669"/>
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
					<Start x="199.15" y="105.4"/>
					<TrackLine>
						<End x="197.5999" y="108.4356"/>
					</TrackLine>
					<TrackLine>
						<End x="197.55" y="108.5562"/>
					</TrackLine>
					<TrackLine>
						<End x="197.55" y="109.7438"/>
					</TrackLine>
					<TrackLine>
						<End x="197.69" y="115.966"/>
					</TrackLine>
					<TrackLine>
						<End x="197.7186" y="116.0351"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5149" y="116.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="198.584" y="116.86"/>
					</TrackLine>
					<TrackLine>
						<End x="198.8" y="116.86"/>
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
					<Start x="210.4" y="56.65"/>
					<TrackLine>
						<End x="215.0192" y="56.75"/>
					</TrackLine>
					<TrackLine>
						<End x="217.0808" y="56.75"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="172.9" y="46.65"/>
					<TrackLine>
						<End x="165.6339" y="48.25"/>
					</TrackLine>
					<TrackLine>
						<End x="164.4661" y="48.25"/>
					</TrackLine>
					<TrackLine>
						<End x="164.3639" y="48.2077"/>
					</TrackLine>
					<TrackLine>
						<End x="160.1391" y="45.3935"/>
					</TrackLine>
					<TrackLine>
						<End x="159.1065" y="44.3609"/>
					</TrackLine>
					<TrackLine>
						<End x="158.95" y="43.9831"/>
					</TrackLine>
					<TrackLine>
						<End x="158.2245" y="41.8429"/>
					</TrackLine>
					<TrackLine>
						<End x="158.2" y="41.7454"/>
					</TrackLine>
					<TrackLine>
						<End x="158.2" y="40.0546"/>
					</TrackLine>
					<TrackLine>
						<End x="158.45" y="35.5657"/>
					</TrackLine>
					<TrackLine>
						<End x="158.45" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="158.45" y="35"/>
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
					<Start x="179.2" y="51.85"/>
					<TrackLine>
						<End x="176.6123" y="52.2577"/>
					</TrackLine>
					<TrackLine>
						<End x="176.4494" y="52.2986"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8687" y="52.5394"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7246" y="52.6257"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7784" y="54.5713"/>
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
					<Start x="164.25" y="77.98"/>
					<TrackLine>
						<End x="165.1839" y="77.8"/>
					</TrackLine>
					<TrackLine>
						<End x="165.2861" y="77.7577"/>
					</TrackLine>
					<TrackLine>
						<End x="166.1077" y="76.9361"/>
					</TrackLine>
					<TrackLine>
						<End x="166.15" y="76.8339"/>
					</TrackLine>
					<TrackLine>
						<End x="167" y="74.2831"/>
					</TrackLine>
					<TrackLine>
						<End x="167" y="72.8169"/>
					</TrackLine>
					<TrackLine>
						<End x="166.8435" y="72.4391"/>
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
					<Start x="171.15" y="62.6"/>
					<TrackLine>
						<End x="172.8" y="61.65"/>
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
						<End x="212.9" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="211.55" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="211.55" y="120.9261"/>
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
						<End x="181.3" y="45.8294"/>
					</TrackLine>
					<TrackLine>
						<End x="181.3149" y="45.7701"/>
					</TrackLine>
					<TrackLine>
						<End x="181.5251" y="45.2632"/>
					</TrackLine>
					<TrackLine>
						<End x="181.5565" y="45.2108"/>
					</TrackLine>
					<TrackLine>
						<End x="182.7108" y="44.0565"/>
					</TrackLine>
					<TrackLine>
						<End x="186.0268" y="42.0505"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1976" y="41.9481"/>
					</TrackLine>
					<TrackLine>
						<End x="186.7998" y="41.6985"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9928" y="41.65"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8072" y="41.65"/>
					</TrackLine>
					<TrackLine>
						<End x="198.9237" y="42.05"/>
					</TrackLine>
					<TrackLine>
						<End x="201.2824" y="42.05"/>
					</TrackLine>
					<TrackLine>
						<End x="201.4373" y="42.0889"/>
					</TrackLine>
					<TrackLine>
						<End x="204.4388" y="42.91"/>
					</TrackLine>
					<TrackLine>
						<End x="204.8612" y="42.91"/>
					</TrackLine>
					<TrackLine>
						<End x="206.3612" y="42.91"/>
					</TrackLine>
					<TrackLine>
						<End x="208.4178" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="42.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="41.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8822" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="212.3559" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="219.8559" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="220.9441" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="223.4178" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="41.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="49.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="228.8515" y="65.5498"/>
					</TrackLine>
					<TrackLine>
						<End x="228.9" y="65.7428"/>
					</TrackLine>
					<TrackLine>
						<End x="229.05" y="74.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="229.0619" y="74.7228"/>
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
						<End x="167.5043" y="59.4055"/>
					</TrackLine>
					<TrackLine>
						<End x="168.2555" y="58.6543"/>
					</TrackLine>
					<TrackLine>
						<End x="168.2658" y="58.65"/>
					</TrackLine>
					<TrackLine>
						<End x="169.3342" y="58.65"/>
					</TrackLine>
					<TrackLine>
						<End x="169.3445" y="58.6543"/>
					</TrackLine>
					<TrackLine>
						<End x="170.0957" y="59.4055"/>
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
					<Start x="197.834" y="94.4519"/>
					<TrackLine>
						<End x="199.15" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDIN"/>
				<Subwire width="0.3">
					<Start x="197.9" y="89.15"/>
					<TrackLine>
						<End x="197.834" y="93.6126"/>
					</TrackLine>
					<TrackLine>
						<End x="197.834" y="94.4519"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDIN"/>
				<Subwire width="0.3">
					<Start x="197.834" y="94.4519"/>
					<TrackLine>
						<End x="197.55" y="106.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="197.5457" y="106.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="196.749" y="107.8759"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5529" y="108.3488"/>
					</TrackLine>
					<TrackLine>
						<End x="196.55" y="108.3603"/>
					</TrackLine>
					<TrackLine>
						<End x="196.31" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="196.31" y="120.9261"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6061" y="121.9424"/>
					</TrackLine>
					<TrackLine>
						<End x="195.04" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="OSC"/>
				<Subwire width="0.3">
					<Start x="174.95" y="42.35"/>
					<TrackLine>
						<End x="164.5666" y="42.65"/>
					</TrackLine>
					<TrackLine>
						<End x="164.2807" y="42.7684"/>
					</TrackLine>
					<TrackLine>
						<End x="161.7945" y="44.5457"/>
					</TrackLine>
					<TrackLine>
						<End x="161.7842" y="44.55"/>
					</TrackLine>
					<TrackLine>
						<End x="160.7158" y="44.55"/>
					</TrackLine>
					<TrackLine>
						<End x="160.7055" y="44.5457"/>
					</TrackLine>
					<TrackLine>
						<End x="159.9543" y="43.7945"/>
					</TrackLine>
					<TrackLine>
						<End x="159.95" y="43.7842"/>
					</TrackLine>
					<TrackLine>
						<End x="159.2" y="41.5834"/>
					</TrackLine>
					<TrackLine>
						<End x="159.2" y="40.2166"/>
					</TrackLine>
					<TrackLine>
						<End x="160.74" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="160.74" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="160.74" y="35.25"/>
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
						<End x="190.2672" y="74.4"/>
					</TrackLine>
					<TrackLine>
						<End x="194.9788" y="74.7107"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8984" y="74.8429"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4016" y="74.8429"/>
					</TrackLine>
					<TrackLine>
						<End x="198.3026" y="74.8333"/>
					</TrackLine>
					<TrackLine>
						<End x="201.0303" y="74.8333"/>
					</TrackLine>
					<TrackLine>
						<End x="207.3658" y="74.75"/>
					</TrackLine>
					<TrackLine>
						<End x="208.4342" y="74.75"/>
					</TrackLine>
					<TrackLine>
						<End x="208.4445" y="74.7543"/>
					</TrackLine>
					<TrackLine>
						<End x="209.1957" y="75.5055"/>
					</TrackLine>
					<TrackLine>
						<End x="209.2" y="75.5158"/>
					</TrackLine>
					<TrackLine>
						<End x="209.2" y="76.5842"/>
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
						<End x="196.7121" y="54.7783"/>
					</TrackLine>
					<TrackLine>
						<End x="204.7067" y="54.55"/>
					</TrackLine>
					<TrackLine>
						<End x="209.7067" y="54.55"/>
					</TrackLine>
					<TrackLine>
						<End x="211.0933" y="54.55"/>
					</TrackLine>
					<TrackLine>
						<End x="215.26" y="54.8024"/>
					</TrackLine>
					<TrackLine>
						<End x="216.84" y="54.8024"/>
					</TrackLine>
					<TrackLine>
						<End x="217.2425" y="54.73"/>
					</TrackLine>
					<TrackLine>
						<End x="218.5575" y="54.73"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7957" y="54.8287"/>
					</TrackLine>
					<TrackLine>
						<End x="219.7213" y="55.7543"/>
					</TrackLine>
					<TrackLine>
						<End x="224.8739" y="63.1524"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6457" y="66.1055"/>
					</TrackLine>
					<TrackLine>
						<End x="226.65" y="66.1158"/>
					</TrackLine>
					<TrackLine>
						<End x="226.65" y="67.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="226" y="69.5342"/>
					</TrackLine>
					<TrackLine>
						<End x="225.9957" y="69.5445"/>
					</TrackLine>
					<TrackLine>
						<End x="225.2445" y="70.2957"/>
					</TrackLine>
					<TrackLine>
						<End x="225.2342" y="70.3"/>
					</TrackLine>
					<TrackLine>
						<End x="223.4178" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3822" y="70.4"/>
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
						<End x="188.3442" y="91.57"/>
					</TrackLine>
					<TrackLine>
						<End x="174.5794" y="92.55"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1842" y="92.75"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1158" y="92.75"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1055" y="92.7457"/>
					</TrackLine>
					<TrackLine>
						<End x="170.3543" y="91.9945"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8065" y="89.3392"/>
					</TrackLine>
					<TrackLine>
						<End x="162.96" y="82.5339"/>
					</TrackLine>
					<TrackLine>
						<End x="162.2161" y="81.79"/>
					</TrackLine>
					<TrackLine>
						<End x="161.1639" y="81.79"/>
					</TrackLine>
					<TrackLine>
						<End x="160.42" y="81.0461"/>
					</TrackLine>
					<TrackLine>
						<End x="160.42" y="79.9939"/>
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
					<Start x="171.65" y="105.4"/>
					<TrackLine>
						<End x="171.6496" y="99.8885"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="171.6496" y="99.8885"/>
					<TrackLine>
						<End x="170.4" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="171.6496" y="99.8885"/>
					<TrackLine>
						<End x="171.65" y="94.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="172.3822" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7067" y="93.3"/>
					</TrackLine>
					<TrackLine>
						<End x="190.8842" y="92.2"/>
					</TrackLine>
					<TrackLine>
						<End x="190.8945" y="92.1957"/>
					</TrackLine>
					<TrackLine>
						<End x="191.6457" y="91.4445"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="91.4342"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="191.55" y="85.7342"/>
					</TrackLine>
					<TrackLine>
						<End x="191.55" y="84.6658"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5543" y="84.6555"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3055" y="83.9043"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3158" y="83.9"/>
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
					<Start x="176.65" y="110.4"/>
					<TrackLine>
						<End x="176.7" y="113.5158"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7" y="114.5842"/>
					</TrackLine>
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
						<End x="175.99" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="175.99" y="120.9261"/>
					</TrackLine>
					<TrackLine>
						<End x="174.72" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BIAKO"/>
				<Subwire width="0.3">
					<Start x="227.2" y="85.2"/>
					<TrackLine>
						<End x="221.5064" y="84.25"/>
					</TrackLine>
					<TrackLine>
						<End x="221.294" y="84.162"/>
					</TrackLine>
					<TrackLine>
						<End x="220.388" y="83.256"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="78.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="217.9" y="77.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="217.1678" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="216.1322" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="213.6322" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="77.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="212.9" y="78.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="212.1678" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="211.1322" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="78.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="74.9"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="74.75"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA20"/>
				<Subwire width="0.3">
					<Start x="206.65" y="94.15"/>
					<TrackLine>
						<End x="207.9" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="207.9" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="207.9" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="206.47" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="206.47" y="120.9261"/>
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
						<End x="220.4" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="220.392" y="104.4396"/>
					</TrackLine>
					<TrackLine>
						<End x="220.392" y="104.8604"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="104.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="105.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="220.392" y="105.9396"/>
					</TrackLine>
					<TrackLine>
						<End x="220.392" y="106.3604"/>
					</TrackLine>
					<TrackLine>
						<End x="220.392" y="108.6104"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="108.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="109.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="220.392" y="109.6896"/>
					</TrackLine>
					<TrackLine>
						<End x="220.392" y="110.1104"/>
					</TrackLine>
					<TrackLine>
						<End x="220.392" y="114.8604"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="114.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="220.392" y="115.9396"/>
					</TrackLine>
					<TrackLine>
						<End x="219.25" y="120.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="219.2381" y="120.9728"/>
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
						<End x="165.0541" y="69.0957"/>
					</TrackLine>
					<TrackLine>
						<End x="165.0541" y="70.4043"/>
					</TrackLine>
					<TrackLine>
						<End x="164.9579" y="70.6367"/>
					</TrackLine>
					<TrackLine>
						<End x="164.6721" y="70.9233"/>
					</TrackLine>
					<TrackLine>
						<End x="164.5759" y="71.1557"/>
					</TrackLine>
					<TrackLine>
						<End x="164.5759" y="72.4643"/>
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
						<End x="159.9543" y="41.4445"/>
					</TrackLine>
					<TrackLine>
						<End x="159.95" y="41.4342"/>
					</TrackLine>
					<TrackLine>
						<End x="159.95" y="40.3658"/>
					</TrackLine>
					<TrackLine>
						<End x="159.9543" y="40.3555"/>
					</TrackLine>
					<TrackLine>
						<End x="160.7055" y="39.6043"/>
					</TrackLine>
					<TrackLine>
						<End x="160.7158" y="39.6"/>
					</TrackLine>
					<TrackLine>
						<End x="161.7842" y="39.6"/>
					</TrackLine>
					<TrackLine>
						<End x="163.1158" y="39.8"/>
					</TrackLine>
					<TrackLine>
						<End x="164.1842" y="39.8"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1158" y="38.15"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1842" y="38.15"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7666" y="38.5"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1334" y="38.5"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8842" y="38.05"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8945" y="38.0457"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1585" y="36"/>
					</TrackLine>
					<TrackLine>
						<End x="183.51" y="35.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6" y="35.25"/>
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
					<Start x="207.9" y="80.35"/>
					<TrackLine>
						<End x="207.9" y="85.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="88.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="89.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="93.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="94.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="211.65" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD2"/>
				<Subwire width="0.3">
					<Start x="205.4" y="80.35"/>
					<TrackLine>
						<End x="205.4" y="77.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="204.6678" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="199.7903" y="76.0667"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5097" y="76.0667"/>
					</TrackLine>
					<TrackLine>
						<End x="197.566" y="76.0714"/>
					</TrackLine>
					<TrackLine>
						<End x="195.734" y="76.0714"/>
					</TrackLine>
					<TrackLine>
						<End x="190.0434" y="75.9"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6766" y="75.9"/>
					</TrackLine>
					<TrackLine>
						<End x="181.6842" y="77.35"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6158" y="77.35"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6055" y="77.3457"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1" y="75.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BA21"/>
				<Subwire width="0.3">
					<Start x="204.15" y="94.15"/>
					<TrackLine>
						<End x="205.4" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="203.93" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="203.93" y="120.9261"/>
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
						<End x="194.2381" y="110.9728"/>
					</TrackLine>
					<TrackLine>
						<End x="194.25" y="110.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="195.5" y="96.7936"/>
					</TrackLine>
					<TrackLine>
						<End x="195.5" y="95.2936"/>
					</TrackLine>
					<TrackLine>
						<End x="195.5" y="94.0064"/>
					</TrackLine>
					<TrackLine>
						<End x="194.25" y="87.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="194.2381" y="87.3272"/>
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
						<End x="172.9" y="110.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="109.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1678" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="168.5772" y="106.7381"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8119" y="105.9728"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9136" y="83.5721"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9136" y="73.4121"/>
					</TrackLine>
					<TrackLine>
						<End x="157.9136" y="72.3879"/>
					</TrackLine>
					<TrackLine>
						<End x="159.1" y="62.5501"/>
					</TrackLine>
					<TrackLine>
						<End x="159.1845" y="62.2137"/>
					</TrackLine>
					<TrackLine>
						<End x="159.4764" y="61.5094"/>
					</TrackLine>
					<TrackLine>
						<End x="161.0699" y="57.9857"/>
					</TrackLine>
					<TrackLine>
						<End x="161.0962" y="57.9418"/>
					</TrackLine>
					<TrackLine>
						<End x="162.2418" y="56.7962"/>
					</TrackLine>
					<TrackLine>
						<End x="169.5268" y="51.2005"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8807" y="49.4684"/>
					</TrackLine>
					<TrackLine>
						<End x="172.1666" y="49.35"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4308" y="47.9333"/>
					</TrackLine>
					<TrackLine>
						<End x="178.435" y="47.9316"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1816" y="47.185"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1833" y="47.1808"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1833" y="46.5432"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2814" y="46.3062"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1816" y="44.5869"/>
					</TrackLine>
					<TrackLine>
						<End x="180.3651" y="44.2809"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7809" y="42.8651"/>
					</TrackLine>
					<TrackLine>
						<End x="185.0969" y="40.859"/>
					</TrackLine>
					<TrackLine>
						<End x="185.5213" y="40.6047"/>
					</TrackLine>
					<TrackLine>
						<End x="186.3276" y="40.2705"/>
					</TrackLine>
					<TrackLine>
						<End x="186.8074" y="40.15"/>
					</TrackLine>
					<TrackLine>
						<End x="188.9926" y="40.15"/>
					</TrackLine>
					<TrackLine>
						<End x="199.1415" y="40.675"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4585" y="40.675"/>
					</TrackLine>
					<TrackLine>
						<End x="200.6985" y="40.5756"/>
					</TrackLine>
					<TrackLine>
						<End x="201.6256" y="39.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="203.83" y="35.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="203.92" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="203.92" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="203.92" y="35.25"/>
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
						<End x="180.4" y="109.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="180.4" y="115.9178"/>
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
						<End x="175.45" y="97.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="175.45" y="96.1158"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4" y="95.4"/>
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
				<NetRef name="BAD10"/>
				<Subwire width="0.3">
					<Start x="186.65" y="105.4"/>
					<TrackLine>
						<End x="188" y="109.4015"/>
					</TrackLine>
					<TrackLine>
						<End x="188.65" y="114.8645"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6625" y="114.9142"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8699" y="115.4143"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8962" y="115.4582"/>
					</TrackLine>
					<TrackLine>
						<End x="192.5" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SEL"/>
				<Subwire width="0.3">
					<Start x="196.65" y="72.45"/>
					<TrackLine>
						<End x="192.2807" y="69.2816"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3184" y="68.3193"/>
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
						<End x="180.9178" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="99.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="181.65" y="100.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="104.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9" y="105.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="109.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="110.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="185.392" y="110.9396"/>
					</TrackLine>
					<TrackLine>
						<End x="185.392" y="111.3604"/>
					</TrackLine>
					<TrackLine>
						<End x="185.392" y="114.8604"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="114.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="185.392" y="115.9396"/>
					</TrackLine>
					<TrackLine>
						<End x="184.88" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="179.15" y="99.15"/>
					<TrackLine>
						<End x="179.2417" y="100.2485"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="177.9" y="95.4"/>
					<TrackLine>
						<End x="179.15" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="177.9" y="100.4"/>
					<TrackLine>
						<End x="179.2417" y="100.2485"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="179.15" y="105.4"/>
					<TrackLine>
						<End x="179.2417" y="100.2485"/>
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
					<Start x="181.65" y="105.4"/>
					<TrackLine>
						<End x="182.9" y="109.8822"/>
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
					<Start x="190.35" y="108.95"/>
					<TrackLine>
						<End x="190.15" y="113.5158"/>
					</TrackLine>
					<TrackLine>
						<End x="190.15" y="114.5842"/>
					</TrackLine>
					<TrackLine>
						<End x="190.1543" y="114.5945"/>
					</TrackLine>
					<TrackLine>
						<End x="190.9055" y="115.3457"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3272" y="116.7381"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3559" y="116.75"/>
					</TrackLine>
					<TrackLine>
						<End x="194.35" y="116.85"/>
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
						<End x="189.1" y="106.6658"/>
					</TrackLine>
					<TrackLine>
						<End x="189.05" y="108.4158"/>
					</TrackLine>
					<TrackLine>
						<End x="189.05" y="109.4842"/>
					</TrackLine>
					<TrackLine>
						<End x="189.4" y="114.7334"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5184" y="115.0193"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4807" y="115.9816"/>
					</TrackLine>
					<TrackLine>
						<End x="191.9024" y="117.3739"/>
					</TrackLine>
					<TrackLine>
						<End x="195.04" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD9"/>
				<Subwire width="0.3">
					<Start x="187.9" y="100.4"/>
					<TrackLine>
						<End x="187.85" y="97.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="187.85" y="96.8158"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD9"/>
				<Subwire width="0.3">
					<Start x="187.9" y="100.4"/>
					<TrackLine>
						<End x="189.15" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD15"/>
				<Subwire width="0.3">
					<Start x="177.9" y="109.05"/>
					<TrackLine>
						<End x="177.9" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD15"/>
				<Subwire width="0.3">
					<Start x="172.9" y="100.4"/>
					<TrackLine>
						<End x="172.85" y="97.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="172.85" y="96.1158"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="DIN"/>
				<Subwire width="0.3">
					<Start x="216.05" y="52.2"/>
					<TrackLine>
						<End x="199.8559" y="51.75"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8819" y="51.0616"/>
					</TrackLine>
					<TrackLine>
						<End x="196.8181" y="51.0616"/>
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
					<Start x="164.6" y="76.25"/>
					<TrackLine>
						<End x="165.9433" y="74.065"/>
					</TrackLine>
					<TrackLine>
						<End x="165.9433" y="73.035"/>
					</TrackLine>
					<TrackLine>
						<End x="165.2529" y="72.3183"/>
					</TrackLine>
					<TrackLine>
						<End x="165.2529" y="71.3017"/>
					</TrackLine>
					<TrackLine>
						<End x="165.53" y="71.0226"/>
					</TrackLine>
					<TrackLine>
						<End x="165.5342" y="71.0156"/>
					</TrackLine>
					<TrackLine>
						<End x="169.975" y="63.3367"/>
					</TrackLine>
					<TrackLine>
						<End x="169.975" y="62.1133"/>
					</TrackLine>
					<TrackLine>
						<End x="170.6633" y="61.425"/>
					</TrackLine>
					<TrackLine>
						<End x="171.0678" y="61.35"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8" y="60.6178"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8" y="59.5822"/>
					</TrackLine>
					<TrackLine>
						<End x="171.15" y="57.2"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="175.95" y="83.35"/>
					<TrackLine>
						<End x="176.45" y="79.8158"/>
					</TrackLine>
					<TrackLine>
						<End x="176.4543" y="79.8055"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2055" y="79.0543"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2158" y="79.05"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3166" y="78.86"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6834" y="78.86"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7435" y="79.1107"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8734" y="79.1247"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5758" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="194.6442" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1941" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="199.6905" y="79.2319"/>
					</TrackLine>
					<TrackLine>
						<End x="199.7125" y="79.2228"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8658" y="79.0696"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8694" y="79.0681"/>
					</TrackLine>
					<TrackLine>
						<End x="200.9306" y="79.0681"/>
					</TrackLine>
					<TrackLine>
						<End x="200.9342" y="79.0696"/>
					</TrackLine>
					<TrackLine>
						<End x="201.0875" y="79.2228"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1095" y="79.2319"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1905" y="79.2319"/>
					</TrackLine>
					<TrackLine>
						<End x="202.2125" y="79.2228"/>
					</TrackLine>
					<TrackLine>
						<End x="204.15" y="77.9"/>
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
						<End x="195.8543" y="58.4055"/>
					</TrackLine>
					<TrackLine>
						<End x="195.85" y="58.4158"/>
					</TrackLine>
					<TrackLine>
						<End x="195.7" y="60.6666"/>
					</TrackLine>
					<TrackLine>
						<End x="195.7" y="62.0334"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8184" y="62.3193"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7807" y="63.2816"/>
					</TrackLine>
					<TrackLine>
						<End x="197.0666" y="63.4"/>
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
						<End x="181.7658" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="182.8342" y="55.55"/>
					</TrackLine>
					<TrackLine>
						<End x="182.8445" y="55.5543"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8247" y="57.3833"/>
					</TrackLine>
					<TrackLine>
						<End x="185.5667" y="58.1253"/>
					</TrackLine>
					<TrackLine>
						<End x="185.5667" y="59.1747"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6543" y="61.3555"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="61.3658"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="62.4342"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6543" y="62.4445"/>
					</TrackLine>
					<TrackLine>
						<End x="184.7043" y="64.8945"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9543" y="67.3445"/>
					</TrackLine>
					<TrackLine>
						<End x="187.7055" y="68.0957"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8344" y="74.1515"/>
					</TrackLine>
					<TrackLine>
						<End x="196.0206" y="74.2286"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2794" y="74.2286"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2264" y="74.2167"/>
					</TrackLine>
					<TrackLine>
						<End x="200.8833" y="74.2167"/>
					</TrackLine>
					<TrackLine>
						<End x="209.4396" y="72.892"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8604" y="72.892"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8822" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="210.9178" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="210.9396" y="72.892"/>
					</TrackLine>
					<TrackLine>
						<End x="211.3604" y="72.892"/>
					</TrackLine>
					<TrackLine>
						<End x="211.658" y="73.1896"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="73.3015"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="73.7985"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="75.1485"/>
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
						<End x="215.4" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="214.09" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="214.09" y="120.9261"/>
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
						<End x="182.4" y="58.1158"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4" y="59.1842"/>
					</TrackLine>
					<TrackLine>
						<End x="181.95" y="61.1334"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8316" y="61.4193"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0801" y="67.5143"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0538" y="67.5582"/>
					</TrackLine>
					<TrackLine>
						<End x="177.9082" y="68.7038"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8643" y="68.7301"/>
					</TrackLine>
					<TrackLine>
						<End x="175.9082" y="69.7139"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4348" y="69.91"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1985" y="69.91"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9713" y="70.0041"/>
					</TrackLine>
					<TrackLine>
						<End x="174.0541" y="70.9213"/>
					</TrackLine>
					<TrackLine>
						<End x="173.96" y="71.1485"/>
					</TrackLine>
					<TrackLine>
						<End x="172.85" y="77.5158"/>
					</TrackLine>
					<TrackLine>
						<End x="172.85" y="78.5842"/>
					</TrackLine>
					<TrackLine>
						<End x="172.95" y="82.4658"/>
					</TrackLine>
					<TrackLine>
						<End x="172.95" y="83.5342"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9457" y="83.5445"/>
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
					<Start x="227.75" y="80.4"/>
					<TrackLine>
						<End x="223.4178" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3822" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="219.7228" y="76.5619"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3272" y="75.4881"/>
					</TrackLine>
					<TrackLine>
						<End x="211.7228" y="72.0619"/>
					</TrackLine>
					<TrackLine>
						<End x="211.6941" y="72.05"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IAKO"/>
				<Subwire width="0.3">
					<Start x="227.75" y="75.4"/>
					<TrackLine>
						<End x="228.15" y="67.4645"/>
					</TrackLine>
					<TrackLine>
						<End x="228.15" y="65.8355"/>
					</TrackLine>
					<TrackLine>
						<End x="228.1375" y="65.7858"/>
					</TrackLine>
					<TrackLine>
						<End x="227.9301" y="65.2857"/>
					</TrackLine>
					<TrackLine>
						<End x="227.9038" y="65.2418"/>
					</TrackLine>
					<TrackLine>
						<End x="226.0892" y="62.2458"/>
					</TrackLine>
					<TrackLine>
						<End x="220.8033" y="54.969"/>
					</TrackLine>
					<TrackLine>
						<End x="219.581" y="53.7467"/>
					</TrackLine>
					<TrackLine>
						<End x="219.4627" y="53.6758"/>
					</TrackLine>
					<TrackLine>
						<End x="218.9027" y="53.4436"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7688" y="53.41"/>
					</TrackLine>
					<TrackLine>
						<End x="217.0312" y="53.41"/>
					</TrackLine>
					<TrackLine>
						<End x="216.5612" y="53.4341"/>
					</TrackLine>
					<TrackLine>
						<End x="215.5388" y="53.4341"/>
					</TrackLine>
					<TrackLine>
						<End x="211.3133" y="53.05"/>
					</TrackLine>
					<TrackLine>
						<End x="199.7067" y="52.5"/>
					</TrackLine>
					<TrackLine>
						<End x="197.35" y="52.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="174.15" y="78.05"/>
					<TrackLine>
						<End x="174.63" y="71.2947"/>
					</TrackLine>
					<TrackLine>
						<End x="175.3447" y="70.58"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5176" y="70.58"/>
					</TrackLine>
					<TrackLine>
						<End x="175.6495" y="70.5469"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2082" y="70.3153"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2024" y="69.4019"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3732" y="69.2995"/>
					</TrackLine>
					<TrackLine>
						<End x="179.6495" y="68.0232"/>
					</TrackLine>
					<TrackLine>
						<End x="179.7519" y="67.8524"/>
					</TrackLine>
					<TrackLine>
						<End x="183.0184" y="60.9307"/>
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
						<End x="187.4342" y="80.85"/>
					</TrackLine>
					<TrackLine>
						<End x="186.3658" y="80.85"/>
					</TrackLine>
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
						<End x="187.9346" y="82.78"/>
					</TrackLine>
					<TrackLine>
						<End x="188.62" y="83.4654"/>
					</TrackLine>
					<TrackLine>
						<End x="188.62" y="84.4346"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9346" y="85.12"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9654" y="85.12"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3345" y="83.8343"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3242" y="83.83"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2558" y="83.83"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2455" y="83.8343"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4943" y="84.5855"/>
					</TrackLine>
					<TrackLine>
						<End x="182.49" y="84.5958"/>
					</TrackLine>
					<TrackLine>
						<End x="182.49" y="85.6642"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4943" y="85.6745"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2455" y="86.4257"/>
					</TrackLine>
					<TrackLine>
						<End x="183.4728" y="86.5619"/>
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
						<End x="188.9658" y="64.25"/>
					</TrackLine>
					<TrackLine>
						<End x="190.0342" y="64.25"/>
					</TrackLine>
					<TrackLine>
						<End x="190.0445" y="64.2543"/>
					</TrackLine>
					<TrackLine>
						<End x="190.7957" y="65.0055"/>
					</TrackLine>
					<TrackLine>
						<End x="190.8" y="65.0158"/>
					</TrackLine>
					<TrackLine>
						<End x="191.95" y="67.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="191.9543" y="67.8945"/>
					</TrackLine>
					<TrackLine>
						<End x="192.7055" y="68.6457"/>
					</TrackLine>
					<TrackLine>
						<End x="192.7158" y="68.65"/>
					</TrackLine>
					<TrackLine>
						<End x="206.9658" y="71.05"/>
					</TrackLine>
					<TrackLine>
						<End x="208.0342" y="71.05"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8822" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="210.9178" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3822" y="75.4"/>
					</TrackLine>
					<TrackLine>
						<End x="223.4178" y="75.4"/>
					</TrackLine>
					<TrackLine>
						<End x="229.8822" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="230.9178" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="231.65" y="77.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="231.75" y="74.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="231.75" y="64.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="231.75" y="63.6059"/>
					</TrackLine>
					<TrackLine>
						<End x="230.05" y="48.3842"/>
					</TrackLine>
					<TrackLine>
						<End x="230.05" y="47.3158"/>
					</TrackLine>
					<TrackLine>
						<End x="230.61" y="43.6442"/>
					</TrackLine>
					<TrackLine>
						<End x="230.61" y="42.5758"/>
					</TrackLine>
					<TrackLine>
						<End x="230.6057" y="42.5655"/>
					</TrackLine>
					<TrackLine>
						<End x="229.2381" y="41.0772"/>
					</TrackLine>
					<TrackLine>
						<End x="228.4728" y="40.3119"/>
					</TrackLine>
					<TrackLine>
						<End x="228.4441" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="227.3559" y="40.3"/>
					</TrackLine>
					<TrackLine>
						<End x="227.3272" y="40.3119"/>
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
						<End x="224.25" y="63.6059"/>
					</TrackLine>
					<TrackLine>
						<End x="224.2381" y="63.5772"/>
					</TrackLine>
					<TrackLine>
						<End x="219.16" y="56.1281"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4219" y="55.39"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3781" y="55.39"/>
					</TrackLine>
					<TrackLine>
						<End x="216.9246" y="55.4865"/>
					</TrackLine>
					<TrackLine>
						<End x="215.1754" y="55.4865"/>
					</TrackLine>
					<TrackLine>
						<End x="210.9441" y="55.3"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8559" y="55.3"/>
					</TrackLine>
					<TrackLine>
						<End x="204.8559" y="55.3"/>
					</TrackLine>
					<TrackLine>
						<End x="196.8588" y="55.4142"/>
					</TrackLine>
					<TrackLine>
						<End x="193.3445" y="58.7957"/>
					</TrackLine>
					<TrackLine>
						<End x="193.3342" y="58.8"/>
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
						<End x="184.4734" y="83.08"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1066" y="83.08"/>
					</TrackLine>
					<TrackLine>
						<End x="182.8207" y="83.1984"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8584" y="84.1607"/>
					</TrackLine>
					<TrackLine>
						<End x="181.74" y="84.4466"/>
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
						<End x="200.35" y="89.8658"/>
					</TrackLine>
					<TrackLine>
						<End x="200.35" y="90.9342"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="93.6322"/>
					</TrackLine>
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
					<Start x="226.9934" y="102.9686"/>
					<TrackLine>
						<End x="227.9" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="46.1"/>
					<TrackLine>
						<End x="203.7058" y="46.1"/>
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
					<Start x="185.65" y="51.85"/>
					<TrackLine>
						<End x="189.4323" y="56.1061"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2539" y="56.9277"/>
					</TrackLine>
					<TrackLine>
						<End x="190.3561" y="56.97"/>
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
					<Start x="205.4" y="61.65"/>
					<TrackLine>
						<End x="207.8" y="58.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="109.15"/>
					<TrackLine>
						<End x="222" y="108.8"/>
					</TrackLine>
					<TrackLine>
						<End x="222" y="108.4"/>
					</TrackLine>
					<TrackLine>
						<End x="222" y="108.2343"/>
					</TrackLine>
					<TrackLine>
						<End x="226.9934" y="102.9686"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="230" y="83.15"/>
					<TrackLine>
						<End x="230.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="49.15"/>
					<TrackLine>
						<End x="207.1856" y="50.7001"/>
					</TrackLine>
					<TrackLine>
						<End x="207.3062" y="50.75"/>
					</TrackLine>
					<TrackLine>
						<End x="216.6048" y="50.7961"/>
					</TrackLine>
					<TrackLine>
						<End x="216.6533" y="50.8162"/>
					</TrackLine>
					<TrackLine>
						<End x="216.9262" y="51.0883"/>
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
					<Start x="230.0617" y="89.3718"/>
					<TrackLine>
						<End x="231.5" y="89.95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="97.9"/>
					<TrackLine>
						<End x="226.9934" y="102.9686"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="231.35" y="47.85"/>
					<TrackLine>
						<End x="231.61" y="43.8431"/>
					</TrackLine>
					<TrackLine>
						<End x="231.61" y="42.3769"/>
					</TrackLine>
					<TrackLine>
						<End x="230.77" y="35.5657"/>
					</TrackLine>
					<TrackLine>
						<End x="230.77" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="230.77" y="35"/>
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
					<Start x="219.15" y="77.9"/>
					<TrackLine>
						<End x="221.3" y="82.7521"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7979" y="83.25"/>
					</TrackLine>
					<TrackLine>
						<End x="222.5021" y="83.25"/>
					</TrackLine>
					<TrackLine>
						<End x="224.0021" y="83.25"/>
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
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="173.4938" y="45.05"/>
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
					<Start x="165.25" y="37.05"/>
					<TrackLine>
						<End x="164.73" y="35.5657"/>
					</TrackLine>
					<TrackLine>
						<End x="164.73" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="164.73" y="35"/>
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
					<Start x="230.0617" y="89.3718"/>
					<TrackLine>
						<End x="227.9" y="92.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="230" y="83.15"/>
					<TrackLine>
						<End x="230.0617" y="89.3718"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="110.4"/>
					<TrackLine>
						<End x="193.25" y="106.5021"/>
					</TrackLine>
					<TrackLine>
						<End x="193.25" y="105.0021"/>
					</TrackLine>
					<TrackLine>
						<End x="193.25" y="104.2979"/>
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
					<Start x="200.4" y="45.4"/>
					<TrackLine>
						<End x="189.15" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="207.5" y="69.75"/>
					<TrackLine>
						<End x="193.25" y="67.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="185.65" y="51.85"/>
					<TrackLine>
						<End x="186.5" y="47.393"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="100.4"/>
					<TrackLine>
						<End x="194.5" y="96.5021"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5" y="95.0021"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5" y="94.2979"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9" y="87.9"/>
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
						<End x="210.4" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="210.4" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="209.01" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="209.01" y="120.9261"/>
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
						<End x="186.2833" y="59.4747"/>
					</TrackLine>
					<TrackLine>
						<End x="186.2833" y="57.9799"/>
					</TrackLine>
					<TrackLine>
						<End x="184.35" y="52.3842"/>
					</TrackLine>
					<TrackLine>
						<End x="184.35" y="51.3158"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="47.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="46.1529"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6043" y="44.6555"/>
					</TrackLine>
					<TrackLine>
						<End x="187.3555" y="43.9043"/>
					</TrackLine>
					<TrackLine>
						<End x="187.3658" y="43.9"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4342" y="43.9"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6795" y="44.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="200.9317" y="44.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="203.8362" y="44.8852"/>
					</TrackLine>
					<TrackLine>
						<End x="203.8553" y="44.89"/>
					</TrackLine>
					<TrackLine>
						<End x="205.9012" y="44.89"/>
					</TrackLine>
					<TrackLine>
						<End x="206.784" y="45.1991"/>
					</TrackLine>
					<TrackLine>
						<End x="206.9867" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="208.8133" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="220.9441" y="43"/>
					</TrackLine>
					<TrackLine>
						<End x="220.9728" y="42.9881"/>
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
						<End x="163.9543" y="45.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="163.95" y="45.2342"/>
					</TrackLine>
					<TrackLine>
						<End x="163.95" y="44.1658"/>
					</TrackLine>
					<TrackLine>
						<End x="163.9543" y="44.1555"/>
					</TrackLine>
					<TrackLine>
						<End x="164.7055" y="43.4043"/>
					</TrackLine>
					<TrackLine>
						<End x="164.7158" y="43.4"/>
					</TrackLine>
					<TrackLine>
						<End x="167.9658" y="43.4"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0342" y="43.4"/>
					</TrackLine>
					<TrackLine>
						<End x="174.4158" y="43.65"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4842" y="43.65"/>
					</TrackLine>
					<TrackLine>
						<End x="186.0681" y="39.566"/>
					</TrackLine>
					<TrackLine>
						<End x="186.119" y="39.5494"/>
					</TrackLine>
					<TrackLine>
						<End x="186.656" y="39.4142"/>
					</TrackLine>
					<TrackLine>
						<End x="186.7448" y="39.4"/>
					</TrackLine>
					<TrackLine>
						<End x="189.0552" y="39.4"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2874" y="39.9875"/>
					</TrackLine>
					<TrackLine>
						<End x="200.3126" y="39.9875"/>
					</TrackLine>
					<TrackLine>
						<End x="201.0375" y="39.2626"/>
					</TrackLine>
					<TrackLine>
						<End x="201.38" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="201.38" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="201.38" y="35.25"/>
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
						<End x="189.15" y="94.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4178" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="185.9441" y="94.05"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8559" y="94.05"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3559" y="94.05"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8822" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="94.8822"/>
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
						<End x="222.4158" y="91.05"/>
					</TrackLine>
					<TrackLine>
						<End x="223.4842" y="91.05"/>
					</TrackLine>
					<TrackLine>
						<End x="223.4945" y="91.0543"/>
					</TrackLine>
					<TrackLine>
						<End x="227.3272" y="94.2381"/>
					</TrackLine>
					<TrackLine>
						<End x="227.3559" y="94.25"/>
					</TrackLine>
					<TrackLine>
						<End x="228.4441" y="94.25"/>
					</TrackLine>
					<TrackLine>
						<End x="228.4728" y="94.2381"/>
					</TrackLine>
					<TrackLine>
						<End x="232.0445" y="91.2457"/>
					</TrackLine>
					<TrackLine>
						<End x="232.7957" y="90.4945"/>
					</TrackLine>
					<TrackLine>
						<End x="232.8" y="90.4842"/>
					</TrackLine>
					<TrackLine>
						<End x="232.8" y="89.4158"/>
					</TrackLine>
					<TrackLine>
						<End x="232.58" y="64.6842"/>
					</TrackLine>
					<TrackLine>
						<End x="232.58" y="63.6158"/>
					</TrackLine>
					<TrackLine>
						<End x="232.65" y="48.3842"/>
					</TrackLine>
					<TrackLine>
						<End x="232.65" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="232.65" y="35.25"/>
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
						<End x="170.9205" y="70.2276"/>
					</TrackLine>
					<TrackLine>
						<End x="171.2547" y="69.4213"/>
					</TrackLine>
					<TrackLine>
						<End x="171.509" y="68.9969"/>
					</TrackLine>
					<TrackLine>
						<End x="173.3543" y="66.8055"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1055" y="66.0543"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1158" y="66.05"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1842" y="66.05"/>
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
						<End x="170.4307" y="52.4184"/>
					</TrackLine>
					<TrackLine>
						<End x="163.1055" y="58.0543"/>
					</TrackLine>
					<TrackLine>
						<End x="162.3543" y="58.8055"/>
					</TrackLine>
					<TrackLine>
						<End x="160.8199" y="62.1857"/>
					</TrackLine>
					<TrackLine>
						<End x="160.6125" y="62.6858"/>
					</TrackLine>
					<TrackLine>
						<End x="160.6" y="62.7355"/>
					</TrackLine>
					<TrackLine>
						<End x="160.6" y="64.3645"/>
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
					<Start x="171.65" y="91.45"/>
					<TrackLine>
						<End x="183.4342" y="89.2001"/>
					</TrackLine>
					<TrackLine>
						<End x="183.4445" y="89.1958"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6222" y="89.0199"/>
					</TrackLine>
					<TrackLine>
						<End x="184.6578" y="89.0199"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8515" y="89.2018"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8644" y="89.2072"/>
					</TrackLine>
					<TrackLine>
						<End x="185.9356" y="89.2072"/>
					</TrackLine>
					<TrackLine>
						<End x="187.3295" y="89.11"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4012" y="89.11"/>
					</TrackLine>
					<TrackLine>
						<End x="189.11" y="88.4012"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="190.9184" y="84.2307"/>
					</TrackLine>
					<TrackLine>
						<End x="191.8807" y="83.2684"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1666" y="83.15"/>
					</TrackLine>
					<TrackLine>
						<End x="205.9178" y="81.6"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="80.8678"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR18"/>
				<Subwire width="0.3">
					<Start x="171.65" y="83"/>
					<TrackLine>
						<End x="172.1" y="77.3666"/>
					</TrackLine>
					<TrackLine>
						<End x="173.29" y="71.0152"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4861" y="70.5418"/>
					</TrackLine>
					<TrackLine>
						<End x="174.5918" y="69.4361"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0652" y="69.24"/>
					</TrackLine>
					<TrackLine>
						<End x="175.3015" y="69.24"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5287" y="69.1459"/>
					</TrackLine>
					<TrackLine>
						<End x="177.4693" y="68.0816"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4316" y="67.1193"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1957" y="60.9945"/>
					</TrackLine>
					<TrackLine>
						<End x="181.2" y="60.9842"/>
					</TrackLine>
					<TrackLine>
						<End x="181.2" y="59.9158"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1" y="58.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SD3"/>
				<Subwire width="0.3">
					<Start x="217.9" y="49.15"/>
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
						<End x="204.8433" y="75.8"/>
					</TrackLine>
					<TrackLine>
						<End x="199.9129" y="75.45"/>
					</TrackLine>
					<TrackLine>
						<End x="198.3871" y="75.45"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4901" y="75.4571"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8099" y="75.4571"/>
					</TrackLine>
					<TrackLine>
						<End x="194.8957" y="75.3831"/>
					</TrackLine>
					<TrackLine>
						<End x="190.1745" y="75.15"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5455" y="75.15"/>
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
						<End x="209.8822" y="62.9"/>
					</TrackLine>
					<TrackLine>
						<End x="205.9441" y="63"/>
					</TrackLine>
					<TrackLine>
						<End x="204.8559" y="63"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2158" y="62.65"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2055" y="62.6457"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4543" y="61.8945"/>
					</TrackLine>
					<TrackLine>
						<End x="196.45" y="61.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="196.45" y="60.8158"/>
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
						<End x="198.1207" y="73.362"/>
					</TrackLine>
					<TrackLine>
						<End x="197.7388" y="73.4579"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1323" y="73.6143"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1677" y="73.6143"/>
					</TrackLine>
					<TrackLine>
						<End x="191.8418" y="69.9038"/>
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
						<End x="193.4266" y="80"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7265" y="79.7493"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5966" y="79.7353"/>
					</TrackLine>
					<TrackLine>
						<End x="183.5342" y="79.61"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4658" y="79.61"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4555" y="79.6143"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7043" y="80.3655"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0457" y="84.4945"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2945" y="85.2457"/>
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
					<Start x="190.4" y="107.2"/>
					<TrackLine>
						<End x="190.392" y="106.3604"/>
					</TrackLine>
					<TrackLine>
						<End x="190.392" y="105.9396"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4" y="105.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4" y="104.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="190.392" y="104.8604"/>
					</TrackLine>
					<TrackLine>
						<End x="190.392" y="104.4396"/>
					</TrackLine>
					<TrackLine>
						<End x="191.683" y="101.3708"/>
					</TrackLine>
					<TrackLine>
						<End x="191.683" y="100.9292"/>
					</TrackLine>
					<TrackLine>
						<End x="191.675" y="100.9074"/>
					</TrackLine>
					<TrackLine>
						<End x="191.675" y="99.8926"/>
					</TrackLine>
					<TrackLine>
						<End x="191.683" y="99.8708"/>
					</TrackLine>
					<TrackLine>
						<End x="191.683" y="99.4292"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4" y="95.4"/>
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
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="224.7" y="69"/>
					<TrackLine>
						<End x="224.15" y="67.1471"/>
					</TrackLine>
					<TrackLine>
						<End x="224.15" y="66.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="223.4178" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3822" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="64.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="61.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4145" y="59.0643"/>
					</TrackLine>
					<TrackLine>
						<End x="215.4042" y="59.06"/>
					</TrackLine>
					<TrackLine>
						<End x="210.9178" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8822" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="58.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="209.15" y="60.4"/>
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
					<Start x="199.2845" y="124.365"/>
					<TrackLine>
						<End x="198.85" y="123.4661"/>
					</TrackLine>
					<TrackLine>
						<End x="198.85" y="122.4139"/>
					</TrackLine>
					<TrackLine>
						<End x="198.1061" y="121.67"/>
					</TrackLine>
					<TrackLine>
						<End x="197.0539" y="121.67"/>
					</TrackLine>
					<TrackLine>
						<End x="196.31" y="122.4139"/>
					</TrackLine>
					<TrackLine>
						<End x="196.31" y="123.225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.0203">
					<Teardrops>
						<Teardrop>
							<Dot x="196.31" y="123.225"/>
							<Dot x="196.3712" y="123.3305"/>
							<Dot x="196.2636" y="123.3929"/>
							<Dot x="196.2034" y="123.2841"/>
						</Teardrop>
					</Teardrops>
					<Start x="196.31" y="123.225"/>
					<TrackLine>
						<End x="196.2502" y="123.4413"/>
					</TrackLine>
					<TrackLine>
						<End x="195.5413" y="124.1502"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5387" y="124.1502"/>
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
					<Start x="222.95" y="92.35"/>
					<TrackLine>
						<End x="229.2381" y="101.0772"/>
					</TrackLine>
					<TrackLine>
						<End x="229.25" y="101.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="229.25" y="102.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="229.25" y="107.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="229.2381" y="107.2228"/>
					</TrackLine>
					<TrackLine>
						<End x="218.9109" y="123.3587"/>
					</TrackLine>
					<TrackLine>
						<End x="218.3335" y="123.9375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="192.5" y="122.94"/>
					<TrackLine>
						<End x="190.4861" y="121.67"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3539" y="121.67"/>
					</TrackLine>
					<TrackLine>
						<End x="183.61" y="120.9261"/>
					</TrackLine>
					<TrackLine>
						<End x="183.61" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="184.2" y="117.7342"/>
					</TrackLine>
					<TrackLine>
						<End x="184.2" y="116.6658"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="115.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.0203">
					<Teardrops>
						<Teardrop>
							<Dot x="199.2845" y="124.365"/>
							<Dot x="199.3528" y="124.2639"/>
							<Dot x="199.4559" y="124.3336"/>
							<Dot x="199.3842" y="124.4353"/>
						</Teardrop>
					</Teardrops>
					<Start x="218.3335" y="123.9375"/>
					<TrackLine>
						<End x="218.3187" y="123.9509"/>
					</TrackLine>
					<TrackLine>
						<End x="215.8613" y="124.1502"/>
					</TrackLine>
					<TrackLine>
						<End x="199.7716" y="124.2758"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2845" y="124.365"/>
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
		<View scale="5.84095" scrollHorz="197.15" scrollVert="76.225"/>
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
			<GridSpace x="25400" y="25400"/>
		</Grid>
		<LayersVisualOptions>
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
				<LayerRef name="BotMask"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopSilk"/>
				<Colors details="#50281b" pads="#402015" fix="#50281b"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotSilk"/>
				<Colors details="#122e1c" pads="#0e2416" fix="#122e1c"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopPaste"/>
				<Colors details="#af583a" pads="#8c462e" fix="#af583a"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotPaste"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopAssy"/>
				<Colors details="#259500" pads="#259500" fix="#165900"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotAssy"/>
				<Colors details="#00aaaa" pads="#00aaaa" fix="#006666"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
		</LayersVisualOptions>
		<ColorNets enabled="on" colorizeWire="on" colorizePad="on" colorizeCopper="on" colorizeVia="on" colorizeNetline="on"/>
		<FilterNetlines/>
	</DisplayControl>

	<DialogSettings version="1.2">
		<DRCSettings logFileName="drc.log" messageLimit="1000"
		 tolerance="0.001"
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