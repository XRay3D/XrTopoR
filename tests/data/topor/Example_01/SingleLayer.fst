<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : SingleLayer.fst                -->
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
						<End x="5.3747" y="16.1319"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5687" y="16.1804"/>
						<End x="5.3807" y="16.2488"/>
					</TrackArcCW>
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
						<End x="4.5897" y="14.4697"/>
					</TrackLine>
					<TrackLine>
						<End x="4.6244" y="14.2727"/>
					</TrackLine>
					<TrackLine>
						<End x="4.8194" y="13.1642"/>
					</TrackLine>
					<TrackLine>
						<End x="4.8542" y="12.9672"/>
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
						<End x="8.7355" y="22.8803"/>
					</TrackLine>
					<TrackArc>
						<Center x="8.6409" y="22.3436"/>
						<End x="8.2906" y="22.7611"/>
					</TrackArc>
					<TrackLine>
						<End x="7.6778" y="22.2469"/>
					</TrackLine>
					<TrackLine>
						<End x="7.5245" y="22.1182"/>
					</TrackLine>
					<TrackArc>
						<Center x="7.8749" y="21.7008"/>
						<End x="7.4106" y="21.9862"/>
					</TrackArc>
					<TrackLine>
						<End x="6.4639" y="20.4462"/>
					</TrackLine>
					<TrackArc>
						<Center x="6.9282" y="20.1608"/>
						<End x="6.4562" y="20.4333"/>
					</TrackArc>
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
					<Start x="5.4163" y="18.8513"/>
					<TrackLine>
						<End x="5.0802" y="18.4103"/>
					</TrackLine>
					<TrackLine>
						<End x="4.9802" y="18.2371"/>
					</TrackLine>
					<TrackLine>
						<End x="4.5758" y="17.5366"/>
					</TrackLine>
					<TrackArc>
						<Center x="4.749" y="17.4366"/>
						<End x="4.561" y="17.505"/>
					</TrackArc>
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
						<End x="4.3353" y="15.8462"/>
					</TrackLine>
					<TrackLine>
						<End x="4.3006" y="16.0432"/>
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
					<TrackArcCW>
						<Center x="11.4671" y="21.8808"/>
						<End x="11.581" y="21.7163"/>
					</TrackArcCW>
					<TrackLine>
						<End x="10.0698" y="20.6695"/>
					</TrackLine>
					<TrackArc>
						<Center x="10.1837" y="20.5051"/>
						<End x="10.0573" y="20.6601"/>
					</TrackArc>
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
					<TrackArcCW>
						<Center x="8.8856" y="19.6933"/>
						<End x="8.7571" y="19.8465"/>
					</TrackArcCW>
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
						<End x="16.0597" y="24.4373"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="16.1085" y="24.2433"/>
						<End x="16.1769" y="24.4312"/>
					</TrackArcCW>
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
						<End x="18.6293" y="23.706"/>
					</TrackLine>
					<TrackLine>
						<End x="18.8172" y="23.6376"/>
					</TrackLine>
					<TrackLine>
						<End x="19.7122" y="23.3118"/>
					</TrackLine>
					<TrackLine>
						<End x="19.8935" y="23.2274"/>
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
					<TrackArc>
						<Center x="21.2213" y="16.6987"/>
						<End x="21.4169" y="16.7406"/>
					</TrackArc>
					<TrackLine>
						<End x="20.4662" y="21.1769"/>
					</TrackLine>
					<TrackArc>
						<Center x="19.9333" y="21.0627"/>
						<End x="20.3577" y="21.4046"/>
					</TrackArc>
					<TrackLine>
						<End x="20.0761" y="21.7541"/>
					</TrackLine>
					<TrackArc>
						<Center x="19.9204" y="21.6286"/>
						<End x="20.0077" y="21.8085"/>
					</TrackArc>
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
					<Start x="19.6393" y="22.0907"/>
					<TrackLine>
						<End x="19.3706" y="22.1059"/>
					</TrackLine>
					<TrackLine>
						<End x="19.1893" y="22.1904"/>
					</TrackLine>
					<TrackArc>
						<Center x="19.1047" y="22.009"/>
						<End x="19.1731" y="22.197"/>
					</TrackArc>
					<TrackLine>
						<End x="18.3958" y="22.4799"/>
					</TrackLine>
					<TrackLine>
						<End x="18.2079" y="22.5483"/>
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
					<TrackArc>
						<Center x="17.2495" y="22.2542"/>
						<End x="17.258" y="22.454"/>
					</TrackArc>
					<TrackLine>
						<End x="16.6429" y="22.4803"/>
					</TrackLine>
					<TrackArc>
						<Center x="16.6344" y="22.2805"/>
						<End x="16.5856" y="22.4745"/>
					</TrackArc>
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
					<TrackArc>
						<Center x="15.5322" y="22.9169"/>
						<End x="15.6436" y="23.0831"/>
					</TrackArc>
					<TrackLine>
						<End x="14.9357" y="23.5577"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="15.2392" y="24.0104"/>
						<End x="14.9195" y="23.569"/>
					</TrackArcCW>
					<TrackLine>
						<End x="14.3237" y="24.0006"/>
					</TrackLine>
					<TrackArc>
						<Center x="14.004" y="23.5592"/>
						<End x="14.0986" y="24.0959"/>
					</TrackArc>
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
					<TrackArcCW>
						<Center x="23.2533" y="15.7987"/>
						<End x="23.4527" y="15.7832"/>
					</TrackArcCW>
					<TrackLine>
						<End x="23.1919" y="12.4301"/>
					</TrackLine>
					<TrackArc>
						<Center x="23.3913" y="12.4146"/>
						<End x="23.1913" y="12.4146"/>
					</TrackArc>
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
						<End x="4.2844" y="12.0127"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="4.7783" y="12.243"/>
						<End x="4.2656" y="12.0582"/>
					</TrackArcCW>
					<TrackLine>
						<End x="3.5684" y="13.992"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="4.0811" y="14.1768"/>
						<End x="3.5444" y="14.0821"/>
					</TrackArcCW>
					<TrackLine>
						<End x="3.2665" y="15.6578"/>
					</TrackLine>
					<TrackLine>
						<End x="3.2318" y="15.8548"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="3.7685" y="15.9494"/>
						<End x="3.228" y="16.0189"/>
					</TrackArcCW>
					<TrackLine>
						<End x="3.3369" y="16.8655"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="3.8774" y="16.796"/>
						<End x="3.3652" y="16.9823"/>
					</TrackArcCW>
					<TrackLine>
						<End x="3.4337" y="17.1704"/>
					</TrackLine>
					<TrackLine>
						<End x="3.6731" y="17.8282"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="4.1852" y="17.6418"/>
						<End x="3.7262" y="17.9356"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.0459" y="19.997"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="6.0944" y="19.3258"/>
						<End x="5.087" y="20.0574"/>
					</TrackArcCW>
					<TrackLine>
						<End x="6.8311" y="22.4589"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="7.8749" y="21.7008"/>
						<End x="7.0455" y="22.6888"/>
					</TrackArcCW>
					<TrackLine>
						<End x="7.1989" y="22.8176"/>
					</TrackLine>
					<TrackLine>
						<End x="7.8117" y="23.3318"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="8.6409" y="22.3436"/>
						<End x="8.6001" y="23.633"/>
					</TrackArcCW>
					<TrackLine>
						<End x="9.6051" y="23.6647"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="9.6223" y="23.12"/>
						<End x="9.7063" y="23.6585"/>
					</TrackArcCW>
					<TrackLine>
						<End x="13.1039" y="23.1287"/>
					</TrackLine>
					<TrackArc>
						<Center x="13.1347" y="23.3263"/>
						<End x="13.1835" y="23.1323"/>
					</TrackArc>
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
				<NetRef name="NET00012"/>
				<Subwire width="0.4">
					<Start x="13.6858" y="23.0081"/>
					<TrackLine>
						<End x="13.9918" y="22.8314"/>
					</TrackLine>
					<TrackLine>
						<End x="14.0436" y="22.6382"/>
					</TrackLine>
					<TrackArc>
						<Center x="14.2369" y="22.6899"/>
						<End x="14.1227" y="22.5256"/>
					</TrackArc>
					<TrackLine>
						<End x="15.454" y="21.6001"/>
					</TrackLine>
					<TrackArc>
						<Center x="15.7651" y="22.0476"/>
						<End x="15.6583" y="21.5132"/>
					</TrackArc>
					<TrackLine>
						<End x="18.8941" y="20.8666"/>
					</TrackLine>
					<TrackArc>
						<Center x="18.9333" y="21.0627"/>
						<End x="18.9333" y="20.8627"/>
					</TrackArc>
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
				<NetRef name="NET00013"/>
				<Subwire width="0.4">
					<Start x="9.1656" y="5.3553"/>
					<TrackLine>
						<End x="8.8135" y="5.3245"/>
					</TrackLine>
					<TrackLine>
						<End x="8.6603" y="5.453"/>
					</TrackLine>
					<TrackArc>
						<Center x="8.5316" y="5.2998"/>
						<End x="8.5275" y="5.4999"/>
					</TrackArc>
					<TrackLine>
						<End x="7.6756" y="5.4825"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="7.6645" y="6.0274"/>
						<End x="7.3142" y="5.6099"/>
					</TrackArcCW>
					<TrackLine>
						<End x="6.6247" y="6.1884"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="6.975" y="6.6059"/>
						<End x="6.5621" y="6.2502"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.6545" y="7.3037"/>
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
					<TrackArc>
						<Center x="15.018" y="3.8522"/>
						<End x="14.9607" y="4.0438"/>
					</TrackArc>
					<TrackLine>
						<End x="12.5743" y="3.3301"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="12.4181" y="3.8522"/>
						<End x="12.4181" y="3.3072"/>
					</TrackArcCW>
					<TrackLine>
						<End x="10.8181" y="3.3072"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="10.8181" y="3.8522"/>
						<End x="10.3843" y="3.5223"/>
					</TrackArcCW>
					<TrackLine>
						<End x="9.3804" y="4.8424"/>
					</TrackLine>
					<TrackArc>
						<Center x="9.2211" y="4.7213"/>
						<End x="9.3497" y="4.8746"/>
					</TrackArc>
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
				<NetRef name="NET00014"/>
				<Subwire width="0.4">
					<Start x="6.7046" y="9.4115"/>
					<TrackLine>
						<End x="6.5837" y="9.0794"/>
					</TrackLine>
					<TrackLine>
						<End x="6.6683" y="8.8981"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="6.4869" y="8.8135"/>
						<End x="6.6769" y="8.8764"/>
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
						<End x="7.3743" y="7.2064"/>
					</TrackLine>
					<TrackArc>
						<Center x="7.5535" y="7.2954"/>
						<End x="7.4249" y="7.1421"/>
					</TrackArc>
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
					<TrackArc>
						<Center x="8.243" y="6.7169"/>
						<End x="8.2471" y="6.5168"/>
					</TrackArc>
					<TrackLine>
						<End x="9.099" y="6.5342"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="9.1101" y="5.9893"/>
						<End x="9.2991" y="6.5005"/>
					</TrackArcCW>
					<TrackLine>
						<End x="10.7488" y="5.9646"/>
					</TrackLine>
					<TrackArc>
						<Center x="10.8181" y="6.1522"/>
						<End x="10.8181" y="5.9522"/>
					</TrackArc>
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
					<TrackArc>
						<Center x="7.9664" y="20.4646"/>
						<End x="7.8155" y="20.5958"/>
					</TrackArc>
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
					<TrackArc>
						<Center x="6.8166" y="17.1768"/>
						<End x="6.6171" y="17.1915"/>
					</TrackArc>
					<TrackLine>
						<End x="6.4848" y="15.392"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5423" y="15.4613"/>
						<End x="6.4259" y="15.1262"/>
					</TrackArcCW>
					<TrackLine>
						<End x="6.1773" y="14.4707"/>
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
						<End x="7.2329" y="19.9015"/>
					</TrackLine>
					<TrackArc>
						<Center x="7.3879" y="19.7751"/>
						<End x="7.188" y="19.7809"/>
					</TrackArc>
					<TrackLine>
						<End x="7.1603" y="18.82"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="6.9604" y="18.8258"/>
						<End x="7.1336" y="18.7258"/>
					</TrackArcCW>
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
					<TrackArcCW>
						<Center x="9.7522" y="8.3351"/>
						<End x="9.6155" y="8.189"/>
					</TrackArcCW>
					<TrackLine>
						<End x="9.4722" y="8.3231"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="9.6861" y="8.5516"/>
						<End x="9.4648" y="8.3303"/>
					</TrackArcCW>
					<TrackLine>
						<End x="8.1643" y="9.6308"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="8.3856" y="9.8521"/>
						<End x="8.1207" y="9.6854"/>
					</TrackArcCW>
					<TrackLine>
						<End x="6.3816" y="12.4491"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="6.5509" y="12.5556"/>
						<End x="6.3546" y="12.5173"/>
					</TrackArcCW>
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
					<Start x="22.9413" y="10.9147"/>
					<TrackLine>
						<End x="22.6913" y="10.8147"/>
					</TrackLine>
					<TrackLine>
						<End x="22.4913" y="10.8147"/>
					</TrackLine>
					<TrackArc>
						<Center x="22.4913" y="10.6147"/>
						<End x="22.3845" y="10.7838"/>
					</TrackArc>
					<TrackLine>
						<End x="18.431" y="8.287"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="18.2639" y="8.5516"/>
						<End x="18.4204" y="8.2805"/>
					</TrackArcCW>
					<TrackLine>
						<End x="16.8276" y="7.3609"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="16.6711" y="7.632"/>
						<End x="16.7521" y="7.3297"/>
					</TrackArcCW>
					<TrackLine>
						<End x="14.9756" y="6.8537"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="14.8946" y="7.156"/>
						<End x="14.8946" y="6.843"/>
					</TrackArcCW>
					<TrackLine>
						<End x="13.0554" y="6.843"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="13.0554" y="7.156"/>
						<End x="12.9746" y="6.8536"/>
					</TrackArcCW>
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
						<End x="10.3861" y="7.5644"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="10.4417" y="7.7566"/>
						<End x="10.313" y="7.6034"/>
					</TrackArcCW>
					<TrackLine>
						<End x="10.1598" y="7.7319"/>
					</TrackLine>
					<TrackLine>
						<End x="9.8077" y="7.7011"/>
					</TrackLine>
				</Subwire>
			</Wire>
		</Wires>
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
		<View scale="32.205" scrollHorz="13.9751" scrollVert="14.1405"/>
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