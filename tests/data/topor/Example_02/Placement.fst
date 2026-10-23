<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : Placement.fst                  -->
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
			<CompInstance name="VD6" uniqueId="TMUJYXKH" side="Top" angle="180" fixed="on">
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
			<CompInstance name="VD20" uniqueId="GXLKAVGG" side="Top" fixed="on">
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
			<CompInstance name="R51" uniqueId="CHRHANMU" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="62.8449" y="50.5452"/>
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
			<CompInstance name="VT5" uniqueId="UOPQHJZH" side="Top" angle="90">
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
			<CompInstance name="VT3" uniqueId="CIMYPLJO" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="79.3119" y="92.2372"/>
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
			<CompInstance name="VD23" uniqueId="LGPXVGHA" side="Top" fixed="on">
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
			<CompInstance name="C6" uniqueId="WAPEHHJK" side="Top" angle="90">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="87.7781" y="97.3515"/>
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
			<CompInstance name="1" uniqueId="YGVSNMVR" side="Top" fixed="on">
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
			<CompInstance name="R53" uniqueId="BTYPHRUF" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="96.0869" y="108.9489"/>
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
			<CompInstance name="10" uniqueId="ITVTYZKK" side="Top" fixed="on">
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
			<CompInstance name="2" uniqueId="JPWKNTDE" side="Top" fixed="on">
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
			<CompInstance name="3" uniqueId="YTTKHKXL" side="Top" fixed="on">
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
			<CompInstance name="4" uniqueId="ZNWJCCEL" side="Top" fixed="on">
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
			<CompInstance name="R56" uniqueId="DZGYTEEP" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="116.0482" y="64.2438"/>
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
			<CompInstance name="VD24" uniqueId="KQYQTLPZ" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="126.2832" y="73.1164"/>
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
			<CompInstance name="6" uniqueId="OLYEHSYI" side="Top" fixed="on">
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
			<CompInstance name="7" uniqueId="JOXTAMSE" side="Top" fixed="on">
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
			<CompInstance name="R50" uniqueId="DYJHEEOX" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="139.3792" y="42.7361"/>
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
			<CompInstance name="VT9" uniqueId="NCMYZDLB" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="140.6041" y="39.4339"/>
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
			<CompInstance name="R41" uniqueId="ZMLJQPLH" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="140.5225" y="70.2138"/>
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
			<CompInstance name="9" uniqueId="QAOBADER" side="Top" fixed="on">
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
			<CompInstance name="R11" uniqueId="RFMJIXDH" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="149.0584" y="41.7104"/>
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
			<CompInstance name="R3" uniqueId="TKUBAWQD" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="148.6911" y="68.5263"/>
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
			<CompInstance name="R6" uniqueId="EVYYPOBM" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="40.3441" y="87.3371"/>
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
			<CompInstance name="R29" uniqueId="RCLQCTVE" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="56.4908" y="95.4"/>
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
			<CompInstance name="R30" uniqueId="QOEKQGRG" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="64.4312" y="95.1488"/>
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
			<CompInstance name="R8" uniqueId="HUCHLPQH" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="66.4346" y="94.8557"/>
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
			<CompInstance name="R9" uniqueId="EXBDGSVD" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="75.1451" y="93.9405"/>
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
			<CompInstance name="VT6" uniqueId="SWEGGIBK" side="Top" angle="90">
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
			<CompInstance name="R25" uniqueId="GOYJEGZC" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="87.6081" y="94.1766"/>
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
			<CompInstance name="R27" uniqueId="WJZJDCXR" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="117.608" y="94.203"/>
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
			<CompInstance name="R33" uniqueId="MITRJZPK" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="116.9768" y="30.1044"/>
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
			<CompInstance name="R39" uniqueId="MDSBLGPT" side="Top" angle="270">
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
			<CompInstance name="R40" uniqueId="GVRKSQZE" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="143.0342" y="45.7356"/>
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
			<CompInstance name="VT12" uniqueId="LUWVUWZD" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="144.2357" y="72.2447"/>
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
			<CompInstance name="R46" uniqueId="ZTDLESPD" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="132.7555" y="29.0755"/>
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
			<CompInstance name="VD10" uniqueId="VRWSVMQR" side="Top" angle="270">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="140.0664" y="67.9205"/>
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
			<CompInstance name="VD16" uniqueId="QGVZCVTD" side="Top" angle="270">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="150.2408" y="65.0019"/>
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
			<CompInstance name="VD17" uniqueId="OAZWSJGG" side="Top" angle="90">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="148.027" y="56.1233"/>
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
			<CompInstance name="R1" uniqueId="HSHKMBCW" side="Top">
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
			<CompInstance name="C8" uniqueId="SBJAPLYI" side="Top" angle="180">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="52.9" y="41.4908"/>
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
			<CompInstance name="R14" uniqueId="FFNIYKRZ" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="57.9" y="57.9531"/>
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
			<CompInstance name="C4" uniqueId="CSNVELLV" side="Top">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="54.7434" y="65.4924"/>
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
			<CompInstance name="XC00000" uniqueId="DNBCTSAR" side="Top" angle="180" fixed="on">
				<ComponentRef name="PIN_1"/>
				<FootprintRef name="PIN_1"/>
				<Org x="39.15" y="110.4"/>
				<Attributes>
					<Attribute name="Type" value="PIN"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R18" uniqueId="SURFPHXG" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="80.4266" y="41.4908"/>
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
			<CompInstance name="R49" uniqueId="UIEMSNWI" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="80.745" y="57.9"/>
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
			<CompInstance name="C1" uniqueId="AIGEWJFK" side="Top" angle="180">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="88.0105" y="65.3675"/>
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
			<CompInstance name="VT10" uniqueId="VCKXANSI" side="Top" angle="180">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="81.3318" y="61.1626"/>
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
			<CompInstance name="VD2" uniqueId="LXBCQSKB" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="96.8962" y="41.5422"/>
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
			<CompInstance name="VD3" uniqueId="OVIFQGYH" side="Top">
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
			<CompInstance name="R55" uniqueId="LLQOVQSI" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="118.9649" y="53.8489"/>
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
			<CompInstance name="R37" uniqueId="KTQDYSZJ" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="152.9402" y="103.3827"/>
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
			<CompInstance name="XC00001" uniqueId="WKJAZATC" side="Top" angle="180" fixed="on">
				<ComponentRef name="PIN_1"/>
				<FootprintRef name="PIN_1"/>
				<Org x="150.4" y="110.4"/>
				<Attributes>
					<Attribute name="Type" value="PIN"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="SA1" uniqueId="XFFCZWCH" side="Bottom" angle="90" fixed="on">
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
			<CompInstance name="C9" uniqueId="TOSHEIUR" side="Top" angle="180">
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
			<CompInstance name="XC00002" uniqueId="CSKSMOKG" side="Top" angle="180" fixed="on">
				<ComponentRef name="PIN_1"/>
				<FootprintRef name="PIN_1"/>
				<Org x="39.15" y="30.4"/>
				<Attributes>
					<Attribute name="Type" value="PIN"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R2" uniqueId="JNLIMQTL" side="Top">
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
			<CompInstance name="R13" uniqueId="RDGQIMRT" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="45.4" y="54.3092"/>
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
			<CompInstance name="D1" uniqueId="IEWBBLLX" side="Top">
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
			<CompInstance name="R12" uniqueId="DYMLMKSZ" side="Top" angle="180">
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
			<CompInstance name="R4" uniqueId="DGXMSSRY" side="Top" angle="90">
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
			<CompInstance name="VT1" uniqueId="LYZNNUUO" side="Top" angle="270">
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
			<CompInstance name="R15" uniqueId="BUQFFUMR" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="55.0815" y="68.5926"/>
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
			<CompInstance name="D3" uniqueId="SPMHUXYG" side="Top">
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
			<CompInstance name="VD7" uniqueId="JJVQYOSU" side="Top" angle="180" fixed="on">
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
			<CompInstance name="VD15" uniqueId="JCMYHKTO" side="Top" angle="90">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="66.8171" y="72.9382"/>
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
			<CompInstance name="VD21" uniqueId="YBGMGQBW" side="Top" fixed="on">
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
			<CompInstance name="VT4" uniqueId="JMPUMYYS" side="Top" angle="90">
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
			<CompInstance name="VD13" uniqueId="BASTQBGK" side="Top" angle="180">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="89.5596" y="39.7803"/>
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
			<CompInstance name="R5" uniqueId="FBTWKHQN" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="87.1656" y="42.6203"/>
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
			<CompInstance name="R17" uniqueId="TCOXMHAF" side="Top">
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
			<CompInstance name="R54" uniqueId="SUUISTAO" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="72.5355" y="55.2434"/>
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
			<CompInstance name="D2" uniqueId="WIRVKQQG" side="Top">
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
			<CompInstance name="VD8" uniqueId="RYZHBPDQ" side="Top" angle="180" fixed="on">
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
			<CompInstance name="VD9" uniqueId="RLKBIRQI" side="Top" angle="180" fixed="on">
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
			<CompInstance name="D8" uniqueId="KTSXGZRT" side="Top">
				<ComponentRef name="561IR2_1"/>
				<FootprintRef name="561IR2_1"/>
				<Org x="69.4869" y="70.442"/>
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
			<CompInstance name="VD28" uniqueId="HLDIEFFC" side="Top" angle="180">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="110.3737" y="39.27"/>
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
			<CompInstance name="VT2" uniqueId="QATPXQEL" side="Top" angle="270">
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
			<CompInstance name="VD14" uniqueId="JWBRQCJG" side="Top" angle="270">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="84.8347" y="93.4486"/>
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
			<CompInstance name="R38" uniqueId="YVPIKACZ" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="91.5041" y="98.1808"/>
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
			<CompInstance name="VD22" uniqueId="IZOTVYTI" side="Top" fixed="on">
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
			<CompInstance name="11" uniqueId="VCMADGNJ" side="Top" fixed="on">
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
			<CompInstance name="VD1" uniqueId="WRNTVWKJ" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="93.4363" y="39.1925"/>
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
			<CompInstance name="VD4" uniqueId="CRTLTYTO" side="Top">
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
			<CompInstance name="R42" uniqueId="TPRUFFHR" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="107.9" y="69.0281"/>
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
			<CompInstance name="VD26" uniqueId="YZCGIXJB" side="Top" fixed="on">
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
			<CompInstance name="R20" uniqueId="TWAPHZYL" side="Top" angle="90" fixed="on">
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
			<CompInstance name="5" uniqueId="UNWZKCLW" side="Top" fixed="on">
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
			<CompInstance name="XC00003" uniqueId="GICJEFZE" side="Top" angle="180" fixed="on">
				<ComponentRef name="PIN_1"/>
				<FootprintRef name="PIN_1"/>
				<Org x="150.4" y="30.4"/>
				<Attributes>
					<Attribute name="Type" value="PIN"/>
					<Attribute name="FIXED" value="1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R45" uniqueId="MAZABBJM" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="135.2419" y="56.3633"/>
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
			<CompInstance name="VD11" uniqueId="GZLCNCPF" side="Top" angle="270">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="143.4302" y="37.4673"/>
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
			<CompInstance name="R10" uniqueId="HKHHXAFC" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="152.8084" y="41.7105"/>
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
			<CompInstance name="VD18" uniqueId="QFXAVVOU" side="Top" angle="180">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="113.1552" y="108.2529"/>
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
			<CompInstance name="Q1" uniqueId="STAKCWER" side="Top" angle="270">
				<ComponentRef name="KT315_1"/>
				<FootprintRef name="KT315_1"/>
				<Org x="144.6583" y="80.4"/>
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
			<CompInstance name="R35" uniqueId="MHCHPUEJ" side="Top" angle="90">
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
			<CompInstance name="8" uniqueId="RGZDHDXN" side="Top" fixed="on">
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
			<CompInstance name="SA3" uniqueId="VMUURPOH" side="Bottom" angle="90" fixed="on">
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
			<CompInstance name="SA4" uniqueId="ZGTVNHQL" side="Bottom" angle="90" fixed="on">
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
			<CompInstance name="SA2" uniqueId="OKMYEPOT" side="Bottom" angle="90" fixed="on">
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
			<CompInstance name="VT7" uniqueId="NZRVLXNS" side="Top">
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
			<CompInstance name="R28" uniqueId="LFCDNYIJ" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="52.9526" y="89.777"/>
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
			<CompInstance name="R7" uniqueId="FJXUAGHI" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="56.4119" y="93.4514"/>
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
			<CompInstance name="C5" uniqueId="LMMTCMPF" side="Top" angle="270">
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
			<CompInstance name="R31" uniqueId="BXLQPAOW" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="76.4488" y="95.4403"/>
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
			<CompInstance name="R19" uniqueId="JQUOJIBS" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="84.3913" y="95.4"/>
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
			<CompInstance name="R24" uniqueId="JSHQEYND" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="100.7067" y="94.1851"/>
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
			<CompInstance name="R26" uniqueId="NNPLTGFD" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="113.7982" y="94.2769"/>
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
			<CompInstance name="R32" uniqueId="OLNLKLHQ" side="Top" angle="270">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="121.8299" y="41.6501"/>
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
			<CompInstance name="VT11" uniqueId="ZDVTTUBV" side="Top" angle="270">
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
			<CompInstance name="R22" uniqueId="TQARRRME" side="Top" fixed="on">
				<ComponentRef name="SP3-38B_1"/>
				<FootprintRef name="SP3-38B_1"/>
				<Org x="104.6987" y="84.15"/>
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
			<CompInstance name="R47" uniqueId="NWDECPHW" side="Top" angle="90">
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
			<CompInstance name="R48" uniqueId="REFHURPM" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="136.2529" y="29.1171"/>
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
			<CompInstance name="C3" uniqueId="WKJXQAAV" side="Top" angle="90">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="146.1613" y="29.0293"/>
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
			<CompInstance name="VD19" uniqueId="HPRWMBPN" side="Top" angle="270">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="145.8056" y="64.9113"/>
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
			<CompInstance name="R34" uniqueId="IJNIVFJD" side="Top" angle="90">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="153.0326" y="57.9"/>
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
			<CompInstance name="R36" uniqueId="LEBTDLRU" side="Top" angle="90">
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
			<CompInstance name="C7" uniqueId="NPIXBBMO" side="Top">
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
			<CompInstance name="R16" uniqueId="NVNPURWR" side="Top" angle="180">
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
			<CompInstance name="R52" uniqueId="BEWNHGNH" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="61.7701" y="57.3168"/>
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
			<CompInstance name="VD25" uniqueId="GWHVIWJF" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="67.8812" y="64.0731"/>
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
			<CompInstance name="VT8" uniqueId="SCTBYZPA" side="Top">
				<ComponentRef name="KT361_1"/>
				<FootprintRef name="KT361_1"/>
				<Org x="118.1693" y="73.1871"/>
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
			<CompInstance name="C11" uniqueId="CIRNYELZ" side="Top">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="123.7632" y="108.0927"/>
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
			<CompInstance name="VD12" uniqueId="VSAAAOLB" side="Top" angle="180">
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
			<CompInstance name="BQ1" uniqueId="AXRNLBHO" side="Top" angle="270">
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
			<CompInstance name="VD27" uniqueId="ZUOLDROY" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="44.1633" y="65.3411"/>
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
			<CompInstance name="D6" uniqueId="WFAMMRRX" side="Top">
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
			<CompInstance name="DA10" uniqueId="QAZUPGLN" side="Top">
				<ComponentRef name="544UD1_1"/>
				<FootprintRef name="544UD1_1"/>
				<Org x="122.4876" y="44.2452"/>
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
			<CompInstance name="VD5" uniqueId="EDDTWFFV" side="Top">
				<ComponentRef name="KD522_1"/>
				<FootprintRef name="KD522_1"/>
				<Org x="67.8635" y="67.2844"/>
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
			<CompInstance name="R44" uniqueId="PUVPWKZK" side="Top" angle="180">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="105.4" y="69.0738"/>
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
			<CompInstance name="R43" uniqueId="XFQHVCYC" side="Top">
				<ComponentRef name="R025_1"/>
				<FootprintRef name="R025_1"/>
				<Org x="122.4029" y="69.0948"/>
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
			<CompInstance name="D5" uniqueId="AQQYAQYH" side="Top">
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
			<CompInstance name="C2" uniqueId="JEYGCZZN" side="Top" angle="270">
				<ComponentRef name="K50-35_1"/>
				<FootprintRef name="K50-35_1"/>
				<Org x="121.5244" y="79.9431"/>
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
			<CompInstance name="C10" uniqueId="XRWISHQW" side="Top" angle="180">
				<ComponentRef name="KM5_1"/>
				<FootprintRef name="KM5_1"/>
				<Org x="134.0394" y="103.7569"/>
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
			<CompInstance name="D4" uniqueId="TOPRLQSK" side="Top">
				<ComponentRef name="561IE16_1"/>
				<FootprintRef name="561IE16_1"/>
				<Org x="95.339" y="58.9366"/>
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
			<CompInstance name="D7" uniqueId="CJPTIVMI" side="Top">
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
			<CompInstance name="DA9" uniqueId="WHNVMYZK" side="Top">
				<ComponentRef name="554SA3_1"/>
				<FootprintRef name="554SA3_1"/>
				<Org x="120.2288" y="58.5931"/>
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
			<CompInstance name="R21" uniqueId="JAOHWEPN" side="Top" fixed="on">
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
			<CompInstance name="R23" uniqueId="AJBKVUFC" side="Top" fixed="on">
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
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000000"/>
				<Subwire width="0.4">
					<Start x="47.9" y="44.15"/>
					<TrackLine>
						<End x="45.4" y="37.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000002"/>
				<Subwire width="0.4">
					<Start x="42.9" y="41.4908"/>
					<TrackLine>
						<End x="44" y="37.3502"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0213" y="37.2988"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000003"/>
				<Subwire width="0.4">
					<Start x="50.4" y="44.15"/>
					<TrackLine>
						<End x="52.3387" y="42.831"/>
					</TrackLine>
					<TrackLine>
						<End x="52.3642" y="42.8204"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4358" y="42.8204"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4613" y="42.8098"/>
					</TrackLine>
					<TrackLine>
						<End x="54.219" y="42.0521"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9" y="37.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000007"/>
				<Subwire width="0.4">
					<Start x="97.839" y="66.4366"/>
					<TrackLine>
						<End x="98.089" y="67.1554"/>
					</TrackLine>
					<TrackLine>
						<End x="98.2397" y="67.5193"/>
					</TrackLine>
					<TrackLine>
						<End x="101.65" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="101.65" y="72.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="102.3822" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="110.4" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000005"/>
				<Subwire width="0.4">
					<Start x="105.339" y="58.9366"/>
					<TrackLine>
						<End x="107.2378" y="60.3153"/>
					</TrackLine>
					<TrackLine>
						<End x="107.2892" y="60.3366"/>
					</TrackLine>
					<TrackLine>
						<End x="108.3888" y="60.3366"/>
					</TrackLine>
					<TrackLine>
						<End x="113.3888" y="60.3366"/>
					</TrackLine>
					<TrackLine>
						<End x="125.7786" y="59.9931"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2466" y="59.8431"/>
					</TrackLine>
					<TrackLine>
						<End x="128.9788" y="59.1109"/>
					</TrackLine>
					<TrackLine>
						<End x="128.9788" y="58.0753"/>
					</TrackLine>
					<TrackLine>
						<End x="129.711" y="57.3431"/>
					</TrackLine>
					<TrackLine>
						<End x="134.6407" y="54.9846"/>
					</TrackLine>
					<TrackLine>
						<End x="134.6921" y="54.9633"/>
					</TrackLine>
					<TrackLine>
						<End x="135.7917" y="54.9633"/>
					</TrackLine>
					<TrackLine>
						<End x="135.8431" y="54.9846"/>
					</TrackLine>
					<TrackLine>
						<End x="136.6206" y="55.7621"/>
					</TrackLine>
					<TrackLine>
						<End x="136.6419" y="55.8135"/>
					</TrackLine>
					<TrackLine>
						<End x="138.6664" y="60.9703"/>
					</TrackLine>
					<TrackLine>
						<End x="138.6877" y="61.0217"/>
					</TrackLine>
					<TrackLine>
						<End x="139.4652" y="61.7992"/>
					</TrackLine>
					<TrackLine>
						<End x="144.8964" y="65.777"/>
					</TrackLine>
					<TrackLine>
						<End x="145.7034" y="66.584"/>
					</TrackLine>
					<TrackLine>
						<End x="145.7407" y="66.6741"/>
					</TrackLine>
					<TrackLine>
						<End x="145.8857" y="71.6452"/>
					</TrackLine>
					<TrackLine>
						<End x="145.8857" y="72.8442"/>
					</TrackLine>
					<TrackLine>
						<End x="145.8263" y="72.9875"/>
					</TrackLine>
					<TrackLine>
						<End x="144.6583" y="75.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000006"/>
				<Subwire width="0.4">
					<Start x="144.6583" y="80.4"/>
					<TrackLine>
						<End x="131.8388" y="99.1757"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="87.1656" y="42.6203"/>
					<TrackLine>
						<End x="88.5656" y="54.5705"/>
					</TrackLine>
					<TrackLine>
						<End x="88.5656" y="55.6701"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3855" y="56.181"/>
					</TrackLine>
					<TrackLine>
						<End x="88.0673" y="56.9492"/>
					</TrackLine>
					<TrackLine>
						<End x="86.7413" y="58.2752"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0746" y="62.7532"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0105" y="65.3675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="102.8737" y="39.27"/>
					<TrackLine>
						<End x="101.4646" y="37.9229"/>
					</TrackLine>
					<TrackLine>
						<End x="101.4605" y="37.9212"/>
					</TrackLine>
					<TrackLine>
						<End x="99.8758" y="37.9213"/>
					</TrackLine>
					<TrackLine>
						<End x="99.8717" y="37.9196"/>
					</TrackLine>
					<TrackLine>
						<End x="97.9" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000010"/>
				<Subwire width="0.4">
					<Start x="55.4" y="79.15"/>
					<TrackLine>
						<End x="54.5768" y="80.5593"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000010"/>
				<Subwire width="0.4">
					<Start x="107.9" y="79.15"/>
					<TrackLine>
						<End x="99.8822" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="72.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="98.4178" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="93.5012" y="67.6951"/>
					</TrackLine>
					<TrackLine>
						<End x="93.4498" y="67.6738"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3502" y="67.6738"/>
					</TrackLine>
					<TrackLine>
						<End x="76.3038" y="68.3716"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0059" y="68.495"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9138" y="68.587"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8954" y="68.5946"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9691" y="69.192"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2369" y="69.9242"/>
					</TrackLine>
					<TrackLine>
						<End x="73.2369" y="70.9598"/>
					</TrackLine>
					<TrackLine>
						<End x="72.5047" y="71.692"/>
					</TrackLine>
					<TrackLine>
						<End x="65.7344" y="78.3389"/>
					</TrackLine>
					<TrackLine>
						<End x="64.7178" y="79.3555"/>
					</TrackLine>
					<TrackLine>
						<End x="64.5671" y="79.7194"/>
					</TrackLine>
					<TrackLine>
						<End x="64.1846" y="81.6369"/>
					</TrackLine>
					<TrackLine>
						<End x="64" y="82.6374"/>
					</TrackLine>
					<TrackLine>
						<End x="63.6438" y="83.4974"/>
					</TrackLine>
					<TrackLine>
						<End x="62.2474" y="84.8938"/>
					</TrackLine>
					<TrackLine>
						<End x="61.1428" y="85.7406"/>
					</TrackLine>
					<TrackLine>
						<End x="60.9995" y="85.8"/>
					</TrackLine>
					<TrackLine>
						<End x="59.8005" y="85.8"/>
					</TrackLine>
					<TrackLine>
						<End x="59.6572" y="85.7406"/>
					</TrackLine>
					<TrackLine>
						<End x="55.8107" y="82.3301"/>
					</TrackLine>
					<TrackLine>
						<End x="55.0332" y="81.5526"/>
					</TrackLine>
					<TrackLine>
						<End x="54.5768" y="80.5593"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000010"/>
				<Subwire width="0.4">
					<Start x="54.5768" y="80.5593"/>
					<TrackLine>
						<End x="52.3502" y="80.55"/>
					</TrackLine>
					<TrackLine>
						<End x="52.2988" y="80.5287"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="52.9" y="44.15"/>
					<TrackLine>
						<End x="57.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000022"/>
				<Subwire width="0.4">
					<Start x="79.4869" y="70.442"/>
					<TrackLine>
						<End x="77.5047" y="69.192"/>
					</TrackLine>
					<TrackLine>
						<End x="76.4691" y="69.192"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7369" y="69.9242"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7369" y="70.9598"/>
					</TrackLine>
					<TrackLine>
						<End x="75.0047" y="71.692"/>
					</TrackLine>
					<TrackLine>
						<End x="68.8857" y="76.5633"/>
					</TrackLine>
					<TrackLine>
						<End x="66.2159" y="79.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4384" y="79.837"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4171" y="79.8884"/>
					</TrackLine>
					<TrackLine>
						<End x="65.0346" y="81.8059"/>
					</TrackLine>
					<TrackLine>
						<End x="64.85" y="82.7392"/>
					</TrackLine>
					<TrackLine>
						<End x="64.8243" y="82.8686"/>
					</TrackLine>
					<TrackLine>
						<End x="64.3901" y="83.9167"/>
					</TrackLine>
					<TrackLine>
						<End x="64.3168" y="84.0265"/>
					</TrackLine>
					<TrackLine>
						<End x="62.7765" y="85.5668"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4" y="87.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000012"/>
				<Subwire width="0.4">
					<Start x="110.4" y="36.65"/>
					<TrackLine>
						<End x="110.3737" y="39.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000013"/>
				<Subwire width="0.4">
					<Start x="110.4" y="71.65"/>
					<TrackLine>
						<End x="108.5012" y="73.0287"/>
					</TrackLine>
					<TrackLine>
						<End x="108.4498" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="107.3502" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="104.8822" y="72.9"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="72.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="103.4178" y="70.4"/>
					</TrackLine>
					<TrackLine>
						<End x="99.8212" y="67.6866"/>
					</TrackLine>
					<TrackLine>
						<End x="99.089" y="66.9544"/>
					</TrackLine>
					<TrackLine>
						<End x="99.089" y="65.9188"/>
					</TrackLine>
					<TrackLine>
						<End x="96.5979" y="59.4758"/>
					</TrackLine>
					<TrackLine>
						<End x="96.589" y="59.4544"/>
					</TrackLine>
					<TrackLine>
						<End x="96.589" y="58.4188"/>
					</TrackLine>
					<TrackLine>
						<End x="96.5979" y="58.3974"/>
					</TrackLine>
					<TrackLine>
						<End x="96.5979" y="57.9758"/>
					</TrackLine>
					<TrackLine>
						<End x="96.5" y="57.1998"/>
					</TrackLine>
					<TrackLine>
						<End x="96.5" y="54.6998"/>
					</TrackLine>
					<TrackLine>
						<End x="96.5" y="53.6002"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="52.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="51.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="95.95" y="44.9828"/>
					</TrackLine>
					<TrackLine>
						<End x="95.95" y="44.9"/>
					</TrackLine>
					<TrackLine>
						<End x="95.95" y="44.7"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000014"/>
				<Subwire width="0.4">
					<Start x="105.4" y="71.65"/>
					<TrackLine>
						<End x="105.1096" y="70.9392"/>
					</TrackLine>
					<TrackLine>
						<End x="104.965" y="70.5902"/>
					</TrackLine>
					<TrackLine>
						<End x="104.0384" y="69.6636"/>
					</TrackLine>
					<TrackLine>
						<End x="104.0202" y="69.6195"/>
					</TrackLine>
					<TrackLine>
						<End x="104.0202" y="68.5281"/>
					</TrackLine>
					<TrackLine>
						<End x="104.089" y="66.9544"/>
					</TrackLine>
					<TrackLine>
						<End x="104.089" y="59.4544"/>
					</TrackLine>
					<TrackLine>
						<End x="104.089" y="58.4188"/>
					</TrackLine>
					<TrackLine>
						<End x="104" y="57.1998"/>
					</TrackLine>
					<TrackLine>
						<End x="104" y="54.6998"/>
					</TrackLine>
					<TrackLine>
						<End x="104" y="53.6002"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="52.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="51.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="36.65" y="79.15"/>
					<TrackLine>
						<End x="42.3502" y="80.55"/>
					</TrackLine>
					<TrackLine>
						<End x="43.4498" y="80.55"/>
					</TrackLine>
					<TrackLine>
						<End x="43.5012" y="80.5287"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="97.9" y="54.15"/>
					<TrackLine>
						<End x="99.15" y="52.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="51.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="96.6589" y="44.6892"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="44.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="43.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="96.6589" y="43.6108"/>
					</TrackLine>
					<TrackLine>
						<End x="96.8962" y="41.5422"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="89.5596" y="39.7803"/>
					<TrackLine>
						<End x="93.4363" y="39.1925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000031"/>
				<Subwire width="0.4">
					<Start x="52.8441" y="87.3371"/>
					<TrackLine>
						<End x="52.05" y="83.5505"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9906" y="83.4072"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000023"/>
				<Subwire width="0.4">
					<Start x="70.4" y="87.9"/>
					<TrackLine>
						<End x="68.8094" y="84.8928"/>
					</TrackLine>
					<TrackLine>
						<End x="68.75" y="84.7495"/>
					</TrackLine>
					<TrackLine>
						<End x="68.75" y="82.2495"/>
					</TrackLine>
					<TrackLine>
						<End x="68.75" y="81.0505"/>
					</TrackLine>
					<TrackLine>
						<End x="68.8094" y="80.9072"/>
					</TrackLine>
					<TrackLine>
						<End x="70.7369" y="78.4598"/>
					</TrackLine>
					<TrackLine>
						<End x="70.7369" y="77.4242"/>
					</TrackLine>
					<TrackLine>
						<End x="71.4551" y="76.2362"/>
					</TrackLine>
					<TrackLine>
						<End x="72.7811" y="74.9102"/>
					</TrackLine>
					<TrackLine>
						<End x="75.5696" y="72.5413"/>
					</TrackLine>
					<TrackLine>
						<End x="76.5862" y="71.5247"/>
					</TrackLine>
					<TrackLine>
						<End x="76.7369" y="71.1608"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9869" y="70.442"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000046"/>
				<Subwire width="0.4">
					<Start x="77.9" y="34.15"/>
					<TrackLine>
						<End x="80.4" y="37.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000033"/>
				<Subwire width="0.4">
					<Start x="152.8084" y="54.2105"/>
					<TrackLine>
						<End x="151.6367" y="57.3511"/>
					</TrackLine>
					<TrackLine>
						<End x="151.6367" y="58.0508"/>
					</TrackLine>
					<TrackLine>
						<End x="149.2971" y="64.1472"/>
					</TrackLine>
					<TrackLine>
						<End x="149.2956" y="64.1509"/>
					</TrackLine>
					<TrackLine>
						<End x="148.9722" y="64.4743"/>
					</TrackLine>
					<TrackLine>
						<End x="148.9707" y="64.478"/>
					</TrackLine>
					<TrackLine>
						<End x="148.9707" y="65.5258"/>
					</TrackLine>
					<TrackLine>
						<End x="148.9722" y="65.5295"/>
					</TrackLine>
					<TrackLine>
						<End x="150.0698" y="67.9251"/>
					</TrackLine>
					<TrackLine>
						<End x="150.0911" y="67.9765"/>
					</TrackLine>
					<TrackLine>
						<End x="150.0911" y="69.0761"/>
					</TrackLine>
					<TrackLine>
						<End x="146.3083" y="80.9995"/>
					</TrackLine>
					<TrackLine>
						<End x="146.2489" y="81.1428"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5594" y="99.6572"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5" y="99.8005"/>
					</TrackLine>
					<TrackLine>
						<End x="127.05" y="113.4995"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9906" y="113.6428"/>
					</TrackLine>
					<TrackLine>
						<End x="126.1428" y="114.4906"/>
					</TrackLine>
					<TrackLine>
						<End x="125.9995" y="114.55"/>
					</TrackLine>
					<TrackLine>
						<End x="90.9995" y="114.55"/>
					</TrackLine>
					<TrackLine>
						<End x="89.8005" y="114.55"/>
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
					<Start x="140.0664" y="60.4205"/>
					<TrackLine>
						<End x="143.584" y="59.6356"/>
					</TrackLine>
					<TrackLine>
						<End x="146.3554" y="58.8113"/>
					</TrackLine>
					<TrackLine>
						<End x="146.4068" y="58.79"/>
					</TrackLine>
					<TrackLine>
						<End x="148.5546" y="57.3919"/>
					</TrackLine>
					<TrackLine>
						<End x="149.2956" y="56.6509"/>
					</TrackLine>
					<TrackLine>
						<End x="149.2971" y="56.6472"/>
					</TrackLine>
					<TrackLine>
						<End x="149.2971" y="55.5994"/>
					</TrackLine>
					<TrackLine>
						<End x="149.0584" y="54.2104"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000036"/>
				<Subwire width="0.4">
					<Start x="143.4302" y="29.9673"/>
					<TrackLine>
						<End x="136.8027" y="27.7171"/>
					</TrackLine>
					<TrackLine>
						<End x="129.8688" y="26.9"/>
					</TrackLine>
					<TrackLine>
						<End x="128.4312" y="26.9"/>
					</TrackLine>
					<TrackLine>
						<End x="112.1812" y="26.9"/>
					</TrackLine>
					<TrackLine>
						<End x="94.3808" y="27.75"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3502" y="30.25"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5062" y="31.0204"/>
					</TrackLine>
					<TrackLine>
						<End x="73.819" y="31.305"/>
					</TrackLine>
					<TrackLine>
						<End x="73.4388" y="31.6853"/>
					</TrackLine>
					<TrackLine>
						<End x="66.1942" y="34.8682"/>
					</TrackLine>
					<TrackLine>
						<End x="64.8682" y="36.1942"/>
					</TrackLine>
					<TrackLine>
						<End x="64.55" y="36.9624"/>
					</TrackLine>
					<TrackLine>
						<End x="64.2449" y="38.595"/>
					</TrackLine>
					<TrackLine>
						<End x="64.2236" y="38.6464"/>
					</TrackLine>
					<TrackLine>
						<End x="63.4461" y="39.4239"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3822" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="56.65" y="43.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="56.65" y="44.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="59.3" y="51.1002"/>
					</TrackLine>
					<TrackLine>
						<End x="59.3" y="52.1998"/>
					</TrackLine>
					<TrackLine>
						<End x="59.3" y="54.859"/>
					</TrackLine>
					<TrackLine>
						<End x="59.2787" y="54.9104"/>
					</TrackLine>
					<TrackLine>
						<End x="58.5012" y="55.6879"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000037"/>
				<Subwire width="0.4">
					<Start x="44.1633" y="65.3411"/>
					<TrackLine>
						<End x="45.4" y="60.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000062"/>
				<Subwire width="0.4">
					<Start x="76.9869" y="77.942"/>
					<TrackLine>
						<End x="78.8564" y="84.7283"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8996" y="84.8326"/>
					</TrackLine>
					<TrackLine>
						<End x="79.7174" y="85.6504"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8217" y="85.6936"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8902" y="85.6936"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9945" y="85.7368"/>
					</TrackLine>
					<TrackLine>
						<End x="80.8123" y="86.5546"/>
					</TrackLine>
					<TrackLine>
						<End x="82.6395" y="89.402"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000062"/>
				<Subwire width="0.4">
					<Start x="60.4" y="101.65"/>
					<TrackLine>
						<End x="62.3928" y="100.7406"/>
					</TrackLine>
					<TrackLine>
						<End x="69.6572" y="95.0594"/>
					</TrackLine>
					<TrackLine>
						<End x="69.8005" y="95"/>
					</TrackLine>
					<TrackLine>
						<End x="70.9995" y="94.55"/>
					</TrackLine>
					<TrackLine>
						<End x="71.1428" y="94.4906"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5439" y="92.5618"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5953" y="92.5405"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6949" y="92.5405"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7463" y="92.5618"/>
					</TrackLine>
					<TrackLine>
						<End x="78.5691" y="93.8278"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7124" y="93.8872"/>
					</TrackLine>
					<TrackLine>
						<End x="79.9114" y="93.8872"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0547" y="93.8278"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9025" y="92.98"/>
					</TrackLine>
					<TrackLine>
						<End x="82.6395" y="89.402"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000062"/>
				<Subwire width="0.4">
					<Start x="82.6395" y="89.402"/>
					<TrackLine>
						<End x="85.7723" y="89.2986"/>
					</TrackLine>
					<TrackLine>
						<End x="86.5405" y="88.9804"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000042"/>
				<Subwire width="0.4">
					<Start x="57.9" y="79.15"/>
					<TrackLine>
						<End x="50.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000077"/>
				<Subwire width="0.4">
					<Start x="121.8299" y="29.1501"/>
					<TrackLine>
						<End x="120.167" y="30.8859"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000077"/>
				<Subwire width="0.4">
					<Start x="120.167" y="30.8859"/>
					<TrackLine>
						<End x="123.2299" y="41.1003"/>
					</TrackLine>
					<TrackLine>
						<End x="123.7465" y="43.2844"/>
					</TrackLine>
					<TrackLine>
						<End x="123.7465" y="43.706"/>
					</TrackLine>
					<TrackLine>
						<End x="123.7376" y="43.7274"/>
					</TrackLine>
					<TrackLine>
						<End x="123.7376" y="44.763"/>
					</TrackLine>
					<TrackLine>
						<End x="127.4876" y="51.7452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000077"/>
				<Subwire width="0.4">
					<Start x="116.9768" y="30.1044"/>
					<TrackLine>
						<End x="120.167" y="30.8859"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000045"/>
				<Subwire width="0.4">
					<Start x="70.4" y="44.15"/>
					<TrackLine>
						<End x="69.15" y="51.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="69.15" y="52.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="69.2812" y="63.5233"/>
					</TrackLine>
					<TrackLine>
						<End x="69.2812" y="64.6229"/>
					</TrackLine>
					<TrackLine>
						<End x="69.2599" y="64.6743"/>
					</TrackLine>
					<TrackLine>
						<End x="67.8635" y="67.2844"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000045"/>
				<Subwire width="0.4">
					<Start x="84.8347" y="93.4486"/>
					<TrackLine>
						<End x="87.0069" y="95.5553"/>
					</TrackLine>
					<TrackLine>
						<End x="87.0583" y="95.5766"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3279" y="95.9515"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3793" y="95.9728"/>
					</TrackLine>
					<TrackLine>
						<End x="89.1568" y="96.7503"/>
					</TrackLine>
					<TrackLine>
						<End x="94.7082" y="109.5501"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4857" y="110.3276"/>
					</TrackLine>
					<TrackLine>
						<End x="100.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="84.3913" y="95.4"/>
					<TrackLine>
						<End x="87.7781" y="97.3515"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="84.8347" y="85.9486"/>
					<TrackLine>
						<End x="81.9465" y="80.9366"/>
					</TrackLine>
					<TrackLine>
						<End x="81.1134" y="80.1035"/>
					</TrackLine>
					<TrackLine>
						<End x="78.9691" y="79.192"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2369" y="78.4598"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2369" y="77.4242"/>
					</TrackLine>
					<TrackLine>
						<End x="77.5047" y="76.692"/>
					</TrackLine>
					<TrackLine>
						<End x="76.4691" y="76.692"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4869" y="77.942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="77.9" y="44.15"/>
					<TrackLine>
						<End x="74.15" y="51.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="74.15" y="52.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8818" y="55.7825"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8687" y="55.8142"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9369" y="56.746"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9238" y="56.7777"/>
					</TrackLine>
					<TrackLine>
						<End x="70.0369" y="69.6092"/>
					</TrackLine>
					<TrackLine>
						<End x="70.0369" y="69.692"/>
					</TrackLine>
					<TrackLine>
						<End x="70.0369" y="69.892"/>
					</TrackLine>
					<TrackLine>
						<End x="69.4869" y="70.442"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000059"/>
				<Subwire width="0.4">
					<Start x="80.4" y="51.65"/>
					<TrackLine>
						<End x="80.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000061"/>
				<Subwire width="0.4">
					<Start x="71.9869" y="70.442"/>
					<TrackLine>
						<End x="70.5061" y="71.842"/>
					</TrackLine>
					<TrackLine>
						<End x="66.8171" y="72.9382"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000063"/>
				<Subwire width="0.4">
					<Start x="109.6987" y="84.15"/>
					<TrackLine>
						<End x="105.2982" y="82.5"/>
					</TrackLine>
					<TrackLine>
						<End x="104.0992" y="82.5"/>
					</TrackLine>
					<TrackLine>
						<End x="103.9559" y="82.5594"/>
					</TrackLine>
					<TrackLine>
						<End x="101.7894" y="83.7844"/>
					</TrackLine>
					<TrackLine>
						<End x="101.4255" y="83.9351"/>
					</TrackLine>
					<TrackLine>
						<End x="99.9879" y="83.9351"/>
					</TrackLine>
					<TrackLine>
						<End x="99.624" y="83.7844"/>
					</TrackLine>
					<TrackLine>
						<End x="97.3928" y="82.5594"/>
					</TrackLine>
					<TrackLine>
						<End x="97.2495" y="82.5"/>
					</TrackLine>
					<TrackLine>
						<End x="88.1579" y="80.2766"/>
					</TrackLine>
					<TrackLine>
						<End x="83.7681" y="80.192"/>
					</TrackLine>
					<TrackLine>
						<End x="81.4475" y="79.29"/>
					</TrackLine>
					<TrackLine>
						<End x="81.4151" y="79.2766"/>
					</TrackLine>
					<TrackLine>
						<End x="79.4869" y="77.942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000064"/>
				<Subwire width="0.4">
					<Start x="126.65" y="84.15"/>
					<TrackLine>
						<End x="122.2495" y="85.8"/>
					</TrackLine>
					<TrackLine>
						<End x="121.0505" y="85.8"/>
					</TrackLine>
					<TrackLine>
						<End x="110.2982" y="82.5"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4673" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="103.9301" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="103.4744" y="81.8388"/>
					</TrackLine>
					<TrackLine>
						<End x="101.3079" y="83.0638"/>
					</TrackLine>
					<TrackLine>
						<End x="101.2565" y="83.0851"/>
					</TrackLine>
					<TrackLine>
						<End x="100.1569" y="83.0851"/>
					</TrackLine>
					<TrackLine>
						<End x="100.1055" y="83.0638"/>
					</TrackLine>
					<TrackLine>
						<End x="97.8743" y="81.8388"/>
					</TrackLine>
					<TrackLine>
						<End x="97.4186" y="81.65"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3269" y="79.4266"/>
					</TrackLine>
					<TrackLine>
						<End x="83.9371" y="79.342"/>
					</TrackLine>
					<TrackLine>
						<End x="83.8857" y="79.3207"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9869" y="77.942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000067"/>
				<Subwire width="0.4">
					<Start x="52.9526" y="102.277"/>
					<TrackLine>
						<End x="52.05" y="104.7495"/>
					</TrackLine>
					<TrackLine>
						<End x="51.9906" y="104.8928"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4" y="106.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000071"/>
				<Subwire width="0.4">
					<Start x="76.4488" y="95.4403"/>
					<TrackLine>
						<End x="80.4" y="96.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000073"/>
				<Subwire width="0.4">
					<Start x="107.1987" y="94.15"/>
					<TrackLine>
						<End x="113.7982" y="94.2769"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="100.7067" y="81.6851"/>
					<TrackLine>
						<End x="103.7611" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="105.6363" y="80.8"/>
					</TrackLine>
					<TrackLine>
						<End x="113.7982" y="81.7769"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="39.15" y="110.4"/>
					<TrackLine>
						<End x="40.4" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="41.15" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="41.4607" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3456" y="104.5931"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="39.15" y="30.4"/>
					<TrackLine>
						<End x="40.4" y="31.65"/>
					</TrackLine>
					<TrackLine>
						<End x="41.15" y="31.65"/>
					</TrackLine>
					<TrackLine>
						<End x="41.4607" y="31.65"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7558" y="32.275"/>
					</TrackLine>
					<TrackLine>
						<End x="46.0442" y="32.275"/>
					</TrackLine>
					<TrackLine>
						<End x="46.2703" y="32.3686"/>
					</TrackLine>
					<TrackLine>
						<End x="47.1814" y="33.2797"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9" y="41.4908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="82.9" y="44.15"/>
					<TrackLine>
						<End x="86.9855" y="54.5842"/>
					</TrackLine>
					<TrackLine>
						<End x="87.1656" y="55.1203"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="112.839" y="58.9366"/>
					<TrackLine>
						<End x="115.2834" y="55.7026"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="114.15" y="99.15"/>
					<TrackLine>
						<End x="105.5594" y="96.6775"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="121.65" y="84.15"/>
					<TrackLine>
						<End x="119.6794" y="80.8559"/>
					</TrackLine>
					<TrackLine>
						<End x="119.5744" y="80.6023"/>
					</TrackLine>
					<TrackLine>
						<End x="119.5744" y="79.2839"/>
					</TrackLine>
					<TrackLine>
						<End x="119.7888" y="78.075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="105.5594" y="96.6775"/>
					<TrackLine>
						<End x="100.4" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="115.2834" y="55.7026"/>
					<TrackLine>
						<End x="110.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="112.9" y="29.15"/>
					<TrackLine>
						<End x="112.9" y="29.9186"/>
					</TrackLine>
					<TrackLine>
						<End x="112.7112" y="30.3743"/>
					</TrackLine>
					<TrackLine>
						<End x="111.6243" y="31.4612"/>
					</TrackLine>
					<TrackLine>
						<End x="104.4872" y="34.805"/>
					</TrackLine>
					<TrackLine>
						<End x="103.555" y="35.7372"/>
					</TrackLine>
					<TrackLine>
						<End x="102.9" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="57.9" y="44.15"/>
					<TrackLine>
						<End x="60.9999" y="51.458"/>
					</TrackLine>
					<TrackLine>
						<End x="63.6151" y="56.404"/>
					</TrackLine>
					<TrackLine>
						<End x="63.7201" y="56.6576"/>
					</TrackLine>
					<TrackLine>
						<End x="63.7201" y="57.976"/>
					</TrackLine>
					<TrackLine>
						<End x="62.9" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="119.7888" y="78.075"/>
					<TrackLine>
						<End x="121.5244" y="77.4431"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="112.9" y="71.65"/>
					<TrackLine>
						<End x="119.7888" y="78.075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="60.4" y="84.15"/>
					<TrackLine>
						<End x="61.4544" y="83.7069"/>
					</TrackLine>
					<TrackLine>
						<End x="62.4569" y="82.7044"/>
					</TrackLine>
					<TrackLine>
						<End x="62.6" y="82.3589"/>
					</TrackLine>
					<TrackLine>
						<End x="62.6" y="80.9411"/>
					</TrackLine>
					<TrackLine>
						<End x="62.4569" y="80.5956"/>
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
					<Start x="102.9" y="36.65"/>
					<TrackLine>
						<End x="103.6657" y="37.4888"/>
					</TrackLine>
					<TrackLine>
						<End x="104.5612" y="38.3843"/>
					</TrackLine>
					<TrackLine>
						<End x="108.8128" y="42.305"/>
					</TrackLine>
					<TrackLine>
						<End x="109.745" y="43.2372"/>
					</TrackLine>
					<TrackLine>
						<End x="110.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="81.3318" y="61.1626"/>
					<TrackLine>
						<End x="85.9483" y="57.0884"/>
					</TrackLine>
					<TrackLine>
						<End x="86.8805" y="56.1562"/>
					</TrackLine>
					<TrackLine>
						<End x="86.9855" y="55.9026"/>
					</TrackLine>
					<TrackLine>
						<End x="87.1656" y="55.1203"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="125.2288" y="58.5931"/>
					<TrackLine>
						<End x="124.5738" y="57.6803"/>
					</TrackLine>
					<TrackLine>
						<End x="123.6416" y="56.7481"/>
					</TrackLine>
					<TrackLine>
						<End x="123.388" y="56.6431"/>
					</TrackLine>
					<TrackLine>
						<End x="115.2834" y="55.7026"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="104.6987" y="84.15"/>
					<TrackLine>
						<End x="104.9987" y="94.8589"/>
					</TrackLine>
					<TrackLine>
						<End x="105.5594" y="96.6775"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="80.4" y="84.15"/>
					<TrackLine>
						<End x="80.8478" y="84.4597"/>
					</TrackLine>
					<TrackLine>
						<End x="82.0894" y="85.7013"/>
					</TrackLine>
					<TrackLine>
						<End x="82.9897" y="86.8614"/>
					</TrackLine>
					<TrackLine>
						<End x="83.9219" y="87.7936"/>
					</TrackLine>
					<TrackLine>
						<End x="84.1755" y="87.8986"/>
					</TrackLine>
					<TrackLine>
						<End x="85.4939" y="87.8986"/>
					</TrackLine>
					<TrackLine>
						<End x="85.7475" y="87.7936"/>
					</TrackLine>
					<TrackLine>
						<End x="91.65" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="57.9" y="44.15"/>
					<TrackLine>
						<End x="64.2391" y="40.6107"/>
					</TrackLine>
					<TrackLine>
						<End x="65.4104" y="39.4394"/>
					</TrackLine>
					<TrackLine>
						<End x="65.6449" y="38.8734"/>
					</TrackLine>
					<TrackLine>
						<End x="65.95" y="37.2408"/>
					</TrackLine>
					<TrackLine>
						<End x="66.055" y="36.9872"/>
					</TrackLine>
					<TrackLine>
						<End x="66.9872" y="36.055"/>
					</TrackLine>
					<TrackLine>
						<End x="74.1694" y="32.7787"/>
					</TrackLine>
					<TrackLine>
						<End x="74.5497" y="32.3985"/>
					</TrackLine>
					<TrackLine>
						<End x="74.7628" y="32.3102"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9" y="31.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="127.7288" y="58.5931"/>
					<TrackLine>
						<End x="124.4346" y="55.5613"/>
					</TrackLine>
					<TrackLine>
						<End x="123.6664" y="55.2431"/>
					</TrackLine>
					<TrackLine>
						<End x="118.9649" y="53.8489"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="127.7288" y="58.5931"/>
					<TrackLine>
						<End x="127.9788" y="57.8743"/>
					</TrackLine>
					<TrackLine>
						<End x="128.1295" y="57.5104"/>
					</TrackLine>
					<TrackLine>
						<End x="129.1461" y="56.4938"/>
					</TrackLine>
					<TrackLine>
						<End x="134.1592" y="54.264"/>
					</TrackLine>
					<TrackLine>
						<End x="134.5231" y="54.1133"/>
					</TrackLine>
					<TrackLine>
						<End x="135.9607" y="54.1133"/>
					</TrackLine>
					<TrackLine>
						<End x="136.3246" y="54.264"/>
					</TrackLine>
					<TrackLine>
						<End x="138.778" y="56.6148"/>
					</TrackLine>
					<TrackLine>
						<End x="138.8294" y="56.6361"/>
					</TrackLine>
					<TrackLine>
						<End x="139.929" y="56.6361"/>
					</TrackLine>
					<TrackLine>
						<End x="145.2558" y="56.0113"/>
					</TrackLine>
					<TrackLine>
						<End x="146.3554" y="56.0113"/>
					</TrackLine>
					<TrackLine>
						<End x="148.027" y="56.1233"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="118.9649" y="53.8489"/>
					<TrackLine>
						<End x="116.0482" y="51.7438"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000079"/>
				<Subwire width="0.4">
					<Start x="144.2357" y="67.2447"/>
					<TrackLine>
						<End x="142.2429" y="68.1541"/>
					</TrackLine>
					<TrackLine>
						<End x="141.3951" y="69.0019"/>
					</TrackLine>
					<TrackLine>
						<End x="140.5225" y="70.2138"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="133.7832" y="73.1164"/>
					<TrackLine>
						<End x="125.8" y="94.7495"/>
					</TrackLine>
					<TrackLine>
						<End x="125.7406" y="94.8928"/>
					</TrackLine>
					<TrackLine>
						<End x="121.0076" y="102.0511"/>
					</TrackLine>
					<TrackLine>
						<End x="120.6894" y="102.8193"/>
					</TrackLine>
					<TrackLine>
						<End x="120.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="135.2419" y="56.3633"/>
					<TrackLine>
						<End x="132.211" y="57.3431"/>
					</TrackLine>
					<TrackLine>
						<End x="131.4788" y="58.0753"/>
					</TrackLine>
					<TrackLine>
						<End x="131.4788" y="59.1109"/>
					</TrackLine>
					<TrackLine>
						<End x="126.4788" y="65.5753"/>
					</TrackLine>
					<TrackLine>
						<End x="126.4788" y="66.6109"/>
					</TrackLine>
					<TrackLine>
						<End x="127.197" y="67.7989"/>
					</TrackLine>
					<TrackLine>
						<End x="128.523" y="69.1249"/>
					</TrackLine>
					<TrackLine>
						<End x="133.7832" y="73.1164"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000087"/>
				<Subwire width="1">
					<Start x="140.4402" y="103.3827"/>
					<TrackLine>
						<End x="140.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="36.65" y="66.65"/>
					<TrackLine>
						<End x="40.8431" y="60.5956"/>
					</TrackLine>
					<TrackLine>
						<End x="43.555" y="57.0403"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4375" y="56.0864"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="44.4375" y="56.0864"/>
					<TrackLine>
						<End x="43.5659" y="55.2147"/>
					</TrackLine>
					<TrackLine>
						<End x="43.4628" y="54.9658"/>
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
					<Start x="110.4" y="112.9"/>
					<TrackLine>
						<End x="109.2509" y="110.4916"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="96.0869" y="108.9489"/>
					<TrackLine>
						<End x="104.996" y="110.2029"/>
					</TrackLine>
					<TrackLine>
						<End x="109.2509" y="110.4916"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="127.7288" y="66.0931"/>
					<TrackLine>
						<End x="128.3838" y="67.0059"/>
					</TrackLine>
					<TrackLine>
						<End x="129.316" y="67.9381"/>
					</TrackLine>
					<TrackLine>
						<End x="129.5696" y="68.0431"/>
					</TrackLine>
					<TrackLine>
						<End x="134.9029" y="69.0948"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="84.4869" y="70.442"/>
					<TrackLine>
						<End x="83.8319" y="71.3548"/>
					</TrackLine>
					<TrackLine>
						<End x="82.8997" y="72.287"/>
					</TrackLine>
					<TrackLine>
						<End x="82.6461" y="72.392"/>
					</TrackLine>
					<TrackLine>
						<End x="73.8277" y="75.992"/>
					</TrackLine>
					<TrackLine>
						<End x="73.5741" y="76.097"/>
					</TrackLine>
					<TrackLine>
						<End x="72.6419" y="77.0292"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9869" y="77.942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="109.2509" y="110.4916"/>
					<TrackLine>
						<End x="111.3102" y="107.3401"/>
					</TrackLine>
					<TrackLine>
						<End x="114.15" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="62.9" y="34.15"/>
					<TrackLine>
						<End x="62.8449" y="38.0452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="96.0869" y="108.9489"/>
					<TrackLine>
						<End x="91.5041" y="98.1808"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="140.5225" y="82.7138"/>
					<TrackLine>
						<End x="124.0394" y="103.7569"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="95.4" y="79.15"/>
					<TrackLine>
						<End x="91.1695" y="72.2753"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="140.5225" y="82.7138"/>
					<TrackLine>
						<End x="143.4083" y="77.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="81.65" y="99.15"/>
					<TrackLine>
						<End x="71.65" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="57.9" y="54.3092"/>
					<TrackLine>
						<End x="46.0337" y="56.1312"/>
					</TrackLine>
					<TrackLine>
						<End x="44.7663" y="56.1312"/>
					</TrackLine>
					<TrackLine>
						<End x="44.4375" y="56.0864"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="139.3792" y="55.2361"/>
					<TrackLine>
						<End x="137.1176" y="53.0772"/>
					</TrackLine>
					<TrackLine>
						<End x="136.2392" y="52.7133"/>
					</TrackLine>
					<TrackLine>
						<End x="134.2446" y="52.7133"/>
					</TrackLine>
					<TrackLine>
						<End x="130.6468" y="53.6952"/>
					</TrackLine>
					<TrackLine>
						<End x="128.1468" y="53.6952"/>
					</TrackLine>
					<TrackLine>
						<End x="126.8284" y="53.6952"/>
					</TrackLine>
					<TrackLine>
						<End x="126.5748" y="53.5902"/>
					</TrackLine>
					<TrackLine>
						<End x="125.6426" y="52.658"/>
					</TrackLine>
					<TrackLine>
						<End x="124.9876" y="51.7452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="92.9" y="69.0738"/>
					<TrackLine>
						<End x="91.1695" y="72.2753"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="42.9" y="79.15"/>
					<TrackLine>
						<End x="36.65" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="91.1695" y="72.2753"/>
					<TrackLine>
						<End x="87.6461" y="72.392"/>
					</TrackLine>
					<TrackLine>
						<End x="86.3277" y="72.392"/>
					</TrackLine>
					<TrackLine>
						<End x="86.0741" y="72.287"/>
					</TrackLine>
					<TrackLine>
						<End x="85.1419" y="71.3548"/>
					</TrackLine>
					<TrackLine>
						<End x="84.4869" y="70.442"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="95.4" y="36.65"/>
					<TrackLine>
						<End x="95.3863" y="39.8517"/>
					</TrackLine>
					<TrackLine>
						<End x="95.2813" y="40.1053"/>
					</TrackLine>
					<TrackLine>
						<End x="93.45" y="42.9029"/>
					</TrackLine>
					<TrackLine>
						<End x="93.45" y="43.8971"/>
					</TrackLine>
					<TrackLine>
						<End x="93.45" y="45.3971"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="78.0619" y="89.7372"/>
					<TrackLine>
						<End x="73.6706" y="88.0706"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="73.6706" y="88.0706"/>
					<TrackLine>
						<End x="72.6" y="80.9411"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9869" y="77.942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="69.15" y="90.4"/>
					<TrackLine>
						<End x="71.1089" y="90.1"/>
					</TrackLine>
					<TrackLine>
						<End x="71.4544" y="89.9569"/>
					</TrackLine>
					<TrackLine>
						<End x="73.6706" y="88.0706"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="143.4083" y="77.9"/>
					<TrackLine>
						<End x="138.7427" y="71.0831"/>
					</TrackLine>
					<TrackLine>
						<End x="138.6493" y="70.8577"/>
					</TrackLine>
					<TrackLine>
						<End x="138.6493" y="69.5699"/>
					</TrackLine>
					<TrackLine>
						<End x="138.7427" y="69.3445"/>
					</TrackLine>
					<TrackLine>
						<End x="140.0664" y="67.9205"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000090"/>
				<Subwire width="0.4">
					<Start x="120.6693" y="73.1871"/>
					<TrackLine>
						<End x="122.4265" y="74.7777"/>
					</TrackLine>
					<TrackLine>
						<End x="122.5698" y="74.8371"/>
					</TrackLine>
					<TrackLine>
						<End x="123.7688" y="74.8371"/>
					</TrackLine>
					<TrackLine>
						<End x="123.9121" y="74.7777"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2832" y="73.1164"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000091"/>
				<Subwire width="0.4">
					<Start x="105.4" y="69.0738"/>
					<TrackLine>
						<End x="107.3492" y="70.3313"/>
					</TrackLine>
					<TrackLine>
						<End x="107.3679" y="70.3391"/>
					</TrackLine>
					<TrackLine>
						<End x="108.4321" y="70.3391"/>
					</TrackLine>
					<TrackLine>
						<End x="109.8502" y="70.25"/>
					</TrackLine>
					<TrackLine>
						<End x="112.3502" y="70.25"/>
					</TrackLine>
					<TrackLine>
						<End x="113.4498" y="70.25"/>
					</TrackLine>
					<TrackLine>
						<End x="113.5012" y="70.2713"/>
					</TrackLine>
					<TrackLine>
						<End x="118.1693" y="73.1871"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="80.745" y="57.9"/>
					<TrackLine>
						<End x="81.65" y="52.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="43.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="82.3822" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="88.9584" y="38.4016"/>
					</TrackLine>
					<TrackLine>
						<End x="94.7988" y="35.2713"/>
					</TrackLine>
					<TrackLine>
						<End x="94.8502" y="35.25"/>
					</TrackLine>
					<TrackLine>
						<End x="110.9178" y="30.4"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="29.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="28.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="112.3822" y="27.9"/>
					</TrackLine>
					<TrackLine>
						<End x="121.2801" y="27.7501"/>
					</TrackLine>
					<TrackLine>
						<End x="124.8502" y="27.75"/>
					</TrackLine>
					<TrackLine>
						<End x="128.6002" y="27.75"/>
					</TrackLine>
					<TrackLine>
						<End x="129.6998" y="27.75"/>
					</TrackLine>
					<TrackLine>
						<End x="129.7512" y="27.7713"/>
					</TrackLine>
					<TrackLine>
						<End x="130.5287" y="28.5488"/>
					</TrackLine>
					<TrackLine>
						<End x="131.3768" y="29.6767"/>
					</TrackLine>
					<TrackLine>
						<End x="132.1543" y="30.4542"/>
					</TrackLine>
					<TrackLine>
						<End x="139.3541" y="36.9339"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000095"/>
				<Subwire width="0.4">
					<Start x="78.8318" y="62.4126"/>
					<TrackLine>
						<End x="75.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="UN000096"/>
				<Subwire width="0.4">
					<Start x="61.7701" y="57.3168"/>
					<TrackLine>
						<End x="51.6633" y="65.3411"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="129.9876" y="44.2452"/>
					<TrackLine>
						<End x="130.8702" y="42.4794"/>
					</TrackLine>
					<TrackLine>
						<End x="130.9528" y="42.2799"/>
					</TrackLine>
					<TrackLine>
						<End x="130.9528" y="41.0201"/>
					</TrackLine>
					<TrackLine>
						<End x="129.15" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="123.7632" y="108.0927"/>
					<TrackLine>
						<End x="122.1944" y="104.6697"/>
					</TrackLine>
					<TrackLine>
						<End x="122.0894" y="104.4161"/>
					</TrackLine>
					<TrackLine>
						<End x="122.0894" y="103.0977"/>
					</TrackLine>
					<TrackLine>
						<End x="122.1944" y="102.8441"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9275" y="95.6859"/>
					</TrackLine>
					<TrackLine>
						<End x="127.2" y="95.028"/>
					</TrackLine>
					<TrackLine>
						<End x="135.7332" y="73.7756"/>
					</TrackLine>
					<TrackLine>
						<End x="136.7761" y="69.7387"/>
					</TrackLine>
					<TrackLine>
						<End x="136.7761" y="69.1973"/>
					</TrackLine>
					<TrackLine>
						<End x="137.1788" y="66.7523"/>
					</TrackLine>
					<TrackLine>
						<End x="137.1788" y="65.4339"/>
					</TrackLine>
					<TrackLine>
						<End x="137.0738" y="65.1803"/>
					</TrackLine>
					<TrackLine>
						<End x="132.7288" y="58.5931"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="143.0342" y="45.7356"/>
					<TrackLine>
						<End x="135.9011" y="45.8133"/>
					</TrackLine>
					<TrackLine>
						<End x="134.5827" y="45.8133"/>
					</TrackLine>
					<TrackLine>
						<End x="129.9876" y="44.2452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000000"/>
				<Subwire width="0.4">
					<Start x="45.4" y="37.9"/>
					<TrackLine>
						<End x="44.0213" y="34.7512"/>
					</TrackLine>
					<TrackLine>
						<End x="44" y="34.6998"/>
					</TrackLine>
					<TrackLine>
						<End x="44" y="33.6002"/>
					</TrackLine>
					<TrackLine>
						<End x="44.0213" y="33.5488"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4" y="30.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000001"/>
				<Subwire width="0.4">
					<Start x="57.9" y="34.15"/>
					<TrackLine>
						<End x="56.105" y="33.5836"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000001"/>
				<Subwire width="0.4">
					<Start x="45.4" y="44.15"/>
					<TrackLine>
						<End x="45.65" y="43.4312"/>
					</TrackLine>
					<TrackLine>
						<End x="45.8007" y="43.0673"/>
					</TrackLine>
					<TrackLine>
						<End x="46.8173" y="42.0507"/>
					</TrackLine>
					<TrackLine>
						<End x="56.105" y="33.5836"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000001"/>
				<Subwire width="0.4">
					<Start x="56.105" y="33.5836"/>
					<TrackLine>
						<End x="55.4" y="30.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000002"/>
				<Subwire width="0.4">
					<Start x="42.9" y="44.15"/>
					<TrackLine>
						<End x="42.9" y="43.6"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9" y="43.4"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9" y="41.4908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000002"/>
				<Subwire width="0.4">
					<Start x="39.15" y="44.15"/>
					<TrackLine>
						<End x="42.15" y="44.15"/>
					</TrackLine>
					<TrackLine>
						<End x="42.35" y="44.15"/>
					</TrackLine>
					<TrackLine>
						<End x="42.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000003"/>
				<Subwire width="0.4">
					<Start x="70.4" y="51.65"/>
					<TrackLine>
						<End x="66.5" y="45.1692"/>
					</TrackLine>
					<TrackLine>
						<End x="64.2449" y="37.4954"/>
					</TrackLine>
					<TrackLine>
						<End x="64.2236" y="37.444"/>
					</TrackLine>
					<TrackLine>
						<End x="63.4461" y="36.6665"/>
					</TrackLine>
					<TrackLine>
						<End x="63.3947" y="36.6452"/>
					</TrackLine>
					<TrackLine>
						<End x="62.2951" y="36.6452"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9" y="37.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000003"/>
				<Subwire width="0.4">
					<Start x="36.65" y="46.65"/>
					<TrackLine>
						<End x="46.1188" y="46.4"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4498" y="45.55"/>
					</TrackLine>
					<TrackLine>
						<End x="48.5012" y="45.5287"/>
					</TrackLine>
					<TrackLine>
						<End x="50.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000004"/>
				<Subwire width="0.4">
					<Start x="110.339" y="66.4366"/>
					<TrackLine>
						<End x="111.589" y="59.4544"/>
					</TrackLine>
					<TrackLine>
						<End x="111.589" y="58.4188"/>
					</TrackLine>
					<TrackLine>
						<End x="115.15" y="37.3688"/>
					</TrackLine>
					<TrackLine>
						<End x="115.15" y="35.9312"/>
					</TrackLine>
					<TrackLine>
						<End x="114.3" y="28.6002"/>
					</TrackLine>
					<TrackLine>
						<End x="114.2787" y="28.5488"/>
					</TrackLine>
					<TrackLine>
						<End x="113.5012" y="27.7713"/>
					</TrackLine>
					<TrackLine>
						<End x="113.4498" y="27.75"/>
					</TrackLine>
					<TrackLine>
						<End x="111.1188" y="26.9"/>
					</TrackLine>
					<TrackLine>
						<End x="109.6812" y="26.9"/>
					</TrackLine>
					<TrackLine>
						<End x="99.6812" y="26.9"/>
					</TrackLine>
					<TrackLine>
						<End x="99.3173" y="27.0507"/>
					</TrackLine>
					<TrackLine>
						<End x="97.3822" y="27.9"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="28.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="96.65" y="29.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="96.6589" y="29.6892"/>
					</TrackLine>
					<TrackLine>
						<End x="96.6589" y="30.1108"/>
					</TrackLine>
					<TrackLine>
						<End x="91.337" y="38.1098"/>
					</TrackLine>
					<TrackLine>
						<End x="91.1863" y="38.4737"/>
					</TrackLine>
					<TrackLine>
						<End x="90.9596" y="40.3301"/>
					</TrackLine>
					<TrackLine>
						<End x="90.9383" y="40.3815"/>
					</TrackLine>
					<TrackLine>
						<End x="90.1608" y="41.159"/>
					</TrackLine>
					<TrackLine>
						<End x="90.1094" y="41.1803"/>
					</TrackLine>
					<TrackLine>
						<End x="86.6158" y="41.2203"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9624" y="42.8204"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8642" y="42.8204"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3822" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="76.65" y="43.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="76.65" y="44.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000006"/>
				<Subwire width="0.4">
					<Start x="148.6911" y="81.0263"/>
					<TrackLine>
						<End x="144.6583" y="80.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="97.9" y="36.65"/>
					<TrackLine>
						<End x="96.0012" y="38.0287"/>
					</TrackLine>
					<TrackLine>
						<End x="95.9498" y="38.05"/>
					</TrackLine>
					<TrackLine>
						<End x="94.8502" y="38.05"/>
					</TrackLine>
					<TrackLine>
						<End x="93.9861" y="37.7925"/>
					</TrackLine>
					<TrackLine>
						<End x="92.8865" y="37.7925"/>
					</TrackLine>
					<TrackLine>
						<End x="92.8351" y="37.8138"/>
					</TrackLine>
					<TrackLine>
						<End x="92.0576" y="38.5913"/>
					</TrackLine>
					<TrackLine>
						<End x="92.0363" y="38.6427"/>
					</TrackLine>
					<TrackLine>
						<End x="91.8096" y="40.4991"/>
					</TrackLine>
					<TrackLine>
						<End x="91.6589" y="40.863"/>
					</TrackLine>
					<TrackLine>
						<End x="90.6423" y="41.8796"/>
					</TrackLine>
					<TrackLine>
						<End x="90.2784" y="42.0303"/>
					</TrackLine>
					<TrackLine>
						<End x="87.1656" y="42.6203"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="81.9869" y="70.442"/>
					<TrackLine>
						<End x="78.0105" y="65.3675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000011"/>
				<Subwire width="0.4">
					<Start x="78.0105" y="65.3675"/>
					<TrackLine>
						<End x="75.3635" y="67.2844"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000010"/>
				<Subwire width="0.4">
					<Start x="107.839" y="66.4366"/>
					<TrackLine>
						<End x="107.9" y="69.0281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000010"/>
				<Subwire width="0.4">
					<Start x="107.9" y="69.0281"/>
					<TrackLine>
						<End x="106.65" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="106.65" y="72.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="107.9" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="86.9869" y="77.942"/>
					<TrackLine>
						<End x="89.4105" y="65.9173"/>
					</TrackLine>
					<TrackLine>
						<End x="89.4105" y="64.8177"/>
					</TrackLine>
					<TrackLine>
						<End x="89.3892" y="64.7663"/>
					</TrackLine>
					<TrackLine>
						<End x="83.6568" y="55.8446"/>
					</TrackLine>
					<TrackLine>
						<End x="83.6355" y="55.7932"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2864" y="53.138"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="30.4" y="72.65"/>
					<TrackLine>
						<End x="28.6" y="70.85"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6" y="70.65"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6" y="70.5672"/>
					</TrackLine>
					<TrackLine>
						<End x="28.0622" y="69.6354"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8909" y="69.3609"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8909" y="65.3609"/>
					</TrackLine>
					<TrackLine>
						<End x="27.8909" y="64.9391"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1891" y="64.6409"/>
					</TrackLine>
					<TrackLine>
						<End x="33.5393" y="59.3341"/>
					</TrackLine>
					<TrackLine>
						<End x="34.5841" y="58.2893"/>
					</TrackLine>
					<TrackLine>
						<End x="41.5213" y="51.0488"/>
					</TrackLine>
					<TrackLine>
						<End x="42.2988" y="50.2713"/>
					</TrackLine>
					<TrackLine>
						<End x="42.3502" y="50.25"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8502" y="50.25"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9498" y="50.25"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4178" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="54.15" y="51.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="54.15" y="52.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="54.8822" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="56.2136" y="53.2102"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="83.2864" y="53.138"/>
					<TrackLine>
						<End x="83.5012" y="53.0287"/>
					</TrackLine>
					<TrackLine>
						<End x="94.3808" y="42.75"/>
					</TrackLine>
					<TrackLine>
						<End x="94.5808" y="42.75"/>
					</TrackLine>
					<TrackLine>
						<End x="95.1192" y="42.75"/>
					</TrackLine>
					<TrackLine>
						<End x="96.2053" y="42.7836"/>
					</TrackLine>
					<TrackLine>
						<End x="96.3656" y="42.8461"/>
					</TrackLine>
					<TrackLine>
						<End x="97.4268" y="42.8461"/>
					</TrackLine>
					<TrackLine>
						<End x="97.443" y="42.8394"/>
					</TrackLine>
					<TrackLine>
						<End x="98.1934" y="42.089"/>
					</TrackLine>
					<TrackLine>
						<End x="98.2001" y="42.0728"/>
					</TrackLine>
					<TrackLine>
						<End x="98.6863" y="38.4737"/>
					</TrackLine>
					<TrackLine>
						<End x="98.837" y="38.1098"/>
					</TrackLine>
					<TrackLine>
						<End x="99.8536" y="37.0932"/>
					</TrackLine>
					<TrackLine>
						<End x="100.4" y="36.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="56.2136" y="53.2102"/>
					<TrackLine>
						<End x="56.5" y="54.859"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5213" y="54.9104"/>
					</TrackLine>
					<TrackLine>
						<End x="57.2988" y="55.6879"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3502" y="55.7092"/>
					</TrackLine>
					<TrackLine>
						<End x="58.4498" y="55.7092"/>
					</TrackLine>
					<TrackLine>
						<End x="71.9895" y="53.8623"/>
					</TrackLine>
					<TrackLine>
						<End x="73.6113" y="53.8623"/>
					</TrackLine>
					<TrackLine>
						<End x="73.9613" y="53.7173"/>
					</TrackLine>
					<TrackLine>
						<End x="75.9178" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="76.65" y="52.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="76.65" y="51.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="77.3822" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="79.8822" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9178" y="50.4"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="51.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="52.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="82.3822" y="52.9"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2864" y="53.138"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000008"/>
				<Subwire width="0.4">
					<Start x="57.9" y="51.65"/>
					<TrackLine>
						<End x="56.2136" y="53.2102"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000009"/>
				<Subwire width="0.4">
					<Start x="55.4" y="44.15"/>
					<TrackLine>
						<End x="53.2881" y="48.5765"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000009"/>
				<Subwire width="0.4">
					<Start x="53.2881" y="48.5765"/>
					<TrackLine>
						<End x="54.9993" y="50.5673"/>
					</TrackLine>
					<TrackLine>
						<End x="55.15" y="50.9312"/>
					</TrackLine>
					<TrackLine>
						<End x="55.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000009"/>
				<Subwire width="0.4">
					<Start x="30.4" y="77.65"/>
					<TrackLine>
						<End x="28.6" y="75.85"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6" y="75.65"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6" y="75.5672"/>
					</TrackLine>
					<TrackLine>
						<End x="28.4828" y="75.45"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1308" y="75.3"/>
					</TrackLine>
					<TrackLine>
						<End x="27.75" y="74.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="27.464" y="70.3923"/>
					</TrackLine>
					<TrackLine>
						<End x="27.4344" y="70.0741"/>
					</TrackLine>
					<TrackLine>
						<End x="27.3165" y="69.7894"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1818" y="69.6546"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1818" y="65.6546"/>
					</TrackLine>
					<TrackLine>
						<End x="27.1818" y="64.6454"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8635" y="57.8079"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8007" y="50.5673"/>
					</TrackLine>
					<TrackLine>
						<End x="41.8173" y="49.5507"/>
					</TrackLine>
					<TrackLine>
						<End x="42.1812" y="49.4"/>
					</TrackLine>
					<TrackLine>
						<End x="53.2881" y="48.5765"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000034"/>
				<Subwire width="0.4">
					<Start x="146.1613" y="39.0293"/>
					<TrackLine>
						<End x="143.4302" y="37.4673"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000034"/>
				<Subwire width="0.4">
					<Start x="149.0584" y="41.7104"/>
					<TrackLine>
						<End x="146.1613" y="39.0293"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000034"/>
				<Subwire width="0.4">
					<Start x="152.8084" y="41.7105"/>
					<TrackLine>
						<End x="149.0584" y="41.7104"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="2"/>
				<Subwire width="0.4">
					<Start x="97.9" y="29.15"/>
					<TrackLine>
						<End x="99.8822" y="27.9"/>
					</TrackLine>
					<TrackLine>
						<End x="100.9178" y="27.9"/>
					</TrackLine>
					<TrackLine>
						<End x="101.65" y="28.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="101.65" y="29.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="106.65" y="36.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="106.65" y="37.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="107.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="3"/>
				<Subwire width="0.4">
					<Start x="102.9" y="29.15"/>
					<TrackLine>
						<End x="104.7988" y="27.7713"/>
					</TrackLine>
					<TrackLine>
						<End x="104.8502" y="27.75"/>
					</TrackLine>
					<TrackLine>
						<End x="107.3502" y="27.75"/>
					</TrackLine>
					<TrackLine>
						<End x="108.4498" y="27.75"/>
					</TrackLine>
					<TrackLine>
						<End x="110.9178" y="27.9"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="28.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="29.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="114.3" y="36.1002"/>
					</TrackLine>
					<TrackLine>
						<End x="114.3" y="37.1998"/>
					</TrackLine>
					<TrackLine>
						<End x="112.65" y="44.8688"/>
					</TrackLine>
					<TrackLine>
						<End x="112.4993" y="45.2327"/>
					</TrackLine>
					<TrackLine>
						<End x="107.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="4"/>
				<Subwire width="0.4">
					<Start x="110.4" y="29.15"/>
					<TrackLine>
						<End x="111.65" y="36.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="37.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="111.7737" y="38.7202"/>
					</TrackLine>
					<TrackLine>
						<End x="111.8" y="43.6002"/>
					</TrackLine>
					<TrackLine>
						<End x="111.8" y="44.6998"/>
					</TrackLine>
					<TrackLine>
						<End x="111.7787" y="44.7512"/>
					</TrackLine>
					<TrackLine>
						<End x="110.9318" y="45.8558"/>
					</TrackLine>
					<TrackLine>
						<End x="109.6058" y="47.1818"/>
					</TrackLine>
					<TrackLine>
						<End x="108.8376" y="47.5"/>
					</TrackLine>
					<TrackLine>
						<End x="99.8502" y="50.25"/>
					</TrackLine>
					<TrackLine>
						<End x="99.7988" y="50.2713"/>
					</TrackLine>
					<TrackLine>
						<End x="97.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000017"/>
				<Subwire width="0.4">
					<Start x="100.4" y="44.15"/>
					<TrackLine>
						<End x="100.9363" y="39.1925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000015"/>
				<Subwire width="0.4">
					<Start x="102.9" y="71.65"/>
					<TrackLine>
						<End x="104.089" y="66.9544"/>
					</TrackLine>
					<TrackLine>
						<End x="104.089" y="65.9188"/>
					</TrackLine>
					<TrackLine>
						<End x="106.589" y="59.4544"/>
					</TrackLine>
					<TrackLine>
						<End x="106.589" y="58.4188"/>
					</TrackLine>
					<TrackLine>
						<End x="110.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000016"/>
				<Subwire width="0.4">
					<Start x="100.4" y="79.15"/>
					<TrackLine>
						<End x="99.15" y="72.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="71.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="99.089" y="66.9544"/>
					</TrackLine>
					<TrackLine>
						<End x="99.089" y="59.4544"/>
					</TrackLine>
					<TrackLine>
						<End x="99.089" y="58.4188"/>
					</TrackLine>
					<TrackLine>
						<End x="100.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="1"/>
				<Subwire width="0.4">
					<Start x="100.4" y="29.15"/>
					<TrackLine>
						<End x="101.65" y="36.1322"/>
					</TrackLine>
					<TrackLine>
						<End x="101.65" y="37.1678"/>
					</TrackLine>
					<TrackLine>
						<End x="100.9178" y="37.9"/>
					</TrackLine>
					<TrackLine>
						<End x="100.4121" y="37.9212"/>
					</TrackLine>
					<TrackLine>
						<End x="100.408" y="37.9229"/>
					</TrackLine>
					<TrackLine>
						<End x="99.6667" y="38.6642"/>
					</TrackLine>
					<TrackLine>
						<End x="99.665" y="38.6683"/>
					</TrackLine>
					<TrackLine>
						<End x="99.1462" y="42.261"/>
					</TrackLine>
					<TrackLine>
						<End x="98.9955" y="42.6249"/>
					</TrackLine>
					<TrackLine>
						<End x="97.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000018"/>
				<Subwire width="0.4">
					<Start x="102.9" y="44.15"/>
					<TrackLine>
						<End x="104.3962" y="41.5422"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000019"/>
				<Subwire width="0.4">
					<Start x="105.4" y="51.65"/>
					<TrackLine>
						<End x="106.7787" y="53.5488"/>
					</TrackLine>
					<TrackLine>
						<End x="106.8" y="53.6002"/>
					</TrackLine>
					<TrackLine>
						<End x="106.8" y="54.6998"/>
					</TrackLine>
					<TrackLine>
						<End x="106.7787" y="54.7512"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4" y="56.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000020"/>
				<Subwire width="0.4">
					<Start x="102.9" y="51.65"/>
					<TrackLine>
						<End x="105.4" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="93.4363" y="39.1925"/>
					<TrackLine>
						<End x="96.8962" y="41.5422"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="97.9" y="56.65"/>
					<TrackLine>
						<End x="97.9" y="54.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000021"/>
				<Subwire width="0.4">
					<Start x="30.4" y="44.65"/>
					<TrackLine>
						<End x="32.2" y="46.45"/>
					</TrackLine>
					<TrackLine>
						<End x="32.2" y="46.65"/>
					</TrackLine>
					<TrackLine>
						<End x="32.2" y="46.7328"/>
					</TrackLine>
					<TrackLine>
						<End x="33.05" y="47.8808"/>
					</TrackLine>
					<TrackLine>
						<End x="33.05" y="48.4192"/>
					</TrackLine>
					<TrackLine>
						<End x="33.05" y="57.4192"/>
					</TrackLine>
					<TrackLine>
						<End x="26.5742" y="64.25"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4726" y="64.4953"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4726" y="65.8047"/>
					</TrackLine>
					<TrackLine>
						<End x="26.4726" y="69.8047"/>
					</TrackLine>
					<TrackLine>
						<End x="26.614" y="70.2471"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9" y="75.2196"/>
					</TrackLine>
					<TrackLine>
						<End x="27.75" y="79.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1308" y="80.3"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6692" y="80.3"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6692" y="80.3"/>
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
					<Start x="30.4" y="44.65"/>
					<TrackLine>
						<End x="32.2" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="37.1998" y="45.25"/>
					</TrackLine>
					<TrackLine>
						<End x="38.6002" y="45.55"/>
					</TrackLine>
					<TrackLine>
						<End x="41.8808" y="45.55"/>
					</TrackLine>
					<TrackLine>
						<End x="42.4192" y="45.55"/>
					</TrackLine>
					<TrackLine>
						<End x="43.9192" y="45.55"/>
					</TrackLine>
					<TrackLine>
						<End x="45.9178" y="45.4"/>
					</TrackLine>
					<TrackLine>
						<End x="46.65" y="44.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="46.65" y="43.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="47.3822" y="42.9"/>
					</TrackLine>
					<TrackLine>
						<End x="57.2988" y="36.5213"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3502" y="36.5"/>
					</TrackLine>
					<TrackLine>
						<End x="62.1261" y="35.7952"/>
					</TrackLine>
					<TrackLine>
						<End x="63.5637" y="35.7952"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9498" y="36.5"/>
					</TrackLine>
					<TrackLine>
						<End x="89.5596" y="39.7803"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000024"/>
				<Subwire width="0.4">
					<Start x="74.4869" y="70.442"/>
					<TrackLine>
						<End x="74.7369" y="71.1608"/>
					</TrackLine>
					<TrackLine>
						<End x="74.8876" y="71.5247"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2369" y="77.4242"/>
					</TrackLine>
					<TrackLine>
						<End x="78.2369" y="78.4598"/>
					</TrackLine>
					<TrackLine>
						<End x="78.9691" y="79.192"/>
					</TrackLine>
					<TrackLine>
						<End x="81.1134" y="80.1035"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9465" y="80.9366"/>
					</TrackLine>
					<TrackLine>
						<End x="81.998" y="81.0609"/>
					</TrackLine>
					<TrackLine>
						<End x="81.998" y="82.2391"/>
					</TrackLine>
					<TrackLine>
						<End x="81.9891" y="84.7374"/>
					</TrackLine>
					<TrackLine>
						<End x="81.939" y="84.8583"/>
					</TrackLine>
					<TrackLine>
						<End x="81.1083" y="85.689"/>
					</TrackLine>
					<TrackLine>
						<End x="79.3119" y="87.2372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000025"/>
				<Subwire width="0.4">
					<Start x="56.4119" y="93.4514"/>
					<TrackLine>
						<End x="60.4" y="92.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000026"/>
				<Subwire width="0.4">
					<Start x="56.4119" y="80.9514"/>
					<TrackLine>
						<End x="60.4" y="81.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000027"/>
				<Subwire width="0.4">
					<Start x="70.4" y="92.9"/>
					<TrackLine>
						<End x="66.4346" y="94.8557"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000028"/>
				<Subwire width="0.4">
					<Start x="70.4" y="81.65"/>
					<TrackLine>
						<End x="66.4346" y="82.3557"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000029"/>
				<Subwire width="0.4">
					<Start x="75.1451" y="93.9405"/>
					<TrackLine>
						<End x="79.3119" y="92.2372"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000030"/>
				<Subwire width="0.4">
					<Start x="80.4" y="81.65"/>
					<TrackLine>
						<End x="75.1451" y="81.4405"/>
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
				<NetRef name="UN000046"/>
				<Subwire width="0.4">
					<Start x="75.4" y="34.15"/>
					<TrackLine>
						<End x="77.9" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000046"/>
				<Subwire width="0.4">
					<Start x="72.9" y="30.4"/>
					<TrackLine>
						<End x="75.4" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000033"/>
				<Subwire width="0.4">
					<Start x="30.4" y="55.15"/>
					<TrackLine>
						<End x="28.6" y="56.95"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6" y="57.15"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6" y="57.2328"/>
					</TrackLine>
					<TrackLine>
						<End x="25.7635" y="64.3543"/>
					</TrackLine>
					<TrackLine>
						<End x="25.7635" y="65.9457"/>
					</TrackLine>
					<TrackLine>
						<End x="25.7635" y="69.9457"/>
					</TrackLine>
					<TrackLine>
						<End x="26.9" y="97.7196"/>
					</TrackLine>
					<TrackLine>
						<End x="27.75" y="102.4192"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1308" y="102.8"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8005" y="108.3"/>
					</TrackLine>
					<TrackLine>
						<End x="55.941" y="109.3"/>
					</TrackLine>
					<TrackLine>
						<End x="85.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000035"/>
				<Subwire width="0.4">
					<Start x="140.0664" y="60.4205"/>
					<TrackLine>
						<End x="132.211" y="64.8431"/>
					</TrackLine>
					<TrackLine>
						<End x="131.4788" y="65.5753"/>
					</TrackLine>
					<TrackLine>
						<End x="131.4788" y="66.6109"/>
					</TrackLine>
					<TrackLine>
						<End x="127.6619" y="73.7176"/>
					</TrackLine>
					<TrackLine>
						<End x="121.5244" y="79.9431"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000036"/>
				<Subwire width="0.4">
					<Start x="47.9" y="61.65"/>
					<TrackLine>
						<End x="50.4" y="61.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000037"/>
				<Subwire width="0.4">
					<Start x="45.4" y="51.65"/>
					<TrackLine>
						<End x="45.4" y="54.3092"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000037"/>
				<Subwire width="0.4">
					<Start x="45.4" y="54.3092"/>
					<TrackLine>
						<End x="45.4" y="57.9531"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000037"/>
				<Subwire width="0.4">
					<Start x="45.4" y="60.4"/>
					<TrackLine>
						<End x="45.4" y="57.9531"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000039"/>
				<Subwire width="0.4">
					<Start x="52.9" y="51.65"/>
					<TrackLine>
						<End x="53.15" y="52.3688"/>
					</TrackLine>
					<TrackLine>
						<End x="53.3007" y="52.7327"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9" y="57.9531"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000039"/>
				<Subwire width="0.4">
					<Start x="55.4" y="71.65"/>
					<TrackLine>
						<End x="53.5012" y="73.0287"/>
					</TrackLine>
					<TrackLine>
						<End x="53.4498" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="48.4498" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="47.3502" y="73.05"/>
					</TrackLine>
					<TrackLine>
						<End x="47.2988" y="73.0287"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000039"/>
				<Subwire width="0.4">
					<Start x="42.9" y="71.65"/>
					<TrackLine>
						<End x="43.45" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="43.65" y="71.65"/>
					</TrackLine>
					<TrackLine>
						<End x="45.4" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000039"/>
				<Subwire width="0.4">
					<Start x="55.4" y="71.65"/>
					<TrackLine>
						<End x="56.4602" y="69.1938"/>
					</TrackLine>
					<TrackLine>
						<End x="56.4815" y="69.1424"/>
					</TrackLine>
					<TrackLine>
						<End x="57.9" y="57.9531"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000040"/>
				<Subwire width="0.4">
					<Start x="47.9" y="71.65"/>
					<TrackLine>
						<End x="46.0012" y="70.2713"/>
					</TrackLine>
					<TrackLine>
						<End x="42.5815" y="68.5926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000041"/>
				<Subwire width="0.4">
					<Start x="55.0815" y="68.5926"/>
					<TrackLine>
						<End x="54.7434" y="65.4924"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000041"/>
				<Subwire width="0.4">
					<Start x="52.9" y="71.65"/>
					<TrackLine>
						<End x="55.0815" y="68.5926"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000044"/>
				<Subwire width="0.4">
					<Start x="47.9" y="79.15"/>
					<TrackLine>
						<End x="49.7988" y="77.7713"/>
					</TrackLine>
					<TrackLine>
						<End x="49.8502" y="77.75"/>
					</TrackLine>
					<TrackLine>
						<End x="50.9498" y="77.75"/>
					</TrackLine>
					<TrackLine>
						<End x="51.0012" y="77.7713"/>
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
					<Start x="67.8635" y="67.2844"/>
					<TrackLine>
						<End x="75.0047" y="69.192"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7369" y="69.9242"/>
					</TrackLine>
					<TrackLine>
						<End x="75.7369" y="70.9598"/>
					</TrackLine>
					<TrackLine>
						<End x="76.4691" y="71.692"/>
					</TrackLine>
					<TrackLine>
						<End x="82.5047" y="76.692"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2369" y="77.4242"/>
					</TrackLine>
					<TrackLine>
						<End x="83.2369" y="78.4598"/>
					</TrackLine>
					<TrackLine>
						<End x="84.0677" y="79.4779"/>
					</TrackLine>
					<TrackLine>
						<End x="84.106" y="79.5351"/>
					</TrackLine>
					<TrackLine>
						<End x="84.516" y="80.5249"/>
					</TrackLine>
					<TrackLine>
						<End x="86.2347" y="85.3988"/>
					</TrackLine>
					<TrackLine>
						<End x="86.2347" y="86.4984"/>
					</TrackLine>
					<TrackLine>
						<End x="84.8347" y="93.4486"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000047"/>
				<Subwire width="0.4">
					<Start x="67.9" y="37.9"/>
					<TrackLine>
						<End x="67.9266" y="41.4908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000047"/>
				<Subwire width="0.4">
					<Start x="67.9" y="44.15"/>
					<TrackLine>
						<End x="67.9266" y="43.6"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9266" y="43.4"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9266" y="41.4908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000048"/>
				<Subwire width="0.4">
					<Start x="75.4" y="44.15"/>
					<TrackLine>
						<End x="75.65" y="43.4312"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8007" y="43.0673"/>
					</TrackLine>
					<TrackLine>
						<End x="76.8173" y="42.0507"/>
					</TrackLine>
					<TrackLine>
						<End x="77.1812" y="41.9"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4266" y="41.4908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000048"/>
				<Subwire width="0.4">
					<Start x="82.0596" y="39.7803"/>
					<TrackLine>
						<End x="80.4266" y="41.4908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000083"/>
				<Subwire width="0.4">
					<Start x="105.6552" y="108.2529"/>
					<TrackLine>
						<End x="105.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="84.8347" y="85.9486"/>
					<TrackLine>
						<End x="83.4347" y="92.8988"/>
					</TrackLine>
					<TrackLine>
						<End x="83.4347" y="93.9984"/>
					</TrackLine>
					<TrackLine>
						<End x="83.456" y="94.0498"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3913" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000057"/>
				<Subwire width="0.4">
					<Start x="66.8171" y="80.4382"/>
					<TrackLine>
						<End x="72.5367" y="79.342"/>
					</TrackLine>
					<TrackLine>
						<End x="72.5881" y="79.3207"/>
					</TrackLine>
					<TrackLine>
						<End x="74.4869" y="77.942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="30.4" y="95.15"/>
					<TrackLine>
						<End x="32.2" y="93.35"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4" y="93.35"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4828" y="93.35"/>
					</TrackLine>
					<TrackLine>
						<End x="32.9696" y="93.15"/>
					</TrackLine>
					<TrackLine>
						<End x="33.0579" y="93.1135"/>
					</TrackLine>
					<TrackLine>
						<End x="33.8635" y="92.3079"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4186" y="81.2983"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8339" y="80.2957"/>
					</TrackLine>
					<TrackLine>
						<End x="41.5" y="78.6002"/>
					</TrackLine>
					<TrackLine>
						<End x="41.5213" y="78.5488"/>
					</TrackLine>
					<TrackLine>
						<End x="42.2988" y="77.7713"/>
					</TrackLine>
					<TrackLine>
						<End x="42.3502" y="77.75"/>
					</TrackLine>
					<TrackLine>
						<End x="49.6812" y="76.9"/>
					</TrackLine>
					<TrackLine>
						<End x="54.0483" y="76.7"/>
					</TrackLine>
					<TrackLine>
						<End x="54.2936" y="76.6512"/>
					</TrackLine>
					<TrackLine>
						<End x="56.5457" y="75.8339"/>
					</TrackLine>
					<TrackLine>
						<End x="57.5483" y="75.4186"/>
					</TrackLine>
					<TrackLine>
						<End x="66.2159" y="71.5595"/>
					</TrackLine>
					<TrackLine>
						<End x="66.2673" y="71.5382"/>
					</TrackLine>
					<TrackLine>
						<End x="68.6541" y="70.992"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7369" y="70.992"/>
					</TrackLine>
					<TrackLine>
						<End x="68.9369" y="70.992"/>
					</TrackLine>
					<TrackLine>
						<End x="69.4869" y="70.442"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000058"/>
				<Subwire width="0.4">
					<Start x="82.9" y="51.65"/>
					<TrackLine>
						<End x="82.65" y="50.9312"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4993" y="50.5673"/>
					</TrackLine>
					<TrackLine>
						<End x="77.9" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000059"/>
				<Subwire width="0.4">
					<Start x="30.4" y="100.15"/>
					<TrackLine>
						<End x="28.6" y="98.35"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6" y="98.15"/>
					</TrackLine>
					<TrackLine>
						<End x="28.6" y="98.0672"/>
					</TrackLine>
					<TrackLine>
						<End x="28.4828" y="97.95"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1308" y="97.8"/>
					</TrackLine>
					<TrackLine>
						<End x="27.75" y="97.4192"/>
					</TrackLine>
					<TrackLine>
						<End x="27.75" y="93.4192"/>
					</TrackLine>
					<TrackLine>
						<End x="27.75" y="92.8808"/>
					</TrackLine>
					<TrackLine>
						<End x="28.1308" y="92.5"/>
					</TrackLine>
					<TrackLine>
						<End x="32.6692" y="92.3"/>
					</TrackLine>
					<TrackLine>
						<End x="33.05" y="91.9192"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6818" y="80.8558"/>
					</TrackLine>
					<TrackLine>
						<End x="40" y="80.0876"/>
					</TrackLine>
					<TrackLine>
						<End x="40.65" y="78.4312"/>
					</TrackLine>
					<TrackLine>
						<End x="40.8007" y="78.0673"/>
					</TrackLine>
					<TrackLine>
						<End x="41.8173" y="77.0507"/>
					</TrackLine>
					<TrackLine>
						<End x="42.1812" y="76.9"/>
					</TrackLine>
					<TrackLine>
						<End x="49.5121" y="76.05"/>
					</TrackLine>
					<TrackLine>
						<End x="53.9645" y="75.85"/>
					</TrackLine>
					<TrackLine>
						<End x="54.0457" y="75.8339"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3376" y="75"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1058" y="74.6818"/>
					</TrackLine>
					<TrackLine>
						<End x="67.2623" y="65.9057"/>
					</TrackLine>
					<TrackLine>
						<End x="67.3137" y="65.8844"/>
					</TrackLine>
					<TrackLine>
						<End x="68.431" y="65.4731"/>
					</TrackLine>
					<TrackLine>
						<End x="68.4824" y="65.4518"/>
					</TrackLine>
					<TrackLine>
						<End x="69.2599" y="64.6743"/>
					</TrackLine>
					<TrackLine>
						<End x="72.9369" y="56.746"/>
					</TrackLine>
					<TrackLine>
						<End x="73.6993" y="55.9836"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9642" y="54.4699"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000063"/>
				<Subwire width="0.4">
					<Start x="79.4869" y="77.942"/>
					<TrackLine>
						<End x="81.5654" y="79.4269"/>
					</TrackLine>
					<TrackLine>
						<End x="82.6231" y="80.4846"/>
					</TrackLine>
					<TrackLine>
						<End x="82.796" y="80.9021"/>
					</TrackLine>
					<TrackLine>
						<End x="82.796" y="82.3979"/>
					</TrackLine>
					<TrackLine>
						<End x="82.7782" y="84.8943"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9619" y="92.8367"/>
					</TrackLine>
					<TrackLine>
						<End x="80.9025" y="92.98"/>
					</TrackLine>
					<TrackLine>
						<End x="80.0547" y="93.8278"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1757" y="94.3388"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0888" y="95.4257"/>
					</TrackLine>
					<TrackLine>
						<End x="77.8275" y="96.0415"/>
					</TrackLine>
					<TrackLine>
						<End x="77.05" y="96.819"/>
					</TrackLine>
					<TrackLine>
						<End x="72.3928" y="100.7406"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000064"/>
				<Subwire width="0.4">
					<Start x="81.9869" y="77.942"/>
					<TrackLine>
						<End x="82.2722" y="78.6538"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4175" y="79.0047"/>
					</TrackLine>
					<TrackLine>
						<End x="83.387" y="79.9742"/>
					</TrackLine>
					<TrackLine>
						<End x="83.6971" y="80.7229"/>
					</TrackLine>
					<TrackLine>
						<End x="83.6971" y="82.5771"/>
					</TrackLine>
					<TrackLine>
						<End x="83.5673" y="85.0513"/>
					</TrackLine>
					<TrackLine>
						<End x="81.8119" y="93.0058"/>
					</TrackLine>
					<TrackLine>
						<End x="81.6231" y="93.4615"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5362" y="94.5484"/>
					</TrackLine>
					<TrackLine>
						<End x="79.6572" y="95.0594"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8094" y="95.9072"/>
					</TrackLine>
					<TrackLine>
						<End x="78.75" y="96.0505"/>
					</TrackLine>
					<TrackLine>
						<End x="78.75" y="97.2495"/>
					</TrackLine>
					<TrackLine>
						<End x="80.4" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000065"/>
				<Subwire width="0.4">
					<Start x="60.4" y="96.65"/>
					<TrackLine>
						<End x="56.4908" y="95.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000066"/>
				<Subwire width="0.4">
					<Start x="64.4312" y="95.1488"/>
					<TrackLine>
						<End x="65.8334" y="96.2344"/>
					</TrackLine>
					<TrackLine>
						<End x="65.8848" y="96.2557"/>
					</TrackLine>
					<TrackLine>
						<End x="70.4" y="96.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000068"/>
				<Subwire width="0.4">
					<Start x="60.4" y="106.65"/>
					<TrackLine>
						<End x="56.4908" y="107.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000069"/>
				<Subwire width="0.4">
					<Start x="70.4" y="106.65"/>
					<TrackLine>
						<End x="64.4312" y="107.6488"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000070"/>
				<Subwire width="0.4">
					<Start x="76.4488" y="107.9403"/>
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
						<End x="87.6081" y="94.1766"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000074"/>
				<Subwire width="0.4">
					<Start x="124.15" y="94.15"/>
					<TrackLine>
						<End x="117.608" y="94.203"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000075"/>
				<Subwire width="0.4">
					<Start x="100.7067" y="94.1851"/>
					<TrackLine>
						<End x="101.9906" y="95.9072"/>
					</TrackLine>
					<TrackLine>
						<End x="102.05" y="96.0505"/>
					</TrackLine>
					<TrackLine>
						<End x="104.15" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="117.608" y="81.703"/>
					<TrackLine>
						<End x="113.7982" y="81.7769"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="121.8299" y="41.6501"/>
					<TrackLine>
						<End x="123.5068" y="42.8452"/>
					</TrackLine>
					<TrackLine>
						<End x="124.9876" y="44.2452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="87.6081" y="81.6766"/>
					<TrackLine>
						<End x="100.7067" y="81.6851"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000076"/>
				<Subwire width="0.4">
					<Start x="117.608" y="81.703"/>
					<TrackLine>
						<End x="116.5193" y="73.7866"/>
					</TrackLine>
					<TrackLine>
						<End x="116.5193" y="72.5876"/>
					</TrackLine>
					<TrackLine>
						<End x="117.8402" y="67.8302"/>
					</TrackLine>
					<TrackLine>
						<End x="117.889" y="67.5849"/>
					</TrackLine>
					<TrackLine>
						<End x="118.2982" y="64.9626"/>
					</TrackLine>
					<TrackLine>
						<End x="118.8288" y="57.5739"/>
					</TrackLine>
					<TrackLine>
						<End x="120.3436" y="54.4501"/>
					</TrackLine>
					<TrackLine>
						<End x="120.3649" y="54.3987"/>
					</TrackLine>
					<TrackLine>
						<End x="121.0876" y="51.1954"/>
					</TrackLine>
					<TrackLine>
						<End x="121.1089" y="51.144"/>
					</TrackLine>
					<TrackLine>
						<End x="124.9876" y="44.2452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="134.0394" y="103.7569"/>
					<TrackLine>
						<End x="134.15" y="100.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="150.2408" y="65.0019"/>
					<TrackLine>
						<End x="148.027" y="63.6233"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="62.9" y="61.65"/>
					<TrackLine>
						<End x="64.7434" y="65.4924"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="148.6911" y="68.5263"/>
					<TrackLine>
						<End x="144.2357" y="72.2447"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="30.4" y="32.65"/>
					<TrackLine>
						<End x="31.65" y="31.525"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4" y="31.525"/>
					</TrackLine>
					<TrackLine>
						<End x="37.15" y="31.525"/>
					</TrackLine>
					<TrackLine>
						<End x="37.9" y="31.525"/>
					</TrackLine>
					<TrackLine>
						<End x="39.15" y="30.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="50.4" y="84.15"/>
					<TrackLine>
						<End x="60.4" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="42.9" y="61.65"/>
					<TrackLine>
						<End x="35.7372" y="64.805"/>
					</TrackLine>
					<TrackLine>
						<End x="34.805" y="65.7372"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3984" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="86.9869" y="70.442"/>
					<TrackLine>
						<End x="88.0105" y="65.3675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="126.3042" y="95.4963"/>
					<TrackLine>
						<End x="125.2044" y="96.2069"/>
					</TrackLine>
					<TrackLine>
						<End x="124.8589" y="96.35"/>
					</TrackLine>
					<TrackLine>
						<End x="114.15" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="34.3984" y="66.65"/>
					<TrackLine>
						<End x="32.4" y="66.65"/>
					</TrackLine>
					<TrackLine>
						<End x="31.65" y="66.65"/>
					</TrackLine>
					<TrackLine>
						<End x="30.4" y="67.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="87.7781" y="107.3515"/>
					<TrackLine>
						<End x="84.3913" y="107.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="145.8056" y="64.9113"/>
					<TrackLine>
						<End x="148.6911" y="68.5263"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="130.4" y="112.9"/>
					<TrackLine>
						<End x="133.7632" y="108.0927"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="80.4" y="84.15"/>
					<TrackLine>
						<End x="70.4" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="67.8812" y="64.0731"/>
					<TrackLine>
						<End x="64.7434" y="65.4924"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="57.9" y="44.15"/>
					<TrackLine>
						<End x="57.245" y="43.2372"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3128" y="42.305"/>
					</TrackLine>
					<TrackLine>
						<End x="56.0592" y="42.2"/>
					</TrackLine>
					<TrackLine>
						<End x="52.9" y="41.4908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="64.7434" y="65.4924"/>
					<TrackLine>
						<End x="57.9" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="70.4" y="104.15"/>
					<TrackLine>
						<End x="80.4" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="80.4" y="104.15"/>
					<TrackLine>
						<End x="81.4544" y="104.5931"/>
					</TrackLine>
					<TrackLine>
						<End x="82.4569" y="105.5956"/>
					</TrackLine>
					<TrackLine>
						<End x="84.3913" y="107.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="88.0105" y="65.3675"/>
					<TrackLine>
						<End x="81.3318" y="61.1626"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="30.4" y="89.65"/>
					<TrackLine>
						<End x="31.65" y="88.4"/>
					</TrackLine>
					<TrackLine>
						<End x="31.65" y="87.65"/>
					</TrackLine>
					<TrackLine>
						<End x="31.65" y="87.3393"/>
					</TrackLine>
					<TrackLine>
						<End x="38.495" y="80.0628"/>
					</TrackLine>
					<TrackLine>
						<End x="38.6" y="79.8092"/>
					</TrackLine>
					<TrackLine>
						<End x="39.25" y="78.1527"/>
					</TrackLine>
					<TrackLine>
						<End x="39.6139" y="77.2743"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4905" y="75.5125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="87.7781" y="107.3515"/>
					<TrackLine>
						<End x="100.4" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="134.15" y="100.4"/>
					<TrackLine>
						<End x="126.3042" y="95.4963"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="121.65" y="84.15"/>
					<TrackLine>
						<End x="144.2357" y="72.2447"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="91.65" y="84.15"/>
					<TrackLine>
						<End x="95.5956" y="86.2069"/>
					</TrackLine>
					<TrackLine>
						<End x="95.9411" y="86.35"/>
					</TrackLine>
					<TrackLine>
						<End x="97.3589" y="86.35"/>
					</TrackLine>
					<TrackLine>
						<End x="104.6987" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="150.4" y="30.4"/>
					<TrackLine>
						<End x="149.15" y="29.15"/>
					</TrackLine>
					<TrackLine>
						<End x="148.4" y="29.15"/>
					</TrackLine>
					<TrackLine>
						<End x="148.0893" y="29.15"/>
					</TrackLine>
					<TrackLine>
						<End x="146.1613" y="29.0293"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="60.4" y="104.15"/>
					<TrackLine>
						<End x="70.4" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="30.4" y="112.15"/>
					<TrackLine>
						<End x="31.65" y="111.275"/>
					</TrackLine>
					<TrackLine>
						<End x="32.4" y="111.275"/>
					</TrackLine>
					<TrackLine>
						<End x="37.15" y="111.275"/>
					</TrackLine>
					<TrackLine>
						<End x="37.9" y="111.275"/>
					</TrackLine>
					<TrackLine>
						<End x="39.15" y="110.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="40.4905" y="75.5125"/>
					<TrackLine>
						<End x="34.805" y="67.5628"/>
					</TrackLine>
					<TrackLine>
						<End x="34.3984" y="66.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="134.0394" y="103.7569"/>
					<TrackLine>
						<End x="133.7632" y="108.0927"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="57.9" y="71.65"/>
					<TrackLine>
						<End x="57.245" y="72.5628"/>
					</TrackLine>
					<TrackLine>
						<End x="56.3128" y="73.495"/>
					</TrackLine>
					<TrackLine>
						<End x="56.0592" y="73.6"/>
					</TrackLine>
					<TrackLine>
						<End x="53.7282" y="74.45"/>
					</TrackLine>
					<TrackLine>
						<End x="49.3059" y="74.65"/>
					</TrackLine>
					<TrackLine>
						<End x="40.4905" y="75.5125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="148.027" y="63.6233"/>
					<TrackLine>
						<End x="145.8056" y="64.9113"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="50.4" y="104.15"/>
					<TrackLine>
						<End x="52.2934" y="104.227"/>
					</TrackLine>
					<TrackLine>
						<End x="53.6118" y="104.227"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="70.4" y="84.15"/>
					<TrackLine>
						<End x="67.0938" y="84.3057"/>
					</TrackLine>
					<TrackLine>
						<End x="65.7754" y="84.3057"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="150.4" y="110.4"/>
					<TrackLine>
						<End x="149.15" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="148.4" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="148.0893" y="109.15"/>
					</TrackLine>
					<TrackLine>
						<End x="133.7632" y="108.0927"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="100.4" y="104.15"/>
					<TrackLine>
						<End x="100.4" y="101.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="112.839" y="58.9366"/>
					<TrackLine>
						<End x="114.1383" y="64.895"/>
					</TrackLine>
					<TrackLine>
						<End x="114.2372" y="65.1338"/>
					</TrackLine>
					<TrackLine>
						<End x="114.65" y="65.5466"/>
					</TrackLine>
					<TrackLine>
						<End x="114.7489" y="65.7854"/>
					</TrackLine>
					<TrackLine>
						<End x="114.7489" y="67.0878"/>
					</TrackLine>
					<TrackLine>
						<End x="112.9" y="71.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="126.3042" y="95.4963"/>
					<TrackLine>
						<End x="126.35" y="94.8589"/>
					</TrackLine>
					<TrackLine>
						<End x="126.35" y="93.4411"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2069" y="93.0956"/>
					</TrackLine>
					<TrackLine>
						<End x="121.65" y="84.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="125.2288" y="58.5931"/>
					<TrackLine>
						<End x="125.8838" y="57.6803"/>
					</TrackLine>
					<TrackLine>
						<End x="126.816" y="56.7481"/>
					</TrackLine>
					<TrackLine>
						<End x="130.9004" y="53.5902"/>
					</TrackLine>
					<TrackLine>
						<End x="131.8326" y="52.658"/>
					</TrackLine>
					<TrackLine>
						<End x="131.9376" y="52.4044"/>
					</TrackLine>
					<TrackLine>
						<End x="131.9376" y="51.086"/>
					</TrackLine>
					<TrackLine>
						<End x="131.8326" y="50.8324"/>
					</TrackLine>
					<TrackLine>
						<End x="127.4876" y="44.2452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="87.1656" y="55.1203"/>
					<TrackLine>
						<End x="94.4872" y="49.805"/>
					</TrackLine>
					<TrackLine>
						<End x="94.7408" y="49.7"/>
					</TrackLine>
					<TrackLine>
						<End x="108.5592" y="46.1"/>
					</TrackLine>
					<TrackLine>
						<End x="108.8128" y="45.995"/>
					</TrackLine>
					<TrackLine>
						<End x="109.745" y="45.0628"/>
					</TrackLine>
					<TrackLine>
						<End x="110.4" y="44.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G"/>
				<Subwire width="1.5">
					<Start x="146.1613" y="29.0293"/>
					<TrackLine>
						<End x="145.2752" y="30.8801"/>
					</TrackLine>
					<TrackLine>
						<End x="144.343" y="31.8123"/>
					</TrackLine>
					<TrackLine>
						<End x="144.0894" y="31.9173"/>
					</TrackLine>
					<TrackLine>
						<End x="139.8952" y="32.2339"/>
					</TrackLine>
					<TrackLine>
						<End x="139.5497" y="32.377"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2797" y="39.8686"/>
					</TrackLine>
					<TrackLine>
						<End x="127.3686" y="40.7797"/>
					</TrackLine>
					<TrackLine>
						<End x="127.275" y="41.0058"/>
					</TrackLine>
					<TrackLine>
						<End x="127.275" y="42.2942"/>
					</TrackLine>
					<TrackLine>
						<End x="127.4876" y="43.4766"/>
					</TrackLine>
					<TrackLine>
						<End x="127.4876" y="44.2452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000084"/>
				<Subwire width="1">
					<Start x="153.0326" y="70.4"/>
					<TrackLine>
						<End x="152.9" y="72.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="148.027" y="56.1233"/>
					<TrackLine>
						<End x="150.2408" y="57.5019"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000078"/>
				<Subwire width="0.4">
					<Start x="150.2408" y="57.5019"/>
					<TrackLine>
						<End x="153.0326" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000079"/>
				<Subwire width="0.4">
					<Start x="144.2357" y="67.2447"/>
					<TrackLine>
						<End x="143.4164" y="59.4829"/>
					</TrackLine>
					<TrackLine>
						<End x="143.0342" y="58.2356"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000079"/>
				<Subwire width="0.4">
					<Start x="145.8056" y="57.4113"/>
					<TrackLine>
						<End x="143.0342" y="58.2356"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000080"/>
				<Subwire width="0.4">
					<Start x="122.7288" y="58.5931"/>
					<TrackLine>
						<End x="123.7376" y="52.263"/>
					</TrackLine>
					<TrackLine>
						<End x="123.7376" y="51.2274"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2376" y="44.763"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2376" y="43.7274"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4" y="41.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000088"/>
				<Subwire width="0.4">
					<Start x="129.15" y="41.65"/>
					<TrackLine>
						<End x="130.5888" y="42.8665"/>
					</TrackLine>
					<TrackLine>
						<End x="131.3663" y="43.644"/>
					</TrackLine>
					<TrackLine>
						<End x="134.731" y="49.0758"/>
					</TrackLine>
					<TrackLine>
						<End x="135.2292" y="50.2787"/>
					</TrackLine>
					<TrackLine>
						<End x="135.2876" y="50.5723"/>
					</TrackLine>
					<TrackLine>
						<End x="135.2876" y="52.9181"/>
					</TrackLine>
					<TrackLine>
						<End x="135.2419" y="56.3633"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="91.5041" y="110.6808"/>
					<TrackLine>
						<End x="93.8094" y="113.6428"/>
					</TrackLine>
					<TrackLine>
						<End x="94.6572" y="114.4906"/>
					</TrackLine>
					<TrackLine>
						<End x="94.8005" y="114.55"/>
					</TrackLine>
					<TrackLine>
						<End x="95.9995" y="114.55"/>
					</TrackLine>
					<TrackLine>
						<End x="96.1428" y="114.4906"/>
					</TrackLine>
					<TrackLine>
						<End x="99.6572" y="111.3094"/>
					</TrackLine>
					<TrackLine>
						<End x="102.1058" y="109.6818"/>
					</TrackLine>
					<TrackLine>
						<End x="105.054" y="106.8742"/>
					</TrackLine>
					<TrackLine>
						<End x="105.1054" y="106.8529"/>
					</TrackLine>
					<TrackLine>
						<End x="110.5828" y="105.5854"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="132.7288" y="66.0931"/>
					<TrackLine>
						<End x="133.5029" y="69.6446"/>
					</TrackLine>
					<TrackLine>
						<End x="133.5242" y="69.696"/>
					</TrackLine>
					<TrackLine>
						<End x="133.7497" y="70.2187"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="133.7497" y="70.2187"/>
					<TrackLine>
						<End x="134.3017" y="70.4735"/>
					</TrackLine>
					<TrackLine>
						<End x="134.3531" y="70.4948"/>
					</TrackLine>
					<TrackLine>
						<End x="139.9727" y="71.6138"/>
					</TrackLine>
					<TrackLine>
						<End x="141.0723" y="71.6138"/>
					</TrackLine>
					<TrackLine>
						<End x="141.1237" y="71.5925"/>
					</TrackLine>
					<TrackLine>
						<End x="142.9857" y="69.7447"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="113.1552" y="108.2529"/>
					<TrackLine>
						<End x="110.5828" y="105.5854"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000082"/>
				<Subwire width="0.4">
					<Start x="110.5828" y="105.5854"/>
					<TrackLine>
						<End x="112.5" y="98.5505"/>
					</TrackLine>
					<TrackLine>
						<End x="112.5594" y="98.4072"/>
					</TrackLine>
					<TrackLine>
						<End x="115.1769" y="94.8781"/>
					</TrackLine>
					<TrackLine>
						<End x="120.0594" y="83.4072"/>
					</TrackLine>
					<TrackLine>
						<End x="120.9072" y="82.5594"/>
					</TrackLine>
					<TrackLine>
						<End x="133.7497" y="70.2187"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000085"/>
				<Subwire width="1">
					<Start x="152.9" y="87.9"/>
					<TrackLine>
						<End x="152.9" y="85.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000086"/>
				<Subwire width="1">
					<Start x="152.9" y="100.4"/>
					<TrackLine>
						<End x="152.9402" y="103.3827"/>
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
				<Subwire width="1.5">
					<Start x="140.0664" y="67.9205"/>
					<TrackLine>
						<End x="134.9029" y="69.0948"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="95.339" y="66.4366"/>
					<TrackLine>
						<End x="92.9" y="69.0738"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="43.3896" y="85.2362"/>
					<TrackLine>
						<End x="42.9" y="79.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="69.15" y="90.4"/>
					<TrackLine>
						<End x="63.0505" y="92.3395"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="63.0505" y="92.3395"/>
					<TrackLine>
						<End x="61.4544" y="90.8431"/>
					</TrackLine>
					<TrackLine>
						<End x="61.1089" y="90.7"/>
					</TrackLine>
					<TrackLine>
						<End x="59.15" y="90.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="43.3896" y="85.2362"/>
					<TrackLine>
						<End x="52.9526" y="89.777"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="59.15" y="90.4"/>
					<TrackLine>
						<End x="52.9526" y="89.777"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="95.4" y="51.65"/>
					<TrackLine>
						<End x="93.245" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="61.65" y="99.15"/>
					<TrackLine>
						<End x="71.65" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="93.245" y="57.9"/>
					<TrackLine>
						<End x="93.389" y="60.1837"/>
					</TrackLine>
					<TrackLine>
						<End x="95.339" y="66.4366"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="61.65" y="99.15"/>
					<TrackLine>
						<End x="62.4065" y="97.6707"/>
					</TrackLine>
					<TrackLine>
						<End x="62.5406" y="97.3471"/>
					</TrackLine>
					<TrackLine>
						<End x="62.5406" y="94.5015"/>
					</TrackLine>
					<TrackLine>
						<End x="63.0505" y="92.3395"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="40.3441" y="87.3371"/>
					<TrackLine>
						<End x="43.3896" y="85.2362"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="69.4869" y="77.942"/>
					<TrackLine>
						<End x="71.9869" y="77.942"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="91.5041" y="98.1808"/>
					<TrackLine>
						<End x="88.4373" y="99.3015"/>
					</TrackLine>
					<TrackLine>
						<End x="87.1189" y="99.3015"/>
					</TrackLine>
					<TrackLine>
						<End x="81.65" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="57.9" y="54.3092"/>
					<TrackLine>
						<End x="58.8128" y="53.495"/>
					</TrackLine>
					<TrackLine>
						<End x="59.745" y="52.5628"/>
					</TrackLine>
					<TrackLine>
						<End x="60.9999" y="49.6324"/>
					</TrackLine>
					<TrackLine>
						<End x="61.9321" y="48.7002"/>
					</TrackLine>
					<TrackLine>
						<End x="62.787" y="48.3294"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="65.4" y="30.4"/>
					<TrackLine>
						<End x="62.9" y="34.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="140.0664" y="67.9205"/>
					<TrackLine>
						<End x="141.8882" y="61.0542"/>
					</TrackLine>
					<TrackLine>
						<End x="141.8882" y="59.7868"/>
					</TrackLine>
					<TrackLine>
						<End x="141.8027" y="59.5804"/>
					</TrackLine>
					<TrackLine>
						<End x="141.2979" y="59.0757"/>
					</TrackLine>
					<TrackLine>
						<End x="139.3792" y="55.2361"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="62.8449" y="38.0452"/>
					<TrackLine>
						<End x="62.787" y="48.3294"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="124.0394" y="103.7569"/>
					<TrackLine>
						<End x="114.15" y="104.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="1.5">
					<Start x="62.787" y="48.3294"/>
					<TrackLine>
						<End x="63.5041" y="48.5952"/>
					</TrackLine>
					<TrackLine>
						<End x="63.7577" y="48.7002"/>
					</TrackLine>
					<TrackLine>
						<End x="67.9" y="51.65"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000089"/>
				<Subwire width="0.4">
					<Start x="132.7555" y="41.5755"/>
					<TrackLine>
						<End x="135.2419" y="43.8633"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000089"/>
				<Subwire width="0.4">
					<Start x="140.6041" y="34.4339"/>
					<TrackLine>
						<End x="138.6113" y="35.3433"/>
					</TrackLine>
					<TrackLine>
						<End x="137.7635" y="36.1911"/>
					</TrackLine>
					<TrackLine>
						<End x="132.7555" y="41.5755"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000092"/>
				<Subwire width="0.4">
					<Start x="123.1693" y="73.1871"/>
					<TrackLine>
						<End x="122.4029" y="69.0948"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000092"/>
				<Subwire width="0.4">
					<Start x="122.4029" y="69.0948"/>
					<TrackLine>
						<End x="120.4" y="69.0281"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="75.3812" y="64.0731"/>
					<TrackLine>
						<End x="76.3318" y="61.1626"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="74.2701" y="57.3168"/>
					<TrackLine>
						<End x="76.3318" y="61.1626"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000093"/>
				<Subwire width="0.4">
					<Start x="76.3318" y="61.1626"/>
					<TrackLine>
						<End x="80.745" y="57.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000094"/>
				<Subwire width="0.4">
					<Start x="136.2529" y="41.6171"/>
					<TrackLine>
						<End x="139.3792" y="42.7361"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000094"/>
				<Subwire width="0.4">
					<Start x="139.3792" y="42.7361"/>
					<TrackLine>
						<End x="140.6041" y="39.4339"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000095"/>
				<Subwire width="0.4">
					<Start x="75.4" y="51.65"/>
					<TrackLine>
						<End x="73.4905" y="53.0127"/>
					</TrackLine>
					<TrackLine>
						<End x="73.446" y="53.0311"/>
					</TrackLine>
					<TrackLine>
						<End x="71.8242" y="53.0311"/>
					</TrackLine>
					<TrackLine>
						<End x="70.9498" y="53.05"/>
					</TrackLine>
					<TrackLine>
						<End x="68.4498" y="53.05"/>
					</TrackLine>
					<TrackLine>
						<End x="67.3502" y="53.05"/>
					</TrackLine>
					<TrackLine>
						<End x="67.2988" y="53.0287"/>
					</TrackLine>
					<TrackLine>
						<End x="62.8449" y="50.5452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000096"/>
				<Subwire width="0.4">
					<Start x="72.5355" y="55.2434"/>
					<TrackLine>
						<End x="61.7701" y="57.3168"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000096"/>
				<Subwire width="0.4">
					<Start x="77.9" y="51.65"/>
					<TrackLine>
						<End x="77.65" y="52.3688"/>
					</TrackLine>
					<TrackLine>
						<End x="77.4993" y="52.7327"/>
					</TrackLine>
					<TrackLine>
						<End x="76.4827" y="53.7493"/>
					</TrackLine>
					<TrackLine>
						<End x="76.1188" y="53.9"/>
					</TrackLine>
					<TrackLine>
						<End x="72.5355" y="55.2434"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000097"/>
				<Subwire width="0.4">
					<Start x="100.4" y="96.65"/>
					<TrackLine>
						<End x="86.2294" y="82.2778"/>
					</TrackLine>
					<TrackLine>
						<End x="86.2081" y="82.2264"/>
					</TrackLine>
					<TrackLine>
						<End x="86.2081" y="81.1268"/>
					</TrackLine>
					<TrackLine>
						<End x="86.2294" y="81.0754"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3656" y="78.5432"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3869" y="78.4918"/>
					</TrackLine>
					<TrackLine>
						<End x="90.2605" y="66.0863"/>
					</TrackLine>
					<TrackLine>
						<End x="90.2605" y="64.6487"/>
					</TrackLine>
					<TrackLine>
						<End x="90.1098" y="64.2848"/>
					</TrackLine>
					<TrackLine>
						<End x="85.0355" y="55.2434"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000098"/>
				<Subwire width="0.4">
					<Start x="100.4" y="106.65"/>
					<TrackLine>
						<End x="101.9906" y="104.8928"/>
					</TrackLine>
					<TrackLine>
						<End x="102.05" y="104.7495"/>
					</TrackLine>
					<TrackLine>
						<End x="102.05" y="102.2495"/>
					</TrackLine>
					<TrackLine>
						<End x="102.05" y="101.0505"/>
					</TrackLine>
					<TrackLine>
						<End x="101.9906" y="100.9072"/>
					</TrackLine>
					<TrackLine>
						<End x="101.1428" y="100.0594"/>
					</TrackLine>
					<TrackLine>
						<End x="99.15" y="99.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="UN000098"/>
				<Subwire width="0.4">
					<Start x="99.15" y="99.15"/>
					<TrackLine>
						<End x="96.0869" y="96.4489"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="115.4" y="112.9"/>
					<TrackLine>
						<End x="123.7632" y="108.0927"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="136.2529" y="29.1171"/>
					<TrackLine>
						<End x="132.7555" y="29.0755"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="129.15" y="29.15"/>
					<TrackLine>
						<End x="125.4" y="29.15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="129.15" y="29.15"/>
					<TrackLine>
						<End x="132.7555" y="29.0755"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-12V"/>
				<Subwire width="1.5">
					<Start x="132.7288" y="58.5931"/>
					<TrackLine>
						<End x="133.2919" y="55.7041"/>
					</TrackLine>
					<TrackLine>
						<End x="133.883" y="52.8034"/>
					</TrackLine>
					<TrackLine>
						<End x="133.8876" y="52.7802"/>
					</TrackLine>
					<TrackLine>
						<End x="133.8876" y="50.7102"/>
					</TrackLine>
					<TrackLine>
						<End x="133.883" y="50.687"/>
					</TrackLine>
					<TrackLine>
						<End x="133.4903" y="49.739"/>
					</TrackLine>
					<TrackLine>
						<End x="129.9876" y="44.2452"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NEW1"/>
				<Subwire width="0.4">
					<Start x="118.9649" y="41.3489"/>
					<TrackLine>
						<End x="116.9768" y="42.6044"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NEW1"/>
				<Subwire width="0.4">
					<Start x="116.9768" y="42.6044"/>
					<TrackLine>
						<End x="117.4482" y="51.194"/>
					</TrackLine>
					<TrackLine>
						<End x="117.4482" y="52.2936"/>
					</TrackLine>
					<TrackLine>
						<End x="117.4482" y="64.7936"/>
					</TrackLine>
					<TrackLine>
						<End x="117.039" y="67.5011"/>
					</TrackLine>
					<TrackLine>
						<End x="117.0229" y="67.5823"/>
					</TrackLine>
					<TrackLine>
						<End x="115.6693" y="72.4185"/>
					</TrackLine>
					<TrackLine>
						<End x="114.2135" y="79.6826"/>
					</TrackLine>
					<TrackLine>
						<End x="114.2054" y="79.7022"/>
					</TrackLine>
					<TrackLine>
						<End x="113.4522" y="80.4554"/>
					</TrackLine>
					<TrackLine>
						<End x="113.4326" y="80.4635"/>
					</TrackLine>
					<TrackLine>
						<End x="113.2656" y="80.4634"/>
					</TrackLine>
					<TrackLine>
						<End x="113.246" y="80.4715"/>
					</TrackLine>
					<TrackLine>
						<End x="112.4928" y="81.2247"/>
					</TrackLine>
					<TrackLine>
						<End x="112.4847" y="81.2443"/>
					</TrackLine>
					<TrackLine>
						<End x="112.1987" y="84.9186"/>
					</TrackLine>
					<TrackLine>
						<End x="109.6987" y="94.9186"/>
					</TrackLine>
					<TrackLine>
						<End x="106.65" y="102.4186"/>
					</TrackLine>
					<TrackLine>
						<End x="106.4612" y="102.8743"/>
					</TrackLine>
					<TrackLine>
						<End x="102.7112" y="107.8743"/>
					</TrackLine>
					<TrackLine>
						<End x="101.6243" y="108.9612"/>
					</TrackLine>
					<TrackLine>
						<End x="95.4" y="112.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NEW2"/>
				<Subwire width="0.4">
					<Start x="90.4" y="112.9"/>
					<TrackLine>
						<End x="90.1041" y="111.2306"/>
					</TrackLine>
					<TrackLine>
						<End x="90.1041" y="110.131"/>
					</TrackLine>
					<TrackLine>
						<End x="90.1254" y="110.0796"/>
					</TrackLine>
					<TrackLine>
						<End x="90.9029" y="109.3021"/>
					</TrackLine>
					<TrackLine>
						<End x="90.9543" y="109.2808"/>
					</TrackLine>
					<TrackLine>
						<End x="95.5371" y="107.5489"/>
					</TrackLine>
					<TrackLine>
						<End x="96.6367" y="107.5489"/>
					</TrackLine>
					<TrackLine>
						<End x="99.8005" y="108.3"/>
					</TrackLine>
					<TrackLine>
						<End x="100.9995" y="108.3"/>
					</TrackLine>
					<TrackLine>
						<End x="101.1428" y="108.2406"/>
					</TrackLine>
					<TrackLine>
						<End x="101.9906" y="107.3928"/>
					</TrackLine>
					<TrackLine>
						<End x="105.7406" y="102.3928"/>
					</TrackLine>
					<TrackLine>
						<End x="105.8" y="102.2495"/>
					</TrackLine>
					<TrackLine>
						<End x="108.8487" y="94.7495"/>
					</TrackLine>
					<TrackLine>
						<End x="111.3487" y="84.7495"/>
					</TrackLine>
					<TrackLine>
						<End x="111.5482" y="81.0581"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="79.6678"/>
					</TrackLine>
					<TrackLine>
						<End x="111.65" y="78.6322"/>
					</TrackLine>
					<TrackLine>
						<End x="114.3" y="72.1998"/>
					</TrackLine>
					<TrackLine>
						<End x="116.189" y="67.3742"/>
					</TrackLine>
					<TrackLine>
						<End x="116.189" y="65.499"/>
					</TrackLine>
					<TrackLine>
						<End x="116.0482" y="64.2438"/>
					</TrackLine>
				</Subwire>
			</Wire>
		</Wires>
	</Connectivity>

	<Settings version="1.3">
		<Autoroute
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