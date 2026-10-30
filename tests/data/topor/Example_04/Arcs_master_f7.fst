<?xml version="1.0" encoding="UTF-8"?>

<!--**************************************-->
<!--   File    : Arcs_master_а7.fst       -->
<!--   Format  : TopoR PCB file           -->
<!--   Version : 1.2.1                    -->
<!--   Program : TopoR Lite 7.0.18707     -->
<!--   Date    : Friday, October 30, 2026 -->
<!--   Time    : 14:27                    -->
<!--**************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.2.1</Version>
		<Program>TopoR Lite 7.0.18707</Program>
		<Date>Friday, October 30, 2026 14:27</Date>
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
			<CompInstance name="C6" uniqueId="FRVJQFVA" side="Top">
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
			<CompInstance name="X4" uniqueId="OBNJKVAY" side="Top" angle="90" fixed="on">
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
			<CompInstance name="C1" uniqueId="BPRANOYK" side="Top" angle="90">
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
			<CompInstance name="C2" uniqueId="IUFUOIFN" side="Top" angle="270">
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
			<CompInstance name="C7" uniqueId="YIJYIYOK" side="Top" angle="270">
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
			<CompInstance name="C3" uniqueId="EYHIWKKC" side="Top" angle="90">
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
			<CompInstance name="C5" uniqueId="TPZSGZFK" side="Top" angle="270">
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
			<CompInstance name="D6" uniqueId="ZTKFEHRD" side="Top" angle="270">
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
			<CompInstance name="D12" uniqueId="AMGYBUUF" side="Top" angle="180">
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
			<CompInstance name="D11" uniqueId="MNPTAZWY" side="Top" angle="180">
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
			<CompInstance name="D13" uniqueId="UABIZZIK" side="Top" angle="180">
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
			<CompInstance name="D7" uniqueId="VABBONFU" side="Top" angle="180">
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
			<CompInstance name="C4" uniqueId="KWUGBQRD" side="Top">
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
			<CompInstance name="D15" uniqueId="YHICIGTU" side="Top">
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
			<CompInstance name="D4" uniqueId="VRKFUPDA" side="Top" angle="180">
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
			<CompInstance name="D10" uniqueId="WXBLJDQZ" side="Top" angle="180">
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
			<CompInstance name="D14" uniqueId="SSCIGEQJ" side="Top" angle="180">
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
			<CompInstance name="D9" uniqueId="VWVAHTDS" side="Top" angle="180">
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
			<CompInstance name="X3" uniqueId="TATLMXFH" side="Top" angle="180" fixed="on">
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
			<CompInstance name="D8" uniqueId="YZFFAGWC" side="Top" angle="180">
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
			<CompInstance name="D2" uniqueId="JZQMXMLB" side="Top" angle="180">
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
			<CompInstance name="D1" uniqueId="QBQOEPGE" side="Top" angle="270">
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
			<CompInstance name="X1" uniqueId="NCZJPIIB" side="Top" fixed="on">
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
			<CompInstance name="X2" uniqueId="WTKDBLRU" side="Bottom" fixed="on">
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
			<CompInstance name="D3" uniqueId="FZUEGOJG" side="Top" angle="180">
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
			<CompInstance name="D5" uniqueId="ESUPFWYN" side="Top" angle="270">
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
				<Org x="220.4869" y="92.2472"/>
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
				<Org x="204.5875" y="46.5428"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="199.0897" y="59.8685"/>
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
				<Org x="177.0473" y="78.0185"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="175.4969" y="61.4021"/>
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
				<Org x="189.7644" y="109.1991"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD2"/>
				<Org x="204.797" y="79.8088"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="WTBT"/>
				<Org x="214.5039" y="65.0629"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DOUT"/>
				<Org x="196.9575" y="56.9639"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="191.1503" y="55.7001"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IAKO"/>
				<Org x="197.9876" y="53.4233"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD12"/>
				<Org x="183.2422" y="117.1743"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD10"/>
				<Org x="182.9206" y="82.4906"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="170.6879" y="76.4134"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="176.9191" y="72.3553"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D1"/>
				<Org x="175.386" y="63.1497"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="175" y="67"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD15"/>
				<Org x="181.744" y="59.0777"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D0"/>
				<Org x="174.9014" y="59.6697"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="OSC"/>
				<Org x="180.4298" y="41.3086"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="169.8753" y="46.9399"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A3"/>
				<Org x="176.8776" y="36.6341"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A3"/>
				<Org x="169.17" y="36.5478"/>
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
				<Org x="214.5471" y="59.0962"/>
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
				<Org x="191.5304" y="114.0862"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DB"/>
				<Org x="196.2532" y="53.6205"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="184.8371" y="67.7423"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD11"/>
				<Org x="187.0417" y="82.3196"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D6"/>
				<Org x="186.706" y="59.0419"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="EB1"/>
				<Org x="187.2809" y="46.6453"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD1"/>
				<Org x="179.3437" y="81.6324"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD2"/>
				<Org x="179.4757" y="73.413"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D3"/>
				<Org x="181.3019" y="73.1467"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD14"/>
				<Org x="179.5929" y="61.8186"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR18"/>
				<Org x="173.7916" y="90.5028"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR18"/>
				<Org x="171.7559" y="83.2326"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A0"/>
				<Org x="170.7063" y="59.8856"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR20"/>
				<Org x="173.3775" y="52.9037"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="168.9912" y="84.5102"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR19"/>
				<Org x="168.2706" y="74.3444"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="168.7388" y="39.6507"/>
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
				<Org x="222.3357" y="92.2385"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BIAKO"/>
				<Org x="226.6776" y="86.4363"/>
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
				<Org x="215.8349" y="52.5"/>
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
				<Org x="202.7149" y="66.3751"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="208.0606" y="56.357"/>
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
				<Org x="198.265" y="80.505"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD13"/>
				<Org x="197.3152" y="73.0013"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="P1"/>
				<Org x="198.6005" y="63.626"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="198.8375" y="48.8875"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD11"/>
				<Org x="191.9086" y="117.1442"/>
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
				<Org x="193.4298" y="78.1962"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SEL"/>
				<Org x="195.8815" y="71.9538"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="192.8987" y="63.7073"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="192.9695" y="66.7804"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SIA"/>
				<Org x="193.0069" y="55.6085"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="192.9527" y="57.4691"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="WTBT"/>
				<Org x="196.9604" y="58.7069"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="193.8519" y="48.3895"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="DIN"/>
				<Org x="194.5578" y="52.847"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="189.15" y="96.8396"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD6"/>
				<Org x="186.4738" y="86.4642"/>
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
				<Org x="184.5615" y="85.021"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD4"/>
				<Org x="189.3856" y="76.6091"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD10"/>
				<Org x="187.1182" y="79.1555"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD9"/>
				<Org x="186.1658" y="80.7047"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D7"/>
				<Org x="187.462" y="64.451"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ_B"/>
				<Org x="185.7918" y="61.1631"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="SEL"/>
				<Org x="190.4965" y="66.5253"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD13"/>
				<Org x="188.6875" y="65.8309"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RPLY_I"/>
				<Org x="187.7424" y="55.8106"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD12"/>
				<Org x="182.9931" y="60.2868"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="186.5157" y="51.5365"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="188.6438" y="51.1024"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="187.2492" y="48.4969"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="BAD15"/>
				<Org x="175.6947" y="108.6854"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD1"/>
				<Org x="179.5104" y="76.3363"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR17"/>
				<Org x="180.2618" y="71.7732"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="175.765" y="64.9911"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR16"/>
				<Org x="177.9083" y="56.2017"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D4"/>
				<Org x="178.2693" y="58.7662"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR18"/>
				<Org x="180.4674" y="60.2474"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="#TCLK"/>
				<Org x="179.8378" y="50.6883"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="178.187" y="51.5763"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="REST"/>
				<Org x="181.025" y="47.2317"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="179.6354" y="36.5605"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="RES"/>
				<Org x="174.15" y="96.6847"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="AD12"/>
				<Org x="174.8523" y="80.0618"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A5"/>
				<Org x="169.2608" y="62.2834"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="170.9608" y="62.1875"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR19"/>
				<Org x="170.8" y="56.6831"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="172.4465" y="54.3995"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A5"/>
				<Org x="168.9948" y="59.9709"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="#TDO"/>
				<Org x="173.8245" y="51.0432"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="177.404" y="41.6385"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="D2"/>
				<Org x="175.5626" y="40.8469"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="ADR21"/>
				<Org x="168.502" y="91.7581"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="164.34" y="78.6756"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="167.5558" y="69.2927"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="0B"/>
				<Org x="171.3936" y="70.7163"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ7"/>
				<Org x="169.5313" y="70.4753"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A0"/>
				<Org x="164.2932" y="64.5505"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ7"/>
				<Org x="166.8887" y="66.6744"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A8"/>
				<Org x="164.5881" y="61.3298"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="-IOR"/>
				<Org x="168.2331" y="45.2127"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="A1"/>
				<Org x="166.7277" y="41.3245"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="170.0234" y="44.359"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="IRQ7"/>
				<Org x="165.1611" y="40.2524"/>
			</Via>
			<Via>
				<ViastackRef name="C140R.PS"/>
				<NetRef name="+5B"/>
				<Org x="167.3171" y="37.2754"/>
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
					<Start x="175.386" y="63.1497"/>
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
					<Start x="174.9014" y="59.6697"/>
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
						<End x="190.632" y="77.382"/>
					</TrackLine>
					<TrackLine>
						<End x="190.6849" y="77.1431"/>
					</TrackLine>
					<TrackLine>
						<End x="190.6849" y="76.0751"/>
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
					<Start x="178.2693" y="58.7662"/>
					<TrackLine>
						<End x="177.5449" y="61.1356"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5449" y="62.5016"/>
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
					<Start x="185.7918" y="61.1631"/>
					<TrackLine>
						<End x="183.9624" y="62.2184"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6765" y="62.3368"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1269" y="63.1176"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0589" y="63.1176"/>
					</TrackLine>
					<TrackLine>
						<End x="179.049" y="63.1135"/>
					</TrackLine>
					<TrackLine>
						<End x="178.298" y="62.3625"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2939" y="62.3526"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2939" y="61.2846"/>
					</TrackLine>
					<TrackLine>
						<End x="178.298" y="61.2747"/>
					</TrackLine>
					<TrackLine>
						<End x="179.172" y="59.7032"/>
					</TrackLine>
					<TrackLine>
						<End x="179.55" y="59.3006"/>
					</TrackLine>
					<TrackLine>
						<End x="179.5516" y="59.2969"/>
					</TrackLine>
					<TrackLine>
						<End x="179.5516" y="58.2355"/>
					</TrackLine>
					<TrackLine>
						<End x="179.55" y="58.2318"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8037" y="57.4855"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8" y="57.4839"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3776" y="57.484"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7315" y="56.9852"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7025" y="56.9779"/>
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
					<Start x="168.502" y="91.7581"/>
					<TrackLine>
						<End x="168.9912" y="84.5102"/>
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
					<Start x="175" y="67"/>
					<TrackLine>
						<End x="174.465" y="65.5253"/>
					</TrackLine>
					<TrackLine>
						<End x="174.45" y="64.3393"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3209" y="63.7428"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9572" y="63.3791"/>
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
						<End x="196.965" y="79.9708"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9693" y="79.9605"/>
					</TrackLine>
					<TrackLine>
						<End x="197.7205" y="79.2093"/>
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
					<Start x="179.5929" y="61.8186"/>
					<TrackLine>
						<End x="183.5273" y="61.5868"/>
					</TrackLine>
					<TrackLine>
						<End x="183.5376" y="61.5825"/>
					</TrackLine>
					<TrackLine>
						<End x="184.2888" y="60.8313"/>
					</TrackLine>
					<TrackLine>
						<End x="184.2931" y="60.821"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4424" y="55.2764"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4467" y="55.2661"/>
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
					<Start x="179.8378" y="50.6883"/>
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
					<Start x="196.2532" y="53.6205"/>
					<TrackLine>
						<End x="195.8578" y="52.3128"/>
					</TrackLine>
					<TrackLine>
						<End x="195.8535" y="52.3025"/>
					</TrackLine>
					<TrackLine>
						<End x="195.1023" y="51.5513"/>
					</TrackLine>
					<TrackLine>
						<End x="195.092" y="51.547"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9342" y="51.5"/>
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
						<End x="224.0975" y="85.072"/>
					</TrackLine>
					<TrackLine>
						<End x="223.8901" y="85.5721"/>
					</TrackLine>
					<TrackLine>
						<End x="223.8776" y="85.6218"/>
					</TrackLine>
					<TrackLine>
						<End x="223.8776" y="87.2508"/>
					</TrackLine>
					<TrackLine>
						<End x="224.3571" y="91.5608"/>
					</TrackLine>
					<TrackLine>
						<End x="224.3571" y="92.9162"/>
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
				<NetRef name="P1"/>
				<Subwire width="0.3">
					<Start x="168.2807" y="122.8171"/>
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
					<Start x="198.6005" y="63.626"/>
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
							<Dot x="168.2807" y="122.8171"/>
							<Dot x="168.3853" y="122.88"/>
							<Dot x="168.3212" y="122.9866"/>
							<Dot x="168.2159" y="122.9204"/>
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
						<End x="168.2807" y="122.8171"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR20"/>
				<Subwire width="0.3">
					<Start x="173.3775" y="52.9037"/>
					<TrackLine>
						<End x="173.7465" y="53.8653"/>
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
					<Start x="187.2809" y="46.6453"/>
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
						<End x="180.2422" y="44.6817"/>
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
						<End x="175.1245" y="51.5774"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1202" y="51.5877"/>
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
					<Start x="214.5471" y="59.0962"/>
					<TrackLine>
						<End x="214.5516" y="51.9692"/>
					</TrackLine>
					<TrackLine>
						<End x="214.5533" y="51.965"/>
					</TrackLine>
					<TrackLine>
						<End x="215.2999" y="51.2184"/>
					</TrackLine>
					<TrackLine>
						<End x="215.3041" y="51.2167"/>
					</TrackLine>
					<TrackLine>
						<End x="216.3657" y="51.2167"/>
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
					<Start x="175.5626" y="40.8469"/>
					<TrackLine>
						<End x="172.2735" y="45.5412"/>
					</TrackLine>
					<TrackLine>
						<End x="171.6751" y="46.1426"/>
					</TrackLine>
					<TrackLine>
						<End x="171.6751" y="47.5735"/>
					</TrackLine>
					<TrackLine>
						<End x="169.5" y="56.1489"/>
					</TrackLine>
					<TrackLine>
						<End x="169.5" y="57.2173"/>
					</TrackLine>
					<TrackLine>
						<End x="169.5043" y="57.2276"/>
					</TrackLine>
					<TrackLine>
						<End x="170.2555" y="57.9788"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1829" y="58.7349"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8512" y="59.4007"/>
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
					<Start x="201.65" y="109.15"/>
					<TrackLine>
						<End x="201.65" y="105.4"/>
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
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="179.6354" y="36.5605"/>
					<TrackLine>
						<End x="179.6354" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="179.6354" y="35.25"/>
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
					<Start x="168.7388" y="39.6507"/>
					<TrackLine>
						<End x="168.7777" y="40.6411"/>
					</TrackLine>
					<TrackLine>
						<End x="168.7777" y="42.0079"/>
					</TrackLine>
					<TrackLine>
						<End x="168.6593" y="42.2938"/>
					</TrackLine>
					<TrackLine>
						<End x="166.9374" y="44.6682"/>
					</TrackLine>
					<TrackLine>
						<End x="166.9331" y="44.6785"/>
					</TrackLine>
					<TrackLine>
						<End x="165.25" y="55.5478"/>
					</TrackLine>
					<TrackLine>
						<End x="164.5881" y="61.3298"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="167.5558" y="69.2927"/>
					<TrackLine>
						<End x="168.9971" y="69.1753"/>
					</TrackLine>
					<TrackLine>
						<End x="170.0655" y="69.1753"/>
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
					<Start x="192.9" y="115.4"/>
					<TrackLine>
						<End x="192.1101" y="115.6152"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3289" y="115.6152"/>
					</TrackLine>
					<TrackLine>
						<End x="191.2344" y="115.6543"/>
					</TrackLine>
					<TrackLine>
						<End x="188.9918" y="116.7788"/>
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
						<End x="208.0606" y="56.357"/>
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
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="193.248" y="61.2044"/>
							<Dot x="193.355" y="61.4304"/>
							<Dot x="192.8621" y="61.6638"/>
							<Dot x="193.007" y="61.138"/>
						</Teardrop>
					</Teardrops>
					<Start x="193.248" y="61.2044"/>
					<TrackLine>
						<End x="191.603" y="63.1628"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5987" y="63.1731"/>
					</TrackLine>
					<TrackLine>
						<End x="191.5987" y="64.2415"/>
					</TrackLine>
					<TrackLine>
						<End x="191.603" y="64.2518"/>
					</TrackLine>
					<TrackLine>
						<End x="192.3542" y="65.003"/>
					</TrackLine>
					<TrackLine>
						<End x="192.6477" y="65.2515"/>
					</TrackLine>
					<TrackLine>
						<End x="193.48" y="65.5479"/>
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
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="188.9918" y="116.7788"/>
							<Dot x="189.2079" y="116.9045"/>
							<Dot x="188.9336" y="117.376"/>
							<Dot x="188.7555" y="116.8605"/>
						</Teardrop>
					</Teardrops>
					<Start x="188.9918" y="116.7788"/>
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
					<Teardrops>
						<Teardrop>
							<Dot x="193.248" y="61.2044"/>
							<Dot x="193.4107" y="61.0146"/>
							<Dot x="193.8248" y="61.3696"/>
							<Dot x="193.2855" y="61.4516"/>
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
						<End x="193.248" y="61.2044"/>
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
						<End x="191.1503" y="55.7001"/>
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
				<Subwire width="0.8">
					<Start x="191.1503" y="55.7001"/>
					<TrackLine>
						<End x="191.4027" y="58.053"/>
					</TrackLine>
					<TrackLine>
						<End x="191.445" y="58.1552"/>
					</TrackLine>
					<TrackLine>
						<End x="193.3046" y="60.2338"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="193.3046" y="60.2338"/>
							<Dot x="193.359" y="59.9897"/>
							<Dot x="193.8914" y="60.1084"/>
							<Dot x="193.454" y="60.4343"/>
						</Teardrop>
					</Teardrops>
					<Start x="193.3046" y="60.2338"/>
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
				<Subwire width="0.3">
					<Start x="185.6" y="69.85"/>
					<TrackLine>
						<End x="185.6" y="69.05"/>
					</TrackLine>
					<TrackLine>
						<End x="185.6" y="68.7808"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8371" y="67.7423"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="193.3046" y="60.2338"/>
					<TrackLine>
						<End x="193.2065" y="60.3385"/>
					</TrackLine>
					<TrackLine>
						<End x="193.2065" y="61.1615"/>
					</TrackLine>
					<TrackLine>
						<End x="193.248" y="61.2044"/>
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
						<End x="197.1923" y="61.0722"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2362" y="61.0459"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9297" y="60.6385"/>
					</TrackLine>
					<TrackLine>
						<End x="199.0897" y="59.8685"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="170.9608" y="62.1875"/>
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
					<Start x="171.3936" y="70.7163"/>
					<TrackLine>
						<End x="175.8852" y="72.3553"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9191" y="72.3553"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="164.34" y="78.6756"/>
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
					<Start x="164.34" y="78.6756"/>
					<TrackLine>
						<End x="161.69" y="77.98"/>
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
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="186.65" y="115.4"/>
					<TrackLine>
						<End x="187" y="115.75"/>
					</TrackLine>
					<TrackLine>
						<End x="187.4" y="115.75"/>
					</TrackLine>
					<TrackLine>
						<End x="187.5657" y="115.75"/>
					</TrackLine>
					<TrackLine>
						<End x="188.9918" y="116.7788"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="175.4969" y="61.4021"/>
					<TrackLine>
						<End x="176.1375" y="60.1817"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1375" y="59.1577"/>
					</TrackLine>
					<TrackLine>
						<End x="175.4134" y="58.4336"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3894" y="58.4336"/>
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
				<Subwire width="0.3">
					<Start x="178.187" y="51.5763"/>
					<TrackLine>
						<End x="179.3036" y="51.9883"/>
					</TrackLine>
					<TrackLine>
						<End x="180.0607" y="52.05"/>
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
				<Subwire width="0.8">
					<Start x="178.187" y="51.5763"/>
					<TrackLine>
						<End x="178.2878" y="50.1044"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3301" y="50.0022"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1517" y="49.1806"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2539" y="49.1383"/>
					</TrackLine>
					<TrackLine>
						<End x="181.6089" y="48.7817"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7111" y="48.7394"/>
					</TrackLine>
					<TrackLine>
						<End x="184.15" y="46.65"/>
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
					<Start x="208.0606" y="56.357"/>
					<TrackLine>
						<End x="207.9" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.3">
					<Start x="176.9191" y="72.3553"/>
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
				<Subwire width="0.8">
					<Start x="172.9" y="46.65"/>
					<TrackLine>
						<End x="172.9" y="47.7821"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8275" y="52.3198"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8275" y="53.4876"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8698" y="53.5898"/>
					</TrackLine>
					<TrackLine>
						<End x="172.4465" y="54.3995"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="161.69" y="83.06"/>
					<TrackLine>
						<End x="166.9943" y="92.4442"/>
					</TrackLine>
					<TrackLine>
						<End x="167.8159" y="93.2658"/>
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
					<Start x="184.15" y="46.65"/>
					<TrackLine>
						<End x="184.5024" y="47.5065"/>
					</TrackLine>
					<TrackLine>
						<End x="184.7093" y="48.0053"/>
					</TrackLine>
					<TrackLine>
						<End x="184.7347" y="48.0476"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7671" y="49.1659"/>
					</TrackLine>
					<TrackLine>
						<End x="186.5802" y="49.979"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6713" y="50.0167"/>
					</TrackLine>
					<TrackLine>
						<End x="187.0936" y="50.0167"/>
					</TrackLine>
					<TrackLine>
						<End x="187.1847" y="50.0544"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6438" y="51.1024"/>
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
					<Start x="181.025" y="47.2317"/>
					<TrackLine>
						<End x="178.5853" y="48.3329"/>
					</TrackLine>
					<TrackLine>
						<End x="177.4824" y="49.4358"/>
					</TrackLine>
					<TrackLine>
						<End x="177.2878" y="49.9055"/>
					</TrackLine>
					<TrackLine>
						<End x="176.887" y="51.0421"/>
					</TrackLine>
					<TrackLine>
						<End x="176.887" y="52.1105"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8913" y="52.1208"/>
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
					<Start x="170.7063" y="59.8856"/>
					<TrackLine>
						<End x="171.5658" y="60.1"/>
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
					<Start x="164.2932" y="64.5505"/>
					<TrackLine>
						<End x="163.1799" y="63.8836"/>
					</TrackLine>
					<TrackLine>
						<End x="162.0343" y="62.738"/>
					</TrackLine>
					<TrackLine>
						<End x="162.008" y="62.6941"/>
					</TrackLine>
					<TrackLine>
						<End x="161.8006" y="62.194"/>
					</TrackLine>
					<TrackLine>
						<End x="161.7881" y="62.1443"/>
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
					<Start x="168.9948" y="59.9709"/>
					<TrackLine>
						<End x="168.75" y="57.3665"/>
					</TrackLine>
					<TrackLine>
						<End x="168.75" y="55.9997"/>
					</TrackLine>
					<TrackLine>
						<End x="171.0502" y="47.4266"/>
					</TrackLine>
					<TrackLine>
						<End x="171.0502" y="46.0065"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1382" y="45.7941"/>
					</TrackLine>
					<TrackLine>
						<End x="171.7434" y="45.187"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8239" y="44.9927"/>
					</TrackLine>
					<TrackLine>
						<End x="172.0388" y="40.527"/>
					</TrackLine>
					<TrackLine>
						<End x="172.0388" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="172.0388" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="171.75" y="32.6"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A5"/>
				<Subwire width="0.3">
					<Start x="169.2608" y="62.2834"/>
					<TrackLine>
						<End x="169.6651" y="62.732"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4163" y="63.4832"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4266" y="63.4875"/>
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
				<NetRef name="AD4"/>
				<Subwire width="0.3">
					<Start x="193.4298" y="78.1962"/>
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
				<NetRef name="AD4"/>
				<Subwire width="0.3">
					<Start x="189.3856" y="76.6091"/>
					<TrackLine>
						<End x="188.9107" y="71.8479"/>
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
						<End x="181.6206" y="83.0248"/>
					</TrackLine>
					<TrackLine>
						<End x="181.6206" y="81.9564"/>
					</TrackLine>
					<TrackLine>
						<End x="183.9266" y="73.957"/>
					</TrackLine>
					<TrackLine>
						<End x="183.9309" y="73.94"/>
					</TrackLine>
					<TrackLine>
						<End x="183.9309" y="72.3534"/>
					</TrackLine>
					<TrackLine>
						<End x="183.9266" y="72.3364"/>
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
					<Start x="180.4298" y="41.3086"/>
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
						<End x="194.3964" y="47.0938"/>
					</TrackLine>
					<TrackLine>
						<End x="195.1476" y="47.845"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2833" y="52.8788"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2876" y="52.8891"/>
					</TrackLine>
					<TrackLine>
						<End x="199.2876" y="53.9575"/>
					</TrackLine>
					<TrackLine>
						<End x="198.1228" y="59.1884"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4419" y="59.8693"/>
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
					<Start x="180.2618" y="71.7732"/>
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
					<Start x="193.0069" y="55.6085"/>
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
					<Start x="211.65" y="109.15"/>
					<TrackLine>
						<End x="211.65" y="105.4"/>
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
						<End x="191.3812" y="78.8793"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3812" y="77.5131"/>
					</TrackLine>
					<TrackLine>
						<End x="191.4342" y="77.2922"/>
					</TrackLine>
					<TrackLine>
						<End x="191.4342" y="75.926"/>
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
						<End x="191.0399" y="112.9021"/>
					</TrackLine>
					<TrackLine>
						<End x="192.0209" y="112.9021"/>
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
						<End x="221.7269" y="112.8005"/>
					</TrackLine>
					<TrackLine>
						<End x="221.7958" y="112.7832"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3096" y="112.5702"/>
					</TrackLine>
					<TrackLine>
						<End x="222.3705" y="112.5336"/>
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
						<End x="226.5643" y="93.2295"/>
					</TrackLine>
					<TrackLine>
						<End x="226.5643" y="91.2475"/>
					</TrackLine>
					<TrackLine>
						<End x="226.55" y="88.4441"/>
					</TrackLine>
					<TrackLine>
						<End x="226.55" y="87.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="226.6776" y="86.4363"/>
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
						<End x="190.767" y="111.634"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4112" y="111.6341"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2119" y="111.6"/>
					</TrackLine>
					<TrackLine>
						<End x="219.9129" y="111.6"/>
					</TrackLine>
					<TrackLine>
						<End x="221.4542" y="111.3005"/>
					</TrackLine>
					<TrackLine>
						<End x="221.5014" y="111.2809"/>
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
						<End x="225.0929" y="93.0477"/>
					</TrackLine>
					<TrackLine>
						<End x="225.0929" y="91.4293"/>
					</TrackLine>
					<TrackLine>
						<End x="224.6276" y="87.1197"/>
					</TrackLine>
					<TrackLine>
						<End x="224.6276" y="85.7529"/>
					</TrackLine>
					<TrackLine>
						<End x="224.746" y="85.467"/>
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
					<Start x="219.15" y="94.15"/>
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
						<End x="217.05" y="86.6941"/>
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
					<Start x="165.1611" y="40.2524"/>
					<TrackLine>
						<End x="162.6243" y="60.6636"/>
					</TrackLine>
					<TrackLine>
						<End x="162.6243" y="61.996"/>
					</TrackLine>
					<TrackLine>
						<End x="162.7296" y="62.2503"/>
					</TrackLine>
					<TrackLine>
						<End x="163.6676" y="63.1883"/>
					</TrackLine>
					<TrackLine>
						<End x="163.9219" y="63.2936"/>
					</TrackLine>
					<TrackLine>
						<End x="164.8048" y="63.3155"/>
					</TrackLine>
					<TrackLine>
						<End x="165.5282" y="64.0389"/>
					</TrackLine>
					<TrackLine>
						<End x="166.8887" y="66.6744"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="169.5313" y="70.4753"/>
					<TrackLine>
						<End x="170.0979" y="71.2608"/>
					</TrackLine>
					<TrackLine>
						<End x="170.8491" y="72.012"/>
					</TrackLine>
					<TrackLine>
						<End x="177.8574" y="76.3252"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0302" y="77.4957"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9906" y="77.4957"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6698" y="76.8165"/>
					</TrackLine>
					<TrackLine>
						<End x="182.5449" y="73.6616"/>
					</TrackLine>
					<TrackLine>
						<End x="182.5449" y="72.6318"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3681" y="71.7702"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3659" y="71.7563"/>
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
						<End x="223.6214" y="92.7698"/>
					</TrackLine>
					<TrackLine>
						<End x="223.6214" y="91.7072"/>
					</TrackLine>
					<TrackLine>
						<End x="223.1276" y="87.3435"/>
					</TrackLine>
					<TrackLine>
						<End x="223.1276" y="85.5291"/>
					</TrackLine>
					<TrackLine>
						<End x="223.1761" y="85.3361"/>
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
					<Start x="179.4757" y="73.413"/>
					<TrackLine>
						<End x="178.9681" y="72.3163"/>
					</TrackLine>
					<TrackLine>
						<End x="178.9642" y="72.3069"/>
					</TrackLine>
					<TrackLine>
						<End x="178.9642" y="71.2395"/>
					</TrackLine>
					<TrackLine>
						<End x="178.9681" y="71.2301"/>
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
					<Start x="202.9" y="89.15"/>
					<TrackLine>
						<End x="201.65" y="85.4"/>
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
				<NetRef name="-IOW"/>
				<Subwire width="0.3">
					<Start x="193.245" y="85.9997"/>
					<TrackLine>
						<End x="192.1305" y="78.7302"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1305" y="77.6622"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1834" y="77.4233"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1834" y="75.7949"/>
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
						<End x="191.5304" y="114.0862"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="166.7277" y="41.3245"/>
					<TrackLine>
						<End x="166.4611" y="39.7182"/>
					</TrackLine>
					<TrackLine>
						<End x="166.4568" y="39.7079"/>
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
					<Start x="177.404" y="41.6385"/>
					<TrackLine>
						<End x="179.8956" y="42.6086"/>
					</TrackLine>
					<TrackLine>
						<End x="180.964" y="42.6086"/>
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
						<End x="191.1239" y="45.6524"/>
					</TrackLine>
					<TrackLine>
						<End x="193.8519" y="48.3895"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="198.8375" y="48.8875"/>
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
						<End x="200.6007" y="55.5884"/>
					</TrackLine>
					<TrackLine>
						<End x="200.6007" y="57.7116"/>
					</TrackLine>
					<TrackLine>
						<End x="200.7091" y="58.1435"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1194" y="59.1892"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1194" y="60.5478"/>
					</TrackLine>
					<TrackLine>
						<End x="201.004" y="60.8263"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0475" y="61.7828"/>
					</TrackLine>
					<TrackLine>
						<End x="199.769" y="61.8982"/>
					</TrackLine>
					<TrackLine>
						<End x="198.0663" y="62.326"/>
					</TrackLine>
					<TrackLine>
						<End x="198.056" y="62.3303"/>
					</TrackLine>
					<TrackLine>
						<End x="197.3048" y="63.0815"/>
					</TrackLine>
					<TrackLine>
						<End x="197.3005" y="63.0918"/>
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
					<Start x="195.8815" y="71.9538"/>
					<TrackLine>
						<End x="196.0152" y="73.5355"/>
					</TrackLine>
					<TrackLine>
						<End x="196.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SEL"/>
				<Subwire width="0.3">
					<Start x="190.4965" y="66.5253"/>
					<TrackLine>
						<End x="189.7239" y="55.1409"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6159" y="54.8801"/>
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
					<Start x="183.2422" y="117.1743"/>
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
						<End x="202.1704" y="65.0794"/>
					</TrackLine>
					<TrackLine>
						<End x="200.4736" y="66.7754"/>
					</TrackLine>
					<TrackLine>
						<End x="200.3029" y="66.8778"/>
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
					<Start x="191.9086" y="117.1442"/>
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
						<End x="189.7644" y="109.1991"/>
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
					<Start x="194.5578" y="52.847"/>
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
					<Start x="215.8349" y="52.5"/>
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
					<Start x="177.0473" y="78.0185"/>
					<TrackLine>
						<End x="171.2324" y="75.1177"/>
					</TrackLine>
					<TrackLine>
						<End x="171.2221" y="75.1134"/>
					</TrackLine>
					<TrackLine>
						<End x="168.2706" y="74.3444"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="170.8" y="56.6831"/>
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
					<Start x="196.9575" y="56.9639"/>
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
						<End x="167.7261" y="73.0487"/>
					</TrackLine>
					<TrackLine>
						<End x="167.7364" y="73.0444"/>
					</TrackLine>
					<TrackLine>
						<End x="168.8048" y="73.0444"/>
					</TrackLine>
					<TrackLine>
						<End x="168.8151" y="73.0487"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5275" y="76.8591"/>
					</TrackLine>
					<TrackLine>
						<End x="178.7003" y="78.0296"/>
					</TrackLine>
					<TrackLine>
						<End x="178.883" y="78.1052"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1378" y="78.1052"/>
					</TrackLine>
					<TrackLine>
						<End x="180.3205" y="78.0296"/>
					</TrackLine>
					<TrackLine>
						<End x="181.2037" y="77.1464"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1368" y="74.0514"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2379" y="73.8074"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2379" y="72.486"/>
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
						<End x="203.2918" y="45.9983"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2875" y="46.0086"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2875" y="47.077"/>
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
						<End x="203.9491" y="51.516"/>
					</TrackLine>
					<TrackLine>
						<End x="202.8222" y="55.8552"/>
					</TrackLine>
					<TrackLine>
						<End x="202.8203" y="55.8628"/>
					</TrackLine>
					<TrackLine>
						<End x="202.8203" y="57.4372"/>
					</TrackLine>
					<TrackLine>
						<End x="202.8222" y="57.4448"/>
					</TrackLine>
					<TrackLine>
						<End x="203.257" y="58.5481"/>
					</TrackLine>
					<TrackLine>
						<End x="203.339" y="58.8749"/>
					</TrackLine>
					<TrackLine>
						<End x="203.339" y="60.8621"/>
					</TrackLine>
					<TrackLine>
						<End x="203.257" y="61.1889"/>
					</TrackLine>
					<TrackLine>
						<End x="202.9679" y="61.8862"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1805" y="64.9902"/>
					</TrackLine>
					<TrackLine>
						<End x="201.1542" y="65.0342"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0087" y="66.1797"/>
					</TrackLine>
					<TrackLine>
						<End x="199.9647" y="66.206"/>
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
					<Start x="177.9083" y="56.2017"/>
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
					<Start x="184.5615" y="85.021"/>
					<TrackLine>
						<End x="184.2417" y="83.1341"/>
					</TrackLine>
					<TrackLine>
						<End x="184.0842" y="82.0086"/>
					</TrackLine>
					<TrackLine>
						<End x="183.9452" y="81.8671"/>
					</TrackLine>
					<TrackLine>
						<End x="183.7749" y="81.4559"/>
					</TrackLine>
					<TrackLine>
						<End x="183.5682" y="80.0627"/>
					</TrackLine>
					<TrackLine>
						<End x="183.5682" y="78.2483"/>
					</TrackLine>
					<TrackLine>
						<End x="184.6247" y="74.0258"/>
					</TrackLine>
					<TrackLine>
						<End x="184.6247" y="72.2676"/>
					</TrackLine>
					<TrackLine>
						<End x="184.5871" y="72.118"/>
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
					<Start x="186.4738" y="86.4642"/>
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
					<Start x="181.744" y="59.0777"/>
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
					<Start x="197.9876" y="53.4233"/>
					<TrackLine>
						<End x="197.5489" y="54.165"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7977" y="54.9162"/>
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
					<Start x="174.8523" y="80.0618"/>
					<TrackLine>
						<End x="177.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="182.9931" y="60.2868"/>
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
					<Start x="187.1182" y="79.1555"/>
					<TrackLine>
						<End x="187.3486" y="75.9283"/>
					</TrackLine>
					<TrackLine>
						<End x="187.5665" y="74.3388"/>
					</TrackLine>
					<TrackLine>
						<End x="187.5665" y="71.9546"/>
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
					<Start x="182.9206" y="82.4906"/>
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
						<End x="190.8932" y="112.2681"/>
					</TrackLine>
					<TrackLine>
						<End x="192.1676" y="112.2681"/>
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
						<End x="221.6033" y="112.0505"/>
					</TrackLine>
					<TrackLine>
						<End x="221.9262" y="111.9168"/>
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
						<End x="225.8286" y="93.1386"/>
					</TrackLine>
					<TrackLine>
						<End x="225.8286" y="91.3384"/>
					</TrackLine>
					<TrackLine>
						<End x="225.3776" y="86.9705"/>
					</TrackLine>
					<TrackLine>
						<End x="225.3776" y="85.9021"/>
					</TrackLine>
					<TrackLine>
						<End x="225.3819" y="85.8918"/>
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
						<End x="166.0214" y="37.8199"/>
					</TrackLine>
					<TrackLine>
						<End x="167.0927" y="39.2831"/>
					</TrackLine>
					<TrackLine>
						<End x="167.2111" y="39.569"/>
					</TrackLine>
					<TrackLine>
						<End x="167.4388" y="40.1849"/>
					</TrackLine>
					<TrackLine>
						<End x="167.4431" y="40.1952"/>
					</TrackLine>
					<TrackLine>
						<End x="168.0234" y="40.78"/>
					</TrackLine>
					<TrackLine>
						<End x="168.0277" y="40.7903"/>
					</TrackLine>
					<TrackLine>
						<End x="168.0277" y="41.8587"/>
					</TrackLine>
					<TrackLine>
						<End x="168.0234" y="41.869"/>
					</TrackLine>
					<TrackLine>
						<End x="166.3015" y="44.2434"/>
					</TrackLine>
					<TrackLine>
						<End x="166.1831" y="44.5293"/>
					</TrackLine>
					<TrackLine>
						<End x="163.3312" y="60.8092"/>
					</TrackLine>
					<TrackLine>
						<End x="163.3312" y="61.8504"/>
					</TrackLine>
					<TrackLine>
						<End x="164.0675" y="62.5867"/>
					</TrackLine>
					<TrackLine>
						<End x="164.9507" y="62.6305"/>
					</TrackLine>
					<TrackLine>
						<End x="165.1889" y="62.7292"/>
					</TrackLine>
					<TrackLine>
						<End x="166.1145" y="63.6548"/>
					</TrackLine>
					<TrackLine>
						<End x="166.2417" y="63.8687"/>
					</TrackLine>
					<TrackLine>
						<End x="166.3177" y="63.9955"/>
					</TrackLine>
					<TrackLine>
						<End x="167.5487" y="65.2265"/>
					</TrackLine>
					<TrackLine>
						<End x="168.321" y="65.9484"/>
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
					<Start x="186.1658" y="80.7047"/>
					<TrackLine>
						<End x="185.8182" y="79.6897"/>
					</TrackLine>
					<TrackLine>
						<End x="185.8182" y="78.6213"/>
					</TrackLine>
					<TrackLine>
						<End x="186.8429" y="74.3405"/>
					</TrackLine>
					<TrackLine>
						<End x="186.8522" y="74.2821"/>
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
						<End x="187.7738" y="85.93"/>
					</TrackLine>
					<TrackLine>
						<End x="187.7695" y="85.9197"/>
					</TrackLine>
					<TrackLine>
						<End x="185.746" y="82.8641"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7417" y="82.8538"/>
					</TrackLine>
					<TrackLine>
						<End x="185.3115" y="81.7394"/>
					</TrackLine>
					<TrackLine>
						<End x="185.1412" y="81.3282"/>
					</TrackLine>
					<TrackLine>
						<End x="185.0022" y="81.1867"/>
					</TrackLine>
					<TrackLine>
						<End x="185.0022" y="80.2227"/>
					</TrackLine>
					<TrackLine>
						<End x="185.0682" y="78.4721"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1379" y="74.2128"/>
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
					<Start x="187.462" y="64.451"/>
					<TrackLine>
						<End x="184.0543" y="65.1923"/>
					</TrackLine>
					<TrackLine>
						<End x="183.5846" y="65.3869"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2188" y="66.5496"/>
					</TrackLine>
					<TrackLine>
						<End x="181.0422" y="67.5847"/>
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
					<Start x="225.2576" y="65.3794"/>
					<TrackLine>
						<End x="230.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RPLY_I"/>
				<Subwire width="0.3">
					<Start x="187.7424" y="55.8106"/>
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
				<NetRef name="AD11"/>
				<Subwire width="0.3">
					<Start x="187.0417" y="82.3196"/>
					<TrackLine>
						<End x="188.4139" y="79.7"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4182" y="79.6897"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4182" y="78.6213"/>
					</TrackLine>
					<TrackLine>
						<End x="188.0921" y="77.142"/>
					</TrackLine>
					<TrackLine>
						<End x="188.0921" y="76.0762"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2607" y="74.3939"/>
					</TrackLine>
					<TrackLine>
						<End x="188.2607" y="71.8995"/>
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
						<End x="166.1466" y="93.0106"/>
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
						<End x="167.0113" y="67.997"/>
					</TrackLine>
					<TrackLine>
						<End x="167.0216" y="67.9927"/>
					</TrackLine>
					<TrackLine>
						<End x="168.09" y="67.9927"/>
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
						<End x="173.1045" y="68.65"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9926" y="68.6064"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2574" y="68.3436"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8893" y="68.3"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5107" y="68.3"/>
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
					<Start x="192.8987" y="63.7073"/>
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
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="182.633" y="67.5496"/>
							<Dot x="182.6792" y="67.7953"/>
							<Dot x="182.1432" y="67.8961"/>
							<Dot x="182.4168" y="67.4243"/>
						</Teardrop>
					</Teardrops>
					<Start x="182.633" y="67.5496"/>
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
				<Subwire width="0.3">
					<Start x="186.5157" y="51.5365"/>
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
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="168.155" y="61.3305"/>
							<Dot x="168.3182" y="61.5199"/>
							<Dot x="168.0258" y="61.7718"/>
							<Dot x="167.9154" y="61.4019"/>
						</Teardrop>
					</Teardrops>
					<Start x="168.155" y="61.3305"/>
					<TrackLine>
						<End x="168.0258" y="61.7718"/>
					</TrackLine>
					<TrackLine>
						<End x="168.0258" y="62.795"/>
					</TrackLine>
					<TrackLine>
						<End x="168.7492" y="63.5184"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4036" y="63.8473"/>
					</TrackLine>
					<TrackLine>
						<End x="169.9915" y="64.1191"/>
					</TrackLine>
					<TrackLine>
						<End x="170.2774" y="64.2375"/>
					</TrackLine>
					<TrackLine>
						<End x="171.5658" y="64.65"/>
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
					<Start x="190.7166" y="68.2032"/>
					<TrackLine>
						<End x="190.559" y="68.0626"/>
					</TrackLine>
					<TrackLine>
						<End x="189.9151" y="68.0627"/>
					</TrackLine>
					<TrackLine>
						<End x="188.1036" y="67.3809"/>
					</TrackLine>
					<TrackLine>
						<End x="188.0014" y="67.3386"/>
					</TrackLine>
					<TrackLine>
						<End x="185.5232" y="66.2346"/>
					</TrackLine>
					<TrackLine>
						<End x="185.421" y="66.1923"/>
					</TrackLine>
					<TrackLine>
						<End x="184.2532" y="66.1923"/>
					</TrackLine>
					<TrackLine>
						<End x="184.151" y="66.2346"/>
					</TrackLine>
					<TrackLine>
						<End x="182.633" y="67.5496"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="190.7166" y="68.2032"/>
							<Dot x="190.9555" y="68.2769"/>
							<Dot x="190.8" y="68.7808"/>
							<Dot x="190.5083" y="68.3415"/>
						</Teardrop>
					</Teardrops>
					<Start x="190.7166" y="68.2032"/>
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
					<Start x="169.8753" y="46.9399"/>
					<TrackLine>
						<End x="167.75" y="55.8377"/>
					</TrackLine>
					<TrackLine>
						<End x="167.4931" y="59.3966"/>
					</TrackLine>
					<TrackLine>
						<End x="167.4931" y="60.5452"/>
					</TrackLine>
					<TrackLine>
						<End x="167.5281" y="60.6296"/>
					</TrackLine>
					<TrackLine>
						<End x="168.155" y="61.3305"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.3">
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="176.8098" y="49.0986"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5743" y="49.6667"/>
					</TrackLine>
					<TrackLine>
						<End x="176.137" y="50.8929"/>
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
							<Dot x="168.155" y="61.3305"/>
							<Dot x="168.184" y="61.0821"/>
							<Dot x="168.7257" y="61.1453"/>
							<Dot x="168.3242" y="61.5145"/>
						</Teardrop>
					</Teardrops>
					<Start x="172.9" y="61.4"/>
					<TrackLine>
						<End x="172.1" y="61.4"/>
					</TrackLine>
					<TrackLine>
						<End x="171.8369" y="61.3851"/>
					</TrackLine>
					<TrackLine>
						<End x="171.4376" y="61.0365"/>
					</TrackLine>
					<TrackLine>
						<End x="170.484" y="61.0365"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4738" y="61.1272"/>
					</TrackLine>
					<TrackLine>
						<End x="168.7818" y="61.1271"/>
					</TrackLine>
					<TrackLine>
						<End x="168.155" y="61.3305"/>
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
						<End x="203.8101" y="56.0582"/>
					</TrackLine>
					<TrackLine>
						<End x="203.8101" y="57.2418"/>
					</TrackLine>
					<TrackLine>
						<End x="204.1972" y="58.2311"/>
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
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="180.4411" y="45.6817"/>
					</TrackLine>
					<TrackLine>
						<End x="183.558" y="45.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="184.742" y="45.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="184.859" y="45.108"/>
					</TrackLine>
					<TrackLine>
						<End x="185.692" y="45.941"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7405" y="46.058"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7404" y="47.2273"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7813" y="47.326"/>
					</TrackLine>
					<TrackLine>
						<End x="186.6002" y="48.1449"/>
					</TrackLine>
					<TrackLine>
						<End x="187.2492" y="48.4969"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9695" y="66.7804"/>
					<TrackLine>
						<End x="191.1754" y="68.0222"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0779" y="68.0626"/>
					</TrackLine>
					<TrackLine>
						<End x="191.041" y="68.0626"/>
					</TrackLine>
					<TrackLine>
						<End x="190.7166" y="68.2032"/>
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
						<End x="202.7149" y="66.3751"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="189.15" y="46.65"/>
					<TrackLine>
						<End x="188.7886" y="47.3314"/>
					</TrackLine>
					<TrackLine>
						<End x="187.967" y="48.153"/>
					</TrackLine>
					<TrackLine>
						<End x="187.2492" y="48.4969"/>
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
					<Start x="205.4" y="49.15"/>
					<TrackLine>
						<End x="204.5875" y="46.5428"/>
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
				<Subwire width="0.8">
					<Start x="170.0234" y="44.359"/>
					<TrackLine>
						<End x="170.2888" y="40.2346"/>
					</TrackLine>
					<TrackLine>
						<End x="170.2888" y="39.0668"/>
					</TrackLine>
					<TrackLine>
						<End x="170.2465" y="38.9646"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4249" y="38.143"/>
					</TrackLine>
					<TrackLine>
						<End x="169.3227" y="38.1007"/>
					</TrackLine>
					<TrackLine>
						<End x="168.5861" y="38.0978"/>
					</TrackLine>
					<TrackLine>
						<End x="168.4839" y="38.0555"/>
					</TrackLine>
					<TrackLine>
						<End x="167.3171" y="37.2754"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9" y="110.4"/>
					<TrackLine>
						<End x="190.6322" y="110.6088"/>
					</TrackLine>
					<TrackLine>
						<End x="190.3322" y="110.6684"/>
					</TrackLine>
					<TrackLine>
						<End x="187.4" y="110.6684"/>
					</TrackLine>
					<TrackLine>
						<End x="187" y="110.6684"/>
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
					<Start x="192.9527" y="57.4691"/>
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
						<End x="171.4365" y="65.3"/>
					</TrackLine>
					<TrackLine>
						<End x="170.1463" y="64.9875"/>
					</TrackLine>
					<TrackLine>
						<End x="170.0966" y="64.975"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0929" y="64.5973"/>
					</TrackLine>
					<TrackLine>
						<End x="168.3651" y="64.1047"/>
					</TrackLine>
					<TrackLine>
						<End x="167.4395" y="63.1791"/>
					</TrackLine>
					<TrackLine>
						<End x="167.3408" y="62.9409"/>
					</TrackLine>
					<TrackLine>
						<End x="166.5414" y="60.7345"/>
					</TrackLine>
					<TrackLine>
						<End x="166.5414" y="59.2073"/>
					</TrackLine>
					<TrackLine>
						<End x="166.75" y="55.7141"/>
					</TrackLine>
					<TrackLine>
						<End x="168.6852" y="46.4469"/>
					</TrackLine>
					<TrackLine>
						<End x="169.3823" y="45.7498"/>
					</TrackLine>
					<TrackLine>
						<End x="170.5102" y="45.5343"/>
					</TrackLine>
					<TrackLine>
						<End x="171.1987" y="44.8458"/>
					</TrackLine>
					<TrackLine>
						<End x="171.2888" y="40.4335"/>
					</TrackLine>
					<TrackLine>
						<End x="171.2888" y="38.8679"/>
					</TrackLine>
					<TrackLine>
						<End x="170.47" y="36.0136"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4657" y="36.0033"/>
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
						<End x="185.2886" y="85.9733"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7467" y="85.5119"/>
					</TrackLine>
					<TrackLine>
						<End x="185.7467" y="84.5301"/>
					</TrackLine>
					<TrackLine>
						<End x="185.1101" y="83.2889"/>
					</TrackLine>
					<TrackLine>
						<End x="184.9917" y="83.003"/>
					</TrackLine>
					<TrackLine>
						<End x="184.6979" y="81.8615"/>
					</TrackLine>
					<TrackLine>
						<End x="184.621" y="81.6758"/>
					</TrackLine>
					<TrackLine>
						<End x="184.4654" y="81.5195"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3885" y="81.3338"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3182" y="79.97"/>
					</TrackLine>
					<TrackLine>
						<End x="184.3182" y="78.341"/>
					</TrackLine>
					<TrackLine>
						<End x="185.339" y="74.1141"/>
					</TrackLine>
					<TrackLine>
						<End x="185.339" y="72.1793"/>
					</TrackLine>
					<TrackLine>
						<End x="185.2672" y="71.8931"/>
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
					<Start x="186.706" y="59.0419"/>
					<TrackLine>
						<End x="187.0918" y="60.6289"/>
					</TrackLine>
					<TrackLine>
						<End x="187.0918" y="61.6973"/>
					</TrackLine>
					<TrackLine>
						<End x="187.0875" y="61.7076"/>
					</TrackLine>
					<TrackLine>
						<End x="186.3363" y="62.4588"/>
					</TrackLine>
					<TrackLine>
						<End x="183.1189" y="64.7914"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8336" y="65.8724"/>
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
					<Start x="168.2331" y="45.2127"/>
					<TrackLine>
						<End x="167.8253" y="46.2565"/>
					</TrackLine>
					<TrackLine>
						<End x="166" y="55.6214"/>
					</TrackLine>
					<TrackLine>
						<End x="165.8398" y="59.1126"/>
					</TrackLine>
					<TrackLine>
						<End x="165.8398" y="60.8292"/>
					</TrackLine>
					<TrackLine>
						<End x="165.8693" y="60.9468"/>
					</TrackLine>
					<TrackLine>
						<End x="166.6588" y="63.0862"/>
					</TrackLine>
					<TrackLine>
						<End x="166.8552" y="63.5598"/>
					</TrackLine>
					<TrackLine>
						<End x="166.8618" y="63.5708"/>
					</TrackLine>
					<TrackLine>
						<End x="167.9734" y="64.6824"/>
					</TrackLine>
					<TrackLine>
						<End x="168.7458" y="65.3126"/>
					</TrackLine>
					<TrackLine>
						<End x="168.8296" y="65.3473"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8606" y="65.689"/>
					</TrackLine>
					<TrackLine>
						<End x="170.0536" y="65.7375"/>
					</TrackLine>
					<TrackLine>
						<End x="171.3103" y="65.95"/>
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
					<Start x="175.765" y="64.9911"/>
					<TrackLine>
						<End x="176.6817" y="63.6942"/>
					</TrackLine>
					<TrackLine>
						<End x="176.686" y="63.6839"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7959" y="61.9361"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7959" y="61.0045"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8793" y="60.3387"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8793" y="59.0007"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7718" y="58.7412"/>
					</TrackLine>
					<TrackLine>
						<End x="175.8299" y="57.7993"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5704" y="57.6918"/>
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
					<Start x="220.4869" y="92.2472"/>
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
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="174.15" y="96.6847"/>
					<TrackLine>
						<End x="174.15" y="94.8822"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0916" y="91.037"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0916" y="89.9686"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0873" y="89.9583"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="88.4178"/>
					</TrackLine>
					<TrackLine>
						<End x="174.15" y="87.3822"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0559" y="82.6984"/>
					</TrackLine>
					<TrackLine>
						<End x="170.6879" y="76.4134"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="#TDO"/>
				<Subwire width="0.3">
					<Start x="173.8245" y="51.0432"/>
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
						<End x="180.1487" y="43.9317"/>
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
						<End x="175.5776" y="37.1683"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5819" y="37.1786"/>
					</TrackLine>
					<TrackLine>
						<End x="176.3331" y="37.9298"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2272" y="39.1143"/>
					</TrackLine>
					<TrackLine>
						<End x="178.2711" y="39.1406"/>
					</TrackLine>
					<TrackLine>
						<End x="178.7712" y="39.348"/>
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
						<End x="194.8212" y="46.4579"/>
					</TrackLine>
					<TrackLine>
						<End x="195.7835" y="47.4202"/>
					</TrackLine>
					<TrackLine>
						<End x="199.9192" y="52.454"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0376" y="52.7399"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0376" y="54.1067"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8609" y="55.5155"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8609" y="57.7845"/>
					</TrackLine>
					<TrackLine>
						<End x="199.87" y="57.8415"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0003" y="58.3587"/>
					</TrackLine>
					<TrackLine>
						<End x="200.0109" y="58.3914"/>
					</TrackLine>
					<TrackLine>
						<End x="200.3796" y="59.3363"/>
					</TrackLine>
					<TrackLine>
						<End x="200.3796" y="60.4007"/>
					</TrackLine>
					<TrackLine>
						<End x="200.3769" y="60.4072"/>
					</TrackLine>
					<TrackLine>
						<End x="199.6284" y="61.1557"/>
					</TrackLine>
					<TrackLine>
						<End x="199.6219" y="61.1584"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9171" y="61.576"/>
					</TrackLine>
					<TrackLine>
						<End x="197.6312" y="61.6944"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6689" y="62.6567"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5505" y="62.9426"/>
					</TrackLine>
					<TrackLine>
						<End x="196.55" y="63.0107"/>
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
					<Start x="180.4674" y="60.2474"/>
					<TrackLine>
						<End x="180.3193" y="58.0828"/>
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
					<Start x="173.7916" y="90.5028"/>
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
						<End x="171.7559" y="83.2326"/>
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
						<End x="194.9598" y="70.0935"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2149" y="69.9878"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5481" y="69.9878"/>
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
						<End x="211.7385" y="65.8731"/>
					</TrackLine>
					<TrackLine>
						<End x="211.7385" y="64.2527"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="62.1941"/>
					</TrackLine>
					<TrackLine>
						<End x="211.75" y="61.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="211.7493" y="59.9104"/>
					</TrackLine>
					<TrackLine>
						<End x="211.7493" y="58.282"/>
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
						<End x="178.1733" y="36.0896"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1776" y="36.0999"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3354" y="37.0947"/>
					</TrackLine>
					<TrackLine>
						<End x="178.3397" y="37.105"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0909" y="37.8562"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1012" y="37.8605"/>
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
						<End x="202.5375" y="47.2262"/>
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
						<End x="203.2351" y="51.2799"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1178" y="55.6223"/>
					</TrackLine>
					<TrackLine>
						<End x="202.0804" y="55.7713"/>
					</TrackLine>
					<TrackLine>
						<End x="202.0804" y="57.5287"/>
					</TrackLine>
					<TrackLine>
						<End x="202.1178" y="57.6777"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5526" y="58.781"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5991" y="58.9664"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5991" y="60.7706"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5526" y="60.956"/>
					</TrackLine>
					<TrackLine>
						<End x="202.3052" y="61.5526"/>
					</TrackLine>
					<TrackLine>
						<End x="200.5321" y="64.5953"/>
					</TrackLine>
					<TrackLine>
						<End x="199.5698" y="65.5576"/>
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
					<Start x="179.5104" y="76.3363"/>
					<TrackLine>
						<End x="178.1974" y="73.9425"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1076" y="71.863"/>
					</TrackLine>
					<TrackLine>
						<End x="177.1615" y="70.9145"/>
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
				<NetRef name="AD1"/>
				<Subwire width="0.3">
					<Start x="179.3437" y="81.6324"/>
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
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="169.17" y="36.5478"/>
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
					<Start x="176.8776" y="36.6341"/>
					<TrackLine>
						<End x="177.7038" y="37.5298"/>
					</TrackLine>
					<TrackLine>
						<End x="178.6661" y="38.4921"/>
					</TrackLine>
					<TrackLine>
						<End x="178.952" y="38.6105"/>
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
						<End x="201.7875" y="47.3573"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8" y="47.407"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5" y="49.7067"/>
					</TrackLine>
					<TrackLine>
						<End x="202.5" y="51.0933"/>
					</TrackLine>
					<TrackLine>
						<End x="201.4135" y="55.3894"/>
					</TrackLine>
					<TrackLine>
						<End x="201.3406" y="55.6799"/>
					</TrackLine>
					<TrackLine>
						<End x="201.3406" y="57.6201"/>
					</TrackLine>
					<TrackLine>
						<End x="201.4135" y="57.9106"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8483" y="59.0139"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8593" y="59.0578"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8593" y="60.6792"/>
					</TrackLine>
					<TrackLine>
						<End x="201.8483" y="60.7231"/>
					</TrackLine>
					<TrackLine>
						<End x="201.6426" y="61.2191"/>
					</TrackLine>
					<TrackLine>
						<End x="199.8962" y="64.1705"/>
					</TrackLine>
					<TrackLine>
						<End x="199.145" y="64.9217"/>
					</TrackLine>
					<TrackLine>
						<End x="197.3322" y="66.0626"/>
					</TrackLine>
					<TrackLine>
						<End x="197.2545" y="66.1093"/>
					</TrackLine>
					<TrackLine>
						<End x="196.7271" y="66.3279"/>
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
					<Start x="181.3019" y="73.1467"/>
					<TrackLine>
						<End x="181.5094" y="72.29"/>
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
						<End x="212.4769" y="65.7417"/>
					</TrackLine>
					<TrackLine>
						<End x="212.4769" y="64.3841"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="62.3433"/>
					</TrackLine>
					<TrackLine>
						<End x="212.5" y="60.9567"/>
					</TrackLine>
					<TrackLine>
						<End x="212.4985" y="59.7793"/>
					</TrackLine>
					<TrackLine>
						<End x="212.4985" y="58.4131"/>
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
					<Start x="196.9604" y="58.7069"/>
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
					<Start x="214.5039" y="65.0629"/>
					<TrackLine>
						<End x="214.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="188.6875" y="65.8309"/>
					<TrackLine>
						<End x="188.762" y="64.9852"/>
					</TrackLine>
					<TrackLine>
						<End x="189.0082" y="56.3349"/>
					</TrackLine>
					<TrackLine>
						<End x="189.0082" y="55.2863"/>
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
					<Start x="198.265" y="80.505"/>
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
						<End x="197.3152" y="73.0013"/>
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
						<End x="215.9408" y="50.4833"/>
					</TrackLine>
					<TrackLine>
						<End x="215.1582" y="50.4833"/>
					</TrackLine>
					<TrackLine>
						<End x="214.8845" y="50.5967"/>
					</TrackLine>
					<TrackLine>
						<End x="213.9316" y="51.5496"/>
					</TrackLine>
					<TrackLine>
						<End x="213.8182" y="51.8233"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2478" y="58.5622"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2478" y="59.6302"/>
					</TrackLine>
					<TrackLine>
						<End x="213.25" y="60.8294"/>
					</TrackLine>
					<TrackLine>
						<End x="213.25" y="62.4706"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2154" y="64.531"/>
					</TrackLine>
					<TrackLine>
						<End x="213.2154" y="65.5948"/>
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
						<End x="197.8597" y="71.7056"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4026" y="70.6958"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3604" y="70.6958"/>
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
					<Start x="222.3357" y="92.2385"/>
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
					<Start x="175.386" y="63.1497"/>
					<TrackLine>
						<End x="176.0414" y="62.6978"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7926" y="61.9466"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7969" y="61.9363"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7969" y="60.8679"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2193" y="59.4496"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2193" y="58.0828"/>
					</TrackLine>
					<TrackLine>
						<End x="176.6083" y="55.6675"/>
					</TrackLine>
					<TrackLine>
						<End x="176.6126" y="55.6572"/>
					</TrackLine>
					<TrackLine>
						<End x="177.3638" y="54.906"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8071" y="52.6199"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7694" y="51.6576"/>
					</TrackLine>
					<TrackLine>
						<End x="181.8878" y="51.3717"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2333" y="47.7322"/>
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
						<End x="186.4167" y="43.8578"/>
					</TrackLine>
					<TrackLine>
						<End x="186.4664" y="43.8453"/>
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
						<End x="204.0789" y="43.7357"/>
					</TrackLine>
					<TrackLine>
						<End x="204.1065" y="43.7471"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4014" y="43.7471"/>
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
					<Start x="174.9014" y="59.6697"/>
					<TrackLine>
						<End x="175.8583" y="55.5183"/>
					</TrackLine>
					<TrackLine>
						<End x="175.9767" y="55.2324"/>
					</TrackLine>
					<TrackLine>
						<End x="176.939" y="54.2701"/>
					</TrackLine>
					<TrackLine>
						<End x="180.3823" y="51.984"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1335" y="51.2328"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1378" y="51.2225"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1378" y="50.1541"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1335" y="50.1438"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8167" y="47.7322"/>
					</TrackLine>
					<TrackLine>
						<End x="179.8167" y="46.7312"/>
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
						<End x="182.425" y="43.3534"/>
					</TrackLine>
					<TrackLine>
						<End x="183.034" y="43.1009"/>
					</TrackLine>
					<TrackLine>
						<End x="183.2367" y="43.05"/>
					</TrackLine>
					<TrackLine>
						<End x="186.281" y="42.3453"/>
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
					<Start x="178.2693" y="58.7662"/>
					<TrackLine>
						<End x="182.3916" y="52.0965"/>
					</TrackLine>
					<TrackLine>
						<End x="182.4179" y="52.0526"/>
					</TrackLine>
					<TrackLine>
						<End x="182.6253" y="51.5525"/>
					</TrackLine>
					<TrackLine>
						<End x="182.6378" y="51.5028"/>
					</TrackLine>
					<TrackLine>
						<End x="182.8917" y="47.8786"/>
					</TrackLine>
					<TrackLine>
						<End x="182.8917" y="46.1288"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6288" y="45.3917"/>
					</TrackLine>
					<TrackLine>
						<End x="186.5975" y="44.5953"/>
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
						<End x="203.6548" y="44.3703"/>
					</TrackLine>
					<TrackLine>
						<End x="203.9576" y="44.4957"/>
					</TrackLine>
					<TrackLine>
						<End x="205.2703" y="44.4957"/>
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
					<Start x="185.7918" y="61.1631"/>
					<TrackLine>
						<End x="193.4329" y="62.4073"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4432" y="62.4116"/>
					</TrackLine>
					<TrackLine>
						<End x="198.056" y="64.9217"/>
					</TrackLine>
					<TrackLine>
						<End x="198.0663" y="64.926"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2491" y="65.0751"/>
					</TrackLine>
					<TrackLine>
						<End x="203.2594" y="65.0794"/>
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
						<End x="168.502" y="91.7581"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR21"/>
				<Subwire width="0.3">
					<Start x="168.9912" y="84.5102"/>
					<TrackLine>
						<End x="169.7059" y="82.5492"/>
					</TrackLine>
					<TrackLine>
						<End x="171.9879" y="76.9476"/>
					</TrackLine>
					<TrackLine>
						<End x="173.208" y="71.4282"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2642" y="71.2043"/>
					</TrackLine>
					<TrackLine>
						<End x="175" y="67"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD14"/>
				<Subwire width="0.3">
					<Start x="179.5929" y="61.8186"/>
					<TrackLine>
						<End x="176.2957" y="67.5445"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1438" y="70.7742"/>
					</TrackLine>
					<TrackLine>
						<End x="174.0892" y="70.8653"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8661" y="71.4033"/>
					</TrackLine>
					<TrackLine>
						<End x="173.8402" y="71.5064"/>
					</TrackLine>
					<TrackLine>
						<End x="172.7473" y="77.0186"/>
					</TrackLine>
					<TrackLine>
						<End x="172.7379" y="77.0968"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4559" y="82.6984"/>
					</TrackLine>
					<TrackLine>
						<End x="170.2912" y="85.0444"/>
					</TrackLine>
					<TrackLine>
						<End x="170.2869" y="85.0547"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0794" y="87.3389"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0707" y="87.36"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0707" y="88.44"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0794" y="88.4611"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8389" y="89.2206"/>
					</TrackLine>
					<TrackLine>
						<End x="169.86" y="89.2293"/>
					</TrackLine>
					<TrackLine>
						<End x="170.94" y="89.2293"/>
					</TrackLine>
					<TrackLine>
						<End x="170.9611" y="89.2206"/>
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
					<Start x="179.8378" y="50.6883"/>
					<TrackLine>
						<End x="178.7212" y="50.2763"/>
					</TrackLine>
					<TrackLine>
						<End x="174.3587" y="49.7432"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2903" y="49.7432"/>
					</TrackLine>
					<TrackLine>
						<End x="173.28" y="49.7475"/>
					</TrackLine>
					<TrackLine>
						<End x="162.7149" y="58.1803"/>
					</TrackLine>
					<TrackLine>
						<End x="161.4386" y="59.4566"/>
					</TrackLine>
					<TrackLine>
						<End x="161.3362" y="59.6274"/>
					</TrackLine>
					<TrackLine>
						<End x="161.0866" y="60.2296"/>
					</TrackLine>
					<TrackLine>
						<End x="160.0777" y="63.2142"/>
					</TrackLine>
					<TrackLine>
						<End x="159.9932" y="63.5506"/>
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
						<End x="220.2511" y="55.4004"/>
					</TrackLine>
					<TrackLine>
						<End x="219.1496" y="54.2989"/>
					</TrackLine>
					<TrackLine>
						<End x="218.6818" y="54.1051"/>
					</TrackLine>
					<TrackLine>
						<End x="217.1182" y="54.1051"/>
					</TrackLine>
					<TrackLine>
						<End x="216.4778" y="54.3466"/>
					</TrackLine>
					<TrackLine>
						<End x="215.192" y="54.3466"/>
					</TrackLine>
					<TrackLine>
						<End x="211.2206" y="53.8"/>
					</TrackLine>
					<TrackLine>
						<End x="208.8751" y="53.557"/>
					</TrackLine>
					<TrackLine>
						<End x="207.2461" y="53.557"/>
					</TrackLine>
					<TrackLine>
						<End x="204.5794" y="53.8"/>
					</TrackLine>
					<TrackLine>
						<End x="198.4682" y="54.5835"/>
					</TrackLine>
					<TrackLine>
						<End x="197.507" y="54.5835"/>
					</TrackLine>
					<TrackLine>
						<End x="196.2532" y="53.6205"/>
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
						<End x="215.0381" y="66.3629"/>
					</TrackLine>
					<TrackLine>
						<End x="213.9697" y="66.3629"/>
					</TrackLine>
					<TrackLine>
						<End x="210.9178" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="209.8822" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="203.3983" y="64.3251"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6005" y="63.626"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR20"/>
				<Subwire width="0.3">
					<Start x="173.3775" y="52.9037"/>
					<TrackLine>
						<End x="171.9123" y="53.0995"/>
					</TrackLine>
					<TrackLine>
						<End x="171.902" y="53.1038"/>
					</TrackLine>
					<TrackLine>
						<End x="163.6188" y="59.3982"/>
					</TrackLine>
					<TrackLine>
						<End x="162.6565" y="60.3605"/>
					</TrackLine>
					<TrackLine>
						<End x="162.5381" y="60.6464"/>
					</TrackLine>
					<TrackLine>
						<End x="161.5057" y="63.6863"/>
					</TrackLine>
					<TrackLine>
						<End x="161.4932" y="63.736"/>
					</TrackLine>
					<TrackLine>
						<End x="161.4932" y="65.365"/>
					</TrackLine>
					<TrackLine>
						<End x="163.04" y="72.3559"/>
					</TrackLine>
					<TrackLine>
						<End x="163.04" y="79.2098"/>
					</TrackLine>
					<TrackLine>
						<End x="163.0443" y="79.2201"/>
					</TrackLine>
					<TrackLine>
						<End x="168.4612" y="88.8741"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4259" y="89.8388"/>
					</TrackLine>
					<TrackLine>
						<End x="169.715" y="89.9585"/>
					</TrackLine>
					<TrackLine>
						<End x="171.085" y="89.9585"/>
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
						<End x="176.1523" y="80.596"/>
					</TrackLine>
					<TrackLine>
						<End x="176.1523" y="79.5276"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7473" y="78.5527"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7473" y="77.4843"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7516" y="77.474"/>
					</TrackLine>
					<TrackLine>
						<End x="176.5028" y="76.7228"/>
					</TrackLine>
					<TrackLine>
						<End x="178.7056" y="74.6509"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8848" y="74.5767"/>
					</TrackLine>
					<TrackLine>
						<End x="180.136" y="74.5767"/>
					</TrackLine>
					<TrackLine>
						<End x="180.3152" y="74.6509"/>
					</TrackLine>
					<TrackLine>
						<End x="180.4971" y="74.8321"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6763" y="74.9063"/>
					</TrackLine>
					<TrackLine>
						<End x="189.9198" y="75.3091"/>
					</TrackLine>
					<TrackLine>
						<End x="194.4315" y="76.513"/>
					</TrackLine>
					<TrackLine>
						<End x="194.837" y="76.6148"/>
					</TrackLine>
					<TrackLine>
						<End x="196.3927" y="76.6752"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2377" y="76.6752"/>
					</TrackLine>
					<TrackLine>
						<End x="198.637" y="76.6614"/>
					</TrackLine>
					<TrackLine>
						<End x="199.663" y="76.6614"/>
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
						<End x="205.1171" y="47.8214"/>
					</TrackLine>
					<TrackLine>
						<End x="204.0579" y="47.8214"/>
					</TrackLine>
					<TrackLine>
						<End x="194.3861" y="47.0895"/>
					</TrackLine>
					<TrackLine>
						<End x="193.3177" y="47.0895"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6939" y="47.9988"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6061" y="47.9988"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5779" y="47.9871"/>
					</TrackLine>
					<TrackLine>
						<End x="187.8129" y="47.2221"/>
					</TrackLine>
					<TrackLine>
						<End x="187.2809" y="46.6453"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EB1"/>
				<Subwire width="0.3">
					<Start x="214.5471" y="59.0962"/>
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
						<End x="214.5471" y="59.0962"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.3">
					<Start x="198.6058" y="37.3"/>
					<TrackLine>
						<End x="176.8698" y="40.3385"/>
					</TrackLine>
					<TrackLine>
						<End x="175.5626" y="40.8469"/>
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
					<Start x="164.5881" y="61.3298"/>
					<TrackLine>
						<End x="162.9975" y="64.006"/>
					</TrackLine>
					<TrackLine>
						<End x="162.9932" y="64.0163"/>
					</TrackLine>
					<TrackLine>
						<End x="162.9932" y="65.0847"/>
					</TrackLine>
					<TrackLine>
						<End x="162.9975" y="65.095"/>
					</TrackLine>
					<TrackLine>
						<End x="163.7487" y="65.8462"/>
					</TrackLine>
					<TrackLine>
						<End x="167.5558" y="69.2927"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A8"/>
				<Subwire width="0.3">
					<Start x="179.6354" y="36.5605"/>
					<TrackLine>
						<End x="177.4221" y="37.9298"/>
					</TrackLine>
					<TrackLine>
						<End x="177.4118" y="37.9341"/>
					</TrackLine>
					<TrackLine>
						<End x="168.7388" y="39.6507"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="191.2988" y="52.8085"/>
					<TrackLine>
						<End x="193.8717" y="51.3393"/>
					</TrackLine>
					<TrackLine>
						<End x="193.9739" y="51.297"/>
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
					<Start x="175.4969" y="61.4021"/>
					<TrackLine>
						<End x="174.3175" y="61.2197"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2153" y="61.1774"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0967" y="60.6324"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="188.6438" y="51.1024"/>
					<TrackLine>
						<End x="191.2988" y="52.8085"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="56.65"/>
					<TrackLine>
						<End x="208.0606" y="56.357"/>
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
					<Start x="176.9191" y="72.3553"/>
					<TrackLine>
						<End x="179.5757" y="70.2655"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8371" y="67.7423"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="191.1503" y="55.7001"/>
					<TrackLine>
						<End x="191.2988" y="52.8085"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="210.4" y="56.65"/>
					<TrackLine>
						<End x="214.8266" y="56.8687"/>
					</TrackLine>
					<TrackLine>
						<End x="216.8432" y="56.8687"/>
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
					<Start x="164.34" y="78.6756"/>
					<TrackLine>
						<End x="168.9567" y="75.8521"/>
					</TrackLine>
					<TrackLine>
						<End x="169.7783" y="75.0305"/>
					</TrackLine>
					<TrackLine>
						<End x="169.8206" y="74.9283"/>
					</TrackLine>
					<TrackLine>
						<End x="171.3936" y="70.7163"/>
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
					<Start x="178.187" y="51.5763"/>
					<TrackLine>
						<End x="174.0636" y="54.4114"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9614" y="54.4537"/>
					</TrackLine>
					<TrackLine>
						<End x="172.7936" y="54.4537"/>
					</TrackLine>
					<TrackLine>
						<End x="172.4465" y="54.3995"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="170.9608" y="62.1875"/>
					<TrackLine>
						<End x="173.0967" y="60.6324"/>
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
					<Start x="171.3936" y="70.7163"/>
					<TrackLine>
						<End x="170.9608" y="62.1875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="205.4" y="56.65"/>
					<TrackLine>
						<End x="199.0897" y="59.8685"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="0B"/>
				<Subwire width="0.8">
					<Start x="173.0967" y="60.6324"/>
					<TrackLine>
						<End x="172.4465" y="54.3995"/>
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
					<Start x="172.9" y="46.65"/>
					<TrackLine>
						<End x="170.5614" y="48.4476"/>
					</TrackLine>
					<TrackLine>
						<End x="170.4592" y="48.4899"/>
					</TrackLine>
					<TrackLine>
						<End x="169.2914" y="48.4899"/>
					</TrackLine>
					<TrackLine>
						<End x="169.1892" y="48.4476"/>
					</TrackLine>
					<TrackLine>
						<End x="168.3676" y="47.626"/>
					</TrackLine>
					<TrackLine>
						<End x="166.7254" y="45.8988"/>
					</TrackLine>
					<TrackLine>
						<End x="163.0176" y="41.3633"/>
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
					<Start x="181.025" y="47.2317"/>
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
						<End x="186.3737" y="43.0953"/>
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
						<End x="205.4939" y="42.9986"/>
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
					<Start x="164.2932" y="64.5505"/>
					<TrackLine>
						<End x="167.6991" y="59.4264"/>
					</TrackLine>
					<TrackLine>
						<End x="168.4503" y="58.6752"/>
					</TrackLine>
					<TrackLine>
						<End x="168.4606" y="58.6709"/>
					</TrackLine>
					<TrackLine>
						<End x="169.529" y="58.6709"/>
					</TrackLine>
					<TrackLine>
						<End x="169.5393" y="58.6752"/>
					</TrackLine>
					<TrackLine>
						<End x="170.2905" y="59.4264"/>
					</TrackLine>
					<TrackLine>
						<End x="170.7063" y="59.8856"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A5"/>
				<Subwire width="0.3">
					<Start x="169.2608" y="62.2834"/>
					<TrackLine>
						<End x="168.9948" y="59.9709"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD4"/>
				<Subwire width="0.3">
					<Start x="189.3856" y="76.6091"/>
					<TrackLine>
						<End x="193.4298" y="78.1962"/>
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
				<NetRef name="OSC"/>
				<Subwire width="0.3">
					<Start x="180.4298" y="41.3086"/>
					<TrackLine>
						<End x="177.9485" y="42.9342"/>
					</TrackLine>
					<TrackLine>
						<End x="177.9382" y="42.9385"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8698" y="42.9385"/>
					</TrackLine>
					<TrackLine>
						<End x="174.8792" y="42.8969"/>
					</TrackLine>
					<TrackLine>
						<End x="170.6955" y="42.3657"/>
					</TrackLine>
					<TrackLine>
						<End x="169.3513" y="42.3657"/>
					</TrackLine>
					<TrackLine>
						<End x="167.2619" y="42.6245"/>
					</TrackLine>
					<TrackLine>
						<End x="166.1935" y="42.6245"/>
					</TrackLine>
					<TrackLine>
						<End x="166.1832" y="42.6202"/>
					</TrackLine>
					<TrackLine>
						<End x="164.6166" y="41.5481"/>
					</TrackLine>
					<TrackLine>
						<End x="163.8654" y="40.7969"/>
					</TrackLine>
					<TrackLine>
						<End x="163.8611" y="40.7866"/>
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
					<Start x="180.2618" y="71.7732"/>
					<TrackLine>
						<End x="181.8361" y="71.8467"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2928" y="73.0591"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4858" y="73.1076"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0786" y="74.5562"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0911" y="74.5593"/>
					</TrackLine>
					<TrackLine>
						<End x="196.6817" y="74.8009"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9487" y="74.8009"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2918" y="74.7458"/>
					</TrackLine>
					<TrackLine>
						<End x="205.4671" y="74.7"/>
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
					<Start x="193.0069" y="55.6085"/>
					<TrackLine>
						<End x="196.3298" y="55.1936"/>
					</TrackLine>
					<TrackLine>
						<End x="198.6153" y="55.1936"/>
					</TrackLine>
					<TrackLine>
						<End x="204.7067" y="54.55"/>
					</TrackLine>
					<TrackLine>
						<End x="207.3772" y="54.307"/>
					</TrackLine>
					<TrackLine>
						<End x="208.744" y="54.307"/>
					</TrackLine>
					<TrackLine>
						<End x="211.0933" y="54.55"/>
					</TrackLine>
					<TrackLine>
						<End x="215.063" y="54.9949"/>
					</TrackLine>
					<TrackLine>
						<End x="216.6068" y="54.9949"/>
					</TrackLine>
					<TrackLine>
						<End x="217.2472" y="54.7534"/>
					</TrackLine>
					<TrackLine>
						<End x="218.5528" y="54.7534"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7824" y="54.8485"/>
					</TrackLine>
					<TrackLine>
						<End x="219.7015" y="55.7676"/>
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
						<End x="174.3258" y="91.8028"/>
					</TrackLine>
					<TrackLine>
						<End x="173.2574" y="91.8028"/>
					</TrackLine>
					<TrackLine>
						<End x="169.5397" y="90.6759"/>
					</TrackLine>
					<TrackLine>
						<End x="169.0412" y="90.4692"/>
					</TrackLine>
					<TrackLine>
						<End x="168.9993" y="90.4441"/>
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
					<Start x="226.6776" y="86.4363"/>
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
					<Start x="166.8887" y="66.6744"/>
					<TrackLine>
						<End x="168.8515" y="68.7482"/>
					</TrackLine>
					<TrackLine>
						<End x="168.8558" y="68.7585"/>
					</TrackLine>
					<TrackLine>
						<End x="169.5313" y="70.4753"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="IRQ7"/>
				<Subwire width="0.3">
					<Start x="165.1611" y="40.2524"/>
					<TrackLine>
						<End x="166.1935" y="40.0245"/>
					</TrackLine>
					<TrackLine>
						<End x="167.2619" y="40.0245"/>
					</TrackLine>
					<TrackLine>
						<End x="167.2722" y="40.0288"/>
					</TrackLine>
					<TrackLine>
						<End x="168.212" y="40.9224"/>
					</TrackLine>
					<TrackLine>
						<End x="169.2656" y="40.9224"/>
					</TrackLine>
					<TrackLine>
						<End x="177.561" y="38.6841"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1696" y="37.8605"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1799" y="37.8562"/>
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
						<End x="199.799" y="76.0229"/>
					</TrackLine>
					<TrackLine>
						<End x="198.501" y="76.0229"/>
					</TrackLine>
					<TrackLine>
						<End x="198.1605" y="76.0504"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4699" y="76.0504"/>
					</TrackLine>
					<TrackLine>
						<End x="194.9217" y="75.9297"/>
					</TrackLine>
					<TrackLine>
						<End x="194.6472" y="75.8608"/>
					</TrackLine>
					<TrackLine>
						<End x="190.069" y="74.5591"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8236" y="74.3015"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6577" y="74.1383"/>
					</TrackLine>
					<TrackLine>
						<End x="179.4757" y="73.413"/>
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
					<Start x="191.5304" y="114.0862"/>
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
						<End x="159.2432" y="63.4579"/>
					</TrackLine>
					<TrackLine>
						<End x="159.3637" y="62.9781"/>
					</TrackLine>
					<TrackLine>
						<End x="160.3726" y="59.9935"/>
					</TrackLine>
					<TrackLine>
						<End x="160.6645" y="59.2892"/>
					</TrackLine>
					<TrackLine>
						<End x="160.8429" y="58.9917"/>
					</TrackLine>
					<TrackLine>
						<End x="162.25" y="57.5846"/>
					</TrackLine>
					<TrackLine>
						<End x="172.8552" y="49.1116"/>
					</TrackLine>
					<TrackLine>
						<End x="173.1411" y="48.9932"/>
					</TrackLine>
					<TrackLine>
						<End x="178.4212" y="47.9083"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1583" y="47.1712"/>
					</TrackLine>
					<TrackLine>
						<End x="179.1583" y="46.5848"/>
					</TrackLine>
					<TrackLine>
						<End x="179.2488" y="46.3662"/>
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
						<End x="182.0869" y="42.6816"/>
					</TrackLine>
					<TrackLine>
						<End x="182.7979" y="42.3869"/>
					</TrackLine>
					<TrackLine>
						<End x="183.144" y="42.3"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1883" y="41.5953"/>
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
					<Start x="166.7277" y="41.3245"/>
					<TrackLine>
						<End x="168.0667" y="41.644"/>
					</TrackLine>
					<TrackLine>
						<End x="170.8274" y="41.644"/>
					</TrackLine>
					<TrackLine>
						<End x="175.0284" y="42.1469"/>
					</TrackLine>
					<TrackLine>
						<End x="176.0968" y="42.1469"/>
					</TrackLine>
					<TrackLine>
						<End x="177.404" y="41.6385"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A1"/>
				<Subwire width="0.3">
					<Start x="193.8519" y="48.3895"/>
					<TrackLine>
						<End x="198.8375" y="48.8875"/>
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
						<End x="187.9048" y="109.8446"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7304" y="114.9007"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7429" y="114.9504"/>
					</TrackLine>
					<TrackLine>
						<End x="189.8586" y="117.8276"/>
					</TrackLine>
					<TrackLine>
						<End x="189.977" y="118.1135"/>
					</TrackLine>
					<TrackLine>
						<End x="190.9393" y="119.0758"/>
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
					<Start x="195.8815" y="71.9538"/>
					<TrackLine>
						<End x="192.0002" y="68.712"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0379" y="67.7497"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4965" y="66.5253"/>
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
				<NetRef name="BAD11"/>
				<Subwire width="0.3">
					<Start x="189.7644" y="109.1991"/>
					<TrackLine>
						<End x="190.2304" y="114.6204"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2347" y="114.6307"/>
					</TrackLine>
					<TrackLine>
						<End x="191.9086" y="117.1442"/>
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
						<End x="188.5596" y="108.7001"/>
					</TrackLine>
					<TrackLine>
						<End x="188.5596" y="109.6981"/>
					</TrackLine>
					<TrackLine>
						<End x="188.75" y="110.2059"/>
					</TrackLine>
					<TrackLine>
						<End x="189.4804" y="114.7696"/>
					</TrackLine>
					<TrackLine>
						<End x="190.6086" y="117.6784"/>
					</TrackLine>
					<TrackLine>
						<End x="190.6129" y="117.6887"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3641" y="118.4399"/>
					</TrackLine>
					<TrackLine>
						<End x="191.3744" y="118.4442"/>
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
					<Start x="215.8349" y="52.5"/>
					<TrackLine>
						<End x="209.0605" y="52.057"/>
					</TrackLine>
					<TrackLine>
						<End x="207.0607" y="52.057"/>
					</TrackLine>
					<TrackLine>
						<End x="197.4534" y="52.1233"/>
					</TrackLine>
					<TrackLine>
						<End x="195.719" y="52.3205"/>
					</TrackLine>
					<TrackLine>
						<End x="195.7087" y="52.3248"/>
					</TrackLine>
					<TrackLine>
						<End x="194.5578" y="52.847"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="177.0473" y="78.0185"/>
					<TrackLine>
						<End x="178.3556" y="75.858"/>
					</TrackLine>
					<TrackLine>
						<End x="179.0321" y="75.1815"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9887" y="75.1815"/>
					</TrackLine>
					<TrackLine>
						<End x="180.1546" y="75.3447"/>
					</TrackLine>
					<TrackLine>
						<End x="180.556" y="75.511"/>
					</TrackLine>
					<TrackLine>
						<End x="187.8016" y="77.1055"/>
					</TrackLine>
					<TrackLine>
						<End x="188.0875" y="77.2239"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8411" y="77.9048"/>
					</TrackLine>
					<TrackLine>
						<End x="188.8514" y="77.9091"/>
					</TrackLine>
					<TrackLine>
						<End x="192.8956" y="79.4962"/>
					</TrackLine>
					<TrackLine>
						<End x="193.964" y="79.4962"/>
					</TrackLine>
					<TrackLine>
						<End x="197.7358" y="79.2275"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7942" y="79.2275"/>
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
				<NetRef name="ADR19"/>
				<Subwire width="0.3">
					<Start x="168.2706" y="74.3444"/>
					<TrackLine>
						<End x="162.3616" y="65.5198"/>
					</TrackLine>
					<TrackLine>
						<End x="162.2432" y="65.2339"/>
					</TrackLine>
					<TrackLine>
						<End x="162.2432" y="63.8671"/>
					</TrackLine>
					<TrackLine>
						<End x="163.2881" y="60.7956"/>
					</TrackLine>
					<TrackLine>
						<End x="163.2924" y="60.7853"/>
					</TrackLine>
					<TrackLine>
						<End x="164.0436" y="60.0341"/>
					</TrackLine>
					<TrackLine>
						<End x="168.0255" y="58.0393"/>
					</TrackLine>
					<TrackLine>
						<End x="170.8" y="56.6831"/>
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
					<Start x="196.9575" y="56.9639"/>
					<TrackLine>
						<End x="196.4159" y="57.4112"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6647" y="58.1624"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6604" y="58.1727"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6604" y="59.2411"/>
					</TrackLine>
					<TrackLine>
						<End x="195.6647" y="59.2514"/>
					</TrackLine>
					<TrackLine>
						<End x="197.1581" y="60.8378"/>
					</TrackLine>
					<TrackLine>
						<End x="198.1204" y="61.8001"/>
					</TrackLine>
					<TrackLine>
						<End x="198.4063" y="61.9185"/>
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
					<Start x="177.9083" y="56.2017"/>
					<TrackLine>
						<End x="176.9739" y="58.222"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9697" y="58.2321"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9697" y="59.3003"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9739" y="59.3104"/>
					</TrackLine>
					<TrackLine>
						<End x="177.7251" y="60.0616"/>
					</TrackLine>
					<TrackLine>
						<End x="177.7352" y="60.0658"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8034" y="60.0658"/>
					</TrackLine>
					<TrackLine>
						<End x="178.8135" y="60.0616"/>
					</TrackLine>
					<TrackLine>
						<End x="179.9232" y="58.952"/>
					</TrackLine>
					<TrackLine>
						<End x="181.1995" y="57.782"/>
					</TrackLine>
					<TrackLine>
						<End x="181.2098" y="57.7777"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2782" y="57.7777"/>
					</TrackLine>
					<TrackLine>
						<End x="182.2885" y="57.782"/>
					</TrackLine>
					<TrackLine>
						<End x="183.5376" y="58.9911"/>
					</TrackLine>
					<TrackLine>
						<End x="184.2888" y="59.7423"/>
					</TrackLine>
					<TrackLine>
						<End x="184.2931" y="59.7526"/>
					</TrackLine>
					<TrackLine>
						<End x="184.4918" y="61.6973"/>
					</TrackLine>
					<TrackLine>
						<End x="184.4961" y="61.7076"/>
					</TrackLine>
					<TrackLine>
						<End x="186.1663" y="64.9955"/>
					</TrackLine>
					<TrackLine>
						<End x="187.3918" y="66.3754"/>
					</TrackLine>
					<TrackLine>
						<End x="188.143" y="67.1266"/>
					</TrackLine>
					<TrackLine>
						<End x="194.9857" y="73.7754"/>
					</TrackLine>
					<TrackLine>
						<End x="195.2239" y="73.8741"/>
					</TrackLine>
					<TrackLine>
						<End x="196.8286" y="74.1761"/>
					</TrackLine>
					<TrackLine>
						<End x="197.8018" y="74.1761"/>
					</TrackLine>
					<TrackLine>
						<End x="198.2128" y="74.1072"/>
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
					<Start x="184.5615" y="85.021"/>
					<TrackLine>
						<End x="186.4738" y="86.4642"/>
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
					<Start x="181.744" y="59.0777"/>
					<TrackLine>
						<End x="181.7302" y="59.7637"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7303" y="60.7705"/>
					</TrackLine>
					<TrackLine>
						<End x="181.6429" y="62.502"/>
					</TrackLine>
					<TrackLine>
						<End x="181.5245" y="62.7879"/>
					</TrackLine>
					<TrackLine>
						<End x="177.5538" y="68.4082"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1873" y="71.5195"/>
					</TrackLine>
					<TrackLine>
						<End x="175.1047" y="71.7188"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2473" y="77.204"/>
					</TrackLine>
					<TrackLine>
						<End x="174.2379" y="77.3206"/>
					</TrackLine>
					<TrackLine>
						<End x="174.1894" y="77.5136"/>
					</TrackLine>
					<TrackLine>
						<End x="173.5523" y="79.5276"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0559" y="83.7668"/>
					</TrackLine>
					<TrackLine>
						<End x="173.0516" y="83.7771"/>
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
						<End x="220.7661" y="54.998"/>
					</TrackLine>
					<TrackLine>
						<End x="219.552" y="53.7839"/>
					</TrackLine>
					<TrackLine>
						<End x="219.4416" y="53.7177"/>
					</TrackLine>
					<TrackLine>
						<End x="218.8879" y="53.4881"/>
					</TrackLine>
					<TrackLine>
						<End x="218.7631" y="53.4568"/>
					</TrackLine>
					<TrackLine>
						<End x="217.0369" y="53.4568"/>
					</TrackLine>
					<TrackLine>
						<End x="216.9121" y="53.4881"/>
					</TrackLine>
					<TrackLine>
						<End x="216.3313" y="53.6983"/>
					</TrackLine>
					<TrackLine>
						<End x="215.3385" y="53.6983"/>
					</TrackLine>
					<TrackLine>
						<End x="211.3133" y="53.05"/>
					</TrackLine>
					<TrackLine>
						<End x="208.9678" y="52.807"/>
					</TrackLine>
					<TrackLine>
						<End x="207.1534" y="52.807"/>
					</TrackLine>
					<TrackLine>
						<End x="197.9876" y="53.4233"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD12"/>
				<Subwire width="0.3">
					<Start x="174.8523" y="80.0618"/>
					<TrackLine>
						<End x="174.9973" y="77.3351"/>
					</TrackLine>
					<TrackLine>
						<End x="175.7369" y="71.8656"/>
					</TrackLine>
					<TrackLine>
						<End x="178.1495" y="68.8732"/>
					</TrackLine>
					<TrackLine>
						<End x="182.1467" y="63.2268"/>
					</TrackLine>
					<TrackLine>
						<End x="182.173" y="63.1829"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3804" y="62.6828"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9931" y="60.2868"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD10"/>
				<Subwire width="0.3">
					<Start x="187.1182" y="79.1555"/>
					<TrackLine>
						<End x="185.6316" y="79.4047"/>
					</TrackLine>
					<TrackLine>
						<End x="185.6213" y="79.409"/>
					</TrackLine>
					<TrackLine>
						<End x="184.8701" y="80.1602"/>
					</TrackLine>
					<TrackLine>
						<End x="182.9206" y="82.4906"/>
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
					<Start x="186.1658" y="80.7047"/>
					<TrackLine>
						<End x="184.0862" y="82.9734"/>
					</TrackLine>
					<TrackLine>
						<End x="183.4034" y="83.6562"/>
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
					<Start x="187.462" y="64.451"/>
					<TrackLine>
						<End x="189.2217" y="64.5309"/>
					</TrackLine>
					<TrackLine>
						<End x="189.232" y="64.5352"/>
					</TrackLine>
					<TrackLine>
						<End x="191.0087" y="65.2888"/>
					</TrackLine>
					<TrackLine>
						<End x="191.733" y="66.0131"/>
					</TrackLine>
					<TrackLine>
						<End x="191.733" y="67.2926"/>
					</TrackLine>
					<TrackLine>
						<End x="192.4573" y="68.0169"/>
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
						<End x="219.1483" y="56.1329"/>
					</TrackLine>
					<TrackLine>
						<End x="218.4171" y="55.4017"/>
					</TrackLine>
					<TrackLine>
						<End x="217.3829" y="55.4017"/>
					</TrackLine>
					<TrackLine>
						<End x="216.8071" y="55.6143"/>
					</TrackLine>
					<TrackLine>
						<End x="216.6918" y="55.6432"/>
					</TrackLine>
					<TrackLine>
						<End x="214.978" y="55.6432"/>
					</TrackLine>
					<TrackLine>
						<End x="208.5948" y="55.057"/>
					</TrackLine>
					<TrackLine>
						<End x="207.5264" y="55.057"/>
					</TrackLine>
					<TrackLine>
						<End x="198.7367" y="55.8038"/>
					</TrackLine>
					<TrackLine>
						<End x="196.4769" y="55.8037"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4972" y="58.7648"/>
					</TrackLine>
					<TrackLine>
						<End x="193.4869" y="58.7691"/>
					</TrackLine>
					<TrackLine>
						<End x="192.4185" y="58.7691"/>
					</TrackLine>
					<TrackLine>
						<End x="190.3675" y="58.2501"/>
					</TrackLine>
					<TrackLine>
						<End x="189.8978" y="58.0555"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7949" y="56.9526"/>
					</TrackLine>
					<TrackLine>
						<End x="187.7424" y="55.8106"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD11"/>
				<Subwire width="0.3">
					<Start x="187.0417" y="82.3196"/>
					<TrackLine>
						<End x="184.0787" y="83.8554"/>
					</TrackLine>
					<TrackLine>
						<End x="183.3959" y="84.5382"/>
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
					<Start x="177.9" y="46.65"/>
					<TrackLine>
						<End x="173.4938" y="45.05"/>
					</TrackLine>
					<TrackLine>
						<End x="170.0234" y="44.359"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="192.9695" y="66.7804"/>
					<TrackLine>
						<End x="192.8987" y="63.7073"/>
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
					<Start x="200.4" y="45.4"/>
					<TrackLine>
						<End x="193.1188" y="46.0895"/>
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
					<Start x="202.7149" y="66.3751"/>
					<TrackLine>
						<End x="192.9695" y="66.7804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="204.5875" y="46.5428"/>
					<TrackLine>
						<End x="200.4" y="45.4"/>
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
					<Start x="227.9" y="101.65"/>
					<TrackLine>
						<End x="225.1513" y="102.1193"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="221.65" y="97.9"/>
					<TrackLine>
						<End x="225.1513" y="102.1193"/>
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
						<End x="225.1513" y="102.1193"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="169.8753" y="46.9399"/>
					<TrackLine>
						<End x="170.0234" y="44.359"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5B"/>
				<Subwire width="0.8">
					<Start x="167.3171" y="37.2754"/>
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
					<Start x="186.5157" y="51.5365"/>
					<TrackLine>
						<End x="187.2492" y="48.4969"/>
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
					<Start x="205.4" y="49.15"/>
					<TrackLine>
						<End x="207.1856" y="50.7001"/>
					</TrackLine>
					<TrackLine>
						<End x="207.3062" y="50.75"/>
					</TrackLine>
					<TrackLine>
						<End x="216.4188" y="50.95"/>
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
					<Start x="186.5157" y="51.5365"/>
					<TrackLine>
						<End x="189.2501" y="55.1245"/>
					</TrackLine>
					<TrackLine>
						<End x="189.2924" y="55.2267"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6003" y="56.284"/>
					</TrackLine>
					<TrackLine>
						<End x="189.6426" y="56.3862"/>
					</TrackLine>
					<TrackLine>
						<End x="190.4642" y="57.2078"/>
					</TrackLine>
					<TrackLine>
						<End x="190.5664" y="57.2501"/>
					</TrackLine>
					<TrackLine>
						<End x="192.9527" y="57.4691"/>
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
					<Start x="186.706" y="59.0419"/>
					<TrackLine>
						<End x="185.2157" y="52.0707"/>
					</TrackLine>
					<TrackLine>
						<End x="185.2157" y="51.0023"/>
					</TrackLine>
					<TrackLine>
						<End x="185.9809" y="46.1111"/>
					</TrackLine>
					<TrackLine>
						<End x="185.9852" y="46.1008"/>
					</TrackLine>
					<TrackLine>
						<End x="186.7364" y="45.3496"/>
					</TrackLine>
					<TrackLine>
						<End x="186.7467" y="45.3453"/>
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
						<End x="203.2658" y="45.0197"/>
					</TrackLine>
					<TrackLine>
						<End x="203.7719" y="45.2296"/>
					</TrackLine>
					<TrackLine>
						<End x="203.8301" y="45.2442"/>
					</TrackLine>
					<TrackLine>
						<End x="205.1214" y="45.2442"/>
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
					<Start x="168.2331" y="45.2127"/>
					<TrackLine>
						<End x="168.7517" y="43.8322"/>
					</TrackLine>
					<TrackLine>
						<End x="169.4966" y="43.0873"/>
					</TrackLine>
					<TrackLine>
						<End x="170.5502" y="43.0873"/>
					</TrackLine>
					<TrackLine>
						<End x="174.7481" y="43.6469"/>
					</TrackLine>
					<TrackLine>
						<End x="176.7206" y="43.6885"/>
					</TrackLine>
					<TrackLine>
						<End x="178.0874" y="43.6885"/>
					</TrackLine>
					<TrackLine>
						<End x="180.964" y="42.6086"/>
					</TrackLine>
					<TrackLine>
						<End x="180.9743" y="42.6043"/>
					</TrackLine>
					<TrackLine>
						<End x="181.316" y="42.2693"/>
					</TrackLine>
					<TrackLine>
						<End x="181.7487" y="42.0099"/>
					</TrackLine>
					<TrackLine>
						<End x="182.5619" y="41.6729"/>
					</TrackLine>
					<TrackLine>
						<End x="183.0513" y="41.55"/>
					</TrackLine>
					<TrackLine>
						<End x="186.0369" y="40.8595"/>
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
				<NetRef name="RES"/>
				<Subwire width="0.3">
					<Start x="220.4869" y="92.2472"/>
					<TrackLine>
						<End x="221.7912" y="90.9428"/>
					</TrackLine>
					<TrackLine>
						<End x="221.8015" y="90.9385"/>
					</TrackLine>
					<TrackLine>
						<End x="222.8699" y="90.9385"/>
					</TrackLine>
					<TrackLine>
						<End x="222.8802" y="90.9428"/>
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
					<Start x="170.6879" y="76.4134"/>
					<TrackLine>
						<End x="172.5758" y="71.206"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7" y="66.4658"/>
					</TrackLine>
					<TrackLine>
						<End x="173.7043" y="66.4555"/>
					</TrackLine>
					<TrackLine>
						<End x="174.4555" y="65.7043"/>
					</TrackLine>
					<TrackLine>
						<End x="175.765" y="64.9911"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="#TDO"/>
				<Subwire width="0.3">
					<Start x="173.8245" y="51.0432"/>
					<TrackLine>
						<End x="172.833" y="51.608"/>
					</TrackLine>
					<TrackLine>
						<End x="171.4772" y="52.4679"/>
					</TrackLine>
					<TrackLine>
						<End x="163.1799" y="58.776"/>
					</TrackLine>
					<TrackLine>
						<End x="162.0343" y="59.9216"/>
					</TrackLine>
					<TrackLine>
						<End x="162.008" y="59.9655"/>
					</TrackLine>
					<TrackLine>
						<End x="161.8006" y="60.4656"/>
					</TrackLine>
					<TrackLine>
						<End x="160.7917" y="63.4503"/>
					</TrackLine>
					<TrackLine>
						<End x="160.7432" y="63.6433"/>
					</TrackLine>
					<TrackLine>
						<End x="160.7432" y="65.4577"/>
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
					<Start x="173.7916" y="90.5028"/>
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
					<Start x="171.7559" y="83.2326"/>
					<TrackLine>
						<End x="172.8023" y="79.3784"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4754" y="77.2776"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4879" y="77.2279"/>
					</TrackLine>
					<TrackLine>
						<End x="173.4973" y="77.1113"/>
					</TrackLine>
					<TrackLine>
						<End x="174.4725" y="71.5931"/>
					</TrackLine>
					<TrackLine>
						<End x="174.6513" y="71.1613"/>
					</TrackLine>
					<TrackLine>
						<End x="176.9316" y="67.9693"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8886" y="62.3631"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8929" y="62.3528"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8929" y="61.2844"/>
					</TrackLine>
					<TrackLine>
						<End x="180.4674" y="60.2474"/>
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
					<Start x="179.3437" y="81.6324"/>
					<TrackLine>
						<End x="179.5104" y="76.3363"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="A3"/>
				<Subwire width="0.3">
					<Start x="169.17" y="36.5478"/>
					<TrackLine>
						<End x="176.8776" y="36.6341"/>
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
						<End x="199.926" y="75.3843"/>
					</TrackLine>
					<TrackLine>
						<End x="198.374" y="75.3843"/>
					</TrackLine>
					<TrackLine>
						<End x="198.073" y="75.4257"/>
					</TrackLine>
					<TrackLine>
						<End x="196.5574" y="75.4257"/>
					</TrackLine>
					<TrackLine>
						<End x="195.0064" y="75.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="194.8629" y="75.2085"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2498" y="73.8216"/>
					</TrackLine>
					<TrackLine>
						<End x="190.2001" y="73.8091"/>
					</TrackLine>
					<TrackLine>
						<End x="181.3019" y="73.1467"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="WTBT"/>
				<Subwire width="0.3">
					<Start x="214.5039" y="65.0629"/>
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
						<End x="198.5555" y="61.1685"/>
					</TrackLine>
					<TrackLine>
						<End x="198.5452" y="61.1642"/>
					</TrackLine>
					<TrackLine>
						<End x="197.794" y="60.413"/>
					</TrackLine>
					<TrackLine>
						<End x="196.9604" y="58.7069"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="197.3152" y="73.0013"/>
					<TrackLine>
						<End x="196.3931" y="73.189"/>
					</TrackLine>
					<TrackLine>
						<End x="195.3699" y="73.189"/>
					</TrackLine>
					<TrackLine>
						<End x="189.952" y="67.821"/>
					</TrackLine>
					<TrackLine>
						<End x="189.2008" y="67.0698"/>
					</TrackLine>
					<TrackLine>
						<End x="189.1965" y="67.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="188.6875" y="65.8309"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="AD13"/>
				<Subwire width="0.3">
					<Start x="198.265" y="80.505"/>
					<TrackLine>
						<End x="192.7464" y="80.2462"/>
					</TrackLine>
					<TrackLine>
						<End x="188.7022" y="78.6591"/>
					</TrackLine>
					<TrackLine>
						<End x="188.4163" y="78.5407"/>
					</TrackLine>
					<TrackLine>
						<End x="187.6627" y="77.8598"/>
					</TrackLine>
					<TrackLine>
						<End x="187.6524" y="77.8555"/>
					</TrackLine>
					<TrackLine>
						<End x="186.584" y="77.8555"/>
					</TrackLine>
					<TrackLine>
						<End x="186.5737" y="77.8598"/>
					</TrackLine>
					<TrackLine>
						<End x="185.1965" y="78.7731"/>
					</TrackLine>
					<TrackLine>
						<End x="182.3761" y="81.1949"/>
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
				<Subwire width="0.3">
					<Start x="222.3357" y="92.2385"/>
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
						<End x="215.0705" y="57.8325"/>
					</TrackLine>
					<TrackLine>
						<End x="214.0237" y="57.8325"/>
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
		<View scale="10.6913" scrollHorz="192.5662" scrollVert="73.7933"/>
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