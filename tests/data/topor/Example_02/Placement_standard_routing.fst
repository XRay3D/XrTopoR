<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : Placement_standard_routing.fst -->
<!--   Format  : TopoR PCB file                 -->
<!--   Version : 1.2.0                          -->
<!--   Program : TopoR 32 Layer 7.0.18313 Alpha -->
<!--   Date    : Monday, April 09, 2018         -->
<!--   Time    : 18:12                          -->
<!--********************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.2.0</Version>
		<Program>TopoR 32 Layer 7.0.18313 Alpha</Program>
		<Date>Monday, April 09, 2018 18:12</Date>
		<OriginalFormat>Pcad 2004</OriginalFormat>
		<OriginalFile>.\LP2_PCAD.pcb</OriginalFile>
		<Units dist="mm" time="ps"/>
	</Header>

	<Layers version="1.1">
		<StackUpLayers>
			<Layer name="TopAssy" type="Assy" compsOutline="on"/>
			<Layer name="DRILL" type="Mechanical" thickness="0"/>
			<Layer name="TEXT" type="Mechanical" thickness="0"/>
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
		<TextStyle name="T:H59W5" fontName="QUALITY" height="1.5"/>
		<TextStyle name="T:H25W2" fontName="QUALITY" height="0.64"/>
		<TextStyle name="T:H24W2" fontName="QUALITY" height="0.63"/>
		<TextStyle name="T:H39W3" fontName="QUALITY" height="1"/>
	</TextStyles>

	<LocalLibrary version="1.4">
		<Padstacks>
			<Padstack name="DYZ15.PS" holeDiameter="0.9" metallized="on">
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
			<Padstack name="DYZ15KV.PS" holeDiameter="0.9" metallized="on">
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
			<Padstack name="DYZ20.PS" holeDiameter="1.2" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="2">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="2">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="2">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="2">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="KREP.PS" holeDiameter="1.8" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="4" height="4">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="4" height="4">
						<LayerRef name="Bottom"/>
					</PadRect>
					<PadRect width="4" height="4">
						<LayerTypeRef type="Signal"/>
					</PadRect>
					<PadRect width="4" height="4">
						<LayerTypeRef type="Plane"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="DYZ40.PS" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="4" height="4">
						<LayerRef name="Top"/>
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
			<Viastack name="DYZ15.PS" holeDiameter="0.9">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1.5">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.5">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.5">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
		</Viastacks>
		<Footprints>
			<Footprint name="MP-10_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ40.PS"/>
						<Org x="-6.75" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ40.PS"/>
						<Org x="5.25" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ40.PS"/>
						<Org x="10.25" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-8" y="3.75"/>
							<Dot x="-8" y="-3.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-8" y="-3.75"/>
							<Dot x="12.5" y="-3.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="12.5" y="-3.75"/>
							<Dot x="12.5" y="3.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="12.5" y="3.75"/>
							<Dot x="-8" y="3.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="-1.25" y="-1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="-1.25"/>
							<Dot x="1.25" y="-1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="1.25" y="-1.25"/>
							<Dot x="1.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="1.25" y="1.25"/>
							<Dot x="-1.25" y="1.25"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="7.5" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="KT361_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="5" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="6.25" y="0.5"/>
							<Dot x="-1.25" y="0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="-1.25"/>
							<Dot x="6.25" y="-1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="6.25" y="-1.25"/>
							<Dot x="6.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="6.25" y="1.25"/>
							<Dot x="-1.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="-1.25" y="-1.25"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="-3.75" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="561IR2_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15KV.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="17.5" y="7.5"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="6.25"/>
							<Dot x="17.5" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="6.25"/>
							<Dot x="17.5" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="7.5"/>
							<Dot x="0" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="7.5"/>
							<Dot x="0" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="18.75" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="18.75" y="1.25"/>
							<Dot x="18.75" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="18.75" y="6.25"/>
							<Dot x="-1.25" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="6.25"/>
							<Dot x="-1.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="2.5"/>
							<Dot x="0" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="2.5"/>
							<Dot x="0" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="5"/>
							<Dot x="-1.25" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="5"/>
							<Dot x="-1.25" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="17.5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="0"/>
							<Dot x="17.5" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="1.25"/>
							<Dot x="0" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="1.25"/>
							<Dot x="0" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="8.75" y="3.75"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="KD522_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.5" y="0.5"/>
							<Dot x="3.5" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="0.5"/>
							<Dot x="4.5" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="0"/>
							<Dot x="3.5" y="0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.5" y="-0.5"/>
							<Dot x="4.5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2" y="-0.75"/>
							<Dot x="5.75" y="-0.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="5.75" y="-0.75"/>
							<Dot x="5.75" y="0.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="5.75" y="0.75"/>
							<Dot x="2" y="0.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2" y="0.75"/>
							<Dot x="2" y="-0.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="2" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="5.75" y="0"/>
							<Dot x="7.5" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="10" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="Q32768_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="8.75" y="3.75"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="6.25" y="1.25"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="11.25" y="0"/>
							<Dot x="15" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="11.25" y="5"/>
							<Dot x="15" y="3.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="6.25" y="5"/>
							<Dot x="3.75" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="6.25" y="0"/>
							<Dot x="3.75" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="3.75"/>
							<Dot x="0" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="3.75"/>
							<Dot x="3.75" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.75" y="0"/>
							<Dot x="0" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="3.75"/>
							<Dot x="15" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="11.25" y="0"/>
							<Dot x="6.25" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="11.25" y="5"/>
							<Dot x="6.25" y="5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="7.5" y="2.5"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="561LA7_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15KV.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="6.25"/>
							<Dot x="0" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="7.5"/>
							<Dot x="15" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="7.5"/>
							<Dot x="15" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="1.25"/>
							<Dot x="15" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="0"/>
							<Dot x="0" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="0" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="6.25"/>
							<Dot x="16.25" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="16.25" y="6.25"/>
							<Dot x="16.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="16.25" y="1.25"/>
							<Dot x="-1.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="-1.25" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="5"/>
							<Dot x="0" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="5"/>
							<Dot x="0" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="2.5"/>
							<Dot x="-1.25" y="2.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="7.5" y="3.75"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="561IE8_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15KV.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="17.5" y="7.5"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="6.25"/>
							<Dot x="17.5" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="6.25"/>
							<Dot x="17.5" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="7.5"/>
							<Dot x="0" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="7.5"/>
							<Dot x="0" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="18.75" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="18.75" y="1.25"/>
							<Dot x="18.75" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="18.75" y="6.25"/>
							<Dot x="-1.25" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="6.25"/>
							<Dot x="-1.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="2.5"/>
							<Dot x="0" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="2.5"/>
							<Dot x="0" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="5"/>
							<Dot x="-1.25" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="5"/>
							<Dot x="-1.25" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="17.5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="0"/>
							<Dot x="17.5" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="1.25"/>
							<Dot x="0" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="1.25"/>
							<Dot x="0" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="8.75" y="3.75"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="R025_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="9.75" y="1"/>
							<Dot x="9.75" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="9.65" y="-1.5"/>
							<Dot x="8.7" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="9.65" y="-1.4"/>
							<Start x="9.65" y="-1.5"/>
							<End x="9.75" y="-1.4"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="9.65" y="1.5"/>
							<Dot x="8.7" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="9.65" y="1.4"/>
							<Start x="9.75" y="1.4"/>
							<End x="9.65" y="1.5"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.85" y="-1.5"/>
							<Dot x="3.75" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.75" y="-1.5"/>
							<Dot x="3.8" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.75" y="1.5"/>
							<Dot x="3.8" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="2.85" y="-1.4"/>
							<Start x="2.75" y="-1.4"/>
							<End x="2.85" y="-1.5"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.85" y="1.5"/>
							<Dot x="3.75" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="2.85" y="1.4"/>
							<Start x="2.85" y="1.5"/>
							<End x="2.75" y="1.4"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.75" y="0"/>
							<Dot x="2.75" y="1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="2.75" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="12.5" y="0"/>
							<Dot x="9.75" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="9.75" y="1"/>
							<Dot x="9.75" y="1.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="9.75" y="0"/>
							<Dot x="9.75" y="-1.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.75" y="0"/>
							<Dot x="2.75" y="-1.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.75" y="1"/>
							<Dot x="2.75" y="1.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.75" y="0"/>
							<Dot x="3.75" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.75" y="0"/>
							<Dot x="3.75" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.75" y="1.25"/>
							<Dot x="8.75" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="8.75" y="1.5"/>
							<Dot x="8.75" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="3.75" y="-1.25"/>
							<Dot x="8.75" y="-1.25"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="6.25" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="KM5_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="10" y="0"/>
							<Start x="10" y="-1.5"/>
							<End x="10" y="1.5"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="0" y="0"/>
							<Start x="0" y="1.5"/>
							<End x="0" y="-1.5"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="1.5"/>
							<Dot x="10" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="-1.5"/>
							<Dot x="10" y="-1.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="5" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="PIN_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="KREP.PS"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="561LN2_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15KV.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="6.25"/>
							<Dot x="15" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="6.25"/>
							<Dot x="15" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="7.5"/>
							<Dot x="0" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="7.5"/>
							<Dot x="0" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="15" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="0"/>
							<Dot x="15" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="1.25"/>
							<Dot x="0" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="1.25"/>
							<Dot x="0" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="16.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="16.25" y="1.25"/>
							<Dot x="16.25" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="16.25" y="6.25"/>
							<Dot x="-1.25" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="6.25"/>
							<Dot x="-1.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="2.5"/>
							<Dot x="0" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="2.5"/>
							<Dot x="0" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="5"/>
							<Dot x="-1.25" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="5"/>
							<Dot x="-1.25" y="2.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="7.5" y="3.75"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SP3-38B_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="2.5" y="10"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="1.25" y="6.25"/>
							<Dot x="3.75" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Circle diameter="8">
							<Center x="2.5" y="6.25"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Circle diameter="5">
							<Center x="2.5" y="6.25"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="2.5" y="6.25"/>
							<Start x="7" y="6.25"/>
							<End x="-2" y="6.25"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="0"/>
							<Dot x="-2" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="7" y="0"/>
							<Dot x="7" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="0"/>
							<Dot x="7" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="2.5" y="-1.25"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="KT315_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="2.5" y="-1.25"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="5" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="6.25" y="1.5"/>
							<Dot x="6.25" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="6.25" y="-1.5"/>
							<Dot x="-1.25" y="-1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="-1.5"/>
							<Dot x="-1.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="-1" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="1.5"/>
							<Dot x="6.25" y="1.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="6.25" y="0.5"/>
							<Dot x="-1.25" y="0.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="2.5"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="544UD1_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15KV.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="6.25"/>
							<Dot x="7.5" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="7.5" y="6.25"/>
							<Dot x="7.5" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="7.5" y="7.5"/>
							<Dot x="0" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="7.5"/>
							<Dot x="0" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="7.5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="7.5" y="0"/>
							<Dot x="7.5" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="7.5" y="1.25"/>
							<Dot x="0" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="1.25"/>
							<Dot x="0" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="8.75" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="8.75" y="1.25"/>
							<Dot x="8.75" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="8.75" y="6.25"/>
							<Dot x="-1.25" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="6.25"/>
							<Dot x="-1.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="2.5"/>
							<Dot x="0" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="2.5"/>
							<Dot x="0" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="5"/>
							<Dot x="-1.25" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="5"/>
							<Dot x="-1.25" y="2.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="5" y="3.75"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="554SA3_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15KV.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="6.25"/>
							<Dot x="15" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="6.25"/>
							<Dot x="15" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="7.5"/>
							<Dot x="0" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="7.5"/>
							<Dot x="0" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="15" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="0"/>
							<Dot x="15" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="1.25"/>
							<Dot x="0" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="1.25"/>
							<Dot x="0" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="16.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="16.25" y="1.25"/>
							<Dot x="16.25" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="16.25" y="6.25"/>
							<Dot x="-1.25" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="6.25"/>
							<Dot x="-1.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="2.5"/>
							<Dot x="0" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="2.5"/>
							<Dot x="0" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="5"/>
							<Dot x="-1.25" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="5"/>
							<Dot x="-1.25" y="2.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="8.75" y="3.75"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="AL307_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="0" y="-2.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.75" y="-2"/>
							<Dot x="0.75" y="-2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.75" y="-0.77"/>
							<Dot x="0.75" y="-0.77"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0.75" y="-0.77"/>
							<Dot x="0" y="-2.02"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="-2.02"/>
							<Dot x="-0.75" y="-0.77"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Circle diameter="3.08">
							<Center x="0" y="-1.25"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Circle diameter="4">
							<Center x="0" y="-1.25"/>
						</Circle>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="2.5"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="K50-35_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="4.63" y="4.38"/>
							<Start x="4.5004" y="4.7501"/>
							<End x="4.5036" y="4.0088"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="-2.13" y="4.38"/>
							<Start x="-1.9999" y="4"/>
							<End x="-1.9966" y="4.7588"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.25" y="5.5"/>
							<Dot x="-0.25" y="7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="6.25"/>
							<Dot x="0.5" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="8"/>
							<Dot x="4.5" y="14.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="14.5"/>
							<Dot x="-2" y="14.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="14.5"/>
							<Dot x="-2" y="7.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="4"/>
							<Dot x="4.5" y="4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="4.75"/>
							<Dot x="-2" y="4.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="3"/>
							<Dot x="-2" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="2.5"/>
							<Dot x="4.5" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="2.5"/>
							<Dot x="4.5" y="3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.25" y="0"/>
							<Dot x="0.25" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0.25" y="0"/>
							<Dot x="0.25" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0.25" y="2.5"/>
							<Dot x="-0.25" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.25" y="2.5"/>
							<Dot x="-0.25" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.25" y="0"/>
							<Dot x="2.75" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.75" y="0"/>
							<Dot x="2.75" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.75" y="2.5"/>
							<Dot x="2.25" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.25" y="2.5"/>
							<Dot x="2.25" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="3"/>
							<Dot x="-2" y="4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="4.75"/>
							<Dot x="-2" y="7.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="3"/>
							<Dot x="4.5" y="4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="4.75"/>
							<Dot x="4.5" y="8"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" angle="270" mirror="on">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="1.25" y="10"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="K50-35_2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="4.63" y="4.38"/>
							<Start x="4.5004" y="4.7501"/>
							<End x="4.5036" y="4.0088"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="-2.13" y="4.38"/>
							<Start x="-1.9999" y="4"/>
							<End x="-1.9966" y="4.7588"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.25" y="5.5"/>
							<Dot x="-0.25" y="7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1" y="6.25"/>
							<Dot x="0.5" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="8"/>
							<Dot x="4.5" y="14.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="14.5"/>
							<Dot x="-2" y="14.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="14.5"/>
							<Dot x="-2" y="7.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="4"/>
							<Dot x="4.5" y="4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="4.75"/>
							<Dot x="-2" y="4.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="3"/>
							<Dot x="-2" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="2.5"/>
							<Dot x="4.5" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="2.5"/>
							<Dot x="4.5" y="3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.25" y="0"/>
							<Dot x="0.25" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0.25" y="0"/>
							<Dot x="0.25" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0.25" y="2.5"/>
							<Dot x="-0.25" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.25" y="2.5"/>
							<Dot x="-0.25" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.25" y="0"/>
							<Dot x="2.75" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.75" y="0"/>
							<Dot x="2.75" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.75" y="2.5"/>
							<Dot x="2.25" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="2.25" y="2.5"/>
							<Dot x="2.25" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="3"/>
							<Dot x="-2" y="4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-2" y="4.75"/>
							<Dot x="-2" y="7.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="3"/>
							<Dot x="4.5" y="4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="4.5" y="4.75"/>
							<Dot x="4.5" y="8"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="1.25" y="10"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="K73-17_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="15" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="0,033 x 630V">
						<LayerRef name="TEXT"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="11.25" y="-12.5"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="15.5" y="-3.5"/>
							<Start x="16.5" y="-3.5"/>
							<End x="15.5" y="-2.5"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="15.5" y="-15.5"/>
							<Start x="15.5" y="-16.5"/>
							<End x="16.5" y="-15.5"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="-0.5" y="-3.5"/>
							<Start x="-0.5" y="-2.5"/>
							<End x="-1.5" y="-3.5"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<ArcCCW>
							<Center x="-0.5" y="-15.5"/>
							<Start x="-1.5" y="-15.5"/>
							<End x="-0.5" y="-16.5"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-0.5" y="-16.5"/>
							<Dot x="15.5" y="-16.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="16.5" y="-3.5"/>
							<Dot x="16.5" y="-15.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.5" y="-3.5"/>
							<Dot x="-1.5" y="-15.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="0" y="-2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="0"/>
							<Dot x="15" y="-2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="-2.5"/>
							<Dot x="15" y="-2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="15" y="-2.5"/>
							<Dot x="15.5" y="-2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="-2.5"/>
							<Dot x="-0.5" y="-2.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="7.5" y="-10"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="561IE16_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ15KV.PS"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="17.5" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="17.5" y="7.5"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="15" y="7.5"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="12.5" y="7.5"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="10" y="7.5"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="7.5" y="7.5"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="5" y="7.5"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="2.5" y="7.5"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="DYZ15.PS"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="6.25"/>
							<Dot x="17.5" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="6.25"/>
							<Dot x="17.5" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="7.5"/>
							<Dot x="0" y="7.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="7.5"/>
							<Dot x="0" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="1.25"/>
							<Dot x="18.75" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="18.75" y="1.25"/>
							<Dot x="18.75" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="18.75" y="6.25"/>
							<Dot x="-1.25" y="6.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="6.25"/>
							<Dot x="-1.25" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="2.5"/>
							<Dot x="0" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="2.5"/>
							<Dot x="0" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="5"/>
							<Dot x="-1.25" y="5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.15">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="-1.25" y="5"/>
							<Dot x="-1.25" y="2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="17.5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="0"/>
							<Dot x="17.5" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="17.5" y="1.25"/>
							<Dot x="0" y="1.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.01">
						<LayerRef name="TopAssy"/>
						<Line>
							<Dot x="0" y="1.25"/>
							<Dot x="0" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="8.75" y="3.75"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="KONTAKT_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DYZ20.PS"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Circle diameter="1.68">
							<Center x="0" y="0"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0.1">
						<LayerRef name="TopAssy"/>
						<Circle diameter="0.4">
							<Center x="0" y="0"/>
						</Circle>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H59W5"/>
						<Org x="0" y="3.75"/>
					</Label>
				</Labels>
			</Footprint>
		</Footprints>
		<Components>
			<Component name="MP-10_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="A1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="3" pinSymName="A3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="2" pinSymName="A2" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="MP-10"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="SA"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="MP-10"/>
				</Attributes>
			</Component>
			<Component name="KT361_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="E" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="K" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="B" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="KT361"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VT"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="KT361"/>
				</Attributes>
			</Component>
			<Component name="561IR2_1">
				<Pins>
					<Pin pinNum="1" name="6" pinSymName="R" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="9" pinSymName="C" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="7" pinSymName="D" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="5" pinSymName="Q0" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="4" pinSymName="Q1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="3" pinSymName="Q2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="10" pinSymName="Q3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="14" pinSymName="R" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="9" name="1" pinSymName="C" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="10" name="15" pinSymName="D" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="11" name="13" pinSymName="Q0" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="12" name="12" pinSymName="Q1" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="13" name="11" pinSymName="Q2" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="14" name="2" pinSymName="Q3" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="15" name="16" pinSymName="16" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="16" name="8" pinSymName="8" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="561IR2"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="561IR2"/>
				</Attributes>
			</Component>
			<Component name="KD522_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="+" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="-" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="KD522"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="KD522"/>
				</Attributes>
			</Component>
			<Component name="Q32768_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="Q32768"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="BQ"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="Q32768"/>
				</Attributes>
			</Component>
			<Component name="561LA7_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="I1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="I2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="O" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="5" pinSymName="I1" pinEqual="2" gate="2" gateEqual="1"/>
					<Pin pinNum="5" name="6" pinSymName="I2" pinEqual="2" gate="2" gateEqual="1"/>
					<Pin pinNum="6" name="4" pinSymName="O" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="7" name="8" pinSymName="I1" pinEqual="3" gate="3" gateEqual="1"/>
					<Pin pinNum="8" name="9" pinSymName="I2" pinEqual="3" gate="3" gateEqual="1"/>
					<Pin pinNum="9" name="10" pinSymName="O" pinEqual="0" gate="3" gateEqual="1"/>
					<Pin pinNum="10" name="12" pinSymName="I1" pinEqual="4" gate="4" gateEqual="1"/>
					<Pin pinNum="11" name="13" pinSymName="I2" pinEqual="4" gate="4" gateEqual="1"/>
					<Pin pinNum="12" name="11" pinSymName="O" pinEqual="0" gate="4" gateEqual="1"/>
					<Pin pinNum="13" name="14" pinSymName="14" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="14" name="7" pinSymName="7" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="561LA7"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="561LA7"/>
				</Attributes>
			</Component>
			<Component name="561IE8_1">
				<Pins>
					<Pin pinNum="1" name="14" pinSymName="C" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="13" pinSymName="V" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="15" pinSymName="R" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="3" pinSymName="Q0" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="2" pinSymName="Q1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="4" pinSymName="Q2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="Q3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="10" pinSymName="Q4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="1" pinSymName="Q5" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="5" pinSymName="Q6" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="6" pinSymName="Q7" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="9" pinSymName="Q8" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="11" pinSymName="Q9" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="12" pinSymName="P" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="15" name="16" pinSymName="16" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="16" name="8" pinSymName="8" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="561IE8"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="561IE8"/>
				</Attributes>
			</Component>
			<Component name="R025_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="R025"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="R"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="R025"/>
				</Attributes>
			</Component>
			<Component name="KM5_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="KM5"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="C"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="KM5"/>
				</Attributes>
			</Component>
			<Component name="PIN_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="PIN"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="XC"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="PIN"/>
				</Attributes>
			</Component>
			<Component name="561LN2_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="I" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="O" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="I" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="O" pinEqual="0" gate="2" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="I" pinEqual="0" gate="3" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="O" pinEqual="0" gate="3" gateEqual="1"/>
					<Pin pinNum="7" name="9" pinSymName="I" pinEqual="0" gate="4" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="O" pinEqual="0" gate="4" gateEqual="1"/>
					<Pin pinNum="9" name="11" pinSymName="I" pinEqual="0" gate="5" gateEqual="1"/>
					<Pin pinNum="10" name="10" pinSymName="O" pinEqual="0" gate="5" gateEqual="1"/>
					<Pin pinNum="11" name="13" pinSymName="I" pinEqual="0" gate="6" gateEqual="1"/>
					<Pin pinNum="12" name="12" pinSymName="O" pinEqual="0" gate="6" gateEqual="1"/>
					<Pin pinNum="13" name="14" pinSymName="14" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="14" name="7" pinSymName="7" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="561LN2"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="561LN2"/>
				</Attributes>
			</Component>
			<Component name="SP3-38B_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="A1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="A2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="A3" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SP3-38B"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="R"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="SP3-38B"/>
				</Attributes>
			</Component>
			<Component name="KT315_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="E" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="K" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="B" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="KT315"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VT"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="KT315"/>
				</Attributes>
			</Component>
			<Component name="544UD1_1">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="I-" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="3" pinSymName="I+" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="7" pinSymName="U+" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="U-" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="6" pinSymName="OUT" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="1" pinSymName="NC1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="8" pinSymName="NC2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="5" pinSymName="5" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="544UD1"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="DA"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="544UD1"/>
				</Attributes>
			</Component>
			<Component name="554SA3_1">
				<Pins>
					<Pin pinNum="1" name="3" pinSymName="+" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="4" pinSymName="-" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="7" pinSymName="I1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="8" pinSymName="I2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="9" pinSymName="OUT" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="2" pinSymName="OUT1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="6" pinSymName="-U" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="11" pinSymName="+U" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="1" pinSymName="1" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinSymName="10" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="11" name="12" pinSymName="12" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="12" name="13" pinSymName="13" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="13" name="14" pinSymName="14" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="14" name="5" pinSymName="5" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="554SA3"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="DA"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="554SA3"/>
				</Attributes>
			</Component>
			<Component name="AL307_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="+" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="-" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="AL307"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="AL307"/>
				</Attributes>
			</Component>
			<Component name="K50-35_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="K50-35"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="C"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="K50-35"/>
					<Attribute name="PCADIO_LinkName" value="K50-35"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="C"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="K50-35"/>
				</Attributes>
			</Component>
			<Component name="K73-17_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="K73-17"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="C"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="K73-17"/>
				</Attributes>
			</Component>
			<Component name="561IE16_1">
				<Pins>
					<Pin pinNum="1" name="10" pinSymName="C" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="11" pinSymName="R" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="9" pinSymName="Q1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="7" pinSymName="Q4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="Q5" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="4" pinSymName="Q6" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="6" pinSymName="Q7" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="13" pinSymName="Q8" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="12" pinSymName="Q9" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="14" pinSymName="Q10" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="15" pinSymName="Q11" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="1" pinSymName="Q12" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="2" pinSymName="Q13" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="3" pinSymName="Q14" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="15" name="16" pinSymName="16" pinEqual="0" gate="0" gateEqual="0"/>
					<Pin pinNum="16" name="8" pinSymName="8" pinEqual="0" gate="0" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="561IE16"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="D"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="561IE16"/>
				</Attributes>
			</Component>
			<Component name="KONTAKT_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="PIN" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="KONTAKT"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="KONTAKT"/>
				</Attributes>
			</Component>
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="MP-10_1"/>
				<FootprintRef name="MP-10_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="3" padNum="2"/>
				<Pinpack pinNum="2" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="KT361_1"/>
				<FootprintRef name="KT361_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="561IR2_1"/>
				<FootprintRef name="561IR2_1"/>
				<Pinpack pinNum="9" padNum="1"/>
				<Pinpack pinNum="14" padNum="2"/>
				<Pinpack pinNum="6" padNum="3"/>
				<Pinpack pinNum="5" padNum="4"/>
				<Pinpack pinNum="4" padNum="5"/>
				<Pinpack pinNum="1" padNum="6"/>
				<Pinpack pinNum="3" padNum="7"/>
				<Pinpack pinNum="16" padNum="8"/>
				<Pinpack pinNum="2" padNum="9"/>
				<Pinpack pinNum="7" padNum="10"/>
				<Pinpack pinNum="13" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="11" padNum="13"/>
				<Pinpack pinNum="8" padNum="14"/>
				<Pinpack pinNum="10" padNum="15"/>
				<Pinpack pinNum="15" padNum="16"/>
			</Package>
			<Package>
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="Q32768_1"/>
				<FootprintRef name="Q32768_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="561LA7_1"/>
				<FootprintRef name="561LA7_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="6" padNum="4"/>
				<Pinpack pinNum="4" padNum="5"/>
				<Pinpack pinNum="5" padNum="6"/>
				<Pinpack pinNum="14" padNum="7"/>
				<Pinpack pinNum="7" padNum="8"/>
				<Pinpack pinNum="8" padNum="9"/>
				<Pinpack pinNum="9" padNum="10"/>
				<Pinpack pinNum="12" padNum="11"/>
				<Pinpack pinNum="10" padNum="12"/>
				<Pinpack pinNum="11" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="561IE8_1"/>
				<FootprintRef name="561IE8_1"/>
				<Pinpack pinNum="9" padNum="1"/>
				<Pinpack pinNum="5" padNum="2"/>
				<Pinpack pinNum="4" padNum="3"/>
				<Pinpack pinNum="6" padNum="4"/>
				<Pinpack pinNum="10" padNum="5"/>
				<Pinpack pinNum="11" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="16" padNum="8"/>
				<Pinpack pinNum="12" padNum="9"/>
				<Pinpack pinNum="8" padNum="10"/>
				<Pinpack pinNum="13" padNum="11"/>
				<Pinpack pinNum="14" padNum="12"/>
				<Pinpack pinNum="2" padNum="13"/>
				<Pinpack pinNum="1" padNum="14"/>
				<Pinpack pinNum="3" padNum="15"/>
				<Pinpack pinNum="15" padNum="16"/>
			</Package>
			<Package>
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="PIN_1"/>
				<FootprintRef name="PIN_1"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="561LN2_1"/>
				<FootprintRef name="561LN2_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="14" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="7" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="9" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="11" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="SP3-38B_1"/>
				<FootprintRef name="SP3-38B_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="544UD1_1"/>
				<FootprintRef name="544UD1_1"/>
				<Pinpack pinNum="6" padNum="1"/>
				<Pinpack pinNum="1" padNum="2"/>
				<Pinpack pinNum="2" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="8" padNum="5"/>
				<Pinpack pinNum="5" padNum="6"/>
				<Pinpack pinNum="3" padNum="7"/>
				<Pinpack pinNum="7" padNum="8"/>
			</Package>
			<Package>
				<ComponentRef name="554SA3_1"/>
				<FootprintRef name="554SA3_1"/>
				<Pinpack pinNum="9" padNum="1"/>
				<Pinpack pinNum="6" padNum="2"/>
				<Pinpack pinNum="1" padNum="3"/>
				<Pinpack pinNum="2" padNum="4"/>
				<Pinpack pinNum="14" padNum="5"/>
				<Pinpack pinNum="7" padNum="6"/>
				<Pinpack pinNum="3" padNum="7"/>
				<Pinpack pinNum="4" padNum="8"/>
				<Pinpack pinNum="5" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="8" padNum="11"/>
				<Pinpack pinNum="11" padNum="12"/>
				<Pinpack pinNum="12" padNum="13"/>
				<Pinpack pinNum="13" padNum="14"/>
			</Package>
			<Package>
				<ComponentRef name="AL307_1"/>
				<FootprintRef name="AL307_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="K50-35_1"/>
				<FootprintRef name="K50-35_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="K50-35_1"/>
				<FootprintRef name="K50-35_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="K73-17_1"/>
				<FootprintRef name="K73-17_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="561IE16_1"/>
				<FootprintRef name="561IE16_1"/>
				<Pinpack pinNum="12" padNum="1"/>
				<Pinpack pinNum="13" padNum="2"/>
				<Pinpack pinNum="14" padNum="3"/>
				<Pinpack pinNum="6" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="7" padNum="6"/>
				<Pinpack pinNum="4" padNum="7"/>
				<Pinpack pinNum="16" padNum="8"/>
				<Pinpack pinNum="3" padNum="9"/>
				<Pinpack pinNum="1" padNum="10"/>
				<Pinpack pinNum="2" padNum="11"/>
				<Pinpack pinNum="9" padNum="12"/>
				<Pinpack pinNum="8" padNum="13"/>
				<Pinpack pinNum="10" padNum="14"/>
				<Pinpack pinNum="11" padNum="15"/>
				<Pinpack pinNum="15" padNum="16"/>
			</Package>
			<Package>
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
		</Packages>
	</LocalLibrary>

	<Constructive version="1.2">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.0254">
					<Polyline>
						<Start x="25.4" y="115.4"/>
						<SegmentLine>
							<End x="25.4" y="25.4"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.0254">
					<Polyline>
						<Start x="155.4" y="25.4"/>
						<SegmentLine>
							<End x="155.4" y="115.4"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.0254">
					<Polyline>
						<Start x="25.4" y="25.4"/>
						<SegmentLine>
							<End x="155.4" y="25.4"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.0254">
					<Polyline>
						<Start x="155.4" y="115.4"/>
						<SegmentLine>
							<End x="25.4" y="115.4"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.127">
					<FilledContour>
						<Start x="155.4" y="115.4"/>
						<SegmentLine>
							<End x="25.4" y="115.4"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.4" y="25.4"/>
						</SegmentLine>
						<SegmentLine>
							<End x="155.4" y="25.4"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
			</Contour>
		</BoardOutline>
		<MechLayerObjects>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="39.15" y="112.9"/>
					<SegmentLine>
						<End x="39.15" y="107.9"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="150.4" y="112.9"/>
					<SegmentLine>
						<End x="150.4" y="107.9"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.3">
				<LayerRef name="TopSilk"/>
				<Circle diameter="3">
					<Center x="150.4" y="110.4"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="39.15" y="32.9"/>
					<SegmentLine>
						<End x="39.15" y="27.9"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="150.4" y="32.9"/>
					<SegmentLine>
						<End x="150.4" y="27.9"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.3">
				<LayerRef name="TopSilk"/>
				<Circle diameter="3">
					<Center x="150.4" y="30.4"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="25.4" y="115.4"/>
					<SegmentLine>
						<End x="25.4" y="25.4"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="155.4" y="25.4"/>
					<SegmentLine>
						<End x="155.4" y="115.4"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="36.65" y="30.4"/>
					<SegmentLine>
						<End x="41.65" y="30.4"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="36.65" y="110.4"/>
					<SegmentLine>
						<End x="41.65" y="110.4"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.3">
				<LayerRef name="TopSilk"/>
				<Circle diameter="3">
					<Center x="39.15" y="110.4"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="147.9" y="30.4"/>
					<SegmentLine>
						<End x="152.9" y="30.4"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="147.9" y="110.4"/>
					<SegmentLine>
						<End x="152.9" y="110.4"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.3">
				<LayerRef name="TopSilk"/>
				<Circle diameter="3">
					<Center x="39.15" y="30.4"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="25.4" y="25.4"/>
					<SegmentLine>
						<End x="155.4" y="25.4"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.1">
				<LayerRef name="TopSilk"/>
				<Polyline>
					<Start x="155.4" y="115.4"/>
					<SegmentLine>
						<End x="25.4" y="115.4"/>
					</SegmentLine>
				</Polyline>
			</Detail>
		</MechLayerObjects>
		<Keepouts>
			<Keepout>
				<Role>
					<Trace role="Wires and Vias">
						<LayerRef name="Top"/>
					</Trace>
				</Role>
				<Polyline>
					<Start x="25.4" y="115.4"/>
					<SegmentLine>
						<End x="25.4" y="25.4"/>
					</SegmentLine>
				</Polyline>
			</Keepout>
			<Keepout>
				<Role>
					<Trace role="Wires and Vias">
						<LayerRef name="Top"/>
					</Trace>
				</Role>
				<Polyline>
					<Start x="32.9" y="25.4"/>
					<SegmentLine>
						<End x="32.9" y="115.4"/>
					</SegmentLine>
				</Polyline>
			</Keepout>
			<Keepout>
				<Role>
					<Trace role="Wires and Vias">
						<LayerRef name="Top"/>
					</Trace>
				</Role>
				<Polyline>
					<Start x="25.4" y="25.4"/>
					<SegmentLine>
						<End x="32.9" y="25.4"/>
					</SegmentLine>
				</Polyline>
			</Keepout>
			<Keepout>
				<Role>
					<Trace role="Wires and Vias">
						<LayerRef name="Top"/>
					</Trace>
				</Role>
				<Polyline>
					<Start x="32.9" y="115.4"/>
					<SegmentLine>
						<End x="25.4" y="115.4"/>
					</SegmentLine>
				</Polyline>
			</Keepout>
		</Keepouts>
	</Constructive>

	<ComponentsOnBoard version="1.3">
		<Components>
			<CompInstance name="VD6" uniqueId="WQHCSFCN" side="Top" angle="180">
				<ComponentRef name="AL307_1"/>
				<FootprintRef name="AL307_1"/>
				<Org x="50.4" y="81.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="1.25" y="-5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AL307"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD20" uniqueId="PYQZEYQV" side="Top">
				<ComponentRef name="AL307_1"/>
				<FootprintRef name="AL307_1"/>
				<Org x="50.4" y="106.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AL307"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R51" uniqueId="PWWXPHST" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="62.9" y="51.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT5" uniqueId="TTVHRFMI" side="Top" angle="90">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="70.4" y="96.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="2.5" y="-2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT3" uniqueId="QUDURJPJ" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="80.4" y="92.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="-2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD23" uniqueId="LLUXCAMD" side="Top">
				<ComponentRef name="AL307_1"/>
				<FootprintRef name="AL307_1"/>
				<Org x="80.4" y="106.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AL307"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C6" uniqueId="JDPERFDF" side="Top" angle="90">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="87.9" y="100.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KM5"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="1" uniqueId="VXFJMUCW" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="85.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R53" uniqueId="GTBADJOE" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="96.65" y="96.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="10" uniqueId="GGQDXUAS" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="95.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="2" uniqueId="SHPKRIJL" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="100.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="3" uniqueId="HYFULBRR" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="105.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="4" uniqueId="CFRJHAZI" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="110.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R56" uniqueId="ZKBINAMC" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="117.9" y="56.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD24" uniqueId="RYHPQHKW" side="Top" angle="90">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="120.4" y="97.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="3.75" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="6" uniqueId="JLZDZDEY" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="120.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="7" uniqueId="LMWQZCBA" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="125.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R50" uniqueId="NORWGJPG" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="134.15" y="44.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT9" uniqueId="SDBYRHPK" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="141.65" y="49.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="-1.25"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R41" uniqueId="SHVBPJDG" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="140.4" y="69.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="9" uniqueId="CKALPGZD" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="140.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R11" uniqueId="LROLXDOV" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="147.9" y="36.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R3" uniqueId="VJDPNPHW" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="147.9" y="67.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R6" uniqueId="AYUYOXNA" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="44.15" y="95.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R29" uniqueId="VTZAKIZC" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="56.65" y="95.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R30" uniqueId="GEFRZKDM" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="66.65" y="95.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R8" uniqueId="NDAFFTMY" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="64.15" y="95.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R9" uniqueId="VSCQDKFR" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="74.15" y="95.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT6" uniqueId="GIDOQTZY" side="Top" angle="90">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="80.4" y="96.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="-2.5" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R25" uniqueId="GNUQXVEV" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="87.9" y="94.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R27" uniqueId="EURKETFR" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="117.9" y="94.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R33" uniqueId="XBOFPQTU" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="117.9" y="29.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R39" uniqueId="ZERKRYKJ" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="125.4" y="41.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R40" uniqueId="OOVHMFZU" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="132.9" y="29.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT12" uniqueId="MWNIGRTL" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="142.9" y="65.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R46" uniqueId="OPJLWYVI" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="140.4" y="29.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD10" uniqueId="TKGVWUKR" side="Top" angle="270">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="140.4" y="66.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="10" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD16" uniqueId="WZFQZSCJ" side="Top" angle="270">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="150.4" y="65.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="10" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD17" uniqueId="KBNCIGDK" side="Top" angle="90">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="147.9" y="57.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="-2.5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R1" uniqueId="XYSFRIMO" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="45.4" y="34.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C8" uniqueId="VYFHTBON" side="Top" angle="180">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="52.9" y="41.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KM5"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R14" uniqueId="PAHKWPDQ" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="57.9" y="57.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C4" uniqueId="RDKUQCYA" side="Top">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="50.4" y="65.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KM5"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XC00000" uniqueId="WFZVRHBP" side="Top" angle="180" fixed="on">
				<ComponentRef name="PIN_1"/>
				<FootprintRef name="PIN_1"/>
				<Org x="39.15" y="110.4"/>
				<Attributes>
					<Attribute name="Type" value="PIN"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R18" uniqueId="XNOJCGCE" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="80.4" y="41.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R49" uniqueId="JAASMGSF" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="80.4" y="57.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C1" uniqueId="UMXEJLLF" side="Top" angle="180">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="87.9" y="66.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KM5"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT10" uniqueId="UGFRUMUG" side="Top" angle="180">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="80.4" y="62.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD2" uniqueId="CFINHKQG" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="97.9" y="41.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="10" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD3" uniqueId="OHSOYQVT" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="97.9" y="56.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="10" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R55" uniqueId="VOWDXCSJ" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="152.9" y="51.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R37" uniqueId="HNBAPTHW" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="152.9" y="102.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XC00001" uniqueId="ECDMCYTO" side="Top" angle="180" fixed="on">
				<ComponentRef name="PIN_1"/>
				<FootprintRef name="PIN_1"/>
				<Org x="150.4" y="110.4"/>
				<Attributes>
					<Attribute name="Type" value="PIN"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="SA1" uniqueId="LIWMTJYC" side="Bottom" angle="90" fixed="on">
				<ComponentRef name="MP-10_1"/>
				<FootprintRef name="MP-10_1"/>
				<Org x="30.4" y="82.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="7.5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="MP-10"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C9" uniqueId="ZOXVGTMB" side="Top" angle="180">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="55.4" y="30.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KM5"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XC00002" uniqueId="HZKBVXBS" side="Top" angle="180" fixed="on">
				<ComponentRef name="PIN_1"/>
				<FootprintRef name="PIN_1"/>
				<Org x="39.15" y="30.4"/>
				<Attributes>
					<Attribute name="Type" value="PIN"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R2" uniqueId="OSLNFFWJ" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="45.4" y="37.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R13" uniqueId="BSQLEUTS" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="45.4" y="54.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D1" uniqueId="CXEQJNRP" side="Top">
				<ComponentRef name="561LN2_1"/>
				<FootprintRef name="561LN2_1"/>
				<Org x="42.9" y="44.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="7.5" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="561LN2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R12" uniqueId="SZRKNKNS" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="62.9" y="61.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R4" uniqueId="PLBCAPIF" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="36.65" y="66.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT1" uniqueId="YULJFOJO" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="60.4" y="92.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="2.5" y="-2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R15" uniqueId="PUGYLYSK" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="55.4" y="69.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D3" uniqueId="TRBRGJDT" side="Top">
				<ComponentRef name="561LA7_1"/>
				<FootprintRef name="561LA7_1"/>
				<Org x="42.9" y="71.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="7.5" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="561LA7"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD7" uniqueId="IPIIKCLU" side="Top" angle="180">
				<ComponentRef name="AL307_1"/>
				<FootprintRef name="AL307_1"/>
				<Org x="60.4" y="81.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="3.75" y="1.25"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AL307"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD15" uniqueId="ONPEKXFF" side="Top" angle="90">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="62.9" y="71.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="3.75" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD21" uniqueId="RRAVJJGE" side="Top">
				<ComponentRef name="AL307_1"/>
				<FootprintRef name="AL307_1"/>
				<Org x="60.4" y="106.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AL307"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT4" uniqueId="XQJXDSYP" side="Top" angle="90">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="60.4" y="96.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="2.5" y="-2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD13" uniqueId="SFVZYAMA" side="Top" angle="180">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="90.4" y="39.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="3.75" y="-2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R5" uniqueId="UXGXZPGV" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="90.4" y="41.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R17" uniqueId="PKLOCFBO" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="67.9" y="37.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R54" uniqueId="NETZMOEE" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="72.9" y="54.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D2" uniqueId="VQVUTKUG" side="Top">
				<ComponentRef name="561LN2_1"/>
				<FootprintRef name="561LN2_1"/>
				<Org x="67.9" y="44.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="561LN2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD8" uniqueId="CHJQSPGJ" side="Top" angle="180">
				<ComponentRef name="AL307_1"/>
				<FootprintRef name="AL307_1"/>
				<Org x="70.4" y="81.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="3.75" y="1.25"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AL307"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD9" uniqueId="UPIILBOL" side="Top" angle="180">
				<ComponentRef name="AL307_1"/>
				<FootprintRef name="AL307_1"/>
				<Org x="80.4" y="81.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="3.75" y="1.25"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AL307"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D8" uniqueId="LTZVPMQJ" side="Top">
				<ComponentRef name="561IR2_1"/>
				<FootprintRef name="561IR2_1"/>
				<Org x="67.9" y="71.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="561IR2"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD28" uniqueId="LSBRUTWQ" side="Top" angle="180">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="85.4" y="69.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="-2.5" y="-1.25"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT2" uniqueId="JHQJEPUH" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="70.4" y="92.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="2.5" y="-2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD14" uniqueId="LXKMBLNU" side="Top" angle="90">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="84.15" y="84.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="-1.25" y="-1.25"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R38" uniqueId="IDXTPHEJ" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="91.65" y="96.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD22" uniqueId="RMGTTSIZ" side="Top">
				<ComponentRef name="AL307_1"/>
				<FootprintRef name="AL307_1"/>
				<Org x="70.4" y="106.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AL307"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="11" uniqueId="TMHOSVFM" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="90.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD1" uniqueId="ZKJSSVNA" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="97.9" y="39.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="10" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD4" uniqueId="BZHQQOJW" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="97.9" y="54.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="10" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R42" uniqueId="UOIYCIYP" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="107.9" y="69.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD26" uniqueId="XZYVEQOW" side="Top">
				<ComponentRef name="AL307_1"/>
				<FootprintRef name="AL307_1"/>
				<Org x="100.4" y="106.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="AL307"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R20" uniqueId="WEPJIVUU" side="Top" angle="90">
				<ComponentRef name="SP3-38B_1"/>
				<FootprintRef name="SP3-38B_1"/>
				<Org x="114.15" y="99.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="SP3-38B"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="5" uniqueId="UIOGBOXF" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="115.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XC00003" uniqueId="LIJMYDAF" side="Top" angle="180" fixed="on">
				<ComponentRef name="PIN_1"/>
				<FootprintRef name="PIN_1"/>
				<Org x="150.4" y="30.4"/>
				<Attributes>
					<Attribute name="Type" value="PIN"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R45" uniqueId="APVZPERW" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="137.9" y="56.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD11" uniqueId="FXAIULGM" side="Top" angle="90">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="144.15" y="41.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="-1.25"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R10" uniqueId="TBVLCFIT" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="151.65" y="36.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD18" uniqueId="FXYCUGZW" side="Top" angle="90">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="137.9" y="69.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="3.75" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="Q1" uniqueId="CKSCRQCH" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="144.15" y="80.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="7.5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R35" uniqueId="TIUYQXXK" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="152.9" y="72.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="8" uniqueId="WKVGASRP" side="Top" fixed="on">
				<ComponentRef name="KONTAKT_1"/>
				<FootprintRef name="KONTAKT_1"/>
				<Org x="130.4" y="112.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KONTAKT"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="SA3" uniqueId="UORVRPMY" side="Bottom" angle="90" fixed="on">
				<ComponentRef name="MP-10_1"/>
				<FootprintRef name="MP-10_1"/>
				<Org x="30.4" y="105.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="7.5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="MP-10"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="SA4" uniqueId="LGOPBYIS" side="Bottom" angle="90" fixed="on">
				<ComponentRef name="MP-10_1"/>
				<FootprintRef name="MP-10_1"/>
				<Org x="30.4" y="37.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="7.5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="MP-10"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="SA2" uniqueId="POQONXKX" side="Bottom" angle="90" fixed="on">
				<ComponentRef name="MP-10_1"/>
				<FootprintRef name="MP-10_1"/>
				<Org x="30.4" y="60.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="7.5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="MP-10"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT7" uniqueId="NSLGMYPM" side="Top">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="42.9" y="61.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="0" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R28" uniqueId="MQNCKIST" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="46.65" y="95.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R7" uniqueId="ZYKPZFAL" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="54.15" y="95.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C5" uniqueId="FBCFXRYG" side="Top" angle="270">
				<ComponentRef name="K50-35_1"/>
				<FootprintRef name="K50-35_2"/>
				<Org x="77.9" y="34.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="1.25" y="10"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="K50-35"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R31" uniqueId="NVSNRXTL" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="76.65" y="95.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R19" uniqueId="YIRTGHRM" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="84.15" y="95.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R24" uniqueId="CJKCUCWO" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="114.15" y="94.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R26" uniqueId="DRKKGEPE" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="100.4" y="94.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R32" uniqueId="XUZLRQOS" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="121.65" y="29.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT11" uniqueId="NVNSFXIB" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="100.4" y="101.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT315"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R22" uniqueId="LBDLVNEG" side="Top">
				<ComponentRef name="SP3-38B_1"/>
				<FootprintRef name="SP3-38B_1"/>
				<Org x="104.15" y="84.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="2.5" y="-1.25"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="SP3-38B"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R47" uniqueId="KVZDZIUU" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="129.15" y="29.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R48" uniqueId="RLLQTUEG" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="136.65" y="29.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C3" uniqueId="JTOAECDB" side="Top" angle="90">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="144.15" y="29.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KM5"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD19" uniqueId="TLYDCFJI" side="Top" angle="270">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="145.4" y="65.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="10" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R34" uniqueId="MQIJEXLY" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="152.9" y="57.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R36" uniqueId="OOYQSUOJ" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="152.9" y="87.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C7" uniqueId="RNQZJYIM" side="Top">
				<ComponentRef name="K73-17_1"/>
				<FootprintRef name="K73-17_1"/>
				<Org x="134.15" y="100.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="7.5" y="-10"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="K73-17"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R16" uniqueId="CHWRLCMZ" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="75.4" y="34.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R52" uniqueId="IXERELKG" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="62.9" y="57.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD25" uniqueId="UMGLUHVZ" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="67.9" y="66.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="-2.5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT8" uniqueId="WMLIUJWH" side="Top" angle="180">
				<ComponentRef name="KT361_1"/>
				<FootprintRef name="KT361_1"/>
				<Org x="127.9" y="74.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="-3.75" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KT361"/>
					<Attribute name="FP" value="KT315"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C11" uniqueId="NQFIGLXC" side="Top">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="124.15" y="102.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KM5"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD12" uniqueId="QIUSKBZL" side="Top" angle="180">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="72.9" y="30.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="BQ1" uniqueId="BQFAAJOU" side="Top" angle="270">
				<ComponentRef name="Q32768_1"/>
				<FootprintRef name="Q32768_1"/>
				<Org x="35.4" y="52.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="7.5" y="2.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="Q32768"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD27" uniqueId="MJJVYDQU" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="62.9" y="54.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="-1.25" y="1.25"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D6" uniqueId="LZFEMHMR" side="Top">
				<ComponentRef name="561LA7_1"/>
				<FootprintRef name="561LA7_1"/>
				<Org x="95.4" y="44.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="561LA7"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DA10" uniqueId="PEGZFVYN" side="Top">
				<ComponentRef name="544UD1_1"/>
				<FootprintRef name="544UD1_1"/>
				<Org x="122.9" y="44.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="544UD1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD5" uniqueId="OVFXHKOB" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="67.9" y="69.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="-2.5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KD522"/>
					<Attribute name="FP" value="KD522"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R44" uniqueId="BBWEGDUT" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="105.4" y="69.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R43" uniqueId="NWVCRXHQ" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="122.9" y="69.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R025"/>
					<Attribute name="FP" value="R025"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D5" uniqueId="ULHNBFQV" side="Top">
				<ComponentRef name="561IE16_1"/>
				<FootprintRef name="561IE16_1"/>
				<Org x="95.4" y="71.65"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="561IE16"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C2" uniqueId="GDLGPXGM" side="Bottom" angle="270">
				<ComponentRef name="K50-35_1"/>
				<FootprintRef name="K50-35_1"/>
				<Org x="121.65" y="77.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" mirror="on" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="1.25" y="10"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="K50-35"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C10" uniqueId="RYZOTXHV" side="Top" angle="180">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="134.15" y="107.9"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="5" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="KM5"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D4" uniqueId="LPJLYJRP" side="Top">
				<ComponentRef name="561IE16_1"/>
				<FootprintRef name="561IE16_1"/>
				<Org x="95.4" y="59.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="561IE16"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="D7" uniqueId="ASAJINGK" side="Top">
				<ComponentRef name="561IE8_1"/>
				<FootprintRef name="561IE8_1"/>
				<Org x="95.4" y="29.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="561IE8"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DA9" uniqueId="NEORGMPF" side="Top">
				<ComponentRef name="554SA3_1"/>
				<FootprintRef name="554SA3_1"/>
				<Org x="122.9" y="59.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="8.75" y="3.75"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="554SA3"/>
					<Attribute name="FP" value="DIP"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R21" uniqueId="IIDTQIDW" side="Top">
				<ComponentRef name="SP3-38B_1"/>
				<FootprintRef name="SP3-38B_1"/>
				<Org x="91.65" y="84.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="2.5" y="-1.25"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="SP3-38B"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R23" uniqueId="PBHZVGKM" side="Top">
				<ComponentRef name="SP3-38B_1"/>
				<FootprintRef name="SP3-38B_1"/>
				<Org x="121.65" y="84.15"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H59W5"/>
							<Org x="6.25" y="12.5"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="SP3-38B"/>
				</Attributes>
			</CompInstance>
		</Components>
	</ComponentsOnBoard>

	<NetList version="2.0">
		<Net name="UN000000">
			<PinRef compName="C9" pinName="2"/>
			<PinRef compName="R2" pinName="1"/>
			<PinRef compName="D1" pinName="3"/>
		</Net>
		<Net name="UN000001">
			<PinRef compName="R1" pinName="2"/>
			<PinRef compName="C9" pinName="1"/>
			<PinRef compName="D1" pinName="2"/>
		</Net>
		<Net name="UN000002">
			<PinRef compName="R1" pinName="1"/>
			<PinRef compName="C8" pinName="2"/>
			<PinRef compName="D1" pinName="1"/>
			<PinRef compName="BQ1" pinName="1"/>
		</Net>
		<Net name="UN000003">
			<PinRef compName="R2" pinName="2"/>
			<PinRef compName="D1" pinName="4"/>
			<PinRef compName="D2" pinName="13"/>
			<PinRef compName="BQ1" pinName="2"/>
		</Net>
		<Net name="UN000007">
			<PinRef compName="D5" pinName="10"/>
			<PinRef compName="D4" pinName="15"/>
		</Net>
		<Net name="UN000004">
			<PinRef compName="D2" pinName="12"/>
			<PinRef compName="D4" pinName="10"/>
		</Net>
		<Net name="UN000005">
			<PinRef compName="Q1" pinName="3"/>
			<PinRef compName="D4" pinName="5"/>
		</Net>
		<Net name="UN000006">
			<PinRef compName="7" pinName="1"/>
			<PinRef compName="R3" pinName="2"/>
			<PinRef compName="Q1" pinName="1"/>
		</Net>
		<Net name="UN000011">
			<PinRef compName="C1" pinName="2"/>
			<PinRef compName="R5" pinName="1"/>
			<PinRef compName="D8" pinName="6"/>
			<PinRef compName="VD28" pinName="2"/>
			<PinRef compName="VD5" pinName="2"/>
			<PinRef compName="D7" pinName="15"/>
		</Net>
		<Net name="UN000010">
			<PinRef compName="D3" pinName="9"/>
			<PinRef compName="D3" pinName="11"/>
			<PinRef compName="R42" pinName="1"/>
			<PinRef compName="D5" pinName="11"/>
			<PinRef compName="D4" pinName="11"/>
		</Net>
		<Net name="UN000008">
			<PinRef compName="SA1" pinName="3"/>
			<PinRef compName="D1" pinName="5"/>
			<PinRef compName="D1" pinName="8"/>
			<PinRef compName="D8" pinName="9"/>
			<PinRef compName="D7" pinName="14"/>
		</Net>
		<Net name="UN000009">
			<PinRef compName="SA1" pinName="2"/>
			<PinRef compName="D1" pinName="6"/>
			<PinRef compName="D1" pinName="9"/>
		</Net>
		<Net name="UN000034">
			<PinRef compName="R11" pinName="1"/>
			<PinRef compName="VD11" pinName="1"/>
			<PinRef compName="R10" pinName="1"/>
			<PinRef compName="C3" pinName="2"/>
		</Net>
		<Net name="UN000022">
			<PinRef compName="VT1" pinName="3"/>
			<PinRef compName="D8" pinName="5"/>
		</Net>
		<Net name="UN000012">
			<PinRef compName="VD28" pinName="1"/>
			<PinRef compName="D7" pinName="10"/>
		</Net>
		<Net name="2">
			<PinRef compName="D6" pinName="6"/>
			<PinRef compName="D7" pinName="2"/>
		</Net>
		<Net name="3">
			<PinRef compName="D6" pinName="9"/>
			<PinRef compName="D7" pinName="4"/>
		</Net>
		<Net name="4">
			<PinRef compName="D6" pinName="13"/>
			<PinRef compName="D7" pinName="7"/>
		</Net>
		<Net name="UN000017">
			<PinRef compName="VD1" pinName="2"/>
			<PinRef compName="D6" pinName="3"/>
		</Net>
		<Net name="UN000013">
			<PinRef compName="D6" pinName="1"/>
			<PinRef compName="D5" pinName="7"/>
		</Net>
		<Net name="UN000014">
			<PinRef compName="D6" pinName="5"/>
			<PinRef compName="D5" pinName="5"/>
		</Net>
		<Net name="UN000015">
			<PinRef compName="D6" pinName="8"/>
			<PinRef compName="D5" pinName="4"/>
		</Net>
		<Net name="UN000016">
			<PinRef compName="D6" pinName="12"/>
			<PinRef compName="D5" pinName="14"/>
		</Net>
		<Net name="1">
			<PinRef compName="D6" pinName="2"/>
			<PinRef compName="D7" pinName="3"/>
		</Net>
		<Net name="UN000018">
			<PinRef compName="VD2" pinName="2"/>
			<PinRef compName="D6" pinName="4"/>
		</Net>
		<Net name="UN000019">
			<PinRef compName="VD3" pinName="2"/>
			<PinRef compName="D6" pinName="10"/>
		</Net>
		<Net name="UN000020">
			<PinRef compName="VD4" pinName="2"/>
			<PinRef compName="D6" pinName="11"/>
		</Net>
		<Net name="UN000021">
			<PinRef compName="VD2" pinName="1"/>
			<PinRef compName="VD3" pinName="1"/>
			<PinRef compName="R4" pinName="2"/>
			<PinRef compName="D3" pinName="13"/>
			<PinRef compName="VD13" pinName="1"/>
			<PinRef compName="VD1" pinName="1"/>
			<PinRef compName="VD4" pinName="1"/>
			<PinRef compName="SA4" pinName="1"/>
		</Net>
		<Net name="UN000031">
			<PinRef compName="VD6" pinName="1"/>
			<PinRef compName="R6" pinName="2"/>
		</Net>
		<Net name="UN000023">
			<PinRef compName="D8" pinName="4"/>
			<PinRef compName="VT2" pinName="3"/>
		</Net>
		<Net name="UN000024">
			<PinRef compName="VT3" pinName="3"/>
			<PinRef compName="D8" pinName="3"/>
		</Net>
		<Net name="UN000025">
			<PinRef compName="VT1" pinName="1"/>
			<PinRef compName="R7" pinName="1"/>
		</Net>
		<Net name="UN000026">
			<PinRef compName="VD7" pinName="1"/>
			<PinRef compName="R7" pinName="2"/>
		</Net>
		<Net name="UN000027">
			<PinRef compName="R8" pinName="1"/>
			<PinRef compName="VT2" pinName="1"/>
		</Net>
		<Net name="UN000028">
			<PinRef compName="R8" pinName="2"/>
			<PinRef compName="VD8" pinName="1"/>
		</Net>
		<Net name="UN000029">
			<PinRef compName="VT3" pinName="1"/>
			<PinRef compName="R9" pinName="1"/>
		</Net>
		<Net name="UN000030">
			<PinRef compName="R9" pinName="2"/>
			<PinRef compName="VD9" pinName="1"/>
		</Net>
		<Net name="UN000038">
			<PinRef compName="D1" pinName="11"/>
			<PinRef compName="D1" pinName="12"/>
		</Net>
		<Net name="UN000046">
			<PinRef compName="R17" pinName="2"/>
			<PinRef compName="C5" pinName="1"/>
			<PinRef compName="R16" pinName="1"/>
			<PinRef compName="VD12" pinName="1"/>
		</Net>
		<Net name="UN000033">
			<PinRef compName="1" pinName="1"/>
			<PinRef compName="R10" pinName="2"/>
			<PinRef compName="SA2" pinName="2"/>
		</Net>
		<Net name="UN000035">
			<PinRef compName="R11" pinName="2"/>
			<PinRef compName="VD10" pinName="2"/>
			<PinRef compName="C2" pinName="1"/>
		</Net>
		<Net name="UN000036">
			<PinRef compName="R12" pinName="2"/>
			<PinRef compName="VD11" pinName="2"/>
			<PinRef compName="VT7" pinName="3"/>
		</Net>
		<Net name="UN000037">
			<PinRef compName="R14" pinName="2"/>
			<PinRef compName="R13" pinName="1"/>
			<PinRef compName="D1" pinName="13"/>
			<PinRef compName="VT7" pinName="2"/>
			<PinRef compName="VD27" pinName="1"/>
		</Net>
		<Net name="UN000062">
			<PinRef compName="VT4" pinName="3"/>
			<PinRef compName="D8" pinName="13"/>
			<PinRef compName="R21" pinName="2"/>
		</Net>
		<Net name="UN000039">
			<PinRef compName="R14" pinName="1"/>
			<PinRef compName="D1" pinName="10"/>
			<PinRef compName="D3" pinName="1"/>
			<PinRef compName="D3" pinName="2"/>
			<PinRef compName="D3" pinName="6"/>
		</Net>
		<Net name="UN000040">
			<PinRef compName="R15" pinName="2"/>
			<PinRef compName="D3" pinName="3"/>
		</Net>
		<Net name="UN000041">
			<PinRef compName="C4" pinName="1"/>
			<PinRef compName="R15" pinName="1"/>
			<PinRef compName="D3" pinName="5"/>
		</Net>
		<Net name="UN000042">
			<PinRef compName="D3" pinName="4"/>
			<PinRef compName="D3" pinName="8"/>
		</Net>
		<Net name="UN000077">
			<PinRef compName="R33" pinName="1"/>
			<PinRef compName="R32" pinName="2"/>
			<PinRef compName="DA10" pinName="6"/>
		</Net>
		<Net name="UN000044">
			<PinRef compName="D3" pinName="10"/>
			<PinRef compName="D3" pinName="12"/>
		</Net>
		<Net name="UN000045">
			<PinRef compName="2" pinName="1"/>
			<PinRef compName="D2" pinName="2"/>
			<PinRef compName="D2" pinName="3"/>
			<PinRef compName="VD14" pinName="1"/>
			<PinRef compName="VD5" pinName="1"/>
		</Net>
		<Net name="UN000047">
			<PinRef compName="R18" pinName="2"/>
			<PinRef compName="R17" pinName="1"/>
			<PinRef compName="D2" pinName="1"/>
		</Net>
		<Net name="UN000048">
			<PinRef compName="R18" pinName="1"/>
			<PinRef compName="VD13" pinName="2"/>
			<PinRef compName="D2" pinName="4"/>
		</Net>
		<Net name="UN000083">
			<PinRef compName="3" pinName="1"/>
			<PinRef compName="VD18" pinName="2"/>
		</Net>
		<Net name="UN000057">
			<PinRef compName="C6" pinName="1"/>
			<PinRef compName="VD15" pinName="2"/>
			<PinRef compName="D8" pinName="14"/>
			<PinRef compName="VD14" pinName="2"/>
			<PinRef compName="R19" pinName="1"/>
		</Net>
		<Net name="UN000058">
			<PinRef compName="D2" pinName="5"/>
			<PinRef compName="D2" pinName="8"/>
			<PinRef compName="D8" pinName="1"/>
			<PinRef compName="SA3" pinName="3"/>
		</Net>
		<Net name="UN000059">
			<PinRef compName="D2" pinName="6"/>
			<PinRef compName="D2" pinName="9"/>
			<PinRef compName="SA3" pinName="2"/>
		</Net>
		<Net name="UN000061">
			<PinRef compName="VD15" pinName="1"/>
			<PinRef compName="D8" pinName="2"/>
		</Net>
		<Net name="UN000063">
			<PinRef compName="VT5" pinName="3"/>
			<PinRef compName="D8" pinName="12"/>
			<PinRef compName="R22" pinName="2"/>
		</Net>
		<Net name="UN000064">
			<PinRef compName="VT6" pinName="3"/>
			<PinRef compName="D8" pinName="11"/>
			<PinRef compName="R23" pinName="2"/>
		</Net>
		<Net name="UN000065">
			<PinRef compName="R29" pinName="1"/>
			<PinRef compName="VT4" pinName="1"/>
		</Net>
		<Net name="UN000066">
			<PinRef compName="VT5" pinName="1"/>
			<PinRef compName="R30" pinName="1"/>
		</Net>
		<Net name="UN000067">
			<PinRef compName="VD20" pinName="1"/>
			<PinRef compName="R28" pinName="2"/>
		</Net>
		<Net name="UN000068">
			<PinRef compName="R29" pinName="2"/>
			<PinRef compName="VD21" pinName="1"/>
		</Net>
		<Net name="UN000069">
			<PinRef compName="R30" pinName="2"/>
			<PinRef compName="VD22" pinName="1"/>
		</Net>
		<Net name="UN000070">
			<PinRef compName="VD23" pinName="1"/>
			<PinRef compName="R31" pinName="2"/>
		</Net>
		<Net name="UN000071">
			<PinRef compName="VT6" pinName="1"/>
			<PinRef compName="R31" pinName="1"/>
		</Net>
		<Net name="UN000072">
			<PinRef compName="R25" pinName="1"/>
			<PinRef compName="R21" pinName="3"/>
		</Net>
		<Net name="UN000073">
			<PinRef compName="R26" pinName="1"/>
			<PinRef compName="R22" pinName="3"/>
		</Net>
		<Net name="UN000074">
			<PinRef compName="R27" pinName="1"/>
			<PinRef compName="R23" pinName="3"/>
		</Net>
		<Net name="UN000075">
			<PinRef compName="R20" pinName="3"/>
			<PinRef compName="R24" pinName="1"/>
		</Net>
		<Net name="UN000076">
			<PinRef compName="R25" pinName="2"/>
			<PinRef compName="R27" pinName="2"/>
			<PinRef compName="R24" pinName="2"/>
			<PinRef compName="R26" pinName="2"/>
			<PinRef compName="R32" pinName="1"/>
			<PinRef compName="DA10" pinName="2"/>
		</Net>
		<Net name="G">
			<PinRef compName="VD6" pinName="2"/>
			<PinRef compName="VD20" pinName="2"/>
			<PinRef compName="VD23" pinName="2"/>
			<PinRef compName="C6" pinName="2"/>
			<PinRef compName="R3" pinName="1"/>
			<PinRef compName="VT12" pinName="1"/>
			<PinRef compName="VD16" pinName="1"/>
			<PinRef compName="VD17" pinName="2"/>
			<PinRef compName="C8" pinName="1"/>
			<PinRef compName="C4" pinName="2"/>
			<PinRef compName="XC00000" pinName="1"/>
			<PinRef compName="C1" pinName="1"/>
			<PinRef compName="VT10" pinName="1"/>
			<PinRef compName="XC00001" pinName="1"/>
			<PinRef compName="SA1" pinName="1"/>
			<PinRef compName="XC00002" pinName="1"/>
			<PinRef compName="D1" pinName="7"/>
			<PinRef compName="R12" pinName="1"/>
			<PinRef compName="D3" pinName="7"/>
			<PinRef compName="VD7" pinName="2"/>
			<PinRef compName="VD21" pinName="2"/>
			<PinRef compName="R5" pinName="2"/>
			<PinRef compName="D2" pinName="7"/>
			<PinRef compName="VD8" pinName="2"/>
			<PinRef compName="VD9" pinName="2"/>
			<PinRef compName="D8" pinName="8"/>
			<PinRef compName="VD22" pinName="2"/>
			<PinRef compName="VD26" pinName="2"/>
			<PinRef compName="R20" pinName="1"/>
			<PinRef compName="XC00003" pinName="1"/>
			<PinRef compName="8" pinName="1"/>
			<PinRef compName="SA3" pinName="1"/>
			<PinRef compName="SA4" pinName="2"/>
			<PinRef compName="SA2" pinName="1"/>
			<PinRef compName="VT7" pinName="1"/>
			<PinRef compName="C5" pinName="2"/>
			<PinRef compName="R19" pinName="2"/>
			<PinRef compName="VT11" pinName="1"/>
			<PinRef compName="R22" pinName="1"/>
			<PinRef compName="C3" pinName="1"/>
			<PinRef compName="VD19" pinName="1"/>
			<PinRef compName="C7" pinName="1"/>
			<PinRef compName="VD25" pinName="1"/>
			<PinRef compName="C11" pinName="2"/>
			<PinRef compName="D6" pinName="7"/>
			<PinRef compName="DA10" pinName="3"/>
			<PinRef compName="D5" pinName="8"/>
			<PinRef compName="C2" pinName="2"/>
			<PinRef compName="C10" pinName="1"/>
			<PinRef compName="D4" pinName="8"/>
			<PinRef compName="D7" pinName="8"/>
			<PinRef compName="D7" pinName="13"/>
			<PinRef compName="DA9" pinName="3"/>
			<PinRef compName="R21" pinName="1"/>
			<PinRef compName="R23" pinName="1"/>
		</Net>
		<Net name="UN000084">
			<PinRef compName="R35" pinName="1"/>
			<PinRef compName="R34" pinName="2"/>
		</Net>
		<Net name="UN000078">
			<PinRef compName="R56" pinName="2"/>
			<PinRef compName="VD16" pinName="2"/>
			<PinRef compName="VD17" pinName="1"/>
			<PinRef compName="R55" pinName="1"/>
			<PinRef compName="R34" pinName="1"/>
			<PinRef compName="DA9" pinName="4"/>
		</Net>
		<Net name="UN000079">
			<PinRef compName="R41" pinName="1"/>
			<PinRef compName="R40" pinName="2"/>
			<PinRef compName="VT12" pinName="3"/>
			<PinRef compName="VD19" pinName="2"/>
		</Net>
		<Net name="UN000080">
			<PinRef compName="R39" pinName="1"/>
			<PinRef compName="DA9" pinName="2"/>
		</Net>
		<Net name="UN000088">
			<PinRef compName="VD24" pinName="2"/>
			<PinRef compName="6" pinName="1"/>
			<PinRef compName="R45" pinName="1"/>
			<PinRef compName="R47" pinName="2"/>
		</Net>
		<Net name="UN000082">
			<PinRef compName="VT12" pinName="2"/>
			<PinRef compName="R38" pinName="2"/>
			<PinRef compName="VD18" pinName="1"/>
			<PinRef compName="DA9" pinName="9"/>
		</Net>
		<Net name="UN000085">
			<PinRef compName="R35" pinName="2"/>
			<PinRef compName="R36" pinName="1"/>
		</Net>
		<Net name="UN000086">
			<PinRef compName="R37" pinName="1"/>
			<PinRef compName="R36" pinName="2"/>
			<PinRef compName="C7" pinName="2"/>
		</Net>
		<Net name="UN000087">
			<PinRef compName="9" pinName="1"/>
			<PinRef compName="R37" pinName="2"/>
		</Net>
		<Net name="+5V">
			<PinRef compName="R51" pinName="2"/>
			<PinRef compName="VT5" pinName="2"/>
			<PinRef compName="VT3" pinName="2"/>
			<PinRef compName="R53" pinName="1"/>
			<PinRef compName="4" pinName="1"/>
			<PinRef compName="R50" pinName="2"/>
			<PinRef compName="R41" pinName="2"/>
			<PinRef compName="R6" pinName="1"/>
			<PinRef compName="VT6" pinName="2"/>
			<PinRef compName="VD10" pinName="1"/>
			<PinRef compName="R49" pinName="2"/>
			<PinRef compName="R13" pinName="2"/>
			<PinRef compName="D1" pinName="14"/>
			<PinRef compName="R4" pinName="1"/>
			<PinRef compName="VT1" pinName="2"/>
			<PinRef compName="D3" pinName="14"/>
			<PinRef compName="VT4" pinName="2"/>
			<PinRef compName="D2" pinName="14"/>
			<PinRef compName="D8" pinName="7"/>
			<PinRef compName="D8" pinName="15"/>
			<PinRef compName="D8" pinName="16"/>
			<PinRef compName="VT2" pinName="2"/>
			<PinRef compName="R38" pinName="1"/>
			<PinRef compName="R20" pinName="2"/>
			<PinRef compName="Q1" pinName="2"/>
			<PinRef compName="R28" pinName="1"/>
			<PinRef compName="R16" pinName="2"/>
			<PinRef compName="VD12" pinName="2"/>
			<PinRef compName="D6" pinName="14"/>
			<PinRef compName="DA10" pinName="7"/>
			<PinRef compName="R44" pinName="2"/>
			<PinRef compName="R43" pinName="2"/>
			<PinRef compName="D5" pinName="16"/>
			<PinRef compName="C10" pinName="2"/>
			<PinRef compName="D4" pinName="16"/>
			<PinRef compName="D7" pinName="16"/>
			<PinRef compName="DA9" pinName="11"/>
		</Net>
		<Net name="UN000089">
			<PinRef compName="VT9" pinName="3"/>
			<PinRef compName="R46" pinName="2"/>
			<PinRef compName="R45" pinName="2"/>
		</Net>
		<Net name="UN000090">
			<PinRef compName="VD24" pinName="1"/>
			<PinRef compName="VT8" pinName="2"/>
		</Net>
		<Net name="UN000091">
			<PinRef compName="VT8" pinName="1"/>
			<PinRef compName="R44" pinName="1"/>
		</Net>
		<Net name="UN000092">
			<PinRef compName="R42" pinName="2"/>
			<PinRef compName="VT8" pinName="3"/>
			<PinRef compName="R43" pinName="1"/>
		</Net>
		<Net name="UN000093">
			<PinRef compName="VT9" pinName="2"/>
			<PinRef compName="R49" pinName="1"/>
			<PinRef compName="VT10" pinName="3"/>
			<PinRef compName="R52" pinName="2"/>
			<PinRef compName="VD25" pinName="2"/>
		</Net>
		<Net name="UN000094">
			<PinRef compName="R50" pinName="1"/>
			<PinRef compName="VT9" pinName="1"/>
			<PinRef compName="R48" pinName="2"/>
		</Net>
		<Net name="UN000095">
			<PinRef compName="R51" pinName="1"/>
			<PinRef compName="VT10" pinName="2"/>
			<PinRef compName="D2" pinName="11"/>
		</Net>
		<Net name="UN000096">
			<PinRef compName="R54" pinName="1"/>
			<PinRef compName="D2" pinName="10"/>
			<PinRef compName="R52" pinName="1"/>
			<PinRef compName="VD27" pinName="2"/>
		</Net>
		<Net name="UN000097">
			<PinRef compName="R54" pinName="2"/>
			<PinRef compName="VT11" pinName="3"/>
		</Net>
		<Net name="UN000098">
			<PinRef compName="R53" pinName="2"/>
			<PinRef compName="VD26" pinName="1"/>
			<PinRef compName="VT11" pinName="2"/>
		</Net>
		<Net name="-12V">
			<PinRef compName="R39" pinName="2"/>
			<PinRef compName="R40" pinName="1"/>
			<PinRef compName="R46" pinName="1"/>
			<PinRef compName="5" pinName="1"/>
			<PinRef compName="R47" pinName="1"/>
			<PinRef compName="R48" pinName="1"/>
			<PinRef compName="C11" pinName="1"/>
			<PinRef compName="DA10" pinName="4"/>
			<PinRef compName="DA9" pinName="6"/>
		</Net>
		<Net name="NEW1">
			<PinRef compName="10" pinName="1"/>
			<PinRef compName="R33" pinName="2"/>
			<PinRef compName="R55" pinName="2"/>
		</Net>
		<Net name="NEW2">
			<PinRef compName="R56" pinName="1"/>
			<PinRef compName="11" pinName="1"/>
		</Net>
	</NetList>

	<Groups version="1.1">
		<NetGroups>
			<NetGroup name="WD10000">
				<NetRef name="UN000087"/>
				<NetRef name="UN000086"/>
				<NetRef name="UN000085"/>
				<NetRef name="UN000084"/>
			</NetGroup>
			<NetGroup name="WD15000">
				<NetRef name="-12V"/>
				<NetRef name="+5V"/>
				<NetRef name="G"/>
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
				<NetRef name="G"/>
				<NetRef name="+5V"/>
			</ExcludedNets>
		</SignalSearchSettings>
	</HiSpeedRules>

	<Rules version="2.0">
		<RulesWidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.4" widthNom="0.4">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.4" widthNom="1">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="WD10000"/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.4" widthNom="1.5">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="WD15000"/>
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
		<RulesClearancesToBoard wires="0.1" comps="0.1"/>
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
				<NetRef name="UN000000"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000001"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000002"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000003"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000007"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000004"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000005"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000006"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000011"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000010"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000008"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000009"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000034"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000022"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000012"/>
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
				<NetRef name="UN000017"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000013"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000014"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000015"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000016"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000018"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000019"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000020"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000021"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000031"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000023"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000024"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000025"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000026"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000027"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000028"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000029"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000030"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000038"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000046"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000033"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000035"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000036"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000037"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000062"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000039"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000040"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000041"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000042"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000077"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000044"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000045"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000047"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000048"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000083"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000057"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000058"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000059"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000061"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000063"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000064"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000065"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000066"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000067"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000068"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000069"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000070"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000071"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000072"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000073"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000074"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000075"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000076"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="G"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000084"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000078"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000079"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000080"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000088"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000082"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000085"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000086"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000087"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+5V"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000089"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000090"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000091"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000092"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000093"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000094"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000095"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000096"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000097"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="UN000098"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-12V"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NEW1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NEW2"/>
			</NetProperty>
		</NetProperties>
		<PadConnectSettings mode="AutoConnect"/>
	</Rules>

	<Connectivity version="1.3">
		<Vias>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000082"/>
				<Org x="144.15" y="91.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="130.4" y="69.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000088"/>
				<Org x="137.9" y="54.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="91.65" y="99.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000062"/>
				<Org x="75.4" y="75.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000022"/>
				<Org x="69.15" y="76.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000058"/>
				<Org x="82.9" y="46.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="46.65" y="99.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000062"/>
				<Org x="54.15" y="75.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="60.4" y="61.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="130.4" y="107.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="-12V"/>
				<Org x="137.9" y="97.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="130.4" y="62.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="145.4" y="55.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000078"/>
				<Org x="130.4" y="55.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000078"/>
				<Org x="129.15" y="47.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000079"/>
				<Org x="136.65" y="51.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000093"/>
				<Org x="137.9" y="39.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000007"/>
				<Org x="99.15" y="74.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000077"/>
				<Org x="121.65" y="49.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="2"/>
				<Org x="106.65" y="31.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000063"/>
				<Org x="75.4" y="101.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000057"/>
				<Org x="84.15" y="100.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000024"/>
				<Org x="75.4" y="85.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="NEW2"/>
				<Org x="91.65" y="89.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000023"/>
				<Org x="76.65" y="87.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000045"/>
				<Org x="84.15" y="74.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000045"/>
				<Org x="69.15" y="74.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000011"/>
				<Org x="84.15" y="66.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000058"/>
				<Org x="82.9" y="59.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000058"/>
				<Org x="67.9" y="59.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000011"/>
				<Org x="84.15" y="41.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000058"/>
				<Org x="37.9" y="95.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000058"/>
				<Org x="37.9" y="72.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="60.4" y="41.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000001"/>
				<Org x="45.4" y="40.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="52.9" y="35.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000021"/>
				<Org x="37.9" y="36.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="60.4" y="27.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000035"/>
				<Org x="140.4" y="54.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000088"/>
				<Org x="132.9" y="54.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000035"/>
				<Org x="134.15" y="61.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="-12V"/>
				<Org x="135.4" y="46.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000083"/>
				<Org x="127.9" y="76.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000076"/>
				<Org x="120.4" y="75.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000015"/>
				<Org x="109.15" y="75.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000076"/>
				<Org x="112.9" y="76.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="4"/>
				<Org x="109.15" y="46.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000093"/>
				<Org x="112.9" y="52.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000015"/>
				<Org x="102.9" y="75.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000045"/>
				<Org x="105.4" y="76.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000020"/>
				<Org x="102.9" y="54.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000062"/>
				<Org x="95.4" y="75.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="4"/>
				<Org x="97.9" y="46.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000082"/>
				<Org x="90.4" y="91.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000064"/>
				<Org x="86.65" y="76.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000012"/>
				<Org x="85.4" y="37.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="87.9" y="54.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000022"/>
				<Org x="77.9" y="76.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000064"/>
				<Org x="80.4" y="76.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000063"/>
				<Org x="81.65" y="69.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000003"/>
				<Org x="70.4" y="46.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000004"/>
				<Org x="74.15" y="60.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="56.65" y="84.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000010"/>
				<Org x="49.15" y="67.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="50.4" y="91.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000042"/>
				<Org x="50.4" y="76.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000003"/>
				<Org x="50.4" y="37.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="34.15" y="91.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000082"/>
				<Org x="146.65" y="62.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000006"/>
				<Org x="141.65" y="92.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000078"/>
				<Org x="142.9" y="55.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000036"/>
				<Org x="142.9" y="35.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000088"/>
				<Org x="131.65" y="110.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000035"/>
				<Org x="134.15" y="77.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="134.15" y="80.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000082"/>
				<Org x="135.4" y="64.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000079"/>
				<Org x="132.9" y="51.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000083"/>
				<Org x="127.9" y="100.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="-12V"/>
				<Org x="124.15" y="97.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000006"/>
				<Org x="126.65" y="95.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000064"/>
				<Org x="126.65" y="87.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000091"/>
				<Org x="125.4" y="70.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000005"/>
				<Org x="127.9" y="70.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="124.15" y="62.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="125.4" y="56.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000005"/>
				<Org x="127.9" y="55.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000088"/>
				<Org x="120.4" y="110.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="NEW1"/>
				<Org x="119.15" y="90.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="NEW2"/>
				<Org x="116.65" y="89.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="115.4" y="79.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="115.4" y="59.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="115.4" y="44.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="115.4" y="34.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="115.4" y="29.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="110.4" y="107.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000063"/>
				<Org x="111.65" y="74.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000013"/>
				<Org x="111.65" y="47.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000093"/>
				<Org x="112.9" y="39.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000008"/>
				<Org x="101.65" y="49.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="3"/>
				<Org x="104.15" y="49.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000017"/>
				<Org x="100.4" y="39.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="102.9" y="34.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="94.15" y="110.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="94.15" y="104.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="NEW1"/>
				<Org x="97.9" y="90.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="92.9" y="72.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="92.9" y="62.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000097"/>
				<Org x="95.4" y="55.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000011"/>
				<Org x="95.4" y="41.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000064"/>
				<Org x="86.65" y="102.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000064"/>
				<Org x="86.65" y="87.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000057"/>
				<Org x="89.15" y="77.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="87.9" y="62.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000008"/>
				<Org x="90.4" y="50.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="87.9" y="44.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000021"/>
				<Org x="90.4" y="36.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="87.9" y="34.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000011"/>
				<Org x="80.4" y="66.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000096"/>
				<Org x="70.4" y="57.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000033"/>
				<Org x="72.9" y="56.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000033"/>
				<Org x="71.65" y="40.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="65.4" y="55.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="65.4" y="47.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="65.4" y="39.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000001"/>
				<Org x="55.4" y="40.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000036"/>
				<Org x="49.15" y="34.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000059"/>
				<Org x="39.15" y="100.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="42.9" y="89.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="40.4" y="66.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="42.9" y="66.65"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="+5V"/>
				<Org x="42.9" y="47.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000059"/>
				<Org x="40.4" y="39.15"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="G"/>
				<Org x="34.15" y="112.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000009"/>
				<Org x="34.15" y="77.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000008"/>
				<Org x="34.15" y="72.9"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000008"/>
				<Org x="34.15" y="50.4"/>
			</Via>
			<Via>
				<ViastackRef name="DYZ15.PS"/>
				<NetRef name="UN000009"/>
				<Org x="35.4" y="42.9"/>
			</Via>
		</Vias>
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000000"/>
				<Subwire width="0.4">
					<Start x="47.9" y="44.15"/>
					<TrackLine>
						<End x="47.9" y="37.9"/>
					</TrackLine>
					<TrackLine>
						<End x="46.65" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000000"/>
				<Subwire width="0.4">
					<Start x="45.4" y="30.4"/>
					<TrackLine>
						<End x="46.65" y="31.65"/>
					</TrackLine>
					<TrackLine>
						<End x="46.65" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000000"/>
				<Subwire width="0.4">
					<Start x="46.65" y="36.65"/>
					<TrackLine>
						<End x="45.4" y="37.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000001"/>
				<Subwire width="0.4">
					<Start x="45.4" y="40.4"/>
					<TrackLine>
						<End x="45.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000001"/>
				<Subwire width="0.4">
					<Start x="57.9" y="34.15"/>
					<TrackLine>
						<End x="55.4" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000001"/>
				<Subwire width="0.4">
					<Start x="55.4" y="30.4"/>
					<TrackLine>
						<End x="55.4" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000001"/>
				<Subwire width="0.4">
					<Start x="55.4" y="34.15"/>
					<TrackLine>
						<End x="55.4" y="40.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000002"/>
				<Subwire width="0.4">
					<Start x="45.4" y="34.15"/>
					<TrackLine>
						<End x="42.9" y="36.65"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000002"/>
				<Subwire width="0.4">
					<Start x="42.9" y="41.65"/>
					<TrackLine>
						<End x="42.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000003"/>
				<Subwire width="0.4">
					<Start x="70.4" y="51.65"/>
					<TrackLine>
						<End x="70.4" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000003"/>
				<Subwire width="0.4">
					<Start x="50.4" y="44.15"/>
					<TrackLine>
						<End x="50.4" y="37.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000007"/>
				<Subwire width="0.4">
					<Start x="99.15" y="74.15"/>
					<TrackLine>
						<End x="99.15" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="97.9" y="69.15"/>
					</TrackLine>
					<TrackLine>
						<End x="97.9" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000004"/>
				<Subwire width="0.4">
					<Start x="74.15" y="60.4"/>
					<TrackLine>
						<End x="74.15" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000005"/>
				<Subwire width="0.4">
					<Start x="127.9" y="55.4"/>
					<TrackLine>
						<End x="129.15" y="56.65"/>
					</TrackLine>
					<TrackLine>
						<End x="129.15" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9" y="69.15"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9" y="70.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000006"/>
				<Subwire width="0.4">
					<Start x="125.4" y="112.9"/>
					<TrackLine>
						<End x="125.4" y="96.65"/>
					</TrackLine>
					<TrackLine>
						<End x="126.65" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000006"/>
				<Subwire width="0.4">
					<Start x="141.65" y="92.9"/>
					<TrackLine>
						<End x="141.65" y="84.15"/>
					</TrackLine>
					<TrackLine>
						<End x="144.15" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="144.15" y="80.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="77.9" y="66.65"/>
					<TrackLine>
						<End x="77.9" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="80.4" y="71.65"/>
					<TrackLine>
						<End x="80.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="97.9" y="36.65"/>
					<TrackLine>
						<End x="95.4" y="39.15"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="84.15" y="41.65"/>
					<TrackLine>
						<End x="84.15" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000010"/>
				<Subwire width="0.4">
					<Start x="49.15" y="67.9"/>
					<TrackLine>
						<End x="49.15" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000010"/>
				<Subwire width="0.4">
					<Start x="107.9" y="66.65"/>
					<TrackLine>
						<End x="107.9" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000010"/>
				<Subwire width="0.4">
					<Start x="107.9" y="69.15"/>
					<TrackLine>
						<End x="106.65" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="106.65" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="107.9" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="57.9" y="51.65"/>
					<TrackLine>
						<End x="56.65" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="56.65" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="54.15" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="85.4" y="79.15"/>
					<TrackLine>
						<End x="85.4" y="75.4"/>
					</TrackLine>
					<TrackLine>
						<End x="86.65" y="75.4"/>
					</TrackLine>
					<TrackLine>
						<End x="89.15" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="89.15" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="90.4" y="51.65"/>
					</TrackLine>
					<TrackLine>
						<End x="90.4" y="50.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="100.4" y="36.65"/>
					<TrackLine>
						<End x="101.65" y="37.9"/>
					</TrackLine>
					<TrackLine>
						<End x="101.65" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="34.15" y="72.9"/>
					<TrackLine>
						<End x="34.15" y="50.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000009"/>
				<Subwire width="0.4">
					<Start x="34.15" y="77.9"/>
					<TrackLine>
						<End x="35.4" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="35.4" y="42.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000009"/>
				<Subwire width="0.4">
					<Start x="55.4" y="44.15"/>
					<TrackLine>
						<End x="55.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000034"/>
				<Subwire width="0.4">
					<Start x="147.9" y="36.65"/>
					<TrackLine>
						<End x="145.4" y="39.15"/>
					</TrackLine>
					<TrackLine>
						<End x="144.15" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000034"/>
				<Subwire width="0.4">
					<Start x="144.15" y="39.15"/>
					<TrackLine>
						<End x="144.15" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000022"/>
				<Subwire width="0.4">
					<Start x="69.15" y="76.65"/>
					<TrackLine>
						<End x="69.15" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4" y="87.9"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000022"/>
				<Subwire width="0.4">
					<Start x="77.9" y="71.65"/>
					<TrackLine>
						<End x="77.9" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000012"/>
				<Subwire width="0.4">
					<Start x="85.4" y="37.9"/>
					<TrackLine>
						<End x="86.65" y="39.15"/>
					</TrackLine>
					<TrackLine>
						<End x="86.65" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="85.4" y="56.65"/>
					</TrackLine>
					<TrackLine>
						<End x="85.4" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="2"/>
				<Subwire width="0.4">
					<Start x="107.9" y="44.15"/>
					<TrackLine>
						<End x="106.65" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="106.65" y="31.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3"/>
				<Subwire width="0.4">
					<Start x="104.15" y="49.15"/>
					<TrackLine>
						<End x="104.15" y="32.9"/>
					</TrackLine>
					<TrackLine>
						<End x="102.9" y="31.65"/>
					</TrackLine>
					<TrackLine>
						<End x="102.9" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="4"/>
				<Subwire width="0.4">
					<Start x="97.9" y="46.65"/>
					<TrackLine>
						<End x="97.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="4"/>
				<Subwire width="0.4">
					<Start x="110.4" y="29.15"/>
					<TrackLine>
						<End x="109.15" y="30.4"/>
					</TrackLine>
					<TrackLine>
						<End x="109.15" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000017"/>
				<Subwire width="0.4">
					<Start x="100.4" y="44.15"/>
					<TrackLine>
						<End x="100.4" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000013"/>
				<Subwire width="0.4">
					<Start x="111.65" y="47.9"/>
					<TrackLine>
						<End x="111.65" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="110.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000014"/>
				<Subwire width="0.4">
					<Start x="105.4" y="71.65"/>
					<TrackLine>
						<End x="104.15" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="106.65" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="106.65" y="45.4"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000015"/>
				<Subwire width="0.4">
					<Start x="102.9" y="75.4"/>
					<TrackLine>
						<End x="102.9" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000015"/>
				<Subwire width="0.4">
					<Start x="110.4" y="51.65"/>
					<TrackLine>
						<End x="109.15" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="109.15" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000016"/>
				<Subwire width="0.4">
					<Start x="100.4" y="79.15"/>
					<TrackLine>
						<End x="101.65" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="101.65" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="100.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1"/>
				<Subwire width="0.4">
					<Start x="97.9" y="44.15"/>
					<TrackLine>
						<End x="99.15" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="100.4" y="34.15"/>
					</TrackLine>
					<TrackLine>
						<End x="100.4" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000019"/>
				<Subwire width="0.4">
					<Start x="105.4" y="56.65"/>
					<TrackLine>
						<End x="104.15" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000020"/>
				<Subwire width="0.4">
					<Start x="102.9" y="51.65"/>
					<TrackLine>
						<End x="102.9" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="97.9" y="56.65"/>
					<TrackLine>
						<End x="97.9" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="97.9" y="54.15"/>
					<TrackLine>
						<End x="96.65" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="97.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="97.9" y="41.65"/>
					<TrackLine>
						<End x="97.9" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="36.65" y="79.15"/>
					<TrackLine>
						<End x="36.65" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="37.9" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="37.9" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="90.4" y="39.15"/>
					<TrackLine>
						<End x="90.4" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000023"/>
				<Subwire width="0.4">
					<Start x="75.4" y="71.65"/>
					<TrackLine>
						<End x="76.65" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="76.65" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000024"/>
				<Subwire width="0.4">
					<Start x="72.9" y="71.65"/>
					<TrackLine>
						<End x="74.15" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="74.15" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000027"/>
				<Subwire width="0.4">
					<Start x="64.15" y="95.4"/>
					<TrackLine>
						<End x="66.65" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4" y="92.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000046"/>
				<Subwire width="0.4">
					<Start x="80.4" y="37.9"/>
					<TrackLine>
						<End x="80.4" y="34.15"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000046"/>
				<Subwire width="0.4">
					<Start x="77.9" y="34.15"/>
					<TrackLine>
						<End x="75.4" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000046"/>
				<Subwire width="0.4">
					<Start x="75.4" y="34.15"/>
					<TrackLine>
						<End x="72.9" y="31.65"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9" y="30.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000033"/>
				<Subwire width="0.4">
					<Start x="71.65" y="40.4"/>
					<TrackLine>
						<End x="71.65" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000033"/>
				<Subwire width="0.4">
					<Start x="72.9" y="56.65"/>
					<TrackLine>
						<End x="71.65" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="71.65" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9" y="96.65"/>
					</TrackLine>
					<TrackLine>
						<End x="74.15" y="97.9"/>
					</TrackLine>
					<TrackLine>
						<End x="74.15" y="102.9"/>
					</TrackLine>
					<TrackLine>
						<End x="79.15" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="79.15" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9" y="112.9"/>
					</TrackLine>
					<TrackLine>
						<End x="85.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000035"/>
				<Subwire width="0.4">
					<Start x="140.4" y="59.15"/>
					<TrackLine>
						<End x="140.4" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000035"/>
				<Subwire width="0.4">
					<Start x="134.15" y="61.65"/>
					<TrackLine>
						<End x="134.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000036"/>
				<Subwire width="0.4">
					<Start x="144.15" y="49.15"/>
					<TrackLine>
						<End x="144.15" y="44.15"/>
					</TrackLine>
					<TrackLine>
						<End x="142.9" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="142.9" y="35.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000036"/>
				<Subwire width="0.4">
					<Start x="49.15" y="34.15"/>
					<TrackLine>
						<End x="49.15" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="47.9" y="54.15"/>
					</TrackLine>
					<TrackLine>
						<End x="47.9" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000037"/>
				<Subwire width="0.4">
					<Start x="45.4" y="51.65"/>
					<TrackLine>
						<End x="45.4" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000037"/>
				<Subwire width="0.4">
					<Start x="45.4" y="54.15"/>
					<TrackLine>
						<End x="45.4" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000037"/>
				<Subwire width="0.4">
					<Start x="45.4" y="57.9"/>
					<TrackLine>
						<End x="45.4" y="60.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000062"/>
				<Subwire width="0.4">
					<Start x="60.4" y="101.65"/>
					<TrackLine>
						<End x="56.65" y="101.65"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="54.15" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="54.15" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000062"/>
				<Subwire width="0.4">
					<Start x="75.4" y="75.4"/>
					<TrackLine>
						<End x="75.4" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000062"/>
				<Subwire width="0.4">
					<Start x="96.65" y="84.15"/>
					<TrackLine>
						<End x="96.65" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000039"/>
				<Subwire width="0.4">
					<Start x="57.9" y="57.9"/>
					<TrackLine>
						<End x="56.65" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000039"/>
				<Subwire width="0.4">
					<Start x="52.9" y="51.65"/>
					<TrackLine>
						<End x="52.9" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="56.65" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000039"/>
				<Subwire width="0.4">
					<Start x="56.65" y="57.9"/>
					<TrackLine>
						<End x="56.65" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000040"/>
				<Subwire width="0.4">
					<Start x="42.9" y="69.15"/>
					<TrackLine>
						<End x="45.4" y="69.15"/>
					</TrackLine>
					<TrackLine>
						<End x="47.9" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000041"/>
				<Subwire width="0.4">
					<Start x="50.4" y="65.4"/>
					<TrackLine>
						<End x="50.4" y="66.65"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000041"/>
				<Subwire width="0.4">
					<Start x="52.9" y="69.15"/>
					<TrackLine>
						<End x="52.9" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000041"/>
				<Subwire width="0.4">
					<Start x="55.4" y="69.15"/>
					<TrackLine>
						<End x="52.9" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000042"/>
				<Subwire width="0.4">
					<Start x="50.4" y="76.65"/>
					<TrackLine>
						<End x="50.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000077"/>
				<Subwire width="0.4">
					<Start x="117.9" y="29.15"/>
					<TrackLine>
						<End x="117.9" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="121.65" y="39.15"/>
					</TrackLine>
					<TrackLine>
						<End x="121.65" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000077"/>
				<Subwire width="0.4">
					<Start x="121.65" y="41.65"/>
					<TrackLine>
						<End x="121.65" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000045"/>
				<Subwire width="0.4">
					<Start x="69.15" y="74.15"/>
					<TrackLine>
						<End x="69.15" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000045"/>
				<Subwire width="0.4">
					<Start x="105.4" y="76.65"/>
					<TrackLine>
						<End x="104.15" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="101.65" y="84.15"/>
					</TrackLine>
					<TrackLine>
						<End x="101.65" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="102.9" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="102.9" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="102.15" y="99.9"/>
					</TrackLine>
					<TrackLine>
						<End x="102.15" y="104.15"/>
					</TrackLine>
					<TrackLine>
						<End x="102.9" y="104.9"/>
					</TrackLine>
					<TrackLine>
						<End x="102.9" y="110.4"/>
					</TrackLine>
					<TrackLine>
						<End x="100.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000045"/>
				<Subwire width="0.4">
					<Start x="84.15" y="84.15"/>
					<TrackLine>
						<End x="84.15" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000045"/>
				<Subwire width="0.4">
					<Start x="69.15" y="69.15"/>
					<TrackLine>
						<End x="69.15" y="45.4"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000045"/>
				<Subwire width="0.4">
					<Start x="67.9" y="69.15"/>
					<TrackLine>
						<End x="69.15" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000047"/>
				<Subwire width="0.4">
					<Start x="67.9" y="37.9"/>
					<TrackLine>
						<End x="67.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000047"/>
				<Subwire width="0.4">
					<Start x="67.9" y="41.65"/>
					<TrackLine>
						<End x="67.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000048"/>
				<Subwire width="0.4">
					<Start x="75.4" y="44.15"/>
					<TrackLine>
						<End x="77.9" y="41.65"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000048"/>
				<Subwire width="0.4">
					<Start x="80.4" y="41.65"/>
					<TrackLine>
						<End x="82.9" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000083"/>
				<Subwire width="0.4">
					<Start x="127.9" y="76.65"/>
					<TrackLine>
						<End x="127.9" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="129.15" y="82.9"/>
					</TrackLine>
					<TrackLine>
						<End x="129.15" y="86.65"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9" y="87.9"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="84.15" y="91.65"/>
					<TrackLine>
						<End x="84.15" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="84.15" y="95.4"/>
					<TrackLine>
						<End x="84.15" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="89.15" y="77.9"/>
					<TrackLine>
						<End x="89.15" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="87.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="67.9" y="71.65"/>
					<TrackLine>
						<End x="66.65" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="66.65" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="59.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="82.9" y="46.65"/>
					<TrackLine>
						<End x="82.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="82.9" y="51.65"/>
					<TrackLine>
						<End x="82.9" y="59.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="37.9" y="72.9"/>
					<TrackLine>
						<End x="37.9" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000059"/>
				<Subwire width="0.4">
					<Start x="80.4" y="44.15"/>
					<TrackLine>
						<End x="80.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000059"/>
				<Subwire width="0.4">
					<Start x="39.15" y="100.4"/>
					<TrackLine>
						<End x="39.15" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4" y="49.15"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000063"/>
				<Subwire width="0.4">
					<Start x="111.65" y="74.15"/>
					<TrackLine>
						<End x="111.65" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="109.15" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000063"/>
				<Subwire width="0.4">
					<Start x="75.4" y="101.65"/>
					<TrackLine>
						<End x="75.4" y="91.65"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000063"/>
				<Subwire width="0.4">
					<Start x="77.9" y="79.15"/>
					<TrackLine>
						<End x="79.15" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="79.15" y="75.4"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000064"/>
				<Subwire width="0.4">
					<Start x="80.4" y="79.15"/>
					<TrackLine>
						<End x="80.4" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000064"/>
				<Subwire width="0.4">
					<Start x="126.65" y="84.15"/>
					<TrackLine>
						<End x="126.65" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000064"/>
				<Subwire width="0.4">
					<Start x="86.65" y="76.65"/>
					<TrackLine>
						<End x="86.65" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000064"/>
				<Subwire width="0.4">
					<Start x="86.65" y="87.9"/>
					<TrackLine>
						<End x="86.65" y="102.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000065"/>
				<Subwire width="0.4">
					<Start x="56.65" y="95.4"/>
					<TrackLine>
						<End x="59.15" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4" y="96.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000066"/>
				<Subwire width="0.4">
					<Start x="66.65" y="95.4"/>
					<TrackLine>
						<End x="69.15" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4" y="96.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000071"/>
				<Subwire width="0.4">
					<Start x="76.65" y="95.4"/>
					<TrackLine>
						<End x="79.15" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="96.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000075"/>
				<Subwire width="0.4">
					<Start x="114.15" y="94.15"/>
					<TrackLine>
						<End x="111.65" y="96.65"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="109.15" y="101.65"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="121.65" y="29.15"/>
					<TrackLine>
						<End x="121.65" y="34.15"/>
					</TrackLine>
					<TrackLine>
						<End x="124.15" y="36.65"/>
					</TrackLine>
					<TrackLine>
						<End x="124.15" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="125.4" y="44.15"/>
					<TrackLine>
						<End x="125.4" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="124.15" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="124.15" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="121.65" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="121.65" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="120.4" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="120.4" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="112.9" y="76.65"/>
					<TrackLine>
						<End x="114.15" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="114.15" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="42.9" y="61.65"/>
					<TrackLine>
						<End x="42.9" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="57.9" y="71.65"/>
					<TrackLine>
						<End x="57.9" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="56.65" y="74.15"/>
					</TrackLine>
					<TrackLine>
						<End x="56.65" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="87.9" y="34.15"/>
					<TrackLine>
						<End x="87.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="87.9" y="44.15"/>
					<TrackLine>
						<End x="87.9" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="87.9" y="54.15"/>
					<TrackLine>
						<End x="87.9" y="62.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="87.9" y="62.9"/>
					<TrackLine>
						<End x="87.9" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="87.9" y="66.65"/>
					<TrackLine>
						<End x="87.9" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="85.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="102.9" y="34.15"/>
					<TrackLine>
						<End x="102.9" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="100.4" y="104.15"/>
					<TrackLine>
						<End x="100.4" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="130.4" y="112.9"/>
					<TrackLine>
						<End x="134.15" y="112.9"/>
					</TrackLine>
					<TrackLine>
						<End x="134.15" y="107.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="134.15" y="107.9"/>
					<TrackLine>
						<End x="134.15" y="102.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="134.15" y="102.9"/>
					<TrackLine>
						<End x="134.15" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="134.15" y="100.4"/>
					<TrackLine>
						<End x="134.15" y="80.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="147.9" y="67.9"/>
					<TrackLine>
						<End x="147.9" y="65.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="52.9" y="35.4"/>
					<TrackLine>
						<End x="52.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="50.4" y="84.15"/>
					<TrackLine>
						<End x="50.4" y="91.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="50.4" y="91.65"/>
					<TrackLine>
						<End x="50.4" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="94.15" y="104.15"/>
					<TrackLine>
						<End x="94.15" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="59.15"/>
					<TrackLine>
						<End x="115.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="44.15"/>
					<TrackLine>
						<End x="115.4" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="34.15"/>
					<TrackLine>
						<End x="115.4" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="29.15"/>
					<TrackLine>
						<End x="112.9" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="71.65"/>
					<TrackLine>
						<End x="115.4" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="150.4" y="30.4"/>
					<TrackLine>
						<End x="149.15" y="29.15"/>
					</TrackLine>
					<TrackLine>
						<End x="144.15" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="34.15" y="91.65"/>
					<TrackLine>
						<End x="34.15" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="34.15" y="112.9"/>
					<TrackLine>
						<End x="36.65" y="112.9"/>
					</TrackLine>
					<TrackLine>
						<End x="39.15" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="59.15"/>
					<TrackLine>
						<End x="115.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="145.4" y="65.4"/>
					<TrackLine>
						<End x="145.4" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="146.65" y="59.15"/>
					</TrackLine>
					<TrackLine>
						<End x="146.65" y="56.65"/>
					</TrackLine>
					<TrackLine>
						<End x="145.4" y="55.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="60.4" y="44.15"/>
					<TrackLine>
						<End x="57.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="59.15"/>
					<TrackLine>
						<End x="112.9" y="59.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="71.65"/>
					<TrackLine>
						<End x="112.9" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="60.4" y="44.15"/>
					<TrackLine>
						<End x="60.4" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="60.4" y="61.65"/>
					<TrackLine>
						<End x="60.4" y="65.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="60.4" y="65.4"/>
					<TrackLine>
						<End x="60.4" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="60.4" y="27.9"/>
					<TrackLine>
						<End x="60.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="60.4" y="41.65"/>
					<TrackLine>
						<End x="60.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000084"/>
				<Subwire width="1">
					<Start x="152.9" y="70.4"/>
					<TrackLine>
						<End x="152.9" y="72.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="130.4" y="59.15"/>
					<TrackLine>
						<End x="130.4" y="55.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="130.4" y="55.4"/>
					<TrackLine>
						<End x="129.15" y="54.15"/>
					</TrackLine>
					<TrackLine>
						<End x="129.15" y="47.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="142.9" y="55.4"/>
					<TrackLine>
						<End x="144.15" y="54.15"/>
					</TrackLine>
					<TrackLine>
						<End x="146.65" y="54.15"/>
					</TrackLine>
					<TrackLine>
						<End x="147.9" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="147.9" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="152.9" y="57.9"/>
					<TrackLine>
						<End x="152.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000079"/>
				<Subwire width="0.4">
					<Start x="136.65" y="51.65"/>
					<TrackLine>
						<End x="136.65" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="139.15" y="60.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000079"/>
				<Subwire width="0.4">
					<Start x="132.9" y="41.65"/>
					<TrackLine>
						<End x="132.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000079"/>
				<Subwire width="0.4">
					<Start x="139.15" y="60.4"/>
					<TrackLine>
						<End x="139.15" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="140.4" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000079"/>
				<Subwire width="0.4">
					<Start x="145.4" y="57.9"/>
					<TrackLine>
						<End x="142.9" y="60.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000079"/>
				<Subwire width="0.4">
					<Start x="142.9" y="60.4"/>
					<TrackLine>
						<End x="139.15" y="60.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000080"/>
				<Subwire width="0.4">
					<Start x="125.4" y="59.15"/>
					<TrackLine>
						<End x="126.65" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="126.65" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="129.15" y="41.65"/>
					<TrackLine>
						<End x="129.15" y="45.4"/>
					</TrackLine>
					<TrackLine>
						<End x="131.65" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="131.65" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="132.9" y="54.15"/>
					<TrackLine>
						<End x="131.65" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="137.9" y="56.65"/>
					<TrackLine>
						<End x="137.9" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="120.4" y="105.4"/>
					<TrackLine>
						<End x="120.4" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="120.4" y="110.4"/>
					<TrackLine>
						<End x="120.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="131.65" y="54.15"/>
					<TrackLine>
						<End x="131.65" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="135.4" y="66.65"/>
					<TrackLine>
						<End x="135.4" y="64.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="144.15" y="91.65"/>
					<TrackLine>
						<End x="144.15" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="146.65" y="82.9"/>
					</TrackLine>
					<TrackLine>
						<End x="146.65" y="62.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="91.65" y="109.15"/>
					<TrackLine>
						<End x="90.4" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="90.4" y="91.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000085"/>
				<Subwire width="1">
					<Start x="152.9" y="85.4"/>
					<TrackLine>
						<End x="152.9" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000086"/>
				<Subwire width="1">
					<Start x="152.9" y="102.9"/>
					<TrackLine>
						<End x="152.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000087"/>
				<Subwire width="1">
					<Start x="140.4" y="112.9"/>
					<TrackLine>
						<End x="140.4" y="102.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="42.9" y="79.15"/>
					<TrackLine>
						<End x="40.4" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="40.4" y="66.65"/>
					<TrackLine>
						<End x="40.4" y="51.65"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="42.9" y="51.65"/>
					<TrackLine>
						<End x="42.9" y="47.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="65.4" y="34.15"/>
							<Dot x="65.1541" y="34.642"/>
							<Dot x="64.17" y="34.15"/>
							<Dot x="65.1541" y="33.658"/>
						</Teardrop>
					</Teardrops>
					<Start x="65.4" y="34.15"/>
					<TrackLine>
						<End x="62.9" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="65.4" y="51.65"/>
					<TrackLine>
						<End x="65.4" y="47.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="65.4" y="47.9"/>
					<TrackLine>
						<End x="65.4" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="65.4" y="34.15"/>
					<TrackLine>
						<End x="65.4" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="36.65"/>
					<TrackLine>
						<End x="95.4" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="51.65"/>
					<TrackLine>
						<End x="95.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="66.65"/>
					<TrackLine>
						<End x="92.9" y="62.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="62.9"/>
					<TrackLine>
						<End x="92.9" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="57.9"/>
					<TrackLine>
						<End x="92.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="95.4" y="66.65"/>
					<TrackLine>
						<End x="92.9" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="110.4" y="107.9"/>
					<TrackLine>
						<End x="110.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="130.4" y="62.9"/>
					<TrackLine>
						<End x="130.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="130.4" y="66.65"/>
					<TrackLine>
						<End x="130.4" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="130.4" y="69.15"/>
					<TrackLine>
						<End x="130.4" y="107.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="140.4" y="66.65"/>
					<TrackLine>
						<End x="141.65" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="141.65" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="141.65" y="76.65"/>
					<TrackLine>
						<End x="142.9" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="140.4" y="81.65"/>
					<TrackLine>
						<End x="140.4" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="141.65" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="42.9" y="79.15"/>
					<TrackLine>
						<End x="42.9" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="42.9" y="89.15"/>
					<TrackLine>
						<End x="42.9" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="44.15" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="44.15" y="95.4"/>
					<TrackLine>
						<End x="46.65" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="46.65" y="95.4"/>
					<TrackLine>
						<End x="46.65" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="65.4" y="55.4"/>
					<TrackLine>
						<End x="65.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="65.4" y="55.4"/>
					<TrackLine>
						<End x="65.4" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="51.65"/>
					<TrackLine>
						<End x="92.9" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="66.65"/>
					<TrackLine>
						<End x="92.9" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="69.15"/>
					<TrackLine>
						<End x="92.9" y="72.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="72.9"/>
					<TrackLine>
						<End x="92.9" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="91.65" y="99.15"/>
					<TrackLine>
						<End x="91.65" y="96.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="125.4" y="51.65"/>
					<TrackLine>
						<End x="125.4" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="125.4" y="56.65"/>
					<TrackLine>
						<End x="124.15" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="124.15" y="62.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="36.65"/>
					<TrackLine>
						<End x="92.9" y="27.9"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4" y="27.9"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4" y="30.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="65.4" y="30.4"/>
					<TrackLine>
						<End x="65.4" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="65.4" y="51.65"/>
					<TrackLine>
						<End x="67.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000090"/>
				<Subwire width="0.4">
					<Start x="120.4" y="97.9"/>
					<TrackLine>
						<End x="121.65" y="96.65"/>
					</TrackLine>
					<TrackLine>
						<End x="121.65" y="91.65"/>
					</TrackLine>
					<TrackLine>
						<End x="124.15" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="124.15" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000091"/>
				<Subwire width="0.4">
					<Start x="127.9" y="74.15"/>
					<TrackLine>
						<End x="127.9" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4" y="70.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000092"/>
				<Subwire width="0.4">
					<Start x="122.9" y="74.15"/>
					<TrackLine>
						<End x="122.9" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="75.4" y="66.65"/>
					<TrackLine>
						<End x="75.4" y="62.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="75.4" y="62.9"/>
					<TrackLine>
						<End x="75.4" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="112.9" y="39.15"/>
					<TrackLine>
						<End x="112.9" y="52.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="140.4" y="46.65"/>
					<TrackLine>
						<End x="139.15" y="45.4"/>
					</TrackLine>
					<TrackLine>
						<End x="139.15" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="137.9" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000094"/>
				<Subwire width="0.4">
					<Start x="134.15" y="44.15"/>
					<TrackLine>
						<End x="136.65" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000094"/>
				<Subwire width="0.4">
					<Start x="136.65" y="41.65"/>
					<TrackLine>
						<End x="136.65" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000094"/>
				<Subwire width="0.4">
					<Start x="136.65" y="44.15"/>
					<TrackLine>
						<End x="136.65" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="139.15" y="49.15"/>
					</TrackLine>
					<TrackLine>
						<End x="141.65" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000095"/>
				<Subwire width="0.4">
					<Start x="77.9" y="64.15"/>
					<TrackLine>
						<End x="77.9" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="75.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000096"/>
				<Subwire width="0.4">
					<Start x="70.4" y="57.9"/>
					<TrackLine>
						<End x="70.4" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000097"/>
				<Subwire width="0.4">
					<Start x="100.4" y="96.65"/>
					<TrackLine>
						<End x="99.15" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="97.9" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="97.9" y="74.15"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="56.65"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="55.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000098"/>
				<Subwire width="0.4">
					<Start x="99.15" y="99.15"/>
					<TrackLine>
						<End x="96.65" y="101.65"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="109.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="115.4" y="112.9"/>
					<TrackLine>
						<End x="115.4" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="117.9" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="117.9" y="102.9"/>
					</TrackLine>
					<TrackLine>
						<End x="124.15" y="102.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="124.15" y="102.9"/>
					<TrackLine>
						<End x="124.15" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-12V"/>
				<Subwire width="0.4">
					<Start x="132.9" y="29.15"/>
					<TrackLine>
						<End x="131.65" y="30.4"/>
					</TrackLine>
					<TrackLine>
						<End x="131.65" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="130.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="137.9" y="79.15"/>
					<TrackLine>
						<End x="137.9" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-12V"/>
				<Subwire width="0.4">
					<Start x="135.4" y="46.65"/>
					<TrackLine>
						<End x="135.4" y="59.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-12V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="137.9" y="79.15"/>
							<Dot x="137.7261" y="78.6283"/>
							<Dot x="138.7697" y="78.2803"/>
							<Dot x="138.4217" y="79.3239"/>
						</Teardrop>
					</Teardrops>
					<Start x="135.4" y="59.15"/>
					<TrackLine>
						<End x="135.4" y="61.65"/>
					</TrackLine>
					<TrackLine>
						<End x="136.65" y="62.9"/>
					</TrackLine>
					<TrackLine>
						<End x="136.65" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="139.15" y="74.15"/>
					</TrackLine>
					<TrackLine>
						<End x="139.15" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="137.9" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NEW1"/>
				<Subwire width="0.4">
					<Start x="117.9" y="41.65"/>
					<TrackLine>
						<End x="119.15" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="119.15" y="90.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NEW1"/>
				<Subwire width="0.4">
					<Start x="97.9" y="90.4"/>
					<TrackLine>
						<End x="97.9" y="97.9"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NEW2"/>
				<Subwire width="0.4">
					<Start x="91.65" y="89.15"/>
					<TrackLine>
						<End x="91.65" y="94.15"/>
					</TrackLine>
					<TrackLine>
						<End x="92.9" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="92.9" y="110.4"/>
					</TrackLine>
					<TrackLine>
						<End x="90.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NEW2"/>
				<Subwire width="0.4">
					<Start x="117.9" y="56.65"/>
					<TrackLine>
						<End x="117.9" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="116.65" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="116.65" y="89.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000001"/>
				<Subwire width="0.4">
					<Start x="55.4" y="40.4"/>
					<TrackLine>
						<End x="45.4" y="40.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000002"/>
				<Subwire width="0.4">
					<Start x="42.9" y="44.15"/>
					<TrackLine>
						<End x="39.15" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000003"/>
				<Subwire width="0.4">
					<Start x="47.9" y="46.65"/>
					<TrackLine>
						<End x="50.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000003"/>
				<Subwire width="0.4">
					<Start x="47.9" y="46.65"/>
					<TrackLine>
						<End x="36.65" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000003"/>
				<Subwire width="0.4">
					<Start x="50.4" y="37.9"/>
					<TrackLine>
						<End x="57.9" y="37.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000003"/>
				<Subwire width="0.4">
					<Start x="70.4" y="46.65"/>
					<TrackLine>
						<End x="47.9" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000007"/>
				<Subwire width="0.4">
					<Start x="110.4" y="79.15"/>
					<TrackLine>
						<End x="110.4" y="74.15"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000004"/>
				<Subwire width="0.4">
					<Start x="110.4" y="66.65"/>
					<TrackLine>
						<End x="109.15" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="92.9" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="87.9" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="74.15" y="60.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000005"/>
				<Subwire width="0.4">
					<Start x="105.4" y="59.15"/>
					<TrackLine>
						<End x="106.65" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="121.65" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="124.15" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9" y="55.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000005"/>
				<Subwire width="0.4">
					<Start x="127.9" y="70.4"/>
					<TrackLine>
						<End x="140.4" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="144.15" y="74.15"/>
					</TrackLine>
					<TrackLine>
						<End x="144.15" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000006"/>
				<Subwire width="0.4">
					<Start x="147.9" y="80.4"/>
					<TrackLine>
						<End x="144.15" y="80.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000006"/>
				<Subwire width="0.4">
					<Start x="126.65" y="95.4"/>
					<TrackLine>
						<End x="139.15" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="141.65" y="92.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="84.15" y="66.65"/>
					<TrackLine>
						<End x="80.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="80.4" y="66.65"/>
					<TrackLine>
						<End x="77.9" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="77.9" y="69.15"/>
					<TrackLine>
						<End x="75.4" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="95.4" y="41.65"/>
					<TrackLine>
						<End x="90.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="90.4" y="41.65"/>
					<TrackLine>
						<End x="84.15" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000010"/>
				<Subwire width="0.4">
					<Start x="50.4" y="79.15"/>
					<TrackLine>
						<End x="51.65" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="54.15" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000010"/>
				<Subwire width="0.4">
					<Start x="107.9" y="69.15"/>
					<TrackLine>
						<End x="106.65" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="49.15" y="67.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="57.9" y="50.4"/>
					<TrackLine>
						<End x="57.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="101.65" y="49.15"/>
					<TrackLine>
						<End x="100.4" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="90.4" y="50.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="90.4" y="50.4"/>
					<TrackLine>
						<End x="57.9" y="50.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="30.4" y="72.65"/>
					<TrackLine>
						<End x="30.4" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="34.15" y="72.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="57.9" y="50.4"/>
					<TrackLine>
						<End x="34.15" y="50.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000009"/>
				<Subwire width="0.4">
					<Start x="30.4" y="77.65"/>
					<TrackLine>
						<End x="30.4" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="34.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000009"/>
				<Subwire width="0.4">
					<Start x="35.4" y="42.9"/>
					<TrackLine>
						<End x="54.15" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000034"/>
				<Subwire width="0.4">
					<Start x="151.65" y="36.65"/>
					<TrackLine>
						<End x="147.9" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000022"/>
				<Subwire width="0.4">
					<Start x="77.9" y="76.65"/>
					<TrackLine>
						<End x="69.15" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000012"/>
				<Subwire width="0.4">
					<Start x="110.4" y="36.65"/>
					<TrackLine>
						<End x="109.15" y="37.9"/>
					</TrackLine>
					<TrackLine>
						<End x="85.4" y="37.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="2"/>
				<Subwire width="0.4">
					<Start x="106.65" y="31.65"/>
					<TrackLine>
						<End x="105.4" y="30.4"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="30.4"/>
					</TrackLine>
					<TrackLine>
						<End x="97.9" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="3"/>
				<Subwire width="0.4">
					<Start x="107.9" y="51.65"/>
					<TrackLine>
						<End x="105.4" y="49.15"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="49.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="4"/>
				<Subwire width="0.4">
					<Start x="109.15" y="46.65"/>
					<TrackLine>
						<End x="97.9" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000017"/>
				<Subwire width="0.4">
					<Start x="100.4" y="39.15"/>
					<TrackLine>
						<End x="105.4" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000013"/>
				<Subwire width="0.4">
					<Start x="95.4" y="44.15"/>
					<TrackLine>
						<End x="95.4" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="47.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000015"/>
				<Subwire width="0.4">
					<Start x="109.15" y="75.4"/>
					<TrackLine>
						<End x="102.9" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000018"/>
				<Subwire width="0.4">
					<Start x="102.9" y="44.15"/>
					<TrackLine>
						<End x="105.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000020"/>
				<Subwire width="0.4">
					<Start x="102.9" y="54.15"/>
					<TrackLine>
						<End x="105.4" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="45.4" y="79.15"/>
					<TrackLine>
						<End x="44.15" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="37.9" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="36.65" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="90.4" y="36.65"/>
					<TrackLine>
						<End x="37.9" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="37.9" y="36.65"/>
					<TrackLine>
						<End x="36.65" y="36.65"/>
					</TrackLine>
					<TrackLine>
						<End x="34.15" y="39.15"/>
					</TrackLine>
					<TrackLine>
						<End x="34.15" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="31.65" y="45.4"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4" y="45.4"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4" y="44.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="97.9" y="39.15"/>
					<TrackLine>
						<End x="90.4" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000031"/>
				<Subwire width="0.4">
					<Start x="44.15" y="82.9"/>
					<TrackLine>
						<End x="49.15" y="82.9"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000023"/>
				<Subwire width="0.4">
					<Start x="76.65" y="87.9"/>
					<TrackLine>
						<End x="70.4" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000024"/>
				<Subwire width="0.4">
					<Start x="75.4" y="85.4"/>
					<TrackLine>
						<End x="77.9" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000025"/>
				<Subwire width="0.4">
					<Start x="54.15" y="95.4"/>
					<TrackLine>
						<End x="56.65" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4" y="92.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000026"/>
				<Subwire width="0.4">
					<Start x="54.15" y="82.9"/>
					<TrackLine>
						<End x="59.15" y="82.9"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000028"/>
				<Subwire width="0.4">
					<Start x="64.15" y="82.9"/>
					<TrackLine>
						<End x="69.15" y="82.9"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000029"/>
				<Subwire width="0.4">
					<Start x="74.15" y="95.4"/>
					<TrackLine>
						<End x="76.65" y="92.9"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="92.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000030"/>
				<Subwire width="0.4">
					<Start x="74.15" y="82.9"/>
					<TrackLine>
						<End x="79.15" y="82.9"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000038"/>
				<Subwire width="0.4">
					<Start x="47.9" y="51.65"/>
					<TrackLine>
						<End x="50.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000033"/>
				<Subwire width="0.4">
					<Start x="151.65" y="49.15"/>
					<TrackLine>
						<End x="151.65" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="146.65" y="37.9"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="37.9"/>
					</TrackLine>
					<TrackLine>
						<End x="109.15" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="71.65" y="40.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000033"/>
				<Subwire width="0.4">
					<Start x="72.9" y="56.65"/>
					<TrackLine>
						<End x="30.4" y="56.65"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4" y="55.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000035"/>
				<Subwire width="0.4">
					<Start x="140.4" y="59.15"/>
					<TrackLine>
						<End x="139.15" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="135.4" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="134.15" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000035"/>
				<Subwire width="0.4">
					<Start x="147.9" y="49.15"/>
					<TrackLine>
						<End x="147.9" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="146.65" y="54.15"/>
					</TrackLine>
					<TrackLine>
						<End x="140.4" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000035"/>
				<Subwire width="0.4">
					<Start x="134.15" y="77.9"/>
					<TrackLine>
						<End x="121.65" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000036"/>
				<Subwire width="0.4">
					<Start x="50.4" y="61.65"/>
					<TrackLine>
						<End x="47.9" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000036"/>
				<Subwire width="0.4">
					<Start x="142.9" y="35.4"/>
					<TrackLine>
						<End x="56.65" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4" y="34.15"/>
					</TrackLine>
					<TrackLine>
						<End x="49.15" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000037"/>
				<Subwire width="0.4">
					<Start x="62.9" y="54.15"/>
					<TrackLine>
						<End x="61.65" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="46.65" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000062"/>
				<Subwire width="0.4">
					<Start x="54.15" y="75.4"/>
					<TrackLine>
						<End x="75.4" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000062"/>
				<Subwire width="0.4">
					<Start x="75.4" y="75.4"/>
					<TrackLine>
						<End x="95.4" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000039"/>
				<Subwire width="0.4">
					<Start x="42.9" y="71.65"/>
					<TrackLine>
						<End x="45.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000039"/>
				<Subwire width="0.4">
					<Start x="45.4" y="71.65"/>
					<TrackLine>
						<End x="46.65" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="54.15" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000042"/>
				<Subwire width="0.4">
					<Start x="57.9" y="79.15"/>
					<TrackLine>
						<End x="55.4" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000077"/>
				<Subwire width="0.4">
					<Start x="121.65" y="49.15"/>
					<TrackLine>
						<End x="125.4" y="49.15"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000044"/>
				<Subwire width="0.4">
					<Start x="47.9" y="79.15"/>
					<TrackLine>
						<End x="49.15" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="51.65" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000045"/>
				<Subwire width="0.4">
					<Start x="72.9" y="44.15"/>
					<TrackLine>
						<End x="70.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000045"/>
				<Subwire width="0.4">
					<Start x="69.15" y="74.15"/>
					<TrackLine>
						<End x="84.15" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000045"/>
				<Subwire width="0.4">
					<Start x="84.15" y="74.15"/>
					<TrackLine>
						<End x="96.65" y="74.15"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="76.65"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000083"/>
				<Subwire width="0.4">
					<Start x="137.9" y="76.65"/>
					<TrackLine>
						<End x="127.9" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000083"/>
				<Subwire width="0.4">
					<Start x="127.9" y="100.4"/>
					<TrackLine>
						<End x="116.65" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="115.4" y="101.65"/>
					</TrackLine>
					<TrackLine>
						<End x="112.9" y="101.65"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="62.9" y="79.15"/>
					<TrackLine>
						<End x="64.15" y="77.9"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="72.9" y="79.15"/>
					<TrackLine>
						<End x="72.9" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="84.15" y="100.4"/>
					<TrackLine>
						<End x="87.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="72.9" y="77.9"/>
					<TrackLine>
						<End x="89.15" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="67.9" y="71.65"/>
					<TrackLine>
						<End x="66.65" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="37.9" y="72.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="77.9" y="44.15"/>
					<TrackLine>
						<End x="80.4" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="67.9" y="59.15"/>
					<TrackLine>
						<End x="82.9" y="59.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="37.9" y="95.4"/>
					<TrackLine>
						<End x="30.4" y="95.4"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4" y="95.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000059"/>
				<Subwire width="0.4">
					<Start x="30.4" y="100.15"/>
					<TrackLine>
						<End x="30.4" y="100.4"/>
					</TrackLine>
					<TrackLine>
						<End x="39.15" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000059"/>
				<Subwire width="0.4">
					<Start x="40.4" y="39.15"/>
					<TrackLine>
						<End x="60.4" y="39.15"/>
					</TrackLine>
					<TrackLine>
						<End x="64.15" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="79.15" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000061"/>
				<Subwire width="0.4">
					<Start x="62.9" y="71.65"/>
					<TrackLine>
						<End x="64.15" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="69.15" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000063"/>
				<Subwire width="0.4">
					<Start x="70.4" y="101.65"/>
					<TrackLine>
						<End x="75.4" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000063"/>
				<Subwire width="0.4">
					<Start x="81.65" y="69.15"/>
					<TrackLine>
						<End x="82.9" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="94.15" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="69.15"/>
					</TrackLine>
					<TrackLine>
						<End x="102.9" y="69.15"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="74.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000064"/>
				<Subwire width="0.4">
					<Start x="80.4" y="76.65"/>
					<TrackLine>
						<End x="86.65" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000064"/>
				<Subwire width="0.4">
					<Start x="86.65" y="102.9"/>
					<TrackLine>
						<End x="81.65" y="102.9"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000064"/>
				<Subwire width="0.4">
					<Start x="126.65" y="87.9"/>
					<TrackLine>
						<End x="86.65" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000067"/>
				<Subwire width="0.4">
					<Start x="46.65" y="107.9"/>
					<TrackLine>
						<End x="49.15" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000068"/>
				<Subwire width="0.4">
					<Start x="56.65" y="107.9"/>
					<TrackLine>
						<End x="59.15" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000069"/>
				<Subwire width="0.4">
					<Start x="66.65" y="107.9"/>
					<TrackLine>
						<End x="69.15" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000070"/>
				<Subwire width="0.4">
					<Start x="76.65" y="107.9"/>
					<TrackLine>
						<End x="79.15" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000072"/>
				<Subwire width="0.4">
					<Start x="94.15" y="94.15"/>
					<TrackLine>
						<End x="87.9" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000073"/>
				<Subwire width="0.4">
					<Start x="106.65" y="94.15"/>
					<TrackLine>
						<End x="100.4" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000074"/>
				<Subwire width="0.4">
					<Start x="117.9" y="94.15"/>
					<TrackLine>
						<End x="124.15" y="94.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="120.4" y="75.4"/>
					<TrackLine>
						<End x="114.15" y="75.4"/>
					</TrackLine>
					<TrackLine>
						<End x="112.9" y="76.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="117.9" y="81.65"/>
					<TrackLine>
						<End x="114.15" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="114.15" y="81.65"/>
					<TrackLine>
						<End x="100.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="100.4" y="81.65"/>
					<TrackLine>
						<End x="87.9" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="40.4" y="35.4"/>
					<TrackLine>
						<End x="40.4" y="31.65"/>
					</TrackLine>
					<TrackLine>
						<End x="39.15" y="30.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="30.4" y="67.15"/>
					<TrackLine>
						<End x="30.4" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="41.65" y="67.9"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="42.9" y="66.65"/>
					<TrackLine>
						<End x="59.15" y="66.65"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4" y="65.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="60.4" y="65.4"/>
					<TrackLine>
						<End x="66.65" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="121.65" y="84.15"/>
					<TrackLine>
						<End x="120.4" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="110.4" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="109.15" y="86.65"/>
					</TrackLine>
					<TrackLine>
						<End x="107.9" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="104.15" y="84.15"/>
					<TrackLine>
						<End x="102.9" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="97.9" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="86.65"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="92.9" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="91.65" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="91.65" y="84.15"/>
					<TrackLine>
						<End x="90.4" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="85.4"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="80.4" y="84.15"/>
					<TrackLine>
						<End x="70.4" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="70.4" y="84.15"/>
					<TrackLine>
						<End x="60.4" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="60.4" y="84.15"/>
					<TrackLine>
						<End x="56.65" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="56.65" y="84.15"/>
					<TrackLine>
						<End x="50.4" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="87.9" y="54.15"/>
					<TrackLine>
						<End x="90.4" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="115.4" y="44.15"/>
					<TrackLine>
						<End x="116.65" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="126.65" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="79.15"/>
					<TrackLine>
						<End x="119.15" y="79.15"/>
					</TrackLine>
					<TrackLine>
						<End x="120.4" y="80.4"/>
					</TrackLine>
					<TrackLine>
						<End x="121.65" y="80.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="121.65" y="80.4"/>
					<TrackLine>
						<End x="134.15" y="80.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="150.4" y="65.4"/>
					<TrackLine>
						<End x="147.9" y="65.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="147.9" y="65.4"/>
					<TrackLine>
						<End x="145.4" y="65.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="145.4" y="65.4"/>
					<TrackLine>
						<End x="142.9" y="65.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="77.9" y="27.9"/>
					<TrackLine>
						<End x="77.9" y="31.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="115.4" y="29.15"/>
					<TrackLine>
						<End x="116.65" y="30.4"/>
					</TrackLine>
					<TrackLine>
						<End x="142.9" y="30.4"/>
					</TrackLine>
					<TrackLine>
						<End x="144.15" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="30.4" y="32.65"/>
					<TrackLine>
						<End x="30.4" y="34.15"/>
					</TrackLine>
					<TrackLine>
						<End x="31.65" y="35.4"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4" y="35.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="30.4" y="112.15"/>
					<TrackLine>
						<End x="30.4" y="112.9"/>
					</TrackLine>
					<TrackLine>
						<End x="34.15" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="40.4" y="35.4"/>
					<TrackLine>
						<End x="52.9" y="35.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="60.4" y="41.65"/>
					<TrackLine>
						<End x="52.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="60.4" y="61.65"/>
					<TrackLine>
						<End x="62.9" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="87.9" y="44.15"/>
					<TrackLine>
						<End x="82.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="87.9" y="62.9"/>
					<TrackLine>
						<End x="80.4" y="62.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="94.15" y="110.4"/>
					<TrackLine>
						<End x="87.9" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="87.9" y="110.4"/>
					<TrackLine>
						<End x="86.65" y="110.4"/>
					</TrackLine>
					<TrackLine>
						<End x="84.15" y="107.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="84.15" y="107.9"/>
					<TrackLine>
						<End x="80.4" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="80.4" y="104.15"/>
					<TrackLine>
						<End x="70.4" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="70.4" y="104.15"/>
					<TrackLine>
						<End x="60.4" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="60.4" y="104.15"/>
					<TrackLine>
						<End x="50.4" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="34.15"/>
					<TrackLine>
						<End x="102.9" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="102.9" y="34.15"/>
					<TrackLine>
						<End x="87.9" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="87.9" y="34.15"/>
					<TrackLine>
						<End x="87.9" y="27.9"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9" y="27.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.4" y="44.15"/>
					<TrackLine>
						<End x="110.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="145.4" y="55.4"/>
					<TrackLine>
						<End x="142.9" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="129.15" y="57.9"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9" y="59.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="127.9" y="59.15"/>
					<TrackLine>
						<End x="126.65" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="116.65" y="60.4"/>
					</TrackLine>
					<TrackLine>
						<End x="115.4" y="59.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="134.15" y="107.9"/>
					<TrackLine>
						<End x="147.9" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="150.4" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="30.4" y="89.65"/>
					<TrackLine>
						<End x="30.4" y="91.65"/>
					</TrackLine>
					<TrackLine>
						<End x="34.15" y="91.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="34.15" y="91.65"/>
					<TrackLine>
						<End x="50.4" y="91.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="114.15" y="99.15"/>
					<TrackLine>
						<End x="102.9" y="99.15"/>
					</TrackLine>
					<TrackLine>
						<End x="100.4" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="77.9" y="27.9"/>
					<TrackLine>
						<End x="60.4" y="27.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="0.4">
					<Start x="100.4" y="104.15"/>
					<TrackLine>
						<End x="94.15" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="129.15" y="47.9"/>
					<TrackLine>
						<End x="127.9" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="120.4" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="117.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="147.9" y="57.9"/>
					<TrackLine>
						<End x="150.4" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="150.4" y="57.9"/>
					<TrackLine>
						<End x="152.9" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="130.4" y="55.4"/>
					<TrackLine>
						<End x="142.9" y="55.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000079"/>
				<Subwire width="0.4">
					<Start x="132.9" y="51.65"/>
					<TrackLine>
						<End x="136.65" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="137.9" y="54.15"/>
					<TrackLine>
						<End x="132.9" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="131.65" y="110.4"/>
					<TrackLine>
						<End x="120.4" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="135.4" y="64.15"/>
					<TrackLine>
						<End x="136.65" y="62.9"/>
					</TrackLine>
					<TrackLine>
						<End x="141.65" y="62.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="141.65" y="62.9"/>
					<TrackLine>
						<End x="146.65" y="62.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="137.9" y="69.15"/>
					<TrackLine>
						<End x="135.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="90.4" y="91.65"/>
					<TrackLine>
						<End x="144.15" y="91.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000086"/>
				<Subwire width="1">
					<Start x="149.15" y="100.4"/>
					<TrackLine>
						<End x="152.9" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="65.4" y="39.15"/>
					<TrackLine>
						<End x="62.9" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="96.65" y="96.65"/>
					<TrackLine>
						<End x="91.65" y="96.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="130.4" y="66.65"/>
					<TrackLine>
						<End x="131.65" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="139.15" y="65.4"/>
					</TrackLine>
					<TrackLine>
						<End x="140.4" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="135.4" y="69.15"/>
					<TrackLine>
						<End x="130.4" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="40.4" y="66.65"/>
					<TrackLine>
						<End x="36.65" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="42.9" y="89.15"/>
					<TrackLine>
						<End x="57.9" y="89.15"/>
					</TrackLine>
					<TrackLine>
						<End x="59.15" y="90.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="59.15" y="90.4"/>
					<TrackLine>
						<End x="69.15" y="90.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="69.15" y="90.4"/>
					<TrackLine>
						<End x="79.15" y="90.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="92.9" y="72.9"/>
					<TrackLine>
						<End x="84.15" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="70.4" y="79.15"/>
					<TrackLine>
						<End x="67.9" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="114.15" y="107.9"/>
					<TrackLine>
						<End x="110.4" y="107.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="91.65" y="99.15"/>
					<TrackLine>
						<End x="81.65" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="81.65" y="99.15"/>
					<TrackLine>
						<End x="71.65" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="71.65" y="99.15"/>
					<TrackLine>
						<End x="61.65" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="61.65" y="99.15"/>
					<TrackLine>
						<End x="46.65" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="114.15" y="107.9"/>
					<TrackLine>
						<End x="114.15" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="42.9" y="47.9"/>
					<TrackLine>
						<End x="65.4" y="47.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="65.4" y="55.4"/>
					<TrackLine>
						<End x="59.15" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="125.4" y="56.65"/>
					<TrackLine>
						<End x="134.15" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="130.4" y="62.9"/>
					<TrackLine>
						<End x="124.15" y="62.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="124.15" y="62.9"/>
					<TrackLine>
						<End x="92.9" y="62.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="130.4" y="107.9"/>
					<TrackLine>
						<End x="124.15" y="107.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="124.15" y="107.9"/>
					<TrackLine>
						<End x="114.15" y="107.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000089"/>
				<Subwire width="0.4">
					<Start x="140.4" y="41.65"/>
					<TrackLine>
						<End x="140.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000089"/>
				<Subwire width="0.4">
					<Start x="137.9" y="44.15"/>
					<TrackLine>
						<End x="140.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000089"/>
				<Subwire width="0.4">
					<Start x="140.4" y="44.15"/>
					<TrackLine>
						<End x="141.65" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000091"/>
				<Subwire width="0.4">
					<Start x="125.4" y="70.4"/>
					<TrackLine>
						<End x="106.65" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000092"/>
				<Subwire width="0.4">
					<Start x="120.4" y="69.15"/>
					<TrackLine>
						<End x="122.9" y="69.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="137.9" y="39.15"/>
					<TrackLine>
						<End x="112.9" y="39.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="112.9" y="52.9"/>
					<TrackLine>
						<End x="84.15" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="56.65"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="80.4" y="57.9"/>
					<TrackLine>
						<End x="75.4" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000095"/>
				<Subwire width="0.4">
					<Start x="75.4" y="51.65"/>
					<TrackLine>
						<End x="74.15" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="64.15" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="62.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000096"/>
				<Subwire width="0.4">
					<Start x="70.4" y="54.15"/>
					<TrackLine>
						<End x="72.9" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000096"/>
				<Subwire width="0.4">
					<Start x="72.9" y="54.15"/>
					<TrackLine>
						<End x="75.4" y="54.15"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000096"/>
				<Subwire width="0.4">
					<Start x="62.9" y="57.9"/>
					<TrackLine>
						<End x="70.4" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000097"/>
				<Subwire width="0.4">
					<Start x="95.4" y="55.4"/>
					<TrackLine>
						<End x="86.65" y="55.4"/>
					</TrackLine>
					<TrackLine>
						<End x="85.4" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000098"/>
				<Subwire width="0.4">
					<Start x="96.65" y="109.15"/>
					<TrackLine>
						<End x="97.9" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="107.9"/>
					</TrackLine>
					<TrackLine>
						<End x="100.4" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="0.4">
					<Start x="125.4" y="29.15"/>
					<TrackLine>
						<End x="129.15" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="0.4">
					<Start x="129.15" y="29.15"/>
					<TrackLine>
						<End x="132.9" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="0.4">
					<Start x="132.9" y="29.15"/>
					<TrackLine>
						<End x="136.65" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="0.4">
					<Start x="136.65" y="29.15"/>
					<TrackLine>
						<End x="140.4" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="0.4">
					<Start x="130.4" y="44.15"/>
					<TrackLine>
						<End x="132.9" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="135.4" y="46.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="137.9" y="97.9"/>
					<TrackLine>
						<End x="124.15" y="97.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NEW1"/>
				<Subwire width="0.4">
					<Start x="119.15" y="90.4"/>
					<TrackLine>
						<End x="97.9" y="90.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NEW1"/>
				<Subwire width="0.4">
					<Start x="140.4" y="51.65"/>
					<TrackLine>
						<End x="136.65" y="47.9"/>
					</TrackLine>
					<TrackLine>
						<End x="136.65" y="44.15"/>
					</TrackLine>
					<TrackLine>
						<End x="135.4" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="135.4" y="41.65"/>
					</TrackLine>
					<TrackLine>
						<End x="134.15" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="119.15" y="40.4"/>
					</TrackLine>
					<TrackLine>
						<End x="117.9" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NEW2"/>
				<Subwire width="0.4">
					<Start x="116.65" y="89.15"/>
					<TrackLine>
						<End x="91.65" y="89.15"/>
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
		<View scale="8.32283" scrollHorz="90.4" scrollVert="70.4"/>
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
				<LayerRef name="DRILL"/>
				<Colors details="#51271a" pads="#401f14" fix="#51271a"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TEXT"/>
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