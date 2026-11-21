<?xml version="1.0" encoding="UTF-8"?>

<!--*****************************************-->
<!--   File    : SingleLayerZZ.fst           -->
<!--   Format  : TopoR PCB file              -->
<!--   Version : 1.2.1                       -->
<!--   Program : TopoR Lite 7.0.18699        -->
<!--   Date    : Saturday, November 21, 2026 -->
<!--   Time    : 14:44                       -->
<!--*****************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.2.1</Version>
		<Program>TopoR Lite 7.0.18699</Program>
		<Date>Saturday, November 21, 2026 14:44</Date>
		<OriginalFormat>Pcad 2004</OriginalFormat>
		<OriginalFile>.\ROT_TPR.pcb</OriginalFile>
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
		<TextStyle name="T:H100W10" fontName="QUALITY" height="2.54"/>
		<TextStyle name="T:H31W3" fontName="QUALITY" height="0.8001"/>
		<TextStyle name="T:H66W6" fontName="QUALITY" height="1.7"/>
		<TextStyle name="T:H78W7" fontName="QUALITY" height="2"/>
		<TextStyle name="T:H39W3" fontName="QUALITY" height="1"/>
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
			<Padstack name="09.ps" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.9" height="0.9">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="0603.ps" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.6" height="0.9">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="SX1Y1D0T.ps" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1" height="1">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="1206.ps" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1" height="1.8">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="08.ps" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="0.8">
						<LayerRef name="Top"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="SOD80.ps" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1" height="1.5">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="0805.ps" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.7" height="1.5">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="DO-214AA.ps" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.6" height="2.3">
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
		</Viastacks>
		<Footprints>
			<Footprint name="SST5484_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="09.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="09.ps"/>
						<Org x="2.032" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="09.ps"/>
						<Org x="1.016" y="2.2098"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5001" y="0.6"/>
							<Dot x="2.5001" y="1.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5001" y="1.6"/>
							<Dot x="-0.5001" y="1.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.5001" y="1.6"/>
							<Dot x="-0.5001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.5001" y="0.6"/>
							<Dot x="2.5001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="0.6"/>
							<Dot x="-0.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="-0.3"/>
							<Dot x="0.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.1999" y="-0.3"/>
							<Dot x="0.1999" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1999" y="0.6"/>
							<Dot x="2.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.8001" y="-0.3"/>
							<Dot x="1.8001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1999" y="-0.3"/>
							<Dot x="1.8001" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8001" y="1.6"/>
							<Dot x="0.8001" y="2.5001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.1999" y="1.6"/>
							<Dot x="1.1999" y="2.5001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8001" y="2.5001"/>
							<Dot x="1.1999" y="2.5001"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H78W7"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H78W7"/>
						<Org x="0.8472" y="2.7752"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SST5484_2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="09.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="09.ps"/>
						<Org x="2.032" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="09.ps"/>
						<Org x="1.016" y="2.2098"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5001" y="0.6"/>
							<Dot x="2.5001" y="1.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5001" y="1.6"/>
							<Dot x="-0.5001" y="1.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.5001" y="1.6"/>
							<Dot x="-0.5001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.5001" y="0.6"/>
							<Dot x="2.5001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="0.6"/>
							<Dot x="-0.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="-0.3"/>
							<Dot x="0.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.1999" y="-0.3"/>
							<Dot x="0.1999" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1999" y="0.6"/>
							<Dot x="2.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.8001" y="-0.3"/>
							<Dot x="1.8001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1999" y="-0.3"/>
							<Dot x="1.8001" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8001" y="1.6"/>
							<Dot x="0.8001" y="2.5001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.1999" y="1.6"/>
							<Dot x="1.1999" y="2.5001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8001" y="2.5001"/>
							<Dot x="1.1999" y="2.5001"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0.5809" y="0.6257"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H78W7"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="RR0603_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="0603.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="0603.ps"/>
						<Org x="1.1999" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="0.4001"/>
							<Dot x="-0.1999" y="-0.4001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="-0.4001"/>
							<Dot x="1.4001" y="-0.4001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.4001" y="-0.4001"/>
							<Dot x="1.4001" y="0.4001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.4001" y="0.4001"/>
							<Dot x="-0.1999" y="0.4001"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0.7522" y="-0.8969"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="RR0603_2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="0603.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="0603.ps"/>
						<Org x="1.1999" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="0.4001"/>
							<Dot x="-0.1999" y="-0.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="-0.4"/>
							<Dot x="1.4001" y="-0.4001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.4001" y="-0.4001"/>
							<Dot x="1.4001" y="0.4001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.4001" y="0.4001"/>
							<Dot x="-0.1999" y="0.4001"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="-0.203" y="1.1529"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="CMPD2836_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="09.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="09.ps"/>
						<Org x="2.032" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="09.ps"/>
						<Org x="1.016" y="2.2098"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5001" y="0.6"/>
							<Dot x="2.5001" y="1.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5001" y="1.6"/>
							<Dot x="-0.5001" y="1.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.5001" y="1.6"/>
							<Dot x="-0.5001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.5001" y="0.6"/>
							<Dot x="2.5001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="0.6"/>
							<Dot x="-0.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="-0.3"/>
							<Dot x="0.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.1999" y="-0.3"/>
							<Dot x="0.1999" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1999" y="0.6"/>
							<Dot x="2.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.8001" y="-0.3"/>
							<Dot x="1.8001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1999" y="-0.3"/>
							<Dot x="1.8001" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8001" y="1.6"/>
							<Dot x="0.8001" y="2.5001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.1999" y="1.6"/>
							<Dot x="1.1999" y="2.5001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8001" y="2.5001"/>
							<Dot x="1.1999" y="2.5001"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="-1.1119" y="1.1986"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H78W7"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="D08_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="08.ps"/>
						<Org x="0" y="0"/>
					</Pad>
				</Pads>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0.0457" y="0.2867"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H100W10"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="TR1206_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="1206.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="1206.ps"/>
						<Org x="2.4" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.4001" y="-0.8001"/>
							<Dot x="-0.4001" y="0.8001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.8001" y="0.8001"/>
							<Dot x="2.8001" y="-0.8001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.8001" y="-0.8001"/>
							<Dot x="-0.4001" y="-0.8001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.4001" y="0.8001"/>
							<Dot x="2.8001" y="0.8001"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0.5893" y="-0.2359"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="MMBT2907_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="09.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="09.ps"/>
						<Org x="2.032" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="09.ps"/>
						<Org x="1.016" y="2.2098"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5001" y="0.6"/>
							<Dot x="2.5001" y="1.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5001" y="1.6"/>
							<Dot x="-0.5001" y="1.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.5001" y="1.6"/>
							<Dot x="-0.5001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.5001" y="0.6"/>
							<Dot x="2.5001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="0.6"/>
							<Dot x="-0.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="-0.3"/>
							<Dot x="0.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.1999" y="-0.3"/>
							<Dot x="0.1999" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1999" y="0.6"/>
							<Dot x="2.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.8001" y="-0.3"/>
							<Dot x="1.8001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1999" y="-0.3"/>
							<Dot x="1.8001" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8001" y="1.6"/>
							<Dot x="0.8001" y="2.5001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.1999" y="1.6"/>
							<Dot x="1.1999" y="2.5001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8001" y="2.5001"/>
							<Dot x="1.1999" y="2.5001"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0.9347" y="0.7693"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H78W7"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="CMPD2838_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="09.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="09.ps"/>
						<Org x="2.032" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="09.ps"/>
						<Org x="1.016" y="2.2098"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5001" y="0.6"/>
							<Dot x="2.5001" y="1.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5001" y="1.6"/>
							<Dot x="-0.5001" y="1.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.5001" y="1.6"/>
							<Dot x="-0.5001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.5001" y="0.6"/>
							<Dot x="2.5001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="0.6"/>
							<Dot x="-0.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1999" y="-0.3"/>
							<Dot x="0.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.1999" y="-0.3"/>
							<Dot x="0.1999" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1999" y="0.6"/>
							<Dot x="2.1999" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.8001" y="-0.3"/>
							<Dot x="1.8001" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1999" y="-0.3"/>
							<Dot x="1.8001" y="-0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8001" y="1.6"/>
							<Dot x="0.8001" y="2.5001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.1999" y="1.6"/>
							<Dot x="1.1999" y="2.5001"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8001" y="2.5001"/>
							<Dot x="1.1999" y="2.5001"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0.2606" y="0.8114"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H78W7"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SMBJ33CA_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="DO-214AA.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="DO-214AA.ps"/>
						<Org x="4.1999" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="a" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H39W3"/>
						<Org x="4.1001" y="1.1501"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.7" y="-2"/>
							<Dot x="-0.7" y="2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.8999" y="2"/>
							<Dot x="4.8999" y="-2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.8999" y="-2"/>
							<Dot x="-0.7" y="-2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.7" y="2"/>
							<Dot x="4.8999" y="2"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB" angle="180">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="2.7737" y="-0.1343"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H100W10"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="RC0805_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="0805.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="0805.ps"/>
						<Org x="1.7" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2499" y="-0.7"/>
							<Dot x="-0.2499" y="0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.95" y="0.7"/>
							<Dot x="1.95" y="-0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.95" y="-0.7"/>
							<Dot x="-0.2499" y="-0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2499" y="0.7"/>
							<Dot x="1.95" y="0.7"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0.5757" y="0.5879"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="CLL4684_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="SOD80.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="SOD80.ps"/>
						<Org x="3" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="a" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="-0.1001" y="-0.7501"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2499" y="-0.7501"/>
							<Dot x="-0.2499" y="0.7501"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.2499" y="0.7501"/>
							<Dot x="3.2499" y="-0.7501"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.2499" y="-0.7501"/>
							<Dot x="-0.2499" y="-0.7501"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0201">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2499" y="0.7501"/>
							<Dot x="3.2499" y="0.7501"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0.8433" y="-0.2613"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="R0_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="SX1Y1D0T.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="SX1Y1D0T.ps"/>
						<Org x="0" y="-1.4001"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0099">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.6" y="0.6"/>
							<Dot x="-0.6" y="-2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0099">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.6" y="-2"/>
							<Dot x="0.6" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0099">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.6" y="-2"/>
							<Dot x="0.6" y="-2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0099">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.6" y="0.6"/>
							<Dot x="-0.6" y="0.6"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H66W6"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H66W6"/>
						<Org x="-0.4719" y="0.5266"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="R0_2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="SX1Y1D0T.ps"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="SX1Y1D0T.ps"/>
						<Org x="0" y="-1.4001"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0099">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.6" y="0.6"/>
							<Dot x="-0.6" y="-2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0099">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.6" y="-2"/>
							<Dot x="0.6" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0099">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.6" y="-2"/>
							<Dot x="0.6" y="-2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0099">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.6" y="0.6"/>
							<Dot x="-0.6" y="0.6"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H31W3"/>
						<Org x="-1.1854" y="-0.694"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="T:H66W6"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
		</Footprints>
		<Components>
			<Component name="SST5484_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SST5484"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VT"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="SST5484"/>
					<Attribute name="PCADIO_LinkName" value="SST5484"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VT"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="SST5484"/>
				</Attributes>
			</Component>
			<Component name="RR0603_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="RR0603"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="R"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="RR0603"/>
					<Attribute name="PCADIO_LinkName" value="RR0603"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="R"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="RR0603"/>
				</Attributes>
			</Component>
			<Component name="CMPD2836_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="3" pinEqual="0" gate="2" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="CMPD2836"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="CMPD2836"/>
				</Attributes>
			</Component>
			<Component name="D08_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="D08"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="X"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="D08"/>
				</Attributes>
			</Component>
			<Component name="TR1206_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="TR1206"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="R"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="TR1206"/>
				</Attributes>
			</Component>
			<Component name="MMBT2907_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="MMBT2907"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VT"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="MMBT2907"/>
				</Attributes>
			</Component>
			<Component name="CMPD2838_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="3" pinEqual="0" gate="2" gateEqual="2"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="CMPD2838"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="CMPD2838"/>
				</Attributes>
			</Component>
			<Component name="SMBJ33CA_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SMBJ33CA"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="SMBJ33CA"/>
				</Attributes>
			</Component>
			<Component name="RC0805_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="RC0805"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="C"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="RC0805"/>
				</Attributes>
			</Component>
			<Component name="CLL4684_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="CLL4684"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="VD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="CLL4684"/>
				</Attributes>
			</Component>
			<Component name="R0_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="R0"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="J"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="R0"/>
					<Attribute name="PCADIO_LinkName" value="R0"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix" value="J"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="R0"/>
				</Attributes>
			</Component>
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="SST5484_1"/>
				<FootprintRef name="SST5484_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="SST5484_1"/>
				<FootprintRef name="SST5484_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="RR0603_1"/>
				<FootprintRef name="RR0603_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RR0603_1"/>
				<FootprintRef name="RR0603_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="CMPD2836_1"/>
				<FootprintRef name="CMPD2836_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="D08_1"/>
				<FootprintRef name="D08_1"/>
				<Pinpack pinNum="1" padNum="1"/>
			</Package>
			<Package>
				<ComponentRef name="TR1206_1"/>
				<FootprintRef name="TR1206_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="MMBT2907_1"/>
				<FootprintRef name="MMBT2907_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="CMPD2838_1"/>
				<FootprintRef name="CMPD2838_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="SMBJ33CA_1"/>
				<FootprintRef name="SMBJ33CA_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RC0805_1"/>
				<FootprintRef name="RC0805_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="CLL4684_1"/>
				<FootprintRef name="CLL4684_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R0_1"/>
				<FootprintRef name="R0_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R0_1"/>
				<FootprintRef name="R0_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
		</Packages>
	</LocalLibrary>

	<Constructive version="1.2">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.0254">
					<Circle diameter="23.2664">
						<Center x="13.9751" y="14.1405"/>
					</Circle>
				</Shape>
				<Shape lineWidth="0.025">
					<Circle diameter="13.97">
						<Center x="13.975" y="14.141"/>
					</Circle>
				</Shape>
			</Contour>
		</BoardOutline>
		<MechLayerObjects>
			<Detail lineWidth="0.0254">
				<LayerRef name="TopSilk"/>
				<Circle diameter="13.97">
					<Center x="13.9751" y="14.1405"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.0254">
				<LayerRef name="TopSilk"/>
				<Circle diameter="23.2664">
					<Center x="13.9751" y="14.1405"/>
				</Circle>
			</Detail>
		</MechLayerObjects>
	</Constructive>

	<ComponentsOnBoard version="1.3">
		<Components>
			<CompInstance name="R3" uniqueId="RCEFGDCF" side="Top" angle="190">
				<ComponentRef name="RR0603_1"/>
				<FootprintRef name="RR0603_2"/>
				<Org x="6.1773" y="12.9467"/>
				<Attributes>
					<Attribute name="Type" value="RR0603"/>
					<Attribute name="DEVICE" value="RR0603"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R1" uniqueId="EJHLAWKF" side="Top" angle="160">
				<ComponentRef name="RR0603_1"/>
				<FootprintRef name="RR0603_1"/>
				<Org x="5.4407" y="16.7059"/>
				<Attributes>
					<Attribute name="Type" value="RR0603"/>
					<Attribute name="DEVICE" value="RR0603"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J1" uniqueId="CJLWQBNP" side="Top" angle="220">
				<ComponentRef name="R0_1"/>
				<FootprintRef name="R0_1"/>
				<Org x="9.4793" y="20.5667"/>
				<Attributes>
					<Attribute name="Type" value="R0"/>
					<Attribute name="DEVICE" value="R0"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R7" uniqueId="VPJOULVN" side="Top" angle="90">
				<ComponentRef name="RR0603_1"/>
				<FootprintRef name="RR0603_1"/>
				<Org x="24.3253" y="10.9147"/>
				<Attributes>
					<Attribute name="Type" value="RR0603"/>
					<Attribute name="DEVICE" value="RR0603"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="X3" uniqueId="HCQBJHJJ" side="Top">
				<ComponentRef name="D08_1"/>
				<FootprintRef name="D08_1"/>
				<Org x="5.6545" y="7.3037"/>
				<Attributes>
					<Attribute name="Type" value="D08"/>
					<Attribute name="DEVICE" value="D08"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R2" uniqueId="HYNLKWNZ" side="Top" angle="100">
				<ComponentRef name="RR0603_1"/>
				<FootprintRef name="RR0603_2"/>
				<Org x="4.4722" y="14.5504"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="-0.203" y="1.1529"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RR0603"/>
					<Attribute name="DEVICE" value="RR0603"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="X1" uniqueId="GPCXUFAS" side="Top">
				<ComponentRef name="D08_1"/>
				<FootprintRef name="D08_1"/>
				<Org x="5.5423" y="15.4613"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="0.0457" y="0.2867"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="D08"/>
					<Attribute name="DEVICE" value="D08"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="X2" uniqueId="CGLXZJIT" side="Top">
				<ComponentRef name="D08_1"/>
				<FootprintRef name="D08_1"/>
				<Org x="6.1773" y="14.4707"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="-0.0813" y="0.2613"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="D08"/>
					<Attribute name="DEVICE" value="D08"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT2" uniqueId="VINTHZKU" side="Top" angle="350">
				<ComponentRef name="SST5484_1"/>
				<FootprintRef name="SST5484_2"/>
				<Org x="9.9873" y="22.5987"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="0.5809" y="0.6257"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="SST5484"/>
					<Attribute name="DEVICE" value="SST5484"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R4" uniqueId="TRRTLVPY" side="Top" angle="65">
				<ComponentRef name="RR0603_1"/>
				<FootprintRef name="RR0603_1"/>
				<Org x="19.6393" y="22.0907"/>
				<Attributes>
					<Attribute name="Type" value="RR0603"/>
					<Attribute name="DEVICE" value="RR0603"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J2" uniqueId="MTEROEIN" side="Top" angle="340">
				<ComponentRef name="R0_1"/>
				<FootprintRef name="R0_2"/>
				<Org x="18.3693" y="23.8687"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="-1.1854" y="-0.694"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0"/>
					<Attribute name="DEVICE" value="R0"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD4" uniqueId="MYWXXNYW" side="Top" angle="180">
				<ComponentRef name="SMBJ33CA_1"/>
				<FootprintRef name="SMBJ33CA_1"/>
				<Org x="15.818" y="5.0022"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="2.7737" y="-0.1343"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="SMBJ33CA"/>
					<Attribute name="DEVICE" value="SMBJ33CA"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R8" uniqueId="RPPBEGRG" side="Top" angle="90">
				<ComponentRef name="RR0603_1"/>
				<FootprintRef name="RR0603_1"/>
				<Org x="22.9413" y="10.9147"/>
				<Attributes>
					<Attribute name="Type" value="RR0603"/>
					<Attribute name="DEVICE" value="RR0603"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R5" uniqueId="NMGGWEIB" side="Top" angle="320">
				<ComponentRef name="RR0603_1"/>
				<FootprintRef name="RR0603_1"/>
				<Org x="7.4473" y="20.3127"/>
				<Attributes>
					<Attribute name="Type" value="RR0603"/>
					<Attribute name="DEVICE" value="RR0603"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C1" uniqueId="FQHYNCXK" side="Top" angle="150">
				<ComponentRef name="RC0805_1"/>
				<FootprintRef name="RC0805_1"/>
				<Org x="6.8885" y="18.0013"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="0.5757" y="0.5879"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="RC0805"/>
					<Attribute name="DEVICE" value="RC0805"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD1" uniqueId="HFBZVOGE" side="Top" angle="180">
				<ComponentRef name="CLL4684_1"/>
				<FootprintRef name="CLL4684_1"/>
				<Org x="22.4333" y="20.3127"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="0.8433" y="-0.2613"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="CLL4684"/>
					<Attribute name="DEVICE" value="CLL4684"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT1" uniqueId="CCZIYLKO" side="Top" angle="105">
				<ComponentRef name="SST5484_1"/>
				<FootprintRef name="SST5484_1"/>
				<Org x="16.0833" y="22.5987"/>
				<Attributes>
					<Attribute name="Type" value="SST5484"/>
					<Attribute name="DEVICE" value="SST5484"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="X4" uniqueId="ZEKGQRYN" side="Top">
				<ComponentRef name="D08_1"/>
				<FootprintRef name="D08_1"/>
				<Org x="6.9405" y="8.0799"/>
				<Attributes>
					<Attribute name="Type" value="D08"/>
					<Attribute name="DEVICE" value="D08"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD2" uniqueId="HLIZXUNF" side="Top" angle="25">
				<ComponentRef name="CMPD2838_1"/>
				<FootprintRef name="CMPD2838_1"/>
				<Org x="4.863" y="8.5527"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="0.2606" y="0.8114"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="CMPD2838"/>
					<Attribute name="DEVICE" value="CMPD2838"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD3" uniqueId="WQFEZVXA" side="Top" angle="320">
				<ComponentRef name="CMPD2836_1"/>
				<FootprintRef name="CMPD2836_1"/>
				<Org x="7.609" y="6.6614"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="-1.1119" y="1.1986"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="CMPD2836"/>
					<Attribute name="DEVICE" value="CMPD2836"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT3" uniqueId="KGSAJUEU" side="Top">
				<ComponentRef name="MMBT2907_1"/>
				<FootprintRef name="MMBT2907_1"/>
				<Org x="21.6713" y="16.2487"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="0.9347" y="0.7693"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="MMBT2907"/>
					<Attribute name="DEVICE" value="MMBT2907"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R6" uniqueId="CVILBWKX" side="Top" angle="180">
				<ComponentRef name="TR1206_1"/>
				<FootprintRef name="TR1206_1"/>
				<Org x="24.4653" y="13.9881"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H31W3"/>
							<Org x="0.5893" y="-0.2359"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="TR1206"/>
					<Attribute name="DEVICE" value="TR1206"/>
				</Attributes>
			</CompInstance>
		</Components>
	</ComponentsOnBoard>

	<NetList version="2.0">
		<Net name="NET00000">
			<PinRef compName="R1" pinName="1"/>
			<PinRef compName="X1" pinName="1"/>
		</Net>
		<Net name="NET00001">
			<PinRef compName="R3" pinName="2"/>
			<PinRef compName="R2" pinName="1"/>
		</Net>
		<Net name="NET00002">
			<PinRef compName="R1" pinName="2"/>
			<PinRef compName="R2" pinName="2"/>
			<PinRef compName="VT2" pinName="1"/>
			<PinRef compName="C1" pinName="2"/>
		</Net>
		<Net name="NET00005">
			<PinRef compName="J1" pinName="1"/>
			<PinRef compName="VT2" pinName="2"/>
			<PinRef compName="R5" pinName="2"/>
		</Net>
		<Net name="NET00009">
			<PinRef compName="R7" pinName="2"/>
			<PinRef compName="R6" pinName="1"/>
		</Net>
		<Net name="NET00007">
			<PinRef compName="R4" pinName="2"/>
			<PinRef compName="J2" pinName="1"/>
			<PinRef compName="VT1" pinName="2"/>
		</Net>
		<Net name="NET00008">
			<PinRef compName="VT2" pinName="3"/>
			<PinRef compName="R4" pinName="1"/>
			<PinRef compName="J2" pinName="2"/>
			<PinRef compName="VT1" pinName="1"/>
			<PinRef compName="VT3" pinName="1"/>
			<PinRef compName="R6" pinName="2"/>
		</Net>
		<Net name="NET00010">
			<PinRef compName="R8" pinName="2"/>
			<PinRef compName="VT3" pinName="2"/>
		</Net>
		<Net name="NET00011">
			<PinRef compName="VD1" pinName="1"/>
			<PinRef compName="VT3" pinName="3"/>
		</Net>
		<Net name="NET00012">
			<PinRef compName="VD1" pinName="2"/>
			<PinRef compName="VT1" pinName="3"/>
			<PinRef compName="VD2" pinName="3"/>
		</Net>
		<Net name="NET00013">
			<PinRef compName="X3" pinName="1"/>
			<PinRef compName="VD4" pinName="1"/>
			<PinRef compName="VD2" pinName="1"/>
			<PinRef compName="VD3" pinName="2"/>
		</Net>
		<Net name="NET00014">
			<PinRef compName="VD4" pinName="2"/>
			<PinRef compName="X4" pinName="1"/>
			<PinRef compName="VD2" pinName="2"/>
			<PinRef compName="VD3" pinName="1"/>
		</Net>
		<Net name="NET00015">
			<PinRef compName="R3" pinName="1"/>
			<PinRef compName="J1" pinName="2"/>
			<PinRef compName="R7" pinName="1"/>
			<PinRef compName="X2" pinName="1"/>
			<PinRef compName="R8" pinName="1"/>
			<PinRef compName="R5" pinName="1"/>
			<PinRef compName="C1" pinName="1"/>
			<PinRef compName="VD3" pinName="3"/>
		</Net>
	</NetList>

	<Groups version="1.1">
		<NetGroups>
			<NetGroup name="DEFAULT"/>
			<NetGroup name="WD4064">
				<NetRef name="NET00015"/>
				<NetRef name="NET00014"/>
				<NetRef name="NET00013"/>
				<NetRef name="NET00012"/>
				<NetRef name="NET00011"/>
				<NetRef name="NET00010"/>
				<NetRef name="NET00008"/>
				<NetRef name="NET00007"/>
				<NetRef name="NET00009"/>
				<NetRef name="NET00005"/>
				<NetRef name="NET00002"/>
				<NetRef name="NET00001"/>
				<NetRef name="NET00000"/>
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
		<SignalSearchSettings maxNetsInCluster="5">
			<RulesDiffSignalNetsNames>
				<RuleDiffSignalNetsNames enabled="on" negStr="#"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="+" negStr="-"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="P" negStr="N"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="p" negStr="n"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="H" negStr="L"/>
				<RuleDiffSignalNetsNames enabled="on" negStr="_B"/>
			</RulesDiffSignalNetsNames>
			<ExcludedNets minPinsNumber="20"/>
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
		</RulesWidthOfWires>
		<RulesClearancesNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0.23" clrnNom="0.345">
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
				<NetRef name="NET00000"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00001"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00002"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00005"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00009"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00007"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00008"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00010"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00011"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00012"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00013"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00014"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00015"/>
			</NetProperty>
		</NetProperties>
		<PadConnectSettings mode="AutoConnect"/>
	</Rules>

	<Connectivity version="1.3">
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00000"/>
				<Subwire width="0.4">
					<Start x="5.5423" y="15.4613"/>
					<TrackLine>
						<End x="5.3748" y="16.132"/>
					</TrackLine>
					<TrackLine>
						<End x="5.3679" y="16.1598"/>
					</TrackLine>
					<TrackLine>
						<End x="5.3701" y="16.217"/>
					</TrackLine>
					<TrackLine>
						<End x="5.3792" y="16.2441"/>
					</TrackLine>
					<TrackLine>
						<End x="5.3808" y="16.2488"/>
					</TrackLine>
					<TrackLine>
						<End x="5.4492" y="16.4367"/>
					</TrackLine>
					<TrackLine>
						<End x="5.4407" y="16.7059"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00001"/>
				<Subwire width="0.4">
					<Start x="4.4722" y="14.5504"/>
					<TrackLine>
						<End x="4.5891" y="14.4695"/>
					</TrackLine>
					<TrackLine>
						<End x="4.6238" y="14.2725"/>
					</TrackLine>
					<TrackLine>
						<End x="4.8192" y="13.1641"/>
					</TrackLine>
					<TrackLine>
						<End x="4.854" y="12.9671"/>
					</TrackLine>
					<TrackLine>
						<End x="4.9956" y="12.7383"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.4">
					<Start x="9.9873" y="22.5987"/>
					<TrackLine>
						<End x="9.7516" y="22.7012"/>
					</TrackLine>
					<TrackLine>
						<End x="9.5546" y="22.7359"/>
					</TrackLine>
					<TrackLine>
						<End x="8.9751" y="22.8381"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.4">
					<Start x="5.4163" y="18.8513"/>
					<TrackLine>
						<End x="5.0803" y="18.4102"/>
					</TrackLine>
					<TrackLine>
						<End x="4.9803" y="18.237"/>
					</TrackLine>
					<TrackLine>
						<End x="4.5759" y="17.5366"/>
					</TrackLine>
					<TrackLine>
						<End x="4.5722" y="17.5301"/>
					</TrackLine>
					<TrackLine>
						<End x="4.5657" y="17.5166"/>
					</TrackLine>
					<TrackLine>
						<End x="4.5629" y="17.5097"/>
					</TrackLine>
					<TrackLine>
						<End x="4.5611" y="17.505"/>
					</TrackLine>
					<TrackLine>
						<End x="4.4927" y="17.3171"/>
					</TrackLine>
					<TrackLine>
						<End x="4.3132" y="17.1163"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.4">
					<Start x="4.2638" y="15.7321"/>
					<TrackLine>
						<End x="4.3684" y="15.852"/>
					</TrackLine>
					<TrackLine>
						<End x="4.3337" y="16.049"/>
					</TrackLine>
					<TrackLine>
						<End x="4.2443" y="16.5561"/>
					</TrackLine>
					<TrackLine>
						<End x="4.24" y="16.5808"/>
					</TrackLine>
					<TrackLine>
						<End x="4.2437" y="16.6308"/>
					</TrackLine>
					<TrackLine>
						<End x="4.2517" y="16.6545"/>
					</TrackLine>
					<TrackLine>
						<End x="4.2533" y="16.6592"/>
					</TrackLine>
					<TrackLine>
						<End x="4.3217" y="16.8471"/>
					</TrackLine>
					<TrackLine>
						<End x="4.3132" y="17.1163"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.4">
					<Start x="8.9751" y="22.8381"/>
					<TrackLine>
						<End x="8.7355" y="22.8803"/>
					</TrackLine>
					<TrackLine>
						<End x="8.6165" y="22.9013"/>
					</TrackLine>
					<TrackLine>
						<End x="8.3832" y="22.8387"/>
					</TrackLine>
					<TrackLine>
						<End x="8.2906" y="22.7611"/>
					</TrackLine>
					<TrackLine>
						<End x="7.6778" y="22.2469"/>
					</TrackLine>
					<TrackLine>
						<End x="7.6777" y="22.2468"/>
					</TrackLine>
					<TrackLine>
						<End x="7.5245" y="22.1182"/>
					</TrackLine>
					<TrackLine>
						<End x="7.4909" y="22.09"/>
					</TrackLine>
					<TrackLine>
						<End x="7.4336" y="22.0236"/>
					</TrackLine>
					<TrackLine>
						<End x="7.4106" y="21.9862"/>
					</TrackLine>
					<TrackLine>
						<End x="7.005" y="21.3264"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.4">
					<Start x="7.0049" y="21.3262"/>
					<TrackLine>
						<End x="6.485" y="20.4805"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.4">
					<Start x="6.485" y="20.4805"/>
					<TrackLine>
						<End x="6.4639" y="20.4462"/>
					</TrackLine>
					<TrackLine>
						<End x="6.4562" y="20.4333"/>
					</TrackLine>
					<TrackLine>
						<End x="6.3703" y="20.2845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.4">
					<Start x="6.3703" y="20.2845"/>
					<TrackLine>
						<End x="5.8862" y="19.446"/>
					</TrackLine>
					<TrackLine>
						<End x="5.7862" y="19.2728"/>
					</TrackLine>
					<TrackLine>
						<End x="5.4163" y="18.8513"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00002"/>
				<Subwire width="0.4">
					<Start x="7.005" y="21.3264"/>
					<TrackLine>
						<End x="7.0049" y="21.3262"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00005"/>
				<Subwire width="0.4">
					<Start x="11.9884" y="22.2458"/>
					<TrackLine>
						<End x="11.6989" y="22.0431"/>
					</TrackLine>
					<TrackLine>
						<End x="11.6642" y="21.8461"/>
					</TrackLine>
					<TrackLine>
						<End x="11.6635" y="21.8426"/>
					</TrackLine>
					<TrackLine>
						<End x="11.656" y="21.8042"/>
					</TrackLine>
					<TrackLine>
						<End x="11.6132" y="21.7386"/>
					</TrackLine>
					<TrackLine>
						<End x="11.581" y="21.7163"/>
					</TrackLine>
					<TrackLine>
						<End x="10.0698" y="20.6695"/>
					</TrackLine>
					<TrackLine>
						<End x="10.0666" y="20.6673"/>
					</TrackLine>
					<TrackLine>
						<End x="10.0603" y="20.6626"/>
					</TrackLine>
					<TrackLine>
						<End x="10.0573" y="20.6601"/>
					</TrackLine>
					<TrackLine>
						<End x="10.0551" y="20.6583"/>
					</TrackLine>
					<TrackLine>
						<End x="9.9019" y="20.5298"/>
					</TrackLine>
					<TrackLine>
						<End x="9.4793" y="20.5667"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00005"/>
				<Subwire width="0.4">
					<Start x="8.3665" y="19.5414"/>
					<TrackLine>
						<End x="8.6037" y="19.6686"/>
					</TrackLine>
					<TrackLine>
						<End x="8.7323" y="19.8218"/>
					</TrackLine>
					<TrackLine>
						<End x="8.7347" y="19.8245"/>
					</TrackLine>
					<TrackLine>
						<End x="8.7399" y="19.8304"/>
					</TrackLine>
					<TrackLine>
						<End x="8.7511" y="19.8415"/>
					</TrackLine>
					<TrackLine>
						<End x="8.7571" y="19.8465"/>
					</TrackLine>
					<TrackLine>
						<End x="9.1525" y="20.1783"/>
					</TrackLine>
					<TrackLine>
						<End x="9.3057" y="20.3068"/>
					</TrackLine>
					<TrackLine>
						<End x="9.4793" y="20.5667"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00009"/>
				<Subwire width="0.4">
					<Start x="24.4653" y="13.9881"/>
					<TrackLine>
						<End x="24.3953" y="13.2881"/>
					</TrackLine>
					<TrackLine>
						<End x="24.3953" y="13.0881"/>
					</TrackLine>
					<TrackLine>
						<End x="24.3953" y="12.4146"/>
					</TrackLine>
					<TrackLine>
						<End x="24.3953" y="12.2146"/>
					</TrackLine>
					<TrackLine>
						<End x="24.3253" y="12.1146"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00007"/>
				<Subwire width="0.4">
					<Start x="15.5574" y="24.5615"/>
					<TrackLine>
						<End x="15.8635" y="24.3847"/>
					</TrackLine>
					<TrackLine>
						<End x="16.0567" y="24.4365"/>
					</TrackLine>
					<TrackLine>
						<End x="16.0597" y="24.4373"/>
					</TrackLine>
					<TrackLine>
						<End x="16.0888" y="24.4446"/>
					</TrackLine>
					<TrackLine>
						<End x="16.1487" y="24.4415"/>
					</TrackLine>
					<TrackLine>
						<End x="16.1769" y="24.4312"/>
					</TrackLine>
					<TrackLine>
						<End x="17.8238" y="23.8318"/>
					</TrackLine>
					<TrackLine>
						<End x="18.0117" y="23.7634"/>
					</TrackLine>
					<TrackLine>
						<End x="18.3693" y="23.8687"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00007"/>
				<Subwire width="0.4">
					<Start x="18.3693" y="23.8687"/>
					<TrackLine>
						<End x="18.6168" y="23.6715"/>
					</TrackLine>
					<TrackLine>
						<End x="18.8047" y="23.6031"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6802" y="23.2844"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6916" y="23.2799"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6964" y="23.2778"/>
					</TrackLine>
					<TrackLine>
						<End x="19.8777" y="23.1934"/>
					</TrackLine>
					<TrackLine>
						<End x="20.1464" y="23.1782"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="22.0653" y="13.9881"/>
					<TrackLine>
						<End x="21.8683" y="14.6881"/>
					</TrackLine>
					<TrackLine>
						<End x="21.8683" y="14.8881"/>
					</TrackLine>
					<TrackLine>
						<End x="21.8683" y="15.7987"/>
					</TrackLine>
					<TrackLine>
						<End x="21.8683" y="15.9987"/>
					</TrackLine>
					<TrackLine>
						<End x="21.6713" y="16.2487"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="21.6713" y="16.2487"/>
					<TrackLine>
						<End x="21.4213" y="16.4987"/>
					</TrackLine>
					<TrackLine>
						<End x="21.4213" y="16.6987"/>
					</TrackLine>
					<TrackLine>
						<End x="21.4213" y="16.7093"/>
					</TrackLine>
					<TrackLine>
						<End x="21.4191" y="16.7303"/>
					</TrackLine>
					<TrackLine>
						<End x="21.4169" y="16.7406"/>
					</TrackLine>
					<TrackLine>
						<End x="20.4783" y="21.1204"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="19.6393" y="22.0907"/>
					<TrackLine>
						<End x="19.3706" y="22.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="19.1893" y="22.1903"/>
					</TrackLine>
					<TrackLine>
						<End x="19.1845" y="22.1924"/>
					</TrackLine>
					<TrackLine>
						<End x="19.1731" y="22.1969"/>
					</TrackLine>
					<TrackLine>
						<End x="18.3958" y="22.4798"/>
					</TrackLine>
					<TrackLine>
						<End x="18.2079" y="22.5482"/>
					</TrackLine>
					<TrackLine>
						<End x="17.8904" y="22.553"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="17.8904" y="22.553"/>
					<TrackLine>
						<End x="17.5059" y="22.3737"/>
					</TrackLine>
					<TrackLine>
						<End x="17.318" y="22.4421"/>
					</TrackLine>
					<TrackLine>
						<End x="17.3121" y="22.444"/>
					</TrackLine>
					<TrackLine>
						<End x="17.299" y="22.4483"/>
					</TrackLine>
					<TrackLine>
						<End x="17.2719" y="22.4533"/>
					</TrackLine>
					<TrackLine>
						<End x="17.2581" y="22.4539"/>
					</TrackLine>
					<TrackLine>
						<End x="16.643" y="22.4803"/>
					</TrackLine>
					<TrackLine>
						<End x="16.6285" y="22.4809"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5997" y="22.478"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5856" y="22.4745"/>
					</TrackLine>
					<TrackLine>
						<End x="16.5826" y="22.4737"/>
					</TrackLine>
					<TrackLine>
						<End x="16.3894" y="22.4219"/>
					</TrackLine>
					<TrackLine>
						<End x="16.0833" y="22.5987"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="16.0833" y="22.5987"/>
					<TrackLine>
						<End x="15.7773" y="22.7754"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7255" y="22.9686"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7237" y="22.9745"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7137" y="23.0078"/>
					</TrackLine>
					<TrackLine>
						<End x="15.6724" y="23.0636"/>
					</TrackLine>
					<TrackLine>
						<End x="15.6436" y="23.083"/>
					</TrackLine>
					<TrackLine>
						<End x="14.9518" y="23.547"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="20.4783" y="21.1204"/>
					<TrackLine>
						<End x="20.4662" y="21.1769"/>
					</TrackLine>
					<TrackLine>
						<End x="20.4528" y="21.2394"/>
					</TrackLine>
					<TrackLine>
						<End x="20.3978" y="21.3548"/>
					</TrackLine>
					<TrackLine>
						<End x="20.3577" y="21.4046"/>
					</TrackLine>
					<TrackLine>
						<End x="20.3395" y="21.4272"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="20.3395" y="21.4272"/>
					<TrackLine>
						<End x="20.0761" y="21.7541"/>
					</TrackLine>
					<TrackLine>
						<End x="20.0622" y="21.7713"/>
					</TrackLine>
					<TrackLine>
						<End x="20.0276" y="21.7989"/>
					</TrackLine>
					<TrackLine>
						<End x="20.0077" y="21.8085"/>
					</TrackLine>
					<TrackLine>
						<End x="20.0049" y="21.8099"/>
					</TrackLine>
					<TrackLine>
						<End x="19.8236" y="21.8943"/>
					</TrackLine>
					<TrackLine>
						<End x="19.6393" y="22.0907"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="14.9518" y="23.547"/>
					<TrackLine>
						<End x="14.9357" y="23.5578"/>
					</TrackLine>
					<TrackLine>
						<End x="14.9195" y="23.569"/>
					</TrackLine>
					<TrackLine>
						<End x="14.7628" y="23.6825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="14.7628" y="23.6825"/>
					<TrackLine>
						<End x="14.4803" y="23.8871"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="14.4803" y="23.8871"/>
					<TrackLine>
						<End x="14.3237" y="24.0006"/>
					</TrackLine>
					<TrackLine>
						<End x="14.3017" y="24.0166"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="14.3017" y="24.0166"/>
					<TrackLine>
						<End x="14.2736" y="24.0369"/>
					</TrackLine>
					<TrackLine>
						<End x="14.2468" y="24.0483"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="14.2468" y="24.0483"/>
					<TrackLine>
						<End x="14.1596" y="24.0852"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0986" y="24.0959"/>
					</TrackLine>
					<TrackLine>
						<End x="13.9797" y="24.1169"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<Subwire width="0.4">
					<Start x="13.9797" y="24.1169"/>
					<TrackLine>
						<End x="11.811" y="24.4993"/>
					</TrackLine>
					<TrackLine>
						<End x="11.614" y="24.534"/>
					</TrackLine>
					<TrackLine>
						<End x="11.3716" y="24.5985"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00010"/>
				<Subwire width="0.4">
					<Start x="23.7033" y="16.2487"/>
					<TrackLine>
						<End x="23.4533" y="15.9987"/>
					</TrackLine>
					<TrackLine>
						<End x="23.4533" y="15.7987"/>
					</TrackLine>
					<TrackLine>
						<End x="23.4533" y="15.7948"/>
					</TrackLine>
					<TrackLine>
						<End x="23.453" y="15.7871"/>
					</TrackLine>
					<TrackLine>
						<End x="23.4527" y="15.7832"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1919" y="12.4301"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1916" y="12.4262"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1913" y="12.4185"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1913" y="12.4146"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1913" y="12.2146"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9413" y="12.1146"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00011"/>
				<Subwire width="0.4">
					<Start x="22.6873" y="18.4585"/>
					<TrackLine>
						<End x="22.5603" y="18.7085"/>
					</TrackLine>
					<TrackLine>
						<End x="22.5603" y="18.9085"/>
					</TrackLine>
					<TrackLine>
						<End x="22.5603" y="19.5627"/>
					</TrackLine>
					<TrackLine>
						<End x="22.5603" y="19.7627"/>
					</TrackLine>
					<TrackLine>
						<End x="22.4333" y="20.3127"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="4.8499" y="10.9848"/>
					<TrackLine>
						<End x="4.6734" y="11.1782"/>
					</TrackLine>
					<TrackLine>
						<End x="4.5889" y="11.3595"/>
					</TrackLine>
					<TrackLine>
						<End x="4.3461" y="11.8804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="13.6858" y="23.0081"/>
					<TrackLine>
						<End x="13.9918" y="22.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0436" y="22.6382"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0454" y="22.6323"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0552" y="22.5999"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0949" y="22.5451"/>
					</TrackLine>
					<TrackLine>
						<End x="14.1227" y="22.5257"/>
					</TrackLine>
					<TrackLine>
						<End x="15.2903" y="21.7139"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="4.3461" y="11.8804"/>
					<TrackLine>
						<End x="4.2844" y="12.0127"/>
					</TrackLine>
					<TrackLine>
						<End x="4.2792" y="12.0239"/>
					</TrackLine>
					<TrackLine>
						<End x="4.2698" y="12.0466"/>
					</TrackLine>
					<TrackLine>
						<End x="4.2656" y="12.0582"/>
					</TrackLine>
					<TrackLine>
						<End x="4.2498" y="12.1021"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="4.2498" y="12.1021"/>
					<TrackLine>
						<End x="4.2497" y="12.1023"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="4.2497" y="12.1023"/>
					<TrackLine>
						<End x="3.627" y="13.8294"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.627" y="13.8294"/>
					<TrackLine>
						<End x="3.5684" y="13.992"/>
					</TrackLine>
					<TrackLine>
						<End x="3.5605" y="14.014"/>
					</TrackLine>
					<TrackLine>
						<End x="3.5485" y="14.0591"/>
					</TrackLine>
					<TrackLine>
						<End x="3.546" y="14.0733"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.546" y="14.0733"/>
					<TrackLine>
						<End x="3.545" y="14.0789"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.2665" y="15.6579"/>
					<TrackLine>
						<End x="3.2318" y="15.8548"/>
					</TrackLine>
					<TrackLine>
						<End x="3.2246" y="15.8954"/>
					</TrackLine>
					<TrackLine>
						<End x="3.2246" y="15.8957"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.2246" y="15.8957"/>
					<TrackLine>
						<End x="3.2227" y="15.978"/>
					</TrackLine>
					<TrackLine>
						<End x="3.228" y="16.0189"/>
					</TrackLine>
					<TrackLine>
						<End x="3.2451" y="16.152"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.2451" y="16.1521"/>
					<TrackLine>
						<End x="3.3167" y="16.7089"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.3167" y="16.7089"/>
					<TrackLine>
						<End x="3.3369" y="16.8655"/>
					</TrackLine>
					<TrackLine>
						<End x="3.3407" y="16.8954"/>
					</TrackLine>
					<TrackLine>
						<End x="3.355" y="16.954"/>
					</TrackLine>
					<TrackLine>
						<End x="3.3588" y="16.9644"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.3588" y="16.9644"/>
					<TrackLine>
						<End x="3.3617" y="16.9724"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.5069" y="17.3715"/>
					<TrackLine>
						<End x="3.552" y="17.4954"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.552" y="17.4954"/>
					<TrackLine>
						<End x="3.6731" y="17.8282"/>
					</TrackLine>
					<TrackLine>
						<End x="3.6834" y="17.8565"/>
					</TrackLine>
					<TrackLine>
						<End x="3.71" y="17.9103"/>
					</TrackLine>
					<TrackLine>
						<End x="3.7262" y="17.9357"/>
					</TrackLine>
					<TrackLine>
						<End x="3.8114" y="18.0688"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.8114" y="18.0688"/>
					<TrackLine>
						<End x="5.0289" y="19.9703"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="5.0289" y="19.9703"/>
					<TrackLine>
						<End x="5.046" y="19.997"/>
					</TrackLine>
					<TrackLine>
						<End x="5.0871" y="20.0573"/>
					</TrackLine>
					<TrackLine>
						<End x="5.1549" y="20.1507"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="5.1549" y="20.1507"/>
					<TrackLine>
						<End x="6.1987" y="21.588"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="6.1987" y="21.588"/>
					<TrackLine>
						<End x="6.8311" y="22.4588"/>
					</TrackLine>
					<TrackLine>
						<End x="6.8775" y="22.5226"/>
					</TrackLine>
					<TrackLine>
						<End x="6.9851" y="22.6381"/>
					</TrackLine>
					<TrackLine>
						<End x="7.0455" y="22.6888"/>
					</TrackLine>
					<TrackLine>
						<End x="7.1987" y="22.8174"/>
					</TrackLine>
					<TrackLine>
						<End x="7.1989" y="22.8176"/>
					</TrackLine>
					<TrackLine>
						<End x="7.8117" y="23.3318"/>
					</TrackLine>
					<TrackLine>
						<End x="7.9779" y="23.4713"/>
					</TrackLine>
					<TrackLine>
						<End x="8.3833" y="23.6261"/>
					</TrackLine>
					<TrackLine>
						<End x="8.6001" y="23.633"/>
					</TrackLine>
					<TrackLine>
						<End x="9.0327" y="23.6466"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="9.0327" y="23.6466"/>
					<TrackLine>
						<End x="9.4427" y="23.6596"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="9.4427" y="23.6596"/>
					<TrackLine>
						<End x="9.6051" y="23.6647"/>
					</TrackLine>
					<TrackLine>
						<End x="9.6305" y="23.6655"/>
					</TrackLine>
					<TrackLine>
						<End x="9.6812" y="23.6624"/>
					</TrackLine>
					<TrackLine>
						<End x="9.7063" y="23.6585"/>
					</TrackLine>
					<TrackLine>
						<End x="9.7105" y="23.6578"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="9.7105" y="23.6578"/>
					<TrackLine>
						<End x="9.7127" y="23.6574"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="15.2903" y="21.7139"/>
					<TrackLine>
						<End x="15.454" y="21.6001"/>
					</TrackLine>
					<TrackLine>
						<End x="15.4729" y="21.587"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="15.4729" y="21.587"/>
					<TrackLine>
						<End x="15.5001" y="21.5681"/>
					</TrackLine>
					<TrackLine>
						<End x="15.5211" y="21.5592"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="15.5211" y="21.5592"/>
					<TrackLine>
						<End x="15.6033" y="21.5241"/>
					</TrackLine>
					<TrackLine>
						<End x="15.6583" y="21.5132"/>
					</TrackLine>
					<TrackLine>
						<End x="15.7834" y="21.4882"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="15.7834" y="21.4882"/>
					<TrackLine>
						<End x="18.8941" y="20.8666"/>
					</TrackLine>
					<TrackLine>
						<End x="18.9038" y="20.8647"/>
					</TrackLine>
					<TrackLine>
						<End x="18.9234" y="20.8627"/>
					</TrackLine>
					<TrackLine>
						<End x="18.9333" y="20.8627"/>
					</TrackLine>
					<TrackLine>
						<End x="19.1333" y="20.8627"/>
					</TrackLine>
					<TrackLine>
						<End x="19.4333" y="20.3127"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.545" y="14.0789"/>
					<TrackLine>
						<End x="3.5447" y="14.0805"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.2451" y="16.152"/>
					<TrackLine>
						<End x="3.2451" y="16.1521"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.3617" y="16.9724"/>
					<TrackLine>
						<End x="3.363" y="16.9762"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="9.7127" y="23.6574"/>
					<TrackLine>
						<End x="9.7155" y="23.657"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.5447" y="14.0805"/>
					<TrackLine>
						<End x="3.5444" y="14.0821"/>
					</TrackLine>
					<TrackLine>
						<End x="3.2665" y="15.6578"/>
					</TrackLine>
					<TrackLine>
						<End x="3.2665" y="15.6579"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="3.363" y="16.9762"/>
					<TrackLine>
						<End x="3.3652" y="16.9823"/>
					</TrackLine>
					<TrackLine>
						<End x="3.4336" y="17.1703"/>
					</TrackLine>
					<TrackLine>
						<End x="3.4337" y="17.1704"/>
					</TrackLine>
					<TrackLine>
						<End x="3.5069" y="17.3715"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="9.7155" y="23.657"/>
					<TrackLine>
						<End x="13.1039" y="23.1287"/>
					</TrackLine>
					<TrackLine>
						<End x="13.1238" y="23.1256"/>
					</TrackLine>
					<TrackLine>
						<End x="13.164" y="23.1274"/>
					</TrackLine>
					<TrackLine>
						<End x="13.1835" y="23.1323"/>
					</TrackLine>
					<TrackLine>
						<End x="13.1865" y="23.1331"/>
					</TrackLine>
					<TrackLine>
						<End x="13.3797" y="23.1849"/>
					</TrackLine>
					<TrackLine>
						<End x="13.6858" y="23.0081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="4.863" y="8.5527"/>
					<TrackLine>
						<End x="5.1405" y="8.4063"/>
					</TrackLine>
					<TrackLine>
						<End x="5.225" y="8.225"/>
					</TrackLine>
					<TrackLine>
						<End x="5.6545" y="7.3037"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="15.818" y="5.0022"/>
					<TrackLine>
						<End x="15.218" y="4.0522"/>
					</TrackLine>
					<TrackLine>
						<End x="15.018" y="4.0522"/>
					</TrackLine>
					<TrackLine>
						<End x="15.0034" y="4.0522"/>
					</TrackLine>
					<TrackLine>
						<End x="14.9746" y="4.048"/>
					</TrackLine>
					<TrackLine>
						<End x="14.9607" y="4.0438"/>
					</TrackLine>
					<TrackLine>
						<End x="12.7061" y="3.3695"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="9.1656" y="5.3553"/>
					<TrackLine>
						<End x="8.8135" y="5.3245"/>
					</TrackLine>
					<TrackLine>
						<End x="8.6603" y="5.453"/>
					</TrackLine>
					<TrackLine>
						<End x="8.6557" y="5.4566"/>
					</TrackLine>
					<TrackLine>
						<End x="8.6284" y="5.4782"/>
					</TrackLine>
					<TrackLine>
						<End x="8.5624" y="5.5004"/>
					</TrackLine>
					<TrackLine>
						<End x="8.5276" y="5.4998"/>
					</TrackLine>
					<TrackLine>
						<End x="7.6933" y="5.4829"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="12.7061" y="3.3695"/>
					<TrackLine>
						<End x="12.5743" y="3.3301"/>
					</TrackLine>
					<TrackLine>
						<End x="12.5363" y="3.3187"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="12.5363" y="3.3187"/>
					<TrackLine>
						<End x="12.4578" y="3.3072"/>
					</TrackLine>
					<TrackLine>
						<End x="12.4181" y="3.3072"/>
					</TrackLine>
					<TrackLine>
						<End x="11.2436" y="3.3072"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="11.2436" y="3.3072"/>
					<TrackLine>
						<End x="10.8181" y="3.3072"/>
					</TrackLine>
					<TrackLine>
						<End x="10.6904" y="3.3072"/>
					</TrackLine>
					<TrackLine>
						<End x="10.4616" y="3.4207"/>
					</TrackLine>
					<TrackLine>
						<End x="10.3843" y="3.5223"/>
					</TrackLine>
					<TrackLine>
						<End x="10.2731" y="3.6685"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="10.2731" y="3.6685"/>
					<TrackLine>
						<End x="9.3803" y="4.8424"/>
					</TrackLine>
					<TrackLine>
						<End x="9.3745" y="4.85"/>
					</TrackLine>
					<TrackLine>
						<End x="9.3615" y="4.8641"/>
					</TrackLine>
					<TrackLine>
						<End x="9.3543" y="4.8704"/>
					</TrackLine>
					<TrackLine>
						<End x="9.3497" y="4.8746"/>
					</TrackLine>
					<TrackLine>
						<End x="9.1965" y="5.0031"/>
					</TrackLine>
					<TrackLine>
						<End x="9.1656" y="5.3553"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="7.6933" y="5.4829"/>
					<TrackLine>
						<End x="7.6755" y="5.4825"/>
					</TrackLine>
					<TrackLine>
						<End x="7.5766" y="5.4805"/>
					</TrackLine>
					<TrackLine>
						<End x="7.39" y="5.5463"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="7.39" y="5.5463"/>
					<TrackLine>
						<End x="7.3142" y="5.6099"/>
					</TrackLine>
					<TrackLine>
						<End x="6.6247" y="6.1884"/>
					</TrackLine>
					<TrackLine>
						<End x="6.6078" y="6.2026"/>
					</TrackLine>
					<TrackLine>
						<End x="6.5765" y="6.2335"/>
					</TrackLine>
					<TrackLine>
						<End x="6.5621" y="6.2502"/>
					</TrackLine>
					<TrackLine>
						<End x="6.4474" y="6.3832"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="6.4474" y="6.3833"/>
					<TrackLine>
						<End x="5.6545" y="7.3037"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="6.4474" y="6.3832"/>
					<TrackLine>
						<End x="6.4474" y="6.3833"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00014"/>
				<Subwire width="0.4">
					<Start x="6.7046" y="9.4115"/>
					<TrackLine>
						<End x="6.5837" y="9.0794"/>
					</TrackLine>
					<TrackLine>
						<End x="6.6682" y="8.8981"/>
					</TrackLine>
					<TrackLine>
						<End x="6.6703" y="8.8933"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="6.4869" y="8.8135"/>
						<End x="6.6768" y="8.8764"/>
					</TrackArcCW>
					<TrackLine>
						<End x="6.9405" y="8.0799"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00014"/>
				<Subwire width="0.4">
					<Start x="6.9405" y="8.0799"/>
					<TrackLine>
						<End x="7.3744" y="7.2064"/>
					</TrackLine>
					<TrackArc>
						<Center x="7.5535" y="7.2954"/>
						<End x="7.4203" y="7.1463"/>
					</TrackArc>
					<TrackLine>
						<End x="7.4249" y="7.1421"/>
					</TrackLine>
					<TrackLine>
						<End x="7.5781" y="7.0136"/>
					</TrackLine>
					<TrackLine>
						<End x="7.609" y="6.6614"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00014"/>
				<Subwire width="0.4">
					<Start x="7.609" y="6.6614"/>
					<TrackLine>
						<End x="7.9611" y="6.6922"/>
					</TrackLine>
					<TrackLine>
						<End x="8.1143" y="6.5637"/>
					</TrackLine>
					<TrackLine>
						<End x="8.1189" y="6.5601"/>
					</TrackLine>
					<TrackLine>
						<End x="8.1462" y="6.5385"/>
					</TrackLine>
					<TrackLine>
						<End x="8.2122" y="6.5163"/>
					</TrackLine>
					<TrackLine>
						<End x="8.247" y="6.5169"/>
					</TrackLine>
					<TrackLine>
						<End x="9.0813" y="6.5338"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00014"/>
				<Subwire width="0.4">
					<Start x="9.0813" y="6.5338"/>
					<TrackLine>
						<End x="9.0991" y="6.5342"/>
					</TrackLine>
					<TrackLine>
						<End x="9.1502" y="6.5352"/>
					</TrackLine>
					<TrackLine>
						<End x="9.2511" y="6.5182"/>
					</TrackLine>
					<TrackLine>
						<End x="9.2991" y="6.5005"/>
					</TrackLine>
					<TrackLine>
						<End x="9.3878" y="6.4677"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00014"/>
				<Subwire width="0.4">
					<Start x="9.3878" y="6.4677"/>
					<TrackLine>
						<End x="10.7488" y="5.9646"/>
					</TrackLine>
					<TrackLine>
						<End x="10.7654" y="5.9585"/>
					</TrackLine>
					<TrackLine>
						<End x="10.8004" y="5.9522"/>
					</TrackLine>
					<TrackLine>
						<End x="10.8181" y="5.9522"/>
					</TrackLine>
					<TrackLine>
						<End x="11.0181" y="5.9522"/>
					</TrackLine>
					<TrackLine>
						<End x="11.6181" y="5.0022"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="24.3253" y="10.9147"/>
					<TrackLine>
						<End x="24.0753" y="10.9147"/>
					</TrackLine>
					<TrackLine>
						<End x="23.8753" y="10.9147"/>
					</TrackLine>
					<TrackLine>
						<End x="23.3913" y="10.9147"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1913" y="10.9147"/>
					</TrackLine>
					<TrackLine>
						<End x="22.9413" y="10.9147"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="8.5793" y="21.6392"/>
					<TrackLine>
						<End x="8.5423" y="21.2165"/>
					</TrackLine>
					<TrackLine>
						<End x="8.3891" y="21.088"/>
					</TrackLine>
					<TrackLine>
						<End x="7.8366" y="20.6168"/>
					</TrackLine>
					<TrackLine>
						<End x="7.8309" y="20.612"/>
					</TrackLine>
					<TrackLine>
						<End x="7.8203" y="20.6015"/>
					</TrackLine>
					<TrackLine>
						<End x="7.8155" y="20.5958"/>
					</TrackLine>
					<TrackLine>
						<End x="7.8131" y="20.5931"/>
					</TrackLine>
					<TrackLine>
						<End x="7.6845" y="20.4399"/>
					</TrackLine>
					<TrackLine>
						<End x="7.4473" y="20.3127"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="6.8885" y="18.0013"/>
					<TrackLine>
						<End x="6.7434" y="17.45"/>
					</TrackLine>
					<TrackLine>
						<End x="6.6434" y="17.2768"/>
					</TrackLine>
					<TrackLine>
						<End x="6.6405" y="17.2714"/>
					</TrackLine>
					<TrackLine>
						<End x="6.6305" y="17.2529"/>
					</TrackLine>
					<TrackLine>
						<End x="6.6188" y="17.2125"/>
					</TrackLine>
					<TrackLine>
						<End x="6.6172" y="17.1915"/>
					</TrackLine>
					<TrackLine>
						<End x="6.4873" y="15.4272"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="7.4473" y="20.3127"/>
					<TrackLine>
						<End x="7.3633" y="20.0569"/>
					</TrackLine>
					<TrackLine>
						<End x="7.2347" y="19.9037"/>
					</TrackLine>
					<TrackLine>
						<End x="7.2329" y="19.9015"/>
					</TrackLine>
					<TrackLine>
						<End x="7.212" y="19.8759"/>
					</TrackLine>
					<TrackLine>
						<End x="7.1889" y="19.8139"/>
					</TrackLine>
					<TrackLine>
						<End x="7.188" y="19.7809"/>
					</TrackLine>
					<TrackLine>
						<End x="7.1602" y="18.82"/>
					</TrackLine>
					<TrackLine>
						<End x="7.1595" y="18.7967"/>
					</TrackLine>
					<TrackLine>
						<End x="7.1475" y="18.7517"/>
					</TrackLine>
					<TrackLine>
						<End x="7.1365" y="18.7312"/>
					</TrackLine>
					<TrackLine>
						<End x="7.1336" y="18.7258"/>
					</TrackLine>
					<TrackLine>
						<End x="7.0336" y="18.5526"/>
					</TrackLine>
					<TrackLine>
						<End x="6.8885" y="18.0013"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="6.1773" y="14.4707"/>
					<TrackLine>
						<End x="6.1947" y="13.4386"/>
					</TrackLine>
					<TrackArc>
						<Center x="6.3946" y="13.442"/>
						<End x="6.1971" y="13.411"/>
					</TrackArc>
					<TrackLine>
						<End x="6.1977" y="13.4073"/>
					</TrackLine>
					<TrackLine>
						<End x="6.2325" y="13.2103"/>
					</TrackLine>
					<TrackLine>
						<End x="6.1773" y="12.9467"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="9.8077" y="7.7011"/>
					<TrackLine>
						<End x="9.7768" y="8.0533"/>
					</TrackLine>
					<TrackLine>
						<End x="9.6236" y="8.1818"/>
					</TrackLine>
					<TrackLine>
						<End x="9.619" y="8.186"/>
					</TrackLine>
					<TrackLine>
						<End x="9.6156" y="8.189"/>
					</TrackLine>
					<TrackLine>
						<End x="9.5978" y="8.2056"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="22.9413" y="10.9147"/>
					<TrackLine>
						<End x="22.6913" y="10.8147"/>
					</TrackLine>
					<TrackLine>
						<End x="22.4913" y="10.8147"/>
					</TrackLine>
					<TrackLine>
						<End x="22.4629" y="10.8147"/>
					</TrackLine>
					<TrackLine>
						<End x="22.4085" y="10.7989"/>
					</TrackLine>
					<TrackLine>
						<End x="22.3845" y="10.7838"/>
					</TrackLine>
					<TrackLine>
						<End x="18.5792" y="8.3806"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="6.4873" y="15.4272"/>
					<TrackLine>
						<End x="6.4847" y="15.3919"/>
					</TrackLine>
					<TrackLine>
						<End x="6.4797" y="15.3237"/>
					</TrackLine>
					<TrackLine>
						<End x="6.4501" y="15.1902"/>
					</TrackLine>
					<TrackLine>
						<End x="6.4259" y="15.1262"/>
					</TrackLine>
					<TrackLine>
						<End x="6.354" y="14.9366"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="6.354" y="14.9366"/>
					<TrackLine>
						<End x="6.1773" y="14.4707"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="9.5978" y="8.2056"/>
					<TrackLine>
						<End x="9.4723" y="8.323"/>
					</TrackLine>
					<TrackLine>
						<End x="9.4648" y="8.3303"/>
					</TrackLine>
					<TrackLine>
						<End x="8.1643" y="9.6308"/>
					</TrackLine>
					<TrackLine>
						<End x="8.1519" y="9.6432"/>
					</TrackLine>
					<TrackLine>
						<End x="8.1301" y="9.6706"/>
					</TrackLine>
					<TrackLine>
						<End x="8.1207" y="9.6854"/>
					</TrackLine>
					<TrackLine>
						<End x="7.6868" y="10.375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="7.6868" y="10.375"/>
					<TrackLine>
						<End x="7.6863" y="10.3758"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="7.6863" y="10.3758"/>
					<TrackLine>
						<End x="6.3816" y="12.4491"/>
					</TrackLine>
					<TrackLine>
						<End x="6.3718" y="12.4648"/>
					</TrackLine>
					<TrackLine>
						<End x="6.3581" y="12.4991"/>
					</TrackLine>
					<TrackLine>
						<End x="6.3546" y="12.5173"/>
					</TrackLine>
					<TrackLine>
						<End x="6.3539" y="12.5209"/>
					</TrackLine>
					<TrackLine>
						<End x="6.3191" y="12.7179"/>
					</TrackLine>
					<TrackLine>
						<End x="6.1773" y="12.9467"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="18.5792" y="8.3806"/>
					<TrackLine>
						<End x="18.431" y="8.287"/>
					</TrackLine>
					<TrackLine>
						<End x="18.4204" y="8.2805"/>
					</TrackLine>
					<TrackLine>
						<End x="16.8276" y="7.3609"/>
					</TrackLine>
					<TrackLine>
						<End x="16.8098" y="7.3506"/>
					</TrackLine>
					<TrackLine>
						<End x="16.7719" y="7.3349"/>
					</TrackLine>
					<TrackLine>
						<End x="16.7521" y="7.3297"/>
					</TrackLine>
					<TrackLine>
						<End x="14.9756" y="6.8537"/>
					</TrackLine>
					<TrackLine>
						<End x="14.9558" y="6.8484"/>
					</TrackLine>
					<TrackLine>
						<End x="14.9151" y="6.843"/>
					</TrackLine>
					<TrackLine>
						<End x="14.8946" y="6.843"/>
					</TrackLine>
					<TrackLine>
						<End x="13.0554" y="6.843"/>
					</TrackLine>
					<TrackLine>
						<End x="13.0349" y="6.843"/>
					</TrackLine>
					<TrackLine>
						<End x="12.9944" y="6.8483"/>
					</TrackLine>
					<TrackLine>
						<End x="12.9746" y="6.8536"/>
					</TrackLine>
					<TrackLine>
						<End x="12.9499" y="6.8602"/>
					</TrackLine>
					<TrackLine>
						<End x="12.9497" y="6.8603"/>
					</TrackLine>
					<TrackLine>
						<End x="11.1979" y="7.3297"/>
					</TrackLine>
					<TrackLine>
						<End x="11.1919" y="7.3313"/>
					</TrackLine>
					<TrackLine>
						<End x="11.0321" y="7.3776"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="11.0321" y="7.3776"/>
					<TrackLine>
						<End x="11.0319" y="7.3777"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<Subwire width="0.4">
					<Start x="11.0319" y="7.3777"/>
					<TrackLine>
						<End x="10.3861" y="7.5645"/>
					</TrackLine>
					<TrackLine>
						<End x="10.3674" y="7.5699"/>
					</TrackLine>
					<TrackLine>
						<End x="10.3328" y="7.5877"/>
					</TrackLine>
					<TrackLine>
						<End x="10.3176" y="7.5998"/>
					</TrackLine>
					<TrackLine>
						<End x="10.313" y="7.6034"/>
					</TrackLine>
					<TrackLine>
						<End x="10.1598" y="7.7319"/>
					</TrackLine>
					<TrackLine>
						<End x="9.8077" y="7.7011"/>
					</TrackLine>
				</Subwire>
			</Wire>
		</Wires>
		<Coppers>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00000"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="5.1976" y="15.1679"/>
						<SegmentLine>
							<End x="5.2389" y="15.1456"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.4141" y="14.9772"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7249" y="15.1765"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7305" y="15.2506"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7379" y="15.3328"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7503" y="15.3824"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7567" y="15.3973"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7637" y="15.4288"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7642" y="15.445"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7774" y="15.5065"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7474" y="15.6602"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7206" y="16.0561"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7535" y="16.35"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7607" y="16.4673"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7576" y="16.6613"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.778" y="16.7861"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8001" y="16.8604"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8085" y="16.875"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.6131" y="17.3001"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2546" y="17.1499"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1915" y="16.9556"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1859" y="16.9373"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1768" y="16.876"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1292" y="16.7452"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0956" y="16.6343"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1068" y="16.4381"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.069" y="16.3026"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0817" y="16.2712"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0808" y="16.2678"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0827" y="16.2626"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0777" y="16.2427"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0834" y="16.2274"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0987" y="16.173"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0994" y="16.131"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1071" y="16.0795"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1125" y="16.059"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1765" y="15.7174"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1926" y="15.5777"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1476" y="15.5449"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0936" y="15.2901"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1976" y="15.1679"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="5.6251" y="15.2613"/>
							<SegmentLine>
								<End x="5.7423" y="15.3785"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7423" y="15.5441"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.6912" y="15.5952"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7228" y="16.0237"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7206" y="16.0561"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.734" y="16.1758"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7469" y="16.3509"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7598" y="16.5258"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7576" y="16.6613"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.778" y="16.7861"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7792" y="16.7901"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7886" y="16.9182"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.6131" y="17.3001"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2965" y="17.1675"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2499" y="17.04"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2236" y="16.9681"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1796" y="16.8948"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1768" y="16.876"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1292" y="16.7452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1139" y="16.6947"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1057" y="16.6436"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.0965" y="16.6183"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1058" y="16.4552"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1524" y="16.4226"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1916" y="16.2003"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2566" y="15.8318"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2958" y="15.6094"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.335" y="15.3871"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2748" y="15.3011"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.3608" y="15.2409"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.3983" y="15.0281"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.6045" y="15.2343"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.6147" y="15.2613"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.6251" y="15.2613"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00001"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="4.8169" y="14.8438"/>
						<SegmentLine>
							<End x="4.7261" y="14.9505"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.4114" y="14.895"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2386" y="14.8645"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.1634" y="14.6695"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2313" y="14.4851"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2315" y="14.4289"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2338" y="14.3977"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3396" y="14.1921"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3483" y="14.1696"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3791" y="14.0194"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6347" y="13.0919"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6562" y="12.9376"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6867" y="12.853"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.7959" y="12.6762"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8092" y="12.626"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.815" y="12.554"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8441" y="12.3748"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.863" y="12.2887"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.3471" y="12.1459"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.4637" y="12.6242"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.4385" y="12.6503"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.4306" y="12.6619"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.4279" y="12.6691"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.3402" y="12.7991"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2513" y="13.0949"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2622" y="13.2423"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2596" y="13.2573"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2523" y="13.3035"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2469" y="13.3373"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1726" y="14.1314"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1523" y="14.2685"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1526" y="14.34"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1332" y="14.4699"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1331" y="14.5539"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8925" y="14.7852"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8169" y="14.8438"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="5.371" y="12.6127"/>
							<SegmentLine>
								<End x="5.371" y="12.6533"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.3471" y="12.7888"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.3402" y="12.7991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2513" y="13.0949"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2622" y="13.2423"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2523" y="13.3035"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2469" y="13.3373"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2429" y="13.3797"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2278" y="13.4655"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.234" y="13.4744"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1726" y="14.1314"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1523" y="14.2685"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1525" y="14.3245"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.9755" y="14.3803"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.7008" y="14.6936"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.6807" y="14.8077"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.5948" y="14.8678"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.5846" y="14.9255"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.4114" y="14.895"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.2386" y="14.8645"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.2294" y="14.8407"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.3345" y="14.2447"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.0201" y="12.3429"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.0745" y="12.2263"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.3471" y="12.1459"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.4129" y="12.4158"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.3797" y="12.604"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.371" y="12.6127"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00015"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="5.9947" y="14.7555"/>
						<SegmentLine>
							<End x="5.6332" y="14.5237"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.6332" y="14.4703"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.6485" y="14.4032"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.6523" y="14.2646"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.6685" y="14.1949"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7444" y="13.3869"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7478" y="13.3709"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7487" y="13.3615"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7546" y="13.3291"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7451" y="13.0159"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8327" y="12.8859"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9216" y="12.5901"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9231" y="12.5755"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9289" y="12.5528"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9495" y="12.5058"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.721" y="11.9985"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7466" y="11.9565"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8471" y="11.8145"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.251" y="11.1281"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2915" y="10.7324"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9899" y="10.5587"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0213" y="10.5199"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5929" y="9.7191"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6633" y="9.5858"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6751" y="9.5669"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6362" y="9.3751"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6535" y="9.3014"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6611" y="9.2932"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.9472" y="8.8665"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.9666" y="8.7889"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.9948" y="8.7585"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0265" y="8.6852"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4001" y="8.1808"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5109" y="8.0357"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.6212" y="7.925"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7719" y="7.8016"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7897" y="7.7846"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.035" y="7.735"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.0585" y="7.7379"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.1548" y="7.6548"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2029" y="7.6616"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2078" y="7.6575"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2287" y="7.6603"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.4719" y="7.3054"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5831" y="7.3313"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6018" y="7.3359"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6358" y="7.3359"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6509" y="7.331"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7113" y="7.3072"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.771" y="7.2774"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.1274" y="7.1934"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.1613" y="7.1827"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.1851" y="7.1709"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.2337" y="7.1534"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.8776" y="6.9391"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.0133" y="6.8984"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.0243" y="6.8945"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.1363" y="6.8898"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.6666" y="6.7259"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.6974" y="6.6557"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.2719" y="6.2506"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.3909" y="6.2096"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.4296" y="6.1344"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.4557" y="6.1257"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.479" y="6.1207"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.587" y="6.1108"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.3046" y="5.4837"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.4232" y="5.501"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.5007" y="5.6586"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.8249" y="5.9403"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.0823" y="6.0569"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.1202" y="6.1355"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.2565" y="6.1471"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.2811" y="6.1518"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.2933" y="6.1555"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.2602" y="6.3767"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.3896" y="6.4"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.4112" y="6.4067"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.4312" y="6.4161"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.9818" y="3.6706"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.74" y="4.1083"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.7576" y="4.1186"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.4667" y="4.5279"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.6113" y="4.6115"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.8381" y="4.7424"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.2814" y="5.083"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.1459" y="5.9475"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.1598" y="5.9615"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.1745" y="5.9761"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.0686" y="6.8702"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.3633" y="7.2566"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.4772" y="7.4539"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.9932" y="8.3478"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.0031" y="8.3648"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.1472" y="8.6144"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.1575" y="8.6231"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.3326" y="8.9325"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.3421" y="8.9393"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.3861" y="9.0175"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.3903" y="9.0199"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.6254" y="9.4325"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.631" y="9.4357"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.7213" y="9.5983"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.8061" y="9.8142"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.8094" y="9.8276"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.8149" y="9.8318"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.8724" y="10.0651"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.8797" y="10.0707"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.1447" y="11.0941"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.1502" y="11.1123"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.2116" y="11.3157"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.3253" y="11.2647"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.1772" y="11.2684"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.1493" y="11.2699"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.0125" y="11.2806"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.8748" y="11.2956"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.6935" y="11.3953"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.5139" y="11.3298"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.3293" y="11.3176"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.2541" y="11.2806"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.1173" y="11.2699"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9413" y="11.2647"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.8061" y="11.2285"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.6345" y="11.2284"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.6158" y="11.23"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.5811" y="11.225"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.7135" y="12.0776"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.7035" y="12.0396"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.6736" y="11.9237"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.6701" y="11.919"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.5287" y="11.4013"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.5166" y="11.3798"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.1141" y="10.6827"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.6026" y="9.8026"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.5862" y="9.7859"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.3286" y="9.5283"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.2973" y="8.4988"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.2773" y="8.4874"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.2197" y="8.4577"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.1853" y="8.4378"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.6987" y="7.5759"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.6912" y="7.5728"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.6674" y="7.5665"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.6042" y="7.5527"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.5657" y="7.5424"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.9068" y="7.0947"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.8987" y="7.0936"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.8741" y="7.0937"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.8095" y="7.0967"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.7697" y="7.0967"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.0513" y="7.0936"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.0432" y="7.0947"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.0146" y="7.1022"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.9334" y="7.1273"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.8949" y="7.1376"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.2615" y="7.572"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.244" y="7.5836"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.2183" y="7.6013"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.1838" y="7.616"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.5601" y="7.975"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.4922" y="8.0145"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.4719" y="8.0287"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.2042" y="8.1868"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.1576" y="8.2154"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.8892" y="8.3632"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.8626" y="8.3819"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7863" y="8.4219"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7157" y="8.4635"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6872" y="8.4846"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6434" y="8.506"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6276" y="8.5221"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.584" y="8.5699"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5558" y="8.598"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.339" y="9.8104"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3327" y="9.8188"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3228" y="9.8368"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2957" y="9.8898"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2754" y="9.9235"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.4653" y="11.3211"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.4079" y="11.4218"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.403" y="11.4428"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0626" y="12.7117"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0597" y="12.7198"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0432" y="12.7848"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9604" y="13.0993"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9519" y="13.1376"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9275" y="13.2205"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9276" y="13.244"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9289" y="13.3623"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9275" y="13.3781"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9275" y="13.4583"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9281" y="14.3638"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.928" y="14.3798"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9276" y="14.4325"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9305" y="14.4485"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9275" y="14.9219"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9313" y="14.9424"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.928" y="15.0652"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9292" y="15.0752"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9352" y="15.0971"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9485" y="15.1462"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.982" y="15.2693"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9832" y="15.2767"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.4083" y="16.8612"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.4227" y="16.8855"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.4251" y="16.891"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.4502" y="16.9341"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.7851" y="17.5116"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.7897" y="17.5228"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.8903" y="17.6937"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.8947" y="17.7044"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0703" y="18.0059"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0744" y="18.0158"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0993" y="18.0586"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1643" y="18.1716"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2513" y="18.3214"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3257" y="18.4478"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3284" y="18.4552"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3461" y="18.4722"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3585" y="18.4849"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5381" y="19.1675"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5242" y="19.5624"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6425" y="19.9134"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6527" y="19.9395"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.8744" y="20.1898"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.9342" y="20.2097"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0292" y="20.3144"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0812" y="20.3681"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1102" y="20.397"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1461" y="20.43"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1769" y="20.4576"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2125" y="20.4883"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2709" y="20.5367"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3177" y="20.5757"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4748" y="20.7086"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5884" y="20.8053"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.6101" y="20.8247"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7207" y="20.9129"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7633" y="20.9532"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.8054" y="21.0341"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.8379" y="21.1695"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.8686" y="21.2945"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.1584" y="21.3129"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.1755" y="21.3215"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.3285" y="21.6087"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.0767" y="21.9782"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.9973" y="21.998"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.9008" y="22.0007"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.8232" y="21.9989"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.6366" y="22.0095"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4973" y="21.958"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4581" y="21.9052"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3358" y="21.8033"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2795" y="21.7753"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2346" y="21.7415"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2108" y="21.5992"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1702" y="21.5469"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0534" y="21.3098"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.9487" y="21.21"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6111" y="20.8097"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6072" y="20.806"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6007" y="20.7921"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5932" y="20.7842"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5862" y="20.7703"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5811" y="20.764"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5662" y="20.7381"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.4745" y="20.6235"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.4708" y="20.6152"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3057" y="20.5078"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2426" y="20.3814"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1866" y="20.2314"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1737" y="20.213"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0635" y="20.0525"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0541" y="20.0318"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0508" y="20.0262"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0353" y="20.0062"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0099" y="19.9626"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9909" y="19.9157"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9578" y="19.8752"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9551" y="19.8508"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9322" y="19.8272"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9158" y="19.6754"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.7607" y="19.1304"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.7203" y="19.0775"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.7183" y="19.0518"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6264" y="18.7877"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.5723" y="18.7398"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.5306" y="18.6076"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.4646" y="18.4813"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.4093" y="18.4303"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.3689" y="18.3013"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.3151" y="18.2408"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2756" y="18.113"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1627" y="17.9045"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1176" y="17.8363"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1114" y="17.8145"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0284" y="17.6319"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0201" y="17.6169"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9803" y="17.55"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2627" y="17.0838"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2594" y="17.058"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2644" y="16.9019"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2528" y="16.5915"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2582" y="16.5163"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2344" y="16.213"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2187" y="16.0988"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2474" y="15.651"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2683" y="15.601"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2628" y="15.4082"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2583" y="15.3562"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2357" y="15.2542"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2179" y="15.2051"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1558" y="15.0582"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0636" y="14.8778"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9947" y="14.7555"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="5.9773" y="14.5535"/>
							<SegmentLine>
								<End x="5.9251" y="14.5013"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.8981" y="14.4743"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.8976" y="14.3218"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9096" y="14.2405"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9144" y="14.2007"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9451" y="13.8722"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9758" y="13.5437"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9846" y="13.4497"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9864" y="13.4309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9976" y="13.3613"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0046" y="13.3182"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0084" y="13.2309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0045" y="13.1774"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0359" y="13.0729"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0673" y="12.9947"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0808" y="12.9182"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0935" y="12.8463"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1047" y="12.7827"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1103" y="12.7507"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1134" y="12.7334"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1466" y="12.5452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.16" y="12.469"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.155" y="12.3144"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1367" y="12.2393"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0709" y="11.9694"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0629" y="11.9365"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1446" y="11.8192"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.3648" y="11.5031"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.419" y="11.4253"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4849" y="11.2475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4946" y="11.1532"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5115" y="10.9882"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5176" y="10.9286"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6899" y="10.8857"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.0491" y="10.7964"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.2193" y="10.7541"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.4861" y="10.5265"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.5548" y="10.3652"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.5619" y="10.3485"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.7348" y="9.9951"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.784" y="9.9533"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.9209" y="9.6694"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.926" y="9.5119"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.9319" y="9.3304"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.9943" y="9.2381"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1256" y="9.0441"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1495" y="9.0087"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1889" y="8.933"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.2091" y="8.8803"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.2305" y="8.8406"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.2667" y="8.7732"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.5835" y="8.3448"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.7279" y="8.1661"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.7498" y="8.1443"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.8621" y="8.0485"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.9539" y="8.019"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.0228" y="7.9969"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.1494" y="7.927"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.2048" y="7.8805"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.3021" y="7.7989"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4752" y="7.6537"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.5867" y="7.5601"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.6121" y="7.5388"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.6704" y="7.4899"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.6897" y="7.4737"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.8311" y="7.3551"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.8796" y="7.3144"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.2281" y="7.4133"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.4453" y="7.3415"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.9714" y="7.1675"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0154" y="7.1556"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1833" y="7.1306"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.2111" y="7.1259"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.4828" y="7.0749"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.6193" y="7.0493"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.8556" y="6.9031"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.9394" y="6.7924"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.9509" y="6.7771"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.0641" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.1924" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.4181" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.6438" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.9631" y="6.3779"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.9631" y="6.1075"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.069" y="6.015"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.3808" y="5.7425"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.5641" y="5.7693"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.2941" y="5.8761"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.3982" y="5.9475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.473" y="5.9988"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.473" y="6.1522"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.473" y="6.3779"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.7923" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.018" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.9854" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.0063" y="6.7122"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.372" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.3923" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.618" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.8437" y="6.6972"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.163" y="6.3779"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.163" y="6.1436"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.91" y="5.5084"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.1052" y="4.492"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.3076" y="4.3199"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.8345" y="5.2015"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.9141" y="7.2811"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.385" y="9.8287"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.7027" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.556" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.3367" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.286" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.2608" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.0685" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.0281" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.9744" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.7921" y="11.0615"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.7096" y="11.1068"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.6245" y="11.1536"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.482" y="11.1022"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3616" y="11.0588"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3008" y="11.0369"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.1736" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.109" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.0165" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.9538" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.8827" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.7999" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.4913" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.4279" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.3895" y="11.0146"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.1193" y="11.0147"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.0582" y="11.0758"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.5635" y="11.1792"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.8516" y="11.3279"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.8109" y="11.3364"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.7771" y="11.2104"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.7298" y="11.1831"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.864" y="9.6835"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.8519" y="9.6623"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.8221" y="9.6235"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.8048" y="9.6062"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.1573" y="8.9587"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.5098" y="8.3112"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.4925" y="8.294"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.4537" y="8.2642"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.4325" y="8.252"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.6394" y="7.7941"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.8463" y="7.3362"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.8251" y="7.3239"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.7799" y="7.3052"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.7563" y="7.2989"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.8718" y="7.0619"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.9872" y="6.8249"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.9636" y="6.8186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.9151" y="6.8122"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.8907" y="6.8122"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.975" y="6.8122"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.0593" y="6.8122"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.0349" y="6.8122"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.9864" y="6.8186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.9628" y="6.8249"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.0783" y="7.0619"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1937" y="7.2989"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1701" y="7.3053"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1249" y="7.324"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1037" y="7.3362"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.3106" y="7.7941"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.5175" y="8.252"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4963" y="8.2641"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4575" y="8.2939"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4402" y="8.3112"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.7927" y="8.9587"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1452" y="9.6062"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.128" y="9.6235"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.0982" y="9.6623"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.086" y="9.6835"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.6281" y="10.4766"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1702" y="11.2697"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1579" y="11.2909"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1392" y="11.3361"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1329" y="11.3597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.8959" y="12.2442"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6589" y="13.1288"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6526" y="13.1524"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6462" y="13.2009"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6462" y="13.2253"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6462" y="14.141"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6462" y="15.0567"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6462" y="15.0811"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6526" y="15.1296"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6589" y="15.1532"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.8959" y="16.0377"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1329" y="16.9223"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1393" y="16.9459"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.158" y="16.9911"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1702" y="17.0123"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.6281" y="17.8054"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.813" y="18.1257"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.7749" y="18.132"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.6601" y="18.3649"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.529" y="18.496"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.529" y="18.6309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.4656" y="18.7596"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.3255" y="19.0439"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.2735" y="19.1497"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.2396" y="19.3831"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.2596" y="19.4993"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.2782" y="19.6076"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.308" y="19.7816"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.3612" y="19.8537"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.388" y="19.9354"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.4126" y="20.0105"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.4923" y="20.1469"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.5456" y="20.2053"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.6264" y="20.2938"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.6599" y="20.3305"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.7362" y="20.3944"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.7782" y="20.421"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.7925" y="20.43"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.8112" y="20.4486"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.9399" y="20.5761"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.9531" y="20.5891"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.9807" y="20.6138"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.9951" y="20.6255"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.0423" y="20.6651"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.0567" y="20.6782"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.0793" y="20.698"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1934" y="20.794"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.2463" y="20.8388"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.2517" y="20.9007"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.4246" y="21.0458"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.6653" y="21.2478"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.7315" y="21.3751"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.8448" y="21.4703"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.9842" y="21.5874"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.0238" y="21.6207"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.9755" y="21.6916"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.8597" y="21.7718"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.7954" y="21.8484"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.6614" y="22.0081"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.6485" y="22.0088"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.5021" y="21.886"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.219" y="21.6484"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.2108" y="21.5992"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1702" y="21.5469"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1577" y="21.5214"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1921" y="21.2974"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.0326" y="20.9124"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.6966" y="20.666"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.6066" y="20.6582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.4189" y="20.4345"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.3786" y="20.3866"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.3606" y="20.3651"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1766" y="20.0659"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1766" y="19.9505"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.141" y="19.9149"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1391" y="19.8785"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1277" y="19.8202"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1272" y="19.8042"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1267" y="19.7814"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1208" y="19.5775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1194" y="19.5308"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1051" y="19.4385"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.0922" y="19.3936"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.0065" y="19.0948"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.9973" y="19.0624"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.9729" y="18.9997"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.958" y="18.9695"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.9385" y="18.93"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.9078" y="18.8264"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.8883" y="18.7606"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.826" y="18.6383"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.7968" y="18.6003"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.7849" y="18.5647"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.7578" y="18.5127"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.693" y="18.3882"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6773" y="18.3582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6407" y="18.3011"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6363" y="18.2955"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5935" y="18.1918"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5481" y="18.1267"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.523" y="18.0556"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4955" y="18.0046"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.3651" y="17.7628"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.3363" y="17.7108"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.286" y="17.62"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.3778" y="17.4202"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4655" y="17.2293"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5049" y="17.1436"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5385" y="16.9578"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5316" y="16.8637"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5222" y="16.7356"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5193" y="16.695"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5079" y="16.6333"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5036" y="16.607"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5047" y="16.5379"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.505" y="16.5212"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.504" y="16.4877"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5028" y="16.471"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4899" y="16.2962"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.477" y="16.1211"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4744" y="16.0929"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4678" y="16.0344"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4677" y="15.9952"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4658" y="15.9689"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4593" y="15.8807"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4873" y="15.8527"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4873" y="15.6923"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4873" y="15.5441"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4873" y="15.3785"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4873" y="15.2303"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4873" y="15.0699"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.3739" y="14.9565"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.2691" y="14.8517"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1991" y="14.7817"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1874" y="14.7636"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1313" y="14.7075"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0945" y="14.6707"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9773" y="14.5535"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00002"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="4.6585" y="15.6485"/>
						<SegmentLine>
							<End x="4.7181" y="15.7356"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6833" y="15.7996"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6307" y="15.925"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6022" y="16.0778"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6051" y="16.093"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.5838" y="16.2454"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.5796" y="16.2864"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.5837" y="16.2936"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.5823" y="16.3073"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.583" y="16.3086"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.5762" y="16.3877"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6068" y="16.4401"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6062" y="16.4449"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6077" y="16.5237"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6061" y="16.5327"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6332" y="16.8078"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.7566" y="17.147"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8159" y="17.2736"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8382" y="17.3096"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0614" y="17.611"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.5255" y="17.7579"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.5953" y="17.8819"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.6431" y="17.9895"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.646" y="18.0024"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7134" y="18.1238"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8398" y="18.3582"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8538" y="18.4335"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9359" y="18.5513"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.949" y="18.6254"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0322" y="18.7322"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.097" y="18.8567"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1089" y="18.9277"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1934" y="19.0377"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2317" y="19.1672"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2308" y="19.1799"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2904" y="19.3002"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.4504" y="19.8581"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.4402" y="19.9162"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.4762" y="19.9947"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.4744" y="20.0033"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.5463" y="20.1445"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.5504" y="20.1596"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6329" y="20.303"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6383" y="20.3086"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6458" y="20.3205"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6862" y="20.3805"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.723" y="20.4294"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.759" y="20.4907"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.7686" y="20.5403"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.012" y="20.9124"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0841" y="20.9322"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0981" y="20.9527"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.135" y="20.9913"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1786" y="21.0606"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1807" y="21.0627"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2037" y="21.0976"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2068" y="21.1002"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2294" y="21.1336"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2312" y="21.1347"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.581" y="21.5488"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6362" y="21.5854"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6912" y="21.6902"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.7607" y="21.8169"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.7553" y="21.8839"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.8243" y="21.9821"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.9213" y="22.0828"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2508" y="22.3601"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3726" y="22.4423"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7132" y="22.5037"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.1038" y="22.4127"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2331" y="22.3744"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.3766" y="22.3236"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.4899" y="22.2597"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.741" y="21.8913"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.0695" y="21.9318"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.4689" y="22.2287"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.6053" y="22.3981"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.6325" y="22.4819"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.3253" y="22.8678"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.0317" y="22.8468"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.8848" y="22.9033"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7895" y="22.9174"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7408" y="22.9301"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5899" y="22.9505"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5663" y="22.9506"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5455" y="22.9491"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.3851" y="22.9714"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.752" y="23.048"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.6672" y="23.0948"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.6101" y="23.1012"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5505" y="23.0901"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5288" y="23.0818"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3789" y="23.0439"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3276" y="23.0268"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2737" y="23.0061"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2318" y="22.9693"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.162" y="22.9143"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1405" y="22.8962"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0237" y="22.7958"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6523" y="22.484"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6095" y="22.4481"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5504" y="22.3986"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.44" y="22.2995"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3959" y="22.2714"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3715" y="22.2505"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3553" y="22.237"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3275" y="22.2053"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2847" y="22.1572"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2638" y="22.1301"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2477" y="22.1023"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2278" y="22.0749"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1512" y="21.9403"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.5433" y="20.9971"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.5581" y="20.9812"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2884" y="20.5599"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2902" y="20.5448"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2745" y="20.5232"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1931" y="20.3824"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7883" y="19.7584"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7553" y="19.7177"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7074" y="19.6353"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.6965" y="19.6206"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.6553" y="19.5569"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.5797" y="19.4282"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.5657" y="19.4052"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.4651" y="19.2846"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.3562" y="19.1268"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2539" y="19.004"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2264" y="18.9543"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1303" y="18.8244"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.9022" y="18.4929"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8221" y="18.3594"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.7974" y="18.3209"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.7147" y="18.1803"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.4065" y="17.6736"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.379" y="17.633"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3658" y="17.6057"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.352" y="17.5811"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3426" y="17.5593"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2904" y="17.4159"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2869" y="17.4029"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.1581" y="17.2426"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.1326" y="17.1725"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.1136" y="17.1286"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.1126" y="16.9232"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0556" y="16.7825"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0442" y="16.7353"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0378" y="16.7009"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0323" y="16.6825"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0289" y="16.6467"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0257" y="16.6083"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0178" y="16.573"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0201" y="16.554"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0259" y="16.2484"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0409" y="16.0974"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0308" y="16.0408"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.9868" y="15.8088"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.9961" y="15.7639"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0145" y="15.7135"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0144" y="15.5146"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.1518" y="15.357"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3246" y="15.3875"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.614" y="15.4385"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6585" y="15.6485"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="10.436" y="22.7287"/>
							<SegmentLine>
								<End x="9.6067" y="22.858"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.1282" y="22.8429"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.9384" y="22.8369"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.3661" y="22.3273"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.3766" y="22.3236"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4899" y="22.2597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.741" y="21.8913"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.0695" y="21.9318"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.4689" y="22.2287"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.6053" y="22.3981"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.6325" y="22.4819"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.436" y="22.7287"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
					<Island>
						<FilledContour>
							<Start x="6.382" y="19.8042"/>
							<SegmentLine>
								<End x="6.3829" y="19.8359"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.3847" y="19.9024"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.3979" y="19.97"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.3656" y="20.3382"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.7622" y="20.8109"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.7854" y="20.8816"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.8482" y="20.9134"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.2343" y="21.3735"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.4241" y="21.3901"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.3123" y="21.5234"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.3348" y="21.7803"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6254" y="20.8039"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.748" y="19.5952"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7125" y="19.5427"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.0659" y="18.5327"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.421" y="17.5255"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.3111" y="17.2235"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.1914" y="16.8946"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.133" y="16.7344"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.0821" y="16.3393"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.0328" y="15.9555"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.0605" y="15.7978"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.0961" y="15.5959"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.2819" y="15.6287"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.4554" y="15.6592"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.5283" y="15.672"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.5229" y="15.7024"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.4579" y="16.0709"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.4536" y="16.0951"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.3717" y="16.2419"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.362" y="16.4128"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.3527" y="16.5759"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.3484" y="16.6516"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.3705" y="16.8016"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.3813" y="16.8313"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.3936" y="16.8866"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.4009" y="16.9107"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.4162" y="16.9612"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.4291" y="17"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.451" y="17.0601"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.4535" y="17.0771"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.503" y="17.2153"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.5485" y="17.291"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.5968" y="17.4232"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.6502" y="17.5694"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.8651" y="17.7946"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.0087" y="17.8547"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.3253" y="17.9873"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.6031" y="18.1036"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.6846" y="18.0718"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7134" y="18.1238"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.8398" y="18.3582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.8538" y="18.4335"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9359" y="18.5513"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.949" y="18.6254"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0322" y="18.7322"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.097" y="18.8567"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1089" y="18.9277"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1934" y="19.0377"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.2317" y="19.1672"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.2308" y="19.1799"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.2904" y="19.3002"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.3761" y="19.599"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.382" y="19.8029"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.382" y="19.8042"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00005"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="10.8654" y="21.9242"/>
						<SegmentLine>
							<End x="10.1308" y="21.4356"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7798" y="21.3923"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6168" y="21.0864"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5941" y="21.0674"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.19" y="20.9114"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2023" y="20.8271"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2162" y="20.7491"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.0847" y="20.5701"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.974" y="20.4819"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.9314" y="20.4416"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.8764" y="20.3966"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.8301" y="20.3569"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.673" y="20.2239"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5589" y="20.1279"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.536" y="20.107"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5178" y="20.0919"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5097" y="20.0841"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4979" y="20.0748"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4916" y="20.0682"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4774" y="20.0575"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4642" y="20.0468"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3355" y="19.9193"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3019" y="19.8708"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1766" y="19.7915"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0893" y="19.6959"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0873" y="19.6849"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0241" y="19.55"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.9938" y="19.3732"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.413" y="18.5226"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.8804" y="19.0131"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.8937" y="19.023"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.155" y="19.2863"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.1665" y="19.2988"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2236" y="19.3563"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2832" y="19.4154"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2963" y="19.4274"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6382" y="19.7706"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6517" y="19.7826"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.672" y="19.7941"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.8096" y="19.8699"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.8426" y="19.8899"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.9256" y="19.9399"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.9435" y="19.9438"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.28" y="20.1432"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.2967" y="20.1548"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.373" y="20.1991"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.2536" y="20.7072"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.2764" y="20.7129"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.8514" y="20.8656"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.864" y="20.8714"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.9808" y="20.902"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.2186" y="20.9614"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.2221" y="20.9639"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.4608" y="21.0223"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.482" y="21.0366"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.0123" y="21.1712"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.3585" y="22.5326"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.3501" y="22.5321"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.8869" y="22.5637"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.7616" y="22.4944"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.7171" y="22.5028"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.7107" y="22.5051"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.481" y="22.5184"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.1157" y="22.3509"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.0809" y="22.2437"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="8.0124" y="19.4815"/>
							<SegmentLine>
								<End x="7.9938" y="19.3732"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.274" y="18.8046"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.7927" y="19.3233"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4402" y="19.9708"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4575" y="19.988"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4963" y="20.0178"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.5175" y="20.03"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.3106" y="20.4879"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1037" y="20.9458"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1249" y="20.9581"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1701" y="20.9768"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1937" y="20.9831"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.0782" y="21.2201"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.885" y="21.4363"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.4123" y="22.4205"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.8005" y="22.5159"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.7616" y="22.4944"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.7171" y="22.5028"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.7107" y="22.5051"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.481" y="22.5184"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.3905" y="22.4769"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.399" y="22.4302"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.3411" y="22.2519"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.3139" y="22.1681"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.2929" y="22.1034"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.2282" y="21.9839"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1856" y="21.9309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0492" y="21.7615"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0196" y="21.7246"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.9514" y="21.659"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.9134" y="21.6308"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.7137" y="21.4823"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.514" y="21.3339"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.4363" y="21.2762"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.2567" y="21.2042"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.1607" y="21.1924"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.8322" y="21.1519"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.639" y="21.1281"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.6168" y="21.0864"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.5941" y="21.0674"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4634" y="21.017"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.324" y="20.8999"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.3164" y="20.8135"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.1785" y="20.6978"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.0847" y="20.5701"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.974" y="20.4819"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.9314" y="20.4416"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.8764" y="20.3966"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.8301" y="20.3569"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.673" y="20.2239"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.5589" y="20.1279"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.536" y="20.107"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.5178" y="20.0919"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.5097" y="20.0841"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.4979" y="20.0748"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.4916" y="20.0682"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.4774" y="20.0575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.4642" y="20.0468"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.3355" y="19.9193"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.3019" y="19.8708"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1766" y="19.7915"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.0958" y="19.703"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.0252" y="19.488"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.0124" y="19.4815"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00012"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="4.4477" y="12.2278"/>
						<SegmentLine>
							<End x="4.3808" y="12.3681"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3185" y="12.5276"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.284" y="12.5782"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.18" y="12.8665"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.1709" y="12.9103"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.8857" y="13.9381"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.88" y="13.9947"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.8586" y="14.0558"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.8128" y="14.1281"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.8076" y="14.1398"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.7851" y="14.2036"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.7488" y="14.3542"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.6969" y="14.8493"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.7687" y="15.0355"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.6375" y="15.1859"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5158" y="15.6763"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.4995" y="15.823"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.505" y="15.9422"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5309" y="16.0271"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5476" y="16.1788"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.526" y="16.2346"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5202" y="16.5497"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5182" y="16.5555"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5298" y="16.672"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5303" y="16.6836"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5466" y="16.8014"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5491" y="16.8067"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5506" y="16.8161"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.5743" y="16.9062"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.6313" y="17.047"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.6427" y="17.0942"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.6332" y="17.158"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.6965" y="17.3083"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.7836" y="17.5476"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.8254" y="17.5954"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.8412" y="17.6355"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.8574" y="17.68"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.8822" y="17.752"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.9238" y="17.841"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.0111" y="17.9796"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3206" y="18.488"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3429" y="18.5294"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.4279" y="18.6644"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.452" y="18.7019"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.7556" y="19.1556"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.7869" y="19.1928"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8898" y="19.3467"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.926" y="19.3817"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0991" y="19.6252"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1371" y="19.6625"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1803" y="19.7289"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2047" y="19.7734"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2638" y="19.871"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.294" y="19.9166"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.3096" y="19.9443"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.4" y="20.0735"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8081" y="20.7014"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8292" y="20.7437"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8834" y="20.8182"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8875" y="20.8195"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1752" y="21.2304"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1917" y="21.238"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.8634" y="22.1968"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9082" y="22.2299"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9629" y="22.3052"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.972" y="22.3132"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9929" y="22.3419"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0264" y="22.389"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0409" y="22.4073"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1207" y="22.4911"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1741" y="22.5356"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2832" y="22.6361"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3273" y="22.6642"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3489" y="22.6824"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.4657" y="22.7829"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.8372" y="23.0947"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.88" y="23.1306"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.9389" y="23.1801"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.963" y="23.2012"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.082" y="23.2994"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2308" y="23.3544"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3185" y="23.3869"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3705" y="23.4079"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4312" y="23.4311"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.6045" y="23.433"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7593" y="23.4461"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7905" y="23.4406"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.4711" y="23.4287"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5241" y="23.4486"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5933" y="23.4499"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.671" y="23.4439"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7171" y="23.4296"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.8759" y="23.4099"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.0738" y="23.3662"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.1196" y="23.339"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.7166" y="23.1791"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.9855" y="22.8413"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.2725" y="22.9729"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.5928" y="22.991"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.6882" y="22.9889"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.735" y="23.0401"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.7422" y="22.8424"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.7537" y="22.8388"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.0575" y="21.1885"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.0823" y="21.1885"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.1723" y="21.1885"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.206" y="21.1796"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.3645" y="21.1822"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.3665" y="21.1811"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.6838" y="21.1858"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.8053" y="21.1868"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.8138" y="21.1841"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.9219" y="21.1822"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.9446" y="21.1766"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.2478" y="21.0956"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.253" y="21.0931"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.3783" y="21.0611"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.3897" y="21.0571"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.5186" y="21.0235"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.632" y="20.9917"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.6537" y="20.9866"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.6942" y="20.7081"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.7142" y="20.6961"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.1124" y="20.4666"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.2925" y="19.786"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.3134" y="19.7686"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.3317" y="19.7502"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.4048" y="19.6777"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.4109" y="19.6696"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.2041" y="18.8617"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.8857" y="20.0976"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.8673" y="20.139"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.7603" y="20.4664"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.6954" y="20.5979"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.6193" y="20.8249"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.5858" y="20.9058"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.5438" y="20.9563"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.4696" y="21.0798"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.4401" y="21.1143"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.3394" y="21.1707"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.2087" y="21.2388"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.069" y="21.2484"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.014" y="21.281"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.965" y="21.2891"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.9155" y="21.3"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.9104" y="21.3024"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.8526" y="21.3159"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.7904" y="21.3416"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.0752" y="21.5341"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.8455" y="21.516"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.4233" y="21.5216"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.2073" y="21.5667"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.1524" y="21.5899"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.1281" y="21.5949"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.1102" y="21.5984"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.0811" y="21.6041"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.0185" y="21.6035"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.5868" y="21.6587"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.5576" y="21.6547"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.5374" y="21.6577"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.4846" y="21.6332"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.0058" y="21.7281"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.926" y="21.7899"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.7797" y="21.8232"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.6298" y="21.8917"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.5716" y="21.9322"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.5183" y="21.9608"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.0579" y="22.2917"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.976" y="22.4333"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.5136" y="22.7491"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.2891" y="23.0327"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.2599" y="23.0446"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.2053" y="23.0741"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.0237" y="23.1983"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.8952" y="23.2752"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.8719" y="23.2922"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.8035" y="23.3183"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.7437" y="23.3243"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.5169" y="23.4387"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.3417" y="23.4686"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.2005" y="23.4407"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.0992" y="23.4464"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.6048" y="23.6951"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.5488" y="23.7054"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.5316" y="23.7077"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.3558" y="23.7379"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.2865" y="23.7592"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.7269" y="23.8878"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.3327" y="25.1445"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7412" y="24.9852"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7321" y="24.9847"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6235" y="24.9547"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5774" y="24.9418"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.4204" y="24.8746"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.3778" y="24.8494"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.3755" y="24.8488"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2929" y="24.7995"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.508" y="24.3451"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4927" y="24.3407"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3206" y="24.2367"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.303" y="24.2316"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1986" y="24.1673"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.183" y="24.1579"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.8653" y="23.9739"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.8449" y="23.9642"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.608" y="23.8275"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5896" y="23.8146"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.9165" y="23.4276"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.8464" y="23.3754"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.8303" y="23.3605"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6985" y="23.2275"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6854" y="23.2155"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.5967" y="23.1254"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.4885" y="23.0179"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.3706" y="22.8993"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8125" y="22.3413"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7993" y="22.3283"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.369" y="21.8978"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.7629" y="21.2918"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6838" y="21.1889"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3741" y="20.6524"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3669" y="20.6413"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2947" y="20.5147"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.9651" y="19.9438"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.9558" y="19.9275"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.2171" y="18.6479"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.177" y="18.5493"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.1175" y="18.3243"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.1109" y="18.3094"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.0845" y="18.2033"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.062" y="18.1198"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.0423" y="18.0437"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.8861" y="17.4623"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.8803" y="17.444"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.8331" y="17.264"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.8274" y="17.2461"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.8041" y="17.155"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.7985" y="17.1347"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.7805" y="17.0669"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.7607" y="16.9934"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.5647" y="16.2664"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.5614" y="16.2495"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.5306" y="16.1342"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.5007" y="16.027"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4999" y="16.0205"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4685" y="15.9095"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4684" y="15.9065"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4379" y="15.8011"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4372" y="15.7872"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4202" y="15.726"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4045" y="15.6142"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4042" y="14.17"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4041" y="14.151"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4036" y="14.0935"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4046" y="14.0826"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4044" y="13.969"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4042" y="13.885"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4036" y="13.8015"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4037" y="12.7272"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.4295" y="12.5238"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.6607" y="11.6613"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.6889" y="11.5559"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.703" y="11.5024"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.7162" y="11.4532"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.7913" y="11.173"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.7963" y="11.1544"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.8769" y="10.8523"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.8793" y="10.8456"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.93" y="10.6541"/>
						</SegmentLine>
						<SegmentLine>
							<End x="2.9323" y="10.6479"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.0682" y="10.1306"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.0713" y="10.125"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.1482" y="9.8285"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.2552" y="9.5643"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.4694" y="9.1863"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8551" y="10.0187"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2992" y="10.0211"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.5866" y="10.3599"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.801" y="10.6127"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7535" y="11.0773"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.4628" y="11.4947"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.3023" y="11.7274"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2855" y="11.7527"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.7215" y="11.8091"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6517" y="11.9133"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.465" y="12.1969"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.4477" y="12.2278"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="13.8568" y="23.298"/>
							<SegmentLine>
								<End x="13.8341" y="23.3066"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.6777" y="23.2647"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.6069" y="23.2458"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.4607" y="23.2362"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.3756" y="23.2473"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.3118" y="23.2302"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.2351" y="23.2096"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.0764" y="23.2019"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.998" y="23.2148"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.3028" y="23.3296"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.6077" y="23.4443"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.4743" y="23.4676"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.4237" y="23.4735"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.3999" y="23.4763"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.3528" y="23.4849"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.3296" y="23.4907"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.2437" y="23.5121"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0921" y="23.5129"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.064" y="23.5131"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0081" y="23.5176"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.9804" y="23.5219"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.9434" y="23.5277"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.7985" y="23.5505"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.5475" y="23.7024"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.4602" y="23.8203"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.256" y="24.0959"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.0519" y="24.3715"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.877" y="24.6076"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.6634" y="24.5504"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1156" y="23.0794"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.0362" y="21"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.5652" y="18.4522"/>
							</SegmentLine>
							<SegmentLine>
								<End x="2.804" y="15.6113"/>
							</SegmentLine>
							<SegmentLine>
								<End x="2.804" y="12.6697"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.5444" y="9.9063"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.6952" y="9.951"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.1706" y="10.092"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.646" y="10.233"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.6966" y="10.2481"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.801" y="10.2635"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.8538" y="10.2638"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.983" y="10.2645"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1854" y="10.2656"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.3997" y="10.5183"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.5828" y="10.7341"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7202" y="10.8961"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7704" y="10.9123"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7535" y="11.0773"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.5333" y="11.3934"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.4423" y="11.341"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1363" y="11.4313"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.8637" y="11.5117"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.71" y="11.5571"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.4671" y="11.7661"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.4467" y="11.8099"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.2808" y="11.9261"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.2416" y="12.1484"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.198" y="12.3956"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.1893" y="12.4043"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.1893" y="12.445"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.1873" y="12.4564"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.1391" y="12.5901"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.128" y="12.608"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.0733" y="12.7513"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.066" y="12.793"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.9765" y="13.0411"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.7144" y="13.7683"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.5836" y="13.8598"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.5444" y="14.0822"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.5052" y="14.3045"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.4923" y="14.3777"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.4402" y="14.6731"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.401" y="14.8954"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.4612" y="14.9813"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.3752" y="15.0415"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.336" y="15.2639"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.2968" y="15.4862"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.2839" y="15.5594"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.2318" y="15.8548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.1926" y="16.0771"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.3209" y="16.2602"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.3432" y="16.4342"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.3652" y="16.605"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.2881" y="16.7703"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.3653" y="16.9824"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.5069" y="17.3715"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.5069" y="17.4503"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.552" y="17.4954"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.6731" y="17.8282"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.7503" y="18.0403"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.9153" y="18.1172"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.1161" y="18.4308"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.2381" y="18.6214"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.2365" y="18.6331"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.2934" y="18.7078"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.3601" y="18.812"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.6412" y="19.2988"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.0162" y="19.9483"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1291" y="20.1438"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.249" y="20.1759"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.564" y="20.6099"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.564" y="20.6185"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.5867" y="20.6412"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9115" y="21.0885"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9707" y="21.1856"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9722" y="21.186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1987" y="21.5545"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1987" y="21.6604"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.3424" y="21.8041"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4332" y="21.9857"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4717" y="21.9985"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4929" y="22.033"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5209" y="22.0786"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.7237" y="22.4085"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.7468" y="22.446"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.7638" y="22.4736"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.802" y="22.5259"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.8232" y="22.5504"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.8805" y="22.6168"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.9017" y="22.6413"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.9478" y="22.6868"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.9726" y="22.7076"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.0061" y="22.7357"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1594" y="22.8644"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.4659" y="23.1217"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.7723" y="23.3788"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.8653" y="23.4567"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.9328" y="23.5133"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.0891" y="23.5947"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1742" y="23.6175"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.4075" y="23.6801"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.4929" y="23.7029"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.5052" y="23.7034"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.5464" y="23.7323"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.6695" y="23.7106"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.7566" y="23.6953"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.8756" y="23.6743"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.0454" y="23.6444"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.3091" y="23.6444"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.3552" y="23.5983"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4946" y="23.6959"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.717" y="23.6567"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.9393" y="23.6175"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.1602" y="23.5785"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.6033" y="23.5004"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.8256" y="23.4612"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.9753" y="23.2473"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0188" y="23.1927"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0577" y="23.1439"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.08" y="23.1541"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1705" y="23.1956"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.2535" y="23.2337"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.3713" y="23.2559"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.4957" y="23.343"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.7181" y="23.3038"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.9404" y="23.2646"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.1613" y="23.2256"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.6044" y="23.1475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.8267" y="23.1083"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.9252" y="22.9676"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.0043" y="22.9088"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.0839" y="22.743"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.3203" y="22.2509"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.5566" y="21.7588"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.6954" y="21.4698"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.975" y="21.4698"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.8907" y="21.4698"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.9151" y="21.4698"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.9636" y="21.4634"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.9872" y="21.4571"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.8717" y="21.2201"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.7563" y="20.9831"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.7799" y="20.9767"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.8251" y="20.958"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.8463" y="20.9458"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.6394" y="20.4879"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.4325" y="20.03"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.4537" y="20.0179"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.4925" y="19.9881"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.5098" y="19.9708"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.9258" y="19.5548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.2369" y="19.7627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.399" y="19.7627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.4629" y="19.7627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.6247" y="19.7627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.701" y="19.7627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.7333" y="19.8213"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.7333" y="20.5211"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.6954" y="20.5979"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.6193" y="20.8249"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.6036" y="20.8627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.571" y="20.8627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.4904" y="20.8627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.399" y="20.8627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.2624" y="20.8627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.1445" y="20.9806"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.0454" y="20.9925"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.9517" y="21.031"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.9121" y="21.0473"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.8984" y="21.0507"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.8907" y="21.0517"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.8182" y="21.0686"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.783" y="21.0806"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.6701" y="21.1191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.1353" y="21.2632"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.9987" y="21.264"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.7657" y="21.2652"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.747" y="21.2655"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.4489" y="21.2746"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.4044" y="21.276"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.3164" y="21.2893"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.3029" y="21.293"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.2538" y="21.3015"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.2251" y="21.3065"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.1687" y="21.3208"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.1411" y="21.3302"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.0698" y="21.3544"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.9872" y="21.3598"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.937" y="21.3648"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.6015" y="21.4096"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.5809" y="21.4094"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.5203" y="21.4088"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.508" y="21.4107"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.4843" y="21.4107"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.4004" y="21.4271"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.1728" y="21.4729"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.9332" y="21.5208"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.917" y="21.524"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.6881" y="21.4627"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.2971" y="21.6885"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.2593" y="21.8295"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.0882" y="21.9326"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.0316" y="21.9668"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.9322" y="22.0539"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.8909" y="22.1055"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.7342" y="22.3015"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.5942" y="22.3971"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.362" y="22.5556"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.2902" y="22.6047"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.1729" y="22.7332"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.1307" y="22.8093"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.1203" y="22.8281"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.1084" y="22.8349"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.9279" y="23.07"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.8896" y="23.2132"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.8707" y="23.2841"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.8568" y="23.298"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00008"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="11.51" y="24.2135"/>
						<SegmentLine>
							<End x="11.5812" y="24.2052"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.729" y="24.1794"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.181" y="23.9397"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.2197" y="23.9407"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.2234" y="23.9402"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.2754" y="23.9641"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.7546" y="23.8786"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.8339" y="23.8162"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.9809" y="23.7857"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.146" y="23.7104"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.2038" y="23.6686"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.2572" y="23.6404"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.5357" y="23.4495"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.6513" y="23.3558"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.7031" y="23.313"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.782" y="23.1709"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.2465" y="22.8538"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.4728" y="22.5707"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.7474" y="22.4052"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.8761" y="22.3288"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.8997" y="22.3125"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.9619" y="22.2887"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.0215" y="22.2807"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.2478" y="22.1657"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.4247" y="22.1296"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.5651" y="22.1569"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.5728" y="22.1544"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.6465" y="22.1552"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.0357" y="22.1032"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.183" y="22.0936"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.2478" y="22.0808"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.3808" y="22.0356"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.4658" y="22.0209"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.4716" y="22.0193"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.7697" y="22.0102"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.2357" y="22.0077"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.8885" y="21.8318"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.0236" y="21.7857"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.0513" y="21.7821"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.0624" y="21.7779"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.0858" y="21.7743"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.1086" y="21.772"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.2349" y="21.7201"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.2988" y="21.7298"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.3071" y="21.7291"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.6175" y="21.5863"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.8266" y="21.4314"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.8896" y="21.351"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.916" y="21.2901"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.0058" y="21.1771"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.0867" y="21.0027"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.1772" y="20.7319"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.2129" y="20.679"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.3316" y="19.9532"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.3372" y="19.8829"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.2492" y="18.8299"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.6229" y="18.4518"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.6353" y="18.4306"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.9329" y="17.9153"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.545" y="16.8508"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.5512" y="16.8279"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.5999" y="16.6438"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.6199" y="16.57"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.6386" y="16.5014"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.6405" y="16.487"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.8023" y="15.8747"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.8088" y="15.8635"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.8451" y="15.7194"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.8547" y="15.6922"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.0224" y="15.0632"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.0223" y="15.0393"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.0221" y="15.0003"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.0221" y="14.7812"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.0208" y="13.956"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.0224" y="13.9442"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.0114" y="13.257"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.0043" y="13.2329"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.987" y="13.1737"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.3974" y="13.2778"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4699" y="13.5615"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4393" y="13.9892"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.452" y="14.0577"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4195" y="14.1982"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.3834" y="14.6515"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.3713" y="14.8416"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.3776" y="14.9035"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.3789" y="15.0429"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4037" y="15.6831"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4106" y="15.7547"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4105" y="15.7934"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4128" y="15.93"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4108" y="15.9987"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4194" y="16.0046"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.3229" y="16.1643"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.3638" y="16.1941"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.2463" y="16.4921"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.3157" y="16.5472"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.2986" y="16.669"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4099" y="17.041"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.8661" y="17.5135"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.6742" y="18.1723"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.6375" y="18.2351"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.5741" y="18.4661"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.5349" y="18.6655"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.5383" y="18.7339"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.5135" y="18.8661"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.5169" y="18.9388"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.4455" y="19.5086"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.4485" y="19.5803"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.4306" y="19.6574"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.3802" y="19.8841"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.3706" y="19.9304"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.3535" y="20.0033"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.2352" y="20.7234"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.4534" y="22.029"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.2819" y="22.2009"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.1641" y="22.3169"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.1503" y="22.3306"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.0422" y="22.4375"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.04" y="22.4406"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.8123" y="22.6666"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.7121" y="22.7672"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.4624" y="23.0165"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.4037" y="23.0751"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.0894" y="22.2252"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.0655" y="22.2395"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.0499" y="22.2454"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.7872" y="22.4079"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.7057" y="22.3977"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.5587" y="22.4168"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.5077" y="22.4464"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.3062" y="22.5183"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.2635" y="22.535"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.1238" y="22.5858"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.6425" y="22.761"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.5849" y="22.782"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.5147" y="22.8065"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.3832" y="22.8581"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.3268" y="22.8749"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.1496" y="22.909"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.9261" y="22.9094"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.8701" y="22.9427"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.8432" y="22.9596"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.7124" y="22.9135"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.7082" y="22.9159"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.4402" y="22.9186"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.4241" y="22.9251"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.4061" y="22.9288"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.3674" y="22.9455"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.3583" y="22.9462"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.3238" y="22.9623"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.1858" y="22.9733"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.7564" y="23.0669"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.7471" y="23.0677"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.702" y="23.088"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.3482" y="23.1705"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.0979" y="23.4191"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.0194" y="23.4362"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.9901" y="23.4705"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.9042" y="23.4917"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.7321" y="23.4767"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.7119" y="23.4873"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.5873" y="23.5551"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.2292" y="23.7792"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.1756" y="23.8084"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.1033" y="23.8549"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.9831" y="23.9437"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.713" y="24.1776"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.6841" y="24.2046"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.6734" y="25.7127"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.5537" y="25.7119"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.5494" y="25.7127"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.2713" y="25.7111"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.1385" y="25.711"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.1306" y="25.7117"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.9921" y="25.7113"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.9727" y="25.7112"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.5299" y="25.7112"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.3581" y="25.6874"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.6734" y="25.5029"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.6618" y="25.5024"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.4959" y="25.4554"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.48" y="25.4554"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.0139" y="25.3269"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.9959" y="25.3223"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.3834" y="25.1755"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.0629" y="24.2581"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.3369" y="24.2567"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.51" y="24.2135"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="16.0792" y="22.2514"/>
							<SegmentLine>
								<End x="16.5585" y="22.1556"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.5651" y="22.1569"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.5728" y="22.1544"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.6465" y="22.1552"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.0357" y="22.1032"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.183" y="22.0936"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.2478" y="22.0808"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.3808" y="22.0356"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.4658" y="22.0209"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.4716" y="22.0193"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.7697" y="22.0102"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.2357" y="22.0077"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.8885" y="21.8318"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.0236" y="21.7857"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.0513" y="21.7821"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.0624" y="21.7779"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.0858" y="21.7743"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.1086" y="21.772"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.2349" y="21.7201"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.2988" y="21.7298"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.3071" y="21.7291"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.571" y="21.6077"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.7076" y="21.6077"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.9333" y="21.6077"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.159" y="21.6077"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.4783" y="21.2884"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.4783" y="19.337"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.159" y="19.0177"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.9333" y="19.0177"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.7076" y="19.0177"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.4629" y="19.0177"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.8048" y="18.6758"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.822" y="18.6585"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.8518" y="18.6197"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.864" y="18.5985"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.3219" y="17.8054"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.7798" y="17.0123"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.7921" y="16.9911"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.8108" y="16.9459"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.8171" y="16.9223"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.0541" y="16.0378"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2911" y="15.1532"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2974" y="15.1296"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3038" y="15.0811"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3038" y="15.0567"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3038" y="14.141"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3038" y="13.4426"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.5632" y="13.3731"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.6482" y="13.2881"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.7567" y="13.2881"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.031" y="13.2881"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.2567" y="13.2881"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.3653" y="13.2881"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.3653" y="14.8052"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.2525" y="14.9181"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.1389" y="15.2081"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.145" y="15.3637"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.1565" y="15.6594"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.1584" y="15.6919"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.1009" y="15.7436"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.0822" y="15.9677"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.9698" y="16.1269"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.9922" y="16.6358"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.0552" y="16.7102"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.0639" y="16.7392"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.1025" y="16.8682"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.1299" y="16.9598"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.9774" y="17.0923"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.7055" y="17.3285"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.5969" y="17.4229"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.4656" y="17.6789"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.4523" y="17.8221"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.4257" y="18.1093"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.4067" y="18.1497"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3817" y="18.2208"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3728" y="18.2574"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3342" y="18.4169"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3121" y="18.5044"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.302" y="18.5444"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2908" y="18.6261"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2897" y="18.6673"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2886" y="18.7116"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2817" y="18.7375"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2693" y="18.8241"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2682" y="18.8679"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2657" y="18.9671"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2381" y="19.1844"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2058" y="19.439"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2034" y="19.458"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2005" y="19.4963"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.2001" y="19.5155"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.1989" y="19.5688"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.1833" y="19.6366"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.1444" y="19.816"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.138" y="19.8434"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.1133" y="19.9514"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.0576" y="20.1372"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.9946" y="20.3472"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.9513" y="20.4916"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.9838" y="20.7913"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.057" y="20.9231"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3508" y="21.4517"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.6445" y="21.9802"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.7478" y="22.1662"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.4611" y="22.4529"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3435" y="22.3276"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.1571" y="22.2691"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.7977" y="22.1563"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.4383" y="22.0436"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.3053" y="22.0018"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.027" y="22.0202"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.9006" y="22.0791"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.7504" y="22.1491"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.6815" y="22.1813"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.6755" y="22.1858"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.6686" y="22.1873"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.5946" y="22.2218"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.3482" y="22.3367"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.0868" y="22.3367"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.9635" y="22.3815"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.7317" y="22.4657"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.5923" y="22.5163"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.4104" y="22.6829"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.228" y="22.7493"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.9931" y="22.8348"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.7453" y="22.9251"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.7124" y="22.9135"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.7082" y="22.9159"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.6108" y="22.9169"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.2365" y="22.7109"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.9631" y="22.7708"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.7336" y="22.8211"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.6824" y="22.828"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.6209" y="22.8475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.5802" y="22.8604"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.5282" y="22.8702"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.4096" y="22.9141"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.3549" y="22.9457"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.1717" y="23.0515"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.0146" y="23.1066"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.9559" y="23.1856"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.9035" y="23.2094"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.7157" y="23.2318"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.592" y="23.2465"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.3677" y="23.3548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.2792" y="23.4425"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.2678" y="23.4538"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.1622" y="23.4255"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.7712" y="23.6513"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.7376" y="23.7765"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.7125" y="23.7944"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.6138" y="23.8646"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.4712" y="24.0603"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.4345" y="24.1757"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.2898" y="24.6309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.1452" y="25.086"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.0735" y="25.3116"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.5043" y="25.3116"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.6505" y="24.8149"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0588" y="24.2637"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0958" y="24.2579"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.3369" y="24.2567"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.51" y="24.2135"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.5812" y="24.2052"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.729" y="24.1794"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.1193" y="23.9499"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.1709" y="23.9637"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.3259" y="24.0053"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.485" y="23.9844"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.863" y="24.0856"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.081" y="24.144"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.472" y="23.9182"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.5304" y="23.7002"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.6092" y="23.4059"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.6842" y="23.3626"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.6959" y="23.319"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.7031" y="23.313"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.782" y="23.1709"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.2465" y="22.8538"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.4728" y="22.5707"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.7474" y="22.4052"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.8761" y="22.3288"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.8997" y="22.3125"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.9619" y="22.2887"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.0215" y="22.2807"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.0792" y="22.2514"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00007"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="17.7857" y="23.4562"/>
						<SegmentLine>
							<End x="17.8441" y="23.4421"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.976" y="23.407"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.07" y="23.4026"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.4978" y="23.3448"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.6294" y="23.2932"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.6858" y="23.2763"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.7142" y="23.2649"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.8539" y="23.214"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.3352" y="23.039"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.3928" y="23.018"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.4778" y="22.988"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.5028" y="22.9785"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.53" y="22.9682"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.5485" y="22.9606"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.6183" y="22.934"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.7486" y="22.8792"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.8113" y="22.8864"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.9985" y="22.861"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.1014" y="22.7427"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.1085" y="22.7376"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.1192" y="22.7243"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.3861" y="23.1217"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.1152" y="23.3782"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.9871" y="23.4703"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.2382" y="23.8905"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.2188" y="23.8963"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.1581" y="23.9321"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.1452" y="23.9388"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.0539" y="23.9914"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.0334" y="24.0032"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.7843" y="24.1471"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.7682" y="24.1566"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.3103" y="24.4219"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.2986" y="24.4274"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.1395" y="24.5204"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.1257" y="24.5275"/>
						</SegmentLine>
						<SegmentLine>
							<End x="19.001" y="24.5993"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.9905" y="24.6064"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.5226" y="24.8804"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.39" y="24.938"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.2308" y="24.9836"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.2035" y="24.9862"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.9884" y="25.3117"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.9702" y="25.3167"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.6026" y="25.4152"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.5916" y="25.4187"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.483" y="25.4472"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.2843" y="25.5005"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.0955" y="25.5531"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.0674" y="25.56"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.5829" y="25.6901"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.4324" y="25.7114"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.7245" y="25.7227"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.1469" y="24.3938"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.1681" y="24.3845"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.3236" y="24.31"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.3736" y="24.2756"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.4017" y="24.2544"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.5299" y="24.1786"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.7452" y="24.0296"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.8037" y="23.9716"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.1424" y="23.9313"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.2978" y="23.8647"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.3098" y="23.8432"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.4391" y="23.7846"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.5584" y="23.6241"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.5663" y="23.6211"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.7622" y="23.5843"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.8461" y="23.5577"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.8513" y="23.5579"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.316" y="23.4561"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.3879" y="23.4581"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.458" y="23.4362"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.4627" y="23.4363"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.5418" y="23.4101"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.5509" y="23.4088"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.5841" y="23.3974"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.7172" y="23.4159"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.7262" y="23.4134"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.7857" y="23.4562"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="15.1681" y="24.3845"/>
							<SegmentLine>
								<End x="15.3236" y="24.31"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.3736" y="24.2756"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.4017" y="24.2544"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.5299" y="24.1786"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.7452" y="24.0296"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.8037" y="23.9716"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.1424" y="23.9313"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.2978" y="23.8647"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.3098" y="23.8432"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.4391" y="23.7846"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.4766" y="23.7341"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.4785" y="23.7346"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.7275" y="23.5908"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.7622" y="23.5843"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.8461" y="23.5577"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.8513" y="23.5579"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.1225" y="23.4985"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.1567" y="23.5925"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.5659" y="23.7832"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.778" y="23.706"/>
							</SegmentLine>
							<SegmentLine>
								<End x="17.9902" y="23.6288"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.2479" y="23.5349"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.7177" y="23.3639"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.9298" y="23.2867"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.9861" y="23.1659"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.2179" y="23.0817"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.3839" y="23.1421"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.5885" y="23.0467"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.9095" y="22.897"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.9733" y="22.897"/>
							</SegmentLine>
							<SegmentLine>
								<End x="19.9919" y="22.8784"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.0183" y="22.8769"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.0651" y="22.8244"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.2153" y="22.7544"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.9341" y="22.9799"/>
							</SegmentLine>
							<SegmentLine>
								<End x="20.8346" y="23.0794"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.2868" y="24.5504"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.4459" y="25.3116"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.8552" y="25.3116"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.1445" y="24.4013"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.1681" y="24.3845"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00010"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="23.6402" y="14.0052"/>
						<SegmentLine>
							<End x="23.7689" y="14.7686"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5456" y="15.0929"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5456" y="15.53"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5496" y="15.5509"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5102" y="15.8244"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.1636" y="17.0977"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.1586" y="17.1165"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.9635" y="17.886"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.9591" y="17.8894"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.2997" y="17.1265"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9028" y="16.944"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.7776" y="16.5256"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.8045" y="16.4421"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.7253" y="16.3486"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.8622" y="16.1547"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.8188" y="16.1002"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9193" y="16.0099"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9108" y="15.9987"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9088" y="15.8674"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9108" y="15.7987"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9104" y="15.7683"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9009" y="15.6304"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.876" y="14.9891"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.8773" y="14.9185"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.8692" y="14.7955"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.881" y="14.7005"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9195" y="14.2078"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.944" y="14.1462"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9393" y="13.9908"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.8139" y="13.1986"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.6092" y="12.8249"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.9928" y="13.1076"/>
						</SegmentLine>
						<SegmentLine>
							<End x="20.7261" y="12.1152"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.7687" y="11.6885"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.7884" y="11.6993"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.7981" y="11.7009"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.8815" y="11.7228"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.9413" y="11.7646"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.0153" y="11.7594"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.0785" y="11.7487"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.2533" y="11.8117"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.3427" y="11.7995"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.4796" y="11.8494"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.5093" y="12.1866"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.5166" y="12.3285"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.519" y="12.3488"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.5442" y="12.4351"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.5689" y="12.9854"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.5672" y="13.0453"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.5768" y="13.1918"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.5751" y="13.2483"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.6326" y="13.9269"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.6391" y="13.986"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="22.8827" y="11.7597"/>
							<SegmentLine>
								<End x="22.9519" y="11.7874"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.0165" y="11.7597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.109" y="11.7597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.2294" y="11.8031"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.2358" y="11.8752"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.2489" y="12.0232"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.2541" y="12.0819"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.2555" y="12.0982"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.2583" y="12.1303"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.2523" y="12.1804"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.2576" y="12.3025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.2701" y="12.3623"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3021" y="12.5151"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3199" y="12.9407"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3215" y="13.0795"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3218" y="13.0976"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3239" y="13.1337"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3259" y="13.1517"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3283" y="13.174"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3297" y="13.2955"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3311" y="13.324"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3574" y="13.6207"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3824" y="13.9031"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3915" y="13.9962"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3888" y="14.025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3857" y="14.057"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3851" y="14.1212"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3876" y="14.1532"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.4127" y="14.4771"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.4203" y="14.5754"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.4203" y="14.8881"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.4203" y="15.1138"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.7396" y="15.4331"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.9653" y="15.4331"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.5995" y="15.4331"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.8429" y="15.5416"/>
							</SegmentLine>
							<SegmentLine>
								<End x="25.0158" y="15.6186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="25.1462" y="15.6084"/>
							</SegmentLine>
							<SegmentLine>
								<End x="25.1462" y="15.6113"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.7343" y="17.1488"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.6867" y="17.1393"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.3226" y="16.8673"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.0491" y="16.7415"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.8496" y="16.6498"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.8162" y="16.6546"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.7776" y="16.5256"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.8045" y="16.4421"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.7253" y="16.3486"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.8622" y="16.1547"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.8188" y="16.1002"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.9193" y="16.0099"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.9108" y="15.9987"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.9088" y="15.8674"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.9108" y="15.7987"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.9104" y="15.7683"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.9009" y="15.6304"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.8894" y="15.3347"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.1103" y="15.1138"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.1103" y="12.8624"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.791" y="12.5431"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.5653" y="12.5431"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.3396" y="12.5431"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.0653" y="12.5431"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.5653" y="12.5431"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.3396" y="12.5431"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.1776" y="12.7051"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.004" y="12.0572"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.4279" y="11.7597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.4913" y="11.7597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.8827" y="11.7597"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00009"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="24.139" y="13.9873"/>
						<SegmentLine>
							<End x="24.1245" y="13.8374"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.0745" y="13.2725"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.0728" y="13.129"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.0665" y="13.0711"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.0648" y="12.9209"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.044" y="12.4231"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.9992" y="12.2094"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.0073" y="12.1426"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.9779" y="11.8095"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.1158" y="11.7337"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.1881" y="11.7487"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.2634" y="11.7609"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.3253" y="11.7646"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.2202" y="11.3812"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.3058" y="11.7207"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.3087" y="11.7268"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.4278" y="12.1719"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.4292" y="12.183"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5254" y="12.5404"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5456" y="12.6893"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5458" y="12.9776"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5458" y="13.1933"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5462" y="13.8351"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.546" y="14.1105"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5461" y="14.1296"/>
						</SegmentLine>
						<SegmentLine>
							<End x="25.5632" y="15.047"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.1018" y="14.3955"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.14" y="13.9948"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="23.991" y="11.9575"/>
							<SegmentLine>
								<End x="23.9779" y="11.8095"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.0685" y="11.7597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.256" y="11.7597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.2634" y="11.7609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.3253" y="11.7646"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.3367" y="11.7597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.7753" y="11.7597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.9023" y="11.7597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="25.1462" y="12.6699"/>
							</SegmentLine>
							<SegmentLine>
								<End x="25.1462" y="14.8611"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.1555" y="14.4195"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.1304" y="14.0956"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.14" y="13.9948"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.1245" y="13.8374"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.0745" y="13.2725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.0728" y="13.129"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.0665" y="13.0711"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.0648" y="12.9209"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.044" y="12.4231"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.9992" y="12.2094"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.0073" y="12.1426"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.9976" y="12.0327"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.9976" y="11.9673"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.991" y="11.9575"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00014"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="11.0737" y="6.3937"/>
						<SegmentLine>
							<End x="10.8452" y="6.4277"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.8227" y="6.4362"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.7566" y="6.4539"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.081" y="6.6773"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.9772" y="6.7162"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.9664" y="6.7222"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.8964" y="6.7499"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7277" y="6.7793"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5925" y="6.8215"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.4559" y="6.8706"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.423" y="6.8834"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.3561" y="6.9004"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.3236" y="6.904"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.1484" y="6.9241"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.0562" y="7.1911"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.0231" y="7.1928"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.0205" y="7.196"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.9463" y="7.2003"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.8941" y="7.2657"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.858" y="7.2674"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4876" y="7.3863"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4768" y="7.3979"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2446" y="7.596"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1738" y="7.6664"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.994" y="7.889"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.636" y="8.3731"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5743" y="8.4879"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5553" y="8.5047"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5086" y="8.6265"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.246" y="9.0145"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2412" y="9.0187"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1925" y="9.1445"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1814" y="9.4878"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1714" y="9.4963"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1205" y="9.5555"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.8839" y="10.0391"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.8693" y="10.0734"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1509" y="10.2521"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9679" y="10.0364"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7099" y="9.7322"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0104" y="9.0878"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.982" y="8.971"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9708" y="8.9241"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0556" y="8.896"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0887" y="8.8485"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1423" y="8.7288"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1732" y="8.6672"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.179" y="8.653"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2235" y="8.5223"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.2563" y="8.4582"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.4155" y="8.059"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.4614" y="7.9271"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.4831" y="7.885"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.5115" y="7.821"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.5599" y="7.77"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.627" y="7.647"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0649" y="6.9965"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0713" y="6.9848"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.0978" y="6.9572"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1141" y="6.936"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1542" y="6.8878"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3182" y="6.5472"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3435" y="6.5325"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.4925" y="6.427"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.5291" y="6.3764"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6331" y="6.3215"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6559" y="6.3206"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0229" y="6.2604"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0435" y="6.2473"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.113" y="6.2622"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1622" y="6.2486"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2216" y="6.255"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2475" y="6.2555"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.265" y="6.2556"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4209" y="6.2561"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.4751" y="6.2599"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5352" y="6.2613"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7043" y="6.2595"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7211" y="6.2509"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.8975" y="6.241"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.9042" y="6.2325"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.0504" y="6.1915"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.1122" y="6.1941"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2613" y="6.1762"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.4045" y="6.1304"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.9099" y="5.8996"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.9524" y="5.7066"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.9969" y="5.687"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.9986" y="5.684"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.3519" y="5.4213"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.3621" y="5.4169"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.3666" y="5.4097"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.6748" y="5.1514"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.9553" y="4.7506"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.0272" y="4.639"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.1175" y="4.5194"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.4023" y="4.3905"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.8309" y="4.3908"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.9114" y="4.3808"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.993" y="4.3877"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.4449" y="4.4688"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.8996" y="5.1736"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.2579" y="5.7344"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.174" y="5.7245"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.1568" y="5.7248"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.1384" y="5.728"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.065" y="5.8304"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.981" y="5.8439"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.4267" y="6.2353"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.3454" y="6.3427"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.0756" y="6.3931"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="7.4877" y="6.5168"/>
							<SegmentLine>
								<End x="7.7375" y="6.3072"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.8298" y="6.2921"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.0852" y="6.2973"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.5137" y="6.306"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.5485" y="6.3066"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.6176" y="6.3078"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.6604" y="6.3012"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.8377" y="6.5125"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.2875" y="6.5519"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4604" y="6.4068"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.6333" y="6.2617"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.8052" y="6.1175"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.1499" y="5.8283"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.3228" y="5.6832"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.3453" y="5.4262"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.3519" y="5.4213"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.3621" y="5.4169"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.3666" y="5.4097"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.6748" y="5.1514"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.9553" y="4.7506"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0272" y="4.639"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.1175" y="4.5194"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.4023" y="4.3905"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.8309" y="4.3908"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.9114" y="4.3808"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.993" y="4.3877"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.4449" y="4.4688"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.8996" y="5.1736"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.2579" y="5.7344"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.174" y="5.7245"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.1568" y="5.7248"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.1384" y="5.728"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.065" y="5.8304"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.981" y="5.8439"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.4267" y="6.2353"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.3454" y="6.3427"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.0737" y="6.3937"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.8452" y="6.4277"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.8227" y="6.4362"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.7566" y="6.4539"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.2114" y="6.6342"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.1356" y="6.5439"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.6858" y="6.5045"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.5129" y="6.6496"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.1916" y="6.9191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.1484" y="6.9241"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.1332" y="6.9681"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.9963" y="7.083"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.8234" y="7.2281"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.7261" y="7.3097"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.4876" y="7.3863"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.4768" y="7.3979"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.2446" y="7.596"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1738" y="7.6664"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.994" y="7.889"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.636" y="8.3731"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.5743" y="8.4879"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.5553" y="8.5047"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.5086" y="8.6265"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.246" y="9.0145"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.2412" y="9.0187"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1925" y="9.1445"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1814" y="9.4878"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1714" y="9.4963"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1205" y="9.5555"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.8839" y="10.0391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.8693" y="10.0734"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1509" y="10.2521"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9679" y="10.0364"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7099" y="9.7322"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0104" y="9.0878"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.982" y="8.971"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9708" y="8.9241"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0556" y="8.896"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.0887" y="8.8485"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1423" y="8.7288"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.1732" y="8.6672"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.179" y="8.653"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.2235" y="8.5223"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.2563" y="8.4582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4155" y="8.059"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4614" y="7.9271"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4831" y="7.885"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5115" y="7.821"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.5599" y="7.77"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.627" y="7.647"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.0649" y="6.9965"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.0713" y="6.9848"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.0978" y="6.9572"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1141" y="6.936"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1542" y="6.8878"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.2279" y="6.7348"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.4877" y="6.5168"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00011"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="22.0597" y="18.5855"/>
						<SegmentLine>
							<End x="22.0969" y="18.4326"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.1554" y="18.3082"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.1941" y="17.8909"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.7379" y="17.4184"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.0909" y="17.5807"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.9405" y="17.9495"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.7909" y="18.4873"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.6799" y="18.749"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.3055" y="19.3887"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.2996" y="19.4028"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.2616" y="19.4672"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.2598" y="19.474"/>
						</SegmentLine>
						<SegmentLine>
							<End x="24.0005" y="19.9214"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.9907" y="19.938"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.9371" y="20.0292"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.935" y="20.037"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.7558" y="20.3413"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.7523" y="20.3501"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.5786" y="20.648"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.5749" y="20.6576"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.2827" y="21.1646"/>
						</SegmentLine>
						<SegmentLine>
							<End x="23.1849" y="21.2947"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.5058" y="21.9964"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.7082" y="20.5612"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.8342" y="20.1411"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.8643" y="20.0094"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.8702" y="19.9839"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.9113" y="19.795"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.9419" y="19.6612"/>
						</SegmentLine>
						<SegmentLine>
							<End x="21.9449" y="19.5329"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.0096" y="19.0236"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.013" y="18.8863"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.0311" y="18.8181"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.0345" y="18.6865"/>
						</SegmentLine>
						<SegmentLine>
							<End x="22.0583" y="18.5921"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="24.541" y="17.8699"/>
							<SegmentLine>
								<End x="24.385" y="18.4522"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.914" y="21"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.2957" y="21.6183"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.7082" y="20.5612"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.8342" y="20.1411"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.8643" y="20.0094"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.8702" y="19.9839"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.9113" y="19.795"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.9419" y="19.6612"/>
							</SegmentLine>
							<SegmentLine>
								<End x="21.9449" y="19.5329"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.0096" y="19.0236"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.013" y="18.8863"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.0311" y="18.8181"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.0345" y="18.6865"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.0583" y="18.5921"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.0969" y="18.4326"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.1554" y="18.3082"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.1941" y="17.8909"/>
							</SegmentLine>
							<SegmentLine>
								<End x="22.7379" y="17.4184"/>
							</SegmentLine>
							<SegmentLine>
								<End x="23.0909" y="17.5807"/>
							</SegmentLine>
							<SegmentLine>
								<End x="24.541" y="17.8699"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" lineWidth="0.4" minSquare="0" deleteUnconnected="on" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="NET00013"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="5.4967" y="8.7652"/>
						<SegmentLine>
							<End x="5.5137" y="8.7959"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.5572" y="8.8764"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.2566" y="9.5209"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8578" y="9.5188"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.4893" y="9.1129"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.9502" y="8.3569"/>
						</SegmentLine>
						<SegmentLine>
							<End x="3.96" y="8.3406"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2686" y="7.8026"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2773" y="7.7943"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2845" y="7.7817"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.2937" y="7.7679"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.3612" y="7.65"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.6878" y="7.0853"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.7656" y="6.9855"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8676" y="6.8845"/>
						</SegmentLine>
						<SegmentLine>
							<End x="4.8753" y="6.8736"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.0985" y="6.6536"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.1083" y="6.6431"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7795" y="5.9728"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7926" y="5.9597"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9328" y="5.8192"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9436" y="5.8076"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0198" y="5.7326"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0661" y="5.6863"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1092" y="5.6432"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6735" y="5.0777"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6844" y="5.0677"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.7912" y="4.9611"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.8321" y="4.9201"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.919" y="4.8535"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.1179" y="4.7375"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.13" y="4.7319"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3901" y="4.5782"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3959" y="4.5767"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0063" y="4.2232"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0276" y="4.2135"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1685" y="4.1324"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.1851" y="4.1229"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2435" y="4.0888"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2617" y="4.0761"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5496" y="3.9124"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5573" y="3.907"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5843" y="3.8918"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5873" y="3.8893"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.4746" y="3.377"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5778" y="3.3366"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.0507" y="3.2126"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.0696" y="3.2"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.2128" y="3.1687"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.2272" y="3.159"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.4828" y="3.0963"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.5172" y="3.0833"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.7052" y="3.0348"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.7281" y="3.0318"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.952" y="2.9715"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.9683" y="2.9666"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.2135" y="2.6315"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.2307" y="2.6292"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.3461" y="2.5979"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.3978" y="2.5835"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.4935" y="2.5699"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.5541" y="2.57"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.6646" y="2.5691"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.9436" y="2.5694"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.9627" y="2.5693"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.0666" y="2.5686"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.0751" y="2.5698"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.0982" y="2.5699"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.1221" y="2.5699"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.3959" y="2.5696"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.5907" y="2.5947"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.9267" y="2.9483"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.9457" y="2.9532"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.1584" y="3.0094"/>
						</SegmentLine>
						<SegmentLine>
							<End x="17.1625" y="3.0124"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.1716" y="3.272"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.6281" y="3.456"/>
						</SegmentLine>
						<SegmentLine>
							<End x="18.9556" y="3.6413"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.2322" y="5.9573"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.2166" y="5.9461"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.2003" y="5.9371"/>
						</SegmentLine>
						<SegmentLine>
							<End x="16.107" y="5.9008"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.5003" y="5.7004"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.4927" y="5.6988"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.4766" y="5.6981"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.3824" y="5.7097"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.3081" y="5.6107"/>
						</SegmentLine>
						<SegmentLine>
							<End x="15.0663" y="5.5024"/>
						</SegmentLine>
						<SegmentLine>
							<End x="14.573" y="5.1639"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.4955" y="5.0063"/>
						</SegmentLine>
						<SegmentLine>
							<End x="13.3754" y="4.9887"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.8651" y="4.1977"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.2535" y="3.9608"/>
						</SegmentLine>
						<SegmentLine>
							<End x="12.1248" y="3.9286"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.9953" y="3.9186"/>
						</SegmentLine>
						<SegmentLine>
							<End x="11.236" y="3.9189"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.7577" y="4.1722"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.6012" y="4.3772"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.561" y="4.4432"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.2641" y="4.8662"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.0726" y="5.0052"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.0635" y="5.0159"/>
						</SegmentLine>
						<SegmentLine>
							<End x="10.057" y="5.0176"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.7026" y="5.2811"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6985" y="5.2857"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.6727" y="5.2921"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.5063" y="5.6044"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2572" y="5.6525"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.2034" y="5.6796"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.1439" y="5.6952"/>
						</SegmentLine>
						<SegmentLine>
							<End x="9.1187" y="5.6961"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7517" y="5.7563"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.7311" y="5.7694"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.6616" y="5.7545"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.6124" y="5.7681"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.553" y="5.7617"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5271" y="5.7612"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.5095" y="5.7611"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.3536" y="5.7606"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2995" y="5.7568"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.2394" y="5.7554"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0703" y="5.7572"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8.0535" y="5.7658"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.8771" y="5.7757"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.8704" y="5.7842"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.7242" y="5.8252"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.6685" y="5.8227"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.3941" y="5.8949"/>
						</SegmentLine>
						<SegmentLine>
							<End x="7.2698" y="5.9793"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.8938" y="6.3142"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.8529" y="6.3644"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.8139" y="6.5214"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.7169" y="6.6323"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.7101" y="6.6414"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6534" y="6.7103"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.6512" y="6.7157"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1985" y="7.3893"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.1722" y="7.4544"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0835" y="7.5626"/>
						</SegmentLine>
						<SegmentLine>
							<End x="6.0231" y="7.6889"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.985" y="7.7751"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.9648" y="7.8426"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.8002" y="8.2533"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.7443" y="8.3796"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.72" y="8.4559"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.6664" y="8.5756"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.6355" y="8.6372"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.5976" y="8.6953"/>
						</SegmentLine>
						<SegmentLine>
							<End x="5.4967" y="8.7652"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="9.0755" y="5.6614"/>
							<SegmentLine>
								<End x="8.7399" y="5.5351"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.567" y="5.5618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.5265" y="5.5612"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.3146" y="5.5568"/>
							</SegmentLine>
							<SegmentLine>
								<End x="8.1004" y="5.5525"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.9753" y="5.55"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.9369" y="5.5042"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.4871" y="5.4648"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.3142" y="5.6099"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.7976" y="6.0433"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.6247" y="6.1884"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4518" y="6.3335"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.4277" y="6.609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.2279" y="6.9058"/>
							</SegmentLine>
							<SegmentLine>
								<End x="6.009" y="7.231"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9993" y="7.2454"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9813" y="7.275"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.973" y="7.2902"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9525" y="7.3278"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.9272" y="7.3544"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.8564" y="7.4605"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.8305" y="7.5188"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.8105" y="7.5639"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7992" y="7.5858"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7871" y="7.6091"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7664" y="7.6574"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7578" y="7.6822"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.7174" y="7.7983"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.5772" y="8.1499"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.5603" y="8.1829"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.548" y="8.2069"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.527" y="8.2567"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.5156" y="8.2902"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.4612" y="8.3082"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1788" y="8.815"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.2251" y="9.0089"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.1849" y="9.0951"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.0347" y="9.4173"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.987" y="9.5195"/>
							</SegmentLine>
							<SegmentLine>
								<End x="4.8578" y="9.5188"/>
							</SegmentLine>
							<SegmentLine>
								<End x="3.907" y="9.2368"/>
							</SegmentLine>
							<SegmentLine>
								<End x="5.0362" y="7.281"/>
							</SegmentLine>
							<SegmentLine>
								<End x="7.1156" y="5.2016"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.6634" y="3.7306"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.3541" y="3.5455"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.2731" y="3.6265"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.2731" y="3.8522"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.2731" y="4.426"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.1206" y="4.6438"/>
							</SegmentLine>
							<SegmentLine>
								<End x="10.0422" y="4.7096"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.9012" y="4.828"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.7729" y="4.9232"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.617" y="5.2021"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.6075" y="5.3109"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.4987" y="5.4021"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.3264" y="5.5467"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.2179" y="5.6378"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.1898" y="5.6614"/>
							</SegmentLine>
							<SegmentLine>
								<End x="9.0755" y="5.6614"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
					<Island>
						<FilledContour>
							<Start x="12.4181" y="3.3072"/>
							<SegmentLine>
								<End x="12.1924" y="3.3072"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.6181" y="3.3072"/>
							</SegmentLine>
							<SegmentLine>
								<End x="11.2436" y="3.3072"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.5043" y="2.9694"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.4459" y="2.9694"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.2868" y="3.7306"/>
							</SegmentLine>
							<SegmentLine>
								<End x="18.6226" y="3.9245"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.2322" y="5.9573"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.2166" y="5.9461"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.2003" y="5.9371"/>
							</SegmentLine>
							<SegmentLine>
								<End x="16.107" y="5.9008"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.5003" y="5.7004"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.4927" y="5.6988"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.4766" y="5.6981"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.3824" y="5.7097"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.3081" y="5.6107"/>
							</SegmentLine>
							<SegmentLine>
								<End x="15.0663" y="5.5024"/>
							</SegmentLine>
							<SegmentLine>
								<End x="14.573" y="5.1639"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.6719" y="5.0321"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.676" y="5.0028"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.5256" y="4.7697"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.2982" y="4.4173"/>
							</SegmentLine>
							<SegmentLine>
								<End x="13.0709" y="4.0649"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.9869" y="3.9347"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.9631" y="3.9188"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.9631" y="3.6265"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.6438" y="3.3072"/>
							</SegmentLine>
							<SegmentLine>
								<End x="12.4181" y="3.3072"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
		</Coppers>
	</Connectivity>

	<Settings version="1.3">
		<Autoroute mode="SingleLayerTop" wireShape="Arcs"
		 directConnectSMD="on"/>
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
		<View scale="32.205" scrollHorz="20.5758" scrollVert="14.3147"/>
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
		<Grid gridColor="#414141" gridKind="Lines" gridShow="on" alignToGrid="on" saveProportion="on">
			<GridSpace x="25000" y="25000"/>
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
				<Show visible="on" details="on" pads="on"/>
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
		<FilterNetlines/>
	</DisplayControl>

	<DialogSettings version="1.2">
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