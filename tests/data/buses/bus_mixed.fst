<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : bus_mixed.fst-->
<!--   Format  : TopoR PCB file-->
<!--   Version : 1.2.0-->
<!--   Program : XrTopoR-->
<!--   Date    : 2026-11-08 15:58-->
<!--********************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.2.0</Version>
		<Program>XrTopoR</Program>
		<Date>2026-11-08 15:58</Date>
		<OriginalFormat>TopoR PCB</OriginalFormat>
		<OriginalFile>.\bus_mixed.fst</OriginalFile>
		<Units dist="mm" time="ps"/>
	</Header>

	<Layers version="1.1">
		<StackUpLayers>
			<Layer name="Top" type="Signal" thickness="0"/>
			<Layer name="Bottom" type="Signal" thickness="0"/>
		</StackUpLayers>
	</Layers>

	<TextStyles version="1.0">
		<TextStyle name="(Default)" fontName="QUALITY" height="1.5"/>
	</TextStyles>

	<LocalLibrary version="1.4">
		<Padstacks>
			<Padstack name="C1.6_D0.9" holeDiameter="0.9" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.6">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.6">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</Pads>
			</Padstack>
		</Padstacks>
		<Viastacks>
			<Viastack name="0.6x0.3" holeDiameter="0.3">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="0.6">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
		</Viastacks>
		<Footprints>
			<Footprint name="J1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-12.7"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-15.24"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-17.78"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-20.32"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-22.86"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-25.4"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-27.94"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-30.48"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-33.02"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-35.56"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-38.1"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="J2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-12.7"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-15.24"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-17.78"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-20.32"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-22.86"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-25.4"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-27.94"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-30.48"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-33.02"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-35.56"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="-38.1"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA0">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA10">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA11">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA12">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA13">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA14">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA15">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA16">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA17">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA18">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA19">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA20">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA21">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA22">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA23">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA24">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA25">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA26">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA27">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA28">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA29">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA3">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA30">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA31">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA4">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA5">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA6">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA7">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA8">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RA9">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB0">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB10">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB11">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB12">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB13">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB14">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB15">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB16">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB17">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB18">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB19">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB20">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB21">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB22">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB23">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB24">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB25">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB26">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB27">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB28">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB29">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB3">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB30">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB31">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB4">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB5">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB6">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB7">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB8">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
			<Footprint name="RB9">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.6_D0.9"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
			</Footprint>
		</Footprints>
		<Components>
			<Component name="J1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="J2">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="3" pinSymName="3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinSymName="4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="5" pinSymName="5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="6" pinSymName="6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="7" pinSymName="7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinSymName="8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinSymName="9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinSymName="10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="11" pinSymName="11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="12" pinSymName="12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="13" pinSymName="13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="14" pinSymName="14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="15" pinSymName="15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="16" pinSymName="16" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA0">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA10">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA11">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA12">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA13">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA14">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA15">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA16">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA17">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA18">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA19">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA2">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA20">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA21">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA22">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA23">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA24">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA25">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA26">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA27">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA28">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA29">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA3">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA30">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA31">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA4">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA5">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA6">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA7">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA8">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RA9">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB0">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB10">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB11">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB12">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB13">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB14">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB15">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB16">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB17">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB18">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB19">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB2">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB20">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB21">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB22">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB23">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB24">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB25">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB26">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB27">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB28">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB29">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB3">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB30">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB31">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB4">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB5">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB6">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB7">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB8">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
			<Component name="RB9">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
			</Component>
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="J1"/>
				<FootprintRef name="J1"/>
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
				<ComponentRef name="J2"/>
				<FootprintRef name="J2"/>
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
				<ComponentRef name="RA0"/>
				<FootprintRef name="RA0"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA1"/>
				<FootprintRef name="RA1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA10"/>
				<FootprintRef name="RA10"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA11"/>
				<FootprintRef name="RA11"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA12"/>
				<FootprintRef name="RA12"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA13"/>
				<FootprintRef name="RA13"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA14"/>
				<FootprintRef name="RA14"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA15"/>
				<FootprintRef name="RA15"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA16"/>
				<FootprintRef name="RA16"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA17"/>
				<FootprintRef name="RA17"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA18"/>
				<FootprintRef name="RA18"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA19"/>
				<FootprintRef name="RA19"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA2"/>
				<FootprintRef name="RA2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA20"/>
				<FootprintRef name="RA20"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA21"/>
				<FootprintRef name="RA21"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA22"/>
				<FootprintRef name="RA22"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA23"/>
				<FootprintRef name="RA23"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA24"/>
				<FootprintRef name="RA24"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA25"/>
				<FootprintRef name="RA25"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA26"/>
				<FootprintRef name="RA26"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA27"/>
				<FootprintRef name="RA27"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA28"/>
				<FootprintRef name="RA28"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA29"/>
				<FootprintRef name="RA29"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA3"/>
				<FootprintRef name="RA3"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA30"/>
				<FootprintRef name="RA30"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA31"/>
				<FootprintRef name="RA31"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA4"/>
				<FootprintRef name="RA4"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA5"/>
				<FootprintRef name="RA5"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA6"/>
				<FootprintRef name="RA6"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA7"/>
				<FootprintRef name="RA7"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA8"/>
				<FootprintRef name="RA8"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RA9"/>
				<FootprintRef name="RA9"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB0"/>
				<FootprintRef name="RB0"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB1"/>
				<FootprintRef name="RB1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB10"/>
				<FootprintRef name="RB10"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB11"/>
				<FootprintRef name="RB11"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB12"/>
				<FootprintRef name="RB12"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB13"/>
				<FootprintRef name="RB13"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB14"/>
				<FootprintRef name="RB14"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB15"/>
				<FootprintRef name="RB15"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB16"/>
				<FootprintRef name="RB16"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB17"/>
				<FootprintRef name="RB17"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB18"/>
				<FootprintRef name="RB18"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB19"/>
				<FootprintRef name="RB19"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB2"/>
				<FootprintRef name="RB2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB20"/>
				<FootprintRef name="RB20"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB21"/>
				<FootprintRef name="RB21"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB22"/>
				<FootprintRef name="RB22"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB23"/>
				<FootprintRef name="RB23"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB24"/>
				<FootprintRef name="RB24"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB25"/>
				<FootprintRef name="RB25"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB26"/>
				<FootprintRef name="RB26"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB27"/>
				<FootprintRef name="RB27"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB28"/>
				<FootprintRef name="RB28"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB29"/>
				<FootprintRef name="RB29"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB3"/>
				<FootprintRef name="RB3"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB30"/>
				<FootprintRef name="RB30"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB31"/>
				<FootprintRef name="RB31"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB4"/>
				<FootprintRef name="RB4"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB5"/>
				<FootprintRef name="RB5"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB6"/>
				<FootprintRef name="RB6"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB7"/>
				<FootprintRef name="RB7"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB8"/>
				<FootprintRef name="RB8"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="RB9"/>
				<FootprintRef name="RB9"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
		</Packages>
	</LocalLibrary>

	<Constructive version="1.2">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.1">
					<Polyline>
						<Start x="0" y="0"/>
						<SegmentLine>
							<End x="90" y="0"/>
						</SegmentLine>
						<SegmentLine>
							<End x="90" y="-100.1"/>
						</SegmentLine>
						<SegmentLine>
							<End x="0" y="-100.1"/>
						</SegmentLine>
						<SegmentLine>
							<End x="0" y="0"/>
						</SegmentLine>
					</Polyline>
				</Shape>
			</Contour>
		</BoardOutline>
	</Constructive>

	<ComponentsOnBoard version="1.3">
		<Components>
			<CompInstance name="J1" uniqueId="AAAAAAAA" side="Top">
				<ComponentRef name="J1"/>
				<FootprintRef name="J1"/>
				<Org x="10" y="-29"/>
			</CompInstance>
			<CompInstance name="J2" uniqueId="AAAAAAAB" side="Top">
				<ComponentRef name="J2"/>
				<FootprintRef name="J2"/>
				<Org x="80" y="-29"/>
			</CompInstance>
			<CompInstance name="RA0" uniqueId="AAAAAAAC" side="Top">
				<ComponentRef name="RA0"/>
				<FootprintRef name="RA0"/>
				<Org x="18" y="-4"/>
			</CompInstance>
			<CompInstance name="RB0" uniqueId="AAAAAAAD" side="Top">
				<ComponentRef name="RB0"/>
				<FootprintRef name="RB0"/>
				<Org x="29" y="-93.1"/>
			</CompInstance>
			<CompInstance name="RA1" uniqueId="AAAAAAAE" side="Top">
				<ComponentRef name="RA1"/>
				<FootprintRef name="RA1"/>
				<Org x="29" y="-4"/>
			</CompInstance>
			<CompInstance name="RB1" uniqueId="AAAAAAAF" side="Top">
				<ComponentRef name="RB1"/>
				<FootprintRef name="RB1"/>
				<Org x="51" y="-87.1"/>
			</CompInstance>
			<CompInstance name="RA2" uniqueId="AAAAAAAG" side="Top">
				<ComponentRef name="RA2"/>
				<FootprintRef name="RA2"/>
				<Org x="40" y="-4"/>
			</CompInstance>
			<CompInstance name="RB2" uniqueId="AAAAAAAH" side="Top">
				<ComponentRef name="RB2"/>
				<FootprintRef name="RB2"/>
				<Org x="62" y="-90.1"/>
			</CompInstance>
			<CompInstance name="RA3" uniqueId="AAAAAAAI" side="Top">
				<ComponentRef name="RA3"/>
				<FootprintRef name="RA3"/>
				<Org x="51" y="-4"/>
			</CompInstance>
			<CompInstance name="RB3" uniqueId="AAAAAAAJ" side="Top">
				<ComponentRef name="RB3"/>
				<FootprintRef name="RB3"/>
				<Org x="51" y="-78.1"/>
			</CompInstance>
			<CompInstance name="RA4" uniqueId="AAAAAAAK" side="Top">
				<ComponentRef name="RA4"/>
				<FootprintRef name="RA4"/>
				<Org x="62" y="-4"/>
			</CompInstance>
			<CompInstance name="RB4" uniqueId="AAAAAAAL" side="Top">
				<ComponentRef name="RB4"/>
				<FootprintRef name="RB4"/>
				<Org x="29" y="-75.1"/>
			</CompInstance>
			<CompInstance name="RA5" uniqueId="AAAAAAAM" side="Top">
				<ComponentRef name="RA5"/>
				<FootprintRef name="RA5"/>
				<Org x="18" y="-7"/>
			</CompInstance>
			<CompInstance name="RB5" uniqueId="AAAAAAAN" side="Top">
				<ComponentRef name="RB5"/>
				<FootprintRef name="RB5"/>
				<Org x="51" y="-84.1"/>
			</CompInstance>
			<CompInstance name="RA6" uniqueId="AAAAAAAO" side="Top">
				<ComponentRef name="RA6"/>
				<FootprintRef name="RA6"/>
				<Org x="29" y="-7"/>
			</CompInstance>
			<CompInstance name="RB6" uniqueId="AAAAAAAP" side="Top">
				<ComponentRef name="RB6"/>
				<FootprintRef name="RB6"/>
				<Org x="40" y="-87.1"/>
			</CompInstance>
			<CompInstance name="RA7" uniqueId="AAAAAAAQ" side="Top">
				<ComponentRef name="RA7"/>
				<FootprintRef name="RA7"/>
				<Org x="40" y="-7"/>
			</CompInstance>
			<CompInstance name="RB7" uniqueId="AAAAAAAR" side="Top">
				<ComponentRef name="RB7"/>
				<FootprintRef name="RB7"/>
				<Org x="18" y="-75.1"/>
			</CompInstance>
			<CompInstance name="RA8" uniqueId="AAAAAAAS" side="Top">
				<ComponentRef name="RA8"/>
				<FootprintRef name="RA8"/>
				<Org x="51" y="-7"/>
			</CompInstance>
			<CompInstance name="RB8" uniqueId="AAAAAAAT" side="Top">
				<ComponentRef name="RB8"/>
				<FootprintRef name="RB8"/>
				<Org x="62" y="-75.1"/>
			</CompInstance>
			<CompInstance name="RA9" uniqueId="AAAAAAAU" side="Top">
				<ComponentRef name="RA9"/>
				<FootprintRef name="RA9"/>
				<Org x="62" y="-7"/>
			</CompInstance>
			<CompInstance name="RB9" uniqueId="AAAAAAAV" side="Top">
				<ComponentRef name="RB9"/>
				<FootprintRef name="RB9"/>
				<Org x="40" y="-90.1"/>
			</CompInstance>
			<CompInstance name="RA10" uniqueId="AAAAAAAW" side="Top">
				<ComponentRef name="RA10"/>
				<FootprintRef name="RA10"/>
				<Org x="18" y="-10"/>
			</CompInstance>
			<CompInstance name="RB10" uniqueId="AAAAAAAX" side="Top">
				<ComponentRef name="RB10"/>
				<FootprintRef name="RB10"/>
				<Org x="18" y="-81.1"/>
			</CompInstance>
			<CompInstance name="RA11" uniqueId="AAAAAAAY" side="Top">
				<ComponentRef name="RA11"/>
				<FootprintRef name="RA11"/>
				<Org x="29" y="-10"/>
			</CompInstance>
			<CompInstance name="RB11" uniqueId="AAAAAAAZ" side="Top">
				<ComponentRef name="RB11"/>
				<FootprintRef name="RB11"/>
				<Org x="18" y="-87.1"/>
			</CompInstance>
			<CompInstance name="RA12" uniqueId="AAAAAABA" side="Top">
				<ComponentRef name="RA12"/>
				<FootprintRef name="RA12"/>
				<Org x="40" y="-10"/>
			</CompInstance>
			<CompInstance name="RB12" uniqueId="AAAAAABB" side="Top">
				<ComponentRef name="RB12"/>
				<FootprintRef name="RB12"/>
				<Org x="62" y="-87.1"/>
			</CompInstance>
			<CompInstance name="RA13" uniqueId="AAAAAABC" side="Top">
				<ComponentRef name="RA13"/>
				<FootprintRef name="RA13"/>
				<Org x="51" y="-10"/>
			</CompInstance>
			<CompInstance name="RB13" uniqueId="AAAAAABD" side="Top">
				<ComponentRef name="RB13"/>
				<FootprintRef name="RB13"/>
				<Org x="18" y="-93.1"/>
			</CompInstance>
			<CompInstance name="RA14" uniqueId="AAAAAABE" side="Top">
				<ComponentRef name="RA14"/>
				<FootprintRef name="RA14"/>
				<Org x="62" y="-10"/>
			</CompInstance>
			<CompInstance name="RB14" uniqueId="AAAAAABF" side="Top">
				<ComponentRef name="RB14"/>
				<FootprintRef name="RB14"/>
				<Org x="51" y="-75.1"/>
			</CompInstance>
			<CompInstance name="RA15" uniqueId="AAAAAABG" side="Top">
				<ComponentRef name="RA15"/>
				<FootprintRef name="RA15"/>
				<Org x="18" y="-13"/>
			</CompInstance>
			<CompInstance name="RB15" uniqueId="AAAAAABH" side="Top">
				<ComponentRef name="RB15"/>
				<FootprintRef name="RB15"/>
				<Org x="18" y="-78.1"/>
			</CompInstance>
			<CompInstance name="RA16" uniqueId="AAAAAABI" side="Top">
				<ComponentRef name="RA16"/>
				<FootprintRef name="RA16"/>
				<Org x="29" y="-13"/>
			</CompInstance>
			<CompInstance name="RB16" uniqueId="AAAAAABJ" side="Top">
				<ComponentRef name="RB16"/>
				<FootprintRef name="RB16"/>
				<Org x="29" y="-84.1"/>
			</CompInstance>
			<CompInstance name="RA17" uniqueId="AAAAAABK" side="Top">
				<ComponentRef name="RA17"/>
				<FootprintRef name="RA17"/>
				<Org x="40" y="-13"/>
			</CompInstance>
			<CompInstance name="RB17" uniqueId="AAAAAABL" side="Top">
				<ComponentRef name="RB17"/>
				<FootprintRef name="RB17"/>
				<Org x="62" y="-84.1"/>
			</CompInstance>
			<CompInstance name="RA18" uniqueId="AAAAAABM" side="Top">
				<ComponentRef name="RA18"/>
				<FootprintRef name="RA18"/>
				<Org x="51" y="-13"/>
			</CompInstance>
			<CompInstance name="RB18" uniqueId="AAAAAABN" side="Top">
				<ComponentRef name="RB18"/>
				<FootprintRef name="RB18"/>
				<Org x="51" y="-81.1"/>
			</CompInstance>
			<CompInstance name="RA19" uniqueId="AAAAAABO" side="Top">
				<ComponentRef name="RA19"/>
				<FootprintRef name="RA19"/>
				<Org x="62" y="-13"/>
			</CompInstance>
			<CompInstance name="RB19" uniqueId="AAAAAABP" side="Top">
				<ComponentRef name="RB19"/>
				<FootprintRef name="RB19"/>
				<Org x="62" y="-78.1"/>
			</CompInstance>
			<CompInstance name="RA20" uniqueId="AAAAAABQ" side="Top">
				<ComponentRef name="RA20"/>
				<FootprintRef name="RA20"/>
				<Org x="18" y="-16"/>
			</CompInstance>
			<CompInstance name="RB20" uniqueId="AAAAAABR" side="Top">
				<ComponentRef name="RB20"/>
				<FootprintRef name="RB20"/>
				<Org x="40" y="-84.1"/>
			</CompInstance>
			<CompInstance name="RA21" uniqueId="AAAAAABS" side="Top">
				<ComponentRef name="RA21"/>
				<FootprintRef name="RA21"/>
				<Org x="29" y="-16"/>
			</CompInstance>
			<CompInstance name="RB21" uniqueId="AAAAAABT" side="Top">
				<ComponentRef name="RB21"/>
				<FootprintRef name="RB21"/>
				<Org x="62" y="-81.1"/>
			</CompInstance>
			<CompInstance name="RA22" uniqueId="AAAAAABU" side="Top">
				<ComponentRef name="RA22"/>
				<FootprintRef name="RA22"/>
				<Org x="40" y="-16"/>
			</CompInstance>
			<CompInstance name="RB22" uniqueId="AAAAAABV" side="Top">
				<ComponentRef name="RB22"/>
				<FootprintRef name="RB22"/>
				<Org x="29" y="-87.1"/>
			</CompInstance>
			<CompInstance name="RA23" uniqueId="AAAAAABW" side="Top">
				<ComponentRef name="RA23"/>
				<FootprintRef name="RA23"/>
				<Org x="51" y="-16"/>
			</CompInstance>
			<CompInstance name="RB23" uniqueId="AAAAAABX" side="Top">
				<ComponentRef name="RB23"/>
				<FootprintRef name="RB23"/>
				<Org x="40" y="-78.1"/>
			</CompInstance>
			<CompInstance name="RA24" uniqueId="AAAAAABY" side="Top">
				<ComponentRef name="RA24"/>
				<FootprintRef name="RA24"/>
				<Org x="62" y="-16"/>
			</CompInstance>
			<CompInstance name="RB24" uniqueId="AAAAAABZ" side="Top">
				<ComponentRef name="RB24"/>
				<FootprintRef name="RB24"/>
				<Org x="29" y="-81.1"/>
			</CompInstance>
			<CompInstance name="RA25" uniqueId="AAAAAACA" side="Top">
				<ComponentRef name="RA25"/>
				<FootprintRef name="RA25"/>
				<Org x="18" y="-19"/>
			</CompInstance>
			<CompInstance name="RB25" uniqueId="AAAAAACB" side="Top">
				<ComponentRef name="RB25"/>
				<FootprintRef name="RB25"/>
				<Org x="18" y="-84.1"/>
			</CompInstance>
			<CompInstance name="RA26" uniqueId="AAAAAACC" side="Top">
				<ComponentRef name="RA26"/>
				<FootprintRef name="RA26"/>
				<Org x="29" y="-19"/>
			</CompInstance>
			<CompInstance name="RB26" uniqueId="AAAAAACD" side="Top">
				<ComponentRef name="RB26"/>
				<FootprintRef name="RB26"/>
				<Org x="29" y="-78.1"/>
			</CompInstance>
			<CompInstance name="RA27" uniqueId="AAAAAACE" side="Top">
				<ComponentRef name="RA27"/>
				<FootprintRef name="RA27"/>
				<Org x="40" y="-19"/>
			</CompInstance>
			<CompInstance name="RB27" uniqueId="AAAAAACF" side="Top">
				<ComponentRef name="RB27"/>
				<FootprintRef name="RB27"/>
				<Org x="40" y="-81.1"/>
			</CompInstance>
			<CompInstance name="RA28" uniqueId="AAAAAACG" side="Top">
				<ComponentRef name="RA28"/>
				<FootprintRef name="RA28"/>
				<Org x="51" y="-19"/>
			</CompInstance>
			<CompInstance name="RB28" uniqueId="AAAAAACH" side="Top">
				<ComponentRef name="RB28"/>
				<FootprintRef name="RB28"/>
				<Org x="29" y="-90.1"/>
			</CompInstance>
			<CompInstance name="RA29" uniqueId="AAAAAACI" side="Top">
				<ComponentRef name="RA29"/>
				<FootprintRef name="RA29"/>
				<Org x="62" y="-19"/>
			</CompInstance>
			<CompInstance name="RB29" uniqueId="AAAAAACJ" side="Top">
				<ComponentRef name="RB29"/>
				<FootprintRef name="RB29"/>
				<Org x="51" y="-90.1"/>
			</CompInstance>
			<CompInstance name="RA30" uniqueId="AAAAAACK" side="Top">
				<ComponentRef name="RA30"/>
				<FootprintRef name="RA30"/>
				<Org x="18" y="-22"/>
			</CompInstance>
			<CompInstance name="RB30" uniqueId="AAAAAACL" side="Top">
				<ComponentRef name="RB30"/>
				<FootprintRef name="RB30"/>
				<Org x="18" y="-90.1"/>
			</CompInstance>
			<CompInstance name="RA31" uniqueId="AAAAAACM" side="Top">
				<ComponentRef name="RA31"/>
				<FootprintRef name="RA31"/>
				<Org x="29" y="-22"/>
			</CompInstance>
			<CompInstance name="RB31" uniqueId="AAAAAACN" side="Top">
				<ComponentRef name="RB31"/>
				<FootprintRef name="RB31"/>
				<Org x="40" y="-75.1"/>
			</CompInstance>
		</Components>
	</ComponentsOnBoard>

	<NetList version="2.0">
		<Net name="D0">
			<PinRef compName="J1" pinName="1"/>
			<PinRef compName="J2" pinName="1"/>
		</Net>
		<Net name="D1">
			<PinRef compName="J1" pinName="2"/>
			<PinRef compName="J2" pinName="2"/>
		</Net>
		<Net name="D2">
			<PinRef compName="J1" pinName="3"/>
			<PinRef compName="J2" pinName="3"/>
		</Net>
		<Net name="D3">
			<PinRef compName="J1" pinName="4"/>
			<PinRef compName="J2" pinName="4"/>
		</Net>
		<Net name="D4">
			<PinRef compName="J1" pinName="5"/>
			<PinRef compName="J2" pinName="5"/>
		</Net>
		<Net name="D5">
			<PinRef compName="J1" pinName="6"/>
			<PinRef compName="J2" pinName="6"/>
		</Net>
		<Net name="D6">
			<PinRef compName="J1" pinName="7"/>
			<PinRef compName="J2" pinName="7"/>
		</Net>
		<Net name="D7">
			<PinRef compName="J1" pinName="8"/>
			<PinRef compName="J2" pinName="8"/>
		</Net>
		<Net name="D8">
			<PinRef compName="J1" pinName="9"/>
			<PinRef compName="J2" pinName="9"/>
		</Net>
		<Net name="D9">
			<PinRef compName="J1" pinName="10"/>
			<PinRef compName="J2" pinName="10"/>
		</Net>
		<Net name="D10">
			<PinRef compName="J1" pinName="11"/>
			<PinRef compName="J2" pinName="11"/>
		</Net>
		<Net name="D11">
			<PinRef compName="J1" pinName="12"/>
			<PinRef compName="J2" pinName="12"/>
		</Net>
		<Net name="D12">
			<PinRef compName="J1" pinName="13"/>
			<PinRef compName="J2" pinName="13"/>
		</Net>
		<Net name="D13">
			<PinRef compName="J1" pinName="14"/>
			<PinRef compName="J2" pinName="14"/>
		</Net>
		<Net name="D14">
			<PinRef compName="J1" pinName="15"/>
			<PinRef compName="J2" pinName="15"/>
		</Net>
		<Net name="D15">
			<PinRef compName="J1" pinName="16"/>
			<PinRef compName="J2" pinName="16"/>
		</Net>
		<Net name="SA0">
			<PinRef compName="RA0" pinName="1"/>
		</Net>
		<Net name="S0">
			<PinRef compName="RA0" pinName="2"/>
			<PinRef compName="RB0" pinName="1"/>
		</Net>
		<Net name="SB0">
			<PinRef compName="RB0" pinName="2"/>
		</Net>
		<Net name="SA1">
			<PinRef compName="RA1" pinName="1"/>
		</Net>
		<Net name="S1">
			<PinRef compName="RA1" pinName="2"/>
			<PinRef compName="RB1" pinName="1"/>
		</Net>
		<Net name="SB1">
			<PinRef compName="RB1" pinName="2"/>
		</Net>
		<Net name="SA2">
			<PinRef compName="RA2" pinName="1"/>
		</Net>
		<Net name="S2">
			<PinRef compName="RA2" pinName="2"/>
			<PinRef compName="RB2" pinName="1"/>
		</Net>
		<Net name="SB2">
			<PinRef compName="RB2" pinName="2"/>
		</Net>
		<Net name="SA3">
			<PinRef compName="RA3" pinName="1"/>
		</Net>
		<Net name="S3">
			<PinRef compName="RA3" pinName="2"/>
			<PinRef compName="RB3" pinName="1"/>
		</Net>
		<Net name="SB3">
			<PinRef compName="RB3" pinName="2"/>
		</Net>
		<Net name="SA4">
			<PinRef compName="RA4" pinName="1"/>
		</Net>
		<Net name="S4">
			<PinRef compName="RA4" pinName="2"/>
			<PinRef compName="RB4" pinName="1"/>
		</Net>
		<Net name="SB4">
			<PinRef compName="RB4" pinName="2"/>
		</Net>
		<Net name="SA5">
			<PinRef compName="RA5" pinName="1"/>
		</Net>
		<Net name="S5">
			<PinRef compName="RA5" pinName="2"/>
			<PinRef compName="RB5" pinName="1"/>
		</Net>
		<Net name="SB5">
			<PinRef compName="RB5" pinName="2"/>
		</Net>
		<Net name="SA6">
			<PinRef compName="RA6" pinName="1"/>
		</Net>
		<Net name="S6">
			<PinRef compName="RA6" pinName="2"/>
			<PinRef compName="RB6" pinName="1"/>
		</Net>
		<Net name="SB6">
			<PinRef compName="RB6" pinName="2"/>
		</Net>
		<Net name="SA7">
			<PinRef compName="RA7" pinName="1"/>
		</Net>
		<Net name="S7">
			<PinRef compName="RA7" pinName="2"/>
			<PinRef compName="RB7" pinName="1"/>
		</Net>
		<Net name="SB7">
			<PinRef compName="RB7" pinName="2"/>
		</Net>
		<Net name="SA8">
			<PinRef compName="RA8" pinName="1"/>
		</Net>
		<Net name="S8">
			<PinRef compName="RA8" pinName="2"/>
			<PinRef compName="RB8" pinName="1"/>
		</Net>
		<Net name="SB8">
			<PinRef compName="RB8" pinName="2"/>
		</Net>
		<Net name="SA9">
			<PinRef compName="RA9" pinName="1"/>
		</Net>
		<Net name="S9">
			<PinRef compName="RA9" pinName="2"/>
			<PinRef compName="RB9" pinName="1"/>
		</Net>
		<Net name="SB9">
			<PinRef compName="RB9" pinName="2"/>
		</Net>
		<Net name="SA10">
			<PinRef compName="RA10" pinName="1"/>
		</Net>
		<Net name="S10">
			<PinRef compName="RA10" pinName="2"/>
			<PinRef compName="RB10" pinName="1"/>
		</Net>
		<Net name="SB10">
			<PinRef compName="RB10" pinName="2"/>
		</Net>
		<Net name="SA11">
			<PinRef compName="RA11" pinName="1"/>
		</Net>
		<Net name="S11">
			<PinRef compName="RA11" pinName="2"/>
			<PinRef compName="RB11" pinName="1"/>
		</Net>
		<Net name="SB11">
			<PinRef compName="RB11" pinName="2"/>
		</Net>
		<Net name="SA12">
			<PinRef compName="RA12" pinName="1"/>
		</Net>
		<Net name="S12">
			<PinRef compName="RA12" pinName="2"/>
			<PinRef compName="RB12" pinName="1"/>
		</Net>
		<Net name="SB12">
			<PinRef compName="RB12" pinName="2"/>
		</Net>
		<Net name="SA13">
			<PinRef compName="RA13" pinName="1"/>
		</Net>
		<Net name="S13">
			<PinRef compName="RA13" pinName="2"/>
			<PinRef compName="RB13" pinName="1"/>
		</Net>
		<Net name="SB13">
			<PinRef compName="RB13" pinName="2"/>
		</Net>
		<Net name="SA14">
			<PinRef compName="RA14" pinName="1"/>
		</Net>
		<Net name="S14">
			<PinRef compName="RA14" pinName="2"/>
			<PinRef compName="RB14" pinName="1"/>
		</Net>
		<Net name="SB14">
			<PinRef compName="RB14" pinName="2"/>
		</Net>
		<Net name="SA15">
			<PinRef compName="RA15" pinName="1"/>
		</Net>
		<Net name="S15">
			<PinRef compName="RA15" pinName="2"/>
			<PinRef compName="RB15" pinName="1"/>
		</Net>
		<Net name="SB15">
			<PinRef compName="RB15" pinName="2"/>
		</Net>
		<Net name="SA16">
			<PinRef compName="RA16" pinName="1"/>
		</Net>
		<Net name="S16">
			<PinRef compName="RA16" pinName="2"/>
			<PinRef compName="RB16" pinName="1"/>
		</Net>
		<Net name="SB16">
			<PinRef compName="RB16" pinName="2"/>
		</Net>
		<Net name="SA17">
			<PinRef compName="RA17" pinName="1"/>
		</Net>
		<Net name="S17">
			<PinRef compName="RA17" pinName="2"/>
			<PinRef compName="RB17" pinName="1"/>
		</Net>
		<Net name="SB17">
			<PinRef compName="RB17" pinName="2"/>
		</Net>
		<Net name="SA18">
			<PinRef compName="RA18" pinName="1"/>
		</Net>
		<Net name="S18">
			<PinRef compName="RA18" pinName="2"/>
			<PinRef compName="RB18" pinName="1"/>
		</Net>
		<Net name="SB18">
			<PinRef compName="RB18" pinName="2"/>
		</Net>
		<Net name="SA19">
			<PinRef compName="RA19" pinName="1"/>
		</Net>
		<Net name="S19">
			<PinRef compName="RA19" pinName="2"/>
			<PinRef compName="RB19" pinName="1"/>
		</Net>
		<Net name="SB19">
			<PinRef compName="RB19" pinName="2"/>
		</Net>
		<Net name="SA20">
			<PinRef compName="RA20" pinName="1"/>
		</Net>
		<Net name="S20">
			<PinRef compName="RA20" pinName="2"/>
			<PinRef compName="RB20" pinName="1"/>
		</Net>
		<Net name="SB20">
			<PinRef compName="RB20" pinName="2"/>
		</Net>
		<Net name="SA21">
			<PinRef compName="RA21" pinName="1"/>
		</Net>
		<Net name="S21">
			<PinRef compName="RA21" pinName="2"/>
			<PinRef compName="RB21" pinName="1"/>
		</Net>
		<Net name="SB21">
			<PinRef compName="RB21" pinName="2"/>
		</Net>
		<Net name="SA22">
			<PinRef compName="RA22" pinName="1"/>
		</Net>
		<Net name="S22">
			<PinRef compName="RA22" pinName="2"/>
			<PinRef compName="RB22" pinName="1"/>
		</Net>
		<Net name="SB22">
			<PinRef compName="RB22" pinName="2"/>
		</Net>
		<Net name="SA23">
			<PinRef compName="RA23" pinName="1"/>
		</Net>
		<Net name="S23">
			<PinRef compName="RA23" pinName="2"/>
			<PinRef compName="RB23" pinName="1"/>
		</Net>
		<Net name="SB23">
			<PinRef compName="RB23" pinName="2"/>
		</Net>
		<Net name="SA24">
			<PinRef compName="RA24" pinName="1"/>
		</Net>
		<Net name="S24">
			<PinRef compName="RA24" pinName="2"/>
			<PinRef compName="RB24" pinName="1"/>
		</Net>
		<Net name="SB24">
			<PinRef compName="RB24" pinName="2"/>
		</Net>
		<Net name="SA25">
			<PinRef compName="RA25" pinName="1"/>
		</Net>
		<Net name="S25">
			<PinRef compName="RA25" pinName="2"/>
			<PinRef compName="RB25" pinName="1"/>
		</Net>
		<Net name="SB25">
			<PinRef compName="RB25" pinName="2"/>
		</Net>
		<Net name="SA26">
			<PinRef compName="RA26" pinName="1"/>
		</Net>
		<Net name="S26">
			<PinRef compName="RA26" pinName="2"/>
			<PinRef compName="RB26" pinName="1"/>
		</Net>
		<Net name="SB26">
			<PinRef compName="RB26" pinName="2"/>
		</Net>
		<Net name="SA27">
			<PinRef compName="RA27" pinName="1"/>
		</Net>
		<Net name="S27">
			<PinRef compName="RA27" pinName="2"/>
			<PinRef compName="RB27" pinName="1"/>
		</Net>
		<Net name="SB27">
			<PinRef compName="RB27" pinName="2"/>
		</Net>
		<Net name="SA28">
			<PinRef compName="RA28" pinName="1"/>
		</Net>
		<Net name="S28">
			<PinRef compName="RA28" pinName="2"/>
			<PinRef compName="RB28" pinName="1"/>
		</Net>
		<Net name="SB28">
			<PinRef compName="RB28" pinName="2"/>
		</Net>
		<Net name="SA29">
			<PinRef compName="RA29" pinName="1"/>
		</Net>
		<Net name="S29">
			<PinRef compName="RA29" pinName="2"/>
			<PinRef compName="RB29" pinName="1"/>
		</Net>
		<Net name="SB29">
			<PinRef compName="RB29" pinName="2"/>
		</Net>
		<Net name="SA30">
			<PinRef compName="RA30" pinName="1"/>
		</Net>
		<Net name="S30">
			<PinRef compName="RA30" pinName="2"/>
			<PinRef compName="RB30" pinName="1"/>
		</Net>
		<Net name="SB30">
			<PinRef compName="RB30" pinName="2"/>
		</Net>
		<Net name="SA31">
			<PinRef compName="RA31" pinName="1"/>
		</Net>
		<Net name="S31">
			<PinRef compName="RA31" pinName="2"/>
			<PinRef compName="RB31" pinName="1"/>
		</Net>
		<Net name="SB31">
			<PinRef compName="RB31" pinName="2"/>
		</Net>
	</NetList>

	<Groups version="1.1">
	</Groups>

	<HiSpeedRules version="3.0">
	</HiSpeedRules>

	<Rules version="2.0">
		<RulesWidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.25" widthNom="0.25">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
			</WidthOfWires>
		</RulesWidthOfWires>
		<RulesClearancesNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0.2" clrnNom="0.2">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
					<AllNets/>
				</ObjectsAffected>
			</ClearanceNetToNet>
		</RulesClearancesNetToNet>
		<RulesClearancesCompToComp>
			<ClearanceCompToComp enabled="on" clrn="0.2">
				<ObjectsAffected>
					<AllComps/>
					<AllComps/>
				</ObjectsAffected>
			</ClearanceCompToComp>
		</RulesClearancesCompToComp>
		<RulesClearancesToBoard wires="0.25" comps="0.25"/>
		<RulesViastacksOfNets>
			<ViastacksOfNets enabled="on">
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
				<Viastacks>
					<ViastackRef name="0.6x0.3"/>
				</Viastacks>
			</ViastacksOfNets>
		</RulesViastacksOfNets>
		<NetProperties>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA16"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S16"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB16"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA17"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S17"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB17"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA18"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S18"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB18"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA19"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S19"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB19"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA20"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S20"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB20"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA21"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S21"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB21"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA22"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S22"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB22"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA23"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S23"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB23"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA24"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S24"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB24"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA25"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S25"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB25"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA26"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S26"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB26"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA27"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S27"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB27"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA28"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S28"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB28"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA29"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S29"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB29"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA30"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S30"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB30"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SA31"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="S31"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SB31"/>
			</NetProperty>
		</NetProperties>
		<PadConnectSettings mode="AutoConnect"/>
	</Rules>

	<Connectivity version="1.3">
		<Vias>
		</Vias>
		<Wires>
		</Wires>
	</Connectivity>

	<Settings version="1.3">
		<Autoroute autoEqu="None"/>
		<Autoproc/>
		<Labels rotateWithComp="on"/>
	</Settings>
</TopoR_PCB_File>
