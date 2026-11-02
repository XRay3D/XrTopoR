<?xml version="1.0" encoding="UTF-8"?>

<!--***************************************-->
<!--   File    : Arcs_master.fst           -->
<!--   Format  : TopoR PCB file            -->
<!--   Version : 1.2.1                     -->
<!--   Program : TopoR Lite 7.0.18699      -->
<!--   Date    : Monday, November 02, 2026 -->
<!--   Time    : 20:49                     -->
<!--***************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.2.1</Version>
		<Program>TopoR Lite 7.0.18699</Program>
		<Date>Monday, November 02, 2026 20:49</Date>
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
				<Org x="228.4885" y="76.1531"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="220.4" y="92.2721"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="226.5029" y="39.0887"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SD3"/>
				<Org x="220.9998" y="44.3016"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD8"/>
				<Org x="190.9209" y="107.3"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="#TDI"/>
				<Org x="190.5253" y="89.8094"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="204.6101" y="46.5431"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="199.151" y="59.4538"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="-IOW"/>
				<Org x="175.2895" y="113.0175"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="175.5215" y="106.857"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR19"/>
				<Org x="177.1011" y="78.0308"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="175.2528" y="61.6221"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IAKO"/>
				<Org x="227.7823" y="78.6925"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="EB1"/>
				<Org x="221.089" y="51.0058"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SD6"/>
				<Org x="228.8675" y="40.1367"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD11"/>
				<Org x="189.7644" y="109.2034"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD2"/>
				<Org x="204.797" y="79.8088"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="WTBT"/>
				<Org x="214.5041" y="65.062"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DOUT"/>
				<Org x="196.9716" y="56.6431"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="191.1496" y="55.7094"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IAKO"/>
				<Org x="198.0305" y="53.1292"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD12"/>
				<Org x="183.2422" y="117.1743"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD10"/>
				<Org x="182.9975" y="82.1977"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="170.7893" y="76.3125"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="176.9977" y="72.4229"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D1"/>
				<Org x="175.4548" y="63.3383"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="174.9971" y="67.0038"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD15"/>
				<Org x="181.5105" y="59.1607"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D0"/>
				<Org x="174.8556" y="59.9155"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="OSC"/>
				<Org x="180.4723" y="41.2719"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="169.8857" y="46.9218"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A3"/>
				<Org x="176.8655" y="36.6338"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A3"/>
				<Org x="169.1098" y="36.55"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BDOUT"/>
				<Org x="224.3396" y="67.9"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SD3"/>
				<Org x="218.6942" y="46.4924"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="EB1"/>
				<Org x="214.549" y="59.1112"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D3"/>
				<Org x="206.0013" y="76"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BDOUT"/>
				<Org x="209.1019" y="60.3709"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D2"/>
				<Org x="209.8673" y="38.9922"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BSIA"/>
				<Org x="202.9" y="83.9604"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D2"/>
				<Org x="198.6058" y="37.3"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D2"/>
				<Org x="202.0335" y="38.6772"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="-IOW"/>
				<Org x="191.522" y="114.0868"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DB"/>
				<Org x="196.3065" y="53.3002"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="185.6" y="67.8597"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD11"/>
				<Org x="187.1405" y="82.0334"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D6"/>
				<Org x="186.4266" y="59.7044"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="EB1"/>
				<Org x="187.3175" y="46.6635"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD1"/>
				<Org x="179.3375" y="81.3859"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD2"/>
				<Org x="179.5455" y="73.3658"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D3"/>
				<Org x="181.3133" y="73.1293"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD14"/>
				<Org x="179.5453" y="62.0883"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR18"/>
				<Org x="173.7924" y="90.5025"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR18"/>
				<Org x="171.7867" y="83.1958"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A0"/>
				<Org x="170.917" y="60.1027"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR20"/>
				<Org x="173.3814" y="52.8943"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="169.0376" y="84.4798"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR19"/>
				<Org x="168.4651" y="74.235"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="168.5215" y="39.7399"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="232.712" y="84.8644"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="233.5809" y="65.3875"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="230.3837" y="47.8692"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="232.5955" y="42.1271"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BDOUT"/>
				<Org x="222.25" y="92.25"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BIAKO"/>
				<Org x="226.6079" y="86.5032"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DB"/>
				<Org x="224.3396" y="72.9"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RPLY_I"/>
				<Org x="225.2576" y="65.3794"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="P1"/>
				<Org x="219.3396" y="62.9"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DIN"/>
				<Org x="215.8616" y="52.4868"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="219.7018" y="52.2372"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD2"/>
				<Org x="206.6666" y="81.6141"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="202.6998" y="66.406"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="208.0626" y="56.2849"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="207.3718" y="60.2085"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BSEL"/>
				<Org x="199.7193" y="117.6208"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="202.3311" y="103.5252"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="201.6974" y="91.5"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD13"/>
				<Org x="198.225" y="80.5041"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD13"/>
				<Org x="197.5274" y="72.6387"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="P1"/>
				<Org x="198.6608" y="63.5818"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="199.0496" y="48.9047"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD11"/>
				<Org x="191.7843" y="117.042"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="193.054" y="100.464"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="195.7656" y="105.3914"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="-IOW"/>
				<Org x="193.245" y="85.9997"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD4"/>
				<Org x="193.4264" y="78.0228"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SEL"/>
				<Org x="196.0354" y="71.5741"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="192.8913" y="64.1182"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="192.9426" y="66.722"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SIA"/>
				<Org x="193.0068" y="55.6044"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="192.9531" y="57.4549"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="WTBT"/>
				<Org x="196.9569" y="58.3712"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="193.9676" y="48.3847"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DIN"/>
				<Org x="194.5581" y="52.7863"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="189.15" y="96.8396"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD6"/>
				<Org x="186.3073" y="86.33"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD7"/>
				<Org x="187.2183" y="89.658"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD7"/>
				<Org x="184.9061" y="89.6584"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD6"/>
				<Org x="184.5585" y="84.7966"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD4"/>
				<Org x="189.4296" y="76.3037"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD10"/>
				<Org x="187.2207" y="78.8377"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD9"/>
				<Org x="186.269" y="80.4461"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D7"/>
				<Org x="187.4322" y="64.5732"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ_B"/>
				<Org x="185.3651" y="61.3354"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SEL"/>
				<Org x="190.5179" y="66.5304"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD13"/>
				<Org x="188.7446" y="65.8959"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RPLY_I"/>
				<Org x="187.7358" y="55.8232"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD12"/>
				<Org x="183.2545" y="59.767"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="186.415" y="51.5343"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="188.7383" y="51.1863"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="187.2296" y="48.4969"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD15"/>
				<Org x="175.6947" y="108.6854"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD1"/>
				<Org x="179.4841" y="76.284"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR17"/>
				<Org x="180.3124" y="71.719"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="175.8001" y="65.1816"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR16"/>
				<Org x="177.8937" y="56.0496"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D4"/>
				<Org x="178.1859" y="58.5994"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR18"/>
				<Org x="180.1808" y="60.3482"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="#TCLK"/>
				<Org x="179.8336" y="50.6009"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="178.2088" y="51.5288"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="REST"/>
				<Org x="181.025" y="47.1653"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="179.6264" y="36.561"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="174.15" y="96.6847"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD12"/>
				<Org x="174.9148" y="79.9626"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A5"/>
				<Org x="169.472" y="63.3487"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="170.95" y="62.4025"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR19"/>
				<Org x="170.7914" y="56.7331"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="172.4685" y="54.3991"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A5"/>
				<Org x="169.217" y="60.472"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="#TDO"/>
				<Org x="173.796" y="51.0396"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="177.2781" y="41.5527"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D2"/>
				<Org x="175.4852" y="40.7205"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="168.5208" y="91.7671"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="164.34" y="78.6849"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="167.862" y="69.5984"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="171.4686" y="70.7017"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ7"/>
				<Org x="169.6035" y="70.5488"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A0"/>
				<Org x="164.5607" y="64.0791"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ7"/>
				<Org x="167.0291" y="66.9955"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="165.0283" y="60.7434"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="-IOR"/>
				<Org x="168.2366" y="45.2231"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="166.5566" y="41.4671"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="170.0167" y="44.3501"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ7"/>
				<Org x="165.0755" y="40.3668"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="167.2373" y="37.2504"/>
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
					<Start x="175.4548" y="63.3383"/>
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
					<Start x="174.8556" y="59.9155"/>
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
						<End x="201.1322" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="94.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="93.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="199.6678" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="189.9911" y="91.1094"/>
					</TrackLine>
					<TrackLine>
						<End x="189.9808" y="91.1051"/>
					</TrackLine>
					<TrackLine>
						<End x="189.2296" y="90.3539"/>
					</TrackLine>
					<TrackLine>
						<End x="189.2253" y="90.3436"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="190.6264" y="77.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="190.6389" y="77.1586"/>
					</TrackLine>
					<TrackLine>
						<End x="190.7296" y="76.8379"/>
					</TrackLine>
					<TrackLine>
						<End x="190.7296" y="75.7695"/>
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
					<Start x="178.1859" y="58.5994"/>
					<TrackLine>
						<End x="177.5" y="61.4059"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5" y="62.7707"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8" y="68.7808"/>
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
					<Start x="185.3651" y="61.3354"/>
					<TrackLine>
						<End x="180.079" y="63.3859"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0116" y="63.3859"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0022" y="63.382"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2516" y="62.6314"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2477" y="62.622"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2477" y="61.5546"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8808" y="59.814"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8851" y="59.8037"/>
					</TrackLine>
					<TrackLine>
						<End x="179.4608" y="59.1275"/>
					</TrackLine>
					<TrackLine>
						<End x="179.4608" y="58.0713"/>
					</TrackLine>
					<TrackLine>
						<End x="178.714" y="57.3245"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3656" y="57.3245"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9692" y="56.85"/>
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
					<Start x="168.5208" y="91.7671"/>
					<TrackLine>
						<End x="169.0376" y="84.4798"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="202.3311" y="103.5252"/>
					<TrackLine>
						<End x="200.3092" y="103.75"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9612" y="104.014"/>
					</TrackLine>
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
						<End x="175.5215" y="106.857"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="174.9971" y="67.0038"/>
					<TrackLine>
						<End x="174.5001" y="65.7158"/>
					</TrackLine>
					<TrackLine>
						<End x="174.45" y="64.3393"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3024" y="63.8156"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3024" y="63.7505"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9495" y="63.3976"/>
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
					<Start x="201.6974" y="91.5"/>
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
						<End x="196.925" y="79.9699"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9293" y="79.9596"/>
					</TrackLine>
					<TrackLine>
						<End x="197.6805" y="79.2084"/>
					</TrackLine>
					<TrackLine>
						<End x="199.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD14"/>
				<Subwire width="0.3">
					<Start x="179.5453" y="62.0883"/>
					<TrackLine>
						<End x="183.7886" y="61.0665"/>
					</TrackLine>
					<TrackLine>
						<End x="183.7987" y="61.0623"/>
					</TrackLine>
					<TrackLine>
						<End x="184.5498" y="60.3112"/>
					</TrackLine>
					<TrackLine>
						<End x="184.554" y="60.3011"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4358" y="55.289"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4401" y="55.2787"/>
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
					<Start x="179.8336" y="50.6009"/>
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
					<Start x="196.3065" y="53.3002"/>
					<TrackLine>
						<End x="195.8538" y="52.2418"/>
					</TrackLine>
					<TrackLine>
						<End x="195.1026" y="51.4906"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0923" y="51.4863"/>
					</TrackLine>
					<TrackLine>
						<End x="194.0239" y="51.4863"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8658" y="51.5"/>
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
					<Start x="224.3396" y="72.9"/>
					<TrackLine>
						<End x="225" y="75.9567"/>
					</TrackLine>
					<TrackLine>
						<End x="225" y="77.3433"/>
					</TrackLine>
					<TrackLine>
						<End x="224.9929" y="77.8793"/>
					</TrackLine>
					<TrackLine>
						<End x="224.9929" y="79.5057"/>
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
						<End x="224.0278" y="85.1389"/>
					</TrackLine>
					<TrackLine>
						<End x="223.8204" y="85.639"/>
					</TrackLine>
					<TrackLine>
						<End x="223.8079" y="85.6887"/>
					</TrackLine>
					<TrackLine>
						<End x="223.8079" y="87.3177"/>
					</TrackLine>
					<TrackLine>
						<End x="224.3" y="91.5666"/>
					</TrackLine>
					<TrackLine>
						<End x="224.3" y="92.9334"/>
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
					<Start x="224.3396" y="72.9"/>
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
					<Start x="168.2807" y="122.8173"/>
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
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="198.6608" y="63.5818"/>
					<TrackLine>
						<End x="196.7127" y="65.1968"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4635" y="65.3"/>
					</TrackLine>
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
				<Subwire width="0.0203">
					<Teardrops>
						<Teardrop>
							<Dot x="168.2807" y="122.8173"/>
							<Dot x="168.3853" y="122.8802"/>
							<Dot x="168.3212" y="122.9868"/>
							<Dot x="168.2159" y="122.9206"/>
						</Teardrop>
					</Teardrops>
					<Start x="218.5254" y="124.0928"/>
					<TrackLine>
						<End x="218.4013" y="124.1502"/>
					</TrackLine>
					<TrackLine>
						<End x="170.1413" y="124.1502"/>
					</TrackLine>
					<TrackLine>
						<End x="169.1387" y="124.1502"/>
					</TrackLine>
					<TrackLine>
						<End x="168.4298" y="123.4413"/>
					</TrackLine>
					<TrackLine>
						<End x="168.2807" y="122.8173"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="219.3396" y="62.9"/>
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
						<End x="234.1254" y="64.0918"/>
					</TrackLine>
					<TrackLine>
						<End x="234.8766" y="64.843"/>
					</TrackLine>
					<TrackLine>
						<End x="234.8809" y="64.8533"/>
					</TrackLine>
					<TrackLine>
						<End x="234.8809" y="65.9217"/>
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
						<End x="232.801" y="82.9241"/>
					</TrackLine>
					<TrackLine>
						<End x="232.7949" y="82.9343"/>
					</TrackLine>
					<TrackLine>
						<End x="231.4163" y="84.3199"/>
					</TrackLine>
					<TrackLine>
						<End x="231.412" y="84.3302"/>
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
						<End x="219.1295" y="123.4493"/>
					</TrackLine>
					<TrackLine>
						<End x="218.5254" y="124.0928"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR20"/>
				<Subwire width="0.3">
					<Start x="173.3814" y="52.8943"/>
					<TrackLine>
						<End x="173.7685" y="53.8649"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8" y="54.2857"/>
					</TrackLine>
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
					<Start x="187.3175" y="46.6635"/>
					<TrackLine>
						<End x="186.551" y="45.3759"/>
					</TrackLine>
					<TrackLine>
						<End x="186.5449" y="45.3657"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4343" y="44.2551"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4241" y="44.249"/>
					</TrackLine>
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
						<End x="180.2422" y="44.6153"/>
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
						<End x="175.096" y="51.5738"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0917" y="51.5841"/>
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
					<Start x="214.549" y="59.1112"/>
					<TrackLine>
						<End x="214.5827" y="51.9571"/>
					</TrackLine>
					<TrackLine>
						<End x="215.3319" y="51.2079"/>
					</TrackLine>
					<TrackLine>
						<End x="216.3913" y="51.2079"/>
					</TrackLine>
					<TrackLine>
						<End x="217.2067" y="51.25"/>
					</TrackLine>
					<TrackLine>
						<End x="218.5933" y="51.25"/>
					</TrackLine>
					<TrackLine>
						<End x="218.8976" y="51.1239"/>
					</TrackLine>
					<TrackLine>
						<End x="219.1573" y="50.9415"/>
					</TrackLine>
					<TrackLine>
						<End x="219.1676" y="50.9372"/>
					</TrackLine>
					<TrackLine>
						<End x="220.236" y="50.9372"/>
					</TrackLine>
					<TrackLine>
						<End x="221.089" y="51.0058"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="222.9" y="66.65"/>
					<TrackLine>
						<End x="218.4178" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="216.65" y="68.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="216.55" y="71.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="216.55" y="72.1941"/>
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
					<Start x="175.4852" y="40.7205"/>
					<TrackLine>
						<End x="172.2738" y="45.5369"/>
					</TrackLine>
					<TrackLine>
						<End x="171.6786" y="46.1441"/>
					</TrackLine>
					<TrackLine>
						<End x="171.6786" y="47.554"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4914" y="56.1989"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4914" y="57.2673"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4957" y="57.2776"/>
					</TrackLine>
					<TrackLine>
						<End x="170.2469" y="58.0288"/>
					</TrackLine>
					<TrackLine>
						<End x="171.3946" y="58.9497"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8502" y="59.403"/>
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
					<Start x="202.0335" y="38.6772"/>
					<TrackLine>
						<End x="198.6058" y="37.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="209.8673" y="38.9922"/>
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
						<End x="201.0193" y="118.155"/>
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
					<Start x="168.5215" y="39.7399"/>
					<TrackLine>
						<End x="168.6066" y="40.7837"/>
					</TrackLine>
					<TrackLine>
						<End x="168.6066" y="42.1505"/>
					</TrackLine>
					<TrackLine>
						<End x="168.4882" y="42.4364"/>
					</TrackLine>
					<TrackLine>
						<End x="166.9409" y="44.6786"/>
					</TrackLine>
					<TrackLine>
						<End x="166.9366" y="44.6889"/>
					</TrackLine>
					<TrackLine>
						<End x="165.2414" y="55.5978"/>
					</TrackLine>
					<TrackLine>
						<End x="165.0283" y="60.7434"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="167.862" y="69.5984"/>
					<TrackLine>
						<End x="169.0693" y="69.2488"/>
					</TrackLine>
					<TrackLine>
						<End x="170.1377" y="69.2488"/>
					</TrackLine>
					<TrackLine>
						<End x="171.3968" y="69.4"/>
					</TrackLine>
					<TrackLine>
						<End x="174.55" y="69.4"/>
					</TrackLine>
					<TrackLine>
						<End x="174.55" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="179.6264" y="36.561"/>
					<TrackLine>
						<End x="179.6264" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="179.6264" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="179.37" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="184.15" y="46.65"/>
					<TrackLine>
						<End x="184.7374" y="48.0278"/>
					</TrackLine>
					<TrackLine>
						<End x="184.7637" y="48.0717"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7485" y="49.1652"/>
					</TrackLine>
					<TrackLine>
						<End x="186.5613" y="49.978"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6519" y="50.0156"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9927" y="50.0156"/>
					</TrackLine>
					<TrackLine>
						<End x="187.0833" y="50.0532"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7383" y="51.1863"/>
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
						<End x="197.2526" y="61.028"/>
					</TrackLine>
					<TrackLine>
						<End x="199.151" y="59.4538"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="185.6" y="67.8597"/>
					<TrackLine>
						<End x="185.6" y="69.05"/>
					</TrackLine>
					<TrackLine>
						<End x="185.6" y="69.85"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="171.4686" y="70.7017"/>
					<TrackLine>
						<End x="175.8763" y="72.4"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9977" y="72.4229"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="41.65"/>
					<TrackLine>
						<End x="232.5955" y="42.1271"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="164.34" y="78.6849"/>
					<TrackLine>
						<End x="163.2401" y="81.2344"/>
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
					<Start x="164.34" y="78.6849"/>
					<TrackLine>
						<End x="161.69" y="77.98"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="193.3501" y="61.3156"/>
							<Dot x="193.488" y="61.1071"/>
							<Dot x="193.9308" y="61.4"/>
							<Dot x="193.423" y="61.5547"/>
						</Teardrop>
					</Teardrops>
					<Start x="195" y="61.4"/>
					<TrackLine>
						<End x="194.2" y="61.4"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9308" y="61.4"/>
					</TrackLine>
					<TrackLine>
						<End x="193.3501" y="61.3156"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="41.65"/>
					<TrackLine>
						<End x="227.381" y="40.6477"/>
					</TrackLine>
					<TrackLine>
						<End x="226.5029" y="39.0887"/>
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
					<Start x="172.9" y="46.65"/>
					<TrackLine>
						<End x="172.9" y="47.7628"/>
					</TrackLine>
					<TrackLine>
						<End x="172.246" y="50.4557"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8314" y="52.3104"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8314" y="53.4782"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8737" y="53.5804"/>
					</TrackLine>
					<TrackLine>
						<End x="172.4685" y="54.3991"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="230.4" y="64.15"/>
					<TrackLine>
						<End x="233.5809" y="65.3875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="176.9977" y="72.4229"/>
					<TrackLine>
						<End x="175.85" y="70.9192"/>
					</TrackLine>
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
				<Subwire width="0.3">
					<Start x="170.95" y="62.4025"/>
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
				<Subwire width="0.3">
					<Start x="178.2088" y="51.5288"/>
					<TrackLine>
						<End x="179.2994" y="51.9009"/>
					</TrackLine>
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
					<Start x="186.65" y="115.4"/>
					<TrackLine>
						<End x="187.25" y="115.75"/>
					</TrackLine>
					<TrackLine>
						<End x="187.4" y="115.75"/>
					</TrackLine>
					<TrackLine>
						<End x="187.5505" y="116.0877"/>
					</TrackLine>
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
					<Start x="195" y="61.4"/>
					<TrackLine>
						<End x="195" y="62.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="178.2088" y="51.5288"/>
					<TrackLine>
						<End x="178.2836" y="50.017"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3259" y="49.9148"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1475" y="49.0932"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2497" y="49.0509"/>
					</TrackLine>
					<TrackLine>
						<End x="181.6089" y="48.7153"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7111" y="48.673"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="193.3501" y="61.3156"/>
							<Dot x="193.4657" y="61.5373"/>
							<Dot x="192.982" y="61.7894"/>
							<Dot x="193.1067" y="61.2585"/>
						</Teardrop>
					</Teardrops>
					<Start x="193.3501" y="61.3156"/>
					<TrackLine>
						<End x="191.5956" y="63.5737"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5913" y="63.584"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5913" y="64.6524"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5956" y="64.6627"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3468" y="65.4139"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3571" y="65.4182"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4485" y="65.5006"/>
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
					<Start x="227.9" y="87.9"/>
					<TrackLine>
						<End x="230.5685" y="83.7535"/>
					</TrackLine>
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
						<End x="232.5859" y="70.5108"/>
					</TrackLine>
					<TrackLine>
						<End x="231.5392" y="69.4641"/>
					</TrackLine>
					<TrackLine>
						<End x="231.143" y="69.3"/>
					</TrackLine>
					<TrackLine>
						<End x="230.4" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="191.1496" y="55.7094"/>
					<TrackLine>
						<End x="191.4031" y="58.0388"/>
					</TrackLine>
					<TrackLine>
						<End x="191.4454" y="58.141"/>
					</TrackLine>
					<TrackLine>
						<End x="193.3006" y="60.2351"/>
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
						<End x="218.5711" y="113.875"/>
					</TrackLine>
					<TrackLine>
						<End x="219.7289" y="113.875"/>
					</TrackLine>
					<TrackLine>
						<End x="221.0657" y="114.25"/>
					</TrackLine>
					<TrackLine>
						<End x="221.3" y="114.4843"/>
					</TrackLine>
					<TrackLine>
						<End x="221.3" y="114.65"/>
					</TrackLine>
					<TrackLine>
						<End x="221.3" y="115.05"/>
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
					<Teardrops>
						<Teardrop>
							<Dot x="193.3006" y="60.2351"/>
							<Dot x="193.3549" y="59.9911"/>
							<Dot x="193.8873" y="60.1093"/>
							<Dot x="193.4501" y="60.4355"/>
						</Teardrop>
					</Teardrops>
					<Start x="193.3006" y="60.2351"/>
					<TrackLine>
						<End x="193.9308" y="60.1"/>
					</TrackLine>
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
				<Subwire width="0.8">
					<Start x="208.0626" y="56.2849"/>
					<TrackLine>
						<End x="207.9" y="49.15"/>
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
					<Start x="175.2528" y="61.6221"/>
					<TrackLine>
						<End x="176.1473" y="60.4572"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1508" y="60.4487"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1508" y="59.3823"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1473" y="59.3738"/>
					</TrackLine>
					<TrackLine>
						<End x="175.3973" y="58.6238"/>
					</TrackLine>
					<TrackLine>
						<End x="175.3888" y="58.6203"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3224" y="58.6203"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3139" y="58.6238"/>
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
					<Start x="195.7656" y="105.3914"/>
					<TrackLine>
						<End x="192.4" y="105.3914"/>
					</TrackLine>
					<TrackLine>
						<End x="192" y="105.3914"/>
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
					<Start x="221.65" y="115.4"/>
					<TrackLine>
						<End x="222" y="115.05"/>
					</TrackLine>
					<TrackLine>
						<End x="222" y="114.65"/>
					</TrackLine>
					<TrackLine>
						<End x="222" y="114.4843"/>
					</TrackLine>
					<TrackLine>
						<End x="222.2343" y="114.25"/>
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
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="193.3006" y="60.2351"/>
					<TrackLine>
						<End x="193.2009" y="60.3362"/>
					</TrackLine>
					<TrackLine>
						<End x="193.2009" y="61.1638"/>
					</TrackLine>
					<TrackLine>
						<End x="193.3501" y="61.3156"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="115.4"/>
					<TrackLine>
						<End x="192.0915" y="115.5644"/>
					</TrackLine>
					<TrackLine>
						<End x="187.4" y="115.5644"/>
					</TrackLine>
					<TrackLine>
						<End x="187" y="115.5644"/>
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
					<Start x="199.15" y="105.4"/>
					<TrackLine>
						<End x="195.7656" y="105.3914"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="210.4" y="56.65"/>
					<TrackLine>
						<End x="208.0626" y="56.2849"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="161.69" y="83.06"/>
					<TrackLine>
						<End x="167.0131" y="92.4532"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8347" y="93.2748"/>
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
					<Start x="233.5809" y="65.3875"/>
					<TrackLine>
						<End x="231.9501" y="67.3644"/>
					</TrackLine>
					<TrackLine>
						<End x="230.4" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="87.9"/>
					<TrackLine>
						<End x="229.5" y="92.3062"/>
					</TrackLine>
					<TrackLine>
						<End x="229.5" y="93.4938"/>
					</TrackLine>
					<TrackLine>
						<End x="229.5" y="102.2438"/>
					</TrackLine>
					<TrackLine>
						<End x="227.9" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="191.1496" y="55.7094"/>
					<TrackLine>
						<End x="190.8" y="54.6692"/>
					</TrackLine>
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
				<Subwire width="0.8">
					<Start x="222.9" y="64.15"/>
					<TrackLine>
						<End x="224.6737" y="63.8294"/>
					</TrackLine>
					<TrackLine>
						<End x="225.8415" y="63.8294"/>
					</TrackLine>
					<TrackLine>
						<End x="230.4" y="64.15"/>
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
					<Start x="181.025" y="47.1653"/>
					<TrackLine>
						<End x="178.5811" y="48.2455"/>
					</TrackLine>
					<TrackLine>
						<End x="177.4782" y="49.3484"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2836" y="49.8181"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9088" y="50.9946"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9088" y="52.063"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9131" y="52.0733"/>
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
					<Start x="170.917" y="60.1027"/>
					<TrackLine>
						<End x="171.8308" y="60.1"/>
					</TrackLine>
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
					<Start x="164.5607" y="64.0791"/>
					<TrackLine>
						<End x="163.6201" y="63.2972"/>
					</TrackLine>
					<TrackLine>
						<End x="162.4745" y="62.1516"/>
					</TrackLine>
					<TrackLine>
						<End x="162.4482" y="62.1077"/>
					</TrackLine>
					<TrackLine>
						<End x="162.2408" y="61.6076"/>
					</TrackLine>
					<TrackLine>
						<End x="162.2283" y="61.5579"/>
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
					<Start x="169.472" y="63.3487"/>
					<TrackLine>
						<End x="170.4158" y="63.7025"/>
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
					<Start x="169.217" y="60.472"/>
					<TrackLine>
						<End x="168.7414" y="57.4165"/>
					</TrackLine>
					<TrackLine>
						<End x="168.7414" y="56.0497"/>
					</TrackLine>
					<TrackLine>
						<End x="171.0571" y="47.407"/>
					</TrackLine>
					<TrackLine>
						<End x="171.0571" y="46.0078"/>
					</TrackLine>
					<TrackLine>
						<End x="171.144" y="45.798"/>
					</TrackLine>
					<TrackLine>
						<End x="171.7414" y="45.1812"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8227" y="44.9849"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8227" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8227" y="35.25"/>
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
					<Start x="189.4296" y="76.3037"/>
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
					<Start x="193.4264" y="78.0228"/>
					<TrackLine>
						<End x="194.545" y="85.4655"/>
					</TrackLine>
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
						<End x="199.8433" y="92.05"/>
					</TrackLine>
					<TrackLine>
						<End x="200.1476" y="92.1761"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1529" y="92.7957"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1632" y="92.8"/>
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
						<End x="202.3658" y="82.6604"/>
					</TrackLine>
					<TrackLine>
						<End x="203.4342" y="82.6604"/>
					</TrackLine>
					<TrackLine>
						<End x="206.1324" y="82.9141"/>
					</TrackLine>
					<TrackLine>
						<End x="207.2008" y="82.9141"/>
					</TrackLine>
					<TrackLine>
						<End x="207.2111" y="82.9098"/>
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
						<End x="215.8" y="68.4567"/>
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
						<End x="201.4364" y="100.0761"/>
					</TrackLine>
					<TrackLine>
						<End x="201.2626" y="100.1197"/>
					</TrackLine>
					<TrackLine>
						<End x="200.6742" y="100.3637"/>
					</TrackLine>
					<TrackLine>
						<End x="200.5027" y="100.4572"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0061" y="100.6632"/>
					</TrackLine>
					<TrackLine>
						<End x="199.9613" y="100.6744"/>
					</TrackLine>
					<TrackLine>
						<End x="198.3387" y="100.6744"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2939" y="100.6632"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5882" y="99.164"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4666" y="98.8896"/>
					</TrackLine>
					<TrackLine>
						<End x="188.1807" y="98.7712"/>
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
						<End x="181.6975" y="81.6635"/>
					</TrackLine>
					<TrackLine>
						<End x="183.9346" y="73.9385"/>
					</TrackLine>
					<TrackLine>
						<End x="183.9387" y="73.9222"/>
					</TrackLine>
					<TrackLine>
						<End x="183.9387" y="72.3364"/>
					</TrackLine>
					<TrackLine>
						<End x="183.9346" y="72.3201"/>
					</TrackLine>
					<TrackLine>
						<End x="183.65" y="71.3135"/>
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
					<Start x="180.4723" y="41.2719"/>
					<TrackLine>
						<End x="185.2178" y="41.8"/>
					</TrackLine>
					<TrackLine>
						<End x="185.6594" y="41.9109"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4386" y="42.2338"/>
					</TrackLine>
					<TrackLine>
						<End x="190.5368" y="44.0251"/>
					</TrackLine>
					<TrackLine>
						<End x="190.5892" y="44.0565"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5121" y="47.089"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2633" y="47.8402"/>
					</TrackLine>
					<TrackLine>
						<End x="199.3262" y="52.5847"/>
					</TrackLine>
					<TrackLine>
						<End x="199.3305" y="52.595"/>
					</TrackLine>
					<TrackLine>
						<End x="199.3305" y="53.6634"/>
					</TrackLine>
					<TrackLine>
						<End x="198.1143" y="58.8506"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4363" y="59.5286"/>
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
					<Start x="180.3124" y="71.719"/>
					<TrackLine>
						<End x="180.4" y="70.9192"/>
					</TrackLine>
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
					<Start x="193.0068" y="55.6044"/>
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
					<Start x="190.5253" y="89.8094"/>
					<TrackLine>
						<End x="191.65" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3764" y="78.7062"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3764" y="77.3394"/>
					</TrackLine>
					<TrackLine>
						<End x="191.4796" y="76.9871"/>
					</TrackLine>
					<TrackLine>
						<End x="191.4796" y="75.6203"/>
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
					<Start x="202.9" y="83.9604"/>
					<TrackLine>
						<End x="207.35" y="83.6641"/>
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
						<End x="191.0312" y="112.9019"/>
					</TrackLine>
					<TrackLine>
						<End x="192.0128" y="112.9019"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1262" y="112.9047"/>
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
						<End x="226.55" y="93.2499"/>
					</TrackLine>
					<TrackLine>
						<End x="226.55" y="87.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6079" y="86.5032"/>
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
						<End x="190.7581" y="111.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2859" y="111.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3885" y="111.6349"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4115" y="111.6349"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2119" y="111.6"/>
					</TrackLine>
					<TrackLine>
						<End x="219.9129" y="111.6"/>
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
						<End x="224.5" y="98.7206"/>
					</TrackLine>
					<TrackLine>
						<End x="225.05" y="93.0645"/>
					</TrackLine>
					<TrackLine>
						<End x="225.05" y="91.4355"/>
					</TrackLine>
					<TrackLine>
						<End x="224.5579" y="87.1866"/>
					</TrackLine>
					<TrackLine>
						<End x="224.5579" y="85.8198"/>
					</TrackLine>
					<TrackLine>
						<End x="224.6763" y="85.5339"/>
					</TrackLine>
					<TrackLine>
						<End x="225.6239" y="83.3976"/>
					</TrackLine>
					<TrackLine>
						<End x="225.75" y="83.0933"/>
					</TrackLine>
					<TrackLine>
						<End x="225.75" y="81.5933"/>
					</TrackLine>
					<TrackLine>
						<End x="225.75" y="80.2067"/>
					</TrackLine>
					<TrackLine>
						<End x="225.7394" y="79.3744"/>
					</TrackLine>
					<TrackLine>
						<End x="225.7394" y="78.0106"/>
					</TrackLine>
					<TrackLine>
						<End x="226.4385" y="75.4697"/>
					</TrackLine>
					<TrackLine>
						<End x="226.5569" y="75.1838"/>
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
						<End x="181.9422" y="117.7085"/>
					</TrackLine>
					<TrackLine>
						<End x="181.9465" y="117.7188"/>
					</TrackLine>
					<TrackLine>
						<End x="183.61" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="183.61" y="120.9261"/>
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
					<Start x="165.0755" y="40.3668"/>
					<TrackLine>
						<End x="162.9878" y="60.0619"/>
					</TrackLine>
					<TrackLine>
						<End x="162.9878" y="61.4249"/>
					</TrackLine>
					<TrackLine>
						<End x="163.1048" y="61.7073"/>
					</TrackLine>
					<TrackLine>
						<End x="164.0644" y="62.6669"/>
					</TrackLine>
					<TrackLine>
						<End x="164.3468" y="62.7839"/>
					</TrackLine>
					<TrackLine>
						<End x="165.0516" y="62.8939"/>
					</TrackLine>
					<TrackLine>
						<End x="165.7459" y="63.5882"/>
					</TrackLine>
					<TrackLine>
						<End x="165.7459" y="64.2776"/>
					</TrackLine>
					<TrackLine>
						<End x="165.8028" y="64.5044"/>
					</TrackLine>
					<TrackLine>
						<End x="166.0624" y="65.1305"/>
					</TrackLine>
					<TrackLine>
						<End x="167.0291" y="66.9955"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="169.6035" y="70.5488"/>
					<TrackLine>
						<End x="170.1729" y="71.2462"/>
					</TrackLine>
					<TrackLine>
						<End x="170.9241" y="71.9974"/>
					</TrackLine>
					<TrackLine>
						<End x="177.907" y="76.3437"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0054" y="77.4398"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9628" y="77.4398"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6399" y="76.7627"/>
					</TrackLine>
					<TrackLine>
						<End x="182.5551" y="73.6437"/>
					</TrackLine>
					<TrackLine>
						<End x="182.5551" y="72.6149"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3826" y="71.7672"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3807" y="71.7551"/>
					</TrackLine>
					<TrackLine>
						<End x="182.35" y="71.5201"/>
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
					<Start x="214.15" y="109.15"/>
					<TrackLine>
						<End x="214.15" y="105.4"/>
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
					<Start x="167.9" y="100.4"/>
					<TrackLine>
						<End x="169.15" y="105.4"/>
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
					<Start x="167.9" y="100.4"/>
					<TrackLine>
						<End x="169.8272" y="99.0619"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8559" y="99.05"/>
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
						<End x="192.2395" y="103.264"/>
					</TrackLine>
					<TrackLine>
						<End x="193.8685" y="103.264"/>
					</TrackLine>
					<TrackLine>
						<End x="200.23" y="102.8487"/>
					</TrackLine>
					<TrackLine>
						<End x="200.6905" y="102.7331"/>
					</TrackLine>
					<TrackLine>
						<End x="201.4831" y="102.4046"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8031" y="102.2504"/>
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
						<End x="223.55" y="92.7842"/>
					</TrackLine>
					<TrackLine>
						<End x="223.55" y="91.7158"/>
					</TrackLine>
					<TrackLine>
						<End x="223.0579" y="87.4104"/>
					</TrackLine>
					<TrackLine>
						<End x="223.0579" y="85.596"/>
					</TrackLine>
					<TrackLine>
						<End x="223.1064" y="85.403"/>
					</TrackLine>
					<TrackLine>
						<End x="223.356" y="84.8008"/>
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
						<End x="224.2465" y="79.5979"/>
					</TrackLine>
					<TrackLine>
						<End x="224.2465" y="77.7871"/>
					</TrackLine>
					<TrackLine>
						<End x="224.25" y="77.1941"/>
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
					<Start x="179.5455" y="73.3658"/>
					<TrackLine>
						<End x="179.0267" y="72.2568"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0242" y="72.2508"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0242" y="71.1872"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1" y="70.9192"/>
					</TrackLine>
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
					<Start x="206.6666" y="81.6141"/>
					<TrackLine>
						<End x="204.797" y="79.8088"/>
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
					<Start x="193.245" y="85.9997"/>
					<TrackLine>
						<End x="192.1264" y="78.557"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1264" y="77.4886"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2171" y="77.1679"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2296" y="77.1182"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2296" y="75.4892"/>
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
					<Start x="175.2895" y="113.0175"/>
					<TrackLine>
						<End x="183.2367" y="114"/>
					</TrackLine>
					<TrackLine>
						<End x="188.0933" y="114.05"/>
					</TrackLine>
					<TrackLine>
						<End x="191.522" y="114.0868"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="166.5566" y="41.4671"/>
					<TrackLine>
						<End x="166.3755" y="39.8326"/>
					</TrackLine>
					<TrackLine>
						<End x="166.3712" y="39.8223"/>
					</TrackLine>
					<TrackLine>
						<End x="162.53" y="35.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="162.44" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="162.44" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="162.44" y="35.25"/>
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
					<Start x="177.2781" y="41.5527"/>
					<TrackLine>
						<End x="179.9381" y="42.5719"/>
					</TrackLine>
					<TrackLine>
						<End x="181.0065" y="42.5719"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1749" y="42.55"/>
					</TrackLine>
					<TrackLine>
						<End x="185.1251" y="42.55"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4234" y="42.6249"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1004" y="42.9055"/>
					</TrackLine>
					<TrackLine>
						<End x="190.1476" y="44.6761"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9676" y="48.3847"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="199.0496" y="48.9047"/>
					<TrackLine>
						<End x="200.9441" y="49.05"/>
					</TrackLine>
					<TrackLine>
						<End x="200.9728" y="49.0619"/>
					</TrackLine>
					<TrackLine>
						<End x="201.7381" y="49.8272"/>
					</TrackLine>
					<TrackLine>
						<End x="201.75" y="49.8559"/>
					</TrackLine>
					<TrackLine>
						<End x="201.75" y="50.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="200.7678" y="55.6091"/>
					</TrackLine>
					<TrackLine>
						<End x="200.7678" y="57.6909"/>
					</TrackLine>
					<TrackLine>
						<End x="200.8682" y="58.0909"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1139" y="58.7878"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1139" y="60.1198"/>
					</TrackLine>
					<TrackLine>
						<End x="201.0087" y="60.3738"/>
					</TrackLine>
					<TrackLine>
						<End x="200.071" y="61.3115"/>
					</TrackLine>
					<TrackLine>
						<End x="198.1163" y="62.2861"/>
					</TrackLine>
					<TrackLine>
						<End x="197.3651" y="63.0373"/>
					</TrackLine>
					<TrackLine>
						<End x="197.3608" y="63.0476"/>
					</TrackLine>
					<TrackLine>
						<End x="197.3" y="63.274"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1" y="63.8842"/>
					</TrackLine>
					<TrackLine>
						<End x="197.0957" y="63.8945"/>
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
					<Start x="196.0354" y="71.5741"/>
					<TrackLine>
						<End x="196.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SEL"/>
				<Subwire width="0.3">
					<Start x="190.5179" y="66.5304"/>
					<TrackLine>
						<End x="189.7263" y="55.1517"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6169" y="54.8876"/>
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
					<Start x="183.2422" y="117.1743"/>
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
						<End x="199.14" y="36"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5677" y="37.3772"/>
					</TrackLine>
					<TrackLine>
						<End x="202.578" y="37.3815"/>
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
						<End x="206.658" y="42.6104"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="48.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="206.65" y="49.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="206.75" y="56.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="206.75" y="57.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="206.1912" y="59.7195"/>
					</TrackLine>
					<TrackLine>
						<End x="206.1912" y="60.6975"/>
					</TrackLine>
					<TrackLine>
						<End x="206.6306" y="61.1403"/>
					</TrackLine>
					<TrackLine>
						<End x="206.6306" y="62.1597"/>
					</TrackLine>
					<TrackLine>
						<End x="205.9097" y="62.8806"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1554" y="65.1103"/>
					</TrackLine>
					<TrackLine>
						<End x="200.5339" y="66.7312"/>
					</TrackLine>
					<TrackLine>
						<End x="200.3631" y="66.8335"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1192" y="68.4406"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6327" y="68.6423"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6021" y="68.65"/>
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
					<Start x="191.7843" y="117.042"/>
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
						<End x="189.7644" y="109.2034"/>
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
						<End x="174.2215" y="107.3912"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2258" y="107.4015"/>
					</TrackLine>
					<TrackLine>
						<End x="174.977" y="108.1527"/>
					</TrackLine>
					<TrackLine>
						<End x="175.6947" y="108.6854"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DIN"/>
				<Subwire width="0.3">
					<Start x="194.5581" y="52.7863"/>
					<TrackLine>
						<End x="193.6692" y="52.15"/>
					</TrackLine>
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
					<Start x="215.8616" y="52.4868"/>
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
					<Start x="170.7914" y="56.7331"/>
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
					<Start x="177.1011" y="78.0308"/>
					<TrackLine>
						<End x="171.3338" y="75.0168"/>
					</TrackLine>
					<TrackLine>
						<End x="171.3235" y="75.0125"/>
					</TrackLine>
					<TrackLine>
						<End x="168.4651" y="74.235"/>
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
					<Start x="196.9716" y="56.6431"/>
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
						<End x="167.9206" y="72.9393"/>
					</TrackLine>
					<TrackLine>
						<End x="167.9309" y="72.935"/>
					</TrackLine>
					<TrackLine>
						<End x="168.9993" y="72.935"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0096" y="72.9393"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5798" y="76.875"/>
					</TrackLine>
					<TrackLine>
						<End x="178.6782" y="77.9711"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8581" y="78.0456"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1101" y="78.0456"/>
					</TrackLine>
					<TrackLine>
						<End x="180.29" y="77.9711"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1712" y="77.0899"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1462" y="74.0327"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2469" y="73.7895"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2469" y="72.4691"/>
					</TrackLine>
					<TrackLine>
						<End x="183" y="71.4397"/>
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
						<End x="203.3144" y="45.9986"/>
					</TrackLine>
					<TrackLine>
						<End x="203.3101" y="46.0089"/>
					</TrackLine>
					<TrackLine>
						<End x="203.3101" y="47.0773"/>
					</TrackLine>
					<TrackLine>
						<End x="203.9491" y="49.284"/>
					</TrackLine>
					<TrackLine>
						<End x="204" y="49.4867"/>
					</TrackLine>
					<TrackLine>
						<End x="204" y="51.3133"/>
					</TrackLine>
					<TrackLine>
						<End x="202.8871" y="55.8746"/>
					</TrackLine>
					<TrackLine>
						<End x="202.8871" y="57.4254"/>
					</TrackLine>
					<TrackLine>
						<End x="203.1592" y="58.186"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2332" y="58.4809"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2332" y="60.4267"/>
					</TrackLine>
					<TrackLine>
						<End x="203.1592" y="60.7216"/>
					</TrackLine>
					<TrackLine>
						<End x="202.8795" y="61.3962"/>
					</TrackLine>
					<TrackLine>
						<End x="201.2408" y="64.946"/>
					</TrackLine>
					<TrackLine>
						<End x="201.2144" y="64.9899"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0689" y="66.1354"/>
					</TrackLine>
					<TrackLine>
						<End x="200.025" y="66.1618"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7127" y="67.7968"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4635" y="67.9"/>
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
						<End x="229.088" y="47.3247"/>
					</TrackLine>
					<TrackLine>
						<End x="229.8392" y="46.5735"/>
					</TrackLine>
					<TrackLine>
						<End x="233.14" y="43.4228"/>
					</TrackLine>
					<TrackLine>
						<End x="233.8912" y="42.6716"/>
					</TrackLine>
					<TrackLine>
						<End x="233.8955" y="42.6613"/>
					</TrackLine>
					<TrackLine>
						<End x="233.8955" y="41.5929"/>
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
					<Start x="228.8675" y="40.1367"/>
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
						<End x="224.8822" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="225.9178" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="226.65" y="49.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="226.65" y="48.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6291" y="41.1409"/>
					</TrackLine>
					<TrackLine>
						<End x="225.2336" y="39.6145"/>
					</TrackLine>
					<TrackLine>
						<End x="225.2336" y="38.5629"/>
					</TrackLine>
					<TrackLine>
						<End x="226.69" y="35.6485"/>
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
					<Start x="177.8937" y="56.0496"/>
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
					<Start x="184.5585" y="84.7966"/>
					<TrackLine>
						<End x="184.1597" y="81.7163"/>
					</TrackLine>
					<TrackLine>
						<End x="184.0521" y="81.6061"/>
					</TrackLine>
					<TrackLine>
						<End x="183.8824" y="81.1964"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6707" y="79.7449"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6707" y="77.9305"/>
					</TrackLine>
					<TrackLine>
						<End x="184.6305" y="74.0077"/>
					</TrackLine>
					<TrackLine>
						<End x="184.6305" y="72.2509"/>
					</TrackLine>
					<TrackLine>
						<End x="184.5932" y="72.1023"/>
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
					<Start x="186.3073" y="86.33"/>
					<TrackLine>
						<End x="186.65" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="186.0622" y="89.1791"/>
					</TrackLine>
					<TrackLine>
						<End x="186.0622" y="90.1369"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="94.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="95.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="187.8543" y="97.3841"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6055" y="98.1353"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6158" y="98.1396"/>
					</TrackLine>
					<TrackLine>
						<End x="191.6941" y="98.3"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7374" y="98.414"/>
					</TrackLine>
					<TrackLine>
						<End x="198.4667" y="99.9496"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8333" y="99.9496"/>
					</TrackLine>
					<TrackLine>
						<End x="200.1191" y="99.8312"/>
					</TrackLine>
					<TrackLine>
						<End x="201.0812" y="98.8691"/>
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
					<Start x="181.5105" y="59.1607"/>
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
					<Start x="227.7823" y="78.6925"/>
					<TrackLine>
						<End x="228.4885" y="76.1531"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IAKO"/>
				<Subwire width="0.3">
					<Start x="198.0305" y="53.1292"/>
					<TrackLine>
						<End x="197.6022" y="53.8447"/>
					</TrackLine>
					<TrackLine>
						<End x="196.851" y="54.5959"/>
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
					<Start x="174.9148" y="79.9626"/>
					<TrackLine>
						<End x="177.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="183.2545" y="59.767"/>
					<TrackLine>
						<End x="184.3" y="54.9342"/>
					</TrackLine>
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
					<Start x="182.9975" y="82.1977"/>
					<TrackLine>
						<End x="182.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD10"/>
				<Subwire width="0.3">
					<Start x="187.2207" y="78.8377"/>
					<TrackLine>
						<End x="187.4084" y="75.6261"/>
					</TrackLine>
					<TrackLine>
						<End x="187.565" y="74.3203"/>
					</TrackLine>
					<TrackLine>
						<End x="187.565" y="71.9383"/>
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
						<End x="190.8844" y="112.267"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1596" y="112.267"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2525" y="112.2698"/>
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
						<End x="225.25" y="98.8133"/>
					</TrackLine>
					<TrackLine>
						<End x="225.8" y="93.1572"/>
					</TrackLine>
					<TrackLine>
						<End x="225.8" y="91.3428"/>
					</TrackLine>
					<TrackLine>
						<End x="225.3079" y="87.0374"/>
					</TrackLine>
					<TrackLine>
						<End x="225.3079" y="85.969"/>
					</TrackLine>
					<TrackLine>
						<End x="225.3122" y="85.9587"/>
					</TrackLine>
					<TrackLine>
						<End x="226.2749" y="83.7868"/>
					</TrackLine>
					<TrackLine>
						<End x="226.4851" y="83.2799"/>
					</TrackLine>
					<TrackLine>
						<End x="226.5" y="83.2206"/>
					</TrackLine>
					<TrackLine>
						<End x="226.5" y="81.7206"/>
					</TrackLine>
					<TrackLine>
						<End x="226.5" y="80.0794"/>
					</TrackLine>
					<TrackLine>
						<End x="226.4858" y="79.226"/>
					</TrackLine>
					<TrackLine>
						<End x="226.4858" y="78.159"/>
					</TrackLine>
					<TrackLine>
						<End x="227.1885" y="75.6189"/>
					</TrackLine>
					<TrackLine>
						<End x="227.1928" y="75.6086"/>
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
						<End x="164.98" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="164.98" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="164.98" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="165.9373" y="37.7846"/>
					</TrackLine>
					<TrackLine>
						<End x="165.9416" y="37.7949"/>
					</TrackLine>
					<TrackLine>
						<End x="167.0071" y="39.3975"/>
					</TrackLine>
					<TrackLine>
						<End x="167.1255" y="39.6834"/>
					</TrackLine>
					<TrackLine>
						<End x="167.2215" y="40.2741"/>
					</TrackLine>
					<TrackLine>
						<End x="167.2258" y="40.2844"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8523" y="40.9226"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8566" y="40.9329"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8566" y="42.0013"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8523" y="42.0116"/>
					</TrackLine>
					<TrackLine>
						<End x="166.305" y="44.2538"/>
					</TrackLine>
					<TrackLine>
						<End x="166.1866" y="44.5397"/>
					</TrackLine>
					<TrackLine>
						<End x="163.7331" y="60.2102"/>
					</TrackLine>
					<TrackLine>
						<End x="163.7331" y="61.2766"/>
					</TrackLine>
					<TrackLine>
						<End x="163.7366" y="61.2851"/>
					</TrackLine>
					<TrackLine>
						<End x="164.4866" y="62.0351"/>
					</TrackLine>
					<TrackLine>
						<End x="164.4951" y="62.0386"/>
					</TrackLine>
					<TrackLine>
						<End x="165.1984" y="62.2587"/>
					</TrackLine>
					<TrackLine>
						<End x="165.3999" y="62.3422"/>
					</TrackLine>
					<TrackLine>
						<End x="166.2976" y="63.2399"/>
					</TrackLine>
					<TrackLine>
						<End x="166.3811" y="63.4414"/>
					</TrackLine>
					<TrackLine>
						<End x="166.3811" y="64.1991"/>
					</TrackLine>
					<TrackLine>
						<End x="166.4075" y="64.3044"/>
					</TrackLine>
					<TrackLine>
						<End x="166.6313" y="64.8441"/>
					</TrackLine>
					<TrackLine>
						<End x="166.6872" y="64.9373"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8834" y="66.1335"/>
					</TrackLine>
					<TrackLine>
						<End x="167.9766" y="66.1894"/>
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
					<Start x="186.269" y="80.4461"/>
					<TrackLine>
						<End x="185.9207" y="79.3719"/>
					</TrackLine>
					<TrackLine>
						<End x="185.9207" y="78.3035"/>
					</TrackLine>
					<TrackLine>
						<End x="186.8432" y="74.3208"/>
					</TrackLine>
					<TrackLine>
						<End x="186.8523" y="74.2638"/>
					</TrackLine>
					<TrackLine>
						<End x="186.9" y="70.9192"/>
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
						<End x="187.6073" y="85.7958"/>
					</TrackLine>
					<TrackLine>
						<End x="187.603" y="85.7855"/>
					</TrackLine>
					<TrackLine>
						<End x="185.8448" y="82.5779"/>
					</TrackLine>
					<TrackLine>
						<End x="185.8405" y="82.5676"/>
					</TrackLine>
					<TrackLine>
						<End x="185.3841" y="81.4474"/>
					</TrackLine>
					<TrackLine>
						<End x="185.2144" y="81.0377"/>
					</TrackLine>
					<TrackLine>
						<End x="185.1068" y="80.9275"/>
					</TrackLine>
					<TrackLine>
						<End x="185.1068" y="79.9647"/>
					</TrackLine>
					<TrackLine>
						<End x="185.1707" y="78.1543"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1396" y="74.1942"/>
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
					<Start x="187.4322" y="64.5732"/>
					<TrackLine>
						<End x="184.8172" y="65.3097"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3475" y="65.5043"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4782" y="66.7158"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1308" y="68.4"/>
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
					<Start x="187.7358" y="55.8232"/>
					<TrackLine>
						<End x="187.55" y="54.6692"/>
					</TrackLine>
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
					<Start x="225.2576" y="65.3794"/>
					<TrackLine>
						<End x="230.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD11"/>
				<Subwire width="0.3">
					<Start x="187.1405" y="82.0334"/>
					<TrackLine>
						<End x="188.5164" y="79.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5207" y="79.3719"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5207" y="78.3035"/>
					</TrackLine>
					<TrackLine>
						<End x="188.144" y="76.835"/>
					</TrackLine>
					<TrackLine>
						<End x="188.144" y="75.7724"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2567" y="74.3753"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2567" y="71.8833"/>
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
					<Start x="199.7193" y="117.6208"/>
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
						<End x="201.6578" y="101.5256"/>
					</TrackLine>
					<TrackLine>
						<End x="201.3903" y="101.6364"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1563" y="101.7554"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4624" y="102.0431"/>
					</TrackLine>
					<TrackLine>
						<End x="200.1405" y="102.1239"/>
					</TrackLine>
					<TrackLine>
						<End x="193.7374" y="102.514"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3706" y="102.514"/>
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
						<End x="173.6158" y="97.9847"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8559" y="96.75"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8272" y="96.7381"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0619" y="95.9728"/>
					</TrackLine>
					<TrackLine>
						<End x="166.1654" y="93.0196"/>
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
						<End x="167.3278" y="68.2984"/>
					</TrackLine>
					<TrackLine>
						<End x="168.3962" y="68.2984"/>
					</TrackLine>
					<TrackLine>
						<End x="170.2869" y="68.4988"/>
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
						<End x="173.1329" y="68.65"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9926" y="68.6064"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2574" y="68.3436"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8901" y="68.3019"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5099" y="68.3019"/>
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
				<Subwire width="0.3">
					<Start x="192.9531" y="57.4549"/>
					<TrackLine>
						<End x="193.9308" y="57.5"/>
					</TrackLine>
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
					<Start x="192.8913" y="64.1182"/>
					<TrackLine>
						<End x="193.9308" y="63.35"/>
					</TrackLine>
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
					<Start x="228.0503" y="52.2818"/>
					<TrackLine>
						<End x="229.4501" y="49.8644"/>
					</TrackLine>
					<TrackLine>
						<End x="230.3837" y="47.8692"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="170.0167" y="44.3501"/>
					<TrackLine>
						<End x="170.0715" y="40.3238"/>
					</TrackLine>
					<TrackLine>
						<End x="170.0715" y="39.156"/>
					</TrackLine>
					<TrackLine>
						<End x="170.0292" y="39.0538"/>
					</TrackLine>
					<TrackLine>
						<End x="169.2076" y="38.2322"/>
					</TrackLine>
					<TrackLine>
						<End x="169.1054" y="38.1899"/>
					</TrackLine>
					<TrackLine>
						<End x="168.5259" y="38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="168.4237" y="38.0577"/>
					</TrackLine>
					<TrackLine>
						<End x="167.2373" y="37.2504"/>
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
					<Start x="192.9426" y="66.722"/>
					<TrackLine>
						<End x="191.1954" y="68.0252"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0988" y="68.0652"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0421" y="68.0652"/>
					</TrackLine>
					<TrackLine>
						<End x="190.7307" y="68.2239"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="182.8924" y="67.7158"/>
							<Dot x="182.8945" y="67.9658"/>
							<Dot x="182.349" y="67.9702"/>
							<Dot x="182.7017" y="67.5542"/>
						</Teardrop>
					</Teardrops>
					<Start x="182.8924" y="67.7158"/>
					<TrackLine>
						<End x="181.4308" y="68.4"/>
					</TrackLine>
					<TrackLine>
						<End x="181.05" y="68.7808"/>
					</TrackLine>
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
				<Subwire width="0.8">
					<Start x="193.054" y="100.464"/>
					<TrackLine>
						<End x="191.15" y="100.464"/>
					</TrackLine>
					<TrackLine>
						<End x="190.75" y="100.464"/>
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
				<Subwire width="0.8">
					<Start x="207.3718" y="60.2085"/>
					<TrackLine>
						<End x="207.6179" y="60.9332"/>
					</TrackLine>
					<TrackLine>
						<End x="207.6179" y="62.3668"/>
					</TrackLine>
					<TrackLine>
						<End x="207.4739" y="62.7144"/>
					</TrackLine>
					<TrackLine>
						<End x="206.4644" y="63.7239"/>
					</TrackLine>
					<TrackLine>
						<End x="202.6998" y="66.406"/>
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
				<Subwire width="0.8">
					<Start x="192.9" y="110.4"/>
					<TrackLine>
						<End x="190.6244" y="110.6145"/>
					</TrackLine>
					<TrackLine>
						<End x="190.332" y="110.6715"/>
					</TrackLine>
					<TrackLine>
						<End x="187.4" y="110.6715"/>
					</TrackLine>
					<TrackLine>
						<End x="187" y="110.6715"/>
					</TrackLine>
					<TrackLine>
						<End x="186.65" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="190.7307" y="68.2239"/>
					<TrackLine>
						<End x="190.5579" y="68.0652"/>
					</TrackLine>
					<TrackLine>
						<End x="189.937" y="68.0652"/>
					</TrackLine>
					<TrackLine>
						<End x="188.1607" y="67.4459"/>
					</TrackLine>
					<TrackLine>
						<End x="188.0585" y="67.4036"/>
					</TrackLine>
					<TrackLine>
						<End x="186.2861" y="66.352"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1839" y="66.3097"/>
					</TrackLine>
					<TrackLine>
						<End x="185.0161" y="66.3097"/>
					</TrackLine>
					<TrackLine>
						<End x="184.9139" y="66.352"/>
					</TrackLine>
					<TrackLine>
						<End x="182.8924" y="67.7158"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="190.7307" y="68.2239"/>
							<Dot x="190.9666" y="68.3068"/>
							<Dot x="190.8" y="68.7808"/>
							<Dot x="190.5224" y="68.362"/>
						</Teardrop>
					</Teardrops>
					<Start x="190.7307" y="68.2239"/>
					<TrackLine>
						<End x="190.8" y="68.7808"/>
					</TrackLine>
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
					<Start x="169.8857" y="46.9218"/>
					<TrackLine>
						<End x="167.7414" y="55.8877"/>
					</TrackLine>
					<TrackLine>
						<End x="167.7414" y="57.5785"/>
					</TrackLine>
					<TrackLine>
						<End x="167.7698" y="59.9362"/>
					</TrackLine>
					<TrackLine>
						<End x="167.7698" y="61.0355"/>
					</TrackLine>
					<TrackLine>
						<End x="167.7965" y="61.0998"/>
					</TrackLine>
					<TrackLine>
						<End x="168.6352" y="61.9716"/>
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
						<End x="203.8436" y="56.0648"/>
					</TrackLine>
					<TrackLine>
						<End x="203.8436" y="57.2352"/>
					</TrackLine>
					<TrackLine>
						<End x="204.0698" y="57.885"/>
					</TrackLine>
					<TrackLine>
						<End x="205.0718" y="60.9416"/>
					</TrackLine>
					<TrackLine>
						<End x="205.2283" y="61.3194"/>
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
					<Start x="219.7018" y="52.2372"/>
					<TrackLine>
						<End x="220.5051" y="52.5558"/>
					</TrackLine>
					<TrackLine>
						<End x="221.6729" y="52.5558"/>
					</TrackLine>
					<TrackLine>
						<End x="228.0503" y="52.2818"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="168.6352" y="61.9716"/>
							<Dot x="168.6964" y="61.7292"/>
							<Dot x="169.2252" y="61.8628"/>
							<Dot x="168.7788" y="62.1762"/>
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
						<End x="171.4263" y="61.2526"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4737" y="61.2526"/>
					</TrackLine>
					<TrackLine>
						<End x="169.7581" y="61.7627"/>
					</TrackLine>
					<TrackLine>
						<End x="169.75" y="61.766"/>
					</TrackLine>
					<TrackLine>
						<End x="168.6352" y="61.9716"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="228.0503" y="52.2818"/>
					<TrackLine>
						<End x="235.7244" y="64.2766"/>
					</TrackLine>
					<TrackLine>
						<End x="235.8809" y="64.6544"/>
					</TrackLine>
					<TrackLine>
						<End x="235.8809" y="66.1206"/>
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
						<End x="233.6966" y="83.375"/>
					</TrackLine>
					<TrackLine>
						<End x="233.5892" y="83.5542"/>
					</TrackLine>
					<TrackLine>
						<End x="232.712" y="84.8644"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="49.15"/>
					<TrackLine>
						<End x="204.6101" y="46.5431"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="168.6352" y="61.9716"/>
							<Dot x="168.8086" y="62.1516"/>
							<Dot x="168.4157" y="62.53"/>
							<Dot x="168.3856" y="61.9854"/>
						</Teardrop>
					</Teardrops>
					<Start x="172.9" y="64.65"/>
					<TrackLine>
						<End x="172.1" y="64.65"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8308" y="64.65"/>
					</TrackLine>
					<TrackLine>
						<End x="168.9811" y="64.5339"/>
					</TrackLine>
					<TrackLine>
						<End x="168.2868" y="63.8396"/>
					</TrackLine>
					<TrackLine>
						<End x="168.2868" y="62.8578"/>
					</TrackLine>
					<TrackLine>
						<End x="168.6352" y="61.9716"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="176.8056" y="49.0112"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5701" y="49.5793"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1588" y="50.8454"/>
					</TrackLine>
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
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="180.4411" y="45.6153"/>
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
						<End x="185.7001" y="45.9356"/>
					</TrackLine>
					<TrackLine>
						<End x="185.75" y="46.0562"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7675" y="47.2474"/>
					</TrackLine>
					<TrackLine>
						<End x="185.8098" y="47.3496"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6314" y="48.1712"/>
					</TrackLine>
					<TrackLine>
						<End x="187.2296" y="48.4969"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="189.15" y="46.65"/>
					<TrackLine>
						<End x="188.8252" y="47.3496"/>
					</TrackLine>
					<TrackLine>
						<End x="188.0036" y="48.1712"/>
					</TrackLine>
					<TrackLine>
						<End x="187.2296" y="48.4969"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="186.415" y="51.5343"/>
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
						<End x="168.8343" y="65.1691"/>
					</TrackLine>
					<TrackLine>
						<End x="168.6328" y="65.0856"/>
					</TrackLine>
					<TrackLine>
						<End x="167.7351" y="64.1879"/>
					</TrackLine>
					<TrackLine>
						<End x="167.6516" y="63.9864"/>
					</TrackLine>
					<TrackLine>
						<End x="167.6516" y="63.2287"/>
					</TrackLine>
					<TrackLine>
						<End x="167.6252" y="63.1234"/>
					</TrackLine>
					<TrackLine>
						<End x="166.8726" y="61.2139"/>
					</TrackLine>
					<TrackLine>
						<End x="166.8727" y="60.1009"/>
					</TrackLine>
					<TrackLine>
						<End x="166.7414" y="57.7021"/>
					</TrackLine>
					<TrackLine>
						<End x="166.7414" y="55.7641"/>
					</TrackLine>
					<TrackLine>
						<End x="168.7032" y="46.432"/>
					</TrackLine>
					<TrackLine>
						<End x="169.3959" y="45.7393"/>
					</TrackLine>
					<TrackLine>
						<End x="170.5046" y="45.5281"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1947" y="44.838"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1947" y="43.8622"/>
					</TrackLine>
					<TrackLine>
						<End x="171.0715" y="38.9571"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4098" y="36.0158"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4055" y="36.0055"/>
					</TrackLine>
					<TrackLine>
						<End x="170.15" y="35.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="170.06" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="170.06" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="170.06" y="35.25"/>
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
					<Start x="184.9061" y="89.6584"/>
					<TrackLine>
						<End x="184.15" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="185.148" y="85.8498"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7178" y="85.2768"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7178" y="84.3164"/>
					</TrackLine>
					<TrackLine>
						<End x="185.0905" y="82.7168"/>
					</TrackLine>
					<TrackLine>
						<End x="184.7719" y="81.5692"/>
					</TrackLine>
					<TrackLine>
						<End x="184.6954" y="81.3845"/>
					</TrackLine>
					<TrackLine>
						<End x="184.5711" y="81.2593"/>
					</TrackLine>
					<TrackLine>
						<End x="184.4946" y="81.0746"/>
					</TrackLine>
					<TrackLine>
						<End x="184.4207" y="79.6522"/>
					</TrackLine>
					<TrackLine>
						<End x="184.4207" y="78.0232"/>
					</TrackLine>
					<TrackLine>
						<End x="185.3431" y="74.0958"/>
					</TrackLine>
					<TrackLine>
						<End x="185.3431" y="72.1628"/>
					</TrackLine>
					<TrackLine>
						<End x="185.2716" y="71.878"/>
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
					<Start x="187.2183" y="89.658"/>
					<TrackLine>
						<End x="189.556" y="91.741"/>
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
					<Start x="186.4266" y="59.7044"/>
					<TrackLine>
						<End x="186.6651" y="60.8012"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6651" y="61.8696"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6608" y="61.8799"/>
					</TrackLine>
					<TrackLine>
						<End x="185.9096" y="62.6311"/>
					</TrackLine>
					<TrackLine>
						<End x="179.7422" y="67.5847"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8308" y="68.4"/>
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
					<Start x="168.2366" y="45.2231"/>
					<TrackLine>
						<End x="167.8357" y="46.2384"/>
					</TrackLine>
					<TrackLine>
						<End x="165.9914" y="55.6714"/>
					</TrackLine>
					<TrackLine>
						<End x="165.9914" y="57.7948"/>
					</TrackLine>
					<TrackLine>
						<End x="166.2255" y="60.2475"/>
					</TrackLine>
					<TrackLine>
						<End x="166.2255" y="61.3101"/>
					</TrackLine>
					<TrackLine>
						<End x="166.2472" y="61.3964"/>
					</TrackLine>
					<TrackLine>
						<End x="167.0164" y="63.315"/>
					</TrackLine>
					<TrackLine>
						<End x="167.0163" y="64.1128"/>
					</TrackLine>
					<TrackLine>
						<End x="167.1965" y="64.5478"/>
					</TrackLine>
					<TrackLine>
						<End x="168.2729" y="65.6242"/>
					</TrackLine>
					<TrackLine>
						<End x="168.7079" y="65.8044"/>
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
					<Start x="174.15" y="96.6847"/>
					<TrackLine>
						<End x="174.15" y="94.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0924" y="91.0367"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0924" y="89.9683"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0881" y="89.958"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0867" y="82.6616"/>
					</TrackLine>
					<TrackLine>
						<End x="170.7893" y="76.3125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="175.8001" y="65.1816"/>
					<TrackLine>
						<End x="176.7485" y="63.8814"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7524" y="63.872"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7524" y="61.2747"/>
					</TrackLine>
					<TrackLine>
						<End x="176.896" y="60.5969"/>
					</TrackLine>
					<TrackLine>
						<End x="176.896" y="59.2341"/>
					</TrackLine>
					<TrackLine>
						<End x="176.779" y="58.9516"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8195" y="57.9921"/>
					</TrackLine>
					<TrackLine>
						<End x="175.537" y="57.8751"/>
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
					<Start x="220.4" y="92.2721"/>
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
						<End x="193.9182" y="97.6765"/>
					</TrackLine>
					<TrackLine>
						<End x="193.8685" y="97.664"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="96.8396"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="#TDO"/>
				<Subwire width="0.3">
					<Start x="173.796" y="51.0396"/>
					<TrackLine>
						<End x="175.8" y="45.9567"/>
					</TrackLine>
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
						<End x="180.1487" y="43.8653"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2676" y="43.3"/>
					</TrackLine>
					<TrackLine>
						<End x="185.0324" y="43.3"/>
					</TrackLine>
					<TrackLine>
						<End x="185.1873" y="43.3389"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7623" y="43.5773"/>
					</TrackLine>
					<TrackLine>
						<End x="189.7228" y="45.3119"/>
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
						<End x="175.14" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="175.14" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="175.14" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5655" y="37.168"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5698" y="37.1783"/>
					</TrackLine>
					<TrackLine>
						<End x="176.321" y="37.9295"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2182" y="39.1148"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2621" y="39.1411"/>
					</TrackLine>
					<TrackLine>
						<End x="178.7622" y="39.3485"/>
					</TrackLine>
					<TrackLine>
						<End x="185.8756" y="41.1917"/>
					</TrackLine>
					<TrackLine>
						<End x="185.9126" y="41.2038"/>
					</TrackLine>
					<TrackLine>
						<End x="186.7598" y="41.5549"/>
					</TrackLine>
					<TrackLine>
						<End x="190.875" y="43.3534"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0542" y="43.4608"/>
					</TrackLine>
					<TrackLine>
						<End x="194.9369" y="46.4531"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8992" y="47.4154"/>
					</TrackLine>
					<TrackLine>
						<End x="199.9621" y="52.1599"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0805" y="52.4458"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0805" y="53.8126"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0613" y="55.5314"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0613" y="57.7686"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0665" y="57.8012"/>
					</TrackLine>
					<TrackLine>
						<End x="200.1929" y="58.3032"/>
					</TrackLine>
					<TrackLine>
						<End x="200.1991" y="58.3219"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4074" y="58.9334"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4074" y="59.9742"/>
					</TrackLine>
					<TrackLine>
						<End x="199.6714" y="60.7102"/>
					</TrackLine>
					<TrackLine>
						<End x="197.6915" y="61.6502"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7292" y="62.6125"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6108" y="62.8984"/>
					</TrackLine>
					<TrackLine>
						<End x="196.45" y="63.6192"/>
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
					<Start x="180.1808" y="60.3482"/>
					<TrackLine>
						<End x="180.219" y="59.2794"/>
					</TrackLine>
					<TrackLine>
						<End x="180.219" y="57.9194"/>
					</TrackLine>
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
					<Start x="173.7924" y="90.5025"/>
					<TrackLine>
						<End x="172.3822" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="171.65" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="171.65" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="171.7867" y="83.1958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD3"/>
				<Subwire width="0.3">
					<Start x="218.6942" y="46.4924"/>
					<TrackLine>
						<End x="217.9" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD3"/>
				<Subwire width="0.3">
					<Start x="220.9998" y="44.3016"/>
					<TrackLine>
						<End x="221.65" y="42.1678"/>
					</TrackLine>
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
						<End x="194.05" y="70.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="194.1968" y="70.6669"/>
					</TrackLine>
					<TrackLine>
						<End x="195.1282" y="69.7355"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3739" y="69.6338"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6969" y="69.6338"/>
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
						<End x="211.65" y="72.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="69.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="67.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="66.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="211.7385" y="65.8722"/>
					</TrackLine>
					<TrackLine>
						<End x="211.7385" y="64.2518"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="62.1941"/>
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
						<End x="209.15" y="41.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="208.5673" y="39.5264"/>
					</TrackLine>
					<TrackLine>
						<End x="208.5673" y="38.458"/>
					</TrackLine>
					<TrackLine>
						<End x="209" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="209" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="209" y="35.25"/>
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
						<End x="177.77" y="35.6485"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1612" y="36.0893"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1655" y="36.0996"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3264" y="37.0952"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3307" y="37.1055"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0819" y="37.8567"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0922" y="37.861"/>
					</TrackLine>
					<TrackLine>
						<End x="201.0933" y="43.3"/>
					</TrackLine>
					<TrackLine>
						<End x="201.3976" y="43.4261"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3739" y="44.4024"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5" y="44.7067"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5601" y="47.2265"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2351" y="49.5201"/>
					</TrackLine>
					<TrackLine>
						<End x="203.25" y="49.5794"/>
					</TrackLine>
					<TrackLine>
						<End x="203.25" y="51.2206"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1807" y="55.7837"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1807" y="57.5163"/>
					</TrackLine>
					<TrackLine>
						<End x="202.2133" y="57.6462"/>
					</TrackLine>
					<TrackLine>
						<End x="202.4867" y="58.4084"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5268" y="58.5682"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5268" y="60.3394"/>
					</TrackLine>
					<TrackLine>
						<End x="202.4867" y="60.4992"/>
					</TrackLine>
					<TrackLine>
						<End x="202.2468" y="61.0777"/>
					</TrackLine>
					<TrackLine>
						<End x="200.5923" y="64.551"/>
					</TrackLine>
					<TrackLine>
						<End x="199.63" y="65.5133"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3445" y="67.2457"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3342" y="67.25"/>
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
					<Start x="179.3375" y="81.3859"/>
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
						<End x="192.5198" y="101.764"/>
					</TrackLine>
					<TrackLine>
						<End x="193.5882" y="101.764"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0509" y="101.3991"/>
					</TrackLine>
					<TrackLine>
						<End x="200.2342" y="101.3531"/>
					</TrackLine>
					<TrackLine>
						<End x="200.8295" y="101.1063"/>
					</TrackLine>
					<TrackLine>
						<End x="201.0009" y="101.0128"/>
					</TrackLine>
					<TrackLine>
						<End x="201.4907" y="100.8096"/>
					</TrackLine>
					<TrackLine>
						<End x="201.526" y="100.8008"/>
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
					<Start x="179.4841" y="76.284"/>
					<TrackLine>
						<End x="178.2716" y="73.8935"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1823" y="71.9322"/>
					</TrackLine>
					<TrackLine>
						<End x="177.1654" y="70.9129"/>
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
					<Start x="169.1098" y="36.55"/>
					<TrackLine>
						<End x="167.9615" y="36"/>
					</TrackLine>
					<TrackLine>
						<End x="167.61" y="35.6485"/>
					</TrackLine>
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
					<Start x="176.8655" y="36.6338"/>
					<TrackLine>
						<End x="177.6948" y="37.5303"/>
					</TrackLine>
					<TrackLine>
						<End x="178.6571" y="38.4926"/>
					</TrackLine>
					<TrackLine>
						<End x="178.943" y="38.611"/>
					</TrackLine>
					<TrackLine>
						<End x="200.9441" y="44.05"/>
					</TrackLine>
					<TrackLine>
						<End x="200.9728" y="44.0619"/>
					</TrackLine>
					<TrackLine>
						<End x="201.7381" y="44.8272"/>
					</TrackLine>
					<TrackLine>
						<End x="201.75" y="44.8559"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8101" y="47.3576"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8226" y="47.4073"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5" y="49.7067"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5" y="51.0933"/>
					</TrackLine>
					<TrackLine>
						<End x="201.4742" y="55.6964"/>
					</TrackLine>
					<TrackLine>
						<End x="201.4742" y="57.6036"/>
					</TrackLine>
					<TrackLine>
						<End x="201.5407" y="57.8685"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8141" y="58.6308"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8203" y="58.6555"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8203" y="60.2521"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8141" y="60.2768"/>
					</TrackLine>
					<TrackLine>
						<End x="201.6141" y="60.7592"/>
					</TrackLine>
					<TrackLine>
						<End x="199.9565" y="64.1262"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2052" y="64.8775"/>
					</TrackLine>
					<TrackLine>
						<End x="196.0692" y="66.6"/>
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
					<Start x="181.3133" y="73.1293"/>
					<TrackLine>
						<End x="181.5499" y="72.2316"/>
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
					<Start x="206.0013" y="76"/>
					<TrackLine>
						<End x="211.3985" y="75.5"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="75.1485"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="72.3433"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="67.3433"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="65.9567"/>
					</TrackLine>
					<TrackLine>
						<End x="212.477" y="65.7408"/>
					</TrackLine>
					<TrackLine>
						<End x="212.477" y="64.3832"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="62.3433"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="60.9567"/>
					</TrackLine>
					<TrackLine>
						<End x="212.4995" y="59.7945"/>
					</TrackLine>
					<TrackLine>
						<End x="212.4995" y="58.4279"/>
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
					<Start x="196.9569" y="58.3712"/>
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
					<Start x="214.5041" y="65.062"/>
					<TrackLine>
						<End x="214.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="188.7446" y="65.8959"/>
					<TrackLine>
						<End x="189.0061" y="56.3494"/>
					</TrackLine>
					<TrackLine>
						<End x="189.0061" y="55.297"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8543" y="54.9445"/>
					</TrackLine>
					<TrackLine>
						<End x="188.85" y="54.9342"/>
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
					<Start x="198.225" y="80.5041"/>
					<TrackLine>
						<End x="199.6678" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="78.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="77.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="197.5274" y="72.6387"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.3">
					<Start x="220.4" y="41.65"/>
					<TrackLine>
						<End x="219.6998" y="43.7674"/>
					</TrackLine>
					<TrackLine>
						<End x="219.6998" y="44.8358"/>
					</TrackLine>
					<TrackLine>
						<End x="219.9942" y="45.9582"/>
					</TrackLine>
					<TrackLine>
						<End x="219.9942" y="47.0266"/>
					</TrackLine>
					<TrackLine>
						<End x="219.9899" y="47.0369"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="48.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="49.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="215.9399" y="50.4789"/>
					</TrackLine>
					<TrackLine>
						<End x="215.1866" y="50.4789"/>
					</TrackLine>
					<TrackLine>
						<End x="214.9161" y="50.5909"/>
					</TrackLine>
					<TrackLine>
						<End x="213.9657" y="51.5413"/>
					</TrackLine>
					<TrackLine>
						<End x="213.8537" y="51.8118"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2492" y="58.5771"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2492" y="59.6453"/>
					</TrackLine>
					<TrackLine>
						<End x="213.25" y="60.8294"/>
					</TrackLine>
					<TrackLine>
						<End x="213.25" y="62.4706"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2156" y="64.5301"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2156" y="65.5939"/>
					</TrackLine>
					<TrackLine>
						<End x="213.25" y="65.8294"/>
					</TrackLine>
					<TrackLine>
						<End x="213.25" y="67.4706"/>
					</TrackLine>
					<TrackLine>
						<End x="213.25" y="72.4706"/>
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
						<End x="209.6941" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="208.6059" y="79.25"/>
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
						<End x="204.6678" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="198.0719" y="71.343"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5511" y="70.329"/>
					</TrackLine>
					<TrackLine>
						<End x="195.5197" y="70.329"/>
					</TrackLine>
					<TrackLine>
						<End x="194.7903" y="71.0584"/>
					</TrackLine>
					<TrackLine>
						<End x="194.6957" y="71.1945"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9445" y="71.9457"/>
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
						<End x="198.4236" y="117.0763"/>
					</TrackLine>
					<TrackLine>
						<End x="198.4193" y="117.0866"/>
					</TrackLine>
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
						<End x="190.9209" y="107.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="BDOUT"/>
				<Subwire width="0.3">
					<Start x="209.1019" y="60.3709"/>
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
					<Start x="222.25" y="92.25"/>
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
						<End x="224.3396" y="67.9"/>
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
					<Start x="175.4548" y="63.3383"/>
					<TrackLine>
						<End x="176.5485" y="62.1666"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5528" y="62.1563"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5528" y="61.0879"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1455" y="59.2808"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1455" y="57.918"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5937" y="55.5154"/>
					</TrackLine>
					<TrackLine>
						<End x="176.598" y="55.5051"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3492" y="54.7539"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8029" y="52.5325"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7652" y="51.5702"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8836" y="51.2843"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2333" y="47.6658"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2333" y="45.9932"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3314" y="45.7562"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2562" y="44.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="183.4932" y="44.7333"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4533" y="43.876"/>
					</TrackLine>
					<TrackLine>
						<End x="186.503" y="43.8635"/>
					</TrackLine>
					<TrackLine>
						<End x="199.5794" y="42.55"/>
					</TrackLine>
					<TrackLine>
						<End x="201.2206" y="42.55"/>
					</TrackLine>
					<TrackLine>
						<End x="201.2799" y="42.5649"/>
					</TrackLine>
					<TrackLine>
						<End x="201.7868" y="42.7751"/>
					</TrackLine>
					<TrackLine>
						<End x="204.0788" y="43.7358"/>
					</TrackLine>
					<TrackLine>
						<End x="204.1064" y="43.7472"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4241" y="43.7472"/>
					</TrackLine>
					<TrackLine>
						<End x="205.6059" y="43.75"/>
					</TrackLine>
					<TrackLine>
						<End x="206.6941" y="43.75"/>
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
					<Start x="174.8556" y="59.9155"/>
					<TrackLine>
						<End x="175.8437" y="55.3662"/>
					</TrackLine>
					<TrackLine>
						<End x="175.9621" y="55.0803"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9244" y="54.118"/>
					</TrackLine>
					<TrackLine>
						<End x="180.3781" y="51.8966"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1293" y="51.1454"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1336" y="51.1351"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1336" y="50.0667"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1293" y="50.0564"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8167" y="47.6658"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8167" y="46.6648"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8534" y="44.9251"/>
					</TrackLine>
					<TrackLine>
						<End x="180.9609" y="44.7459"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2459" y="43.4609"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4251" y="43.3534"/>
					</TrackLine>
					<TrackLine>
						<End x="183.034" y="43.101"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2367" y="43.0501"/>
					</TrackLine>
					<TrackLine>
						<End x="186.3176" y="42.3635"/>
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
					<Start x="178.1859" y="58.5994"/>
					<TrackLine>
						<End x="182.3874" y="52.0091"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4137" y="51.9652"/>
					</TrackLine>
					<TrackLine>
						<End x="182.6211" y="51.4651"/>
					</TrackLine>
					<TrackLine>
						<End x="182.6336" y="51.4154"/>
					</TrackLine>
					<TrackLine>
						<End x="182.8917" y="47.8122"/>
					</TrackLine>
					<TrackLine>
						<End x="182.8917" y="46.1288"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6288" y="45.3917"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6341" y="44.6135"/>
					</TrackLine>
					<TrackLine>
						<End x="199.7067" y="43.3"/>
					</TrackLine>
					<TrackLine>
						<End x="201.0933" y="43.3"/>
					</TrackLine>
					<TrackLine>
						<End x="201.3976" y="43.4261"/>
					</TrackLine>
					<TrackLine>
						<End x="203.6547" y="44.3705"/>
					</TrackLine>
					<TrackLine>
						<End x="203.9575" y="44.4959"/>
					</TrackLine>
					<TrackLine>
						<End x="205.2929" y="44.4959"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4567" y="44.5"/>
					</TrackLine>
					<TrackLine>
						<End x="206.8433" y="44.5"/>
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
					<Start x="185.3651" y="61.3354"/>
					<TrackLine>
						<End x="193.4255" y="62.8182"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4358" y="62.8225"/>
					</TrackLine>
					<TrackLine>
						<End x="198.1163" y="64.8775"/>
					</TrackLine>
					<TrackLine>
						<End x="198.1266" y="64.8818"/>
					</TrackLine>
					<TrackLine>
						<End x="203.234" y="65.106"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2443" y="65.1103"/>
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
					<Start x="169.0376" y="84.4798"/>
					<TrackLine>
						<End x="169.7367" y="82.5124"/>
					</TrackLine>
					<TrackLine>
						<End x="172.0838" y="76.8456"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2766" y="71.4946"/>
					</TrackLine>
					<TrackLine>
						<End x="173.3333" y="71.2688"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9971" y="67.0038"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="201.6974" y="91.5"/>
					<TrackLine>
						<End x="202.9" y="93.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="94.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="98.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3311" y="103.5252"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="175.5215" y="106.857"/>
					<TrackLine>
						<End x="168.6059" y="106.75"/>
					</TrackLine>
					<TrackLine>
						<End x="168.5772" y="106.7381"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8119" y="105.9728"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8" y="105.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="166.55" y="100.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="166.55" y="99.8559"/>
					</TrackLine>
					<TrackLine>
						<End x="168.5208" y="91.7671"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD14"/>
				<Subwire width="0.3">
					<Start x="179.5453" y="62.0883"/>
					<TrackLine>
						<End x="176.2928" y="67.5483"/>
					</TrackLine>
					<TrackLine>
						<End x="174.216" y="70.8368"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1606" y="70.9293"/>
					</TrackLine>
					<TrackLine>
						<End x="173.937" y="71.4684"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9108" y="71.573"/>
					</TrackLine>
					<TrackLine>
						<End x="172.8284" y="76.9937"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4867" y="82.6616"/>
					</TrackLine>
					<TrackLine>
						<End x="170.3376" y="85.014"/>
					</TrackLine>
					<TrackLine>
						<End x="170.3333" y="85.0243"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0809" y="87.34"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0725" y="87.3604"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0725" y="88.4396"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0809" y="88.46"/>
					</TrackLine>
					<TrackLine>
						<End x="169.84" y="89.2191"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8604" y="89.2275"/>
					</TrackLine>
					<TrackLine>
						<End x="170.9396" y="89.2275"/>
					</TrackLine>
					<TrackLine>
						<End x="170.96" y="89.2191"/>
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
					<Start x="179.8336" y="50.6009"/>
					<TrackLine>
						<End x="178.743" y="50.2288"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3302" y="49.7396"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2618" y="49.7396"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2515" y="49.7439"/>
					</TrackLine>
					<TrackLine>
						<End x="163.1551" y="57.5939"/>
					</TrackLine>
					<TrackLine>
						<End x="161.8788" y="58.8702"/>
					</TrackLine>
					<TrackLine>
						<End x="161.7764" y="59.041"/>
					</TrackLine>
					<TrackLine>
						<End x="161.5268" y="59.6432"/>
					</TrackLine>
					<TrackLine>
						<End x="160.3452" y="62.7428"/>
					</TrackLine>
					<TrackLine>
						<End x="160.2607" y="63.0792"/>
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
					<Start x="224.3396" y="72.9"/>
					<TrackLine>
						<End x="226.2712" y="68.8693"/>
					</TrackLine>
					<TrackLine>
						<End x="226.3896" y="68.5834"/>
					</TrackLine>
					<TrackLine>
						<End x="227.3076" y="66.0628"/>
					</TrackLine>
					<TrackLine>
						<End x="227.3076" y="64.696"/>
					</TrackLine>
					<TrackLine>
						<End x="227.1892" y="64.4101"/>
					</TrackLine>
					<TrackLine>
						<End x="226.1966" y="62.425"/>
					</TrackLine>
					<TrackLine>
						<End x="226.0892" y="62.2458"/>
					</TrackLine>
					<TrackLine>
						<End x="220.249" y="55.4018"/>
					</TrackLine>
					<TrackLine>
						<End x="219.1482" y="54.301"/>
					</TrackLine>
					<TrackLine>
						<End x="218.6813" y="54.1076"/>
					</TrackLine>
					<TrackLine>
						<End x="217.1187" y="54.1076"/>
					</TrackLine>
					<TrackLine>
						<End x="216.5042" y="54.3317"/>
					</TrackLine>
					<TrackLine>
						<End x="215.219" y="54.3317"/>
					</TrackLine>
					<TrackLine>
						<End x="208.8771" y="53.4849"/>
					</TrackLine>
					<TrackLine>
						<End x="207.2481" y="53.4849"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5083" y="54.2827"/>
					</TrackLine>
					<TrackLine>
						<End x="197.5527" y="54.2827"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3065" y="53.3002"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="219.3396" y="62.9"/>
					<TrackLine>
						<End x="219.15" y="64.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="215.0383" y="66.362"/>
					</TrackLine>
					<TrackLine>
						<End x="213.9699" y="66.362"/>
					</TrackLine>
					<TrackLine>
						<End x="210.9178" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8822" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6608" y="63.5818"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR20"/>
				<Subwire width="0.3">
					<Start x="173.3814" y="52.8943"/>
					<TrackLine>
						<End x="171.9343" y="53.0991"/>
					</TrackLine>
					<TrackLine>
						<End x="171.924" y="53.1034"/>
					</TrackLine>
					<TrackLine>
						<End x="164.059" y="58.8118"/>
					</TrackLine>
					<TrackLine>
						<End x="163.0967" y="59.7741"/>
					</TrackLine>
					<TrackLine>
						<End x="162.9783" y="60.06"/>
					</TrackLine>
					<TrackLine>
						<End x="161.7732" y="63.2149"/>
					</TrackLine>
					<TrackLine>
						<End x="161.7607" y="63.2646"/>
					</TrackLine>
					<TrackLine>
						<End x="161.7607" y="64.8936"/>
					</TrackLine>
					<TrackLine>
						<End x="163.04" y="72.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="163.04" y="79.2191"/>
					</TrackLine>
					<TrackLine>
						<End x="163.0443" y="79.2294"/>
					</TrackLine>
					<TrackLine>
						<End x="168.4641" y="88.8722"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4278" y="89.8359"/>
					</TrackLine>
					<TrackLine>
						<End x="169.7156" y="89.9551"/>
					</TrackLine>
					<TrackLine>
						<End x="171.0844" y="89.9551"/>
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
						<End x="176.2148" y="80.4968"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2148" y="79.4284"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2105" y="79.4181"/>
					</TrackLine>
					<TrackLine>
						<End x="175.81" y="78.5721"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8066" y="78.5639"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8066" y="77.4977"/>
					</TrackLine>
					<TrackLine>
						<End x="175.81" y="77.4895"/>
					</TrackLine>
					<TrackLine>
						<End x="177.7979" y="75.4786"/>
					</TrackLine>
					<TrackLine>
						<End x="178.6787" y="74.5978"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8583" y="74.5234"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1099" y="74.5234"/>
					</TrackLine>
					<TrackLine>
						<End x="180.2895" y="74.5978"/>
					</TrackLine>
					<TrackLine>
						<End x="180.5079" y="74.8155"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6875" y="74.8899"/>
					</TrackLine>
					<TrackLine>
						<End x="189.9638" y="75.0037"/>
					</TrackLine>
					<TrackLine>
						<End x="194.483" y="76.4432"/>
					</TrackLine>
					<TrackLine>
						<End x="194.9507" y="76.5606"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5676" y="76.6148"/>
					</TrackLine>
					<TrackLine>
						<End x="199.6812" y="76.6148"/>
					</TrackLine>
					<TrackLine>
						<End x="199.6861" y="76.6168"/>
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
					<Start x="214.549" y="59.1112"/>
					<TrackLine>
						<End x="210.4" y="59.15"/>
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
						<End x="221.5619" y="64.7228"/>
					</TrackLine>
					<TrackLine>
						<End x="221.55" y="64.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="220.6396" y="62.3658"/>
					</TrackLine>
					<TrackLine>
						<End x="220.6353" y="62.3555"/>
					</TrackLine>
					<TrackLine>
						<End x="219.8841" y="61.6043"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="214.549" y="59.1112"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="221.089" y="51.0058"/>
					<TrackLine>
						<End x="221.65" y="49.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="48.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="220.9178" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4441" y="47.8"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3559" y="47.8"/>
					</TrackLine>
					<TrackLine>
						<End x="207.3559" y="47.8"/>
					</TrackLine>
					<TrackLine>
						<End x="205.1397" y="47.8216"/>
					</TrackLine>
					<TrackLine>
						<End x="204.0805" y="47.8216"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5018" y="47.0847"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4334" y="47.0847"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6941" y="48"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6059" y="48"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5772" y="47.9881"/>
					</TrackLine>
					<TrackLine>
						<End x="187.8119" y="47.2228"/>
					</TrackLine>
					<TrackLine>
						<End x="187.3175" y="46.6635"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="198.6058" y="37.3"/>
					<TrackLine>
						<End x="176.7439" y="40.2527"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4852" y="40.7205"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="209.8673" y="38.9922"/>
					<TrackLine>
						<End x="202.0335" y="38.6772"/>
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
					<Start x="165.0283" y="60.7434"/>
					<TrackLine>
						<End x="163.265" y="63.5346"/>
					</TrackLine>
					<TrackLine>
						<End x="163.2607" y="63.5449"/>
					</TrackLine>
					<TrackLine>
						<End x="163.2607" y="64.6133"/>
					</TrackLine>
					<TrackLine>
						<End x="163.265" y="64.6236"/>
					</TrackLine>
					<TrackLine>
						<End x="165.7334" y="67.54"/>
					</TrackLine>
					<TrackLine>
						<End x="166.4846" y="68.2912"/>
					</TrackLine>
					<TrackLine>
						<End x="167.862" y="69.5984"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="179.6264" y="36.561"/>
					<TrackLine>
						<End x="177.41" y="37.9295"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3997" y="37.9338"/>
					</TrackLine>
					<TrackLine>
						<End x="168.5215" y="39.7399"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="56.65"/>
					<TrackLine>
						<End x="199.151" y="59.4538"/>
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
						<End x="195.7656" y="105.3914"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="191.2734" y="52.7846"/>
					<TrackLine>
						<End x="193.872" y="51.2786"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9742" y="51.2363"/>
					</TrackLine>
					<TrackLine>
						<End x="195.5734" y="51.0002"/>
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
					<Start x="226.5029" y="39.0887"/>
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
					<Start x="178.2088" y="51.5288"/>
					<TrackLine>
						<End x="174.0675" y="54.402"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9653" y="54.4443"/>
					</TrackLine>
					<TrackLine>
						<End x="172.7975" y="54.4443"/>
					</TrackLine>
					<TrackLine>
						<End x="172.4685" y="54.3991"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="198.0069" y="117.2391"/>
							<Dot x="198.2552" y="117.269"/>
							<Dot x="198.1898" y="117.8106"/>
							<Dot x="197.8222" y="117.4076"/>
						</Teardrop>
					</Teardrops>
					<Start x="198.0069" y="117.2391"/>
					<TrackLine>
						<End x="198.85" y="119.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="198.85" y="120.9261"/>
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
					<Start x="233.5809" y="65.3875"/>
					<TrackLine>
						<End x="233.5" y="63.2985"/>
					</TrackLine>
					<TrackLine>
						<End x="232.5955" y="42.1271"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="170.95" y="62.4025"/>
					<TrackLine>
						<End x="173.1263" y="60.843"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="173.1263" y="60.843"/>
					<TrackLine>
						<End x="172.4685" y="54.3991"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="232.5955" y="42.1271"/>
					<TrackLine>
						<End x="232.8359" y="41.3913"/>
					</TrackLine>
					<TrackLine>
						<End x="234.65" y="35.5657"/>
					</TrackLine>
					<TrackLine>
						<End x="234.65" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="234.65" y="35"/>
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
					<Start x="227.9" y="87.9"/>
					<TrackLine>
						<End x="227.1918" y="88.0532"/>
					</TrackLine>
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
					<Start x="176.9977" y="72.4229"/>
					<TrackLine>
						<End x="179.6263" y="70.2113"/>
					</TrackLine>
					<TrackLine>
						<End x="179.7285" y="70.169"/>
					</TrackLine>
					<TrackLine>
						<End x="185.6" y="67.8597"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="210.4" y="56.65"/>
					<TrackLine>
						<End x="214.851" y="56.8741"/>
					</TrackLine>
					<TrackLine>
						<End x="216.8722" y="56.8741"/>
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
					<Start x="188.7383" y="51.1863"/>
					<TrackLine>
						<End x="191.2734" y="52.7846"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="56.65"/>
					<TrackLine>
						<End x="208.0626" y="56.2849"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="171.4686" y="70.7017"/>
					<TrackLine>
						<End x="171.022" y="62.7648"/>
					</TrackLine>
					<TrackLine>
						<End x="170.95" y="62.4025"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="191.1496" y="55.7094"/>
					<TrackLine>
						<End x="191.2734" y="52.7846"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="172.9" y="46.65"/>
					<TrackLine>
						<End x="170.5718" y="48.4295"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4696" y="48.4718"/>
					</TrackLine>
					<TrackLine>
						<End x="169.3018" y="48.4718"/>
					</TrackLine>
					<TrackLine>
						<End x="169.1996" y="48.4295"/>
					</TrackLine>
					<TrackLine>
						<End x="168.378" y="47.6079"/>
					</TrackLine>
					<TrackLine>
						<End x="166.7289" y="45.9092"/>
					</TrackLine>
					<TrackLine>
						<End x="162.932" y="41.4777"/>
					</TrackLine>
					<TrackLine>
						<End x="159.74" y="35.7521"/>
					</TrackLine>
					<TrackLine>
						<End x="159.65" y="35.5657"/>
					</TrackLine>
					<TrackLine>
						<End x="159.65" y="35.4"/>
					</TrackLine>
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
						<End x="197.55" y="115.9938"/>
					</TrackLine>
					<TrackLine>
						<End x="198.0069" y="117.2391"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="164.34" y="78.6849"/>
					<TrackLine>
						<End x="169.1512" y="75.7427"/>
					</TrackLine>
					<TrackLine>
						<End x="169.9728" y="74.9211"/>
					</TrackLine>
					<TrackLine>
						<End x="170.0151" y="74.8189"/>
					</TrackLine>
					<TrackLine>
						<End x="171.4686" y="70.7017"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="195.7656" y="105.3914"/>
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
					<Start x="175.2528" y="61.6221"/>
					<TrackLine>
						<End x="174.2717" y="61.4655"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1695" y="61.4232"/>
					</TrackLine>
					<TrackLine>
						<End x="173.1263" y="60.843"/>
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
					<Start x="181.025" y="47.1653"/>
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
						<End x="182.7632" y="44.0251"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2701" y="43.8149"/>
					</TrackLine>
					<TrackLine>
						<End x="183.3294" y="43.8"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4103" y="43.1135"/>
					</TrackLine>
					<TrackLine>
						<End x="199.4867" y="41.8"/>
					</TrackLine>
					<TrackLine>
						<End x="201.3133" y="41.8"/>
					</TrackLine>
					<TrackLine>
						<End x="201.516" y="41.8509"/>
					</TrackLine>
					<TrackLine>
						<End x="204.4021" y="42.9986"/>
					</TrackLine>
					<TrackLine>
						<End x="205.5166" y="42.9986"/>
					</TrackLine>
					<TrackLine>
						<End x="205.9015" y="43"/>
					</TrackLine>
					<TrackLine>
						<End x="206.3985" y="43"/>
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
						<End x="228.7591" y="64.2792"/>
					</TrackLine>
					<TrackLine>
						<End x="228.8076" y="64.4722"/>
					</TrackLine>
					<TrackLine>
						<End x="229.05" y="74.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="229.0619" y="74.7228"/>
					</TrackLine>
					<TrackLine>
						<End x="229.7842" y="75.6086"/>
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
					<Start x="164.5607" y="64.0791"/>
					<TrackLine>
						<End x="167.9213" y="59.9275"/>
					</TrackLine>
					<TrackLine>
						<End x="168.6725" y="59.1763"/>
					</TrackLine>
					<TrackLine>
						<End x="168.6828" y="59.172"/>
					</TrackLine>
					<TrackLine>
						<End x="169.7512" y="59.172"/>
					</TrackLine>
					<TrackLine>
						<End x="169.7615" y="59.1763"/>
					</TrackLine>
					<TrackLine>
						<End x="170.917" y="60.1027"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A5"/>
				<Subwire width="0.3">
					<Start x="169.472" y="63.3487"/>
					<TrackLine>
						<End x="169.217" y="60.472"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD4"/>
				<Subwire width="0.3">
					<Start x="189.4296" y="76.3037"/>
					<TrackLine>
						<End x="193.4264" y="78.0228"/>
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
				<NetRef name="BDIN"/>
				<Subwire width="0.3">
					<Start x="199.15" y="94.15"/>
					<TrackLine>
						<End x="197.8119" y="97.3272"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8" y="97.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="197.0656" y="105.9256"/>
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
						<End x="195.04" y="122.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="OSC"/>
				<Subwire width="0.3">
					<Start x="180.4723" y="41.2719"/>
					<TrackLine>
						<End x="177.8226" y="42.8484"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8123" y="42.8527"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7439" y="42.8527"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8018" y="42.7705"/>
					</TrackLine>
					<TrackLine>
						<End x="170.681" y="42.396"/>
					</TrackLine>
					<TrackLine>
						<End x="169.3524" y="42.396"/>
					</TrackLine>
					<TrackLine>
						<End x="167.0908" y="42.7671"/>
					</TrackLine>
					<TrackLine>
						<End x="166.0224" y="42.7671"/>
					</TrackLine>
					<TrackLine>
						<End x="166.0121" y="42.7628"/>
					</TrackLine>
					<TrackLine>
						<End x="164.531" y="41.6625"/>
					</TrackLine>
					<TrackLine>
						<End x="163.7798" y="40.9113"/>
					</TrackLine>
					<TrackLine>
						<End x="163.7755" y="40.901"/>
					</TrackLine>
					<TrackLine>
						<End x="162.44" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="162.44" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="162.44" y="35.25"/>
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
					<Start x="180.3124" y="71.719"/>
					<TrackLine>
						<End x="181.8475" y="71.8293"/>
					</TrackLine>
					<TrackLine>
						<End x="190.3368" y="72.7537"/>
					</TrackLine>
					<TrackLine>
						<End x="190.5298" y="72.8022"/>
					</TrackLine>
					<TrackLine>
						<End x="195.1812" y="74.3313"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2249" y="74.3423"/>
					</TrackLine>
					<TrackLine>
						<End x="196.8698" y="74.5591"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0313" y="74.5591"/>
					</TrackLine>
					<TrackLine>
						<End x="206.5355" y="74.7"/>
					</TrackLine>
					<TrackLine>
						<End x="206.5458" y="74.7043"/>
					</TrackLine>
					<TrackLine>
						<End x="207.297" y="75.4555"/>
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
					<Start x="193.0068" y="55.6044"/>
					<TrackLine>
						<End x="196.3465" y="54.8861"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6556" y="54.8862"/>
					</TrackLine>
					<TrackLine>
						<End x="207.3792" y="54.2349"/>
					</TrackLine>
					<TrackLine>
						<End x="208.746" y="54.2349"/>
					</TrackLine>
					<TrackLine>
						<End x="215.0902" y="54.9792"/>
					</TrackLine>
					<TrackLine>
						<End x="216.633" y="54.9792"/>
					</TrackLine>
					<TrackLine>
						<End x="217.2475" y="54.7551"/>
					</TrackLine>
					<TrackLine>
						<End x="218.5525" y="54.7551"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7814" y="54.8499"/>
					</TrackLine>
					<TrackLine>
						<End x="219.7001" y="55.7686"/>
					</TrackLine>
					<TrackLine>
						<End x="225.4935" y="62.7108"/>
					</TrackLine>
					<TrackLine>
						<End x="225.5249" y="62.7632"/>
					</TrackLine>
					<TrackLine>
						<End x="226.5533" y="64.8349"/>
					</TrackLine>
					<TrackLine>
						<End x="226.5576" y="64.8452"/>
					</TrackLine>
					<TrackLine>
						<End x="226.5576" y="65.9136"/>
					</TrackLine>
					<TrackLine>
						<End x="225.6396" y="68.4342"/>
					</TrackLine>
					<TrackLine>
						<End x="225.6353" y="68.4445"/>
					</TrackLine>
					<TrackLine>
						<End x="224.8841" y="69.1957"/>
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
					<Start x="190.5253" y="89.8094"/>
					<TrackLine>
						<End x="188.1876" y="91.5896"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9017" y="91.708"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3266" y="91.8025"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2582" y="91.8025"/>
					</TrackLine>
					<TrackLine>
						<End x="169.5413" y="90.671"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0436" y="90.4646"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0026" y="90.44"/>
					</TrackLine>
					<TrackLine>
						<End x="161.1639" y="84.33"/>
					</TrackLine>
					<TrackLine>
						<End x="160.42" y="83.5861"/>
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
					<Start x="170.4" y="100.4"/>
					<TrackLine>
						<End x="171.65" y="105.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSIA"/>
				<Subwire width="0.3">
					<Start x="170.4" y="100.4"/>
					<TrackLine>
						<End x="171.65" y="95.9178"/>
					</TrackLine>
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
						<End x="188.0328" y="92.458"/>
					</TrackLine>
					<TrackLine>
						<End x="188.0825" y="92.4455"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5826" y="92.2381"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0698" y="91.1051"/>
					</TrackLine>
					<TrackLine>
						<End x="191.821" y="90.3539"/>
					</TrackLine>
					<TrackLine>
						<End x="191.8253" y="90.3436"/>
					</TrackLine>
					<TrackLine>
						<End x="191.8253" y="89.2752"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="191.65" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="191.945" y="85.4655"/>
					</TrackLine>
					<TrackLine>
						<End x="191.9493" y="85.4552"/>
					</TrackLine>
					<TrackLine>
						<End x="192.7005" y="84.704"/>
					</TrackLine>
					<TrackLine>
						<End x="192.7108" y="84.6997"/>
					</TrackLine>
					<TrackLine>
						<End x="196.1059" y="84.05"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9" y="83.9604"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BIAKO"/>
				<Subwire width="0.3">
					<Start x="226.6079" y="86.5032"/>
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
					<Start x="167.0291" y="66.9955"/>
					<TrackLine>
						<End x="168.4065" y="68.3027"/>
					</TrackLine>
					<TrackLine>
						<End x="169.1577" y="69.0539"/>
					</TrackLine>
					<TrackLine>
						<End x="169.162" y="69.0642"/>
					</TrackLine>
					<TrackLine>
						<End x="169.6035" y="70.5488"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="165.0755" y="40.3668"/>
					<TrackLine>
						<End x="166.0224" y="40.1671"/>
					</TrackLine>
					<TrackLine>
						<End x="167.0908" y="40.1671"/>
					</TrackLine>
					<TrackLine>
						<End x="167.1011" y="40.1714"/>
					</TrackLine>
					<TrackLine>
						<End x="168.0029" y="40.9919"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0401" y="40.9919"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5489" y="38.6838"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1606" y="37.861"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1709" y="37.8567"/>
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
					<Start x="206.6666" y="81.6141"/>
					<TrackLine>
						<End x="207.9" y="84.8822"/>
					</TrackLine>
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
					<Start x="204.797" y="79.8088"/>
					<TrackLine>
						<End x="205.4" y="78.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4" y="77.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="204.6678" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8175" y="75.9296"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6523" y="75.9296"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0421" y="75.8212"/>
					</TrackLine>
					<TrackLine>
						<End x="194.7157" y="75.7393"/>
					</TrackLine>
					<TrackLine>
						<End x="190.113" y="74.2537"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7462" y="74.2537"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7918" y="74.2846"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8348" y="74.2846"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6323" y="74.0847"/>
					</TrackLine>
					<TrackLine>
						<End x="179.5455" y="73.3658"/>
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
					<Start x="191.522" y="114.0868"/>
					<TrackLine>
						<End x="194.2381" y="110.9728"/>
					</TrackLine>
					<TrackLine>
						<End x="194.25" y="110.9441"/>
					</TrackLine>
					<TrackLine>
						<End x="194.4656" y="104.8572"/>
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
						<End x="193.245" y="85.9997"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-IOW"/>
				<Subwire width="0.3">
					<Start x="175.2895" y="113.0175"/>
					<TrackLine>
						<End x="163.6059" y="111.75"/>
					</TrackLine>
					<TrackLine>
						<End x="163.5772" y="111.7381"/>
					</TrackLine>
					<TrackLine>
						<End x="162.8119" y="110.9728"/>
					</TrackLine>
					<TrackLine>
						<End x="162.8" y="110.9441"/>
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
						<End x="159.5107" y="62.9865"/>
					</TrackLine>
					<TrackLine>
						<End x="159.6312" y="62.5067"/>
					</TrackLine>
					<TrackLine>
						<End x="160.8128" y="59.4071"/>
					</TrackLine>
					<TrackLine>
						<End x="161.1047" y="58.7028"/>
					</TrackLine>
					<TrackLine>
						<End x="161.2831" y="58.4053"/>
					</TrackLine>
					<TrackLine>
						<End x="162.6902" y="56.9982"/>
					</TrackLine>
					<TrackLine>
						<End x="172.8267" y="49.108"/>
					</TrackLine>
					<TrackLine>
						<End x="173.1126" y="48.9896"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4212" y="47.9083"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1583" y="47.1712"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1583" y="46.5184"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2488" y="46.2998"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1817" y="44.5869"/>
					</TrackLine>
					<TrackLine>
						<End x="180.3651" y="44.281"/>
					</TrackLine>
					<TrackLine>
						<End x="181.781" y="42.8651"/>
					</TrackLine>
					<TrackLine>
						<End x="182.0869" y="42.6817"/>
					</TrackLine>
					<TrackLine>
						<End x="182.798" y="42.387"/>
					</TrackLine>
					<TrackLine>
						<End x="183.144" y="42.3001"/>
					</TrackLine>
					<TrackLine>
						<End x="186.2249" y="41.6135"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2892" y="39.35"/>
					</TrackLine>
					<TrackLine>
						<End x="199.5751" y="39.2316"/>
					</TrackLine>
					<TrackLine>
						<End x="201.489" y="37.3815"/>
					</TrackLine>
					<TrackLine>
						<End x="203.4785" y="36"/>
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
					<Start x="166.5566" y="41.4671"/>
					<TrackLine>
						<End x="167.8572" y="41.694"/>
					</TrackLine>
					<TrackLine>
						<End x="170.8134" y="41.694"/>
					</TrackLine>
					<TrackLine>
						<End x="174.951" y="42.0205"/>
					</TrackLine>
					<TrackLine>
						<End x="176.0194" y="42.0205"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2781" y="41.5527"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="193.9676" y="48.3847"/>
					<TrackLine>
						<End x="199.0496" y="48.9047"/>
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
						<End x="175.45" y="97.2189"/>
					</TrackLine>
					<TrackLine>
						<End x="175.45" y="96.1505"/>
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
					<Start x="186.65" y="105.4"/>
					<TrackLine>
						<End x="187.9048" y="109.4409"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9048" y="109.8489"/>
					</TrackLine>
					<TrackLine>
						<End x="188.722" y="114.9013"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7345" y="114.951"/>
					</TrackLine>
					<TrackLine>
						<End x="189.7343" y="117.7254"/>
					</TrackLine>
					<TrackLine>
						<End x="189.8527" y="118.0113"/>
					</TrackLine>
					<TrackLine>
						<End x="190.815" y="118.9736"/>
					</TrackLine>
					<TrackLine>
						<End x="192.5" y="120.4"/>
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
				<NetRef name="SEL"/>
				<Subwire width="0.3">
					<Start x="196.0354" y="71.5741"/>
					<TrackLine>
						<End x="191.9733" y="68.6536"/>
					</TrackLine>
					<TrackLine>
						<End x="191.011" y="67.6913"/>
					</TrackLine>
					<TrackLine>
						<End x="190.5179" y="66.5304"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD13"/>
				<Subwire width="0.3">
					<Start x="179.2445" y="98.6535"/>
					<TrackLine>
						<End x="183.4178" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="99.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="100.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="104.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4" y="105.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="185.392" y="109.4396"/>
					</TrackLine>
					<TrackLine>
						<End x="185.392" y="109.8604"/>
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
						<End x="185.2922" y="117.8577"/>
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
					<Start x="179.2445" y="98.6535"/>
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
						<End x="179.2445" y="98.6535"/>
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
						<End x="182.9" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2422" y="117.1743"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="189.7644" y="109.2034"/>
					<TrackLine>
						<End x="190.222" y="114.621"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2263" y="114.6313"/>
					</TrackLine>
					<TrackLine>
						<End x="191.7843" y="117.042"/>
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
					<Start x="187.9" y="100.4"/>
					<TrackLine>
						<End x="187.85" y="97.3738"/>
					</TrackLine>
					<TrackLine>
						<End x="187.85" y="96.3054"/>
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
				<NetRef name="BAD9"/>
				<Subwire width="0.3">
					<Start x="189.15" y="105.4"/>
					<TrackLine>
						<End x="188.5596" y="108.7044"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5596" y="109.7024"/>
					</TrackLine>
					<TrackLine>
						<End x="188.75" y="110.2059"/>
					</TrackLine>
					<TrackLine>
						<End x="189.472" y="114.7702"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4843" y="117.5762"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4886" y="117.5865"/>
					</TrackLine>
					<TrackLine>
						<End x="191.2398" y="118.3377"/>
					</TrackLine>
					<TrackLine>
						<End x="191.2501" y="118.342"/>
					</TrackLine>
					<TrackLine>
						<End x="193.0441" y="119.05"/>
					</TrackLine>
					<TrackLine>
						<End x="193.0728" y="119.0619"/>
					</TrackLine>
					<TrackLine>
						<End x="195.04" y="120.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BAD15"/>
				<Subwire width="0.3">
					<Start x="175.6947" y="108.6854"/>
					<TrackLine>
						<End x="177.1678" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="177.9" y="109.8822"/>
					</TrackLine>
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
						<End x="172.85" y="97.2189"/>
					</TrackLine>
					<TrackLine>
						<End x="172.85" y="96.1505"/>
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
					<Start x="215.8616" y="52.4868"/>
					<TrackLine>
						<End x="209.0625" y="51.9849"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5647" y="51.8292"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4963" y="51.8292"/>
					</TrackLine>
					<TrackLine>
						<End x="195.7723" y="52.0002"/>
					</TrackLine>
					<TrackLine>
						<End x="195.762" y="52.0045"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5581" y="52.7863"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="168.4651" y="74.235"/>
					<TrackLine>
						<End x="162.6291" y="65.0484"/>
					</TrackLine>
					<TrackLine>
						<End x="162.5107" y="64.7625"/>
					</TrackLine>
					<TrackLine>
						<End x="162.5107" y="63.3957"/>
					</TrackLine>
					<TrackLine>
						<End x="163.7283" y="60.2092"/>
					</TrackLine>
					<TrackLine>
						<End x="163.7326" y="60.1989"/>
					</TrackLine>
					<TrackLine>
						<End x="164.4838" y="59.4477"/>
					</TrackLine>
					<TrackLine>
						<End x="170.7914" y="56.7331"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="177.1011" y="78.0308"/>
					<TrackLine>
						<End x="178.3288" y="75.8055"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0056" y="75.1287"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9626" y="75.1287"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1651" y="75.3286"/>
					</TrackLine>
					<TrackLine>
						<End x="180.5671" y="75.4951"/>
					</TrackLine>
					<TrackLine>
						<End x="187.9041" y="76.7877"/>
					</TrackLine>
					<TrackLine>
						<End x="188.19" y="76.9061"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8851" y="77.5994"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8819" y="79.3185"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8922" y="79.3228"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9606" y="79.3228"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1941" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="197.696" y="79.227"/>
					</TrackLine>
					<TrackLine>
						<End x="198.754" y="79.227"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1059" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1941" y="79.25"/>
					</TrackLine>
					<TrackLine>
						<End x="202.2228" y="79.2381"/>
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
					<Start x="196.9716" y="56.6431"/>
					<TrackLine>
						<End x="196.4124" y="57.0755"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6612" y="57.8267"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6569" y="57.837"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6569" y="58.9054"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6612" y="58.9157"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4124" y="59.6669"/>
					</TrackLine>
					<TrackLine>
						<End x="198.1817" y="61.3854"/>
					</TrackLine>
					<TrackLine>
						<End x="198.4676" y="61.5038"/>
					</TrackLine>
					<TrackLine>
						<End x="204.7067" y="63.75"/>
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
					<Start x="228.8675" y="40.1367"/>
					<TrackLine>
						<End x="229.1091" y="41.1492"/>
					</TrackLine>
					<TrackLine>
						<End x="229.1091" y="42.1508"/>
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
					<Start x="177.8937" y="56.0496"/>
					<TrackLine>
						<End x="176.8942" y="58.0577"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8907" y="58.0662"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8907" y="59.1326"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8942" y="59.1411"/>
					</TrackLine>
					<TrackLine>
						<End x="177.6442" y="59.8911"/>
					</TrackLine>
					<TrackLine>
						<End x="177.6527" y="59.8946"/>
					</TrackLine>
					<TrackLine>
						<End x="178.7191" y="59.8946"/>
					</TrackLine>
					<TrackLine>
						<End x="178.7276" y="59.8911"/>
					</TrackLine>
					<TrackLine>
						<End x="179.6363" y="59.0525"/>
					</TrackLine>
					<TrackLine>
						<End x="180.966" y="57.865"/>
					</TrackLine>
					<TrackLine>
						<End x="180.9763" y="57.8607"/>
					</TrackLine>
					<TrackLine>
						<End x="182.0447" y="57.8607"/>
					</TrackLine>
					<TrackLine>
						<End x="183.7886" y="58.4675"/>
					</TrackLine>
					<TrackLine>
						<End x="183.7987" y="58.4717"/>
					</TrackLine>
					<TrackLine>
						<End x="184.5498" y="59.2228"/>
					</TrackLine>
					<TrackLine>
						<End x="184.554" y="59.2329"/>
					</TrackLine>
					<TrackLine>
						<End x="184.554" y="60.3011"/>
					</TrackLine>
					<TrackLine>
						<End x="184.5498" y="60.3112"/>
					</TrackLine>
					<TrackLine>
						<End x="184.0698" y="60.7912"/>
					</TrackLine>
					<TrackLine>
						<End x="184.0656" y="60.8013"/>
					</TrackLine>
					<TrackLine>
						<End x="184.0656" y="61.8695"/>
					</TrackLine>
					<TrackLine>
						<End x="184.0698" y="61.8796"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1365" y="65.1177"/>
					</TrackLine>
					<TrackLine>
						<End x="187.4489" y="66.4404"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2001" y="67.1916"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5486" y="68.462"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0694" y="69.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0781" y="73.4877"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3563" y="73.6029"/>
					</TrackLine>
					<TrackLine>
						<End x="197.0158" y="73.8739"/>
					</TrackLine>
					<TrackLine>
						<End x="198.039" y="73.8739"/>
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
					<Start x="184.5585" y="84.7966"/>
					<TrackLine>
						<End x="186.3073" y="86.33"/>
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
					<Start x="181.5105" y="59.1607"/>
					<TrackLine>
						<End x="181.5953" y="61.4049"/>
					</TrackLine>
					<TrackLine>
						<End x="181.5953" y="62.7717"/>
					</TrackLine>
					<TrackLine>
						<End x="181.4769" y="63.0576"/>
					</TrackLine>
					<TrackLine>
						<End x="175.2624" y="71.5847"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1792" y="71.7856"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3175" y="77.217"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2701" y="77.4059"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6148" y="79.4284"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0867" y="83.73"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0824" y="83.7403"/>
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
					<Start x="227.7823" y="78.6925"/>
					<TrackLine>
						<End x="223.4178" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3822" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="79.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="73.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="72.9"/>
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
					<Start x="228.4885" y="76.1531"/>
					<TrackLine>
						<End x="228.3" y="74.8433"/>
					</TrackLine>
					<TrackLine>
						<End x="228.0576" y="64.5649"/>
					</TrackLine>
					<TrackLine>
						<End x="228.0451" y="64.5152"/>
					</TrackLine>
					<TrackLine>
						<End x="227.8377" y="64.0151"/>
					</TrackLine>
					<TrackLine>
						<End x="226.8684" y="62.0869"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6849" y="61.7809"/>
					</TrackLine>
					<TrackLine>
						<End x="220.7634" y="55.0001"/>
					</TrackLine>
					<TrackLine>
						<End x="219.5499" y="53.7866"/>
					</TrackLine>
					<TrackLine>
						<End x="219.44" y="53.7207"/>
					</TrackLine>
					<TrackLine>
						<End x="218.8869" y="53.4914"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7626" y="53.4602"/>
					</TrackLine>
					<TrackLine>
						<End x="217.0374" y="53.4602"/>
					</TrackLine>
					<TrackLine>
						<End x="216.9131" y="53.4914"/>
					</TrackLine>
					<TrackLine>
						<End x="216.3576" y="53.6843"/>
					</TrackLine>
					<TrackLine>
						<End x="215.3656" y="53.6843"/>
					</TrackLine>
					<TrackLine>
						<End x="211.3133" y="53.05"/>
					</TrackLine>
					<TrackLine>
						<End x="208.9698" y="52.7349"/>
					</TrackLine>
					<TrackLine>
						<End x="207.1554" y="52.7349"/>
					</TrackLine>
					<TrackLine>
						<End x="198.0305" y="53.1292"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="174.9148" y="79.9626"/>
					<TrackLine>
						<End x="175.062" y="77.3496"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8135" y="71.9324"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1466" y="68.877"/>
					</TrackLine>
					<TrackLine>
						<End x="182.0991" y="63.4965"/>
					</TrackLine>
					<TrackLine>
						<End x="182.1254" y="63.4526"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3328" y="62.9525"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2545" y="59.767"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD10"/>
				<Subwire width="0.3">
					<Start x="187.2207" y="78.8377"/>
					<TrackLine>
						<End x="185.7348" y="79.1461"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7245" y="79.1504"/>
					</TrackLine>
					<TrackLine>
						<End x="184.9733" y="79.9016"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9975" y="82.1977"/>
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
					<Start x="186.269" y="80.4461"/>
					<TrackLine>
						<End x="184.1604" y="82.6794"/>
					</TrackLine>
					<TrackLine>
						<End x="183.4792" y="83.3606"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8822" y="86.65"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="179.15" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8822" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3559" y="89.25"/>
					</TrackLine>
					<TrackLine>
						<End x="183.4441" y="89.25"/>
					</TrackLine>
					<TrackLine>
						<End x="183.4728" y="89.2381"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3616" y="88.3627"/>
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
					<Start x="187.4322" y="64.5732"/>
					<TrackLine>
						<End x="189.2788" y="64.5959"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0201" y="65.318"/>
					</TrackLine>
					<TrackLine>
						<End x="191.7303" y="66.0282"/>
					</TrackLine>
					<TrackLine>
						<End x="191.7302" y="67.2242"/>
					</TrackLine>
					<TrackLine>
						<End x="192.4404" y="67.9344"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8822" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="219.15" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="221.65" y="77.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3822" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="223.4178" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="227.2564" y="77.4228"/>
					</TrackLine>
					<TrackLine>
						<End x="228.3082" y="77.4228"/>
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
						<End x="231.75" y="69.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="231.75" y="68.6059"/>
					</TrackLine>
					<TrackLine>
						<End x="231.677" y="66.0418"/>
					</TrackLine>
					<TrackLine>
						<End x="231.677" y="63.621"/>
					</TrackLine>
					<TrackLine>
						<End x="229.25" y="48.6059"/>
					</TrackLine>
					<TrackLine>
						<End x="229.2381" y="48.5772"/>
					</TrackLine>
					<TrackLine>
						<End x="229.088" y="48.4137"/>
					</TrackLine>
					<TrackLine>
						<End x="229.0837" y="48.4034"/>
					</TrackLine>
					<TrackLine>
						<End x="229.0837" y="47.335"/>
					</TrackLine>
					<TrackLine>
						<End x="229.7182" y="42.2872"/>
					</TrackLine>
					<TrackLine>
						<End x="229.7182" y="41.3031"/>
					</TrackLine>
					<TrackLine>
						<End x="229.7344" y="41.2386"/>
					</TrackLine>
					<TrackLine>
						<End x="229.9461" y="40.728"/>
					</TrackLine>
					<TrackLine>
						<End x="229.9803" y="40.6709"/>
					</TrackLine>
					<TrackLine>
						<End x="230.0276" y="40.6172"/>
					</TrackLine>
					<TrackLine>
						<End x="230.0276" y="39.6562"/>
					</TrackLine>
					<TrackLine>
						<End x="229.348" y="38.9766"/>
					</TrackLine>
					<TrackLine>
						<End x="228.387" y="38.9766"/>
					</TrackLine>
					<TrackLine>
						<End x="227.0022" y="40.2941"/>
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
					<Start x="225.2576" y="65.3794"/>
					<TrackLine>
						<End x="225" y="63.4567"/>
					</TrackLine>
					<TrackLine>
						<End x="224.8739" y="63.1524"/>
					</TrackLine>
					<TrackLine>
						<End x="219.1475" y="56.1333"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4167" y="55.4025"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3833" y="55.4025"/>
					</TrackLine>
					<TrackLine>
						<End x="216.8327" y="55.5978"/>
					</TrackLine>
					<TrackLine>
						<End x="216.7181" y="55.6266"/>
					</TrackLine>
					<TrackLine>
						<End x="215.0051" y="55.6266"/>
					</TrackLine>
					<TrackLine>
						<End x="208.5968" y="54.9849"/>
					</TrackLine>
					<TrackLine>
						<End x="207.5284" y="54.9849"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7756" y="55.4896"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4938" y="55.4896"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8181" y="56.1653"/>
					</TrackLine>
					<TrackLine>
						<End x="194.2488" y="57.9994"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4976" y="58.7506"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4873" y="58.7549"/>
					</TrackLine>
					<TrackLine>
						<End x="192.4189" y="58.7549"/>
					</TrackLine>
					<TrackLine>
						<End x="190.3668" y="58.2594"/>
					</TrackLine>
					<TrackLine>
						<End x="189.8971" y="58.0648"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7942" y="56.9619"/>
					</TrackLine>
					<TrackLine>
						<End x="187.7358" y="55.8232"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD11"/>
				<Subwire width="0.3">
					<Start x="187.1405" y="82.0334"/>
					<TrackLine>
						<End x="184.0768" y="83.6337"/>
					</TrackLine>
					<TrackLine>
						<End x="183.3956" y="84.3149"/>
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
					<Start x="200.4" y="89.15"/>
					<TrackLine>
						<End x="200.3974" y="90.9658"/>
					</TrackLine>
					<TrackLine>
						<End x="200.3974" y="92.0342"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4017" y="92.0445"/>
					</TrackLine>
					<TrackLine>
						<End x="201.65" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="BSEL"/>
				<Subwire width="0.3">
					<Start x="201.65" y="94.15"/>
					<TrackLine>
						<End x="200.4" y="97.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4" y="115.9178"/>
					</TrackLine>
					<TrackLine>
						<End x="199.7193" y="117.6208"/>
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
						<End x="216.4455" y="50.9368"/>
					</TrackLine>
					<TrackLine>
						<End x="219.7018" y="52.2372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="61.65"/>
					<TrackLine>
						<End x="207.3718" y="60.2085"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="167.2373" y="37.2504"/>
					<TrackLine>
						<End x="165.3179" y="36.25"/>
					</TrackLine>
					<TrackLine>
						<End x="164.82" y="35.7521"/>
					</TrackLine>
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
						<End x="230.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="186.415" y="51.5343"/>
					<TrackLine>
						<End x="187.2296" y="48.4969"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="227.9" y="101.65"/>
					<TrackLine>
						<End x="224.9414" y="102.078"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="202.6998" y="66.406"/>
					<TrackLine>
						<End x="192.9426" y="66.722"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="186.415" y="51.5343"/>
					<TrackLine>
						<End x="189.2435" y="55.1371"/>
					</TrackLine>
					<TrackLine>
						<End x="189.2858" y="55.2393"/>
					</TrackLine>
					<TrackLine>
						<End x="189.5996" y="56.2933"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6419" y="56.3955"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4635" y="57.2171"/>
					</TrackLine>
					<TrackLine>
						<End x="190.5657" y="57.2594"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9531" y="57.4549"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="97.9"/>
					<TrackLine>
						<End x="224.9414" y="102.078"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="204.6101" y="46.5431"/>
					<TrackLine>
						<End x="200.4" y="45.4"/>
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
						<End x="223.25" y="106.5021"/>
					</TrackLine>
					<TrackLine>
						<End x="224.9414" y="102.078"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="230.3837" y="47.8692"/>
					<TrackLine>
						<End x="230.5773" y="42.4493"/>
					</TrackLine>
					<TrackLine>
						<End x="230.5773" y="41.4501"/>
					</TrackLine>
					<TrackLine>
						<End x="230.6909" y="41.1758"/>
					</TrackLine>
					<TrackLine>
						<End x="230.7738" y="41.0891"/>
					</TrackLine>
					<TrackLine>
						<End x="230.8877" y="40.8141"/>
					</TrackLine>
					<TrackLine>
						<End x="230.8877" y="39.4593"/>
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
					<Start x="232.712" y="84.8644"/>
					<TrackLine>
						<End x="227.9" y="92.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="230.4" y="81.65"/>
					<TrackLine>
						<End x="232.712" y="84.8644"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9426" y="66.722"/>
					<TrackLine>
						<End x="192.8913" y="64.1182"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="193.054" y="100.464"/>
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
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="173.4938" y="45.05"/>
					</TrackLine>
					<TrackLine>
						<End x="170.0167" y="44.3501"/>
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
						<End x="193.054" y="100.464"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="200.4" y="45.4"/>
					<TrackLine>
						<End x="193.2345" y="46.0847"/>
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
					<Start x="170.0167" y="44.3501"/>
					<TrackLine>
						<End x="169.8857" y="46.9218"/>
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
					<Start x="184.9061" y="89.6584"/>
					<TrackLine>
						<End x="187.2183" y="89.658"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.3">
					<Start x="186.4266" y="59.7044"/>
					<TrackLine>
						<End x="185.115" y="52.0685"/>
					</TrackLine>
					<TrackLine>
						<End x="185.115" y="51.0001"/>
					</TrackLine>
					<TrackLine>
						<End x="186.0175" y="46.1293"/>
					</TrackLine>
					<TrackLine>
						<End x="186.0218" y="46.119"/>
					</TrackLine>
					<TrackLine>
						<End x="186.773" y="45.3678"/>
					</TrackLine>
					<TrackLine>
						<End x="186.7833" y="45.3635"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8559" y="44.05"/>
					</TrackLine>
					<TrackLine>
						<End x="200.9441" y="44.05"/>
					</TrackLine>
					<TrackLine>
						<End x="200.9728" y="44.0619"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2657" y="45.02"/>
					</TrackLine>
					<TrackLine>
						<End x="203.7718" y="45.2299"/>
					</TrackLine>
					<TrackLine>
						<End x="203.83" y="45.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="205.144" y="45.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="205.3294" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="206.9706" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="208.8133" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="220.4656" y="43.0016"/>
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
					<Start x="168.2366" y="45.2231"/>
					<TrackLine>
						<End x="168.7647" y="43.8315"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4981" y="43.0981"/>
					</TrackLine>
					<TrackLine>
						<End x="170.5353" y="43.0981"/>
					</TrackLine>
					<TrackLine>
						<End x="174.6707" y="43.5205"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5947" y="43.6027"/>
					</TrackLine>
					<TrackLine>
						<End x="177.9615" y="43.6027"/>
					</TrackLine>
					<TrackLine>
						<End x="181.0065" y="42.5719"/>
					</TrackLine>
					<TrackLine>
						<End x="181.0168" y="42.5676"/>
					</TrackLine>
					<TrackLine>
						<End x="181.316" y="42.2694"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7488" y="42.01"/>
					</TrackLine>
					<TrackLine>
						<End x="182.5619" y="41.6729"/>
					</TrackLine>
					<TrackLine>
						<End x="183.0513" y="41.5501"/>
					</TrackLine>
					<TrackLine>
						<End x="186.0735" y="40.8777"/>
					</TrackLine>
					<TrackLine>
						<End x="199.14" y="38.6"/>
					</TrackLine>
					<TrackLine>
						<End x="199.1503" y="38.5957"/>
					</TrackLine>
					<TrackLine>
						<End x="199.9015" y="37.8445"/>
					</TrackLine>
					<TrackLine>
						<End x="201.29" y="35.6485"/>
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
					<Start x="220.4" y="92.2721"/>
					<TrackLine>
						<End x="220.9543" y="91.7055"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7055" y="90.9543"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7158" y="90.95"/>
					</TrackLine>
					<TrackLine>
						<End x="222.7842" y="90.95"/>
					</TrackLine>
					<TrackLine>
						<End x="222.7945" y="90.9543"/>
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
						<End x="229.2381" y="93.4728"/>
					</TrackLine>
					<TrackLine>
						<End x="234.0077" y="85.4089"/>
					</TrackLine>
					<TrackLine>
						<End x="234.012" y="85.3986"/>
					</TrackLine>
					<TrackLine>
						<End x="234.012" y="84.3302"/>
					</TrackLine>
					<TrackLine>
						<End x="232.3539" y="65.8957"/>
					</TrackLine>
					<TrackLine>
						<End x="232.3539" y="63.4858"/>
					</TrackLine>
					<TrackLine>
						<End x="231.6837" y="47.335"/>
					</TrackLine>
					<TrackLine>
						<End x="231.4364" y="42.6072"/>
					</TrackLine>
					<TrackLine>
						<End x="231.4364" y="41.647"/>
					</TrackLine>
					<TrackLine>
						<End x="231.4851" y="41.5947"/>
					</TrackLine>
					<TrackLine>
						<End x="231.5196" y="41.5372"/>
					</TrackLine>
					<TrackLine>
						<End x="231.7315" y="41.0261"/>
					</TrackLine>
					<TrackLine>
						<End x="231.7478" y="40.9611"/>
					</TrackLine>
					<TrackLine>
						<End x="231.86" y="35.4621"/>
					</TrackLine>
					<TrackLine>
						<End x="231.86" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="231.86" y="35.25"/>
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
					<Start x="170.7893" y="76.3125"/>
					<TrackLine>
						<End x="172.6528" y="71.1922"/>
					</TrackLine>
					<TrackLine>
						<End x="173.6971" y="66.4696"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7014" y="66.4593"/>
					</TrackLine>
					<TrackLine>
						<End x="174.4526" y="65.7081"/>
					</TrackLine>
					<TrackLine>
						<End x="174.4629" y="65.7038"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8001" y="65.1816"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="189.15" y="96.8396"/>
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
						<End x="174.15" y="96.6847"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="#TDO"/>
				<Subwire width="0.3">
					<Start x="173.796" y="51.0396"/>
					<TrackLine>
						<End x="172.8369" y="51.5986"/>
					</TrackLine>
					<TrackLine>
						<End x="171.4992" y="52.4675"/>
					</TrackLine>
					<TrackLine>
						<End x="163.6201" y="58.1896"/>
					</TrackLine>
					<TrackLine>
						<End x="162.4745" y="59.3352"/>
					</TrackLine>
					<TrackLine>
						<End x="162.4482" y="59.3791"/>
					</TrackLine>
					<TrackLine>
						<End x="162.2408" y="59.8792"/>
					</TrackLine>
					<TrackLine>
						<End x="161.0592" y="62.9789"/>
					</TrackLine>
					<TrackLine>
						<End x="161.0107" y="63.1719"/>
					</TrackLine>
					<TrackLine>
						<End x="161.0107" y="64.9863"/>
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
					<Start x="173.7924" y="90.5025"/>
					<TrackLine>
						<End x="184.3719" y="90.9584"/>
					</TrackLine>
					<TrackLine>
						<End x="185.4403" y="90.9584"/>
					</TrackLine>
					<TrackLine>
						<End x="187.7525" y="90.958"/>
					</TrackLine>
					<TrackLine>
						<End x="187.7628" y="90.9537"/>
					</TrackLine>
					<TrackLine>
						<End x="188.514" y="90.2025"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5183" y="90.1922"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="189.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3134" y="85.0304"/>
					</TrackLine>
					<TrackLine>
						<End x="192.2757" y="84.0681"/>
					</TrackLine>
					<TrackLine>
						<End x="192.5616" y="83.9497"/>
					</TrackLine>
					<TrackLine>
						<End x="205.3308" y="81.1068"/>
					</TrackLine>
					<TrackLine>
						<End x="205.3403" y="81.1028"/>
					</TrackLine>
					<TrackLine>
						<End x="206.091" y="80.3521"/>
					</TrackLine>
					<TrackLine>
						<End x="206.095" y="80.3426"/>
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
					<Start x="171.7867" y="83.1958"/>
					<TrackLine>
						<End x="172.8648" y="79.2792"/>
					</TrackLine>
					<TrackLine>
						<End x="173.5612" y="77.1715"/>
					</TrackLine>
					<TrackLine>
						<End x="173.5729" y="77.1249"/>
					</TrackLine>
					<TrackLine>
						<End x="174.545" y="71.6594"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7248" y="71.2255"/>
					</TrackLine>
					<TrackLine>
						<End x="180.841" y="62.6328"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8453" y="62.6225"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8453" y="61.5541"/>
					</TrackLine>
					<TrackLine>
						<End x="180.841" y="61.5438"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1808" y="60.3482"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SD3"/>
				<Subwire width="0.3">
					<Start x="218.6942" y="46.4924"/>
					<TrackLine>
						<End x="220.9998" y="44.3016"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD1"/>
				<Subwire width="0.3">
					<Start x="179.3375" y="81.3859"/>
					<TrackLine>
						<End x="179.4841" y="76.284"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="169.1098" y="36.55"/>
					<TrackLine>
						<End x="176.8655" y="36.6338"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.3">
					<Start x="206.0013" y="76"/>
					<TrackLine>
						<End x="204.8433" y="75.8"/>
					</TrackLine>
					<TrackLine>
						<End x="199.9466" y="75.2443"/>
					</TrackLine>
					<TrackLine>
						<End x="196.737" y="75.2444"/>
					</TrackLine>
					<TrackLine>
						<End x="195.1335" y="75.0818"/>
					</TrackLine>
					<TrackLine>
						<End x="194.9485" y="75.0354"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2938" y="73.5162"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2441" y="73.5037"/>
					</TrackLine>
					<TrackLine>
						<End x="181.3133" y="73.1293"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="WTBT"/>
				<Subwire width="0.3">
					<Start x="214.5041" y="65.062"/>
					<TrackLine>
						<End x="210.9178" y="62.9"/>
					</TrackLine>
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
						<End x="198.6168" y="60.7538"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6065" y="60.7495"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8553" y="59.9983"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9569" y="58.3712"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="197.5274" y="72.6387"/>
					<TrackLine>
						<End x="196.5675" y="72.8635"/>
					</TrackLine>
					<TrackLine>
						<End x="195.5033" y="72.8635"/>
					</TrackLine>
					<TrackLine>
						<End x="195.4969" y="72.8609"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5344" y="69.2758"/>
					</TrackLine>
					<TrackLine>
						<End x="189.9734" y="67.8261"/>
					</TrackLine>
					<TrackLine>
						<End x="189.2222" y="67.0749"/>
					</TrackLine>
					<TrackLine>
						<End x="189.2179" y="67.0646"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7446" y="65.8959"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="198.225" y="80.5041"/>
					<TrackLine>
						<End x="192.743" y="80.0728"/>
					</TrackLine>
					<TrackLine>
						<End x="192.4571" y="79.9544"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4603" y="78.2353"/>
					</TrackLine>
					<TrackLine>
						<End x="187.7652" y="77.542"/>
					</TrackLine>
					<TrackLine>
						<End x="187.7549" y="77.5377"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6865" y="77.5377"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6762" y="77.542"/>
					</TrackLine>
					<TrackLine>
						<End x="185.2997" y="78.5145"/>
					</TrackLine>
					<TrackLine>
						<End x="182.453" y="80.902"/>
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
					<Start x="190.9209" y="107.3"/>
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
						<End x="191.75" y="101.3985"/>
					</TrackLine>
					<TrackLine>
						<End x="191.75" y="99.8985"/>
					</TrackLine>
					<TrackLine>
						<End x="191.75" y="99.4015"/>
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
				<Subwire width="0.0203">
					<Start x="218.5254" y="124.0928"/>
					<TrackLine>
						<End x="218.4013" y="124.1502"/>
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
					<Start x="224.3396" y="67.9"/>
					<TrackLine>
						<End x="224.2065" y="66.1145"/>
					</TrackLine>
					<TrackLine>
						<End x="224.2012" y="66.1019"/>
					</TrackLine>
					<TrackLine>
						<End x="224.0156" y="65.8939"/>
					</TrackLine>
					<TrackLine>
						<End x="224.0156" y="64.8649"/>
					</TrackLine>
					<TrackLine>
						<End x="224.189" y="64.6899"/>
					</TrackLine>
					<TrackLine>
						<End x="224.192" y="64.6826"/>
					</TrackLine>
					<TrackLine>
						<End x="224.192" y="63.6174"/>
					</TrackLine>
					<TrackLine>
						<End x="224.189" y="63.6101"/>
					</TrackLine>
					<TrackLine>
						<End x="223.4399" y="62.861"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4178" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3822" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="215.0741" y="57.8434"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0239" y="57.8434"/>
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
						<End x="209.1019" y="60.3709"/>
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
						<End x="184.5379" y="117.7188"/>
					</TrackLine>
					<TrackLine>
						<End x="184.5422" y="117.7085"/>
					</TrackLine>
					<TrackLine>
						<End x="184.5422" y="116.6401"/>
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
					<Start x="222.25" y="92.25"/>
					<TrackLine>
						<End x="223" y="93.1515"/>
					</TrackLine>
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
						<End x="219.1295" y="123.4493"/>
					</TrackLine>
					<TrackLine>
						<End x="218.5254" y="124.0928"/>
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