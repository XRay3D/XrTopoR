<?xml version="1.0" encoding="UTF-8"?>

<!--*****************************************-->
<!--   File    : AMK310_MCU_V2.fst           -->
<!--   Format  : TopoR PCB file              -->
<!--   Version : 1.2.1                       -->
<!--   Program : TopoR Lite 7.0.18699        -->
<!--   Date    : Saturday, November 07, 2026 -->
<!--   Time    : 14:21                       -->
<!--*****************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.2.1</Version>
		<Program>TopoR Lite 7.0.18699</Program>
		<Date>Saturday, November 07, 2026 14:21</Date>
		<OriginalFormat>Pcad 2004</OriginalFormat>
		<OriginalFile>P:\ELEMER\AMK310\КДС ПЛАТЫ\2_в_1\V2\AMK310_MCU_V2\AMK310_MCU_V2.pcb</OriginalFile>
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
			<Layer name="Mechanical 1" type="Mechanical" thickness="0"/>
		</StackUpLayers>
	</Layers>

	<TextStyles version="1.0">
		<TextStyle name="(Default)" fontName="GOST type B" height="2.5"/>
		<TextStyle name="GOST 2.5" fontName="GOST type B" height="2.5" bold="on"/>
		<TextStyle name="GOST 3" fontName="GOST type B" height="3" bold="on"/>
		<TextStyle name="GOST 1.5" fontName="GOST type B" height="1.5" bold="on"/>
		<TextStyle name="GOST_B_2" fontName="GOST type B" height="2"/>
		<TextStyle name="GOST_B_4" fontName="GOST type B" height="4"/>
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
					<PadCircle diameter="1.624">
						<LayerRef name="TopMask"/>
					</PadCircle>
					<PadCircle diameter="1.624">
						<LayerRef name="BotMask"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="smd40x48" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.016" height="1.2192">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="1.116" height="1.3192">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="0.916" height="1.1192">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="smd60x30" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.524" height="0.762">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="1.624" height="0.862">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="1.424" height="0.662">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="smd32x32" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.8128" height="0.8128">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="0.9128" height="0.9128">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="0.7128" height="0.7128">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="smd_M0.42x1.25" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.42" height="1.25">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="0.52" height="1.35">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="0.32" height="1.15">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="smd_M0.5x1.0" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.5" height="1">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="0.6" height="1.1">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="0.4" height="0.9">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="smd60x30 [1]" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.762" height="1.524">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="0.862" height="1.624">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="0.662" height="1.424">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="C1.0x1.6" holeDiameter="1" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="1.6">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="1.6">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="1.6">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1.6">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
					<PadCircle diameter="1.7">
						<LayerRef name="TopMask"/>
					</PadCircle>
					<PadCircle diameter="1.7">
						<LayerRef name="BotMask"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="C0.8x1.5" holeDiameter="0.8" metallized="on">
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
					<PadCircle diameter="1.6">
						<LayerRef name="TopMask"/>
					</PadCircle>
					<PadCircle diameter="1.6">
						<LayerRef name="BotMask"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="smd_M0.8x1.6" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.8" height="1.6">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="0.9" height="1.7">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="0.7" height="1.5">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="smd30x50" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.762" height="1.27">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="0.862" height="1.37">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="0.662" height="1.17">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="smd80x40" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="2.032" height="1.016">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="2.132" height="1.116">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="1.932" height="0.916">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="SQ2.8x3.0x2.0" holeDiameter="1.3" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="2.8" height="2.8" handling="Rounding" handlingValue="0.7">
						<LayerTypeRef type="Plane"/>
					</PadRect>
					<PadRect width="2.8" height="2.8" handling="Rounding" handlingValue="0.7">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="3" height="3" handling="Rounding" handlingValue="0.75">
						<LayerRef name="Bottom"/>
					</PadRect>
					<PadRect width="2.9" height="2.9" handling="Rounding" handlingValue="0.75">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="3.1" height="3.1" handling="Rounding" handlingValue="0.8">
						<LayerRef name="BotMask"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="C2.0x3.0" holeDiameter="1.3" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="3">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="3">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
					<PadCircle diameter="3">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="3">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="3.1">
						<LayerRef name="TopMask"/>
					</PadCircle>
					<PadCircle diameter="3.1">
						<LayerRef name="BotMask"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="R7x2BOT" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="2" height="7">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="2.1" height="7.1">
						<LayerRef name="TopMask"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="R7x2TOP" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="2" height="7">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="2.1" height="7.1">
						<LayerRef name="TopMask"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="mnt2.9" type="MountingHole" holeDiameter="2.9">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="3.5">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="3.5">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="3.5">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="3.5">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
					<PadCircle diameter="3.6">
						<LayerRef name="TopMask"/>
					</PadCircle>
					<PadCircle diameter="3.6">
						<LayerRef name="BotMask"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="smd_M0.25x0.6" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.25" height="0.6">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="0.35" height="0.7">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="0.15" height="0.5">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="smd1.4x1.8s" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadPoly>
						<LayerRef name="Top"/>
						<Dot x="-0.5842" y="-0.9144"/>
						<Dot x="0.8382" y="-0.9144"/>
						<Dot x="0.8382" y="-0.254"/>
						<Dot x="0.3302" y="-0.254"/>
						<Dot x="0.3302" y="0.254"/>
						<Dot x="0.8382" y="0.254"/>
						<Dot x="0.8382" y="0.9144"/>
						<Dot x="-0.5842" y="0.9144"/>
					</PadPoly>
					<PadPoly>
						<LayerRef name="TopMask"/>
						<Dot x="0.8882" y="-0.9644"/>
						<Dot x="0.8882" y="-0.204"/>
						<Dot x="0.3802" y="-0.204"/>
						<Dot x="0.3802" y="0.204"/>
						<Dot x="0.8882" y="0.204"/>
						<Dot x="0.8882" y="0.9644"/>
						<Dot x="-0.6342" y="0.9644"/>
						<Dot x="-0.6342" y="-0.9644"/>
					</PadPoly>
					<PadPoly>
						<LayerRef name="TopPaste"/>
						<Dot x="0.7882" y="-0.8644"/>
						<Dot x="0.7882" y="-0.304"/>
						<Dot x="0.2802" y="-0.304"/>
						<Dot x="0.2802" y="0.304"/>
						<Dot x="0.7882" y="0.304"/>
						<Dot x="0.7882" y="0.8644"/>
						<Dot x="-0.5342" y="0.8644"/>
						<Dot x="-0.5342" y="-0.8644"/>
					</PadPoly>
				</Pads>
			</Padstack>
			<Padstack name="smd60x70" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.524" height="1.778">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="1.624" height="1.878">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="1.424" height="1.678">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="smd_M1.4x2.2" type="SMD">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.4" height="2.2">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="1.5" height="2.3">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="1.3" height="2.1">
						<LayerRef name="TopPaste"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="SQ0.8x1.5" holeDiameter="0.8" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.5" height="1.5">
						<LayerRef name="Top"/>
					</PadRect>
					<PadRect width="1.5" height="1.5">
						<LayerRef name="Bottom"/>
					</PadRect>
					<PadRect width="1.5" height="1.5">
						<LayerTypeRef type="Plane"/>
					</PadRect>
					<PadRect width="1.6" height="1.6">
						<LayerRef name="TopMask"/>
					</PadRect>
					<PadRect width="1.6" height="1.6">
						<LayerRef name="BotMask"/>
					</PadRect>
				</Pads>
			</Padstack>
		</Padstacks>
		<Viastacks>
			<Viastack name="(Default)" holeDiameter="0.6" viaOnPin="on">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
					<PadCircle diameter="1.05">
						<LayerTypeRef type="Mask"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="v70h40" holeDiameter="1">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="2">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="2">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
					<PadCircle diameter="2.1">
						<LayerTypeRef type="Mask"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="v70h40_1" holeDiameter="0.4">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="0.7">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="0.7">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
		</Viastacks>
		<Footprints>
			<Footprint name="C3528_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd_M1.4x2.2"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="smd_M1.4x2.2"/>
						<Org x="3.3" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1" y="1.4"/>
							<Dot x="3.4" y="1.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="1.4"/>
							<Dot x="3.4" y="-1.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="-1.4"/>
							<Dot x="-0.1" y="-1.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1" y="-1.4"/>
							<Dot x="-0.1" y="1.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.1" y="1.2"/>
							<Dot x="3.2" y="1.2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.2" y="1.2"/>
							<Dot x="3.2" y="-1.2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.2" y="-1.2"/>
							<Dot x="0.1" y="-1.2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.1" y="-1.2"/>
							<Dot x="0.1" y="1.2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1" y="1.4"/>
							<Dot x="0.1" y="1.2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1" y="-1.4"/>
							<Dot x="0.1" y="-1.2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="-1.4"/>
							<Dot x="3.2" y="-1.2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.2" y="1.2"/>
							<Dot x="3.4" y="1.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.1" y="1.1"/>
							<Dot x="-0.2" y="1.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="1.1"/>
							<Dot x="-0.2" y="-1.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-1.1"/>
							<Dot x="-0.1" y="-1.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="-1.1"/>
							<Dot x="3.5" y="-1.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.5" y="-1.1"/>
							<Dot x="3.5" y="1.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.5" y="1.1"/>
							<Dot x="3.4" y="1.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.5" y="1.2"/>
							<Dot x="0.5" y="-1.2"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.7" y="1.2"/>
							<Dot x="0.7" y="-1.2"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="1.65" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DO-214AC_1">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="smd60x70"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="180">
						<PadstackRef name="smd60x70"/>
						<Org x="-4.699" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-4.572" y="1.397"/>
							<Dot x="-4.572" y="-1.397"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.127" y="-1.397"/>
							<Dot x="-4.572" y="-1.397"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.127" y="1.397"/>
							<Dot x="-0.127" y="-1.397"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-4.572" y="1.397"/>
							<Dot x="-0.127" y="1.397"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="-4.318" y="1.143"/>
							<Start x="-4.318" y="1.27"/>
							<End x="-4.445" y="1.143"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="-0.381" y="-1.143"/>
							<Start x="-0.381" y="-1.27"/>
							<End x="-0.254" y="-1.143"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="-0.381" y="1.143"/>
							<Start x="-0.254" y="1.143"/>
							<End x="-0.381" y="1.27"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.254" y="1.143"/>
							<Dot x="-0.254" y="-1.143"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.381" y="1.27"/>
							<Dot x="-4.318" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="-4.318" y="-1.143"/>
							<Start x="-4.445" y="-1.143"/>
							<End x="-4.318" y="-1.27"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-4.445" y="-1.143"/>
							<Dot x="-4.445" y="1.143"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-4.318" y="-1.27"/>
							<Dot x="-0.381" y="-1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.3175" y="0.762"/>
							<Dot x="0.3175" y="-0.762"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.3175" y="0.762"/>
							<Dot x="-0.127" y="0.762"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.3175" y="-0.762"/>
							<Dot x="-0.127" y="-0.762"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-5.0165" y="-0.762"/>
							<Dot x="-5.0165" y="0.762"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-5.0165" y="-0.762"/>
							<Dot x="-4.572" y="-0.762"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-5.0165" y="0.762"/>
							<Dot x="-4.572" y="0.762"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-3.8735" y="1.143"/>
							<Dot x="-3.8735" y="-1.143"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-3.8735" y="-1.143"/>
							<Dot x="-3.8735" y="-1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-3.8735" y="1.143"/>
							<Dot x="-3.8735" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-3.4925" y="1.27"/>
							<Dot x="-3.4925" y="-1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.4765" y="0.508"/>
							<Dot x="-2.4765" y="-0.508"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.4765" y="0"/>
							<Dot x="-1.651" y="0.508"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.651" y="0.508"/>
							<Dot x="-1.651" y="-0.508"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.651" y="-0.508"/>
							<Dot x="-2.4765" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.3495" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="0805_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd40x48"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="smd40x48"/>
						<Org x="2.032" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.381" y="0.635"/>
							<Dot x="0.381" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="0.635"/>
							<Dot x="2.032" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.651" y="0.635"/>
							<Dot x="1.651" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="-0.635"/>
							<Dot x="0" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0" y="0.635"/>
							<Dot x="2.032" y="0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0" y="-0.635"/>
							<Dot x="0" y="0.635"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="1.016" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="0805_2">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd40x48"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="smd40x48"/>
						<Org x="2.032" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.381" y="0.635"/>
							<Dot x="0.381" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="0.635"/>
							<Dot x="2.032" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.651" y="0.635"/>
							<Dot x="1.651" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="-0.635"/>
							<Dot x="0" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0" y="0.635"/>
							<Dot x="2.032" y="0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0" y="-0.635"/>
							<Dot x="0" y="0.635"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="1.016" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="TO-92-1_1_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="1.905" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="-1.905" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.8288" y="1.5748"/>
							<Dot x="1.8288" y="1.5748"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="0" y="0"/>
							<Start x="-1.8376" y="1.5639"/>
							<End x="1.8376" y="1.5639"/>
						</ArcCCW>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="GOST 1.5"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="TO-92-1_1_T0-92L1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="1.905" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="-1.905" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.651" y="-2.032"/>
							<Dot x="-2.159" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.286" y="-6.858"/>
							<Dot x="-2.286" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.778" y="-2.032"/>
							<Dot x="-1.778" y="-6.858"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.159" y="-2.032"/>
							<Dot x="1.651" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.286" y="-2.032"/>
							<Dot x="2.286" y="-6.858"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.778" y="-2.032"/>
							<Dot x="1.778" y="-6.858"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.159" y="0"/>
							<Dot x="-1.651" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.159" y="-2.032"/>
							<Dot x="-2.159" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.651" y="0"/>
							<Dot x="-1.651" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.254" y="-2.032"/>
							<Dot x="-0.254" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.651" y="0"/>
							<Dot x="2.159" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.254" y="0"/>
							<Dot x="0.254" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.651" y="-2.032"/>
							<Dot x="1.651" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.159" y="0"/>
							<Dot x="2.159" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.286" y="-6.858"/>
							<Dot x="-2.286" y="-6.858"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.254" y="-2.032"/>
							<Dot x="-0.254" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.286" y="-2.032"/>
							<Dot x="2.286" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.254" y="0"/>
							<Dot x="0.254" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="GOST 1.5"/>
						<Org x="0" y="-4.318"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="TO-92-1_1_TO-92L2">
				<Pads>
					<Pad padNum="1" name="1" flipped="on">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="-1.905" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" flipped="on">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="3" name="3" flipped="on">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="1.905" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.778" y="-6.096"/>
							<Dot x="-1.778" y="-6.731"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.159" y="-2.032"/>
							<Dot x="-1.651" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.778" y="-2.032"/>
							<Dot x="-1.778" y="-2.667"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.778" y="-3.048"/>
							<Dot x="-1.778" y="-3.683"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.778" y="-4.064"/>
							<Dot x="-1.778" y="-4.699"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.286" y="-2.032"/>
							<Dot x="-2.286" y="-6.858"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.778" y="-5.08"/>
							<Dot x="-1.778" y="-5.715"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.778" y="-6.096"/>
							<Dot x="1.778" y="-6.731"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.651" y="-2.032"/>
							<Dot x="2.159" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.778" y="-2.032"/>
							<Dot x="1.778" y="-2.667"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.778" y="-3.048"/>
							<Dot x="1.778" y="-3.683"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.778" y="-4.064"/>
							<Dot x="1.778" y="-4.699"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.286" y="-6.858"/>
							<Dot x="2.286" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.778" y="-5.08"/>
							<Dot x="1.778" y="-5.715"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.651" y="0"/>
							<Dot x="-2.159" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.254" y="0"/>
							<Dot x="-0.254" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.651" y="-2.032"/>
							<Dot x="-1.651" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.159" y="0"/>
							<Dot x="-2.159" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.159" y="0"/>
							<Dot x="1.651" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.159" y="-2.032"/>
							<Dot x="2.159" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.651" y="0"/>
							<Dot x="1.651" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.254" y="-2.032"/>
							<Dot x="0.254" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-2.286" y="-6.858"/>
							<Dot x="2.286" y="-6.858"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.254" y="-2.032"/>
							<Dot x="0.254" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.286" y="-2.032"/>
							<Dot x="-2.286" y="-2.032"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.254" y="0"/>
							<Dot x="-0.254" y="0"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="GOST 1.5"/>
						<Org x="0" y="-4.318"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="IM03CGR_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd_M0.8x1.6"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="smd_M0.8x1.6"/>
						<Org x="3.2" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="smd_M0.8x1.6"/>
						<Org x="5.4" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="smd_M0.8x1.6"/>
						<Org x="7.6" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="smd_M0.8x1.6"/>
						<Org x="7.6" y="6.6"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="smd_M0.8x1.6"/>
						<Org x="5.4" y="6.6"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="smd_M0.8x1.6"/>
						<Org x="3.2" y="6.6"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="smd_M0.8x1.6"/>
						<Org x="0" y="6.6"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="0.3"/>
							<Dot x="-0.2" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.2" y="0.3"/>
							<Dot x="0.2" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-0.5"/>
							<Dot x="0.2" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3" y="0.3"/>
							<Dot x="3" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="0.3"/>
							<Dot x="3.4" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3" y="-0.5"/>
							<Dot x="3.4" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.2" y="0.3"/>
							<Dot x="5.2" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.6" y="0.3"/>
							<Dot x="5.6" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.2" y="-0.5"/>
							<Dot x="5.6" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.8" y="1"/>
							<Dot x="5.8" y="0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0" y="0.6"/>
							<Dot x="-0.4" y="1.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.4" y="1.3"/>
							<Dot x="0.4" y="1.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.4" y="1.3"/>
							<Dot x="0" y="0.6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="6.3"/>
							<Dot x="-0.2" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.2" y="6.3"/>
							<Dot x="0.2" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="7.1"/>
							<Dot x="0.2" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3" y="6.3"/>
							<Dot x="3" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="6.3"/>
							<Dot x="3.4" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3" y="7.1"/>
							<Dot x="3.4" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.2" y="6.3"/>
							<Dot x="5.2" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.6" y="6.3"/>
							<Dot x="5.6" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.2" y="7.1"/>
							<Dot x="5.6" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.4" y="0.3"/>
							<Dot x="7.4" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="0.3"/>
							<Dot x="7.8" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.4" y="-0.5"/>
							<Dot x="7.8" y="-0.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="1.8"/>
							<Dot x="6.6" y="1.8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Circle diameter="1">
							<Center x="6.5" y="1.1"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Circle diameter="0.4">
							<Center x="8" y="1.1"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.4" y="6.3"/>
							<Dot x="7.4" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="6.3"/>
							<Dot x="7.8" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.4" y="7.1"/>
							<Dot x="7.8" y="7.1"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.2" y="0.3"/>
							<Dot x="-1.2" y="6.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="6.3"/>
							<Dot x="8.8" y="0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="0.3"/>
							<Dot x="-1.2" y="0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="6.6" y="1"/>
							<Start x="6.6" y="1.8"/>
							<End x="5.8" y="1"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.2" y="6.3"/>
							<Dot x="8.8" y="6.3"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="3.8" y="3.3"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SOD-80_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd1.4x1.8s"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="180">
						<PadstackRef name="smd1.4x1.8s"/>
						<Org x="3.429" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.15" y="-0.85"/>
							<Dot x="-0.15" y="0.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.6" y="0.85"/>
							<Dot x="0.6" y="-0.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.25" y="0.4"/>
							<Dot x="1.25" y="-0.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.25" y="-0.4"/>
							<Dot x="1.95" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.95" y="0"/>
							<Dot x="1.25" y="0.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.95" y="0.4"/>
							<Dot x="1.95" y="-0.4"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.55" y="0.85"/>
							<Dot x="3.55" y="-0.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.8" y="0.85"/>
							<Dot x="2.8" y="-0.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.55" y="-0.85"/>
							<Dot x="-0.15" y="-0.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.15" y="0.85"/>
							<Dot x="3.55" y="0.85"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="1.7" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SL-62-PCB_1_Primary">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-38.1" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-38.1" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-35.56" y="0"/>
					</Pad>
					<Pad padNum="4" name="4" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-35.56" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-33.02" y="0"/>
					</Pad>
					<Pad padNum="6" name="6" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-33.02" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-30.48" y="0"/>
					</Pad>
					<Pad padNum="8" name="8" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-30.48" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-27.94" y="0"/>
					</Pad>
					<Pad padNum="10" name="10" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-27.94" y="0"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-25.4" y="0"/>
					</Pad>
					<Pad padNum="12" name="12" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-25.4" y="0"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-22.86" y="0"/>
					</Pad>
					<Pad padNum="14" name="14" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-22.86" y="0"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-20.32" y="0"/>
					</Pad>
					<Pad padNum="16" name="16" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-20.32" y="0"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-17.78" y="0"/>
					</Pad>
					<Pad padNum="18" name="18" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-17.78" y="0"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-15.24" y="0"/>
					</Pad>
					<Pad padNum="20" name="20" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-15.24" y="0"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-12.7" y="0"/>
					</Pad>
					<Pad padNum="22" name="22" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-12.7" y="0"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-10.16" y="0"/>
					</Pad>
					<Pad padNum="24" name="24" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-10.16" y="0"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-7.62" y="0"/>
					</Pad>
					<Pad padNum="26" name="26" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-7.62" y="0"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-5.08" y="0"/>
					</Pad>
					<Pad padNum="28" name="28" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-5.08" y="0"/>
					</Pad>
					<Pad padNum="29" name="29">
						<PadstackRef name="R7x2TOP"/>
						<Org x="-2.54" y="0"/>
					</Pad>
					<Pad padNum="30" name="30" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-2.54" y="0"/>
					</Pad>
					<Pad padNum="31" name="31">
						<PadstackRef name="R7x2TOP"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="32" name="32" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="33" name="33">
						<PadstackRef name="R7x2TOP"/>
						<Org x="2.54" y="0"/>
					</Pad>
					<Pad padNum="34" name="34" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="2.54" y="0"/>
					</Pad>
					<Pad padNum="35" name="35">
						<PadstackRef name="R7x2TOP"/>
						<Org x="5.08" y="0"/>
					</Pad>
					<Pad padNum="36" name="36" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="5.08" y="0"/>
					</Pad>
					<Pad padNum="37" name="37">
						<PadstackRef name="R7x2TOP"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="38" name="38" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="7.62" y="0"/>
					</Pad>
					<Pad padNum="39" name="39">
						<PadstackRef name="R7x2TOP"/>
						<Org x="10.16" y="0"/>
					</Pad>
					<Pad padNum="40" name="40" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="10.16" y="0"/>
					</Pad>
					<Pad padNum="41" name="41">
						<PadstackRef name="R7x2TOP"/>
						<Org x="12.7" y="0"/>
					</Pad>
					<Pad padNum="42" name="42" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="12.7" y="0"/>
					</Pad>
					<Pad padNum="43" name="43">
						<PadstackRef name="R7x2TOP"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="44" name="44" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="15.24" y="0"/>
					</Pad>
					<Pad padNum="45" name="45">
						<PadstackRef name="R7x2TOP"/>
						<Org x="17.78" y="0"/>
					</Pad>
					<Pad padNum="46" name="46" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="17.78" y="0"/>
					</Pad>
					<Pad padNum="47" name="47">
						<PadstackRef name="R7x2TOP"/>
						<Org x="20.32" y="0"/>
					</Pad>
					<Pad padNum="48" name="48" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="20.32" y="0"/>
					</Pad>
					<Pad padNum="49" name="49">
						<PadstackRef name="R7x2TOP"/>
						<Org x="22.86" y="0"/>
					</Pad>
					<Pad padNum="50" name="50" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="22.86" y="0"/>
					</Pad>
					<Pad padNum="51" name="51">
						<PadstackRef name="R7x2TOP"/>
						<Org x="25.4" y="0"/>
					</Pad>
					<Pad padNum="52" name="52" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="25.4" y="0"/>
					</Pad>
					<Pad padNum="53" name="53">
						<PadstackRef name="R7x2TOP"/>
						<Org x="27.94" y="0"/>
					</Pad>
					<Pad padNum="54" name="54" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="27.94" y="0"/>
					</Pad>
					<Pad padNum="55" name="55">
						<PadstackRef name="R7x2TOP"/>
						<Org x="30.48" y="0"/>
					</Pad>
					<Pad padNum="56" name="56" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="30.48" y="0"/>
					</Pad>
					<Pad padNum="57" name="57">
						<PadstackRef name="R7x2TOP"/>
						<Org x="33.02" y="0"/>
					</Pad>
					<Pad padNum="58" name="58" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="33.02" y="0"/>
					</Pad>
					<Pad padNum="59" name="59">
						<PadstackRef name="R7x2TOP"/>
						<Org x="35.56" y="0"/>
					</Pad>
					<Pad padNum="60" name="60" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="35.56" y="0"/>
					</Pad>
					<Pad padNum="61" name="61">
						<PadstackRef name="R7x2TOP"/>
						<Org x="38.1" y="0"/>
					</Pad>
					<Pad padNum="62" name="62" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="38.1" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-39.5" y="-4.5"/>
							<Dot x="-40.5" y="-2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-43" y="5.5"/>
							<Dot x="-40.5" y="5.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="39.5" y="-4.5"/>
							<Dot x="40.5" y="-2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="44" y="-4.5"/>
							<Dot x="43" y="-2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-43" y="-2.5"/>
							<Dot x="-43" y="5.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-40.5" y="5.5"/>
							<Dot x="-40.5" y="-2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="40.5" y="-2.5"/>
							<Dot x="40.5" y="5.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="43" y="-2.5"/>
							<Dot x="43" y="5.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-44" y="-4.5"/>
							<Dot x="-43" y="-2.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="40.5" y="5.5"/>
							<Dot x="43" y="5.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-39.5" y="-4.5"/>
							<Dot x="39.5" y="-4.5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-40.5" y="4.5"/>
							<Dot x="40.5" y="4.5"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="GOST 3"/>
						<Org x="0" y="6"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SL-62-PCB_1_Secondary">
				<Pads>
					<Pad padNum="1" name="1" angle="180">
						<PadstackRef name="R7x2TOP"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="3" name="3" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-2.54" y="0"/>
					</Pad>
					<Pad padNum="4" name="4" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-2.54" y="-5.08"/>
					</Pad>
					<Pad padNum="5" name="5" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-5.08" y="0"/>
					</Pad>
					<Pad padNum="6" name="6" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-5.08" y="-5.08"/>
					</Pad>
					<Pad padNum="7" name="7" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-7.62" y="0"/>
					</Pad>
					<Pad padNum="8" name="8" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-7.62" y="-5.08"/>
					</Pad>
					<Pad padNum="9" name="9" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-10.16" y="0"/>
					</Pad>
					<Pad padNum="10" name="10" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-10.16" y="-5.08"/>
					</Pad>
					<Pad padNum="11" name="11" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-12.7" y="0"/>
					</Pad>
					<Pad padNum="12" name="12" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-12.7" y="-5.08"/>
					</Pad>
					<Pad padNum="13" name="13" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-15.24" y="0"/>
					</Pad>
					<Pad padNum="14" name="14" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-15.24" y="-5.08"/>
					</Pad>
					<Pad padNum="15" name="15" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-17.78" y="0"/>
					</Pad>
					<Pad padNum="16" name="16" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-17.78" y="-5.08"/>
					</Pad>
					<Pad padNum="17" name="17" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-20.32" y="0"/>
					</Pad>
					<Pad padNum="18" name="18" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-20.32" y="-5.08"/>
					</Pad>
					<Pad padNum="19" name="19" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-22.86" y="0"/>
					</Pad>
					<Pad padNum="20" name="20" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-22.86" y="-5.08"/>
					</Pad>
					<Pad padNum="21" name="21" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-25.4" y="0"/>
					</Pad>
					<Pad padNum="22" name="22" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-25.4" y="-5.08"/>
					</Pad>
					<Pad padNum="23" name="23" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-27.94" y="0"/>
					</Pad>
					<Pad padNum="24" name="24" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-27.94" y="-5.08"/>
					</Pad>
					<Pad padNum="25" name="25" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-30.48" y="0"/>
					</Pad>
					<Pad padNum="26" name="26" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-30.48" y="-5.08"/>
					</Pad>
					<Pad padNum="27" name="27" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-33.02" y="0"/>
					</Pad>
					<Pad padNum="28" name="28" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-33.02" y="-5.08"/>
					</Pad>
					<Pad padNum="29" name="29" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-35.56" y="0"/>
					</Pad>
					<Pad padNum="30" name="30" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-35.56" y="-5.08"/>
					</Pad>
					<Pad padNum="31" name="31" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-38.1" y="0"/>
					</Pad>
					<Pad padNum="32" name="32" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-38.1" y="-5.08"/>
					</Pad>
					<Pad padNum="33" name="33" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-40.64" y="0"/>
					</Pad>
					<Pad padNum="34" name="34" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-40.64" y="-5.08"/>
					</Pad>
					<Pad padNum="35" name="35" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-43.18" y="0"/>
					</Pad>
					<Pad padNum="36" name="36" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-43.18" y="-5.08"/>
					</Pad>
					<Pad padNum="37" name="37" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-45.72" y="0"/>
					</Pad>
					<Pad padNum="38" name="38" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-45.72" y="-5.08"/>
					</Pad>
					<Pad padNum="39" name="39" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-48.26" y="0"/>
					</Pad>
					<Pad padNum="40" name="40" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-48.26" y="-5.08"/>
					</Pad>
					<Pad padNum="41" name="41" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-50.8" y="0"/>
					</Pad>
					<Pad padNum="42" name="42" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-50.8" y="-5.08"/>
					</Pad>
					<Pad padNum="43" name="43" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-53.34" y="0"/>
					</Pad>
					<Pad padNum="44" name="44" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-53.34" y="-5.08"/>
					</Pad>
					<Pad padNum="45" name="45" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-55.88" y="0"/>
					</Pad>
					<Pad padNum="46" name="46" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-55.88" y="-5.08"/>
					</Pad>
					<Pad padNum="47" name="47" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-58.42" y="0"/>
					</Pad>
					<Pad padNum="48" name="48" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-58.42" y="-5.08"/>
					</Pad>
					<Pad padNum="49" name="49" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-60.96" y="0"/>
					</Pad>
					<Pad padNum="50" name="50" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-60.96" y="-5.08"/>
					</Pad>
					<Pad padNum="51" name="51" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-63.5" y="0"/>
					</Pad>
					<Pad padNum="52" name="52" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-63.5" y="-5.08"/>
					</Pad>
					<Pad padNum="53" name="53" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-66.04" y="0"/>
					</Pad>
					<Pad padNum="54" name="54" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-66.04" y="-5.08"/>
					</Pad>
					<Pad padNum="55" name="55" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-68.58" y="0"/>
					</Pad>
					<Pad padNum="56" name="56" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-68.58" y="-5.08"/>
					</Pad>
					<Pad padNum="57" name="57" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-71.12" y="0"/>
					</Pad>
					<Pad padNum="58" name="58" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-71.12" y="-5.08"/>
					</Pad>
					<Pad padNum="59" name="59" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-73.66" y="0"/>
					</Pad>
					<Pad padNum="60" name="60" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-73.66" y="-5.08"/>
					</Pad>
					<Pad padNum="61" name="61" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-76.2" y="0"/>
					</Pad>
					<Pad padNum="62" name="62" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-76.2" y="-5.08"/>
					</Pad>
					<Pad padNum="63" name="63" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-78.74" y="0"/>
					</Pad>
					<Pad padNum="64" name="64" angle="180" flipped="on">
						<PadstackRef name="R7x2BOT"/>
						<Org x="-78.74" y="-5.08"/>
					</Pad>
					<Pad padNum="65" name="65">
						<PadstackRef name="mnt2.9"/>
						<Org x="-83.82" y="2.54"/>
					</Pad>
					<Pad padNum="66" name="66">
						<PadstackRef name="mnt2.9"/>
						<Org x="5.08" y="2.54"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-81.28" y="0"/>
							<Dot x="-81.28" y="3.81"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.54" y="0"/>
							<Dot x="2.54" y="3.81"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-86.36" y="6.35"/>
							<Dot x="-86.36" y="5.08"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-86.36" y="5.08"/>
							<Dot x="-86.36" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-81.28" y="3.81"/>
							<Dot x="-82.55" y="5.08"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-82.55" y="5.08"/>
							<Dot x="-82.55" y="6.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-78.74" y="1.27"/>
							<Dot x="-78.74" y="-5.08"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.54" y="3.81"/>
							<Dot x="3.81" y="5.08"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.81" y="5.08"/>
							<Dot x="3.81" y="6.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.08" y="13.97"/>
							<Dot x="5.08" y="6.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-86.36" y="0"/>
							<Dot x="-81.28" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-82.55" y="6.35"/>
							<Dot x="-86.36" y="6.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.62" y="0"/>
							<Dot x="2.54" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.81" y="6.35"/>
							<Dot x="7.62" y="6.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.62" y="6.35"/>
							<Dot x="7.62" y="5.08"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.62" y="5.08"/>
							<Dot x="7.62" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0" y="-5.08"/>
							<Dot x="0" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-83.82" y="6.35"/>
							<Dot x="-83.82" y="13.97"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.54" y="1.27"/>
							<Dot x="-16.51" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-30.48" y="13.97"/>
							<Dot x="5.08" y="13.97"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-17.78" y="5.08"/>
							<Dot x="3.81" y="5.08"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-78.74" y="-5.08"/>
							<Dot x="0" y="-5.08"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-16.51" y="1.27"/>
							<Dot x="-81.28" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-83.82" y="13.97"/>
							<Dot x="-30.48" y="13.97"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-82.55" y="5.08"/>
							<Dot x="-17.78" y="5.08"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="GOST 3"/>
						<Org x="-38.1" y="8.89"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="JMP_CLOSE_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd40x48"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="smd40x48"/>
						<Org x="1.524" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="-0.635"/>
							<Dot x="1.016" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.016" y="-0.635"/>
							<Dot x="1.016" y="-0.127"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.016" y="-0.127"/>
							<Dot x="0.508" y="-0.127"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.508" y="-0.127"/>
							<Dot x="0.508" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.016" y="0.635"/>
							<Dot x="2.032" y="0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.016" y="0.635"/>
							<Dot x="1.016" y="0.127"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.016" y="0.127"/>
							<Dot x="0.508" y="0.127"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.508" y="0.127"/>
							<Dot x="0.508" y="0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.508" y="-0.635"/>
							<Dot x="-0.508" y="0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.032" y="0.635"/>
							<Dot x="2.032" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.508" y="-0.635"/>
							<Dot x="-0.508" y="-0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.508" y="0.635"/>
							<Dot x="0.508" y="0.635"/>
						</Line>
					</Detail>
				</Details>
				<Coppers>
					<Copper lineWidth="0.4064">
						<LayerRef name="Top"/>
						<Line>
							<Dot x="0" y="0"/>
							<Dot x="1.524" y="0"/>
						</Line>
					</Copper>
				</Coppers>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0.762" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="PLT164-R_1">
				<Pads>
					<Pad padNum="1" name="1" angle="359.8">
						<PadstackRef name="SQ2.8x3.0x2.0"/>
						<Org x="-2.5" y="2.5"/>
					</Pad>
					<Pad padNum="2" name="2" angle="256.8">
						<PadstackRef name="C2.0x3.0"/>
						<Org x="-2.5" y="-2.5"/>
					</Pad>
					<Pad padNum="3" name="3" angle="308.4">
						<PadstackRef name="C2.0x3.0"/>
						<Org x="2.5" y="-2.5"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C2.0x3.0"/>
						<Org x="2.5" y="2.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="0" y="6.858"/>
							<Start x="-1.3975" y="6.224"/>
							<End x="1.3975" y="6.224"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0" y="1.524"/>
							<Dot x="0" y="-1.397"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.397" y="0"/>
							<Dot x="1.397" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Circle diameter="12.8016">
							<Center x="0" y="0"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Circle diameter="15.9512">
							<Center x="0" y="0"/>
						</Circle>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DRL_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd_M0.25x0.6"/>
						<Org x="-0.5" y="-0.7"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="smd_M0.25x0.6"/>
						<Org x="0" y="-0.7"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="smd_M0.25x0.6"/>
						<Org x="0.5" y="-0.7"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="smd_M0.25x0.6"/>
						<Org x="0.5" y="0.7"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="smd_M0.25x0.6"/>
						<Org x="-0.5" y="0.7"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.85" y="0.65"/>
							<Dot x="0.85" y="0.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.85" y="0.65"/>
							<Dot x="0.85" y="-0.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.85" y="-0.65"/>
							<Dot x="-0.85" y="-0.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.85" y="-0.65"/>
							<Dot x="-0.85" y="0.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Polygon>
							<Dot x="-0.5" y="-1.15"/>
							<Dot x="-0.85" y="-1.85"/>
							<Dot x="-0.15" y="-1.85"/>
						</Polygon>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SOT-89_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd30x50"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="3">
						<PadstackRef name="smd30x50"/>
						<Org x="1.397" y="0"/>
					</Pad>
					<Pad padNum="3" name="2">
						<PadstackRef name="smd30x50"/>
						<Org x="2.794" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="smd80x40"/>
						<Org x="1.397" y="3.81"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2032" y="-0.127"/>
							<Dot x="0.2032" y="-0.127"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.1938" y="-0.127"/>
							<Dot x="1.6002" y="-0.127"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.2032" y="-0.127"/>
							<Dot x="0.2032" y="0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2032" y="-0.127"/>
							<Dot x="-0.2032" y="0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.6002" y="-0.127"/>
							<Dot x="1.6002" y="0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.1938" y="-0.127"/>
							<Dot x="1.1938" y="0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.635" y="3.937"/>
							<Dot x="2.159" y="3.937"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.159" y="3.937"/>
							<Dot x="2.159" y="3.302"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.635" y="3.937"/>
							<Dot x="0.635" y="3.302"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5908" y="-0.127"/>
							<Dot x="2.9972" y="-0.127"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.9972" y="-0.127"/>
							<Dot x="2.9972" y="0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.5908" y="-0.127"/>
							<Dot x="2.5908" y="0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.889" y="3.302"/>
							<Dot x="-0.889" y="0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.683" y="0.889"/>
							<Dot x="3.683" y="3.302"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.889" y="0.889"/>
							<Dot x="3.683" y="0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.683" y="3.302"/>
							<Dot x="-0.889" y="3.302"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="1.397" y="2.286"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="JMP_OPEN_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd40x48"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="smd40x48"/>
						<Org x="1.524" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.762" y="-0.889"/>
							<Dot x="-0.762" y="0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.286" y="0.889"/>
							<Dot x="2.286" y="-0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.286" y="-0.889"/>
							<Dot x="-0.762" y="-0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.762" y="0.889"/>
							<Dot x="2.286" y="0.889"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0.762" y="0"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="LQFP-32_1">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="0" y="-0.8"/>
					</Pad>
					<Pad padNum="3" name="3" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="0" y="-1.6"/>
					</Pad>
					<Pad padNum="4" name="4" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="0" y="-2.4"/>
					</Pad>
					<Pad padNum="5" name="5" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="0" y="-3.2"/>
					</Pad>
					<Pad padNum="6" name="6" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="0" y="-4"/>
					</Pad>
					<Pad padNum="7" name="7" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="0" y="-4.8"/>
					</Pad>
					<Pad padNum="8" name="8" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="0" y="-5.6"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="1.5" y="-7.1"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="2.3" y="-7.1"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="3.1" y="-7.1"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="3.9" y="-7.1"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="4.7" y="-7.1"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="5.5" y="-7.1"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="6.3" y="-7.1"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="7.1" y="-7.1"/>
					</Pad>
					<Pad padNum="17" name="17" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="8.6" y="-5.6"/>
					</Pad>
					<Pad padNum="18" name="18" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="8.6" y="-4.8"/>
					</Pad>
					<Pad padNum="19" name="19" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="8.6" y="-4"/>
					</Pad>
					<Pad padNum="20" name="20" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="8.6" y="-3.2"/>
					</Pad>
					<Pad padNum="21" name="21" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="8.6" y="-2.4"/>
					</Pad>
					<Pad padNum="22" name="22" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="8.6" y="-1.6"/>
					</Pad>
					<Pad padNum="23" name="23" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="8.6" y="-0.8"/>
					</Pad>
					<Pad padNum="24" name="24" angle="90">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="8.6" y="0"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="7.1" y="1.5"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="6.3" y="1.5"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="5.5" y="1.5"/>
					</Pad>
					<Pad padNum="28" name="28">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="4.7" y="1.5"/>
					</Pad>
					<Pad padNum="29" name="29">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="3.9" y="1.5"/>
					</Pad>
					<Pad padNum="30" name="30">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="3.1" y="1.5"/>
					</Pad>
					<Pad padNum="31" name="31">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="2.3" y="1.5"/>
					</Pad>
					<Pad padNum="32" name="32">
						<PadstackRef name="smd_M0.5x1.0"/>
						<Org x="1.5" y="1.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="-5.45"/>
							<Dot x="-0.2" y="-5.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-5.45"/>
							<Dot x="-0.2" y="-5.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-5.75"/>
							<Dot x="0.8" y="-5.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="-4.65"/>
							<Dot x="-0.2" y="-4.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-4.65"/>
							<Dot x="-0.2" y="-4.95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-4.95"/>
							<Dot x="0.8" y="-4.95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="-3.85"/>
							<Dot x="-0.2" y="-3.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-3.85"/>
							<Dot x="-0.2" y="-4.15"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-4.15"/>
							<Dot x="0.8" y="-4.15"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="-3.05"/>
							<Dot x="-0.2" y="-3.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-3.05"/>
							<Dot x="-0.2" y="-3.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-3.35"/>
							<Dot x="0.8" y="-3.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.65" y="-6.3"/>
							<Dot x="1.65" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.65" y="-7.3"/>
							<Dot x="1.35" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.35" y="-7.3"/>
							<Dot x="1.35" y="-6.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.45" y="-6.3"/>
							<Dot x="2.45" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.45" y="-7.3"/>
							<Dot x="2.15" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.15" y="-7.3"/>
							<Dot x="2.15" y="-6.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.25" y="-6.3"/>
							<Dot x="3.25" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.25" y="-7.3"/>
							<Dot x="2.95" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.95" y="-7.3"/>
							<Dot x="2.95" y="-6.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.05" y="-6.3"/>
							<Dot x="4.05" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.05" y="-7.3"/>
							<Dot x="3.75" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.75" y="-7.3"/>
							<Dot x="3.75" y="-6.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="1.1" y="-6"/>
							<Start x="0.8" y="-6"/>
							<End x="1.1" y="-6.3"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="-0.65"/>
							<Dot x="-0.2" y="-0.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-0.65"/>
							<Dot x="-0.2" y="-0.95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-0.95"/>
							<Dot x="0.8" y="-0.95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="0.15"/>
							<Dot x="-0.2" y="0.15"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="0.15"/>
							<Dot x="-0.2" y="-0.15"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-0.15"/>
							<Dot x="0.8" y="-0.15"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="-1.45"/>
							<Dot x="-0.2" y="-1.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-1.45"/>
							<Dot x="-0.2" y="-1.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-1.75"/>
							<Dot x="0.8" y="-1.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="-2.25"/>
							<Dot x="-0.2" y="-2.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-2.25"/>
							<Dot x="-0.2" y="-2.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.2" y="-2.55"/>
							<Dot x="0.8" y="-2.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.15" y="0.7"/>
							<Dot x="2.15" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.15" y="1.7"/>
							<Dot x="2.45" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.45" y="1.7"/>
							<Dot x="2.45" y="0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.35" y="0.7"/>
							<Dot x="1.35" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.35" y="1.7"/>
							<Dot x="1.65" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.65" y="1.7"/>
							<Dot x="1.65" y="0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.95" y="0.7"/>
							<Dot x="2.95" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.95" y="1.7"/>
							<Dot x="3.25" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.25" y="1.7"/>
							<Dot x="3.25" y="0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.75" y="0.7"/>
							<Dot x="3.75" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.75" y="1.7"/>
							<Dot x="4.05" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.05" y="1.7"/>
							<Dot x="4.05" y="0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.2" y="0.7"/>
							<Dot x="0.8" y="0.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="-5.45"/>
							<Dot x="8.8" y="-5.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-5.45"/>
							<Dot x="8.8" y="-5.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-5.75"/>
							<Dot x="7.8" y="-5.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="-4.65"/>
							<Dot x="8.8" y="-4.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-4.65"/>
							<Dot x="8.8" y="-4.95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-4.95"/>
							<Dot x="7.8" y="-4.95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="-3.85"/>
							<Dot x="8.8" y="-3.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-3.85"/>
							<Dot x="8.8" y="-4.15"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-4.15"/>
							<Dot x="7.8" y="-4.15"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="-3.05"/>
							<Dot x="8.8" y="-3.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-3.05"/>
							<Dot x="8.8" y="-3.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-3.35"/>
							<Dot x="7.8" y="-3.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.45" y="-6.3"/>
							<Dot x="6.45" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.45" y="-7.3"/>
							<Dot x="6.15" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.15" y="-7.3"/>
							<Dot x="6.15" y="-6.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.25" y="-6.3"/>
							<Dot x="7.25" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.25" y="-7.3"/>
							<Dot x="6.95" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.95" y="-7.3"/>
							<Dot x="6.95" y="-6.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.65" y="-6.3"/>
							<Dot x="5.65" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.65" y="-7.3"/>
							<Dot x="5.35" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.35" y="-7.3"/>
							<Dot x="5.35" y="-6.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.85" y="-6.3"/>
							<Dot x="4.85" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.85" y="-7.3"/>
							<Dot x="4.55" y="-7.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.55" y="-7.3"/>
							<Dot x="4.55" y="-6.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="7.5" y="-6"/>
							<Start x="7.5" y="-6.3"/>
							<End x="7.8" y="-6"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="-0.65"/>
							<Dot x="8.8" y="-0.65"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-0.65"/>
							<Dot x="8.8" y="-0.95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-0.95"/>
							<Dot x="7.8" y="-0.95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="0.15"/>
							<Dot x="8.8" y="0.15"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="0.15"/>
							<Dot x="8.8" y="-0.15"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-0.15"/>
							<Dot x="7.8" y="-0.15"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="-1.45"/>
							<Dot x="8.8" y="-1.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-1.45"/>
							<Dot x="8.8" y="-1.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-1.75"/>
							<Dot x="7.8" y="-1.75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="-2.25"/>
							<Dot x="8.8" y="-2.25"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-2.25"/>
							<Dot x="8.8" y="-2.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.8" y="-2.55"/>
							<Dot x="7.8" y="-2.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.95" y="0.7"/>
							<Dot x="6.95" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.95" y="1.7"/>
							<Dot x="7.25" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.25" y="1.7"/>
							<Dot x="7.25" y="0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.15" y="0.7"/>
							<Dot x="6.15" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.15" y="1.7"/>
							<Dot x="6.45" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.45" y="1.7"/>
							<Dot x="6.45" y="0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.35" y="0.7"/>
							<Dot x="5.35" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.35" y="1.7"/>
							<Dot x="5.65" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.65" y="1.7"/>
							<Dot x="5.65" y="0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.55" y="0.7"/>
							<Dot x="4.55" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.55" y="1.7"/>
							<Dot x="4.85" y="1.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.051">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.85" y="1.7"/>
							<Dot x="4.85" y="0.7"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<ArcCCW>
							<Center x="7.5" y="0.4"/>
							<Start x="7.8" y="0.4"/>
							<End x="7.5" y="0.7"/>
						</ArcCCW>
					</Detail>
					<Detail lineWidth="0.05">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="0.3"/>
							<Dot x="0.8" y="-6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.05">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.8" y="0.4"/>
							<Dot x="7.8" y="-6"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.05">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.5" y="-6.3"/>
							<Dot x="1.1" y="-6.3"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.05">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.5" y="0.7"/>
							<Dot x="1.2" y="0.7"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="4.3" y="-2.8"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="PSSOP-28 (0.65MM)_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="0.65" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="1.3" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="1.95" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="2.6" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="3.25" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="3.9" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="4.55" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="5.2" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="5.85" y="0"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="6.5" y="0"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="7.15" y="0"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="7.8" y="0"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="8.45" y="0"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="8.45" y="7.5"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="7.8" y="7.5"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="7.15" y="7.5"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="6.5" y="7.5"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="5.85" y="7.5"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="5.2" y="7.5"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="4.55" y="7.5"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="3.9" y="7.5"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="3.25" y="7.5"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="2.6" y="7.5"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="1.95" y="7.5"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="1.3" y="7.5"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="0.65" y="7.5"/>
					</Pad>
					<Pad padNum="28" name="28">
						<PadstackRef name="smd_M0.42x1.25"/>
						<Org x="0" y="7.5"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.75" y="1.05"/>
							<Dot x="2.75" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.75" y="-0.35"/>
							<Dot x="2.45" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.45" y="-0.35"/>
							<Dot x="2.45" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.75" y="-0.05"/>
							<Dot x="2.45" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1" y="1.05"/>
							<Dot x="2.1" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1" y="-0.35"/>
							<Dot x="1.8" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.8" y="-0.35"/>
							<Dot x="1.8" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1" y="-0.05"/>
							<Dot x="1.8" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.45" y="1.05"/>
							<Dot x="1.45" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.45" y="-0.35"/>
							<Dot x="1.15" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.15" y="-0.35"/>
							<Dot x="1.15" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.45" y="-0.05"/>
							<Dot x="1.15" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="1.05"/>
							<Dot x="0.8" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="-0.35"/>
							<Dot x="0.5" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.5" y="-0.35"/>
							<Dot x="0.5" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="-0.05"/>
							<Dot x="0.5" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.15" y="1.05"/>
							<Dot x="0.15" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.15" y="-0.35"/>
							<Dot x="-0.15" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.15" y="-0.35"/>
							<Dot x="-0.15" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.15" y="-0.05"/>
							<Dot x="-0.15" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.275" y="1.975"/>
							<Dot x="0" y="1.475"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0" y="1.475"/>
							<Dot x="-0.275" y="1.975"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.275" y="1.975"/>
							<Dot x="0.275" y="1.975"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.05" y="-0.35"/>
							<Dot x="5.05" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.7" y="1.05"/>
							<Dot x="4.7" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.7" y="-0.35"/>
							<Dot x="4.4" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.4" y="-0.35"/>
							<Dot x="4.4" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.7" y="-0.05"/>
							<Dot x="4.4" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.05" y="1.05"/>
							<Dot x="4.05" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.05" y="-0.35"/>
							<Dot x="3.75" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.75" y="-0.35"/>
							<Dot x="3.75" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.05" y="-0.05"/>
							<Dot x="3.75" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="1.05"/>
							<Dot x="3.4" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="-0.35"/>
							<Dot x="3.1" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.1" y="-0.35"/>
							<Dot x="3.1" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="-0.05"/>
							<Dot x="3.1" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="1.05"/>
							<Dot x="3.4" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="-0.35"/>
							<Dot x="3.1" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.1" y="-0.35"/>
							<Dot x="3.1" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="-0.05"/>
							<Dot x="3.1" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.15" y="6.45"/>
							<Dot x="-0.15" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.15" y="7.85"/>
							<Dot x="0.15" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.15" y="7.85"/>
							<Dot x="0.15" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.15" y="7.55"/>
							<Dot x="0.15" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.5" y="6.45"/>
							<Dot x="0.5" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.5" y="7.85"/>
							<Dot x="0.8" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.8" y="7.85"/>
							<Dot x="0.8" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.5" y="7.55"/>
							<Dot x="0.8" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.15" y="6.45"/>
							<Dot x="1.15" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.15" y="7.85"/>
							<Dot x="1.45" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.45" y="7.85"/>
							<Dot x="1.45" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.15" y="7.55"/>
							<Dot x="1.45" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.15" y="6.45"/>
							<Dot x="1.15" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.15" y="7.85"/>
							<Dot x="1.45" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.45" y="7.85"/>
							<Dot x="1.45" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.15" y="7.55"/>
							<Dot x="1.45" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.8" y="6.45"/>
							<Dot x="1.8" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.8" y="7.85"/>
							<Dot x="2.1" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.1" y="7.85"/>
							<Dot x="2.1" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.8" y="7.55"/>
							<Dot x="2.1" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.45" y="6.45"/>
							<Dot x="2.45" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.45" y="7.85"/>
							<Dot x="2.75" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.75" y="7.85"/>
							<Dot x="2.75" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.45" y="7.55"/>
							<Dot x="2.75" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.05" y="6.45"/>
							<Dot x="5.05" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.1" y="6.45"/>
							<Dot x="3.1" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.1" y="7.85"/>
							<Dot x="3.4" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.4" y="7.85"/>
							<Dot x="3.4" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.1" y="7.55"/>
							<Dot x="3.4" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.75" y="6.45"/>
							<Dot x="3.75" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.75" y="7.85"/>
							<Dot x="4.05" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.05" y="7.85"/>
							<Dot x="4.05" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.75" y="7.55"/>
							<Dot x="4.05" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.4" y="6.45"/>
							<Dot x="4.4" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.4" y="7.85"/>
							<Dot x="4.7" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.7" y="7.85"/>
							<Dot x="4.7" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.4" y="7.55"/>
							<Dot x="4.7" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.6" y="1.05"/>
							<Dot x="8.6" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.6" y="-0.35"/>
							<Dot x="8.3" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.3" y="-0.35"/>
							<Dot x="8.3" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.6" y="-0.05"/>
							<Dot x="8.3" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6" y="1.05"/>
							<Dot x="6" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6" y="-0.35"/>
							<Dot x="5.7" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.7" y="-0.35"/>
							<Dot x="5.7" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6" y="-0.05"/>
							<Dot x="5.7" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.35" y="1.05"/>
							<Dot x="5.35" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.95" y="1.05"/>
							<Dot x="7.95" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.95" y="-0.35"/>
							<Dot x="7.65" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.65" y="-0.35"/>
							<Dot x="7.65" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.95" y="-0.05"/>
							<Dot x="7.65" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.3" y="1.05"/>
							<Dot x="7.3" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.3" y="-0.35"/>
							<Dot x="7" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7" y="-0.35"/>
							<Dot x="7" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.3" y="-0.05"/>
							<Dot x="7" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.65" y="1.05"/>
							<Dot x="6.65" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.65" y="-0.35"/>
							<Dot x="6.35" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="-0.35"/>
							<Dot x="6.35" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.65" y="-0.05"/>
							<Dot x="6.35" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.35" y="7.85"/>
							<Dot x="5.35" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.7" y="6.45"/>
							<Dot x="5.7" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.7" y="7.85"/>
							<Dot x="6" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6" y="7.85"/>
							<Dot x="6" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.7" y="7.55"/>
							<Dot x="6" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="6.45"/>
							<Dot x="6.35" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="7.85"/>
							<Dot x="6.65" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.65" y="7.85"/>
							<Dot x="6.65" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="7.55"/>
							<Dot x="6.65" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7" y="6.45"/>
							<Dot x="7" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7" y="7.85"/>
							<Dot x="7.3" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.3" y="7.85"/>
							<Dot x="7.3" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7" y="7.55"/>
							<Dot x="7.3" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.65" y="6.45"/>
							<Dot x="7.65" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.65" y="7.85"/>
							<Dot x="7.95" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.95" y="7.85"/>
							<Dot x="7.95" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.65" y="7.55"/>
							<Dot x="7.95" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.65" y="6.45"/>
							<Dot x="7.65" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.65" y="7.85"/>
							<Dot x="7.95" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.95" y="7.85"/>
							<Dot x="7.95" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.65" y="7.55"/>
							<Dot x="7.95" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.3" y="6.45"/>
							<Dot x="8.3" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.3" y="7.85"/>
							<Dot x="8.6" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.6" y="7.85"/>
							<Dot x="8.6" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.3" y="7.55"/>
							<Dot x="8.6" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.975" y="1.05"/>
							<Dot x="-0.975" y="6.45"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="9.425" y="6.45"/>
							<Dot x="9.425" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.35" y="-0.35"/>
							<Dot x="5.05" y="-0.35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.35" y="-0.05"/>
							<Dot x="5.05" y="-0.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.05" y="7.85"/>
							<Dot x="5.35" y="7.85"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="5.05" y="7.55"/>
							<Dot x="5.35" y="7.55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="9.425" y="1.05"/>
							<Dot x="-0.975" y="1.05"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.975" y="6.45"/>
							<Dot x="9.425" y="6.45"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="4.225" y="3.75"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="PBS2-5_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="SQ0.8x1.5"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="2.032" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="4.064" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="6.096" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="C0.8x1.5"/>
						<Org x="8.128" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.016" y="-1.016"/>
							<Dot x="-1.016" y="1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="9.144" y="1.016"/>
							<Dot x="9.144" y="-1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.016" y="1.016"/>
							<Dot x="9.144" y="1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="9.144" y="-1.016"/>
							<Dot x="-1.016" y="-1.016"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="4.064" y="2.032"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SO-20_1">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="0" y="-1.27"/>
					</Pad>
					<Pad padNum="3" name="3" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="4" name="4" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="0" y="-3.81"/>
					</Pad>
					<Pad padNum="5" name="5" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="0" y="-5.08"/>
					</Pad>
					<Pad padNum="6" name="6" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="0" y="-6.35"/>
					</Pad>
					<Pad padNum="7" name="7" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="0" y="-7.62"/>
					</Pad>
					<Pad padNum="8" name="8" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="0" y="-8.89"/>
					</Pad>
					<Pad padNum="9" name="9" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="0" y="-10.16"/>
					</Pad>
					<Pad padNum="10" name="10" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="0" y="-11.43"/>
					</Pad>
					<Pad padNum="11" name="11" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="9.906" y="-11.43"/>
					</Pad>
					<Pad padNum="12" name="12" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="9.906" y="-10.16"/>
					</Pad>
					<Pad padNum="13" name="13" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="9.906" y="-8.89"/>
					</Pad>
					<Pad padNum="14" name="14" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="9.906" y="-7.62"/>
					</Pad>
					<Pad padNum="15" name="15" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="9.906" y="-6.35"/>
					</Pad>
					<Pad padNum="16" name="16" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="9.906" y="-5.08"/>
					</Pad>
					<Pad padNum="17" name="17" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="9.906" y="-3.81"/>
					</Pad>
					<Pad padNum="18" name="18" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="9.906" y="-2.54"/>
					</Pad>
					<Pad padNum="19" name="19" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="9.906" y="-1.27"/>
					</Pad>
					<Pad padNum="20" name="20" angle="90">
						<PadstackRef name="smd60x30 [1]"/>
						<Org x="9.906" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.381" y="-11.684"/>
							<Dot x="1.143" y="-11.684"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.143" y="0.254"/>
							<Dot x="-0.381" y="0.254"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="2.159" y="-0.381"/>
							<Dot x="3.048" y="-0.889"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.048" y="0.127"/>
							<Dot x="2.159" y="-0.381"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="3.048" y="-0.889"/>
							<Dot x="3.048" y="0.127"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="10.287" y="-11.684"/>
							<Dot x="8.763" y="-11.684"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.763" y="0.254"/>
							<Dot x="10.287" y="0.254"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.143" y="-12.065"/>
							<Dot x="1.143" y="0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.381" y="0.254"/>
							<Dot x="-0.381" y="-11.684"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.651" y="0.635"/>
							<Dot x="1.651" y="-12.065"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.763" y="0.635"/>
							<Dot x="8.763" y="-12.065"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="10.287" y="0.254"/>
							<Dot x="10.287" y="-11.684"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.763" y="-12.065"/>
							<Dot x="1.143" y="-12.065"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.143" y="0.635"/>
							<Dot x="8.763" y="0.635"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" angle="270">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="4.953" y="-5.715"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="SO-8_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="smd60x30"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="smd60x30"/>
						<Org x="0" y="-1.27"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="smd60x30"/>
						<Org x="0" y="-2.54"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="smd60x30"/>
						<Org x="0" y="-3.81"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="smd60x30"/>
						<Org x="5.842" y="-3.81"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="smd60x30"/>
						<Org x="5.842" y="-2.54"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="smd60x30"/>
						<Org x="5.842" y="-1.27"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="smd60x30"/>
						<Org x="5.842" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.508" y="-2.794"/>
							<Dot x="0.889" y="-2.794"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.889" y="-3.556"/>
							<Dot x="-0.508" y="-3.556"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.508" y="-3.556"/>
							<Dot x="-0.508" y="-4.064"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.508" y="-4.064"/>
							<Dot x="0.889" y="-4.064"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.889" y="0.254"/>
							<Dot x="-0.508" y="0.254"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.508" y="0.254"/>
							<Dot x="-0.508" y="-0.254"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.508" y="-0.254"/>
							<Dot x="0.889" y="-0.254"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.889" y="-1.016"/>
							<Dot x="-0.508" y="-1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.508" y="-1.016"/>
							<Dot x="-0.508" y="-1.524"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.508" y="-1.524"/>
							<Dot x="0.889" y="-1.524"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.889" y="-2.286"/>
							<Dot x="-0.508" y="-2.286"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.27" y="-0.127"/>
							<Dot x="1.778" y="0.254"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.778" y="0.254"/>
							<Dot x="1.778" y="-0.508"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="1.778" y="-0.508"/>
							<Dot x="1.27" y="-0.127"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.953" y="-2.794"/>
							<Dot x="6.35" y="-2.794"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.953" y="-4.064"/>
							<Dot x="6.35" y="-4.064"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="-4.064"/>
							<Dot x="6.35" y="-3.556"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="-3.556"/>
							<Dot x="4.953" y="-3.556"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.953" y="-0.254"/>
							<Dot x="6.35" y="-0.254"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="-0.254"/>
							<Dot x="6.35" y="0.254"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="0.254"/>
							<Dot x="4.953" y="0.254"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.953" y="-1.524"/>
							<Dot x="6.35" y="-1.524"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="-1.524"/>
							<Dot x="6.35" y="-1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="-1.016"/>
							<Dot x="4.953" y="-1.016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="-2.286"/>
							<Dot x="4.953" y="-2.286"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.889" y="-4.445"/>
							<Dot x="0.889" y="0.635"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.508" y="-2.286"/>
							<Dot x="-0.508" y="-2.794"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.953" y="0.635"/>
							<Dot x="4.953" y="-4.445"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0508">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="6.35" y="-2.794"/>
							<Dot x="6.35" y="-2.286"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="4.953" y="-4.445"/>
							<Dot x="0.889" y="-4.445"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.127">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="0.889" y="0.635"/>
							<Dot x="4.953" y="0.635"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes" angle="90">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="2.794" y="-1.905"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="PBS-4_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="C1.0x1.6"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="C1.0x1.6"/>
						<Org x="2.54" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="C1.0x1.6"/>
						<Org x="5.08" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="C1.0x1.6"/>
						<Org x="7.62" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.27" y="-1.27"/>
							<Dot x="-1.27" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.89" y="1.27"/>
							<Dot x="8.89" y="-1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.27" y="1.27"/>
							<Dot x="8.89" y="1.27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.0254">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="8.89" y="-1.27"/>
							<Dot x="-1.27" y="-1.27"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="RefDes">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="2.286" y="2.032"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
				</Labels>
			</Footprint>
		</Footprints>
		<Components>
			<Component name="PLT164-RL2G_1">
				<Pins>
					<Pin pinNum="1" name="3" pinSymName="3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="4" pinSymName="4" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="PLT164-R"/>
					<Attribute name="PCADIO_sourceLibrary" value="CONNECTORS.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="XP"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="PLT164-RL2G"/>
				</Attributes>
			</Component>
			<Component name="CE CHIP 3528 10.0/20V_1">
				<Pins>
					<Pin pinNum="1" name="2" pinSymName="MINUS" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="1" pinSymName="PLUS" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="C3528"/>
					<Attribute name="PCADIO_sourceLibrary" value="CAPACITORS.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="C"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="CE CHIP 3528 10.0/20V"/>
				</Attributes>
			</Component>
			<Component name="P1-12 0805_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="0805"/>
					<Attribute name="PCADIO_sourceLibrary" value="RESISTORS.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="R"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="P1-12 0805"/>
				</Attributes>
			</Component>
			<Component name="TPD2E2U06_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="NC" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="4" pinSymName="GND" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="2" pinSymName="NC" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="3" pinSymName="IO1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="IO2" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="DRL"/>
					<Attribute name="PCADIO_sourceLibrary" value="EMI.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="Z"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="TPD2E2U06"/>
				</Attributes>
			</Component>
			<Component name="IRF7341_1">
				<Pins>
					<Pin pinNum="1" name="4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="6" pinEqual="2" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="7" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="8" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="5" pinEqual="2" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SO-8"/>
					<Attribute name="PCADIO_sourceLibrary" value="TRANSISTORS.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="VT"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="IRF7341"/>
				</Attributes>
			</Component>
			<Component name="STM32F031K6T_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="VDD" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="PF0" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="3" pinSymName="PF1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="4" pinSymName="NRST" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="5" pinSymName="VDDA" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="6" pinSymName="PA0" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="7" pinSymName="PA1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="8" pinSymName="PA2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="9" pinSymName="PA3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="10" pinSymName="PA4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="11" pinSymName="PA5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="12" pinSymName="PA6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="13" pinSymName="PA7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="14" pinSymName="PB0" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="15" pinSymName="PB1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="16" pinSymName="VSS" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="17" pinSymName="VDD" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="18" pinSymName="PA8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="19" pinSymName="PA9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="20" pinSymName="PA10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="21" pinSymName="PA11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="22" pinSymName="PA12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="23" pinSymName="PA13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="24" pinSymName="PA14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="25" pinSymName="PA15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="26" pinSymName="PB3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="27" pinSymName="PB4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="28" pinSymName="PB5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="29" pinSymName="PB6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="30" pinSymName="PB7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="31" pinSymName="BOOT0" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="32" pinSymName="VSS" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="LQFP-32"/>
					<Attribute name="PCADIO_sourceLibrary" value="DIGITAL.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="DD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="STM32F031K6T"/>
				</Attributes>
			</Component>
			<Component name="FT232RL_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="TXD" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="DTR#" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="RTS#" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="VCCIO" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="RXD" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="RI#" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="GND" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinEqual="0" gate="0" gateEqual="1"/>
					<Pin pinNum="9" name="9" pinSymName="DSR#" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="10" pinSymName="DCD#" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="11" pinSymName="CTS#" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="12" pinSymName="CBUS4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="13" pinSymName="CBUS2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="14" pinSymName="CBUS3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="15" name="15" pinSymName="USBDP" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="16" name="16" pinSymName="USBDM" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="17" name="17" pinSymName="3V3OUT" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="18" name="18" pinSymName="GND" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="19" name="19" pinSymName="RES#" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="20" name="20" pinSymName="VCC" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="21" name="21" pinSymName="GND" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="22" name="22" pinSymName="CBUS1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="23" name="23" pinSymName="CBUS0" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="24" name="24" pinEqual="0" gate="0" gateEqual="1"/>
					<Pin pinNum="25" name="25" pinSymName="AGND" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="26" name="26" pinSymName="TEST" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="27" name="27" pinSymName="OSCI" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="28" name="28" pinSymName="OSCO" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="PSSOP-28 (0.65MM)"/>
					<Attribute name="PCADIO_sourceLibrary" value="DIGITAL.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="DD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="FT232RL"/>
				</Attributes>
			</Component>
			<Component name="BZG03XX_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="Anod" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="Katod" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="DO-214AC"/>
					<Attribute name="PCADIO_sourceLibrary" value="DIODES.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="VD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="BZG03XX"/>
				</Attributes>
			</Component>
			<Component name="L79L05AB_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="COM" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="3" pinSymName="IN" pinEqual="2" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="2" pinSymName="OUT" pinEqual="3" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinEqual="0" gate="0" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SOT-89"/>
					<Attribute name="PCADIO_sourceLibrary" value="ANALOG.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="DA"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="L79L05AB"/>
				</Attributes>
			</Component>
			<Component name="C0805_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="0805"/>
					<Attribute name="PCADIO_sourceLibrary" value="CAPACITORS.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="C"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="C0805"/>
				</Attributes>
			</Component>
			<Component name="IM03CGR_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="W1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="Con1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="C1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="Coff1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="Coff2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="C2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="Con2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="W2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="IM03CGR"/>
					<Attribute name="PCADIO_sourceLibrary" value="RELAY.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="KA"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="IM03CGR"/>
				</Attributes>
			</Component>
			<Component name="SL-62-PCB_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="A1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="C1" pinEqual="2" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="A2" pinEqual="3" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="C2" pinEqual="4" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="A3" pinEqual="5" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="C3" pinEqual="6" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="A4" pinEqual="7" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="C4" pinEqual="8" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="9" pinSymName="A5" pinEqual="9" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="10" pinSymName="C5" pinEqual="10" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="11" pinSymName="A6" pinEqual="11" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="12" pinSymName="C6" pinEqual="12" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="13" pinSymName="A7" pinEqual="13" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="14" pinSymName="C7" pinEqual="14" gate="1" gateEqual="1"/>
					<Pin pinNum="15" name="15" pinSymName="A8" pinEqual="15" gate="1" gateEqual="1"/>
					<Pin pinNum="16" name="16" pinSymName="C8" pinEqual="16" gate="1" gateEqual="1"/>
					<Pin pinNum="17" name="17" pinSymName="A9" pinEqual="17" gate="1" gateEqual="1"/>
					<Pin pinNum="18" name="18" pinSymName="C9" pinEqual="18" gate="1" gateEqual="1"/>
					<Pin pinNum="19" name="19" pinSymName="A10" pinEqual="19" gate="1" gateEqual="1"/>
					<Pin pinNum="20" name="20" pinSymName="C10" pinEqual="20" gate="1" gateEqual="1"/>
					<Pin pinNum="21" name="21" pinSymName="A11" pinEqual="21" gate="1" gateEqual="1"/>
					<Pin pinNum="22" name="22" pinSymName="C11" pinEqual="22" gate="1" gateEqual="1"/>
					<Pin pinNum="23" name="23" pinSymName="A12" pinEqual="23" gate="1" gateEqual="1"/>
					<Pin pinNum="24" name="24" pinSymName="C12" pinEqual="24" gate="1" gateEqual="1"/>
					<Pin pinNum="25" name="25" pinSymName="A13" pinEqual="25" gate="1" gateEqual="1"/>
					<Pin pinNum="26" name="26" pinSymName="C13" pinEqual="26" gate="1" gateEqual="1"/>
					<Pin pinNum="27" name="27" pinSymName="A14" pinEqual="27" gate="1" gateEqual="1"/>
					<Pin pinNum="28" name="28" pinSymName="C14" pinEqual="28" gate="1" gateEqual="1"/>
					<Pin pinNum="29" name="29" pinSymName="A15" pinEqual="29" gate="1" gateEqual="1"/>
					<Pin pinNum="30" name="30" pinSymName="C15" pinEqual="30" gate="1" gateEqual="1"/>
					<Pin pinNum="31" name="31" pinSymName="A16" pinEqual="31" gate="1" gateEqual="1"/>
					<Pin pinNum="32" name="32" pinSymName="C16" pinEqual="32" gate="1" gateEqual="1"/>
					<Pin pinNum="33" name="33" pinSymName="A17" pinEqual="33" gate="1" gateEqual="1"/>
					<Pin pinNum="34" name="34" pinSymName="C17" pinEqual="34" gate="1" gateEqual="1"/>
					<Pin pinNum="35" name="35" pinSymName="A18" pinEqual="35" gate="1" gateEqual="1"/>
					<Pin pinNum="36" name="36" pinSymName="C18" pinEqual="36" gate="1" gateEqual="1"/>
					<Pin pinNum="37" name="37" pinSymName="A19" pinEqual="37" gate="1" gateEqual="1"/>
					<Pin pinNum="38" name="38" pinSymName="C19" pinEqual="38" gate="1" gateEqual="1"/>
					<Pin pinNum="39" name="39" pinSymName="A20" pinEqual="39" gate="1" gateEqual="1"/>
					<Pin pinNum="40" name="40" pinSymName="C20" pinEqual="40" gate="1" gateEqual="1"/>
					<Pin pinNum="41" name="41" pinSymName="A21" pinEqual="41" gate="1" gateEqual="1"/>
					<Pin pinNum="42" name="42" pinSymName="C21" pinEqual="42" gate="1" gateEqual="1"/>
					<Pin pinNum="43" name="43" pinSymName="A22" pinEqual="43" gate="1" gateEqual="1"/>
					<Pin pinNum="44" name="44" pinSymName="C22" pinEqual="44" gate="1" gateEqual="1"/>
					<Pin pinNum="45" name="45" pinSymName="A23" pinEqual="45" gate="1" gateEqual="1"/>
					<Pin pinNum="46" name="46" pinSymName="C23" pinEqual="46" gate="1" gateEqual="1"/>
					<Pin pinNum="47" name="47" pinSymName="A24" pinEqual="47" gate="1" gateEqual="1"/>
					<Pin pinNum="48" name="48" pinSymName="C24" pinEqual="48" gate="1" gateEqual="1"/>
					<Pin pinNum="49" name="49" pinSymName="A25" pinEqual="49" gate="1" gateEqual="1"/>
					<Pin pinNum="50" name="50" pinSymName="C25" pinEqual="50" gate="1" gateEqual="1"/>
					<Pin pinNum="51" name="51" pinSymName="A26" pinEqual="51" gate="1" gateEqual="1"/>
					<Pin pinNum="52" name="52" pinSymName="C26" pinEqual="52" gate="1" gateEqual="1"/>
					<Pin pinNum="53" name="53" pinSymName="A27" pinEqual="53" gate="1" gateEqual="1"/>
					<Pin pinNum="54" name="54" pinSymName="C27" pinEqual="54" gate="1" gateEqual="1"/>
					<Pin pinNum="55" name="55" pinSymName="A28" pinEqual="55" gate="1" gateEqual="1"/>
					<Pin pinNum="56" name="56" pinSymName="C28" pinEqual="56" gate="1" gateEqual="1"/>
					<Pin pinNum="57" name="57" pinSymName="A29" pinEqual="57" gate="1" gateEqual="1"/>
					<Pin pinNum="58" name="58" pinSymName="C29" pinEqual="58" gate="1" gateEqual="1"/>
					<Pin pinNum="59" name="59" pinSymName="A30" pinEqual="59" gate="1" gateEqual="1"/>
					<Pin pinNum="60" name="60" pinSymName="C30" pinEqual="60" gate="1" gateEqual="1"/>
					<Pin pinNum="61" name="61" pinSymName="A31" pinEqual="61" gate="1" gateEqual="1"/>
					<Pin pinNum="62" name="62" pinSymName="C31" pinEqual="62" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SL-62-PCB"/>
					<Attribute name="PCADIO_sourceLibrary" value="MY.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="XP"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="SL-62-PCB"/>
				</Attributes>
			</Component>
			<Component name="JMP_CLOSE_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="JMP_CLOSE"/>
					<Attribute name="PCADIO_sourceLibrary" value="SWITCHERS.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="J"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="JMP_CLOSE"/>
				</Attributes>
			</Component>
			<Component name="JMP_OPEN_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="JMP_OPEN"/>
					<Attribute name="PCADIO_sourceLibrary" value="SWITCHERS.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="J"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="JMP_OPEN"/>
				</Attributes>
			</Component>
			<Component name="R0805_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="0805"/>
					<Attribute name="PCADIO_sourceLibrary" value="RESISTORS.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="R"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="R0805"/>
				</Attributes>
			</Component>
			<Component name="PBS2-5_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="4" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="5" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="PBS2-5"/>
					<Attribute name="PCADIO_sourceLibrary" value="CONNECTORS.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="XS"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="PBS2-5"/>
				</Attributes>
			</Component>
			<Component name="ADUM3211_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="VDD1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="VOA" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="VIB" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="GND1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="GND2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="VOB" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="VIA" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="VDD2" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SO-8"/>
					<Attribute name="PCADIO_sourceLibrary" value="DIGITAL.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="DD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="ADUM3211"/>
				</Attributes>
			</Component>
			<Component name="DL4148_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="Anod" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="Katod" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SOD-80"/>
					<Attribute name="PCADIO_sourceLibrary" value="DIODES.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="VD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="DL4148"/>
				</Attributes>
			</Component>
			<Component name="1141СПХХ_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="IN" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="COM" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="OUT" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="TO-92-1"/>
					<Attribute name="PCADIO_sourceLibrary" value="ANALOG.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="DA"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="1141СПХХ"/>
				</Attributes>
			</Component>
			<Component name="74AC273SC_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="~MR" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="Q0" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="D0" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="D1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="5" name="5" pinSymName="Q1" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="6" name="6" pinSymName="Q2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="7" name="7" pinSymName="D2" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="8" name="8" pinSymName="D3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="9" name="9" pinSymName="Q3" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="10" name="10" pinSymName="GND" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="11" name="11" pinSymName="CP" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="12" name="12" pinSymName="Q4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="13" name="13" pinSymName="D4" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="14" name="14" pinSymName="D5" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="15" name="15" pinSymName="Q5" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="16" name="16" pinSymName="Q6" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="17" name="17" pinSymName="D6" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="18" name="18" pinSymName="D7" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="19" name="19" pinSymName="Q7" pinEqual="0" gate="1" gateEqual="1"/>
					<Pin pinNum="20" name="20" pinSymName="VCC" pinEqual="0" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="SO-20"/>
					<Attribute name="PCADIO_sourceLibrary" value="DIGITAL.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="DD"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="74AC273SC"/>
				</Attributes>
			</Component>
			<Component name="EMI BMB0805_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="0805"/>
					<Attribute name="PCADIO_sourceLibrary" value="EMI.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="Z"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="EMI BMB0805"/>
				</Attributes>
			</Component>
			<Component name="PBS-4_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="3" name="3" pinSymName="3" pinEqual="1" gate="1" gateEqual="1"/>
					<Pin pinNum="4" name="4" pinSymName="4" pinEqual="1" gate="1" gateEqual="1"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="PBS-4"/>
					<Attribute name="PCADIO_sourceLibrary" value="CONNECTORS.LIB"/>
					<Attribute name="PCADIO_refDesPrefix" value="XS"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="PBS-4"/>
				</Attributes>
			</Component>
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="PLT164-RL2G_1"/>
				<FootprintRef name="PLT164-R_1"/>
				<Pinpack pinNum="2" padNum="1"/>
				<Pinpack pinNum="4" padNum="2"/>
				<Pinpack pinNum="1" padNum="3"/>
				<Pinpack pinNum="3" padNum="4"/>
			</Package>
			<Package>
				<ComponentRef name="CE CHIP 3528 10.0/20V_1"/>
				<FootprintRef name="C3528_1"/>
				<Pinpack pinNum="2" padNum="1"/>
				<Pinpack pinNum="1" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="P1-12 0805_1"/>
				<FootprintRef name="0805_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="P1-12 0805_1"/>
				<FootprintRef name="0805_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="TPD2E2U06_1"/>
				<FootprintRef name="DRL_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="3" padNum="2"/>
				<Pinpack pinNum="4" padNum="3"/>
				<Pinpack pinNum="2" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
			</Package>
			<Package>
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Pinpack pinNum="2" padNum="1"/>
				<Pinpack pinNum="3" padNum="2"/>
				<Pinpack pinNum="7" padNum="3"/>
				<Pinpack pinNum="1" padNum="4"/>
				<Pinpack pinNum="8" padNum="5"/>
				<Pinpack pinNum="4" padNum="6"/>
				<Pinpack pinNum="5" padNum="7"/>
				<Pinpack pinNum="6" padNum="8"/>
			</Package>
			<Package>
				<ComponentRef name="STM32F031K6T_1"/>
				<FootprintRef name="LQFP-32_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="FT232RL_1"/>
				<FootprintRef name="PSSOP-28 (0.65MM)_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="BZG03XX_1"/>
				<FootprintRef name="DO-214AC_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="L79L05AB_1"/>
				<FootprintRef name="SOT-89_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
			</Package>
			<Package>
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="IM03CGR_1"/>
				<FootprintRef name="IM03CGR_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
			</Package>
			<Package>
				<ComponentRef name="SL-62-PCB_1"/>
				<FootprintRef name="SL-62-PCB_1_Primary"/>
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
				<Pinpack pinNum="41" padNum="41"/>
				<Pinpack pinNum="42" padNum="42"/>
				<Pinpack pinNum="43" padNum="43"/>
				<Pinpack pinNum="44" padNum="44"/>
				<Pinpack pinNum="45" padNum="45"/>
				<Pinpack pinNum="46" padNum="46"/>
				<Pinpack pinNum="47" padNum="47"/>
				<Pinpack pinNum="48" padNum="48"/>
				<Pinpack pinNum="49" padNum="49"/>
				<Pinpack pinNum="50" padNum="50"/>
				<Pinpack pinNum="51" padNum="51"/>
				<Pinpack pinNum="52" padNum="52"/>
				<Pinpack pinNum="53" padNum="53"/>
				<Pinpack pinNum="54" padNum="54"/>
				<Pinpack pinNum="55" padNum="55"/>
				<Pinpack pinNum="56" padNum="56"/>
				<Pinpack pinNum="57" padNum="57"/>
				<Pinpack pinNum="58" padNum="58"/>
				<Pinpack pinNum="59" padNum="59"/>
				<Pinpack pinNum="60" padNum="60"/>
				<Pinpack pinNum="61" padNum="61"/>
				<Pinpack pinNum="62" padNum="62"/>
			</Package>
			<Package>
				<ComponentRef name="SL-62-PCB_1"/>
				<FootprintRef name="SL-62-PCB_1_Secondary"/>
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
				<Pinpack pinNum="41" padNum="41"/>
				<Pinpack pinNum="42" padNum="42"/>
				<Pinpack pinNum="43" padNum="43"/>
				<Pinpack pinNum="44" padNum="44"/>
				<Pinpack pinNum="45" padNum="45"/>
				<Pinpack pinNum="46" padNum="46"/>
				<Pinpack pinNum="47" padNum="47"/>
				<Pinpack pinNum="48" padNum="48"/>
				<Pinpack pinNum="49" padNum="49"/>
				<Pinpack pinNum="50" padNum="50"/>
				<Pinpack pinNum="51" padNum="51"/>
				<Pinpack pinNum="52" padNum="52"/>
				<Pinpack pinNum="53" padNum="53"/>
				<Pinpack pinNum="54" padNum="54"/>
				<Pinpack pinNum="55" padNum="55"/>
				<Pinpack pinNum="56" padNum="56"/>
				<Pinpack pinNum="57" padNum="57"/>
				<Pinpack pinNum="58" padNum="58"/>
				<Pinpack pinNum="59" padNum="59"/>
				<Pinpack pinNum="60" padNum="60"/>
				<Pinpack pinNum="61" padNum="61"/>
				<Pinpack pinNum="62" padNum="62"/>
			</Package>
			<Package>
				<ComponentRef name="JMP_CLOSE_1"/>
				<FootprintRef name="JMP_CLOSE_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="JMP_OPEN_1"/>
				<FootprintRef name="JMP_OPEN_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="PBS2-5_1"/>
				<FootprintRef name="PBS2-5_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
			</Package>
			<Package>
				<ComponentRef name="ADUM3211_1"/>
				<FootprintRef name="SO-8_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
			</Package>
			<Package>
				<ComponentRef name="DL4148_1"/>
				<FootprintRef name="SOD-80_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="1141СПХХ_1"/>
				<FootprintRef name="TO-92-1_1_Primary"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="1141СПХХ_1"/>
				<FootprintRef name="TO-92-1_1_TO-92L2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="1141СПХХ_1"/>
				<FootprintRef name="TO-92-1_1_T0-92L1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
			</Package>
			<Package>
				<ComponentRef name="74AC273SC_1"/>
				<FootprintRef name="SO-20_1"/>
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
			</Package>
			<Package>
				<ComponentRef name="EMI BMB0805_1"/>
				<FootprintRef name="0805_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="EMI BMB0805_1"/>
				<FootprintRef name="0805_2"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="PBS-4_1"/>
				<FootprintRef name="PBS-4_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
			</Package>
		</Packages>
	</LocalLibrary>

	<Constructive version="1.2">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.1">
					<Rect>
						<Dot x="263.5" y="50"/>
						<Dot x="236.5" y="-50"/>
					</Rect>
				</Shape>
				<Shape lineWidth="0.1">
					<Contour>
						<Start x="-2.5" y="49"/>
						<SegmentLine>
							<End x="-2.5" y="44.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-0.5" y="43.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8" y="43.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8" y="40.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-0.5" y="40.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-2.5" y="39.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-2.5" y="-39.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-0.5" y="-40.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8" y="-40.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="8" y="-43.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-0.5" y="-43.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-2.5" y="-44.5"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-2.5" y="-49"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-0.5" y="-50"/>
						</SegmentLine>
						<SegmentLine>
							<End x="210.5" y="-50"/>
						</SegmentLine>
						<SegmentLine>
							<End x="210.5" y="-29"/>
						</SegmentLine>
						<SegmentLine>
							<End x="213" y="-29"/>
						</SegmentLine>
						<SegmentLine>
							<End x="215" y="-28"/>
						</SegmentLine>
						<SegmentLine>
							<End x="215" y="-22"/>
						</SegmentLine>
						<SegmentLine>
							<End x="213" y="-21"/>
						</SegmentLine>
						<SegmentLine>
							<End x="210.5" y="-21"/>
						</SegmentLine>
						<SegmentLine>
							<End x="210.5" y="21"/>
						</SegmentLine>
						<SegmentLine>
							<End x="213" y="21"/>
						</SegmentLine>
						<SegmentLine>
							<End x="215" y="22"/>
						</SegmentLine>
						<SegmentLine>
							<End x="215" y="28"/>
						</SegmentLine>
						<SegmentLine>
							<End x="213" y="29"/>
						</SegmentLine>
						<SegmentLine>
							<End x="210.5" y="29"/>
						</SegmentLine>
						<SegmentLine>
							<End x="210.5" y="50"/>
						</SegmentLine>
						<SegmentLine>
							<End x="-0.5" y="50"/>
						</SegmentLine>
					</Contour>
				</Shape>
				<Shape lineWidth="0.1">
					<Rect>
						<Dot x="241" y="-20"/>
						<Dot x="239" y="-30"/>
					</Rect>
				</Shape>
				<Shape lineWidth="0.1">
					<Rect>
						<Dot x="239" y="30"/>
						<Dot x="241" y="20"/>
					</Rect>
				</Shape>
			</Contour>
		</BoardOutline>
		<MechLayerObjects>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="8" y="60"/>
					<SegmentLine>
						<End x="8" y="-60"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="215" y="60"/>
					<SegmentLine>
						<End x="215" y="-60"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="210.5" y="60"/>
					<SegmentLine>
						<End x="210.5" y="-60"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="250" y="60"/>
					<SegmentLine>
						<End x="250" y="-60"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="1.1" y="50"/>
					<SegmentLine>
						<End x="311.1" y="50"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="1.1" y="0"/>
					<SegmentLine>
						<End x="311.1" y="0"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="1.1" y="-50"/>
					<SegmentLine>
						<End x="311.1" y="-50"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.25">
				<LayerRef name="Mechanical 1"/>
				<Circle diameter="18">
					<Center x="250" y="12.5"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.25">
				<LayerRef name="Mechanical 1"/>
				<Circle diameter="18">
					<Center x="250" y="-12.5"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.25">
				<LayerRef name="Mechanical 1"/>
				<Circle diameter="18">
					<Center x="250" y="-37.5"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.25">
				<LayerRef name="Mechanical 1"/>
				<Circle diameter="30">
					<Center x="250" y="37.5"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.25">
				<LayerRef name="Mechanical 1"/>
				<Circle diameter="30">
					<Center x="250" y="12.5"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.25">
				<LayerRef name="Mechanical 1"/>
				<Circle diameter="30">
					<Center x="250" y="-12.5"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.25">
				<LayerRef name="Mechanical 1"/>
				<Circle diameter="30">
					<Center x="250" y="-37.5"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="265" y="60"/>
					<SegmentLine>
						<End x="265" y="-60"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="235" y="60"/>
					<SegmentLine>
						<End x="235" y="-60"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.5">
				<LayerRef name="TopMask"/>
				<FilledRect>
					<Dot x="215" y="-17.4625"/>
					<Dot x="207.5" y="-32.385"/>
				</FilledRect>
			</Detail>
			<Detail lineWidth="0.5">
				<LayerRef name="TopMask"/>
				<FilledContour>
					<Start x="236.5" y="-32.7025"/>
					<SegmentLine>
						<End x="238" y="-32.0675"/>
					</SegmentLine>
					<SegmentLine>
						<End x="242" y="-32.0675"/>
					</SegmentLine>
					<SegmentLine>
						<End x="243" y="-32.385"/>
					</SegmentLine>
					<SegmentLine>
						<End x="243.5" y="-32.385"/>
					</SegmentLine>
					<SegmentLine>
						<End x="243.5" y="-17.5"/>
					</SegmentLine>
					<SegmentLine>
						<End x="236.5" y="-17.5"/>
					</SegmentLine>
				</FilledContour>
			</Detail>
			<Detail lineWidth="0.5">
				<LayerRef name="TopMask"/>
				<FilledRect>
					<Dot x="236.5" y="32.7025"/>
					<Dot x="243.5" y="17.4625"/>
				</FilledRect>
			</Detail>
			<Detail lineWidth="0.5">
				<LayerRef name="BotMask"/>
				<FilledRect>
					<Dot x="243.5" y="32.7025"/>
					<Dot x="236.5" y="17.4625"/>
				</FilledRect>
			</Detail>
			<Detail lineWidth="0.5">
				<LayerRef name="BotMask"/>
				<FilledRect>
					<Dot x="207.5" y="-17.4625"/>
					<Dot x="215" y="-32.385"/>
				</FilledRect>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="275" y="37.5"/>
					<SegmentLine>
						<End x="220" y="37.5"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="241.935" y="-44.1325"/>
					<SegmentLine>
						<End x="238.125" y="-44.1325"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="241.935" y="-40.9575"/>
					<SegmentLine>
						<End x="238.125" y="-40.9575"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="241.935" y="-37.7825"/>
					<SegmentLine>
						<End x="238.125" y="-37.7825"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="241.935" y="-34.6075"/>
					<SegmentLine>
						<End x="238.125" y="-34.6075"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="241.935" y="-12.065"/>
					<SegmentLine>
						<End x="238.125" y="-12.065"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="241.935" y="-14.9225"/>
					<SegmentLine>
						<End x="238.125" y="-14.9225"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="210.5" y="-12.065"/>
					<SegmentLine>
						<End x="207" y="-12.065"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="210.5" y="-14.9225"/>
					<SegmentLine>
						<End x="207" y="-14.9225"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="BotMask"/>
				<Polyline>
					<Start x="210.5" y="-12.065"/>
					<SegmentLine>
						<End x="207" y="-12.065"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="BotMask"/>
				<Polyline>
					<Start x="210.5025" y="-14.9225"/>
					<SegmentLine>
						<End x="207" y="-14.9225"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="210.5" y="-34.6075"/>
					<SegmentLine>
						<End x="207" y="-34.6075"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="210.5" y="-37.7825"/>
					<SegmentLine>
						<End x="207" y="-37.7825"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="210.5" y="-40.9575"/>
					<SegmentLine>
						<End x="207" y="-40.9575"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="TopMask"/>
				<Polyline>
					<Start x="210.5" y="-44.1325"/>
					<SegmentLine>
						<End x="207" y="-44.1325"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="BotMask"/>
				<Polyline>
					<Start x="210.5" y="-34.6075"/>
					<SegmentLine>
						<End x="207" y="-34.6075"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.5">
				<LayerRef name="TopMask"/>
				<FilledRect>
					<Dot x="215" y="32.7025"/>
					<Dot x="207.5" y="17.4625"/>
				</FilledRect>
			</Detail>
			<Detail lineWidth="0.5">
				<LayerRef name="BotMask"/>
				<FilledRect>
					<Dot x="215" y="32.7025"/>
					<Dot x="207.5" y="17.4625"/>
				</FilledRect>
			</Detail>
			<Detail lineWidth="0.4">
				<LayerRef name="TopMask"/>
				<Circle diameter="5.4">
					<Center x="166.5" y="42.5"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.4">
				<LayerRef name="TopMask"/>
				<Circle diameter="5.4">
					<Center x="173" y="42.5"/>
				</Circle>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="BotMask"/>
				<Polyline>
					<Start x="210.5" y="-37.7825"/>
					<SegmentLine>
						<End x="207" y="-37.7825"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="BotMask"/>
				<Polyline>
					<Start x="210.5" y="-40.9575"/>
					<SegmentLine>
						<End x="207" y="-40.9575"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="2">
				<LayerRef name="BotMask"/>
				<Polyline>
					<Start x="210.5" y="-44.1325"/>
					<SegmentLine>
						<End x="207" y="-44.1325"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.5">
				<LayerRef name="BotMask"/>
				<FilledContour>
					<Start x="236.5" y="-32.7025"/>
					<SegmentLine>
						<End x="238" y="-32.0675"/>
					</SegmentLine>
					<SegmentLine>
						<End x="242" y="-32.0675"/>
					</SegmentLine>
					<SegmentLine>
						<End x="243" y="-32.385"/>
					</SegmentLine>
					<SegmentLine>
						<End x="243.5" y="-32.385"/>
					</SegmentLine>
					<SegmentLine>
						<End x="243.5" y="-17.5"/>
					</SegmentLine>
					<SegmentLine>
						<End x="236.5" y="-17.5"/>
					</SegmentLine>
				</FilledContour>
			</Detail>
			<Detail lineWidth="0.4">
				<LayerRef name="TopMask"/>
				<Circle diameter="5.4">
					<Center x="246.5" y="12.028"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.4">
				<LayerRef name="TopMask"/>
				<Circle diameter="5.4">
					<Center x="253" y="12.028"/>
				</Circle>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="240" y="60"/>
					<SegmentLine>
						<End x="240" y="-60"/>
					</SegmentLine>
				</Polyline>
			</Detail>
			<Detail lineWidth="0.2">
				<LayerRef name="Mechanical 1"/>
				<Polyline>
					<Start x="240" y="-25.5"/>
					<SegmentLine>
						<End x="237" y="-23.5"/>
					</SegmentLine>
					<SegmentLine>
						<End x="236.5" y="-24.5"/>
					</SegmentLine>
					<SegmentLine>
						<End x="240" y="-25.5"/>
					</SegmentLine>
					<SegmentLine>
						<End x="227.5" y="-20"/>
					</SegmentLine>
					<SegmentLine>
						<End x="227.5" y="30.5"/>
					</SegmentLine>
					<SegmentLine>
						<End x="219" y="67.5"/>
					</SegmentLine>
					<SegmentLine>
						<End x="193.5" y="67.5"/>
					</SegmentLine>
					<SegmentLine>
						<End x="219" y="67.5"/>
					</SegmentLine>
					<SegmentLine>
						<End x="227.5" y="30.5"/>
					</SegmentLine>
					<SegmentLine>
						<End x="240" y="25"/>
					</SegmentLine>
					<SegmentLine>
						<End x="236.5" y="26"/>
					</SegmentLine>
					<SegmentLine>
						<End x="237" y="27"/>
					</SegmentLine>
					<SegmentLine>
						<End x="240" y="25"/>
					</SegmentLine>
				</Polyline>
			</Detail>
		</MechLayerObjects>
		<Texts>
			<Text text="Плата 1 (AMK310_MCU_M_V2.1):
Толщина текстолита 1,5 - 1.6 мм.
СЛОИ ДЛЯ ИЗГОТОВЛЕНИЯ:
TOP, BOTTOM,
TOP MASK, BOT MASK
TOP SILK
+трафарет" align="CT">
				<LayerRef name="Mechanical 1"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="142" y="-43.815"/>
			</Text>
			<Text text="Плата 2 (AMK310_MCU_F_V2):
Толщина текстолита 1,5 - 1.6 мм.
СЛОИ ДЛЯ ИЗГОТОВЛЕНИЯ:
TOP, BOTTOM,
TOP MASK, BOT MASK" align="CT">
				<LayerRef name="Mechanical 1"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="249.5" y="-57.785"/>
			</Text>
			<Text text="AMK310_MCU_M_V2.1">
				<LayerRef name="Top"/>
				<TextStyleRef name="GOST_B_2"/>
				<Org x="170" y="37.515"/>
			</Text>
			<Text text="XR">
				<LayerRef name="Top"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="173" y="41.7225"/>
			</Text>
			<Text text="2">
				<LayerRef name="Top"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="166.5" y="41.8025"/>
			</Text>
			<Text text="XR">
				<LayerRef name="TopMask"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="173" y="41.7225"/>
			</Text>
			<Text text="2">
				<LayerRef name="TopMask"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="166.5" y="41.8025"/>
			</Text>
			<Text text="AMK310_MCU_M_V2.1">
				<LayerRef name="TopMask"/>
				<TextStyleRef name="GOST_B_2"/>
				<Org x="170" y="37.515"/>
			</Text>
			<Text text="mV2" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.115" y="40.9575"/>
			</Text>
			<Text text="mV1" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="33.655" y="38.4175"/>
			</Text>
			<Text text="mA" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.0851" y="33.3507"/>
			</Text>
			<Text text="V_old" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="33.655" y="31.115"/>
			</Text>
			<Text text="RV4" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.0851" y="25.7307"/>
			</Text>
			<Text text="RV3" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="33.655" y="23.1775"/>
			</Text>
			<Text text="N1K" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.0851" y="18.1107"/>
			</Text>
			<Text text="N500" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="33.655" y="15.5575"/>
			</Text>
			<Text text="N5mA" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.0851" y="10.4907"/>
			</Text>
			<Text text="N20mA" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="33.655" y="7.9375"/>
			</Text>
			<Text text="R4" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.0851" y="2.8707"/>
			</Text>
			<Text text="R3" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="33.655" y="0.3175"/>
			</Text>
			<Text text="R8" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.4026" y="-4.7493"/>
			</Text>
			<Text text="R7" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="33.655" y="-7.3025"/>
			</Text>
			<Text text="H2" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.0851" y="-12.3693"/>
			</Text>
			<Text text="H1" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="33.655" y="-14.9225"/>
			</Text>
			<Text text="H6" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.0851" y="-19.9893"/>
			</Text>
			<Text text="H5" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="33.655" y="-22.5425"/>
			</Text>
			<Text text="H10" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.0851" y="-27.6093"/>
			</Text>
			<Text text="H9" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="33.655" y="-30.1625"/>
			</Text>
			<Text text="H12" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="-27.6225"/>
			</Text>
			<Text text="H11" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="52.705" y="-30.1625"/>
			</Text>
			<Text text="H7" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="52.705" y="-22.5425"/>
			</Text>
			<Text text="H8" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="-20.0025"/>
			</Text>
			<Text text="H3" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="52.705" y="-14.9225"/>
			</Text>
			<Text text="H4" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="-12.3825"/>
			</Text>
			<Text text="R3W" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="52.705" y="-7.3025"/>
			</Text>
			<Text text="R4W" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="-4.7625"/>
			</Text>
			<Text text="R5" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="52.705" y="0.3175"/>
			</Text>
			<Text text="R6" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="2.8575"/>
			</Text>
			<Text text="R1" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="52.705" y="7.9375"/>
			</Text>
			<Text text="R2" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="10.4775"/>
			</Text>
			<Text text="N2K" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="52.705" y="15.5575"/>
			</Text>
			<Text text="Nxx" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="18.0975"/>
			</Text>
			<Text text="N0" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="52.705" y="23.1775"/>
			</Text>
			<Text text="N400" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.4825" y="25.7175"/>
			</Text>
			<Text text="RV1" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="52.705" y="30.7975"/>
			</Text>
			<Text text="RV2" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="33.3375"/>
			</Text>
			<Text text="Vtc" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="52.705" y="38.4175"/>
			</Text>
			<Text text="Vnew" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="40.9575"/>
			</Text>
			<Text text="+I
-I" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="(Default)"/>
				<Org x="205.4225" y="-15.24"/>
			</Text>
			<Text text="+mV
-mV" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="(Default)"/>
				<Org x="205.74" y="-37.7825"/>
			</Text>
			<Text text="+V
-V" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="(Default)"/>
				<Org x="205.74" y="-44.1325"/>
			</Text>
			<Text text="-I
+I" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="165.735" y="-17.4625"/>
			</Text>
			<Text text="-mV
+mV" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="165.735" y="-30.1625"/>
			</Text>
			<Text text="-V
+V" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="165.735" y="-42.8625"/>
			</Text>
			<Text text="INV">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="172.085" y="4.1275"/>
			</Text>
			<Text text="mA">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="174.625" y="4.1275"/>
			</Text>
			<Text text="V">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="180.34" y="4.1275"/>
			</Text>
			<Text text="mV">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="182.88" y="4.1275"/>
			</Text>
			<Text text="SDA" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="129.54" y="20.955"/>
			</Text>
			<Text text="SCL" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="129.54" y="18.415"/>
			</Text>
			<Text text="GND" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="129.54" y="23.495"/>
			</Text>
			<Text text="+5V" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="129.54" y="15.875"/>
			</Text>
			<Text text="2" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.115" y="-35.2425"/>
			</Text>
			<Text text="G45" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="31.115" y="-37.7825"/>
			</Text>
			<Text text="G48" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="-35.2425"/>
			</Text>
			<Text text="G47" align="RM">
				<LayerRef name="TopSilk"/>
				<TextStyleRef name="GOST 1.5"/>
				<Org x="50.165" y="-37.7825"/>
			</Text>
			<Text text="27/2/25">
				<LayerRef name="Top"/>
				<TextStyleRef name="GOST_B_2"/>
				<Org x="170" y="35.283"/>
			</Text>
			<Text text="27/2/25">
				<LayerRef name="TopMask"/>
				<TextStyleRef name="GOST_B_2"/>
				<Org x="170" y="35.283"/>
			</Text>
			<Text text="AMK310_MCU_F_V2.1">
				<LayerRef name="Top"/>
				<TextStyleRef name="GOST_B_2"/>
				<Org x="250" y="7.043"/>
			</Text>
			<Text text="XR">
				<LayerRef name="Top"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="253" y="11.2505"/>
			</Text>
			<Text text="2">
				<LayerRef name="Top"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="246.5" y="11.3305"/>
			</Text>
			<Text text="XR">
				<LayerRef name="TopMask"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="253" y="11.2505"/>
			</Text>
			<Text text="2">
				<LayerRef name="TopMask"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="246.5" y="11.3305"/>
			</Text>
			<Text text="AMK310_MCU_F_V2.1">
				<LayerRef name="TopMask"/>
				<TextStyleRef name="GOST_B_2"/>
				<Org x="250" y="7.043"/>
			</Text>
			<Text text="27/2/25">
				<LayerRef name="Top"/>
				<TextStyleRef name="GOST_B_2"/>
				<Org x="250" y="4.811"/>
			</Text>
			<Text text="27/2/25">
				<LayerRef name="TopMask"/>
				<TextStyleRef name="GOST_B_2"/>
				<Org x="250" y="4.811"/>
			</Text>
			<Text text="металлизированные слоты" align="CT">
				<LayerRef name="Mechanical 1"/>
				<TextStyleRef name="GOST_B_4"/>
				<Org x="206" y="72"/>
			</Text>
		</Texts>
	</Constructive>

	<ComponentsOnBoard version="1.3">
		<Components>
			<CompInstance name="C2" uniqueId="GXWUMBKF" side="Top" angle="90">
				<ComponentRef name="CE CHIP 3528 10.0/20V_1"/>
				<FootprintRef name="C3528_1"/>
				<Org x="113.9825" y="-37.1475"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="4.445" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="CE CHIP 3528 10.0/20V"/>
					<Attribute name="Value" value="10uF x 10V"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C17" uniqueId="BQTPYYSC" side="Top" angle="270">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="114.3" y="-7.9375"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R2" uniqueId="ACXMVYSM" side="Top" angle="180">
				<ComponentRef name="P1-12 0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="117.7925" y="20.6375"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.905" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="P1-12 0805"/>
					<Attribute name="Value" value="10 K"/>
					<Attribute name="Description" value="Р1-12-0,1  5%"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R17" uniqueId="AESVKLZS" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="31.75"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R47" uniqueId="RWHDTXSX" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="-21.59"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C3" uniqueId="MDHJASAZ" side="Top" angle="90">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="106.045" y="-5.3975"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="3.175" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD1" uniqueId="FSUILXBA" side="Top" angle="180">
				<ComponentRef name="DL4148_1"/>
				<FootprintRef name="SOD-80_1"/>
				<Org x="172.4025" y="-5.715"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="6.0325" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DL4148"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R20" uniqueId="JRXPPYSO" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="34.29"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R5" uniqueId="CKPHLKCY" side="Top">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="108.585" y="-2.8575"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="3.81" y="-0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="5k"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R50" uniqueId="BJHCEKKK" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="-26.67"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C6" uniqueId="TVRTGRZV" side="Top" angle="180">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="110.8075" y="27.94"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.9525" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="Z2" uniqueId="IASNUWRG" side="Top">
				<ComponentRef name="TPD2E2U06_1"/>
				<FootprintRef name="DRL_1"/>
				<Org x="100.965" y="-30.48"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="TPD2E2U06"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R23" uniqueId="XAAYORJA" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="8.89"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R8" uniqueId="XLUGIGPW" side="Top">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="133.6675" y="21.2725"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="5k"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R53" uniqueId="PZTLNXQO" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="-36.83"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C9" uniqueId="RKCOSTEL" side="Top" angle="315">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="113.9825" y="24.765"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="1.1225" y="1.1225"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R26" uniqueId="GCLDIHRW" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="3.81"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R11" uniqueId="DLNFXGST" side="Top" angle="270">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="173.99" y="17.78"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.22" y="-0.49"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R56" uniqueId="AAALUASJ" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="-34.29"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C12" uniqueId="ZQDKFRQD" side="Top" angle="180" fixed="on">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="92.3925" y="19.05"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.9525" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R29" uniqueId="DXAYFEBX" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="-6.35"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R14" uniqueId="QDDAFMAU" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="41.91"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C15" uniqueId="QGBGXXCW" side="Top" angle="180" fixed="on">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="92.3925" y="-24.765"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="1.27" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J4" uniqueId="KWEVVQJZ" side="Top" angle="270">
				<ComponentRef name="JMP_OPEN_1"/>
				<FootprintRef name="JMP_OPEN_1"/>
				<Org x="164.465" y="-37.7825"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="JMP_OPEN"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J5" uniqueId="MTHKYJJJ" side="Top" angle="270">
				<ComponentRef name="JMP_OPEN_1"/>
				<FootprintRef name="JMP_OPEN_1"/>
				<Org x="176.8475" y="-12.3825"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="JMP_OPEN"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R32" uniqueId="STZMYAVB" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="-3.81"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J7" uniqueId="YNCXEKCA" side="Top" angle="135" fixed="on">
				<ComponentRef name="JMP_CLOSE_1"/>
				<FootprintRef name="JMP_CLOSE_1"/>
				<Org x="251" y="-37.6"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="Top"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-2.6039" y="-2.3458"/>
						</Label>
						<Label angle="180" visible="on">
							<LayerRef name="TopMask"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-2.6039" y="-2.3459"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="JMP_CLOSE"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R35" uniqueId="XVEQRNJO" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="16.51"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R38" uniqueId="JVLIGEVA" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="19.05"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R41" uniqueId="KBHYHMRD" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="-13.97"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J2" uniqueId="MEUYDKML" side="Top" angle="270">
				<ComponentRef name="JMP_OPEN_1"/>
				<FootprintRef name="JMP_OPEN_1"/>
				<Org x="164.465" y="-25.0825"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="JMP_OPEN"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R44" uniqueId="VHPJNIHY" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="-11.43"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J3" uniqueId="PJOXHXKE" side="Top" angle="270">
				<ComponentRef name="JMP_OPEN_1"/>
				<FootprintRef name="JMP_OPEN_1"/>
				<Org x="176.8475" y="-37.7825"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="JMP_OPEN"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C1" uniqueId="VUVZYMJL" side="Top" angle="90">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="120.3325" y="12.3825"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="3.175" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C16" uniqueId="PXUYVEEB" side="Top" angle="180" fixed="on">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="92.3925" y="-39.37"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.9525" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R1" uniqueId="HBPNMBZN" side="Top" angle="270">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="120.3325" y="8.255"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="10k"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R16" uniqueId="IHMQQPCE" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="41.91"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R46" uniqueId="JQCWELAN" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="-19.05"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD4" uniqueId="JCUDQVTL" side="Top" angle="180">
				<ComponentRef name="DL4148_1"/>
				<FootprintRef name="SOD-80_1"/>
				<Org x="182.88" y="-8.255"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="6.0325" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DL4148"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C5" uniqueId="RUKLSBBE" side="Top">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="108.585" y="-20.0025"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.9525" y="1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C4" uniqueId="XICXGOFN" side="Top">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="103.505" y="-33.655"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.905" y="-0.635"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0603"/>
					<Attribute name="Value" value="0,1"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C7" uniqueId="SQCFMQAQ" side="Top" angle="270">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="114.3" y="10.16"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DA1" uniqueId="NHVEKSYZ" side="Top" angle="180">
				<ComponentRef name="1141СПХХ_1"/>
				<FootprintRef name="TO-92-1_1_Primary"/>
				<Org x="116.5225" y="1.5875"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0" y="-3.175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="1141СПХХ"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DA2" uniqueId="QHZXOQTE" side="Top">
				<ComponentRef name="L79L05AB_1"/>
				<FootprintRef name="SOT-89_1"/>
				<Org x="108.2675" y="-0.3175"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="1.27" y="5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="L79L05AB"/>
					<Attribute name="Value" value="LM1117MPX-3.3"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C18" uniqueId="GJCPAGOO" side="Top" angle="90">
				<ComponentRef name="CE CHIP 3528 10.0/20V_1"/>
				<FootprintRef name="C3528_1"/>
				<Org x="103.505" y="-12.3825"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="4.7625" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="CE CHIP 3528 10.0/20V"/>
					<Attribute name="Value" value="10uF x 10V"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R21" uniqueId="FXZSRXQU" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="24.13"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R22" uniqueId="LGGOKCMG" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="26.67"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R3" uniqueId="JLXETVVC" side="Top">
				<ComponentRef name="P1-12 0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="106.9975" y="-36.83"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.905" y="-0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="P1-12 0805"/>
					<Attribute name="Value" value="4K3"/>
					<Attribute name="Description" value="Р1-12-0,1  5%"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R6" uniqueId="GJYSGHDB" side="Top" angle="90">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="103.505" y="-5.3975"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="3.175" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="5k"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R7" uniqueId="YVAJNQUP" side="Top">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="133.6675" y="18.7325"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="5k"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R4" uniqueId="HDOEUBRC" side="Top" angle="180">
				<ComponentRef name="P1-12 0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="109.855" y="-34.29"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.9525" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="P1-12 0805"/>
					<Attribute name="Value" value="10 K"/>
					<Attribute name="Description" value="Р1-12-0,1  5%"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R19" uniqueId="BFJLWWRA" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="31.75"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R18" uniqueId="HGBKJUCV" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="34.29"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R48" uniqueId="XKGPGXRS" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="-19.05"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R49" uniqueId="BENNXGCW" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="-29.21"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R52" uniqueId="KMOHRSJK" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="-26.3525"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R51" uniqueId="TZRKHYNZ" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="-29.5275"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT1" uniqueId="IUFAHDTB" side="Top" angle="270">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="183.515" y="12.7"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="-0.635"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT8" uniqueId="DNUBNIMG" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="7.62"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT9" uniqueId="NPZQAQNI" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="0"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT17" uniqueId="EMIPSNVO" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="-15.24"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT16" uniqueId="KVKZUVTU" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="7.62"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT24" uniqueId="VMYSXWUM" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="-38.1"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XS2" uniqueId="PINXGFQV" side="Top" angle="90">
				<ComponentRef name="PBS-4_1"/>
				<FootprintRef name="PBS-4_1"/>
				<Org x="131.1275" y="16.1925"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="9.525" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="PBS-4"/>
					<Attribute name="Netname4" value="{Netname4}"/>
					<Attribute name="Netname2" value="{Netname2}"/>
					<Attribute name="Netname1" value="{Netname1}"/>
					<Attribute name="Netname3" value="{Netname3}"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="Z3" uniqueId="JRFXSQML" side="Top" angle="180">
				<ComponentRef name="EMI BMB0805_1"/>
				<FootprintRef name="0805_2"/>
				<Org x="110.8075" y="25.4"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="4.1275" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="EMI BMB0805"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="Z1" uniqueId="JIZMVAMR" side="Top">
				<ComponentRef name="EMI BMB0805_1"/>
				<FootprintRef name="0805_2"/>
				<Org x="112.0775" y="-39.37"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.905" y="-0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="EMI BMB0805"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C8" uniqueId="WDWLTHFT" side="Top" angle="315">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="102.87" y="13.6525"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.9069" y="-2.3281"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C13" uniqueId="COQUDVHK" side="Top" angle="180" fixed="on">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="92.3925" y="4.445"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.9525" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C10" uniqueId="JKRPIHER" side="Top">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="133.6675" y="23.8125"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C11" uniqueId="YGBYYIDC" side="Top" angle="180" fixed="on">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="92.3925" y="33.655"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.9525" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DD2" uniqueId="BRHMYDFL" side="Top" angle="270">
				<ComponentRef name="ADUM3211_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="112.395" y="-9.8425"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.5875" y="-1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="ADUM3211"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R24" uniqueId="TSKCZTHZ" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="11.43"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.54" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R25" uniqueId="UEGHLIJE" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="1.27"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R27" uniqueId="FWMSIEUW" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="1.27"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R28" uniqueId="QMVUBMOE" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="3.81"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R9" uniqueId="OFJTJAFV" side="Top" angle="270">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="182.245" y="17.78"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.22" y="-0.745"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R13" uniqueId="IWBNPCCD" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="39.37"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R12" uniqueId="PXMCOABY" side="Top" angle="270">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="171.45" y="17.78"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="RM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.22" y="0.55"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R10" uniqueId="OMFSCQWS" side="Top" angle="270">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="179.705" y="17.78"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="RM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.22" y="0.795"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R55" uniqueId="HVGOMMQE" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="-36.83"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R54" uniqueId="NZCRDMDH" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="-34.29"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT4" uniqueId="XQZAYCDZ" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="38.1"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT3" uniqueId="KLRCNCVX" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="38.1"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT12" uniqueId="EZIUCDJJ" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="-7.62"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT11" uniqueId="XVSYYRZS" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="-7.62"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT19" uniqueId="MXGTFKQH" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="-22.86"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT20" uniqueId="ISEDSPKO" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="-22.86"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C14" uniqueId="SMETULTL" side="Top" angle="180" fixed="on">
				<ComponentRef name="C0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="92.3925" y="-10.16"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.9525" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="C0805"/>
					<Attribute name="Value" value="0.1 uF"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R15" uniqueId="XFZSZXDS" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="39.37"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R30" uniqueId="KTHBHRCI" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="-3.81"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD3" uniqueId="ZTFABPCF" side="Top" angle="180">
				<ComponentRef name="DL4148_1"/>
				<FootprintRef name="SOD-80_1"/>
				<Org x="182.88" y="-33.655"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="6.0325" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DL4148"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT6" uniqueId="TQNAGRXX" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="30.48"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT14" uniqueId="SALDFXRW" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="15.24"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT22" uniqueId="LRMAYBQR" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="-30.48"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R31" uniqueId="YGMQGJBE" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="-6.35"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DD6" uniqueId="YFAQGHCA" side="Top" angle="270" fixed="on">
				<ComponentRef name="74AC273SC_1"/>
				<FootprintRef name="SO-20_1"/>
				<Org x="88.265" y="-0.3175"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.635" y="0.635"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="74AC273SC"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DD7" uniqueId="DAZECDDD" side="Top" angle="270" fixed="on">
				<ComponentRef name="74AC273SC_1"/>
				<FootprintRef name="SO-20_1"/>
				<Org x="88.265" y="14.2875"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.635" y="0.635"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="74AC273SC"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J6" uniqueId="DUFJTJAZ" side="Top" angle="270">
				<ComponentRef name="JMP_OPEN_1"/>
				<FootprintRef name="JMP_OPEN_1"/>
				<Org x="164.465" y="-12.3825"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="JMP_OPEN"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R33" uniqueId="FYRRMPEI" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="24.13"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R34" uniqueId="LMTTPOJM" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="26.67"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R37" uniqueId="PBFDAYOP" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="16.51"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R36" uniqueId="SBXKHBVQ" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="19.05"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XP1" uniqueId="RQMHWJXP" side="Bottom" fixed="on">
				<ComponentRef name="PLT164-RL2G_1"/>
				<FootprintRef name="PLT164-R_1"/>
				<Org x="250" y="-12.5"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label mirror="on" visible="on">
							<LayerRef name="Top"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0" y="8.69"/>
						</Label>
						<Label mirror="on" visible="on">
							<LayerRef name="TopMask"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0" y="8.69"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="PLT164-RL2G"/>
					<Attribute name="Netname3" value="+мА"/>
					<Attribute name="Netname1" value=""/>
					<Attribute name="Netname4" value=""/>
					<Attribute name="Netname2" value="-мА"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DD8" uniqueId="UCLNAIWT" side="Top" angle="270" fixed="on">
				<ComponentRef name="74AC273SC_1"/>
				<FootprintRef name="SO-20_1"/>
				<Org x="88.265" y="-14.9225"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.635" y="0.635"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="74AC273SC"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DD9" uniqueId="TBWSSLFS" side="Top" angle="270" fixed="on">
				<ComponentRef name="74AC273SC_1"/>
				<FootprintRef name="SO-20_1"/>
				<Org x="88.265" y="-29.5275"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.635" y="0.635"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="74AC273SC"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="J1" uniqueId="TCVHZXUW" side="Top" angle="270">
				<ComponentRef name="JMP_OPEN_1"/>
				<FootprintRef name="JMP_OPEN_1"/>
				<Org x="176.8475" y="-25.0825"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="JMP_OPEN"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R42" uniqueId="LEHPJYRR" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="-11.43"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R43" uniqueId="OICLPSDG" side="Top" angle="180" fixed="on">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="64.77" y="-13.97"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-0.635" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R40" uniqueId="MCSBDOVW" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="11.43"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="-1.27"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R39" uniqueId="SQSMXQLX" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="8.89"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="R45" uniqueId="VNESCITK" side="Top" angle="180">
				<ComponentRef name="R0805_1"/>
				<FootprintRef name="0805_1"/>
				<Org x="45.72" y="-21.59"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.2225" y="1.905"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="R0805"/>
					<Attribute name="Value" value="100"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="KA1" uniqueId="NICAORUZ" side="Top">
				<ComponentRef name="IM03CGR_1"/>
				<FootprintRef name="IM03CGR_1"/>
				<Org x="182.88" y="-30.48"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-3.4925" y="-0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IM03CGR"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DD3" uniqueId="AUVKSXCU" side="Top" angle="270">
				<ComponentRef name="STM32F031K6T_1"/>
				<FootprintRef name="LQFP-32_1"/>
				<Org x="112.0775" y="22.86"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.3175" y="-8.255"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="STM32F031K6T"/>
					<Attribute name="Value" value="APM32F030K6T6"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="KA3" uniqueId="ZMKBTQYN" side="Top">
				<ComponentRef name="IM03CGR_1"/>
				<FootprintRef name="IM03CGR_1"/>
				<Org x="182.88" y="-17.78"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-3.4925" y="0"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IM03CGR"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="KA4" uniqueId="DLLLWYME" side="Top" angle="270">
				<ComponentRef name="IM03CGR_1"/>
				<FootprintRef name="IM03CGR_1"/>
				<Org x="167.3225" y="-21.59"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0" y="-2.8575"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IM03CGR"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="KA6" uniqueId="XHHPGBHR" side="Top" angle="270">
				<ComponentRef name="IM03CGR_1"/>
				<FootprintRef name="IM03CGR_1"/>
				<Org x="167.3225" y="-8.89"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0" y="-2.8575"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IM03CGR"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VD2" uniqueId="MGAFCMHC" side="Top" angle="180">
				<ComponentRef name="DL4148_1"/>
				<FootprintRef name="SOD-80_1"/>
				<Org x="182.88" y="-20.955"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="6.0325" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="DL4148"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT5" uniqueId="RFPUEHEH" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="30.48"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT2" uniqueId="RPXDHSPE" side="Top" angle="270">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="175.26" y="12.7"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-1.27" y="-0.635"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT7" uniqueId="HLPIGJQK" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="22.86"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT13" uniqueId="FJXVSEIF" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="22.86"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT10" uniqueId="ZVIGECRZ" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="0"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT15" uniqueId="PHXAPKNG" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="15.24"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT18" uniqueId="ZDRAEKUE" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="59.69" y="-15.24"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT21" uniqueId="OLRXNYBK" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="-30.48"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="VT23" uniqueId="FLQZPANR" side="Top" angle="180" fixed="on">
				<ComponentRef name="IRF7341_1"/>
				<FootprintRef name="SO-8_1"/>
				<Org x="40.64" y="-38.1"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="2.8575" y="-5.08"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IRF7341"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XS1" uniqueId="QGCYZOJV" side="Top" angle="90">
				<ComponentRef name="PBS2-5_1"/>
				<FootprintRef name="PBS2-5_1"/>
				<Org x="117.475" y="8.255"/>
				<Attributes>
					<Attribute name="Type" value="PBS2-5"/>
					<Attribute name="Value" value="(Не ставить.)"/>
					<Attribute name="Netname4" value="SWCLK"/>
					<Attribute name="Netname2" value="GND"/>
					<Attribute name="Netname5" value="VPP/MCLR"/>
					<Attribute name="Netname1" value="+3V"/>
					<Attribute name="Netname3" value="SWDIO"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DD5" uniqueId="ZUYXOOXS" side="Top" angle="270" fixed="on">
				<ComponentRef name="74AC273SC_1"/>
				<FootprintRef name="SO-20_1"/>
				<Org x="88.265" y="28.8925"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.635" y="0.635"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="74AC273SC"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XP2" uniqueId="DKJJWWPW" side="Bottom" fixed="on">
				<ComponentRef name="PLT164-RL2G_1"/>
				<FootprintRef name="PLT164-R_1"/>
				<Org x="250" y="-37.5"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label mirror="on" visible="on">
							<LayerRef name="Top"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0" y="8.6075"/>
						</Label>
						<Label mirror="on" visible="on">
							<LayerRef name="TopMask"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0" y="8.6075"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="PLT164-RL2G"/>
					<Attribute name="Netname3" value="+В"/>
					<Attribute name="Netname1" value="+мВ"/>
					<Attribute name="Netname4" value="-В"/>
					<Attribute name="Netname2" value="-мВ"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DD1" uniqueId="VLBAXUBO" side="Top" angle="180">
				<ComponentRef name="FT232RL_1"/>
				<FootprintRef name="PSSOP-28 (0.65MM)_1"/>
				<Org x="112.395" y="-22.86"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-2.2225" y="0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="FT232RL"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="DD4" uniqueId="DPWCMAZC" side="Top" angle="270" fixed="on">
				<ComponentRef name="74AC273SC_1"/>
				<FootprintRef name="SO-20_1"/>
				<Org x="88.265" y="43.4975"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" align="LM" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.635" y="0.635"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="74AC273SC"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="KA2" uniqueId="MDITNFXE" side="Top">
				<ComponentRef name="IM03CGR_1"/>
				<FootprintRef name="IM03CGR_1"/>
				<Org x="182.88" y="-43.18"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="-3.4925" y="-0.3175"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IM03CGR"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="KA5" uniqueId="SEKRKNLR" side="Top" angle="270">
				<ComponentRef name="IM03CGR_1"/>
				<FootprintRef name="IM03CGR_1"/>
				<Org x="167.3225" y="-34.29"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="90" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0.3175" y="-2.8575"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="IM03CGR"/>
				</Attributes>
			</CompInstance>
			<CompInstance name="XP3" uniqueId="ICVQLQZK" side="Top" angle="270" fixed="on">
				<ComponentRef name="SL-62-PCB_1"/>
				<FootprintRef name="SL-62-PCB_1_Primary"/>
				<Org x="2" y="0"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="GOST_B_2"/>
							<Org x="0" y="6"/>
						</Label>
					</Attribute>
					<Attribute name="Type" value="SL-62-PCB"/>
				</Attributes>
			</CompInstance>
		</Components>
	</ComponentsOnBoard>

	<NetList version="2.0">
		<Net name="GND">
			<PinRef compName="C17" pinName="1"/>
			<PinRef compName="R2" pinName="1"/>
			<PinRef compName="C3" pinName="1"/>
			<PinRef compName="C6" pinName="1"/>
			<PinRef compName="C9" pinName="2"/>
			<PinRef compName="C12" pinName="1"/>
			<PinRef compName="C15" pinName="1"/>
			<PinRef compName="C1" pinName="1"/>
			<PinRef compName="C16" pinName="1"/>
			<PinRef compName="C7" pinName="1"/>
			<PinRef compName="DA1" pinName="2"/>
			<PinRef compName="C18" pinName="2"/>
			<PinRef compName="R6" pinName="1"/>
			<PinRef compName="VT1" pinName="1"/>
			<PinRef compName="VT1" pinName="3"/>
			<PinRef compName="VT8" pinName="1"/>
			<PinRef compName="VT8" pinName="3"/>
			<PinRef compName="VT9" pinName="1"/>
			<PinRef compName="VT9" pinName="3"/>
			<PinRef compName="VT17" pinName="1"/>
			<PinRef compName="VT17" pinName="3"/>
			<PinRef compName="VT16" pinName="1"/>
			<PinRef compName="VT16" pinName="3"/>
			<PinRef compName="VT24" pinName="1"/>
			<PinRef compName="VT24" pinName="3"/>
			<PinRef compName="XS2" pinName="4"/>
			<PinRef compName="C8" pinName="1"/>
			<PinRef compName="C13" pinName="1"/>
			<PinRef compName="C10" pinName="1"/>
			<PinRef compName="C11" pinName="1"/>
			<PinRef compName="DD2" pinName="4"/>
			<PinRef compName="VT4" pinName="1"/>
			<PinRef compName="VT4" pinName="3"/>
			<PinRef compName="VT3" pinName="1"/>
			<PinRef compName="VT3" pinName="3"/>
			<PinRef compName="VT12" pinName="1"/>
			<PinRef compName="VT12" pinName="3"/>
			<PinRef compName="VT11" pinName="1"/>
			<PinRef compName="VT11" pinName="3"/>
			<PinRef compName="VT19" pinName="1"/>
			<PinRef compName="VT19" pinName="3"/>
			<PinRef compName="VT20" pinName="1"/>
			<PinRef compName="VT20" pinName="3"/>
			<PinRef compName="C14" pinName="1"/>
			<PinRef compName="VT6" pinName="1"/>
			<PinRef compName="VT6" pinName="3"/>
			<PinRef compName="VT14" pinName="1"/>
			<PinRef compName="VT14" pinName="3"/>
			<PinRef compName="VT22" pinName="1"/>
			<PinRef compName="VT22" pinName="3"/>
			<PinRef compName="DD6" pinName="10"/>
			<PinRef compName="DD7" pinName="10"/>
			<PinRef compName="DD8" pinName="10"/>
			<PinRef compName="DD9" pinName="10"/>
			<PinRef compName="DD3" pinName="16"/>
			<PinRef compName="DD3" pinName="32"/>
			<PinRef compName="VT5" pinName="1"/>
			<PinRef compName="VT5" pinName="3"/>
			<PinRef compName="VT2" pinName="1"/>
			<PinRef compName="VT2" pinName="3"/>
			<PinRef compName="VT7" pinName="1"/>
			<PinRef compName="VT7" pinName="3"/>
			<PinRef compName="VT13" pinName="1"/>
			<PinRef compName="VT13" pinName="3"/>
			<PinRef compName="VT10" pinName="1"/>
			<PinRef compName="VT10" pinName="3"/>
			<PinRef compName="VT15" pinName="1"/>
			<PinRef compName="VT15" pinName="3"/>
			<PinRef compName="VT18" pinName="1"/>
			<PinRef compName="VT18" pinName="3"/>
			<PinRef compName="VT21" pinName="1"/>
			<PinRef compName="VT21" pinName="3"/>
			<PinRef compName="VT23" pinName="1"/>
			<PinRef compName="VT23" pinName="3"/>
			<PinRef compName="XS1" pinName="2"/>
			<PinRef compName="DD5" pinName="10"/>
			<PinRef compName="DD4" pinName="10"/>
			<PinRef compName="XP3" pinName="61"/>
			<PinRef compName="XP3" pinName="62"/>
		</Net>
		<Net name="REL_IN_MV_G1">
			<PinRef compName="VT1" pinName="2"/>
			<PinRef compName="VT1" pinName="7"/>
			<PinRef compName="VT1" pinName="8"/>
			<PinRef compName="R9" pinName="1"/>
			<PinRef compName="R9" pinName="2"/>
			<PinRef compName="KA1" pinName="8"/>
			<PinRef compName="VD2" pinName="1"/>
			<PinRef compName="DD4" pinName="2"/>
		</Net>
		<Net name="SCL">
			<PinRef compName="R7" pinName="1"/>
			<PinRef compName="XS2" pinName="2"/>
			<PinRef compName="DD3" pinName="29"/>
			<PinRef compName="XP3" pinName="59"/>
		</Net>
		<Net name="SDA">
			<PinRef compName="R8" pinName="1"/>
			<PinRef compName="XS2" pinName="3"/>
			<PinRef compName="DD3" pinName="30"/>
			<PinRef compName="XP3" pinName="60"/>
		</Net>
		<Net name="REL_RESERVE4_G14">
			<PinRef compName="R22" pinName="1"/>
			<PinRef compName="R22" pinName="2"/>
			<PinRef compName="VT7" pinName="4"/>
			<PinRef compName="VT7" pinName="5"/>
			<PinRef compName="VT7" pinName="6"/>
			<PinRef compName="DD5" pinName="15"/>
			<PinRef compName="XP3" pinName="12"/>
		</Net>
		<Net name="REL_IN_V_G2">
			<PinRef compName="VT1" pinName="4"/>
			<PinRef compName="VT1" pinName="5"/>
			<PinRef compName="VT1" pinName="6"/>
			<PinRef compName="R10" pinName="1"/>
			<PinRef compName="R10" pinName="2"/>
			<PinRef compName="VD3" pinName="1"/>
			<PinRef compName="DD4" pinName="5"/>
			<PinRef compName="KA2" pinName="8"/>
		</Net>
		<Net name="REL_IN_MA_G3">
			<PinRef compName="R11" pinName="1"/>
			<PinRef compName="R11" pinName="2"/>
			<PinRef compName="VD4" pinName="1"/>
			<PinRef compName="KA3" pinName="8"/>
			<PinRef compName="VT2" pinName="2"/>
			<PinRef compName="VT2" pinName="7"/>
			<PinRef compName="VT2" pinName="8"/>
			<PinRef compName="DD4" pinName="6"/>
		</Net>
		<Net name="+MV_IN">
			<PinRef compName="KA1" pinName="6"/>
			<PinRef compName="XP2" pinName="1"/>
		</Net>
		<Net name="REL_INV_G4">
			<PinRef compName="VD1" pinName="1"/>
			<PinRef compName="R12" pinName="1"/>
			<PinRef compName="R12" pinName="2"/>
			<PinRef compName="KA4" pinName="8"/>
			<PinRef compName="KA6" pinName="8"/>
			<PinRef compName="VT2" pinName="4"/>
			<PinRef compName="VT2" pinName="5"/>
			<PinRef compName="VT2" pinName="6"/>
			<PinRef compName="DD4" pinName="9"/>
			<PinRef compName="KA5" pinName="8"/>
		</Net>
		<Net name="+12V">
			<PinRef compName="VD1" pinName="2"/>
			<PinRef compName="VD4" pinName="2"/>
			<PinRef compName="VD3" pinName="2"/>
			<PinRef compName="KA1" pinName="1"/>
			<PinRef compName="KA3" pinName="1"/>
			<PinRef compName="KA4" pinName="1"/>
			<PinRef compName="KA6" pinName="1"/>
			<PinRef compName="VD2" pinName="2"/>
			<PinRef compName="KA2" pinName="1"/>
			<PinRef compName="KA5" pinName="1"/>
			<PinRef compName="XP3" pinName="1"/>
			<PinRef compName="XP3" pinName="2"/>
		</Net>
		<Net name="REL_N400R_G26">
			<PinRef compName="DD7" pinName="5"/>
			<PinRef compName="R34" pinName="1"/>
			<PinRef compName="R34" pinName="2"/>
			<PinRef compName="VT13" pinName="4"/>
			<PinRef compName="VT13" pinName="5"/>
			<PinRef compName="VT13" pinName="6"/>
			<PinRef compName="XP3" pinName="14"/>
		</Net>
		<Net name="REL_N500R_G27">
			<PinRef compName="R35" pinName="1"/>
			<PinRef compName="R35" pinName="2"/>
			<PinRef compName="VT14" pinName="2"/>
			<PinRef compName="VT14" pinName="7"/>
			<PinRef compName="VT14" pinName="8"/>
			<PinRef compName="DD7" pinName="6"/>
			<PinRef compName="XP3" pinName="15"/>
		</Net>
		<Net name="RX">
			<PinRef compName="DD2" pinName="2"/>
			<PinRef compName="DD3" pinName="20"/>
		</Net>
		<Net name="TX">
			<PinRef compName="DD2" pinName="3"/>
			<PinRef compName="DD3" pinName="19"/>
		</Net>
		<Net name="NET00064">
			<PinRef compName="KA3" pinName="2"/>
			<PinRef compName="KA3" pinName="7"/>
		</Net>
		<Net name="REL_HART_1_G33">
			<PinRef compName="R41" pinName="1"/>
			<PinRef compName="R41" pinName="2"/>
			<PinRef compName="VT17" pinName="2"/>
			<PinRef compName="VT17" pinName="7"/>
			<PinRef compName="VT17" pinName="8"/>
			<PinRef compName="DD8" pinName="2"/>
			<PinRef compName="XP3" pinName="31"/>
		</Net>
		<Net name="-V">
			<PinRef compName="J4" pinName="2"/>
			<PinRef compName="KA5" pinName="3"/>
			<PinRef compName="XP3" pinName="55"/>
		</Net>
		<Net name="REL_RESERVE1_G11">
			<PinRef compName="R19" pinName="1"/>
			<PinRef compName="R19" pinName="2"/>
			<PinRef compName="VT6" pinName="2"/>
			<PinRef compName="VT6" pinName="7"/>
			<PinRef compName="VT6" pinName="8"/>
			<PinRef compName="DD5" pinName="6"/>
			<PinRef compName="XP3" pinName="9"/>
		</Net>
		<Net name="REL_HART_2_G34">
			<PinRef compName="VT17" pinName="4"/>
			<PinRef compName="VT17" pinName="5"/>
			<PinRef compName="VT17" pinName="6"/>
			<PinRef compName="DD8" pinName="5"/>
			<PinRef compName="R42" pinName="1"/>
			<PinRef compName="R42" pinName="2"/>
			<PinRef compName="XP3" pinName="32"/>
		</Net>
		<Net name="REL_HART_3_G35">
			<PinRef compName="DD8" pinName="6"/>
			<PinRef compName="R43" pinName="1"/>
			<PinRef compName="R43" pinName="2"/>
			<PinRef compName="VT18" pinName="2"/>
			<PinRef compName="VT18" pinName="7"/>
			<PinRef compName="VT18" pinName="8"/>
			<PinRef compName="XP3" pinName="33"/>
		</Net>
		<Net name="REL_HART_4_G36">
			<PinRef compName="R44" pinName="1"/>
			<PinRef compName="R44" pinName="2"/>
			<PinRef compName="DD8" pinName="9"/>
			<PinRef compName="VT18" pinName="4"/>
			<PinRef compName="VT18" pinName="5"/>
			<PinRef compName="VT18" pinName="6"/>
			<PinRef compName="XP3" pinName="34"/>
		</Net>
		<Net name="REL_HART_5_G37">
			<PinRef compName="VT19" pinName="2"/>
			<PinRef compName="VT19" pinName="7"/>
			<PinRef compName="VT19" pinName="8"/>
			<PinRef compName="DD8" pinName="12"/>
			<PinRef compName="R45" pinName="1"/>
			<PinRef compName="R45" pinName="2"/>
			<PinRef compName="XP3" pinName="35"/>
		</Net>
		<Net name="REL_HART_6_G38">
			<PinRef compName="R46" pinName="1"/>
			<PinRef compName="R46" pinName="2"/>
			<PinRef compName="VT19" pinName="4"/>
			<PinRef compName="VT19" pinName="5"/>
			<PinRef compName="VT19" pinName="6"/>
			<PinRef compName="DD8" pinName="15"/>
			<PinRef compName="XP3" pinName="36"/>
		</Net>
		<Net name="REL_HART_7_G39">
			<PinRef compName="R47" pinName="1"/>
			<PinRef compName="R47" pinName="2"/>
			<PinRef compName="VT20" pinName="2"/>
			<PinRef compName="VT20" pinName="7"/>
			<PinRef compName="VT20" pinName="8"/>
			<PinRef compName="DD8" pinName="16"/>
			<PinRef compName="XP3" pinName="37"/>
		</Net>
		<Net name="REL_HART_8_G40">
			<PinRef compName="R48" pinName="1"/>
			<PinRef compName="R48" pinName="2"/>
			<PinRef compName="VT20" pinName="4"/>
			<PinRef compName="VT20" pinName="5"/>
			<PinRef compName="VT20" pinName="6"/>
			<PinRef compName="DD8" pinName="19"/>
			<PinRef compName="XP3" pinName="38"/>
		</Net>
		<Net name="REL_HART_9_G41">
			<PinRef compName="R49" pinName="1"/>
			<PinRef compName="R49" pinName="2"/>
			<PinRef compName="DD9" pinName="2"/>
			<PinRef compName="VT21" pinName="2"/>
			<PinRef compName="VT21" pinName="7"/>
			<PinRef compName="VT21" pinName="8"/>
			<PinRef compName="XP3" pinName="39"/>
		</Net>
		<Net name="REL_N1K_G28">
			<PinRef compName="VT14" pinName="4"/>
			<PinRef compName="VT14" pinName="5"/>
			<PinRef compName="VT14" pinName="6"/>
			<PinRef compName="DD7" pinName="9"/>
			<PinRef compName="R36" pinName="1"/>
			<PinRef compName="R36" pinName="2"/>
			<PinRef compName="XP3" pinName="16"/>
		</Net>
		<Net name="REL_N2K_G29">
			<PinRef compName="DD7" pinName="12"/>
			<PinRef compName="R37" pinName="1"/>
			<PinRef compName="R37" pinName="2"/>
			<PinRef compName="VT15" pinName="2"/>
			<PinRef compName="VT15" pinName="7"/>
			<PinRef compName="VT15" pinName="8"/>
			<PinRef compName="XP3" pinName="17"/>
		</Net>
		<Net name="REL_HART_10_G42">
			<PinRef compName="R50" pinName="1"/>
			<PinRef compName="R50" pinName="2"/>
			<PinRef compName="DD9" pinName="5"/>
			<PinRef compName="VT21" pinName="4"/>
			<PinRef compName="VT21" pinName="5"/>
			<PinRef compName="VT21" pinName="6"/>
			<PinRef compName="XP3" pinName="40"/>
		</Net>
		<Net name="+3.3V">
			<PinRef compName="R5" pinName="2"/>
			<PinRef compName="C9" pinName="1"/>
			<PinRef compName="R1" pinName="1"/>
			<PinRef compName="C7" pinName="2"/>
			<PinRef compName="DA2" pinName="2"/>
			<PinRef compName="Z3" pinName="1"/>
			<PinRef compName="C8" pinName="2"/>
			<PinRef compName="DD3" pinName="1"/>
			<PinRef compName="DD3" pinName="17"/>
			<PinRef compName="XS1" pinName="1"/>
		</Net>
		<Net name="USB_RX">
			<PinRef compName="DD2" pinName="6"/>
			<PinRef compName="DD1" pinName="5"/>
		</Net>
		<Net name="REL_HART_11_G43">
			<PinRef compName="R51" pinName="1"/>
			<PinRef compName="R51" pinName="2"/>
			<PinRef compName="VT22" pinName="2"/>
			<PinRef compName="VT22" pinName="7"/>
			<PinRef compName="VT22" pinName="8"/>
			<PinRef compName="DD9" pinName="6"/>
			<PinRef compName="XP3" pinName="41"/>
		</Net>
		<Net name="REL_HART_12_G44">
			<PinRef compName="R52" pinName="1"/>
			<PinRef compName="R52" pinName="2"/>
			<PinRef compName="VT22" pinName="4"/>
			<PinRef compName="VT22" pinName="5"/>
			<PinRef compName="VT22" pinName="6"/>
			<PinRef compName="DD9" pinName="9"/>
			<PinRef compName="XP3" pinName="42"/>
		</Net>
		<Net name="USBDM">
			<PinRef compName="Z2" pinName="3"/>
			<PinRef compName="DD1" pinName="16"/>
			<PinRef compName="XP3" pinName="45"/>
		</Net>
		<Net name="NET00053">
			<PinRef compName="C3" pinName="2"/>
			<PinRef compName="R5" pinName="1"/>
			<PinRef compName="DA2" pinName="1"/>
			<PinRef compName="R6" pinName="2"/>
		</Net>
		<Net name="PA11">
			<PinRef compName="DD3" pinName="21"/>
		</Net>
		<Net name="REL_RESERVE2_G12">
			<PinRef compName="R20" pinName="1"/>
			<PinRef compName="R20" pinName="2"/>
			<PinRef compName="VT6" pinName="4"/>
			<PinRef compName="VT6" pinName="5"/>
			<PinRef compName="VT6" pinName="6"/>
			<PinRef compName="DD5" pinName="9"/>
			<PinRef compName="XP3" pinName="10"/>
		</Net>
		<Net name="REL_R1_G15">
			<PinRef compName="R23" pinName="1"/>
			<PinRef compName="R23" pinName="2"/>
			<PinRef compName="VT8" pinName="2"/>
			<PinRef compName="VT8" pinName="7"/>
			<PinRef compName="VT8" pinName="8"/>
			<PinRef compName="DD5" pinName="16"/>
			<PinRef compName="XP3" pinName="21"/>
		</Net>
		<Net name="NET00066">
			<PinRef compName="C2" pinName="1"/>
			<PinRef compName="C5" pinName="2"/>
			<PinRef compName="R3" pinName="2"/>
			<PinRef compName="Z1" pinName="2"/>
			<PinRef compName="DD2" pinName="8"/>
			<PinRef compName="DD1" pinName="4"/>
			<PinRef compName="DD1" pinName="20"/>
		</Net>
		<Net name="REL_MV1_G5">
			<PinRef compName="R13" pinName="1"/>
			<PinRef compName="R13" pinName="2"/>
			<PinRef compName="VT3" pinName="2"/>
			<PinRef compName="VT3" pinName="7"/>
			<PinRef compName="VT3" pinName="8"/>
			<PinRef compName="DD4" pinName="12"/>
			<PinRef compName="XP3" pinName="3"/>
		</Net>
		<Net name="REL_MV2_G6">
			<PinRef compName="R14" pinName="1"/>
			<PinRef compName="R14" pinName="2"/>
			<PinRef compName="VT3" pinName="4"/>
			<PinRef compName="VT3" pinName="5"/>
			<PinRef compName="VT3" pinName="6"/>
			<PinRef compName="DD4" pinName="15"/>
			<PinRef compName="XP3" pinName="4"/>
		</Net>
		<Net name="REL_N20MA_G31">
			<PinRef compName="VT16" pinName="2"/>
			<PinRef compName="VT16" pinName="7"/>
			<PinRef compName="VT16" pinName="8"/>
			<PinRef compName="DD7" pinName="16"/>
			<PinRef compName="R39" pinName="1"/>
			<PinRef compName="R39" pinName="2"/>
			<PinRef compName="XP3" pinName="19"/>
		</Net>
		<Net name="D6">
			<PinRef compName="DD6" pinName="17"/>
			<PinRef compName="DD7" pinName="17"/>
			<PinRef compName="DD8" pinName="17"/>
			<PinRef compName="DD9" pinName="17"/>
			<PinRef compName="DD3" pinName="12"/>
			<PinRef compName="DD5" pinName="17"/>
			<PinRef compName="DD4" pinName="17"/>
		</Net>
		<Net name="D7">
			<PinRef compName="DD6" pinName="18"/>
			<PinRef compName="DD7" pinName="18"/>
			<PinRef compName="DD8" pinName="18"/>
			<PinRef compName="DD9" pinName="18"/>
			<PinRef compName="DD3" pinName="13"/>
			<PinRef compName="DD5" pinName="18"/>
			<PinRef compName="DD4" pinName="18"/>
		</Net>
		<Net name="PA12">
			<PinRef compName="DD3" pinName="22"/>
		</Net>
		<Net name="NET00054">
			<PinRef compName="C6" pinName="2"/>
			<PinRef compName="Z3" pinName="2"/>
			<PinRef compName="DD3" pinName="5"/>
		</Net>
		<Net name="-MV_IN">
			<PinRef compName="J7" pinName="1"/>
			<PinRef compName="KA1" pinName="3"/>
			<PinRef compName="XP2" pinName="2"/>
		</Net>
		<Net name="REL_NXX_G30">
			<PinRef compName="R38" pinName="1"/>
			<PinRef compName="R38" pinName="2"/>
			<PinRef compName="DD7" pinName="15"/>
			<PinRef compName="VT15" pinName="4"/>
			<PinRef compName="VT15" pinName="5"/>
			<PinRef compName="VT15" pinName="6"/>
			<PinRef compName="XP3" pinName="18"/>
		</Net>
		<Net name="USB_TX">
			<PinRef compName="DD2" pinName="7"/>
			<PinRef compName="DD1" pinName="1"/>
		</Net>
		<Net name="PF1">
			<PinRef compName="DD3" pinName="3"/>
		</Net>
		<Net name="PA15">
			<PinRef compName="DD3" pinName="25"/>
		</Net>
		<Net name="-V_IN">
			<PinRef compName="J7" pinName="2"/>
			<PinRef compName="XP2" pinName="4"/>
			<PinRef compName="KA2" pinName="3"/>
		</Net>
		<Net name="PF0">
			<PinRef compName="DD3" pinName="2"/>
		</Net>
		<Net name="+5V">
			<PinRef compName="C17" pinName="2"/>
			<PinRef compName="R8" pinName="2"/>
			<PinRef compName="C12" pinName="2"/>
			<PinRef compName="C15" pinName="2"/>
			<PinRef compName="C16" pinName="2"/>
			<PinRef compName="DA1" pinName="1"/>
			<PinRef compName="DA2" pinName="3"/>
			<PinRef compName="DA2" pinName="4"/>
			<PinRef compName="C18" pinName="1"/>
			<PinRef compName="R7" pinName="2"/>
			<PinRef compName="XS2" pinName="1"/>
			<PinRef compName="C13" pinName="2"/>
			<PinRef compName="C10" pinName="2"/>
			<PinRef compName="C11" pinName="2"/>
			<PinRef compName="DD2" pinName="1"/>
			<PinRef compName="C14" pinName="2"/>
			<PinRef compName="DD6" pinName="20"/>
			<PinRef compName="DD7" pinName="20"/>
			<PinRef compName="DD8" pinName="20"/>
			<PinRef compName="DD9" pinName="20"/>
			<PinRef compName="DD5" pinName="20"/>
			<PinRef compName="DD4" pinName="20"/>
			<PinRef compName="XP3" pinName="57"/>
			<PinRef compName="XP3" pinName="58"/>
		</Net>
		<Net name="REL_V_OLD_G9">
			<PinRef compName="R17" pinName="1"/>
			<PinRef compName="R17" pinName="2"/>
			<PinRef compName="VT5" pinName="2"/>
			<PinRef compName="VT5" pinName="7"/>
			<PinRef compName="VT5" pinName="8"/>
			<PinRef compName="DD5" pinName="2"/>
			<PinRef compName="XP3" pinName="7"/>
		</Net>
		<Net name="+V_IN">
			<PinRef compName="XP2" pinName="3"/>
			<PinRef compName="KA2" pinName="6"/>
		</Net>
		<Net name="-I_IN">
			<PinRef compName="XP1" pinName="2"/>
			<PinRef compName="KA3" pinName="3"/>
		</Net>
		<Net name="GNDD">
			<PinRef compName="C2" pinName="2"/>
			<PinRef compName="Z2" pinName="4"/>
			<PinRef compName="C5" pinName="1"/>
			<PinRef compName="C4" pinName="2"/>
			<PinRef compName="R4" pinName="1"/>
			<PinRef compName="DD2" pinName="5"/>
			<PinRef compName="DD1" pinName="7"/>
			<PinRef compName="DD1" pinName="18"/>
			<PinRef compName="DD1" pinName="21"/>
			<PinRef compName="DD1" pinName="25"/>
			<PinRef compName="DD1" pinName="26"/>
			<PinRef compName="XP3" pinName="48"/>
		</Net>
		<Net name="+5V_RS232">
			<PinRef compName="Z1" pinName="1"/>
			<PinRef compName="XP3" pinName="47"/>
		</Net>
		<Net name="REL_MV_TC_G7">
			<PinRef compName="VT4" pinName="2"/>
			<PinRef compName="VT4" pinName="7"/>
			<PinRef compName="VT4" pinName="8"/>
			<PinRef compName="R15" pinName="1"/>
			<PinRef compName="R15" pinName="2"/>
			<PinRef compName="DD4" pinName="16"/>
			<PinRef compName="XP3" pinName="5"/>
		</Net>
		<Net name="+I_IN">
			<PinRef compName="XP1" pinName="3"/>
			<PinRef compName="KA3" pinName="6"/>
		</Net>
		<Net name="-MV_MID">
			<PinRef compName="J2" pinName="1"/>
			<PinRef compName="KA1" pinName="4"/>
			<PinRef compName="KA4" pinName="2"/>
			<PinRef compName="KA4" pinName="5"/>
		</Net>
		<Net name="+MV_MID">
			<PinRef compName="J1" pinName="1"/>
			<PinRef compName="KA1" pinName="5"/>
			<PinRef compName="KA4" pinName="4"/>
			<PinRef compName="KA4" pinName="7"/>
		</Net>
		<Net name="-V_MID">
			<PinRef compName="J4" pinName="1"/>
			<PinRef compName="KA2" pinName="4"/>
			<PinRef compName="KA5" pinName="2"/>
			<PinRef compName="KA5" pinName="5"/>
		</Net>
		<Net name="NET00044">
			<PinRef compName="R2" pinName="2"/>
			<PinRef compName="DD3" pinName="31"/>
		</Net>
		<Net name="MCLR">
			<PinRef compName="C1" pinName="2"/>
			<PinRef compName="R1" pinName="2"/>
			<PinRef compName="DA1" pinName="3"/>
			<PinRef compName="DD6" pinName="1"/>
			<PinRef compName="DD7" pinName="1"/>
			<PinRef compName="DD8" pinName="1"/>
			<PinRef compName="DD9" pinName="1"/>
			<PinRef compName="DD3" pinName="4"/>
			<PinRef compName="XS1" pinName="5"/>
			<PinRef compName="DD5" pinName="1"/>
			<PinRef compName="DD4" pinName="1"/>
		</Net>
		<Net name="+V_MID">
			<PinRef compName="J3" pinName="1"/>
			<PinRef compName="KA2" pinName="5"/>
			<PinRef compName="KA5" pinName="4"/>
			<PinRef compName="KA5" pinName="7"/>
		</Net>
		<Net name="-I_MID">
			<PinRef compName="J6" pinName="1"/>
			<PinRef compName="KA3" pinName="4"/>
			<PinRef compName="KA6" pinName="2"/>
			<PinRef compName="KA6" pinName="5"/>
		</Net>
		<Net name="+I_MID">
			<PinRef compName="J5" pinName="1"/>
			<PinRef compName="KA3" pinName="5"/>
			<PinRef compName="KA6" pinName="4"/>
			<PinRef compName="KA6" pinName="7"/>
		</Net>
		<Net name="SWCLK">
			<PinRef compName="DD3" pinName="24"/>
			<PinRef compName="XS1" pinName="4"/>
		</Net>
		<Net name="SWDIO">
			<PinRef compName="DD3" pinName="23"/>
			<PinRef compName="XS1" pinName="3"/>
		</Net>
		<Net name="REL_R4W_G24">
			<PinRef compName="R32" pinName="1"/>
			<PinRef compName="R32" pinName="2"/>
			<PinRef compName="VT12" pinName="4"/>
			<PinRef compName="VT12" pinName="5"/>
			<PinRef compName="VT12" pinName="6"/>
			<PinRef compName="DD6" pinName="19"/>
			<PinRef compName="XP3" pinName="30"/>
		</Net>
		<Net name="REL_R8_G22">
			<PinRef compName="VT11" pinName="4"/>
			<PinRef compName="VT11" pinName="5"/>
			<PinRef compName="VT11" pinName="6"/>
			<PinRef compName="R30" pinName="1"/>
			<PinRef compName="R30" pinName="2"/>
			<PinRef compName="DD6" pinName="15"/>
			<PinRef compName="XP3" pinName="28"/>
		</Net>
		<Net name="REL_N0R_G25">
			<PinRef compName="DD7" pinName="2"/>
			<PinRef compName="R33" pinName="1"/>
			<PinRef compName="R33" pinName="2"/>
			<PinRef compName="VT13" pinName="2"/>
			<PinRef compName="VT13" pinName="7"/>
			<PinRef compName="VT13" pinName="8"/>
			<PinRef compName="XP3" pinName="13"/>
		</Net>
		<Net name="REL_R3W_G23">
			<PinRef compName="VT12" pinName="2"/>
			<PinRef compName="VT12" pinName="7"/>
			<PinRef compName="VT12" pinName="8"/>
			<PinRef compName="R31" pinName="1"/>
			<PinRef compName="R31" pinName="2"/>
			<PinRef compName="DD6" pinName="16"/>
			<PinRef compName="XP3" pinName="29"/>
		</Net>
		<Net name="REL_V_NEW_G8">
			<PinRef compName="R16" pinName="1"/>
			<PinRef compName="R16" pinName="2"/>
			<PinRef compName="VT4" pinName="4"/>
			<PinRef compName="VT4" pinName="5"/>
			<PinRef compName="VT4" pinName="6"/>
			<PinRef compName="DD4" pinName="19"/>
			<PinRef compName="XP3" pinName="6"/>
		</Net>
		<Net name="USBDP">
			<PinRef compName="Z2" pinName="5"/>
			<PinRef compName="DD1" pinName="15"/>
			<PinRef compName="XP3" pinName="46"/>
		</Net>
		<Net name="+MV">
			<PinRef compName="J1" pinName="2"/>
			<PinRef compName="KA4" pinName="6"/>
			<PinRef compName="XP3" pinName="54"/>
		</Net>
		<Net name="REL_MA_G10">
			<PinRef compName="R18" pinName="1"/>
			<PinRef compName="R18" pinName="2"/>
			<PinRef compName="VT5" pinName="4"/>
			<PinRef compName="VT5" pinName="5"/>
			<PinRef compName="VT5" pinName="6"/>
			<PinRef compName="DD5" pinName="5"/>
			<PinRef compName="XP3" pinName="8"/>
		</Net>
		<Net name="REL_RESERVE3_G13">
			<PinRef compName="R21" pinName="1"/>
			<PinRef compName="R21" pinName="2"/>
			<PinRef compName="VT7" pinName="2"/>
			<PinRef compName="VT7" pinName="7"/>
			<PinRef compName="VT7" pinName="8"/>
			<PinRef compName="DD5" pinName="12"/>
			<PinRef compName="XP3" pinName="11"/>
		</Net>
		<Net name="REL_R2_G16">
			<PinRef compName="VT8" pinName="4"/>
			<PinRef compName="VT8" pinName="5"/>
			<PinRef compName="VT8" pinName="6"/>
			<PinRef compName="R24" pinName="1"/>
			<PinRef compName="R24" pinName="2"/>
			<PinRef compName="DD5" pinName="19"/>
			<PinRef compName="XP3" pinName="22"/>
		</Net>
		<Net name="REL_R3_G17">
			<PinRef compName="VT9" pinName="2"/>
			<PinRef compName="VT9" pinName="7"/>
			<PinRef compName="VT9" pinName="8"/>
			<PinRef compName="R25" pinName="1"/>
			<PinRef compName="R25" pinName="2"/>
			<PinRef compName="DD6" pinName="2"/>
			<PinRef compName="XP3" pinName="23"/>
		</Net>
		<Net name="REL_R4_G18">
			<PinRef compName="R26" pinName="1"/>
			<PinRef compName="R26" pinName="2"/>
			<PinRef compName="VT9" pinName="4"/>
			<PinRef compName="VT9" pinName="5"/>
			<PinRef compName="VT9" pinName="6"/>
			<PinRef compName="DD6" pinName="5"/>
			<PinRef compName="XP3" pinName="24"/>
		</Net>
		<Net name="REL_R5_G19">
			<PinRef compName="R27" pinName="1"/>
			<PinRef compName="R27" pinName="2"/>
			<PinRef compName="DD6" pinName="6"/>
			<PinRef compName="VT10" pinName="2"/>
			<PinRef compName="VT10" pinName="7"/>
			<PinRef compName="VT10" pinName="8"/>
			<PinRef compName="XP3" pinName="25"/>
		</Net>
		<Net name="REL_R6_G20">
			<PinRef compName="R28" pinName="1"/>
			<PinRef compName="R28" pinName="2"/>
			<PinRef compName="DD6" pinName="9"/>
			<PinRef compName="VT10" pinName="4"/>
			<PinRef compName="VT10" pinName="5"/>
			<PinRef compName="VT10" pinName="6"/>
			<PinRef compName="XP3" pinName="26"/>
		</Net>
		<Net name="+V">
			<PinRef compName="J3" pinName="2"/>
			<PinRef compName="KA5" pinName="6"/>
			<PinRef compName="XP3" pinName="56"/>
		</Net>
		<Net name="REL_R7_G21">
			<PinRef compName="R29" pinName="1"/>
			<PinRef compName="R29" pinName="2"/>
			<PinRef compName="VT11" pinName="2"/>
			<PinRef compName="VT11" pinName="7"/>
			<PinRef compName="VT11" pinName="8"/>
			<PinRef compName="DD6" pinName="12"/>
			<PinRef compName="XP3" pinName="27"/>
		</Net>
		<Net name="REL_N5MA_G32">
			<PinRef compName="VT16" pinName="4"/>
			<PinRef compName="VT16" pinName="5"/>
			<PinRef compName="VT16" pinName="6"/>
			<PinRef compName="DD7" pinName="19"/>
			<PinRef compName="R40" pinName="1"/>
			<PinRef compName="R40" pinName="2"/>
			<PinRef compName="XP3" pinName="20"/>
		</Net>
		<Net name="-I">
			<PinRef compName="J6" pinName="2"/>
			<PinRef compName="KA6" pinName="3"/>
			<PinRef compName="XP3" pinName="51"/>
		</Net>
		<Net name="+I">
			<PinRef compName="J5" pinName="2"/>
			<PinRef compName="KA6" pinName="6"/>
			<PinRef compName="XP3" pinName="52"/>
		</Net>
		<Net name="-MV">
			<PinRef compName="J2" pinName="2"/>
			<PinRef compName="KA4" pinName="3"/>
			<PinRef compName="XP3" pinName="53"/>
		</Net>
		<Net name="NET00020">
			<PinRef compName="C4" pinName="1"/>
			<PinRef compName="DD1" pinName="17"/>
		</Net>
		<Net name="D2">
			<PinRef compName="DD6" pinName="7"/>
			<PinRef compName="DD7" pinName="7"/>
			<PinRef compName="DD8" pinName="7"/>
			<PinRef compName="DD9" pinName="7"/>
			<PinRef compName="DD3" pinName="8"/>
			<PinRef compName="DD5" pinName="7"/>
			<PinRef compName="DD4" pinName="7"/>
		</Net>
		<Net name="D3">
			<PinRef compName="DD6" pinName="8"/>
			<PinRef compName="DD7" pinName="8"/>
			<PinRef compName="DD8" pinName="8"/>
			<PinRef compName="DD9" pinName="8"/>
			<PinRef compName="DD3" pinName="9"/>
			<PinRef compName="DD5" pinName="8"/>
			<PinRef compName="DD4" pinName="8"/>
		</Net>
		<Net name="D4">
			<PinRef compName="DD6" pinName="13"/>
			<PinRef compName="DD7" pinName="13"/>
			<PinRef compName="DD8" pinName="13"/>
			<PinRef compName="DD9" pinName="13"/>
			<PinRef compName="DD3" pinName="10"/>
			<PinRef compName="DD5" pinName="13"/>
			<PinRef compName="DD4" pinName="13"/>
		</Net>
		<Net name="D5">
			<PinRef compName="DD6" pinName="14"/>
			<PinRef compName="DD7" pinName="14"/>
			<PinRef compName="DD8" pinName="14"/>
			<PinRef compName="DD9" pinName="14"/>
			<PinRef compName="DD3" pinName="11"/>
			<PinRef compName="DD5" pinName="14"/>
			<PinRef compName="DD4" pinName="14"/>
		</Net>
		<Net name="NET00026">
			<PinRef compName="R3" pinName="1"/>
			<PinRef compName="R4" pinName="2"/>
			<PinRef compName="DD1" pinName="19"/>
		</Net>
		<Net name="STR1">
			<PinRef compName="DD3" pinName="28"/>
			<PinRef compName="DD4" pinName="11"/>
		</Net>
		<Net name="STR2">
			<PinRef compName="DD3" pinName="27"/>
			<PinRef compName="DD5" pinName="11"/>
		</Net>
		<Net name="STR3">
			<PinRef compName="DD6" pinName="11"/>
			<PinRef compName="DD3" pinName="26"/>
		</Net>
		<Net name="STR4">
			<PinRef compName="DD7" pinName="11"/>
			<PinRef compName="DD3" pinName="15"/>
		</Net>
		<Net name="STR5">
			<PinRef compName="DD8" pinName="11"/>
			<PinRef compName="DD3" pinName="14"/>
		</Net>
		<Net name="STR6">
			<PinRef compName="DD9" pinName="11"/>
			<PinRef compName="DD3" pinName="18"/>
		</Net>
		<Net name="D1">
			<PinRef compName="DD6" pinName="4"/>
			<PinRef compName="DD7" pinName="4"/>
			<PinRef compName="DD8" pinName="4"/>
			<PinRef compName="DD9" pinName="4"/>
			<PinRef compName="DD3" pinName="7"/>
			<PinRef compName="DD5" pinName="4"/>
			<PinRef compName="DD4" pinName="4"/>
		</Net>
		<Net name="D0">
			<PinRef compName="DD6" pinName="3"/>
			<PinRef compName="DD7" pinName="3"/>
			<PinRef compName="DD8" pinName="3"/>
			<PinRef compName="DD9" pinName="3"/>
			<PinRef compName="DD3" pinName="6"/>
			<PinRef compName="DD5" pinName="3"/>
			<PinRef compName="DD4" pinName="3"/>
		</Net>
		<Net name="NET00444">
			<PinRef compName="VT24" pinName="5"/>
			<PinRef compName="VT24" pinName="6"/>
		</Net>
		<Net name="G48">
			<PinRef compName="R56" pinName="1"/>
			<PinRef compName="R56" pinName="2"/>
			<PinRef compName="VT24" pinName="4"/>
			<PinRef compName="DD9" pinName="19"/>
		</Net>
		<Net name="NET00446">
			<PinRef compName="VT24" pinName="7"/>
			<PinRef compName="VT24" pinName="8"/>
		</Net>
		<Net name="NET00448">
			<PinRef compName="VT23" pinName="5"/>
			<PinRef compName="VT23" pinName="6"/>
		</Net>
		<Net name="NET00457">
			<PinRef compName="VT23" pinName="7"/>
			<PinRef compName="VT23" pinName="8"/>
		</Net>
		<Net name="G47">
			<PinRef compName="VT24" pinName="2"/>
			<PinRef compName="R55" pinName="1"/>
			<PinRef compName="R55" pinName="2"/>
			<PinRef compName="DD9" pinName="16"/>
		</Net>
		<Net name="G46">
			<PinRef compName="R54" pinName="1"/>
			<PinRef compName="R54" pinName="2"/>
			<PinRef compName="DD9" pinName="15"/>
			<PinRef compName="VT23" pinName="4"/>
		</Net>
		<Net name="G45">
			<PinRef compName="R53" pinName="1"/>
			<PinRef compName="R53" pinName="2"/>
			<PinRef compName="DD9" pinName="12"/>
			<PinRef compName="VT23" pinName="2"/>
		</Net>
	</NetList>

	<Groups version="1.1">
		<NetGroups>
			<NetGroup name="Rel">
				<NetRef name="REL_V_OLD_G9"/>
				<NetRef name="REL_V_NEW_G8"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<NetRef name="REL_RESERVE3_G13"/>
				<NetRef name="REL_RESERVE2_G12"/>
				<NetRef name="REL_RESERVE1_G11"/>
				<NetRef name="REL_R8_G22"/>
				<NetRef name="REL_R7_G21"/>
				<NetRef name="REL_R6_G20"/>
				<NetRef name="REL_R5_G19"/>
				<NetRef name="REL_R4W_G24"/>
				<NetRef name="REL_R4_G18"/>
				<NetRef name="REL_R3W_G23"/>
				<NetRef name="REL_R3_G17"/>
				<NetRef name="REL_R2_G16"/>
				<NetRef name="REL_R1_G15"/>
				<NetRef name="REL_NXX_G30"/>
				<NetRef name="REL_N500R_G27"/>
				<NetRef name="REL_N400R_G26"/>
				<NetRef name="REL_N20MA_G31"/>
				<NetRef name="REL_N5MA_G32"/>
				<NetRef name="REL_N2K_G29"/>
				<NetRef name="REL_N1K_G28"/>
				<NetRef name="REL_N0R_G25"/>
				<NetRef name="REL_MV_TC_G7"/>
				<NetRef name="REL_MV2_G6"/>
				<NetRef name="REL_MV1_G5"/>
				<NetRef name="REL_MA_G10"/>
				<NetRef name="REL_HART_12_G44"/>
				<NetRef name="REL_HART_11_G43"/>
				<NetRef name="REL_HART_10_G42"/>
				<NetRef name="REL_HART_9_G41"/>
				<NetRef name="REL_HART_8_G40"/>
				<NetRef name="REL_HART_7_G39"/>
				<NetRef name="REL_HART_6_G38"/>
				<NetRef name="REL_HART_5_G37"/>
				<NetRef name="REL_HART_4_G36"/>
				<NetRef name="REL_HART_3_G35"/>
				<NetRef name="REL_HART_2_G34"/>
				<NetRef name="REL_HART_1_G33"/>
			</NetGroup>
			<NetGroup name="Sig">
				<NetRef name="-V_MID"/>
				<NetRef name="-V_IN"/>
				<NetRef name="-V"/>
				<NetRef name="-MV_MID"/>
				<NetRef name="-MV_IN"/>
				<NetRef name="-MV"/>
				<NetRef name="-I_MID"/>
				<NetRef name="-I_IN"/>
				<NetRef name="-I"/>
				<NetRef name="+V_MID"/>
				<NetRef name="+V_IN"/>
				<NetRef name="+V"/>
				<NetRef name="+MV_MID"/>
				<NetRef name="+MV_IN"/>
				<NetRef name="+MV"/>
				<NetRef name="+I_MID"/>
				<NetRef name="+I_IN"/>
				<NetRef name="+I"/>
			</NetGroup>
			<NetGroup name="RelIn">
				<NetRef name="+12V"/>
				<NetRef name="REL_INV_G4"/>
				<NetRef name="REL_IN_V_G2"/>
				<NetRef name="REL_IN_MV_G1"/>
				<NetRef name="REL_IN_MA_G3"/>
			</NetGroup>
			<NetGroup name="USB">
				<NetRef name="+5V_RS232"/>
				<NetRef name="NET00020"/>
				<NetRef name="NET00026"/>
				<NetRef name="NET00066"/>
				<NetRef name="GNDD"/>
				<NetRef name="USBDP"/>
				<NetRef name="USBDM"/>
				<NetRef name="USB_TX"/>
				<NetRef name="USB_RX"/>
			</NetGroup>
		</NetGroups>
	</Groups>

	<HiSpeedRules version="3.0">
		<RulesImpedances>
			<Impedance name="Z0_50" Z0="50">
				<LayerRule width="0.3">
					<LayerRef name="Top"/>
				</LayerRule>
				<LayerRule width="0.3">
					<LayerRef name="Bottom"/>
				</LayerRule>
			</Impedance>
			<ImpedanceDiff name="ZDiff_100" Z0="100">
				<LayerRule width="0.3" gap="0.3">
					<LayerRef name="Top"/>
				</LayerRule>
				<LayerRule width="0.3" gap="0.3">
					<LayerRef name="Bottom"/>
				</LayerRule>
			</ImpedanceDiff>
		</RulesImpedances>
		<SignalClusters>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="XP3" pinName="45"/>
				<Nets>
					<NetRef name="USBDM"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="XP3" pinName="45"/>
						<PinRef compName="Z2" pinName="3"/>
					</PinPair>
					<PinPair>
						<PinRef compName="XP3" pinName="45"/>
						<PinRef compName="DD1" pinName="16"/>
					</PinPair>
				</PinPairs>
				<Signal name="USBDM_Z2-3">
					<ReceiverPinRef compName="Z2" pinName="3"/>
					<Components/>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="XP3" pinName="46"/>
				<Nets>
					<NetRef name="USBDP"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="XP3" pinName="46"/>
						<PinRef compName="Z2" pinName="5"/>
					</PinPair>
					<PinPair>
						<PinRef compName="XP3" pinName="46"/>
						<PinRef compName="DD1" pinName="15"/>
					</PinPair>
				</PinPairs>
				<Signal name="USBDP_Z2-5">
					<ReceiverPinRef compName="Z2" pinName="5"/>
					<Components/>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="DD3" pinName="29"/>
				<Nets>
					<NetRef name="SCL"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="XS2" pinName="2"/>
						<PinRef compName="XP3" pinName="59"/>
					</PinPair>
				</PinPairs>
				<Signal name="SCL_XP3-59">
					<ReceiverPinRef compName="XP3" pinName="59"/>
					<Components/>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="XS2" pinName="3"/>
				<Nets>
					<NetRef name="SDA"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="XS2" pinName="3"/>
						<PinRef compName="XP3" pinName="60"/>
					</PinPair>
				</PinPairs>
				<Signal name="SDA_XP3-60">
					<ReceiverPinRef compName="XP3" pinName="60"/>
					<Components/>
				</Signal>
			</SignalCluster>
		</SignalClusters>
		<DiffSignals>
			<DiffSignal name="USB" mismatch="0.2">
				<ImpedanceRef name="ZDiff_100"/>
				<SignalRef name="USBDM_Z2-3"/>
				<SignalRef name="USBDP_Z2-5"/>
			</DiffSignal>
			<DiffSignal name="i2c" mismatch="0.2">
				<ImpedanceRef name="ZDiff_100"/>
				<SignalRef name="SCL_XP3-59"/>
				<SignalRef name="SDA_XP3-60"/>
			</DiffSignal>
		</DiffSignals>
		<SignalSearchSettings maxNetsInCluster="5" createPinPairs="on">
			<RulesDiffSignalNetsNames>
				<RuleDiffSignalNetsNames enabled="on" posStr="USBP" negStr="USBM"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="+" negStr="#"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="+" negStr="-"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="P" negStr="N"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="p" negStr="n"/>
				<RuleDiffSignalNetsNames enabled="on" posStr="H" negStr="L"/>
				<RuleDiffSignalNetsNames enabled="on" negStr="_B"/>
			</RulesDiffSignalNetsNames>
			<ExcludedNets minPinsNumber="20">
				<NetRef name="+5V"/>
				<NetRef name="GND"/>
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
			<WidthOfWires enabled="on" widthMin="0.8" widthNom="2">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="Rel"/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.8" widthNom="0.8">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="Sig"/>
				</ObjectsAffected>
			</WidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.8" widthNom="0.8">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="RelIn"/>
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
			<ClearanceNetToNet enabled="on" clrnMin="1" clrnNom="1.5">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="USB"/>
					<AllNets/>
				</ObjectsAffected>
			</ClearanceNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0.2" clrnNom="0.3">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="USB"/>
					<NetGroupRef name="USB"/>
				</ObjectsAffected>
			</ClearanceNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="1" clrnNom="1">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="Sig"/>
					<AllNets/>
				</ObjectsAffected>
			</ClearanceNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0.4" clrnNom="0.4">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="Sig"/>
					<NetGroupRef name="Sig"/>
				</ObjectsAffected>
			</ClearanceNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="1" clrnNom="1">
				<AllLayers/>
				<ObjectsAffected>
					<NetRef name="+12V"/>
					<AllNets/>
				</ObjectsAffected>
			</ClearanceNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0.3" clrnNom="0.3">
				<AllLayers/>
				<ObjectsAffected>
					<NetGroupRef name="Rel"/>
					<NetGroupRef name="Rel"/>
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
		<RulesClearancesToBoard wires="0.2" comps="0.2"/>
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
				<NetRef name="GND"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_IN_MV_G1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SCL"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SDA"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_RESERVE4_G14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_IN_V_G2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_IN_MA_G3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+MV_IN"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_INV_G4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+12V"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_N400R_G26"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_N500R_G27"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="RX"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="TX"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00064"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_1_G33"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-V"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_RESERVE1_G11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_2_G34"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_3_G35"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_4_G36"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_5_G37"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_6_G38"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_7_G39"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_8_G40"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_9_G41"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_N1K_G28"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_N2K_G29"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_10_G42"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+3.3V"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="USB_RX"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_11_G43"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_HART_12_G44"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="USBDM"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00053"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_RESERVE2_G12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_R1_G15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00066"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_MV1_G5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_MV2_G6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_N20MA_G31"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00054"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-MV_IN"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_NXX_G30"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="USB_TX"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PF1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PA15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-V_IN"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="PF0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+5V"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_V_OLD_G9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+V_IN"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-I_IN"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="GNDD"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+5V_RS232"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_MV_TC_G7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+I_IN"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-MV_MID"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+MV_MID"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-V_MID"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00044"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="MCLR"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+V_MID"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-I_MID"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+I_MID"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SWCLK"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SWDIO"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_R4W_G24"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_R8_G22"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_N0R_G25"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_R3W_G23"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_V_NEW_G8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="USBDP"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+MV"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_MA_G10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_RESERVE3_G13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_R2_G16"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_R3_G17"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_R4_G18"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_R5_G19"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_R6_G20"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+V"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_R7_G21"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="REL_N5MA_G32"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-I"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="+I"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="-MV"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00020"/>
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
				<NetRef name="NET00026"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="STR1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="STR2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="STR3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="STR4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="STR5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="STR6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="D0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00444"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="G48"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00446"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00448"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NET00457"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="G47"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="G46"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="G45"/>
			</NetProperty>
		</NetProperties>
		<PadConnectSettings mode="AutoConnect"/>
	</Rules>

	<Connectivity version="1.3">
		<Vias>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="242" y="-20"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="242" y="-30"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="242" y="-27.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="242" y="-25"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="242" y="-22.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="238" y="-20"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="238" y="-30"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="238" y="-27.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="238" y="-25"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="238" y="-22.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="240" y="-19"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="240" y="-31"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="212.5" y="-27.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="212.5" y="-22.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="212.5" y="-25"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="209.5" y="-20"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="209.5" y="-30"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="209.5" y="-27.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="209.5" y="-25"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="209.5" y="-22.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="209.5" y="27.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="209.5" y="25"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="209.5" y="22.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="209.5" y="20"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="209.5" y="30"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="212.5" y="25"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="212.5" y="27.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="212.5" y="22.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="240" y="19"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="240" y="31"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="238" y="27.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="238" y="25"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="238" y="22.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="238" y="20"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="238" y="30"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="242" y="27.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="242" y="25"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="242" y="22.5"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="242" y="20"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="242" y="30"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="NET00064"/>
				<Org x="186.055" y="-9.8425"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="NET00064"/>
				<Org x="186.055" y="-19.05"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+12V"/>
				<Org x="181.61" y="-17.78"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+12V"/>
				<Org x="181.61" y="-43.18"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+12V"/>
				<Org x="181.61" y="-30.48"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="117.4845" y="22.0217"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="SCL"/>
				<Org x="119.1253" y="18.1828"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="SDA"/>
				<Org x="118.0746" y="19.1527"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR1"/>
				<Org x="112.1235" y="19.7028"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR1"/>
				<Org x="89.0105" y="31.7237"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR2"/>
				<Org x="107.2433" y="16.4594"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR2"/>
				<Org x="89.0105" y="17.1187"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR4"/>
				<Org x="103.5118" y="15.346"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR4"/>
				<Org x="89.3266" y="2.9569"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR3"/>
				<Org x="109.2243" y="15.6301"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR3"/>
				<Org x="89.0105" y="-11.8628"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR5"/>
				<Org x="96.1636" y="-7.3057"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR5"/>
				<Org x="88.9799" y="-26.491"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR6"/>
				<Org x="97.995" y="-8.1703"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="STR6"/>
				<Org x="76.9224" y="-37.8715"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="75.6638" y="29.5295"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="75.6638" y="14.9245"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="75.654" y="-0.1632"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="75.654" y="-14.4474"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="75.654" y="42.9842"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="73.0555" y="-27.3819"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="MCLR"/>
				<Org x="88.265" y="30.48"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="MCLR"/>
				<Org x="88.265" y="15.875"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="MCLR"/>
				<Org x="88.265" y="1.27"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="MCLR"/>
				<Org x="88.265" y="-13.335"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="MCLR"/>
				<Org x="88.265" y="-27.94"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="MCLR"/>
				<Org x="88.265" y="45.085"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="GNDD"/>
				<Org x="113.9825" y="-33.9725"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+5V_RS232"/>
				<Org x="112.0775" y="-39.37"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+5V_RS232"/>
				<Org x="6.35" y="-20.955"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40_1"/>
				<NetRef name="USBDM"/>
				<Org x="6.35" y="-18.7325"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_MV2_G6"/>
				<Org x="32.385" y="41.275"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_V_NEW_G8"/>
				<Org x="51.435" y="41.275"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_MA_G10"/>
				<Org x="32.385" y="33.655"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_RESERVE2_G12"/>
				<Org x="51.435" y="33.655"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<Org x="32.385" y="26.035"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_N400R_G26"/>
				<Org x="51.435" y="26.035"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_N1K_G28"/>
				<Org x="32.385" y="18.415"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_NXX_G30"/>
				<Org x="51.435" y="18.415"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_N5MA_G32"/>
				<Org x="32.385" y="10.795"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R2_G16"/>
				<Org x="51.435" y="10.795"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R4_G18"/>
				<Org x="32.385" y="3.175"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R6_G20"/>
				<Org x="51.435" y="3.175"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R8_G22"/>
				<Org x="32.385" y="-4.445"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R4W_G24"/>
				<Org x="51.435" y="-4.445"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_2_G34"/>
				<Org x="32.385" y="-12.065"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_4_G36"/>
				<Org x="51.435" y="-12.065"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_6_G38"/>
				<Org x="32.385" y="-19.685"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_8_G40"/>
				<Org x="51.435" y="-19.685"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_10_G42"/>
				<Org x="32.385" y="-27.305"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_12_G44"/>
				<Org x="51.435" y="-27.305"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="NET00448"/>
				<Org x="32.385" y="-34.925"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="NET00457"/>
				<Org x="32.385" y="-37.465"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="NET00444"/>
				<Org x="51.435" y="-34.925"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="NET00446"/>
				<Org x="51.435" y="-37.465"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_11_G43"/>
				<Org x="41.275" y="-32.385"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_11_G43"/>
				<Org x="34.29" y="-32.385"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_7_G39"/>
				<Org x="41.275" y="-24.765"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_7_G39"/>
				<Org x="34.29" y="-24.765"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_3_G35"/>
				<Org x="41.275" y="-17.145"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_HART_3_G35"/>
				<Org x="34.29" y="-17.145"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R3W_G23"/>
				<Org x="41.275" y="-9.525"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R3W_G23"/>
				<Org x="34.29" y="-9.525"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R5_G19"/>
				<Org x="41.275" y="-1.905"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R5_G19"/>
				<Org x="34.29" y="-1.905"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R1_G15"/>
				<Org x="41.275" y="5.715"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_R1_G15"/>
				<Org x="34.29" y="5.715"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_N2K_G29"/>
				<Org x="41.275" y="13.335"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_N2K_G29"/>
				<Org x="34.29" y="13.335"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_N0R_G25"/>
				<Org x="41.275" y="20.955"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_N0R_G25"/>
				<Org x="34.29" y="20.955"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_RESERVE1_G11"/>
				<Org x="41.275" y="28.575"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_RESERVE1_G11"/>
				<Org x="34.29" y="28.575"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_MV_TC_G7"/>
				<Org x="34.29" y="36.195"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="REL_MV_TC_G7"/>
				<Org x="41.275" y="36.195"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="GND"/>
				<Org x="6.985" y="-38.1"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D4"/>
				<Org x="78.469" y="-35.9109"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D4"/>
				<Org x="78.105" y="32.0675"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D5"/>
				<Org x="79.9094" y="-36.0779"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D5"/>
				<Org x="80.645" y="32.0675"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D6"/>
				<Org x="82.6642" y="-35.0794"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D6"/>
				<Org x="83.185" y="32.0675"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D7"/>
				<Org x="84.1183" y="-35.303"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D7"/>
				<Org x="85.725" y="32.0675"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D3"/>
				<Org x="79.375" y="39.37"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D3"/>
				<Org x="79.375" y="-27.94"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D2"/>
				<Org x="81.915" y="-27.94"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D2"/>
				<Org x="81.915" y="39.0525"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D1"/>
				<Org x="84.455" y="-27.94"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D1"/>
				<Org x="84.455" y="38.735"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D0"/>
				<Org x="86.995" y="-27.94"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D0"/>
				<Org x="86.995" y="38.4175"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D4"/>
				<Org x="78.105" y="-26.3525"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D5"/>
				<Org x="80.645" y="-26.3525"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D6"/>
				<Org x="83.185" y="-26.3525"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D7"/>
				<Org x="85.725" y="-26.3525"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D3"/>
				<Org x="79.375" y="-13.335"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D2"/>
				<Org x="81.915" y="-13.335"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D1"/>
				<Org x="84.455" y="-13.335"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D0"/>
				<Org x="86.995" y="-13.335"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D4"/>
				<Org x="78.105" y="-11.7475"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D5"/>
				<Org x="80.645" y="-11.7475"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D6"/>
				<Org x="83.185" y="-11.7475"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D7"/>
				<Org x="85.725" y="-11.7475"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D3"/>
				<Org x="79.375" y="1.27"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D2"/>
				<Org x="81.915" y="1.27"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D1"/>
				<Org x="84.455" y="1.27"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D0"/>
				<Org x="86.995" y="1.27"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D4"/>
				<Org x="78.105" y="2.8575"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D5"/>
				<Org x="80.645" y="2.8575"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D6"/>
				<Org x="83.185" y="2.8575"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D7"/>
				<Org x="85.725" y="2.8575"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D3"/>
				<Org x="79.375" y="15.875"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D4"/>
				<Org x="78.105" y="17.4625"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D5"/>
				<Org x="80.645" y="17.4625"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D2"/>
				<Org x="81.915" y="15.875"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D1"/>
				<Org x="84.455" y="15.875"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D0"/>
				<Org x="86.995" y="15.875"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D6"/>
				<Org x="83.185" y="17.4625"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D7"/>
				<Org x="85.725" y="17.4625"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D3"/>
				<Org x="79.375" y="30.48"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D2"/>
				<Org x="81.915" y="30.48"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D1"/>
				<Org x="84.455" y="30.48"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D0"/>
				<Org x="86.995" y="30.48"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="G45"/>
				<Org x="46.99" y="-35.8775"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="G45"/>
				<Org x="69.215" y="-37.1475"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="G46"/>
				<Org x="46.99" y="-34.29"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="G46"/>
				<Org x="81.5384" y="-37.8715"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_10_G42"/>
				<Org x="46.99" y="-26.67"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_10_G42"/>
				<Org x="74.0351" y="-31.2087"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_9_G41"/>
				<Org x="46.99" y="-28.2575"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_9_G41"/>
				<Org x="70.1239" y="-31.1346"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_5_G37"/>
				<Org x="46.99" y="-20.6375"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_6_G38"/>
				<Org x="46.99" y="-19.05"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_1_G33"/>
				<Org x="46.99" y="-13.0175"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_2_G34"/>
				<Org x="46.99" y="-11.43"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R7_G21"/>
				<Org x="46.99" y="-5.3975"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R8_G22"/>
				<Org x="46.99" y="-3.81"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R3_G17"/>
				<Org x="46.99" y="2.2225"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R4_G18"/>
				<Org x="46.99" y="3.81"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_N20MA_G31"/>
				<Org x="46.99" y="9.8425"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_N5MA_G32"/>
				<Org x="46.99" y="11.43"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_N500R_G27"/>
				<Org x="46.99" y="17.4625"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_N1K_G28"/>
				<Org x="46.99" y="19.05"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_RESERVE3_G13"/>
				<Org x="46.99" y="25.0825"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<Org x="46.99" y="26.67"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_V_OLD_G9"/>
				<Org x="46.99" y="32.7025"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_MA_G10"/>
				<Org x="46.99" y="34.29"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_MV1_G5"/>
				<Org x="46.99" y="40.3225"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_MV2_G6"/>
				<Org x="46.99" y="41.91"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_MA_G10"/>
				<Org x="72.0212" y="28.3081"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_V_OLD_G9"/>
				<Org x="67.9829" y="28.8688"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<Org x="75.4719" y="20.9984"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_RESERVE3_G13"/>
				<Org x="74.6393" y="19.989"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_N1K_G28"/>
				<Org x="74.3433" y="17.1121"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_N500R_G27"/>
				<Org x="73.7266" y="15.3371"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_N5MA_G32"/>
				<Org x="75.2252" y="9.6613"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_N20MA_G31"/>
				<Org x="76.3478" y="8.4682"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R4_G18"/>
				<Org x="71.6882" y="-1.179"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R3_G17"/>
				<Org x="73.3722" y="-2.6064"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R8_G22"/>
				<Org x="74.2516" y="-7.605"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R7_G21"/>
				<Org x="70.2161" y="-7.6397"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_2_G34"/>
				<Org x="73.3465" y="-16.327"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_1_G33"/>
				<Org x="68.4921" y="-15.8859"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_6_G38"/>
				<Org x="72.6831" y="-22.1186"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_HART_5_G37"/>
				<Org x="68.8755" y="-22.2625"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_MV2_G6"/>
				<Org x="74.2372" y="36.689"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="+V_IN"/>
				<Org x="240.03" y="-40.9575"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="-MV_IN"/>
				<Org x="240.03" y="-37.7825"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="+MV_IN"/>
				<Org x="240.03" y="-34.6075"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="-V_IN"/>
				<Org x="240.03" y="-44.1325"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="+I_IN"/>
				<Org x="240" y="-12.065"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="-I_IN"/>
				<Org x="240" y="-14.9225"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="-I_IN"/>
				<Org x="210.5" y="-14.9225"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="+I_IN"/>
				<Org x="210.5" y="-12.065"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="-V_IN"/>
				<Org x="210.5" y="-44.1325"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="+MV_IN"/>
				<Org x="210.5" y="-34.6075"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="-MV_IN"/>
				<Org x="210.5" y="-37.7825"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="+V_IN"/>
				<Org x="210.5" y="-40.9575"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+12V"/>
				<Org x="169.6865" y="-3.4062"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+12V"/>
				<Org x="6.35" y="38.1"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D7"/>
				<Org x="94.202" y="19.958"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D7"/>
				<Org x="87.098" y="21.2748"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D6"/>
				<Org x="97.0306" y="20.5976"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D6"/>
				<Org x="87.1275" y="22.714"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D5"/>
				<Org x="93.8135" y="22.6855"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D5"/>
				<Org x="88.9993" y="24.0243"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D5"/>
				<Org x="80.645" y="23.1775"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D4"/>
				<Org x="96.0021" y="23.2701"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="D4"/>
				<Org x="88.6796" y="25.4491"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D4"/>
				<Org x="78.105" y="23.8125"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D3"/>
				<Org x="79.375" y="45.085"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D2"/>
				<Org x="80.645" y="45.085"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D1"/>
				<Org x="84.455" y="45.085"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="D0"/>
				<Org x="85.725" y="45.085"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+12V"/>
				<Org x="177.4901" y="-9.4237"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_IN_V_G2"/>
				<Org x="180.4843" y="5.3175"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_IN_V_G2"/>
				<Org x="184.15" y="-33.655"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_IN_MV_G1"/>
				<Org x="182.9753" y="5.3099"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_IN_MV_G1"/>
				<Org x="185.1025" y="-20.955"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="-MV_MID"/>
				<Org x="169.2415" y="-25.7711"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="-MV_MID"/>
				<Org x="172.2233" y="-28.8271"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_INV_G4"/>
				<Org x="173.99" y="-10.16"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+12V"/>
				<Org x="167.3225" y="-10.16"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="-V_MID"/>
				<Org x="169.2942" y="-38.5181"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="-V_MID"/>
				<Org x="172.2233" y="-41.5285"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="-I_MID"/>
				<Org x="169.4157" y="-13.2599"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="-I_MID"/>
				<Org x="172.2234" y="-16.1308"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+I"/>
				<Org x="165.522" y="-20.21"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+V"/>
				<Org x="166.1707" y="-44.0098"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+MV"/>
				<Org x="165.522" y="-32.91"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40"/>
				<NetRef name="GND"/>
				<Org x="17.78" y="-38.1"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+12V"/>
				<Org x="167.3225" y="-22.5425"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_INV_G4"/>
				<Org x="173.9225" y="-22.5425"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+12V"/>
				<Org x="167.3225" y="-35.2425"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_INV_G4"/>
				<Org x="173.9225" y="-35.2425"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+5V"/>
				<Org x="6.35" y="-32.7025"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40_1"/>
				<NetRef name="SDA"/>
				<Org x="13.6223" y="-36.3469"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40_1"/>
				<NetRef name="SCL"/>
				<Org x="13.3002" y="-35.3475"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40_1"/>
				<NetRef name="SCL"/>
				<Org x="6.35" y="-35.2425"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="+5V"/>
				<Org x="12.7" y="-33.655"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="96.2026" y="-3.9451"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="93.6109" y="-9.1825"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_MV1_G5"/>
				<Org x="68.7678" y="37.3323"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="77.9879" y="10.0718"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="89.0105" y="10.1265"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="91.7105" y="10.1447"/>
			</Via>
			<Via>
				<ViastackRef name="v70h40_1"/>
				<NetRef name="SCL"/>
				<Org x="132.6668" y="16.3745"/>
			</Via>
			<Via>
				<ViastackRef name="v70h40_1"/>
				<NetRef name="SDA"/>
				<Org x="133.6603" y="16.0347"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="109.7287" y="17.7152"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R1_G15"/>
				<Org x="71.5328" y="16.2469"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R1_G15"/>
				<Org x="67.62" y="11.8476"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R2_G16"/>
				<Org x="66.386" y="13.3168"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="REL_R2_G16"/>
				<Org x="70.5057" y="17.0687"/>
			</Via>
			<Via>
				<ViastackRef name="v70h40_1"/>
				<NetRef name="USBDM"/>
				<Org x="99.3573" y="-32.9881"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="v70h40_1"/>
				<NetRef name="USBDP"/>
				<Org x="98.425" y="-30.7975"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="NET00066"/>
				<Org x="113.9825" y="-37.1475"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="NET00066"/>
				<Org x="110.617" y="-20.0025"/>
			</Via>
			<Via fixed="on">
				<ViastackRef name="(Default)"/>
				<NetRef name="NET00066"/>
				<Org x="112.395" y="-16.8275"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="103.505" y="-8.89"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="+3.3V"/>
				<Org x="113.9825" y="24.765"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="+3.3V"/>
				<Org x="104.3068" y="12.2157"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="+3.3V"/>
				<Org x="111.6092" y="3.1845"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="+3.3V"/>
				<Org x="114.3" y="8.128"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="111.9525" y="21.4183"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="110.8075" y="27.94"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="+5V"/>
				<Org x="110.461" y="1.9953"/>
			</Via>
			<Via>
				<ViastackRef name="(Default)"/>
				<NetRef name="GND"/>
				<Org x="114.3" y="-7.9375"/>
			</Via>
		</Vias>
		<ZippedWires>
			<ZippedWire id="zwire_0">
				<LayerRef name="Top"/>
				<DiffSignalRef name="i2c"/>
				<Start x="14.3383" y="-36.9037"/>
				<TrackLine>
					<End x="14.6881" y="-38.7015"/>
				</TrackLine>
				<TrackArc>
					<Center x="17.78" y="-38.1"/>
					<End x="17.3875" y="-41.2253"/>
				</TrackArc>
				<TrackLine>
					<End x="31.6871" y="-43.0213"/>
				</TrackLine>
				<TrackArc>
					<Center x="32.385" y="-37.465"/>
					<End x="32.3309" y="-43.0647"/>
				</TrackArc>
				<TrackLine>
					<End x="33.9916" y="-43.0808"/>
				</TrackLine>
				<TrackArc>
					<Center x="34.036" y="-38.481"/>
					<End x="34.0302" y="-43.081"/>
				</TrackArc>
				<TrackLine>
					<End x="111.5654" y="-43.1796"/>
				</TrackLine>
				<TrackLine>
					<End x="111.5695" y="-43.1796"/>
				</TrackLine>
				<TrackLine>
					<End x="114.6175" y="-43.1796"/>
				</TrackLine>
				<TrackArc>
					<Center x="114.6175" y="-39.9796"/>
					<End x="117.7055" y="-40.819"/>
				</TrackArc>
				<TrackLine>
					<End x="133.0031" y="15.4606"/>
				</TrackLine>
			</ZippedWire>
			<ZippedWire id="zwire_1">
				<LayerRef name="Bottom"/>
				<DiffSignalRef name="i2c"/>
				<Start x="12.6402" y="-36.0178"/>
				<TrackLine>
					<End x="7.0209" y="-35.8612"/>
				</TrackLine>
			</ZippedWire>
			<ZippedWire id="zwire_2" fixed="on">
				<LayerRef name="Bottom"/>
				<DiffSignalRef name="USB"/>
				<Start x="7.2167" y="-19.0373"/>
				<TrackLine>
					<End x="22.9848" y="-31.936"/>
				</TrackLine>
				<TrackArcCW>
					<Center x="20.9267" y="-34.4519"/>
					<End x="23.2436" y="-32.1721"/>
				</TrackArcCW>
				<TrackLine>
					<End x="23.502" y="-32.4347"/>
				</TrackLine>
				<TrackLine>
					<End x="23.5028" y="-32.4355"/>
				</TrackLine>
				<TrackLine>
					<End x="23.7973" y="-32.735"/>
				</TrackLine>
				<TrackArcCW>
					<Center x="21.4796" y="-35.014"/>
					<End x="23.8319" y="-32.7707"/>
				</TrackArcCW>
				<TrackLine>
					<End x="30.2501" y="-39.5009"/>
				</TrackLine>
				<TrackArc>
					<Center x="32.385" y="-37.465"/>
					<End x="32.3349" y="-40.4146"/>
				</TrackArc>
				<TrackLine>
					<End x="76.8664" y="-41.171"/>
				</TrackLine>
				<TrackArc>
					<Center x="76.9224" y="-37.8715"/>
					<End x="77.0486" y="-41.1691"/>
				</TrackArc>
				<TrackLine>
					<End x="78.6679" y="-41.1071"/>
				</TrackLine>
				<TrackArc>
					<Center x="78.469" y="-35.9109"/>
					<End x="79.0508" y="-41.0783"/>
				</TrackArc>
				<TrackLine>
					<End x="80.4546" y="-40.9202"/>
				</TrackLine>
				<TrackArc>
					<Center x="79.9094" y="-36.0779"/>
					<End x="82.0047" y="-40.4773"/>
				</TrackArc>
				<TrackLine>
					<End x="93.6625" y="-34.925"/>
				</TrackLine>
			</ZippedWire>
		</ZippedWires>
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="38.093" y="37.9509"/>
							<Dot x="39.1922" y="37.9942"/>
							<Dot x="39.1087" y="40.1125"/>
							<Dot x="37.4248" y="38.8246"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="40.64"/>
					<TrackLine>
						<End x="39.878" y="40.64"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8403" y="40.64"/>
					</TrackLine>
					<TrackLine>
						<End x="39.7664" y="40.6252"/>
					</TrackLine>
					<TrackLine>
						<End x="39.7316" y="40.6108"/>
					</TrackLine>
					<TrackLine>
						<End x="39.5514" y="40.5357"/>
					</TrackLine>
					<TrackLine>
						<End x="39.4051" y="40.4748"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1761" y="40.2559"/>
					</TrackLine>
					<TrackLine>
						<End x="39.1087" y="40.1125"/>
					</TrackLine>
					<TrackLine>
						<End x="38.093" y="37.9509"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1428" y="37.9493"/>
							<Dot x="58.2419" y="37.9925"/>
							<Dot x="58.1586" y="40.1123"/>
							<Dot x="56.4741" y="38.8227"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="40.64"/>
					<TrackLine>
						<End x="58.928" y="40.64"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8903" y="40.64"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8164" y="40.6252"/>
					</TrackLine>
					<TrackLine>
						<End x="58.7816" y="40.6108"/>
					</TrackLine>
					<TrackLine>
						<End x="58.6014" y="40.5357"/>
					</TrackLine>
					<TrackLine>
						<End x="58.4551" y="40.4748"/>
					</TrackLine>
					<TrackLine>
						<End x="58.226" y="40.2557"/>
					</TrackLine>
					<TrackLine>
						<End x="58.1586" y="40.1123"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1428" y="37.9493"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="0.8">
					<Start x="175.26" y="11.1125"/>
					<TrackLine>
						<End x="175.26" y="11.938"/>
					</TrackLine>
					<TrackLine>
						<End x="175.26" y="12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="0.8">
					<Start x="172.72" y="12.7"/>
					<TrackLine>
						<End x="172.72" y="11.938"/>
					</TrackLine>
					<TrackLine>
						<End x="172.72" y="11.9003"/>
					</TrackLine>
					<TrackLine>
						<End x="172.7348" y="11.8264"/>
					</TrackLine>
					<TrackLine>
						<End x="172.7492" y="11.7916"/>
					</TrackLine>
					<TrackLine>
						<End x="172.8243" y="11.6114"/>
					</TrackLine>
					<TrackLine>
						<End x="172.9232" y="11.3737"/>
					</TrackLine>
					<TrackLine>
						<End x="173.3516" y="11.088"/>
					</TrackLine>
					<TrackLine>
						<End x="173.609" y="11.088"/>
					</TrackLine>
					<TrackLine>
						<End x="174.879" y="11.088"/>
					</TrackLine>
					<TrackLine>
						<End x="174.9381" y="11.0901"/>
					</TrackLine>
					<TrackLine>
						<End x="175.26" y="11.1125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="0.8">
					<Start x="180.975" y="11.1125"/>
					<TrackLine>
						<End x="181.2969" y="11.0901"/>
					</TrackLine>
					<TrackLine>
						<End x="181.356" y="11.088"/>
					</TrackLine>
					<TrackLine>
						<End x="182.626" y="11.088"/>
					</TrackLine>
					<TrackLine>
						<End x="182.8834" y="11.088"/>
					</TrackLine>
					<TrackLine>
						<End x="183.3118" y="11.3737"/>
					</TrackLine>
					<TrackLine>
						<End x="183.4107" y="11.6114"/>
					</TrackLine>
					<TrackLine>
						<End x="183.4858" y="11.7916"/>
					</TrackLine>
					<TrackLine>
						<End x="183.5003" y="11.8264"/>
					</TrackLine>
					<TrackLine>
						<End x="183.515" y="11.9003"/>
					</TrackLine>
					<TrackLine>
						<End x="183.515" y="11.938"/>
					</TrackLine>
					<TrackLine>
						<End x="183.515" y="12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="0.8">
					<Start x="175.26" y="11.1125"/>
					<TrackLine>
						<End x="175.5819" y="11.0901"/>
					</TrackLine>
					<TrackLine>
						<End x="175.641" y="11.088"/>
					</TrackLine>
					<TrackLine>
						<End x="180.594" y="11.088"/>
					</TrackLine>
					<TrackLine>
						<End x="180.6531" y="11.0901"/>
					</TrackLine>
					<TrackLine>
						<End x="180.975" y="11.1125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="0.8">
					<Start x="183.515" y="12.7"/>
					<TrackLine>
						<End x="183.515" y="13.462"/>
					</TrackLine>
					<TrackLine>
						<End x="183.515" y="13.4725"/>
					</TrackLine>
					<TrackLine>
						<End x="183.5162" y="13.4935"/>
					</TrackLine>
					<TrackLine>
						<End x="183.5173" y="13.504"/>
					</TrackLine>
					<TrackLine>
						<End x="183.6994" y="15.1463"/>
					</TrackLine>
					<TrackLine>
						<End x="183.702" y="15.1696"/>
					</TrackLine>
					<TrackLine>
						<End x="183.7046" y="15.2165"/>
					</TrackLine>
					<TrackLine>
						<End x="183.7046" y="15.24"/>
					</TrackLine>
					<TrackLine>
						<End x="183.7046" y="18.288"/>
					</TrackLine>
					<TrackLine>
						<End x="183.7046" y="18.5578"/>
					</TrackLine>
					<TrackLine>
						<End x="183.3933" y="18.9987"/>
					</TrackLine>
					<TrackLine>
						<End x="183.139" y="19.089"/>
					</TrackLine>
					<TrackLine>
						<End x="180.8835" y="19.89"/>
					</TrackLine>
					<TrackLine>
						<End x="180.7838" y="19.922"/>
					</TrackLine>
					<TrackLine>
						<End x="88.6376" y="46.3826"/>
					</TrackLine>
					<TrackLine>
						<End x="88.5467" y="46.4087"/>
					</TrackLine>
					<TrackLine>
						<End x="88.3595" y="46.435"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="46.435"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="46.435"/>
					</TrackLine>
					<TrackLine>
						<End x="79.2256" y="46.435"/>
					</TrackLine>
					<TrackLine>
						<End x="78.934" y="46.3697"/>
					</TrackLine>
					<TrackLine>
						<End x="78.7989" y="46.3059"/>
					</TrackLine>
					<TrackLine>
						<End x="76.0913" y="45.0282"/>
					</TrackLine>
					<TrackLine>
						<End x="75.8682" y="44.9229"/>
					</TrackLine>
					<TrackLine>
						<End x="75.604" y="44.5062"/>
					</TrackLine>
					<TrackLine>
						<End x="75.604" y="44.2595"/>
					</TrackLine>
					<TrackLine>
						<End x="75.604" y="44.0095"/>
					</TrackLine>
					<TrackLine>
						<End x="75.6051" y="43.9672"/>
					</TrackLine>
					<TrackLine>
						<End x="75.654" y="42.9842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="0.8">
					<Start x="40.64" y="38.1"/>
					<TrackLine>
						<End x="39.878" y="38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8665" y="38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8435" y="38.0986"/>
					</TrackLine>
					<TrackLine>
						<End x="39.8321" y="38.0972"/>
					</TrackLine>
					<TrackLine>
						<End x="38.3221" y="37.9142"/>
					</TrackLine>
					<TrackLine>
						<End x="38.2653" y="37.9073"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1521" y="37.9245"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0999" y="37.9478"/>
					</TrackLine>
					<TrackLine>
						<End x="38.093" y="37.9509"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="0.8">
					<Start x="73.0555" y="-27.3819"/>
					<TrackLine>
						<End x="65.3251" y="-27.8108"/>
					</TrackLine>
					<TrackLine>
						<End x="65.3005" y="-27.8118"/>
					</TrackLine>
					<TrackLine>
						<End x="60.4621" y="-27.9399"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-27.94"/>
					</TrackLine>
					<TrackLine>
						<End x="59.69" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="0.8">
					<Start x="59.69" y="38.1"/>
					<TrackLine>
						<End x="58.928" y="38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="58.9164" y="38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8933" y="38.0986"/>
					</TrackLine>
					<TrackLine>
						<End x="58.8818" y="38.0972"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3723" y="37.9126"/>
					</TrackLine>
					<TrackLine>
						<End x="57.3144" y="37.9055"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1992" y="37.9234"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1462" y="37.9477"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1428" y="37.9493"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.099" y="2.5401"/>
					<TrackLine>
						<End x="37.9964" y="2.1629"/>
					</TrackLine>
					<TrackArc>
						<Center x="39.878" y="1.651"/>
						<End x="37.928" y="1.651"/>
					</TrackArc>
					<TrackLine>
						<End x="37.928" y="1.2736"/>
					</TrackLine>
					<TrackArc>
						<Center x="39.878" y="1.2736"/>
						<End x="37.9568" y="0.9397"/>
					</TrackArc>
					<TrackLine>
						<End x="38.1201" y="0"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.121" y="7.62"/>
							<Dot x="38.9819" y="6.7417"/>
							<Dot x="39.878" y="7.62"/>
							<Dot x="38.9819" y="8.4983"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="7.62"/>
					<TrackLine>
						<End x="40.128" y="7.62"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="7.62"/>
					</TrackLine>
					<TrackLine>
						<End x="38.121" y="7.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.122" y="-35.5599"/>
							<Dot x="38.9824" y="-36.4377"/>
							<Dot x="39.878" y="-35.5599"/>
							<Dot x="38.9824" y="-34.6821"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="-35.56"/>
					<TrackLine>
						<End x="40.128" y="-35.5599"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="-35.5599"/>
					</TrackLine>
					<TrackLine>
						<End x="38.122" y="-35.5599"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1194" y="-27.9401"/>
							<Dot x="38.9811" y="-28.8192"/>
							<Dot x="39.878" y="-27.9401"/>
							<Dot x="38.9811" y="-27.061"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="-27.94"/>
					<TrackLine>
						<End x="40.128" y="-27.9401"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="-27.9401"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1194" y="-27.9401"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1694" y="7.62"/>
							<Dot x="58.0311" y="6.7409"/>
							<Dot x="58.928" y="7.62"/>
							<Dot x="58.0311" y="8.4991"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="7.62"/>
					<TrackLine>
						<End x="59.178" y="7.62"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="7.62"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1694" y="7.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1202" y="25.3998"/>
							<Dot x="38.9816" y="24.5211"/>
							<Dot x="39.878" y="25.3998"/>
							<Dot x="38.9816" y="26.2785"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="25.4"/>
					<TrackLine>
						<End x="40.128" y="25.3998"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="25.3998"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1202" y="25.3998"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.0993" y="-20.32"/>
							<Dot x="38.9709" y="-21.2092"/>
							<Dot x="39.878" y="-20.32"/>
							<Dot x="38.9709" y="-19.4308"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="-20.32"/>
					<TrackLine>
						<End x="40.128" y="-20.32"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="-20.32"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0993" y="-20.32"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1521" y="-15.1526"/>
							<Dot x="58.0222" y="-16.0404"/>
							<Dot x="58.928" y="-15.1526"/>
							<Dot x="58.0222" y="-14.2648"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="-15.24"/>
					<TrackLine>
						<End x="59.178" y="-15.1526"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="-15.1526"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1521" y="-15.1526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.172" y="22.8601"/>
							<Dot x="58.0324" y="21.9823"/>
							<Dot x="58.928" y="22.8601"/>
							<Dot x="58.0324" y="23.7379"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="22.86"/>
					<TrackLine>
						<End x="59.178" y="22.8601"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="22.8601"/>
					</TrackLine>
					<TrackLine>
						<End x="57.172" y="22.8601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1158" y="-22.874"/>
							<Dot x="38.9792" y="-23.7549"/>
							<Dot x="39.878" y="-22.874"/>
							<Dot x="38.9792" y="-21.9931"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="-22.86"/>
					<TrackLine>
						<End x="40.128" y="-22.874"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="-22.874"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1158" y="-22.874"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.12" y="-5.08"/>
							<Dot x="38.9814" y="-5.9588"/>
							<Dot x="39.878" y="-5.08"/>
							<Dot x="38.9814" y="-4.2012"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="-5.08"/>
					<TrackLine>
						<End x="40.128" y="-5.08"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="-5.08"/>
					</TrackLine>
					<TrackLine>
						<End x="38.12" y="-5.08"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.165" y="-7.6021"/>
							<Dot x="58.0289" y="-8.4834"/>
							<Dot x="58.928" y="-7.6021"/>
							<Dot x="58.0289" y="-6.7208"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="-7.62"/>
					<TrackLine>
						<End x="59.178" y="-7.6021"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="-7.6021"/>
					</TrackLine>
					<TrackLine>
						<End x="57.165" y="-7.6021"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1483" y="2.54"/>
					<TrackLine>
						<End x="57.0455" y="2.1597"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="1.651"/>
						<End x="56.978" y="1.651"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="1.3194"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="1.3194"/>
						<End x="57.0031" y="1.0077"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1504" y="0.0979"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1201" y="0"/>
							<Dot x="38.9814" y="-0.8788"/>
							<Dot x="39.878" y="0"/>
							<Dot x="38.9814" y="0.8788"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="0"/>
					<TrackLine>
						<End x="40.128" y="0"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="0"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1201" y="0"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.0998" y="15.1383"/>
					<TrackLine>
						<End x="37.9739" y="15.7085"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="16.129"/>
						<End x="37.928" y="16.129"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="16.4553"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="16.4553"/>
						<End x="37.9535" y="16.7699"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1183" y="17.7778"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.0408" y="-37.7005"/>
							<Dot x="57.7354" y="-38.7398"/>
							<Dot x="58.8925" y="-37.9665"/>
							<Dot x="57.9998" y="-36.8988"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="-38.1"/>
					<TrackLine>
						<End x="59.178" y="-37.969"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="-37.969"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="58.928" y="-37.719"/>
						<End x="58.8925" y="-37.9665"/>
					</TrackArcCW>
					<TrackLine>
						<End x="57.0408" y="-37.7005"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1" y="-30.5804"/>
					<TrackLine>
						<End x="37.9742" y="-30.0131"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-29.591"/>
						<End x="37.928" y="-29.591"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="-29.2631"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-29.2631"/>
						<End x="37.9539" y="-28.9466"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1194" y="-27.9401"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="2">
					<Start x="6.985" y="-38.1"/>
					<TrackLine>
						<End x="5.5" y="-38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-38.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.0998" y="15.1383"/>
							<Dot x="38.9711" y="14.2494"/>
							<Dot x="39.878" y="15.1383"/>
							<Dot x="38.9711" y="16.0272"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="15.24"/>
					<TrackLine>
						<End x="40.128" y="15.1383"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="15.1383"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0998" y="15.1383"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1468" y="33.02"/>
					<TrackLine>
						<End x="57.0437" y="32.6329"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="32.131"/>
						<End x="56.978" y="32.131"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="31.7616"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="31.7616"/>
						<End x="57.0056" y="31.4344"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1652" y="30.4969"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1183" y="33.0178"/>
							<Dot x="38.9806" y="32.1381"/>
							<Dot x="39.878" y="33.0178"/>
							<Dot x="38.9806" y="33.8975"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="33.02"/>
					<TrackLine>
						<End x="40.128" y="33.0178"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="33.0178"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1183" y="33.0178"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.0997" y="30.3777"/>
							<Dot x="38.9711" y="29.4887"/>
							<Dot x="39.878" y="30.3777"/>
							<Dot x="38.9711" y="31.2667"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="30.48"/>
					<TrackLine>
						<End x="40.128" y="30.3777"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="30.3777"/>
					</TrackLine>
					<TrackLine>
						<End x="38.0997" y="30.3777"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1457" y="-20.32"/>
							<Dot x="58.019" y="-21.211"/>
							<Dot x="58.928" y="-20.32"/>
							<Dot x="58.019" y="-19.429"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="-20.32"/>
					<TrackLine>
						<End x="59.178" y="-20.32"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="-20.32"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1457" y="-20.32"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1487" y="15.1312"/>
							<Dot x="58.0205" y="14.2417"/>
							<Dot x="58.928" y="15.1312"/>
							<Dot x="58.0205" y="16.0207"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="15.24"/>
					<TrackLine>
						<End x="59.178" y="15.1312"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="15.1312"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1487" y="15.1312"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1457" y="-20.32"/>
					<TrackLine>
						<End x="57.0424" y="-20.7121"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-21.209"/>
						<End x="56.978" y="-21.209"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="-21.5766"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-21.5766"/>
						<End x="57.0055" y="-21.9029"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1645" y="-22.8397"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="75.6638" y="14.9245"/>
							<Dot x="75.7302" y="14.6835"/>
							<Dot x="76.256" y="14.8283"/>
							<Dot x="75.803" y="15.1321"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.835" y="14.2875"/>
					<TrackLine>
						<End x="76.704" y="14.7995"/>
					</TrackLine>
					<TrackLine>
						<End x="76.454" y="14.7995"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="15.0495"/>
						<End x="76.4139" y="14.8027"/>
					</TrackArcCW>
					<TrackLine>
						<End x="75.6638" y="14.9245"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="181.2969" y="11.0901"/>
					<TrackArc>
						<Center x="180.6531" y="11.0901"/>
						<End x="181.217" y="11.4008"/>
					</TrackArc>
					<TrackLine>
						<End x="181.0223" y="11.7542"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.356" y="11.938"/>
						<End x="180.975" y="11.938"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.975" y="12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.15" y="17.6796"/>
					<TrackLine>
						<End x="57.0003" y="16.6996"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="16.4052"/>
						<End x="56.978" y="16.4052"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="16.129"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="16.129"/>
						<End x="57.0221" y="15.7168"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1487" y="15.1312"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.128" y="10.16"/>
					<TrackLine>
						<End x="57.0244" y="9.6941"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="9.271"/>
						<End x="56.978" y="9.271"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="8.8971"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="8.8971"/>
						<End x="57.0063" y="8.5658"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1694" y="7.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1158" y="-22.874"/>
					<TrackLine>
						<End x="37.955" y="-21.9176"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-21.5943"/>
						<End x="37.928" y="-21.5943"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="-21.209"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-21.209"/>
						<End x="37.9968" y="-20.6956"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.0993" y="-20.32"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="93.6109" y="-9.1825"/>
					<TrackLine>
						<End x="93.2374" y="-9.766"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="92.9005" y="-9.5504"/>
						<End x="92.9005" y="-9.9504"/>
					</TrackArcCW>
					<TrackLine>
						<End x="92.5005" y="-9.9504"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="-10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1468" y="33.02"/>
							<Dot x="58.0195" y="32.1296"/>
							<Dot x="58.928" y="33.02"/>
							<Dot x="58.0195" y="33.9104"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="33.02"/>
					<TrackLine>
						<End x="59.178" y="33.02"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="33.02"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1468" y="33.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.15" y="-5.08"/>
					<TrackLine>
						<End x="57.0477" y="-5.4523"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-5.969"/>
						<End x="56.978" y="-5.969"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="-6.3385"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-6.3385"/>
						<End x="57.0056" y="-6.6656"/>
					</TrackArc>
					<TrackLine>
						<End x="57.165" y="-7.6021"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1" y="22.7596"/>
					<TrackLine>
						<End x="37.9742" y="23.3269"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="23.749"/>
						<End x="37.928" y="23.749"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="24.0767"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="24.0767"/>
						<End x="37.9541" y="24.3946"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1202" y="25.3998"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1206" y="-7.62"/>
							<Dot x="38.9818" y="-8.4985"/>
							<Dot x="39.878" y="-7.62"/>
							<Dot x="38.9818" y="-6.7415"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="-7.62"/>
					<TrackLine>
						<End x="40.128" y="-7.62"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="-7.62"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1206" y="-7.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1455" y="25.4"/>
					<TrackLine>
						<End x="57.0421" y="25.007"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="24.511"/>
						<End x="56.978" y="24.511"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="24.1345"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="24.1345"/>
						<End x="57.0074" y="23.7971"/>
					</TrackArc>
					<TrackLine>
						<End x="57.172" y="22.8601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="103.505" y="-9.0825"/>
					<TrackLine>
						<End x="103.505" y="-8.7825"/>
					</TrackLine>
					<TrackLine>
						<End x="103.505" y="-8.3825"/>
					</TrackLine>
					<TrackLine>
						<End x="103.505" y="-5.9055"/>
					</TrackLine>
					<TrackLine>
						<End x="103.505" y="-5.5055"/>
					</TrackLine>
					<TrackLine>
						<End x="103.505" y="-5.3975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1504" y="0.0979"/>
							<Dot x="58.0214" y="-0.7907"/>
							<Dot x="58.928" y="0.0979"/>
							<Dot x="58.0214" y="0.9865"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="0"/>
					<TrackLine>
						<End x="59.178" y="0.0979"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="0.0979"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1504" y="0.0979"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1483" y="2.54"/>
							<Dot x="58.0204" y="1.6503"/>
							<Dot x="58.928" y="2.54"/>
							<Dot x="58.0204" y="3.4297"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="2.54"/>
					<TrackLine>
						<End x="59.178" y="2.54"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="2.54"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1483" y="2.54"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1473" y="-27.94"/>
					<TrackLine>
						<End x="57.0443" y="-28.3248"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-28.829"/>
						<End x="56.978" y="-28.829"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="-29.1966"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-29.1966"/>
						<End x="57.0055" y="-29.5229"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1644" y="-30.4592"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1216" y="-12.7"/>
							<Dot x="38.9823" y="-13.578"/>
							<Dot x="39.878" y="-12.7"/>
							<Dot x="38.9823" y="-11.822"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="-12.7"/>
					<TrackLine>
						<End x="40.128" y="-12.7"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="-12.7"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1216" y="-12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.4">
					<Start x="104.9775" y="15.76"/>
					<TrackLine>
						<End x="105.2775" y="15.71"/>
					</TrackLine>
					<TrackLine>
						<End x="105.2775" y="15.51"/>
					</TrackLine>
					<TrackArc>
						<Center x="105.4775" y="15.51"/>
						<End x="105.2801" y="15.4776"/>
					</TrackArc>
					<TrackLine>
						<End x="105.3559" y="15.0162"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="75.654" y="-0.1632"/>
							<Dot x="75.7582" y="-0.3905"/>
							<Dot x="76.254" y="-0.1632"/>
							<Dot x="75.7582" y="0.0641"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.835" y="-0.3175"/>
					<TrackLine>
						<End x="76.704" y="-0.1632"/>
					</TrackLine>
					<TrackLine>
						<End x="76.454" y="-0.1632"/>
					</TrackLine>
					<TrackLine>
						<End x="75.654" y="-0.1632"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.12" y="-5.08"/>
					<TrackLine>
						<End x="38.0304" y="-4.8147"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-4.191"/>
						<End x="37.928" y="-4.191"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="-3.429"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-3.429"/>
						<End x="37.9312" y="-3.3181"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1201" y="0"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1652" y="30.4969"/>
							<Dot x="58.029" y="29.6157"/>
							<Dot x="58.928" y="30.4969"/>
							<Dot x="58.029" y="31.3781"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="30.48"/>
					<TrackLine>
						<End x="59.178" y="30.4969"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="30.4969"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1652" y="30.4969"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1644" y="-30.4592"/>
							<Dot x="58.0285" y="-31.3408"/>
							<Dot x="58.928" y="-30.4592"/>
							<Dot x="58.0285" y="-29.5776"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="-30.48"/>
					<TrackLine>
						<End x="59.178" y="-30.4592"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="-30.4592"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1644" y="-30.4592"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.15" y="-5.08"/>
							<Dot x="58.0212" y="-5.9688"/>
							<Dot x="58.928" y="-5.08"/>
							<Dot x="58.0212" y="-4.1912"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="-5.08"/>
					<TrackLine>
						<End x="59.178" y="-5.08"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="-5.08"/>
					</TrackLine>
					<TrackLine>
						<End x="57.15" y="-5.08"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1183" y="17.7778"/>
							<Dot x="38.9806" y="16.8981"/>
							<Dot x="39.878" y="17.7778"/>
							<Dot x="38.9806" y="18.6575"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="17.78"/>
					<TrackLine>
						<End x="40.128" y="17.7778"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="17.7778"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1183" y="17.7778"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1" y="-30.5804"/>
							<Dot x="38.9712" y="-31.4692"/>
							<Dot x="39.878" y="-30.5804"/>
							<Dot x="38.9712" y="-29.6916"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="-30.48"/>
					<TrackLine>
						<End x="40.128" y="-30.5804"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="-30.5804"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1" y="-30.5804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1483" y="-12.7"/>
							<Dot x="58.0204" y="-13.5897"/>
							<Dot x="58.928" y="-12.7"/>
							<Dot x="58.0204" y="-11.8103"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="-12.7"/>
					<TrackLine>
						<End x="59.178" y="-12.7"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="-12.7"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1483" y="-12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1223" y="-38.8777"/>
							<Dot x="39.2545" y="-39.4022"/>
							<Dot x="39.7896" y="-38.2472"/>
							<Dot x="38.6241" y="-37.7352"/>
						</Teardrop>
					</Teardrops>
					<Start x="38.1223" y="-38.8777"/>
					<TrackLine>
						<End x="39.7896" y="-38.2472"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-38.481"/>
						<End x="39.878" y="-38.231"/>
					</TrackArcCW>
					<TrackLine>
						<End x="40.128" y="-38.231"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-38.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.099" y="2.5401"/>
							<Dot x="38.9707" y="1.6508"/>
							<Dot x="39.878" y="2.5401"/>
							<Dot x="38.9707" y="3.4294"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="2.54"/>
					<TrackLine>
						<End x="40.128" y="2.5401"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="2.5401"/>
					</TrackLine>
					<TrackLine>
						<End x="38.099" y="2.5401"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="117.475" y="10.287"/>
							<Dot x="117.3269" y="10.6041"/>
							<Dot x="116.635" y="10.2808"/>
							<Dot x="117.3315" y="9.9677"/>
						</Teardrop>
					</Teardrops>
					<Start x="117.475" y="10.287"/>
					<TrackLine>
						<End x="114.9126" y="10.268"/>
					</TrackLine>
					<TrackLine>
						<End x="114.9096" y="10.268"/>
					</TrackLine>
					<TrackLine>
						<End x="114.5096" y="10.268"/>
					</TrackLine>
					<TrackLine>
						<End x="114.3" y="10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1" y="-15.3404"/>
					<TrackLine>
						<End x="37.9742" y="-14.7731"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-14.351"/>
						<End x="37.928" y="-14.351"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="-14.0234"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-14.0234"/>
						<End x="37.9545" y="-13.703"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1216" y="-12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.128" y="10.16"/>
							<Dot x="57.9961" y="9.2606"/>
							<Dot x="58.928" y="10.16"/>
							<Dot x="57.9961" y="11.0594"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="10.16"/>
					<TrackLine>
						<End x="59.178" y="10.16"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="10.16"/>
					</TrackLine>
					<TrackLine>
						<End x="57.128" y="10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="103.505" y="-5.3975"/>
					<TrackLine>
						<End x="103.7146" y="-5.3975"/>
					</TrackLine>
					<TrackLine>
						<End x="104.1146" y="-5.3975"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4354" y="-5.3975"/>
					</TrackLine>
					<TrackLine>
						<End x="105.8354" y="-5.3975"/>
					</TrackLine>
					<TrackLine>
						<End x="106.045" y="-5.3975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.122" y="-35.5599"/>
					<TrackLine>
						<End x="38.0349" y="-35.3077"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-34.671"/>
						<End x="37.928" y="-34.671"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="-33.909"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-33.909"/>
						<End x="37.9304" y="-33.813"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.0802" y="-30.7724"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-30.861"/>
						<End x="38.0993" y="-30.5849"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1" y="-30.5804"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.15" y="17.6796"/>
							<Dot x="58.0212" y="16.7908"/>
							<Dot x="58.928" y="17.6796"/>
							<Dot x="58.0212" y="18.5684"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="17.78"/>
					<TrackLine>
						<End x="59.178" y="17.6796"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="17.6796"/>
					</TrackLine>
					<TrackLine>
						<End x="57.15" y="17.6796"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="92.3925" y="4.445"/>
					<TrackLine>
						<End x="92.2845" y="4.6546"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2845" y="5.0546"/>
					</TrackLine>
					<TrackArc>
						<Center x="91.8845" y="5.0546"/>
						<End x="92.282" y="5.0996"/>
					</TrackArc>
					<TrackLine>
						<End x="91.7105" y="10.1447"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.4">
					<Start x="103.505" y="-9.0825"/>
					<TrackLine>
						<End x="104.405" y="-9.3825"/>
					</TrackLine>
					<TrackLine>
						<End x="104.605" y="-9.3825"/>
					</TrackLine>
					<TrackLine>
						<End x="108.204" y="-9.3825"/>
					</TrackLine>
					<TrackLine>
						<End x="108.404" y="-9.3825"/>
					</TrackLine>
					<TrackLine>
						<End x="108.585" y="-9.8425"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1645" y="-22.8397"/>
							<Dot x="58.0287" y="-23.7213"/>
							<Dot x="58.928" y="-22.8397"/>
							<Dot x="58.0287" y="-21.9581"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="-22.86"/>
					<TrackLine>
						<End x="59.178" y="-22.8397"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="-22.8397"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1645" y="-22.8397"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="92.3925" y="19.05"/>
					<TrackLine>
						<End x="92.2845" y="18.8404"/>
					</TrackLine>
					<TrackLine>
						<End x="92.2845" y="18.4404"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="91.8845" y="18.4404"/>
						<End x="92.2835" y="18.4127"/>
					</TrackArcCW>
					<TrackLine>
						<End x="91.7105" y="10.1447"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1514" y="-35.6517"/>
					<TrackLine>
						<End x="57.0161" y="-36.3266"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-36.71"/>
						<End x="56.978" y="-36.7116"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9784" y="-37.2126"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-37.211"/>
						<End x="57.0374" y="-37.687"/>
					</TrackArc>
					<TrackLine>
						<End x="57.0408" y="-37.7005"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="92.3925" y="4.445"/>
					<TrackLine>
						<End x="92.5005" y="4.2354"/>
					</TrackLine>
					<TrackLine>
						<End x="92.5005" y="3.8354"/>
					</TrackLine>
					<TrackArc>
						<Center x="92.9005" y="3.8354"/>
						<End x="92.5401" y="3.6619"/>
					</TrackArc>
					<TrackLine>
						<End x="96.2026" y="-3.9451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1194" y="-27.9401"/>
					<TrackLine>
						<End x="38.0291" y="-27.6708"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-27.051"/>
						<End x="37.928" y="-27.051"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="-26.289"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-26.289"/>
						<End x="37.931" y="-26.1802"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1158" y="-22.874"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1455" y="25.4"/>
							<Dot x="58.019" y="24.5089"/>
							<Dot x="58.928" y="25.4"/>
							<Dot x="58.019" y="26.2911"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="25.4"/>
					<TrackLine>
						<End x="59.178" y="25.4"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="25.4"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1455" y="25.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1" y="10.16"/>
							<Dot x="38.9712" y="9.2712"/>
							<Dot x="39.878" y="10.16"/>
							<Dot x="38.9712" y="11.0488"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="10.16"/>
					<TrackLine>
						<End x="40.128" y="10.16"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="10.16"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1" y="10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.121" y="7.62"/>
					<TrackLine>
						<End x="37.9571" y="8.5578"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="8.8935"/>
						<End x="37.928" y="8.8935"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="9.271"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="9.271"/>
						<End x="37.9977" y="9.7877"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1" y="10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1652" y="30.4969"/>
					<TrackLine>
						<End x="57.1624" y="30.4839"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="30.099"/>
						<End x="57.1229" y="30.1837"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9801" y="27.1424"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="27.051"/>
						<End x="56.978" y="27.051"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="26.289"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="26.289"/>
						<End x="57.0421" y="25.793"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1455" y="25.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1644" y="-30.4592"/>
					<TrackLine>
						<End x="57.1605" y="-30.477"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-30.861"/>
						<End x="57.1212" y="-30.7772"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9801" y="-33.8186"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-33.909"/>
						<End x="56.978" y="-33.909"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="-34.671"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-34.671"/>
						<End x="57.0256" y="-35.0994"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1345" y="-35.5829"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-35.179"/>
						<End x="57.1498" y="-35.6457"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1514" y="-35.6517"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="73.0555" y="-27.3819"/>
							<Dot x="73.0493" y="-27.6319"/>
							<Dot x="73.5945" y="-27.6455"/>
							<Dot x="73.2489" y="-27.2235"/>
						</Teardrop>
					</Teardrops>
					<Start x="73.0555" y="-27.3819"/>
					<TrackLine>
						<End x="76.3442" y="-28.9901"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.454" y="-28.7655"/>
						<End x="76.454" y="-29.0155"/>
					</TrackArc>
					<TrackLine>
						<End x="76.704" y="-29.0155"/>
					</TrackLine>
					<TrackLine>
						<End x="76.835" y="-29.5275"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1645" y="-22.8397"/>
					<TrackLine>
						<End x="57.1608" y="-22.8567"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-23.241"/>
						<End x="57.1214" y="-23.157"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9801" y="-26.1985"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-26.289"/>
						<End x="56.978" y="-26.289"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="-27.051"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-27.051"/>
						<End x="57.0443" y="-27.5552"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1473" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1992" y="37.9234"/>
					<TrackLine>
						<End x="57.1979" y="37.9115"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="37.719"/>
						<End x="57.1913" y="37.8385"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9826" y="34.8048"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="34.671"/>
						<End x="56.978" y="34.671"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="33.909"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="33.909"/>
						<End x="57.0437" y="33.4071"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1468" y="33.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="75.654" y="-14.4474"/>
							<Dot x="75.7582" y="-14.6747"/>
							<Dot x="76.254" y="-14.4474"/>
							<Dot x="75.7582" y="-14.2201"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.835" y="-14.9225"/>
					<TrackLine>
						<End x="76.704" y="-14.4474"/>
					</TrackLine>
					<TrackLine>
						<End x="76.454" y="-14.4474"/>
					</TrackLine>
					<TrackLine>
						<End x="75.654" y="-14.4474"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="89.0105" y="10.1265"/>
					<TrackLine>
						<End x="77.9879" y="10.0718"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.4">
					<Start x="102.87" y="13.6525"/>
					<TrackLine>
						<End x="103.3774" y="13.7243"/>
					</TrackLine>
					<TrackLine>
						<End x="103.5188" y="13.8657"/>
					</TrackLine>
					<TrackLine>
						<End x="103.5217" y="13.8685"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="103.6603" y="13.7243"/>
						<End x="103.5546" y="13.8941"/>
					</TrackArcCW>
					<TrackLine>
						<End x="105.3559" y="15.0162"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.0993" y="-20.32"/>
					<TrackLine>
						<End x="37.9968" y="-19.9444"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-19.431"/>
						<End x="37.928" y="-19.431"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="-18.669"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-18.669"/>
						<End x="37.9307" y="-18.5668"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1" y="-15.3404"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="117.475" y="10.287"/>
							<Dot x="117.9396" y="9.9925"/>
							<Dot x="118.5286" y="10.9217"/>
							<Dot x="117.4318" y="10.8353"/>
						</Teardrop>
					</Teardrops>
					<Start x="117.475" y="10.287"/>
					<TrackLine>
						<End x="119.8261" y="11.7032"/>
					</TrackLine>
					<TrackArc>
						<Center x="119.7229" y="11.8745"/>
						<End x="119.9229" y="11.8745"/>
					</TrackArc>
					<TrackLine>
						<End x="119.9229" y="12.0745"/>
					</TrackLine>
					<TrackLine>
						<End x="120.3325" y="12.3825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1216" y="-12.7"/>
					<TrackLine>
						<End x="38.0339" y="-12.4449"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-11.811"/>
						<End x="37.928" y="-11.811"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="-11.049"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-11.049"/>
						<End x="37.9312" y="-10.9378"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1206" y="-7.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="92.3925" y="-39.37"/>
					<TrackLine>
						<End x="92.3925" y="-39.1604"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="-38.7604"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="-25.3746"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="-24.9746"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="-24.765"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="116.5225" y="1.5875"/>
							<Dot x="116.8196" y="2.0504"/>
							<Dot x="115.8937" y="2.6446"/>
							<Dot x="115.974" y="1.5474"/>
						</Teardrop>
					</Teardrops>
					<Start x="114.3" y="10.16"/>
					<TrackLine>
						<End x="113.8904" y="10.052"/>
					</TrackLine>
					<TrackLine>
						<End x="113.6904" y="10.052"/>
					</TrackLine>
					<TrackLine>
						<End x="113.5169" y="9.7525"/>
					</TrackLine>
					<TrackArc>
						<Center x="113.6904" y="9.652"/>
						<End x="113.5106" y="9.7407"/>
					</TrackArc>
					<TrackLine>
						<End x="113.1075" y="8.9236"/>
					</TrackLine>
					<TrackArc>
						<Center x="113.6904" y="8.636"/>
						<End x="113.0404" y="8.636"/>
					</TrackArc>
					<TrackLine>
						<End x="113.0404" y="7.62"/>
					</TrackLine>
					<TrackArc>
						<Center x="113.6904" y="7.62"/>
						<End x="113.1318" y="7.2877"/>
					</TrackArc>
					<TrackLine>
						<End x="116.5225" y="1.5875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="2">
					<Start x="38.1223" y="-38.8777"/>
					<TrackLine>
						<End x="36.1774" y="-39.793"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="35.56" y="-38.481"/>
						<End x="35.56" y="-39.931"/>
					</TrackArcCW>
					<TrackLine>
						<End x="34.036" y="-39.931"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="-38.481"/>
						<End x="34.022" y="-39.9309"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.3613" y="-39.9149"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-37.465"/>
						<End x="32.0797" y="-39.8959"/>
					</TrackArcCW>
					<TrackLine>
						<End x="17.78" y="-38.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1521" y="37.9245"/>
					<TrackLine>
						<End x="38.1502" y="37.9068"/>
					</TrackLine>
					<TrackArc>
						<Center x="39.878" y="37.719"/>
						<End x="38.1442" y="37.8399"/>
					</TrackArc>
					<TrackLine>
						<End x="37.9327" y="34.8066"/>
					</TrackLine>
					<TrackArc>
						<Center x="39.878" y="34.671"/>
						<End x="37.928" y="34.671"/>
					</TrackArc>
					<TrackLine>
						<End x="37.928" y="33.909"/>
					</TrackLine>
					<TrackArc>
						<Center x="39.878" y="33.909"/>
						<End x="38.0255" y="33.3001"/>
					</TrackArc>
					<TrackLine>
						<End x="38.1183" y="33.0178"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1" y="22.7596"/>
							<Dot x="38.9712" y="21.8708"/>
							<Dot x="39.878" y="22.7596"/>
							<Dot x="38.9712" y="23.6484"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="22.86"/>
					<TrackLine>
						<End x="40.128" y="22.7596"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="22.7596"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1" y="22.7596"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.099" y="2.5401"/>
					<TrackLine>
						<End x="37.9964" y="2.9169"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="3.429"/>
						<End x="37.928" y="3.429"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="4.191"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="4.191"/>
						<End x="37.9312" y="4.3024"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.121" y="7.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="131.1275" y="23.8125"/>
							<Dot x="131.2942" y="23.4489"/>
							<Dot x="132.0875" y="23.8125"/>
							<Dot x="131.2942" y="24.1761"/>
						</Teardrop>
					</Teardrops>
					<Start x="131.1275" y="23.8125"/>
					<TrackLine>
						<End x="133.1595" y="23.8125"/>
					</TrackLine>
					<TrackLine>
						<End x="133.5595" y="23.8125"/>
					</TrackLine>
					<TrackLine>
						<End x="133.6675" y="23.8125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1183" y="33.0178"/>
					<TrackLine>
						<End x="37.9535" y="32.0095"/>
					</TrackLine>
					<TrackArc>
						<Center x="39.878" y="31.695"/>
						<End x="37.928" y="31.695"/>
					</TrackArc>
					<TrackLine>
						<End x="37.928" y="31.369"/>
					</TrackLine>
					<TrackArc>
						<Center x="39.878" y="31.369"/>
						<End x="37.9737" y="30.9492"/>
					</TrackArc>
					<TrackLine>
						<End x="38.0997" y="30.3777"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="117.7925" y="20.6375"/>
					<TrackLine>
						<End x="117.6845" y="20.8471"/>
					</TrackLine>
					<TrackLine>
						<End x="117.6845" y="21.2471"/>
					</TrackLine>
					<TrackArc>
						<Center x="117.2845" y="21.2471"/>
						<End x="117.6699" y="21.3541"/>
					</TrackArc>
					<TrackLine>
						<End x="117.4845" y="22.0217"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="75.654" y="42.9842"/>
							<Dot x="75.7586" y="42.7571"/>
							<Dot x="76.254" y="42.9852"/>
							<Dot x="75.7578" y="43.2117"/>
						</Teardrop>
					</Teardrops>
					<Start x="75.654" y="42.9842"/>
					<TrackLine>
						<End x="76.4536" y="42.9855"/>
					</TrackLine>
					<TrackLine>
						<End x="76.454" y="42.9855"/>
					</TrackLine>
					<TrackLine>
						<End x="76.704" y="42.9855"/>
					</TrackLine>
					<TrackLine>
						<End x="76.835" y="43.4975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="38.1" y="-15.3404"/>
							<Dot x="38.9712" y="-16.2292"/>
							<Dot x="39.878" y="-15.3404"/>
							<Dot x="38.9712" y="-14.4516"/>
						</Teardrop>
					</Teardrops>
					<Start x="40.64" y="-15.24"/>
					<TrackLine>
						<End x="40.128" y="-15.3404"/>
					</TrackLine>
					<TrackLine>
						<End x="39.878" y="-15.3404"/>
					</TrackLine>
					<TrackLine>
						<End x="38.1" y="-15.3404"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1483" y="-12.7"/>
					<TrackLine>
						<End x="57.0455" y="-13.0803"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-13.589"/>
						<End x="56.978" y="-13.589"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="-13.9256"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-13.9256"/>
						<End x="57.0033" y="-14.239"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1521" y="-15.1526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="2">
					<Start x="38.1223" y="-38.8777"/>
					<TrackLine>
						<End x="38.1328" y="-38.8934"/>
					</TrackLine>
					<TrackArc>
						<Center x="39.878" y="-37.719"/>
						<End x="38.7962" y="-39.523"/>
					</TrackArc>
					<TrackLine>
						<End x="39.1323" y="-39.7245"/>
					</TrackLine>
					<TrackArc>
						<Center x="39.878" y="-38.481"/>
						<End x="39.878" y="-39.931"/>
					</TrackArc>
					<TrackLine>
						<End x="54.61" y="-39.931"/>
					</TrackLine>
					<TrackArc>
						<Center x="54.61" y="-38.481"/>
						<End x="55.759" y="-39.3655"/>
					</TrackArc>
					<TrackLine>
						<End x="57.0408" y="-37.7005"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1206" y="-7.62"/>
					<TrackLine>
						<End x="37.9572" y="-6.686"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-6.3499"/>
						<End x="37.928" y="-6.3499"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="-5.969"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-5.969"/>
						<End x="38.0304" y="-5.3453"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.12" y="-5.08"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1504" y="0.0979"/>
					<TrackLine>
						<End x="57.1461" y="0.0813"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-0.381"/>
						<End x="57.0883" y="-0.3151"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9792" y="-3.3592"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-3.429"/>
						<End x="56.978" y="-3.429"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="-4.191"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-4.191"/>
						<End x="57.0477" y="-4.7077"/>
					</TrackArc>
					<TrackLine>
						<End x="57.15" y="-5.08"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1183" y="17.7778"/>
					<TrackLine>
						<End x="38.0255" y="18.0601"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="18.669"/>
						<End x="37.928" y="18.669"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="19.431"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="19.431"/>
						<End x="37.9307" y="19.5332"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.1" y="22.7596"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1514" y="-35.6517"/>
							<Dot x="58.0219" y="-36.5398"/>
							<Dot x="58.928" y="-35.6517"/>
							<Dot x="58.0219" y="-34.7636"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="-35.56"/>
					<TrackLine>
						<End x="59.178" y="-35.6517"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="-35.6517"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1514" y="-35.6517"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1223" y="-38.8777"/>
					<TrackLine>
						<End x="38.0224" y="-38.5683"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-37.969"/>
						<End x="37.928" y="-37.969"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="-36.449"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="-36.449"/>
						<End x="38.0347" y="-35.8127"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.122" y="-35.5599"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="111.9525" y="21.4183"/>
							<Dot x="112.2158" y="21.2745"/>
							<Dot x="112.5295" y="21.849"/>
							<Dot x="111.8896" y="21.7117"/>
						</Teardrop>
					</Teardrops>
					<Start x="111.9525" y="21.4183"/>
					<TrackLine>
						<End x="112.6447" y="21.935"/>
					</TrackLine>
					<TrackArc>
						<Center x="112.3275" y="22.36"/>
						<End x="112.6985" y="21.981"/>
					</TrackArc>
					<TrackLine>
						<End x="112.7065" y="21.989"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="113.0775" y="21.61"/>
						<End x="112.8236" y="22.0756"/>
					</TrackArcCW>
					<TrackLine>
						<End x="113.0163" y="22.1807"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="113.3275" y="21.61"/>
						<End x="113.0777" y="22.2101"/>
					</TrackArcCW>
					<TrackLine>
						<End x="114.9119" y="22.9736"/>
					</TrackLine>
					<TrackLine>
						<End x="115.0533" y="23.115"/>
					</TrackLine>
					<TrackLine>
						<End x="115.4193" y="23.3282"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Start x="113.5775" y="21.36"/>
					<TrackLine>
						<End x="114.0775" y="21.36"/>
					</TrackLine>
					<TrackArc>
						<Center x="114.0775" y="21.61"/>
						<End x="114.294" y="21.4851"/>
					</TrackArc>
					<TrackLine>
						<End x="115.0647" y="22.8208"/>
					</TrackLine>
					<TrackLine>
						<End x="115.2415" y="22.9976"/>
					</TrackLine>
					<TrackLine>
						<End x="115.4193" y="23.3282"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1694" y="7.62"/>
					<TrackLine>
						<End x="57.1656" y="7.6016"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="7.239"/>
						<End x="57.1309" y="7.328"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9804" y="4.2874"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="4.191"/>
						<End x="56.978" y="4.191"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="3.429"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="3.429"/>
						<End x="57.0455" y="2.9203"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1483" y="2.54"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="109.7287" y="17.7152"/>
					<TrackLine>
						<End x="110.896" y="20.2648"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="112.1235" y="19.7028"/>
						<End x="111.1832" y="20.6714"/>
					</TrackArcCW>
					<TrackLine>
						<End x="111.9525" y="21.4183"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="92.3925" y="-24.765"/>
					<TrackLine>
						<End x="92.3925" y="-24.5554"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="-24.1554"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="-10.7696"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="-10.3696"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="-10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1487" y="15.1312"/>
					<TrackLine>
						<End x="57.1485" y="15.1301"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="14.859"/>
						<End x="57.1302" y="14.9476"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9804" y="11.907"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="11.811"/>
						<End x="56.978" y="11.811"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="11.049"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="11.049"/>
						<End x="57.0244" y="10.6259"/>
					</TrackArc>
					<TrackLine>
						<End x="57.128" y="10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.172" y="22.8601"/>
					<TrackLine>
						<End x="57.1686" y="22.8436"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="22.479"/>
						<End x="57.1335" y="22.5693"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9805" y="19.529"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="19.431"/>
						<End x="56.978" y="19.431"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="18.669"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="18.669"/>
						<End x="57.0226" y="18.2544"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1281" y="17.7694"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="18.161"/>
						<End x="57.1479" y="17.6874"/>
					</TrackArc>
					<TrackLine>
						<End x="57.15" y="17.6796"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="115.4193" y="23.3282"/>
					<TrackLine>
						<End x="115.6438" y="23.3999"/>
					</TrackLine>
					<TrackLine>
						<End x="115.9266" y="23.1171"/>
					</TrackLine>
					<TrackLine>
						<End x="115.9312" y="23.1126"/>
					</TrackLine>
					<TrackArc>
						<Center x="116.2096" y="23.4"/>
						<End x="115.9805" y="23.072"/>
					</TrackArc>
					<TrackLine>
						<End x="117.4845" y="22.0217"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="109.7287" y="17.7152"/>
							<Dot x="109.5906" y="17.9815"/>
							<Dot x="109.0096" y="17.6802"/>
							<Dot x="109.6172" y="17.4367"/>
						</Teardrop>
					</Teardrops>
					<Start x="105.3559" y="15.0162"/>
					<TrackLine>
						<End x="105.363" y="15.0146"/>
					</TrackLine>
					<TrackArc>
						<Center x="105.4775" y="15.51"/>
						<End x="105.9076" y="15.2388"/>
					</TrackArc>
					<TrackLine>
						<End x="106.0273" y="15.4286"/>
					</TrackLine>
					<TrackArc>
						<Center x="105.4775" y="15.7753"/>
						<End x="106.1275" y="15.7753"/>
					</TrackArc>
					<TrackLine>
						<End x="106.1275" y="16.01"/>
					</TrackLine>
					<TrackArc>
						<Center x="105.4775" y="16.01"/>
						<End x="106.1269" y="16.0376"/>
					</TrackArc>
					<TrackLine>
						<End x="106.111" y="16.4112"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="107.2433" y="16.4594"/>
						<End x="107.1881" y="17.5914"/>
					</TrackArcCW>
					<TrackLine>
						<End x="109.7287" y="17.7152"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.165" y="-7.6021"/>
					<TrackLine>
						<End x="57.1618" y="-7.617"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-8.001"/>
						<End x="57.1225" y="-7.9165"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9801" y="-10.9578"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-11.049"/>
						<End x="56.978" y="-11.049"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="-11.811"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-11.811"/>
						<End x="57.0455" y="-12.3197"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1483" y="-12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1" y="10.16"/>
					<TrackLine>
						<End x="37.9977" y="10.5323"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="11.049"/>
						<End x="37.928" y="11.049"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="11.811"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="11.811"/>
						<End x="37.9307" y="11.9131"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.0998" y="15.1383"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="75.6638" y="29.5295"/>
							<Dot x="75.7302" y="29.2885"/>
							<Dot x="76.256" y="29.4333"/>
							<Dot x="75.803" y="29.7371"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.835" y="28.8925"/>
					<TrackLine>
						<End x="76.704" y="29.4045"/>
					</TrackLine>
					<TrackLine>
						<End x="76.454" y="29.4045"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="29.6545"/>
						<End x="76.4139" y="29.4077"/>
					</TrackArcCW>
					<TrackLine>
						<End x="75.6638" y="29.5295"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="57.1521" y="-15.1526"/>
					<TrackLine>
						<End x="57.1494" y="-15.1632"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-15.621"/>
						<End x="57.0927" y="-15.5527"/>
					</TrackArc>
					<TrackLine>
						<End x="56.9794" y="-18.5965"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-18.669"/>
						<End x="56.978" y="-18.669"/>
					</TrackArc>
					<TrackLine>
						<End x="56.978" y="-19.431"/>
					</TrackLine>
					<TrackArc>
						<Center x="58.928" y="-19.431"/>
						<End x="57.0424" y="-19.9279"/>
					</TrackArc>
					<TrackLine>
						<End x="57.1457" y="-20.32"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="3">
					<Start x="38.1202" y="25.3998"/>
					<TrackLine>
						<End x="38.0307" y="25.6644"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="26.289"/>
						<End x="37.928" y="26.289"/>
					</TrackArcCW>
					<TrackLine>
						<End x="37.928" y="27.051"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="39.878" y="27.051"/>
						<End x="37.9307" y="27.1531"/>
					</TrackArcCW>
					<TrackLine>
						<End x="38.0997" y="30.3777"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="92.3925" y="33.655"/>
					<TrackLine>
						<End x="92.3925" y="33.4454"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="33.0454"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="19.6596"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="19.2596"/>
					</TrackLine>
					<TrackLine>
						<End x="92.3925" y="19.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="57.1473" y="-27.94"/>
							<Dot x="58.0199" y="-28.8302"/>
							<Dot x="58.928" y="-27.94"/>
							<Dot x="58.0199" y="-27.0498"/>
						</Teardrop>
					</Teardrops>
					<Start x="59.69" y="-27.94"/>
					<TrackLine>
						<End x="59.178" y="-27.94"/>
					</TrackLine>
					<TrackLine>
						<End x="58.928" y="-27.94"/>
					</TrackLine>
					<TrackLine>
						<End x="57.1473" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MV_G1"/>
				<Subwire fixed="on" width="0.8">
					<Start x="185.1025" y="-20.955"/>
					<TrackLine>
						<End x="183.4642" y="-20.955"/>
					</TrackLine>
					<TrackLine>
						<End x="183.0642" y="-20.955"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-20.955"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MV_G1"/>
				<Subwire fixed="on" width="0.8">
					<Start x="183.515" y="6.858"/>
					<TrackLine>
						<End x="183.515" y="6.096"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.88" y="6.096"/>
						<End x="183.4175" y="5.7579"/>
					</TrackArcCW>
					<TrackLine>
						<End x="183.3455" y="5.6434"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.626" y="6.096"/>
						<End x="183.0864" y="5.3815"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.9753" y="5.3099"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MV_G1"/>
				<Subwire fixed="on" width="0.8">
					<Start x="182.9753" y="5.3099"/>
					<TrackLine>
						<End x="182.9658" y="5.3119"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="183.134" y="6.096"/>
						<End x="182.6071" y="5.4915"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.4627" y="5.6173"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.88" y="6.096"/>
						<End x="182.245" y="6.096"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.245" y="6.858"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MV_G1"/>
				<Subwire fixed="on" width="0.8">
					<Start x="182.88" y="-20.955"/>
					<TrackLine>
						<End x="182.88" y="-21.4694"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-21.8694"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-23.08"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-23.88"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MV_G1"/>
				<Subwire width="0.4">
					<Start x="182.245" y="12.7"/>
					<TrackLine>
						<End x="182.245" y="13.262"/>
					</TrackLine>
					<TrackLine>
						<End x="182.245" y="13.462"/>
					</TrackLine>
					<TrackLine>
						<End x="182.245" y="15.24"/>
					</TrackLine>
					<TrackLine>
						<End x="182.245" y="15.44"/>
					</TrackLine>
					<TrackLine>
						<End x="182.245" y="15.748"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MV_G1"/>
				<Subwire width="0.4">
					<Start x="86.995" y="43.4975"/>
					<TrackLine>
						<End x="87.176" y="42.9355"/>
					</TrackLine>
					<TrackLine>
						<End x="87.176" y="42.7355"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.376" y="42.7355"/>
						<End x="87.1988" y="42.6427"/>
					</TrackArc>
					<TrackLine>
						<End x="87.3082" y="42.4339"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.884" y="42.7355"/>
						<End x="87.7495" y="42.0996"/>
					</TrackArc>
					<TrackLine>
						<End x="94.2657" y="40.7219"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="92.9005" y="34.2646"/>
						<End x="94.5192" y="40.663"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.474" y="18.9181"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.3146" y="18.288"/>
						<End x="180.5361" y="18.8991"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.7035" y="18.476"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.6354" y="18.288"/>
						<End x="181.8354" y="18.288"/>
					</TrackArcCW>
					<TrackLine>
						<End x="181.8354" y="18.088"/>
					</TrackLine>
					<TrackLine>
						<End x="182.245" y="17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SCL"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="6.35" y="-35.2425"/>
							<Dot x="6.2875" y="-35.1061"/>
							<Dot x="5.99" y="-35.2425"/>
							<Dot x="6.2875" y="-35.3789"/>
						</Teardrop>
					</Teardrops>
					<Start x="6.35" y="-35.2425"/>
					<TrackLine>
						<End x="5.5" y="-35.2425"/>
					</TrackLine>
					<TrackLine>
						<End x="5.3" y="-35.2425"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-35.56"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SCL"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="13.3002" y="-35.3475"/>
							<Dot x="13.366" y="-35.5363"/>
							<Dot x="13.7438" y="-35.4047"/>
							<Dot x="13.4118" y="-35.1815"/>
						</Teardrop>
					</Teardrops>
					<Start x="13.3002" y="-35.3475"/>
					<TrackLine>
						<End x="13.7438" y="-35.4047"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="13.6223" y="-36.3469"/>
						<End x="14.5666" y="-36.2433"/>
					</TrackArcCW>
					<TrackLine>
						<End x="14.6328" y="-36.8464"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SCL"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="131.1275" y="18.7325"/>
							<Dot x="131.3567" y="18.2325"/>
							<Dot x="132.4475" y="18.7325"/>
							<Dot x="131.3567" y="19.2325"/>
						</Teardrop>
					</Teardrops>
					<Start x="133.6675" y="18.7325"/>
					<TrackLine>
						<End x="133.4095" y="18.7325"/>
					</TrackLine>
					<TrackLine>
						<End x="133.1595" y="18.7325"/>
					</TrackLine>
					<TrackLine>
						<End x="131.1275" y="18.7325"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SCL"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="119.1253" y="18.1828"/>
							<Dot x="118.9513" y="18.4272"/>
							<Dot x="118.4181" y="18.0476"/>
							<Dot x="119.0537" y="17.8914"/>
						</Teardrop>
					</Teardrops>
					<Start x="119.1253" y="18.1828"/>
					<TrackLine>
						<End x="118.2906" y="18.0232"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="118.0746" y="19.1527"/>
						<End x="117.8442" y="18.026"/>
					</TrackArcCW>
					<TrackLine>
						<End x="115.1556" y="18.5759"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="115.4525" y="20.0279"/>
						<End x="114.9614" y="18.6295"/>
					</TrackArcCW>
					<TrackLine>
						<End x="114.2432" y="18.8818"/>
					</TrackLine>
					<TrackArc>
						<Center x="114.0775" y="18.41"/>
						<End x="114.0775" y="18.91"/>
					</TrackArc>
					<TrackLine>
						<End x="113.8775" y="18.91"/>
					</TrackLine>
					<TrackLine>
						<End x="113.5775" y="18.96"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SCL"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="132.6668" y="16.3745"/>
							<Dot x="132.49" y="16.2811"/>
							<Dot x="132.6937" y="15.8953"/>
							<Dot x="132.853" y="16.3015"/>
						</Teardrop>
					</Teardrops>
					<Start x="132.6668" y="16.3745"/>
					<TrackLine>
						<End x="132.7136" y="15.5393"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDA"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="133.6603" y="16.0347"/>
							<Dot x="133.461" y="16.0513"/>
							<Dot x="133.4247" y="15.6165"/>
							<Dot x="133.7778" y="15.8729"/>
						</Teardrop>
					</Teardrops>
					<Start x="133.6603" y="16.0347"/>
					<TrackLine>
						<End x="133.2926" y="15.3819"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDA"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="118.0746" y="19.1527"/>
							<Dot x="117.9741" y="19.4354"/>
							<Dot x="117.3574" y="19.2161"/>
							<Dot x="117.9261" y="18.892"/>
						</Teardrop>
					</Teardrops>
					<Start x="113.5775" y="19.76"/>
					<TrackLine>
						<End x="113.8775" y="19.71"/>
					</TrackLine>
					<TrackLine>
						<End x="114.0775" y="19.71"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="114.0775" y="18.21"/>
						<End x="114.5615" y="19.6298"/>
					</TrackArcCW>
					<TrackLine>
						<End x="115.059" y="19.4602"/>
					</TrackLine>
					<TrackArc>
						<Center x="115.2525" y="20.0279"/>
						<End x="115.1286" y="19.441"/>
					</TrackArc>
					<TrackLine>
						<End x="115.3201" y="19.4006"/>
					</TrackLine>
					<TrackArc>
						<Center x="115.4525" y="20.0279"/>
						<End x="115.3961" y="19.3893"/>
					</TrackArc>
					<TrackLine>
						<End x="118.0746" y="19.1527"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDA"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="13.6223" y="-36.3469"/>
							<Dot x="13.5196" y="-36.5185"/>
							<Dot x="13.8939" y="-36.7426"/>
							<Dot x="13.8194" y="-36.3127"/>
						</Teardrop>
					</Teardrops>
					<Start x="13.6223" y="-36.3469"/>
					<TrackLine>
						<End x="14.0438" y="-36.961"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDA"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="131.1275" y="21.2725"/>
							<Dot x="131.3567" y="20.7725"/>
							<Dot x="132.4475" y="21.2725"/>
							<Dot x="131.3567" y="21.7725"/>
						</Teardrop>
					</Teardrops>
					<Start x="133.6675" y="21.2725"/>
					<TrackLine>
						<End x="133.4095" y="21.2725"/>
					</TrackLine>
					<TrackLine>
						<End x="133.1595" y="21.2725"/>
					</TrackLine>
					<TrackLine>
						<End x="131.1275" y="21.2725"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="26.035"/>
							<Dot x="32.9195" y="25.7625"/>
							<Dot x="33.292" y="26.4929"/>
							<Dot x="32.4831" y="26.6269"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="26.67"/>
					<TrackLine>
						<End x="34.036" y="26.67"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="25.019"/>
						<End x="33.292" y="26.4929"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="26.035"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="26.035"/>
							<Dot x="32.4831" y="25.4431"/>
							<Dot x="33.292" y="25.5771"/>
							<Dot x="32.9195" y="26.3075"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="25.4"/>
					<TrackLine>
						<End x="34.036" y="25.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="27.051"/>
						<End x="33.292" y="25.5771"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="26.035"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="26.67"/>
							<Dot x="46.865" y="26.9427"/>
							<Dot x="46.27" y="26.67"/>
							<Dot x="46.865" y="26.3973"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="26.67"/>
					<TrackLine>
						<End x="46.028" y="26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="26.67"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<Subwire width="0.4">
					<Start x="43.688" y="26.67"/>
					<TrackLine>
						<End x="43.38" y="26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="26.67"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="75.4719" y="20.9984"/>
							<Dot x="75.6149" y="20.7347"/>
							<Dot x="76.1903" y="21.0466"/>
							<Dot x="75.5783" y="21.2789"/>
						</Teardrop>
					</Teardrops>
					<Start x="75.4719" y="20.9984"/>
					<TrackLine>
						<End x="76.9256" y="21.096"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.016" y="19.7485"/>
						<End x="77.016" y="21.099"/>
					</TrackArcCW>
					<TrackLine>
						<End x="77.216" y="21.099"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.216" y="19.7485"/>
						<End x="77.4643" y="21.076"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.1455" y="20.3874"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="19.7485"/>
						<End x="81.6018" y="20.0501"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.7112" y="19.8413"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="19.7485"/>
						<End x="81.734" y="19.7485"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.734" y="19.5485"/>
					</TrackLine>
					<TrackLine>
						<End x="81.915" y="18.9865"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_V_G2"/>
				<Subwire fixed="on" width="0.8">
					<Start x="184.15" y="-33.655"/>
					<TrackLine>
						<End x="183.4642" y="-33.655"/>
					</TrackLine>
					<TrackLine>
						<End x="183.0642" y="-33.655"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-33.655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_V_G2"/>
				<Subwire fixed="on" width="0.8">
					<Start x="180.975" y="6.858"/>
					<TrackLine>
						<End x="180.975" y="6.096"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.34" y="6.096"/>
						<End x="180.8775" y="5.7579"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.8055" y="5.6434"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.086" y="6.096"/>
						<End x="180.6401" y="5.4514"/>
					</TrackArcCW>
					<TrackLine>
						<End x="180.4843" y="5.3175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_V_G2"/>
				<Subwire fixed="on" width="0.8">
					<Start x="180.4843" y="5.3175"/>
					<TrackLine>
						<End x="180.4725" y="5.3193"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.594" y="6.096"/>
						<End x="180.1264" y="5.4641"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.9622" y="5.5856"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="180.34" y="6.096"/>
						<End x="179.705" y="6.096"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.705" y="6.858"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_V_G2"/>
				<Subwire fixed="on" width="0.8">
					<Start x="182.88" y="-33.655"/>
					<TrackLine>
						<End x="182.88" y="-34.1694"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-34.5694"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-35.78"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-36.58"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_V_G2"/>
				<Subwire width="0.4">
					<Start x="179.705" y="12.7"/>
					<TrackLine>
						<End x="179.705" y="13.262"/>
					</TrackLine>
					<TrackLine>
						<End x="179.705" y="13.462"/>
					</TrackLine>
					<TrackLine>
						<End x="179.705" y="15.24"/>
					</TrackLine>
					<TrackLine>
						<End x="179.705" y="15.44"/>
					</TrackLine>
					<TrackLine>
						<End x="179.705" y="15.748"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_V_G2"/>
				<Subwire width="0.4">
					<Start x="83.185" y="43.4975"/>
					<TrackLine>
						<End x="83.366" y="42.9355"/>
					</TrackLine>
					<TrackLine>
						<End x="83.366" y="42.7355"/>
					</TrackLine>
					<TrackArc>
						<Center x="83.566" y="42.7355"/>
						<End x="83.3888" y="42.6427"/>
					</TrackArc>
					<TrackLine>
						<End x="83.4982" y="42.4339"/>
					</TrackLine>
					<TrackArc>
						<Center x="84.074" y="42.7355"/>
						<End x="83.929" y="42.1019"/>
					</TrackArc>
					<TrackLine>
						<End x="87.5494" y="41.2733"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.884" y="42.7355"/>
						<End x="87.5737" y="41.2679"/>
					</TrackArc>
					<TrackLine>
						<End x="94.0899" y="39.8902"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="92.9005" y="34.2646"/>
						<End x="94.3298" y="39.8341"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.0457" y="18.0943"/>
					</TrackLine>
					<TrackArc>
						<Center x="179.0954" y="18.288"/>
						<End x="179.0954" y="18.088"/>
					</TrackArc>
					<TrackLine>
						<End x="179.2954" y="18.088"/>
					</TrackLine>
					<TrackLine>
						<End x="179.705" y="17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MA_G3"/>
				<Subwire fixed="on" width="0.8">
					<Start x="174.9897" y="5.4048"/>
					<TrackLine>
						<End x="175.2274" y="5.9418"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.879" y="6.096"/>
						<End x="175.26" y="6.096"/>
					</TrackArc>
					<TrackLine>
						<End x="175.26" y="6.858"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MA_G3"/>
				<Subwire fixed="on" width="0.8">
					<Start x="174.9897" y="5.4048"/>
					<TrackLine>
						<End x="182.3863" y="-7.1374"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.0418" y="-7.3406"/>
						<End x="182.4418" y="-7.3406"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.4418" y="-7.7406"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-8.255"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MA_G3"/>
				<Subwire fixed="on" width="0.8">
					<Start x="182.88" y="-8.255"/>
					<TrackLine>
						<End x="182.88" y="-8.7694"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-9.1694"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-10.38"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-11.18"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MA_G3"/>
				<Subwire fixed="on" width="0.8">
					<Start x="173.99" y="6.858"/>
					<TrackLine>
						<End x="173.99" y="6.096"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.625" y="6.096"/>
						<End x="174.4625" y="5.4821"/>
					</TrackArc>
					<TrackLine>
						<End x="174.6999" y="5.4193"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.879" y="6.096"/>
						<End x="174.9863" y="5.4043"/>
					</TrackArc>
					<TrackLine>
						<End x="174.9897" y="5.4048"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MA_G3"/>
				<Subwire width="0.4">
					<Start x="173.99" y="12.7"/>
					<TrackLine>
						<End x="173.99" y="13.262"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="13.462"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="15.24"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="15.44"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="15.748"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_IN_MA_G3"/>
				<Subwire width="0.4">
					<Start x="81.915" y="43.4975"/>
					<TrackLine>
						<End x="82.096" y="42.9355"/>
					</TrackLine>
					<TrackLine>
						<End x="82.096" y="42.7355"/>
					</TrackLine>
					<TrackArc>
						<Center x="82.296" y="42.7355"/>
						<End x="82.1188" y="42.6427"/>
					</TrackArc>
					<TrackLine>
						<End x="82.2282" y="42.4339"/>
					</TrackLine>
					<TrackArc>
						<Center x="82.804" y="42.7355"/>
						<End x="82.369" y="42.2525"/>
					</TrackArc>
					<TrackLine>
						<End x="83.0701" y="41.621"/>
					</TrackLine>
					<TrackArc>
						<Center x="84.074" y="42.7355"/>
						<End x="83.7394" y="41.2733"/>
					</TrackArc>
					<TrackLine>
						<End x="87.3597" y="40.4447"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.884" y="42.7355"/>
						<End x="87.3979" y="40.4363"/>
					</TrackArc>
					<TrackLine>
						<End x="93.9141" y="39.0586"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="92.9005" y="34.2646"/>
						<End x="94.1214" y="39.0101"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.2215" y="18.9175"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.0596" y="18.288"/>
						<End x="172.2811" y="18.8991"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.4485" y="18.476"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="173.3804" y="18.288"/>
						<End x="173.5804" y="18.288"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.5804" y="18.088"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+MV_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="241.935" y="-34.6075"/>
					<TrackLine>
						<End x="240.03" y="-34.6075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+MV_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="240.03" y="-34.6075"/>
					<TrackLine>
						<End x="238.125" y="-34.6075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+MV_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="210.5" y="-34.6075"/>
					<TrackLine>
						<End x="207" y="-34.6075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+MV_IN"/>
				<Subwire width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="207" y="-34.6075"/>
							<Dot x="207.1377" y="-34.0235"/>
							<Dot x="205.8635" y="-33.7232"/>
							<Dot x="206.4677" y="-34.8845"/>
						</Teardrop>
					</Teardrops>
					<Start x="207" y="-34.6075"/>
					<TrackLine>
						<End x="191.3716" y="-22.4482"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.88" y="-23.08"/>
						<End x="190.88" y="-22.2795"/>
					</TrackArc>
					<TrackLine>
						<End x="190.08" y="-22.2795"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.08" y="-23.08"/>
						<End x="189.851" y="-22.313"/>
					</TrackArc>
					<TrackLine>
						<End x="188.5656" y="-22.6967"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.68" y="-23.08"/>
						<End x="188.28" y="-23.08"/>
					</TrackArc>
					<TrackLine>
						<End x="188.28" y="-23.88"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire fixed="on" width="0.8">
					<Start x="171.45" y="6.858"/>
					<TrackLine>
						<End x="171.45" y="6.096"/>
					</TrackLine>
					<TrackArc>
						<Center x="171.831" y="6.096"/>
						<End x="171.6311" y="5.7716"/>
					</TrackArc>
					<TrackLine>
						<End x="172.0849" y="5.492"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire fixed="on" width="0.8">
					<Start x="172.4025" y="-5.715"/>
					<TrackLine>
						<End x="172.5867" y="-6.2294"/>
					</TrackLine>
					<TrackLine>
						<End x="172.5867" y="-6.6294"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.9867" y="-6.6294"/>
						<End x="172.6388" y="-6.8268"/>
					</TrackArc>
					<TrackLine>
						<End x="173.4704" y="-8.2926"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="173.1225" y="-8.49"/>
						<End x="173.5225" y="-8.49"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.5225" y="-8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9225" y="-8.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire fixed="on" width="0.8">
					<Start x="172.4025" y="-5.715"/>
					<TrackLine>
						<End x="172.0849" y="-5.2006"/>
					</TrackLine>
					<TrackLine>
						<End x="172.0849" y="-4.8006"/>
					</TrackLine>
					<TrackLine>
						<End x="172.0849" y="5.492"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire fixed="on" width="0.8">
					<Start x="172.0849" y="5.492"/>
					<TrackLine>
						<End x="172.5388" y="5.7716"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.339" y="6.096"/>
						<End x="172.72" y="6.096"/>
					</TrackArc>
					<TrackLine>
						<End x="172.72" y="6.858"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire width="0.4">
					<Start x="171.45" y="12.7"/>
					<TrackLine>
						<End x="171.45" y="13.262"/>
					</TrackLine>
					<TrackLine>
						<End x="171.45" y="13.462"/>
					</TrackLine>
					<TrackLine>
						<End x="171.45" y="15.24"/>
					</TrackLine>
					<TrackLine>
						<End x="171.45" y="15.44"/>
					</TrackLine>
					<TrackLine>
						<End x="171.45" y="15.748"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-35.2425"/>
					<TrackLine>
						<End x="173.9225" y="-34.69"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9225" y="-34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-22.5425"/>
					<TrackLine>
						<End x="173.9225" y="-21.99"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9225" y="-21.59"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire width="0.8">
					<Start x="173.99" y="-10.16"/>
					<TrackLine>
						<End x="173.99" y="-9.29"/>
					</TrackLine>
					<TrackLine>
						<End x="173.99" y="-8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="173.9225" y="-8.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire width="0.4">
					<Start x="78.105" y="43.4975"/>
					<TrackLine>
						<End x="78.286" y="42.9355"/>
					</TrackLine>
					<TrackLine>
						<End x="78.286" y="42.7355"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.486" y="42.7355"/>
						<End x="78.3088" y="42.6427"/>
					</TrackArc>
					<TrackLine>
						<End x="78.4182" y="42.4339"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.994" y="42.7355"/>
						<End x="78.7765" y="42.123"/>
					</TrackArc>
					<TrackLine>
						<End x="83.2876" y="40.521"/>
					</TrackLine>
					<TrackArc>
						<Center x="84.074" y="42.7355"/>
						<End x="83.5497" y="40.4447"/>
					</TrackArc>
					<TrackLine>
						<End x="87.1701" y="39.6162"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.884" y="42.7355"/>
						<End x="87.2221" y="39.6047"/>
					</TrackArc>
					<TrackLine>
						<End x="93.7383" y="38.227"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="92.9005" y="34.2646"/>
						<End x="93.9246" y="38.183"/>
					</TrackArcCW>
					<TrackLine>
						<End x="170.7898" y="18.0945"/>
					</TrackLine>
					<TrackArc>
						<Center x="170.8404" y="18.288"/>
						<End x="170.8404" y="18.088"/>
					</TrackArc>
					<TrackLine>
						<End x="171.0404" y="18.088"/>
					</TrackLine>
					<TrackLine>
						<End x="171.45" y="17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="177.4901" y="-9.4237"/>
					<TrackLine>
						<End x="178.6848" y="-8.8132"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="178.8668" y="-9.1694"/>
						<End x="178.8668" y="-8.7694"/>
					</TrackArcCW>
					<TrackLine>
						<End x="179.2668" y="-8.7694"/>
					</TrackLine>
					<TrackLine>
						<End x="179.451" y="-8.255"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="181.61" y="-17.78"/>
					<TrackLine>
						<End x="181.6076" y="-17.7826"/>
					</TrackLine>
					<TrackArc>
						<Center x="182.48" y="-18.58"/>
						<End x="181.5619" y="-17.8357"/>
					</TrackArc>
					<TrackLine>
						<End x="179.9785" y="-19.7887"/>
					</TrackLine>
					<TrackArc>
						<Center x="180.2892" y="-20.0406"/>
						<End x="179.8892" y="-20.0406"/>
					</TrackArc>
					<TrackLine>
						<End x="179.8892" y="-20.4406"/>
					</TrackLine>
					<TrackLine>
						<End x="179.451" y="-20.955"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="182.88" y="-30.48"/>
					<TrackLine>
						<End x="182.48" y="-30.48"/>
					</TrackLine>
					<TrackLine>
						<End x="181.61" y="-30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="181.61" y="-30.48"/>
					<TrackLine>
						<End x="181.6076" y="-30.4826"/>
					</TrackLine>
					<TrackArc>
						<Center x="182.48" y="-31.28"/>
						<End x="181.5619" y="-30.5357"/>
					</TrackArc>
					<TrackLine>
						<End x="179.9785" y="-32.4887"/>
					</TrackLine>
					<TrackArc>
						<Center x="180.2892" y="-32.7406"/>
						<End x="179.8892" y="-32.7406"/>
					</TrackArc>
					<TrackLine>
						<End x="179.8892" y="-33.1406"/>
					</TrackLine>
					<TrackLine>
						<End x="179.451" y="-33.655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="169.6865" y="-3.4062"/>
					<TrackLine>
						<End x="169.4197" y="-4.7211"/>
					</TrackLine>
					<TrackArc>
						<Center x="169.8117" y="-4.8006"/>
						<End x="169.4117" y="-4.8006"/>
					</TrackArc>
					<TrackLine>
						<End x="169.4117" y="-5.2006"/>
					</TrackLine>
					<TrackLine>
						<End x="168.9735" y="-5.715"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="181.61" y="-17.78"/>
					<TrackLine>
						<End x="182.48" y="-17.78"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="168.9735" y="-5.715"/>
					<TrackLine>
						<End x="168.7893" y="-6.2294"/>
					</TrackLine>
					<TrackLine>
						<End x="168.7893" y="-6.6294"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.3893" y="-6.6294"/>
						<End x="168.7234" y="-6.8493"/>
					</TrackArcCW>
					<TrackLine>
						<End x="167.7884" y="-8.2701"/>
					</TrackLine>
					<TrackArc>
						<Center x="168.1225" y="-8.49"/>
						<End x="167.7225" y="-8.49"/>
					</TrackArc>
					<TrackLine>
						<End x="167.7225" y="-8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="167.3225" y="-8.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="181.61" y="-43.18"/>
					<TrackLine>
						<End x="182.48" y="-43.18"/>
					</TrackLine>
					<TrackLine>
						<End x="182.88" y="-43.18"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-22.5425"/>
					<TrackLine>
						<End x="167.3225" y="-21.99"/>
					</TrackLine>
					<TrackLine>
						<End x="167.3225" y="-21.59"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire width="1.5">
					<Start x="2" y="38.1"/>
					<TrackLine>
						<End x="4.75" y="38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="5.5" y="38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="6.35" y="38.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-10.16"/>
					<TrackLine>
						<End x="167.3225" y="-9.29"/>
					</TrackLine>
					<TrackLine>
						<End x="167.3225" y="-8.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+12V"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-35.2425"/>
					<TrackLine>
						<End x="167.3225" y="-34.69"/>
					</TrackLine>
					<TrackLine>
						<End x="167.3225" y="-34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N400R_G26"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="26.035"/>
							<Dot x="51.5331" y="25.4431"/>
							<Dot x="52.342" y="25.5771"/>
							<Dot x="51.9695" y="26.3075"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="25.4"/>
					<TrackLine>
						<End x="53.086" y="25.4"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="27.051"/>
						<End x="52.342" y="25.5771"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="26.035"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N400R_G26"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="26.035"/>
							<Dot x="51.9695" y="25.7625"/>
							<Dot x="52.342" y="26.4929"/>
							<Dot x="51.5331" y="26.6269"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="26.67"/>
					<TrackLine>
						<End x="53.086" y="26.67"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="25.019"/>
						<End x="52.342" y="26.4929"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="26.035"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N400R_G26"/>
				<Subwire width="0.4">
					<Start x="59.69" y="26.67"/>
					<TrackLine>
						<End x="60.252" y="26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="26.67"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N400R_G26"/>
				<Subwire width="0.4">
					<Start x="83.185" y="14.2875"/>
					<TrackLine>
						<End x="83.004" y="13.7255"/>
					</TrackLine>
					<TrackLine>
						<End x="83.004" y="13.5255"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="82.804" y="13.5255"/>
						<End x="82.9334" y="13.373"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.8999" y="12.4958"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="13.5255"/>
						<End x="81.026" y="12.175"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="12.175"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="13.5255"/>
						<End x="75.7282" y="12.3866"/>
					</TrackArcCW>
					<TrackLine>
						<End x="70.9951" y="15.4032"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="71.5328" y="16.2469"/>
						<End x="70.9077" y="15.4657"/>
					</TrackArcCW>
					<TrackLine>
						<End x="69.8806" y="16.2875"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="70.5057" y="17.0687"/>
						<End x="69.5885" y="16.669"/>
					</TrackArcCW>
					<TrackLine>
						<End x="65.4613" y="26.1403"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="26.0604"/>
						<End x="65.278" y="26.2604"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="26.2604"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="26.67"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N500R_G27"/>
				<Subwire fixed="on" width="2">
					<Start x="32.7025" y="15.875"/>
					<TrackLine>
						<End x="5.6617" y="20.3068"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="19.32"/>
						<End x="5.5" y="20.32"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="20.32"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N500R_G27"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="15.875"/>
							<Dot x="33.191" y="15.5266"/>
							<Dot x="33.8625" y="16.4682"/>
							<Dot x="32.706" y="16.475"/>
						</Teardrop>
					</Teardrops>
					<Start x="32.7025" y="15.875"/>
					<TrackLine>
						<End x="33.8625" y="16.4682"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="16.129"/>
						<End x="34.036" y="16.51"/>
					</TrackArcCW>
					<TrackLine>
						<End x="34.798" y="16.51"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N500R_G27"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="15.875"/>
							<Dot x="32.706" y="15.275"/>
							<Dot x="33.8625" y="15.2818"/>
							<Dot x="33.191" y="16.2234"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="15.24"/>
					<TrackLine>
						<End x="34.036" y="15.24"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="15.621"/>
						<End x="33.8625" y="15.2818"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.7025" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N500R_G27"/>
				<Subwire width="0.4">
					<Start x="43.688" y="16.51"/>
					<TrackLine>
						<End x="43.38" y="16.51"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="16.51"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="16.51"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="16.51"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="16.51"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N500R_G27"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="73.7266" y="15.3371"/>
							<Dot x="73.6099" y="15.0607"/>
							<Dot x="74.2129" y="14.8061"/>
							<Dot x="74.0121" y="15.4291"/>
						</Teardrop>
					</Teardrops>
					<Start x="73.7266" y="15.3371"/>
					<TrackLine>
						<End x="74.8157" y="14.1478"/>
					</TrackLine>
					<TrackArc>
						<Center x="75.6638" y="14.9245"/>
						<End x="74.8882" y="14.0754"/>
					</TrackArc>
					<TrackLine>
						<End x="76.0156" y="13.0456"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.454" y="13.5255"/>
						<End x="76.454" y="12.8755"/>
					</TrackArc>
					<TrackLine>
						<End x="81.026" y="12.8755"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="13.5255"/>
						<End x="81.6018" y="13.2239"/>
					</TrackArc>
					<TrackLine>
						<End x="81.7112" y="13.4327"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.534" y="13.5255"/>
						<End x="81.734" y="13.5255"/>
					</TrackArc>
					<TrackLine>
						<End x="81.734" y="13.7255"/>
					</TrackLine>
					<TrackLine>
						<End x="81.915" y="14.2875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N500R_G27"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="17.4625"/>
							<Dot x="46.7234" y="17.6001"/>
							<Dot x="46.4232" y="17.0185"/>
							<Dot x="47.0598" y="17.1707"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="16.51"/>
					<TrackLine>
						<End x="46.028" y="16.9196"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="16.9196"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="17.1196"/>
						<End x="46.3513" y="16.9622"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="17.4625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RX"/>
				<Subwire width="0.4">
					<Start x="111.125" y="-9.8425"/>
					<TrackLine>
						<End x="111.306" y="-9.2805"/>
					</TrackLine>
					<TrackLine>
						<End x="111.306" y="-9.0805"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="111.506" y="-9.0805"/>
						<End x="111.3117" y="-9.0331"/>
					</TrackArcCW>
					<TrackLine>
						<End x="112.5823" y="-3.8225"/>
					</TrackLine>
					<TrackArc>
						<Center x="111.125" y="-3.4671"/>
						<End x="112.6132" y="-3.655"/>
					</TrackArc>
					<TrackLine>
						<End x="112.9307" y="-1.1404"/>
					</TrackLine>
					<TrackArc>
						<Center x="111.4425" y="-0.9525"/>
						<End x="112.9337" y="-1.1149"/>
					</TrackArc>
					<TrackLine>
						<End x="113.2394" y="1.6928"/>
					</TrackLine>
					<TrackArc>
						<Center x="110.461" y="1.9953"/>
						<End x="113.241" y="1.7079"/>
					</TrackArc>
					<TrackLine>
						<End x="113.2432" y="1.7296"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="114.6175" y="1.5875"/>
						<End x="113.3286" y="2.0851"/>
					</TrackArcCW>
					<TrackLine>
						<End x="113.475" y="2.4641"/>
					</TrackLine>
					<TrackArc>
						<Center x="111.6092" y="3.1845"/>
						<End x="113.4234" y="4.0263"/>
					</TrackArc>
					<TrackLine>
						<End x="108.9461" y="13.6758"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="109.1275" y="13.76"/>
						<End x="108.9275" y="13.76"/>
					</TrackArcCW>
					<TrackLine>
						<End x="108.9275" y="13.96"/>
					</TrackLine>
					<TrackLine>
						<End x="108.8775" y="14.26"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="TX"/>
				<Subwire width="0.4">
					<Start x="109.855" y="-9.8425"/>
					<TrackLine>
						<End x="110.036" y="-9.2805"/>
					</TrackLine>
					<TrackLine>
						<End x="110.036" y="-9.0805"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="110.236" y="-9.0805"/>
						<End x="110.0454" y="-9.02"/>
					</TrackArcCW>
					<TrackLine>
						<End x="111.7446" y="-3.6636"/>
					</TrackLine>
					<TrackArc>
						<Center x="111.125" y="-3.4671"/>
						<End x="111.7699" y="-3.5485"/>
					</TrackArc>
					<TrackLine>
						<End x="112.0874" y="-1.0339"/>
					</TrackLine>
					<TrackLine>
						<End x="112.0882" y="-1.0271"/>
					</TrackLine>
					<TrackLine>
						<End x="112.4112" y="1.7701"/>
					</TrackLine>
					<TrackArc>
						<Center x="110.461" y="1.9953"/>
						<End x="112.4138" y="1.7934"/>
					</TrackArc>
					<TrackLine>
						<End x="112.416" y="1.8151"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="114.6175" y="1.5875"/>
						<End x="112.5234" y="2.3036"/>
					</TrackArcCW>
					<TrackLine>
						<End x="112.6973" y="2.8124"/>
					</TrackLine>
					<TrackArc>
						<Center x="111.6092" y="3.1845"/>
						<End x="112.6566" y="3.6592"/>
					</TrackArc>
					<TrackLine>
						<End x="108.1721" y="13.5536"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="108.6275" y="13.76"/>
						<End x="108.1275" y="13.76"/>
					</TrackArcCW>
					<TrackLine>
						<End x="108.1275" y="13.96"/>
					</TrackLine>
					<TrackLine>
						<End x="108.0775" y="14.26"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00064"/>
				<Subwire width="0.8">
					<Start x="186.08" y="-11.18"/>
					<TrackLine>
						<End x="186.08" y="-10.38"/>
					</TrackLine>
					<TrackArc>
						<Center x="185.68" y="-10.38"/>
						<End x="186.0796" y="-10.3611"/>
					</TrackArc>
					<TrackLine>
						<End x="186.055" y="-9.8425"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00064"/>
				<Subwire width="0.8">
					<Start x="186.055" y="-19.05"/>
					<TrackLine>
						<End x="186.08" y="-18.58"/>
					</TrackLine>
					<TrackLine>
						<End x="186.08" y="-17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_1_G33"/>
				<Subwire fixed="on" width="2">
					<Start x="32.7025" y="-14.605"/>
					<TrackLine>
						<End x="31.6404" y="-14.2417"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-12.065"/>
						<End x="31.2396" y="-14.0601"/>
					</TrackArcCW>
					<TrackLine>
						<End x="11.725" y="-2.8568"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-13.7"/>
						<End x="10.8" y="-2.3759"/>
					</TrackArc>
					<TrackLine>
						<End x="6.8993" y="-0.5503"/>
					</TrackLine>
					<TrackLine>
						<End x="6.8979" y="-0.5496"/>
					</TrackLine>
					<TrackLine>
						<End x="5.9235" y="-0.0941"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-1"/>
						<End x="5.5" y="0"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="0"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_1_G33"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="-14.605"/>
							<Dot x="33.191" y="-14.9534"/>
							<Dot x="33.8625" y="-14.0118"/>
							<Dot x="32.706" y="-14.005"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-13.97"/>
					<TrackLine>
						<End x="34.036" y="-13.97"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-14.351"/>
						<End x="33.8625" y="-14.0118"/>
					</TrackArc>
					<TrackLine>
						<End x="32.7025" y="-14.605"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_1_G33"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="-14.605"/>
							<Dot x="32.706" y="-15.205"/>
							<Dot x="33.8625" y="-15.1982"/>
							<Dot x="33.191" y="-14.2566"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-15.24"/>
					<TrackLine>
						<End x="34.036" y="-15.24"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="-14.859"/>
						<End x="33.8625" y="-15.1982"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.7025" y="-14.605"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_1_G33"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="68.4921" y="-15.8859"/>
							<Dot x="68.5317" y="-16.1832"/>
							<Dot x="69.1805" y="-16.0968"/>
							<Dot x="68.6915" y="-15.6618"/>
						</Teardrop>
					</Teardrops>
					<Start x="86.995" y="-14.9225"/>
					<TrackLine>
						<End x="86.814" y="-15.4845"/>
					</TrackLine>
					<TrackLine>
						<End x="86.814" y="-15.6845"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.614" y="-15.6845"/>
						<End x="86.7912" y="-15.7773"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.6818" y="-15.9861"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.106" y="-15.6845"/>
						<End x="86.2853" y="-16.3093"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.5916" y="-17.656"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-15.6845"/>
						<End x="81.026" y="-17.7355"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="-17.7355"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="-15.6845"/>
						<End x="76.1809" y="-17.7172"/>
					</TrackArcCW>
					<TrackLine>
						<End x="73.2133" y="-17.3186"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="73.3465" y="-16.327"/>
						<End x="73.0534" y="-17.2836"/>
					</TrackArcCW>
					<TrackLine>
						<End x="68.4921" y="-15.8859"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_1_G33"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-13.0175"/>
							<Dot x="46.7234" y="-12.8799"/>
							<Dot x="46.4232" y="-13.4615"/>
							<Dot x="47.0598" y="-13.3093"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="-13.97"/>
					<TrackLine>
						<End x="46.028" y="-13.5604"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="-13.5604"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="-13.3604"/>
						<End x="46.3513" y="-13.5178"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="-13.0175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_1_G33"/>
				<Subwire width="0.4">
					<Start x="43.688" y="-13.97"/>
					<TrackLine>
						<End x="43.38" y="-13.97"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="-13.97"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="-13.97"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="-13.97"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-13.97"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="3.1" y="-31.08"/>
					<TrackLine>
						<End x="1.9278" y="-30.8531"/>
					</TrackLine>
					<TrackLine>
						<End x="0" y="-30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="164.465" y="-39.3065"/>
					<TrackLine>
						<End x="164.2554" y="-39.4145"/>
					</TrackLine>
					<TrackLine>
						<End x="163.8554" y="-39.4145"/>
					</TrackLine>
					<TrackArc>
						<Center x="163.8554" y="-39.8145"/>
						<End x="163.5546" y="-39.5508"/>
					</TrackArc>
					<TrackLine>
						<End x="157.598" y="-46.3453"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="153.9875" y="-43.18"/>
						<End x="153.9875" y="-47.9815"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.1625" y="-47.9815"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="30.1625" y="-43.18"/>
						<End x="29.2377" y="-47.8916"/>
					</TrackArcCW>
					<TrackLine>
						<End x="16.3545" y="-45.3629"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="17.78" y="-38.1"/>
						<End x="10.8479" y="-40.694"/>
					</TrackArcCW>
					<TrackLine>
						<End x="8.765" y="-35.1275"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="12.7" y="-33.655"/>
						<End x="8.5947" y="-34.5488"/>
					</TrackArcCW>
					<TrackLine>
						<End x="8.1093" y="-32.3195"/>
					</TrackLine>
					<TrackArc>
						<Center x="6.35" y="-32.7025"/>
						<End x="6.35" y="-30.902"/>
					</TrackArc>
					<TrackLine>
						<End x="5.5" y="-30.902"/>
					</TrackLine>
					<TrackLine>
						<End x="5.1" y="-30.902"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-39.69"/>
					<TrackLine>
						<End x="166.5225" y="-39.69"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="166.5225" y="-39.29"/>
						<End x="166.4435" y="-39.6821"/>
					</TrackArcCW>
					<TrackLine>
						<End x="165.1536" y="-39.4224"/>
					</TrackLine>
					<TrackArc>
						<Center x="165.0746" y="-39.8145"/>
						<End x="165.0746" y="-39.4145"/>
					</TrackArc>
					<TrackLine>
						<End x="164.6746" y="-39.4145"/>
					</TrackLine>
					<TrackLine>
						<End x="164.465" y="-39.3065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE1_G11"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="31.115"/>
							<Dot x="52.241" y="30.7666"/>
							<Dot x="52.9125" y="31.7082"/>
							<Dot x="51.756" y="31.715"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="31.75"/>
					<TrackLine>
						<End x="53.086" y="31.75"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="31.369"/>
						<End x="52.9125" y="31.7082"/>
					</TrackArc>
					<TrackLine>
						<End x="51.7525" y="31.115"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE1_G11"/>
				<Subwire fixed="on" width="2">
					<Start x="41.275" y="28.575"/>
					<TrackLine>
						<End x="51.7525" y="31.115"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE1_G11"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="31.115"/>
							<Dot x="51.756" y="30.515"/>
							<Dot x="52.9125" y="30.5218"/>
							<Dot x="52.241" y="31.4634"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="30.48"/>
					<TrackLine>
						<End x="53.086" y="30.48"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="30.861"/>
						<End x="52.9125" y="30.5218"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.7525" y="31.115"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE1_G11"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="28.575"/>
					<TrackLine>
						<End x="5.5221" y="27.9402"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="28.94"/>
						<End x="5.5" y="27.94"/>
					</TrackArcCW>
					<TrackLine>
						<End x="2" y="27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE1_G11"/>
				<Subwire width="0.4">
					<Start x="81.915" y="28.8925"/>
					<TrackLine>
						<End x="81.734" y="28.3305"/>
					</TrackLine>
					<TrackLine>
						<End x="81.734" y="28.1305"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="28.1305"/>
						<End x="81.7112" y="28.0377"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.6018" y="27.8289"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="28.1305"/>
						<End x="81.026" y="27.4805"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="27.4805"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="28.1305"/>
						<End x="76.1882" y="27.5373"/>
					</TrackArcCW>
					<TrackLine>
						<End x="72.4303" y="29.2211"/>
					</TrackLine>
					<TrackArc>
						<Center x="72.0212" y="28.3081"/>
						<End x="72.3054" y="29.2674"/>
					</TrackArc>
					<TrackLine>
						<End x="65.3348" y="31.3322"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="31.1404"/>
						<End x="65.278" y="31.3404"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="31.3404"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="31.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE1_G11"/>
				<Subwire width="0.4">
					<Start x="59.69" y="31.75"/>
					<TrackLine>
						<End x="60.252" y="31.75"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="31.75"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="31.75"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="31.75"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="31.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_2_G34"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-12.065"/>
							<Dot x="32.9195" y="-12.3375"/>
							<Dot x="33.292" y="-11.6071"/>
							<Dot x="32.4831" y="-11.4731"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-11.43"/>
					<TrackLine>
						<End x="34.036" y="-11.43"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-13.081"/>
						<End x="33.292" y="-11.6071"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="-12.065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_2_G34"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-12.065"/>
							<Dot x="32.4831" y="-12.6569"/>
							<Dot x="33.292" y="-12.5229"/>
							<Dot x="32.9195" y="-11.7925"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-12.7"/>
					<TrackLine>
						<End x="34.036" y="-12.7"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="-11.049"/>
						<End x="33.292" y="-12.5229"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="-12.065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_2_G34"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="73.3465" y="-16.327"/>
							<Dot x="73.4043" y="-16.6214"/>
							<Dot x="74.0466" y="-16.4952"/>
							<Dot x="73.5317" y="-16.091"/>
						</Teardrop>
					</Teardrops>
					<Start x="83.185" y="-14.9225"/>
					<TrackLine>
						<End x="83.004" y="-15.4845"/>
					</TrackLine>
					<TrackLine>
						<End x="83.004" y="-15.6845"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="82.804" y="-15.6845"/>
						<End x="82.9334" y="-15.837"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.8999" y="-16.7142"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-15.6845"/>
						<End x="81.026" y="-17.035"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="-17.035"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="-15.6845"/>
						<End x="76.1386" y="-16.9977"/>
					</TrackArcCW>
					<TrackLine>
						<End x="73.3465" y="-16.327"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_2_G34"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-11.43"/>
							<Dot x="46.865" y="-11.1573"/>
							<Dot x="46.27" y="-11.43"/>
							<Dot x="46.865" y="-11.7027"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="-11.43"/>
					<TrackLine>
						<End x="46.028" y="-11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="-11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="-11.43"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_2_G34"/>
				<Subwire width="0.4">
					<Start x="43.688" y="-11.43"/>
					<TrackLine>
						<End x="43.38" y="-11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="-11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="-11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="-11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-11.43"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_3_G35"/>
				<Subwire fixed="on" width="2">
					<Start x="41.275" y="-17.145"/>
					<TrackLine>
						<End x="51.7525" y="-14.605"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_3_G35"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="-14.605"/>
							<Dot x="52.241" y="-14.9534"/>
							<Dot x="52.9125" y="-14.0118"/>
							<Dot x="51.756" y="-14.005"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-13.97"/>
					<TrackLine>
						<End x="53.086" y="-13.97"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-14.351"/>
						<End x="52.9125" y="-14.0118"/>
					</TrackArc>
					<TrackLine>
						<End x="51.7525" y="-14.605"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_3_G35"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="-14.605"/>
							<Dot x="51.756" y="-15.205"/>
							<Dot x="52.9125" y="-15.1982"/>
							<Dot x="52.241" y="-14.2566"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-15.24"/>
					<TrackLine>
						<End x="53.086" y="-15.24"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="-14.859"/>
						<End x="52.9125" y="-15.1982"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.7525" y="-14.605"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_3_G35"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="-17.145"/>
					<TrackLine>
						<End x="32.3896" y="-16.8841"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.7025" y="-14.605"/>
						<End x="31.9579" y="-16.7817"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.8958" y="-16.4183"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-12.065"/>
						<End x="30.0942" y="-16.0552"/>
					</TrackArcCW>
					<TrackLine>
						<End x="10.5796" y="-4.8519"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-13.7"/>
						<End x="9.8248" y="-4.4595"/>
					</TrackArc>
					<TrackLine>
						<End x="6.8993" y="-3.0903"/>
					</TrackLine>
					<TrackLine>
						<End x="6.8979" y="-3.0896"/>
					</TrackLine>
					<TrackLine>
						<End x="5.9235" y="-2.6341"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-3.54"/>
						<End x="5.5" y="-2.54"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="-2.54"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_3_G35"/>
				<Subwire width="0.4">
					<Start x="81.915" y="-14.9225"/>
					<TrackLine>
						<End x="81.734" y="-15.4845"/>
					</TrackLine>
					<TrackLine>
						<End x="81.734" y="-15.6845"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="-15.6845"/>
						<End x="81.7112" y="-15.7773"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.6018" y="-15.9861"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-15.6845"/>
						<End x="81.026" y="-16.3345"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="-16.3345"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="-15.6845"/>
						<End x="76.2353" y="-16.2966"/>
					</TrackArcCW>
					<TrackLine>
						<End x="73.6831" y="-15.3848"/>
					</TrackLine>
					<TrackArc>
						<Center x="73.3465" y="-16.327"/>
						<End x="73.4625" y="-15.3332"/>
					</TrackArc>
					<TrackLine>
						<End x="65.3012" y="-14.3809"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="-14.5796"/>
						<End x="65.278" y="-14.3796"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="-14.3796"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="-13.97"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_3_G35"/>
				<Subwire width="0.4">
					<Start x="59.69" y="-13.97"/>
					<TrackLine>
						<End x="60.252" y="-13.97"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-13.97"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="-13.97"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="-13.97"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="-13.97"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_4_G36"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-12.065"/>
							<Dot x="51.5331" y="-12.6569"/>
							<Dot x="52.342" y="-12.5229"/>
							<Dot x="51.9695" y="-11.7925"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-12.7"/>
					<TrackLine>
						<End x="53.086" y="-12.7"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="-11.049"/>
						<End x="52.342" y="-12.5229"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="-12.065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_4_G36"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-12.065"/>
							<Dot x="51.9695" y="-12.3375"/>
							<Dot x="52.342" y="-11.6071"/>
							<Dot x="51.5331" y="-11.4731"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-11.43"/>
					<TrackLine>
						<End x="53.086" y="-11.43"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-13.081"/>
						<End x="52.342" y="-11.6071"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="-12.065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_4_G36"/>
				<Subwire width="0.4">
					<Start x="78.105" y="-14.9225"/>
					<TrackLine>
						<End x="77.924" y="-14.3605"/>
					</TrackLine>
					<TrackLine>
						<End x="77.924" y="-14.1605"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.724" y="-14.1605"/>
						<End x="77.8909" y="-14.0502"/>
					</TrackArc>
					<TrackLine>
						<End x="77.7364" y="-13.8165"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="-14.1605"/>
						<End x="77.313" y="-13.5443"/>
					</TrackArc>
					<TrackLine>
						<End x="75.8327" y="-13.3114"/>
					</TrackLine>
					<TrackArc>
						<Center x="75.654" y="-14.4474"/>
						<End x="75.813" y="-13.3084"/>
					</TrackArc>
					<TrackLine>
						<End x="65.3057" y="-11.8415"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="-12.0396"/>
						<End x="65.278" y="-11.8396"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="-11.8396"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="-11.43"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_4_G36"/>
				<Subwire width="0.4">
					<Start x="59.69" y="-11.43"/>
					<TrackLine>
						<End x="60.252" y="-11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="-11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="-11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="-11.43"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_5_G37"/>
				<Subwire fixed="on" width="2">
					<Start x="32.7025" y="-22.225"/>
					<TrackLine>
						<End x="31.6404" y="-21.8617"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-19.685"/>
						<End x="31.0886" y="-21.5855"/>
					</TrackArcCW>
					<TrackLine>
						<End x="10.2062" y="-7.3408"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-14.24"/>
						<End x="10.1281" y="-7.2881"/>
					</TrackArc>
					<TrackLine>
						<End x="9.879" y="-7.1223"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-13.7"/>
						<End x="8.8497" y="-6.5431"/>
					</TrackArc>
					<TrackLine>
						<End x="6.8993" y="-5.6303"/>
					</TrackLine>
					<TrackLine>
						<End x="6.8979" y="-5.6296"/>
					</TrackLine>
					<TrackLine>
						<End x="5.9235" y="-5.1741"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-6.08"/>
						<End x="5.5" y="-5.08"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="-5.08"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_5_G37"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="-22.225"/>
							<Dot x="33.191" y="-22.5734"/>
							<Dot x="33.8625" y="-21.6318"/>
							<Dot x="32.706" y="-21.625"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-21.59"/>
					<TrackLine>
						<End x="34.036" y="-21.59"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-21.971"/>
						<End x="33.8625" y="-21.6318"/>
					</TrackArc>
					<TrackLine>
						<End x="32.7025" y="-22.225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_5_G37"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="-22.225"/>
							<Dot x="32.706" y="-22.825"/>
							<Dot x="33.8625" y="-22.8182"/>
							<Dot x="33.191" y="-21.8766"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-22.86"/>
					<TrackLine>
						<End x="34.036" y="-22.86"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="-22.479"/>
						<End x="33.8625" y="-22.8182"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.7025" y="-22.225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_5_G37"/>
				<Subwire width="0.4">
					<Start x="43.688" y="-21.59"/>
					<TrackLine>
						<End x="43.38" y="-21.59"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="-21.59"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="-21.59"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="-21.59"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-21.59"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_5_G37"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-20.6375"/>
							<Dot x="46.7234" y="-20.4999"/>
							<Dot x="46.4232" y="-21.0815"/>
							<Dot x="47.0598" y="-20.9293"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="-21.59"/>
					<TrackLine>
						<End x="46.028" y="-21.1804"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="-21.1804"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="-20.9804"/>
						<End x="46.3513" y="-21.1378"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="-20.6375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_5_G37"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="68.8755" y="-22.2625"/>
							<Dot x="68.9357" y="-22.5564"/>
							<Dot x="69.5769" y="-22.4252"/>
							<Dot x="69.0589" y="-22.025"/>
						</Teardrop>
					</Teardrops>
					<Start x="68.8755" y="-22.2625"/>
					<TrackLine>
						<End x="72.457" y="-23.0932"/>
					</TrackLine>
					<TrackArc>
						<Center x="72.6831" y="-22.1186"/>
						<End x="72.6184" y="-23.117"/>
					</TrackArc>
					<TrackLine>
						<End x="77.2581" y="-23.4179"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.216" y="-24.0665"/>
						<End x="77.7918" y="-23.7649"/>
					</TrackArcCW>
					<TrackLine>
						<End x="77.9012" y="-23.9737"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.724" y="-24.0665"/>
						<End x="77.924" y="-24.0665"/>
					</TrackArcCW>
					<TrackLine>
						<End x="77.924" y="-24.2665"/>
					</TrackLine>
					<TrackLine>
						<End x="78.105" y="-24.8285"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_6_G38"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-19.685"/>
							<Dot x="32.9195" y="-19.9575"/>
							<Dot x="33.292" y="-19.2271"/>
							<Dot x="32.4831" y="-19.0931"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-19.05"/>
					<TrackLine>
						<End x="34.036" y="-19.05"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-20.701"/>
						<End x="33.292" y="-19.2271"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="-19.685"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_6_G38"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-19.685"/>
							<Dot x="32.4831" y="-20.2769"/>
							<Dot x="33.292" y="-20.1429"/>
							<Dot x="32.9195" y="-19.4125"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-20.32"/>
					<TrackLine>
						<End x="34.036" y="-20.32"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="-18.669"/>
						<End x="33.292" y="-20.1429"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="-19.685"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_6_G38"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-19.05"/>
							<Dot x="46.865" y="-18.7773"/>
							<Dot x="46.27" y="-19.05"/>
							<Dot x="46.865" y="-19.3227"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="-19.05"/>
					<TrackLine>
						<End x="46.028" y="-19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="-19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="-19.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_6_G38"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="72.6831" y="-22.1186"/>
							<Dot x="72.7721" y="-22.4051"/>
							<Dot x="73.3972" y="-22.2109"/>
							<Dot x="72.8421" y="-21.8641"/>
						</Teardrop>
					</Teardrops>
					<Start x="72.6831" y="-22.1186"/>
					<TrackLine>
						<End x="77.3892" y="-22.7272"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.216" y="-24.0665"/>
						<End x="77.4643" y="-22.739"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.1455" y="-23.4276"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-24.0665"/>
						<End x="81.6018" y="-23.7649"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.7112" y="-23.9737"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="-24.0665"/>
						<End x="81.734" y="-24.0665"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.734" y="-24.2665"/>
					</TrackLine>
					<TrackLine>
						<End x="81.915" y="-24.8285"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_6_G38"/>
				<Subwire width="0.4">
					<Start x="43.688" y="-19.05"/>
					<TrackLine>
						<End x="43.38" y="-19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="-19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="-19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="-19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-19.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_7_G39"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="-22.225"/>
							<Dot x="51.756" y="-22.825"/>
							<Dot x="52.9125" y="-22.8182"/>
							<Dot x="52.241" y="-21.8766"/>
						</Teardrop>
					</Teardrops>
					<Start x="51.7525" y="-22.225"/>
					<TrackLine>
						<End x="52.9125" y="-22.8182"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-22.479"/>
						<End x="53.086" y="-22.86"/>
					</TrackArc>
					<TrackLine>
						<End x="53.848" y="-22.86"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_7_G39"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="-22.225"/>
							<Dot x="52.241" y="-22.5734"/>
							<Dot x="52.9125" y="-21.6318"/>
							<Dot x="51.756" y="-21.625"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-21.59"/>
					<TrackLine>
						<End x="53.086" y="-21.59"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-21.971"/>
						<End x="52.9125" y="-21.6318"/>
					</TrackArc>
					<TrackLine>
						<End x="51.7525" y="-22.225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_7_G39"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="-24.765"/>
					<TrackLine>
						<End x="32.3896" y="-24.5041"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.7025" y="-22.225"/>
						<End x="31.9579" y="-24.4017"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.8958" y="-24.0383"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-19.685"/>
						<End x="29.7923" y="-23.4859"/>
					</TrackArcCW>
					<TrackLine>
						<End x="8.9098" y="-9.2412"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-14.24"/>
						<End x="8.8532" y="-9.2031"/>
					</TrackArc>
					<TrackLine>
						<End x="8.6042" y="-9.0373"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-13.7"/>
						<End x="7.8745" y="-8.6267"/>
					</TrackArc>
					<TrackLine>
						<End x="6.8993" y="-8.1703"/>
					</TrackLine>
					<TrackLine>
						<End x="6.8979" y="-8.1696"/>
					</TrackLine>
					<TrackLine>
						<End x="5.9235" y="-7.7141"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-8.62"/>
						<End x="5.5" y="-7.62"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="-7.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_7_G39"/>
				<Subwire width="0.4">
					<Start x="59.69" y="-21.59"/>
					<TrackLine>
						<End x="60.252" y="-21.59"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-21.59"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="-21.59"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="-21.59"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="-21.59"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_7_G39"/>
				<Subwire width="0.4">
					<Start x="83.185" y="-24.8285"/>
					<TrackLine>
						<End x="83.004" y="-24.2665"/>
					</TrackLine>
					<TrackLine>
						<End x="83.004" y="-24.0665"/>
					</TrackLine>
					<TrackArc>
						<Center x="82.804" y="-24.0665"/>
						<End x="82.9334" y="-23.914"/>
					</TrackArc>
					<TrackLine>
						<End x="81.8999" y="-23.0368"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="-24.0665"/>
						<End x="81.2791" y="-22.7399"/>
					</TrackArc>
					<TrackLine>
						<End x="72.8706" y="-21.1358"/>
					</TrackLine>
					<TrackArc>
						<Center x="72.6831" y="-22.1186"/>
						<End x="72.6747" y="-21.1181"/>
					</TrackArc>
					<TrackLine>
						<End x="65.2797" y="-21.1804"/>
					</TrackLine>
					<TrackLine>
						<End x="65.278" y="-21.1804"/>
					</TrackLine>
					<TrackLine>
						<End x="65.078" y="-21.1804"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="-21.59"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_7_G39"/>
				<Subwire width="2">
					<Start x="41.275" y="-24.765"/>
					<TrackLine>
						<End x="51.7525" y="-22.225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_8_G40"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-19.685"/>
							<Dot x="51.5331" y="-20.2769"/>
							<Dot x="52.342" y="-20.1429"/>
							<Dot x="51.9695" y="-19.4125"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-20.32"/>
					<TrackLine>
						<End x="53.086" y="-20.32"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="-18.669"/>
						<End x="52.342" y="-20.1429"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="-19.685"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_8_G40"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-19.685"/>
							<Dot x="51.9695" y="-19.9575"/>
							<Dot x="52.342" y="-19.2271"/>
							<Dot x="51.5331" y="-19.0931"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-19.05"/>
					<TrackLine>
						<End x="53.086" y="-19.05"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-20.701"/>
						<End x="52.342" y="-19.2271"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="-19.685"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_8_G40"/>
				<Subwire width="0.4">
					<Start x="59.69" y="-19.05"/>
					<TrackLine>
						<End x="60.252" y="-19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="-19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="-19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="-19.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_8_G40"/>
				<Subwire width="0.4">
					<Start x="86.995" y="-24.8285"/>
					<TrackLine>
						<End x="86.814" y="-24.2665"/>
					</TrackLine>
					<TrackLine>
						<End x="86.814" y="-24.0665"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.614" y="-24.0665"/>
						<End x="86.7912" y="-23.9737"/>
					</TrackArc>
					<TrackLine>
						<End x="86.6818" y="-23.7649"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.106" y="-24.0665"/>
						<End x="86.2853" y="-23.4417"/>
					</TrackArc>
					<TrackLine>
						<End x="81.5916" y="-22.095"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="-24.0665"/>
						<End x="81.4103" y="-22.0518"/>
					</TrackArc>
					<TrackLine>
						<End x="73.0019" y="-20.4477"/>
					</TrackLine>
					<TrackArc>
						<Center x="72.6831" y="-22.1186"/>
						<End x="72.8986" y="-20.4313"/>
					</TrackArc>
					<TrackLine>
						<End x="65.3033" y="-19.4612"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="-19.6596"/>
						<End x="65.278" y="-19.4596"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="-19.4596"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="-19.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_9_G41"/>
				<Subwire fixed="on" width="2">
					<Start x="32.7025" y="-29.845"/>
					<TrackLine>
						<End x="31.6404" y="-29.4817"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-27.305"/>
						<End x="30.9815" y="-29.1277"/>
					</TrackArcCW>
					<TrackLine>
						<End x="7.7882" y="-11.2684"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-14.24"/>
						<End x="7.5784" y="-11.1181"/>
					</TrackArc>
					<TrackLine>
						<End x="7.3293" y="-10.9522"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-13.7"/>
						<End x="6.8979" y="-10.7096"/>
					</TrackArc>
					<TrackLine>
						<End x="5.9235" y="-10.2541"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-11.16"/>
						<End x="5.5" y="-10.16"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="-10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_9_G41"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="-29.845"/>
							<Dot x="32.706" y="-30.445"/>
							<Dot x="33.8625" y="-30.4382"/>
							<Dot x="33.191" y="-29.4966"/>
						</Teardrop>
					</Teardrops>
					<Start x="32.7025" y="-29.845"/>
					<TrackLine>
						<End x="33.8625" y="-30.4382"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-30.099"/>
						<End x="34.036" y="-30.48"/>
					</TrackArc>
					<TrackLine>
						<End x="34.798" y="-30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_9_G41"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="-29.845"/>
							<Dot x="33.191" y="-30.1934"/>
							<Dot x="33.8625" y="-29.2518"/>
							<Dot x="32.706" y="-29.245"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-29.21"/>
					<TrackLine>
						<End x="34.036" y="-29.21"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-29.591"/>
						<End x="33.8625" y="-29.2518"/>
					</TrackArc>
					<TrackLine>
						<End x="32.7025" y="-29.845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_9_G41"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-28.2575"/>
							<Dot x="46.7234" y="-28.1199"/>
							<Dot x="46.4232" y="-28.7015"/>
							<Dot x="47.0598" y="-28.5493"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="-29.21"/>
					<TrackLine>
						<End x="46.028" y="-28.8004"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="-28.8004"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="-28.6004"/>
						<End x="46.3513" y="-28.7578"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="-28.2575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_9_G41"/>
				<Subwire width="0.4">
					<Start x="43.688" y="-29.21"/>
					<TrackLine>
						<End x="43.38" y="-29.21"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="-29.21"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="-29.21"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="-29.21"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-29.21"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_9_G41"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="70.1239" y="-31.1346"/>
							<Dot x="70.1694" y="-31.4312"/>
							<Dot x="70.8163" y="-31.3319"/>
							<Dot x="70.3188" y="-30.9066"/>
						</Teardrop>
					</Teardrops>
					<Start x="86.995" y="-29.5275"/>
					<TrackLine>
						<End x="86.814" y="-30.0895"/>
					</TrackLine>
					<TrackLine>
						<End x="86.814" y="-30.2895"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.614" y="-30.2895"/>
						<End x="86.7912" y="-30.3823"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.6818" y="-30.5911"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.106" y="-30.2895"/>
						<End x="86.2853" y="-30.9143"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.5916" y="-32.261"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-30.2895"/>
						<End x="81.026" y="-32.3405"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="-32.3405"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="-30.2895"/>
						<End x="76.3415" y="-32.3374"/>
					</TrackArcCW>
					<TrackLine>
						<End x="73.9802" y="-32.2077"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="74.0351" y="-31.2087"/>
						<End x="73.7609" y="-32.1709"/>
					</TrackArcCW>
					<TrackLine>
						<End x="70.1239" y="-31.1346"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N1K_G28"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="18.415"/>
							<Dot x="32.9195" y="18.1425"/>
							<Dot x="33.292" y="18.8729"/>
							<Dot x="32.4831" y="19.0069"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="19.05"/>
					<TrackLine>
						<End x="34.036" y="19.05"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="17.399"/>
						<End x="33.292" y="18.8729"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="18.415"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N1K_G28"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="18.415"/>
							<Dot x="32.4831" y="17.8231"/>
							<Dot x="33.292" y="17.9571"/>
							<Dot x="32.9195" y="18.6875"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="17.78"/>
					<TrackLine>
						<End x="34.036" y="17.78"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="19.431"/>
						<End x="33.292" y="17.9571"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="18.415"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N1K_G28"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="19.05"/>
							<Dot x="46.865" y="19.3227"/>
							<Dot x="46.27" y="19.05"/>
							<Dot x="46.865" y="18.7773"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="19.05"/>
					<TrackLine>
						<End x="46.028" y="19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="19.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N1K_G28"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="74.3433" y="17.1121"/>
							<Dot x="74.3376" y="16.8122"/>
							<Dot x="74.992" y="16.7997"/>
							<Dot x="74.5742" y="17.3036"/>
						</Teardrop>
					</Teardrops>
					<Start x="74.3433" y="17.1121"/>
					<TrackLine>
						<End x="77.26" y="15.7076"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.105" y="17.4625"/>
						<End x="77.4198" y="15.6393"/>
					</TrackArc>
					<TrackLine>
						<End x="77.4354" y="15.6334"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.216" y="15.0495"/>
						<End x="77.7364" y="15.3935"/>
					</TrackArcCW>
					<TrackLine>
						<End x="77.8909" y="15.1598"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.724" y="15.0495"/>
						<End x="77.924" y="15.0495"/>
					</TrackArcCW>
					<TrackLine>
						<End x="77.924" y="14.8495"/>
					</TrackLine>
					<TrackLine>
						<End x="78.105" y="14.2875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N1K_G28"/>
				<Subwire width="0.4">
					<Start x="43.688" y="19.05"/>
					<TrackLine>
						<End x="43.38" y="19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="19.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N2K_G29"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="15.875"/>
							<Dot x="51.756" y="15.275"/>
							<Dot x="52.9125" y="15.2818"/>
							<Dot x="52.241" y="16.2234"/>
						</Teardrop>
					</Teardrops>
					<Start x="51.7525" y="15.875"/>
					<TrackLine>
						<End x="52.9125" y="15.2818"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="15.621"/>
						<End x="53.086" y="15.24"/>
					</TrackArc>
					<TrackLine>
						<End x="53.848" y="15.24"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N2K_G29"/>
				<Subwire fixed="on" width="2">
					<Start x="41.275" y="13.335"/>
					<TrackLine>
						<End x="51.7525" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N2K_G29"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="15.875"/>
							<Dot x="52.241" y="15.5266"/>
							<Dot x="52.9125" y="16.4682"/>
							<Dot x="51.756" y="16.475"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="16.51"/>
					<TrackLine>
						<End x="53.086" y="16.51"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="16.129"/>
						<End x="52.9125" y="16.4682"/>
					</TrackArc>
					<TrackLine>
						<End x="51.7525" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N2K_G29"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="13.335"/>
					<TrackLine>
						<End x="32.3896" y="13.5959"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.7025" y="15.875"/>
						<End x="32.3478" y="13.602"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.6542" y="17.768"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="16.78"/>
						<End x="5.5" y="17.78"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N2K_G29"/>
				<Subwire width="0.4">
					<Start x="78.105" y="4.3815"/>
					<TrackLine>
						<End x="77.924" y="4.9435"/>
					</TrackLine>
					<TrackLine>
						<End x="77.924" y="5.1435"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.724" y="5.1435"/>
						<End x="77.9012" y="5.2363"/>
					</TrackArc>
					<TrackLine>
						<End x="77.7918" y="5.4451"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="5.1435"/>
						<End x="77.5623" y="5.6936"/>
					</TrackArc>
					<TrackLine>
						<End x="75.4416" y="7.0287"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.3478" y="8.4682"/>
						<End x="75.2467" y="7.1717"/>
					</TrackArcCW>
					<TrackLine>
						<End x="65.1485" y="15.748"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="65.278" y="15.9004"/>
						<End x="65.078" y="15.9004"/>
					</TrackArcCW>
					<TrackLine>
						<End x="65.078" y="16.1004"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="16.51"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N2K_G29"/>
				<Subwire width="0.4">
					<Start x="59.69" y="16.51"/>
					<TrackLine>
						<End x="60.252" y="16.51"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="16.51"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="16.51"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="16.51"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="16.51"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_10_G42"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-27.305"/>
							<Dot x="32.4831" y="-27.8969"/>
							<Dot x="33.292" y="-27.7629"/>
							<Dot x="32.9195" y="-27.0325"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-27.94"/>
					<TrackLine>
						<End x="34.036" y="-27.94"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="-26.289"/>
						<End x="33.292" y="-27.7629"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="-27.305"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_10_G42"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-27.305"/>
							<Dot x="32.9195" y="-27.5775"/>
							<Dot x="33.292" y="-26.8471"/>
							<Dot x="32.4831" y="-26.7131"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-26.67"/>
					<TrackLine>
						<End x="34.036" y="-26.67"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-28.321"/>
						<End x="33.292" y="-26.8471"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="-27.305"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_10_G42"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="74.0351" y="-31.2087"/>
							<Dot x="74.1075" y="-31.4998"/>
							<Dot x="74.7427" y="-31.3418"/>
							<Dot x="74.2083" y="-30.9638"/>
						</Teardrop>
					</Teardrops>
					<Start x="74.0351" y="-31.2087"/>
					<TrackLine>
						<End x="76.2044" y="-31.6167"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.454" y="-30.2895"/>
						<End x="76.454" y="-31.64"/>
					</TrackArc>
					<TrackLine>
						<End x="81.026" y="-31.64"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="-30.2895"/>
						<End x="81.8999" y="-31.3192"/>
					</TrackArc>
					<TrackLine>
						<End x="82.9334" y="-30.442"/>
					</TrackLine>
					<TrackArc>
						<Center x="82.804" y="-30.2895"/>
						<End x="83.004" y="-30.2895"/>
					</TrackArc>
					<TrackLine>
						<End x="83.004" y="-30.0895"/>
					</TrackLine>
					<TrackLine>
						<End x="83.185" y="-29.5275"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_10_G42"/>
				<Subwire width="0.4">
					<Start x="43.688" y="-26.67"/>
					<TrackLine>
						<End x="43.38" y="-26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="-26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="-26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="-26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-26.67"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_10_G42"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-26.67"/>
							<Dot x="46.865" y="-26.3973"/>
							<Dot x="46.27" y="-26.67"/>
							<Dot x="46.865" y="-26.9427"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="-26.67"/>
					<TrackLine>
						<End x="46.028" y="-26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="-26.67"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="-26.67"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+3.3V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="111.6092" y="3.1845"/>
							<Dot x="111.3348" y="3.0633"/>
							<Dot x="111.5992" y="2.4646"/>
							<Dot x="111.8802" y="3.0557"/>
						</Teardrop>
					</Teardrops>
					<Start x="111.0615" y="-0.3175"/>
					<TrackLine>
						<End x="111.2425" y="0.1175"/>
					</TrackLine>
					<TrackLine>
						<End x="111.2425" y="0.3175"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="111.4425" y="0.3175"/>
						<End x="111.2476" y="0.3622"/>
					</TrackArcCW>
					<TrackLine>
						<End x="111.564" y="1.7424"/>
					</TrackLine>
					<TrackArc>
						<Center x="110.461" y="1.9953"/>
						<End x="111.5925" y="1.9796"/>
					</TrackArc>
					<TrackLine>
						<End x="111.6092" y="3.1845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+3.3V"/>
				<Subwire width="0.5">
					<Start x="114.3" y="8.128"/>
					<TrackLine>
						<End x="114.6596" y="8.1915"/>
					</TrackLine>
					<TrackLine>
						<End x="114.9096" y="8.1915"/>
					</TrackLine>
					<TrackLine>
						<End x="116.725" y="8.1915"/>
					</TrackLine>
					<TrackLine>
						<End x="116.975" y="8.1915"/>
					</TrackLine>
					<TrackLine>
						<End x="117.475" y="8.255"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+3.3V"/>
				<Subwire width="0.5">
					<Start x="117.475" y="8.255"/>
					<TrackLine>
						<End x="117.975" y="8.255"/>
					</TrackLine>
					<TrackLine>
						<End x="118.225" y="8.255"/>
					</TrackLine>
					<TrackLine>
						<End x="119.7229" y="8.255"/>
					</TrackLine>
					<TrackLine>
						<End x="119.9729" y="8.255"/>
					</TrackLine>
					<TrackLine>
						<End x="120.3325" y="8.255"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+3.3V"/>
				<Subwire width="0.4">
					<Start x="110.617" y="-2.8575"/>
					<TrackLine>
						<End x="110.8805" y="-2.4479"/>
					</TrackLine>
					<TrackLine>
						<End x="110.8805" y="-2.2479"/>
					</TrackLine>
					<TrackLine>
						<End x="110.8805" y="-0.9525"/>
					</TrackLine>
					<TrackLine>
						<End x="110.8805" y="-0.7525"/>
					</TrackLine>
					<TrackLine>
						<End x="111.0615" y="-0.3175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+3.3V"/>
				<Subwire width="0.5">
					<Start x="113.9825" y="24.765"/>
					<TrackLine>
						<End x="113.5459" y="24.6932"/>
					</TrackLine>
					<TrackLine>
						<End x="113.3691" y="24.5164"/>
					</TrackLine>
					<TrackLine>
						<End x="113.3681" y="24.5154"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="113.1922" y="24.6932"/>
						<End x="113.3485" y="24.498"/>
					</TrackArcCW>
					<TrackLine>
						<End x="112.1712" y="23.5551"/>
					</TrackLine>
					<TrackArc>
						<Center x="112.3275" y="23.36"/>
						<End x="112.0775" y="23.36"/>
					</TrackArc>
					<TrackLine>
						<End x="112.0775" y="22.86"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+3.3V"/>
				<Subwire width="0.4">
					<Start x="113.9825" y="24.765"/>
					<TrackLine>
						<End x="113.5105" y="24.7286"/>
					</TrackLine>
					<TrackLine>
						<End x="113.3691" y="24.87"/>
					</TrackLine>
					<TrackLine>
						<End x="113.2212" y="24.8916"/>
					</TrackLine>
					<TrackArc>
						<Center x="113.1922" y="24.6932"/>
						<End x="113.2025" y="24.8934"/>
					</TrackArc>
					<TrackLine>
						<End x="111.3258" y="24.9901"/>
					</TrackLine>
					<TrackArc>
						<Center x="111.3155" y="24.7904"/>
						<End x="111.3155" y="24.9904"/>
					</TrackArc>
					<TrackLine>
						<End x="111.1155" y="24.9904"/>
					</TrackLine>
					<TrackLine>
						<End x="110.8075" y="25.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+3.3V"/>
				<Subwire width="0.5">
					<Start x="104.3068" y="12.2157"/>
					<TrackLine>
						<End x="104.7434" y="12.2875"/>
					</TrackLine>
					<TrackLine>
						<End x="104.9202" y="12.4643"/>
					</TrackLine>
					<TrackLine>
						<End x="104.9212" y="12.4653"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="105.0971" y="12.2875"/>
						<End x="104.9471" y="12.4876"/>
					</TrackArcCW>
					<TrackLine>
						<End x="106.3775" y="13.56"/>
					</TrackLine>
					<TrackArc>
						<Center x="106.2275" y="13.76"/>
						<End x="106.4775" y="13.76"/>
					</TrackArc>
					<TrackLine>
						<End x="106.4775" y="14.26"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="USB_RX"/>
				<Subwire width="0.4">
					<Start x="109.795" y="-22.86"/>
					<TrackLine>
						<End x="109.795" y="-22.235"/>
					</TrackLine>
					<TrackLine>
						<End x="109.6124" y="-20.6701"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="110.109" y="-20.6121"/>
						<End x="109.609" y="-20.6121"/>
					</TrackArcCW>
					<TrackLine>
						<End x="109.609" y="-19.3929"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="110.109" y="-19.3929"/>
						<End x="109.6091" y="-19.3818"/>
					</TrackArcCW>
					<TrackLine>
						<End x="109.674" y="-16.4509"/>
					</TrackLine>
					<TrackLine>
						<End x="109.674" y="-16.4465"/>
					</TrackLine>
					<TrackLine>
						<End x="109.674" y="-16.2465"/>
					</TrackLine>
					<TrackLine>
						<End x="109.855" y="-15.6845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_11_G43"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="-29.845"/>
							<Dot x="51.756" y="-30.445"/>
							<Dot x="52.9125" y="-30.4382"/>
							<Dot x="52.241" y="-29.4966"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-30.48"/>
					<TrackLine>
						<End x="53.086" y="-30.48"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="-30.099"/>
						<End x="52.9125" y="-30.4382"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.7525" y="-29.845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_11_G43"/>
				<Subwire fixed="on" width="2">
					<Start x="41.275" y="-32.385"/>
					<TrackLine>
						<End x="51.7525" y="-29.845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_11_G43"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="-29.845"/>
							<Dot x="52.241" y="-30.1934"/>
							<Dot x="52.9125" y="-29.2518"/>
							<Dot x="51.756" y="-29.245"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-29.21"/>
					<TrackLine>
						<End x="53.086" y="-29.21"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-29.591"/>
						<End x="52.9125" y="-29.2518"/>
					</TrackArc>
					<TrackLine>
						<End x="51.7525" y="-29.845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_11_G43"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="-32.385"/>
					<TrackLine>
						<End x="32.3896" y="-32.1241"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.7025" y="-29.845"/>
						<End x="31.9579" y="-32.0217"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.8958" y="-31.6583"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-27.305"/>
						<End x="29.5779" y="-30.9505"/>
					</TrackArcCW>
					<TrackLine>
						<End x="6.3847" y="-13.0911"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-14.24"/>
						<End x="6.3015" y="-13.0317"/>
					</TrackArc>
					<TrackLine>
						<End x="6.0528" y="-12.8667"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-13.7"/>
						<End x="5.5" y="-12.7"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="-12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_11_G43"/>
				<Subwire width="0.4">
					<Start x="59.69" y="-29.21"/>
					<TrackLine>
						<End x="60.252" y="-29.3687"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-29.3687"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="-29.3687"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="-29.3687"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="-29.5275"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_11_G43"/>
				<Subwire width="0.4">
					<Start x="81.915" y="-29.5275"/>
					<TrackLine>
						<End x="81.734" y="-30.0895"/>
					</TrackLine>
					<TrackLine>
						<End x="81.734" y="-30.2895"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="-30.2895"/>
						<End x="81.7112" y="-30.3823"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.6018" y="-30.5911"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-30.2895"/>
						<End x="81.026" y="-30.9395"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="-30.9395"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="-30.2895"/>
						<End x="76.2443" y="-30.9047"/>
					</TrackArcCW>
					<TrackLine>
						<End x="74.3579" y="-30.2617"/>
					</TrackLine>
					<TrackArc>
						<Center x="74.0351" y="-31.2087"/>
						<End x="74.066" y="-30.2087"/>
					</TrackArc>
					<TrackLine>
						<End x="65.2842" y="-29.9372"/>
					</TrackLine>
					<TrackLine>
						<End x="65.278" y="-29.9371"/>
					</TrackLine>
					<TrackLine>
						<End x="65.078" y="-29.9371"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="-29.5275"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_12_G44"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-27.305"/>
							<Dot x="51.9695" y="-27.5775"/>
							<Dot x="52.342" y="-26.8471"/>
							<Dot x="51.5331" y="-26.7131"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-26.67"/>
					<TrackLine>
						<End x="53.086" y="-26.67"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-28.321"/>
						<End x="52.342" y="-26.8471"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="-27.305"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_12_G44"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-27.305"/>
							<Dot x="51.5331" y="-27.8969"/>
							<Dot x="52.342" y="-27.7629"/>
							<Dot x="51.9695" y="-27.0325"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-27.94"/>
					<TrackLine>
						<End x="53.086" y="-27.94"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="-26.289"/>
						<End x="52.342" y="-27.7629"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="-27.305"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_12_G44"/>
				<Subwire width="0.4">
					<Start x="59.69" y="-26.67"/>
					<TrackLine>
						<End x="60.252" y="-26.5112"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-26.5112"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="-26.5112"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="-26.5112"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="-26.3525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_HART_12_G44"/>
				<Subwire width="0.4">
					<Start x="78.105" y="-29.5275"/>
					<TrackLine>
						<End x="77.924" y="-28.9655"/>
					</TrackLine>
					<TrackLine>
						<End x="77.924" y="-28.7655"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.724" y="-28.7655"/>
						<End x="77.8909" y="-28.6552"/>
					</TrackArc>
					<TrackLine>
						<End x="77.7364" y="-28.4215"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="-28.7655"/>
						<End x="77.4354" y="-28.1816"/>
					</TrackArc>
					<TrackLine>
						<End x="77.4198" y="-28.1757"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.105" y="-26.3525"/>
						<End x="77.2688" y="-28.1115"/>
					</TrackArcCW>
					<TrackLine>
						<End x="73.5493" y="-26.3433"/>
					</TrackLine>
					<TrackArc>
						<Center x="73.0555" y="-27.3819"/>
						<End x="73.0555" y="-26.2319"/>
					</TrackArc>
					<TrackLine>
						<End x="65.278" y="-26.2319"/>
					</TrackLine>
					<TrackLine>
						<End x="65.078" y="-26.2319"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="-26.3525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="USBDM"/>
				<Subwire fixed="on" width="0.3">
					<Start x="101.5974" y="-31.3302"/>
					<TrackLine>
						<End x="103.7128" y="-31.4345"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="USBDM"/>
				<Subwire width="0.2">
					<Teardrops>
						<Teardrop>
							<Dot x="99.3573" y="-32.9881"/>
							<Dot x="99.5486" y="-33.1491"/>
							<Dot x="99.8926" y="-32.74"/>
							<Dot x="99.3582" y="-32.7381"/>
						</Teardrop>
					</Teardrops>
					<Start x="101.465" y="-31.18"/>
					<TrackLine>
						<End x="101.44" y="-31.38"/>
					</TrackLine>
					<TrackLine>
						<End x="101.44" y="-31.48"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="100.59" y="-31.48"/>
						<End x="100.9474" y="-32.2512"/>
					</TrackArcCW>
					<TrackLine>
						<End x="99.3573" y="-32.9881"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="USBDM"/>
				<Subwire width="0.3">
					<Start x="103.7128" y="-31.4345"/>
					<TrackLine>
						<End x="103.7194" y="-31.4347"/>
					</TrackLine>
					<TrackArc>
						<Center x="103.735" y="-30.985"/>
						<End x="103.735" y="-31.435"/>
					</TrackArc>
					<TrackLine>
						<End x="104.005" y="-31.435"/>
					</TrackLine>
					<TrackArc>
						<Center x="104.005" y="-30.985"/>
						<End x="104.215" y="-31.383"/>
					</TrackArc>
					<TrackLine>
						<End x="104.3323" y="-31.3211"/>
					</TrackLine>
					<TrackArc>
						<Center x="104.155" y="-30.985"/>
						<End x="104.535" y="-30.985"/>
					</TrackArc>
					<TrackLine>
						<End x="104.535" y="-30.835"/>
					</TrackLine>
					<TrackLine>
						<End x="104.595" y="-30.36"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="USBDM"/>
				<Subwire width="0.2">
					<Start x="101.465" y="-31.18"/>
					<TrackLine>
						<End x="101.49" y="-31.3302"/>
					</TrackLine>
					<TrackLine>
						<End x="101.59" y="-31.3302"/>
					</TrackLine>
					<TrackLine>
						<End x="101.5974" y="-31.3302"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="USBDM"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="6.35" y="-18.7325"/>
							<Dot x="6.2893" y="-18.5419"/>
							<Dot x="5.8735" y="-18.6744"/>
							<Dot x="6.2453" y="-18.9029"/>
						</Teardrop>
					</Teardrops>
					<Start x="6.35" y="-18.7325"/>
					<TrackLine>
						<End x="5.5181" y="-18.6311"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-18.78"/>
						<End x="5.5" y="-18.63"/>
					</TrackArc>
					<TrackLine>
						<End x="5.35" y="-18.63"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00053"/>
				<Subwire width="0.4">
					<Start x="108.585" y="-2.8575"/>
					<TrackLine>
						<End x="108.4262" y="-2.4479"/>
					</TrackLine>
					<TrackLine>
						<End x="108.4262" y="-2.2479"/>
					</TrackLine>
					<TrackLine>
						<End x="108.4262" y="-0.9525"/>
					</TrackLine>
					<TrackLine>
						<End x="108.4262" y="-0.7525"/>
					</TrackLine>
					<TrackLine>
						<End x="108.2675" y="-0.3175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00053"/>
				<Subwire width="0.4">
					<Start x="103.505" y="-3.3655"/>
					<TrackLine>
						<End x="103.9146" y="-3.3655"/>
					</TrackLine>
					<TrackLine>
						<End x="104.1146" y="-3.3655"/>
					</TrackLine>
					<TrackLine>
						<End x="105.4354" y="-3.3655"/>
					</TrackLine>
					<TrackLine>
						<End x="105.6354" y="-3.3655"/>
					</TrackLine>
					<TrackLine>
						<End x="106.045" y="-3.3655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00053"/>
				<Subwire width="0.4">
					<Start x="106.045" y="-3.3655"/>
					<TrackLine>
						<End x="106.4546" y="-3.1115"/>
					</TrackLine>
					<TrackLine>
						<End x="106.6546" y="-3.1115"/>
					</TrackLine>
					<TrackLine>
						<End x="108.077" y="-3.1115"/>
					</TrackLine>
					<TrackLine>
						<End x="108.277" y="-3.1115"/>
					</TrackLine>
					<TrackLine>
						<End x="108.585" y="-2.8575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE2_G12"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="33.655"/>
							<Dot x="51.9695" y="33.3825"/>
							<Dot x="52.342" y="34.1129"/>
							<Dot x="51.5331" y="34.2469"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="34.29"/>
					<TrackLine>
						<End x="53.086" y="34.29"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="32.639"/>
						<End x="52.342" y="34.1129"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="33.655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE2_G12"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="33.655"/>
							<Dot x="51.5331" y="33.0631"/>
							<Dot x="52.342" y="33.1971"/>
							<Dot x="51.9695" y="33.9275"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="33.02"/>
					<TrackLine>
						<End x="53.086" y="33.02"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="34.671"/>
						<End x="52.342" y="33.1971"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="33.655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE2_G12"/>
				<Subwire width="0.4">
					<Start x="78.105" y="28.8925"/>
					<TrackLine>
						<End x="77.924" y="29.4545"/>
					</TrackLine>
					<TrackLine>
						<End x="77.924" y="29.6545"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.724" y="29.6545"/>
						<End x="77.8909" y="29.7648"/>
					</TrackArc>
					<TrackLine>
						<End x="77.7364" y="29.9985"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="29.6545"/>
						<End x="77.3953" y="30.252"/>
					</TrackArc>
					<TrackLine>
						<End x="65.3355" y="33.872"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="33.6804"/>
						<End x="65.278" y="33.8804"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="33.8804"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE2_G12"/>
				<Subwire width="0.4">
					<Start x="59.69" y="34.29"/>
					<TrackLine>
						<End x="60.252" y="34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R1_G15"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="8.255"/>
							<Dot x="51.756" y="7.655"/>
							<Dot x="52.9125" y="7.6618"/>
							<Dot x="52.241" y="8.6034"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="7.62"/>
					<TrackLine>
						<End x="53.086" y="7.62"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="8.001"/>
						<End x="52.9125" y="7.6618"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.7525" y="8.255"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R1_G15"/>
				<Subwire fixed="on" width="2">
					<Start x="41.275" y="5.715"/>
					<TrackLine>
						<End x="51.7525" y="8.255"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R1_G15"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="8.255"/>
							<Dot x="52.241" y="7.9066"/>
							<Dot x="52.9125" y="8.8482"/>
							<Dot x="51.756" y="8.855"/>
						</Teardrop>
					</Teardrops>
					<Start x="51.7525" y="8.255"/>
					<TrackLine>
						<End x="52.9125" y="8.8482"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="8.509"/>
						<End x="53.086" y="8.89"/>
					</TrackArcCW>
					<TrackLine>
						<End x="53.848" y="8.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R1_G15"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="5.715"/>
					<TrackLine>
						<End x="32.3896" y="5.9759"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.7025" y="8.255"/>
						<End x="32.1409" y="6.0241"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.7441" y="12.6697"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="11.7"/>
						<End x="5.5" y="12.7"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R1_G15"/>
				<Subwire width="0.4">
					<Start x="59.69" y="8.89"/>
					<TrackLine>
						<End x="60.252" y="8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="8.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R1_G15"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="67.62" y="11.8476"/>
							<Dot x="67.3329" y="11.9345"/>
							<Dot x="67.1432" y="11.3081"/>
							<Dot x="67.7415" y="11.5733"/>
						</Teardrop>
					</Teardrops>
					<Start x="67.62" y="11.8476"/>
					<TrackLine>
						<End x="65.4279" y="9.3672"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="65.278" y="9.4996"/>
						<End x="65.278" y="9.2996"/>
					</TrackArcCW>
					<TrackLine>
						<End x="65.078" y="9.2996"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="8.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R1_G15"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="71.5328" y="16.2469"/>
							<Dot x="71.8324" y="16.2301"/>
							<Dot x="71.8689" y="16.8836"/>
							<Dot x="71.35" y="16.4847"/>
						</Teardrop>
					</Teardrops>
					<Start x="83.185" y="18.9865"/>
					<TrackLine>
						<End x="83.004" y="19.5485"/>
					</TrackLine>
					<TrackLine>
						<End x="83.004" y="19.7485"/>
					</TrackLine>
					<TrackArc>
						<Center x="82.804" y="19.7485"/>
						<End x="82.9334" y="19.901"/>
					</TrackArc>
					<TrackLine>
						<End x="81.8999" y="20.7782"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="19.7485"/>
						<End x="81.2743" y="21.076"/>
					</TrackArc>
					<TrackLine>
						<End x="77.5931" y="21.7645"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="19.7485"/>
						<End x="77.4416" y="21.7871"/>
					</TrackArc>
					<TrackLine>
						<End x="75.5819" y="21.9928"/>
					</TrackLine>
					<TrackArc>
						<Center x="75.4719" y="20.9984"/>
						<End x="74.7001" y="21.635"/>
					</TrackArc>
					<TrackLine>
						<End x="73.8675" y="20.6256"/>
					</TrackLine>
					<TrackArc>
						<Center x="74.6393" y="19.989"/>
						<End x="73.7545" y="20.456"/>
					</TrackArc>
					<TrackLine>
						<End x="71.5328" y="16.2469"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00066"/>
				<Subwire width="0.4">
					<Start x="107.195" y="-30.36"/>
					<TrackLine>
						<End x="107.195" y="-30.985"/>
					</TrackLine>
					<TrackArc>
						<Center x="108.705" y="-30.985"/>
						<End x="107.4576" y="-31.8359"/>
					</TrackArc>
					<TrackLine>
						<End x="107.5307" y="-31.943"/>
					</TrackLine>
					<TrackArc>
						<Center x="108.935" y="-30.985"/>
						<End x="107.6358" y="-32.0814"/>
					</TrackArc>
					<TrackLine>
						<End x="108.7131" y="-33.3579"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="108.331" y="-33.6804"/>
						<End x="108.831" y="-33.6804"/>
					</TrackArcCW>
					<TrackLine>
						<End x="108.831" y="-36.2204"/>
					</TrackLine>
					<TrackLine>
						<End x="108.831" y="-36.4204"/>
					</TrackLine>
					<TrackLine>
						<End x="109.0295" y="-36.83"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00066"/>
				<Subwire width="0.4">
					<Start x="113.9825" y="-37.1475"/>
					<TrackLine>
						<End x="113.0825" y="-36.9887"/>
					</TrackLine>
					<TrackLine>
						<End x="112.8825" y="-36.9887"/>
					</TrackLine>
					<TrackLine>
						<End x="109.5375" y="-36.9887"/>
					</TrackLine>
					<TrackLine>
						<End x="109.3375" y="-36.9887"/>
					</TrackLine>
					<TrackLine>
						<End x="109.0295" y="-36.83"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00066"/>
				<Subwire width="0.4">
					<Start x="114.1095" y="-39.37"/>
					<TrackLine>
						<End x="114.046" y="-38.9604"/>
					</TrackLine>
					<TrackLine>
						<End x="114.046" y="-38.7604"/>
					</TrackLine>
					<TrackLine>
						<End x="114.046" y="-37.8475"/>
					</TrackLine>
					<TrackLine>
						<End x="114.046" y="-37.6475"/>
					</TrackLine>
					<TrackLine>
						<End x="113.9825" y="-37.1475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00066"/>
				<Subwire width="0.4">
					<Start x="110.617" y="-20.0025"/>
					<TrackLine>
						<End x="110.445" y="-20.4121"/>
					</TrackLine>
					<TrackLine>
						<End x="110.445" y="-20.6121"/>
					</TrackLine>
					<TrackLine>
						<End x="110.445" y="-22.235"/>
					</TrackLine>
					<TrackLine>
						<End x="110.445" y="-22.86"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00066"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="112.395" y="-16.8275"/>
							<Dot x="112.5855" y="-16.6408"/>
							<Dot x="112.395" y="-16.4465"/>
							<Dot x="112.2045" y="-16.6408"/>
						</Teardrop>
					</Teardrops>
					<Start x="112.395" y="-16.8275"/>
					<TrackLine>
						<End x="112.395" y="-16.4465"/>
					</TrackLine>
					<TrackLine>
						<End x="112.395" y="-16.2465"/>
					</TrackLine>
					<TrackLine>
						<End x="112.395" y="-15.6845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV1_G5"/>
				<Subwire fixed="on" width="2">
					<Start x="32.7025" y="38.735"/>
					<TrackLine>
						<End x="6.6471" y="35.6172"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="6.35" y="38.1"/>
						<End x="6.4617" y="35.602"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.5447" y="35.561"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="36.56"/>
						<End x="5.5" y="35.56"/>
					</TrackArcCW>
					<TrackLine>
						<End x="2" y="35.56"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV1_G5"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="38.735"/>
							<Dot x="32.706" y="38.135"/>
							<Dot x="33.8625" y="38.1418"/>
							<Dot x="33.191" y="39.0834"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="38.1"/>
					<TrackLine>
						<End x="34.036" y="38.1"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="38.481"/>
						<End x="33.8625" y="38.1418"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.7025" y="38.735"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV1_G5"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="38.735"/>
							<Dot x="33.191" y="38.3866"/>
							<Dot x="33.8625" y="39.3282"/>
							<Dot x="32.706" y="39.335"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="39.37"/>
					<TrackLine>
						<End x="34.036" y="39.37"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="38.989"/>
						<End x="33.8625" y="39.3282"/>
					</TrackArc>
					<TrackLine>
						<End x="32.7025" y="38.735"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV1_G5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="40.3225"/>
							<Dot x="46.7234" y="40.4601"/>
							<Dot x="46.4232" y="39.8785"/>
							<Dot x="47.0598" y="40.0307"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="39.37"/>
					<TrackLine>
						<End x="46.028" y="39.7796"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="39.7796"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="39.9796"/>
						<End x="46.3513" y="39.8222"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="40.3225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV1_G5"/>
				<Subwire width="0.4">
					<Start x="43.688" y="39.37"/>
					<TrackLine>
						<End x="43.38" y="39.37"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="39.37"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="39.37"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="39.37"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="39.37"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV1_G5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="68.7678" y="37.3323"/>
							<Dot x="68.8067" y="37.0348"/>
							<Dot x="69.4557" y="37.1197"/>
							<Dot x="68.9677" y="37.556"/>
						</Teardrop>
					</Teardrops>
					<Start x="78.105" y="33.5915"/>
					<TrackLine>
						<End x="77.924" y="34.1535"/>
					</TrackLine>
					<TrackLine>
						<End x="77.924" y="34.3535"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.724" y="34.3535"/>
						<End x="77.9012" y="34.4463"/>
					</TrackArc>
					<TrackLine>
						<End x="77.7918" y="34.6551"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="34.3535"/>
						<End x="77.3539" y="34.9887"/>
					</TrackArc>
					<TrackLine>
						<End x="74.025" y="35.7113"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="74.2372" y="36.689"/>
						<End x="73.9418" y="35.7331"/>
					</TrackArcCW>
					<TrackLine>
						<End x="68.7678" y="37.3323"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV2_G6"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="41.275"/>
							<Dot x="32.9195" y="41.0025"/>
							<Dot x="33.292" y="41.7329"/>
							<Dot x="32.4831" y="41.8669"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="41.91"/>
					<TrackLine>
						<End x="34.036" y="41.91"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="40.259"/>
						<End x="33.292" y="41.7329"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="41.275"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV2_G6"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="41.275"/>
							<Dot x="32.4831" y="40.6831"/>
							<Dot x="33.292" y="40.8171"/>
							<Dot x="32.9195" y="41.5475"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="40.64"/>
					<TrackLine>
						<End x="34.036" y="40.64"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="42.291"/>
						<End x="33.292" y="40.8171"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="41.275"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV2_G6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="74.2372" y="36.689"/>
							<Dot x="74.2936" y="36.3944"/>
							<Dot x="74.9364" y="36.5174"/>
							<Dot x="74.4236" y="36.924"/>
						</Teardrop>
					</Teardrops>
					<Start x="74.2372" y="36.689"/>
					<TrackLine>
						<End x="81.1809" y="34.9848"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="34.3535"/>
						<End x="81.6018" y="34.6551"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.7112" y="34.4463"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="34.3535"/>
						<End x="81.734" y="34.3535"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.734" y="34.1535"/>
					</TrackLine>
					<TrackLine>
						<End x="81.915" y="33.5915"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV2_G6"/>
				<Subwire width="0.4">
					<Start x="43.688" y="41.91"/>
					<TrackLine>
						<End x="43.38" y="41.91"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="41.91"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="41.91"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="41.91"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="41.91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV2_G6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="41.91"/>
							<Dot x="46.865" y="42.1827"/>
							<Dot x="46.27" y="41.91"/>
							<Dot x="46.865" y="41.6373"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="41.91"/>
					<TrackLine>
						<End x="46.028" y="41.91"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="41.91"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="41.91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N20MA_G31"/>
				<Subwire fixed="on" width="2">
					<Start x="32.7025" y="8.255"/>
					<TrackLine>
						<End x="5.7498" y="15.2083"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="14.24"/>
						<End x="5.5" y="15.24"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="15.24"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N20MA_G31"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="8.255"/>
							<Dot x="33.191" y="7.9066"/>
							<Dot x="33.8625" y="8.8482"/>
							<Dot x="32.706" y="8.855"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="8.89"/>
					<TrackLine>
						<End x="34.036" y="8.89"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="8.509"/>
						<End x="33.8625" y="8.8482"/>
					</TrackArc>
					<TrackLine>
						<End x="32.7025" y="8.255"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N20MA_G31"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="8.255"/>
							<Dot x="32.706" y="7.655"/>
							<Dot x="33.8625" y="7.6618"/>
							<Dot x="33.191" y="8.6034"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="7.62"/>
					<TrackLine>
						<End x="34.036" y="7.62"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="8.001"/>
						<End x="33.8625" y="7.6618"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.7025" y="8.255"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N20MA_G31"/>
				<Subwire width="0.4">
					<Start x="43.688" y="8.89"/>
					<TrackLine>
						<End x="43.38" y="8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="8.89"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="8.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N20MA_G31"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="9.8425"/>
							<Dot x="46.7234" y="9.9801"/>
							<Dot x="46.4232" y="9.3985"/>
							<Dot x="47.0598" y="9.5507"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="8.89"/>
					<TrackLine>
						<End x="46.028" y="9.2996"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="9.2996"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="9.4996"/>
						<End x="46.3513" y="9.3422"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="9.8425"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N20MA_G31"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="76.3478" y="8.4682"/>
							<Dot x="76.3627" y="8.1686"/>
							<Dot x="77.0164" y="8.2009"/>
							<Dot x="76.5651" y="8.675"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.3478" y="8.4682"/>
					<TrackLine>
						<End x="81.5273" y="6.3975"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="5.1435"/>
						<End x="81.8999" y="6.1732"/>
					</TrackArcCW>
					<TrackLine>
						<End x="82.9334" y="5.296"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="82.804" y="5.1435"/>
						<End x="83.004" y="5.1435"/>
					</TrackArcCW>
					<TrackLine>
						<End x="83.004" y="4.9435"/>
					</TrackLine>
					<TrackLine>
						<End x="83.185" y="4.3815"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="83.185" y="-11.7475"/>
							<Dot x="83.4087" y="-11.9473"/>
							<Dot x="83.7555" y="-11.559"/>
							<Dot x="83.2457" y="-11.4537"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="-10.2235"/>
					<TrackLine>
						<End x="84.274" y="-10.7855"/>
					</TrackLine>
					<TrackLine>
						<End x="84.274" y="-10.9855"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.074" y="-10.9855"/>
						<End x="84.2331" y="-11.1067"/>
					</TrackArcCW>
					<TrackLine>
						<End x="84.0463" y="-11.3517"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="83.566" y="-10.9855"/>
						<End x="83.7555" y="-11.559"/>
					</TrackArcCW>
					<TrackLine>
						<End x="83.185" y="-11.7475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="97.0306" y="20.5976"/>
							<Dot x="97.094" y="20.3044"/>
							<Dot x="97.7337" y="20.4425"/>
							<Dot x="97.2114" y="20.837"/>
						</Teardrop>
					</Teardrops>
					<Start x="104.9775" y="18.96"/>
					<TrackLine>
						<End x="104.6775" y="19.01"/>
					</TrackLine>
					<TrackLine>
						<End x="104.4775" y="19.01"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="104.4775" y="21.31"/>
						<End x="103.982" y="19.064"/>
					</TrackArcCW>
					<TrackLine>
						<End x="97.0306" y="20.5976"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="82.6642" y="-35.0794"/>
							<Dot x="82.4674" y="-35.3058"/>
							<Dot x="82.9616" y="-35.7351"/>
							<Dot x="82.9642" y="-35.0806"/>
						</Teardrop>
					</Teardrops>
					<Start x="82.6642" y="-35.0794"/>
					<TrackLine>
						<End x="84.2561" y="-38.5889"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.074" y="-38.6715"/>
						<End x="84.274" y="-38.6715"/>
					</TrackArcCW>
					<TrackLine>
						<End x="84.274" y="-38.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="-39.4335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="83.185" y="32.0675"/>
							<Dot x="83.4087" y="31.8677"/>
							<Dot x="83.7555" y="32.256"/>
							<Dot x="83.2457" y="32.3613"/>
						</Teardrop>
					</Teardrops>
					<Start x="83.185" y="32.0675"/>
					<TrackLine>
						<End x="83.7555" y="32.256"/>
					</TrackLine>
					<TrackArc>
						<Center x="83.566" y="32.8295"/>
						<End x="84.0463" y="32.4633"/>
					</TrackArc>
					<TrackLine>
						<End x="84.2331" y="32.7083"/>
					</TrackLine>
					<TrackArc>
						<Center x="84.074" y="32.8295"/>
						<End x="84.274" y="32.8295"/>
					</TrackArc>
					<TrackLine>
						<End x="84.274" y="33.0295"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="33.5915"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="83.185" y="17.4625"/>
							<Dot x="83.4087" y="17.2627"/>
							<Dot x="83.7555" y="17.651"/>
							<Dot x="83.2457" y="17.7563"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="18.9865"/>
					<TrackLine>
						<End x="84.274" y="18.4245"/>
					</TrackLine>
					<TrackLine>
						<End x="84.274" y="18.2245"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.074" y="18.2245"/>
						<End x="84.2331" y="18.1033"/>
					</TrackArcCW>
					<TrackLine>
						<End x="84.0463" y="17.8583"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="83.566" y="18.2245"/>
						<End x="83.7555" y="17.651"/>
					</TrackArcCW>
					<TrackLine>
						<End x="83.185" y="17.4625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="87.1275" y="22.714"/>
							<Dot x="86.8666" y="22.8621"/>
							<Dot x="86.5436" y="22.2928"/>
							<Dot x="87.1856" y="22.4197"/>
						</Teardrop>
					</Teardrops>
					<Start x="87.1275" y="22.714"/>
					<TrackLine>
						<End x="86.4253" y="22.2075"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.098" y="21.2748"/>
						<End x="86.1631" y="21.9445"/>
					</TrackArc>
					<TrackLine>
						<End x="84.6734" y="19.865"/>
					</TrackLine>
					<TrackArc>
						<Center x="84.836" y="19.7485"/>
						<End x="84.636" y="19.7485"/>
					</TrackArc>
					<TrackLine>
						<End x="84.636" y="19.5485"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="18.9865"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="83.185" y="-26.3525"/>
							<Dot x="83.4087" y="-26.5523"/>
							<Dot x="83.7555" y="-26.164"/>
							<Dot x="83.2457" y="-26.0587"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="-24.8285"/>
					<TrackLine>
						<End x="84.274" y="-25.3905"/>
					</TrackLine>
					<TrackLine>
						<End x="84.274" y="-25.5905"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.074" y="-25.5905"/>
						<End x="84.2331" y="-25.7117"/>
					</TrackArcCW>
					<TrackLine>
						<End x="84.0463" y="-25.9567"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="83.566" y="-25.5905"/>
						<End x="83.7555" y="-26.164"/>
					</TrackArcCW>
					<TrackLine>
						<End x="83.185" y="-26.3525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="83.185" y="2.8575"/>
							<Dot x="83.4087" y="2.6577"/>
							<Dot x="83.7555" y="3.046"/>
							<Dot x="83.2457" y="3.1513"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="4.3815"/>
					<TrackLine>
						<End x="84.274" y="3.8195"/>
					</TrackLine>
					<TrackLine>
						<End x="84.274" y="3.6195"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.074" y="3.6195"/>
						<End x="84.2331" y="3.4983"/>
					</TrackArcCW>
					<TrackLine>
						<End x="84.0463" y="3.2533"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="83.566" y="3.6195"/>
						<End x="83.7555" y="3.046"/>
					</TrackArcCW>
					<TrackLine>
						<End x="83.185" y="2.8575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="87.098" y="21.2748"/>
							<Dot x="86.811" y="21.3621"/>
							<Dot x="86.6205" y="20.7359"/>
							<Dot x="87.2192" y="21.0003"/>
						</Teardrop>
					</Teardrops>
					<Start x="87.098" y="21.2748"/>
					<TrackLine>
						<End x="86.1275" y="20.1796"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.614" y="19.7485"/>
						<End x="86.0382" y="20.0501"/>
					</TrackArc>
					<TrackLine>
						<End x="85.9288" y="19.8413"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.106" y="19.7485"/>
						<End x="85.906" y="19.7485"/>
					</TrackArc>
					<TrackLine>
						<End x="85.906" y="19.5485"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="18.9865"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="85.725" y="2.8575"/>
							<Dot x="85.9977" y="2.9825"/>
							<Dot x="85.725" y="3.5775"/>
							<Dot x="85.4523" y="2.9825"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="4.3815"/>
					<TrackLine>
						<End x="85.725" y="3.8195"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="3.6195"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="2.8575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="85.725" y="17.4625"/>
							<Dot x="85.9977" y="17.5875"/>
							<Dot x="85.725" y="18.1825"/>
							<Dot x="85.4523" y="17.5875"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="18.9865"/>
					<TrackLine>
						<End x="85.725" y="18.4245"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="18.2245"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="17.4625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.1183" y="-35.303"/>
							<Dot x="83.9168" y="-35.5253"/>
							<Dot x="84.4019" y="-35.9648"/>
							<Dot x="84.4182" y="-35.3105"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.1183" y="-35.303"/>
					<TrackLine>
						<End x="85.5278" y="-38.5927"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="85.344" y="-38.6715"/>
						<End x="85.544" y="-38.6715"/>
					</TrackArcCW>
					<TrackLine>
						<End x="85.544" y="-38.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="-39.4335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="85.725" y="-26.3525"/>
							<Dot x="85.9977" y="-26.2275"/>
							<Dot x="85.725" y="-25.6325"/>
							<Dot x="85.4523" y="-26.2275"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="-24.8285"/>
					<TrackLine>
						<End x="85.725" y="-25.3905"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="-25.5905"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="-26.3525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="85.725" y="32.0675"/>
							<Dot x="85.9977" y="32.1925"/>
							<Dot x="85.725" y="32.7875"/>
							<Dot x="85.4523" y="32.1925"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="32.0675"/>
					<TrackLine>
						<End x="85.725" y="32.8295"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="33.0295"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="33.5915"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="94.202" y="19.958"/>
							<Dot x="94.2746" y="19.6669"/>
							<Dot x="94.9097" y="19.8253"/>
							<Dot x="94.3752" y="20.2031"/>
						</Teardrop>
					</Teardrops>
					<Start x="104.9775" y="18.16"/>
					<TrackLine>
						<End x="104.6775" y="18.21"/>
					</TrackLine>
					<TrackLine>
						<End x="104.4775" y="18.21"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="104.4775" y="21.11"/>
						<End x="103.9927" y="18.2508"/>
					</TrackArcCW>
					<TrackLine>
						<End x="96.8384" y="19.4638"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="97.0306" y="20.5976"/>
						<End x="96.8186" y="19.4673"/>
					</TrackArcCW>
					<TrackLine>
						<End x="94.202" y="19.958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="85.725" y="-11.7475"/>
							<Dot x="85.9977" y="-11.6225"/>
							<Dot x="85.725" y="-11.0275"/>
							<Dot x="85.4523" y="-11.6225"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="-10.2235"/>
					<TrackLine>
						<End x="85.725" y="-10.7855"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="-10.9855"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="-11.7475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00054"/>
				<Subwire width="0.4">
					<Start x="108.8775" y="22.86"/>
					<TrackLine>
						<End x="108.8275" y="23.16"/>
					</TrackLine>
					<TrackLine>
						<End x="108.8275" y="23.36"/>
					</TrackLine>
					<TrackLine>
						<End x="108.8275" y="24.7904"/>
					</TrackLine>
					<TrackLine>
						<End x="108.8275" y="24.9904"/>
					</TrackLine>
					<TrackLine>
						<End x="108.7755" y="25.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00054"/>
				<Subwire width="0.4">
					<Start x="108.7755" y="25.4"/>
					<TrackLine>
						<End x="108.7755" y="25.8096"/>
					</TrackLine>
					<TrackLine>
						<End x="108.7755" y="26.0096"/>
					</TrackLine>
					<TrackLine>
						<End x="108.7755" y="27.3304"/>
					</TrackLine>
					<TrackLine>
						<End x="108.7755" y="27.5304"/>
					</TrackLine>
					<TrackLine>
						<End x="108.7755" y="27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="241.935" y="-37.7825"/>
					<TrackLine>
						<End x="240.03" y="-37.7825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="240.03" y="-37.7825"/>
					<TrackLine>
						<End x="238.125" y="-37.7825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="210.5" y="-37.7825"/>
					<TrackLine>
						<End x="207" y="-37.7825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV_IN"/>
				<Subwire width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="252.5" y="-40"/>
							<Dot x="253.0211" y="-39.1465"/>
							<Dot x="251.3547" y="-38.1292"/>
							<Dot x="251.5029" y="-40.0759"/>
						</Teardrop>
					</Teardrops>
					<Start x="251" y="-37.6"/>
					<TrackLine>
						<End x="250.9282" y="-37.683"/>
					</TrackLine>
					<TrackLine>
						<End x="251.2818" y="-38.0366"/>
					</TrackLine>
					<TrackLine>
						<End x="251.286" y="-38.0409"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="250.9282" y="-38.3903"/>
						<End x="251.3547" y="-38.1292"/>
					</TrackArcCW>
					<TrackLine>
						<End x="252.5" y="-40"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV_IN"/>
				<Subwire width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="207" y="-37.7825"/>
							<Dot x="206.9345" y="-37.186"/>
							<Dot x="205.6333" y="-37.3289"/>
							<Dot x="206.5909" y="-38.2214"/>
						</Teardrop>
					</Teardrops>
					<Start x="207" y="-37.7825"/>
					<TrackLine>
						<End x="188.554" y="-31.6596"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.68" y="-31.28"/>
						<End x="188.28" y="-31.28"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.28" y="-30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV_IN"/>
				<Subwire width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="252.5" y="-40"/>
							<Dot x="252.079" y="-39.0929"/>
							<Dot x="251.1187" y="-39.5386"/>
							<Dot x="251.6184" y="-40.4719"/>
						</Teardrop>
						<Teardrop>
							<Dot x="241.935" y="-37.7825"/>
							<Dot x="242.1582" y="-38.2299"/>
							<Dot x="243.1343" y="-37.7428"/>
							<Dot x="242.1282" y="-37.3213"/>
						</Teardrop>
					</Teardrops>
					<Start x="252.5" y="-40"/>
					<TrackLine>
						<End x="251.1187" y="-39.5386"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="251.7903" y="-37.5282"/>
						<End x="250.5456" y="-39.2439"/>
					</TrackArcCW>
					<TrackLine>
						<End x="248.9096" y="-38.057"/>
					</TrackLine>
					<TrackArc>
						<Center x="247.5" y="-40"/>
						<End x="247.4205" y="-37.6008"/>
					</TrackArc>
					<TrackLine>
						<End x="241.935" y="-37.7825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_NXX_G30"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="18.415"/>
							<Dot x="51.9695" y="18.1425"/>
							<Dot x="52.342" y="18.8729"/>
							<Dot x="51.5331" y="19.0069"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="19.05"/>
					<TrackLine>
						<End x="53.086" y="19.05"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="17.399"/>
						<End x="52.342" y="18.8729"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="18.415"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_NXX_G30"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="18.415"/>
							<Dot x="51.5331" y="17.8231"/>
							<Dot x="52.342" y="17.9571"/>
							<Dot x="51.9695" y="18.6875"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="17.78"/>
					<TrackLine>
						<End x="53.086" y="17.78"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="19.431"/>
						<End x="52.342" y="17.9571"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="18.415"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_NXX_G30"/>
				<Subwire width="0.4">
					<Start x="59.69" y="19.05"/>
					<TrackLine>
						<End x="60.252" y="19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="19.05"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="19.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_NXX_G30"/>
				<Subwire width="0.4">
					<Start x="81.915" y="4.3815"/>
					<TrackLine>
						<End x="81.734" y="4.9435"/>
					</TrackLine>
					<TrackLine>
						<End x="81.734" y="5.1435"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.534" y="5.1435"/>
						<End x="81.7112" y="5.2363"/>
					</TrackArc>
					<TrackLine>
						<End x="81.6018" y="5.4451"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="5.1435"/>
						<End x="81.2343" y="5.7592"/>
					</TrackArc>
					<TrackLine>
						<End x="76.0272" y="7.5204"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.3478" y="8.4682"/>
						<End x="75.6204" y="7.7812"/>
					</TrackArcCW>
					<TrackLine>
						<End x="65.4234" y="18.5777"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="18.4404"/>
						<End x="65.278" y="18.6404"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="18.6404"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="19.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="USB_TX"/>
				<Subwire width="0.4">
					<Start x="112.395" y="-22.86"/>
					<TrackLine>
						<End x="112.395" y="-22.235"/>
					</TrackLine>
					<TrackArc>
						<Center x="111.305" y="-22.235"/>
						<End x="112.3754" y="-22.0293"/>
					</TrackArc>
					<TrackLine>
						<End x="111.3096" y="-16.4843"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="111.506" y="-16.4465"/>
						<End x="111.306" y="-16.4465"/>
					</TrackArcCW>
					<TrackLine>
						<End x="111.306" y="-16.2465"/>
					</TrackLine>
					<TrackLine>
						<End x="111.125" y="-15.6845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="241.935" y="-44.1325"/>
					<TrackLine>
						<End x="240.03" y="-44.1325"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="240.03" y="-44.1325"/>
					<TrackLine>
						<End x="238.125" y="-44.1325"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="210.5" y="-44.1325"/>
					<TrackLine>
						<End x="207" y="-44.1325"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V_IN"/>
				<Subwire width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="207" y="-44.1325"/>
							<Dot x="206.7283" y="-43.5976"/>
							<Dot x="205.5612" y="-44.1904"/>
							<Dot x="206.7721" y="-44.6876"/>
						</Teardrop>
					</Teardrops>
					<Start x="207" y="-44.1325"/>
					<TrackLine>
						<End x="190.9122" y="-44.7799"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.88" y="-43.98"/>
						<End x="190.88" y="-44.7805"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.08" y="-44.7805"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.08" y="-43.98"/>
						<End x="189.851" y="-44.747"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.5656" y="-44.3633"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.68" y="-43.98"/>
						<End x="188.28" y="-43.98"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.28" y="-43.18"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V_IN"/>
				<Subwire width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="247.5" y="-35"/>
							<Dot x="247.4134" y="-35.9962"/>
							<Dot x="249.3946" y="-36.1685"/>
							<Dot x="248.3514" y="-34.4754"/>
						</Teardrop>
					</Teardrops>
					<Start x="249.9224" y="-36.5224"/>
					<TrackLine>
						<End x="249.8394" y="-36.5942"/>
					</TrackLine>
					<TrackLine>
						<End x="249.4858" y="-36.2406"/>
					</TrackLine>
					<TrackLine>
						<End x="249.4815" y="-36.2364"/>
					</TrackLine>
					<TrackArc>
						<Center x="249.1321" y="-36.5942"/>
						<End x="249.3946" y="-36.1685"/>
					</TrackArc>
					<TrackLine>
						<End x="247.5" y="-35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="90.3605" y="-24.765"/>
					<TrackLine>
						<End x="90.3605" y="-39.37"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="90.3605" y="19.05"/>
					<TrackLine>
						<End x="90.3605" y="4.445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="90.3605" y="19.05"/>
					<TrackLine>
						<End x="90.3605" y="33.655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="90.3605" y="-24.765"/>
					<TrackLine>
						<End x="90.3605" y="-10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.5">
					<Start x="135.6995" y="18.7325"/>
					<TrackLine>
						<End x="135.6995" y="19.0921"/>
					</TrackLine>
					<TrackLine>
						<End x="135.6995" y="19.3421"/>
					</TrackLine>
					<TrackLine>
						<End x="135.6995" y="20.6629"/>
					</TrackLine>
					<TrackLine>
						<End x="135.6995" y="20.9129"/>
					</TrackLine>
					<TrackLine>
						<End x="135.6995" y="21.2725"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.5">
					<Teardrops>
						<Teardrop>
							<Dot x="131.1275" y="16.1925"/>
							<Dot x="131.6659" y="16.0803"/>
							<Dot x="131.8697" y="17.058"/>
							<Dot x="130.9345" y="16.7075"/>
						</Teardrop>
					</Teardrops>
					<Start x="131.1275" y="16.1925"/>
					<TrackLine>
						<End x="131.8697" y="17.058"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="132.6668" y="16.3745"/>
						<End x="132.6702" y="17.4245"/>
					</TrackArcCW>
					<TrackLine>
						<End x="133.1572" y="17.4229"/>
					</TrackLine>
					<TrackLine>
						<End x="133.1595" y="17.4229"/>
					</TrackLine>
					<TrackLine>
						<End x="134.1755" y="17.4229"/>
					</TrackLine>
					<TrackArc>
						<Center x="134.1755" y="18.1229"/>
						<End x="134.4855" y="17.4953"/>
					</TrackArc>
					<TrackLine>
						<End x="135.3022" y="17.8988"/>
					</TrackLine>
					<TrackArc>
						<Center x="135.1915" y="18.1229"/>
						<End x="135.4415" y="18.1229"/>
					</TrackArc>
					<TrackLine>
						<End x="135.4415" y="18.3729"/>
					</TrackLine>
					<TrackLine>
						<End x="135.6995" y="18.7325"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.8">
					<Start x="6.35" y="-32.7025"/>
					<TrackLine>
						<End x="5.5" y="-32.7025"/>
					</TrackLine>
					<TrackLine>
						<End x="5.1" y="-32.7025"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-33.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="90.3605" y="-24.765"/>
					<TrackLine>
						<End x="90.0525" y="-24.7967"/>
					</TrackLine>
					<TrackLine>
						<End x="89.8525" y="-24.7967"/>
					</TrackLine>
					<TrackLine>
						<End x="88.646" y="-24.7967"/>
					</TrackLine>
					<TrackLine>
						<End x="88.446" y="-24.7967"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="-24.8285"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.8">
					<Start x="92.6934" y="-7.4369"/>
					<TrackLine>
						<End x="90.6525" y="3.211"/>
					</TrackLine>
					<TrackArc>
						<Center x="89.3266" y="2.9569"/>
						<End x="90.5942" y="3.4213"/>
					</TrackArc>
					<TrackLine>
						<End x="90.4929" y="3.6978"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="90.8685" y="3.8354"/>
						<End x="90.4685" y="3.8354"/>
					</TrackArcCW>
					<TrackLine>
						<End x="90.4685" y="4.2354"/>
					</TrackLine>
					<TrackLine>
						<End x="90.3605" y="4.445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="90.3605" y="-10.16"/>
					<TrackLine>
						<End x="90.0525" y="-10.1917"/>
					</TrackLine>
					<TrackLine>
						<End x="89.8525" y="-10.1917"/>
					</TrackLine>
					<TrackLine>
						<End x="88.646" y="-10.1917"/>
					</TrackLine>
					<TrackLine>
						<End x="88.446" y="-10.1917"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="-10.2235"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="110.461" y="1.9953"/>
							<Dot x="110.7069" y="2.1672"/>
							<Dot x="110.3318" y="2.7036"/>
							<Dot x="110.1703" y="2.0694"/>
						</Teardrop>
					</Teardrops>
					<Start x="109.6645" y="3.4925"/>
					<TrackLine>
						<End x="110.2805" y="3.1845"/>
					</TrackLine>
					<TrackLine>
						<End x="110.2805" y="2.9845"/>
					</TrackLine>
					<TrackLine>
						<End x="110.461" y="1.9953"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="90.3605" y="19.05"/>
					<TrackLine>
						<End x="90.0525" y="19.0182"/>
					</TrackLine>
					<TrackLine>
						<End x="89.8525" y="19.0182"/>
					</TrackLine>
					<TrackLine>
						<End x="88.646" y="19.0182"/>
					</TrackLine>
					<TrackLine>
						<End x="88.446" y="19.0182"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="18.9865"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.5">
					<Start x="135.6995" y="21.2725"/>
					<TrackLine>
						<End x="135.6995" y="21.6321"/>
					</TrackLine>
					<TrackLine>
						<End x="135.6995" y="21.8821"/>
					</TrackLine>
					<TrackLine>
						<End x="135.6995" y="23.2029"/>
					</TrackLine>
					<TrackLine>
						<End x="135.6995" y="23.4529"/>
					</TrackLine>
					<TrackLine>
						<End x="135.6995" y="23.8125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="90.3605" y="4.445"/>
					<TrackLine>
						<End x="90.0525" y="4.4132"/>
					</TrackLine>
					<TrackLine>
						<End x="89.8525" y="4.4132"/>
					</TrackLine>
					<TrackLine>
						<End x="88.646" y="4.4132"/>
					</TrackLine>
					<TrackLine>
						<End x="88.446" y="4.4132"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="4.3815"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="90.3605" y="33.655"/>
					<TrackLine>
						<End x="90.0525" y="33.6232"/>
					</TrackLine>
					<TrackLine>
						<End x="89.8525" y="33.6232"/>
					</TrackLine>
					<TrackLine>
						<End x="88.646" y="33.6232"/>
					</TrackLine>
					<TrackLine>
						<End x="88.446" y="33.6232"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="33.5915"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="90.3605" y="-39.37"/>
					<TrackLine>
						<End x="90.0525" y="-39.4017"/>
					</TrackLine>
					<TrackLine>
						<End x="89.8525" y="-39.4017"/>
					</TrackLine>
					<TrackLine>
						<End x="88.646" y="-39.4017"/>
					</TrackLine>
					<TrackLine>
						<End x="88.446" y="-39.4017"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="-39.4335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="110.461" y="1.9953"/>
							<Dot x="110.1617" y="1.9741"/>
							<Dot x="110.2082" y="1.3211"/>
							<Dot x="110.6725" y="1.7825"/>
						</Teardrop>
					</Teardrops>
					<Start x="110.461" y="1.9953"/>
					<TrackLine>
						<End x="109.8582" y="0.3877"/>
					</TrackLine>
					<TrackArc>
						<Center x="110.0455" y="0.3175"/>
						<End x="109.8455" y="0.3175"/>
					</TrackArc>
					<TrackLine>
						<End x="109.8455" y="0.1175"/>
					</TrackLine>
					<TrackLine>
						<End x="109.6645" y="-0.3175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="112.0012" y="-11.3588"/>
							<Dot x="112.1992" y="-11.33"/>
							<Dot x="112.1363" y="-10.8982"/>
							<Dot x="111.8502" y="-11.2276"/>
						</Teardrop>
					</Teardrops>
					<Start x="112.0012" y="-11.3588"/>
					<TrackLine>
						<End x="112.2059" y="-10.6608"/>
					</TrackLine>
					<TrackArc>
						<Center x="112.014" y="-10.6045"/>
						<End x="112.214" y="-10.6045"/>
					</TrackArc>
					<TrackLine>
						<End x="112.214" y="-10.4045"/>
					</TrackLine>
					<TrackLine>
						<End x="112.395" y="-9.8425"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.8">
					<Start x="103.505" y="-12.3825"/>
					<TrackLine>
						<End x="102.805" y="-12.0825"/>
					</TrackLine>
					<TrackLine>
						<End x="102.405" y="-12.0825"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="102.405" y="-11.6825"/>
						<End x="102.2264" y="-12.0404"/>
					</TrackArcCW>
					<TrackLine>
						<End x="101.4672" y="-11.6614"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="102.405" y="-9.7825"/>
						<End x="101.4534" y="-11.6545"/>
					</TrackArcCW>
					<TrackLine>
						<End x="94.2226" y="-7.979"/>
					</TrackLine>
					<TrackArc>
						<Center x="93.6109" y="-9.1825"/>
						<End x="94.052" y="-7.9066"/>
					</TrackArc>
					<TrackLine>
						<End x="92.6934" y="-7.4369"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.8">
					<Start x="112.0012" y="-11.3588"/>
					<TrackLine>
						<End x="111.707" y="-11.4304"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="111.506" y="-10.6045"/>
						<End x="111.5828" y="-11.451"/>
					</TrackArcCW>
					<TrackLine>
						<End x="104.6411" y="-12.0809"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="104.605" y="-11.6825"/>
						<End x="104.605" y="-12.0825"/>
					</TrackArcCW>
					<TrackLine>
						<End x="104.205" y="-12.0825"/>
					</TrackLine>
					<TrackLine>
						<End x="103.505" y="-12.3825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="114.6175" y="1.5875"/>
							<Dot x="114.4228" y="1.0732"/>
							<Dot x="115.4516" y="0.6836"/>
							<Dot x="115.1458" y="1.7404"/>
						</Teardrop>
						<Teardrop>
							<Dot x="131.1275" y="16.1925"/>
							<Dot x="130.5348" y="16.2854"/>
							<Dot x="130.3597" y="15.1684"/>
							<Dot x="131.3828" y="15.6496"/>
						</Teardrop>
					</Teardrops>
					<Start x="114.6175" y="1.5875"/>
					<TrackLine>
						<End x="115.4936" y="0.6381"/>
					</TrackLine>
					<TrackArc>
						<Center x="116.5225" y="1.5875"/>
						<End x="116.5225" y="0.1875"/>
					</TrackArc>
					<TrackLine>
						<End x="118.4275" y="0.1875"/>
					</TrackLine>
					<TrackArc>
						<Center x="118.4275" y="1.5875"/>
						<End x="119.5476" y="0.7477"/>
					</TrackArc>
					<TrackLine>
						<End x="131.1275" y="16.1925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.8">
					<Start x="103.505" y="-12.3825"/>
					<TrackLine>
						<End x="102.805" y="-12.0825"/>
					</TrackLine>
					<TrackLine>
						<End x="102.405" y="-12.0825"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="102.405" y="-11.6825"/>
						<End x="102.0164" y="-11.7772"/>
					</TrackArcCW>
					<TrackLine>
						<End x="101.5792" y="-9.9838"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="102.405" y="-9.7825"/>
						<End x="101.555" y="-9.7825"/>
					</TrackArcCW>
					<TrackLine>
						<End x="101.555" y="-8.3825"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="102.405" y="-8.3825"/>
						<End x="101.5583" y="-8.3073"/>
					</TrackArcCW>
					<TrackLine>
						<End x="102.0487" y="-2.7823"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="102.8954" y="-2.8575"/>
						<End x="102.3234" y="-2.2287"/>
					</TrackArcCW>
					<TrackLine>
						<End x="108.3793" y="3.2804"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="108.6485" y="2.9845"/>
						<End x="108.6485" y="3.3845"/>
					</TrackArcCW>
					<TrackLine>
						<End x="109.0485" y="3.3845"/>
					</TrackLine>
					<TrackLine>
						<End x="109.6645" y="3.4925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.8">
					<Start x="92.6934" y="-7.4369"/>
					<TrackLine>
						<End x="90.6063" y="-9.2483"/>
					</TrackLine>
					<TrackArc>
						<Center x="90.8685" y="-9.5504"/>
						<End x="90.4685" y="-9.5504"/>
					</TrackArc>
					<TrackLine>
						<End x="90.4685" y="-9.9504"/>
					</TrackLine>
					<TrackLine>
						<End x="90.3605" y="-10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Start x="112.395" y="-9.8425"/>
					<TrackLine>
						<End x="112.576" y="-9.906"/>
					</TrackLine>
					<TrackLine>
						<End x="112.776" y="-9.906"/>
					</TrackLine>
					<TrackLine>
						<End x="113.6904" y="-9.906"/>
					</TrackLine>
					<TrackLine>
						<End x="113.8904" y="-9.906"/>
					</TrackLine>
					<TrackLine>
						<End x="114.3" y="-9.9695"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V"/>
				<Subwire width="0.8">
					<Start x="12.7" y="-33.655"/>
					<TrackLine>
						<End x="14.5326" y="-34.6224"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="13.6223" y="-36.3469"/>
						<End x="15.544" y="-36.0161"/>
					</TrackArcCW>
					<TrackLine>
						<End x="15.9568" y="-38.4139"/>
					</TrackLine>
					<TrackArc>
						<Center x="17.78" y="-38.1"/>
						<End x="17.5495" y="-39.9356"/>
					</TrackArc>
					<TrackLine>
						<End x="31.8492" y="-41.7315"/>
					</TrackLine>
					<TrackArc>
						<Center x="32.385" y="-37.465"/>
						<End x="32.3435" y="-41.7648"/>
					</TrackArc>
					<TrackLine>
						<End x="34.0041" y="-41.7808"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-38.481"/>
						<End x="34.0318" y="-41.781"/>
					</TrackArc>
					<TrackLine>
						<End x="111.5671" y="-41.8796"/>
					</TrackLine>
					<TrackLine>
						<End x="111.5695" y="-41.8796"/>
					</TrackLine>
					<TrackLine>
						<End x="114.6175" y="-41.8796"/>
					</TrackLine>
					<TrackArc>
						<Center x="114.6175" y="-39.9796"/>
						<End x="116.4739" y="-40.3845"/>
					</TrackArc>
					<TrackLine>
						<End x="116.9389" y="-38.2524"/>
					</TrackLine>
					<TrackArc>
						<Center x="115.0825" y="-37.8475"/>
						<End x="116.9825" y="-37.8528"/>
					</TrackArc>
					<TrackLine>
						<End x="117.005" y="-29.7472"/>
					</TrackLine>
					<TrackArc>
						<Center x="112.605" y="-29.735"/>
						<End x="116.9502" y="-29.0425"/>
					</TrackArc>
					<TrackLine>
						<End x="114.6523" y="-14.6235"/>
					</TrackLine>
					<TrackArc>
						<Center x="112.776" y="-14.9225"/>
						<End x="114.1505" y="-13.6107"/>
					</TrackArc>
					<TrackLine>
						<End x="112.0012" y="-11.3588"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_V_OLD_G9"/>
				<Subwire fixed="on" width="2">
					<Start x="32.7025" y="31.115"/>
					<TrackLine>
						<End x="5.5827" y="30.481"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="34.02"/>
						<End x="5.5" y="30.48"/>
					</TrackArcCW>
					<TrackLine>
						<End x="2" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_V_OLD_G9"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="31.115"/>
							<Dot x="32.706" y="30.515"/>
							<Dot x="33.8625" y="30.5218"/>
							<Dot x="33.191" y="31.4634"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="30.48"/>
					<TrackLine>
						<End x="34.036" y="30.48"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="30.861"/>
						<End x="33.8625" y="30.5218"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.7025" y="31.115"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_V_OLD_G9"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="31.115"/>
							<Dot x="33.191" y="30.7666"/>
							<Dot x="33.8625" y="31.7082"/>
							<Dot x="32.706" y="31.715"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="31.75"/>
					<TrackLine>
						<End x="34.036" y="31.75"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="31.369"/>
						<End x="33.8625" y="31.7082"/>
					</TrackArc>
					<TrackLine>
						<End x="32.7025" y="31.115"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_V_OLD_G9"/>
				<Subwire width="0.4">
					<Start x="43.688" y="31.75"/>
					<TrackLine>
						<End x="43.38" y="31.75"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="31.75"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="31.75"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="31.75"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="31.75"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_V_OLD_G9"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="32.7025"/>
							<Dot x="46.7234" y="32.8401"/>
							<Dot x="46.4232" y="32.2585"/>
							<Dot x="47.0598" y="32.4107"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="31.75"/>
					<TrackLine>
						<End x="46.028" y="32.1596"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="32.1596"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="32.3596"/>
						<End x="46.3513" y="32.2022"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="32.7025"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_V_OLD_G9"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="67.9829" y="28.8688"/>
							<Dot x="67.9961" y="28.5691"/>
							<Dot x="68.65" y="28.5978"/>
							<Dot x="68.2013" y="29.0745"/>
						</Teardrop>
					</Teardrops>
					<Start x="86.995" y="28.8925"/>
					<TrackLine>
						<End x="86.814" y="28.3305"/>
					</TrackLine>
					<TrackLine>
						<End x="86.814" y="28.1305"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.614" y="28.1305"/>
						<End x="86.7912" y="28.0377"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.6818" y="27.8289"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.106" y="28.1305"/>
						<End x="86.2853" y="27.5057"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.5916" y="26.159"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="28.1305"/>
						<End x="81.026" y="26.0795"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="26.0795"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="28.1305"/>
						<End x="75.889" y="26.1589"/>
					</TrackArcCW>
					<TrackLine>
						<End x="71.7456" y="27.3463"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="72.0212" y="28.3081"/>
						<End x="71.6446" y="27.3812"/>
					</TrackArcCW>
					<TrackLine>
						<End x="67.9829" y="28.8688"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+V_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="238.125" y="-40.9575"/>
					<TrackLine>
						<End x="240.03" y="-40.9575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+V_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="241.935" y="-40.9575"/>
					<TrackLine>
						<End x="240.03" y="-40.9575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+V_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="207" y="-40.9575"/>
					<TrackLine>
						<End x="210.5" y="-40.9575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+V_IN"/>
				<Subwire width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="247.5" y="-40"/>
							<Dot x="246.9352" y="-39.1748"/>
							<Dot x="245.1348" y="-40.407"/>
							<Dot x="247.2436" y="-40.9666"/>
						</Teardrop>
						<Teardrop>
							<Dot x="241.935" y="-40.9575"/>
							<Dot x="242.2174" y="-41.3701"/>
							<Dot x="243.1176" y="-40.754"/>
							<Dot x="242.0632" y="-40.4743"/>
						</Teardrop>
					</Teardrops>
					<Start x="247.5" y="-40"/>
					<TrackLine>
						<End x="241.935" y="-40.9575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+V_IN"/>
				<Subwire width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="207" y="-40.9575"/>
							<Dot x="206.9571" y="-40.359"/>
							<Dot x="205.6513" y="-40.4528"/>
							<Dot x="206.5747" y="-41.3808"/>
						</Teardrop>
					</Teardrops>
					<Start x="188.28" y="-36.58"/>
					<TrackLine>
						<End x="188.28" y="-35.78"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.68" y="-35.78"/>
						<End x="188.5656" y="-35.3967"/>
					</TrackArcCW>
					<TrackLine>
						<End x="189.851" y="-35.013"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.08" y="-35.78"/>
						<End x="190.08" y="-34.9795"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.88" y="-34.9795"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.88" y="-35.78"/>
						<End x="191.1606" y="-35.0303"/>
					</TrackArcCW>
					<TrackLine>
						<End x="207" y="-40.9575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="241.935" y="-14.9225"/>
					<TrackLine>
						<End x="239.935" y="-14.9225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="240" y="-14.9225"/>
					<TrackLine>
						<End x="238.125" y="-14.9225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="210.5" y="-14.9225"/>
					<TrackLine>
						<End x="207" y="-14.9225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I_IN"/>
				<Subwire width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="241.935" y="-14.9225"/>
							<Dot x="241.92" y="-15.4223"/>
							<Dot x="243.0103" y="-15.4551"/>
							<Dot x="242.3234" y="-14.6077"/>
						</Teardrop>
						<Teardrop>
							<Dot x="252.5" y="-15"/>
							<Dot x="251.698" y="-14.4027"/>
							<Dot x="250.3947" y="-16.1523"/>
							<Dot x="252.571" y="-15.9975"/>
						</Teardrop>
					</Teardrops>
					<Start x="241.935" y="-14.9225"/>
					<TrackLine>
						<End x="246.4346" y="-17.1511"/>
					</TrackLine>
					<TrackArc>
						<Center x="247.5" y="-15"/>
						<End x="248.6525" y="-17.1058"/>
					</TrackArc>
					<TrackLine>
						<End x="252.5" y="-15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I_IN"/>
				<Subwire width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="207" y="-14.9225"/>
							<Dot x="206.6129" y="-14.4642"/>
							<Dot x="205.6128" y="-15.3088"/>
							<Dot x="206.9055" y="-15.515"/>
						</Teardrop>
					</Teardrops>
					<Start x="207" y="-14.9225"/>
					<TrackLine>
						<End x="191.0947" y="-19.3512"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.88" y="-18.58"/>
						<End x="190.88" y="-19.3805"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.08" y="-19.3805"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.08" y="-18.58"/>
						<End x="189.851" y="-19.347"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.5656" y="-18.9633"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.68" y="-18.58"/>
						<End x="188.28" y="-18.58"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.28" y="-17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="1">
					<Start x="105.8454" y="-29.0367"/>
					<TrackLine>
						<End x="108.1846" y="-27.7376"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.4">
					<Start x="110.445" y="-30.36"/>
					<TrackLine>
						<End x="110.445" y="-29.735"/>
					</TrackLine>
					<TrackLine>
						<End x="110.5382" y="-27.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="110.5383" y="-27.8694"/>
					</TrackLine>
					<TrackLine>
						<End x="110.5386" y="-27.8637"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="110.916" y="-27.8904"/>
							<Dot x="110.6568" y="-28.0415"/>
							<Dot x="110.9864" y="-28.607"/>
							<Dot x="111.1996" y="-27.9881"/>
						</Teardrop>
					</Teardrops>
					<Start x="111.095" y="-30.36"/>
					<TrackLine>
						<End x="111.095" y="-29.735"/>
					</TrackLine>
					<TrackArc>
						<Center x="110.655" y="-29.735"/>
						<End x="111.0929" y="-29.692"/>
					</TrackArc>
					<TrackLine>
						<End x="110.916" y="-27.8904"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="108.1846" y="-27.7376"/>
							<Dot x="107.8941" y="-27.8127"/>
							<Dot x="108.058" y="-28.4464"/>
							<Dot x="108.4311" y="-27.9087"/>
						</Teardrop>
					</Teardrops>
					<Start x="108.1846" y="-27.7376"/>
					<TrackLine>
						<End x="107.862" y="-29.5433"/>
					</TrackLine>
					<TrackArc>
						<Center x="108.935" y="-29.735"/>
						<End x="107.845" y="-29.735"/>
					</TrackArc>
					<TrackLine>
						<End x="107.845" y="-30.36"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.2">
					<Teardrops>
						<Teardrop>
							<Dot x="101.9876" y="-29.5234"/>
							<Dot x="101.9333" y="-29.4394"/>
							<Dot x="101.7501" y="-29.5579"/>
							<Dot x="101.9595" y="-29.6194"/>
						</Teardrop>
					</Teardrops>
					<Start x="101.465" y="-29.78"/>
					<TrackLine>
						<End x="101.49" y="-29.58"/>
					</TrackLine>
					<TrackLine>
						<End x="101.59" y="-29.58"/>
					</TrackLine>
					<TrackArc>
						<Center x="101.59" y="-29.48"/>
						<End x="101.6043" y="-29.579"/>
					</TrackArc>
					<TrackLine>
						<End x="101.9876" y="-29.5234"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.4">
					<Start x="108.495" y="-22.86"/>
					<TrackLine>
						<End x="108.495" y="-22.235"/>
					</TrackLine>
					<TrackLine>
						<End x="108.495" y="-20.6121"/>
					</TrackLine>
					<TrackLine>
						<End x="108.495" y="-20.4121"/>
					</TrackLine>
					<TrackLine>
						<End x="108.585" y="-20.0025"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="108.1846" y="-27.7376"/>
							<Dot x="108.4658" y="-27.6329"/>
							<Dot x="108.2375" y="-27.0195"/>
							<Dot x="107.9218" y="-27.5929"/>
						</Teardrop>
					</Teardrops>
					<Start x="108.495" y="-22.86"/>
					<TrackLine>
						<End x="108.495" y="-23.485"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="107.405" y="-23.485"/>
						<End x="108.4921" y="-23.5651"/>
					</TrackArcCW>
					<TrackLine>
						<End x="108.1846" y="-27.7376"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="1">
					<Start x="108.1846" y="-27.7376"/>
					<TrackLine>
						<End x="108.6949" y="-27.735"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="108.705" y="-29.735"/>
						<End x="108.705" y="-27.735"/>
					</TrackArcCW>
					<TrackLine>
						<End x="109.329" y="-27.735"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="109.329" y="-29.735"/>
						<End x="109.5631" y="-27.7487"/>
					</TrackArcCW>
					<TrackLine>
						<End x="110.5386" y="-27.8637"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="105.8454" y="-29.0367"/>
							<Dot x="105.5878" y="-29.1904"/>
							<Dot x="105.8938" y="-29.7031"/>
							<Dot x="106.1226" y="-29.1516"/>
						</Teardrop>
					</Teardrops>
					<Start x="105.895" y="-30.36"/>
					<TrackLine>
						<End x="105.895" y="-29.735"/>
					</TrackLine>
					<TrackArc>
						<Center x="105.455" y="-29.735"/>
						<End x="105.8938" y="-29.7031"/>
					</TrackArc>
					<TrackLine>
						<End x="105.8454" y="-29.0367"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="105.8454" y="-29.0367"/>
							<Dot x="105.6957" y="-28.7768"/>
							<Dot x="105.1285" y="-29.1033"/>
							<Dot x="105.7461" y="-29.3198"/>
						</Teardrop>
					</Teardrops>
					<Start x="105.8454" y="-29.0367"/>
					<TrackLine>
						<End x="103.6887" y="-29.2371"/>
					</TrackLine>
					<TrackArc>
						<Center x="103.735" y="-29.735"/>
						<End x="103.6516" y="-29.242"/>
					</TrackArc>
					<TrackLine>
						<End x="101.9876" y="-29.5234"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.4">
					<Start x="105.895" y="-30.36"/>
					<TrackLine>
						<End x="105.895" y="-30.985"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="104.805" y="-30.985"/>
						<End x="105.8947" y="-31.0116"/>
					</TrackArcCW>
					<TrackLine>
						<End x="105.8451" y="-33.0405"/>
					</TrackLine>
					<TrackLine>
						<End x="105.845" y="-33.0454"/>
					</TrackLine>
					<TrackLine>
						<End x="105.845" y="-33.2454"/>
					</TrackLine>
					<TrackLine>
						<End x="105.537" y="-33.655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="1">
					<Start x="110.5386" y="-27.8637"/>
					<TrackLine>
						<End x="110.916" y="-27.8904"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.4">
					<Start x="113.9825" y="-33.8475"/>
					<TrackLine>
						<End x="113.0825" y="-34.0475"/>
					</TrackLine>
					<TrackLine>
						<End x="112.8825" y="-34.0475"/>
					</TrackLine>
					<TrackLine>
						<End x="110.363" y="-34.0475"/>
					</TrackLine>
					<TrackLine>
						<End x="110.163" y="-34.0475"/>
					</TrackLine>
					<TrackLine>
						<End x="109.855" y="-34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="0.4">
					<Start x="108.585" y="-20.0025"/>
					<TrackLine>
						<End x="108.585" y="-19.5929"/>
					</TrackLine>
					<TrackLine>
						<End x="108.585" y="-19.3929"/>
					</TrackLine>
					<TrackLine>
						<End x="108.585" y="-16.4465"/>
					</TrackLine>
					<TrackLine>
						<End x="108.585" y="-16.2465"/>
					</TrackLine>
					<TrackLine>
						<End x="108.585" y="-15.6845"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GNDD"/>
				<Subwire width="1">
					<Start x="110.916" y="-27.8904"/>
					<TrackLine>
						<End x="111.5992" y="-27.7669"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="111.955" y="-29.735"/>
						<End x="111.955" y="-27.735"/>
					</TrackArcCW>
					<TrackLine>
						<End x="112.605" y="-27.735"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="112.605" y="-29.735"/>
						<End x="114.605" y="-29.735"/>
					</TrackArcCW>
					<TrackLine>
						<End x="114.605" y="-30.985"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="112.605" y="-30.985"/>
						<End x="114.6049" y="-31.0059"/>
					</TrackArcCW>
					<TrackLine>
						<End x="114.5825" y="-33.1423"/>
					</TrackLine>
					<TrackLine>
						<End x="114.5825" y="-33.1475"/>
					</TrackLine>
					<TrackLine>
						<End x="114.5825" y="-33.6475"/>
					</TrackLine>
					<TrackLine>
						<End x="113.9825" y="-33.8475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+5V_RS232"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="6.35" y="-20.955"/>
							<Dot x="6.225" y="-20.6823"/>
							<Dot x="5.63" y="-20.955"/>
							<Dot x="6.225" y="-21.2277"/>
						</Teardrop>
					</Teardrops>
					<Start x="6.35" y="-20.955"/>
					<TrackLine>
						<End x="5.5" y="-20.955"/>
					</TrackLine>
					<TrackLine>
						<End x="5.3" y="-20.955"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-20.32"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV_TC_G7"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="38.735"/>
							<Dot x="52.241" y="38.3866"/>
							<Dot x="52.9125" y="39.3282"/>
							<Dot x="51.756" y="39.335"/>
						</Teardrop>
					</Teardrops>
					<Start x="51.7525" y="38.735"/>
					<TrackLine>
						<End x="52.9125" y="39.3282"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="38.989"/>
						<End x="53.086" y="39.37"/>
					</TrackArcCW>
					<TrackLine>
						<End x="53.848" y="39.37"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV_TC_G7"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="38.735"/>
							<Dot x="51.756" y="38.135"/>
							<Dot x="52.9125" y="38.1418"/>
							<Dot x="52.241" y="39.0834"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="38.1"/>
					<TrackLine>
						<End x="53.086" y="38.1"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="38.481"/>
						<End x="52.9125" y="38.1418"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.7525" y="38.735"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV_TC_G7"/>
				<Subwire fixed="on" width="2">
					<Start x="51.7525" y="38.735"/>
					<TrackLine>
						<End x="41.275" y="36.195"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV_TC_G7"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="36.195"/>
					<TrackLine>
						<End x="5.6098" y="33.026"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="34.02"/>
						<End x="5.5" y="33.02"/>
					</TrackArcCW>
					<TrackLine>
						<End x="2" y="33.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV_TC_G7"/>
				<Subwire width="0.4">
					<Start x="59.69" y="39.37"/>
					<TrackLine>
						<End x="60.252" y="39.37"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="39.37"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="39.37"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="39.37"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="39.37"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MV_TC_G7"/>
				<Subwire width="0.4">
					<Start x="83.185" y="33.5915"/>
					<TrackLine>
						<End x="83.004" y="34.1535"/>
					</TrackLine>
					<TrackLine>
						<End x="83.004" y="34.3535"/>
					</TrackLine>
					<TrackArc>
						<Center x="82.804" y="34.3535"/>
						<End x="82.9334" y="34.506"/>
					</TrackArc>
					<TrackLine>
						<End x="81.8999" y="35.3832"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="34.3535"/>
						<End x="81.4026" y="35.6504"/>
					</TrackArc>
					<TrackLine>
						<End x="74.5162" y="37.6498"/>
					</TrackLine>
					<TrackArc>
						<Center x="74.2372" y="36.689"/>
						<End x="74.3769" y="37.6797"/>
					</TrackArc>
					<TrackLine>
						<End x="65.3059" y="38.9584"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="38.7604"/>
						<End x="65.278" y="38.9604"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="38.9604"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="39.37"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+I_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="241.935" y="-12.065"/>
					<TrackLine>
						<End x="240.03" y="-12.065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+I_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="240" y="-12.065"/>
					<TrackLine>
						<End x="238.125" y="-12.065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+I_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="210.5" y="-12.065"/>
					<TrackLine>
						<End x="207" y="-12.065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+I_IN"/>
				<Subwire width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="247.5" y="-15"/>
							<Dot x="247.5555" y="-14.0015"/>
							<Dot x="245.3771" y="-13.8804"/>
							<Dot x="246.7073" y="-15.6097"/>
						</Teardrop>
						<Teardrop>
							<Dot x="241.935" y="-12.065"/>
							<Dot x="241.9073" y="-12.5642"/>
							<Dot x="242.9964" y="-12.6248"/>
							<Dot x="242.3313" y="-11.7602"/>
						</Teardrop>
					</Teardrops>
					<Start x="247.5" y="-15"/>
					<TrackLine>
						<End x="241.935" y="-12.065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+I_IN"/>
				<Subwire width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="207" y="-12.065"/>
							<Dot x="206.8363" y="-11.4878"/>
							<Dot x="205.5769" y="-11.8447"/>
							<Dot x="206.6695" y="-12.5658"/>
						</Teardrop>
					</Teardrops>
					<Start x="207" y="-12.065"/>
					<TrackLine>
						<End x="191.0024" y="-9.5889"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.88" y="-10.38"/>
						<End x="190.88" y="-9.5795"/>
					</TrackArc>
					<TrackLine>
						<End x="190.08" y="-9.5795"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.08" y="-10.38"/>
						<End x="189.851" y="-9.613"/>
					</TrackArc>
					<TrackLine>
						<End x="188.5656" y="-9.9967"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.68" y="-10.38"/>
						<End x="188.28" y="-10.38"/>
					</TrackArc>
					<TrackLine>
						<End x="188.28" y="-11.18"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV_MID"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-29.19"/>
					<TrackLine>
						<End x="174.7225" y="-29.19"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.7225" y="-28.79"/>
						<End x="174.7698" y="-29.1872"/>
					</TrackArc>
					<TrackLine>
						<End x="182.3145" y="-28.2893"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.48" y="-29.68"/>
						<End x="182.48" y="-28.2795"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.48" y="-28.2795"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="186.48" y="-29.68"/>
						<End x="186.862" y="-28.3326"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.8983" y="-28.9098"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.68" y="-29.68"/>
						<End x="188.909" y="-28.913"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.1944" y="-29.2967"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.08" y="-29.68"/>
						<End x="190.48" y="-29.68"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.48" y="-30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV_MID"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-29.19"/>
					<TrackLine>
						<End x="173.1225" y="-29.19"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="173.1225" y="-28.79"/>
						<End x="172.9596" y="-29.1553"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.2233" y="-28.8271"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV_MID"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-24.79"/>
					<TrackLine>
						<End x="168.1225" y="-24.79"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.1225" y="-25.19"/>
						<End x="168.4099" y="-24.9118"/>
					</TrackArcCW>
					<TrackLine>
						<End x="169.2415" y="-25.7711"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV_MID"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-24.79"/>
					<TrackLine>
						<End x="166.5225" y="-24.79"/>
					</TrackLine>
					<TrackArc>
						<Center x="166.5225" y="-25.19"/>
						<End x="166.4701" y="-24.7935"/>
					</TrackArc>
					<TrackLine>
						<End x="165.127" y="-24.971"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="165.0746" y="-24.5745"/>
						<End x="165.0746" y="-24.9745"/>
					</TrackArcCW>
					<TrackLine>
						<End x="164.6746" y="-24.9745"/>
					</TrackLine>
					<TrackLine>
						<End x="164.465" y="-25.0825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+MV_MID"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-29.19"/>
					<TrackLine>
						<End x="168.1225" y="-29.19"/>
					</TrackLine>
					<TrackArc>
						<Center x="168.1225" y="-28.79"/>
						<End x="168.4029" y="-29.0753"/>
					</TrackArc>
					<TrackLine>
						<End x="170.4702" y="-27.0434"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.2233" y="-28.8271"/>
						<End x="170.5497" y="-26.9686"/>
					</TrackArcCW>
					<TrackLine>
						<End x="172.8548" y="-24.8928"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="173.1225" y="-25.19"/>
						<End x="173.1225" y="-24.79"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.9225" y="-24.79"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+MV_MID"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-24.79"/>
					<TrackLine>
						<End x="174.7225" y="-24.79"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="174.7225" y="-25.19"/>
						<End x="174.7725" y="-24.7931"/>
					</TrackArcCW>
					<TrackLine>
						<End x="176.1879" y="-24.9714"/>
					</TrackLine>
					<TrackArc>
						<Center x="176.2379" y="-24.5745"/>
						<End x="176.2379" y="-24.9745"/>
					</TrackArc>
					<TrackLine>
						<End x="176.6379" y="-24.9745"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8475" y="-25.0825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+MV_MID"/>
				<Subwire width="0.8">
					<Start x="176.8475" y="-25.0825"/>
					<TrackLine>
						<End x="177.0571" y="-25.1905"/>
					</TrackLine>
					<TrackLine>
						<End x="177.4571" y="-25.1905"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.4571" y="-25.5905"/>
						<End x="177.5292" y="-25.197"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.2277" y="-26.0576"/>
					</TrackLine>
					<TrackArc>
						<Center x="182.48" y="-24.68"/>
						<End x="182.48" y="-26.0805"/>
					</TrackArc>
					<TrackLine>
						<End x="186.48" y="-26.0805"/>
					</TrackLine>
					<TrackArc>
						<Center x="186.48" y="-24.68"/>
						<End x="186.862" y="-26.0274"/>
					</TrackArc>
					<TrackLine>
						<End x="188.8983" y="-25.4502"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.68" y="-24.68"/>
						<End x="188.909" y="-25.447"/>
					</TrackArc>
					<TrackLine>
						<End x="190.1944" y="-25.0633"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.08" y="-24.68"/>
						<End x="190.48" y="-24.68"/>
					</TrackArc>
					<TrackLine>
						<End x="190.48" y="-23.88"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V_MID"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-37.49"/>
					<TrackLine>
						<End x="166.5225" y="-37.49"/>
					</TrackLine>
					<TrackArc>
						<Center x="166.5225" y="-37.89"/>
						<End x="166.4701" y="-37.4935"/>
					</TrackArc>
					<TrackLine>
						<End x="165.127" y="-37.671"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="165.0746" y="-37.2745"/>
						<End x="165.0746" y="-37.6745"/>
					</TrackArcCW>
					<TrackLine>
						<End x="164.6746" y="-37.6745"/>
					</TrackLine>
					<TrackLine>
						<End x="164.465" y="-37.7825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V_MID"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-37.49"/>
					<TrackLine>
						<End x="168.1225" y="-37.49"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.1225" y="-37.89"/>
						<End x="168.4088" y="-37.6107"/>
					</TrackArcCW>
					<TrackLine>
						<End x="169.2942" y="-38.5181"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V_MID"/>
				<Subwire width="0.8">
					<Start x="172.2233" y="-41.5285"/>
					<TrackLine>
						<End x="172.9602" y="-41.8556"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.1225" y="-41.49"/>
						<End x="173.1225" y="-41.89"/>
					</TrackArc>
					<TrackLine>
						<End x="173.9225" y="-41.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-V_MID"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-41.89"/>
					<TrackLine>
						<End x="174.7225" y="-41.89"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.7225" y="-41.49"/>
						<End x="174.7698" y="-41.8872"/>
					</TrackArc>
					<TrackLine>
						<End x="182.3145" y="-40.9893"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.48" y="-42.38"/>
						<End x="182.48" y="-40.9795"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.48" y="-40.9795"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="186.48" y="-42.38"/>
						<End x="186.862" y="-41.0326"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.8983" y="-41.6098"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.68" y="-42.38"/>
						<End x="188.909" y="-41.613"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.1944" y="-41.9967"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.08" y="-42.38"/>
						<End x="190.48" y="-42.38"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.48" y="-43.18"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00044"/>
				<Subwire width="0.4">
					<Start x="113.5775" y="20.56"/>
					<TrackLine>
						<End x="113.8775" y="20.5987"/>
					</TrackLine>
					<TrackLine>
						<End x="114.0775" y="20.5987"/>
					</TrackLine>
					<TrackLine>
						<End x="115.2525" y="20.5987"/>
					</TrackLine>
					<TrackLine>
						<End x="115.4525" y="20.5987"/>
					</TrackLine>
					<TrackLine>
						<End x="115.7605" y="20.6375"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="-27.94"/>
							<Dot x="87.9923" y="-28.065"/>
							<Dot x="88.265" y="-28.66"/>
							<Dot x="88.5377" y="-28.065"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="-27.94"/>
					<TrackLine>
						<End x="88.265" y="-28.7655"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="-28.9655"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="-29.5275"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="45.085"/>
							<Dot x="87.9923" y="44.96"/>
							<Dot x="88.265" y="44.365"/>
							<Dot x="88.5377" y="44.96"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="43.4975"/>
					<TrackLine>
						<End x="88.265" y="44.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="44.2595"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="45.085"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Start x="120.3325" y="14.4145"/>
					<TrackLine>
						<End x="119.9229" y="14.7225"/>
					</TrackLine>
					<TrackLine>
						<End x="119.9229" y="14.9225"/>
					</TrackLine>
					<TrackArc>
						<Center x="119.7229" y="14.9225"/>
						<End x="119.9007" y="15.014"/>
					</TrackArc>
					<TrackLine>
						<End x="119.2401" y="16.2978"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="15.875"/>
							<Dot x="87.9923" y="15.75"/>
							<Dot x="88.265" y="15.155"/>
							<Dot x="88.5377" y="15.75"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="14.2875"/>
					<TrackLine>
						<End x="88.265" y="14.8495"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="15.0495"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="30.48"/>
							<Dot x="87.9923" y="30.355"/>
							<Dot x="88.265" y="29.76"/>
							<Dot x="88.5377" y="30.355"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="28.8925"/>
					<TrackLine>
						<End x="88.265" y="29.4545"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="29.6545"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="1.27"/>
							<Dot x="87.9923" y="1.145"/>
							<Dot x="88.265" y="0.55"/>
							<Dot x="88.5377" y="1.145"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="-0.3175"/>
					<TrackLine>
						<End x="88.265" y="0.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="0.4445"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="117.475" y="16.383"/>
							<Dot x="117.697" y="15.8797"/>
							<Dot x="118.7036" y="16.3237"/>
							<Dot x="117.7444" y="16.8625"/>
						</Teardrop>
					</Teardrops>
					<Start x="117.475" y="16.383"/>
					<TrackLine>
						<End x="119.2401" y="16.2978"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="118.4275" y="1.5875"/>
							<Dot x="118.974" y="1.6496"/>
							<Dot x="118.8497" y="2.7428"/>
							<Dot x="118.0498" y="1.9874"/>
						</Teardrop>
					</Teardrops>
					<Start x="118.4275" y="1.5875"/>
					<TrackLine>
						<End x="119.9107" y="5.6464"/>
					</TrackLine>
					<TrackArc>
						<Center x="119.7229" y="5.715"/>
						<End x="119.9229" y="5.715"/>
					</TrackArc>
					<TrackLine>
						<End x="119.9229" y="5.915"/>
					</TrackLine>
					<TrackLine>
						<End x="120.3325" y="6.223"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="-13.335"/>
							<Dot x="87.9923" y="-13.46"/>
							<Dot x="88.265" y="-14.055"/>
							<Dot x="88.5377" y="-13.46"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="-14.9225"/>
					<TrackLine>
						<End x="88.265" y="-14.3605"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="-14.1605"/>
					</TrackLine>
					<TrackLine>
						<End x="88.265" y="-13.335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Start x="120.3325" y="6.223"/>
					<TrackLine>
						<End x="120.7421" y="6.531"/>
					</TrackLine>
					<TrackLine>
						<End x="120.9421" y="6.531"/>
					</TrackLine>
					<TrackArc>
						<Center x="120.9421" y="6.731"/>
						<End x="121.1214" y="6.6424"/>
					</TrackArc>
					<TrackLine>
						<End x="121.5249" y="7.4591"/>
					</TrackLine>
					<TrackArc>
						<Center x="120.9421" y="7.747"/>
						<End x="121.5921" y="7.747"/>
					</TrackArc>
					<TrackLine>
						<End x="121.5921" y="12.8905"/>
					</TrackLine>
					<TrackArc>
						<Center x="120.9421" y="12.8905"/>
						<End x="121.5249" y="13.1784"/>
					</TrackArc>
					<TrackLine>
						<End x="121.1214" y="13.9951"/>
					</TrackLine>
					<TrackArc>
						<Center x="120.9421" y="13.9065"/>
						<End x="120.9421" y="14.1065"/>
					</TrackArc>
					<TrackLine>
						<End x="120.7421" y="14.1065"/>
					</TrackLine>
					<TrackLine>
						<End x="120.3325" y="14.4145"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Start x="119.2401" y="16.2978"/>
					<TrackLine>
						<End x="120.0784" y="17.5393"/>
					</TrackLine>
					<TrackArc>
						<Center x="119.1253" y="18.1828"/>
						<End x="120.1828" y="18.6348"/>
					</TrackArc>
					<TrackLine>
						<End x="118.542" y="22.4737"/>
					</TrackLine>
					<TrackArc>
						<Center x="117.4845" y="22.0217"/>
						<End x="118.2241" y="22.9023"/>
					</TrackArc>
					<TrackLine>
						<End x="114.4723" y="26.0531"/>
					</TrackLine>
					<TrackArc>
						<Center x="114.0543" y="25.5553"/>
						<End x="114.1607" y="26.1965"/>
					</TrackArc>
					<TrackLine>
						<End x="111.4219" y="26.6508"/>
					</TrackLine>
					<TrackArc>
						<Center x="111.3155" y="26.0096"/>
						<End x="111.3155" y="26.6596"/>
					</TrackArc>
					<TrackLine>
						<End x="110.4995" y="26.6596"/>
					</TrackLine>
					<TrackArc>
						<Center x="110.4995" y="26.0096"/>
						<End x="110.038" y="26.4673"/>
					</TrackArc>
					<TrackLine>
						<End x="109.9388" y="26.3673"/>
					</TrackLine>
					<TrackArc>
						<Center x="110.2995" y="26.0096"/>
						<End x="109.7915" y="26.0096"/>
					</TrackArc>
					<TrackLine>
						<End x="109.7915" y="24.7904"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="109.2835" y="24.7904"/>
						<End x="109.791" y="24.7673"/>
					</TrackArcCW>
					<TrackLine>
						<End x="109.728" y="23.3827"/>
					</TrackLine>
					<TrackArc>
						<Center x="110.2275" y="23.36"/>
						<End x="109.7275" y="23.36"/>
					</TrackArc>
					<TrackLine>
						<End x="109.7275" y="23.16"/>
					</TrackLine>
					<TrackLine>
						<End x="109.6775" y="22.86"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+V_MID"/>
				<Subwire width="0.8">
					<Start x="176.8475" y="-37.7825"/>
					<TrackLine>
						<End x="177.0571" y="-37.8905"/>
					</TrackLine>
					<TrackLine>
						<End x="177.4571" y="-37.8905"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.4571" y="-38.2905"/>
						<End x="177.5292" y="-37.897"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.2277" y="-38.7576"/>
					</TrackLine>
					<TrackArc>
						<Center x="182.48" y="-37.38"/>
						<End x="182.48" y="-38.7805"/>
					</TrackArc>
					<TrackLine>
						<End x="186.48" y="-38.7805"/>
					</TrackLine>
					<TrackArc>
						<Center x="186.48" y="-37.38"/>
						<End x="186.862" y="-38.7274"/>
					</TrackArc>
					<TrackLine>
						<End x="188.8983" y="-38.1502"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.68" y="-37.38"/>
						<End x="188.909" y="-38.147"/>
					</TrackArc>
					<TrackLine>
						<End x="190.1944" y="-37.7633"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.08" y="-37.38"/>
						<End x="190.48" y="-37.38"/>
					</TrackArc>
					<TrackLine>
						<End x="190.48" y="-36.58"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+V_MID"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-37.49"/>
					<TrackLine>
						<End x="174.7225" y="-37.49"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="174.7225" y="-37.89"/>
						<End x="174.7725" y="-37.4931"/>
					</TrackArcCW>
					<TrackLine>
						<End x="176.1879" y="-37.6714"/>
					</TrackLine>
					<TrackArc>
						<Center x="176.2379" y="-37.2745"/>
						<End x="176.2379" y="-37.6745"/>
					</TrackArc>
					<TrackLine>
						<End x="176.6379" y="-37.6745"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8475" y="-37.7825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+V_MID"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-37.49"/>
					<TrackLine>
						<End x="173.1225" y="-37.49"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.1225" y="-37.89"/>
						<End x="172.8547" y="-37.5928"/>
					</TrackArc>
					<TrackLine>
						<End x="170.5491" y="-39.6706"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.2233" y="-41.5285"/>
						<End x="170.4708" y="-39.7442"/>
					</TrackArc>
					<TrackLine>
						<End x="168.4028" y="-41.7754"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.1225" y="-41.49"/>
						<End x="168.1225" y="-41.89"/>
					</TrackArcCW>
					<TrackLine>
						<End x="167.3225" y="-41.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I_MID"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-16.49"/>
					<TrackLine>
						<End x="174.7225" y="-16.49"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.7225" y="-16.09"/>
						<End x="174.7698" y="-16.4872"/>
					</TrackArc>
					<TrackLine>
						<End x="182.3145" y="-15.5893"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="182.48" y="-16.98"/>
						<End x="182.48" y="-15.5795"/>
					</TrackArcCW>
					<TrackLine>
						<End x="186.48" y="-15.5795"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="186.48" y="-16.98"/>
						<End x="186.862" y="-15.6326"/>
					</TrackArcCW>
					<TrackLine>
						<End x="188.8983" y="-16.2098"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="188.68" y="-16.98"/>
						<End x="188.909" y="-16.213"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.1944" y="-16.5967"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="190.08" y="-16.98"/>
						<End x="190.48" y="-16.98"/>
					</TrackArcCW>
					<TrackLine>
						<End x="190.48" y="-17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I_MID"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-12.09"/>
					<TrackLine>
						<End x="168.1225" y="-12.09"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.1225" y="-12.49"/>
						<End x="168.4111" y="-12.213"/>
					</TrackArcCW>
					<TrackLine>
						<End x="169.4157" y="-13.2599"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I_MID"/>
				<Subwire width="0.8">
					<Start x="172.2234" y="-16.1308"/>
					<TrackLine>
						<End x="172.9612" y="-16.456"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.1225" y="-16.09"/>
						<End x="173.1225" y="-16.49"/>
					</TrackArc>
					<TrackLine>
						<End x="173.9225" y="-16.49"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I_MID"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-12.09"/>
					<TrackLine>
						<End x="166.5225" y="-12.09"/>
					</TrackLine>
					<TrackArc>
						<Center x="166.5225" y="-12.49"/>
						<End x="166.4701" y="-12.0935"/>
					</TrackArc>
					<TrackLine>
						<End x="165.127" y="-12.271"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="165.0746" y="-11.8745"/>
						<End x="165.0746" y="-12.2745"/>
					</TrackArcCW>
					<TrackLine>
						<End x="164.6746" y="-12.2745"/>
					</TrackLine>
					<TrackLine>
						<End x="164.465" y="-12.3825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+I_MID"/>
				<Subwire width="0.8">
					<Start x="176.8475" y="-12.3825"/>
					<TrackLine>
						<End x="176.6379" y="-12.2745"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2379" y="-12.2745"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="176.2379" y="-11.8745"/>
						<End x="176.1879" y="-12.2714"/>
					</TrackArcCW>
					<TrackLine>
						<End x="174.7725" y="-12.0931"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.7225" y="-12.49"/>
						<End x="174.7225" y="-12.09"/>
					</TrackArc>
					<TrackLine>
						<End x="173.9225" y="-12.09"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+I_MID"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-12.09"/>
					<TrackLine>
						<End x="173.1225" y="-12.09"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.1225" y="-12.49"/>
						<End x="172.8546" y="-12.193"/>
					</TrackArc>
					<TrackLine>
						<End x="170.5481" y="-14.2738"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.2234" y="-16.1308"/>
						<End x="170.4719" y="-14.3455"/>
					</TrackArc>
					<TrackLine>
						<End x="168.4026" y="-16.3755"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.1225" y="-16.09"/>
						<End x="168.1225" y="-16.49"/>
					</TrackArcCW>
					<TrackLine>
						<End x="167.3225" y="-16.49"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+I_MID"/>
				<Subwire width="0.8">
					<Start x="176.8475" y="-12.3825"/>
					<TrackLine>
						<End x="177.0571" y="-12.4905"/>
					</TrackLine>
					<TrackLine>
						<End x="177.4571" y="-12.4905"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="177.4571" y="-12.8905"/>
						<End x="177.5292" y="-12.497"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.2277" y="-13.3576"/>
					</TrackLine>
					<TrackArc>
						<Center x="182.48" y="-11.98"/>
						<End x="182.48" y="-13.3805"/>
					</TrackArc>
					<TrackLine>
						<End x="186.48" y="-13.3805"/>
					</TrackLine>
					<TrackArc>
						<Center x="186.48" y="-11.98"/>
						<End x="186.862" y="-13.3274"/>
					</TrackArc>
					<TrackLine>
						<End x="188.8983" y="-12.7502"/>
					</TrackLine>
					<TrackArc>
						<Center x="188.68" y="-11.98"/>
						<End x="188.909" y="-12.747"/>
					</TrackArc>
					<TrackLine>
						<End x="190.1944" y="-12.3633"/>
					</TrackLine>
					<TrackArc>
						<Center x="190.08" y="-11.98"/>
						<End x="190.48" y="-11.98"/>
					</TrackArc>
					<TrackLine>
						<End x="190.48" y="-11.18"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SWCLK"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="117.475" y="14.351"/>
							<Dot x="117.2291" y="14.843"/>
							<Dot x="116.245" y="14.351"/>
							<Dot x="117.2291" y="13.859"/>
						</Teardrop>
					</Teardrops>
					<Start x="117.475" y="14.351"/>
					<TrackLine>
						<End x="112.3275" y="14.351"/>
					</TrackLine>
					<TrackLine>
						<End x="112.1275" y="14.351"/>
					</TrackLine>
					<TrackLine>
						<End x="112.0775" y="14.26"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SWDIO"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="117.475" y="12.319"/>
							<Dot x="117.3017" y="12.841"/>
							<Dot x="116.2576" y="12.4943"/>
							<Dot x="117.1615" y="11.8672"/>
						</Teardrop>
					</Teardrops>
					<Start x="117.475" y="12.319"/>
					<TrackLine>
						<End x="111.9349" y="13.1166"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="112.0275" y="13.76"/>
						<End x="111.54" y="13.3301"/>
					</TrackArcCW>
					<TrackLine>
						<End x="111.4525" y="13.4293"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="111.8275" y="13.76"/>
						<End x="111.3275" y="13.76"/>
					</TrackArcCW>
					<TrackLine>
						<End x="111.3275" y="13.96"/>
					</TrackLine>
					<TrackLine>
						<End x="111.2775" y="14.26"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R4W_G24"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-4.445"/>
							<Dot x="51.5331" y="-5.0369"/>
							<Dot x="52.342" y="-4.9029"/>
							<Dot x="51.9695" y="-4.1725"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-5.08"/>
					<TrackLine>
						<End x="53.086" y="-5.08"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="-3.429"/>
						<End x="52.342" y="-4.9029"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="-4.445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R4W_G24"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-4.445"/>
							<Dot x="51.9695" y="-4.7175"/>
							<Dot x="52.342" y="-3.9871"/>
							<Dot x="51.5331" y="-3.8531"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-3.81"/>
					<TrackLine>
						<End x="53.086" y="-3.81"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-5.461"/>
						<End x="52.342" y="-3.9871"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="-4.445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R4W_G24"/>
				<Subwire width="0.4">
					<Start x="86.995" y="-10.2235"/>
					<TrackLine>
						<End x="86.814" y="-9.6615"/>
					</TrackLine>
					<TrackLine>
						<End x="86.814" y="-9.4615"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.614" y="-9.4615"/>
						<End x="86.7912" y="-9.3687"/>
					</TrackArc>
					<TrackLine>
						<End x="86.6818" y="-9.1599"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.106" y="-9.4615"/>
						<End x="86.2853" y="-8.8367"/>
					</TrackArc>
					<TrackLine>
						<End x="81.5916" y="-7.49"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="-9.4615"/>
						<End x="81.4688" y="-7.4589"/>
					</TrackArc>
					<TrackLine>
						<End x="74.6189" y="-5.9441"/>
					</TrackLine>
					<TrackArc>
						<Center x="74.2516" y="-7.605"/>
						<End x="74.5608" y="-5.9323"/>
					</TrackArc>
					<TrackLine>
						<End x="65.3144" y="-4.2229"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="-4.4196"/>
						<End x="65.278" y="-4.2196"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="-4.2196"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="-3.81"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R4W_G24"/>
				<Subwire width="0.4">
					<Start x="59.69" y="-3.81"/>
					<TrackLine>
						<End x="60.252" y="-3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="-3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="-3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="-3.81"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R8_G22"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-4.445"/>
							<Dot x="32.4831" y="-5.0369"/>
							<Dot x="33.292" y="-4.9029"/>
							<Dot x="32.9195" y="-4.1725"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-5.08"/>
					<TrackLine>
						<End x="34.036" y="-5.08"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="-3.429"/>
						<End x="33.292" y="-4.9029"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="-4.445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R8_G22"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-4.445"/>
							<Dot x="32.9195" y="-4.7175"/>
							<Dot x="33.292" y="-3.9871"/>
							<Dot x="32.4831" y="-3.8531"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-3.81"/>
					<TrackLine>
						<End x="34.036" y="-3.81"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-5.461"/>
						<End x="33.292" y="-3.9871"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="-4.445"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R8_G22"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="74.2516" y="-7.605"/>
							<Dot x="74.3306" y="-7.8944"/>
							<Dot x="74.962" y="-7.7219"/>
							<Dot x="74.4192" y="-7.3562"/>
						</Teardrop>
					</Teardrops>
					<Start x="74.2516" y="-7.605"/>
					<TrackLine>
						<End x="77.4353" y="-8.1289"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.216" y="-9.4615"/>
						<End x="77.4643" y="-8.134"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.1455" y="-8.8226"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-9.4615"/>
						<End x="81.6018" y="-9.1599"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.7112" y="-9.3687"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="-9.4615"/>
						<End x="81.734" y="-9.4615"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.734" y="-9.6615"/>
					</TrackLine>
					<TrackLine>
						<End x="81.915" y="-10.2235"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R8_G22"/>
				<Subwire width="0.4">
					<Start x="43.688" y="-3.81"/>
					<TrackLine>
						<End x="43.38" y="-3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="-3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="-3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="-3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-3.81"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R8_G22"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-3.81"/>
							<Dot x="46.865" y="-3.5373"/>
							<Dot x="46.27" y="-3.81"/>
							<Dot x="46.865" y="-4.0827"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="-3.81"/>
					<TrackLine>
						<End x="46.028" y="-3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="-3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="-3.81"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N0R_G25"/>
				<Subwire fixed="on" width="2">
					<Start x="41.275" y="20.955"/>
					<TrackLine>
						<End x="51.7525" y="23.495"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N0R_G25"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="23.495"/>
							<Dot x="52.241" y="23.1466"/>
							<Dot x="52.9125" y="24.0882"/>
							<Dot x="51.756" y="24.095"/>
						</Teardrop>
					</Teardrops>
					<Start x="51.7525" y="23.495"/>
					<TrackLine>
						<End x="52.9125" y="24.0882"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="23.749"/>
						<End x="53.086" y="24.13"/>
					</TrackArcCW>
					<TrackLine>
						<End x="53.848" y="24.13"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N0R_G25"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="23.495"/>
							<Dot x="51.756" y="22.895"/>
							<Dot x="52.9125" y="22.9018"/>
							<Dot x="52.241" y="23.8434"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="22.86"/>
					<TrackLine>
						<End x="53.086" y="22.86"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="23.241"/>
						<End x="52.9125" y="22.9018"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.7525" y="23.495"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N0R_G25"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="20.955"/>
					<TrackLine>
						<End x="5.5661" y="22.8578"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="21.86"/>
						<End x="5.5" y="22.86"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="22.86"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N0R_G25"/>
				<Subwire width="0.4">
					<Start x="59.69" y="24.13"/>
					<TrackLine>
						<End x="60.252" y="24.13"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="24.13"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="24.13"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="24.13"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="24.13"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N0R_G25"/>
				<Subwire width="0.4">
					<Start x="86.995" y="14.2875"/>
					<TrackLine>
						<End x="86.814" y="13.7255"/>
					</TrackLine>
					<TrackLine>
						<End x="86.814" y="13.5255"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.614" y="13.5255"/>
						<End x="86.7912" y="13.4327"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.6818" y="13.2239"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.106" y="13.5255"/>
						<End x="86.2853" y="12.9007"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.5916" y="11.554"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="13.5255"/>
						<End x="81.026" y="11.4745"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="11.4745"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="13.5255"/>
						<End x="75.3517" y="11.7959"/>
					</TrackArcCW>
					<TrackLine>
						<End x="70.6186" y="14.8125"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="71.5328" y="16.2469"/>
						<End x="70.4701" y="14.9187"/>
					</TrackArcCW>
					<TrackLine>
						<End x="69.443" y="15.7405"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="70.5057" y="17.0687"/>
						<End x="69.0123" y="16.2544"/>
					</TrackArcCW>
					<TrackLine>
						<End x="65.1024" y="23.4247"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="65.278" y="23.5204"/>
						<End x="65.078" y="23.5204"/>
					</TrackArcCW>
					<TrackLine>
						<End x="65.078" y="23.7204"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="24.13"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3W_G23"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="-6.985"/>
							<Dot x="51.756" y="-7.585"/>
							<Dot x="52.9125" y="-7.5782"/>
							<Dot x="52.241" y="-6.6366"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-7.62"/>
					<TrackLine>
						<End x="53.086" y="-7.62"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="-7.239"/>
						<End x="52.9125" y="-7.5782"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.7525" y="-6.985"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3W_G23"/>
				<Subwire fixed="on" width="2">
					<Start x="41.275" y="-9.525"/>
					<TrackLine>
						<End x="51.7525" y="-6.985"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3W_G23"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="-6.985"/>
							<Dot x="52.241" y="-7.3334"/>
							<Dot x="52.9125" y="-6.3918"/>
							<Dot x="51.756" y="-6.385"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-6.35"/>
					<TrackLine>
						<End x="53.086" y="-6.35"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-6.731"/>
						<End x="52.9125" y="-6.3918"/>
					</TrackArc>
					<TrackLine>
						<End x="51.7525" y="-6.985"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3W_G23"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="-9.525"/>
					<TrackLine>
						<End x="32.3896" y="-9.2641"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.7025" y="-6.985"/>
						<End x="31.9579" y="-9.1617"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.8958" y="-8.7983"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-4.445"/>
						<End x="30.4928" y="-8.6389"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.9113" y="2.4515"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="1.54"/>
						<End x="5.5" y="2.54"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="2.54"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3W_G23"/>
				<Subwire width="0.4">
					<Start x="59.69" y="-6.35"/>
					<TrackLine>
						<End x="60.252" y="-6.35"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-6.35"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="-6.35"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="-6.35"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="-6.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3W_G23"/>
				<Subwire width="0.4">
					<Start x="83.185" y="-10.2235"/>
					<TrackLine>
						<End x="83.004" y="-9.6615"/>
					</TrackLine>
					<TrackLine>
						<End x="83.004" y="-9.4615"/>
					</TrackLine>
					<TrackArc>
						<Center x="82.804" y="-9.4615"/>
						<End x="82.9334" y="-9.309"/>
					</TrackArc>
					<TrackLine>
						<End x="81.8999" y="-8.4318"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="-9.4615"/>
						<End x="81.3176" y="-8.1429"/>
					</TrackArc>
					<TrackLine>
						<End x="74.4676" y="-6.6281"/>
					</TrackLine>
					<TrackArc>
						<Center x="74.2516" y="-7.605"/>
						<End x="74.2516" y="-6.6045"/>
					</TrackArc>
					<TrackLine>
						<End x="65.278" y="-6.6045"/>
					</TrackLine>
					<TrackLine>
						<End x="65.078" y="-6.6045"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="-6.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_V_NEW_G8"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="41.275"/>
							<Dot x="51.9695" y="41.0025"/>
							<Dot x="52.342" y="41.7329"/>
							<Dot x="51.5331" y="41.8669"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="41.91"/>
					<TrackLine>
						<End x="53.086" y="41.91"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="40.259"/>
						<End x="52.342" y="41.7329"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="41.275"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_V_NEW_G8"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="41.275"/>
							<Dot x="51.5331" y="40.6831"/>
							<Dot x="52.342" y="40.8171"/>
							<Dot x="51.9695" y="41.5475"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="40.64"/>
					<TrackLine>
						<End x="53.086" y="40.64"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="42.291"/>
						<End x="52.342" y="40.8171"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="41.275"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_V_NEW_G8"/>
				<Subwire width="0.4">
					<Start x="86.995" y="33.5915"/>
					<TrackLine>
						<End x="86.814" y="34.1535"/>
					</TrackLine>
					<TrackLine>
						<End x="86.814" y="34.3535"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.614" y="34.3535"/>
						<End x="86.7762" y="34.4705"/>
					</TrackArc>
					<TrackLine>
						<End x="86.6023" y="34.7115"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.106" y="34.3535"/>
						<End x="86.2409" y="34.9505"/>
					</TrackArc>
					<TrackLine>
						<End x="86.213" y="34.9567"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.995" y="38.4175"/>
						<End x="85.9333" y="35.0321"/>
					</TrackArcCW>
					<TrackLine>
						<End x="65.3378" y="41.4912"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="41.3004"/>
						<End x="65.278" y="41.5004"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="41.5004"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="41.91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_V_NEW_G8"/>
				<Subwire width="0.4">
					<Start x="59.69" y="41.91"/>
					<TrackLine>
						<End x="60.252" y="41.91"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="41.91"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="41.91"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="41.91"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="41.91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="USBDP"/>
				<Subwire fixed="on" width="0.2">
					<Start x="100.465" y="-29.78"/>
					<TrackLine>
						<End x="100.965" y="-30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="USBDP"/>
				<Subwire width="0.3">
					<Start x="103.945" y="-30.36"/>
					<TrackLine>
						<End x="103.885" y="-30.48"/>
					</TrackLine>
					<TrackLine>
						<End x="103.735" y="-30.48"/>
					</TrackLine>
					<TrackLine>
						<End x="101.34" y="-30.48"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="101.34" y="-30.08"/>
						<End x="101.3046" y="-30.4784"/>
					</TrackArcCW>
					<TrackLine>
						<End x="101.1271" y="-30.4626"/>
					</TrackLine>
					<TrackArc>
						<Center x="101.09" y="-30.88"/>
						<End x="100.9727" y="-30.4778"/>
					</TrackArc>
					<TrackLine>
						<End x="100.965" y="-30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="USBDP"/>
				<Subwire width="0.2">
					<Teardrops>
						<Teardrop>
							<Dot x="98.425" y="-30.7975"/>
							<Dot x="98.6247" y="-30.948"/>
							<Dot x="98.9463" y="-30.5211"/>
							<Dot x="98.4125" y="-30.5478"/>
						</Teardrop>
					</Teardrops>
					<Start x="100.465" y="-29.78"/>
					<TrackLine>
						<End x="100.44" y="-29.98"/>
					</TrackLine>
					<TrackLine>
						<End x="100.34" y="-29.98"/>
					</TrackLine>
					<TrackArc>
						<Center x="100.34" y="-31.48"/>
						<End x="99.6374" y="-30.1547"/>
					</TrackArc>
					<TrackLine>
						<End x="98.425" y="-30.7975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+MV"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-26.99"/>
					<TrackLine>
						<End x="174.7225" y="-26.99"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.7225" y="-26.59"/>
						<End x="174.7977" y="-26.9829"/>
					</TrackArc>
					<TrackLine>
						<End x="176.1627" y="-26.7216"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="176.2379" y="-27.1145"/>
						<End x="176.2379" y="-26.7145"/>
					</TrackArcCW>
					<TrackLine>
						<End x="176.6379" y="-26.7145"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8475" y="-26.6065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+MV"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-26.99"/>
					<TrackLine>
						<End x="173.1225" y="-26.99"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.1225" y="-27.39"/>
						<End x="172.9479" y="-27.0301"/>
					</TrackArc>
					<TrackLine>
						<End x="171.6557" y="-27.657"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.2233" y="-28.8271"/>
						<End x="171.3117" y="-27.8996"/>
					</TrackArc>
					<TrackLine>
						<End x="169.2444" y="-29.9315"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.1225" y="-28.79"/>
						<End x="169.1172" y="-30.0439"/>
					</TrackArcCW>
					<TrackLine>
						<End x="165.6521" y="-32.7928"/>
					</TrackLine>
					<TrackArc>
						<Center x="166.5225" y="-33.89"/>
						<End x="165.522" y="-32.91"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MA_G10"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="33.655"/>
							<Dot x="32.4831" y="33.0631"/>
							<Dot x="33.292" y="33.1971"/>
							<Dot x="32.9195" y="33.9275"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="33.02"/>
					<TrackLine>
						<End x="34.036" y="33.02"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="34.671"/>
						<End x="33.292" y="33.1971"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="33.655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MA_G10"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="33.655"/>
							<Dot x="32.9195" y="33.3825"/>
							<Dot x="33.292" y="34.1129"/>
							<Dot x="32.4831" y="34.2469"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="34.29"/>
					<TrackLine>
						<End x="34.036" y="34.29"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="32.639"/>
						<End x="33.292" y="34.1129"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="33.655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MA_G10"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="34.29"/>
							<Dot x="46.865" y="34.5627"/>
							<Dot x="46.27" y="34.29"/>
							<Dot x="46.865" y="34.0173"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="34.29"/>
					<TrackLine>
						<End x="46.028" y="34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MA_G10"/>
				<Subwire width="0.4">
					<Start x="43.688" y="34.29"/>
					<TrackLine>
						<End x="43.38" y="34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_MA_G10"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="72.0212" y="28.3081"/>
							<Dot x="72.0452" y="28.0091"/>
							<Dot x="72.6977" y="28.0616"/>
							<Dot x="72.232" y="28.5215"/>
						</Teardrop>
					</Teardrops>
					<Start x="72.0212" y="28.3081"/>
					<TrackLine>
						<End x="75.9917" y="26.8616"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.454" y="28.1305"/>
						<End x="76.454" y="26.78"/>
					</TrackArc>
					<TrackLine>
						<End x="81.026" y="26.78"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="28.1305"/>
						<End x="81.8999" y="27.1008"/>
					</TrackArc>
					<TrackLine>
						<End x="82.9334" y="27.978"/>
					</TrackLine>
					<TrackArc>
						<Center x="82.804" y="28.1305"/>
						<End x="83.004" y="28.1305"/>
					</TrackArc>
					<TrackLine>
						<End x="83.004" y="28.3305"/>
					</TrackLine>
					<TrackLine>
						<End x="83.185" y="28.8925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE3_G13"/>
				<Subwire fixed="on" width="2">
					<Start x="32.7025" y="23.495"/>
					<TrackLine>
						<End x="5.5699" y="25.3976"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="24.4"/>
						<End x="5.5" y="25.4"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="25.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE3_G13"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="23.495"/>
							<Dot x="32.706" y="22.895"/>
							<Dot x="33.8625" y="22.9018"/>
							<Dot x="33.191" y="23.8434"/>
						</Teardrop>
					</Teardrops>
					<Start x="32.7025" y="23.495"/>
					<TrackLine>
						<End x="33.8625" y="22.9018"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="23.241"/>
						<End x="34.036" y="22.86"/>
					</TrackArc>
					<TrackLine>
						<End x="34.798" y="22.86"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE3_G13"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="23.495"/>
							<Dot x="33.191" y="23.1466"/>
							<Dot x="33.8625" y="24.0882"/>
							<Dot x="32.706" y="24.095"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="24.13"/>
					<TrackLine>
						<End x="34.036" y="24.13"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="23.749"/>
						<End x="33.8625" y="24.0882"/>
					</TrackArc>
					<TrackLine>
						<End x="32.7025" y="23.495"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE3_G13"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="74.6393" y="19.989"/>
							<Dot x="74.7673" y="19.7177"/>
							<Dot x="75.3593" y="19.9969"/>
							<Dot x="74.7613" y="20.2631"/>
						</Teardrop>
					</Teardrops>
					<Start x="74.6393" y="19.989"/>
					<TrackLine>
						<End x="75.4828" y="19.9982"/>
					</TrackLine>
					<TrackArc>
						<Center x="75.4719" y="20.9984"/>
						<End x="76.0819" y="20.2056"/>
					</TrackArc>
					<TrackLine>
						<End x="76.0947" y="20.2155"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="19.7485"/>
						<End x="76.2749" y="20.3098"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.4564" y="20.3677"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.654" y="19.7485"/>
						<End x="76.654" y="20.3985"/>
					</TrackArcCW>
					<TrackLine>
						<End x="77.216" y="20.3985"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.216" y="19.7485"/>
						<End x="77.7918" y="20.0501"/>
					</TrackArcCW>
					<TrackLine>
						<End x="77.9012" y="19.8413"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.724" y="19.7485"/>
						<End x="77.924" y="19.7485"/>
					</TrackArcCW>
					<TrackLine>
						<End x="77.924" y="19.5485"/>
					</TrackLine>
					<TrackLine>
						<End x="78.105" y="18.9865"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE3_G13"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="25.0825"/>
							<Dot x="46.7234" y="25.2201"/>
							<Dot x="46.4232" y="24.6385"/>
							<Dot x="47.0598" y="24.7907"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="24.13"/>
					<TrackLine>
						<End x="46.028" y="24.5396"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="24.5396"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="24.7396"/>
						<End x="46.3513" y="24.5822"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="25.0825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_RESERVE3_G13"/>
				<Subwire width="0.4">
					<Start x="43.688" y="24.13"/>
					<TrackLine>
						<End x="43.38" y="24.13"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="24.13"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="24.13"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="24.13"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="24.13"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R2_G16"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="10.795"/>
							<Dot x="51.5331" y="10.2031"/>
							<Dot x="52.342" y="10.3371"/>
							<Dot x="51.9695" y="11.0675"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="10.16"/>
					<TrackLine>
						<End x="53.086" y="10.16"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="11.811"/>
						<End x="52.342" y="10.3371"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="10.795"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R2_G16"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="10.795"/>
							<Dot x="51.9695" y="10.5225"/>
							<Dot x="52.342" y="11.2529"/>
							<Dot x="51.5331" y="11.3869"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="11.43"/>
					<TrackLine>
						<End x="53.086" y="11.43"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="9.779"/>
						<End x="52.342" y="11.2529"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="10.795"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R2_G16"/>
				<Subwire width="0.4">
					<Start x="59.69" y="11.43"/>
					<TrackLine>
						<End x="60.252" y="11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="11.43"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R2_G16"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="66.386" y="13.3168"/>
							<Dot x="66.1101" y="13.4345"/>
							<Dot x="65.8532" y="12.8326"/>
							<Dot x="66.4769" y="13.0309"/>
						</Teardrop>
					</Teardrops>
					<Start x="64.77" y="11.43"/>
					<TrackLine>
						<End x="65.078" y="11.8396"/>
					</TrackLine>
					<TrackLine>
						<End x="65.078" y="12.0396"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="65.278" y="12.0396"/>
						<End x="65.1435" y="12.1876"/>
					</TrackArcCW>
					<TrackLine>
						<End x="66.386" y="13.3168"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R2_G16"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="70.5057" y="17.0687"/>
							<Dot x="70.8007" y="17.014"/>
							<Dot x="70.9199" y="17.6576"/>
							<Dot x="70.3545" y="17.3278"/>
						</Teardrop>
					</Teardrops>
					<Start x="70.5057" y="17.0687"/>
					<TrackLine>
						<End x="73.248" y="20.9676"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="74.6393" y="19.989"/>
						<End x="73.3271" y="21.0714"/>
					</TrackArcCW>
					<TrackLine>
						<End x="74.1597" y="22.0808"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="75.4719" y="20.9984"/>
						<End x="75.659" y="22.6891"/>
					</TrackArcCW>
					<TrackLine>
						<End x="77.5186" y="22.4833"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.216" y="19.7485"/>
						<End x="77.6258" y="22.4693"/>
					</TrackArcCW>
					<TrackLine>
						<End x="80.4737" y="22.0403"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="23.1775"/>
						<End x="80.9729" y="22.0752"/>
					</TrackArc>
					<TrackLine>
						<End x="86.8018" y="23.809"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.1275" y="22.714"/>
						<End x="88.2688" y="22.6636"/>
					</TrackArcCW>
					<TrackLine>
						<End x="88.2053" y="21.2259"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.098" y="21.2748"/>
						<End x="87.6055" y="20.2894"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="87.884" y="19.7485"/>
						<End x="87.3949" y="20.1103"/>
					</TrackArc>
					<TrackLine>
						<End x="87.2152" y="19.8674"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.376" y="19.7485"/>
						<End x="87.176" y="19.7485"/>
					</TrackArc>
					<TrackLine>
						<End x="87.176" y="19.5485"/>
					</TrackLine>
					<TrackLine>
						<End x="86.995" y="18.9865"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3_G17"/>
				<Subwire fixed="on" width="2">
					<Start x="32.7025" y="0.635"/>
					<TrackLine>
						<End x="31.6404" y="0.9983"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="3.175"/>
						<End x="31.6196" y="1.0056"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.8327" y="10.103"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="9.16"/>
						<End x="5.5" y="10.16"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3_G17"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="0.635"/>
							<Dot x="33.191" y="0.2866"/>
							<Dot x="33.8625" y="1.2282"/>
							<Dot x="32.706" y="1.235"/>
						</Teardrop>
					</Teardrops>
					<Start x="32.7025" y="0.635"/>
					<TrackLine>
						<End x="33.8625" y="1.2282"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="0.889"/>
						<End x="34.036" y="1.27"/>
					</TrackArcCW>
					<TrackLine>
						<End x="34.798" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3_G17"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="0.635"/>
							<Dot x="32.706" y="0.035"/>
							<Dot x="33.8625" y="0.0418"/>
							<Dot x="33.191" y="0.9834"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="0"/>
					<TrackLine>
						<End x="34.036" y="0"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="0.381"/>
						<End x="33.8625" y="0.0418"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.7025" y="0.635"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3_G17"/>
				<Subwire width="0.4">
					<Start x="43.688" y="1.27"/>
					<TrackLine>
						<End x="43.38" y="1.27"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="1.27"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="1.27"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="1.27"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3_G17"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="73.3722" y="-2.6064"/>
							<Dot x="73.4466" y="-2.8971"/>
							<Dot x="74.0807" y="-2.7346"/>
							<Dot x="73.5438" y="-2.3603"/>
						</Teardrop>
					</Teardrops>
					<Start x="73.3722" y="-2.6064"/>
					<TrackLine>
						<End x="76.089" y="-3.0978"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.454" y="-1.0795"/>
						<End x="76.454" y="-3.1305"/>
					</TrackArc>
					<TrackLine>
						<End x="81.026" y="-3.1305"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.026" y="-1.0795"/>
						<End x="81.5916" y="-3.051"/>
					</TrackArc>
					<TrackLine>
						<End x="86.2853" y="-1.7043"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.106" y="-1.0795"/>
						<End x="86.6818" y="-1.3811"/>
					</TrackArc>
					<TrackLine>
						<End x="86.7912" y="-1.1723"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.614" y="-1.0795"/>
						<End x="86.814" y="-1.0795"/>
					</TrackArc>
					<TrackLine>
						<End x="86.814" y="-0.8795"/>
					</TrackLine>
					<TrackLine>
						<End x="86.995" y="-0.3175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R3_G17"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="2.2225"/>
							<Dot x="46.7234" y="2.3601"/>
							<Dot x="46.4232" y="1.7785"/>
							<Dot x="47.0598" y="1.9307"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="1.27"/>
					<TrackLine>
						<End x="46.028" y="1.6796"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="1.6796"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="1.8796"/>
						<End x="46.3513" y="1.7222"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="2.2225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R4_G18"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="3.175"/>
							<Dot x="32.4831" y="2.5831"/>
							<Dot x="33.292" y="2.7171"/>
							<Dot x="32.9195" y="3.4475"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="2.54"/>
					<TrackLine>
						<End x="34.036" y="2.54"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="4.191"/>
						<End x="33.292" y="2.7171"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="3.175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R4_G18"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="3.175"/>
							<Dot x="32.9195" y="2.9025"/>
							<Dot x="33.292" y="3.6329"/>
							<Dot x="32.4831" y="3.7669"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="3.81"/>
					<TrackLine>
						<End x="34.036" y="3.81"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="2.159"/>
						<End x="33.292" y="3.6329"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="3.175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R4_G18"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="3.81"/>
							<Dot x="46.865" y="4.0827"/>
							<Dot x="46.27" y="3.81"/>
							<Dot x="46.865" y="3.5373"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="3.81"/>
					<TrackLine>
						<End x="46.028" y="3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="3.81"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R4_G18"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="71.6882" y="-1.179"/>
							<Dot x="71.7469" y="-1.4732"/>
							<Dot x="72.3888" y="-1.3451"/>
							<Dot x="71.8727" y="-0.9424"/>
						</Teardrop>
					</Teardrops>
					<Start x="83.185" y="-0.3175"/>
					<TrackLine>
						<End x="83.004" y="-0.8795"/>
					</TrackLine>
					<TrackLine>
						<End x="83.004" y="-1.0795"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="82.804" y="-1.0795"/>
						<End x="82.9334" y="-1.232"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.8999" y="-2.1092"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-1.0795"/>
						<End x="81.026" y="-2.43"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="-2.43"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="-1.0795"/>
						<End x="76.0644" y="-2.3726"/>
					</TrackArcCW>
					<TrackLine>
						<End x="73.6608" y="-1.6484"/>
					</TrackLine>
					<TrackArc>
						<Center x="73.3722" y="-2.6064"/>
						<End x="73.603" y="-1.6329"/>
					</TrackArc>
					<TrackLine>
						<End x="71.6882" y="-1.179"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R4_G18"/>
				<Subwire width="0.4">
					<Start x="43.688" y="3.81"/>
					<TrackLine>
						<End x="43.38" y="3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="3.81"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R5_G19"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="0.635"/>
							<Dot x="51.756" y="0.035"/>
							<Dot x="52.9125" y="0.0418"/>
							<Dot x="52.241" y="0.9834"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="0"/>
					<TrackLine>
						<End x="53.086" y="0"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="0.381"/>
						<End x="52.9125" y="0.0418"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.7525" y="0.635"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R5_G19"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.7525" y="0.635"/>
							<Dot x="52.241" y="0.2866"/>
							<Dot x="52.9125" y="1.2282"/>
							<Dot x="51.756" y="1.235"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="1.27"/>
					<TrackLine>
						<End x="53.086" y="1.27"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="0.889"/>
						<End x="52.9125" y="1.2282"/>
					</TrackArc>
					<TrackLine>
						<End x="51.7525" y="0.635"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R5_G19"/>
				<Subwire fixed="on" width="2">
					<Start x="41.275" y="-1.905"/>
					<TrackLine>
						<End x="51.7525" y="0.635"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R5_G19"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="-1.905"/>
					<TrackLine>
						<End x="32.3896" y="-1.6441"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.7025" y="0.635"/>
						<End x="31.9579" y="-1.5417"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.8958" y="-1.1783"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="3.175"/>
						<End x="30.8698" y="-1.1693"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.8293" y="7.5642"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="6.62"/>
						<End x="5.5" y="7.62"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="7.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R5_G19"/>
				<Subwire width="0.4">
					<Start x="59.69" y="1.27"/>
					<TrackLine>
						<End x="60.252" y="1.27"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="1.27"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="1.27"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="1.27"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R5_G19"/>
				<Subwire width="0.4">
					<Start x="81.915" y="-0.3175"/>
					<TrackLine>
						<End x="81.734" y="-0.8795"/>
					</TrackLine>
					<TrackLine>
						<End x="81.734" y="-1.0795"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="-1.0795"/>
						<End x="81.7112" y="-1.1723"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.6018" y="-1.3811"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-1.0795"/>
						<End x="81.026" y="-1.7295"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.454" y="-1.7295"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.454" y="-1.0795"/>
						<End x="76.2417" y="-1.6939"/>
					</TrackArcCW>
					<TrackLine>
						<End x="72.015" y="-0.2334"/>
					</TrackLine>
					<TrackArc>
						<Center x="71.6882" y="-1.179"/>
						<End x="71.8467" y="-0.1911"/>
					</TrackArc>
					<TrackLine>
						<End x="65.3097" y="0.8579"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="0.6604"/>
						<End x="65.278" y="0.8604"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="0.8604"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R6_G20"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="3.175"/>
							<Dot x="51.9695" y="2.9025"/>
							<Dot x="52.342" y="3.6329"/>
							<Dot x="51.5331" y="3.7669"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="3.81"/>
					<TrackLine>
						<End x="53.086" y="3.81"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="2.159"/>
						<End x="52.342" y="3.6329"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="3.175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R6_G20"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="3.175"/>
							<Dot x="51.5331" y="2.5831"/>
							<Dot x="52.342" y="2.7171"/>
							<Dot x="51.9695" y="3.4475"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="2.54"/>
					<TrackLine>
						<End x="53.086" y="2.54"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="4.191"/>
						<End x="52.342" y="2.7171"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="3.175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R6_G20"/>
				<Subwire width="0.4">
					<Start x="78.105" y="-0.3175"/>
					<TrackLine>
						<End x="77.924" y="0.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="77.924" y="0.4445"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.724" y="0.4445"/>
						<End x="77.8909" y="0.5548"/>
					</TrackArc>
					<TrackLine>
						<End x="77.7364" y="0.7885"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="0.4445"/>
						<End x="77.3352" y="1.0568"/>
					</TrackArc>
					<TrackLine>
						<End x="65.3162" y="3.3967"/>
					</TrackLine>
					<TrackArc>
						<Center x="65.278" y="3.2004"/>
						<End x="65.278" y="3.4004"/>
					</TrackArc>
					<TrackLine>
						<End x="65.078" y="3.4004"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="3.81"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R6_G20"/>
				<Subwire width="0.4">
					<Start x="59.69" y="3.81"/>
					<TrackLine>
						<End x="60.252" y="3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="3.81"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="3.81"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+V"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-39.69"/>
					<TrackLine>
						<End x="173.1225" y="-39.69"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.1225" y="-40.09"/>
						<End x="172.9476" y="-39.7303"/>
					</TrackArc>
					<TrackLine>
						<End x="171.6546" y="-40.3589"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.2233" y="-41.5285"/>
						<End x="171.312" y="-40.6007"/>
					</TrackArc>
					<TrackLine>
						<End x="169.244" y="-42.6318"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.1225" y="-41.49"/>
						<End x="168.7246" y="-42.9729"/>
					</TrackArcCW>
					<TrackLine>
						<End x="166.1707" y="-44.0098"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+V"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-39.69"/>
					<TrackLine>
						<End x="174.7225" y="-39.69"/>
					</TrackLine>
					<TrackArc>
						<Center x="174.7225" y="-39.29"/>
						<End x="174.7977" y="-39.6829"/>
					</TrackArc>
					<TrackLine>
						<End x="176.1627" y="-39.4216"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="176.2379" y="-39.8145"/>
						<End x="176.2379" y="-39.4145"/>
					</TrackArcCW>
					<TrackLine>
						<End x="176.6379" y="-39.4145"/>
					</TrackLine>
					<TrackLine>
						<End x="176.8475" y="-39.3065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R7_G21"/>
				<Subwire fixed="on" width="2">
					<Start x="32.7025" y="-6.985"/>
					<TrackLine>
						<End x="31.6404" y="-6.6217"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-4.445"/>
						<End x="31.4378" y="-6.5415"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.9117" y="4.9913"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="4.08"/>
						<End x="5.5" y="5.08"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="5.08"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R7_G21"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="-6.985"/>
							<Dot x="32.706" y="-7.585"/>
							<Dot x="33.8625" y="-7.5782"/>
							<Dot x="33.191" y="-6.6366"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-7.62"/>
					<TrackLine>
						<End x="34.036" y="-7.62"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="-7.239"/>
						<End x="33.8625" y="-7.5782"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.7025" y="-6.985"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R7_G21"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.7025" y="-6.985"/>
							<Dot x="33.191" y="-7.3334"/>
							<Dot x="33.8625" y="-6.3918"/>
							<Dot x="32.706" y="-6.385"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-6.35"/>
					<TrackLine>
						<End x="34.036" y="-6.35"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-6.731"/>
						<End x="33.8625" y="-6.3918"/>
					</TrackArc>
					<TrackLine>
						<End x="32.7025" y="-6.985"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R7_G21"/>
				<Subwire width="0.4">
					<Start x="43.688" y="-6.35"/>
					<TrackLine>
						<End x="43.38" y="-6.35"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="-6.35"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="-6.35"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="-6.35"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-6.35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R7_G21"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="70.2161" y="-7.6397"/>
							<Dot x="70.2722" y="-7.9344"/>
							<Dot x="70.9151" y="-7.8122"/>
							<Dot x="70.4028" y="-7.4048"/>
						</Teardrop>
					</Teardrops>
					<Start x="78.105" y="-10.2235"/>
					<TrackLine>
						<End x="77.924" y="-9.6615"/>
					</TrackLine>
					<TrackLine>
						<End x="77.924" y="-9.4615"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.724" y="-9.4615"/>
						<End x="77.9012" y="-9.3687"/>
					</TrackArc>
					<TrackLine>
						<End x="77.7918" y="-9.1599"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="-9.4615"/>
						<End x="77.2602" y="-8.813"/>
					</TrackArc>
					<TrackLine>
						<End x="74.1835" y="-8.6032"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="74.2516" y="-7.605"/>
						<End x="74.0119" y="-8.5764"/>
					</TrackArcCW>
					<TrackLine>
						<End x="70.2161" y="-7.6397"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_R7_G21"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-5.3975"/>
							<Dot x="46.7234" y="-5.2599"/>
							<Dot x="46.4232" y="-5.8415"/>
							<Dot x="47.0598" y="-5.6893"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="-6.35"/>
					<TrackLine>
						<End x="46.028" y="-5.9404"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="-5.9404"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="-5.7404"/>
						<End x="46.3513" y="-5.8978"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="-5.3975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N5MA_G32"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="10.795"/>
							<Dot x="32.9195" y="10.5225"/>
							<Dot x="33.292" y="11.2529"/>
							<Dot x="32.4831" y="11.3869"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="11.43"/>
					<TrackLine>
						<End x="34.036" y="11.43"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="9.779"/>
						<End x="33.292" y="11.2529"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="10.795"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N5MA_G32"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="10.795"/>
							<Dot x="32.4831" y="10.2031"/>
							<Dot x="33.292" y="10.3371"/>
							<Dot x="32.9195" y="11.0675"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="10.16"/>
					<TrackLine>
						<End x="34.036" y="10.16"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="11.811"/>
						<End x="33.292" y="10.3371"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="10.795"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N5MA_G32"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="11.43"/>
							<Dot x="46.865" y="11.7027"/>
							<Dot x="46.27" y="11.43"/>
							<Dot x="46.865" y="11.1573"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="11.43"/>
					<TrackLine>
						<End x="46.028" y="11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="11.43"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N5MA_G32"/>
				<Subwire width="0.4">
					<Start x="43.688" y="11.43"/>
					<TrackLine>
						<End x="43.38" y="11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="11.43"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="11.43"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="REL_N5MA_G32"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="75.2252" y="9.6613"/>
							<Dot x="75.3055" y="9.3722"/>
							<Dot x="75.9361" y="9.5474"/>
							<Dot x="75.3917" y="9.9108"/>
						</Teardrop>
					</Teardrops>
					<Start x="75.2252" y="9.6613"/>
					<TrackLine>
						<End x="76.5061" y="9.4561"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="76.3478" y="8.4682"/>
						<End x="76.7751" y="9.3728"/>
					</TrackArcCW>
					<TrackLine>
						<End x="77.4967" y="9.032"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.9879" y="10.0718"/>
						<End x="77.5883" y="8.9935"/>
					</TrackArc>
					<TrackLine>
						<End x="86.3319" y="5.753"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.106" y="5.1435"/>
						<End x="86.6818" y="5.4451"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.7912" y="5.2363"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.614" y="5.1435"/>
						<End x="86.814" y="5.1435"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.814" y="4.9435"/>
					</TrackLine>
					<TrackLine>
						<End x="86.995" y="4.3815"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I"/>
				<Subwire fixed="on" width="0.8">
					<Start x="0" y="-25.4"/>
					<TrackLine>
						<End x="3.1" y="-26"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I"/>
				<Subwire fixed="on" width="0.8">
					<Start x="164.465" y="-13.9065"/>
					<TrackLine>
						<End x="164.2554" y="-14.0145"/>
					</TrackLine>
					<TrackLine>
						<End x="164.2554" y="-14.4145"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="163.8554" y="-14.4145"/>
						<End x="164.2415" y="-14.5191"/>
					</TrackArcCW>
					<TrackLine>
						<End x="156.3044" y="-43.8079"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="153.9875" y="-43.18"/>
						<End x="153.9875" y="-45.5805"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.1625" y="-45.5805"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="30.1625" y="-43.18"/>
						<End x="29.7002" y="-45.5356"/>
					</TrackArcCW>
					<TrackLine>
						<End x="16.8169" y="-43.0069"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="17.78" y="-38.1"/>
						<End x="13.0966" y="-39.8525"/>
					</TrackArcCW>
					<TrackLine>
						<End x="11.0137" y="-34.286"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="12.7" y="-33.655"/>
						<End x="10.9407" y="-34.038"/>
					</TrackArcCW>
					<TrackLine>
						<End x="10.4553" y="-31.8087"/>
					</TrackLine>
					<TrackArc>
						<Center x="6.35" y="-32.7025"/>
						<End x="9.3665" y="-29.7779"/>
					</TrackArc>
					<TrackLine>
						<End x="6.0747" y="-26.3828"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-26.94"/>
						<End x="6.037" y="-26.3463"/>
					</TrackArc>
					<TrackLine>
						<End x="5.7683" y="-26.1033"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-26.4"/>
						<End x="5.5" y="-26"/>
					</TrackArc>
					<TrackLine>
						<End x="5.1" y="-26"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-25.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-I"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-14.29"/>
					<TrackLine>
						<End x="166.5225" y="-14.29"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="166.5225" y="-13.89"/>
						<End x="166.4435" y="-14.2821"/>
					</TrackArcCW>
					<TrackLine>
						<End x="165.1536" y="-14.0224"/>
					</TrackLine>
					<TrackArc>
						<Center x="165.0746" y="-14.4145"/>
						<End x="165.0746" y="-14.0145"/>
					</TrackArc>
					<TrackLine>
						<End x="164.6746" y="-14.0145"/>
					</TrackLine>
					<TrackLine>
						<End x="164.465" y="-13.9065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+I"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-14.29"/>
					<TrackLine>
						<End x="173.1225" y="-14.29"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.1225" y="-14.69"/>
						<End x="172.9471" y="-14.3305"/>
					</TrackArc>
					<TrackLine>
						<End x="171.653" y="-14.9621"/>
					</TrackLine>
					<TrackArc>
						<Center x="172.2234" y="-16.1308"/>
						<End x="171.3127" y="-15.2024"/>
					</TrackArc>
					<TrackLine>
						<End x="169.2433" y="-17.2325"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="168.1225" y="-16.09"/>
						<End x="169.1172" y="-17.3439"/>
					</TrackArcCW>
					<TrackLine>
						<End x="165.6521" y="-20.0928"/>
					</TrackLine>
					<TrackArc>
						<Center x="166.5225" y="-21.19"/>
						<End x="165.522" y="-20.21"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="+I"/>
				<Subwire width="0.8">
					<Start x="176.8475" y="-13.9065"/>
					<TrackLine>
						<End x="176.6379" y="-14.0145"/>
					</TrackLine>
					<TrackLine>
						<End x="176.2379" y="-14.0145"/>
					</TrackLine>
					<TrackArc>
						<Center x="176.2379" y="-14.4145"/>
						<End x="176.1627" y="-14.0216"/>
					</TrackArc>
					<TrackLine>
						<End x="174.7977" y="-14.2829"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="174.7225" y="-13.89"/>
						<End x="174.7225" y="-14.29"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.9225" y="-14.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV"/>
				<Subwire fixed="on" width="0.8">
					<Start x="3.1" y="-28.54"/>
					<TrackLine>
						<End x="0" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV"/>
				<Subwire fixed="on" width="0.8">
					<Start x="164.465" y="-26.6065"/>
					<TrackLine>
						<End x="164.2554" y="-26.7145"/>
					</TrackLine>
					<TrackLine>
						<End x="164.2554" y="-27.1145"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="163.8554" y="-27.1145"/>
						<End x="164.2268" y="-27.2629"/>
					</TrackArcCW>
					<TrackLine>
						<End x="157.3313" y="-44.5164"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="153.9875" y="-43.18"/>
						<End x="153.9875" y="-46.781"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.1625" y="-46.781"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="30.1625" y="-43.18"/>
						<End x="29.4689" y="-46.7136"/>
					</TrackArcCW>
					<TrackLine>
						<End x="16.5857" y="-44.1849"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="17.78" y="-38.1"/>
						<End x="11.9723" y="-40.2732"/>
					</TrackArcCW>
					<TrackLine>
						<End x="9.8893" y="-34.7067"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="12.7" y="-33.655"/>
						<End x="9.7677" y="-34.2934"/>
					</TrackArcCW>
					<TrackLine>
						<End x="9.2823" y="-32.0641"/>
					</TrackLine>
					<TrackArc>
						<Center x="6.35" y="-32.7025"/>
						<End x="8.0657" y="-30.2403"/>
					</TrackArc>
					<TrackLine>
						<End x="5.7287" y="-28.6118"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-28.94"/>
						<End x="5.5" y="-28.54"/>
					</TrackArc>
					<TrackLine>
						<End x="5.1" y="-28.54"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="-MV"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-26.99"/>
					<TrackLine>
						<End x="166.5225" y="-26.99"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="166.5225" y="-26.59"/>
						<End x="166.4435" y="-26.9821"/>
					</TrackArcCW>
					<TrackLine>
						<End x="165.1536" y="-26.7224"/>
					</TrackLine>
					<TrackArc>
						<Center x="165.0746" y="-27.1145"/>
						<End x="165.0746" y="-26.7145"/>
					</TrackArc>
					<TrackLine>
						<End x="164.6746" y="-26.7145"/>
					</TrackLine>
					<TrackLine>
						<End x="164.465" y="-26.6065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00020"/>
				<Subwire width="0.4">
					<Start x="103.505" y="-33.655"/>
					<TrackLine>
						<End x="103.813" y="-33.2454"/>
					</TrackLine>
					<TrackLine>
						<End x="103.813" y="-33.0454"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="104.013" y="-33.0454"/>
						<End x="103.8609" y="-32.9155"/>
					</TrackArcCW>
					<TrackLine>
						<End x="104.9385" y="-31.6544"/>
					</TrackLine>
					<TrackArc>
						<Center x="104.155" y="-30.985"/>
						<End x="105.0912" y="-31.4157"/>
					</TrackArc>
					<TrackLine>
						<End x="105.2047" y="-31.1689"/>
					</TrackLine>
					<TrackArc>
						<Center x="104.805" y="-30.985"/>
						<End x="105.245" y="-30.985"/>
					</TrackArc>
					<TrackLine>
						<End x="105.245" y="-30.36"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="39.0525"/>
							<Dot x="81.8671" y="38.7563"/>
							<Dot x="82.5132" y="38.6517"/>
							<Dot x="82.1707" y="39.2095"/>
						</Teardrop>
					</Teardrops>
					<Start x="106.4775" y="22.86"/>
					<TrackLine>
						<End x="106.4275" y="23.16"/>
					</TrackLine>
					<TrackLine>
						<End x="106.2275" y="23.16"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="106.2275" y="23.36"/>
						<End x="106.0862" y="23.2185"/>
					</TrackArcCW>
					<TrackLine>
						<End x="93.9604" y="35.3261"/>
					</TrackLine>
					<TrackArc>
						<Center x="92.9005" y="34.2646"/>
						<End x="93.0782" y="35.754"/>
					</TrackArc>
					<TrackLine>
						<End x="86.7671" y="36.5071"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.995" y="38.4175"/>
						<End x="86.1903" y="36.6699"/>
					</TrackArcCW>
					<TrackLine>
						<End x="83.974" y="37.6904"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.455" y="38.735"/>
						<End x="83.8149" y="37.7796"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.915" y="39.0525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="-13.335"/>
							<Dot x="81.6754" y="-13.1545"/>
							<Dot x="81.3748" y="-13.5533"/>
							<Dot x="81.8682" y="-13.6313"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="-14.9225"/>
					<TrackLine>
						<End x="80.826" y="-14.3605"/>
					</TrackLine>
					<TrackLine>
						<End x="80.826" y="-14.1605"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-14.1605"/>
						<End x="80.8591" y="-14.0502"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.0136" y="-13.8165"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="-14.1605"/>
						<End x="81.3146" y="-13.5766"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.3302" y="-13.5707"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="-11.7475"/>
						<End x="81.3748" y="-13.5533"/>
					</TrackArc>
					<TrackLine>
						<End x="81.915" y="-13.335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="45.085"/>
							<Dot x="80.3723" y="44.96"/>
							<Dot x="80.645" y="44.365"/>
							<Dot x="80.9177" y="44.96"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="45.085"/>
					<TrackLine>
						<End x="80.645" y="44.2595"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="44.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="43.4975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="15.875"/>
							<Dot x="81.6754" y="16.0555"/>
							<Dot x="81.3748" y="15.6567"/>
							<Dot x="81.8682" y="15.5787"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="14.2875"/>
					<TrackLine>
						<End x="80.826" y="14.8495"/>
					</TrackLine>
					<TrackLine>
						<End x="80.826" y="15.0495"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="15.0495"/>
						<End x="80.8591" y="15.1598"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.0136" y="15.3935"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="15.0495"/>
						<End x="81.3146" y="15.6334"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.3302" y="15.6393"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="17.4625"/>
						<End x="81.3748" y="15.6567"/>
					</TrackArc>
					<TrackLine>
						<End x="81.915" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="30.48"/>
							<Dot x="81.6754" y="30.6605"/>
							<Dot x="81.3748" y="30.2617"/>
							<Dot x="81.8682" y="30.1837"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="28.8925"/>
					<TrackLine>
						<End x="80.826" y="29.4545"/>
					</TrackLine>
					<TrackLine>
						<End x="80.826" y="29.6545"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="29.6545"/>
						<End x="80.8591" y="29.7648"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.0136" y="29.9985"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="29.6545"/>
						<End x="81.3146" y="30.2384"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.3302" y="30.2443"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="32.0675"/>
						<End x="81.3748" y="30.2617"/>
					</TrackArc>
					<TrackLine>
						<End x="81.915" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="-27.94"/>
							<Dot x="81.6754" y="-27.7595"/>
							<Dot x="81.3748" y="-28.1583"/>
							<Dot x="81.8682" y="-28.2363"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="-29.5275"/>
					<TrackLine>
						<End x="80.826" y="-28.9655"/>
					</TrackLine>
					<TrackLine>
						<End x="80.826" y="-28.7655"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="-28.7655"/>
						<End x="80.8591" y="-28.6552"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.0136" y="-28.4215"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="-28.7655"/>
						<End x="81.3146" y="-28.1816"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.3302" y="-28.1757"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="-26.3525"/>
						<End x="81.3748" y="-28.1583"/>
					</TrackArc>
					<TrackLine>
						<End x="81.915" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="1.27"/>
							<Dot x="81.6754" y="1.4505"/>
							<Dot x="81.3748" y="1.0517"/>
							<Dot x="81.8682" y="0.9737"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="-0.3175"/>
					<TrackLine>
						<End x="80.826" y="0.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="80.826" y="0.4445"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.026" y="0.4445"/>
						<End x="80.8591" y="0.5548"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.0136" y="0.7885"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="0.4445"/>
						<End x="81.3146" y="1.0284"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.3302" y="1.0343"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="2.8575"/>
						<End x="81.3748" y="1.0517"/>
					</TrackArc>
					<TrackLine>
						<End x="81.915" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="15.875"/>
							<Dot x="79.1023" y="15.75"/>
							<Dot x="79.375" y="15.155"/>
							<Dot x="79.6477" y="15.75"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="14.2875"/>
					<TrackLine>
						<End x="79.375" y="14.8495"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="15.0495"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="1.27"/>
							<Dot x="79.1023" y="1.145"/>
							<Dot x="79.375" y="0.55"/>
							<Dot x="79.6477" y="1.145"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="-0.3175"/>
					<TrackLine>
						<End x="79.375" y="0.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="0.4445"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="39.37"/>
							<Dot x="79.3271" y="39.0738"/>
							<Dot x="79.9732" y="38.9692"/>
							<Dot x="79.6307" y="39.527"/>
						</Teardrop>
					</Teardrops>
					<Start x="104.9775" y="21.36"/>
					<TrackLine>
						<End x="104.6775" y="21.41"/>
					</TrackLine>
					<TrackLine>
						<End x="104.6775" y="21.61"/>
					</TrackLine>
					<TrackArc>
						<Center x="104.4775" y="21.61"/>
						<End x="104.6286" y="21.7411"/>
					</TrackArc>
					<TrackLine>
						<End x="93.3914" y="34.6906"/>
					</TrackLine>
					<TrackArc>
						<Center x="92.9005" y="34.2646"/>
						<End x="92.9814" y="34.9096"/>
					</TrackArc>
					<TrackLine>
						<End x="86.6546" y="35.7028"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.995" y="38.4175"/>
						<End x="85.8894" y="35.9148"/>
					</TrackArcCW>
					<TrackLine>
						<End x="83.6468" y="36.9056"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.455" y="38.735"/>
						<End x="83.562" y="36.9454"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.4015" y="38.0235"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.915" y="39.0525"/>
						<End x="81.2749" y="38.0971"/>
					</TrackArcCW>
					<TrackLine>
						<End x="79.375" y="39.37"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="45.085"/>
							<Dot x="79.1023" y="44.96"/>
							<Dot x="79.375" y="44.365"/>
							<Dot x="79.6477" y="44.96"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="45.085"/>
					<TrackLine>
						<End x="79.375" y="44.2595"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="44.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="43.4975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="30.48"/>
							<Dot x="79.1023" y="30.355"/>
							<Dot x="79.375" y="29.76"/>
							<Dot x="79.6477" y="30.355"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="28.8925"/>
					<TrackLine>
						<End x="79.375" y="29.4545"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="29.6545"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="-13.335"/>
							<Dot x="79.1023" y="-13.46"/>
							<Dot x="79.375" y="-14.055"/>
							<Dot x="79.6477" y="-13.46"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="-14.9225"/>
					<TrackLine>
						<End x="79.375" y="-14.3605"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="-14.1605"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="-13.335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="-27.94"/>
							<Dot x="79.1023" y="-28.065"/>
							<Dot x="79.375" y="-28.66"/>
							<Dot x="79.6477" y="-28.065"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="-29.5275"/>
					<TrackLine>
						<End x="79.375" y="-28.9655"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="-28.7655"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.6796" y="25.4491"/>
							<Dot x="88.5767" y="25.7309"/>
							<Dot x="87.9619" y="25.5065"/>
							<Dot x="88.5333" y="25.1873"/>
						</Teardrop>
						<Teardrop>
							<Dot x="78.105" y="23.8125"/>
							<Dot x="78.2841" y="23.5718"/>
							<Dot x="78.8092" y="23.9624"/>
							<Dot x="78.1705" y="24.1052"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.6796" y="25.4491"/>
					<TrackLine>
						<End x="87.3544" y="25.555"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.1275" y="22.714"/>
						<End x="86.5801" y="25.5109"/>
					</TrackArc>
					<TrackLine>
						<End x="80.4241" y="24.3061"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="23.1775"/>
						<End x="80.4055" y="24.3023"/>
					</TrackArc>
					<TrackLine>
						<End x="78.105" y="23.8125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="96.0021" y="23.2701"/>
							<Dot x="96.039" y="22.9724"/>
							<Dot x="96.6885" y="23.0527"/>
							<Dot x="96.2036" y="23.4924"/>
						</Teardrop>
					</Teardrops>
					<Start x="104.9775" y="20.56"/>
					<TrackLine>
						<End x="104.6775" y="20.61"/>
					</TrackLine>
					<TrackLine>
						<End x="104.4775" y="20.61"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="104.4775" y="21.11"/>
						<End x="104.3265" y="20.6333"/>
					</TrackArcCW>
					<TrackLine>
						<End x="96.0021" y="23.2701"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.105" y="17.4625"/>
							<Dot x="78.3287" y="17.2627"/>
							<Dot x="78.6755" y="17.651"/>
							<Dot x="78.1657" y="17.7563"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="18.9865"/>
					<TrackLine>
						<End x="79.194" y="18.4245"/>
					</TrackLine>
					<TrackLine>
						<End x="79.194" y="18.2245"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.994" y="18.2245"/>
						<End x="79.1531" y="18.1033"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.9663" y="17.8583"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.486" y="18.2245"/>
						<End x="78.6755" y="17.651"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.105" y="17.4625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.105" y="-26.3525"/>
							<Dot x="78.3287" y="-26.5523"/>
							<Dot x="78.6755" y="-26.164"/>
							<Dot x="78.1657" y="-26.0587"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="-24.8285"/>
					<TrackLine>
						<End x="79.194" y="-25.3905"/>
					</TrackLine>
					<TrackLine>
						<End x="79.194" y="-25.5905"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.994" y="-25.5905"/>
						<End x="79.1531" y="-25.7117"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.9663" y="-25.9567"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.486" y="-25.5905"/>
						<End x="78.6755" y="-26.164"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.105" y="-26.3525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.105" y="32.0675"/>
							<Dot x="78.3287" y="31.8677"/>
							<Dot x="78.6755" y="32.256"/>
							<Dot x="78.1657" y="32.3613"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="33.5915"/>
					<TrackLine>
						<End x="79.194" y="33.0295"/>
					</TrackLine>
					<TrackLine>
						<End x="79.194" y="32.8295"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.994" y="32.8295"/>
						<End x="79.1531" y="32.7083"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.9663" y="32.4633"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.486" y="32.8295"/>
						<End x="78.6755" y="32.256"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.105" y="32.0675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.469" y="-35.9109"/>
							<Dot x="78.2377" y="-36.102"/>
							<Dot x="78.6547" y="-36.6065"/>
							<Dot x="78.7647" y="-35.9614"/>
						</Teardrop>
					</Teardrops>
					<Start x="78.469" y="-35.9109"/>
					<TrackLine>
						<End x="78.8547" y="-37.3556"/>
					</TrackLine>
					<TrackLine>
						<End x="78.8566" y="-37.3628"/>
					</TrackLine>
					<TrackLine>
						<End x="79.1874" y="-38.6206"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.994" y="-38.6715"/>
						<End x="79.194" y="-38.6715"/>
					</TrackArcCW>
					<TrackLine>
						<End x="79.194" y="-38.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="79.375" y="-39.4335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.105" y="2.8575"/>
							<Dot x="78.3287" y="2.6577"/>
							<Dot x="78.6755" y="3.046"/>
							<Dot x="78.1657" y="3.1513"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="4.3815"/>
					<TrackLine>
						<End x="79.194" y="3.8195"/>
					</TrackLine>
					<TrackLine>
						<End x="79.194" y="3.6195"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.994" y="3.6195"/>
						<End x="79.1531" y="3.4983"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.9663" y="3.2533"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.486" y="3.6195"/>
						<End x="78.6755" y="3.046"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.105" y="2.8575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.105" y="-11.7475"/>
							<Dot x="78.3287" y="-11.9473"/>
							<Dot x="78.6755" y="-11.559"/>
							<Dot x="78.1657" y="-11.4537"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="-10.2235"/>
					<TrackLine>
						<End x="79.194" y="-10.7855"/>
					</TrackLine>
					<TrackLine>
						<End x="79.194" y="-10.9855"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.994" y="-10.9855"/>
						<End x="79.1531" y="-11.1067"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.9663" y="-11.3517"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="78.486" y="-10.9855"/>
						<End x="78.6755" y="-11.559"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.105" y="-11.7475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="17.4625"/>
							<Dot x="80.9177" y="17.5875"/>
							<Dot x="80.645" y="18.1825"/>
							<Dot x="80.3723" y="17.5875"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="18.9865"/>
					<TrackLine>
						<End x="80.645" y="18.4245"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="18.2245"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="17.4625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="-11.7475"/>
							<Dot x="80.9177" y="-11.6225"/>
							<Dot x="80.645" y="-11.0275"/>
							<Dot x="80.3723" y="-11.6225"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="-10.2235"/>
					<TrackLine>
						<End x="80.645" y="-10.7855"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="-10.9855"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="-11.7475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="32.0675"/>
							<Dot x="80.9177" y="32.1925"/>
							<Dot x="80.645" y="32.7875"/>
							<Dot x="80.3723" y="32.1925"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="32.0675"/>
					<TrackLine>
						<End x="80.645" y="32.8295"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="33.0295"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="33.5915"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.9993" y="24.0243"/>
							<Dot x="89.0039" y="24.3242"/>
							<Dot x="88.3495" y="24.3343"/>
							<Dot x="88.7691" y="23.832"/>
						</Teardrop>
						<Teardrop>
							<Dot x="80.645" y="23.1775"/>
							<Dot x="80.8315" y="22.9425"/>
							<Dot x="81.3442" y="23.3493"/>
							<Dot x="80.7013" y="23.4721"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.9993" y="24.0243"/>
					<TrackLine>
						<End x="88.1852" y="24.4127"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="88.6796" y="25.4491"/>
						<End x="88.1143" y="24.4496"/>
					</TrackArcCW>
					<TrackLine>
						<End x="88.1104" y="24.4518"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.1275" y="22.714"/>
						<End x="86.6512" y="24.6529"/>
					</TrackArc>
					<TrackLine>
						<End x="80.645" y="23.1775"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="93.8135" y="22.6855"/>
							<Dot x="93.8608" y="22.3893"/>
							<Dot x="94.5071" y="22.4925"/>
							<Dot x="94.007" y="22.9147"/>
						</Teardrop>
					</Teardrops>
					<Start x="104.9775" y="19.76"/>
					<TrackLine>
						<End x="104.6775" y="19.81"/>
					</TrackLine>
					<TrackLine>
						<End x="104.4775" y="19.81"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="104.4775" y="21.31"/>
						<End x="104.081" y="19.8634"/>
					</TrackArcCW>
					<TrackLine>
						<End x="95.6981" y="22.161"/>
					</TrackLine>
					<TrackLine>
						<End x="95.6938" y="22.1622"/>
					</TrackLine>
					<TrackLine>
						<End x="93.8135" y="22.6855"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="2.8575"/>
							<Dot x="80.9177" y="2.9825"/>
							<Dot x="80.645" y="3.5775"/>
							<Dot x="80.3723" y="2.9825"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="4.3815"/>
					<TrackLine>
						<End x="80.645" y="3.8195"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="3.6195"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="2.8575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="-26.3525"/>
							<Dot x="80.9177" y="-26.2275"/>
							<Dot x="80.645" y="-25.6325"/>
							<Dot x="80.3723" y="-26.2275"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="-24.8285"/>
					<TrackLine>
						<End x="80.645" y="-25.3905"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="-25.5905"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="-26.3525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.9094" y="-36.0779"/>
							<Dot x="79.6692" y="-36.2576"/>
							<Dot x="80.0612" y="-36.7817"/>
							<Dot x="80.2024" y="-36.1426"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.9094" y="-36.0779"/>
					<TrackLine>
						<End x="80.4595" y="-38.6293"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="80.264" y="-38.6715"/>
						<End x="80.464" y="-38.6715"/>
					</TrackArcCW>
					<TrackLine>
						<End x="80.464" y="-38.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="-39.4335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00026"/>
				<Subwire width="0.4">
					<Start x="106.915" y="-34.29"/>
					<TrackLine>
						<End x="106.8357" y="-34.5574"/>
					</TrackLine>
					<TrackArc>
						<Center x="107.315" y="-34.6996"/>
						<End x="106.815" y="-34.6996"/>
					</TrackArc>
					<TrackLine>
						<End x="106.815" y="-36.2204"/>
					</TrackLine>
					<TrackLine>
						<End x="106.815" y="-36.4204"/>
					</TrackLine>
					<TrackLine>
						<End x="106.9975" y="-36.83"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00026"/>
				<Subwire width="0.4">
					<Start x="106.915" y="-34.29"/>
					<TrackLine>
						<End x="107.315" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="107.515" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="107.823" y="-34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00026"/>
				<Subwire width="0.4">
					<Start x="106.545" y="-30.36"/>
					<TrackLine>
						<End x="106.545" y="-30.985"/>
					</TrackLine>
					<TrackArc>
						<Center x="108.285" y="-30.985"/>
						<End x="106.5528" y="-31.1499"/>
					</TrackArc>
					<TrackLine>
						<End x="106.8172" y="-33.9278"/>
					</TrackLine>
					<TrackArc>
						<Center x="107.315" y="-33.8804"/>
						<End x="106.8357" y="-34.0226"/>
					</TrackArc>
					<TrackLine>
						<End x="106.915" y="-34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="89.0105" y="31.7237"/>
							<Dot x="88.8565" y="31.9812"/>
							<Dot x="88.2948" y="31.6452"/>
							<Dot x="88.9159" y="31.439"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.835" y="33.5915"/>
					<TrackLine>
						<End x="77.016" y="33.0295"/>
					</TrackLine>
					<TrackLine>
						<End x="77.016" y="32.8295"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="32.8295"/>
						<End x="77.0168" y="32.8114"/>
					</TrackArc>
					<TrackLine>
						<End x="77.0927" y="31.9756"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.105" y="32.0675"/>
						<End x="78.74" y="31.2737"/>
					</TrackArc>
					<TrackLine>
						<End x="78.74" y="31.2738"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="79.375" y="30.48"/>
						<End x="80.01" y="31.2738"/>
					</TrackArcCW>
					<TrackLine>
						<End x="80.01" y="31.2737"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="32.0675"/>
						<End x="81.28" y="31.2737"/>
					</TrackArc>
					<TrackLine>
						<End x="81.28" y="31.2738"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.915" y="30.48"/>
						<End x="82.55" y="31.2738"/>
					</TrackArcCW>
					<TrackLine>
						<End x="82.55" y="31.2737"/>
					</TrackLine>
					<TrackArc>
						<Center x="83.185" y="32.0675"/>
						<End x="83.82" y="31.2737"/>
					</TrackArc>
					<TrackLine>
						<End x="83.82" y="31.2738"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.455" y="30.48"/>
						<End x="85.09" y="31.2738"/>
					</TrackArcCW>
					<TrackLine>
						<End x="85.09" y="31.2737"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="32.0675"/>
						<End x="86.36" y="31.2737"/>
					</TrackArc>
					<TrackLine>
						<End x="86.36" y="31.2738"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.995" y="30.48"/>
						<End x="86.8842" y="31.4904"/>
					</TrackArcCW>
					<TrackLine>
						<End x="89.0105" y="31.7237"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="112.1235" y="19.7028"/>
							<Dot x="111.9051" y="19.4971"/>
							<Dot x="112.354" y="19.0207"/>
							<Dot x="112.4219" y="19.6717"/>
						</Teardrop>
					</Teardrops>
					<Start x="112.1235" y="19.7028"/>
					<TrackLine>
						<End x="112.4617" y="18.7019"/>
					</TrackLine>
					<TrackArc>
						<Center x="113.0775" y="18.91"/>
						<End x="112.6476" y="18.4225"/>
					</TrackArc>
					<TrackLine>
						<End x="112.7468" y="18.335"/>
					</TrackLine>
					<TrackArc>
						<Center x="113.0775" y="18.71"/>
						<End x="113.0775" y="18.21"/>
					</TrackArc>
					<TrackLine>
						<End x="113.2775" y="18.21"/>
					</TrackLine>
					<TrackLine>
						<End x="113.5775" y="18.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="107.2433" y="16.4594"/>
							<Dot x="107.4017" y="16.2047"/>
							<Dot x="107.9575" y="16.5502"/>
							<Dot x="107.3329" y="16.7457"/>
						</Teardrop>
					</Teardrops>
					<Start x="107.2433" y="16.4594"/>
					<TrackLine>
						<End x="109.089" y="16.6941"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="109.2243" y="15.6301"/>
						<End x="109.47" y="16.6742"/>
					</TrackArcCW>
					<TrackLine>
						<End x="109.483" y="16.6711"/>
					</TrackLine>
					<TrackArc>
						<Center x="109.7287" y="17.7152"/>
						<End x="109.9547" y="16.6667"/>
					</TrackArc>
					<TrackLine>
						<End x="112.8036" y="17.2808"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="113.0775" y="16.01"/>
						<End x="113.0775" y="17.31"/>
					</TrackArcCW>
					<TrackLine>
						<End x="113.2775" y="17.31"/>
					</TrackLine>
					<TrackLine>
						<End x="113.5775" y="17.36"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="89.0105" y="17.1187"/>
							<Dot x="88.8565" y="17.3762"/>
							<Dot x="88.2948" y="17.0402"/>
							<Dot x="88.9159" y="16.834"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.835" y="18.9865"/>
					<TrackLine>
						<End x="77.016" y="18.4245"/>
					</TrackLine>
					<TrackLine>
						<End x="77.016" y="18.2245"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="18.2245"/>
						<End x="77.0168" y="18.2064"/>
					</TrackArc>
					<TrackLine>
						<End x="77.0927" y="17.3706"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.105" y="17.4625"/>
						<End x="78.74" y="16.6687"/>
					</TrackArc>
					<TrackLine>
						<End x="78.74" y="16.6688"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="79.375" y="15.875"/>
						<End x="80.01" y="16.6688"/>
					</TrackArcCW>
					<TrackLine>
						<End x="80.01" y="16.6687"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="17.4625"/>
						<End x="81.28" y="16.6687"/>
					</TrackArc>
					<TrackLine>
						<End x="81.28" y="16.6688"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.915" y="15.875"/>
						<End x="82.55" y="16.6688"/>
					</TrackArcCW>
					<TrackLine>
						<End x="82.55" y="16.6687"/>
					</TrackLine>
					<TrackArc>
						<Center x="83.185" y="17.4625"/>
						<End x="83.82" y="16.6687"/>
					</TrackArc>
					<TrackLine>
						<End x="83.82" y="16.6688"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.455" y="15.875"/>
						<End x="85.09" y="16.6688"/>
					</TrackArcCW>
					<TrackLine>
						<End x="85.09" y="16.6687"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="17.4625"/>
						<End x="86.36" y="16.6687"/>
					</TrackArc>
					<TrackLine>
						<End x="86.36" y="16.6688"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.995" y="15.875"/>
						<End x="86.8842" y="16.8854"/>
					</TrackArcCW>
					<TrackLine>
						<End x="89.0105" y="17.1187"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="109.2243" y="15.6301"/>
							<Dot x="109.3843" y="15.3763"/>
							<Dot x="109.938" y="15.7254"/>
							<Dot x="109.3121" y="15.9169"/>
						</Teardrop>
					</Teardrops>
					<Start x="109.2243" y="15.6301"/>
					<TrackLine>
						<End x="109.9934" y="15.7328"/>
					</TrackLine>
					<TrackArc>
						<Center x="109.7287" y="17.7152"/>
						<End x="110.2368" y="15.7808"/>
					</TrackArc>
					<TrackLine>
						<End x="112.9505" y="16.4936"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="113.0775" y="16.01"/>
						<End x="113.0775" y="16.51"/>
					</TrackArcCW>
					<TrackLine>
						<End x="113.2775" y="16.51"/>
					</TrackLine>
					<TrackLine>
						<End x="113.5775" y="16.56"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="89.0105" y="-11.8628"/>
							<Dot x="88.8311" y="-11.6223"/>
							<Dot x="88.3065" y="-12.0139"/>
							<Dot x="88.9455" y="-12.1557"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.835" y="-10.2235"/>
					<TrackLine>
						<End x="77.016" y="-10.7855"/>
					</TrackLine>
					<TrackLine>
						<End x="77.016" y="-10.9855"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="-10.9855"/>
						<End x="77.0168" y="-11.0036"/>
					</TrackArc>
					<TrackLine>
						<End x="77.0927" y="-11.8394"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.105" y="-11.7475"/>
						<End x="78.74" y="-12.5413"/>
					</TrackArc>
					<TrackLine>
						<End x="78.74" y="-12.5412"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="79.375" y="-13.335"/>
						<End x="80.01" y="-12.5412"/>
					</TrackArcCW>
					<TrackLine>
						<End x="80.01" y="-12.5413"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="-11.7475"/>
						<End x="81.28" y="-12.5413"/>
					</TrackArc>
					<TrackLine>
						<End x="81.28" y="-12.5412"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.915" y="-13.335"/>
						<End x="82.55" y="-12.5412"/>
					</TrackArcCW>
					<TrackLine>
						<End x="82.55" y="-12.5413"/>
					</TrackLine>
					<TrackArc>
						<Center x="83.185" y="-11.7475"/>
						<End x="83.82" y="-12.5413"/>
					</TrackArc>
					<TrackLine>
						<End x="83.82" y="-12.5412"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.455" y="-13.335"/>
						<End x="85.09" y="-12.5412"/>
					</TrackArcCW>
					<TrackLine>
						<End x="85.09" y="-12.5413"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="-11.7475"/>
						<End x="86.36" y="-12.5413"/>
					</TrackArc>
					<TrackLine>
						<End x="86.36" y="-12.5412"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.995" y="-13.335"/>
						<End x="86.7817" y="-12.3411"/>
					</TrackArcCW>
					<TrackLine>
						<End x="89.0105" y="-11.8628"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="89.3266" y="2.9569"/>
							<Dot x="89.1345" y="3.1873"/>
							<Dot x="88.6318" y="2.7681"/>
							<Dot x="89.2775" y="2.6609"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.835" y="4.3815"/>
					<TrackLine>
						<End x="77.016" y="3.8195"/>
					</TrackLine>
					<TrackLine>
						<End x="77.016" y="3.6195"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="3.6195"/>
						<End x="77.0168" y="3.6014"/>
					</TrackArc>
					<TrackLine>
						<End x="77.0927" y="2.7656"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.105" y="2.8575"/>
						<End x="78.74" y="2.0637"/>
					</TrackArc>
					<TrackLine>
						<End x="78.74" y="2.0638"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="79.375" y="1.27"/>
						<End x="80.01" y="2.0638"/>
					</TrackArcCW>
					<TrackLine>
						<End x="80.01" y="2.0637"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="2.8575"/>
						<End x="81.28" y="2.0637"/>
					</TrackArc>
					<TrackLine>
						<End x="81.28" y="2.0638"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.915" y="1.27"/>
						<End x="82.55" y="2.0638"/>
					</TrackArcCW>
					<TrackLine>
						<End x="82.55" y="2.0637"/>
					</TrackLine>
					<TrackArc>
						<Center x="83.185" y="2.8575"/>
						<End x="83.82" y="2.0637"/>
					</TrackArc>
					<TrackLine>
						<End x="83.82" y="2.0638"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.455" y="1.27"/>
						<End x="85.09" y="2.0638"/>
					</TrackArcCW>
					<TrackLine>
						<End x="85.09" y="2.0637"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="2.8575"/>
						<End x="86.36" y="2.0637"/>
					</TrackArc>
					<TrackLine>
						<End x="86.36" y="2.0638"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.995" y="1.27"/>
						<End x="86.7285" y="2.2509"/>
					</TrackArcCW>
					<TrackLine>
						<End x="89.3266" y="2.9569"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="103.5118" y="15.346"/>
							<Dot x="103.8115" y="15.3337"/>
							<Dot x="103.8385" y="15.9876"/>
							<Dot x="103.3255" y="15.5811"/>
						</Teardrop>
					</Teardrops>
					<Start x="103.5118" y="15.346"/>
					<TrackLine>
						<End x="103.8983" y="16.105"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="104.4775" y="15.81"/>
						<End x="104.0476" y="16.2975"/>
					</TrackArcCW>
					<TrackLine>
						<End x="104.1468" y="16.385"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="104.4775" y="16.01"/>
						<End x="104.4775" y="16.51"/>
					</TrackArcCW>
					<TrackLine>
						<End x="104.6775" y="16.51"/>
					</TrackLine>
					<TrackLine>
						<End x="104.9775" y="16.56"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="96.1636" y="-7.3057"/>
							<Dot x="96.4628" y="-7.2851"/>
							<Dot x="96.4178" y="-6.6321"/>
							<Dot x="95.9526" y="-7.0925"/>
						</Teardrop>
					</Teardrops>
					<Start x="104.9775" y="17.36"/>
					<TrackLine>
						<End x="104.6775" y="17.31"/>
					</TrackLine>
					<TrackLine>
						<End x="104.4775" y="17.31"/>
					</TrackLine>
					<TrackArc>
						<Center x="104.4775" y="16.01"/>
						<End x="103.6099" y="16.9781"/>
					</TrackArc>
					<TrackLine>
						<End x="102.7443" y="16.2024"/>
					</TrackLine>
					<TrackArc>
						<Center x="103.5118" y="15.346"/>
						<End x="102.4812" y="15.8563"/>
					</TrackArc>
					<TrackLine>
						<End x="101.4972" y="13.8691"/>
					</TrackLine>
					<TrackArc>
						<Center x="102.0797" y="13.5807"/>
						<End x="101.4462" y="13.7264"/>
					</TrackArc>
					<TrackLine>
						<End x="97.3233" y="-4.2028"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="96.2026" y="-3.9451"/>
						<End x="97.2785" y="-4.3511"/>
					</TrackArcCW>
					<TrackLine>
						<End x="96.1636" y="-7.3057"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.9799" y="-26.491"/>
							<Dot x="88.8022" y="-26.2493"/>
							<Dot x="88.2749" y="-26.637"/>
							<Dot x="88.9128" y="-26.7833"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.835" y="-24.8285"/>
					<TrackLine>
						<End x="77.016" y="-25.3905"/>
					</TrackLine>
					<TrackLine>
						<End x="77.016" y="-25.5905"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.216" y="-25.5905"/>
						<End x="77.0168" y="-25.6086"/>
					</TrackArc>
					<TrackLine>
						<End x="77.0927" y="-26.4444"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.105" y="-26.3525"/>
						<End x="78.74" y="-27.1463"/>
					</TrackArc>
					<TrackLine>
						<End x="78.74" y="-27.1462"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="79.375" y="-27.94"/>
						<End x="80.01" y="-27.1462"/>
					</TrackArcCW>
					<TrackLine>
						<End x="80.01" y="-27.1463"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="-26.3525"/>
						<End x="81.28" y="-27.1463"/>
					</TrackArc>
					<TrackLine>
						<End x="81.28" y="-27.1462"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.915" y="-27.94"/>
						<End x="82.55" y="-27.1462"/>
					</TrackArcCW>
					<TrackLine>
						<End x="82.55" y="-27.1463"/>
					</TrackLine>
					<TrackArc>
						<Center x="83.185" y="-26.3525"/>
						<End x="83.82" y="-27.1463"/>
					</TrackArc>
					<TrackLine>
						<End x="83.82" y="-27.1462"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="84.455" y="-27.94"/>
						<End x="85.09" y="-27.1462"/>
					</TrackArcCW>
					<TrackLine>
						<End x="85.09" y="-27.1463"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="-26.3525"/>
						<End x="86.36" y="-27.1463"/>
					</TrackArc>
					<TrackLine>
						<End x="86.36" y="-27.1462"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.995" y="-27.94"/>
						<End x="86.7889" y="-26.9446"/>
					</TrackArcCW>
					<TrackLine>
						<End x="88.9799" y="-26.491"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="97.995" y="-8.1703"/>
							<Dot x="98.2949" y="-8.1619"/>
							<Dot x="98.2766" y="-7.5076"/>
							<Dot x="97.7929" y="-7.9485"/>
						</Teardrop>
					</Teardrops>
					<Start x="97.995" y="-8.1703"/>
					<TrackLine>
						<End x="107.1479" y="13.3689"/>
					</TrackLine>
					<TrackArc>
						<Center x="106.2275" y="13.76"/>
						<End x="107.2275" y="13.76"/>
					</TrackArc>
					<TrackLine>
						<End x="107.2275" y="13.96"/>
					</TrackLine>
					<TrackLine>
						<End x="107.2775" y="14.26"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="STR6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="76.9224" y="-37.8715"/>
							<Dot x="76.6497" y="-37.9965"/>
							<Dot x="76.9224" y="-38.5915"/>
							<Dot x="77.1951" y="-37.9965"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.9224" y="-37.8715"/>
					<TrackLine>
						<End x="76.9224" y="-38.6715"/>
					</TrackLine>
					<TrackLine>
						<End x="76.9224" y="-38.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="76.835" y="-39.4335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="1.27"/>
							<Dot x="84.1823" y="1.145"/>
							<Dot x="84.455" y="0.55"/>
							<Dot x="84.7277" y="1.145"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="-0.3175"/>
					<TrackLine>
						<End x="84.455" y="0.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="0.4445"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="-13.335"/>
							<Dot x="84.1823" y="-13.46"/>
							<Dot x="84.455" y="-14.055"/>
							<Dot x="84.7277" y="-13.46"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="-14.9225"/>
					<TrackLine>
						<End x="84.455" y="-14.3605"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="-14.1605"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="-13.335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="30.48"/>
							<Dot x="84.1823" y="30.355"/>
							<Dot x="84.455" y="29.76"/>
							<Dot x="84.7277" y="30.355"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="28.8925"/>
					<TrackLine>
						<End x="84.455" y="29.4545"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="29.6545"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="45.085"/>
							<Dot x="84.1823" y="44.96"/>
							<Dot x="84.455" y="44.365"/>
							<Dot x="84.7277" y="44.96"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="45.085"/>
					<TrackLine>
						<End x="84.455" y="44.2595"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="44.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="43.4975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="-27.94"/>
							<Dot x="84.1823" y="-28.065"/>
							<Dot x="84.455" y="-28.66"/>
							<Dot x="84.7277" y="-28.065"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="-29.5275"/>
					<TrackLine>
						<End x="84.455" y="-28.9655"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="-28.7655"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="15.875"/>
							<Dot x="84.1823" y="15.75"/>
							<Dot x="84.455" y="15.155"/>
							<Dot x="84.7277" y="15.75"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="14.2875"/>
					<TrackLine>
						<End x="84.455" y="14.8495"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="15.0495"/>
					</TrackLine>
					<TrackLine>
						<End x="84.455" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="38.735"/>
							<Dot x="84.412" y="38.4382"/>
							<Dot x="85.0597" y="38.3442"/>
							<Dot x="84.708" y="38.8962"/>
						</Teardrop>
					</Teardrops>
					<Start x="107.2775" y="22.86"/>
					<TrackLine>
						<End x="107.2275" y="23.16"/>
					</TrackLine>
					<TrackLine>
						<End x="107.2275" y="23.36"/>
					</TrackLine>
					<TrackArc>
						<Center x="106.7275" y="23.36"/>
						<End x="107.1025" y="23.6907"/>
					</TrackArc>
					<TrackLine>
						<End x="107.015" y="23.7899"/>
					</TrackLine>
					<TrackArc>
						<Center x="106.5275" y="23.36"/>
						<End x="106.9811" y="23.8255"/>
					</TrackArc>
					<TrackLine>
						<End x="94.5405" y="35.9477"/>
					</TrackLine>
					<TrackArc>
						<Center x="92.9005" y="34.2646"/>
						<End x="93.1649" y="36.5997"/>
					</TrackArc>
					<TrackLine>
						<End x="86.8699" y="37.3126"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.995" y="38.4175"/>
						<End x="86.3914" y="37.4836"/>
					</TrackArcCW>
					<TrackLine>
						<End x="84.455" y="38.735"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="30.48"/>
							<Dot x="86.7554" y="30.6605"/>
							<Dot x="86.4548" y="30.2617"/>
							<Dot x="86.9482" y="30.1837"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="28.8925"/>
					<TrackLine>
						<End x="85.906" y="29.4545"/>
					</TrackLine>
					<TrackLine>
						<End x="85.906" y="29.6545"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.106" y="29.6545"/>
						<End x="85.9391" y="29.7648"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.0936" y="29.9985"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.614" y="29.6545"/>
						<End x="86.3946" y="30.2384"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.4102" y="30.2443"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="32.0675"/>
						<End x="86.4548" y="30.2617"/>
					</TrackArc>
					<TrackLine>
						<End x="86.995" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="85.725" y="45.085"/>
							<Dot x="85.4523" y="44.96"/>
							<Dot x="85.725" y="44.365"/>
							<Dot x="85.9977" y="44.96"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="45.085"/>
					<TrackLine>
						<End x="85.725" y="44.2595"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="44.0595"/>
					</TrackLine>
					<TrackLine>
						<End x="85.725" y="43.4975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="-27.94"/>
							<Dot x="86.7554" y="-27.7595"/>
							<Dot x="86.4548" y="-28.1583"/>
							<Dot x="86.9482" y="-28.2363"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="-29.5275"/>
					<TrackLine>
						<End x="85.906" y="-28.9655"/>
					</TrackLine>
					<TrackLine>
						<End x="85.906" y="-28.7655"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.106" y="-28.7655"/>
						<End x="85.9391" y="-28.6552"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.0936" y="-28.4215"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.614" y="-28.7655"/>
						<End x="86.3946" y="-28.1816"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.4102" y="-28.1757"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="-26.3525"/>
						<End x="86.4548" y="-28.1583"/>
					</TrackArc>
					<TrackLine>
						<End x="86.995" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="38.4175"/>
							<Dot x="87.0768" y="38.1289"/>
							<Dot x="87.7065" y="38.3073"/>
							<Dot x="87.1602" y="38.6679"/>
						</Teardrop>
					</Teardrops>
					<Start x="108.0775" y="22.86"/>
					<TrackLine>
						<End x="108.0275" y="23.16"/>
					</TrackLine>
					<TrackLine>
						<End x="108.0275" y="23.36"/>
					</TrackLine>
					<TrackArc>
						<Center x="106.5275" y="23.36"/>
						<End x="107.5743" y="24.4343"/>
					</TrackArc>
					<TrackLine>
						<End x="95.1337" y="36.5565"/>
					</TrackLine>
					<TrackArc>
						<Center x="92.9005" y="34.2646"/>
						<End x="93.3903" y="37.4269"/>
					</TrackArc>
					<TrackLine>
						<End x="86.995" y="38.4175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="15.875"/>
							<Dot x="86.7554" y="16.0555"/>
							<Dot x="86.4548" y="15.6567"/>
							<Dot x="86.9482" y="15.5787"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="14.2875"/>
					<TrackLine>
						<End x="85.906" y="14.8495"/>
					</TrackLine>
					<TrackLine>
						<End x="85.906" y="15.0495"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.106" y="15.0495"/>
						<End x="85.9391" y="15.1598"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.0936" y="15.3935"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.614" y="15.0495"/>
						<End x="86.3946" y="15.6334"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.4102" y="15.6393"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="17.4625"/>
						<End x="86.4548" y="15.6567"/>
					</TrackArc>
					<TrackLine>
						<End x="86.995" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="1.27"/>
							<Dot x="86.7554" y="1.4505"/>
							<Dot x="86.4548" y="1.0517"/>
							<Dot x="86.9482" y="0.9737"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="-0.3175"/>
					<TrackLine>
						<End x="85.906" y="0.2445"/>
					</TrackLine>
					<TrackLine>
						<End x="85.906" y="0.4445"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.106" y="0.4445"/>
						<End x="85.9391" y="0.5548"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.0936" y="0.7885"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.614" y="0.4445"/>
						<End x="86.3946" y="1.0284"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.4102" y="1.0343"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="2.8575"/>
						<End x="86.4548" y="1.0517"/>
					</TrackArc>
					<TrackLine>
						<End x="86.995" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="-13.335"/>
							<Dot x="86.7554" y="-13.1545"/>
							<Dot x="86.4548" y="-13.5533"/>
							<Dot x="86.9482" y="-13.6313"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="-14.9225"/>
					<TrackLine>
						<End x="85.906" y="-14.3605"/>
					</TrackLine>
					<TrackLine>
						<End x="85.906" y="-14.1605"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.106" y="-14.1605"/>
						<End x="85.9391" y="-14.0502"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.0936" y="-13.8165"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="86.614" y="-14.1605"/>
						<End x="86.3946" y="-13.5766"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.4102" y="-13.5707"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="-11.7475"/>
						<End x="86.4548" y="-13.5533"/>
					</TrackArc>
					<TrackLine>
						<End x="86.995" y="-13.335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00444"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-34.925"/>
							<Dot x="51.9695" y="-35.1975"/>
							<Dot x="52.342" y="-34.4671"/>
							<Dot x="51.5331" y="-34.3331"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-34.29"/>
					<TrackLine>
						<End x="53.086" y="-34.29"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-35.941"/>
						<End x="52.342" y="-34.4671"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="-34.925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00444"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-34.925"/>
							<Dot x="51.5331" y="-35.5169"/>
							<Dot x="52.342" y="-35.3829"/>
							<Dot x="51.9695" y="-34.6525"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-35.56"/>
					<TrackLine>
						<End x="53.086" y="-35.56"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="-33.909"/>
						<End x="52.342" y="-35.3829"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="-34.925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G48"/>
				<Subwire width="0.4">
					<Start x="86.995" y="-39.4335"/>
					<TrackLine>
						<End x="86.814" y="-38.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="86.814" y="-38.6715"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.344" y="-38.6715"/>
						<End x="86.675" y="-38.0475"/>
					</TrackArc>
					<TrackLine>
						<End x="85.1596" y="-34.8149"/>
					</TrackLine>
					<TrackArc>
						<Center x="84.1183" y="-35.303"/>
						<End x="84.2931" y="-34.1664"/>
					</TrackArc>
					<TrackLine>
						<End x="82.839" y="-33.9428"/>
					</TrackLine>
					<TrackArc>
						<Center x="82.6642" y="-35.0794"/>
						<End x="82.6693" y="-33.9294"/>
					</TrackArc>
					<TrackLine>
						<End x="78.4778" y="-33.9109"/>
					</TrackLine>
					<TrackLine>
						<End x="78.469" y="-33.9109"/>
					</TrackLine>
					<TrackLine>
						<End x="65.278" y="-33.9109"/>
					</TrackLine>
					<TrackLine>
						<End x="65.078" y="-33.9109"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="-34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G48"/>
				<Subwire width="0.4">
					<Start x="59.69" y="-34.29"/>
					<TrackLine>
						<End x="60.252" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="-34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00446"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-37.465"/>
							<Dot x="51.9695" y="-37.7375"/>
							<Dot x="52.342" y="-37.0071"/>
							<Dot x="51.5331" y="-36.8731"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-36.83"/>
					<TrackLine>
						<End x="53.086" y="-36.83"/>
					</TrackLine>
					<TrackArc>
						<Center x="53.086" y="-38.481"/>
						<End x="52.342" y="-37.0071"/>
					</TrackArc>
					<TrackLine>
						<End x="51.435" y="-37.465"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00446"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="51.435" y="-37.465"/>
							<Dot x="51.5331" y="-38.0569"/>
							<Dot x="52.342" y="-37.9229"/>
							<Dot x="51.9695" y="-37.1925"/>
						</Teardrop>
					</Teardrops>
					<Start x="53.848" y="-38.1"/>
					<TrackLine>
						<End x="53.086" y="-38.1"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="53.086" y="-36.449"/>
						<End x="52.342" y="-37.9229"/>
					</TrackArcCW>
					<TrackLine>
						<End x="51.435" y="-37.465"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00448"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-34.925"/>
							<Dot x="32.4831" y="-35.5169"/>
							<Dot x="33.292" y="-35.3829"/>
							<Dot x="32.9195" y="-34.6525"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-35.56"/>
					<TrackLine>
						<End x="34.036" y="-35.56"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="-33.909"/>
						<End x="33.292" y="-35.3829"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="-34.925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00448"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-34.925"/>
							<Dot x="32.9195" y="-35.1975"/>
							<Dot x="33.292" y="-34.4671"/>
							<Dot x="32.4831" y="-34.3331"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-34.29"/>
					<TrackLine>
						<End x="34.036" y="-34.29"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-35.941"/>
						<End x="33.292" y="-34.4671"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="-34.925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00457"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-37.465"/>
							<Dot x="32.9195" y="-37.7375"/>
							<Dot x="33.292" y="-37.0071"/>
							<Dot x="32.4831" y="-36.8731"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-36.83"/>
					<TrackLine>
						<End x="34.036" y="-36.83"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-38.481"/>
						<End x="33.292" y="-37.0071"/>
					</TrackArc>
					<TrackLine>
						<End x="32.385" y="-37.465"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NET00457"/>
				<Subwire fixed="on" width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="32.385" y="-37.465"/>
							<Dot x="32.4831" y="-38.0569"/>
							<Dot x="33.292" y="-37.9229"/>
							<Dot x="32.9195" y="-37.1925"/>
						</Teardrop>
					</Teardrops>
					<Start x="34.798" y="-38.1"/>
					<TrackLine>
						<End x="34.036" y="-38.1"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="34.036" y="-36.449"/>
						<End x="33.292" y="-37.9229"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="-37.465"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G47"/>
				<Subwire width="0.4">
					<Start x="59.69" y="-36.83"/>
					<TrackLine>
						<End x="60.252" y="-36.83"/>
					</TrackLine>
					<TrackLine>
						<End x="60.452" y="-36.83"/>
					</TrackLine>
					<TrackLine>
						<End x="62.23" y="-36.83"/>
					</TrackLine>
					<TrackLine>
						<End x="62.43" y="-36.83"/>
					</TrackLine>
					<TrackLine>
						<End x="62.738" y="-36.83"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G47"/>
				<Subwire width="0.4">
					<Start x="83.185" y="-39.4335"/>
					<TrackLine>
						<End x="83.004" y="-38.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="83.004" y="-38.6715"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.534" y="-38.6715"/>
						<End x="82.8845" y="-38.0909"/>
					</TrackArc>
					<TrackLine>
						<End x="82.5949" y="-37.4173"/>
					</TrackLine>
					<TrackArc>
						<Center x="81.5384" y="-37.8715"/>
						<End x="82.3897" y="-37.0983"/>
					</TrackArc>
					<TrackLine>
						<End x="80.7607" y="-35.3047"/>
					</TrackLine>
					<TrackArc>
						<Center x="79.9094" y="-36.0779"/>
						<End x="80.0418" y="-34.9356"/>
					</TrackArc>
					<TrackLine>
						<End x="78.6014" y="-34.7686"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.469" y="-35.9109"/>
						<End x="78.3245" y="-34.77"/>
					</TrackArc>
					<TrackLine>
						<End x="65.3031" y="-36.4188"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="65.278" y="-36.2204"/>
						<End x="65.278" y="-36.4204"/>
					</TrackArcCW>
					<TrackLine>
						<End x="65.078" y="-36.4204"/>
					</TrackLine>
					<TrackLine>
						<End x="64.77" y="-36.83"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G46"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-34.29"/>
							<Dot x="46.865" y="-34.0173"/>
							<Dot x="46.27" y="-34.29"/>
							<Dot x="46.865" y="-34.5627"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="-34.29"/>
					<TrackLine>
						<End x="46.028" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="46.99" y="-34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G46"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.5384" y="-37.8715"/>
							<Dot x="81.3046" y="-38.0594"/>
							<Dot x="81.7145" y="-38.5696"/>
							<Dot x="81.8334" y="-37.926"/>
						</Teardrop>
					</Teardrops>
					<Start x="81.5384" y="-37.8715"/>
					<TrackLine>
						<End x="81.7279" y="-38.6226"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.534" y="-38.6715"/>
						<End x="81.734" y="-38.6715"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.734" y="-38.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="81.915" y="-39.4335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G46"/>
				<Subwire width="0.4">
					<Start x="43.688" y="-34.29"/>
					<TrackLine>
						<End x="43.38" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="-34.29"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-34.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G45"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-35.8775"/>
							<Dot x="46.7234" y="-35.7399"/>
							<Dot x="46.4232" y="-36.3215"/>
							<Dot x="47.0598" y="-36.1693"/>
						</Teardrop>
					</Teardrops>
					<Start x="45.72" y="-36.83"/>
					<TrackLine>
						<End x="46.028" y="-36.4204"/>
					</TrackLine>
					<TrackLine>
						<End x="46.228" y="-36.4204"/>
					</TrackLine>
					<TrackArc>
						<Center x="46.228" y="-36.2204"/>
						<End x="46.3513" y="-36.3778"/>
					</TrackArc>
					<TrackLine>
						<End x="46.99" y="-35.8775"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G45"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="69.215" y="-37.1475"/>
							<Dot x="69.3549" y="-37.4129"/>
							<Dot x="69.9339" y="-37.1076"/>
							<Dot x="69.3247" y="-36.8683"/>
						</Teardrop>
					</Teardrops>
					<Start x="78.105" y="-39.4335"/>
					<TrackLine>
						<End x="78.0724" y="-38.8715"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0724" y="-38.6715"/>
					</TrackLine>
					<TrackLine>
						<End x="78.0724" y="-37.8715"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.9224" y="-37.8715"/>
						<End x="76.8587" y="-36.7233"/>
					</TrackArc>
					<TrackLine>
						<End x="69.215" y="-37.1475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="G45"/>
				<Subwire width="0.4">
					<Start x="43.688" y="-36.83"/>
					<TrackLine>
						<End x="43.38" y="-36.83"/>
					</TrackLine>
					<TrackLine>
						<End x="43.18" y="-36.83"/>
					</TrackLine>
					<TrackLine>
						<End x="41.402" y="-36.83"/>
					</TrackLine>
					<TrackLine>
						<End x="41.202" y="-36.83"/>
					</TrackLine>
					<TrackLine>
						<End x="40.64" y="-36.83"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire fixed="on" width="2">
					<Start x="6.985" y="-38.1"/>
					<TrackLine>
						<End x="17.78" y="-38.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="89.0105" y="10.1265"/>
					<TrackLine>
						<End x="91.7105" y="10.1447"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="104.8364" y="-4.308"/>
							<Dot x="104.9121" y="-4.4932"/>
							<Dot x="105.316" y="-4.3281"/>
							<Dot x="104.9273" y="-4.1298"/>
						</Teardrop>
					</Teardrops>
					<Start x="104.8364" y="-4.308"/>
					<TrackLine>
						<End x="112.5733" y="-4.6327"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="1">
					<Start x="75.6638" y="29.5295"/>
					<TrackLine>
						<End x="75.6872" y="36.6843"/>
					</TrackLine>
					<TrackArc>
						<Center x="74.2372" y="36.689"/>
						<End x="75.6872" y="36.6967"/>
					</TrackArc>
					<TrackLine>
						<End x="75.654" y="42.9842"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="96.2026" y="-3.9451"/>
					<TrackLine>
						<End x="104.8364" y="-4.308"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Teardrops>
						<Teardrop>
							<Dot x="131.1275" y="23.8125"/>
							<Dot x="130.915" y="24.1513"/>
							<Dot x="130.1757" y="23.6876"/>
							<Dot x="131.0096" y="23.4303"/>
						</Teardrop>
					</Teardrops>
					<Start x="117.4845" y="22.0217"/>
					<TrackLine>
						<End x="131.1275" y="23.8125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="96.2026" y="-3.9451"/>
					<TrackLine>
						<End x="93.6109" y="-9.1825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="111.9525" y="21.4183"/>
					<TrackLine>
						<End x="110.8075" y="27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="114.3" y="-7.9375"/>
							<Dot x="114.4838" y="-7.7004"/>
							<Dot x="113.9666" y="-7.2994"/>
							<Dot x="114.0004" y="-7.953"/>
						</Teardrop>
					</Teardrops>
					<Start x="114.3" y="-7.9375"/>
					<TrackLine>
						<End x="112.5733" y="-4.6327"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="116.5225" y="1.5875"/>
							<Dot x="115.9754" y="1.6436"/>
							<Dot x="115.8632" y="0.5491"/>
							<Dot x="116.806" y="1.1162"/>
						</Teardrop>
					</Teardrops>
					<Start x="112.5733" y="-4.6327"/>
					<TrackLine>
						<End x="116.5225" y="1.5875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="1">
					<Start x="75.6638" y="14.9245"/>
					<TrackLine>
						<End x="76.8902" y="20.6971"/>
					</TrackLine>
					<TrackArc>
						<Center x="75.4719" y="20.9984"/>
						<End x="76.906" y="21.2126"/>
					</TrackArc>
					<TrackLine>
						<End x="75.6638" y="29.5295"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="1">
					<Start x="77.9879" y="10.0718"/>
					<TrackLine>
						<End x="75.6638" y="14.9245"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="2">
					<Start x="6.985" y="-38.1"/>
					<TrackLine>
						<End x="5.5" y="-38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-38.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="1">
					<Start x="75.654" y="-14.4474"/>
					<TrackLine>
						<End x="75.7016" y="-7.6151"/>
					</TrackLine>
					<TrackArc>
						<Center x="74.2516" y="-7.605"/>
						<End x="75.7016" y="-7.5957"/>
					</TrackArc>
					<TrackLine>
						<End x="75.654" y="-0.1632"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="104.8364" y="-4.308"/>
					<TrackLine>
						<End x="110.5207" y="15.2534"/>
					</TrackLine>
					<TrackArc>
						<Center x="109.2243" y="15.6301"/>
						<End x="110.4438" y="16.2092"/>
					</TrackArc>
					<TrackLine>
						<End x="109.7287" y="17.7152"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="1">
					<Start x="75.654" y="-0.1632"/>
					<TrackLine>
						<End x="77.7533" y="8.1116"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.3478" y="8.4682"/>
						<End x="77.7887" y="8.3057"/>
					</TrackArc>
					<TrackLine>
						<End x="77.9879" y="10.0718"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="1">
					<Start x="75.654" y="-14.4474"/>
					<TrackLine>
						<End x="74.1064" y="-22.3957"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="72.6831" y="-22.1186"/>
						<End x="74.1019" y="-22.4177"/>
					</TrackArcCW>
					<TrackLine>
						<End x="73.0555" y="-27.3819"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.8">
					<Start x="103.505" y="-8.89"/>
					<TrackLine>
						<End x="104.8364" y="-4.308"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_IN_MV_G1"/>
				<Subwire fixed="on" width="0.8">
					<Start x="185.1025" y="-20.955"/>
					<TrackLine>
						<End x="184.8217" y="-19.2536"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="186.055" y="-19.05"/>
						<End x="184.8085" y="-19.1434"/>
					</TrackArcCW>
					<TrackLine>
						<End x="182.9753" y="5.3099"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SCL"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="13.3002" y="-35.3475"/>
							<Dot x="13.138" y="-35.2306"/>
							<Dot x="12.8829" y="-35.5847"/>
							<Dot x="13.3176" y="-35.5468"/>
						</Teardrop>
					</Teardrops>
					<Start x="13.3002" y="-35.3475"/>
					<TrackLine>
						<End x="12.6486" y="-35.7179"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SCL"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="132.6668" y="16.3745"/>
							<Dot x="132.7763" y="16.5419"/>
							<Dot x="132.4113" y="16.7809"/>
							<Dot x="132.4685" y="16.3483"/>
						</Teardrop>
						<Teardrop>
							<Dot x="131.1275" y="18.7325"/>
							<Dot x="130.8791" y="18.1318"/>
							<Dot x="131.7669" y="17.7646"/>
							<Dot x="131.7775" y="18.7254"/>
						</Teardrop>
					</Teardrops>
					<Start x="132.6668" y="16.3745"/>
					<TrackLine>
						<End x="132.3127" y="16.9377"/>
					</TrackLine>
					<TrackArc>
						<Center x="131.1275" y="16.1925"/>
						<End x="132.2956" y="16.9642"/>
					</TrackArc>
					<TrackLine>
						<End x="131.1275" y="18.7325"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SCL"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="131.1275" y="18.7325"/>
							<Dot x="130.8222" y="19.2491"/>
							<Dot x="129.8488" y="18.6739"/>
							<Dot x="130.8708" y="18.1901"/>
						</Teardrop>
						<Teardrop>
							<Dot x="119.1253" y="18.1828"/>
							<Dot x="119.2627" y="17.9161"/>
							<Dot x="119.8445" y="18.2157"/>
							<Dot x="119.2377" y="18.4609"/>
						</Teardrop>
					</Teardrops>
					<Start x="131.1275" y="18.7325"/>
					<TrackLine>
						<End x="119.1253" y="18.1828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SCL"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="6.35" y="-35.2425"/>
							<Dot x="6.3482" y="-35.4425"/>
							<Dot x="6.7845" y="-35.4464"/>
							<Dot x="6.5026" y="-35.1133"/>
						</Teardrop>
					</Teardrops>
					<Start x="6.35" y="-35.2425"/>
					<TrackLine>
						<End x="7.0293" y="-35.5613"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SDA"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="118.0746" y="19.1527"/>
							<Dot x="118.2486" y="18.9083"/>
							<Dot x="118.7818" y="19.2879"/>
							<Dot x="118.1462" y="19.4441"/>
						</Teardrop>
						<Teardrop>
							<Dot x="131.1275" y="21.2725"/>
							<Dot x="130.7659" y="21.7513"/>
							<Dot x="129.8637" y="21.0698"/>
							<Dot x="130.9337" y="20.7047"/>
						</Teardrop>
					</Teardrops>
					<Start x="118.0746" y="19.1527"/>
					<TrackLine>
						<End x="118.9093" y="19.3123"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="119.1253" y="18.1828"/>
						<End x="118.9432" y="19.3183"/>
					</TrackArcCW>
					<TrackLine>
						<End x="131.1275" y="21.2725"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SDA"/>
				<Subwire width="0.3">
					<Start x="7.0125" y="-36.1611"/>
					<TrackLine>
						<End x="6.3966" y="-36.1914"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="6.35" y="-35.2425"/>
						<End x="6.35" y="-36.1925"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.5" y="-36.1925"/>
					</TrackLine>
					<TrackLine>
						<End x="5.35" y="-36.1925"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-35.56"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SDA"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="133.6603" y="16.0347"/>
							<Dot x="133.8282" y="16.1433"/>
							<Dot x="133.611" y="16.4792"/>
							<Dot x="133.4726" y="16.1039"/>
						</Teardrop>
						<Teardrop>
							<Dot x="131.1275" y="21.2725"/>
							<Dot x="130.8791" y="20.6718"/>
							<Dot x="131.7669" y="20.3046"/>
							<Dot x="131.7775" y="21.2654"/>
						</Teardrop>
					</Teardrops>
					<Start x="133.6603" y="16.0347"/>
					<TrackLine>
						<End x="133.611" y="16.4792"/>
					</TrackLine>
					<TrackArc>
						<Center x="132.6668" y="16.3745"/>
						<End x="133.5351" y="16.76"/>
					</TrackArc>
					<TrackLine>
						<End x="132.407" y="19.3006"/>
					</TrackLine>
					<TrackArc>
						<Center x="131.1275" y="18.7325"/>
						<End x="132.2956" y="19.5042"/>
					</TrackArc>
					<TrackLine>
						<End x="131.1275" y="21.2725"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SDA"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="13.6223" y="-36.3469"/>
							<Dot x="13.5443" y="-36.1628"/>
							<Dot x="13.1425" y="-36.3328"/>
							<Dot x="13.5337" y="-36.5262"/>
						</Teardrop>
					</Teardrops>
					<Start x="13.6223" y="-36.3469"/>
					<TrackLine>
						<End x="12.9313" y="-36.3266"/>
					</TrackLine>
					<TrackLine>
						<End x="12.9312" y="-36.3266"/>
					</TrackLine>
					<TrackLine>
						<End x="12.6318" y="-36.3177"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<Subwire fixed="on" width="2">
					<Start x="32.385" y="26.035"/>
					<TrackLine>
						<End x="5.5236" y="25.4003"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="26.4"/>
						<End x="5.5" y="25.4"/>
					</TrackArcCW>
					<TrackLine>
						<End x="2" y="25.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_RESERVE4_G14"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="26.67"/>
							<Dot x="47.2052" y="26.461"/>
							<Dot x="47.6612" y="26.9306"/>
							<Dot x="47.0078" y="26.9694"/>
						</Teardrop>
						<Teardrop>
							<Dot x="75.4719" y="20.9984"/>
							<Dot x="75.432" y="21.2957"/>
							<Dot x="74.7833" y="21.2086"/>
							<Dot x="75.2728" y="20.7741"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="26.67"/>
					<TrackLine>
						<End x="50.6383" y="28.0867"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="26.035"/>
						<End x="52.0776" y="28.1401"/>
					</TrackArcCW>
					<TrackLine>
						<End x="75.4719" y="20.9984"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_IN_V_G2"/>
				<Subwire fixed="on" width="0.8">
					<Start x="180.4843" y="5.3175"/>
					<TrackLine>
						<End x="183.3961" y="-17.5526"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="181.61" y="-17.78"/>
						<End x="183.4086" y="-17.6964"/>
					</TrackArcCW>
					<TrackLine>
						<End x="184.15" y="-33.655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+MV_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="207" y="-34.6075"/>
					<TrackLine>
						<End x="210.5" y="-34.6075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+MV_IN"/>
				<Subwire width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="240.03" y="-34.6075"/>
							<Dot x="240.3537" y="-34.9887"/>
							<Dot x="241.1852" y="-34.2826"/>
							<Dot x="240.1075" y="-34.1135"/>
						</Teardrop>
					</Teardrops>
					<Start x="240.03" y="-34.6075"/>
					<TrackLine>
						<End x="246.85" y="-32.6892"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="247.5" y="-35"/>
						<End x="248.4856" y="-32.8112"/>
					</TrackArcCW>
					<TrackLine>
						<End x="251.7975" y="-34.3025"/>
					</TrackLine>
					<TrackLine>
						<End x="252.5" y="-35"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire width="0.8">
					<Start x="173.99" y="-10.16"/>
					<TrackLine>
						<End x="174.1234" y="-16.088"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.2234" y="-16.1308"/>
						<End x="174.123" y="-16.1907"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.9225" y="-22.5425"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_INV_G4"/>
				<Subwire width="0.8">
					<Start x="173.9225" y="-22.5425"/>
					<TrackLine>
						<End x="174.1228" y="-28.766"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="172.2233" y="-28.8271"/>
						<End x="174.1229" y="-28.887"/>
					</TrackArcCW>
					<TrackLine>
						<End x="173.9225" y="-35.2425"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="177.4901" y="-9.4237"/>
					<TrackLine>
						<End x="175.1288" y="-7.4954"/>
					</TrackLine>
					<TrackArc>
						<Center x="173.99" y="-8.89"/>
						<End x="175.0712" y="-7.4503"/>
					</TrackArc>
					<TrackLine>
						<End x="169.6865" y="-3.4062"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="181.61" y="-17.78"/>
					<TrackLine>
						<End x="177.4901" y="-9.4237"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="181.61" y="-30.48"/>
					<TrackLine>
						<End x="181.61" y="-17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+12V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="181.61" y="-43.18"/>
					<TrackLine>
						<End x="181.61" y="-30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+12V"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-22.5425"/>
					<TrackLine>
						<End x="167.341" y="-25.782"/>
					</TrackLine>
					<TrackArc>
						<Center x="169.2415" y="-25.7711"/>
						<End x="167.3411" y="-25.7929"/>
					</TrackArc>
					<TrackLine>
						<End x="167.4224" y="-32.8882"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="165.522" y="-32.91"/>
						<End x="167.4207" y="-32.9929"/>
					</TrackArcCW>
					<TrackLine>
						<End x="167.3225" y="-35.2425"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+12V"/>
				<Subwire width="0.8">
					<Start x="167.3225" y="-10.16"/>
					<TrackLine>
						<End x="167.4224" y="-20.1911"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="165.522" y="-20.21"/>
						<End x="167.4207" y="-20.2929"/>
					</TrackArcCW>
					<TrackLine>
						<End x="167.3225" y="-22.5425"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+12V"/>
				<Subwire width="0.8">
					<Start x="6.35" y="38.1"/>
					<TrackLine>
						<End x="31.8775" y="43.6212"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="41.275"/>
						<End x="32.1878" y="43.6674"/>
					</TrackArcCW>
					<TrackLine>
						<End x="50.2097" y="45.1526"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="50.5794" y="40.6663"/>
						<End x="50.2966" y="45.1589"/>
					</TrackArcCW>
					<TrackLine>
						<End x="79.2556" y="46.9817"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="79.375" y="45.085"/>
						<End x="79.375" y="46.9855"/>
					</TrackArcCW>
					<TrackLine>
						<End x="88.265" y="46.9855"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="88.265" y="45.085"/>
						<End x="89.0992" y="46.7926"/>
					</TrackArcCW>
					<TrackLine>
						<End x="132.0934" y="25.7897"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="131.1275" y="23.8125"/>
						<End x="132.4789" y="25.5491"/>
					</TrackArcCW>
					<TrackLine>
						<End x="169.6865" y="-3.4062"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+12V"/>
				<Subwire width="1.5">
					<Start x="6.35" y="38.1"/>
					<TrackLine>
						<End x="5.5" y="38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="4.75" y="38.1"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="38.1"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_N400R_G26"/>
				<Subwire fixed="on" width="2">
					<Start x="51.435" y="26.035"/>
					<TrackLine>
						<End x="48.0337" y="23.6154"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="46.99" y="25.0825"/>
						<End x="46.9938" y="23.282"/>
					</TrackArcCW>
					<TrackLine>
						<End x="34.2852" y="23.2555"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.29" y="20.955"/>
						<End x="34.2584" y="23.2553"/>
					</TrackArc>
					<TrackLine>
						<End x="5.5487" y="22.8603"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="26.4"/>
						<End x="5.5" y="22.86"/>
					</TrackArcCW>
					<TrackLine>
						<End x="2" y="22.86"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_N500R_G27"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="17.4625"/>
							<Dot x="47.2387" y="17.2947"/>
							<Dot x="47.6048" y="17.8373"/>
							<Dot x="46.9547" y="17.7605"/>
						</Teardrop>
						<Teardrop>
							<Dot x="73.7266" y="15.3371"/>
							<Dot x="73.843" y="15.6137"/>
							<Dot x="73.2396" y="15.8674"/>
							<Dot x="73.4412" y="15.2447"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="17.4625"/>
					<TrackLine>
						<End x="50.6539" y="19.6962"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="18.415"/>
						<End x="51.5798" y="19.9085"/>
					</TrackArcCW>
					<TrackLine>
						<End x="70.6022" y="18.0645"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="70.5057" y="17.0687"/>
						<End x="71.1308" y="17.8499"/>
					</TrackArcCW>
					<TrackLine>
						<End x="72.1579" y="17.0281"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="71.5328" y="16.2469"/>
						<End x="72.2697" y="16.9236"/>
					</TrackArcCW>
					<TrackLine>
						<End x="73.7266" y="15.3371"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NET00064"/>
				<Subwire width="0.8">
					<Start x="186.055" y="-9.8425"/>
					<TrackLine>
						<End x="186.055" y="-19.05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_1_G33"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-13.0175"/>
							<Dot x="47.2387" y="-13.1853"/>
							<Dot x="47.6048" y="-12.6427"/>
							<Dot x="46.9547" y="-12.7195"/>
						</Teardrop>
						<Teardrop>
							<Dot x="68.4921" y="-15.8859"/>
							<Dot x="68.4551" y="-15.5882"/>
							<Dot x="67.8056" y="-15.6688"/>
							<Dot x="68.2907" y="-16.1082"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="-13.0175"/>
					<TrackLine>
						<End x="50.6539" y="-10.7838"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="-12.065"/>
						<End x="51.8875" y="-10.6343"/>
					</TrackArcCW>
					<TrackLine>
						<End x="68.4921" y="-15.8859"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_RESERVE1_G11"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="28.575"/>
					<TrackLine>
						<End x="41.275" y="28.575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_2_G34"/>
				<Subwire fixed="on" width="2">
					<Start x="32.385" y="-12.065"/>
					<TrackLine>
						<End x="5.9122" y="-0.0889"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-1"/>
						<End x="5.5" y="0"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="0"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_2_G34"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-11.43"/>
							<Dot x="47.2052" y="-11.639"/>
							<Dot x="47.6612" y="-11.1694"/>
							<Dot x="47.0078" y="-11.1306"/>
						</Teardrop>
						<Teardrop>
							<Dot x="73.3465" y="-16.327"/>
							<Dot x="73.3069" y="-16.0297"/>
							<Dot x="72.6581" y="-16.1161"/>
							<Dot x="73.1471" y="-16.5511"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="-11.43"/>
					<TrackLine>
						<End x="50.6383" y="-10.0133"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="-12.065"/>
						<End x="52.0625" y="-9.9553"/>
					</TrackArcCW>
					<TrackLine>
						<End x="68.7773" y="-14.9269"/>
					</TrackLine>
					<TrackLine>
						<End x="68.7852" y="-14.9293"/>
					</TrackLine>
					<TrackLine>
						<End x="73.3465" y="-16.327"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_3_G35"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="-17.145"/>
					<TrackLine>
						<End x="41.275" y="-17.145"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_4_G36"/>
				<Subwire fixed="on" width="2">
					<Start x="51.435" y="-12.065"/>
					<TrackLine>
						<End x="48.0337" y="-14.4846"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="46.99" y="-13.0175"/>
						<End x="46.9343" y="-14.8171"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.3138" y="-14.3644"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-12.065"/>
						<End x="31.4378" y="-14.1615"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.9117" y="-2.6287"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-3.54"/>
						<End x="5.5" y="-2.54"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="-2.54"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_5_G37"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-20.6375"/>
							<Dot x="47.2387" y="-20.8053"/>
							<Dot x="47.6048" y="-20.2627"/>
							<Dot x="46.9547" y="-20.3395"/>
						</Teardrop>
						<Teardrop>
							<Dot x="68.8755" y="-22.2625"/>
							<Dot x="68.8166" y="-21.9684"/>
							<Dot x="68.1748" y="-22.097"/>
							<Dot x="68.6912" y="-22.4992"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="-20.6375"/>
					<TrackLine>
						<End x="50.6539" y="-18.4038"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="-19.685"/>
						<End x="51.7799" y="-18.2247"/>
					</TrackArcCW>
					<TrackLine>
						<End x="68.8755" y="-22.2625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_6_G38"/>
				<Subwire fixed="on" width="2">
					<Start x="32.385" y="-19.685"/>
					<TrackLine>
						<End x="9.3574" y="-6.804"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-13.7"/>
						<End x="8.8528" y="-6.5451"/>
					</TrackArc>
					<TrackLine>
						<End x="7.8768" y="-6.0878"/>
					</TrackLine>
					<TrackLine>
						<End x="7.8745" y="-6.0867"/>
					</TrackLine>
					<TrackLine>
						<End x="6.8993" y="-5.6303"/>
					</TrackLine>
					<TrackLine>
						<End x="6.8979" y="-5.6296"/>
					</TrackLine>
					<TrackLine>
						<End x="5.9235" y="-5.1741"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-6.08"/>
						<End x="5.5" y="-5.08"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="-5.08"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_6_G38"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-19.05"/>
							<Dot x="47.2052" y="-19.259"/>
							<Dot x="47.6612" y="-18.7894"/>
							<Dot x="47.0078" y="-18.7506"/>
						</Teardrop>
						<Teardrop>
							<Dot x="72.6831" y="-22.1186"/>
							<Dot x="72.6229" y="-21.8247"/>
							<Dot x="71.9817" y="-21.9559"/>
							<Dot x="72.4997" y="-22.3561"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="-19.05"/>
					<TrackLine>
						<End x="50.6383" y="-17.6333"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="-19.685"/>
						<End x="51.9043" y="-17.5346"/>
					</TrackArcCW>
					<TrackLine>
						<End x="69.0888" y="-21.285"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="68.8755" y="-22.2625"/>
						<End x="69.1016" y="-21.2879"/>
					</TrackArcCW>
					<TrackLine>
						<End x="72.6831" y="-22.1186"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_7_G39"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="-24.765"/>
					<TrackLine>
						<End x="41.275" y="-24.765"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_8_G40"/>
				<Subwire fixed="on" width="2">
					<Start x="51.435" y="-19.685"/>
					<TrackLine>
						<End x="48.0337" y="-22.1046"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="46.99" y="-20.6375"/>
						<End x="46.9343" y="-22.4371"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.3138" y="-21.9844"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-19.685"/>
						<End x="31.2619" y="-21.6927"/>
					</TrackArcCW>
					<TrackLine>
						<End x="8.2343" y="-8.8118"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-13.7"/>
						<End x="7.8766" y="-8.6282"/>
					</TrackArc>
					<TrackLine>
						<End x="6.9007" y="-8.1709"/>
					</TrackLine>
					<TrackLine>
						<End x="6.8979" y="-8.1696"/>
					</TrackLine>
					<TrackLine>
						<End x="5.9235" y="-7.7141"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-8.62"/>
						<End x="5.5" y="-7.62"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="-7.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_9_G41"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-28.2575"/>
							<Dot x="47.2387" y="-28.4253"/>
							<Dot x="47.6048" y="-27.8827"/>
							<Dot x="46.9547" y="-27.9595"/>
						</Teardrop>
						<Teardrop>
							<Dot x="70.1239" y="-31.1346"/>
							<Dot x="70.0794" y="-30.8379"/>
							<Dot x="69.4321" y="-30.935"/>
							<Dot x="69.9282" y="-31.3619"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="-28.2575"/>
					<TrackLine>
						<End x="50.6539" y="-26.0238"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="-27.305"/>
						<End x="51.8509" y="-25.8633"/>
					</TrackArcCW>
					<TrackLine>
						<End x="70.1239" y="-31.1346"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_N1K_G28"/>
				<Subwire fixed="on" width="2">
					<Start x="2" y="20.32"/>
					<TrackLine>
						<End x="5.5" y="20.32"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="19.32"/>
						<End x="5.5708" y="20.3175"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.385" y="18.415"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_N1K_G28"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="19.05"/>
							<Dot x="47.2052" y="18.841"/>
							<Dot x="47.6612" y="19.3106"/>
							<Dot x="47.0078" y="19.3494"/>
						</Teardrop>
						<Teardrop>
							<Dot x="74.3433" y="17.1121"/>
							<Dot x="74.3487" y="17.412"/>
							<Dot x="73.6943" y="17.4239"/>
							<Dot x="74.1125" y="16.9204"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="19.05"/>
					<TrackLine>
						<End x="50.6383" y="20.4667"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="18.415"/>
						<End x="51.6474" y="20.6057"/>
					</TrackArcCW>
					<TrackLine>
						<End x="70.6698" y="18.7618"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="70.5057" y="17.0687"/>
						<End x="71.2423" y="18.6019"/>
					</TrackArcCW>
					<TrackLine>
						<End x="74.3433" y="17.1121"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_N2K_G29"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="13.335"/>
					<TrackLine>
						<End x="41.275" y="13.335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_10_G42"/>
				<Subwire fixed="on" width="2">
					<Start x="32.385" y="-27.305"/>
					<TrackLine>
						<End x="7.3039" y="-10.9361"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-13.7"/>
						<End x="6.8991" y="-10.7107"/>
					</TrackArc>
					<TrackLine>
						<End x="5.9239" y="-10.2543"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-11.16"/>
						<End x="5.5" y="-10.16"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="-10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_10_G42"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-26.67"/>
							<Dot x="47.2052" y="-26.879"/>
							<Dot x="47.6612" y="-26.4094"/>
							<Dot x="47.0078" y="-26.3706"/>
						</Teardrop>
						<Teardrop>
							<Dot x="74.0351" y="-31.2087"/>
							<Dot x="73.9896" y="-30.9121"/>
							<Dot x="73.3427" y="-31.0114"/>
							<Dot x="73.8402" y="-31.4367"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="-26.67"/>
					<TrackLine>
						<End x="50.6383" y="-25.2533"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="-27.305"/>
						<End x="52.0116" y="-25.1809"/>
					</TrackArcCW>
					<TrackLine>
						<End x="70.386" y="-30.169"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="70.1239" y="-31.1346"/>
						<End x="70.3981" y="-30.1724"/>
					</TrackArcCW>
					<TrackLine>
						<End x="74.0351" y="-31.2087"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+3.3V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="104.3068" y="12.2157"/>
							<Dot x="104.5849" y="12.103"/>
							<Dot x="104.8307" y="12.7096"/>
							<Dot x="104.2107" y="12.4998"/>
						</Teardrop>
						<Teardrop>
							<Dot x="114.3" y="8.128"/>
							<Dot x="114.5182" y="8.3339"/>
							<Dot x="114.069" y="8.8099"/>
							<Dot x="114.0016" y="8.1589"/>
						</Teardrop>
					</Teardrops>
					<Start x="104.3068" y="12.2157"/>
					<TrackLine>
						<End x="107.9798" y="15.678"/>
					</TrackLine>
					<TrackArc>
						<Center x="107.2433" y="16.4594"/>
						<End x="108.2987" y="16.2614"/>
					</TrackArc>
					<TrackLine>
						<End x="108.6108" y="17.9249"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="109.7287" y="17.7152"/>
						<End x="110.7799" y="18.1497"/>
					</TrackArcCW>
					<TrackLine>
						<End x="111.4423" y="16.5468"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="109.2243" y="15.6301"/>
						<End x="111.4974" y="16.4002"/>
					</TrackArcCW>
					<TrackLine>
						<End x="114.3" y="8.128"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+3.3V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="111.6092" y="3.1845"/>
							<Dot x="111.9085" y="3.1639"/>
							<Dot x="111.9534" y="3.8169"/>
							<Dot x="111.4295" y="3.4247"/>
						</Teardrop>
						<Teardrop>
							<Dot x="114.3" y="8.128"/>
							<Dot x="114.0007" y="8.1486"/>
							<Dot x="113.9558" y="7.4956"/>
							<Dot x="114.4797" y="7.8878"/>
						</Teardrop>
					</Teardrops>
					<Start x="111.6092" y="3.1845"/>
					<TrackLine>
						<End x="114.3" y="8.128"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+3.3V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="113.9825" y="24.765"/>
							<Dot x="113.7945" y="24.5312"/>
							<Dot x="114.3045" y="24.121"/>
							<Dot x="114.2823" y="24.7752"/>
						</Teardrop>
						<Teardrop>
							<Dot x="114.3" y="8.128"/>
							<Dot x="114.2747" y="7.829"/>
							<Dot x="114.9269" y="7.7739"/>
							<Dot x="114.5429" y="8.304"/>
						</Teardrop>
					</Teardrops>
					<Start x="113.9825" y="24.765"/>
					<TrackLine>
						<End x="117.046" y="18.6384"/>
					</TrackLine>
					<TrackArc>
						<Center x="118.0746" y="19.1527"/>
						<End x="117.328" y="18.278"/>
					</TrackArc>
					<TrackLine>
						<End x="118.3488" y="17.4067"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="117.475" y="16.383"/>
						<End x="118.8204" y="16.4188"/>
					</TrackArcCW>
					<TrackLine>
						<End x="118.8745" y="14.3883"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="117.475" y="14.351"/>
						<End x="118.875" y="14.351"/>
					</TrackArcCW>
					<TrackLine>
						<End x="118.875" y="7.505"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="118.225" y="7.505"/>
						<End x="118.225" y="6.855"/>
					</TrackArcCW>
					<TrackLine>
						<End x="116.725" y="6.855"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="116.725" y="7.505"/>
						<End x="116.4054" y="6.939"/>
					</TrackArcCW>
					<TrackLine>
						<End x="114.3" y="8.128"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_11_G43"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="-32.385"/>
					<TrackLine>
						<End x="41.275" y="-32.385"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_HART_12_G44"/>
				<Subwire fixed="on" width="2">
					<Start x="51.435" y="-27.305"/>
					<TrackLine>
						<End x="48.0337" y="-29.7246"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="46.99" y="-28.2575"/>
						<End x="46.9343" y="-30.0571"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.3138" y="-29.6044"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-27.305"/>
						<End x="31.1277" y="-29.2315"/>
					</TrackArcCW>
					<TrackLine>
						<End x="6.0465" y="-12.8626"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-13.7"/>
						<End x="5.5" y="-12.7"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="-12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="USBDM"/>
				<Subwire fixed="on" width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="6.35" y="-18.7325"/>
							<Dot x="6.3023" y="-18.9267"/>
							<Dot x="6.726" y="-19.0308"/>
							<Dot x="6.5283" y="-18.6419"/>
						</Teardrop>
					</Teardrops>
					<Start x="6.35" y="-18.7325"/>
					<TrackLine>
						<End x="7.0268" y="-19.2695"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="USBDM"/>
				<Subwire width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="99.3573" y="-32.9881"/>
							<Dot x="99.2128" y="-32.8498"/>
							<Dot x="98.9111" y="-33.1651"/>
							<Dot x="99.3468" y="-33.1878"/>
						</Teardrop>
					</Teardrops>
					<Start x="99.3573" y="-32.9881"/>
					<TrackLine>
						<End x="93.7915" y="-35.1958"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_RESERVE2_G12"/>
				<Subwire fixed="on" width="2">
					<Start x="51.435" y="33.655"/>
					<TrackLine>
						<End x="48.0337" y="31.2354"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="46.99" y="32.7025"/>
						<End x="46.9938" y="30.902"/>
					</TrackArcCW>
					<TrackLine>
						<End x="34.2852" y="30.8755"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.29" y="28.575"/>
						<End x="34.0542" y="30.8634"/>
					</TrackArc>
					<TrackLine>
						<End x="5.8628" y="27.9586"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="31.48"/>
						<End x="5.5" y="27.94"/>
					</TrackArcCW>
					<TrackLine>
						<End x="2" y="27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R1_G15"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="5.715"/>
					<TrackLine>
						<End x="41.275" y="5.715"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R1_G15"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="71.5328" y="16.2469"/>
							<Dot x="71.2459" y="16.3347"/>
							<Dot x="71.0543" y="15.7089"/>
							<Dot x="71.6535" y="15.9723"/>
						</Teardrop>
						<Teardrop>
							<Dot x="67.62" y="11.8476"/>
							<Dot x="67.9069" y="11.7598"/>
							<Dot x="68.0985" y="12.3856"/>
							<Dot x="67.4993" y="12.1222"/>
						</Teardrop>
					</Teardrops>
					<Start x="71.5328" y="16.2469"/>
					<TrackLine>
						<End x="67.62" y="11.8476"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NET00066"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="113.9825" y="-37.1475"/>
							<Dot x="114.2808" y="-37.1148"/>
							<Dot x="114.2093" y="-36.4641"/>
							<Dot x="113.763" y="-36.943"/>
						</Teardrop>
					</Teardrops>
					<Start x="111.5163" y="-20.0354"/>
					<TrackLine>
						<End x="114.9524" y="-33.7291"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="113.9825" y="-33.9725"/>
						<End x="114.9316" y="-34.2875"/>
					</TrackArcCW>
					<TrackLine>
						<End x="113.9825" y="-37.1475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NET00066"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="112.395" y="-16.8275"/>
							<Dot x="112.099" y="-16.8761"/>
							<Dot x="112.2048" y="-17.5219"/>
							<Dot x="112.625" y="-17.0201"/>
						</Teardrop>
					</Teardrops>
					<Start x="112.395" y="-16.8275"/>
					<TrackLine>
						<End x="111.5163" y="-20.0354"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="NET00066"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="110.617" y="-20.0025"/>
							<Dot x="110.7319" y="-20.2796"/>
							<Dot x="111.3365" y="-20.0288"/>
							<Dot x="110.7519" y="-19.7346"/>
						</Teardrop>
					</Teardrops>
					<Start x="110.617" y="-20.0025"/>
					<TrackLine>
						<End x="111.5163" y="-20.0354"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_MV1_G5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="40.3225"/>
							<Dot x="47.2387" y="40.1547"/>
							<Dot x="47.6048" y="40.6973"/>
							<Dot x="46.9547" y="40.6205"/>
						</Teardrop>
						<Teardrop>
							<Dot x="68.7678" y="37.3323"/>
							<Dot x="68.7314" y="37.6301"/>
							<Dot x="68.0817" y="37.5507"/>
							<Dot x="68.566" y="37.1103"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="40.3225"/>
					<TrackLine>
						<End x="50.6539" y="42.5562"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="41.275"/>
						<End x="51.8901" y="42.7048"/>
					</TrackArcCW>
					<TrackLine>
						<End x="68.7678" y="37.3323"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_MV2_G6"/>
				<Subwire fixed="on" width="2">
					<Start x="32.385" y="41.275"/>
					<TrackLine>
						<End x="6.888" y="35.6581"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="6.35" y="38.1"/>
						<End x="6.4617" y="35.602"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.5447" y="35.561"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="36.56"/>
						<End x="5.5" y="35.56"/>
					</TrackArcCW>
					<TrackLine>
						<End x="2" y="35.56"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_MV2_G6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="41.91"/>
							<Dot x="47.2052" y="41.701"/>
							<Dot x="47.6612" y="42.1706"/>
							<Dot x="47.0078" y="42.2094"/>
						</Teardrop>
						<Teardrop>
							<Dot x="74.2372" y="36.689"/>
							<Dot x="74.1983" y="36.9865"/>
							<Dot x="73.5493" y="36.9016"/>
							<Dot x="74.0373" y="36.4653"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="41.91"/>
					<TrackLine>
						<End x="50.6383" y="43.3267"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="41.275"/>
						<End x="52.067" y="43.3833"/>
					</TrackArcCW>
					<TrackLine>
						<End x="69.0551" y="38.2907"/>
					</TrackLine>
					<TrackLine>
						<End x="69.0632" y="38.2882"/>
					</TrackLine>
					<TrackLine>
						<End x="74.2372" y="36.689"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_N20MA_G31"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="9.8425"/>
							<Dot x="47.2387" y="9.6747"/>
							<Dot x="47.6048" y="10.2173"/>
							<Dot x="46.9547" y="10.1405"/>
						</Teardrop>
						<Teardrop>
							<Dot x="76.3478" y="8.4682"/>
							<Dot x="76.2659" y="8.7568"/>
							<Dot x="75.6362" y="8.578"/>
							<Dot x="76.1827" y="8.2178"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="9.8425"/>
					<TrackLine>
						<End x="50.6539" y="12.0762"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="10.795"/>
						<End x="51.6639" y="12.2779"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.3478" y="8.4682"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="97.0306" y="20.5976"/>
							<Dot x="96.9654" y="20.8904"/>
							<Dot x="96.3265" y="20.7481"/>
							<Dot x="96.8514" y="20.357"/>
						</Teardrop>
						<Teardrop>
							<Dot x="87.1275" y="22.714"/>
							<Dot x="87.1927" y="22.4212"/>
							<Dot x="87.8316" y="22.5635"/>
							<Dot x="87.3067" y="22.9546"/>
						</Teardrop>
					</Teardrops>
					<Start x="97.0306" y="20.5976"/>
					<TrackLine>
						<End x="87.1275" y="22.714"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="83.185" y="17.4625"/>
							<Dot x="83.4299" y="17.6357"/>
							<Dot x="83.052" y="18.1701"/>
							<Dot x="82.8939" y="17.5349"/>
						</Teardrop>
						<Teardrop>
							<Dot x="83.185" y="32.0675"/>
							<Dot x="82.9051" y="31.9596"/>
							<Dot x="83.1405" y="31.3489"/>
							<Dot x="83.4495" y="31.9258"/>
						</Teardrop>
					</Teardrops>
					<Start x="83.185" y="17.4625"/>
					<TrackLine>
						<End x="82.6263" y="20.4341"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.098" y="21.2748"/>
						<End x="82.5528" y="21.483"/>
					</TrackArcCW>
					<TrackLine>
						<End x="82.6186" y="22.9206"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.1275" y="22.714"/>
						<End x="82.6242" y="23.0184"/>
					</TrackArcCW>
					<TrackLine>
						<End x="82.6259" y="23.0436"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="23.1775"/>
						<End x="82.6266" y="23.0547"/>
					</TrackArc>
					<TrackLine>
						<End x="83.185" y="32.0675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="83.185" y="2.8575"/>
							<Dot x="83.4577" y="2.9825"/>
							<Dot x="83.185" y="3.5775"/>
							<Dot x="82.9123" y="2.9825"/>
						</Teardrop>
						<Teardrop>
							<Dot x="83.185" y="17.4625"/>
							<Dot x="82.9123" y="17.3375"/>
							<Dot x="83.185" y="16.7425"/>
							<Dot x="83.4577" y="17.3375"/>
						</Teardrop>
					</Teardrops>
					<Start x="83.185" y="2.8575"/>
					<TrackLine>
						<End x="83.185" y="17.4625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="83.185" y="-11.7475"/>
							<Dot x="83.4577" y="-11.6225"/>
							<Dot x="83.185" y="-11.0275"/>
							<Dot x="82.9123" y="-11.6225"/>
						</Teardrop>
						<Teardrop>
							<Dot x="83.185" y="2.8575"/>
							<Dot x="82.9123" y="2.7325"/>
							<Dot x="83.185" y="2.1375"/>
							<Dot x="83.4577" y="2.7325"/>
						</Teardrop>
					</Teardrops>
					<Start x="83.185" y="-11.7475"/>
					<TrackLine>
						<End x="83.185" y="2.8575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="83.185" y="-26.3525"/>
							<Dot x="83.4577" y="-26.2275"/>
							<Dot x="83.185" y="-25.6325"/>
							<Dot x="82.9123" y="-26.2275"/>
						</Teardrop>
						<Teardrop>
							<Dot x="83.185" y="-11.7475"/>
							<Dot x="82.9123" y="-11.8725"/>
							<Dot x="83.185" y="-12.4675"/>
							<Dot x="83.4577" y="-11.8725"/>
						</Teardrop>
					</Teardrops>
					<Start x="83.185" y="-26.3525"/>
					<TrackLine>
						<End x="83.185" y="-11.7475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="82.6642" y="-35.0794"/>
							<Dot x="82.9438" y="-34.9708"/>
							<Dot x="82.7071" y="-34.3607"/>
							<Dot x="82.3994" y="-34.9384"/>
						</Teardrop>
						<Teardrop>
							<Dot x="83.185" y="-26.3525"/>
							<Dot x="82.9054" y="-26.4611"/>
							<Dot x="83.1421" y="-27.0712"/>
							<Dot x="83.4498" y="-26.4935"/>
						</Teardrop>
					</Teardrops>
					<Start x="82.6642" y="-35.0794"/>
					<TrackLine>
						<End x="83.185" y="-26.3525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="85.725" y="-11.7475"/>
							<Dot x="85.9977" y="-11.6225"/>
							<Dot x="85.725" y="-11.0275"/>
							<Dot x="85.4523" y="-11.6225"/>
						</Teardrop>
						<Teardrop>
							<Dot x="85.725" y="2.8575"/>
							<Dot x="85.4523" y="2.7325"/>
							<Dot x="85.725" y="2.1375"/>
							<Dot x="85.9977" y="2.7325"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="-11.7475"/>
					<TrackLine>
						<End x="85.725" y="2.8575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="94.202" y="19.958"/>
							<Dot x="94.1288" y="20.2489"/>
							<Dot x="93.4941" y="20.0892"/>
							<Dot x="94.0294" y="19.7127"/>
						</Teardrop>
						<Teardrop>
							<Dot x="87.098" y="21.2748"/>
							<Dot x="87.1712" y="20.9839"/>
							<Dot x="87.8059" y="21.1436"/>
							<Dot x="87.2706" y="21.5201"/>
						</Teardrop>
					</Teardrops>
					<Start x="94.202" y="19.958"/>
					<TrackLine>
						<End x="87.098" y="21.2748"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="85.725" y="2.8575"/>
							<Dot x="85.9977" y="2.9825"/>
							<Dot x="85.725" y="3.5775"/>
							<Dot x="85.4523" y="2.9825"/>
						</Teardrop>
						<Teardrop>
							<Dot x="85.725" y="17.4625"/>
							<Dot x="85.4523" y="17.3375"/>
							<Dot x="85.725" y="16.7425"/>
							<Dot x="85.9977" y="17.3375"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="2.8575"/>
					<TrackLine>
						<End x="85.725" y="17.4625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="85.725" y="17.4625"/>
							<Dot x="85.9198" y="17.6907"/>
							<Dot x="85.422" y="18.1156"/>
							<Dot x="85.425" y="17.4611"/>
						</Teardrop>
						<Teardrop>
							<Dot x="85.725" y="32.0675"/>
							<Dot x="85.4438" y="31.9628"/>
							<Dot x="85.6721" y="31.3494"/>
							<Dot x="85.9878" y="31.9228"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="17.4625"/>
					<TrackLine>
						<End x="84.5127" y="20.0753"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.098" y="21.2748"/>
						<End x="84.2498" y="21.3765"/>
					</TrackArcCW>
					<TrackLine>
						<End x="84.3012" y="22.815"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.1275" y="22.714"/>
						<End x="84.3422" y="23.2042"/>
					</TrackArcCW>
					<TrackLine>
						<End x="85.5876" y="30.2807"/>
					</TrackLine>
					<TrackArc>
						<Center x="84.455" y="30.48"/>
						<End x="85.6019" y="30.3956"/>
					</TrackArc>
					<TrackLine>
						<End x="85.725" y="32.0675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="85.725" y="-26.3525"/>
							<Dot x="85.9977" y="-26.2275"/>
							<Dot x="85.725" y="-25.6325"/>
							<Dot x="85.4523" y="-26.2275"/>
						</Teardrop>
						<Teardrop>
							<Dot x="85.725" y="-11.7475"/>
							<Dot x="85.4523" y="-11.8725"/>
							<Dot x="85.725" y="-12.4675"/>
							<Dot x="85.9977" y="-11.8725"/>
						</Teardrop>
					</Teardrops>
					<Start x="85.725" y="-26.3525"/>
					<TrackLine>
						<End x="85.725" y="-11.7475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D7"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.1183" y="-35.303"/>
							<Dot x="84.4105" y="-35.2354"/>
							<Dot x="84.263" y="-34.5977"/>
							<Dot x="83.8763" y="-35.1258"/>
						</Teardrop>
						<Teardrop>
							<Dot x="85.725" y="-26.3525"/>
							<Dot x="85.4438" y="-26.4572"/>
							<Dot x="85.6721" y="-27.0706"/>
							<Dot x="85.9878" y="-26.4972"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.1183" y="-35.303"/>
					<TrackLine>
						<End x="85.5815" y="-28.1711"/>
					</TrackLine>
					<TrackArc>
						<Center x="84.455" y="-27.94"/>
						<End x="85.6019" y="-28.0244"/>
					</TrackArc>
					<TrackLine>
						<End x="85.725" y="-26.3525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-MV_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="207" y="-37.7825"/>
					<TrackLine>
						<End x="210.4955" y="-37.7822"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-MV_IN"/>
				<Subwire width="2">
					<Start x="210.4955" y="-37.7822"/>
					<TrackLine>
						<End x="210.5" y="-37.7825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_NXX_G30"/>
				<Subwire fixed="on" width="2">
					<Start x="51.435" y="18.415"/>
					<TrackLine>
						<End x="48.0337" y="15.9954"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="46.99" y="17.4625"/>
						<End x="46.9343" y="15.6629"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.3138" y="16.1156"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="18.415"/>
						<End x="32.2422" y="16.1189"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.5621" y="17.7781"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="16.78"/>
						<End x="5.5" y="17.78"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-V_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="207" y="-44.1325"/>
					<TrackLine>
						<End x="210.5" y="-44.1325"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-V_IN"/>
				<Subwire width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="247.5" y="-35"/>
							<Dot x="246.5326" y="-34.747"/>
							<Dot x="245.9805" y="-36.8577"/>
							<Dot x="247.9398" y="-35.898"/>
						</Teardrop>
						<Teardrop>
							<Dot x="240.03" y="-44.1325"/>
							<Dot x="240.5137" y="-44.259"/>
							<Dot x="240.7898" y="-43.2036"/>
							<Dot x="239.8101" y="-43.6834"/>
						</Teardrop>
					</Teardrops>
					<Start x="247.5" y="-35"/>
					<TrackLine>
						<End x="240.03" y="-44.1325"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="114.6175" y="1.5875"/>
							<Dot x="114.4207" y="2.1011"/>
							<Dot x="113.3934" y="1.7076"/>
							<Dot x="114.3247" y="1.1219"/>
						</Teardrop>
						<Teardrop>
							<Dot x="110.461" y="1.9953"/>
							<Dot x="110.5588" y="1.7117"/>
							<Dot x="111.1776" y="1.925"/>
							<Dot x="110.612" y="2.2545"/>
						</Teardrop>
					</Teardrops>
					<Start x="114.6175" y="1.5875"/>
					<TrackLine>
						<End x="110.461" y="1.9953"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V"/>
				<Subwire width="0.8">
					<Start x="2" y="-33.02"/>
					<TrackLine>
						<End x="5.1" y="-33.62"/>
					</TrackLine>
					<TrackLine>
						<End x="5.5" y="-33.62"/>
					</TrackLine>
					<TrackLine>
						<End x="5.578" y="-33.6358"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="-34.02"/>
						<End x="5.7125" y="-33.6906"/>
					</TrackArcCW>
					<TrackArc>
						<Center x="6.35" y="-32.7025"/>
						<End x="6.3915" y="-33.8777"/>
					</TrackArc>
					<TrackLine>
						<End x="12.7" y="-33.655"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_V_OLD_G9"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="32.7025"/>
							<Dot x="47.2387" y="32.5347"/>
							<Dot x="47.6048" y="33.0773"/>
							<Dot x="46.9547" y="33.0005"/>
						</Teardrop>
						<Teardrop>
							<Dot x="67.9829" y="28.8688"/>
							<Dot x="67.9646" y="29.1683"/>
							<Dot x="67.3113" y="29.1283"/>
							<Dot x="67.768" y="28.6595"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="32.7025"/>
					<TrackLine>
						<End x="50.6539" y="34.9362"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="33.655"/>
						<End x="51.9759" y="35.0546"/>
					</TrackArcCW>
					<TrackLine>
						<End x="67.9829" y="28.8688"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+V_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="207" y="-40.9575"/>
					<TrackLine>
						<End x="210.4955" y="-40.9572"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+V_IN"/>
				<Subwire width="2">
					<Start x="210.4955" y="-40.9572"/>
					<TrackLine>
						<End x="210.5" y="-40.9575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-I_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="207" y="-14.9225"/>
					<TrackLine>
						<End x="210.496" y="-14.9227"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-I_IN"/>
				<Subwire fixed="on" width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="240" y="-14.9225"/>
							<Dot x="240.2083" y="-15.377"/>
							<Dot x="241.2" y="-14.9225"/>
							<Dot x="240.2083" y="-14.468"/>
						</Teardrop>
					</Teardrops>
					<Start x="242" y="-14.9225"/>
					<TrackLine>
						<End x="240" y="-14.9225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-I_IN"/>
				<Subwire width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="252.5" y="-15"/>
							<Dot x="251.698" y="-14.4027"/>
							<Dot x="250.3947" y="-16.1523"/>
							<Dot x="252.571" y="-15.9975"/>
						</Teardrop>
					</Teardrops>
					<Start x="252.5" y="-15"/>
					<TrackLine>
						<End x="248.6525" y="-17.1058"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="247.5" y="-15"/>
						<End x="246.4221" y="-17.1449"/>
					</TrackArcCW>
					<TrackLine>
						<End x="242" y="-14.9225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-I_IN"/>
				<Subwire width="2">
					<Start x="210.496" y="-14.9227"/>
					<TrackLine>
						<End x="210.5" y="-14.9225"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GNDD"/>
				<Subwire fixed="on" width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="113.9825" y="-33.9725"/>
							<Dot x="113.7979" y="-33.7361"/>
							<Dot x="113.282" y="-34.1388"/>
							<Dot x="113.9239" y="-34.2667"/>
						</Teardrop>
					</Teardrops>
					<Start x="2" y="-20.32"/>
					<TrackLine>
						<End x="5.3" y="-19.955"/>
					</TrackLine>
					<TrackLine>
						<End x="5.5" y="-19.955"/>
					</TrackLine>
					<TrackLine>
						<End x="6.35" y="-19.955"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="6.35" y="-20.955"/>
						<End x="6.9799" y="-20.1783"/>
					</TrackArcCW>
					<TrackLine>
						<End x="22.3758" y="-32.6652"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="20.9267" y="-34.4519"/>
						<End x="22.5665" y="-32.8384"/>
					</TrackArcCW>
					<TrackLine>
						<End x="22.8249" y="-33.101"/>
					</TrackLine>
					<TrackLine>
						<End x="22.8254" y="-33.1016"/>
					</TrackLine>
					<TrackLine>
						<End x="23.1199" y="-33.4011"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="21.4796" y="-35.014"/>
						<End x="23.1444" y="-33.4263"/>
					</TrackArcCW>
					<TrackLine>
						<End x="29.5626" y="-40.1565"/>
					</TrackLine>
					<TrackArc>
						<Center x="32.385" y="-37.465"/>
						<End x="32.3188" y="-41.3644"/>
					</TrackArc>
					<TrackLine>
						<End x="76.8502" y="-42.1209"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.9224" y="-37.8715"/>
						<End x="77.085" y="-42.1184"/>
					</TrackArc>
					<TrackLine>
						<End x="78.7043" y="-42.0564"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.469" y="-35.9109"/>
						<End x="79.157" y="-42.0223"/>
					</TrackArc>
					<TrackLine>
						<End x="80.5609" y="-41.8642"/>
					</TrackLine>
					<TrackArc>
						<Center x="79.9094" y="-36.0779"/>
						<End x="81.2546" y="-41.7433"/>
					</TrackArc>
					<TrackLine>
						<End x="113.9825" y="-33.9725"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+5V_RS232"/>
				<Subwire fixed="on" width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="6.35" y="-20.955"/>
							<Dot x="6.2797" y="-21.2467"/>
							<Dot x="6.916" y="-21.4"/>
							<Dot x="6.6169" y="-20.8179"/>
						</Teardrop>
						<Teardrop>
							<Dot x="112.0775" y="-39.37"/>
							<Dot x="111.9254" y="-39.1114"/>
							<Dot x="111.3612" y="-39.443"/>
							<Dot x="111.9808" y="-39.654"/>
						</Teardrop>
					</Teardrops>
					<Start x="6.35" y="-20.955"/>
					<TrackLine>
						<End x="21.9159" y="-33.1937"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="20.9267" y="-34.4519"/>
						<End x="22.0675" y="-33.3293"/>
					</TrackArcCW>
					<TrackLine>
						<End x="22.3259" y="-33.5919"/>
					</TrackLine>
					<TrackLine>
						<End x="22.3263" y="-33.5923"/>
					</TrackLine>
					<TrackLine>
						<End x="22.6208" y="-33.8918"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="21.4796" y="-35.014"/>
						<End x="22.6379" y="-33.9094"/>
					</TrackArcCW>
					<TrackLine>
						<End x="29.0561" y="-40.6396"/>
					</TrackLine>
					<TrackArc>
						<Center x="32.385" y="-37.465"/>
						<End x="32.3069" y="-42.0643"/>
					</TrackArc>
					<TrackLine>
						<End x="76.8383" y="-42.8208"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.9224" y="-37.8715"/>
						<End x="77.1118" y="-42.8179"/>
					</TrackArc>
					<TrackLine>
						<End x="78.731" y="-42.7559"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.469" y="-35.9109"/>
						<End x="79.1638" y="-42.7256"/>
					</TrackArc>
					<TrackLine>
						<End x="112.0775" y="-39.37"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_MV_TC_G7"/>
				<Subwire fixed="on" width="2">
					<Start x="41.275" y="36.195"/>
					<TrackLine>
						<End x="34.29" y="36.195"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+I_IN"/>
				<Subwire fixed="on" width="2">
					<Start x="207" y="-12.065"/>
					<TrackLine>
						<End x="210.4975" y="-12.0651"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+I_IN"/>
				<Subwire fixed="on" width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="240" y="-12.065"/>
							<Dot x="240.2083" y="-12.5195"/>
							<Dot x="241.2" y="-12.065"/>
							<Dot x="240.2083" y="-11.6105"/>
						</Teardrop>
					</Teardrops>
					<Start x="240" y="-12.065"/>
					<TrackLine>
						<End x="242" y="-12.065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+I_IN"/>
				<Subwire width="1">
					<Teardrops>
						<Teardrop>
							<Dot x="247.5" y="-15"/>
							<Dot x="247.5604" y="-14.0018"/>
							<Dot x="245.3826" y="-13.8701"/>
							<Dot x="246.7044" y="-15.6058"/>
						</Teardrop>
					</Teardrops>
					<Start x="242" y="-12.065"/>
					<TrackLine>
						<End x="247.5" y="-15"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+I_IN"/>
				<Subwire width="2">
					<Start x="210.4975" y="-12.0651"/>
					<TrackLine>
						<End x="210.5" y="-12.065"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-MV_MID"/>
				<Subwire width="0.8">
					<Start x="172.2233" y="-28.8271"/>
					<TrackLine>
						<End x="169.2415" y="-25.7711"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-V_MID"/>
				<Subwire width="0.8">
					<Start x="169.2942" y="-38.5181"/>
					<TrackLine>
						<End x="172.2233" y="-41.5285"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="1.27"/>
							<Dot x="87.9885" y="1.1535"/>
							<Dot x="88.2428" y="0.5503"/>
							<Dot x="88.5337" y="1.1367"/>
						</Teardrop>
						<Teardrop>
							<Dot x="88.265" y="-13.335"/>
							<Dot x="88.4881" y="-13.1345"/>
							<Dot x="88.0506" y="-12.6477"/>
							<Dot x="87.9675" y="-13.2969"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="1.27"/>
					<TrackLine>
						<End x="87.861" y="-11.8273"/>
					</TrackLine>
					<TrackArc>
						<Center x="89.0105" y="-11.8628"/>
						<End x="87.9126" y="-12.2052"/>
					</TrackArc>
					<TrackLine>
						<End x="88.265" y="-13.335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="-13.335"/>
							<Dot x="87.9883" y="-13.4509"/>
							<Dot x="88.2412" y="-14.0546"/>
							<Dot x="88.5335" y="-13.4689"/>
						</Teardrop>
						<Teardrop>
							<Dot x="88.265" y="-27.94"/>
							<Dot x="88.4818" y="-27.7326"/>
							<Dot x="88.0292" y="-27.2597"/>
							<Dot x="87.9664" y="-27.9112"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="-13.335"/>
					<TrackLine>
						<End x="87.8305" y="-26.4529"/>
					</TrackLine>
					<TrackArc>
						<Center x="88.9799" y="-26.491"/>
						<End x="87.8933" y="-26.8676"/>
					</TrackArc>
					<TrackLine>
						<End x="88.265" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="15.875"/>
							<Dot x="87.9842" y="15.7696"/>
							<Dot x="88.2141" y="15.1568"/>
							<Dot x="88.5282" y="15.731"/>
						</Teardrop>
						<Teardrop>
							<Dot x="88.265" y="1.27"/>
							<Dot x="88.5306" y="1.4093"/>
							<Dot x="88.2266" y="1.989"/>
							<Dot x="87.986" y="1.3803"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="15.875"/>
					<TrackLine>
						<End x="87.8634" y="10.2078"/>
					</TrackLine>
					<TrackArc>
						<Center x="89.0105" y="10.1265"/>
						<End x="87.8616" y="10.0758"/>
					</TrackArc>
					<TrackLine>
						<End x="88.1777" y="2.9062"/>
					</TrackLine>
					<TrackArc>
						<Center x="89.3266" y="2.9569"/>
						<End x="88.1782" y="2.8956"/>
					</TrackArc>
					<TrackLine>
						<End x="88.265" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="30.48"/>
							<Dot x="87.9679" y="30.4387"/>
							<Dot x="88.058" y="29.7904"/>
							<Dot x="88.4903" y="30.2819"/>
						</Teardrop>
						<Teardrop>
							<Dot x="88.265" y="15.875"/>
							<Dot x="88.4728" y="16.0914"/>
							<Dot x="88.0007" y="16.5447"/>
							<Dot x="87.9654" y="15.8912"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="30.48"/>
					<TrackLine>
						<End x="86.033" y="23.0424"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.1275" y="22.714"/>
						<End x="85.9852" y="22.7432"/>
					</TrackArc>
					<TrackLine>
						<End x="85.9484" y="21.3042"/>
					</TrackLine>
					<TrackArc>
						<Center x="87.098" y="21.2748"/>
						<End x="86.1145" y="20.6788"/>
					</TrackArc>
					<TrackLine>
						<End x="87.4354" y="18.499"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="85.725" y="17.4625"/>
						<End x="87.6844" y="17.8632"/>
					</TrackArcCW>
					<TrackLine>
						<End x="87.8838" y="16.8883"/>
					</TrackLine>
					<TrackArc>
						<Center x="89.0105" y="17.1187"/>
						<End x="87.9408" y="16.6966"/>
					</TrackArc>
					<TrackLine>
						<End x="88.265" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="117.475" y="16.383"/>
							<Dot x="117.4256" y="16.9308"/>
							<Dot x="116.3299" y="16.832"/>
							<Dot x="117.0664" y="16.0148"/>
						</Teardrop>
						<Teardrop>
							<Dot x="88.265" y="30.48"/>
							<Dot x="88.2568" y="30.1801"/>
							<Dot x="88.911" y="30.1621"/>
							<Dot x="88.4976" y="30.6695"/>
						</Teardrop>
					</Teardrops>
					<Start x="117.475" y="16.383"/>
					<TrackLine>
						<End x="111.7083" y="18.6439"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="112.1235" y="19.7028"/>
						<End x="111.2533" y="18.9704"/>
					</TrackArcCW>
					<TrackLine>
						<End x="111.2395" y="18.9867"/>
					</TrackLine>
					<TrackArc>
						<Center x="109.7287" y="17.7152"/>
						<End x="110.6007" y="19.4869"/>
					</TrackArc>
					<TrackLine>
						<End x="88.265" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="MCLR"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.265" y="30.48"/>
							<Dot x="88.4728" y="30.6964"/>
							<Dot x="88.0007" y="31.1497"/>
							<Dot x="87.9654" y="30.4962"/>
						</Teardrop>
						<Teardrop>
							<Dot x="88.265" y="45.085"/>
							<Dot x="87.9901" y="44.9649"/>
							<Dot x="88.2521" y="44.3651"/>
							<Dot x="88.5355" y="44.9551"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.265" y="30.48"/>
					<TrackLine>
						<End x="87.9408" y="31.3016"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="89.0105" y="31.7237"/>
						<End x="87.8616" y="31.7729"/>
					</TrackArcCW>
					<TrackLine>
						<End x="88.1439" y="38.3683"/>
					</TrackLine>
					<TrackArc>
						<Center x="86.995" y="38.4175"/>
						<End x="88.1448" y="38.3968"/>
					</TrackArc>
					<TrackLine>
						<End x="88.265" y="45.085"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="-I_MID"/>
				<Subwire width="0.8">
					<Start x="169.4157" y="-13.2599"/>
					<TrackLine>
						<End x="172.2234" y="-16.1308"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R4W_G24"/>
				<Subwire fixed="on" width="2">
					<Start x="51.435" y="-4.445"/>
					<TrackLine>
						<End x="48.0337" y="-6.8646"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="46.99" y="-5.3975"/>
						<End x="46.9343" y="-7.1971"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.3138" y="-6.7444"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="-4.445"/>
						<End x="31.6196" y="-6.6144"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.8327" y="2.483"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="1.54"/>
						<End x="5.5" y="2.54"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="2.54"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R8_G22"/>
				<Subwire fixed="on" width="2">
					<Start x="32.385" y="-4.445"/>
					<TrackLine>
						<End x="5.8359" y="5.0219"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="4.08"/>
						<End x="5.5" y="5.08"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="5.08"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R8_G22"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-3.81"/>
							<Dot x="47.2052" y="-4.019"/>
							<Dot x="47.6612" y="-3.5494"/>
							<Dot x="47.0078" y="-3.5106"/>
						</Teardrop>
						<Teardrop>
							<Dot x="74.2516" y="-7.605"/>
							<Dot x="74.1955" y="-7.3103"/>
							<Dot x="73.5526" y="-7.4325"/>
							<Dot x="74.0649" y="-7.8399"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="-3.81"/>
					<TrackLine>
						<End x="50.6383" y="-2.3933"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="-4.445"/>
						<End x="51.9401" y="-2.3027"/>
					</TrackArcCW>
					<TrackLine>
						<End x="70.4457" y="-6.6659"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="70.2161" y="-7.6397"/>
						<End x="70.4558" y="-6.6683"/>
					</TrackArcCW>
					<TrackLine>
						<End x="74.2516" y="-7.605"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_N0R_G25"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="20.955"/>
					<TrackLine>
						<End x="41.275" y="20.955"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R3W_G23"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="-9.525"/>
					<TrackLine>
						<End x="41.275" y="-9.525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_V_NEW_G8"/>
				<Subwire fixed="on" width="2">
					<Start x="51.435" y="41.275"/>
					<TrackLine>
						<End x="48.0337" y="38.8554"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="46.99" y="40.3225"/>
						<End x="46.9938" y="38.522"/>
					</TrackArcCW>
					<TrackLine>
						<End x="34.2852" y="38.4955"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.29" y="36.195"/>
						<End x="33.8556" y="38.4541"/>
					</TrackArc>
					<TrackLine>
						<End x="5.6888" y="33.038"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="34.02"/>
						<End x="5.5" y="33.02"/>
					</TrackArcCW>
					<TrackLine>
						<End x="2" y="33.02"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="USBDP"/>
				<Subwire fixed="on" width="0.3">
					<Teardrops>
						<Teardrop>
							<Dot x="98.425" y="-30.7975"/>
							<Dot x="98.2955" y="-30.6451"/>
							<Dot x="97.963" y="-30.9277"/>
							<Dot x="98.3941" y="-30.9951"/>
						</Teardrop>
					</Teardrops>
					<Start x="98.425" y="-30.7975"/>
					<TrackLine>
						<End x="96.9998" y="-31.199"/>
					</TrackLine>
					<TrackArc>
						<Center x="97.155" y="-31.75"/>
						<End x="96.6787" y="-32.0675"/>
					</TrackArc>
					<TrackLine>
						<End x="96.6788" y="-32.0675"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="96.2025" y="-32.385"/>
						<End x="95.7842" y="-32.7757"/>
					</TrackArcCW>
					<TrackLine>
						<End x="95.3508" y="-32.3118"/>
					</TrackLine>
					<TrackArc>
						<Center x="94.9325" y="-32.7025"/>
						<End x="94.615" y="-33.1788"/>
					</TrackArc>
					<TrackLine>
						<End x="94.615" y="-33.1787"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="94.2975" y="-33.655"/>
						<End x="94.5428" y="-34.1722"/>
					</TrackArcCW>
					<TrackLine>
						<End x="93.8037" y="-34.5228"/>
					</TrackLine>
					<TrackLine>
						<End x="93.5386" y="-34.6518"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="USBDP"/>
				<Subwire fixed="on" width="0.3">
					<Start x="7.4066" y="-18.8051"/>
					<TrackLine>
						<End x="6.915" y="-18.2392"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="USBDP"/>
				<Subwire width="0.3">
					<Start x="6.915" y="-18.2392"/>
					<TrackLine>
						<End x="6.9094" y="-18.233"/>
					</TrackLine>
					<TrackArc>
						<Center x="6.35" y="-18.7325"/>
						<End x="6.35" y="-17.9825"/>
					</TrackArc>
					<TrackLine>
						<End x="5.5" y="-17.9825"/>
					</TrackLine>
					<TrackLine>
						<End x="5.35" y="-17.9825"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-17.78"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+MV"/>
				<Subwire fixed="on" width="0.8">
					<Start x="0" y="-27.94"/>
					<TrackLine>
						<End x="1.9278" y="-28.3131"/>
					</TrackLine>
					<TrackLine>
						<End x="3.1" y="-28.54"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+MV"/>
				<Subwire fixed="on" width="0.8">
					<Start x="165.522" y="-32.91"/>
					<TrackLine>
						<End x="156.9432" y="-45.237"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="153.9875" y="-43.18"/>
						<End x="153.9875" y="-46.781"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.1625" y="-46.781"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="30.1625" y="-43.18"/>
						<End x="27.2178" y="-45.2526"/>
					</TrackArcCW>
					<TrackLine>
						<End x="20.7247" y="-36.0274"/>
					</TrackLine>
					<TrackArc>
						<Center x="17.78" y="-38.1"/>
						<End x="19.901" y="-35.1899"/>
					</TrackArc>
					<TrackLine>
						<End x="14.4676" y="-31.2298"/>
					</TrackLine>
					<TrackArc>
						<Center x="12.7" y="-33.655"/>
						<End x="13.5085" y="-30.765"/>
					</TrackArc>
					<TrackLine>
						<End x="5.6078" y="-28.5548"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-28.94"/>
						<End x="5.5" y="-28.54"/>
					</TrackArc>
					<TrackLine>
						<End x="5.1" y="-28.54"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_MA_G10"/>
				<Subwire fixed="on" width="2">
					<Start x="32.385" y="33.655"/>
					<TrackLine>
						<End x="5.9144" y="30.5205"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="34.02"/>
						<End x="5.8961" y="30.5184"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.6124" y="30.4863"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="5.5" y="31.48"/>
						<End x="5.5" y="30.48"/>
					</TrackArcCW>
					<TrackLine>
						<End x="2" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_MA_G10"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="34.29"/>
							<Dot x="47.2052" y="34.081"/>
							<Dot x="47.6612" y="34.5506"/>
							<Dot x="47.0078" y="34.5894"/>
						</Teardrop>
						<Teardrop>
							<Dot x="72.0212" y="28.3081"/>
							<Dot x="72.008" y="28.6078"/>
							<Dot x="71.3541" y="28.5791"/>
							<Dot x="71.8028" y="28.1024"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="34.29"/>
					<TrackLine>
						<End x="50.6383" y="35.7067"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="33.655"/>
						<End x="52.1924" y="35.7216"/>
					</TrackArcCW>
					<TrackLine>
						<End x="68.3272" y="29.8082"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="67.9829" y="28.8688"/>
						<End x="68.3595" y="29.7957"/>
					</TrackArcCW>
					<TrackLine>
						<End x="72.0212" y="28.3081"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_RESERVE3_G13"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="25.0825"/>
							<Dot x="47.2387" y="24.9147"/>
							<Dot x="47.6048" y="25.4573"/>
							<Dot x="46.9547" y="25.3805"/>
						</Teardrop>
						<Teardrop>
							<Dot x="74.6393" y="19.989"/>
							<Dot x="74.6056" y="20.2871"/>
							<Dot x="73.9553" y="20.2138"/>
							<Dot x="74.4354" y="19.7689"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="25.0825"/>
					<TrackLine>
						<End x="50.6539" y="27.3162"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="26.035"/>
						<End x="51.9035" y="27.4605"/>
					</TrackArcCW>
					<TrackLine>
						<End x="74.6393" y="19.989"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R2_G16"/>
				<Subwire fixed="on" width="2">
					<Start x="51.435" y="10.795"/>
					<TrackLine>
						<End x="48.0337" y="8.3754"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="46.99" y="9.8425"/>
						<End x="46.9343" y="8.0429"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.3138" y="8.4956"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="10.795"/>
						<End x="32.0261" y="8.5227"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.656" y="12.6878"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="11.7"/>
						<End x="5.5" y="12.7"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="12.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R2_G16"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="66.386" y="13.3168"/>
							<Dot x="66.662" y="13.1994"/>
							<Dot x="66.9183" y="13.8016"/>
							<Dot x="66.2948" y="13.6026"/>
						</Teardrop>
						<Teardrop>
							<Dot x="70.5057" y="17.0687"/>
							<Dot x="70.2297" y="17.1861"/>
							<Dot x="69.9734" y="16.5839"/>
							<Dot x="70.5969" y="16.7829"/>
						</Teardrop>
					</Teardrops>
					<Start x="66.386" y="13.3168"/>
					<TrackLine>
						<End x="70.5057" y="17.0687"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R3_G17"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="2.2225"/>
							<Dot x="47.2387" y="2.0547"/>
							<Dot x="47.6048" y="2.5973"/>
							<Dot x="46.9547" y="2.5205"/>
						</Teardrop>
						<Teardrop>
							<Dot x="73.3722" y="-2.6064"/>
							<Dot x="73.3135" y="-2.3122"/>
							<Dot x="72.6716" y="-2.4403"/>
							<Dot x="73.1877" y="-2.843"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="2.2225"/>
					<TrackLine>
						<End x="50.6539" y="4.4562"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="3.175"/>
						<End x="51.9252" y="4.5932"/>
					</TrackArcCW>
					<TrackLine>
						<End x="71.3614" y="-2.1246"/>
					</TrackLine>
					<TrackArc>
						<Center x="71.6882" y="-1.179"/>
						<End x="71.4574" y="-2.1525"/>
					</TrackArc>
					<TrackLine>
						<End x="73.3722" y="-2.6064"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R4_G18"/>
				<Subwire fixed="on" width="2">
					<Start x="32.385" y="3.175"/>
					<TrackLine>
						<End x="5.7526" y="10.1276"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="9.16"/>
						<End x="5.5" y="10.16"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="10.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R4_G18"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="3.81"/>
							<Dot x="47.2052" y="3.601"/>
							<Dot x="47.6612" y="4.0706"/>
							<Dot x="47.0078" y="4.1094"/>
						</Teardrop>
						<Teardrop>
							<Dot x="71.6882" y="-1.179"/>
							<Dot x="71.6548" y="-0.8809"/>
							<Dot x="71.0043" y="-0.9537"/>
							<Dot x="71.4842" y="-1.3989"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="3.81"/>
					<TrackLine>
						<End x="50.6383" y="5.2267"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="3.175"/>
						<End x="52.1236" y="5.2655"/>
					</TrackArcCW>
					<TrackLine>
						<End x="71.6882" y="-1.179"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R5_G19"/>
				<Subwire fixed="on" width="2">
					<Start x="34.29" y="-1.905"/>
					<TrackLine>
						<End x="41.275" y="-1.905"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R6_G20"/>
				<Subwire fixed="on" width="2">
					<Start x="51.435" y="3.175"/>
					<TrackLine>
						<End x="48.0337" y="0.7554"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="46.99" y="2.2225"/>
						<End x="46.9343" y="0.4229"/>
					</TrackArcCW>
					<TrackLine>
						<End x="32.3138" y="0.8756"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="32.385" y="3.175"/>
						<End x="31.8169" y="0.9457"/>
					</TrackArcCW>
					<TrackLine>
						<End x="5.7469" y="7.589"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="6.62"/>
						<End x="5.5" y="7.62"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="7.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="0" y="-30.48"/>
					<TrackLine>
						<End x="3.1" y="-31.08"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+V"/>
				<Subwire fixed="on" width="0.8">
					<Start x="166.1707" y="-44.0098"/>
					<TrackLine>
						<End x="155.5711" y="-47.7128"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="153.9875" y="-43.18"/>
						<End x="153.9875" y="-47.9815"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.1625" y="-47.9815"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="30.1625" y="-43.18"/>
						<End x="26.236" y="-45.9436"/>
					</TrackArcCW>
					<TrackLine>
						<End x="19.743" y="-36.7184"/>
					</TrackLine>
					<TrackArc>
						<Center x="17.78" y="-38.1"/>
						<End x="19.1939" y="-36.1601"/>
					</TrackArc>
					<TrackLine>
						<End x="13.7605" y="-32.2"/>
					</TrackLine>
					<TrackArc>
						<Center x="12.7" y="-33.655"/>
						<End x="12.9671" y="-31.8744"/>
					</TrackArc>
					<TrackLine>
						<End x="6.6171" y="-30.9219"/>
					</TrackLine>
					<TrackArc>
						<Center x="6.35" y="-32.7025"/>
						<End x="6.35" y="-30.902"/>
					</TrackArc>
					<TrackLine>
						<End x="5.5" y="-30.902"/>
					</TrackLine>
					<TrackLine>
						<End x="5.1" y="-30.902"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_R7_G21"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-5.3975"/>
							<Dot x="47.2387" y="-5.5653"/>
							<Dot x="47.6048" y="-5.0227"/>
							<Dot x="46.9547" y="-5.0995"/>
						</Teardrop>
						<Teardrop>
							<Dot x="70.2161" y="-7.6397"/>
							<Dot x="70.1617" y="-7.3447"/>
							<Dot x="69.518" y="-7.4634"/>
							<Dot x="70.0281" y="-7.8735"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="-5.3975"/>
					<TrackLine>
						<End x="50.6539" y="-3.1638"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="-4.445"/>
						<End x="51.8024" y="-2.9902"/>
					</TrackArcCW>
					<TrackLine>
						<End x="70.2161" y="-7.6397"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_N5MA_G32"/>
				<Subwire fixed="on" width="2">
					<Start x="32.385" y="10.795"/>
					<TrackLine>
						<End x="5.6636" y="15.2265"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="14.24"/>
						<End x="5.5" y="15.24"/>
					</TrackArc>
					<TrackLine>
						<End x="2" y="15.24"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="REL_N5MA_G32"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="11.43"/>
							<Dot x="47.2052" y="11.221"/>
							<Dot x="47.6612" y="11.6906"/>
							<Dot x="47.0078" y="11.7294"/>
						</Teardrop>
						<Teardrop>
							<Dot x="75.2252" y="9.6613"/>
							<Dot x="75.1395" y="9.9488"/>
							<Dot x="74.5123" y="9.7619"/>
							<Dot x="75.0633" y="9.4088"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="11.43"/>
					<TrackLine>
						<End x="50.6383" y="12.8467"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="10.795"/>
						<End x="51.7425" y="12.9744"/>
					</TrackArcCW>
					<TrackLine>
						<End x="75.2252" y="9.6613"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+I"/>
				<Subwire fixed="on" width="0.8">
					<Start x="0" y="-25.4"/>
					<TrackLine>
						<End x="3.1" y="-26"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="+I"/>
				<Subwire fixed="on" width="0.8">
					<Start x="165.522" y="-20.21"/>
					<TrackLine>
						<End x="156.2239" y="-44.0522"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="153.9875" y="-43.18"/>
						<End x="153.9875" y="-45.5805"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.1625" y="-45.5805"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="30.1625" y="-43.18"/>
						<End x="28.1995" y="-44.5616"/>
					</TrackArcCW>
					<TrackLine>
						<End x="21.7065" y="-35.3364"/>
					</TrackLine>
					<TrackArc>
						<Center x="17.78" y="-38.1"/>
						<End x="20.6081" y="-34.2198"/>
					</TrackArc>
					<TrackLine>
						<End x="15.1747" y="-30.2596"/>
					</TrackLine>
					<TrackArc>
						<Center x="12.7" y="-33.655"/>
						<End x="14.3675" y="-29.7986"/>
					</TrackArc>
					<TrackLine>
						<End x="5.6588" y="-26.0329"/>
					</TrackLine>
					<TrackArc>
						<Center x="5.5" y="-26.4"/>
						<End x="5.5" y="-26"/>
					</TrackArc>
					<TrackLine>
						<End x="5.1" y="-26"/>
					</TrackLine>
					<TrackLine>
						<End x="2" y="-25.4"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="-13.335"/>
							<Dot x="81.6423" y="-13.46"/>
							<Dot x="81.915" y="-14.055"/>
							<Dot x="82.1877" y="-13.46"/>
						</Teardrop>
						<Teardrop>
							<Dot x="81.915" y="-27.94"/>
							<Dot x="82.1877" y="-27.815"/>
							<Dot x="81.915" y="-27.22"/>
							<Dot x="81.6423" y="-27.815"/>
						</Teardrop>
					</Teardrops>
					<Start x="81.915" y="-13.335"/>
					<TrackLine>
						<End x="81.915" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="30.48"/>
							<Dot x="82.1877" y="30.605"/>
							<Dot x="81.915" y="31.2"/>
							<Dot x="81.6423" y="30.605"/>
						</Teardrop>
						<Teardrop>
							<Dot x="81.915" y="39.0525"/>
							<Dot x="81.6423" y="38.9275"/>
							<Dot x="81.915" y="38.3325"/>
							<Dot x="82.1877" y="38.9275"/>
						</Teardrop>
					</Teardrops>
					<Start x="81.915" y="30.48"/>
					<TrackLine>
						<End x="81.915" y="39.0525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="39.0525"/>
							<Dot x="82.1562" y="39.231"/>
							<Dot x="81.7667" y="39.7571"/>
							<Dot x="81.6224" y="39.1186"/>
						</Teardrop>
						<Teardrop>
							<Dot x="80.645" y="45.085"/>
							<Dot x="80.4038" y="44.9065"/>
							<Dot x="80.7933" y="44.3804"/>
							<Dot x="80.9376" y="45.0189"/>
						</Teardrop>
					</Teardrops>
					<Start x="81.915" y="39.0525"/>
					<TrackLine>
						<End x="80.645" y="45.085"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="-13.335"/>
							<Dot x="82.1877" y="-13.21"/>
							<Dot x="81.915" y="-12.615"/>
							<Dot x="81.6423" y="-13.21"/>
						</Teardrop>
						<Teardrop>
							<Dot x="81.915" y="1.27"/>
							<Dot x="81.6423" y="1.145"/>
							<Dot x="81.915" y="0.55"/>
							<Dot x="82.1877" y="1.145"/>
						</Teardrop>
					</Teardrops>
					<Start x="81.915" y="-13.335"/>
					<TrackLine>
						<End x="81.915" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="15.875"/>
							<Dot x="82.1824" y="16.0111"/>
							<Dot x="81.8855" y="16.5944"/>
							<Dot x="81.6374" y="15.9887"/>
						</Teardrop>
						<Teardrop>
							<Dot x="81.915" y="30.48"/>
							<Dot x="81.6401" y="30.3597"/>
							<Dot x="81.9025" y="29.7601"/>
							<Dot x="82.1855" y="30.3503"/>
						</Teardrop>
					</Teardrops>
					<Start x="81.915" y="15.875"/>
					<TrackLine>
						<End x="81.7025" y="21.0534"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.098" y="21.2748"/>
						<End x="81.705" y="21.5493"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.7781" y="22.9863"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.1275" y="22.714"/>
						<End x="81.7834" y="23.0752"/>
					</TrackArcCW>
					<TrackLine>
						<End x="81.7851" y="23.1004"/>
					</TrackLine>
					<TrackArc>
						<Center x="80.645" y="23.1775"/>
						<End x="81.7875" y="23.1576"/>
					</TrackArc>
					<TrackLine>
						<End x="81.915" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="81.915" y="1.27"/>
							<Dot x="82.1877" y="1.395"/>
							<Dot x="81.915" y="1.99"/>
							<Dot x="81.6423" y="1.395"/>
						</Teardrop>
						<Teardrop>
							<Dot x="81.915" y="15.875"/>
							<Dot x="81.6423" y="15.75"/>
							<Dot x="81.915" y="15.155"/>
							<Dot x="82.1877" y="15.75"/>
						</Teardrop>
					</Teardrops>
					<Start x="81.915" y="1.27"/>
					<TrackLine>
						<End x="81.915" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="1.27"/>
							<Dot x="79.1023" y="1.145"/>
							<Dot x="79.375" y="0.55"/>
							<Dot x="79.6477" y="1.145"/>
						</Teardrop>
						<Teardrop>
							<Dot x="79.375" y="-13.335"/>
							<Dot x="79.6477" y="-13.21"/>
							<Dot x="79.375" y="-12.615"/>
							<Dot x="79.1023" y="-13.21"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="1.27"/>
					<TrackLine>
						<End x="79.375" y="-13.335"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="15.875"/>
							<Dot x="79.1172" y="15.7215"/>
							<Dot x="79.452" y="15.1591"/>
							<Dot x="79.6596" y="15.7799"/>
						</Teardrop>
						<Teardrop>
							<Dot x="79.375" y="1.27"/>
							<Dot x="79.6558" y="1.3756"/>
							<Dot x="79.4254" y="1.9882"/>
							<Dot x="79.1118" y="1.4138"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="15.875"/>
					<TrackLine>
						<End x="79.9764" y="10.2858"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="77.9879" y="10.0718"/>
						<End x="79.983" y="9.9318"/>
					</TrackArcCW>
					<TrackLine>
						<End x="79.375" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="-13.335"/>
							<Dot x="79.1023" y="-13.46"/>
							<Dot x="79.375" y="-14.055"/>
							<Dot x="79.6477" y="-13.46"/>
						</Teardrop>
						<Teardrop>
							<Dot x="79.375" y="-27.94"/>
							<Dot x="79.6477" y="-27.815"/>
							<Dot x="79.375" y="-27.22"/>
							<Dot x="79.1023" y="-27.815"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="-13.335"/>
					<TrackLine>
						<End x="79.375" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="39.37"/>
							<Dot x="79.6477" y="39.495"/>
							<Dot x="79.375" y="40.09"/>
							<Dot x="79.1023" y="39.495"/>
						</Teardrop>
						<Teardrop>
							<Dot x="79.375" y="45.085"/>
							<Dot x="79.1023" y="44.96"/>
							<Dot x="79.375" y="44.365"/>
							<Dot x="79.6477" y="44.96"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="39.37"/>
					<TrackLine>
						<End x="79.375" y="45.085"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="39.37"/>
							<Dot x="79.1023" y="39.245"/>
							<Dot x="79.375" y="38.65"/>
							<Dot x="79.6477" y="39.245"/>
						</Teardrop>
						<Teardrop>
							<Dot x="79.375" y="30.48"/>
							<Dot x="79.6477" y="30.605"/>
							<Dot x="79.375" y="31.2"/>
							<Dot x="79.1023" y="30.605"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="39.37"/>
					<TrackLine>
						<End x="79.375" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.375" y="30.48"/>
							<Dot x="79.1023" y="30.355"/>
							<Dot x="79.375" y="29.76"/>
							<Dot x="79.6477" y="30.355"/>
						</Teardrop>
						<Teardrop>
							<Dot x="79.375" y="15.875"/>
							<Dot x="79.6477" y="16"/>
							<Dot x="79.375" y="16.595"/>
							<Dot x="79.1023" y="16"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.375" y="30.48"/>
					<TrackLine>
						<End x="79.375" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.469" y="-35.9109"/>
							<Dot x="78.7367" y="-35.7756"/>
							<Dot x="78.4416" y="-35.1914"/>
							<Dot x="78.1917" y="-35.7964"/>
						</Teardrop>
						<Teardrop>
							<Dot x="78.105" y="-26.3525"/>
							<Dot x="77.8373" y="-26.4878"/>
							<Dot x="78.1324" y="-27.072"/>
							<Dot x="78.3823" y="-26.467"/>
						</Teardrop>
					</Teardrops>
					<Start x="78.469" y="-35.9109"/>
					<TrackLine>
						<End x="78.105" y="-26.3525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.105" y="-11.7475"/>
							<Dot x="78.3777" y="-11.6225"/>
							<Dot x="78.105" y="-11.0275"/>
							<Dot x="77.8323" y="-11.6225"/>
						</Teardrop>
						<Teardrop>
							<Dot x="78.105" y="2.8575"/>
							<Dot x="77.8323" y="2.7325"/>
							<Dot x="78.105" y="2.1375"/>
							<Dot x="78.3777" y="2.7325"/>
						</Teardrop>
					</Teardrops>
					<Start x="78.105" y="-11.7475"/>
					<TrackLine>
						<End x="78.105" y="2.8575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.105" y="-26.3525"/>
							<Dot x="78.3777" y="-26.2275"/>
							<Dot x="78.105" y="-25.6325"/>
							<Dot x="77.8323" y="-26.2275"/>
						</Teardrop>
						<Teardrop>
							<Dot x="78.105" y="-11.7475"/>
							<Dot x="77.8323" y="-11.8725"/>
							<Dot x="78.105" y="-12.4675"/>
							<Dot x="78.3777" y="-11.8725"/>
						</Teardrop>
					</Teardrops>
					<Start x="78.105" y="-26.3525"/>
					<TrackLine>
						<End x="78.105" y="-11.7475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="96.0021" y="23.2701"/>
							<Dot x="95.9601" y="23.5672"/>
							<Dot x="95.312" y="23.4755"/>
							<Dot x="95.8045" y="23.0444"/>
						</Teardrop>
						<Teardrop>
							<Dot x="88.6796" y="25.4491"/>
							<Dot x="88.7216" y="25.152"/>
							<Dot x="89.3697" y="25.2437"/>
							<Dot x="88.8772" y="25.6748"/>
						</Teardrop>
					</Teardrops>
					<Start x="96.0021" y="23.2701"/>
					<TrackLine>
						<End x="88.6796" y="25.4491"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.105" y="17.4625"/>
							<Dot x="78.3777" y="17.5875"/>
							<Dot x="78.105" y="18.1825"/>
							<Dot x="77.8323" y="17.5875"/>
						</Teardrop>
						<Teardrop>
							<Dot x="78.105" y="23.8125"/>
							<Dot x="77.8323" y="23.6875"/>
							<Dot x="78.105" y="23.0925"/>
							<Dot x="78.3777" y="23.6875"/>
						</Teardrop>
					</Teardrops>
					<Start x="78.105" y="17.4625"/>
					<TrackLine>
						<End x="78.105" y="23.8125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.105" y="23.8125"/>
							<Dot x="78.3777" y="23.9375"/>
							<Dot x="78.105" y="24.5325"/>
							<Dot x="77.8323" y="23.9375"/>
						</Teardrop>
						<Teardrop>
							<Dot x="78.105" y="32.0675"/>
							<Dot x="77.8323" y="31.9425"/>
							<Dot x="78.105" y="31.3475"/>
							<Dot x="78.3777" y="31.9425"/>
						</Teardrop>
					</Teardrops>
					<Start x="78.105" y="23.8125"/>
					<TrackLine>
						<End x="78.105" y="32.0675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="78.105" y="2.8575"/>
							<Dot x="78.3937" y="2.939"/>
							<Dot x="78.2158" y="3.5689"/>
							<Dot x="77.8547" y="3.023"/>
						</Teardrop>
						<Teardrop>
							<Dot x="78.105" y="17.4625"/>
							<Dot x="77.8422" y="17.3178"/>
							<Dot x="78.1579" y="16.7444"/>
							<Dot x="78.3862" y="17.3578"/>
						</Teardrop>
					</Teardrops>
					<Start x="78.105" y="2.8575"/>
					<TrackLine>
						<End x="78.9168" y="8.0679"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.3478" y="8.4682"/>
						<End x="78.9314" y="8.1767"/>
					</TrackArc>
					<TrackLine>
						<End x="79.1307" y="9.9429"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.9879" y="10.0718"/>
						<End x="79.123" y="10.2563"/>
					</TrackArc>
					<TrackLine>
						<End x="78.2399" y="15.6905"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="79.375" y="15.875"/>
						<End x="78.2281" y="15.7906"/>
					</TrackArcCW>
					<TrackLine>
						<End x="78.105" y="17.4625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="17.4625"/>
							<Dot x="80.9177" y="17.5875"/>
							<Dot x="80.645" y="18.1825"/>
							<Dot x="80.3723" y="17.5875"/>
						</Teardrop>
						<Teardrop>
							<Dot x="80.645" y="23.1775"/>
							<Dot x="80.3723" y="23.0525"/>
							<Dot x="80.645" y="22.4575"/>
							<Dot x="80.9177" y="23.0525"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="17.4625"/>
					<TrackLine>
						<End x="80.645" y="23.1775"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="2.8575"/>
							<Dot x="80.921" y="2.9751"/>
							<Dot x="80.6644" y="3.5772"/>
							<Dot x="80.3758" y="2.9897"/>
						</Teardrop>
						<Teardrop>
							<Dot x="80.645" y="17.4625"/>
							<Dot x="80.3757" y="17.3303"/>
							<Dot x="80.6639" y="16.7427"/>
							<Dot x="80.9209" y="17.3447"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="2.8575"/>
					<TrackLine>
						<End x="80.8369" y="9.9952"/>
					</TrackLine>
					<TrackArc>
						<Center x="77.9879" y="10.0718"/>
						<End x="80.8369" y="10.1465"/>
					</TrackArc>
					<TrackLine>
						<End x="80.645" y="17.4625"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="-11.7475"/>
							<Dot x="80.9177" y="-11.6225"/>
							<Dot x="80.645" y="-11.0275"/>
							<Dot x="80.3723" y="-11.6225"/>
						</Teardrop>
						<Teardrop>
							<Dot x="80.645" y="2.8575"/>
							<Dot x="80.3723" y="2.7325"/>
							<Dot x="80.645" y="2.1375"/>
							<Dot x="80.9177" y="2.7325"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="-11.7475"/>
					<TrackLine>
						<End x="80.645" y="2.8575"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="23.1775"/>
							<Dot x="80.9177" y="23.3025"/>
							<Dot x="80.645" y="23.8975"/>
							<Dot x="80.3723" y="23.3025"/>
						</Teardrop>
						<Teardrop>
							<Dot x="80.645" y="32.0675"/>
							<Dot x="80.3723" y="31.9425"/>
							<Dot x="80.645" y="31.3475"/>
							<Dot x="80.9177" y="31.9425"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="23.1775"/>
					<TrackLine>
						<End x="80.645" y="32.0675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="79.9094" y="-36.0779"/>
							<Dot x="80.1908" y="-35.974"/>
							<Dot x="79.964" y="-35.36"/>
							<Dot x="79.647" y="-35.9326"/>
						</Teardrop>
						<Teardrop>
							<Dot x="80.645" y="-26.3525"/>
							<Dot x="80.3638" y="-26.4572"/>
							<Dot x="80.5921" y="-27.0706"/>
							<Dot x="80.9078" y="-26.4972"/>
						</Teardrop>
					</Teardrops>
					<Start x="79.9094" y="-36.0779"/>
					<TrackLine>
						<End x="80.5217" y="-28.0272"/>
					</TrackLine>
					<TrackLine>
						<End x="80.5219" y="-28.0244"/>
					</TrackLine>
					<TrackLine>
						<End x="80.645" y="-26.3525"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="80.645" y="-26.3525"/>
							<Dot x="80.9177" y="-26.2275"/>
							<Dot x="80.645" y="-25.6325"/>
							<Dot x="80.3723" y="-26.2275"/>
						</Teardrop>
						<Teardrop>
							<Dot x="80.645" y="-11.7475"/>
							<Dot x="80.3723" y="-11.8725"/>
							<Dot x="80.645" y="-12.4675"/>
							<Dot x="80.9177" y="-11.8725"/>
						</Teardrop>
					</Teardrops>
					<Start x="80.645" y="-26.3525"/>
					<TrackLine>
						<End x="80.645" y="-11.7475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="93.8135" y="22.6855"/>
							<Dot x="93.7662" y="22.9818"/>
							<Dot x="93.1198" y="22.8784"/>
							<Dot x="93.62" y="22.4562"/>
						</Teardrop>
						<Teardrop>
							<Dot x="88.9993" y="24.0243"/>
							<Dot x="89.0466" y="23.728"/>
							<Dot x="89.693" y="23.8314"/>
							<Dot x="89.1928" y="24.2536"/>
						</Teardrop>
					</Teardrops>
					<Start x="93.8135" y="22.6855"/>
					<TrackLine>
						<End x="88.9993" y="24.0243"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="STR1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="112.1235" y="19.7028"/>
							<Dot x="112.1384" y="20.0025"/>
							<Dot x="111.4847" y="20.035"/>
							<Dot x="111.8868" y="19.5185"/>
						</Teardrop>
						<Teardrop>
							<Dot x="89.0105" y="31.7237"/>
							<Dot x="88.9956" y="31.424"/>
							<Dot x="89.6493" y="31.3915"/>
							<Dot x="89.2472" y="31.908"/>
						</Teardrop>
					</Teardrops>
					<Start x="112.1235" y="19.7028"/>
					<TrackLine>
						<End x="89.0105" y="31.7237"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="STR2"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="107.2433" y="16.4594"/>
							<Dot x="107.1282" y="16.7364"/>
							<Dot x="106.5238" y="16.4854"/>
							<Dot x="107.1086" y="16.1914"/>
						</Teardrop>
						<Teardrop>
							<Dot x="89.0105" y="17.1187"/>
							<Dot x="89.1256" y="16.8417"/>
							<Dot x="89.73" y="17.0927"/>
							<Dot x="89.1452" y="17.3867"/>
						</Teardrop>
					</Teardrops>
					<Start x="107.2433" y="16.4594"/>
					<TrackLine>
						<End x="89.0105" y="17.1187"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="STR3"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="89.0105" y="-11.8628"/>
							<Dot x="89.3045" y="-11.9224"/>
							<Dot x="89.4345" y="-11.2809"/>
							<Dot x="88.8637" y="-11.6012"/>
						</Teardrop>
						<Teardrop>
							<Dot x="109.2243" y="15.6301"/>
							<Dot x="108.9307" y="15.6915"/>
							<Dot x="108.7967" y="15.0508"/>
							<Dot x="109.3695" y="15.3675"/>
						</Teardrop>
					</Teardrops>
					<Start x="89.0105" y="-11.8628"/>
					<TrackLine>
						<End x="95.2732" y="-3.2679"/>
					</TrackLine>
					<TrackLine>
						<End x="95.2774" y="-3.2621"/>
					</TrackLine>
					<TrackLine>
						<End x="109.2243" y="15.6301"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="STR4"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="89.3266" y="2.9569"/>
							<Dot x="89.6001" y="2.8337"/>
							<Dot x="89.8689" y="3.4305"/>
							<Dot x="89.2413" y="3.2445"/>
						</Teardrop>
						<Teardrop>
							<Dot x="103.5118" y="15.346"/>
							<Dot x="103.2383" y="15.4692"/>
							<Dot x="102.9695" y="14.8724"/>
							<Dot x="103.5971" y="15.0584"/>
						</Teardrop>
					</Teardrops>
					<Start x="89.3266" y="2.9569"/>
					<TrackLine>
						<End x="103.5118" y="15.346"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="STR5"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="88.9799" y="-26.491"/>
							<Dot x="89.2791" y="-26.4695"/>
							<Dot x="89.2324" y="-25.8167"/>
							<Dot x="88.7683" y="-26.2783"/>
						</Teardrop>
						<Teardrop>
							<Dot x="96.1636" y="-7.3057"/>
							<Dot x="95.8644" y="-7.3272"/>
							<Dot x="95.9111" y="-7.98"/>
							<Dot x="96.3752" y="-7.5184"/>
						</Teardrop>
					</Teardrops>
					<Start x="88.9799" y="-26.491"/>
					<TrackLine>
						<End x="96.1636" y="-7.3057"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="STR6"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="76.9224" y="-37.8715"/>
							<Dot x="77.1001" y="-38.1131"/>
							<Dot x="77.6274" y="-37.7254"/>
							<Dot x="76.9895" y="-37.5791"/>
						</Teardrop>
						<Teardrop>
							<Dot x="97.995" y="-8.1703"/>
							<Dot x="97.6951" y="-8.179"/>
							<Dot x="97.714" y="-8.8332"/>
							<Dot x="98.1973" y="-8.3918"/>
						</Teardrop>
					</Teardrops>
					<Start x="76.9224" y="-37.8715"/>
					<TrackLine>
						<End x="80.1428" y="-37.204"/>
					</TrackLine>
					<TrackArc>
						<Center x="79.9094" y="-36.0779"/>
						<End x="80.3756" y="-37.1292"/>
					</TrackArc>
					<TrackLine>
						<End x="81.0722" y="-36.8202"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="81.5384" y="-37.8715"/>
						<End x="81.4244" y="-36.7272"/>
					</TrackArcCW>
					<TrackLine>
						<End x="84.2323" y="-36.4473"/>
					</TrackLine>
					<TrackArc>
						<Center x="84.1183" y="-35.303"/>
						<End x="85.1203" y="-35.8673"/>
					</TrackArc>
					<TrackLine>
						<End x="89.267" y="-28.5043"/>
					</TrackLine>
					<TrackArc>
						<Center x="88.265" y="-27.94"/>
						<End x="89.2963" y="-28.4488"/>
					</TrackArc>
					<TrackLine>
						<End x="90.0112" y="-26.9998"/>
					</TrackLine>
					<TrackArc>
						<Center x="88.9799" y="-26.491"/>
						<End x="90.0387" y="-26.9398"/>
					</TrackArc>
					<TrackLine>
						<End x="97.995" y="-8.1703"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="38.735"/>
							<Dot x="84.7277" y="38.86"/>
							<Dot x="84.455" y="39.455"/>
							<Dot x="84.1823" y="38.86"/>
						</Teardrop>
						<Teardrop>
							<Dot x="84.455" y="45.085"/>
							<Dot x="84.1823" y="44.96"/>
							<Dot x="84.455" y="44.365"/>
							<Dot x="84.7277" y="44.96"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="38.735"/>
					<TrackLine>
						<End x="84.455" y="45.085"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="-13.335"/>
							<Dot x="84.1823" y="-13.46"/>
							<Dot x="84.455" y="-14.055"/>
							<Dot x="84.7277" y="-13.46"/>
						</Teardrop>
						<Teardrop>
							<Dot x="84.455" y="-27.94"/>
							<Dot x="84.7277" y="-27.815"/>
							<Dot x="84.455" y="-27.22"/>
							<Dot x="84.1823" y="-27.815"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="-13.335"/>
					<TrackLine>
						<End x="84.455" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="15.875"/>
							<Dot x="84.7178" y="16.0197"/>
							<Dot x="84.4021" y="16.5931"/>
							<Dot x="84.1738" y="15.9797"/>
						</Teardrop>
						<Teardrop>
							<Dot x="84.455" y="30.48"/>
							<Dot x="84.1683" y="30.392"/>
							<Dot x="84.3603" y="29.7663"/>
							<Dot x="84.7089" y="30.3202"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="15.875"/>
					<TrackLine>
						<End x="84.3319" y="17.5469"/>
					</TrackLine>
					<TrackArc>
						<Center x="83.185" y="17.4625"/>
						<End x="84.2856" y="17.7958"/>
					</TrackArc>
					<TrackLine>
						<End x="83.5568" y="20.2024"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.098" y="21.2748"/>
						<End x="83.4011" y="21.4254"/>
					</TrackArcCW>
					<TrackLine>
						<End x="83.4596" y="22.8634"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.1275" y="22.714"/>
						<End x="83.4885" y="23.1969"/>
					</TrackArcCW>
					<TrackLine>
						<End x="84.455" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="1.27"/>
							<Dot x="84.7277" y="1.395"/>
							<Dot x="84.455" y="1.99"/>
							<Dot x="84.1823" y="1.395"/>
						</Teardrop>
						<Teardrop>
							<Dot x="84.455" y="15.875"/>
							<Dot x="84.1823" y="15.75"/>
							<Dot x="84.455" y="15.155"/>
							<Dot x="84.7277" y="15.75"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="1.27"/>
					<TrackLine>
						<End x="84.455" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="-13.335"/>
							<Dot x="84.7277" y="-13.21"/>
							<Dot x="84.455" y="-12.615"/>
							<Dot x="84.1823" y="-13.21"/>
						</Teardrop>
						<Teardrop>
							<Dot x="84.455" y="1.27"/>
							<Dot x="84.1823" y="1.145"/>
							<Dot x="84.455" y="0.55"/>
							<Dot x="84.7277" y="1.145"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="-13.335"/>
					<TrackLine>
						<End x="84.455" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D1"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="84.455" y="30.48"/>
							<Dot x="84.7277" y="30.605"/>
							<Dot x="84.455" y="31.2"/>
							<Dot x="84.1823" y="30.605"/>
						</Teardrop>
						<Teardrop>
							<Dot x="84.455" y="38.735"/>
							<Dot x="84.1823" y="38.61"/>
							<Dot x="84.455" y="38.015"/>
							<Dot x="84.7277" y="38.61"/>
						</Teardrop>
					</Teardrops>
					<Start x="84.455" y="30.48"/>
					<TrackLine>
						<End x="84.455" y="38.735"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="15.875"/>
							<Dot x="87.2578" y="16.0197"/>
							<Dot x="86.9421" y="16.5931"/>
							<Dot x="86.7138" y="15.9797"/>
						</Teardrop>
						<Teardrop>
							<Dot x="86.995" y="30.48"/>
							<Dot x="86.7003" y="30.4238"/>
							<Dot x="86.8229" y="29.7809"/>
							<Dot x="87.2299" y="30.2934"/>
						</Teardrop>
					</Teardrops>
					<Start x="86.995" y="15.875"/>
					<TrackLine>
						<End x="86.8719" y="17.5469"/>
					</TrackLine>
					<TrackArc>
						<Center x="85.725" y="17.4625"/>
						<End x="86.7085" y="18.0585"/>
					</TrackArc>
					<TrackLine>
						<End x="85.3876" y="20.2383"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.098" y="21.2748"/>
						<End x="85.0989" y="21.3361"/>
					</TrackArcCW>
					<TrackLine>
						<End x="85.143" y="22.7748"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="87.1275" y="22.714"/>
						<End x="85.1997" y="23.1887"/>
					</TrackArcCW>
					<TrackLine>
						<End x="86.995" y="30.48"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="-13.335"/>
							<Dot x="87.2677" y="-13.21"/>
							<Dot x="86.995" y="-12.615"/>
							<Dot x="86.7223" y="-13.21"/>
						</Teardrop>
						<Teardrop>
							<Dot x="86.995" y="1.27"/>
							<Dot x="86.7223" y="1.145"/>
							<Dot x="86.995" y="0.55"/>
							<Dot x="87.2677" y="1.145"/>
						</Teardrop>
					</Teardrops>
					<Start x="86.995" y="-13.335"/>
					<TrackLine>
						<End x="86.995" y="1.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="-13.335"/>
							<Dot x="86.7222" y="-13.4597"/>
							<Dot x="86.9942" y="-14.055"/>
							<Dot x="87.2676" y="-13.4603"/>
						</Teardrop>
						<Teardrop>
							<Dot x="86.995" y="-27.94"/>
							<Dot x="87.2664" y="-27.8121"/>
							<Dot x="86.9874" y="-27.22"/>
							<Dot x="86.721" y="-27.8179"/>
						</Teardrop>
					</Teardrops>
					<Start x="86.995" y="-13.335"/>
					<TrackLine>
						<End x="86.9799" y="-26.4887"/>
					</TrackLine>
					<TrackArc>
						<Center x="88.9799" y="-26.491"/>
						<End x="86.98" y="-26.512"/>
					</TrackArc>
					<TrackLine>
						<End x="86.995" y="-27.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="30.48"/>
							<Dot x="87.2677" y="30.605"/>
							<Dot x="86.995" y="31.2"/>
							<Dot x="86.7223" y="30.605"/>
						</Teardrop>
						<Teardrop>
							<Dot x="86.995" y="38.4175"/>
							<Dot x="86.7223" y="38.2925"/>
							<Dot x="86.995" y="37.6975"/>
							<Dot x="87.2677" y="38.2925"/>
						</Teardrop>
					</Teardrops>
					<Start x="86.995" y="30.48"/>
					<TrackLine>
						<End x="86.995" y="38.4175"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="1.27"/>
							<Dot x="87.2677" y="1.395"/>
							<Dot x="86.995" y="1.99"/>
							<Dot x="86.7223" y="1.395"/>
						</Teardrop>
						<Teardrop>
							<Dot x="86.995" y="15.875"/>
							<Dot x="86.7223" y="15.75"/>
							<Dot x="86.995" y="15.155"/>
							<Dot x="87.2677" y="15.75"/>
						</Teardrop>
					</Teardrops>
					<Start x="86.995" y="1.27"/>
					<TrackLine>
						<End x="86.995" y="15.875"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="D0"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="86.995" y="38.4175"/>
							<Dot x="87.2395" y="38.5913"/>
							<Dot x="86.8603" y="39.1248"/>
							<Dot x="86.7037" y="38.4893"/>
						</Teardrop>
						<Teardrop>
							<Dot x="85.725" y="45.085"/>
							<Dot x="85.4805" y="44.9112"/>
							<Dot x="85.8597" y="44.3777"/>
							<Dot x="86.0163" y="45.0132"/>
						</Teardrop>
					</Teardrops>
					<Start x="86.995" y="38.4175"/>
					<TrackLine>
						<End x="85.725" y="45.085"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G46"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-34.29"/>
							<Dot x="47.2209" y="-34.4815"/>
							<Dot x="47.6388" y="-33.9777"/>
							<Dot x="46.9843" y="-33.9901"/>
						</Teardrop>
						<Teardrop>
							<Dot x="81.5384" y="-37.8715"/>
							<Dot x="81.3493" y="-37.6385"/>
							<Dot x="80.8411" y="-38.0509"/>
							<Dot x="81.4853" y="-38.1667"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="-34.29"/>
					<TrackLine>
						<End x="50.3507" y="-32.6724"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="-34.925"/>
						<End x="51.9311" y="-32.4747"/>
					</TrackArcCW>
					<TrackLine>
						<End x="69.4432" y="-36.0204"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="69.215" y="-37.1475"/>
						<End x="69.6579" y="-36.0862"/>
					</TrackArcCW>
					<TrackLine>
						<End x="76.4795" y="-38.9328"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.9224" y="-37.8715"/>
						<End x="77.2089" y="-38.9852"/>
					</TrackArc>
					<TrackLine>
						<End x="81.5384" y="-37.8715"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="G45"/>
				<Subwire width="0.4">
					<Teardrops>
						<Teardrop>
							<Dot x="46.99" y="-35.8775"/>
							<Dot x="47.2444" y="-36.0364"/>
							<Dot x="47.5912" y="-35.4814"/>
							<Dot x="46.9444" y="-35.581"/>
						</Teardrop>
						<Teardrop>
							<Dot x="69.215" y="-37.1475"/>
							<Dot x="69.1515" y="-36.8542"/>
							<Dot x="68.5118" y="-36.9928"/>
							<Dot x="69.0343" y="-37.387"/>
						</Teardrop>
					</Teardrops>
					<Start x="46.99" y="-35.8775"/>
					<TrackLine>
						<End x="50.5273" y="-33.5471"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="51.435" y="-34.925"/>
						<End x="51.7896" y="-33.3135"/>
					</TrackArcCW>
					<TrackLine>
						<End x="69.215" y="-37.1475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SCL"/>
				<Subwire width="0.3" zipwireRef="zwire_0">
					<Start x="14.6328" y="-36.8464"/>
					<TrackLine>
						<End x="14.9826" y="-38.6442"/>
					</TrackLine>
					<TrackArc>
						<Center x="17.78" y="-38.1"/>
						<End x="17.4249" y="-40.9276"/>
					</TrackArc>
					<TrackLine>
						<End x="31.7245" y="-42.7236"/>
					</TrackLine>
					<TrackArc>
						<Center x="32.385" y="-37.465"/>
						<End x="32.3338" y="-42.7647"/>
					</TrackArc>
					<TrackLine>
						<End x="33.9945" y="-42.7808"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-38.481"/>
						<End x="34.0306" y="-42.781"/>
					</TrackArc>
					<TrackLine>
						<End x="111.5656" y="-42.8796"/>
					</TrackLine>
					<TrackLine>
						<End x="114.6175" y="-42.8796"/>
					</TrackLine>
					<TrackArc>
						<Center x="114.6175" y="-39.9796"/>
						<End x="117.416" y="-40.7403"/>
					</TrackArc>
					<TrackLine>
						<End x="132.7136" y="15.5393"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDA"/>
				<Subwire width="0.3" zipwireRef="zwire_0">
					<Start x="14.0438" y="-36.961"/>
					<TrackLine>
						<End x="14.3936" y="-38.7588"/>
					</TrackLine>
					<TrackArc>
						<Center x="17.78" y="-38.1"/>
						<End x="17.3501" y="-41.523"/>
					</TrackArc>
					<TrackLine>
						<End x="31.6497" y="-43.319"/>
					</TrackLine>
					<TrackArc>
						<Center x="32.385" y="-37.465"/>
						<End x="32.328" y="-43.3647"/>
					</TrackArc>
					<TrackLine>
						<End x="33.9887" y="-43.3808"/>
					</TrackLine>
					<TrackArc>
						<Center x="34.036" y="-38.481"/>
						<End x="34.0298" y="-43.381"/>
					</TrackArc>
					<TrackLine>
						<End x="111.5648" y="-43.4796"/>
					</TrackLine>
					<TrackLine>
						<End x="111.5656" y="-43.4796"/>
					</TrackLine>
					<TrackLine>
						<End x="114.6175" y="-43.4796"/>
					</TrackLine>
					<TrackArc>
						<Center x="114.6175" y="-39.9796"/>
						<End x="117.995" y="-40.8977"/>
					</TrackArc>
					<TrackLine>
						<End x="133.2926" y="15.3819"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SDA"/>
				<Subwire width="0.3" zipwireRef="zwire_1">
					<Start x="12.6318" y="-36.3177"/>
					<TrackLine>
						<End x="7.0125" y="-36.1611"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="SCL"/>
				<Subwire width="0.3" zipwireRef="zwire_1">
					<Start x="12.6486" y="-35.7179"/>
					<TrackLine>
						<End x="7.0293" y="-35.5613"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="USBDP"/>
				<Subwire fixed="on" width="0.3" zipwireRef="zwire_2">
					<Start x="7.4066" y="-18.8051"/>
					<TrackLine>
						<End x="23.1748" y="-31.7038"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="20.9267" y="-34.4519"/>
						<End x="23.4574" y="-31.9617"/>
					</TrackArcCW>
					<TrackLine>
						<End x="23.7162" y="-32.2247"/>
					</TrackLine>
					<TrackLine>
						<End x="23.7163" y="-32.2248"/>
					</TrackLine>
					<TrackLine>
						<End x="24.0112" y="-32.5247"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="21.4796" y="-35.014"/>
						<End x="24.049" y="-32.5637"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.4672" y="-39.2939"/>
					</TrackLine>
					<TrackArc>
						<Center x="32.385" y="-37.465"/>
						<End x="32.34" y="-40.1146"/>
					</TrackArc>
					<TrackLine>
						<End x="76.8715" y="-40.871"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.9224" y="-37.8715"/>
						<End x="77.0371" y="-40.8693"/>
					</TrackArc>
					<TrackLine>
						<End x="78.6564" y="-40.8073"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.469" y="-35.9109"/>
						<End x="79.0172" y="-40.7802"/>
					</TrackArc>
					<TrackLine>
						<End x="80.421" y="-40.6221"/>
					</TrackLine>
					<TrackArc>
						<Center x="79.9094" y="-36.0779"/>
						<End x="81.8757" y="-40.2065"/>
					</TrackArc>
					<TrackLine>
						<End x="93.5335" y="-34.6542"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="USBDM"/>
				<Subwire fixed="on" width="0.3" zipwireRef="zwire_2">
					<Start x="7.0268" y="-19.2695"/>
					<TrackLine>
						<End x="22.7948" y="-32.1682"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="20.9267" y="-34.4519"/>
						<End x="23.0298" y="-32.3825"/>
					</TrackArcCW>
					<TrackLine>
						<End x="23.2885" y="-32.6455"/>
					</TrackLine>
					<TrackLine>
						<End x="23.5834" y="-32.9453"/>
					</TrackLine>
					<TrackArcCW>
						<Center x="21.4796" y="-35.014"/>
						<End x="23.6148" y="-32.9777"/>
					</TrackArcCW>
					<TrackLine>
						<End x="30.033" y="-39.7079"/>
					</TrackLine>
					<TrackArc>
						<Center x="32.385" y="-37.465"/>
						<End x="32.3298" y="-40.7146"/>
					</TrackArc>
					<TrackLine>
						<End x="76.8613" y="-41.471"/>
					</TrackLine>
					<TrackArc>
						<Center x="76.9224" y="-37.8715"/>
						<End x="77.0601" y="-41.4689"/>
					</TrackArc>
					<TrackLine>
						<End x="78.6794" y="-41.4069"/>
					</TrackLine>
					<TrackArc>
						<Center x="78.469" y="-35.9109"/>
						<End x="79.0844" y="-41.3764"/>
					</TrackArc>
					<TrackLine>
						<End x="80.4882" y="-41.2183"/>
					</TrackLine>
					<TrackArc>
						<Center x="79.9094" y="-36.0779"/>
						<End x="82.1337" y="-40.7481"/>
					</TrackArc>
					<TrackLine>
						<End x="93.7915" y="-35.1958"/>
					</TrackLine>
				</Subwire>
			</Wire>
		</Wires>
		<Coppers>
			<Copper priority="50" backoff="1"
			 lineWidth="0.4" lineClr="0.8" minSquare="0.01" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledRect>
						<Dot x="207.5" y="32.5"/>
						<Dot x="243.5" y="17.5"/>
					</FilledRect>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="210.048" y="29"/>
							<SegmentLine>
								<End x="210.048" y="32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="207.5" y="32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="207.5" y="17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="21"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="21.1872"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.3128" y="21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.5" y="21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="211.75" y="21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="212.8933" y="21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="214.548" y="22.2794"/>
							</SegmentLine>
							<SegmentLine>
								<End x="214.548" y="27.7207"/>
							</SegmentLine>
							<SegmentLine>
								<End x="212.8933" y="28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.5" y="28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.3128" y="28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="28.8128"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="29"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
					<Island>
						<FilledContour>
							<Start x="236.952" y="17.5"/>
							<SegmentLine>
								<End x="243.5" y="17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="243.5" y="32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="236.952" y="32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="236.952" y="17.5"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" backoff="1"
			 lineWidth="0.4" lineClr="0.8" minSquare="0.01" state="Poured">
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledRect>
						<Dot x="207.5" y="32.5"/>
						<Dot x="243.5" y="17.5"/>
					</FilledRect>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="210.048" y="29"/>
							<SegmentLine>
								<End x="210.048" y="32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="207.5" y="32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="207.5" y="17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="21"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="21.1872"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.3128" y="21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.5" y="21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="211.75" y="21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="212.8933" y="21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="214.548" y="22.2794"/>
							</SegmentLine>
							<SegmentLine>
								<End x="214.548" y="27.7207"/>
							</SegmentLine>
							<SegmentLine>
								<End x="212.8933" y="28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.5" y="28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.3128" y="28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="28.8128"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="29"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
					<Island>
						<FilledContour>
							<Start x="236.952" y="17.5"/>
							<SegmentLine>
								<End x="243.5" y="17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="243.5" y="32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="236.952" y="32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="236.952" y="17.5"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" backoff="1"
			 lineWidth="0.4" lineClr="0.8" minSquare="0.01" state="Poured">
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledRect>
						<Dot x="207.5" y="-17.5"/>
						<Dot x="243.5" y="-32.5"/>
					</FilledRect>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="210.048" y="-32.2263"/>
							<SegmentLine>
								<End x="210.048" y="-29"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="-28.8128"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.3128" y="-28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.5" y="-28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="211.75" y="-28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="212.8933" y="-28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="214.548" y="-27.7206"/>
							</SegmentLine>
							<SegmentLine>
								<End x="214.548" y="-22.2793"/>
							</SegmentLine>
							<SegmentLine>
								<End x="212.8933" y="-21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.5" y="-21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.3128" y="-21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="-21.1872"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="-21"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="-17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="207.5" y="-17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="207.5" y="-32.2263"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="-32.2263"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
					<Island>
						<FilledContour>
							<Start x="243.5" y="-17.751"/>
							<SegmentLine>
								<End x="242.9933" y="-17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="236.952" y="-17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="236.952" y="-32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="236.9906" y="-32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="237.6513" y="-32.2263"/>
							</SegmentLine>
							<SegmentLine>
								<End x="239.5563" y="-32.2263"/>
							</SegmentLine>
							<SegmentLine>
								<End x="240.5037" y="-32.2263"/>
							</SegmentLine>
							<SegmentLine>
								<End x="242.4087" y="-32.2263"/>
							</SegmentLine>
							<SegmentLine>
								<End x="243.0694" y="-32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="243.5" y="-32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="243.5" y="-17.751"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" backoff="1"
			 lineWidth="0.4" lineClr="0.8" minSquare="0.01" state="Poured">
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<ThermalPad/>
				<ThermalVia/>
				<Shape>
					<FilledRect>
						<Dot x="207.5" y="-17.5"/>
						<Dot x="243.5" y="-32.5"/>
					</FilledRect>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="210.048" y="-32.2263"/>
							<SegmentLine>
								<End x="210.048" y="-29"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="-28.8128"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.3128" y="-28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.5" y="-28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="211.75" y="-28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="212.8933" y="-28.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="214.548" y="-27.7206"/>
							</SegmentLine>
							<SegmentLine>
								<End x="214.548" y="-22.2793"/>
							</SegmentLine>
							<SegmentLine>
								<End x="212.8933" y="-21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.5" y="-21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.3128" y="-21.452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="-21.1872"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="-21"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="-17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="207.5" y="-17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="207.5" y="-32.2263"/>
							</SegmentLine>
							<SegmentLine>
								<End x="210.048" y="-32.2263"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
					<Island>
						<FilledContour>
							<Start x="241.0777" y="-32.4045"/>
							<SegmentLine>
								<End x="242.8492" y="-31.9097"/>
							</SegmentLine>
							<SegmentLine>
								<End x="243.5" y="-31.7254"/>
							</SegmentLine>
							<SegmentLine>
								<End x="243.5" y="-17.7356"/>
							</SegmentLine>
							<SegmentLine>
								<End x="243.3846" y="-17.6776"/>
							</SegmentLine>
							<SegmentLine>
								<End x="243.0312" y="-17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="236.952" y="-17.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="236.952" y="-32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="239.1991" y="-32.5"/>
							</SegmentLine>
							<SegmentLine>
								<End x="239.3235" y="-32.4097"/>
							</SegmentLine>
							<SegmentLine>
								<End x="240.0354" y="-32.2391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="241.0777" y="-32.4045"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
		</Coppers>
		<NonfilledCoppers>
			<NonfilledCopper lineWidth="0.4">
				<LayerRef name="Top"/>
				<Shape>
					<Circle diameter="5.4">
						<Center x="166.5" y="42.5"/>
					</Circle>
				</Shape>
			</NonfilledCopper>
			<NonfilledCopper lineWidth="0.4">
				<LayerRef name="Top"/>
				<Shape>
					<Circle diameter="5.4">
						<Center x="173" y="42.5"/>
					</Circle>
				</Shape>
			</NonfilledCopper>
			<NonfilledCopper lineWidth="0.4">
				<LayerRef name="Top"/>
				<Shape>
					<Circle diameter="5.4">
						<Center x="246.5" y="12.028"/>
					</Circle>
				</Shape>
			</NonfilledCopper>
			<NonfilledCopper lineWidth="0.4">
				<LayerRef name="Top"/>
				<Shape>
					<Circle diameter="5.4">
						<Center x="253" y="12.028"/>
					</Circle>
				</Shape>
			</NonfilledCopper>
		</NonfilledCoppers>
	</Connectivity>

	<Settings version="1.3">
		<Autoroute wireShape="Arcs"
		 teardrops="on"/>
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
		<View scale="10.1632" scrollHorz="136.2243" scrollVert="6.4086"/>
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
		 showComponents="on" showCompTop="on" showCompBot="on" showCompsDes="on" showPinsName="on" showPinsNet="on" showCompsBound="on"
		 showLabelRefDes="on" showLabelPartName="on" showLabelOther="on"
		 showViolations="on" showTrimmed="on" showDRCViolations="on"
		 showKeepouts="on" showRouteKeepouts="on"
		 showSerpentArea="on"/>
		<Grid gridColor="#414141" gridKind="Lines" gridShow="on" alignToGrid="on" saveProportion="on">
			<GridSpace x="5000" y="5000"/>
		</Grid>
		<LayersVisualOptions>
			<LayerOptions>
				<LayerRef name="Board"/>
				<Colors details="#ffffff" pads="#ffffff" fix="#ffffff"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopMask"/>
				<Colors details="#b15738" pads="#8d452c" fix="#b15738"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopSilk"/>
				<Colors details="#f8d1d3" pads="#c6a7a8" fix="#947d7e"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopPaste"/>
				<Colors details="#bebebe" pads="#989898" fix="#727272"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="TopAssy"/>
				<Colors details="#259500" pads="#259500" fix="#165900"/>
				<Show visible="on" details="on" pads="on"/>
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
				<LayerRef name="BotAssy"/>
				<Colors details="#00aaaa" pads="#00aaaa" fix="#006666"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotPaste"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotSilk"/>
				<Colors details="#122e1c" pads="#0e2416" fix="#122e1c"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="BotMask"/>
				<Colors details="#1f4b2d" pads="#183c24" fix="#1f4b2d"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Mechanical 1"/>
				<Colors details="#f5f645" pads="#c4c437" fix="#939329"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
		</LayersVisualOptions>
		<ColorNets enabled="off" colorizeWire="off" colorizePad="on" colorizeCopper="on" colorizeVia="on" colorizeNetline="on">
			<SetColor color="#0000ff">
				<NetRef name="GND"/>
			</SetColor>
		</ColorNets>
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
		<GerberSettings outPath="P:\ELEMER\AMK310\КДС ПЛАТЫ\2_в_1\V2\AMK310_MCU_V2\gbr\" units="mm" intNums="4" fractNums="4">
			<ExportFile fileName="TopMask.gbr" output="on">
				<LayerRef name="TopMask"/>
				<ExportObjects board="on" wires="on" coppers="on" padstacks="on" vias="on"
				 texts="on" labels="on" details="on" fiducials="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
			<ExportFile fileName="TopSilk.gbr" output="on">
				<LayerRef name="TopSilk"/>
				<ExportObjects board="on"
				 texts="on" labels="on" details="on" fiducials="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
			<ExportFile fileName="TopPaste.gbr" output="on">
				<LayerRef name="TopPaste"/>
				<ExportObjects board="on" wires="on" coppers="on" padstacks="on" vias="on"
				 texts="on" labels="on" details="on" fiducials="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
			<ExportFile fileName="TopAssy.gbr">
				<LayerRef name="TopAssy"/>
				<ExportObjects board="on"
				 texts="on" labels="on" details="on" fiducials="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
			<ExportFile fileName="Top.gbr" output="on">
				<LayerRef name="Top"/>
				<ExportObjects board="on" wires="on" coppers="on" padstacks="on" vias="on"
				 texts="on" labels="on" details="on" fiducials="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
			<ExportFile fileName="Bottom.gbr" output="on">
				<LayerRef name="Bottom"/>
				<ExportObjects board="on" wires="on" coppers="on" padstacks="on" vias="on"
				 texts="on" labels="on" details="on" fiducials="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
			<ExportFile fileName="BotAssy.gbr">
				<LayerRef name="BotAssy"/>
				<ExportObjects board="on"
				 texts="on" labels="on" details="on" fiducials="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
			<ExportFile fileName="BotPaste.gbr">
				<LayerRef name="BotPaste"/>
				<ExportObjects board="on" wires="on" coppers="on" padstacks="on" vias="on"
				 texts="on" labels="on" details="on" fiducials="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
			<ExportFile fileName="BotSilk.gbr">
				<LayerRef name="BotSilk"/>
				<ExportObjects board="on"
				 texts="on" labels="on" details="on" fiducials="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
			<ExportFile fileName="BotMask.gbr" output="on">
				<LayerRef name="BotMask"/>
				<ExportObjects board="on" wires="on" coppers="on" padstacks="on" vias="on"
				 texts="on" labels="on" details="on" fiducials="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
			<ExportFile fileName="Board_outline.gbr" output="on">
				<LayerRef name="Board"/>
				<ExportObjects board="on"/>
				<Shift x="0" y="0"/>
			</ExportFile>
		</GerberSettings>
		<DrillSettings outPath="P:\ELEMER\AMK310\КДС ПЛАТЫ\2_в_1\V2\AMK310_MCU_V2\gbr" units="mm" intNums="4" fractNums="4">
			<ExportFile fileName="pth.drl"/>
			<ExportFile fileName="pth.drl"/>
			<ExportFile fileName="pth.drl"/>
			<ExportFile fileName="pth.drl"/>
			<ExportFile fileName="pth.drl"/>
		</DrillSettings>
		<BOMSettings outFile="P:\ELEMER\AMK310\КДС ПЛАТЫ\2_в_1\V2\AMK310_MCU_V2\bom.bom" count="on" partName="on" footprint="on" refDes="on">
			<AttributeRef name="Type"/>
			<AttributeRef name="Value"/>
		</BOMSettings>
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