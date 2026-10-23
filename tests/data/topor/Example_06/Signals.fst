<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : Signals.fst                    -->
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
		<OriginalFile></OriginalFile>
		<Units dist="mm" time="ps"/>
	</Header>

	<Layers version="1.1">
		<StackUpLayers>
			<Layer name="TopAssy" type="Assy"/>
			<Layer name="TopPaste" type="Paste" thickness="0"/>
			<Layer name="TopSilk" type="Silk" thickness="0"/>
			<Layer name="TopMask" type="Mask" thickness="0"/>
			<Layer name="Top" type="Signal" thickness="0"/>
			<Layer name="Int 1" type="Signal" thickness="0"/>
			<Layer name="Int 2" type="Signal" thickness="0"/>
			<Layer name="INT_GND" type="Plane" thickness="0"/>
			<Layer name="Int 3" type="Signal" thickness="0"/>
			<Layer name="INT_PWR" type="Signal" thickness="0"/>
			<Layer name="Int 4" type="Signal" thickness="0"/>
			<Layer name="Bottom" type="Signal" thickness="0"/>
			<Layer name="BotMask" type="Mask" thickness="0"/>
			<Layer name="BotSilk" type="Silk" thickness="0"/>
			<Layer name="BotPaste" type="Paste" thickness="0"/>
			<Layer name="BotAssy" type="Assy"/>
		</StackUpLayers>
	</Layers>

	<TextStyles version="1.0">
		<TextStyle name="(Default)" fontName="QUALITY" height="2.032"/>
		<TextStyle name="(DefaultTTF)" fontName="Arial" height="3.175"/>
		<TextStyle name="T:H60W10" fontName="QUALITY" height="2.032"/>
	</TextStyles>

	<LocalLibrary version="1.4">
		<Padstacks>
			<Padstack name="EF28X35TOP1" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="0.7" height="0.9">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="EF71X63TOP1" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadRect width="1.8" height="1.6">
						<LayerRef name="Top"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="EF14X14TOP1" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="0.35">
						<LayerRef name="Top"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="EF16X16TOP1" type="SMD" metallized="on">
				<Thermal spokeNum="4" minSpokeNum="4" angle="45" spokeWidth="0.381" backoff="0.381"/>
				<Pads>
					<PadCircle diameter="0.4">
						<LayerRef name="Top"/>
					</PadCircle>
				</Pads>
			</Padstack>
		</Padstacks>
		<Viastacks>
			<Viastack name="(Default-2)" holeDiameter="0.125">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="0.35">
						<LayerRef name="Top"/>
					</PadCircle>
					<PadCircle diameter="0.35">
						<LayerRef name="Bottom"/>
					</PadCircle>
					<PadCircle diameter="0.35">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="0.35">
						<LayerTypeRef type="Plane"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
		</Viastacks>
		<Footprints>
			<Footprint name="0402_1">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="EF28X35TOP1"/>
						<Org x="-0.65" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90">
						<PadstackRef name="EF28X35TOP1"/>
						<Org x="0.65" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-1.4" y="-0.25"/>
							<Dot x="-1.4" y="0.25"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-1.5" y="0.425"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-1.5" y="-3.219"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-1.5" y="0.679"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="C1206_1">
				<Pads>
					<Pad padNum="1" name="1" angle="90">
						<PadstackRef name="EF71X63TOP1"/>
						<Org x="-1.4" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90">
						<PadstackRef name="EF71X63TOP1"/>
						<Org x="1.4" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.3" y="-0.8"/>
							<Dot x="0.3" y="-0.8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.3" y="-0.8"/>
							<Dot x="-0.3" y="0.8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.11" y="-0.8"/>
							<Dot x="-0.11" y="0.8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.3" y="0.8"/>
							<Dot x="0.3" y="0.8"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.275" y="0.975"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.275" y="-3.769"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-2.275" y="1.229"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="iMX35_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="0"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="0"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="0"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="0"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="0"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="0"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="0"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="0"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="0"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="0"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="0"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="0"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="0"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="0"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-0.8"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-0.8"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-0.8"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-0.8"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-0.8"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-0.8"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-0.8"/>
					</Pad>
					<Pad padNum="28" name="28">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-0.8"/>
					</Pad>
					<Pad padNum="29" name="29">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-0.8"/>
					</Pad>
					<Pad padNum="30" name="30">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-0.8"/>
					</Pad>
					<Pad padNum="31" name="31">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-0.8"/>
					</Pad>
					<Pad padNum="32" name="32">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-0.8"/>
					</Pad>
					<Pad padNum="33" name="33">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-0.8"/>
					</Pad>
					<Pad padNum="34" name="34">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-0.8"/>
					</Pad>
					<Pad padNum="35" name="35">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-0.8"/>
					</Pad>
					<Pad padNum="36" name="36">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-0.8"/>
					</Pad>
					<Pad padNum="37" name="37">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-0.8"/>
					</Pad>
					<Pad padNum="38" name="38">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-0.8"/>
					</Pad>
					<Pad padNum="39" name="39">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-0.8"/>
					</Pad>
					<Pad padNum="40" name="40">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-0.8"/>
					</Pad>
					<Pad padNum="41" name="41">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-1.6"/>
					</Pad>
					<Pad padNum="42" name="42">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-1.6"/>
					</Pad>
					<Pad padNum="43" name="43">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-1.6"/>
					</Pad>
					<Pad padNum="44" name="44">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-1.6"/>
					</Pad>
					<Pad padNum="45" name="45">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-1.6"/>
					</Pad>
					<Pad padNum="46" name="46">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-1.6"/>
					</Pad>
					<Pad padNum="47" name="47">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-1.6"/>
					</Pad>
					<Pad padNum="48" name="48">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-1.6"/>
					</Pad>
					<Pad padNum="49" name="49">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-1.6"/>
					</Pad>
					<Pad padNum="50" name="50">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-1.6"/>
					</Pad>
					<Pad padNum="51" name="51">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-1.6"/>
					</Pad>
					<Pad padNum="52" name="52">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-1.6"/>
					</Pad>
					<Pad padNum="53" name="53">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-1.6"/>
					</Pad>
					<Pad padNum="54" name="54">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-1.6"/>
					</Pad>
					<Pad padNum="55" name="55">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-1.6"/>
					</Pad>
					<Pad padNum="56" name="56">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-1.6"/>
					</Pad>
					<Pad padNum="57" name="57">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-1.6"/>
					</Pad>
					<Pad padNum="58" name="58">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-1.6"/>
					</Pad>
					<Pad padNum="59" name="59">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-1.6"/>
					</Pad>
					<Pad padNum="60" name="60">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-1.6"/>
					</Pad>
					<Pad padNum="61" name="61">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-2.4"/>
					</Pad>
					<Pad padNum="62" name="62">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-2.4"/>
					</Pad>
					<Pad padNum="63" name="63">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-2.4"/>
					</Pad>
					<Pad padNum="64" name="64">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-2.4"/>
					</Pad>
					<Pad padNum="65" name="65">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-2.4"/>
					</Pad>
					<Pad padNum="66" name="66">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-2.4"/>
					</Pad>
					<Pad padNum="67" name="67">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-2.4"/>
					</Pad>
					<Pad padNum="68" name="68">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-2.4"/>
					</Pad>
					<Pad padNum="69" name="69">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-2.4"/>
					</Pad>
					<Pad padNum="70" name="70">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-2.4"/>
					</Pad>
					<Pad padNum="71" name="71">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-2.4"/>
					</Pad>
					<Pad padNum="72" name="72">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-2.4"/>
					</Pad>
					<Pad padNum="73" name="73">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-2.4"/>
					</Pad>
					<Pad padNum="74" name="74">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-2.4"/>
					</Pad>
					<Pad padNum="75" name="75">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-2.4"/>
					</Pad>
					<Pad padNum="76" name="76">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-2.4"/>
					</Pad>
					<Pad padNum="77" name="77">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-2.4"/>
					</Pad>
					<Pad padNum="78" name="78">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-2.4"/>
					</Pad>
					<Pad padNum="79" name="79">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-2.4"/>
					</Pad>
					<Pad padNum="80" name="80">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-2.4"/>
					</Pad>
					<Pad padNum="81" name="81">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-3.2"/>
					</Pad>
					<Pad padNum="82" name="82">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-3.2"/>
					</Pad>
					<Pad padNum="83" name="83">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-3.2"/>
					</Pad>
					<Pad padNum="84" name="84">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-3.2"/>
					</Pad>
					<Pad padNum="85" name="85">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-3.2"/>
					</Pad>
					<Pad padNum="86" name="86">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-3.2"/>
					</Pad>
					<Pad padNum="87" name="87">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-3.2"/>
					</Pad>
					<Pad padNum="88" name="88">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-3.2"/>
					</Pad>
					<Pad padNum="89" name="89">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-3.2"/>
					</Pad>
					<Pad padNum="90" name="90">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-3.2"/>
					</Pad>
					<Pad padNum="91" name="91">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-3.2"/>
					</Pad>
					<Pad padNum="92" name="92">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-3.2"/>
					</Pad>
					<Pad padNum="93" name="93">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-3.2"/>
					</Pad>
					<Pad padNum="94" name="94">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-3.2"/>
					</Pad>
					<Pad padNum="95" name="95">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-3.2"/>
					</Pad>
					<Pad padNum="96" name="96">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-3.2"/>
					</Pad>
					<Pad padNum="97" name="97">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-3.2"/>
					</Pad>
					<Pad padNum="98" name="98">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-3.2"/>
					</Pad>
					<Pad padNum="99" name="99">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-3.2"/>
					</Pad>
					<Pad padNum="100" name="100">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-3.2"/>
					</Pad>
					<Pad padNum="101" name="101">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-4"/>
					</Pad>
					<Pad padNum="102" name="102">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-4"/>
					</Pad>
					<Pad padNum="103" name="103">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-4"/>
					</Pad>
					<Pad padNum="104" name="104">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-4"/>
					</Pad>
					<Pad padNum="105" name="105">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-4"/>
					</Pad>
					<Pad padNum="106" name="106">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-4"/>
					</Pad>
					<Pad padNum="107" name="107">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-4"/>
					</Pad>
					<Pad padNum="108" name="108">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-4"/>
					</Pad>
					<Pad padNum="109" name="109">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-4"/>
					</Pad>
					<Pad padNum="110" name="110">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-4"/>
					</Pad>
					<Pad padNum="111" name="111">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-4"/>
					</Pad>
					<Pad padNum="112" name="112">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-4"/>
					</Pad>
					<Pad padNum="113" name="113">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-4"/>
					</Pad>
					<Pad padNum="114" name="114">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-4"/>
					</Pad>
					<Pad padNum="115" name="115">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-4"/>
					</Pad>
					<Pad padNum="116" name="116">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-4"/>
					</Pad>
					<Pad padNum="117" name="117">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-4"/>
					</Pad>
					<Pad padNum="118" name="118">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-4"/>
					</Pad>
					<Pad padNum="119" name="119">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-4"/>
					</Pad>
					<Pad padNum="120" name="120">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-4"/>
					</Pad>
					<Pad padNum="121" name="121">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-4.8"/>
					</Pad>
					<Pad padNum="122" name="122">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-4.8"/>
					</Pad>
					<Pad padNum="123" name="123">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-4.8"/>
					</Pad>
					<Pad padNum="124" name="124">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-4.8"/>
					</Pad>
					<Pad padNum="125" name="125">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-4.8"/>
					</Pad>
					<Pad padNum="126" name="126">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-4.8"/>
					</Pad>
					<Pad padNum="127" name="127">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-4.8"/>
					</Pad>
					<Pad padNum="128" name="128">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-4.8"/>
					</Pad>
					<Pad padNum="129" name="129">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-4.8"/>
					</Pad>
					<Pad padNum="130" name="130">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-4.8"/>
					</Pad>
					<Pad padNum="131" name="131">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-4.8"/>
					</Pad>
					<Pad padNum="132" name="132">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-4.8"/>
					</Pad>
					<Pad padNum="133" name="133">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-4.8"/>
					</Pad>
					<Pad padNum="134" name="134">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-4.8"/>
					</Pad>
					<Pad padNum="135" name="135">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-4.8"/>
					</Pad>
					<Pad padNum="136" name="136">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-4.8"/>
					</Pad>
					<Pad padNum="137" name="137">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-4.8"/>
					</Pad>
					<Pad padNum="138" name="138">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-4.8"/>
					</Pad>
					<Pad padNum="139" name="139">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-4.8"/>
					</Pad>
					<Pad padNum="140" name="140">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-4.8"/>
					</Pad>
					<Pad padNum="141" name="141">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-5.6"/>
					</Pad>
					<Pad padNum="142" name="142">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-5.6"/>
					</Pad>
					<Pad padNum="143" name="143">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-5.6"/>
					</Pad>
					<Pad padNum="144" name="144">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-5.6"/>
					</Pad>
					<Pad padNum="145" name="145">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-5.6"/>
					</Pad>
					<Pad padNum="146" name="146">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-5.6"/>
					</Pad>
					<Pad padNum="147" name="147">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-5.6"/>
					</Pad>
					<Pad padNum="148" name="148">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-5.6"/>
					</Pad>
					<Pad padNum="149" name="149">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-5.6"/>
					</Pad>
					<Pad padNum="150" name="150">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-5.6"/>
					</Pad>
					<Pad padNum="151" name="151">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-5.6"/>
					</Pad>
					<Pad padNum="152" name="152">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-5.6"/>
					</Pad>
					<Pad padNum="153" name="153">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-5.6"/>
					</Pad>
					<Pad padNum="154" name="154">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-5.6"/>
					</Pad>
					<Pad padNum="155" name="155">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-5.6"/>
					</Pad>
					<Pad padNum="156" name="156">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-5.6"/>
					</Pad>
					<Pad padNum="157" name="157">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-5.6"/>
					</Pad>
					<Pad padNum="158" name="158">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-5.6"/>
					</Pad>
					<Pad padNum="159" name="159">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-5.6"/>
					</Pad>
					<Pad padNum="160" name="160">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-5.6"/>
					</Pad>
					<Pad padNum="161" name="161">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-6.4"/>
					</Pad>
					<Pad padNum="162" name="162">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-6.4"/>
					</Pad>
					<Pad padNum="163" name="163">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-6.4"/>
					</Pad>
					<Pad padNum="164" name="164">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-6.4"/>
					</Pad>
					<Pad padNum="165" name="165">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-6.4"/>
					</Pad>
					<Pad padNum="166" name="166">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-6.4"/>
					</Pad>
					<Pad padNum="167" name="167">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-6.4"/>
					</Pad>
					<Pad padNum="168" name="168">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-6.4"/>
					</Pad>
					<Pad padNum="169" name="169">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-6.4"/>
					</Pad>
					<Pad padNum="170" name="170">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-6.4"/>
					</Pad>
					<Pad padNum="171" name="171">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-6.4"/>
					</Pad>
					<Pad padNum="172" name="172">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-6.4"/>
					</Pad>
					<Pad padNum="173" name="173">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-6.4"/>
					</Pad>
					<Pad padNum="174" name="174">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-6.4"/>
					</Pad>
					<Pad padNum="175" name="175">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-6.4"/>
					</Pad>
					<Pad padNum="176" name="176">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-6.4"/>
					</Pad>
					<Pad padNum="177" name="177">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-6.4"/>
					</Pad>
					<Pad padNum="178" name="178">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-6.4"/>
					</Pad>
					<Pad padNum="179" name="179">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-6.4"/>
					</Pad>
					<Pad padNum="180" name="180">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-6.4"/>
					</Pad>
					<Pad padNum="181" name="181">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-7.2"/>
					</Pad>
					<Pad padNum="182" name="182">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-7.2"/>
					</Pad>
					<Pad padNum="183" name="183">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-7.2"/>
					</Pad>
					<Pad padNum="184" name="184">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-7.2"/>
					</Pad>
					<Pad padNum="185" name="185">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-7.2"/>
					</Pad>
					<Pad padNum="186" name="186">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-7.2"/>
					</Pad>
					<Pad padNum="187" name="187">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-7.2"/>
					</Pad>
					<Pad padNum="188" name="188">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-7.2"/>
					</Pad>
					<Pad padNum="189" name="189">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-7.2"/>
					</Pad>
					<Pad padNum="190" name="190">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-7.2"/>
					</Pad>
					<Pad padNum="191" name="191">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-7.2"/>
					</Pad>
					<Pad padNum="192" name="192">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-7.2"/>
					</Pad>
					<Pad padNum="193" name="193">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-7.2"/>
					</Pad>
					<Pad padNum="194" name="194">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-7.2"/>
					</Pad>
					<Pad padNum="195" name="195">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-7.2"/>
					</Pad>
					<Pad padNum="196" name="196">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-7.2"/>
					</Pad>
					<Pad padNum="197" name="197">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-7.2"/>
					</Pad>
					<Pad padNum="198" name="198">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-7.2"/>
					</Pad>
					<Pad padNum="199" name="199">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-7.2"/>
					</Pad>
					<Pad padNum="200" name="200">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-7.2"/>
					</Pad>
					<Pad padNum="201" name="201">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-8"/>
					</Pad>
					<Pad padNum="202" name="202">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-8"/>
					</Pad>
					<Pad padNum="203" name="203">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-8"/>
					</Pad>
					<Pad padNum="204" name="204">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-8"/>
					</Pad>
					<Pad padNum="205" name="205">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-8"/>
					</Pad>
					<Pad padNum="206" name="206">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-8"/>
					</Pad>
					<Pad padNum="207" name="207">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-8"/>
					</Pad>
					<Pad padNum="208" name="208">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-8"/>
					</Pad>
					<Pad padNum="209" name="209">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-8"/>
					</Pad>
					<Pad padNum="210" name="210">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-8"/>
					</Pad>
					<Pad padNum="211" name="211">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-8"/>
					</Pad>
					<Pad padNum="212" name="212">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-8"/>
					</Pad>
					<Pad padNum="213" name="213">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-8"/>
					</Pad>
					<Pad padNum="214" name="214">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-8"/>
					</Pad>
					<Pad padNum="215" name="215">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-8"/>
					</Pad>
					<Pad padNum="216" name="216">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-8"/>
					</Pad>
					<Pad padNum="217" name="217">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-8"/>
					</Pad>
					<Pad padNum="218" name="218">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-8"/>
					</Pad>
					<Pad padNum="219" name="219">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-8"/>
					</Pad>
					<Pad padNum="220" name="220">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-8"/>
					</Pad>
					<Pad padNum="221" name="221">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-8.8"/>
					</Pad>
					<Pad padNum="222" name="222">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-8.8"/>
					</Pad>
					<Pad padNum="223" name="223">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-8.8"/>
					</Pad>
					<Pad padNum="224" name="224">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-8.8"/>
					</Pad>
					<Pad padNum="225" name="225">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-8.8"/>
					</Pad>
					<Pad padNum="226" name="226">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-8.8"/>
					</Pad>
					<Pad padNum="227" name="227">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-8.8"/>
					</Pad>
					<Pad padNum="228" name="228">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-8.8"/>
					</Pad>
					<Pad padNum="229" name="229">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-8.8"/>
					</Pad>
					<Pad padNum="230" name="230">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-8.8"/>
					</Pad>
					<Pad padNum="231" name="231">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-8.8"/>
					</Pad>
					<Pad padNum="232" name="232">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-8.8"/>
					</Pad>
					<Pad padNum="233" name="233">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-8.8"/>
					</Pad>
					<Pad padNum="234" name="234">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-8.8"/>
					</Pad>
					<Pad padNum="235" name="235">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-8.8"/>
					</Pad>
					<Pad padNum="236" name="236">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-8.8"/>
					</Pad>
					<Pad padNum="237" name="237">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-8.8"/>
					</Pad>
					<Pad padNum="238" name="238">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-8.8"/>
					</Pad>
					<Pad padNum="239" name="239">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-8.8"/>
					</Pad>
					<Pad padNum="240" name="240">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-8.8"/>
					</Pad>
					<Pad padNum="241" name="241">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-9.6"/>
					</Pad>
					<Pad padNum="242" name="242">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-9.6"/>
					</Pad>
					<Pad padNum="243" name="243">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-9.6"/>
					</Pad>
					<Pad padNum="244" name="244">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-9.6"/>
					</Pad>
					<Pad padNum="245" name="245">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-9.6"/>
					</Pad>
					<Pad padNum="246" name="246">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-9.6"/>
					</Pad>
					<Pad padNum="247" name="247">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-9.6"/>
					</Pad>
					<Pad padNum="248" name="248">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-9.6"/>
					</Pad>
					<Pad padNum="249" name="249">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-9.6"/>
					</Pad>
					<Pad padNum="250" name="250">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-9.6"/>
					</Pad>
					<Pad padNum="251" name="251">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-9.6"/>
					</Pad>
					<Pad padNum="252" name="252">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-9.6"/>
					</Pad>
					<Pad padNum="253" name="253">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-9.6"/>
					</Pad>
					<Pad padNum="254" name="254">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-9.6"/>
					</Pad>
					<Pad padNum="255" name="255">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-9.6"/>
					</Pad>
					<Pad padNum="256" name="256">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-9.6"/>
					</Pad>
					<Pad padNum="257" name="257">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-9.6"/>
					</Pad>
					<Pad padNum="258" name="258">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-9.6"/>
					</Pad>
					<Pad padNum="259" name="259">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-9.6"/>
					</Pad>
					<Pad padNum="260" name="260">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-9.6"/>
					</Pad>
					<Pad padNum="261" name="261">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-10.4"/>
					</Pad>
					<Pad padNum="262" name="262">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-10.4"/>
					</Pad>
					<Pad padNum="263" name="263">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-10.4"/>
					</Pad>
					<Pad padNum="264" name="264">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-10.4"/>
					</Pad>
					<Pad padNum="265" name="265">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-10.4"/>
					</Pad>
					<Pad padNum="266" name="266">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-10.4"/>
					</Pad>
					<Pad padNum="267" name="267">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-10.4"/>
					</Pad>
					<Pad padNum="268" name="268">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-10.4"/>
					</Pad>
					<Pad padNum="269" name="269">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-10.4"/>
					</Pad>
					<Pad padNum="270" name="270">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-10.4"/>
					</Pad>
					<Pad padNum="271" name="271">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-10.4"/>
					</Pad>
					<Pad padNum="272" name="272">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-10.4"/>
					</Pad>
					<Pad padNum="273" name="273">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-10.4"/>
					</Pad>
					<Pad padNum="274" name="274">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-10.4"/>
					</Pad>
					<Pad padNum="275" name="275">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-10.4"/>
					</Pad>
					<Pad padNum="276" name="276">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-10.4"/>
					</Pad>
					<Pad padNum="277" name="277">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-10.4"/>
					</Pad>
					<Pad padNum="278" name="278">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-10.4"/>
					</Pad>
					<Pad padNum="279" name="279">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-10.4"/>
					</Pad>
					<Pad padNum="280" name="280">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-10.4"/>
					</Pad>
					<Pad padNum="281" name="281">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-11.2"/>
					</Pad>
					<Pad padNum="282" name="282">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-11.2"/>
					</Pad>
					<Pad padNum="283" name="283">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-11.2"/>
					</Pad>
					<Pad padNum="284" name="284">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-11.2"/>
					</Pad>
					<Pad padNum="285" name="285">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-11.2"/>
					</Pad>
					<Pad padNum="286" name="286">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-11.2"/>
					</Pad>
					<Pad padNum="287" name="287">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-11.2"/>
					</Pad>
					<Pad padNum="288" name="288">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-11.2"/>
					</Pad>
					<Pad padNum="289" name="289">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-11.2"/>
					</Pad>
					<Pad padNum="290" name="290">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-11.2"/>
					</Pad>
					<Pad padNum="291" name="291">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-11.2"/>
					</Pad>
					<Pad padNum="292" name="292">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-11.2"/>
					</Pad>
					<Pad padNum="293" name="293">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-11.2"/>
					</Pad>
					<Pad padNum="294" name="294">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-11.2"/>
					</Pad>
					<Pad padNum="295" name="295">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-11.2"/>
					</Pad>
					<Pad padNum="296" name="296">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-11.2"/>
					</Pad>
					<Pad padNum="297" name="297">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-11.2"/>
					</Pad>
					<Pad padNum="298" name="298">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-11.2"/>
					</Pad>
					<Pad padNum="299" name="299">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-11.2"/>
					</Pad>
					<Pad padNum="300" name="300">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-11.2"/>
					</Pad>
					<Pad padNum="301" name="301">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-12"/>
					</Pad>
					<Pad padNum="302" name="302">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-12"/>
					</Pad>
					<Pad padNum="303" name="303">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-12"/>
					</Pad>
					<Pad padNum="304" name="304">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-12"/>
					</Pad>
					<Pad padNum="305" name="305">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-12"/>
					</Pad>
					<Pad padNum="306" name="306">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-12"/>
					</Pad>
					<Pad padNum="307" name="307">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-12"/>
					</Pad>
					<Pad padNum="308" name="308">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-12"/>
					</Pad>
					<Pad padNum="309" name="309">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-12"/>
					</Pad>
					<Pad padNum="310" name="310">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-12"/>
					</Pad>
					<Pad padNum="311" name="311">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-12"/>
					</Pad>
					<Pad padNum="312" name="312">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-12"/>
					</Pad>
					<Pad padNum="313" name="313">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-12"/>
					</Pad>
					<Pad padNum="314" name="314">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-12"/>
					</Pad>
					<Pad padNum="315" name="315">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-12"/>
					</Pad>
					<Pad padNum="316" name="316">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-12"/>
					</Pad>
					<Pad padNum="317" name="317">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-12"/>
					</Pad>
					<Pad padNum="318" name="318">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-12"/>
					</Pad>
					<Pad padNum="319" name="319">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-12"/>
					</Pad>
					<Pad padNum="320" name="320">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-12"/>
					</Pad>
					<Pad padNum="321" name="321">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-12.8"/>
					</Pad>
					<Pad padNum="322" name="322">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-12.8"/>
					</Pad>
					<Pad padNum="323" name="323">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-12.8"/>
					</Pad>
					<Pad padNum="324" name="324">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-12.8"/>
					</Pad>
					<Pad padNum="325" name="325">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-12.8"/>
					</Pad>
					<Pad padNum="326" name="326">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-12.8"/>
					</Pad>
					<Pad padNum="327" name="327">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-12.8"/>
					</Pad>
					<Pad padNum="328" name="328">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-12.8"/>
					</Pad>
					<Pad padNum="329" name="329">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-12.8"/>
					</Pad>
					<Pad padNum="330" name="330">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-12.8"/>
					</Pad>
					<Pad padNum="331" name="331">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-12.8"/>
					</Pad>
					<Pad padNum="332" name="332">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-12.8"/>
					</Pad>
					<Pad padNum="333" name="333">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-12.8"/>
					</Pad>
					<Pad padNum="334" name="334">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-12.8"/>
					</Pad>
					<Pad padNum="335" name="335">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-12.8"/>
					</Pad>
					<Pad padNum="336" name="336">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-12.8"/>
					</Pad>
					<Pad padNum="337" name="337">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-12.8"/>
					</Pad>
					<Pad padNum="338" name="338">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-12.8"/>
					</Pad>
					<Pad padNum="339" name="339">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-12.8"/>
					</Pad>
					<Pad padNum="340" name="340">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-12.8"/>
					</Pad>
					<Pad padNum="341" name="341">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-13.6"/>
					</Pad>
					<Pad padNum="342" name="342">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-13.6"/>
					</Pad>
					<Pad padNum="343" name="343">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-13.6"/>
					</Pad>
					<Pad padNum="344" name="344">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-13.6"/>
					</Pad>
					<Pad padNum="345" name="345">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-13.6"/>
					</Pad>
					<Pad padNum="346" name="346">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-13.6"/>
					</Pad>
					<Pad padNum="347" name="347">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-13.6"/>
					</Pad>
					<Pad padNum="348" name="348">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-13.6"/>
					</Pad>
					<Pad padNum="349" name="349">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-13.6"/>
					</Pad>
					<Pad padNum="350" name="350">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-13.6"/>
					</Pad>
					<Pad padNum="351" name="351">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-13.6"/>
					</Pad>
					<Pad padNum="352" name="352">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-13.6"/>
					</Pad>
					<Pad padNum="353" name="353">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-13.6"/>
					</Pad>
					<Pad padNum="354" name="354">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-13.6"/>
					</Pad>
					<Pad padNum="355" name="355">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-13.6"/>
					</Pad>
					<Pad padNum="356" name="356">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-13.6"/>
					</Pad>
					<Pad padNum="357" name="357">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-13.6"/>
					</Pad>
					<Pad padNum="358" name="358">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-13.6"/>
					</Pad>
					<Pad padNum="359" name="359">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-13.6"/>
					</Pad>
					<Pad padNum="360" name="360">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-13.6"/>
					</Pad>
					<Pad padNum="361" name="361">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-14.4"/>
					</Pad>
					<Pad padNum="362" name="362">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-14.4"/>
					</Pad>
					<Pad padNum="363" name="363">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-14.4"/>
					</Pad>
					<Pad padNum="364" name="364">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-14.4"/>
					</Pad>
					<Pad padNum="365" name="365">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-14.4"/>
					</Pad>
					<Pad padNum="366" name="366">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-14.4"/>
					</Pad>
					<Pad padNum="367" name="367">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-14.4"/>
					</Pad>
					<Pad padNum="368" name="368">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-14.4"/>
					</Pad>
					<Pad padNum="369" name="369">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-14.4"/>
					</Pad>
					<Pad padNum="370" name="370">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-14.4"/>
					</Pad>
					<Pad padNum="371" name="371">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-14.4"/>
					</Pad>
					<Pad padNum="372" name="372">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-14.4"/>
					</Pad>
					<Pad padNum="373" name="373">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-14.4"/>
					</Pad>
					<Pad padNum="374" name="374">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-14.4"/>
					</Pad>
					<Pad padNum="375" name="375">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-14.4"/>
					</Pad>
					<Pad padNum="376" name="376">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-14.4"/>
					</Pad>
					<Pad padNum="377" name="377">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-14.4"/>
					</Pad>
					<Pad padNum="378" name="378">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-14.4"/>
					</Pad>
					<Pad padNum="379" name="379">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-14.4"/>
					</Pad>
					<Pad padNum="380" name="380">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-14.4"/>
					</Pad>
					<Pad padNum="381" name="381">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0" y="-15.2"/>
					</Pad>
					<Pad padNum="382" name="382">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="7.2" y="-15.2"/>
					</Pad>
					<Pad padNum="383" name="383">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8" y="-15.2"/>
					</Pad>
					<Pad padNum="384" name="384">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="8.8" y="-15.2"/>
					</Pad>
					<Pad padNum="385" name="385">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="9.6" y="-15.2"/>
					</Pad>
					<Pad padNum="386" name="386">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="10.4" y="-15.2"/>
					</Pad>
					<Pad padNum="387" name="387">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="11.2" y="-15.2"/>
					</Pad>
					<Pad padNum="388" name="388">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12" y="-15.2"/>
					</Pad>
					<Pad padNum="389" name="389">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="12.8" y="-15.2"/>
					</Pad>
					<Pad padNum="390" name="390">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="13.6" y="-15.2"/>
					</Pad>
					<Pad padNum="391" name="391">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="14.4" y="-15.2"/>
					</Pad>
					<Pad padNum="392" name="392">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="0.8" y="-15.2"/>
					</Pad>
					<Pad padNum="393" name="393">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="15.2" y="-15.2"/>
					</Pad>
					<Pad padNum="394" name="394">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="1.6" y="-15.2"/>
					</Pad>
					<Pad padNum="395" name="395">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="2.4" y="-15.2"/>
					</Pad>
					<Pad padNum="396" name="396">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="3.2" y="-15.2"/>
					</Pad>
					<Pad padNum="397" name="397">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4" y="-15.2"/>
					</Pad>
					<Pad padNum="398" name="398">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="4.8" y="-15.2"/>
					</Pad>
					<Pad padNum="399" name="399">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="5.6" y="-15.2"/>
					</Pad>
					<Pad padNum="400" name="400">
						<PadstackRef name="EF14X14TOP1"/>
						<Org x="6.4" y="-15.2"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.25">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.8" y="0.4"/>
							<Dot x="-0.4" y="0.8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.25">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.8" y="-16"/>
							<Dot x="16" y="-16"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.25">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="16" y="-16"/>
							<Dot x="16" y="0.8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.25">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.4" y="0.8"/>
							<Dot x="16" y="0.8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.25">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.8" y="-16"/>
							<Dot x="-0.8" y="0.4"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.925" y="0.925"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.925" y="1.179"/>
					</Label>
				</Labels>
			</Footprint>
			<Footprint name="DDR_iMX35_1">
				<Pads>
					<Pad padNum="1" name="1">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="0"/>
					</Pad>
					<Pad padNum="2" name="2">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="0"/>
					</Pad>
					<Pad padNum="3" name="3">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="0"/>
					</Pad>
					<Pad padNum="4" name="4">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="0"/>
					</Pad>
					<Pad padNum="5" name="5">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="0"/>
					</Pad>
					<Pad padNum="6" name="6">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="0"/>
					</Pad>
					<Pad padNum="7" name="7">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-0.8"/>
					</Pad>
					<Pad padNum="8" name="8">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-0.8"/>
					</Pad>
					<Pad padNum="9" name="9">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-0.8"/>
					</Pad>
					<Pad padNum="10" name="10">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-0.8"/>
					</Pad>
					<Pad padNum="11" name="11">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-0.8"/>
					</Pad>
					<Pad padNum="12" name="12">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-0.8"/>
					</Pad>
					<Pad padNum="13" name="13">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-1.6"/>
					</Pad>
					<Pad padNum="14" name="14">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-1.6"/>
					</Pad>
					<Pad padNum="15" name="15">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-1.6"/>
					</Pad>
					<Pad padNum="16" name="16">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-1.6"/>
					</Pad>
					<Pad padNum="17" name="17">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-1.6"/>
					</Pad>
					<Pad padNum="18" name="18">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-1.6"/>
					</Pad>
					<Pad padNum="19" name="19">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-2.4"/>
					</Pad>
					<Pad padNum="20" name="20">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-2.4"/>
					</Pad>
					<Pad padNum="21" name="21">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-2.4"/>
					</Pad>
					<Pad padNum="22" name="22">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-2.4"/>
					</Pad>
					<Pad padNum="23" name="23">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-2.4"/>
					</Pad>
					<Pad padNum="24" name="24">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-2.4"/>
					</Pad>
					<Pad padNum="25" name="25">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-3.2"/>
					</Pad>
					<Pad padNum="26" name="26">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-3.2"/>
					</Pad>
					<Pad padNum="27" name="27">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-3.2"/>
					</Pad>
					<Pad padNum="28" name="28">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-3.2"/>
					</Pad>
					<Pad padNum="29" name="29">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-3.2"/>
					</Pad>
					<Pad padNum="30" name="30">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-3.2"/>
					</Pad>
					<Pad padNum="31" name="31">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-4"/>
					</Pad>
					<Pad padNum="32" name="32">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-4"/>
					</Pad>
					<Pad padNum="33" name="33">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-4"/>
					</Pad>
					<Pad padNum="34" name="34">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-4"/>
					</Pad>
					<Pad padNum="35" name="35">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-4"/>
					</Pad>
					<Pad padNum="36" name="36">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-4"/>
					</Pad>
					<Pad padNum="37" name="37">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-4.8"/>
					</Pad>
					<Pad padNum="38" name="38">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-4.8"/>
					</Pad>
					<Pad padNum="39" name="39">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-4.8"/>
					</Pad>
					<Pad padNum="40" name="40">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-4.8"/>
					</Pad>
					<Pad padNum="41" name="41">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-4.8"/>
					</Pad>
					<Pad padNum="42" name="42">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-4.8"/>
					</Pad>
					<Pad padNum="43" name="43">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-5.6"/>
					</Pad>
					<Pad padNum="44" name="44">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-5.6"/>
					</Pad>
					<Pad padNum="45" name="45">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-5.6"/>
					</Pad>
					<Pad padNum="46" name="46">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-5.6"/>
					</Pad>
					<Pad padNum="47" name="47">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-5.6"/>
					</Pad>
					<Pad padNum="48" name="48">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-5.6"/>
					</Pad>
					<Pad padNum="49" name="49">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-6.4"/>
					</Pad>
					<Pad padNum="50" name="50">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-6.4"/>
					</Pad>
					<Pad padNum="51" name="51">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-6.4"/>
					</Pad>
					<Pad padNum="52" name="52">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-6.4"/>
					</Pad>
					<Pad padNum="53" name="53">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-6.4"/>
					</Pad>
					<Pad padNum="54" name="54">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-6.4"/>
					</Pad>
					<Pad padNum="55" name="55">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-7.2"/>
					</Pad>
					<Pad padNum="56" name="56">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-7.2"/>
					</Pad>
					<Pad padNum="57" name="57">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-7.2"/>
					</Pad>
					<Pad padNum="58" name="58">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-7.2"/>
					</Pad>
					<Pad padNum="59" name="59">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-7.2"/>
					</Pad>
					<Pad padNum="60" name="60">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-8"/>
					</Pad>
					<Pad padNum="61" name="61">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-8"/>
					</Pad>
					<Pad padNum="62" name="62">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-8"/>
					</Pad>
					<Pad padNum="63" name="63">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-8"/>
					</Pad>
					<Pad padNum="64" name="64">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-8"/>
					</Pad>
					<Pad padNum="65" name="65">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-8.8"/>
					</Pad>
					<Pad padNum="66" name="66">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-8.8"/>
					</Pad>
					<Pad padNum="67" name="67">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-8.8"/>
					</Pad>
					<Pad padNum="68" name="68">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-8.8"/>
					</Pad>
					<Pad padNum="69" name="69">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-8.8"/>
					</Pad>
					<Pad padNum="70" name="70">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-9.6"/>
					</Pad>
					<Pad padNum="71" name="71">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-9.6"/>
					</Pad>
					<Pad padNum="72" name="72">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-9.6"/>
					</Pad>
					<Pad padNum="73" name="73">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-9.6"/>
					</Pad>
					<Pad padNum="74" name="74">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-9.6"/>
					</Pad>
					<Pad padNum="75" name="75">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-10.4"/>
					</Pad>
					<Pad padNum="76" name="76">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-10.4"/>
					</Pad>
					<Pad padNum="77" name="77">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-10.4"/>
					</Pad>
					<Pad padNum="78" name="78">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-10.4"/>
					</Pad>
					<Pad padNum="79" name="79">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="6.4" y="-10.4"/>
					</Pad>
					<Pad padNum="80" name="80">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0" y="-11.2"/>
					</Pad>
					<Pad padNum="81" name="81">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="0.8" y="-11.2"/>
					</Pad>
					<Pad padNum="82" name="82">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="1.6" y="-11.2"/>
					</Pad>
					<Pad padNum="83" name="83">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="4.8" y="-11.2"/>
					</Pad>
					<Pad padNum="84" name="84">
						<PadstackRef name="EF16X16TOP1"/>
						<Org x="5.6" y="-11.2"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0.2">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.8" y="-12"/>
							<Dot x="7.1" y="-12"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="7.1" y="-12"/>
							<Dot x="7.1" y="0.8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.4" y="0.8"/>
							<Dot x="7.1" y="0.8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.8" y="0.4"/>
							<Dot x="-0.4" y="0.8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0.2">
						<LayerRef name="TopSilk"/>
						<Line>
							<Dot x="-0.8" y="-12"/>
							<Dot x="-0.8" y="0.4"/>
						</Line>
					</Detail>
				</Details>
				<Labels>
					<Label name="Value" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.9" y="0.9"/>
					</Label>
					<Label name="Type" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="0" y="0"/>
					</Label>
					<Label name="RefDes" align="LB">
						<LayerRef name="TopSilk"/>
						<TextStyleRef name="(Default)"/>
						<Org x="-0.9" y="1.154"/>
					</Label>
				</Labels>
			</Footprint>
		</Footprints>
		<Components>
			<Component name="0402_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="0402"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="0402"/>
				</Attributes>
			</Component>
			<Component name="C1206_1">
				<Pins>
					<Pin pinNum="1" name="1" pinSymName="1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="2" pinSymName="2" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="C1206"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="C1206"/>
				</Attributes>
			</Component>
			<Component name="iMX35_1">
				<Pins>
					<Pin pinNum="1" name="A1" pinSymName="A1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="A10" pinSymName="A10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="A11" pinSymName="A11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="A12" pinSymName="A12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="A13" pinSymName="A13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="A14" pinSymName="A14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="A15" pinSymName="A15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="A16" pinSymName="A16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="A17" pinSymName="A17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="A18" pinSymName="A18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="A19" pinSymName="A19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="A2" pinSymName="A2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="A20" pinSymName="A20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="A3" pinSymName="A3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="A4" pinSymName="A4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="A5" pinSymName="A5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="A6" pinSymName="A6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="A7" pinSymName="A7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="A8" pinSymName="A8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="A9" pinSymName="A9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="B1" pinSymName="B1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="B10" pinSymName="B10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="B11" pinSymName="B11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="B12" pinSymName="B12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="B13" pinSymName="B13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="B14" pinSymName="B14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="B15" pinSymName="B15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="B16" pinSymName="B16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="B17" pinSymName="B17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="B18" pinSymName="B18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="B19" pinSymName="B19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="B2" pinSymName="B2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="B20" pinSymName="B20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="B3" pinSymName="B3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="B4" pinSymName="B4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="B5" pinSymName="B5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="B6" pinSymName="B6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="B7" pinSymName="B7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="B8" pinSymName="B8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="B9" pinSymName="B9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="C1" pinSymName="C1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="C10" pinSymName="C10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="43" name="C11" pinSymName="C11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="44" name="C12" pinSymName="C12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="45" name="C13" pinSymName="C13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="46" name="C14" pinSymName="C14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="47" name="C15" pinSymName="C15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="48" name="C16" pinSymName="C16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="49" name="C17" pinSymName="C17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="50" name="C18" pinSymName="C18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="51" name="C19" pinSymName="C19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="52" name="C2" pinSymName="C2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="53" name="C20" pinSymName="C20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="54" name="C3" pinSymName="C3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="55" name="C4" pinSymName="C4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="56" name="C5" pinSymName="C5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="57" name="C6" pinSymName="C6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="58" name="C7" pinSymName="C7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="59" name="C8" pinSymName="C8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="60" name="C9" pinSymName="C9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="61" name="D1" pinSymName="D1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="62" name="D10" pinSymName="D10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="63" name="D11" pinSymName="D11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="64" name="D12" pinSymName="D12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="65" name="D13" pinSymName="D13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="66" name="D14" pinSymName="D14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="67" name="D15" pinSymName="D15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="68" name="D16" pinSymName="D16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="69" name="D17" pinSymName="D17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="70" name="D18" pinSymName="D18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="71" name="D19" pinSymName="D19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="72" name="D2" pinSymName="D2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="73" name="D20" pinSymName="D20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="74" name="D3" pinSymName="D3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="75" name="D4" pinSymName="D4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="76" name="D5" pinSymName="D5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="77" name="D6" pinSymName="D6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="78" name="D7" pinSymName="D7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="79" name="D8" pinSymName="D8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="80" name="D9" pinSymName="D9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="81" name="E1" pinSymName="E1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="82" name="E10" pinSymName="E10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="83" name="E11" pinSymName="E11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="84" name="E12" pinSymName="E12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="85" name="E13" pinSymName="E13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="86" name="E14" pinSymName="E14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="87" name="E15" pinSymName="E15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="88" name="E16" pinSymName="E16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="89" name="E17" pinSymName="E17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="90" name="E18" pinSymName="E18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="91" name="E19" pinSymName="E19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="92" name="E2" pinSymName="E2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="93" name="E20" pinSymName="E20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="94" name="E3" pinSymName="E3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="95" name="E4" pinSymName="E4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="96" name="E5" pinSymName="E5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="97" name="E6" pinSymName="E6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="98" name="E7" pinSymName="E7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="99" name="E8" pinSymName="E8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="100" name="E9" pinSymName="E9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="101" name="F1" pinSymName="F1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="102" name="F10" pinSymName="F10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="103" name="F11" pinSymName="F11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="104" name="F12" pinSymName="F12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="105" name="F13" pinSymName="F13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="106" name="F14" pinSymName="F14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="107" name="F15" pinSymName="F15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="108" name="F16" pinSymName="F16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="109" name="F17" pinSymName="F17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="110" name="F18" pinSymName="F18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="111" name="F19" pinSymName="F19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="112" name="F2" pinSymName="F2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="113" name="F20" pinSymName="F20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="114" name="F3" pinSymName="F3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="115" name="F4" pinSymName="F4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="116" name="F5" pinSymName="F5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="117" name="F6" pinSymName="F6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="118" name="F7" pinSymName="F7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="119" name="F8" pinSymName="F8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="120" name="F9" pinSymName="F9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="121" name="G1" pinSymName="G1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="122" name="G10" pinSymName="G10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="123" name="G11" pinSymName="G11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="124" name="G12" pinSymName="G12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="125" name="G13" pinSymName="G13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="126" name="G14" pinSymName="G14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="127" name="G15" pinSymName="G15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="128" name="G16" pinSymName="G16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="129" name="G17" pinSymName="G17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="130" name="G18" pinSymName="G18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="131" name="G19" pinSymName="G19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="132" name="G2" pinSymName="G2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="133" name="G20" pinSymName="G20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="134" name="G3" pinSymName="G3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="135" name="G4" pinSymName="G4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="136" name="G5" pinSymName="G5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="137" name="G6" pinSymName="G6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="138" name="G7" pinSymName="G7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="139" name="G8" pinSymName="G8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="140" name="G9" pinSymName="G9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="141" name="H1" pinSymName="H1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="142" name="H10" pinSymName="H10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="143" name="H11" pinSymName="H11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="144" name="H12" pinSymName="H12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="145" name="H13" pinSymName="H13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="146" name="H14" pinSymName="H14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="147" name="H15" pinSymName="H15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="148" name="H16" pinSymName="H16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="149" name="H17" pinSymName="H17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="150" name="H18" pinSymName="H18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="151" name="H19" pinSymName="H19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="152" name="H2" pinSymName="H2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="153" name="H20" pinSymName="H20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="154" name="H3" pinSymName="H3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="155" name="H4" pinSymName="H4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="156" name="H5" pinSymName="H5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="157" name="H6" pinSymName="H6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="158" name="H7" pinSymName="H7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="159" name="H8" pinSymName="H8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="160" name="H9" pinSymName="H9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="161" name="J1" pinSymName="J1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="162" name="J10" pinSymName="J10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="163" name="J11" pinSymName="J11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="164" name="J12" pinSymName="J12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="165" name="J13" pinSymName="J13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="166" name="J14" pinSymName="J14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="167" name="J15" pinSymName="J15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="168" name="J16" pinSymName="J16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="169" name="J17" pinSymName="J17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="170" name="J18" pinSymName="J18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="171" name="J19" pinSymName="J19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="172" name="J2" pinSymName="J2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="173" name="J20" pinSymName="J20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="174" name="J3" pinSymName="J3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="175" name="J4" pinSymName="J4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="176" name="J5" pinSymName="J5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="177" name="J6" pinSymName="J6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="178" name="J7" pinSymName="J7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="179" name="J8" pinSymName="J8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="180" name="J9" pinSymName="J9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="181" name="K1" pinSymName="K1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="182" name="K10" pinSymName="K10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="183" name="K11" pinSymName="K11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="184" name="K12" pinSymName="K12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="185" name="K13" pinSymName="K13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="186" name="K14" pinSymName="K14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="187" name="K15" pinSymName="K15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="188" name="K16" pinSymName="K16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="189" name="K17" pinSymName="K17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="190" name="K18" pinSymName="K18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="191" name="K19" pinSymName="K19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="192" name="K2" pinSymName="K2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="193" name="K20" pinSymName="K20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="194" name="K3" pinSymName="K3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="195" name="K4" pinSymName="K4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="196" name="K5" pinSymName="K5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="197" name="K6" pinSymName="K6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="198" name="K7" pinSymName="K7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="199" name="K8" pinSymName="K8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="200" name="K9" pinSymName="K9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="201" name="L1" pinSymName="L1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="202" name="L10" pinSymName="L10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="203" name="L11" pinSymName="L11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="204" name="L12" pinSymName="L12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="205" name="L13" pinSymName="L13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="206" name="L14" pinSymName="L14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="207" name="L15" pinSymName="L15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="208" name="L16" pinSymName="L16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="209" name="L17" pinSymName="L17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="210" name="L18" pinSymName="L18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="211" name="L19" pinSymName="L19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="212" name="L2" pinSymName="L2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="213" name="L20" pinSymName="L20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="214" name="L3" pinSymName="L3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="215" name="L4" pinSymName="L4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="216" name="L5" pinSymName="L5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="217" name="L6" pinSymName="L6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="218" name="L7" pinSymName="L7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="219" name="L8" pinSymName="L8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="220" name="L9" pinSymName="L9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="221" name="M1" pinSymName="M1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="222" name="M10" pinSymName="M10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="223" name="M11" pinSymName="M11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="224" name="M12" pinSymName="M12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="225" name="M13" pinSymName="M13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="226" name="M14" pinSymName="M14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="227" name="M15" pinSymName="M15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="228" name="M16" pinSymName="M16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="229" name="M17" pinSymName="M17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="230" name="M18" pinSymName="M18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="231" name="M19" pinSymName="M19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="232" name="M2" pinSymName="M2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="233" name="M20" pinSymName="M20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="234" name="M3" pinSymName="M3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="235" name="M4" pinSymName="M4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="236" name="M5" pinSymName="M5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="237" name="M6" pinSymName="M6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="238" name="M7" pinSymName="M7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="239" name="M8" pinSymName="M8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="240" name="M9" pinSymName="M9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="241" name="N1" pinSymName="N1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="242" name="N10" pinSymName="N10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="243" name="N11" pinSymName="N11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="244" name="N12" pinSymName="N12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="245" name="N13" pinSymName="N13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="246" name="N14" pinSymName="N14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="247" name="N15" pinSymName="N15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="248" name="N16" pinSymName="N16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="249" name="N17" pinSymName="N17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="250" name="N18" pinSymName="N18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="251" name="N19" pinSymName="N19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="252" name="N2" pinSymName="N2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="253" name="N20" pinSymName="N20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="254" name="N3" pinSymName="N3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="255" name="N4" pinSymName="N4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="256" name="N5" pinSymName="N5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="257" name="N6" pinSymName="N6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="258" name="N7" pinSymName="N7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="259" name="N8" pinSymName="N8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="260" name="N9" pinSymName="N9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="261" name="P1" pinSymName="P1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="262" name="P10" pinSymName="P10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="263" name="P11" pinSymName="P11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="264" name="P12" pinSymName="P12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="265" name="P13" pinSymName="P13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="266" name="P14" pinSymName="P14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="267" name="P15" pinSymName="P15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="268" name="P16" pinSymName="P16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="269" name="P17" pinSymName="P17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="270" name="P18" pinSymName="P18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="271" name="P19" pinSymName="P19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="272" name="P2" pinSymName="P2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="273" name="P20" pinSymName="P20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="274" name="P3" pinSymName="P3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="275" name="P4" pinSymName="P4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="276" name="P5" pinSymName="P5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="277" name="P6" pinSymName="P6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="278" name="P7" pinSymName="P7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="279" name="P8" pinSymName="P8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="280" name="P9" pinSymName="P9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="281" name="R1" pinSymName="R1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="282" name="R10" pinSymName="R10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="283" name="R11" pinSymName="R11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="284" name="R12" pinSymName="R12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="285" name="R13" pinSymName="R13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="286" name="R14" pinSymName="R14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="287" name="R15" pinSymName="R15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="288" name="R16" pinSymName="R16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="289" name="R17" pinSymName="R17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="290" name="R18" pinSymName="R18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="291" name="R19" pinSymName="R19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="292" name="R2" pinSymName="R2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="293" name="R20" pinSymName="R20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="294" name="R3" pinSymName="R3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="295" name="R4" pinSymName="R4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="296" name="R5" pinSymName="R5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="297" name="R6" pinSymName="R6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="298" name="R7" pinSymName="R7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="299" name="R8" pinSymName="R8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="300" name="R9" pinSymName="R9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="301" name="T1" pinSymName="T1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="302" name="T10" pinSymName="T10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="303" name="T11" pinSymName="T11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="304" name="T12" pinSymName="T12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="305" name="T13" pinSymName="T13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="306" name="T14" pinSymName="T14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="307" name="T15" pinSymName="T15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="308" name="T16" pinSymName="T16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="309" name="T17" pinSymName="T17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="310" name="T18" pinSymName="T18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="311" name="T19" pinSymName="T19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="312" name="T2" pinSymName="T2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="313" name="T20" pinSymName="T20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="314" name="T3" pinSymName="T3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="315" name="T4" pinSymName="T4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="316" name="T5" pinSymName="T5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="317" name="T6" pinSymName="T6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="318" name="T7" pinSymName="T7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="319" name="T8" pinSymName="T8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="320" name="T9" pinSymName="T9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="321" name="U1" pinSymName="U1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="322" name="U10" pinSymName="U10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="323" name="U11" pinSymName="U11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="324" name="U12" pinSymName="U12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="325" name="U13" pinSymName="U13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="326" name="U14" pinSymName="U14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="327" name="U15" pinSymName="U15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="328" name="U16" pinSymName="U16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="329" name="U17" pinSymName="U17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="330" name="U18" pinSymName="U18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="331" name="U19" pinSymName="U19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="332" name="U2" pinSymName="U2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="333" name="U20" pinSymName="U20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="334" name="U3" pinSymName="U3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="335" name="U4" pinSymName="U4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="336" name="U5" pinSymName="U5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="337" name="U6" pinSymName="U6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="338" name="U7" pinSymName="U7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="339" name="U8" pinSymName="U8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="340" name="U9" pinSymName="U9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="341" name="V1" pinSymName="V1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="342" name="V10" pinSymName="V10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="343" name="V11" pinSymName="V11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="344" name="V12" pinSymName="V12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="345" name="V13" pinSymName="V13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="346" name="V14" pinSymName="V14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="347" name="V15" pinSymName="V15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="348" name="V16" pinSymName="V16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="349" name="V17" pinSymName="V17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="350" name="V18" pinSymName="V18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="351" name="V19" pinSymName="V19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="352" name="V2" pinSymName="V2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="353" name="V20" pinSymName="V20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="354" name="V3" pinSymName="V3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="355" name="V4" pinSymName="V4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="356" name="V5" pinSymName="V5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="357" name="V6" pinSymName="V6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="358" name="V7" pinSymName="V7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="359" name="V8" pinSymName="V8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="360" name="V9" pinSymName="V9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="361" name="W1" pinSymName="W1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="362" name="W10" pinSymName="W10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="363" name="W11" pinSymName="W11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="364" name="W12" pinSymName="W12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="365" name="W13" pinSymName="W13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="366" name="W14" pinSymName="W14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="367" name="W15" pinSymName="W15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="368" name="W16" pinSymName="W16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="369" name="W17" pinSymName="W17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="370" name="W18" pinSymName="W18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="371" name="W19" pinSymName="W19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="372" name="W2" pinSymName="W2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="373" name="W20" pinSymName="W20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="374" name="W3" pinSymName="W3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="375" name="W4" pinSymName="W4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="376" name="W5" pinSymName="W5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="377" name="W6" pinSymName="W6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="378" name="W7" pinSymName="W7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="379" name="W8" pinSymName="W8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="380" name="W9" pinSymName="W9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="381" name="Y1" pinSymName="Y1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="382" name="Y10" pinSymName="Y10" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="383" name="Y11" pinSymName="Y11" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="384" name="Y12" pinSymName="Y12" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="385" name="Y13" pinSymName="Y13" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="386" name="Y14" pinSymName="Y14" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="387" name="Y15" pinSymName="Y15" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="388" name="Y16" pinSymName="Y16" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="389" name="Y17" pinSymName="Y17" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="390" name="Y18" pinSymName="Y18" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="391" name="Y19" pinSymName="Y19" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="392" name="Y2" pinSymName="Y2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="393" name="Y20" pinSymName="Y20" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="394" name="Y3" pinSymName="Y3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="395" name="Y4" pinSymName="Y4" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="396" name="Y5" pinSymName="Y5" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="397" name="Y6" pinSymName="Y6" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="398" name="Y7" pinSymName="Y7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="399" name="Y8" pinSymName="Y8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="400" name="Y9" pinSymName="Y9" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="iMX35"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="iMX35"/>
				</Attributes>
			</Component>
			<Component name="DDR_iMX35_1">
				<Pins>
					<Pin pinNum="1" name="A1" pinSymName="A1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="2" name="A2" pinSymName="A2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="3" name="A3" pinSymName="A3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="4" name="A7" pinSymName="A7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="5" name="A8" pinSymName="A8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="6" name="A9" pinSymName="A9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="7" name="B1" pinSymName="B1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="8" name="B2" pinSymName="B2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="9" name="B3" pinSymName="B3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="10" name="B7" pinSymName="B7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="11" name="B8" pinSymName="B8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="12" name="B9" pinSymName="B9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="13" name="C1" pinSymName="C1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="14" name="C2" pinSymName="C2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="15" name="C3" pinSymName="C3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="16" name="C7" pinSymName="C7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="17" name="C8" pinSymName="C8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="18" name="C9" pinSymName="C9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="19" name="D1" pinSymName="D1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="20" name="D2" pinSymName="D2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="21" name="D3" pinSymName="D3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="22" name="D7" pinSymName="D7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="23" name="D8" pinSymName="D8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="24" name="D9" pinSymName="D9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="25" name="E1" pinSymName="E1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="26" name="E2" pinSymName="E2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="27" name="E3" pinSymName="E3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="28" name="E7" pinSymName="E7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="29" name="E8" pinSymName="E8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="30" name="E9" pinSymName="E9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="31" name="F1" pinSymName="F1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="32" name="F2" pinSymName="F2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="33" name="F3" pinSymName="F3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="34" name="F7" pinSymName="F7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="35" name="F8" pinSymName="F8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="36" name="F9" pinSymName="F9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="37" name="G1" pinSymName="G1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="38" name="G2" pinSymName="G2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="39" name="G3" pinSymName="G3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="40" name="G7" pinSymName="G7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="41" name="G8" pinSymName="G8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="42" name="G9" pinSymName="G9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="43" name="H1" pinSymName="H1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="44" name="H2" pinSymName="H2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="45" name="H3" pinSymName="H3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="46" name="H7" pinSymName="H7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="47" name="H8" pinSymName="H8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="48" name="H9" pinSymName="H9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="49" name="J1" pinSymName="J1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="50" name="J2" pinSymName="J2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="51" name="J3" pinSymName="J3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="52" name="J7" pinSymName="J7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="53" name="J8" pinSymName="J8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="54" name="J9" pinSymName="J9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="55" name="K2" pinSymName="K2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="56" name="K3" pinSymName="K3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="57" name="K7" pinSymName="K7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="58" name="K8" pinSymName="K8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="59" name="K9" pinSymName="K9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="60" name="L1" pinSymName="L1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="61" name="L2" pinSymName="L2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="62" name="L3" pinSymName="L3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="63" name="L7" pinSymName="L7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="64" name="L8" pinSymName="L8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="65" name="M2" pinSymName="M2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="66" name="M3" pinSymName="M3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="67" name="M7" pinSymName="M7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="68" name="M8" pinSymName="M8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="69" name="M9" pinSymName="M9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="70" name="N1" pinSymName="N1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="71" name="N2" pinSymName="N2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="72" name="N3" pinSymName="N3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="73" name="N7" pinSymName="N7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="74" name="N8" pinSymName="N8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="75" name="P2" pinSymName="P2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="76" name="P3" pinSymName="P3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="77" name="P7" pinSymName="P7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="78" name="P8" pinSymName="P8" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="79" name="P9" pinSymName="P9" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="80" name="R1" pinSymName="R1" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="81" name="R2" pinSymName="R2" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="82" name="R3" pinSymName="R3" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="83" name="R7" pinSymName="R7" pinEqual="0" gate="1" gateEqual="0"/>
					<Pin pinNum="84" name="R8" pinSymName="R8" pinEqual="0" gate="1" gateEqual="0"/>
				</Pins>
				<Attributes>
					<Attribute name="PCADIO_LinkName" value="DDR_iMX35"/>
					<Attribute name="PCADIO_sourceLibrary"/>
					<Attribute name="PCADIO_refDesPrefix"/>
					<Attribute name="PCADIO_CompDefOriginalName" value="DDR_iMX35"/>
				</Attributes>
			</Component>
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="0402_1"/>
				<FootprintRef name="0402_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C1206_1"/>
				<FootprintRef name="C1206_1"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="iMX35_1"/>
				<FootprintRef name="iMX35_1"/>
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
				<Pinpack pinNum="63" padNum="63"/>
				<Pinpack pinNum="64" padNum="64"/>
				<Pinpack pinNum="65" padNum="65"/>
				<Pinpack pinNum="66" padNum="66"/>
				<Pinpack pinNum="67" padNum="67"/>
				<Pinpack pinNum="68" padNum="68"/>
				<Pinpack pinNum="69" padNum="69"/>
				<Pinpack pinNum="70" padNum="70"/>
				<Pinpack pinNum="71" padNum="71"/>
				<Pinpack pinNum="72" padNum="72"/>
				<Pinpack pinNum="73" padNum="73"/>
				<Pinpack pinNum="74" padNum="74"/>
				<Pinpack pinNum="75" padNum="75"/>
				<Pinpack pinNum="76" padNum="76"/>
				<Pinpack pinNum="77" padNum="77"/>
				<Pinpack pinNum="78" padNum="78"/>
				<Pinpack pinNum="79" padNum="79"/>
				<Pinpack pinNum="80" padNum="80"/>
				<Pinpack pinNum="81" padNum="81"/>
				<Pinpack pinNum="82" padNum="82"/>
				<Pinpack pinNum="83" padNum="83"/>
				<Pinpack pinNum="84" padNum="84"/>
				<Pinpack pinNum="85" padNum="85"/>
				<Pinpack pinNum="86" padNum="86"/>
				<Pinpack pinNum="87" padNum="87"/>
				<Pinpack pinNum="88" padNum="88"/>
				<Pinpack pinNum="89" padNum="89"/>
				<Pinpack pinNum="90" padNum="90"/>
				<Pinpack pinNum="91" padNum="91"/>
				<Pinpack pinNum="92" padNum="92"/>
				<Pinpack pinNum="93" padNum="93"/>
				<Pinpack pinNum="94" padNum="94"/>
				<Pinpack pinNum="95" padNum="95"/>
				<Pinpack pinNum="96" padNum="96"/>
				<Pinpack pinNum="97" padNum="97"/>
				<Pinpack pinNum="98" padNum="98"/>
				<Pinpack pinNum="99" padNum="99"/>
				<Pinpack pinNum="100" padNum="100"/>
				<Pinpack pinNum="101" padNum="101"/>
				<Pinpack pinNum="102" padNum="102"/>
				<Pinpack pinNum="103" padNum="103"/>
				<Pinpack pinNum="104" padNum="104"/>
				<Pinpack pinNum="105" padNum="105"/>
				<Pinpack pinNum="106" padNum="106"/>
				<Pinpack pinNum="107" padNum="107"/>
				<Pinpack pinNum="108" padNum="108"/>
				<Pinpack pinNum="109" padNum="109"/>
				<Pinpack pinNum="110" padNum="110"/>
				<Pinpack pinNum="111" padNum="111"/>
				<Pinpack pinNum="112" padNum="112"/>
				<Pinpack pinNum="113" padNum="113"/>
				<Pinpack pinNum="114" padNum="114"/>
				<Pinpack pinNum="115" padNum="115"/>
				<Pinpack pinNum="116" padNum="116"/>
				<Pinpack pinNum="117" padNum="117"/>
				<Pinpack pinNum="118" padNum="118"/>
				<Pinpack pinNum="119" padNum="119"/>
				<Pinpack pinNum="120" padNum="120"/>
				<Pinpack pinNum="121" padNum="121"/>
				<Pinpack pinNum="122" padNum="122"/>
				<Pinpack pinNum="123" padNum="123"/>
				<Pinpack pinNum="124" padNum="124"/>
				<Pinpack pinNum="125" padNum="125"/>
				<Pinpack pinNum="126" padNum="126"/>
				<Pinpack pinNum="127" padNum="127"/>
				<Pinpack pinNum="128" padNum="128"/>
				<Pinpack pinNum="129" padNum="129"/>
				<Pinpack pinNum="130" padNum="130"/>
				<Pinpack pinNum="131" padNum="131"/>
				<Pinpack pinNum="132" padNum="132"/>
				<Pinpack pinNum="133" padNum="133"/>
				<Pinpack pinNum="134" padNum="134"/>
				<Pinpack pinNum="135" padNum="135"/>
				<Pinpack pinNum="136" padNum="136"/>
				<Pinpack pinNum="137" padNum="137"/>
				<Pinpack pinNum="138" padNum="138"/>
				<Pinpack pinNum="139" padNum="139"/>
				<Pinpack pinNum="140" padNum="140"/>
				<Pinpack pinNum="141" padNum="141"/>
				<Pinpack pinNum="142" padNum="142"/>
				<Pinpack pinNum="143" padNum="143"/>
				<Pinpack pinNum="144" padNum="144"/>
				<Pinpack pinNum="145" padNum="145"/>
				<Pinpack pinNum="146" padNum="146"/>
				<Pinpack pinNum="147" padNum="147"/>
				<Pinpack pinNum="148" padNum="148"/>
				<Pinpack pinNum="149" padNum="149"/>
				<Pinpack pinNum="150" padNum="150"/>
				<Pinpack pinNum="151" padNum="151"/>
				<Pinpack pinNum="152" padNum="152"/>
				<Pinpack pinNum="153" padNum="153"/>
				<Pinpack pinNum="154" padNum="154"/>
				<Pinpack pinNum="155" padNum="155"/>
				<Pinpack pinNum="156" padNum="156"/>
				<Pinpack pinNum="157" padNum="157"/>
				<Pinpack pinNum="158" padNum="158"/>
				<Pinpack pinNum="159" padNum="159"/>
				<Pinpack pinNum="160" padNum="160"/>
				<Pinpack pinNum="161" padNum="161"/>
				<Pinpack pinNum="162" padNum="162"/>
				<Pinpack pinNum="163" padNum="163"/>
				<Pinpack pinNum="164" padNum="164"/>
				<Pinpack pinNum="165" padNum="165"/>
				<Pinpack pinNum="166" padNum="166"/>
				<Pinpack pinNum="167" padNum="167"/>
				<Pinpack pinNum="168" padNum="168"/>
				<Pinpack pinNum="169" padNum="169"/>
				<Pinpack pinNum="170" padNum="170"/>
				<Pinpack pinNum="171" padNum="171"/>
				<Pinpack pinNum="172" padNum="172"/>
				<Pinpack pinNum="173" padNum="173"/>
				<Pinpack pinNum="174" padNum="174"/>
				<Pinpack pinNum="175" padNum="175"/>
				<Pinpack pinNum="176" padNum="176"/>
				<Pinpack pinNum="177" padNum="177"/>
				<Pinpack pinNum="178" padNum="178"/>
				<Pinpack pinNum="179" padNum="179"/>
				<Pinpack pinNum="180" padNum="180"/>
				<Pinpack pinNum="181" padNum="181"/>
				<Pinpack pinNum="182" padNum="182"/>
				<Pinpack pinNum="183" padNum="183"/>
				<Pinpack pinNum="184" padNum="184"/>
				<Pinpack pinNum="185" padNum="185"/>
				<Pinpack pinNum="186" padNum="186"/>
				<Pinpack pinNum="187" padNum="187"/>
				<Pinpack pinNum="188" padNum="188"/>
				<Pinpack pinNum="189" padNum="189"/>
				<Pinpack pinNum="190" padNum="190"/>
				<Pinpack pinNum="191" padNum="191"/>
				<Pinpack pinNum="192" padNum="192"/>
				<Pinpack pinNum="193" padNum="193"/>
				<Pinpack pinNum="194" padNum="194"/>
				<Pinpack pinNum="195" padNum="195"/>
				<Pinpack pinNum="196" padNum="196"/>
				<Pinpack pinNum="197" padNum="197"/>
				<Pinpack pinNum="198" padNum="198"/>
				<Pinpack pinNum="199" padNum="199"/>
				<Pinpack pinNum="200" padNum="200"/>
				<Pinpack pinNum="201" padNum="201"/>
				<Pinpack pinNum="202" padNum="202"/>
				<Pinpack pinNum="203" padNum="203"/>
				<Pinpack pinNum="204" padNum="204"/>
				<Pinpack pinNum="205" padNum="205"/>
				<Pinpack pinNum="206" padNum="206"/>
				<Pinpack pinNum="207" padNum="207"/>
				<Pinpack pinNum="208" padNum="208"/>
				<Pinpack pinNum="209" padNum="209"/>
				<Pinpack pinNum="210" padNum="210"/>
				<Pinpack pinNum="211" padNum="211"/>
				<Pinpack pinNum="212" padNum="212"/>
				<Pinpack pinNum="213" padNum="213"/>
				<Pinpack pinNum="214" padNum="214"/>
				<Pinpack pinNum="215" padNum="215"/>
				<Pinpack pinNum="216" padNum="216"/>
				<Pinpack pinNum="217" padNum="217"/>
				<Pinpack pinNum="218" padNum="218"/>
				<Pinpack pinNum="219" padNum="219"/>
				<Pinpack pinNum="220" padNum="220"/>
				<Pinpack pinNum="221" padNum="221"/>
				<Pinpack pinNum="222" padNum="222"/>
				<Pinpack pinNum="223" padNum="223"/>
				<Pinpack pinNum="224" padNum="224"/>
				<Pinpack pinNum="225" padNum="225"/>
				<Pinpack pinNum="226" padNum="226"/>
				<Pinpack pinNum="227" padNum="227"/>
				<Pinpack pinNum="228" padNum="228"/>
				<Pinpack pinNum="229" padNum="229"/>
				<Pinpack pinNum="230" padNum="230"/>
				<Pinpack pinNum="231" padNum="231"/>
				<Pinpack pinNum="232" padNum="232"/>
				<Pinpack pinNum="233" padNum="233"/>
				<Pinpack pinNum="234" padNum="234"/>
				<Pinpack pinNum="235" padNum="235"/>
				<Pinpack pinNum="236" padNum="236"/>
				<Pinpack pinNum="237" padNum="237"/>
				<Pinpack pinNum="238" padNum="238"/>
				<Pinpack pinNum="239" padNum="239"/>
				<Pinpack pinNum="240" padNum="240"/>
				<Pinpack pinNum="241" padNum="241"/>
				<Pinpack pinNum="242" padNum="242"/>
				<Pinpack pinNum="243" padNum="243"/>
				<Pinpack pinNum="244" padNum="244"/>
				<Pinpack pinNum="245" padNum="245"/>
				<Pinpack pinNum="246" padNum="246"/>
				<Pinpack pinNum="247" padNum="247"/>
				<Pinpack pinNum="248" padNum="248"/>
				<Pinpack pinNum="249" padNum="249"/>
				<Pinpack pinNum="250" padNum="250"/>
				<Pinpack pinNum="251" padNum="251"/>
				<Pinpack pinNum="252" padNum="252"/>
				<Pinpack pinNum="253" padNum="253"/>
				<Pinpack pinNum="254" padNum="254"/>
				<Pinpack pinNum="255" padNum="255"/>
				<Pinpack pinNum="256" padNum="256"/>
				<Pinpack pinNum="257" padNum="257"/>
				<Pinpack pinNum="258" padNum="258"/>
				<Pinpack pinNum="259" padNum="259"/>
				<Pinpack pinNum="260" padNum="260"/>
				<Pinpack pinNum="261" padNum="261"/>
				<Pinpack pinNum="262" padNum="262"/>
				<Pinpack pinNum="263" padNum="263"/>
				<Pinpack pinNum="264" padNum="264"/>
				<Pinpack pinNum="265" padNum="265"/>
				<Pinpack pinNum="266" padNum="266"/>
				<Pinpack pinNum="267" padNum="267"/>
				<Pinpack pinNum="268" padNum="268"/>
				<Pinpack pinNum="269" padNum="269"/>
				<Pinpack pinNum="270" padNum="270"/>
				<Pinpack pinNum="271" padNum="271"/>
				<Pinpack pinNum="272" padNum="272"/>
				<Pinpack pinNum="273" padNum="273"/>
				<Pinpack pinNum="274" padNum="274"/>
				<Pinpack pinNum="275" padNum="275"/>
				<Pinpack pinNum="276" padNum="276"/>
				<Pinpack pinNum="277" padNum="277"/>
				<Pinpack pinNum="278" padNum="278"/>
				<Pinpack pinNum="279" padNum="279"/>
				<Pinpack pinNum="280" padNum="280"/>
				<Pinpack pinNum="281" padNum="281"/>
				<Pinpack pinNum="282" padNum="282"/>
				<Pinpack pinNum="283" padNum="283"/>
				<Pinpack pinNum="284" padNum="284"/>
				<Pinpack pinNum="285" padNum="285"/>
				<Pinpack pinNum="286" padNum="286"/>
				<Pinpack pinNum="287" padNum="287"/>
				<Pinpack pinNum="288" padNum="288"/>
				<Pinpack pinNum="289" padNum="289"/>
				<Pinpack pinNum="290" padNum="290"/>
				<Pinpack pinNum="291" padNum="291"/>
				<Pinpack pinNum="292" padNum="292"/>
				<Pinpack pinNum="293" padNum="293"/>
				<Pinpack pinNum="294" padNum="294"/>
				<Pinpack pinNum="295" padNum="295"/>
				<Pinpack pinNum="296" padNum="296"/>
				<Pinpack pinNum="297" padNum="297"/>
				<Pinpack pinNum="298" padNum="298"/>
				<Pinpack pinNum="299" padNum="299"/>
				<Pinpack pinNum="300" padNum="300"/>
				<Pinpack pinNum="301" padNum="301"/>
				<Pinpack pinNum="302" padNum="302"/>
				<Pinpack pinNum="303" padNum="303"/>
				<Pinpack pinNum="304" padNum="304"/>
				<Pinpack pinNum="305" padNum="305"/>
				<Pinpack pinNum="306" padNum="306"/>
				<Pinpack pinNum="307" padNum="307"/>
				<Pinpack pinNum="308" padNum="308"/>
				<Pinpack pinNum="309" padNum="309"/>
				<Pinpack pinNum="310" padNum="310"/>
				<Pinpack pinNum="311" padNum="311"/>
				<Pinpack pinNum="312" padNum="312"/>
				<Pinpack pinNum="313" padNum="313"/>
				<Pinpack pinNum="314" padNum="314"/>
				<Pinpack pinNum="315" padNum="315"/>
				<Pinpack pinNum="316" padNum="316"/>
				<Pinpack pinNum="317" padNum="317"/>
				<Pinpack pinNum="318" padNum="318"/>
				<Pinpack pinNum="319" padNum="319"/>
				<Pinpack pinNum="320" padNum="320"/>
				<Pinpack pinNum="321" padNum="321"/>
				<Pinpack pinNum="322" padNum="322"/>
				<Pinpack pinNum="323" padNum="323"/>
				<Pinpack pinNum="324" padNum="324"/>
				<Pinpack pinNum="325" padNum="325"/>
				<Pinpack pinNum="326" padNum="326"/>
				<Pinpack pinNum="327" padNum="327"/>
				<Pinpack pinNum="328" padNum="328"/>
				<Pinpack pinNum="329" padNum="329"/>
				<Pinpack pinNum="330" padNum="330"/>
				<Pinpack pinNum="331" padNum="331"/>
				<Pinpack pinNum="332" padNum="332"/>
				<Pinpack pinNum="333" padNum="333"/>
				<Pinpack pinNum="334" padNum="334"/>
				<Pinpack pinNum="335" padNum="335"/>
				<Pinpack pinNum="336" padNum="336"/>
				<Pinpack pinNum="337" padNum="337"/>
				<Pinpack pinNum="338" padNum="338"/>
				<Pinpack pinNum="339" padNum="339"/>
				<Pinpack pinNum="340" padNum="340"/>
				<Pinpack pinNum="341" padNum="341"/>
				<Pinpack pinNum="342" padNum="342"/>
				<Pinpack pinNum="343" padNum="343"/>
				<Pinpack pinNum="344" padNum="344"/>
				<Pinpack pinNum="345" padNum="345"/>
				<Pinpack pinNum="346" padNum="346"/>
				<Pinpack pinNum="347" padNum="347"/>
				<Pinpack pinNum="348" padNum="348"/>
				<Pinpack pinNum="349" padNum="349"/>
				<Pinpack pinNum="350" padNum="350"/>
				<Pinpack pinNum="351" padNum="351"/>
				<Pinpack pinNum="352" padNum="352"/>
				<Pinpack pinNum="353" padNum="353"/>
				<Pinpack pinNum="354" padNum="354"/>
				<Pinpack pinNum="355" padNum="355"/>
				<Pinpack pinNum="356" padNum="356"/>
				<Pinpack pinNum="357" padNum="357"/>
				<Pinpack pinNum="358" padNum="358"/>
				<Pinpack pinNum="359" padNum="359"/>
				<Pinpack pinNum="360" padNum="360"/>
				<Pinpack pinNum="361" padNum="361"/>
				<Pinpack pinNum="362" padNum="362"/>
				<Pinpack pinNum="363" padNum="363"/>
				<Pinpack pinNum="364" padNum="364"/>
				<Pinpack pinNum="365" padNum="365"/>
				<Pinpack pinNum="366" padNum="366"/>
				<Pinpack pinNum="367" padNum="367"/>
				<Pinpack pinNum="368" padNum="368"/>
				<Pinpack pinNum="369" padNum="369"/>
				<Pinpack pinNum="370" padNum="370"/>
				<Pinpack pinNum="371" padNum="371"/>
				<Pinpack pinNum="372" padNum="372"/>
				<Pinpack pinNum="373" padNum="373"/>
				<Pinpack pinNum="374" padNum="374"/>
				<Pinpack pinNum="375" padNum="375"/>
				<Pinpack pinNum="376" padNum="376"/>
				<Pinpack pinNum="377" padNum="377"/>
				<Pinpack pinNum="378" padNum="378"/>
				<Pinpack pinNum="379" padNum="379"/>
				<Pinpack pinNum="380" padNum="380"/>
				<Pinpack pinNum="381" padNum="381"/>
				<Pinpack pinNum="382" padNum="382"/>
				<Pinpack pinNum="383" padNum="383"/>
				<Pinpack pinNum="384" padNum="384"/>
				<Pinpack pinNum="385" padNum="385"/>
				<Pinpack pinNum="386" padNum="386"/>
				<Pinpack pinNum="387" padNum="387"/>
				<Pinpack pinNum="388" padNum="388"/>
				<Pinpack pinNum="389" padNum="389"/>
				<Pinpack pinNum="390" padNum="390"/>
				<Pinpack pinNum="391" padNum="391"/>
				<Pinpack pinNum="392" padNum="392"/>
				<Pinpack pinNum="393" padNum="393"/>
				<Pinpack pinNum="394" padNum="394"/>
				<Pinpack pinNum="395" padNum="395"/>
				<Pinpack pinNum="396" padNum="396"/>
				<Pinpack pinNum="397" padNum="397"/>
				<Pinpack pinNum="398" padNum="398"/>
				<Pinpack pinNum="399" padNum="399"/>
				<Pinpack pinNum="400" padNum="400"/>
			</Package>
			<Package>
				<ComponentRef name="DDR_iMX35_1"/>
				<FootprintRef name="DDR_iMX35_1"/>
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
				<Pinpack pinNum="63" padNum="63"/>
				<Pinpack pinNum="64" padNum="64"/>
				<Pinpack pinNum="65" padNum="65"/>
				<Pinpack pinNum="66" padNum="66"/>
				<Pinpack pinNum="67" padNum="67"/>
				<Pinpack pinNum="68" padNum="68"/>
				<Pinpack pinNum="69" padNum="69"/>
				<Pinpack pinNum="70" padNum="70"/>
				<Pinpack pinNum="71" padNum="71"/>
				<Pinpack pinNum="72" padNum="72"/>
				<Pinpack pinNum="73" padNum="73"/>
				<Pinpack pinNum="74" padNum="74"/>
				<Pinpack pinNum="75" padNum="75"/>
				<Pinpack pinNum="76" padNum="76"/>
				<Pinpack pinNum="77" padNum="77"/>
				<Pinpack pinNum="78" padNum="78"/>
				<Pinpack pinNum="79" padNum="79"/>
				<Pinpack pinNum="80" padNum="80"/>
				<Pinpack pinNum="81" padNum="81"/>
				<Pinpack pinNum="82" padNum="82"/>
				<Pinpack pinNum="83" padNum="83"/>
				<Pinpack pinNum="84" padNum="84"/>
			</Package>
		</Packages>
	</LocalLibrary>

	<Constructive version="1.2">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.1">
					<Polyline>
						<Start x="118.9168" y="76.0669"/>
						<SegmentLine>
							<End x="139.4698" y="76.0669"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.1">
					<Polyline>
						<Start x="139.4698" y="76.0669"/>
						<SegmentLine>
							<End x="139.4698" y="43.6388"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.1">
					<Polyline>
						<Start x="139.4698" y="43.6388"/>
						<SegmentLine>
							<End x="118.9168" y="43.6388"/>
						</SegmentLine>
					</Polyline>
				</Shape>
				<Shape lineWidth="0.1">
					<Polyline>
						<Start x="118.9168" y="43.6388"/>
						<SegmentLine>
							<End x="118.9168" y="76.0669"/>
						</SegmentLine>
					</Polyline>
				</Shape>
			</Contour>
		</BoardOutline>
	</Constructive>

	<ComponentsOnBoard version="1.3">
		<Components>
			<CompInstance name="U1" uniqueId="SOXWETTB" side="Top" angle="180">
				<ComponentRef name="iMX35_1"/>
				<FootprintRef name="iMX35_1"/>
				<Org x="137.9" y="59.7"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="180" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H60W10"/>
							<Org x="15.875" y="-16.891"/>
						</Label>
					</Attribute>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
			<CompInstance name="U2" uniqueId="QCTEVUGQ" side="Top" angle="90">
				<ComponentRef name="DDR_iMX35_1"/>
				<FootprintRef name="DDR_iMX35_1"/>
				<Org x="123.7384" y="46.8951"/>
				<Attributes>
					<Attribute type="RefDes">
						<Label angle="270" align="LB" visible="on">
							<LayerRef name="TopSilk"/>
							<TextStyleRef name="T:H60W10"/>
							<Org x="5.6" y="4.3"/>
						</Label>
					</Attribute>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C2" uniqueId="OQDWZMTN" side="Bottom">
				<ComponentRef name="0402_1"/>
				<FootprintRef name="0402_1"/>
				<Org x="124.492" y="53.5441"/>
				<Attributes>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C3" uniqueId="KBEBJSDS" side="Bottom" angle="180">
				<ComponentRef name="0402_1"/>
				<FootprintRef name="0402_1"/>
				<Org x="133.7384" y="46.5951"/>
				<Attributes>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C4" uniqueId="SAVKCHKC" side="Bottom" angle="90">
				<ComponentRef name="0402_1"/>
				<FootprintRef name="0402_1"/>
				<Org x="131.7384" y="50.0951"/>
				<Attributes>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C5" uniqueId="XIOPTSOT" side="Bottom" angle="270">
				<ComponentRef name="0402_1"/>
				<FootprintRef name="0402_1"/>
				<Org x="130.1384" y="50.0951"/>
				<Attributes>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C6" uniqueId="XGVMAOVH" side="Bottom" angle="270">
				<ComponentRef name="0402_1"/>
				<FootprintRef name="0402_1"/>
				<Org x="126.9384" y="50.0951"/>
				<Attributes>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C7" uniqueId="GVROZTMV" side="Bottom" angle="90">
				<ComponentRef name="0402_1"/>
				<FootprintRef name="0402_1"/>
				<Org x="128.5384" y="50.0951"/>
				<Attributes>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C8" uniqueId="GWYSQSIY" side="Bottom" angle="90">
				<ComponentRef name="0402_1"/>
				<FootprintRef name="0402_1"/>
				<Org x="125.4195" y="50.0951"/>
				<Attributes>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C9" uniqueId="DWLDBSEV" side="Bottom" angle="90">
				<ComponentRef name="C1206_1"/>
				<FootprintRef name="C1206_1"/>
				<Org x="123.5384" y="49.8951"/>
				<Attributes>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
			<CompInstance name="C10" uniqueId="VVKUCNVO" side="Bottom" angle="90">
				<ComponentRef name="C1206_1"/>
				<FootprintRef name="C1206_1"/>
				<Org x="134.1221" y="49.9604"/>
				<Attributes>
					<Attribute name="Value" value=""/>
				</Attributes>
			</CompInstance>
		</Components>
	</ComponentsOnBoard>

	<NetList version="2.0">
		<Net name="NetR7_1"/>
		<Net name="NetR6_2"/>
		<Net name="NetR5_2"/>
		<Net name="1V5">
			<PinRef compName="U1" pinName="245"/>
			<PinRef compName="U1" pinName="263"/>
			<PinRef compName="U1" pinName="265"/>
		</Net>
		<Net name="1V8">
			<PinRef compName="U1" pinName="103"/>
			<PinRef compName="U1" pinName="105"/>
			<PinRef compName="U1" pinName="122"/>
			<PinRef compName="U1" pinName="123"/>
			<PinRef compName="U1" pinName="124"/>
			<PinRef compName="U1" pinName="126"/>
			<PinRef compName="U1" pinName="138"/>
			<PinRef compName="U1" pinName="139"/>
			<PinRef compName="U1" pinName="140"/>
			<PinRef compName="U1" pinName="142"/>
			<PinRef compName="U1" pinName="145"/>
			<PinRef compName="U1" pinName="160"/>
		</Net>
		<Net name="1V35">
			<PinRef compName="U1" pinName="104"/>
			<PinRef compName="U1" pinName="118"/>
			<PinRef compName="U1" pinName="119"/>
			<PinRef compName="U1" pinName="120"/>
			<PinRef compName="U1" pinName="125"/>
			<PinRef compName="U1" pinName="147"/>
			<PinRef compName="U1" pinName="167"/>
			<PinRef compName="U1" pinName="178"/>
			<PinRef compName="U1" pinName="218"/>
			<PinRef compName="U1" pinName="237"/>
			<PinRef compName="U1" pinName="258"/>
			<PinRef compName="U1" pinName="284"/>
			<PinRef compName="U1" pinName="298"/>
			<PinRef compName="U1" pinName="299"/>
		</Net>
		<Net name="3V3">
			<PinRef compName="U1" pinName="227"/>
			<PinRef compName="U1" pinName="247"/>
			<PinRef compName="U1" pinName="253"/>
			<PinRef compName="U1" pinName="269"/>
			<PinRef compName="U1" pinName="285"/>
			<PinRef compName="U1" pinName="293"/>
			<PinRef compName="U1" pinName="311"/>
			<PinRef compName="U1" pinName="353"/>
		</Net>
		<Net name="3V15">
			<PinRef compName="U1" pinName="137"/>
			<PinRef compName="U1" pinName="146"/>
			<PinRef compName="U1" pinName="157"/>
			<PinRef compName="U1" pinName="158"/>
			<PinRef compName="U1" pinName="166"/>
			<PinRef compName="U1" pinName="197"/>
			<PinRef compName="U1" pinName="198"/>
			<PinRef compName="U1" pinName="206"/>
			<PinRef compName="U1" pinName="219"/>
			<PinRef compName="U1" pinName="226"/>
			<PinRef compName="U1" pinName="257"/>
			<PinRef compName="U1" pinName="266"/>
			<PinRef compName="U1" pinName="268"/>
			<PinRef compName="U1" pinName="277"/>
			<PinRef compName="U1" pinName="278"/>
			<PinRef compName="U1" pinName="279"/>
			<PinRef compName="U1" pinName="282"/>
			<PinRef compName="U1" pinName="283"/>
			<PinRef compName="U1" pinName="300"/>
		</Net>
		<Net name="A0">
			<PinRef compName="U1" pinName="16"/>
			<PinRef compName="U2" pinName="68"/>
		</Net>
		<Net name="A1">
			<PinRef compName="U1" pinName="78"/>
			<PinRef compName="U2" pinName="66"/>
		</Net>
		<Net name="A2">
			<PinRef compName="U1" pinName="98"/>
			<PinRef compName="U2" pinName="67"/>
		</Net>
		<Net name="A3">
			<PinRef compName="U1" pinName="57"/>
			<PinRef compName="U2" pinName="71"/>
		</Net>
		<Net name="A4">
			<PinRef compName="U1" pinName="77"/>
			<PinRef compName="U2" pinName="74"/>
		</Net>
		<Net name="A5">
			<PinRef compName="U1" pinName="36"/>
			<PinRef compName="U2" pinName="72"/>
		</Net>
		<Net name="A6">
			<PinRef compName="U1" pinName="56"/>
			<PinRef compName="U2" pinName="73"/>
		</Net>
		<Net name="A7">
			<PinRef compName="U1" pinName="15"/>
			<PinRef compName="U2" pinName="75"/>
		</Net>
		<Net name="A8">
			<PinRef compName="U1" pinName="35"/>
			<PinRef compName="U2" pinName="78"/>
		</Net>
		<Net name="A9">
			<PinRef compName="U1" pinName="14"/>
			<PinRef compName="U2" pinName="76"/>
		</Net>
		<Net name="A10">
			<PinRef compName="U1" pinName="107"/>
		</Net>
		<Net name="A11">
			<PinRef compName="U1" pinName="76"/>
			<PinRef compName="U2" pinName="77"/>
		</Net>
		<Net name="A12">
			<PinRef compName="U1" pinName="117"/>
			<PinRef compName="U2" pinName="81"/>
		</Net>
		<Net name="A13">
			<PinRef compName="U1" pinName="34"/>
		</Net>
		<Net name="A14">
			<PinRef compName="U1" pinName="66"/>
		</Net>
		<Net name="A15">
			<PinRef compName="U1" pinName="67"/>
		</Net>
		<Net name="A16">
			<PinRef compName="U1" pinName="65"/>
		</Net>
		<Net name="A17">
			<PinRef compName="U1" pinName="45"/>
		</Net>
		<Net name="A18">
			<PinRef compName="U1" pinName="64"/>
		</Net>
		<Net name="A19">
			<PinRef compName="U1" pinName="63"/>
		</Net>
		<Net name="A20">
			<PinRef compName="U1" pinName="42"/>
		</Net>
		<Net name="A21">
			<PinRef compName="U1" pinName="62"/>
		</Net>
		<Net name="A22">
			<PinRef compName="U1" pinName="80"/>
		</Net>
		<Net name="A23">
			<PinRef compName="U1" pinName="58"/>
		</Net>
		<Net name="A24">
			<PinRef compName="U1" pinName="79"/>
		</Net>
		<Net name="A25">
			<PinRef compName="U1" pinName="99"/>
		</Net>
		<Net name="CAS_B">
			<PinRef compName="U1" pinName="89"/>
			<PinRef compName="U2" pinName="63"/>
		</Net>
		<Net name="D0">
			<PinRef compName="U1" pinName="12"/>
		</Net>
		<Net name="D1">
			<PinRef compName="U1" pinName="75"/>
		</Net>
		<Net name="D2">
			<PinRef compName="U1" pinName="32"/>
		</Net>
		<Net name="D3">
			<PinRef compName="U1" pinName="96"/>
		</Net>
		<Net name="D4">
			<PinRef compName="U1" pinName="54"/>
		</Net>
		<Net name="D5">
			<PinRef compName="U1" pinName="21"/>
		</Net>
		<Net name="D6">
			<PinRef compName="U1" pinName="74"/>
		</Net>
		<Net name="D7">
			<PinRef compName="U1" pinName="52"/>
		</Net>
		<Net name="DQM0">
			<PinRef compName="U1" pinName="31"/>
			<PinRef compName="U2" pinName="33"/>
		</Net>
		<Net name="DQM1">
			<PinRef compName="U1" pinName="49"/>
			<PinRef compName="U2" pinName="9"/>
		</Net>
		<Net name="DQM2">
			<PinRef compName="U1" pinName="68"/>
		</Net>
		<Net name="DQM3">
			<PinRef compName="U1" pinName="50"/>
		</Net>
		<Net name="DQS0">
			<PinRef compName="U1" pinName="86"/>
			<PinRef compName="U2" pinName="34"/>
		</Net>
		<Net name="DQS1">
			<PinRef compName="U1" pinName="83"/>
			<PinRef compName="U2" pinName="10"/>
		</Net>
		<Net name="DQS2">
			<PinRef compName="U1" pinName="82"/>
		</Net>
		<Net name="DQS3">
			<PinRef compName="U1" pinName="100"/>
		</Net>
		<Net name="EMI_1V8">
			<PinRef compName="U2" pinName="1"/>
			<PinRef compName="U2" pinName="6"/>
			<PinRef compName="U2" pinName="13"/>
			<PinRef compName="U2" pinName="15"/>
			<PinRef compName="U2" pinName="16"/>
			<PinRef compName="U2" pinName="18"/>
			<PinRef compName="U2" pinName="25"/>
			<PinRef compName="U2" pinName="30"/>
			<PinRef compName="U2" pinName="37"/>
			<PinRef compName="U2" pinName="39"/>
			<PinRef compName="U2" pinName="40"/>
			<PinRef compName="U2" pinName="42"/>
			<PinRef compName="U2" pinName="49"/>
			<PinRef compName="U2" pinName="54"/>
			<PinRef compName="U2" pinName="69"/>
			<PinRef compName="U2" pinName="80"/>
			<PinRef compName="C2" pinName="2"/>
			<PinRef compName="C3" pinName="2"/>
			<PinRef compName="C4" pinName="2"/>
			<PinRef compName="C5" pinName="2"/>
			<PinRef compName="C6" pinName="2"/>
			<PinRef compName="C7" pinName="2"/>
			<PinRef compName="C8" pinName="2"/>
			<PinRef compName="C9" pinName="2"/>
			<PinRef compName="C10" pinName="2"/>
		</Net>
		<Net name="GND">
			<PinRef compName="U1" pinName="1"/>
			<PinRef compName="U1" pinName="13"/>
			<PinRef compName="U1" pinName="102"/>
			<PinRef compName="U1" pinName="106"/>
			<PinRef compName="U1" pinName="143"/>
			<PinRef compName="U1" pinName="144"/>
			<PinRef compName="U1" pinName="159"/>
			<PinRef compName="U1" pinName="162"/>
			<PinRef compName="U1" pinName="163"/>
			<PinRef compName="U1" pinName="164"/>
			<PinRef compName="U1" pinName="165"/>
			<PinRef compName="U1" pinName="179"/>
			<PinRef compName="U1" pinName="180"/>
			<PinRef compName="U1" pinName="182"/>
			<PinRef compName="U1" pinName="183"/>
			<PinRef compName="U1" pinName="184"/>
			<PinRef compName="U1" pinName="185"/>
			<PinRef compName="U1" pinName="199"/>
			<PinRef compName="U1" pinName="200"/>
			<PinRef compName="U1" pinName="202"/>
			<PinRef compName="U1" pinName="203"/>
			<PinRef compName="U1" pinName="204"/>
			<PinRef compName="U1" pinName="205"/>
			<PinRef compName="U1" pinName="220"/>
			<PinRef compName="U1" pinName="222"/>
			<PinRef compName="U1" pinName="223"/>
			<PinRef compName="U1" pinName="224"/>
			<PinRef compName="U1" pinName="225"/>
			<PinRef compName="U1" pinName="238"/>
			<PinRef compName="U1" pinName="239"/>
			<PinRef compName="U1" pinName="240"/>
			<PinRef compName="U1" pinName="242"/>
			<PinRef compName="U1" pinName="243"/>
			<PinRef compName="U1" pinName="244"/>
			<PinRef compName="U1" pinName="246"/>
			<PinRef compName="U1" pinName="248"/>
			<PinRef compName="U1" pinName="259"/>
			<PinRef compName="U1" pinName="260"/>
			<PinRef compName="U1" pinName="262"/>
			<PinRef compName="U1" pinName="264"/>
			<PinRef compName="U1" pinName="273"/>
			<PinRef compName="U1" pinName="280"/>
			<PinRef compName="U1" pinName="290"/>
			<PinRef compName="U1" pinName="309"/>
			<PinRef compName="U1" pinName="310"/>
			<PinRef compName="U1" pinName="331"/>
			<PinRef compName="U1" pinName="381"/>
			<PinRef compName="U1" pinName="393"/>
			<PinRef compName="U2" pinName="3"/>
			<PinRef compName="U2" pinName="4"/>
			<PinRef compName="U2" pinName="8"/>
			<PinRef compName="U2" pinName="11"/>
			<PinRef compName="U2" pinName="20"/>
			<PinRef compName="U2" pinName="23"/>
			<PinRef compName="U2" pinName="27"/>
			<PinRef compName="U2" pinName="28"/>
			<PinRef compName="U2" pinName="35"/>
			<PinRef compName="U2" pinName="44"/>
			<PinRef compName="U2" pinName="47"/>
			<PinRef compName="U2" pinName="51"/>
			<PinRef compName="U2" pinName="52"/>
			<PinRef compName="U2" pinName="70"/>
			<PinRef compName="U2" pinName="79"/>
			<PinRef compName="C2" pinName="1"/>
			<PinRef compName="C3" pinName="1"/>
			<PinRef compName="C4" pinName="1"/>
			<PinRef compName="C5" pinName="1"/>
			<PinRef compName="C6" pinName="1"/>
			<PinRef compName="C7" pinName="1"/>
			<PinRef compName="C8" pinName="1"/>
			<PinRef compName="C9" pinName="1"/>
			<PinRef compName="C10" pinName="1"/>
		</Net>
		<Net name="MA10">
			<PinRef compName="U1" pinName="55"/>
			<PinRef compName="U2" pinName="65"/>
		</Net>
		<Net name="NetC21_1"/>
		<Net name="NetR1_2">
			<PinRef compName="U2" pinName="5"/>
		</Net>
		<Net name="NetR2_2">
			<PinRef compName="U2" pinName="29"/>
		</Net>
		<Net name="NetR3_1">
			<PinRef compName="U2" pinName="59"/>
		</Net>
		<Net name="NetR13_1"/>
		<Net name="NetR14_2"/>
		<Net name="NetU1_B20">
			<PinRef compName="U1" pinName="33"/>
			<PinRef compName="U2" pinName="64"/>
		</Net>
		<Net name="NetU1_C19">
			<PinRef compName="U1" pinName="51"/>
		</Net>
		<Net name="NFALE">
			<PinRef compName="U1" pinName="112"/>
		</Net>
		<Net name="NFCE_B">
			<PinRef compName="U1" pinName="134"/>
		</Net>
		<Net name="NFCLE">
			<PinRef compName="U1" pinName="81"/>
		</Net>
		<Net name="NFRB0"/>
		<Net name="NFRB3"/>
		<Net name="NFRB">
			<PinRef compName="U1" pinName="114"/>
		</Net>
		<Net name="NFRE_B">
			<PinRef compName="U1" pinName="101"/>
		</Net>
		<Net name="NFWE_B">
			<PinRef compName="U1" pinName="132"/>
		</Net>
		<Net name="NFWP_B">
			<PinRef compName="U1" pinName="115"/>
		</Net>
		<Net name="RAS_B">
			<PinRef compName="U1" pinName="88"/>
			<PinRef compName="U2" pinName="57"/>
		</Net>
		<Net name="SD0">
			<PinRef compName="U1" pinName="29"/>
			<PinRef compName="U2" pinName="41"/>
		</Net>
		<Net name="SD1">
			<PinRef compName="U1" pinName="11"/>
			<PinRef compName="U2" pinName="38"/>
		</Net>
		<Net name="SD2">
			<PinRef compName="U1" pinName="30"/>
			<PinRef compName="U2" pinName="46"/>
		</Net>
		<Net name="SD3">
			<PinRef compName="U1" pinName="48"/>
			<PinRef compName="U2" pinName="45"/>
		</Net>
		<Net name="SD4">
			<PinRef compName="U1" pinName="10"/>
			<PinRef compName="U2" pinName="43"/>
		</Net>
		<Net name="SD5">
			<PinRef compName="U1" pinName="47"/>
			<PinRef compName="U2" pinName="48"/>
		</Net>
		<Net name="SD6">
			<PinRef compName="U1" pinName="9"/>
			<PinRef compName="U2" pinName="31"/>
		</Net>
		<Net name="SD7">
			<PinRef compName="U1" pinName="28"/>
			<PinRef compName="U2" pinName="36"/>
		</Net>
		<Net name="SD8">
			<PinRef compName="U1" pinName="46"/>
			<PinRef compName="U2" pinName="17"/>
		</Net>
		<Net name="SD9">
			<PinRef compName="U1" pinName="8"/>
			<PinRef compName="U2" pinName="14"/>
		</Net>
		<Net name="SD10">
			<PinRef compName="U1" pinName="7"/>
			<PinRef compName="U2" pinName="22"/>
		</Net>
		<Net name="SD11">
			<PinRef compName="U1" pinName="27"/>
			<PinRef compName="U2" pinName="21"/>
		</Net>
		<Net name="SD12">
			<PinRef compName="U1" pinName="25"/>
			<PinRef compName="U2" pinName="19"/>
		</Net>
		<Net name="SD13">
			<PinRef compName="U1" pinName="26"/>
			<PinRef compName="U2" pinName="24"/>
		</Net>
		<Net name="SD14">
			<PinRef compName="U1" pinName="6"/>
			<PinRef compName="U2" pinName="7"/>
		</Net>
		<Net name="SD15">
			<PinRef compName="U1" pinName="5"/>
			<PinRef compName="U2" pinName="12"/>
		</Net>
		<Net name="SDBA0">
			<PinRef compName="U1" pinName="17"/>
			<PinRef compName="U2" pinName="61"/>
		</Net>
		<Net name="SDBA1">
			<PinRef compName="U1" pinName="37"/>
			<PinRef compName="U2" pinName="62"/>
		</Net>
		<Net name="SDCKE0">
			<PinRef compName="U1" pinName="70"/>
			<PinRef compName="U2" pinName="55"/>
		</Net>
		<Net name="SDCKE1">
			<PinRef compName="U1" pinName="69"/>
		</Net>
		<Net name="SDCLK_B">
			<PinRef compName="U1" pinName="85"/>
			<PinRef compName="U2" pinName="58"/>
		</Net>
		<Net name="SDCLK">
			<PinRef compName="U1" pinName="84"/>
			<PinRef compName="U2" pinName="53"/>
		</Net>
		<Net name="SDWE_B">
			<PinRef compName="U1" pinName="127"/>
			<PinRef compName="U2" pinName="56"/>
		</Net>
		<Net name="VREF">
			<PinRef compName="U2" pinName="50"/>
		</Net>
	</NetList>

	<Groups version="1.1">
		<NetGroups>
			<NetGroup name="ADD_DDR">
				<NetRef name="SDBA1"/>
				<NetRef name="SDBA0"/>
				<NetRef name="MA10"/>
				<NetRef name="A12"/>
				<NetRef name="A11"/>
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
			</NetGroup>
			<NetGroup name="CTRL_DDR">
				<NetRef name="SDWE_B"/>
				<NetRef name="SDCKE0"/>
				<NetRef name="RAS_B"/>
				<NetRef name="CAS_B"/>
			</NetGroup>
			<NetGroup name="DATA_DDR">
				<NetRef name="SD15"/>
				<NetRef name="SD14"/>
				<NetRef name="SD13"/>
				<NetRef name="SD12"/>
				<NetRef name="SD11"/>
				<NetRef name="SD10"/>
				<NetRef name="SD9"/>
				<NetRef name="SD8"/>
				<NetRef name="SD7"/>
				<NetRef name="SD6"/>
				<NetRef name="SD5"/>
				<NetRef name="SD4"/>
				<NetRef name="SD3"/>
				<NetRef name="SD2"/>
				<NetRef name="SD1"/>
				<NetRef name="SD0"/>
				<NetRef name="DQS1"/>
				<NetRef name="DQS0"/>
				<NetRef name="DQM1"/>
				<NetRef name="DQM0"/>
			</NetGroup>
			<NetGroup name="POWER">
				<NetRef name="3V15"/>
				<NetRef name="3V3"/>
				<NetRef name="EMI_1V8"/>
				<NetRef name="1V35"/>
				<NetRef name="1V8"/>
				<NetRef name="1V5"/>
			</NetGroup>
		</NetGroups>
	</Groups>

	<HiSpeedRules version="3.0">
		<RulesImpedances>
			<Impedance name="Z0_50" Z0="50">
				<LayerRule width="0.15">
					<LayerRef name="Top"/>
				</LayerRule>
				<LayerRule width="0.15">
					<LayerRef name="Int 1"/>
				</LayerRule>
				<LayerRule width="0.15">
					<LayerRef name="Int 2"/>
				</LayerRule>
				<LayerRule width="0.15">
					<LayerRef name="Int 3"/>
				</LayerRule>
				<LayerRule width="0.15">
					<LayerRef name="Int 4"/>
				</LayerRule>
				<LayerRule width="0.15">
					<LayerRef name="Bottom"/>
				</LayerRule>
				<LayerRule width="0.15">
					<LayerRef name="INT_PWR"/>
				</LayerRule>
			</Impedance>
			<ImpedanceDiff name="ZDiff_100" Z0="100">
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Top"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Int 1"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Int 2"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Int 3"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="INT_PWR"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Int 4"/>
				</LayerRule>
				<LayerRule width="0.2" gap="0.15">
					<LayerRef name="Bottom"/>
				</LayerRule>
			</ImpedanceDiff>
			<ImpedanceDiff name="Rule0" Z0="90">
				<LayerRule width="0.15" gap="0.25">
					<LayerRef name="Int 3"/>
				</LayerRule>
				<LayerRule width="0.15" gap="0.25">
					<LayerRef name="Bottom"/>
				</LayerRule>
				<LayerRule width="0.15" gap="0.25">
					<LayerRef name="Int 4"/>
				</LayerRule>
				<LayerRule width="0.15" gap="0.25">
					<LayerRef name="INT_PWR"/>
				</LayerRule>
				<LayerRule width="0.15" gap="0.25">
					<LayerRef name="Int 2"/>
				</LayerRule>
				<LayerRule width="0.15" gap="0.25">
					<LayerRef name="Int 1"/>
				</LayerRule>
				<LayerRule width="0.15" gap="0.25">
					<LayerRef name="Top"/>
				</LayerRule>
			</ImpedanceDiff>
		</RulesImpedances>
		<SignalClusters>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="16"/>
				<Nets>
					<NetRef name="A0"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="16"/>
						<PinRef compName="U2" pinName="68"/>
					</PinPair>
				</PinPairs>
				<Signal name="A0">
					<ReceiverPinRef compName="U2" pinName="68"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="78"/>
				<Nets>
					<NetRef name="A1"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="78"/>
						<PinRef compName="U2" pinName="66"/>
					</PinPair>
				</PinPairs>
				<Signal name="A1">
					<ReceiverPinRef compName="U2" pinName="66"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="98"/>
				<Nets>
					<NetRef name="A2"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="98"/>
						<PinRef compName="U2" pinName="67"/>
					</PinPair>
				</PinPairs>
				<Signal name="A2">
					<ReceiverPinRef compName="U2" pinName="67"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="57"/>
				<Nets>
					<NetRef name="A3"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="57"/>
						<PinRef compName="U2" pinName="71"/>
					</PinPair>
				</PinPairs>
				<Signal name="A3">
					<ReceiverPinRef compName="U2" pinName="71"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="77"/>
				<Nets>
					<NetRef name="A4"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="77"/>
						<PinRef compName="U2" pinName="74"/>
					</PinPair>
				</PinPairs>
				<Signal name="A4">
					<ReceiverPinRef compName="U2" pinName="74"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="36"/>
				<Nets>
					<NetRef name="A5"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="36"/>
						<PinRef compName="U2" pinName="72"/>
					</PinPair>
				</PinPairs>
				<Signal name="A5">
					<ReceiverPinRef compName="U2" pinName="72"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="56"/>
				<Nets>
					<NetRef name="A6"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="56"/>
						<PinRef compName="U2" pinName="73"/>
					</PinPair>
				</PinPairs>
				<Signal name="A6">
					<ReceiverPinRef compName="U2" pinName="73"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="15"/>
				<Nets>
					<NetRef name="A7"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="15"/>
						<PinRef compName="U2" pinName="75"/>
					</PinPair>
				</PinPairs>
				<Signal name="A7">
					<ReceiverPinRef compName="U2" pinName="75"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="35"/>
				<Nets>
					<NetRef name="A8"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="35"/>
						<PinRef compName="U2" pinName="78"/>
					</PinPair>
				</PinPairs>
				<Signal name="A8">
					<ReceiverPinRef compName="U2" pinName="78"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="14"/>
				<Nets>
					<NetRef name="A9"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="14"/>
						<PinRef compName="U2" pinName="76"/>
					</PinPair>
				</PinPairs>
				<Signal name="A9">
					<ReceiverPinRef compName="U2" pinName="76"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="76"/>
				<Nets>
					<NetRef name="A11"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="76"/>
						<PinRef compName="U2" pinName="77"/>
					</PinPair>
				</PinPairs>
				<Signal name="A11">
					<ReceiverPinRef compName="U2" pinName="77"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="117"/>
				<Nets>
					<NetRef name="A12"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="117"/>
						<PinRef compName="U2" pinName="81"/>
					</PinPair>
				</PinPairs>
				<Signal name="A12">
					<ReceiverPinRef compName="U2" pinName="81"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="89"/>
				<Nets>
					<NetRef name="CAS_B"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="89"/>
						<PinRef compName="U2" pinName="63"/>
					</PinPair>
				</PinPairs>
				<Signal name="CAS_B">
					<ReceiverPinRef compName="U2" pinName="63"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="31"/>
				<Nets>
					<NetRef name="DQM0"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="31"/>
						<PinRef compName="U2" pinName="33"/>
					</PinPair>
				</PinPairs>
				<Signal name="DQM0">
					<ReceiverPinRef compName="U2" pinName="33"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="49"/>
				<Nets>
					<NetRef name="DQM1"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="49"/>
						<PinRef compName="U2" pinName="9"/>
					</PinPair>
				</PinPairs>
				<Signal name="DQM1">
					<ReceiverPinRef compName="U2" pinName="9"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="86"/>
				<Nets>
					<NetRef name="DQS0"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="86"/>
						<PinRef compName="U2" pinName="34"/>
					</PinPair>
				</PinPairs>
				<Signal name="DQS0">
					<ReceiverPinRef compName="U2" pinName="34"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="83"/>
				<Nets>
					<NetRef name="DQS1"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="83"/>
						<PinRef compName="U2" pinName="10"/>
					</PinPair>
				</PinPairs>
				<Signal name="DQS1">
					<ReceiverPinRef compName="U2" pinName="10"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="55"/>
				<Nets>
					<NetRef name="MA10"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="55"/>
						<PinRef compName="U2" pinName="65"/>
					</PinPair>
				</PinPairs>
				<Signal name="MA10">
					<ReceiverPinRef compName="U2" pinName="65"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="88"/>
				<Nets>
					<NetRef name="RAS_B"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="88"/>
						<PinRef compName="U2" pinName="57"/>
					</PinPair>
				</PinPairs>
				<Signal name="RAS_B">
					<ReceiverPinRef compName="U2" pinName="57"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="29"/>
				<Nets>
					<NetRef name="SD0"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="29"/>
						<PinRef compName="U2" pinName="41"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD0">
					<ReceiverPinRef compName="U2" pinName="41"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="11"/>
				<Nets>
					<NetRef name="SD1"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="11"/>
						<PinRef compName="U2" pinName="38"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD1">
					<ReceiverPinRef compName="U2" pinName="38"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="30"/>
				<Nets>
					<NetRef name="SD2"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="30"/>
						<PinRef compName="U2" pinName="46"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD2">
					<ReceiverPinRef compName="U2" pinName="46"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="48"/>
				<Nets>
					<NetRef name="SD3"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="48"/>
						<PinRef compName="U2" pinName="45"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD3">
					<ReceiverPinRef compName="U2" pinName="45"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="10"/>
				<Nets>
					<NetRef name="SD4"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="10"/>
						<PinRef compName="U2" pinName="43"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD4">
					<ReceiverPinRef compName="U2" pinName="43"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="47"/>
				<Nets>
					<NetRef name="SD5"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="47"/>
						<PinRef compName="U2" pinName="48"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD5">
					<ReceiverPinRef compName="U2" pinName="48"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="9"/>
				<Nets>
					<NetRef name="SD6"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="9"/>
						<PinRef compName="U2" pinName="31"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD6">
					<ReceiverPinRef compName="U2" pinName="31"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="28"/>
				<Nets>
					<NetRef name="SD7"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="28"/>
						<PinRef compName="U2" pinName="36"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD7">
					<ReceiverPinRef compName="U2" pinName="36"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="46"/>
				<Nets>
					<NetRef name="SD8"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="46"/>
						<PinRef compName="U2" pinName="17"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD8">
					<ReceiverPinRef compName="U2" pinName="17"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="8"/>
				<Nets>
					<NetRef name="SD9"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="8"/>
						<PinRef compName="U2" pinName="14"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD9">
					<ReceiverPinRef compName="U2" pinName="14"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="7"/>
				<Nets>
					<NetRef name="SD10"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="7"/>
						<PinRef compName="U2" pinName="22"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD10">
					<ReceiverPinRef compName="U2" pinName="22"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="27"/>
				<Nets>
					<NetRef name="SD11"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="27"/>
						<PinRef compName="U2" pinName="21"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD11">
					<ReceiverPinRef compName="U2" pinName="21"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="25"/>
				<Nets>
					<NetRef name="SD12"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="25"/>
						<PinRef compName="U2" pinName="19"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD12">
					<ReceiverPinRef compName="U2" pinName="19"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="26"/>
				<Nets>
					<NetRef name="SD13"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="26"/>
						<PinRef compName="U2" pinName="24"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD13">
					<ReceiverPinRef compName="U2" pinName="24"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="6"/>
				<Nets>
					<NetRef name="SD14"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="6"/>
						<PinRef compName="U2" pinName="7"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD14">
					<ReceiverPinRef compName="U2" pinName="7"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="5"/>
				<Nets>
					<NetRef name="SD15"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="5"/>
						<PinRef compName="U2" pinName="12"/>
					</PinPair>
				</PinPairs>
				<Signal name="SD15">
					<ReceiverPinRef compName="U2" pinName="12"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="17"/>
				<Nets>
					<NetRef name="SDBA0"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="17"/>
						<PinRef compName="U2" pinName="61"/>
					</PinPair>
				</PinPairs>
				<Signal name="SDBA0">
					<ReceiverPinRef compName="U2" pinName="61"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="37"/>
				<Nets>
					<NetRef name="SDBA1"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="37"/>
						<PinRef compName="U2" pinName="62"/>
					</PinPair>
				</PinPairs>
				<Signal name="SDBA1">
					<ReceiverPinRef compName="U2" pinName="62"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="70"/>
				<Nets>
					<NetRef name="SDCKE0"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="70"/>
						<PinRef compName="U2" pinName="55"/>
					</PinPair>
				</PinPairs>
				<Signal name="SDCKE0">
					<ReceiverPinRef compName="U2" pinName="55"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="85"/>
				<Nets>
					<NetRef name="SDCLK_B"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="85"/>
						<PinRef compName="U2" pinName="58"/>
					</PinPair>
				</PinPairs>
				<Signal name="SDCLK_B">
					<ReceiverPinRef compName="U2" pinName="58"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="84"/>
				<Nets>
					<NetRef name="SDCLK"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="84"/>
						<PinRef compName="U2" pinName="53"/>
					</PinPair>
				</PinPairs>
				<Signal name="SDCLK">
					<ReceiverPinRef compName="U2" pinName="53"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
			<SignalCluster>
				<ImpedanceRef name="Z0_50"/>
				<SourcePinRef compName="U1" pinName="127"/>
				<Nets>
					<NetRef name="SDWE_B"/>
				</Nets>
				<PinPairs>
					<PinPair>
						<PinRef compName="U1" pinName="127"/>
						<PinRef compName="U2" pinName="56"/>
					</PinPair>
				</PinPairs>
				<Signal name="SDWE_B">
					<ReceiverPinRef compName="U2" pinName="56"/>
					<Components>
						<CompInstanceRef name="U1"/>
						<CompInstanceRef name="U2"/>
					</Components>
				</Signal>
			</SignalCluster>
		</SignalClusters>
		<DiffSignals>
			<DiffSignal name="SDCLK_U2" mismatch="0.01">
				<ImpedanceRef name="Rule0"/>
				<SignalRef name="SDCLK_B"/>
				<SignalRef name="SDCLK"/>
			</DiffSignal>
		</DiffSignals>
		<SignalGroups>
			<SignalGroup name="ADD_DDR">
				<SignalRef name="A0"/>
				<SignalRef name="A1"/>
				<SignalRef name="A2"/>
				<SignalRef name="A3"/>
				<SignalRef name="A4"/>
				<SignalRef name="A5"/>
				<SignalRef name="A6"/>
				<SignalRef name="A7"/>
				<SignalRef name="A8"/>
				<SignalRef name="A9"/>
				<SignalRef name="A11"/>
				<SignalRef name="A12"/>
				<SignalRef name="MA10"/>
				<SignalRef name="SDBA0"/>
				<SignalRef name="SDBA1"/>
			</SignalGroup>
			<SignalGroup name="CTRL_DDR">
				<SignalRef name="CAS_B"/>
				<SignalRef name="RAS_B"/>
				<SignalRef name="SDCKE0"/>
				<SignalRef name="SDWE_B"/>
			</SignalGroup>
			<SignalGroup name="DATA_DDR">
				<SignalRef name="DQM0"/>
				<SignalRef name="DQM1"/>
				<SignalRef name="DQS0"/>
				<SignalRef name="DQS1"/>
				<SignalRef name="SD0"/>
				<SignalRef name="SD1"/>
				<SignalRef name="SD2"/>
				<SignalRef name="SD3"/>
				<SignalRef name="SD4"/>
				<SignalRef name="SD5"/>
				<SignalRef name="SD6"/>
				<SignalRef name="SD7"/>
				<SignalRef name="SD8"/>
				<SignalRef name="SD9"/>
				<SignalRef name="SD10"/>
				<SignalRef name="SD11"/>
				<SignalRef name="SD12"/>
				<SignalRef name="SD13"/>
				<SignalRef name="SD14"/>
				<SignalRef name="SD15"/>
			</SignalGroup>
		</SignalGroups>
		<RulesDelay>
			<DelayEqual enabled="on" valueType="Time" tolerance="1">
				<ObjectsAffected>
					<SignalGroupRef name="ADD_DDR"/>
				</ObjectsAffected>
			</DelayEqual>
			<DelayEqual enabled="on" valueType="Time" tolerance="1">
				<ObjectsAffected>
					<SignalGroupRef name="CTRL_DDR"/>
				</ObjectsAffected>
			</DelayEqual>
			<DelayEqual enabled="on" valueType="Time" tolerance="1">
				<ObjectsAffected>
					<SignalGroupRef name="DATA_DDR"/>
				</ObjectsAffected>
			</DelayEqual>
			<DelayRelation enabled="on" valueType="Time" constant="-6.5" toleranceUnder="1" toleranceOver="1">
				<ObjectLeft>
					<SignalGroupRef name="ADD_DDR"/>
				</ObjectLeft>
				<ObjectRight>
					<DiffSignalRef name="SDCLK_U2"/>
				</ObjectRight>
			</DelayRelation>
			<DelayRelation enabled="on" valueType="Time" constant="-6.5" toleranceUnder="1" toleranceOver="1">
				<ObjectLeft>
					<SignalGroupRef name="CTRL_DDR"/>
				</ObjectLeft>
				<ObjectRight>
					<DiffSignalRef name="SDCLK_U2"/>
				</ObjectRight>
			</DelayRelation>
			<DelayRelation enabled="on" valueType="Time" constant="-6.5" toleranceUnder="1" toleranceOver="1">
				<ObjectLeft>
					<SignalGroupRef name="DATA_DDR"/>
				</ObjectLeft>
				<ObjectRight>
					<DiffSignalRef name="SDCLK_U2"/>
				</ObjectRight>
			</DelayRelation>
		</RulesDelay>
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
				<NetRef name="EMI_1V8"/>
				<NetRef name="GND"/>
			</ExcludedNets>
		</SignalSearchSettings>
	</HiSpeedRules>

	<Rules version="2.0">
		<RulesWidthOfWires>
			<WidthOfWires enabled="on" widthMin="0.15" widthNom="0.15">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
			</WidthOfWires>
		</RulesWidthOfWires>
		<RulesClearancesNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0.125" clrnNom="0.1875">
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
		<RulesPlaneLayersNets>
			<PlaneLayerNets enabled="on">
				<LayerRef name="INT_GND"/>
				<ObjectsAffected>
					<NetRef name="GND"/>
				</ObjectsAffected>
			</PlaneLayerNets>
		</RulesPlaneLayersNets>
		<RulesSignalLayersNets>
			<SignalLayerNets enabled="on">
				<LayerRef name="Int 1"/>
				<ObjectsAffected>
					<NetGroupRef name="ADD_DDR"/>
					<NetGroupRef name="CTRL_DDR"/>
					<NetGroupRef name="DATA_DDR"/>
					<NetRef name="SDCLK"/>
					<NetRef name="SDCLK_B"/>
				</ObjectsAffected>
			</SignalLayerNets>
			<SignalLayerNets enabled="on">
				<LayerRef name="Int 2"/>
				<ObjectsAffected>
					<NetRef name="SDCLK"/>
					<NetRef name="SDCLK_B"/>
					<NetGroupRef name="ADD_DDR"/>
					<NetGroupRef name="CTRL_DDR"/>
					<NetGroupRef name="DATA_DDR"/>
				</ObjectsAffected>
			</SignalLayerNets>
			<SignalLayerNets enabled="on">
				<LayerRef name="Int 3"/>
				<ObjectsAffected>
					<NetGroupRef name="ADD_DDR"/>
					<NetGroupRef name="CTRL_DDR"/>
					<NetGroupRef name="DATA_DDR"/>
					<NetRef name="SDCLK"/>
					<NetRef name="SDCLK_B"/>
				</ObjectsAffected>
			</SignalLayerNets>
			<SignalLayerNets enabled="on">
				<LayerRef name="Int 4"/>
				<ObjectsAffected>
					<NetRef name="SDCLK"/>
					<NetRef name="SDCLK_B"/>
					<NetGroupRef name="ADD_DDR"/>
					<NetGroupRef name="CTRL_DDR"/>
					<NetGroupRef name="DATA_DDR"/>
				</ObjectsAffected>
			</SignalLayerNets>
			<SignalLayerNets enabled="on">
				<LayerRef name="INT_PWR"/>
				<ObjectsAffected>
					<NetGroupRef name="POWER"/>
				</ObjectsAffected>
			</SignalLayerNets>
		</RulesSignalLayersNets>
		<NetProperties>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetR7_1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetR6_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetR5_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="1V5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="1V8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="1V35"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="3V3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="3V15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A16"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A17"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A18"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A19"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A20"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A21"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A22"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A23"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A24"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="A25"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="CAS_B"/>
			</NetProperty>
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
				<NetRef name="DQM0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DQM1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DQM2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DQM3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DQS0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DQS1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DQS2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="DQS3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="EMI_1V8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="GND"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="MA10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetC21_1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetR1_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetR2_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetR3_1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetR13_1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetR14_2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetU1_B20"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NetU1_C19"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NFALE"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NFCE_B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NFCLE"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NFRB0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NFRB3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NFRB"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NFRE_B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NFWE_B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="NFWP_B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="RAS_B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD2"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD3"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD4"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD5"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD6"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD7"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD8"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD9"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD10"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD11"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD12"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD13"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD14"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SD15"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SDBA0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SDBA1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SDCKE0"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SDCKE1"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SDCLK_B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SDCLK"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="SDWE_B"/>
			</NetProperty>
			<NetProperty flexfix="off" route="on">
				<NetRef name="VREF"/>
			</NetProperty>
		</NetProperties>
		<PadConnectSettings mode="AutoConnect"/>
	</Rules>

	<Connectivity version="1.3">
		<Vias>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V3"/>
				<Org x="123.0545" y="72.9827"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="137.564" y="74.564"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="123.036" y="74.564"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="123.89" y="72.8902"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="124.7097" y="72.09"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="123.9098" y="72.09"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V3"/>
				<Org x="123.1475" y="72.0193"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="133.49" y="71.26"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="132.61" y="71.27"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="131.89" y="71.19"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="131.05" y="71.27"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="129.51" y="71.26"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="128.81" y="71.29"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V3"/>
				<Org x="127.91" y="71.19"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="123.91" y="71.29"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V3"/>
				<Org x="123.09" y="71.25"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="134.19" y="70.49"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="133.4458" y="70.426"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="132.6489" y="70.4229"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.8798" y="70.4598"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.0402" y="70.4699"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V5"/>
				<Org x="129.5" y="70.42"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="128.7599" y="70.4699"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V5"/>
				<Org x="127.91" y="70.39"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="127.14" y="70.49"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="126.31" y="70.39"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V3"/>
				<Org x="124.7551" y="70.4271"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="123.09" y="70.49"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="134.24" y="69.7"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="133.49" y="69.59"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="132.6602" y="69.6599"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.8309" y="69.641"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.06" y="69.66"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="129.51" y="69.69"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="128.744" y="69.6159"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V5"/>
				<Org x="127.94" y="69.7"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="127.15" y="69.68"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V3"/>
				<Org x="126.3" y="69.62"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="125.5398" y="69.66"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="134.19" y="68.89"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="133.4782" y="68.824"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="132.66" y="68.82"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.8212" y="68.8507"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.04" y="68.87"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="129.51" y="68.89"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="128.764" y="68.836"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="127.964" y="68.836"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="127.1" y="68.87"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V3"/>
				<Org x="126.34" y="68.9"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="133.49" y="68.07"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="132.6169" y="67.3451"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.8702" y="68.0499"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.09" y="68.09"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="129.51" y="68.09"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="128.71" y="68.09"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="127.91" y="68.09"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="127.12" y="68.08"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V3"/>
				<Org x="123.0399" y="69.632"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="137.574" y="60.0458"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="122.6586" y="59.1794"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="123.4494" y="49.6182"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="122.8059" y="52.4174"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="135.37" y="51.33"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="126.0798" y="50.8796"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="133.4" y="45.8998"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="132.2698" y="46.45"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="135.2906" y="52.9613"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="123.2827" y="46.6434"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="122.8193" y="47.3951"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="135.35" y="48.16"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="132.4" y="49.2"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="132.1286" y="52.9932"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="122.975" y="53.1948"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="135.1384" y="46.3951"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="125.12" y="46.37"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="130.3855" y="46.435"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="127.2768" y="53.6932"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="130.5207" y="53.6321"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="124.5" y="54.14"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDBA0"/>
				<Org x="133.3654" y="59.2905"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD15"/>
				<Org x="128.6517" y="60.054"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD15"/>
				<Org x="124.0005" y="54.206"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD14"/>
				<Org x="127.8007" y="60.0712"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD14"/>
				<Org x="124.13" y="46.4898"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD13"/>
				<Org x="126.5151" y="52.963"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD12"/>
				<Org x="125.7434" y="46.5041"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD10"/>
				<Org x="127.1793" y="60.0519"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD9"/>
				<Org x="124.8183" y="59.2739"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD7"/>
				<Org x="128.0792" y="53.6615"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD6"/>
				<Org x="125.3772" y="60.0946"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD6"/>
				<Org x="127.3735" y="47.2374"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD5"/>
				<Org x="129.6729" y="53.6678"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD4"/>
				<Org x="124.0333" y="59.2947"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD4"/>
				<Org x="129.0675" y="46.4142"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD1"/>
				<Org x="123.145" y="59.3832"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A12"/>
				<Org x="135.4752" y="47.6336"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A11"/>
				<Org x="135.3405" y="52.0786"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A9"/>
				<Org x="136.7023" y="60.0016"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A9"/>
				<Org x="135.3395" y="48.8145"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A7"/>
				<Org x="135.8761" y="59.4035"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A6"/>
				<Org x="132.9216" y="51.371"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A2"/>
				<Org x="132.8731" y="52.0676"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A0"/>
				<Org x="135.6374" y="58.9399"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="DQM0"/>
				<Org x="123.1727" y="60.154"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD2"/>
				<Org x="123.925" y="60.1637"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD0"/>
				<Org x="124.8026" y="60.1255"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD7"/>
				<Org x="125.5713" y="60.8719"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD11"/>
				<Org x="126.4121" y="60.1161"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD13"/>
				<Org x="127.206" y="60.8779"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD12"/>
				<Org x="127.9436" y="60.8248"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDBA1"/>
				<Org x="133.5054" y="60.1794"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A5"/>
				<Org x="134.3012" y="60.2262"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A8"/>
				<Org x="135.8901" y="60.1968"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="DQM1"/>
				<Org x="124.753" y="60.975"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD3"/>
				<Org x="125.5241" y="61.599"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD5"/>
				<Org x="127.1128" y="61.7078"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD8"/>
				<Org x="127.8191" y="61.6843"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A3"/>
				<Org x="134.2124" y="60.9404"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A6"/>
				<Org x="135.0768" y="60.9745"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A1"/>
				<Org x="132.7005" y="61.6718"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A4"/>
				<Org x="134.2087" y="61.7343"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="MA10"/>
				<Org x="135.1448" y="61.6955"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDCKE0"/>
				<Org x="124.7118" y="61.6884"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="CAS_B"/>
				<Org x="125.4655" y="63.2088"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="RAS_B"/>
				<Org x="126.2847" y="63.1969"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="DQS0"/>
				<Org x="127.0662" y="62.5261"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDCLK_B"/>
				<Org x="128.6101" y="63.2714"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDCLK"/>
				<Org x="128.7831" y="62.5051"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="DQS1"/>
				<Org x="130.3" y="63.3"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A2"/>
				<Org x="132.7599" y="62.5199"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A11"/>
				<Org x="134.3079" y="62.3797"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="127.1337" y="63.3771"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="127.95" y="63.33"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="129.5163" y="63.3793"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="130.2093" y="64.0626"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.06" y="63.3698"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="131.89" y="63.31"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="132.69" y="63.31"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="133.49" y="63.31"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A12"/>
				<Org x="134.26" y="63.36"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDWE_B"/>
				<Org x="126.3069" y="64.11"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="127.13" y="64.16"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="127.91" y="64.11"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="128.7809" y="64.1472"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="130.2836" y="64.7882"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="131.09" y="64.11"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="131.832" y="64.1601"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="132.6201" y="64.1469"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="133.49" y="64.11"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="134.29" y="64.11"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="126.31" y="64.91"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="127.11" y="64.91"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="127.9475" y="64.9475"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="128.71" y="64.91"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="129.51" y="64.94"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="131.0041" y="64.9323"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V8"/>
				<Org x="131.8041" y="64.9323"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="132.6894" y="64.9101"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="133.49" y="64.91"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="134.29" y="64.91"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="126.31" y="65.71"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="127.11" y="65.71"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="127.9581" y="65.77"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="128.764" y="65.764"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="129.51" y="65.71"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.09" y="65.71"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.836" y="65.764"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="132.6359" y="65.7641"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="1V35"/>
				<Org x="133.49" y="65.71"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="127.91" y="66.51"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="128.71" y="66.51"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="129.51" y="66.51"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.09" y="66.51"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="131.88" y="66.5"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="132.6898" y="66.51"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="133.4677" y="66.5959"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="3V15"/>
				<Org x="134.29" y="66.51"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="124.1834" y="47.327"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD9"/>
				<Org x="124.9553" y="47.3596"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="126.4751" y="47.3079"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="126.6317" y="46.4946"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD1"/>
				<Org x="128.1827" y="48.0615"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="128.9384" y="47.2951"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="129.7107" y="47.329"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDCKE0"/>
				<Org x="131.2684" y="48.0815"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDBA0"/>
				<Org x="132.1282" y="47.3313"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="MA10"/>
				<Org x="132.9254" y="47.3744"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A3"/>
				<Org x="133.7384" y="47.2951"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A7"/>
				<Org x="134.5119" y="47.3512"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="DQM1"/>
				<Org x="124.7414" y="48.9952"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="125.693" y="48.1421"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD11"/>
				<Org x="126.5261" y="48.156"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="127.313" y="48.1593"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="DQM0"/>
				<Org x="127.7075" y="49.0174"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="128.9384" y="48.0951"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD3"/>
				<Org x="129.7299" y="48.0999"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="130.5283" y="48.1419"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDWE_B"/>
				<Org x="130.97" y="49.0102"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDBA1"/>
				<Org x="132.1359" y="48.1207"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A1"/>
				<Org x="132.8665" y="48.0989"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A5"/>
				<Org x="132.9183" y="48.8278"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="DQS1"/>
				<Org x="124.8961" y="52.0676"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="125.74" y="52.03"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD10"/>
				<Org x="126.4787" y="52.0627"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="127.3443" y="52.029"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="DQS0"/>
				<Org x="128.1283" y="52.0686"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="128.919" y="52.0226"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD2"/>
				<Org x="129.7105" y="52.0526"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="130.5159" y="52.0322"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="RAS_B"/>
				<Org x="131.2897" y="52.0616"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="CAS_B"/>
				<Org x="132.0601" y="52.0908"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="124.2087" y="52.8838"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD8"/>
				<Org x="124.9718" y="52.849"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="125.7378" y="52.8246"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="127.3913" y="52.8553"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SD0"/>
				<Org x="128.1655" y="52.8467"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="EMI_1V8"/>
				<Org x="128.85" y="52.89"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="GND"/>
				<Org x="129.6829" y="52.8578"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDCLK"/>
				<Org x="130.4866" y="52.8572"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="SDCLK_B"/>
				<Org x="131.2605" y="52.8802"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A0"/>
				<Org x="132.9106" y="52.8591"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A4"/>
				<Org x="133.6945" y="52.8537"/>
			</Via>
			<Via>
				<ViastackRef name="(Default-2)"/>
				<NetRef name="A8"/>
				<Org x="134.5415" y="52.8161"/>
			</Via>
		</Vias>
		<Serpents>
			<Serpent id="serp_0" length="12.54608000" gap="0.25"
			 h1="1.3304259" h2="1.4189722"
			 h3="0.71871645" h4="1.1555346"/>
			<Serpent id="serp_1" length="14.38319000" gap="0.3"
			 h1="0.39620681" h2="0.39620681"
			 h3="0.39620681" h4="0.39620681"/>
			<Serpent id="serp_2" length="6.56126000" gap="0.3"
			 h1="0.2880959" h2="0.2880959"
			 h3="0.2880959" h4="0.2880959"/>
			<Serpent id="serp_3" length="7.40837000" gap="0.3"
			 h1="0.19629491" h2="0.19629491"
			 h3="0.19629491" h4="0.19629491"/>
			<Serpent id="serp_4" length="7.72128000" gap="0.3"
			 h1="0.23040334" h2="0.23040334"
			 h3="0.23040334" h4="0.23040334"/>
			<Serpent id="serp_5" length="7.60571000" gap="0.3"
			 h1="0.26803601" h2="0.26803601"
			 h3="0.26803601" h4="0.26803601"/>
			<Serpent id="serp_6" length="1.47790000" gap="0.3"
			 h1="0.14610561" h2="0.14610561"
			 h3="0.14610561" h4="0.14610561"/>
			<Serpent id="serp_7" length="11.54376000" gap="0.3"
			 h1="0.36338114" h2="0.36338114"
			 h3="0.36338114" h4="0.36338114"/>
			<Serpent id="serp_8" length="3.42010000" gap="0.3"
			 h1="0.19271287" h2="0.19271287"
			 h3="0.19271287" h4="0.19271287"/>
			<Serpent id="serp_9" length="8.62073000" gap="0.3"
			 h1="0.25370284" h2="0.25370284"
			 h3="0.25370284" h4="0.25370284"/>
			<Serpent id="serp_10" length="4.15872000" gap="0.3"
			 h1="0.14940589" h2="0.14940589"
			 h3="0.14940589" h4="0.14940589"/>
			<Serpent id="serp_11" length="7.69174000" gap="0.3"
			 h1="0.54377846" h2="0.45016986"
			 h3="0.45016986" h4="0.54377846"/>
			<Serpent id="serp_12" length="4.59859000" gap="0.3"
			 h1="0.34756066" h2="0.34756066"
			 h3="0.34756066" h4="0.34756066"/>
			<Serpent id="serp_13" length="7.99878000" gap="0.3"
			 h1="0.32481935" h2="0.32481935"
			 h3="0.32481935" h4="0.32481935"/>
			<Serpent id="serp_14" length="1.95410000" gap="0.3"
			 h1="0.29629526" h2="0.29629526"
			 h3="0.29629526" h4="0.29629526"/>
			<Serpent id="serp_15" length="9.20106000" gap="0.3"
			 h1="0.35055148" h2="0.35055148"
			 h3="0.35055148" h4="0.35055148"/>
			<Serpent id="serp_16" length="2.25594000" gap="0.3"
			 h1="0.46324259" h2="0.45022492"
			 h3="0.45022492" h4="0.46324259"/>
			<Serpent id="serp_17" length="2.41093000" gap="0.3"
			 h1="0.26730002" h2="0.26730002"
			 h3="0.26730002" h4="0.26730002"/>
			<Serpent id="serp_18" length="9.19118000" gap="0.3"
			 h1="0.22435548" h2="0.22435548"
			 h3="0.22435548" h4="0.22435548"/>
			<Serpent id="serp_19" length="8.96171000" gap="0.3"
			 h1="0.26144653" h2="0.26144653"
			 h3="0.26144653" h4="0.26144653"/>
			<Serpent id="serp_20" length="1.40947000" gap="0.3"
			 h1="0.49530517" h2="0.49530517"
			 h3="0.49530517" h4="0.49530517"/>
			<Serpent id="serp_21" length="11.29698000" gap="0.3"
			 h1="0.34346717" h2="0.34346717"
			 h3="0.34346717" h4="0.34346717"/>
			<Serpent id="serp_22" length="14.29131000" gap="0.3"
			 h1="0.48756752" h2="0.48756752"
			 h3="0.48756752" h4="0.48756752"/>
			<Serpent id="serp_23" length="2.22449000" gap="0.3"
			 h1="0.40288516" h2="0.40288516"
			 h3="0.40288516" h4="0.40288516"/>
			<Serpent id="serp_24" length="9.95394000" gap="0.3"
			 h1="0.22979452" h2="0.22979452"
			 h3="0.22979452" h4="0.22979452"/>
			<Serpent id="serp_25" length="3.30282000" gap="0.3"
			 h1="0.37690525" h2="0.37690525"
			 h3="0.37690525" h4="0.37690525"/>
			<Serpent id="serp_26" length="7.04060000" gap="0.3"
			 h1="0.33858732" h2="0.33858732"
			 h3="0.33858732" h4="0.33858732"/>
			<Serpent id="serp_27" length="13.18384000" gap="0.3"
			 h1="0.6075351" h2="0.5973197"
			 h3="0.5973197" h4="0.6075351"/>
			<Serpent id="serp_28" length="4.69345000" gap="0.3"
			 h1="0.30821827" h2="0.30821827"
			 h3="0.30821827" h4="0.30821827"/>
			<Serpent id="serp_29" length="6.05724000" gap="0.3"
			 h1="0.29981303" h2="0.29981303"
			 h3="0.29981303" h4="0.29981303"/>
			<Serpent id="serp_30" length="3.74925000" gap="0.3"
			 h1="0.24146091" h2="0.24146091"
			 h3="0.24146091" h4="0.24146091"/>
			<Serpent id="serp_31" length="5.01322000" gap="0.3"
			 h1="0.2316128" h2="0.2316128"
			 h3="0.2316128" h4="0.2316128"/>
			<Serpent id="serp_32" length="12.00677000" gap="0.3"
			 h1="0.58685707" h2="0.49378587"
			 h3="0.49378587" h4="0.58685707"/>
			<Serpent id="serp_33" length="15.15379000" gap="0.3"
			 h1="0.56720904" h2="0.49500122"
			 h3="0.49500122" h4="0.56720904"/>
			<Serpent id="serp_34" length="1.67705000" gap="0.3"
			 h1="0.36575572" h2="0.36575572"
			 h3="0.36575572" h4="0.36575572"/>
			<Serpent id="serp_35" length="15.23736000" gap="0.3"
			 h1="0.45030772" h2="0.74055996"
			 h3="0.74055996" h4="0.45030772"/>
			<Serpent id="serp_36" length="4.90850000" gap="0.3"
			 h1="0.19449177" h2="0.19449177"
			 h3="0.19449177" h4="0.19449177"/>
			<Serpent id="serp_37" length="6.90550000" gap="0.3"
			 h1="0.30169125" h2="0.30169125"
			 h3="0.30169125" h4="0.30169125"/>
			<Serpent id="serp_38" length="9.39856000" gap="0.3"
			 h1="0.2655097" h2="0.2655097"
			 h3="0.2655097" h4="0.2655097"/>
			<Serpent id="serp_39" length="1.25524000" gap="0.3"
			 h1="0.32071958" h2="0.32071958"
			 h3="0.32071958" h4="0.32071958"/>
			<Serpent id="serp_40" length="1.61092000" gap="0.3"
			 h1="0.26030192" h2="0.26030192"
			 h3="0.26030192" h4="0.26030192"/>
			<Serpent id="serp_41" length="7.75799000" gap="0.3"
			 h1="0.21004309" h2="0.21004309"
			 h3="0.21004309" h4="0.21004309"/>
			<Serpent id="serp_42" length="9.74434000" gap="0.3"
			 h1="0.27305357" h2="0.27305357"
			 h3="0.27305357" h4="0.27305357"/>
			<Serpent id="serp_43" length="1.97908000" gap="0.3"
			 h1="0.13321655" h2="0.13321655"
			 h3="0.13321655" h4="0.13321655"/>
			<Serpent id="serp_44" length="1.13795000" gap="0.3"
			 h1="0.3224662" h2="0.3224662"
			 h3="0.3224662" h4="0.3224662"/>
			<Serpent id="serp_45" length="4.17619000" gap="0.3"
			 h1="0.21397051" h2="0.21397051"
			 h3="0.21397051" h4="0.21397051"/>
			<Serpent id="serp_46" length="4.59865000" gap="0.3"
			 h1="0.12907815" h2="0.12907815"
			 h3="0.12907815" h4="0.12907815"/>
			<Serpent id="serp_47" length="11.69789000" gap="0.3"
			 h1="0.83003613" h2="0.59167766"
			 h3="0.59167766" h4="0.83003613"/>
			<Serpent id="serp_48" length="12.43761000" gap="0.3"
			 h1="0.49127224" h2="0.49127224"
			 h3="0.49127224" h4="0.49127224"/>
			<Serpent id="serp_49" length="15.01384000" gap="0.3"
			 h1="0.450806" h2="0.45110533"
			 h3="0.62809912" h4="0.62579757"/>
			<Serpent id="serp_50" length="13.01401000" gap="0.3"
			 h1="0.33828528" h2="0.33828528"
			 h3="0.33828528" h4="0.33828528"/>
			<Serpent id="serp_51" length="13.68383000" gap="0.3"
			 h1="0.53157511" h2="0.53157511"
			 h3="0.53157511" h4="0.53157511"/>
			<Serpent id="serp_52" length="10.48213000" gap="0.3"
			 h1="0.45839456" h2="0.45839456"
			 h3="0.45839456" h4="0.45839456"/>
			<Serpent id="serp_53" length="8.47009000" gap="0.3"
			 h1="0.45017047" h2="0.52186238"
			 h3="0.52186238" h4="0.45017047"/>
			<Serpent id="serp_54" length="3.56030000" gap="0.3"
			 h1="0.2925426" h2="0.2925426"
			 h3="0.2925426" h4="0.2925426"/>
			<Serpent id="serp_55" length="3.09386000" gap="0.3"
			 h1="0.15531945" h2="0.15531945"
			 h3="0.15531945" h4="0.15531945"/>
			<Serpent id="serp_56" length="1.81296000" gap="0.3"
			 h1="0.22811475" h2="0.22811475"
			 h3="0.22811475" h4="0.22811475"/>
			<Serpent id="serp_57" length="2.46401000" gap="0.3"
			 h1="0.21147031" h2="0.21147031"
			 h3="0.21147031" h4="0.21147031"/>
			<Serpent id="serp_58" length="13.43758000" gap="0.3"
			 h1="0.97873637" h2="0.8325307"
			 h3="0.8325307" h4="0.97873637"/>
			<Serpent id="serp_59" length="1.52701000" gap="0.3"
			 h1="0.22582128" h2="0.22582128"
			 h3="0.22582128" h4="0.22582128"/>
			<Serpent id="serp_60" length="8.97387000" gap="0.3"
			 h1="0.54396502" h2="0.53447557"
			 h3="0.53447557" h4="0.54396502"/>
		</Serpents>
		<ZippedWires>
			<ZippedWire id="zwire_0">
				<LayerRef name="Int 1"/>
				<DiffSignalRef name="SDCLK_U2"/>
				<Start x="130.2757" y="61.0112"/>
				<TrackLine>
					<End x="130.6607" y="60.4743"/>
				</TrackLine>
				<TrackLine>
					<End x="130.6607" y="60.2253"/>
				</TrackLine>
				<TrackLine serpRef="serp_0">
					<End x="131.0903" y="54.4972"/>
				</TrackLine>
				<TrackLine>
					<End x="131.1164" y="53.8788"/>
				</TrackLine>
				<TrackLine>
					<End x="131.1121" y="53.381"/>
				</TrackLine>
			</ZippedWire>
		</ZippedWires>
		<Wires>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V5"/>
				<Subwire width="0.15">
					<Start x="128.3" y="70.1"/>
					<TrackLine>
						<End x="127.91" y="70.39"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V5"/>
				<Subwire width="0.15">
					<Start x="129.9" y="70.1"/>
					<TrackLine>
						<End x="129.5" y="70.42"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V5"/>
				<Subwire width="0.15">
					<Start x="128.3" y="69.3"/>
					<TrackLine>
						<End x="127.94" y="69.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="129.1" y="64.5"/>
					<TrackLine>
						<End x="128.7809" y="64.1472"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="133.1" y="64.5"/>
					<TrackLine>
						<End x="133.49" y="64.11"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="127.5" y="64.5"/>
					<TrackLine>
						<End x="127.13" y="64.16"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="131.5" y="65.3"/>
					<TrackLine>
						<End x="131.8041" y="64.9323"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="130.7" y="65.3"/>
					<TrackLine>
						<End x="131.0041" y="64.9323"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="129.9" y="63.7"/>
					<TrackLine>
						<End x="130.2093" y="64.0626"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="131.5" y="64.5"/>
					<TrackLine>
						<End x="131.832" y="64.1601"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="128.3" y="65.3"/>
					<TrackLine>
						<End x="127.9475" y="64.9475"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="129.9" y="64.5"/>
					<TrackLine>
						<End x="130.2836" y="64.7882"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="132.3" y="64.5"/>
					<TrackLine>
						<End x="132.6201" y="64.1469"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="130.7" y="64.5"/>
					<TrackLine>
						<End x="131.09" y="64.11"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V8"/>
				<Subwire width="0.15">
					<Start x="128.3" y="63.7"/>
					<TrackLine>
						<End x="127.95" y="63.33"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="132.3" y="63.7"/>
					<TrackLine>
						<End x="132.69" y="63.31"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="129.1" y="70.9"/>
					<TrackLine>
						<End x="128.81" y="71.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="132.3" y="70.9"/>
					<TrackLine>
						<End x="132.61" y="71.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="126.7" y="65.3"/>
					<TrackLine>
						<End x="126.31" y="64.91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="133.1" y="70.9"/>
					<TrackLine>
						<End x="133.49" y="71.26"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="133.1" y="63.7"/>
					<TrackLine>
						<End x="133.49" y="63.31"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="133.1" y="66.1"/>
					<TrackLine>
						<End x="133.49" y="65.71"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="133.1" y="69.3"/>
					<TrackLine>
						<End x="133.49" y="69.59"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="129.1" y="63.7"/>
					<TrackLine>
						<End x="129.5163" y="63.3793"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="133.1" y="67.7"/>
					<TrackLine>
						<End x="133.49" y="68.07"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="131.5" y="63.7"/>
					<TrackLine>
						<End x="131.89" y="63.31"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="128.3" y="64.5"/>
					<TrackLine>
						<End x="127.91" y="64.11"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="126.7" y="66.1"/>
					<TrackLine>
						<End x="126.31" y="65.71"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="133.9" y="68.5"/>
					<TrackLine>
						<End x="134.19" y="68.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V3"/>
				<Subwire width="0.15">
					<Start x="128.3" y="70.9"/>
					<TrackLine>
						<End x="127.91" y="71.19"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V3"/>
				<Subwire width="0.15">
					<Start x="125.1" y="70.1"/>
					<TrackLine>
						<End x="124.7551" y="70.4271"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V3"/>
				<Subwire width="0.15">
					<Start x="126.7" y="69.3"/>
					<TrackLine>
						<End x="126.3" y="69.62"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V3"/>
				<Subwire width="0.15">
					<Start x="126.7" y="68.5"/>
					<TrackLine>
						<End x="126.34" y="68.9"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V3"/>
				<Subwire width="0.15">
					<Start x="123.0399" y="69.632"/>
					<TrackLine>
						<End x="122.7" y="69.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V3"/>
				<Subwire width="0.15">
					<Start x="122.7" y="73.3"/>
					<TrackLine>
						<End x="123.0545" y="72.9827"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V3"/>
				<Subwire width="0.15">
					<Start x="122.7" y="70.9"/>
					<TrackLine>
						<End x="123.09" y="71.25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V3"/>
				<Subwire width="0.15">
					<Start x="123.5" y="71.7"/>
					<TrackLine>
						<End x="123.1475" y="72.0193"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="130.7" y="70.9"/>
					<TrackLine>
						<End x="131.05" y="71.27"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="133.9" y="64.5"/>
					<TrackLine>
						<End x="134.29" y="64.11"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="131.5" y="70.9"/>
					<TrackLine>
						<End x="131.89" y="71.19"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="132.3" y="70.1"/>
					<TrackLine>
						<End x="132.6489" y="70.4229"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="127.5" y="65.3"/>
					<TrackLine>
						<End x="127.11" y="64.91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="132.3" y="67.7"/>
					<TrackLine>
						<End x="132.6169" y="67.3451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="133.9" y="69.3"/>
					<TrackLine>
						<End x="134.24" y="69.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="127.5" y="70.1"/>
					<TrackLine>
						<End x="127.14" y="70.49"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="125.9" y="70.1"/>
					<TrackLine>
						<End x="126.31" y="70.39"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="127.5" y="68.5"/>
					<TrackLine>
						<End x="127.1" y="68.87"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="133.9" y="66.9"/>
					<TrackLine>
						<End x="134.29" y="66.51"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="133.1" y="70.1"/>
					<TrackLine>
						<End x="133.4458" y="70.426"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="133.1" y="66.9"/>
					<TrackLine>
						<End x="133.4677" y="66.5959"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="133.9" y="65.3"/>
					<TrackLine>
						<End x="134.29" y="64.91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="133.9" y="70.1"/>
					<TrackLine>
						<End x="134.19" y="70.49"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="127.5" y="67.7"/>
					<TrackLine>
						<End x="127.12" y="68.08"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="129.9" y="70.9"/>
					<TrackLine>
						<End x="129.51" y="71.26"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="127.5" y="66.1"/>
					<TrackLine>
						<End x="127.11" y="65.71"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="133.1" y="65.3"/>
					<TrackLine>
						<End x="133.49" y="64.91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A0"/>
				<Subwire width="0.15">
					<Start x="135.6374" y="58.9399"/>
					<TrackLine>
						<End x="134.7" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A0"/>
				<Subwire width="0.15">
					<Start x="132.5384" y="52.4951"/>
					<TrackLine>
						<End x="132.9106" y="52.8591"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.15">
					<Start x="132.5384" y="48.4951"/>
					<TrackLine>
						<End x="132.8665" y="48.0989"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A1"/>
				<Subwire width="0.15">
					<Start x="133.1" y="62.1"/>
					<TrackLine>
						<End x="132.7005" y="61.6718"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A2"/>
				<Subwire width="0.15">
					<Start x="132.5384" y="51.6951"/>
					<TrackLine>
						<End x="132.8731" y="52.0676"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A2"/>
				<Subwire width="0.15">
					<Start x="133.1" y="62.9"/>
					<TrackLine>
						<End x="132.7599" y="62.5199"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.15">
					<Start x="133.3384" y="47.6951"/>
					<TrackLine>
						<End x="133.7384" y="47.2951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A3"/>
				<Subwire width="0.15">
					<Start x="133.9" y="61.3"/>
					<TrackLine>
						<End x="134.2124" y="60.9404"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A4"/>
				<Subwire width="0.15">
					<Start x="133.3384" y="52.4951"/>
					<TrackLine>
						<End x="133.6945" y="52.8537"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A4"/>
				<Subwire width="0.15">
					<Start x="133.9" y="62.1"/>
					<TrackLine>
						<End x="134.2087" y="61.7343"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A5"/>
				<Subwire width="0.15">
					<Start x="133.3384" y="48.4951"/>
					<TrackLine>
						<End x="132.9183" y="48.8278"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A5"/>
				<Subwire width="0.15">
					<Start x="134.7" y="60.5"/>
					<TrackLine>
						<End x="134.3012" y="60.2262"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A6"/>
				<Subwire width="0.15">
					<Start x="133.3384" y="51.6951"/>
					<TrackLine>
						<End x="132.9216" y="51.371"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A6"/>
				<Subwire width="0.15">
					<Start x="134.7" y="61.3"/>
					<TrackLine>
						<End x="135.0768" y="60.9745"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A7"/>
				<Subwire width="0.15">
					<Start x="135.8761" y="59.4035"/>
					<TrackLine>
						<End x="135.5" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A7"/>
				<Subwire width="0.15">
					<Start x="134.1384" y="47.6951"/>
					<TrackLine>
						<End x="134.5119" y="47.3512"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.15">
					<Start x="134.1384" y="52.4951"/>
					<TrackLine>
						<End x="134.5415" y="52.8161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A8"/>
				<Subwire width="0.15">
					<Start x="135.5" y="60.5"/>
					<TrackLine>
						<End x="135.8901" y="60.1968"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A9"/>
				<Subwire width="0.15">
					<Start x="136.7023" y="60.0016"/>
					<TrackLine>
						<End x="136.3" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A9"/>
				<Subwire width="0.15">
					<Start x="134.1384" y="48.4951"/>
					<TrackLine>
						<End x="134.7468" y="48.9576"/>
					</TrackLine>
					<TrackLine>
						<End x="135.13" y="48.9576"/>
					</TrackLine>
					<TrackLine>
						<End x="135.3395" y="48.8145"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A11"/>
				<Subwire width="0.15">
					<Start x="134.1384" y="51.6951"/>
					<TrackLine>
						<End x="134.7727" y="52.0951"/>
					</TrackLine>
					<TrackLine>
						<End x="135.1041" y="52.0951"/>
					</TrackLine>
					<TrackLine>
						<End x="135.3405" y="52.0786"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A11"/>
				<Subwire width="0.15">
					<Start x="134.7" y="62.1"/>
					<TrackLine>
						<End x="134.3079" y="62.3797"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A12"/>
				<Subwire width="0.15">
					<Start x="134.9384" y="47.6951"/>
					<TrackLine>
						<End x="135.4752" y="47.6336"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="A12"/>
				<Subwire width="0.15">
					<Start x="133.9" y="63.7"/>
					<TrackLine>
						<End x="134.26" y="63.36"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="CAS_B"/>
				<Subwire width="0.15">
					<Start x="131.7384" y="51.6951"/>
					<TrackLine>
						<End x="132.0601" y="52.0908"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="CAS_B"/>
				<Subwire width="0.15">
					<Start x="125.1" y="62.9"/>
					<TrackLine>
						<End x="125.4655" y="63.2088"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DQM0"/>
				<Subwire width="0.15">
					<Start x="127.7384" y="48.4951"/>
					<TrackLine>
						<End x="127.7075" y="49.0174"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DQM0"/>
				<Subwire width="0.15">
					<Start x="123.5" y="60.5"/>
					<TrackLine>
						<End x="123.1727" y="60.154"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DQM1"/>
				<Subwire width="0.15">
					<Start x="124.5384" y="48.4951"/>
					<TrackLine>
						<End x="124.7414" y="48.9952"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DQM1"/>
				<Subwire width="0.15">
					<Start x="125.1" y="61.3"/>
					<TrackLine>
						<End x="124.753" y="60.975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DQS0"/>
				<Subwire width="0.15">
					<Start x="127.7384" y="51.6951"/>
					<TrackLine>
						<End x="128.1283" y="52.0686"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DQS0"/>
				<Subwire width="0.15">
					<Start x="127.5" y="62.9"/>
					<TrackLine>
						<End x="127.0662" y="62.5261"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DQS1"/>
				<Subwire width="0.15">
					<Start x="124.5384" y="51.6951"/>
					<TrackLine>
						<End x="124.8961" y="52.0676"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="DQS1"/>
				<Subwire width="0.15">
					<Start x="129.9" y="62.9"/>
					<TrackLine>
						<End x="130.3" y="63.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="125.3384" y="48.4951"/>
					<TrackLine>
						<End x="125.693" y="48.1421"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="124.5" y="54.14"/>
					<TrackLine>
						<End x="125.3384" y="53.2951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="128.5384" y="46.8951"/>
					<TrackLine>
						<End x="128.9384" y="47.2951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="130.5207" y="53.6321"/>
					<TrackLine>
						<End x="130.1384" y="53.2951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="123.7384" y="53.2951"/>
					<TrackLine>
						<End x="122.975" y="53.1948"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="134.9384" y="46.8951"/>
					<TrackLine>
						<End x="135.1384" y="46.3951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="126.9384" y="46.8951"/>
					<TrackLine>
						<End x="126.6317" y="46.4946"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="132.1286" y="52.9932"/>
					<TrackLine>
						<End x="132.5384" y="53.2951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="130.3855" y="46.435"/>
					<TrackLine>
						<End x="130.1384" y="46.8951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="127.2768" y="53.6932"/>
					<TrackLine>
						<End x="126.9384" y="53.2951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="125.3384" y="51.6951"/>
					<TrackLine>
						<End x="125.74" y="52.03"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="123.2827" y="46.6434"/>
					<TrackLine>
						<End x="123.7384" y="46.8951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="128.5384" y="48.4951"/>
					<TrackLine>
						<End x="128.9384" y="48.0951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="128.5384" y="51.6951"/>
					<TrackLine>
						<End x="128.919" y="52.0226"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="128.5384" y="53.2951"/>
					<TrackLine>
						<End x="128.85" y="52.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="125.12" y="46.37"/>
					<TrackLine>
						<End x="125.3384" y="46.8951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="123.7384" y="51.6951"/>
					<TrackLine>
						<End x="122.8059" y="52.4174"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="126.9384" y="48.4951"/>
					<TrackLine>
						<End x="127.313" y="48.1593"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.3384" y="47.6951"/>
					<TrackLine>
						<End x="129.7107" y="47.329"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="127.5" y="69.3"/>
					<TrackLine>
						<End x="127.15" y="69.68"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.7" y="70.1"/>
					<TrackLine>
						<End x="131.0402" y="70.4699"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="132.3" y="68.5"/>
					<TrackLine>
						<End x="132.66" y="68.82"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="122.7" y="70.1"/>
					<TrackLine>
						<End x="123.09" y="70.49"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="132.3" y="69.3"/>
					<TrackLine>
						<End x="132.6602" y="69.6599"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.1384" y="51.6951"/>
					<TrackLine>
						<End x="130.5159" y="52.0322"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="124.3" y="70.9"/>
					<TrackLine>
						<End x="123.91" y="71.29"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="124.3" y="71.7"/>
					<TrackLine>
						<End x="123.9098" y="72.09"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.1" y="70.1"/>
					<TrackLine>
						<End x="128.7599" y="70.4699"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.3384" y="52.4951"/>
					<TrackLine>
						<End x="129.6829" y="52.8578"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="125.9" y="69.3"/>
					<TrackLine>
						<End x="125.5398" y="69.66"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="127.7384" y="52.4951"/>
					<TrackLine>
						<End x="127.3913" y="52.8553"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="133.1" y="68.5"/>
					<TrackLine>
						<End x="133.4782" y="68.824"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.9" y="69.3"/>
					<TrackLine>
						<End x="129.51" y="69.69"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.7" y="67.7"/>
					<TrackLine>
						<End x="131.09" y="68.09"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="124.5384" y="47.6951"/>
					<TrackLine>
						<End x="124.1834" y="47.327"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="135.2906" y="52.9613"/>
					<TrackLine>
						<End x="134.7227" y="53.2536"/>
					</TrackLine>
					<TrackLine>
						<End x="134.1384" y="53.2951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="123.5" y="72.5"/>
					<TrackLine>
						<End x="123.89" y="72.8902"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="123.4494" y="49.6182"/>
					<TrackLine>
						<End x="123.7384" y="48.4951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="137.9" y="74.9"/>
					<TrackLine>
						<End x="137.564" y="74.564"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="128.3" y="68.5"/>
					<TrackLine>
						<End x="127.964" y="68.836"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="131.5" y="70.1"/>
					<TrackLine>
						<End x="131.8798" y="70.4598"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="124.5384" y="52.4951"/>
					<TrackLine>
						<End x="124.2087" y="52.8838"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="133.4" y="45.8998"/>
					<TrackLine>
						<End x="133.3384" y="46.8951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="125.1" y="71.7"/>
					<TrackLine>
						<End x="124.7097" y="72.09"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.1" y="68.5"/>
					<TrackLine>
						<End x="128.764" y="68.836"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="127.5" y="63.7"/>
					<TrackLine>
						<End x="127.1337" y="63.3771"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.1384" y="48.4951"/>
					<TrackLine>
						<End x="130.5283" y="48.1419"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.7" y="66.9"/>
					<TrackLine>
						<End x="131.09" y="66.51"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.1" y="65.3"/>
					<TrackLine>
						<End x="128.71" y="64.91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="137.574" y="60.0458"/>
					<TrackLine>
						<End x="137.9" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.7" y="66.1"/>
					<TrackLine>
						<End x="131.09" y="65.71"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.1" y="69.3"/>
					<TrackLine>
						<End x="128.744" y="69.6159"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="126.1384" y="52.4951"/>
					<TrackLine>
						<End x="125.7378" y="52.8246"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="126.1384" y="47.6951"/>
					<TrackLine>
						<End x="126.4751" y="47.3079"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.7" y="63.7"/>
					<TrackLine>
						<End x="131.06" y="63.3698"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.1" y="66.1"/>
					<TrackLine>
						<End x="128.764" y="65.764"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="122.6586" y="59.1794"/>
					<TrackLine>
						<End x="122.7" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.9" y="65.3"/>
					<TrackLine>
						<End x="129.51" y="64.94"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.7" y="69.3"/>
					<TrackLine>
						<End x="131.06" y="69.66"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="132.3" y="66.9"/>
					<TrackLine>
						<End x="132.6898" y="66.51"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="132.3" y="65.3"/>
					<TrackLine>
						<End x="132.6894" y="64.9101"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.9" y="67.7"/>
					<TrackLine>
						<End x="129.51" y="68.09"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="131.5" y="66.9"/>
					<TrackLine>
						<End x="131.88" y="66.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="132.3" y="66.1"/>
					<TrackLine>
						<End x="132.6359" y="65.7641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="131.5" y="69.3"/>
					<TrackLine>
						<End x="131.8309" y="69.641"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="131.5" y="67.7"/>
					<TrackLine>
						<End x="131.8702" y="68.0499"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="128.3" y="66.9"/>
					<TrackLine>
						<End x="127.91" y="66.51"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="126.9384" y="51.6951"/>
					<TrackLine>
						<End x="127.3443" y="52.029"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.1" y="67.7"/>
					<TrackLine>
						<End x="128.71" y="68.09"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.9" y="68.5"/>
					<TrackLine>
						<End x="129.51" y="68.89"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.1" y="66.9"/>
					<TrackLine>
						<End x="128.71" y="66.51"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="122.7" y="74.9"/>
					<TrackLine>
						<End x="123.036" y="74.564"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="128.3" y="67.7"/>
					<TrackLine>
						<End x="127.91" y="68.09"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.7" y="68.5"/>
					<TrackLine>
						<End x="131.04" y="68.87"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="131.5" y="66.1"/>
					<TrackLine>
						<End x="131.836" y="65.764"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="128.3" y="66.1"/>
					<TrackLine>
						<End x="127.9581" y="65.77"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.9" y="66.9"/>
					<TrackLine>
						<End x="129.51" y="66.51"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="129.9" y="66.1"/>
					<TrackLine>
						<End x="129.51" y="65.71"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="131.5" y="68.5"/>
					<TrackLine>
						<End x="131.8212" y="68.8507"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MA10"/>
				<Subwire width="0.15">
					<Start x="132.5384" y="47.6951"/>
					<TrackLine>
						<End x="132.9254" y="47.3744"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="MA10"/>
				<Subwire width="0.15">
					<Start x="135.5" y="61.3"/>
					<TrackLine>
						<End x="135.1448" y="61.6955"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="NetU1_B20"/>
				<Subwire width="0.15">
					<Start x="131.7384" y="52.4951"/>
					<TrackLine>
						<End x="131.6945" y="52.8134"/>
					</TrackLine>
					<TrackLine>
						<End x="131.6946" y="53.06"/>
					</TrackLine>
					<TrackLine>
						<End x="131.4009" y="53.4867"/>
					</TrackLine>
					<TrackLine>
						<End x="131.13" y="53.7576"/>
					</TrackLine>
					<TrackLine>
						<End x="130.7019" y="54.0696"/>
					</TrackLine>
					<TrackLine>
						<End x="122.4774" y="58.7419"/>
					</TrackLine>
					<TrackLine>
						<End x="122.2211" y="58.9982"/>
					</TrackLine>
					<TrackLine>
						<End x="122.2211" y="59.3606"/>
					</TrackLine>
					<TrackLine>
						<End x="122.2625" y="59.8812"/>
					</TrackLine>
					<TrackLine>
						<End x="122.7" y="60.5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RAS_B"/>
				<Subwire width="0.15">
					<Start x="130.9384" y="51.6951"/>
					<TrackLine>
						<End x="131.2897" y="52.0616"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="RAS_B"/>
				<Subwire width="0.15">
					<Start x="125.9" y="62.9"/>
					<TrackLine>
						<End x="126.2847" y="63.1969"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD0"/>
				<Subwire width="0.15">
					<Start x="128.5384" y="52.4951"/>
					<TrackLine>
						<End x="128.1655" y="52.8467"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD0"/>
				<Subwire width="0.15">
					<Start x="125.1" y="60.5"/>
					<TrackLine>
						<End x="124.8026" y="60.1255"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD1"/>
				<Subwire width="0.15">
					<Start x="123.145" y="59.3832"/>
					<TrackLine>
						<End x="123.5" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD1"/>
				<Subwire width="0.15">
					<Start x="128.5384" y="47.6951"/>
					<TrackLine>
						<End x="128.1827" y="48.0615"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD2"/>
				<Subwire width="0.15">
					<Start x="129.3384" y="51.6951"/>
					<TrackLine>
						<End x="129.7105" y="52.0526"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD2"/>
				<Subwire width="0.15">
					<Start x="124.3" y="60.5"/>
					<TrackLine>
						<End x="123.925" y="60.1637"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD3"/>
				<Subwire width="0.15">
					<Start x="129.3384" y="48.4951"/>
					<TrackLine>
						<End x="129.7299" y="48.0999"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD3"/>
				<Subwire width="0.15">
					<Start x="125.9" y="61.3"/>
					<TrackLine>
						<End x="125.5241" y="61.599"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD4"/>
				<Subwire width="0.15">
					<Start x="124.0333" y="59.2947"/>
					<TrackLine>
						<End x="124.3" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD4"/>
				<Subwire width="0.15">
					<Start x="129.3384" y="46.8951"/>
					<TrackLine>
						<End x="129.0675" y="46.4142"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD5"/>
				<Subwire width="0.15">
					<Start x="129.3384" y="53.2951"/>
					<TrackLine>
						<End x="129.6729" y="53.6678"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD5"/>
				<Subwire width="0.15">
					<Start x="126.7" y="61.3"/>
					<TrackLine>
						<End x="127.1128" y="61.7078"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD6"/>
				<Subwire width="0.15">
					<Start x="125.3772" y="60.0946"/>
					<TrackLine>
						<End x="125.1" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD6"/>
				<Subwire width="0.15">
					<Start x="127.7384" y="46.8951"/>
					<TrackLine>
						<End x="127.3735" y="47.2374"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD7"/>
				<Subwire width="0.15">
					<Start x="127.7384" y="53.2951"/>
					<TrackLine>
						<End x="128.0792" y="53.6615"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD7"/>
				<Subwire width="0.15">
					<Start x="125.9" y="60.5"/>
					<TrackLine>
						<End x="125.5713" y="60.8719"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD8"/>
				<Subwire width="0.15">
					<Start x="125.3384" y="52.4951"/>
					<TrackLine>
						<End x="124.9718" y="52.849"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD8"/>
				<Subwire width="0.15">
					<Start x="127.5" y="61.3"/>
					<TrackLine>
						<End x="127.8191" y="61.6843"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD9"/>
				<Subwire width="0.15">
					<Start x="124.8183" y="59.2739"/>
					<TrackLine>
						<End x="124.9188" y="59.2625"/>
					</TrackLine>
					<TrackLine>
						<End x="125.2812" y="59.2625"/>
					</TrackLine>
					<TrackLine>
						<End x="125.9" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD9"/>
				<Subwire width="0.15">
					<Start x="125.3384" y="47.6951"/>
					<TrackLine>
						<End x="124.9553" y="47.3596"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD10"/>
				<Subwire width="0.15">
					<Start x="127.1793" y="60.0519"/>
					<TrackLine>
						<End x="126.7" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD10"/>
				<Subwire width="0.15">
					<Start x="126.1384" y="51.6951"/>
					<TrackLine>
						<End x="126.4787" y="52.0627"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD11"/>
				<Subwire width="0.15">
					<Start x="126.1384" y="48.4951"/>
					<TrackLine>
						<End x="126.5261" y="48.156"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD11"/>
				<Subwire width="0.15">
					<Start x="126.7" y="60.5"/>
					<TrackLine>
						<End x="126.4121" y="60.1161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD12"/>
				<Subwire width="0.15">
					<Start x="126.1384" y="46.8951"/>
					<TrackLine>
						<End x="125.7434" y="46.5041"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD12"/>
				<Subwire width="0.15">
					<Start x="128.3" y="60.5"/>
					<TrackLine>
						<End x="127.9436" y="60.8248"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD13"/>
				<Subwire width="0.15">
					<Start x="126.1384" y="53.2951"/>
					<TrackLine>
						<End x="126.5151" y="52.963"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD13"/>
				<Subwire width="0.15">
					<Start x="127.5" y="60.5"/>
					<TrackLine>
						<End x="127.206" y="60.8779"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD14"/>
				<Subwire width="0.15">
					<Start x="127.8007" y="60.0712"/>
					<TrackLine>
						<End x="127.5" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD14"/>
				<Subwire width="0.15">
					<Start x="124.5384" y="46.8951"/>
					<TrackLine>
						<End x="124.13" y="46.4898"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD15"/>
				<Subwire width="0.15">
					<Start x="128.6517" y="60.054"/>
					<TrackLine>
						<End x="128.3" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SD15"/>
				<Subwire width="0.15">
					<Start x="124.5384" y="53.2951"/>
					<TrackLine>
						<End x="124.0625" y="53.9588"/>
					</TrackLine>
					<TrackLine>
						<End x="124.0005" y="54.206"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDBA0"/>
				<Subwire width="0.15">
					<Start x="133.3654" y="59.2905"/>
					<TrackLine>
						<End x="133.9" y="59.7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDBA0"/>
				<Subwire width="0.15">
					<Start x="131.7384" y="47.6951"/>
					<TrackLine>
						<End x="132.1282" y="47.3313"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDBA1"/>
				<Subwire width="0.15">
					<Start x="131.7384" y="48.4951"/>
					<TrackLine>
						<End x="132.1359" y="48.1207"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDBA1"/>
				<Subwire width="0.15">
					<Start x="133.9" y="60.5"/>
					<TrackLine>
						<End x="133.5054" y="60.1794"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDCKE0"/>
				<Subwire width="0.15">
					<Start x="130.9384" y="47.6951"/>
					<TrackLine>
						<End x="131.2684" y="48.0815"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDCKE0"/>
				<Subwire width="0.15">
					<Start x="124.3" y="62.1"/>
					<TrackLine>
						<End x="124.7118" y="61.6884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDCLK_B"/>
				<Subwire width="0.15">
					<Start x="130.9384" y="52.4951"/>
					<TrackLine>
						<End x="131.2605" y="52.8802"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDCLK_B"/>
				<Subwire width="0.15">
					<Start x="128.3" y="62.9"/>
					<TrackLine>
						<End x="128.6101" y="63.2714"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDCLK"/>
				<Subwire width="0.15">
					<Start x="130.1384" y="52.4951"/>
					<TrackLine>
						<End x="130.4866" y="52.8572"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDCLK"/>
				<Subwire width="0.15">
					<Start x="129.1" y="62.9"/>
					<TrackLine>
						<End x="128.7831" y="62.5051"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDWE_B"/>
				<Subwire width="0.15">
					<Start x="130.9384" y="48.4951"/>
					<TrackLine>
						<End x="130.97" y="49.0102"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Top"/>
				<NetRef name="SDWE_B"/>
				<Subwire width="0.15">
					<Start x="126.7" y="64.5"/>
					<TrackLine>
						<End x="126.3069" y="64.11"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="A6"/>
				<Subwire width="0.15">
					<Start x="132.9216" y="51.371"/>
					<TrackLine>
						<End x="133.3106" y="51.8864"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3106" y="52.2488"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3025" y="52.6913"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3025" y="53.0161"/>
					</TrackLine>
					<TrackLine>
						<End x="133.6121" y="53.3602"/>
					</TrackLine>
					<TrackLine>
						<End x="133.6255" y="53.4198"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.6493" y="53.5297"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.5633" y="53.6635"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.4805" y="53.6815"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.3944" y="53.8153"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.4421" y="54.0352"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.5759" y="54.1213"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.9613" y="54.0376"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.0951" y="54.1237"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.1428" y="54.3436"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.0567" y="54.4774"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.6712" y="54.5611"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.5852" y="54.6948"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.6329" y="54.9147"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.7666" y="55.0008"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.1521" y="54.9172"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.2859" y="55.0033"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.3336" y="55.2232"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.2475" y="55.357"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.862" y="55.4406"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.7759" y="55.5744"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.8236" y="55.7943"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.9574" y="55.8804"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.3429" y="55.7967"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.4767" y="55.8828"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.5244" y="56.1027"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.4383" y="56.2365"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.0528" y="56.3202"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="133.9667" y="56.4539"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.0144" y="56.6738"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.1482" y="56.7599"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.5337" y="56.6763"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.6675" y="56.7624"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.7152" y="56.9823"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.6291" y="57.1161"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.2436" y="57.1997"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.1575" y="57.3335"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.2052" y="57.5534"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.339" y="57.6395"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.7245" y="57.5558"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.8583" y="57.6419"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.906" y="57.8618"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.8199" y="57.9956"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.4344" y="58.0793"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.3483" y="58.213"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.396" y="58.4329"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.5298" y="58.519"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.9153" y="58.4354"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="135.0491" y="58.5215"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="135.0968" y="58.7414"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="135.0107" y="58.8752"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.6252" y="58.9588"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.5391" y="59.0926"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.5868" y="59.3125"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.7206" y="59.3986"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="135.1061" y="59.3149"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="135.2398" y="59.401"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="135.2875" y="59.6209"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="135.2014" y="59.7547"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.816" y="59.8384"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.7299" y="59.9721"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.7776" y="60.192"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.9114" y="60.2781"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="134.9942" y="60.2602"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="135.128" y="60.3465"/>
					</TrackLine>
					<TrackLine serpRef="serp_1">
						<End x="135.1519" y="60.4566"/>
					</TrackLine>
					<TrackLine>
						<End x="135.1519" y="60.6647"/>
					</TrackLine>
					<TrackLine>
						<End x="135.0768" y="60.9745"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="A7"/>
				<Subwire width="0.15">
					<Start x="134.5119" y="47.3512"/>
					<TrackLine>
						<End x="134.4985" y="47.9012"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.4902" y="48.0134"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.3696" y="48.1172"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.3636" y="48.1168"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.243" y="48.2206"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.2263" y="48.445"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.3302" y="48.5655"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.5666" y="48.5831"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.6705" y="48.7037"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.6538" y="48.9281"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.5332" y="49.0319"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.2968" y="49.0143"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.1762" y="49.1181"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.1595" y="49.3425"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.2634" y="49.463"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.4998" y="49.4807"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.6037" y="49.6012"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.587" y="49.8256"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.4664" y="49.9294"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.23" y="49.9118"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.1094" y="50.0156"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.0927" y="50.24"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.1966" y="50.3605"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.433" y="50.3782"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.5369" y="50.4987"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.5202" y="50.7231"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.3996" y="50.8269"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.1632" y="50.8093"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.0426" y="50.9131"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.0259" y="51.1375"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.1298" y="51.2581"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.3662" y="51.2757"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.4701" y="51.3962"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.4534" y="51.6206"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.3328" y="51.7244"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.3268" y="51.724"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.2063" y="51.8274"/>
					</TrackLine>
					<TrackLine serpRef="serp_2">
						<End x="134.1979" y="51.9404"/>
					</TrackLine>
					<TrackLine>
						<End x="134.1979" y="52.038"/>
					</TrackLine>
					<TrackLine>
						<End x="134.1599" y="52.658"/>
					</TrackLine>
					<TrackLine>
						<End x="134.1599" y="52.9742"/>
					</TrackLine>
					<TrackLine>
						<End x="134.3834" y="53.1977"/>
					</TrackLine>
					<TrackLine>
						<End x="134.7061" y="53.2898"/>
					</TrackLine>
					<TrackLine>
						<End x="134.8171" y="53.4008"/>
					</TrackLine>
					<TrackLine>
						<End x="134.8171" y="53.4281"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="134.8464" y="53.5367"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="134.7496" y="53.7959"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="134.8083" y="54.0132"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="134.9462" y="54.0924"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.0401" y="54.0671"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.178" y="54.1463"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.2367" y="54.3635"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.1575" y="54.5015"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.0636" y="54.5268"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="134.9844" y="54.6648"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.043" y="54.882"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.181" y="54.9613"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.2748" y="54.9359"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.4128" y="55.0152"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.4715" y="55.2324"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.3922" y="55.3703"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.2984" y="55.3957"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.2191" y="55.5336"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.2778" y="55.7509"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.4157" y="55.8301"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.5096" y="55.8048"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.6475" y="55.884"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.7062" y="56.1012"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.627" y="56.2392"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.5331" y="56.2645"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.4539" y="56.4025"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.5125" y="56.6197"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.6505" y="56.699"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.7443" y="56.6736"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.8823" y="56.7529"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.941" y="56.9701"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.8617" y="57.108"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.7679" y="57.1334"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.6886" y="57.2713"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.7473" y="57.4886"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.8852" y="57.5678"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.9791" y="57.5425"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="136.117" y="57.6217"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="136.1757" y="57.8389"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="136.0965" y="57.9769"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="136.0026" y="58.0022"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.9234" y="58.1402"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="135.982" y="58.3574"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="136.1964" y="58.533"/>
					</TrackLine>
					<TrackLine serpRef="serp_3">
						<End x="136.2259" y="58.6421"/>
					</TrackLine>
					<TrackLine>
						<End x="136.2259" y="58.7718"/>
					</TrackLine>
					<TrackLine>
						<End x="136.0749" y="59.1211"/>
					</TrackLine>
					<TrackLine>
						<End x="135.8761" y="59.4035"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="A12"/>
				<Subwire width="0.15">
					<Start x="135.4752" y="47.6336"/>
					<TrackLine>
						<End x="135.7875" y="47.9788"/>
					</TrackLine>
					<TrackLine>
						<End x="136.6064" y="49.7752"/>
					</TrackLine>
					<TrackLine>
						<End x="136.6064" y="49.9049"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6098" y="50.0174"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.5577" y="50.244"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.5645" y="50.4689"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6888" y="50.6903"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6956" y="50.9152"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.5848" y="51.1436"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.5915" y="51.3685"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7158" y="51.5899"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7226" y="51.8148"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6118" y="52.0432"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6185" y="52.2681"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7428" y="52.4895"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7496" y="52.7144"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6388" y="52.9428"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6455" y="53.1677"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7699" y="53.3891"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7766" y="53.614"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6658" y="53.8424"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6725" y="54.0673"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7969" y="54.2887"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.8036" y="54.5136"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6928" y="54.742"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.6996" y="54.9669"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.8239" y="55.1883"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.8306" y="55.4132"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7198" y="55.6416"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7266" y="55.8665"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.8509" y="56.0879"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.8577" y="56.3128"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7468" y="56.5412"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.7536" y="56.7661"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.8191" y="56.9893"/>
					</TrackLine>
					<TrackLine serpRef="serp_4">
						<End x="136.8256" y="57.2033"/>
					</TrackLine>
					<TrackLine>
						<End x="136.8256" y="57.3532"/>
					</TrackLine>
					<TrackLine>
						<End x="136.7529" y="58.7307"/>
					</TrackLine>
					<TrackLine>
						<End x="136.7114" y="58.9729"/>
					</TrackLine>
					<TrackLine>
						<End x="136.2962" y="59.8334"/>
					</TrackLine>
					<TrackLine>
						<End x="136.2962" y="60.365"/>
					</TrackLine>
					<TrackLine>
						<End x="135.5823" y="61.7997"/>
					</TrackLine>
					<TrackLine>
						<End x="134.26" y="63.36"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="CAS_B"/>
				<Subwire width="0.15">
					<Start x="132.0601" y="52.0908"/>
					<TrackLine>
						<End x="131.4592" y="52.4709"/>
					</TrackLine>
					<TrackLine>
						<End x="131.1202" y="52.4709"/>
					</TrackLine>
					<TrackLine>
						<End x="130.6531" y="52.4553"/>
					</TrackLine>
					<TrackLine>
						<End x="130.3201" y="52.4553"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0847" y="52.6907"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0847" y="53.0237"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0968" y="53.4922"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0968" y="53.8434"/>
					</TrackLine>
					<TrackLine>
						<End x="129.8186" y="54.2195"/>
					</TrackLine>
					<TrackLine>
						<End x="129.5638" y="54.7464"/>
					</TrackLine>
					<TrackLine>
						<End x="129.5638" y="54.7779"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.5323" y="54.8859"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.2738" y="55.0448"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.2108" y="55.2608"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.2872" y="55.4003"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.4619" y="55.4513"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.5384" y="55.5909"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.4753" y="55.8068"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.3358" y="55.8833"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.1611" y="55.8323"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.0215" y="55.9087"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.9585" y="56.1247"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.0349" y="56.2642"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.2097" y="56.3153"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.2861" y="56.4548"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.223" y="56.6708"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.0835" y="56.7472"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.9088" y="56.6962"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.7693" y="56.7726"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.7062" y="56.9886"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.7826" y="57.1281"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.9574" y="57.1792"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="129.0338" y="57.3187"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.9707" y="57.5347"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.8312" y="57.6111"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.6565" y="57.5601"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.517" y="57.6365"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.4539" y="57.8525"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.5303" y="57.992"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.7051" y="58.0431"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.7815" y="58.1826"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.7185" y="58.3986"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.5789" y="58.475"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.4042" y="58.424"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.2647" y="58.5005"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.2016" y="58.7164"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.2781" y="58.856"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.4528" y="58.907"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.5292" y="59.0465"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.4662" y="59.2625"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.208" y="59.4205"/>
					</TrackLine>
					<TrackLine serpRef="serp_5">
						<End x="128.1701" y="59.5504"/>
					</TrackLine>
					<TrackLine>
						<End x="128.1701" y="59.7321"/>
					</TrackLine>
					<TrackLine>
						<End x="128.1775" y="59.9151"/>
					</TrackLine>
					<TrackLine>
						<End x="128.1775" y="60.2273"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9568" y="60.448"/>
					</TrackLine>
					<TrackLine>
						<End x="127.7875" y="60.448"/>
					</TrackLine>
					<TrackLine>
						<End x="127.0403" y="60.4779"/>
					</TrackLine>
					<TrackLine>
						<End x="126.806" y="60.7122"/>
					</TrackLine>
					<TrackLine>
						<End x="126.3147" y="61.5711"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2973" y="61.5886"/>
					</TrackLine>
					<TrackLine serpRef="serp_6">
						<End x="126.2386" y="61.6846"/>
					</TrackLine>
					<TrackLine serpRef="serp_6">
						<End x="126.0324" y="61.8222"/>
					</TrackLine>
					<TrackLine serpRef="serp_6">
						<End x="125.9149" y="62.0141"/>
					</TrackLine>
					<TrackLine serpRef="serp_6">
						<End x="125.975" y="62.3146"/>
					</TrackLine>
					<TrackLine serpRef="serp_6">
						<End x="125.8575" y="62.5065"/>
					</TrackLine>
					<TrackLine serpRef="serp_6">
						<End x="125.6513" y="62.6441"/>
					</TrackLine>
					<TrackLine serpRef="serp_6">
						<End x="125.5923" y="62.7406"/>
					</TrackLine>
					<TrackLine>
						<End x="125.5749" y="62.7581"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4655" y="63.2088"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SD2"/>
				<Subwire width="0.15">
					<Start x="129.7105" y="52.0526"/>
					<TrackLine>
						<End x="129.2664" y="52.6853"/>
					</TrackLine>
					<TrackLine>
						<End x="129.2665" y="53.0625"/>
					</TrackLine>
					<TrackLine>
						<End x="128.9604" y="53.4344"/>
					</TrackLine>
					<TrackLine>
						<End x="128.9604" y="53.4722"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.9283" y="53.58"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.7884" y="53.6558"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.7253" y="53.637"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.5854" y="53.7128"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.5213" y="53.9284"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.5971" y="54.0683"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.9389" y="54.17"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="129.0147" y="54.3099"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.9505" y="54.5256"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.8106" y="54.6013"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.4688" y="54.4997"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.3289" y="54.5754"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.2647" y="54.7911"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.3405" y="54.931"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.6823" y="55.0327"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.7581" y="55.1726"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.6939" y="55.3882"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.554" y="55.464"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.2122" y="55.3623"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.0723" y="55.4381"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.0082" y="55.6537"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.0839" y="55.7936"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.4258" y="55.8953"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.5015" y="56.0352"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.4374" y="56.2509"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.2975" y="56.3266"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.9556" y="56.225"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.8157" y="56.3007"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.7516" y="56.5164"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.8273" y="56.6563"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.1692" y="56.758"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.2449" y="56.8979"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.1808" y="57.1135"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="128.0409" y="57.1893"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.6991" y="57.0876"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.5592" y="57.1634"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.495" y="57.379"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.5708" y="57.5189"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.9126" y="57.6206"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.9884" y="57.7605"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.9242" y="57.9762"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.7843" y="58.0519"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.4425" y="57.9503"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.3026" y="58.026"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.2384" y="58.2417"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.3142" y="58.3816"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.656" y="58.4833"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.7318" y="58.6232"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.6677" y="58.8388"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.5278" y="58.9146"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.4647" y="58.8958"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.325" y="58.9707"/>
					</TrackLine>
					<TrackLine serpRef="serp_7">
						<End x="127.1708" y="59.4892"/>
					</TrackLine>
					<TrackLine>
						<End x="127.1476" y="59.5174"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7957" y="59.893"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7957" y="60.275"/>
					</TrackLine>
					<TrackLine>
						<End x="126.571" y="60.4997"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2532" y="60.4997"/>
					</TrackLine>
					<TrackLine>
						<End x="125.7323" y="60.4832"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4103" y="60.4832"/>
					</TrackLine>
					<TrackLine>
						<End x="124.9786" y="60.5503"/>
					</TrackLine>
					<TrackLine>
						<End x="124.6266" y="60.5503"/>
					</TrackLine>
					<TrackLine>
						<End x="123.925" y="60.1637"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SD6"/>
				<Subwire width="0.15">
					<Start x="127.3735" y="47.2374"/>
					<TrackLine>
						<End x="126.6508" y="47.732"/>
					</TrackLine>
					<TrackLine>
						<End x="126.3535" y="47.7394"/>
					</TrackLine>
					<TrackLine>
						<End x="126.1095" y="47.9834"/>
					</TrackLine>
					<TrackLine>
						<End x="126.1096" y="48.3147"/>
					</TrackLine>
					<TrackLine>
						<End x="125.9081" y="48.8261"/>
					</TrackLine>
					<TrackLine>
						<End x="125.9081" y="48.8611"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.8831" y="48.9708"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.6916" y="49.1579"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.6417" y="49.3773"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.7263" y="49.512"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.79" y="49.5265"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.8746" y="49.6612"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.8247" y="49.8805"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.69" y="49.9652"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.6264" y="49.9507"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.4917" y="50.0354"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.4417" y="50.2548"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.5264" y="50.3895"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.59" y="50.404"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.6747" y="50.5387"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.6247" y="50.758"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.4901" y="50.8427"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.4264" y="50.8282"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.2918" y="50.9129"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.2418" y="51.1323"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.3333" y="51.3839"/>
					</TrackLine>
					<TrackLine serpRef="serp_8">
						<End x="125.3081" y="51.4945"/>
					</TrackLine>
					<TrackLine>
						<End x="125.3081" y="51.6151"/>
					</TrackLine>
					<TrackLine>
						<End x="125.3181" y="51.8928"/>
					</TrackLine>
					<TrackLine>
						<End x="125.318" y="52.2048"/>
					</TrackLine>
					<TrackLine>
						<End x="125.3548" y="52.6904"/>
					</TrackLine>
					<TrackLine>
						<End x="125.3548" y="52.9832"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4605" y="53.3254"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4605" y="53.4293"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.4611" y="53.5418"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2764" y="53.7677"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2775" y="53.9927"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.3906" y="54.1046"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.537" y="54.1039"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6501" y="54.2159"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6512" y="54.4409"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.5392" y="54.5539"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.3928" y="54.5546"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2808" y="54.6677"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2819" y="54.8927"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.395" y="55.0046"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.5414" y="55.0039"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6545" y="55.1159"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6556" y="55.3409"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.5436" y="55.4539"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.3972" y="55.4546"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2852" y="55.5677"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2863" y="55.7927"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.3994" y="55.9046"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.5458" y="55.9039"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6589" y="56.0158"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.66" y="56.2408"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.548" y="56.3539"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.4016" y="56.3546"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2896" y="56.4677"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2907" y="56.6927"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.4038" y="56.8046"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.5502" y="56.8039"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6633" y="56.9158"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6644" y="57.1408"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.5524" y="57.2539"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.406" y="57.2546"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.294" y="57.3676"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2951" y="57.5926"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.4082" y="57.7046"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.5546" y="57.7039"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6677" y="57.8158"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6688" y="58.0408"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.5568" y="58.1539"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.4104" y="58.1546"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2984" y="58.2676"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.2995" y="58.4926"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.4126" y="58.6046"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.559" y="58.6039"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6721" y="58.7158"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.6732" y="58.9408"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.4886" y="59.1692"/>
					</TrackLine>
					<TrackLine serpRef="serp_9">
						<End x="125.4891" y="59.2806"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4891" y="59.3869"/>
					</TrackLine>
					<TrackLine>
						<End x="125.3772" y="60.0946"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SD9"/>
				<Subwire width="0.15">
					<Start x="124.9553" y="47.3596"/>
					<TrackLine>
						<End x="124.3039" y="48.814"/>
					</TrackLine>
					<TrackLine>
						<End x="124.0215" y="50.4756"/>
					</TrackLine>
					<TrackLine>
						<End x="124.0215" y="50.5123"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="124.0031" y="50.6233"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.8611" y="50.8278"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.8243" y="51.0498"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.9979" y="51.3066"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.9611" y="51.5286"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.7139" y="51.7157"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.6771" y="51.9377"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.8508" y="52.1945"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.814" y="52.4165"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.5667" y="52.6036"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.5299" y="52.8255"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.7036" y="53.0824"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.6668" y="53.3044"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.4196" y="53.4914"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.3828" y="53.7134"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.4511" y="53.9536"/>
					</TrackLine>
					<TrackLine serpRef="serp_10">
						<End x="123.4327" y="54.0643"/>
					</TrackLine>
					<TrackLine>
						<End x="123.3929" y="54.5065"/>
					</TrackLine>
					<TrackLine>
						<End x="123.3929" y="54.738"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.4255" y="54.8457"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.3504" y="54.9859"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.2769" y="55.0081"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.2018" y="55.1484"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.267" y="55.3637"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.4072" y="55.4389"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.7694" y="55.3293"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.9097" y="55.4045"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.9748" y="55.6198"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.8997" y="55.7601"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.5375" y="55.8696"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.4624" y="56.0098"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.5275" y="56.2252"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.6678" y="56.3003"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.03" y="56.1908"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.1702" y="56.2659"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.2354" y="56.4813"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.1603" y="56.6215"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.798" y="56.7311"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.7229" y="56.8713"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.7881" y="57.0867"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.9283" y="57.1618"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.2905" y="57.0523"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.4308" y="57.1274"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.4959" y="57.3428"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.4208" y="57.483"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.0586" y="57.5925"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="123.9835" y="57.7328"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.0486" y="57.9481"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.1889" y="58.0233"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.5511" y="57.9137"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.6913" y="57.9889"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.7565" y="58.2042"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.6814" y="58.3445"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.6079" y="58.3667"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.5329" y="58.5071"/>
					</TrackLine>
					<TrackLine serpRef="serp_11">
						<End x="124.5656" y="58.6152"/>
					</TrackLine>
					<TrackLine>
						<End x="124.5656" y="58.6513"/>
					</TrackLine>
					<TrackLine>
						<End x="124.8183" y="59.2739"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SD11"/>
				<Subwire width="0.15">
					<Start x="126.5261" y="48.156"/>
					<TrackLine>
						<End x="126.7539" y="48.6904"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7539" y="48.7977"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.7645" y="48.9097"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.6632" y="49.0323"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.6195" y="49.0365"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.5182" y="49.1591"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.5395" y="49.3831"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.6621" y="49.4845"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.9734" y="49.4549"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="127.0961" y="49.5562"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="127.1174" y="49.7802"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="127.016" y="49.9029"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.7047" y="49.9325"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.6033" y="50.0551"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.6246" y="50.2791"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.7473" y="50.3804"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="127.0586" y="50.3508"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="127.1812" y="50.4522"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="127.2025" y="50.6762"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="127.1012" y="50.7988"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.7899" y="50.8284"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.6885" y="50.9511"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.7098" y="51.1751"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.8324" y="51.2764"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.8761" y="51.2723"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="126.9987" y="51.3731"/>
					</TrackLine>
					<TrackLine serpRef="serp_12">
						<End x="127.0095" y="51.4863"/>
					</TrackLine>
					<TrackLine>
						<End x="127.0095" y="51.6574"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9115" y="51.8497"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9115" y="52.2083"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9526" y="52.7818"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9526" y="53.1442"/>
					</TrackLine>
					<TrackLine>
						<End x="126.5772" y="53.8837"/>
					</TrackLine>
					<TrackLine>
						<End x="126.5772" y="54.0037"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.5722" y="54.1161"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.4548" y="54.2235"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.4288" y="54.2223"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.3114" y="54.3297"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.3014" y="54.5545"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.4088" y="54.6719"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.6856" y="54.6842"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.793" y="54.8016"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.783" y="55.0263"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.6656" y="55.1337"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.3888" y="55.1215"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.2714" y="55.2289"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.2614" y="55.4536"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.3688" y="55.571"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.6456" y="55.5833"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.753" y="55.7007"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.743" y="55.9255"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.6256" y="56.0329"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.3488" y="56.0206"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.2314" y="56.128"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.2214" y="56.3528"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.3288" y="56.4701"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.6056" y="56.4824"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.713" y="56.5998"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.703" y="56.8246"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.5856" y="56.932"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.3088" y="56.9197"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.1914" y="57.0271"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.1814" y="57.2519"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.2888" y="57.3693"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.5656" y="57.3815"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.673" y="57.4989"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.663" y="57.7237"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.5456" y="57.8311"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.2688" y="57.8188"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.1514" y="57.9262"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.1414" y="58.151"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.2488" y="58.2684"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.2748" y="58.2695"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.3823" y="58.3851"/>
					</TrackLine>
					<TrackLine serpRef="serp_13">
						<End x="126.364" y="58.7964"/>
					</TrackLine>
					<TrackLine>
						<End x="126.364" y="58.9452"/>
					</TrackLine>
					<TrackLine>
						<End x="126.4121" y="60.1161"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SDBA1"/>
				<Subwire width="0.15">
					<Start x="132.1359" y="48.1207"/>
					<TrackLine>
						<End x="131.9625" y="49.0188"/>
					</TrackLine>
					<TrackLine>
						<End x="131.9625" y="49.3812"/>
					</TrackLine>
					<TrackLine>
						<End x="132.0387" y="49.6382"/>
					</TrackLine>
					<TrackLine>
						<End x="132.0387" y="49.7019"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="132.0603" y="49.8123"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="131.9714" y="49.9443"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="131.9471" y="49.949"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="131.8583" y="50.081"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="131.9014" y="50.3019"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="132.0334" y="50.3907"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="132.3028" y="50.3381"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="132.4348" y="50.4269"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="132.4779" y="50.6478"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="132.3891" y="50.7798"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="132.3648" y="50.7845"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="132.276" y="50.9167"/>
					</TrackLine>
					<TrackLine serpRef="serp_14">
						<End x="132.2976" y="51.0273"/>
					</TrackLine>
					<TrackLine>
						<End x="132.2976" y="51.091"/>
					</TrackLine>
					<TrackLine>
						<End x="132.4666" y="51.9224"/>
					</TrackLine>
					<TrackLine>
						<End x="132.4666" y="52.236"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5196" y="52.8312"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5196" y="53.0211"/>
					</TrackLine>
					<TrackLine>
						<End x="132.6438" y="53.7466"/>
					</TrackLine>
					<TrackLine>
						<End x="132.6438" y="53.8113"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.6678" y="53.9212"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.5818" y="54.0551"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.5232" y="54.0679"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.4372" y="54.2018"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.4852" y="54.4216"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.6191" y="54.5076"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.9562" y="54.434"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.0901" y="54.52"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.138" y="54.7398"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.0521" y="54.8737"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.715" y="54.9472"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.629" y="55.0811"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.677" y="55.3009"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.8109" y="55.3869"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.148" y="55.3134"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.2819" y="55.3993"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.3298" y="55.6191"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.2439" y="55.753"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.9067" y="55.8266"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.8208" y="55.9604"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="132.8687" y="56.1803"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.0026" y="56.2662"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.3398" y="56.1927"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.4737" y="56.2786"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.5216" y="56.4985"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.4357" y="56.6323"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.0985" y="56.7059"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.0126" y="56.8398"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.0605" y="57.0596"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.1944" y="57.1455"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.5315" y="57.072"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.6654" y="57.158"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.7134" y="57.3778"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.6274" y="57.5117"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.2903" y="57.5852"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.2044" y="57.7191"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.2523" y="57.9389"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.3862" y="58.0249"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.7233" y="57.9513"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.8572" y="58.0373"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.9052" y="58.2571"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.8192" y="58.391"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.7606" y="58.4038"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.6747" y="58.5379"/>
					</TrackLine>
					<TrackLine serpRef="serp_15">
						<End x="133.6987" y="58.648"/>
					</TrackLine>
					<TrackLine>
						<End x="133.6987" y="58.7127"/>
					</TrackLine>
					<TrackLine>
						<End x="133.8029" y="59.1093"/>
					</TrackLine>
					<TrackLine>
						<End x="133.8029" y="59.4717"/>
					</TrackLine>
					<TrackLine>
						<End x="133.5054" y="60.1794"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SDCLK_B"/>
				<Subwire width="0.15">
					<Start x="131.2605" y="52.8802"/>
					<TrackLine>
						<End x="131.3109" y="53.098"/>
					</TrackLine>
					<TrackLine>
						<End x="131.3121" y="53.2982"/>
					</TrackLine>
					<TrackLine>
						<End x="131.3121" y="53.3793"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SDCLK_B"/>
				<Subwire width="0.15">
					<Start x="130.4382" y="61.1277"/>
					<TrackLine>
						<End x="130.4828" y="61.2605"/>
					</TrackLine>
					<TrackLine>
						<End x="130.4828" y="61.5401"/>
					</TrackLine>
					<TrackLine>
						<End x="129.9859" y="62.1612"/>
					</TrackLine>
					<TrackLine>
						<End x="129.7882" y="62.3589"/>
					</TrackLine>
					<TrackLine>
						<End x="129.6242" y="62.5129"/>
					</TrackLine>
					<TrackLine>
						<End x="128.6101" y="63.2714"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SDCLK"/>
				<Subwire width="0.15">
					<Start x="130.4866" y="52.8572"/>
					<TrackLine>
						<End x="130.9121" y="53.3827"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SDCLK"/>
				<Subwire width="0.15">
					<Start x="130.1132" y="60.8947"/>
					<TrackLine>
						<End x="130.0072" y="61.0423"/>
					</TrackLine>
					<TrackLine>
						<End x="129.9588" y="61.0907"/>
					</TrackLine>
					<TrackLine>
						<End x="129.9143" y="61.1542"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.8323" y="61.2312"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.6733" y="61.2262"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.6067" y="61.1553"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.4477" y="61.1503"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.2836" y="61.3043"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.2786" y="61.4633"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.5658" y="61.7691"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.5608" y="61.9281"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.3967" y="62.0821"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.2377" y="62.0771"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.1711" y="62.0062"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="129.0121" y="62.0012"/>
					</TrackLine>
					<TrackLine serpRef="serp_16">
						<End x="128.9211" y="62.0867"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8149" y="62.193"/>
					</TrackLine>
					<TrackLine>
						<End x="128.7831" y="62.5051"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="A1"/>
				<Subwire width="0.15">
					<Start x="132.8665" y="48.0989"/>
					<TrackLine>
						<End x="131.9625" y="49.0188"/>
					</TrackLine>
					<TrackLine>
						<End x="131.7265" y="49.5034"/>
					</TrackLine>
					<TrackLine>
						<End x="131.7265" y="49.5883"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.7159" y="49.7003"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.5101" y="49.9067"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.4888" y="50.1307"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.5901" y="50.2534"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.7351" y="50.2672"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.8364" y="50.3898"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.8151" y="50.6138"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.6925" y="50.7151"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.5475" y="50.7013"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.4249" y="50.8027"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.4036" y="51.0267"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.5667" y="51.2688"/>
					</TrackLine>
					<TrackLine serpRef="serp_17">
						<End x="131.5561" y="51.3807"/>
					</TrackLine>
					<TrackLine>
						<End x="131.5561" y="51.5162"/>
					</TrackLine>
					<TrackLine>
						<End x="131.6749" y="51.902"/>
					</TrackLine>
					<TrackLine>
						<End x="131.6749" y="52.2504"/>
					</TrackLine>
					<TrackLine>
						<End x="131.6946" y="52.7004"/>
					</TrackLine>
					<TrackLine>
						<End x="131.6945" y="53.173"/>
					</TrackLine>
					<TrackLine>
						<End x="131.732" y="54.2584"/>
					</TrackLine>
					<TrackLine>
						<End x="131.732" y="54.3202"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.7472" y="54.4317"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.6229" y="54.6757"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.6533" y="54.8986"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.7799" y="54.9949"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.8662" y="54.9832"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.9928" y="55.0795"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.0232" y="55.3024"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.9269" y="55.429"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.8406" y="55.4408"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.7443" y="55.5674"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.7747" y="55.7904"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.9013" y="55.8867"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.9876" y="55.8749"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.1142" y="55.9712"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.1446" y="56.1942"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.0483" y="56.3208"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.962" y="56.3326"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.8657" y="56.4592"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.8961" y="56.6822"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.0227" y="56.7784"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.109" y="56.7667"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.2356" y="56.863"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.266" y="57.0859"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.1697" y="57.2126"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.0834" y="57.2243"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="131.9871" y="57.351"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.0175" y="57.5739"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.1441" y="57.6702"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.2304" y="57.6585"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.357" y="57.7548"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.3874" y="57.9777"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.2911" y="58.1044"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.2048" y="58.1161"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.1085" y="58.2428"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.1389" y="58.4657"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.2655" y="58.562"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.3518" y="58.5503"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.4784" y="58.6465"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.5088" y="58.8695"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.4125" y="58.9961"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.3262" y="59.0079"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.2299" y="59.1345"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.2603" y="59.3575"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.3869" y="59.4538"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.4732" y="59.442"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.5998" y="59.5383"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.6302" y="59.7613"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.5339" y="59.8879"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.4476" y="59.8997"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.3513" y="60.0263"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.3817" y="60.2492"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.5083" y="60.3455"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.5946" y="60.3338"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.7212" y="60.4301"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.7516" y="60.653"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.6273" y="60.8966"/>
					</TrackLine>
					<TrackLine serpRef="serp_18">
						<End x="132.6425" y="61.0087"/>
					</TrackLine>
					<TrackLine>
						<End x="132.6425" y="61.0705"/>
					</TrackLine>
					<TrackLine>
						<End x="132.7005" y="61.6718"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="A3"/>
				<Subwire width="0.15">
					<Start x="133.7384" y="47.2951"/>
					<TrackLine>
						<End x="134.1446" y="52.9805"/>
					</TrackLine>
					<TrackLine>
						<End x="134.426" y="53.3137"/>
					</TrackLine>
					<TrackLine>
						<End x="134.426" y="53.396"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.437" y="53.508"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.2446" y="53.7529"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.2665" y="53.9768"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.3895" y="54.0778"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.594" y="54.0578"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.7169" y="54.1588"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.7388" y="54.3827"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.6378" y="54.5056"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.4333" y="54.5257"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.3323" y="54.6486"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.3542" y="54.8725"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.4771" y="54.9735"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.6816" y="54.9535"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.8045" y="55.0545"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.8264" y="55.2784"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.7254" y="55.4014"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.5209" y="55.4214"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.4199" y="55.5443"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.4418" y="55.7682"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.5647" y="55.8692"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.7692" y="55.8492"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.8922" y="55.9502"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.9141" y="56.1742"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.8131" y="56.2971"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.6086" y="56.3171"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.5075" y="56.44"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.5294" y="56.6639"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.6524" y="56.7649"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.8569" y="56.7449"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.9798" y="56.8459"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="135.0017" y="57.0699"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.9007" y="57.1928"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.6962" y="57.2128"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.5952" y="57.3357"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.6171" y="57.5596"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.74" y="57.6607"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.9445" y="57.6406"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="135.0674" y="57.7417"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="135.0893" y="57.9656"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.9883" y="58.0885"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.7838" y="58.1085"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.6828" y="58.2314"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.7047" y="58.4554"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.9408" y="58.6583"/>
					</TrackLine>
					<TrackLine serpRef="serp_19">
						<End x="134.9909" y="59.1705"/>
					</TrackLine>
					<TrackLine>
						<End x="134.9909" y="59.3038"/>
					</TrackLine>
					<TrackLine>
						<End x="134.7387" y="60.4074"/>
					</TrackLine>
					<TrackLine>
						<End x="134.2124" y="60.9404"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="A5"/>
				<Subwire width="0.15">
					<Start x="132.9183" y="48.8278"/>
					<TrackLine>
						<End x="132.8633" y="49.7199"/>
					</TrackLine>
					<TrackLine>
						<End x="132.8633" y="49.7935"/>
					</TrackLine>
					<TrackLine serpRef="serp_20">
						<End x="132.8421" y="49.904"/>
					</TrackLine>
					<TrackLine serpRef="serp_20">
						<End x="132.7104" y="49.9932"/>
					</TrackLine>
					<TrackLine serpRef="serp_20">
						<End x="132.552" y="49.9628"/>
					</TrackLine>
					<TrackLine serpRef="serp_20">
						<End x="132.4203" y="50.052"/>
					</TrackLine>
					<TrackLine serpRef="serp_20">
						<End x="132.3778" y="50.273"/>
					</TrackLine>
					<TrackLine serpRef="serp_20">
						<End x="132.467" y="50.4047"/>
					</TrackLine>
					<TrackLine serpRef="serp_20">
						<End x="132.6254" y="50.4351"/>
					</TrackLine>
					<TrackLine serpRef="serp_20">
						<End x="132.7146" y="50.567"/>
					</TrackLine>
					<TrackLine serpRef="serp_20">
						<End x="132.6933" y="50.6779"/>
					</TrackLine>
					<TrackLine>
						<End x="132.6933" y="50.7515"/>
					</TrackLine>
					<TrackLine>
						<End x="132.4841" y="51.1898"/>
					</TrackLine>
					<TrackLine>
						<End x="132.4666" y="51.8992"/>
					</TrackLine>
					<TrackLine>
						<End x="132.4666" y="52.236"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5196" y="52.8312"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5196" y="53.0211"/>
					</TrackLine>
					<TrackLine>
						<End x="132.8059" y="53.3137"/>
					</TrackLine>
					<TrackLine>
						<End x="132.8405" y="53.3656"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="132.864" y="53.4756"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="132.7775" y="53.6091"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="132.7416" y="53.6168"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="132.6551" y="53.7503"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="132.7021" y="53.9703"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="132.8356" y="54.0568"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.1274" y="53.9946"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.2609" y="54.0811"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.3079" y="54.3011"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.2214" y="54.4346"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="132.9296" y="54.4969"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="132.8431" y="54.6304"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="132.8901" y="54.8505"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.0236" y="54.937"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.3154" y="54.8747"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.4489" y="54.9612"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.4959" y="55.1813"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.4094" y="55.3148"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.1176" y="55.3771"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.0311" y="55.5106"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.0781" y="55.7306"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.2116" y="55.8171"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.5034" y="55.7549"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.6369" y="55.8414"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.6839" y="56.0614"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.5974" y="56.1949"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.3056" y="56.2572"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.2191" y="56.3907"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.2661" y="56.6108"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.3996" y="56.6973"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.6914" y="56.635"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.8249" y="56.7215"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.8719" y="56.9416"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.7854" y="57.0751"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.4936" y="57.1373"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.4071" y="57.2709"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.4541" y="57.4909"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.5876" y="57.5774"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.8794" y="57.5151"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="134.0129" y="57.6017"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="134.0599" y="57.8217"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.9734" y="57.9552"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.6816" y="58.0175"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.5951" y="58.151"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.6421" y="58.371"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.7756" y="58.4576"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="134.0674" y="58.3953"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="134.2009" y="58.4818"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="134.2479" y="58.7018"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="134.1614" y="58.8354"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.8696" y="58.8976"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.7831" y="59.0311"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.8301" y="59.2512"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.9636" y="59.3377"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="133.9995" y="59.3301"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="134.1322" y="59.413"/>
					</TrackLine>
					<TrackLine serpRef="serp_21">
						<End x="134.1644" y="59.5635"/>
					</TrackLine>
					<TrackLine>
						<End x="134.3012" y="60.2262"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="A8"/>
				<Subwire width="0.15">
					<Start x="134.5415" y="52.8161"/>
					<TrackLine>
						<End x="134.8139" y="53.0621"/>
					</TrackLine>
					<TrackLine>
						<End x="134.9946" y="53.2428"/>
					</TrackLine>
					<TrackLine>
						<End x="135.4284" y="53.6788"/>
					</TrackLine>
					<TrackLine>
						<End x="135.4284" y="53.7237"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.4583" y="53.8321"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.3798" y="53.9705"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.1379" y="54.0373"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.0593" y="54.1757"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.1192" y="54.3926"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.2575" y="54.4711"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.9583" y="54.2777"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.0967" y="54.3562"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.1565" y="54.5731"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.078" y="54.7115"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.3772" y="54.9049"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.2987" y="55.0432"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.3585" y="55.2601"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.4969" y="55.3387"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.1976" y="55.1453"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.336" y="55.2238"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.3959" y="55.4407"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.3173" y="55.5791"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.6166" y="55.7725"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.538" y="55.9108"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.5979" y="56.1277"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.7362" y="56.2063"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.437" y="56.0129"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.5754" y="56.0914"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.6352" y="56.3083"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.5567" y="56.4466"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.8559" y="56.64"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.7774" y="56.7784"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.8372" y="56.9953"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="135.9756" y="57.0738"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.6763" y="56.8804"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.8147" y="56.959"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.8746" y="57.1759"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.796" y="57.3142"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.0953" y="57.5076"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.0167" y="57.646"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.0766" y="57.8629"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.2149" y="57.9414"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.9157" y="57.748"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="137.0541" y="57.8266"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="137.1139" y="58.0434"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="137.0354" y="58.1818"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.3346" y="58.3752"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.2561" y="58.5136"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.3159" y="58.7305"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.4543" y="58.809"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.6962" y="58.7422"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.8345" y="58.8206"/>
					</TrackLine>
					<TrackLine serpRef="serp_22">
						<End x="136.8648" y="58.9305"/>
					</TrackLine>
					<TrackLine>
						<End x="136.8648" y="59.155"/>
					</TrackLine>
					<TrackLine>
						<End x="135.8901" y="60.1968"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="A9"/>
				<Subwire width="0.15">
					<Start x="135.3395" y="48.8145"/>
					<TrackLine>
						<End x="135.8333" y="49.1434"/>
					</TrackLine>
					<TrackLine>
						<End x="136.0273" y="49.3374"/>
					</TrackLine>
					<TrackLine>
						<End x="136.0273" y="49.4098"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="136.0489" y="49.5202"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="135.9601" y="49.6522"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="135.8694" y="49.6699"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="135.7806" y="49.8019"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="135.8238" y="50.0227"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="135.9558" y="50.1115"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="136.3579" y="50.033"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="136.4899" y="50.1218"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="136.5331" y="50.3426"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="136.4443" y="50.4746"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="136.3536" y="50.4923"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="136.2648" y="50.6243"/>
					</TrackLine>
					<TrackLine serpRef="serp_23">
						<End x="136.2865" y="50.7352"/>
					</TrackLine>
					<TrackLine>
						<End x="136.2865" y="50.8076"/>
					</TrackLine>
					<TrackLine>
						<End x="137.113" y="51.742"/>
					</TrackLine>
					<TrackLine>
						<End x="137.113" y="51.8379"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.1245" y="51.9498"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="136.9643" y="52.1924"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="136.9873" y="52.4162"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.1107" y="52.5167"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.253" y="52.5021"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.3764" y="52.6025"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.3993" y="52.8263"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.2989" y="52.9497"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.1566" y="52.9643"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.0561" y="53.0877"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.0791" y="53.3115"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.2025" y="53.412"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.3448" y="53.3974"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.4682" y="53.4978"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.4911" y="53.7217"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.3907" y="53.845"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.2483" y="53.8596"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.1479" y="53.983"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.1709" y="54.2069"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.2942" y="54.3073"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.4366" y="54.2927"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.56" y="54.3931"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.5829" y="54.617"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.4825" y="54.7403"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.3401" y="54.7549"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.2397" y="54.8783"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.2626" y="55.1022"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.386" y="55.2026"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.5284" y="55.188"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.6518" y="55.2884"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.6747" y="55.5123"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.5743" y="55.6357"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.4319" y="55.6503"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.3315" y="55.7736"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.3544" y="55.9975"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.4778" y="56.0979"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.6202" y="56.0833"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.7435" y="56.1837"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.7665" y="56.4076"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.6661" y="56.531"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.5237" y="56.5456"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.4233" y="56.6689"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.4462" y="56.8928"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.5696" y="56.9932"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.7119" y="56.9786"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.8353" y="57.0791"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.8583" y="57.3029"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.7578" y="57.4263"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.6155" y="57.4409"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.5151" y="57.5643"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.538" y="57.7881"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.6614" y="57.8885"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.8037" y="57.8739"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.9271" y="57.9744"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.9501" y="58.1982"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.7899" y="58.4408"/>
					</TrackLine>
					<TrackLine serpRef="serp_24">
						<End x="137.8015" y="58.5534"/>
					</TrackLine>
					<TrackLine>
						<End x="137.8015" y="58.7123"/>
					</TrackLine>
					<TrackLine>
						<End x="136.7023" y="60.0016"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="DQM0"/>
				<Subwire width="0.15">
					<Start x="127.7075" y="49.0174"/>
					<TrackLine>
						<End x="127.5305" y="49.6357"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.4993" y="49.7438"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.36" y="49.8206"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.2512" y="49.7892"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.1119" y="49.8661"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.0494" y="50.0822"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.1262" y="50.2215"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.5599" y="50.3468"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.6368" y="50.4861"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.5743" y="50.7022"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.435" y="50.7791"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.0013" y="50.6538"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="126.862" y="50.7307"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="126.7995" y="50.9468"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="126.8763" y="51.0861"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="126.9851" y="51.1175"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.0619" y="51.2568"/>
					</TrackLine>
					<TrackLine serpRef="serp_25">
						<End x="127.0305" y="51.3657"/>
					</TrackLine>
					<TrackLine>
						<End x="127.0305" y="51.4063"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9115" y="51.8497"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9115" y="52.242"/>
					</TrackLine>
					<TrackLine>
						<End x="126.658" y="52.4955"/>
					</TrackLine>
					<TrackLine>
						<End x="126.3541" y="52.5743"/>
					</TrackLine>
					<TrackLine>
						<End x="126.1264" y="52.802"/>
					</TrackLine>
					<TrackLine>
						<End x="126.1265" y="52.9856"/>
					</TrackLine>
					<TrackLine>
						<End x="124.7059" y="54.6192"/>
					</TrackLine>
					<TrackLine>
						<End x="124.7059" y="54.6465"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.6707" y="54.7534"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.5287" y="54.825"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.4543" y="54.8005"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.3122" y="54.8722"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.2419" y="55.0859"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.3136" y="55.228"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.6761" y="55.3473"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.7477" y="55.4894"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.6774" y="55.7031"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.5353" y="55.7748"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.1728" y="55.6554"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.0308" y="55.7271"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.9604" y="55.9408"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.0321" y="56.0828"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.3946" y="56.2022"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.4663" y="56.3443"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.3959" y="56.558"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.2539" y="56.6297"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.8914" y="56.5103"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.7493" y="56.582"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.679" y="56.7957"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.7507" y="56.9377"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.1132" y="57.0571"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.1848" y="57.1991"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="124.1145" y="57.4129"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.9724" y="57.4845"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.6099" y="57.3652"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.4679" y="57.4368"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.3975" y="57.6505"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.4692" y="57.7926"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.5436" y="57.8171"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.6154" y="57.9589"/>
					</TrackLine>
					<TrackLine serpRef="serp_26">
						<End x="123.5025" y="58.3018"/>
					</TrackLine>
					<TrackLine>
						<End x="123.5025" y="58.5401"/>
					</TrackLine>
					<TrackLine>
						<End x="123.5825" y="59.202"/>
					</TrackLine>
					<TrackLine>
						<End x="123.5825" y="59.5644"/>
					</TrackLine>
					<TrackLine>
						<End x="123.1727" y="60.154"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="SD0"/>
				<Subwire width="0.15">
					<Start x="128.1655" y="52.8467"/>
					<TrackLine>
						<End x="127.5649" y="53.2743"/>
					</TrackLine>
					<TrackLine>
						<End x="127.1032" y="53.2742"/>
					</TrackLine>
					<TrackLine>
						<End x="126.8578" y="53.5196"/>
					</TrackLine>
					<TrackLine>
						<End x="126.6861" y="53.7997"/>
					</TrackLine>
					<TrackLine>
						<End x="126.6818" y="53.8041"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.637" y="53.9073"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.489" y="53.9657"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.2513" y="53.8625"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.1033" y="53.9209"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.0137" y="54.1273"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.0721" y="54.2753"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.754" y="54.5713"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.8124" y="54.7192"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.7228" y="54.9256"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.5748" y="54.984"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.8929" y="54.6881"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.7449" y="54.7465"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.6553" y="54.9529"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.7137" y="55.1009"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.3956" y="55.3968"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.454" y="55.5448"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.3644" y="55.7512"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.2164" y="55.8096"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.5345" y="55.5136"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.3865" y="55.572"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.2969" y="55.7784"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.3553" y="55.9264"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.0372" y="56.2224"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.0956" y="56.3704"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="126.006" y="56.5768"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.858" y="56.6352"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.1761" y="56.3392"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.0281" y="56.3976"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="124.9385" y="56.604"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="124.9969" y="56.752"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.6788" y="57.0479"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.7372" y="57.1959"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.6476" y="57.4023"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.4996" y="57.4607"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="124.8177" y="57.1648"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="124.6697" y="57.2232"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="124.5801" y="57.4296"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="124.6385" y="57.5775"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.3204" y="57.8735"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.3788" y="58.0215"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.2892" y="58.2279"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="125.1412" y="58.2863"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="124.9035" y="58.1831"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="124.7554" y="58.2418"/>
					</TrackLine>
					<TrackLine serpRef="serp_27">
						<End x="124.7106" y="58.3449"/>
					</TrackLine>
					<TrackLine>
						<End x="124.7063" y="58.3493"/>
					</TrackLine>
					<TrackLine>
						<End x="124.7063" y="58.6093"/>
					</TrackLine>
					<TrackLine>
						<End x="124.8902" y="58.7932"/>
					</TrackLine>
					<TrackLine>
						<End x="124.9995" y="58.8364"/>
					</TrackLine>
					<TrackLine>
						<End x="125.2558" y="59.0927"/>
					</TrackLine>
					<TrackLine>
						<End x="125.2558" y="59.4551"/>
					</TrackLine>
					<TrackLine>
						<End x="124.9397" y="59.9134"/>
					</TrackLine>
					<TrackLine>
						<End x="124.8026" y="60.1255"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="SD1"/>
				<Subwire width="0.15">
					<Start x="128.1827" y="48.0615"/>
					<TrackLine>
						<End x="127.4942" y="48.5968"/>
					</TrackLine>
					<TrackLine>
						<End x="126.881" y="48.948"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7829" y="49.0461"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="126.7063" y="49.1285"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="126.4034" y="49.154"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="126.2502" y="49.3188"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="126.2559" y="49.4778"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="126.3904" y="49.6029"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="126.3961" y="49.7619"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="126.2429" y="49.9266"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="126.0839" y="49.9324"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.9494" y="49.8073"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.7904" y="49.813"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.6372" y="49.9777"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.6429" y="50.1367"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.7774" y="50.2619"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.7831" y="50.4209"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.6299" y="50.5856"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.4709" y="50.5913"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.3364" y="50.4662"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.1774" y="50.472"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.0242" y="50.6367"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.0299" y="50.7957"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.1644" y="50.9208"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.1701" y="51.0798"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="125.0169" y="51.2446"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="124.7144" y="51.2697"/>
					</TrackLine>
					<TrackLine serpRef="serp_28">
						<End x="124.6367" y="51.3533"/>
					</TrackLine>
					<TrackLine>
						<End x="124.5544" y="51.4356"/>
					</TrackLine>
					<TrackLine>
						<End x="123.7712" y="52.7026"/>
					</TrackLine>
					<TrackLine>
						<End x="123.4125" y="53.376"/>
					</TrackLine>
					<TrackLine>
						<End x="122.7417" y="54.1357"/>
					</TrackLine>
					<TrackLine>
						<End x="122.7417" y="54.2485"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.7375" y="54.3609"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.5307" y="54.5783"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.5222" y="54.8031"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.6304" y="54.9198"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.8023" y="54.9262"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.9105" y="55.0429"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.902" y="55.2677"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.7854" y="55.3759"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.6135" y="55.3695"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.4969" y="55.4777"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.4884" y="55.7025"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.5966" y="55.8191"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.7685" y="55.8256"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.8767" y="55.9422"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.8682" y="56.1671"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.7516" y="56.2753"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.5797" y="56.2688"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.4631" y="56.377"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.4546" y="56.6019"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.5628" y="56.7185"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.7347" y="56.725"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.8429" y="56.8416"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.8344" y="57.0664"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.7178" y="57.1746"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.5459" y="57.1682"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.4293" y="57.2764"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.4208" y="57.5012"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.529" y="57.6179"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.7009" y="57.6243"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.8091" y="57.741"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.8006" y="57.9658"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.5938" y="58.184"/>
					</TrackLine>
					<TrackLine serpRef="serp_29">
						<End x="122.5896" y="58.2967"/>
					</TrackLine>
					<TrackLine>
						<End x="122.5896" y="58.4321"/>
					</TrackLine>
					<TrackLine>
						<End x="123.0961" y="58.9982"/>
					</TrackLine>
					<TrackLine>
						<End x="123.145" y="59.3832"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="SD3"/>
				<Subwire width="0.15">
					<Start x="129.7299" y="48.0999"/>
					<TrackLine>
						<End x="129.68" y="48.61"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.6681" y="48.7219"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.4642" y="48.9264"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.4403" y="49.1501"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.5402" y="49.2739"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.6764" y="49.2884"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.7764" y="49.4123"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.7525" y="49.636"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.6287" y="49.7359"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.4924" y="49.7214"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.3686" y="49.8213"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.3447" y="50.045"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.4446" y="50.1688"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.5809" y="50.1833"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.6808" y="50.3072"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.6569" y="50.5309"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.5331" y="50.6308"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.3969" y="50.6163"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.273" y="50.7162"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.2492" y="50.9399"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.4052" y="51.1828"/>
					</TrackLine>
					<TrackLine serpRef="serp_30">
						<End x="129.3932" y="51.2956"/>
					</TrackLine>
					<TrackLine>
						<End x="129.3932" y="51.3695"/>
					</TrackLine>
					<TrackLine>
						<End x="129.3147" y="51.8887"/>
					</TrackLine>
					<TrackLine>
						<End x="129.3148" y="52.1865"/>
					</TrackLine>
					<TrackLine>
						<End x="129.2664" y="52.6853"/>
					</TrackLine>
					<TrackLine>
						<End x="129.2606" y="53.0601"/>
					</TrackLine>
					<TrackLine>
						<End x="128.9517" y="53.3691"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8706" y="54.9615"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8706" y="54.9698"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.831" y="55.0751"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.5892" y="55.2246"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.5101" y="55.4353"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.5758" y="55.5801"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.6905" y="55.6232"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.7563" y="55.7681"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.6771" y="55.9787"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.5323" y="56.0445"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.4176" y="56.0014"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.2727" y="56.0671"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.1936" y="56.2778"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.2593" y="56.4226"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.374" y="56.4657"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.4397" y="56.6106"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.3606" y="56.8212"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.2157" y="56.887"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.101" y="56.8439"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="127.9561" y="56.9096"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="127.877" y="57.1203"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="127.9427" y="57.2651"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.0574" y="57.3082"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.1232" y="57.4531"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="128.044" y="57.6637"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="127.8992" y="57.7295"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="127.7845" y="57.6864"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="127.6396" y="57.7521"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="127.5605" y="57.9628"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="127.6439" y="58.2348"/>
					</TrackLine>
					<TrackLine serpRef="serp_31">
						<End x="127.6042" y="58.3402"/>
					</TrackLine>
					<TrackLine>
						<End x="127.6042" y="58.3485"/>
					</TrackLine>
					<TrackLine>
						<End x="126.5764" y="59.5342"/>
					</TrackLine>
					<TrackLine>
						<End x="126.3984" y="59.7122"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2554" y="59.7378"/>
					</TrackLine>
					<TrackLine>
						<End x="126.0338" y="59.9594"/>
					</TrackLine>
					<TrackLine>
						<End x="126.0338" y="60.3666"/>
					</TrackLine>
					<TrackLine>
						<End x="126.0088" y="61.0531"/>
					</TrackLine>
					<TrackLine>
						<End x="125.5241" y="61.599"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="SD5"/>
				<Subwire width="0.15">
					<Start x="129.6729" y="53.6678"/>
					<TrackLine>
						<End x="130.5241" y="54.7151"/>
					</TrackLine>
					<TrackLine>
						<End x="130.5241" y="54.965"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.4844" y="55.0703"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.3394" y="55.1358"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.1002" y="55.0456"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.9553" y="55.1112"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.8758" y="55.3217"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.9414" y="55.4666"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.6303" y="55.7264"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.6958" y="55.8714"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.6164" y="56.0819"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.4715" y="56.1475"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.7825" y="55.8877"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.6376" y="55.9532"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.5582" y="56.1637"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.6237" y="56.3087"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.3126" y="56.5685"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.3782" y="56.7135"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.2987" y="56.924"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.1538" y="56.9895"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.4649" y="56.7297"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.3199" y="56.7953"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.2405" y="57.0058"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.306" y="57.1508"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.9949" y="57.4106"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="130.0605" y="57.5555"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.9811" y="57.7661"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.8361" y="57.8316"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.1472" y="57.5718"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.0022" y="57.6373"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="128.9228" y="57.8479"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="128.9883" y="57.9928"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.6773" y="58.2526"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.7428" y="58.3976"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.6634" y="58.6081"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="129.5184" y="58.6737"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="128.8295" y="58.4139"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="128.6845" y="58.4794"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="128.6051" y="58.6899"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="128.6707" y="58.8349"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="128.9099" y="58.9251"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="128.9753" y="59.0704"/>
					</TrackLine>
					<TrackLine serpRef="serp_32">
						<End x="128.8745" y="59.3376"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8745" y="59.5875"/>
					</TrackLine>
					<TrackLine>
						<End x="129.0892" y="59.8728"/>
					</TrackLine>
					<TrackLine>
						<End x="129.0892" y="60.2352"/>
					</TrackLine>
					<TrackLine>
						<End x="128.3734" y="61.0028"/>
					</TrackLine>
					<TrackLine>
						<End x="128.1216" y="61.2546"/>
					</TrackLine>
					<TrackLine>
						<End x="127.6411" y="61.2545"/>
					</TrackLine>
					<TrackLine>
						<End x="127.1128" y="61.7078"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="SD7"/>
				<Subwire width="0.15">
					<Start x="128.0792" y="53.6615"/>
					<TrackLine>
						<End x="128.1436" y="53.8146"/>
					</TrackLine>
					<TrackLine>
						<End x="128.1426" y="54.0745"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="128.0991" y="54.1783"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.9519" y="54.2385"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.6872" y="54.1276"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.54" y="54.1878"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.453" y="54.3953"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.5132" y="54.5426"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="128.2344" y="54.8449"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="128.2946" y="54.9922"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="128.2076" y="55.1997"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="128.0604" y="55.2599"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.3393" y="54.9576"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.192" y="55.0178"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.105" y="55.2253"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.1653" y="55.3726"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.8864" y="55.6749"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.9467" y="55.8222"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.8597" y="56.0297"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.7124" y="56.0899"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.9913" y="55.7876"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.844" y="55.8479"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.7571" y="56.0554"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.8173" y="56.2026"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.5384" y="56.505"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.5987" y="56.6522"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.5117" y="56.8597"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.3645" y="56.92"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.6433" y="56.6176"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.4961" y="56.6779"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.4091" y="56.8854"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.4693" y="57.0326"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.1905" y="57.335"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.2507" y="57.4822"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.1637" y="57.6897"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="127.0165" y="57.75"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.2954" y="57.4476"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.1481" y="57.5079"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.0611" y="57.7154"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.1214" y="57.8626"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.8425" y="58.165"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.9028" y="58.3122"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.8158" y="58.5197"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.6685" y="58.58"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="125.9474" y="58.2777"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="125.8001" y="58.3379"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="125.7132" y="58.5454"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="125.7734" y="58.6927"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.038" y="58.8036"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="126.0984" y="58.9507"/>
					</TrackLine>
					<TrackLine serpRef="serp_33">
						<End x="125.9612" y="59.2778"/>
					</TrackLine>
					<TrackLine>
						<End x="125.7555" y="59.8441"/>
					</TrackLine>
					<TrackLine>
						<End x="125.7555" y="60.2513"/>
					</TrackLine>
					<TrackLine>
						<End x="125.5713" y="60.8719"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="SDCKE0"/>
				<Subwire width="0.15">
					<Start x="131.2684" y="48.0815"/>
					<TrackLine>
						<End x="130.5325" y="48.829"/>
					</TrackLine>
					<TrackLine>
						<End x="130.1218" y="49.5354"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0447" y="50.272"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0419" y="50.3037"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0404" y="50.488"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0315" y="50.4969"/>
					</TrackLine>
					<TrackLine>
						<End x="130.024" y="50.5257"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0226" y="50.7405"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0109" y="50.8244"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0109" y="51.0992"/>
					</TrackLine>
					<TrackLine>
						<End x="130.1132" y="51.8858"/>
					</TrackLine>
					<TrackLine>
						<End x="130.1132" y="52.2194"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0847" y="52.6907"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0848" y="53.0243"/>
					</TrackLine>
					<TrackLine>
						<End x="129.8494" y="53.2597"/>
					</TrackLine>
					<TrackLine>
						<End x="129.5051" y="53.2628"/>
					</TrackLine>
					<TrackLine>
						<End x="129.2679" y="53.5"/>
					</TrackLine>
					<TrackLine>
						<End x="129.2679" y="53.8356"/>
					</TrackLine>
					<TrackLine>
						<End x="129.4249" y="54.9115"/>
					</TrackLine>
					<TrackLine>
						<End x="129.4249" y="55.1911"/>
					</TrackLine>
					<TrackLine>
						<End x="129.317" y="55.4695"/>
					</TrackLine>
					<TrackLine>
						<End x="129.3061" y="55.507"/>
					</TrackLine>
					<TrackLine>
						<End x="128.881" y="56.6237"/>
					</TrackLine>
					<TrackLine>
						<End x="128.874" y="56.6424"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8736" y="56.6581"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8006" y="56.8375"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8006" y="56.8515"/>
					</TrackLine>
					<TrackLine>
						<End x="128.7938" y="56.8704"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2864" y="58.2061"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2864" y="58.2143"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2773" y="58.2453"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2478" y="58.302"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2386" y="58.333"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2386" y="58.3417"/>
					</TrackLine>
					<TrackLine>
						<End x="128.1683" y="58.5125"/>
					</TrackLine>
					<TrackLine>
						<End x="128.1585" y="58.5615"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9608" y="58.7592"/>
					</TrackLine>
					<TrackLine>
						<End x="127.0204" y="59.6683"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7957" y="59.893"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7957" y="60.275"/>
					</TrackLine>
					<TrackLine>
						<End x="126.3463" y="61.1929"/>
					</TrackLine>
					<TrackLine>
						<End x="125.9616" y="61.7802"/>
					</TrackLine>
					<TrackLine>
						<End x="125.7053" y="62.0365"/>
					</TrackLine>
					<TrackLine>
						<End x="125.3429" y="62.0365"/>
					</TrackLine>
					<TrackLine>
						<End x="124.7118" y="61.6884"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 2"/>
				<NetRef name="SDWE_B"/>
				<Subwire width="0.15">
					<Start x="126.3069" y="64.11"/>
					<TrackLine>
						<End x="126.7092" y="63.3727"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7092" y="63.2013"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9579" y="62.9526"/>
					</TrackLine>
					<TrackLine>
						<End x="127.2424" y="62.9516"/>
					</TrackLine>
					<TrackLine>
						<End x="127.4917" y="62.7023"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2566" y="61.8655"/>
					</TrackLine>
					<TrackLine>
						<End x="129.4267" y="60.375"/>
					</TrackLine>
					<TrackLine>
						<End x="131.0456" y="56.0159"/>
					</TrackLine>
					<TrackLine>
						<End x="131.1774" y="55.2239"/>
					</TrackLine>
					<TrackLine>
						<End x="131.1774" y="54.9443"/>
					</TrackLine>
					<TrackLine>
						<End x="130.9582" y="53.4509"/>
					</TrackLine>
					<TrackLine>
						<End x="130.8735" y="53.0405"/>
					</TrackLine>
					<TrackLine>
						<End x="130.8735" y="52.7199"/>
					</TrackLine>
					<TrackLine>
						<End x="130.9028" y="52.1925"/>
					</TrackLine>
					<TrackLine>
						<End x="130.9028" y="51.8719"/>
					</TrackLine>
					<TrackLine>
						<End x="130.6794" y="51.1445"/>
					</TrackLine>
					<TrackLine>
						<End x="130.6794" y="50.9834"/>
					</TrackLine>
					<TrackLine serpRef="serp_34">
						<End x="130.6866" y="50.8711"/>
					</TrackLine>
					<TrackLine serpRef="serp_34">
						<End x="130.8061" y="50.7661"/>
					</TrackLine>
					<TrackLine serpRef="serp_34">
						<End x="130.8997" y="50.7721"/>
					</TrackLine>
					<TrackLine serpRef="serp_34">
						<End x="131.0192" y="50.6671"/>
					</TrackLine>
					<TrackLine serpRef="serp_34">
						<End x="131.0336" y="50.4426"/>
					</TrackLine>
					<TrackLine serpRef="serp_34">
						<End x="130.9286" y="50.3231"/>
					</TrackLine>
					<TrackLine serpRef="serp_34">
						<End x="130.8349" y="50.317"/>
					</TrackLine>
					<TrackLine serpRef="serp_34">
						<End x="130.7299" y="50.1978"/>
					</TrackLine>
					<TrackLine serpRef="serp_34">
						<End x="130.763" y="49.6831"/>
					</TrackLine>
					<TrackLine>
						<End x="130.763" y="49.5652"/>
					</TrackLine>
					<TrackLine>
						<End x="130.97" y="49.0102"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 3"/>
				<NetRef name="A0"/>
				<Subwire width="0.15">
					<Start x="132.9106" y="52.8591"/>
					<TrackLine>
						<End x="133.4362" y="53.2179"/>
					</TrackLine>
					<TrackLine>
						<End x="133.621" y="53.4027"/>
					</TrackLine>
					<TrackLine>
						<End x="133.621" y="53.4137"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="133.6609" y="53.5189"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="133.806" y="53.5842"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.1281" y="53.462"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.2732" y="53.5272"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.353" y="53.7376"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.2877" y="53.8827"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="133.5447" y="54.1647"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="133.4794" y="54.3098"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="133.5592" y="54.5201"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="133.7043" y="54.5854"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.4474" y="54.3034"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.5925" y="54.3687"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.6723" y="54.5791"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.607" y="54.7241"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="133.864" y="55.0061"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="133.7987" y="55.1512"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="133.8785" y="55.3616"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.0236" y="55.4269"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.7667" y="55.1449"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.9118" y="55.2101"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.9916" y="55.4205"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.9263" y="55.5656"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.1833" y="55.8476"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.118" y="55.9927"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.1978" y="56.203"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.3429" y="56.2683"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.086" y="55.9863"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.2311" y="56.0516"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.3109" y="56.262"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.2456" y="56.407"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.5026" y="56.689"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.4373" y="56.8341"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.5171" y="57.0445"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.6622" y="57.1098"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.4053" y="56.8278"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.5504" y="56.893"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.6302" y="57.1034"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.5649" y="57.2485"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.8219" y="57.5305"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.7566" y="57.6756"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.8364" y="57.8859"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="134.9815" y="57.9512"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.7246" y="57.6692"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.8697" y="57.7345"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.9495" y="57.9449"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.8842" y="58.0899"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.5622" y="58.2121"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.4971" y="58.3577"/>
					</TrackLine>
					<TrackLine serpRef="serp_35">
						<End x="135.5661" y="58.5396"/>
					</TrackLine>
					<TrackLine>
						<End x="135.6374" y="58.9399"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 3"/>
				<NetRef name="DQM1"/>
				<Subwire width="0.15">
					<Start x="124.7414" y="48.9952"/>
					<TrackLine>
						<End x="124.5479" y="49.3069"/>
					</TrackLine>
					<TrackLine>
						<End x="124.5479" y="49.3321"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.5176" y="49.4404"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.2972" y="49.6124"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.2366" y="49.8291"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.3146" y="49.9678"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.4173" y="49.9965"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.4953" y="50.1352"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.4347" y="50.3518"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.296" y="50.4298"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.1933" y="50.4011"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.0547" y="50.4791"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.994" y="50.6958"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.072" y="50.8345"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.1747" y="50.8632"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.2528" y="51.0019"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.1921" y="51.2185"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.0535" y="51.2965"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.9508" y="51.2678"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.8121" y="51.3458"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.7515" y="51.5625"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.8295" y="51.7012"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.9322" y="51.7299"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="124.0102" y="51.8686"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.9495" y="52.0852"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.8109" y="52.1632"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.7082" y="52.1345"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.5695" y="52.2125"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.5089" y="52.4292"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.608" y="52.6902"/>
					</TrackLine>
					<TrackLine serpRef="serp_36">
						<End x="123.5775" y="52.7993"/>
					</TrackLine>
					<TrackLine>
						<End x="123.5775" y="52.8245"/>
					</TrackLine>
					<TrackLine>
						<End x="123.4125" y="53.376"/>
					</TrackLine>
					<TrackLine>
						<End x="122.8044" y="54.4421"/>
					</TrackLine>
					<TrackLine>
						<End x="122.8044" y="54.5983"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.8163" y="54.7102"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.7163" y="54.8339"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.6889" y="54.8368"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.589" y="54.9606"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.6128" y="55.1843"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.7365" y="55.2843"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.015" y="55.2547"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.1388" y="55.3547"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.1626" y="55.5784"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.0626" y="55.7022"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.7841" y="55.7318"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.6841" y="55.8556"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.7079" y="56.0793"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.8317" y="56.1793"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.1102" y="56.1497"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.234" y="56.2496"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.2578" y="56.4734"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.1578" y="56.5971"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.8793" y="56.6268"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.7793" y="56.7505"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.8031" y="56.9743"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.9269" y="57.0742"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.2054" y="57.0446"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.3292" y="57.1446"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.353" y="57.3683"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.253" y="57.4921"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.9745" y="57.5217"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.8745" y="57.6455"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="122.8983" y="57.8692"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.0221" y="57.9692"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.3006" y="57.9396"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.4243" y="58.0396"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.4481" y="58.2633"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.3482" y="58.3871"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.3208" y="58.39"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.2208" y="58.5137"/>
					</TrackLine>
					<TrackLine serpRef="serp_37">
						<End x="123.2328" y="58.6267"/>
					</TrackLine>
					<TrackLine>
						<End x="123.2328" y="58.7191"/>
					</TrackLine>
					<TrackLine>
						<End x="123.5825" y="59.202"/>
					</TrackLine>
					<TrackLine>
						<End x="123.5988" y="59.4747"/>
					</TrackLine>
					<TrackLine>
						<End x="123.8533" y="59.7292"/>
					</TrackLine>
					<TrackLine>
						<End x="124.105" y="59.7292"/>
					</TrackLine>
					<TrackLine>
						<End x="124.3595" y="59.9837"/>
					</TrackLine>
					<TrackLine>
						<End x="124.3651" y="60.3067"/>
					</TrackLine>
					<TrackLine>
						<End x="124.753" y="60.975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 3"/>
				<NetRef name="DQS0"/>
				<Subwire width="0.15">
					<Start x="128.1283" y="52.0686"/>
					<TrackLine>
						<End x="128.7394" y="52.4563"/>
					</TrackLine>
					<TrackLine>
						<End x="129.0225" y="52.4735"/>
					</TrackLine>
					<TrackLine>
						<End x="129.2665" y="52.7175"/>
					</TrackLine>
					<TrackLine>
						<End x="129.2779" y="53.0256"/>
					</TrackLine>
					<TrackLine>
						<End x="129.5151" y="53.2628"/>
					</TrackLine>
					<TrackLine>
						<End x="129.8407" y="53.2628"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0779" y="53.5"/>
					</TrackLine>
					<TrackLine>
						<End x="130.0779" y="53.8356"/>
					</TrackLine>
					<TrackLine>
						<End x="129.9136" y="54.2041"/>
					</TrackLine>
					<TrackLine>
						<End x="129.9136" y="54.2737"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.897" y="54.385"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.7691" y="54.4796"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.7408" y="54.4754"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.6129" y="54.5701"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.5797" y="54.7926"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.6744" y="54.9205"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.9536" y="54.9622"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="130.0483" y="55.09"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="130.0151" y="55.3126"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.8872" y="55.4072"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.608" y="55.3655"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.4801" y="55.4602"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.4469" y="55.6827"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.5416" y="55.8106"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.8208" y="55.8523"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.9155" y="55.9802"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.8823" y="56.2027"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.7544" y="56.2974"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.4752" y="56.2557"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.3473" y="56.3504"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.3141" y="56.5729"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.4088" y="56.7008"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.688" y="56.7425"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.7827" y="56.8703"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.7495" y="57.0929"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.6216" y="57.1875"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.3424" y="57.1458"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.2145" y="57.2405"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.1813" y="57.463"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.276" y="57.5909"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.5552" y="57.6326"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.6499" y="57.7605"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.6167" y="57.983"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.4888" y="58.0777"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.2096" y="58.036"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.0817" y="58.1307"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.0485" y="58.3532"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.1432" y="58.4811"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.4224" y="58.5228"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.5171" y="58.6506"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.4839" y="58.8732"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.356" y="58.9678"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.0768" y="58.9261"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="128.9489" y="59.0208"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="128.9157" y="59.2433"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.0104" y="59.3712"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.0387" y="59.3755"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.133" y="59.5059"/>
					</TrackLine>
					<TrackLine serpRef="serp_38">
						<End x="129.1168" y="59.6149"/>
					</TrackLine>
					<TrackLine>
						<End x="129.1168" y="59.6845"/>
					</TrackLine>
					<TrackLine>
						<End x="129.0892" y="60.2352"/>
					</TrackLine>
					<TrackLine>
						<End x="129.013" y="60.6562"/>
					</TrackLine>
					<TrackLine>
						<End x="128.94" y="60.7292"/>
					</TrackLine>
					<TrackLine serpRef="serp_39">
						<End x="128.868" y="60.8156"/>
					</TrackLine>
					<TrackLine serpRef="serp_39">
						<End x="128.7095" y="60.83"/>
					</TrackLine>
					<TrackLine serpRef="serp_39">
						<End x="128.6449" y="60.7762"/>
					</TrackLine>
					<TrackLine serpRef="serp_39">
						<End x="128.4864" y="60.7906"/>
					</TrackLine>
					<TrackLine serpRef="serp_39">
						<End x="128.3424" y="60.9634"/>
					</TrackLine>
					<TrackLine serpRef="serp_39">
						<End x="128.3568" y="61.1219"/>
					</TrackLine>
					<TrackLine serpRef="serp_39">
						<End x="128.4214" y="61.1757"/>
					</TrackLine>
					<TrackLine serpRef="serp_39">
						<End x="128.436" y="61.334"/>
					</TrackLine>
					<TrackLine serpRef="serp_39">
						<End x="128.3634" y="61.421"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2904" y="61.494"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2566" y="61.8655"/>
					</TrackLine>
					<TrackLine>
						<End x="128.0003" y="62.1218"/>
					</TrackLine>
					<TrackLine>
						<End x="127.0662" y="62.5261"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 3"/>
				<NetRef name="MA10"/>
				<Subwire width="0.15">
					<Start x="132.9254" y="47.3744"/>
					<TrackLine>
						<End x="133.304" y="47.9177"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3558" y="48.6466"/>
					</TrackLine>
					<TrackLine>
						<End x="133.36" y="49.3112"/>
					</TrackLine>
					<TrackLine>
						<End x="133.36" y="49.42"/>
					</TrackLine>
					<TrackLine serpRef="serp_40">
						<End x="133.3596" y="49.5325"/>
					</TrackLine>
					<TrackLine serpRef="serp_40">
						<End x="133.2082" y="49.7569"/>
					</TrackLine>
					<TrackLine serpRef="serp_40">
						<End x="133.2073" y="49.9819"/>
					</TrackLine>
					<TrackLine serpRef="serp_40">
						<End x="133.3194" y="50.0948"/>
					</TrackLine>
					<TrackLine serpRef="serp_40">
						<End x="133.3952" y="50.0952"/>
					</TrackLine>
					<TrackLine serpRef="serp_40">
						<End x="133.5073" y="50.2081"/>
					</TrackLine>
					<TrackLine serpRef="serp_40">
						<End x="133.5064" y="50.4331"/>
					</TrackLine>
					<TrackLine serpRef="serp_40">
						<End x="133.3551" y="50.6575"/>
					</TrackLine>
					<TrackLine serpRef="serp_40">
						<End x="133.3546" y="50.7706"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3546" y="50.8794"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3591" y="51.1898"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3591" y="51.5522"/>
					</TrackLine>
					<TrackLine>
						<End x="133.2689" y="52.2315"/>
					</TrackLine>
					<TrackLine>
						<End x="133.037" y="52.4634"/>
					</TrackLine>
					<TrackLine>
						<End x="132.7486" y="52.4681"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5196" y="52.6971"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5196" y="53.0211"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5926" y="53.6684"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5926" y="53.686"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="132.6274" y="53.793"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="132.5793" y="54.0453"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="132.649" y="54.2592"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="132.7908" y="54.3314"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="132.8126" y="54.3242"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="132.9544" y="54.3964"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.0241" y="54.6103"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="132.952" y="54.7521"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="132.9302" y="54.7592"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="132.8581" y="54.901"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="132.9278" y="55.115"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.0696" y="55.1871"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.0914" y="55.18"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.2332" y="55.2521"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.3029" y="55.466"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.2308" y="55.6078"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.209" y="55.6149"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.1368" y="55.7568"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.2065" y="55.9707"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.3484" y="56.0428"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.3702" y="56.0357"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.512" y="56.1078"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.5817" y="56.3217"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.5096" y="56.4636"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.4877" y="56.4707"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.4156" y="56.6125"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.4853" y="56.8264"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.6271" y="56.8985"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.649" y="56.8914"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.7908" y="56.9635"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.8605" y="57.1775"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.7883" y="57.3193"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.7665" y="57.3264"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.6944" y="57.4682"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.7641" y="57.6821"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.9059" y="57.7543"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.9277" y="57.7472"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.0696" y="57.8193"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.1393" y="58.0332"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.0671" y="58.175"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.0453" y="58.1821"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="133.9732" y="58.3239"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.0429" y="58.5379"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.1847" y="58.61"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.2065" y="58.6029"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.3483" y="58.675"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.418" y="58.8889"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.3459" y="59.0307"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.3241" y="59.0379"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.252" y="59.1797"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.3217" y="59.3936"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.5093" y="59.5691"/>
					</TrackLine>
					<TrackLine serpRef="serp_41">
						<End x="134.5442" y="59.6766"/>
					</TrackLine>
					<TrackLine>
						<End x="134.5442" y="59.6942"/>
					</TrackLine>
					<TrackLine>
						<End x="134.725" y="60.0507"/>
					</TrackLine>
					<TrackLine>
						<End x="134.725" y="60.4017"/>
					</TrackLine>
					<TrackLine>
						<End x="134.6446" y="60.7955"/>
					</TrackLine>
					<TrackLine>
						<End x="134.6446" y="61.1535"/>
					</TrackLine>
					<TrackLine>
						<End x="134.8978" y="61.4067"/>
					</TrackLine>
					<TrackLine>
						<End x="135.1448" y="61.6955"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 3"/>
				<NetRef name="RAS_B"/>
				<Subwire width="0.15">
					<Start x="131.2897" y="52.0616"/>
					<TrackLine>
						<End x="131.6946" y="52.7004"/>
					</TrackLine>
					<TrackLine>
						<End x="131.6946" y="53.06"/>
					</TrackLine>
					<TrackLine>
						<End x="131.5378" y="53.3519"/>
					</TrackLine>
					<TrackLine>
						<End x="131.5378" y="53.4101"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.5161" y="53.5205"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.2735" y="53.702"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.23" y="53.9228"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.3187" y="54.0549"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.496" y="54.0898"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.5846" y="54.222"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.5411" y="54.4427"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.409" y="54.5314"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.2317" y="54.4964"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.0995" y="54.585"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.0561" y="54.8058"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.1447" y="54.9379"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.322" y="54.9729"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.4106" y="55.105"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.3672" y="55.3258"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.235" y="55.4144"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.0577" y="55.3794"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.9256" y="55.4681"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.8821" y="55.6888"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.9707" y="55.821"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.148" y="55.8559"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.2367" y="55.988"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.1932" y="56.2088"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.0611" y="56.2974"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.8837" y="56.2625"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.7516" y="56.3511"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.7081" y="56.5719"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.7967" y="56.704"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.9741" y="56.7389"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.0627" y="56.8711"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="131.0192" y="57.0918"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.8871" y="57.1804"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.7098" y="57.1455"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.5776" y="57.2341"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.5341" y="57.4549"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.6228" y="57.587"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.8001" y="57.622"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.8887" y="57.7541"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.8452" y="57.9748"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.7131" y="58.0635"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.5358" y="58.0285"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.4037" y="58.1172"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.3602" y="58.3379"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.4488" y="58.47"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.6261" y="58.505"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.7148" y="58.6371"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.6713" y="58.8579"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.5391" y="58.9465"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.3618" y="58.9116"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.2297" y="59.0002"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.1862" y="59.2209"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.3417" y="59.4809"/>
					</TrackLine>
					<TrackLine serpRef="serp_42">
						<End x="130.3198" y="59.5925"/>
					</TrackLine>
					<TrackLine>
						<End x="130.3198" y="59.6507"/>
					</TrackLine>
					<TrackLine>
						<End x="130.2407" y="60.3533"/>
					</TrackLine>
					<TrackLine>
						<End x="130.2139" y="60.3802"/>
					</TrackLine>
					<TrackLine serpRef="serp_43">
						<End x="130.145" y="60.4691"/>
					</TrackLine>
					<TrackLine serpRef="serp_43">
						<End x="129.9319" y="60.5887"/>
					</TrackLine>
					<TrackLine serpRef="serp_43">
						<End x="129.7941" y="60.7666"/>
					</TrackLine>
					<TrackLine serpRef="serp_43">
						<End x="129.8069" y="61.0611"/>
					</TrackLine>
					<TrackLine serpRef="serp_43">
						<End x="129.6692" y="61.239"/>
					</TrackLine>
					<TrackLine serpRef="serp_43">
						<End x="129.3808" y="61.3002"/>
					</TrackLine>
					<TrackLine serpRef="serp_43">
						<End x="129.243" y="61.4781"/>
					</TrackLine>
					<TrackLine serpRef="serp_43">
						<End x="129.1805" y="61.7143"/>
					</TrackLine>
					<TrackLine serpRef="serp_43">
						<End x="129.1111" y="61.8038"/>
					</TrackLine>
					<TrackLine>
						<End x="129.0605" y="61.8543"/>
					</TrackLine>
					<TrackLine>
						<End x="128.6019" y="62.0676"/>
					</TrackLine>
					<TrackLine>
						<End x="128.1401" y="62.4593"/>
					</TrackLine>
					<TrackLine>
						<End x="127.2424" y="62.9516"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9575" y="62.9516"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2847" y="63.1969"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 3"/>
				<NetRef name="SD4"/>
				<Subwire width="0.15">
					<Start x="129.0675" y="46.4142"/>
					<TrackLine>
						<End x="128.7093" y="46.4291"/>
					</TrackLine>
					<TrackLine>
						<End x="128.602" y="46.5363"/>
					</TrackLine>
					<TrackLine serpRef="serp_44">
						<End x="128.5271" y="46.6203"/>
					</TrackLine>
					<TrackLine serpRef="serp_44">
						<End x="128.3683" y="46.6293"/>
					</TrackLine>
					<TrackLine serpRef="serp_44">
						<End x="128.3492" y="46.6122"/>
					</TrackLine>
					<TrackLine serpRef="serp_44">
						<End x="128.1903" y="46.6213"/>
					</TrackLine>
					<TrackLine serpRef="serp_44">
						<End x="128.0405" y="46.7892"/>
					</TrackLine>
					<TrackLine serpRef="serp_44">
						<End x="128.0496" y="46.948"/>
					</TrackLine>
					<TrackLine serpRef="serp_44">
						<End x="128.0687" y="46.9651"/>
					</TrackLine>
					<TrackLine serpRef="serp_44">
						<End x="128.0776" y="47.1241"/>
					</TrackLine>
					<TrackLine serpRef="serp_44">
						<End x="128.0026" y="47.2081"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9213" y="47.2895"/>
					</TrackLine>
					<TrackLine>
						<End x="127.7478" y="47.8814"/>
					</TrackLine>
					<TrackLine>
						<End x="127.7479" y="48.3394"/>
					</TrackLine>
					<TrackLine>
						<End x="127.4931" y="48.5942"/>
					</TrackLine>
					<TrackLine>
						<End x="127.1265" y="48.8171"/>
					</TrackLine>
					<TrackLine>
						<End x="127.0584" y="48.8852"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.9818" y="48.9676"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.7126" y="49.0244"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.5593" y="49.1892"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.5651" y="49.3482"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.6322" y="49.4107"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.638" y="49.5697"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.4847" y="49.7344"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.3257" y="49.7402"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.2586" y="49.6777"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.0996" y="49.6834"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.9463" y="49.8482"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.9521" y="50.0071"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.0192" y="50.0697"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="126.025" y="50.2286"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.8717" y="50.3934"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.7127" y="50.3991"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.6456" y="50.3366"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.4866" y="50.3424"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.3333" y="50.5071"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.3391" y="50.6661"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.4062" y="50.7286"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.412" y="50.8876"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="125.2587" y="51.0524"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="124.99" y="51.1087"/>
					</TrackLine>
					<TrackLine serpRef="serp_45">
						<End x="124.9122" y="51.1924"/>
					</TrackLine>
					<TrackLine>
						<End x="124.8551" y="51.2495"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4586" y="51.8864"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4586" y="52.2488"/>
					</TrackLine>
					<TrackLine>
						<End x="124.5903" y="52.7257"/>
					</TrackLine>
					<TrackLine>
						<End x="124.5903" y="53.0419"/>
					</TrackLine>
					<TrackLine>
						<End x="124.3668" y="53.2654"/>
					</TrackLine>
					<TrackLine>
						<End x="123.8193" y="53.7685"/>
					</TrackLine>
					<TrackLine>
						<End x="123.563" y="54.0248"/>
					</TrackLine>
					<TrackLine>
						<End x="123.563" y="54.3872"/>
					</TrackLine>
					<TrackLine>
						<End x="123.6023" y="54.7786"/>
					</TrackLine>
					<TrackLine>
						<End x="123.6023" y="54.8142"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.6174" y="54.9257"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.5513" y="55.1617"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.5816" y="55.3847"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.8048" y="55.5814"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.8351" y="55.8044"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.6725" y="56.0535"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.7028" y="56.2765"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.9259" y="56.4732"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.9562" y="56.6962"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.7937" y="56.9453"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.824" y="57.1683"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="124.0471" y="57.365"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="124.0774" y="57.588"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.9148" y="57.8371"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="123.9451" y="58.0601"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="124.1683" y="58.2568"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="124.1986" y="58.4798"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="124.1326" y="58.7167"/>
					</TrackLine>
					<TrackLine serpRef="serp_46">
						<End x="124.1477" y="58.8282"/>
					</TrackLine>
					<TrackLine>
						<End x="124.1477" y="58.8986"/>
					</TrackLine>
					<TrackLine>
						<End x="124.0333" y="59.2947"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 3"/>
				<NetRef name="SD8"/>
				<Subwire width="0.15">
					<Start x="124.9718" y="52.849"/>
					<TrackLine>
						<End x="125.0456" y="54.3856"/>
					</TrackLine>
					<TrackLine>
						<End x="125.0456" y="54.498"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.0546" y="54.6101"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.9514" y="54.7312"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.6476" y="54.7555"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.5444" y="54.8766"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.5623" y="55.1009"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.6834" y="55.2041"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.5153" y="55.1376"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.6364" y="55.2408"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.6543" y="55.4651"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.5511" y="55.5862"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.7192" y="55.6526"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.616" y="55.7737"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.634" y="55.998"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.7551" y="56.1012"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.587" y="56.0348"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.7081" y="56.1379"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.726" y="56.3622"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.6228" y="56.4833"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.7909" y="56.5498"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.6877" y="56.6709"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.7056" y="56.8952"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.8267" y="56.9983"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.6586" y="56.9319"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.7797" y="57.0351"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.7977" y="57.2594"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.6945" y="57.3805"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.8626" y="57.4469"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.7594" y="57.568"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.7773" y="57.7923"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="124.8984" y="57.8955"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.7303" y="57.829"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.8514" y="57.9322"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.8693" y="58.1565"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.7661" y="58.2776"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.4623" y="58.3019"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.3591" y="58.423"/>
					</TrackLine>
					<TrackLine serpRef="serp_47">
						<End x="125.3966" y="58.8916"/>
					</TrackLine>
					<TrackLine>
						<End x="125.3966" y="59.004"/>
					</TrackLine>
					<TrackLine>
						<End x="125.8147" y="59.9134"/>
					</TrackLine>
					<TrackLine>
						<End x="125.9746" y="60.2973"/>
					</TrackLine>
					<TrackLine>
						<End x="126.2309" y="60.5536"/>
					</TrackLine>
					<TrackLine>
						<End x="127.0376" y="61.2845"/>
					</TrackLine>
					<TrackLine>
						<End x="127.1812" y="61.2845"/>
					</TrackLine>
					<TrackLine>
						<End x="127.8191" y="61.6843"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 3"/>
				<NetRef name="SD10"/>
				<Subwire width="0.15">
					<Start x="126.4787" y="52.0627"/>
					<TrackLine>
						<End x="126.9526" y="52.7818"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9723" y="53.0289"/>
					</TrackLine>
					<TrackLine>
						<End x="127.2177" y="53.2743"/>
					</TrackLine>
					<TrackLine>
						<End x="127.443" y="53.292"/>
					</TrackLine>
					<TrackLine>
						<End x="127.678" y="53.527"/>
					</TrackLine>
					<TrackLine>
						<End x="127.678" y="53.8277"/>
					</TrackLine>
					<TrackLine>
						<End x="127.913" y="54.0627"/>
					</TrackLine>
					<TrackLine>
						<End x="128.3281" y="54.0855"/>
					</TrackLine>
					<TrackLine>
						<End x="128.5179" y="54.2753"/>
					</TrackLine>
					<TrackLine>
						<End x="128.5303" y="54.4373"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.521" y="54.5494"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.3996" y="54.6523"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.1802" y="54.6341"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.0588" y="54.737"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.0403" y="54.9612"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.1432" y="55.0826"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.8062" y="55.1374"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.9091" y="55.2588"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.8905" y="55.4831"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.7692" y="55.5859"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.1061" y="55.5311"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.9847" y="55.6339"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.9662" y="55.8581"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.069" y="55.9795"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.7321" y="56.0344"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.8349" y="56.1558"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.8164" y="56.38"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.695" y="56.4829"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.0319" y="56.428"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.9106" y="56.5308"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.892" y="56.7551"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.9949" y="56.8765"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.6579" y="56.9313"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.7608" y="57.0527"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.7422" y="57.277"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.6209" y="57.3798"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.9578" y="57.3249"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.8364" y="57.4278"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.8179" y="57.652"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.9207" y="57.7734"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.5838" y="57.8283"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.6866" y="57.9497"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.6681" y="58.1739"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.5467" y="58.2767"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.8836" y="58.2219"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.7623" y="58.3247"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.7437" y="58.549"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="127.8466" y="58.6704"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.5096" y="58.7252"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.6125" y="58.8466"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.594" y="59.0708"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.4726" y="59.1737"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.2532" y="59.1555"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.1318" y="59.258"/>
					</TrackLine>
					<TrackLine serpRef="serp_48">
						<End x="128.1197" y="59.4044"/>
					</TrackLine>
					<TrackLine>
						<End x="128.0806" y="59.4997"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9064" y="59.6739"/>
					</TrackLine>
					<TrackLine>
						<End x="127.6361" y="59.6739"/>
					</TrackLine>
					<TrackLine>
						<End x="127.1793" y="60.0519"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 3"/>
				<NetRef name="SD13"/>
				<Subwire width="0.15">
					<Start x="126.5151" y="52.963"/>
					<TrackLine>
						<End x="126.4949" y="53.5388"/>
					</TrackLine>
					<TrackLine>
						<End x="126.4949" y="53.7008"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.5307" y="54.2357"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.6505" y="54.3405"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.8922" y="54.3243"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.012" y="54.429"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.027" y="54.6535"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.9223" y="54.7733"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.2102" y="54.8209"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.1054" y="54.9407"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.1205" y="55.1652"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.2402" y="55.2699"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.9613" y="55.2217"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.0811" y="55.3264"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.0961" y="55.5509"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.9914" y="55.6707"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.2613" y="55.7195"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.1565" y="55.8393"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.1716" y="56.0638"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.2913" y="56.1685"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.0304" y="56.1191"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.1502" y="56.2238"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.1652" y="56.4483"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.0605" y="56.5681"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.3124" y="56.6181"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.2077" y="56.7379"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.2227" y="56.9624"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.3425" y="57.0671"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.0995" y="57.0165"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.2193" y="57.1212"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.2343" y="57.3457"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.1295" y="57.4655"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.3635" y="57.5167"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.2588" y="57.6365"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.2738" y="57.861"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.3936" y="57.9657"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.1686" y="57.9139"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.2883" y="58.0186"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.3034" y="58.2431"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.1986" y="58.3628"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.4146" y="58.4153"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.3099" y="58.535"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.3249" y="58.7595"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.4447" y="58.8643"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.2377" y="58.8112"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.3574" y="58.916"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.3724" y="59.1405"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="127.2677" y="59.2602"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.981" y="59.2794"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.8763" y="59.3992"/>
					</TrackLine>
					<TrackLine serpRef="serp_49">
						<End x="126.8838" y="59.5114"/>
					</TrackLine>
					<TrackLine>
						<End x="126.8838" y="59.6734"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7957" y="59.893"/>
					</TrackLine>
					<TrackLine>
						<End x="126.7957" y="60.2108"/>
					</TrackLine>
					<TrackLine>
						<End x="127.206" y="60.8779"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="INT_PWR"/>
				<NetRef name="1V35"/>
				<Subwire fixed="on" width="0.15">
					<Start x="127.53" y="63.09"/>
					<TrackLine>
						<End x="127.555" y="63.5643"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="INT_PWR"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="126.7194" y="63.9872"/>
					<TrackLine>
						<End x="126.7175" y="64.2828"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="INT_PWR"/>
				<NetRef name="1V35"/>
				<Subwire width="0.15">
					<Start x="128.5786" y="62.8675"/>
					<TrackLine>
						<End x="128.6244" y="62.8882"/>
					</TrackLine>
					<TrackLine>
						<End x="128.7688" y="62.8883"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8108" y="62.8974"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="INT_PWR"/>
				<NetRef name="3V15"/>
				<Subwire width="0.15">
					<Start x="127.7265" y="70.7899"/>
					<TrackLine>
						<End x="128.0935" y="70.7899"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 4"/>
				<NetRef name="A2"/>
				<Subwire width="0.15">
					<Start x="132.8731" y="52.0676"/>
					<TrackLine>
						<End x="132.6083" y="52.1294"/>
					</TrackLine>
					<TrackLine>
						<End x="132.232" y="52.5057"/>
					</TrackLine>
					<TrackLine>
						<End x="131.9488" y="52.5591"/>
					</TrackLine>
					<TrackLine>
						<End x="131.6945" y="52.8134"/>
					</TrackLine>
					<TrackLine>
						<End x="131.6946" y="53.06"/>
					</TrackLine>
					<TrackLine>
						<End x="131.1879" y="53.9783"/>
					</TrackLine>
					<TrackLine>
						<End x="131.1879" y="54.1434"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.1965" y="54.2556"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.0929" y="54.3763"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.0803" y="54.3773"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="130.9767" y="54.498"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="130.9938" y="54.7224"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.1146" y="54.826"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.3641" y="54.8069"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.4849" y="54.9105"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.502" y="55.1348"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.3984" y="55.2556"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.1489" y="55.2747"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.0453" y="55.3954"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.0624" y="55.6198"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.1832" y="55.7234"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.4327" y="55.7043"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.5535" y="55.8079"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.5706" y="56.0322"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.467" y="56.1529"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.2175" y="56.172"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.1139" y="56.2928"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.131" y="56.5171"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.2518" y="56.6207"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.5013" y="56.6016"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.6221" y="56.7052"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.6392" y="56.9296"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.5356" y="57.0503"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.2861" y="57.0694"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.1825" y="57.1902"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.1996" y="57.4145"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.3204" y="57.5181"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.5699" y="57.499"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.6907" y="57.6026"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.7078" y="57.827"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.6042" y="57.9477"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.3547" y="57.9668"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.2511" y="58.0875"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.2682" y="58.3119"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.389" y="58.4155"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.6385" y="58.3964"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.7593" y="58.5"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.7764" y="58.7243"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.6728" y="58.8451"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.4233" y="58.8642"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.3197" y="58.9849"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.3368" y="59.2093"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.4576" y="59.3129"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.7071" y="59.2938"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.8279" y="59.3974"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.845" y="59.6217"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.7414" y="59.7425"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.4919" y="59.7616"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.3883" y="59.8823"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.4054" y="60.1066"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.5262" y="60.2102"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.7757" y="60.1911"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.8965" y="60.2947"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.9136" y="60.5191"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.81" y="60.6398"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.5605" y="60.6589"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.4569" y="60.7797"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.474" y="61.004"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.5948" y="61.1076"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.8443" y="61.0885"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.9651" y="61.1921"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.9822" y="61.4165"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.8786" y="61.5372"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.866" y="61.5382"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.7624" y="61.6584"/>
					</TrackLine>
					<TrackLine serpRef="serp_50">
						<End x="131.771" y="61.7713"/>
					</TrackLine>
					<TrackLine>
						<End x="131.771" y="61.885"/>
					</TrackLine>
					<TrackLine>
						<End x="131.9681" y="62.0821"/>
					</TrackLine>
					<TrackLine>
						<End x="132.7599" y="62.5199"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 4"/>
				<NetRef name="A4"/>
				<Subwire width="0.15">
					<Start x="133.6945" y="52.8537"/>
					<TrackLine>
						<End x="133.9887" y="53.1025"/>
					</TrackLine>
					<TrackLine>
						<End x="134.1863" y="53.3001"/>
					</TrackLine>
					<TrackLine>
						<End x="134.1863" y="53.4289"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.1899" y="53.5413"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.0811" y="53.6574"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9084" y="53.663"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.7996" y="53.779"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.8068" y="54.0039"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9229" y="54.1127"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.4932" y="54.0944"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6093" y="54.2032"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6165" y="54.4281"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.5077" y="54.5442"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9374" y="54.5625"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.8286" y="54.6786"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.8358" y="54.9034"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9519" y="55.0123"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.5222" y="54.9939"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6383" y="55.1027"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6455" y="55.3276"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.5367" y="55.4437"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9664" y="55.462"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.8576" y="55.5781"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.8648" y="55.803"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9809" y="55.9118"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.5512" y="55.8935"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6673" y="56.0023"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6745" y="56.2272"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.5657" y="56.3432"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9954" y="56.3616"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.8866" y="56.4776"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.8938" y="56.7025"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.0099" y="56.8113"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.5802" y="56.793"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6963" y="56.9018"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.7035" y="57.1267"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.5947" y="57.2428"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.0244" y="57.2611"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9156" y="57.3772"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9228" y="57.6021"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.0389" y="57.7109"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6092" y="57.6925"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.7253" y="57.8014"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.7325" y="58.0262"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6237" y="58.1423"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.0534" y="58.1606"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9446" y="58.2767"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="133.9518" y="58.5016"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.0679" y="58.6104"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6382" y="58.5921"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.7543" y="58.7009"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.7615" y="58.9258"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.6527" y="59.0418"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.48" y="59.0474"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.3712" y="59.1646"/>
					</TrackLine>
					<TrackLine serpRef="serp_51">
						<End x="134.3748" y="59.2763"/>
					</TrackLine>
					<TrackLine>
						<End x="134.3748" y="59.4269"/>
					</TrackLine>
					<TrackLine>
						<End x="133.9033" y="60.0614"/>
					</TrackLine>
					<TrackLine>
						<End x="133.9033" y="60.3442"/>
					</TrackLine>
					<TrackLine>
						<End x="133.7749" y="60.7592"/>
					</TrackLine>
					<TrackLine>
						<End x="133.7749" y="61.1216"/>
					</TrackLine>
					<TrackLine>
						<End x="134.2087" y="61.7343"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 4"/>
				<NetRef name="A11"/>
				<Subwire width="0.15">
					<Start x="135.3405" y="52.0786"/>
					<TrackLine>
						<End x="136.2045" y="53.1933"/>
					</TrackLine>
					<TrackLine>
						<End x="136.2045" y="53.3779"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.1891" y="53.4893"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.0623" y="53.5854"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.9394" y="53.5685"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.8126" y="53.6646"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.7819" y="53.8875"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.878" y="54.0143"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.3466" y="54.0789"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.4427" y="54.2057"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.4119" y="54.4286"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.2851" y="54.5246"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.8165" y="54.4601"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.6897" y="54.5561"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.6589" y="54.779"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.755" y="54.9058"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.2236" y="54.9704"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.3197" y="55.0972"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.289" y="55.3201"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.1621" y="55.4162"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.6935" y="55.3516"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.5667" y="55.4477"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.536" y="55.6706"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.632" y="55.7974"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.1007" y="55.862"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.1967" y="55.9888"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.166" y="56.2117"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.0392" y="56.3078"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.5706" y="56.2432"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.4437" y="56.3393"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.413" y="56.5622"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.5091" y="56.689"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.9777" y="56.7536"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.0738" y="56.8804"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="136.043" y="57.1033"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.9162" y="57.1993"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.4476" y="57.1348"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.3208" y="57.2308"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.29" y="57.4537"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.3861" y="57.5805"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.8547" y="57.6451"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.9508" y="57.7719"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.9201" y="57.9948"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.7933" y="58.0909"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.6704" y="58.074"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.5437" y="58.1691"/>
					</TrackLine>
					<TrackLine serpRef="serp_52">
						<End x="135.528" y="58.2828"/>
					</TrackLine>
					<TrackLine>
						<End x="135.528" y="58.3752"/>
					</TrackLine>
					<TrackLine>
						<End x="135.2163" y="58.7655"/>
					</TrackLine>
					<TrackLine>
						<End x="135.2164" y="59.0546"/>
					</TrackLine>
					<TrackLine>
						<End x="134.6446" y="60.7955"/>
					</TrackLine>
					<TrackLine>
						<End x="134.6446" y="61.1535"/>
					</TrackLine>
					<TrackLine>
						<End x="134.6462" y="61.5531"/>
					</TrackLine>
					<TrackLine>
						<End x="134.6462" y="61.9155"/>
					</TrackLine>
					<TrackLine>
						<End x="134.3079" y="62.3797"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 4"/>
				<NetRef name="DQS1"/>
				<Subwire width="0.15">
					<Start x="124.8961" y="52.0676"/>
					<TrackLine>
						<End x="125.3548" y="52.6904"/>
					</TrackLine>
					<TrackLine>
						<End x="125.3548" y="52.9832"/>
					</TrackLine>
					<TrackLine>
						<End x="125.5792" y="53.2076"/>
					</TrackLine>
					<TrackLine>
						<End x="127.5385" y="54.744"/>
					</TrackLine>
					<TrackLine>
						<End x="127.7255" y="54.931"/>
					</TrackLine>
					<TrackLine>
						<End x="127.7255" y="54.9534"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="127.7621" y="55.0598"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="127.6923" y="55.2028"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="127.679" y="55.2073"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="127.6092" y="55.3503"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="127.6824" y="55.5631"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="127.8254" y="55.6329"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.0647" y="55.5506"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.2077" y="55.6203"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.2809" y="55.8331"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.2111" y="55.9761"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="127.9717" y="56.0584"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="127.9019" y="56.2014"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="127.9751" y="56.4141"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.1181" y="56.4839"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.3574" y="56.4016"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.5004" y="56.4714"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.5736" y="56.6842"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.5038" y="56.8272"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.2645" y="56.9095"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.1947" y="57.0524"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.2679" y="57.2652"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.4108" y="57.335"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.6502" y="57.2527"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.7931" y="57.3225"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.8663" y="57.5353"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.7965" y="57.6782"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.5572" y="57.7605"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.4874" y="57.9035"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.5606" y="58.1163"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.7036" y="58.1861"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.9429" y="58.1038"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="129.0859" y="58.1736"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="129.1591" y="58.3863"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="129.0893" y="58.5293"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.8499" y="58.6116"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.7801" y="58.7546"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.8533" y="58.9674"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="128.9963" y="59.0371"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="129.2356" y="58.9548"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="129.3786" y="59.0246"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="129.4518" y="59.2374"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="129.382" y="59.3804"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="129.3687" y="59.3849"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="129.2991" y="59.5285"/>
					</TrackLine>
					<TrackLine serpRef="serp_53">
						<End x="129.3969" y="59.8129"/>
					</TrackLine>
					<TrackLine>
						<End x="129.3969" y="59.8353"/>
					</TrackLine>
					<TrackLine>
						<End x="129.5289" y="60.1029"/>
					</TrackLine>
					<TrackLine>
						<End x="129.5289" y="60.1249"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.5646" y="60.2316"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.4838" y="60.4959"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.5553" y="60.7093"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.6977" y="60.7802"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.7887" y="60.7497"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.9311" y="60.8207"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="130.0026" y="61.034"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.9316" y="61.1764"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.8405" y="61.2069"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.7696" y="61.3493"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.841" y="61.5627"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="129.9834" y="61.6337"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="130.0745" y="61.6032"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="130.2169" y="61.6741"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="130.2883" y="61.8875"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="130.2173" y="62.0299"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="130.1263" y="62.0604"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="130.0553" y="62.2028"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="130.1267" y="62.4161"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="130.3504" y="62.5785"/>
					</TrackLine>
					<TrackLine serpRef="serp_54">
						<End x="130.3863" y="62.6857"/>
					</TrackLine>
					<TrackLine>
						<End x="130.3863" y="62.8935"/>
					</TrackLine>
					<TrackLine>
						<End x="130.3" y="63.3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 4"/>
				<NetRef name="SD12"/>
				<Subwire width="0.15">
					<Start x="125.7434" y="46.5041"/>
					<TrackLine>
						<End x="125.2555" y="47.9609"/>
					</TrackLine>
					<TrackLine>
						<End x="125.1789" y="49.1764"/>
					</TrackLine>
					<TrackLine>
						<End x="125.0004" y="49.7481"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.9579" y="49.8523"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.7735" y="50.02"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.6885" y="50.2284"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.8025" y="50.5178"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.7175" y="50.7262"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.4336" y="50.8534"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.3486" y="51.0617"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.4626" y="51.3512"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.3776" y="51.5595"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.0937" y="51.6867"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.0087" y="51.895"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="124.0229" y="52.1445"/>
					</TrackLine>
					<TrackLine serpRef="serp_55">
						<End x="123.9804" y="52.2489"/>
					</TrackLine>
					<TrackLine>
						<End x="123.7819" y="52.707"/>
					</TrackLine>
					<TrackLine>
						<End x="123.563" y="54.0248"/>
					</TrackLine>
					<TrackLine>
						<End x="123.563" y="54.3872"/>
					</TrackLine>
					<TrackLine>
						<End x="123.8389" y="55.8634"/>
					</TrackLine>
					<TrackLine>
						<End x="123.8584" y="55.8887"/>
					</TrackLine>
					<TrackLine>
						<End x="124.6753" y="56.9358"/>
					</TrackLine>
					<TrackLine>
						<End x="125.638" y="58.1697"/>
					</TrackLine>
					<TrackLine>
						<End x="125.8357" y="58.3674"/>
					</TrackLine>
					<TrackLine>
						<End x="127.5003" y="59.2769"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9769" y="59.6457"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2262" y="59.895"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2262" y="60.2474"/>
					</TrackLine>
					<TrackLine>
						<End x="127.9436" y="60.8248"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 4"/>
				<NetRef name="SD14"/>
				<Subwire width="0.15">
					<Start x="124.13" y="46.4898"/>
					<TrackLine>
						<End x="123.7459" y="47.1458"/>
					</TrackLine>
					<TrackLine>
						<End x="123.6042" y="47.54"/>
					</TrackLine>
					<TrackLine>
						<End x="123.6042" y="47.5819"/>
					</TrackLine>
					<TrackLine serpRef="serp_56">
						<End x="123.5794" y="47.6916"/>
					</TrackLine>
					<TrackLine serpRef="serp_56">
						<End x="123.3224" y="47.8642"/>
					</TrackLine>
					<TrackLine serpRef="serp_56">
						<End x="123.2728" y="48.0836"/>
					</TrackLine>
					<TrackLine serpRef="serp_56">
						<End x="123.3577" y="48.2182"/>
					</TrackLine>
					<TrackLine serpRef="serp_56">
						<End x="123.5529" y="48.2623"/>
					</TrackLine>
					<TrackLine serpRef="serp_56">
						<End x="123.6378" y="48.3969"/>
					</TrackLine>
					<TrackLine serpRef="serp_56">
						<End x="123.5882" y="48.6163"/>
					</TrackLine>
					<TrackLine serpRef="serp_56">
						<End x="123.3312" y="48.7889"/>
					</TrackLine>
					<TrackLine serpRef="serp_56">
						<End x="123.3063" y="48.8992"/>
					</TrackLine>
					<TrackLine>
						<End x="123.3063" y="48.9411"/>
					</TrackLine>
					<TrackLine>
						<End x="123.0119" y="49.437"/>
					</TrackLine>
					<TrackLine>
						<End x="122.8824" y="49.9273"/>
					</TrackLine>
					<TrackLine>
						<End x="122.8824" y="49.9803"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.8646" y="50.0914"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.6361" y="50.2826"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.6004" y="50.5047"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.6936" y="50.6336"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.857" y="50.6599"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.9503" y="50.7888"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.9146" y="51.0109"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.7857" y="51.1042"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.6223" y="51.0779"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.4933" y="51.1712"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.4577" y="51.3933"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.6147" y="51.6464"/>
					</TrackLine>
					<TrackLine serpRef="serp_57">
						<End x="122.5968" y="51.7583"/>
					</TrackLine>
					<TrackLine>
						<End x="122.5968" y="51.8113"/>
					</TrackLine>
					<TrackLine>
						<End x="122.3684" y="52.2362"/>
					</TrackLine>
					<TrackLine>
						<End x="122.3684" y="52.5986"/>
					</TrackLine>
					<TrackLine>
						<End x="122.5375" y="53.376"/>
					</TrackLine>
					<TrackLine>
						<End x="123.5014" y="56.0032"/>
					</TrackLine>
					<TrackLine>
						<End x="123.5209" y="56.0285"/>
					</TrackLine>
					<TrackLine>
						<End x="124.3378" y="57.0756"/>
					</TrackLine>
					<TrackLine>
						<End x="125.3005" y="58.3095"/>
					</TrackLine>
					<TrackLine>
						<End x="125.6959" y="58.7049"/>
					</TrackLine>
					<TrackLine>
						<End x="127.3605" y="59.6144"/>
					</TrackLine>
					<TrackLine>
						<End x="127.6168" y="59.8707"/>
					</TrackLine>
					<TrackLine>
						<End x="127.8007" y="60.0712"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 4"/>
				<NetRef name="SD15"/>
				<Subwire width="0.15">
					<Start x="124.0005" y="54.206"/>
					<TrackLine>
						<End x="124.0625" y="54.3212"/>
					</TrackLine>
					<TrackLine>
						<End x="124.3188" y="54.5775"/>
					</TrackLine>
					<TrackLine>
						<End x="124.613" y="54.7283"/>
					</TrackLine>
					<TrackLine>
						<End x="124.7404" y="54.8556"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="124.8096" y="54.9443"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="124.7901" y="55.1022"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="124.4575" y="55.3617"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="124.438" y="55.5196"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="124.5764" y="55.697"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="124.7343" y="55.7165"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.5769" y="55.0591"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.7348" y="55.0786"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.8732" y="55.256"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.8537" y="55.4139"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.0111" y="56.0713"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="124.9916" y="56.2292"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.13" y="56.4066"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.2879" y="56.4261"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.1305" y="55.7687"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.2884" y="55.7882"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.4268" y="55.9656"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.4073" y="56.1235"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.5647" y="56.7809"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.5452" y="56.9388"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.6836" y="57.1162"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="125.8415" y="57.1357"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.6841" y="56.4783"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.842" y="56.4978"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.9804" y="56.6752"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.9609" y="56.8331"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.1183" y="57.4905"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.0988" y="57.6484"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.2372" y="57.8258"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="126.3951" y="57.8453"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="127.2377" y="57.1879"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="127.3956" y="57.2074"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="127.534" y="57.3848"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="127.5145" y="57.5427"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="127.1819" y="57.8022"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="127.1624" y="57.9601"/>
					</TrackLine>
					<TrackLine serpRef="serp_58">
						<End x="127.3694" y="58.2255"/>
					</TrackLine>
					<TrackLine>
						<End x="127.4382" y="58.2944"/>
					</TrackLine>
					<TrackLine>
						<End x="128.5757" y="59.7502"/>
					</TrackLine>
					<TrackLine>
						<End x="128.6517" y="60.054"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 4"/>
				<NetRef name="SDBA0"/>
				<Subwire width="0.15">
					<Start x="132.1282" y="47.3313"/>
					<TrackLine>
						<End x="131.7021" y="47.941"/>
					</TrackLine>
					<TrackLine>
						<End x="131.7021" y="48.3004"/>
					</TrackLine>
					<TrackLine>
						<End x="131.9942" y="49.3681"/>
					</TrackLine>
					<TrackLine>
						<End x="132.2066" y="49.6965"/>
					</TrackLine>
					<TrackLine>
						<End x="132.25" y="49.74"/>
					</TrackLine>
					<TrackLine serpRef="serp_59">
						<End x="132.3178" y="49.8298"/>
					</TrackLine>
					<TrackLine serpRef="serp_59">
						<End x="132.3554" y="50.0833"/>
					</TrackLine>
					<TrackLine serpRef="serp_59">
						<End x="132.491" y="50.2629"/>
					</TrackLine>
					<TrackLine serpRef="serp_59">
						<End x="132.6486" y="50.2849"/>
					</TrackLine>
					<TrackLine serpRef="serp_59">
						<End x="132.6649" y="50.2725"/>
					</TrackLine>
					<TrackLine serpRef="serp_59">
						<End x="132.8225" y="50.2945"/>
					</TrackLine>
					<TrackLine serpRef="serp_59">
						<End x="132.9581" y="50.4741"/>
					</TrackLine>
					<TrackLine serpRef="serp_59">
						<End x="132.9957" y="50.7276"/>
					</TrackLine>
					<TrackLine serpRef="serp_59">
						<End x="133.0639" y="50.8179"/>
					</TrackLine>
					<TrackLine>
						<End x="133.1073" y="50.8614"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3293" y="51.2021"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3293" y="51.5399"/>
					</TrackLine>
					<TrackLine>
						<End x="133.2689" y="52.2315"/>
					</TrackLine>
					<TrackLine>
						<End x="133.037" y="52.4634"/>
					</TrackLine>
					<TrackLine>
						<End x="132.7486" y="52.4681"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5196" y="52.6971"/>
					</TrackLine>
					<TrackLine>
						<End x="132.5196" y="53.1552"/>
					</TrackLine>
					<TrackLine>
						<End x="132.332" y="53.3916"/>
					</TrackLine>
					<TrackLine>
						<End x="132.3233" y="53.5733"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.3389" y="53.6847"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.2431" y="53.8117"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.2339" y="53.813"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.1381" y="53.9401"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.1694" y="54.1629"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.2964" y="54.2587"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.5377" y="54.2249"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.6647" y="54.3207"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.6959" y="54.5435"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.6002" y="54.6705"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.3589" y="54.7043"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.2631" y="54.8313"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.2944" y="55.0542"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.4214" y="55.1499"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.6627" y="55.1161"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.7897" y="55.2119"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.8209" y="55.4348"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.7251" y="55.5618"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.4839" y="55.5956"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.3881" y="55.7226"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.4193" y="55.9454"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.5464" y="56.0412"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.7876" y="56.0074"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.9147" y="56.1032"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.9459" y="56.326"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.8501" y="56.4531"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.6089" y="56.4869"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.5131" y="56.6139"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.5443" y="56.8367"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.6714" y="56.9325"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.9126" y="56.8987"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="133.0397" y="56.9945"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="133.0709" y="57.2173"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.9751" y="57.3444"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.7338" y="57.3782"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.6381" y="57.5052"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.6693" y="57.728"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.7963" y="57.8238"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="133.0376" y="57.79"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="133.1646" y="57.8858"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="133.1959" y="58.1086"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="133.1001" y="58.2356"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.8588" y="58.2694"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.763" y="58.3965"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.7943" y="58.6193"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.9213" y="58.7151"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="132.9305" y="58.7138"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="133.0576" y="58.8096"/>
					</TrackLine>
					<TrackLine serpRef="serp_60">
						<End x="133.0733" y="58.9217"/>
					</TrackLine>
					<TrackLine>
						<End x="133.0733" y="59.0132"/>
					</TrackLine>
					<TrackLine>
						<End x="133.2691" y="59.209"/>
					</TrackLine>
					<TrackLine>
						<End x="133.3654" y="59.2905"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="135.35" y="48.16"/>
					<TrackLine>
						<End x="135.0221" y="48.16"/>
					</TrackLine>
					<TrackLine>
						<End x="134.9471" y="48.16"/>
					</TrackLine>
					<TrackLine>
						<End x="134.1221" y="48.5604"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="122.8193" y="47.3951"/>
					<TrackLine>
						<End x="122.8193" y="47.6951"/>
					</TrackLine>
					<TrackLine>
						<End x="122.8193" y="47.7701"/>
					</TrackLine>
					<TrackLine>
						<End x="123.5384" y="48.4951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="125.74" y="52.03"/>
					<TrackLine>
						<End x="126.6195" y="51.2701"/>
					</TrackLine>
					<TrackLine>
						<End x="126.6634" y="51.2262"/>
					</TrackLine>
					<TrackLine>
						<End x="126.6634" y="51.1951"/>
					</TrackLine>
					<TrackLine>
						<End x="126.6634" y="51.1201"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9384" y="50.7451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="128.9384" y="48.0951"/>
					<TrackLine>
						<End x="128.8134" y="48.964"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8134" y="48.9951"/>
					</TrackLine>
					<TrackLine>
						<End x="128.8134" y="49.0701"/>
					</TrackLine>
					<TrackLine>
						<End x="128.5384" y="49.4451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="125.693" y="48.1421"/>
					<TrackLine>
						<End x="125.693" y="48.9951"/>
					</TrackLine>
					<TrackLine>
						<End x="125.693" y="49.0701"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4195" y="49.4451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="135.1384" y="46.3951"/>
					<TrackLine>
						<End x="134.8384" y="46.3951"/>
					</TrackLine>
					<TrackLine>
						<End x="134.7634" y="46.3951"/>
					</TrackLine>
					<TrackLine>
						<End x="134.3884" y="46.5951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="122.975" y="53.1948"/>
					<TrackLine>
						<End x="123.3609" y="53.2691"/>
					</TrackLine>
					<TrackLine>
						<End x="123.392" y="53.2691"/>
					</TrackLine>
					<TrackLine>
						<End x="123.467" y="53.2691"/>
					</TrackLine>
					<TrackLine>
						<End x="123.842" y="53.5441"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="128.919" y="52.0226"/>
					<TrackLine>
						<End x="129.8195" y="51.2701"/>
					</TrackLine>
					<TrackLine>
						<End x="129.8634" y="51.2262"/>
					</TrackLine>
					<TrackLine>
						<End x="129.8634" y="51.1951"/>
					</TrackLine>
					<TrackLine>
						<End x="129.8634" y="51.1201"/>
					</TrackLine>
					<TrackLine>
						<End x="130.1384" y="50.7451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="EMI_1V8"/>
				<Subwire width="0.15">
					<Start x="132.4" y="49.2"/>
					<TrackLine>
						<End x="132.0884" y="49.2"/>
					</TrackLine>
					<TrackLine>
						<End x="132.0134" y="49.2"/>
					</TrackLine>
					<TrackLine>
						<End x="131.7384" y="49.4451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.5159" y="52.0322"/>
					<TrackLine>
						<End x="131.4195" y="51.2701"/>
					</TrackLine>
					<TrackLine>
						<End x="131.4634" y="51.2262"/>
					</TrackLine>
					<TrackLine>
						<End x="131.4634" y="51.1951"/>
					</TrackLine>
					<TrackLine>
						<End x="131.4634" y="51.1201"/>
					</TrackLine>
					<TrackLine>
						<End x="131.7384" y="50.7451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="127.3443" y="52.029"/>
					<TrackLine>
						<End x="128.2195" y="51.2701"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2634" y="51.2262"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2634" y="51.1951"/>
					</TrackLine>
					<TrackLine>
						<End x="128.2634" y="51.1201"/>
					</TrackLine>
					<TrackLine>
						<End x="128.5384" y="50.7451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="130.5283" y="48.1419"/>
					<TrackLine>
						<End x="130.4134" y="48.964"/>
					</TrackLine>
					<TrackLine>
						<End x="130.4134" y="48.9951"/>
					</TrackLine>
					<TrackLine>
						<End x="130.4134" y="49.0701"/>
					</TrackLine>
					<TrackLine>
						<End x="130.1384" y="49.4451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="127.313" y="48.1593"/>
					<TrackLine>
						<End x="127.2134" y="48.964"/>
					</TrackLine>
					<TrackLine>
						<End x="127.2134" y="48.9951"/>
					</TrackLine>
					<TrackLine>
						<End x="127.2134" y="49.0701"/>
					</TrackLine>
					<TrackLine>
						<End x="126.9384" y="49.4451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="122.8059" y="52.4174"/>
					<TrackLine>
						<End x="122.8059" y="52.0951"/>
					</TrackLine>
					<TrackLine>
						<End x="122.8059" y="52.0201"/>
					</TrackLine>
					<TrackLine>
						<End x="123.5384" y="51.2951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="126.0798" y="50.8796"/>
					<TrackLine>
						<End x="125.7695" y="50.8796"/>
					</TrackLine>
					<TrackLine>
						<End x="125.6945" y="50.8796"/>
					</TrackLine>
					<TrackLine>
						<End x="125.4195" y="50.7451"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="132.2698" y="46.45"/>
					<TrackLine>
						<End x="132.6384" y="46.45"/>
					</TrackLine>
					<TrackLine>
						<End x="132.7134" y="46.45"/>
					</TrackLine>
					<TrackLine>
						<End x="133.0884" y="46.5951"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="135.37" y="51.33"/>
					<TrackLine>
						<End x="135.0221" y="51.33"/>
					</TrackLine>
					<TrackLine>
						<End x="134.9471" y="51.33"/>
					</TrackLine>
					<TrackLine>
						<End x="134.1221" y="51.3604"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Bottom"/>
				<NetRef name="GND"/>
				<Subwire width="0.15">
					<Start x="125.142" y="53.5441"/>
					<TrackLine>
						<End x="124.767" y="53.2691"/>
					</TrackLine>
					<TrackLine>
						<End x="124.692" y="53.2691"/>
					</TrackLine>
					<TrackLine>
						<End x="124.6609" y="53.2691"/>
					</TrackLine>
					<TrackLine>
						<End x="124.617" y="53.2252"/>
					</TrackLine>
					<TrackLine>
						<End x="124.5545" y="53.0854"/>
					</TrackLine>
					<TrackLine>
						<End x="124.4007" y="52.9316"/>
					</TrackLine>
					<TrackLine>
						<End x="124.2087" y="52.8838"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SDCLK_B"/>
				<Subwire width="0.15" zipwireRef="zwire_0">
					<Start x="130.4382" y="61.1277"/>
					<TrackLine>
						<End x="130.7858" y="60.6431"/>
					</TrackLine>
					<TrackLine>
						<End x="130.8223" y="60.5921"/>
					</TrackLine>
					<TrackLine>
						<End x="130.8607" y="60.4727"/>
					</TrackLine>
					<TrackLine>
						<End x="130.8607" y="60.41"/>
					</TrackLine>
					<TrackLine>
						<End x="130.8607" y="60.2328"/>
					</TrackLine>
					<TrackLine>
						<End x="131.2895" y="54.5154"/>
					</TrackLine>
					<TrackLine>
						<End x="131.2902" y="54.5024"/>
					</TrackLine>
					<TrackLine>
						<End x="131.316" y="53.8923"/>
					</TrackLine>
					<TrackLine>
						<End x="131.3164" y="53.8719"/>
					</TrackLine>
					<TrackLine>
						<End x="131.3121" y="53.3793"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef name="Int 1"/>
				<NetRef name="SDCLK"/>
				<Subwire width="0.15" zipwireRef="zwire_0">
					<Start x="130.1132" y="60.8947"/>
					<TrackLine>
						<End x="130.4607" y="60.41"/>
					</TrackLine>
					<TrackLine>
						<End x="130.4607" y="60.2328"/>
					</TrackLine>
					<TrackLine>
						<End x="130.4607" y="60.2253"/>
					</TrackLine>
					<TrackLine>
						<End x="130.4613" y="60.2104"/>
					</TrackLine>
					<TrackLine>
						<End x="130.4618" y="60.2029"/>
					</TrackLine>
					<TrackLine>
						<End x="130.8906" y="54.4855"/>
					</TrackLine>
					<TrackLine>
						<End x="130.9164" y="53.8754"/>
					</TrackLine>
					<TrackLine>
						<End x="130.9121" y="53.3827"/>
					</TrackLine>
				</Subwire>
			</Wire>
		</Wires>
		<Coppers>
			<Copper priority="50" backoff="1"
			 connectPad="Thermal"
			 lineWidth="0.1" lineClr="1.6" minSquare="0.01" deleteUnconnected="on" state="Poured">
				<LayerRef name="INT_PWR"/>
				<NetRef name="3V3"/>
				<ThermalPad>
					<Thermal spokeNum="4" minSpokeNum="1" angle="45" spokeWidth="0.381" backoff="1"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="128.0933" y="73.7167"/>
						<SegmentLine>
							<End x="128.0933" y="68.4023"/>
						</SegmentLine>
						<SegmentLine>
							<End x="122.2311" y="68.4023"/>
						</SegmentLine>
						<SegmentLine>
							<End x="122.2311" y="73.7167"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="126.3868" y="69.53"/>
							<SegmentLine>
								<End x="126.425" y="69.5682"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.425" y="69.6718"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3518" y="69.745"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3481" y="69.745"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.1857" y="69.9775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.1391" y="69.9775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8975" y="70.2191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8975" y="70.5609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.1391" y="70.8025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4809" y="70.8025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.5267" y="70.7567"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.8639" y="70.7973"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.9691" y="70.9025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.2104" y="70.9025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.629" y="71.1103"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7052" y="71.1282"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.795" y="71.1282"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8582" y="71.065"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.9618" y="71.065"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.025" y="71.1282"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0465" y="71.1282"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0933" y="71.1364"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0933" y="73.7167"/>
							</SegmentLine>
							<SegmentLine>
								<End x="122.2311" y="73.7167"/>
							</SegmentLine>
							<SegmentLine>
								<End x="122.2311" y="68.4023"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7736" y="68.4023"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7681" y="68.6185"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6875" y="68.6991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6875" y="68.9031"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4109" y="69.3707"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3868" y="69.4583"/>
							</SegmentLine>
						</FilledContour>
						<Voids>
							<FilledContour>
								<Start x="125.9525" y="69.4891"/>
								<SegmentLine>
									<End x="125.7109" y="69.2475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.3691" y="69.2475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.1275" y="69.4891"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.1275" y="69.8309"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.3691" y="70.0725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.7109" y="70.0725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.9525" y="69.8309"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="123.5025" y="70.3191"/>
								<SegmentLine>
									<End x="123.2609" y="70.0775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.9191" y="70.0775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.6775" y="70.3191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.6775" y="70.6609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.9191" y="70.9025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.2609" y="70.9025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.5025" y="70.6609"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="124.0934" y="71.69"/>
								<SegmentLine>
									<End x="124.3225" y="71.4609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.3225" y="71.1191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.0809" y="70.8775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.7391" y="70.8775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.4975" y="71.1191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.4975" y="71.4609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.7266" y="71.69"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.4975" y="71.9191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.4975" y="72.2609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.7166" y="72.48"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.4775" y="72.7191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.4775" y="73.0609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.7191" y="73.3025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.0609" y="73.3025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.3025" y="73.0609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.3025" y="72.7191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.0834" y="72.5"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.31" y="72.2734"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.5391" y="72.5025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.8809" y="72.5025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.1225" y="72.2609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.1225" y="71.9191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.8809" y="71.6775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.5391" y="71.6775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.31" y="71.9066"/>
								</SegmentLine>
							</FilledContour>
						</Voids>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" backoff="1"
			 connectPad="Thermal"
			 lineWidth="0.1" lineClr="1.6" minSquare="0.01" deleteUnconnected="on" state="Poured">
				<LayerRef name="INT_PWR"/>
				<NetRef name="1V5"/>
				<ThermalPad>
					<Thermal spokeNum="4" minSpokeNum="1" angle="45" spokeWidth="0.381" backoff="1"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="129.7538" y="70.6483"/>
						<SegmentLine>
							<End x="129.7538" y="69.548"/>
						</SegmentLine>
						<SegmentLine>
							<End x="127.6362" y="69.548"/>
						</SegmentLine>
						<SegmentLine>
							<End x="127.6362" y="70.6483"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="127.785" y="70.4326"/>
							<SegmentLine>
								<End x="127.6362" y="70.3588"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.6362" y="69.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.2975" y="69.548"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.2975" y="69.8109"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.5391" y="70.0525"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.8809" y="70.0525"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0975" y="69.8359"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0975" y="69.8609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.3391" y="70.1025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6809" y="70.1025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.7538" y="70.0296"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.7538" y="70.6483"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.2371" y="70.6483"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1768" y="70.6051"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1725" y="70.602"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1725" y="70.2991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.9309" y="70.0575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.5891" y="70.0575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3475" y="70.2991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3475" y="70.4942"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.134" y="70.4569"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.1195" y="70.4544"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0906" y="70.4518"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.025" y="70.4518"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.9618" y="70.515"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8582" y="70.515"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.785" y="70.4418"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" backoff="1"
			 connectPad="Thermal"
			 lineWidth="0.1" lineClr="1.6" minSquare="0.01" deleteUnconnected="on" state="Poured">
				<LayerRef name="INT_PWR"/>
				<NetRef name="1V8"/>
				<ThermalPad>
					<Thermal spokeNum="4" minSpokeNum="1" angle="45" spokeWidth="0.381" backoff="1"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="133.7139" y="65.3665"/>
						<SegmentLine>
							<End x="133.7139" y="63.1248"/>
						</SegmentLine>
						<SegmentLine>
							<End x="126.8696" y="63.1248"/>
						</SegmentLine>
						<SegmentLine>
							<End x="126.8696" y="65.3665"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="127.0918" y="64.035"/>
							<SegmentLine>
								<End x="127.1017" y="63.8552"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.071" y="63.8209"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.0686" y="63.7826"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3109" y="63.7825"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.317" y="63.776"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="64.0785"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="64.1618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4976" y="64.2192"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="64.2809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5414" y="64.3249"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.6549" y="64.4383"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.6956" y="64.4789"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7391" y="64.5225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8013" y="64.5226"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.9618" y="64.5225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0192" y="64.5224"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0809" y="64.5225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.1249" y="64.4786"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.2383" y="64.3651"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.2789" y="64.3244"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3225" y="64.2809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3226" y="64.2187"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3225" y="64.0582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3224" y="64.0008"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3225" y="63.9391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.2786" y="63.8951"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.2493" y="63.8659"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0544" y="63.671"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0421" y="63.671"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.9539" y="63.523"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.9446" y="63.5075"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.9224" y="63.4789"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8981" y="63.4549"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8973" y="63.4542"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8249" y="63.3819"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8252" y="63.376"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8251" y="63.2848"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.825" y="63.2782"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8982" y="63.205"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0018" y="63.205"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0271" y="63.2303"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0868" y="63.2301"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.1413" y="63.2308"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.1973" y="63.2315"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.1975" y="63.4509"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.4391" y="63.6925"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.7809" y="63.6925"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0145" y="63.4588"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1037" y="63.5161"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1038" y="63.5502"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.2612" y="63.7076"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.3019" y="63.7482"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.3454" y="63.7918"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.4076" y="63.7919"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.5681" y="63.7918"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6255" y="63.7917"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6872" y="63.7918"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.7312" y="63.7479"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.8445" y="63.6345"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9288" y="63.5502"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9287" y="63.5121"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.1291" y="63.7125"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.4709" y="63.7125"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6475" y="63.5359"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6475" y="63.5409"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8891" y="63.7825"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2309" y="63.7825"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.4725" y="63.5409"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.4724" y="63.4584"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.4777" y="63.4614"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.4775" y="63.4809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.5178" y="63.5211"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.6349" y="63.6383"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.6756" y="63.6789"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.7191" y="63.7225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.7813" y="63.7226"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.9417" y="63.7225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.9991" y="63.7224"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0609" y="63.7225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.1048" y="63.6786"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.1353" y="63.6482"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4448" y="63.6482"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4755" y="63.6788"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.5191" y="63.7225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.7417" y="63.7225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.7991" y="63.7224"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8609" y="63.7225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.9048" y="63.6786"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.9353" y="63.6482"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2448" y="63.6482"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2755" y="63.6788"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3191" y="63.7225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4919" y="63.7225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7139" y="63.8761"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7139" y="64.5506"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7045" y="64.5412"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6609" y="64.4975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4382" y="64.4975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3808" y="64.4976"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3191" y="64.4975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2751" y="64.5414"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.09" y="64.7266"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8609" y="64.4975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.5191" y="64.4975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2775" y="64.7391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2775" y="65.0809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.5191" y="65.3225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8124" y="65.322"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8088" y="65.3275"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4891" y="65.3275"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4501" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.1299" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0609" y="65.2975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.7191" y="65.2975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.6501" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.3299" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2609" y="65.2975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.9191" y="65.2975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8501" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.7499" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.7084" y="65.325"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="65.1109"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="64.7691"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6809" y="64.5275"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.3391" y="64.5275"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1225" y="64.7441"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1225" y="64.7391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.8809" y="64.4975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.5391" y="64.4975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.2975" y="64.7391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.2975" y="65.0809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.5266" y="65.31"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.4701" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.1499" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0809" y="65.2975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7391" y="65.2975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.6701" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4482" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4482" y="65.1552"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4788" y="65.1245"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5225" y="65.0809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5225" y="64.8582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5224" y="64.8008"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5225" y="64.7391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4786" y="64.6951"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3651" y="64.5817"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3244" y="64.5411"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.2809" y="64.4975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.2187" y="64.4974"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.9953" y="64.4979"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.07" y="64.43"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.0728" y="64.3795"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.1002" y="64.337"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.0889" y="64.285"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.0782" y="64.285"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.005" y="64.2118"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.005" y="64.1082"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.0782" y="64.035"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" backoff="1"
			 connectPad="Thermal"
			 lineWidth="0.1" lineClr="1.6" minSquare="0.01" deleteUnconnected="on" state="Poured">
				<LayerRef name="INT_PWR"/>
				<NetRef name="3V15"/>
				<ThermalPad>
					<Thermal spokeNum="4" minSpokeNum="1" angle="45" spokeWidth="0.381" backoff="1"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="134.644" y="71.543"/>
						<SegmentLine>
							<End x="134.644" y="63.8879"/>
						</SegmentLine>
						<SegmentLine>
							<End x="124.9618" y="63.8879"/>
						</SegmentLine>
						<SegmentLine>
							<End x="124.9618" y="71.543"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="128.1249" y="70.7586"/>
							<SegmentLine>
								<End x="128.1346" y="70.7489"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.298" y="70.7774"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.43" y="70.8004"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.4718" y="70.7652"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.5891" y="70.8825"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.6341" y="70.8825"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.5951" y="70.9214"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.4817" y="71.0349"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.4411" y="71.0756"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3975" y="71.1191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3974" y="71.1813"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3975" y="71.3417"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3975" y="71.4609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.4796" y="71.543"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3808" y="71.543"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3808" y="71.0317"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.2463" y="70.8714"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.1595" y="70.8561"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.1244" y="70.8211"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0935" y="70.7899"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
					<Island>
						<FilledContour>
							<Start x="134.3893" y="66.4325"/>
							<SegmentLine>
								<End x="134.415" y="66.4582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.415" y="66.5618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3893" y="66.5875"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3893" y="66.6024"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7477" y="67.7443"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7451" y="67.7417"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7044" y="67.7011"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6609" y="67.6575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5987" y="67.6574"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4382" y="67.6575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3808" y="67.6576"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3191" y="67.6575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2751" y="67.7014"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1617" y="67.8149"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1211" y="67.8556"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0775" y="67.8991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0774" y="67.9613"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0775" y="68.1218"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0776" y="68.1792"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0775" y="68.2409"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1214" y="68.2849"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2766" y="68.44"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.07" y="68.6466"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8309" y="68.4075"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4891" y="68.4075"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2475" y="68.6491"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2475" y="68.6841"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0259" y="68.4625"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0409" y="68.4625"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2825" y="68.2209"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2825" y="67.8791"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0409" y="67.6375"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.6991" y="67.6375"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.46" y="67.8766"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2609" y="67.6775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.9191" y="67.6775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6775" y="67.9191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6775" y="68.2609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8741" y="68.4575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8691" y="68.4575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6275" y="68.6991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6275" y="69.0409"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8616" y="69.275"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6475" y="69.4891"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6475" y="69.8309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8741" y="70.0575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8691" y="70.0575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6275" y="70.2991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6275" y="70.6409"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8691" y="70.8825"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2109" y="70.8825"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.4525" y="70.6409"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.4525" y="70.2991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2259" y="70.0725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2309" y="70.0725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.455" y="69.8484"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.6791" y="70.0725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.6841" y="70.0725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.4675" y="70.2891"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.4675" y="70.6309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.7091" y="70.8725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0509" y="70.8725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2925" y="70.6309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2925" y="70.2891"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0509" y="70.0475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0459" y="70.0475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.255" y="69.8384"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4891" y="70.0725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8309" y="70.0725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0725" y="69.8309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0725" y="69.4891"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8309" y="69.2475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4891" y="69.2475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.255" y="69.4816"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0284" y="69.255"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2525" y="69.0309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2525" y="68.9959"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4891" y="69.2325"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8309" y="69.2325"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.07" y="68.9934"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2866" y="69.21"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1617" y="69.3349"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1211" y="69.3756"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0775" y="69.4191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0774" y="69.4813"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0775" y="69.6418"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0776" y="69.6992"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0775" y="69.7609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1214" y="69.8049"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2349" y="69.9183"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2756" y="69.9589"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3191" y="70.0025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3813" y="70.0026"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5418" y="70.0025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5992" y="70.0024"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6609" y="70.0025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7049" y="69.9586"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.8182" y="69.8452"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.8588" y="69.8045"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.9025" y="69.7609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.9025" y="69.6558"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.1577" y="69.4005"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.286" y="69.5659"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2915" y="69.573"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2974" y="69.5806"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.365" y="69.6482"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.365" y="69.7518"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3388" y="69.778"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3386" y="69.8819"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3383" y="69.8869"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3123" y="70.2977"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3084" y="70.3597"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3041" y="70.4273"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.315" y="70.4382"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.315" y="70.5418"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2418" y="70.615"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2055" y="70.615"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.1837" y="70.6368"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.1826" y="70.6372"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6255" y="70.8475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4383" y="70.8475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3809" y="70.8476"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3191" y="70.8475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2752" y="70.8914"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2421" y="70.9246"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8523" y="70.9289"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8244" y="70.9011"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.7809" y="70.8575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.7187" y="70.8574"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.5582" y="70.8575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.5008" y="70.8576"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4391" y="70.8575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.3951" y="70.9014"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.2725" y="71.0241"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.1975" y="71.0991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.1976" y="71.1378"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.9884" y="71.2766"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.9763" y="71.2847"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.9639" y="71.2929"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.9418" y="71.315"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.8382" y="71.315"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.8345" y="71.3113"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.7976" y="71.3151"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.7911" y="71.3151"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.7775" y="71.3157"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2214" y="71.3686"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.1279" y="71.3689"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.1018" y="71.395"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.9982" y="71.395"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.9725" y="71.3693"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.9117" y="71.3695"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.871" y="71.3692"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8688" y="71.3692"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.706" y="71.3618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6485" y="71.3614"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.5858" y="71.361"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.5618" y="71.385"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.4582" y="71.385"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.3851" y="71.3117"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.378" y="71.3062"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.2224" y="71.1837"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.2224" y="71.1808"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.2225" y="71.1191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1786" y="71.0751"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0651" y="70.9617"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0244" y="70.9211"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.9809" y="70.8775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.936" y="70.8774"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.9892" y="70.8242"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0087" y="70.8383"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0697" y="70.882"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1063" y="70.9082"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.192" y="70.9358"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.8729" y="70.9358"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.0413" y="70.7674"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.0413" y="70.0296"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.0411" y="69.8372"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="69.7882"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="69.5191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6934" y="69.29"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="69.0609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="68.7191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6934" y="68.49"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="68.2609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="67.9191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6809" y="67.6775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.3391" y="67.6775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.11" y="67.9066"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.8809" y="67.6775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.5391" y="67.6775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.31" y="67.9066"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0809" y="67.6775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7391" y="67.6775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="67.9191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="68.2609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7266" y="68.49"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="68.7191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="69.0609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.6971" y="69.2605"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5171" y="69.2605"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4155" y="69.3621"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3209" y="69.2675"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.9791" y="69.2675"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7375" y="69.5091"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7375" y="69.8509"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.9791" y="70.0925"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3209" y="70.0925"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3487" y="70.0647"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3487" y="70.4407"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.435" y="70.5799"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5967" y="70.6601"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.6549" y="70.7183"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.6956" y="70.7589"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7265" y="70.7899"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.6948" y="70.8221"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3382" y="70.645"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3084" y="70.6302"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.2436" y="70.615"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.0882" y="70.615"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.0332" y="70.56"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.9462" y="70.5176"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.5611" y="70.4713"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4952" y="70.4634"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3703" y="70.5066"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3619" y="70.515"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.2582" y="70.515"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.185" y="70.4418"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.185" y="70.3382"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.2603" y="70.2629"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3811" y="70.1999"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.5605" y="69.9429"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6283" y="69.8751"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6689" y="69.8344"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7125" y="69.7909"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7126" y="69.7287"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7125" y="69.5682"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7124" y="69.5108"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7125" y="69.4491"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7037" y="69.4403"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.9349" y="69.0495"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.9547" y="69.016"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.975" y="68.9415"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.975" y="68.8182"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.0105" y="68.7826"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.0542" y="68.6809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.061" y="68.4096"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.064" y="68.2882"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.8948" y="68.1148"/>
							</SegmentLine>
							<SegmentLine>
								<End x="124.9618" y="68.1148"/>
							</SegmentLine>
							<SegmentLine>
								<End x="124.9618" y="63.8879"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.9456" y="63.8879"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8944" y="63.9391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8944" y="64.2809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.1251" y="64.5116"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.0954" y="64.5412"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.9817" y="64.6549"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.9411" y="64.6956"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8975" y="64.7391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8974" y="64.8013"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8975" y="64.9617"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8976" y="65.0191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8975" y="65.0809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.9414" y="65.1248"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.9718" y="65.1553"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.9718" y="65.4648"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.9412" y="65.4955"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8975" y="65.5391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8975" y="65.7618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8976" y="65.8192"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8975" y="65.8809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.9414" y="65.9249"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.0549" y="66.0383"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.0956" y="66.0789"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.1391" y="66.1225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.2013" y="66.1226"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3618" y="66.1225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4192" y="66.1224"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4809" y="66.1225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.5249" y="66.0786"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6383" y="65.9651"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6789" y="65.9244"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7225" y="65.8809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7226" y="65.8187"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7225" y="65.6583"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7224" y="65.6009"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7225" y="65.5391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6786" y="65.4952"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6481" y="65.4648"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6482" y="65.1552"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6788" y="65.1245"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7225" y="65.0809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7225" y="64.9029"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.8135" y="64.7676"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.8228" y="64.785"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.1618" y="64.785"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.235" y="64.8582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.235" y="64.9618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.2043" y="64.9926"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.1606" y="65.0983"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.1607" y="65.3665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.1607" y="65.4856"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3291" y="65.654"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="65.654"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="65.8809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7266" y="66.11"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="66.3391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4975" y="66.6809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7391" y="66.9225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0809" y="66.9225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.31" y="66.6934"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.5391" y="66.9225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.8809" y="66.9225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.11" y="66.6934"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.3391" y="66.9225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6809" y="66.9225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="66.6809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="66.3391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6934" y="66.11"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="65.8809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.9225" y="65.6541"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6775" y="65.654"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6775" y="65.8809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.9066" y="66.11"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6775" y="66.3391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.6775" y="66.6809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.9191" y="66.9225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2609" y="66.9225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.49" y="66.6934"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.7091" y="66.9125"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0509" y="66.9125"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.28" y="66.6834"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.5191" y="66.9225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8609" y="66.9225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1025" y="66.6809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1025" y="66.3391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8734" y="66.11"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0725" y="65.9109"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0725" y="65.5691"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.025" y="65.5216"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.052" y="65.4809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1466" y="65.3373"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0414" y="65.142"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1025" y="65.0809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1025" y="65.0141"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2091" y="65.0141"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4382" y="64.785"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5418" y="64.785"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6151" y="64.8581"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6467" y="64.8897"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0016" y="64.7424"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0014" y="64.0572"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0375" y="64.0684"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0532" y="64.0732"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.165" y="64.0732"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.165" y="64.0582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2382" y="63.985"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3418" y="63.985"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.415" y="64.0582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.415" y="64.1618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3478" y="64.229"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3534" y="64.2982"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3887" y="64.7351"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3889" y="64.8321"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.415" y="64.8582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.415" y="64.9618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3891" y="64.9877"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3891" y="64.9944"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.1528" y="65.3718"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0015" y="65.3718"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0014" y="65.2695"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0013" y="65.0777"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6464" y="64.9308"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.542" y="65.0352"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4704" y="65.1067"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4298" y="65.1473"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.386" y="65.2529"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.386" y="65.2974"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3808" y="65.2976"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3191" y="65.2975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2751" y="65.3414"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1617" y="65.4549"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1211" y="65.4956"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0775" y="65.5391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0774" y="65.6013"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0775" y="65.7618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0776" y="65.8192"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.0775" y="65.8809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1214" y="65.9249"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2349" y="66.0383"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2756" y="66.0789"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3191" y="66.1225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3813" y="66.1226"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5417" y="66.1225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5991" y="66.1224"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6609" y="66.1225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7048" y="66.0786"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7353" y="66.0482"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.1528" y="66.0482"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3828" y="66.4156"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3893" y="66.426"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" backoff="1"
			 connectPad="Thermal"
			 lineWidth="0.1" lineClr="1.6" minSquare="0.01" deleteUnconnected="on" state="Poured">
				<LayerRef name="INT_PWR"/>
				<NetRef name="1V35"/>
				<ThermalPad>
					<Thermal spokeNum="4" minSpokeNum="1" angle="45" spokeWidth="0.381" backoff="1"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="135.2163" y="72.0677"/>
						<SegmentLine>
							<End x="135.2163" y="62.2186"/>
						</SegmentLine>
						<SegmentLine>
							<End x="125.8919" y="62.2186"/>
						</SegmentLine>
						<SegmentLine>
							<End x="125.8919" y="72.0677"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="127.9618" y="63.985"/>
							<SegmentLine>
								<End x="128.035" y="64.0582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.035" y="64.1618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.9618" y="64.235"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8582" y="64.235"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.785" y="64.1618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.785" y="64.0397"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7644" y="63.9648"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5641" y="63.629"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5269" y="63.5665"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5525" y="63.5409"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5525" y="63.5159"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5814" y="63.5449"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.6949" y="63.6583"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7069" y="63.6702"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8109" y="63.8447"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8498" y="63.9099"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.9353" y="63.9585"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
					<Island>
						<FilledContour>
							<Start x="126.4044" y="65.6278"/>
							<SegmentLine>
								<End x="126.435" y="65.6585"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4349" y="65.7619"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3616" y="65.835"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.2581" y="65.8349"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.185" y="65.7618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.185" y="65.6582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.2156" y="65.6275"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.2593" y="65.5218"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.2593" y="65.0984"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.2157" y="64.9927"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.185" y="64.9615"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.185" y="64.8582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.2984" y="64.7448"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3281" y="64.7152"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4125" y="64.6311"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4125" y="64.5225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4778" y="64.5225"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7175" y="64.2828"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7175" y="64.3309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7436" y="64.357"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6657" y="64.4724"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6606" y="64.48"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4839" y="64.7424"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4599" y="64.7781"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4354" y="64.8583"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.435" y="64.8598"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.435" y="64.9618"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4044" y="64.9925"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3607" y="65.0982"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3606" y="65.4647"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.3606" y="65.5221"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
					<Island>
						<FilledContour>
							<Start x="126.7611" y="63.9456"/>
							<SegmentLine>
								<End x="126.7194" y="63.9872"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7194" y="63.9391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4778" y="63.6975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.1779" y="63.6975"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.1385" y="63.6025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4609" y="63.6025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7025" y="63.3609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7025" y="63.0191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.4609" y="62.7775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.1191" y="62.7775"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8919" y="63.0047"/>
							</SegmentLine>
							<SegmentLine>
								<End x="125.8919" y="62.2186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.757" y="62.2186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6301" y="62.3455"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.6301" y="62.6873"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.8717" y="62.9289"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.2135" y="62.9289"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4551" y="62.6873"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.4551" y="62.3455"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3282" y="62.2186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.4623" y="62.2186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3669" y="62.314"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3669" y="62.6558"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.5786" y="62.8675"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.4391" y="62.8675"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3399" y="62.9667"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3189" y="62.9454"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.1467" y="62.9433"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.1209" y="62.9175"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.0587" y="62.9174"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8982" y="62.9175"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.8408" y="62.9176"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7791" y="62.9175"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.7351" y="62.9614"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.6217" y="63.0749"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5811" y="63.1156"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5375" y="63.1591"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.5375" y="63.1841"/>
							</SegmentLine>
							<SegmentLine>
								<End x="127.3109" y="62.9575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.9691" y="62.9575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7275" y="63.1991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7275" y="63.5409"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.817" y="63.6304"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.7738" y="63.6764"/>
							</SegmentLine>
							<SegmentLine>
								<End x="126.789" y="63.9177"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
					<Island>
						<FilledContour>
							<Start x="133.4382" y="65.585"/>
							<SegmentLine>
								<End x="133.4401" y="65.583"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.513" y="65.5802"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6736" y="65.4131"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6736" y="65.3101"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7139" y="65.2696"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.714" y="65.3721"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7142" y="65.4912"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.8827" y="65.6594"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.1528" y="65.6593"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2271" y="65.6593"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3572" y="65.5872"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6268" y="65.1566"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6589" y="65.1244"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7025" y="65.0809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7026" y="65.0187"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7025" y="64.8582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7024" y="64.8008"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7025" y="64.7391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6753" y="64.7119"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6451" y="64.3382"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6589" y="64.3244"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7025" y="64.2809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7026" y="64.2187"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7025" y="64.0582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7024" y="64.0008"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7025" y="63.9391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6586" y="63.8951"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.5451" y="63.7817"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.5044" y="63.7411"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.4834" y="63.72"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6725" y="63.5309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6725" y="63.1891"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.4309" y="62.9475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0891" y="62.9475"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.8475" y="63.1891"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.8475" y="63.5309"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0665" y="63.75"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0464" y="63.7701"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.9706" y="63.7466"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.9357" y="63.6798"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6554" y="63.486"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6192" y="63.461"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5357" y="63.435"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4382" y="63.435"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4074" y="63.4043"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3017" y="63.3606"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.9352" y="63.3607"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.8778" y="63.3608"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.7721" y="63.4046"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.7417" y="63.435"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.6382" y="63.435"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.6074" y="63.4043"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.5017" y="63.3606"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.1352" y="63.3607"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0778" y="63.3608"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.9721" y="63.4046"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.9417" y="63.435"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.8382" y="63.435"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.7344" y="63.3312"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.6883" y="63.2512"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.6167" y="63.2097"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.4731" y="63.1264"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.4266" y="63.1532"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2309" y="62.9575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8891" y="62.9575"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.7125" y="63.1341"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.7125" y="63.1291"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.4709" y="62.8875"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.1291" y="62.8875"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.8875" y="63.1291"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.8875" y="63.218"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6411" y="63.3203"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6411" y="63.3275"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6412" y="63.4312"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.5681" y="63.5043"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.4645" y="63.5043"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.3771" y="63.4169"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.3208" y="63.3138"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1698" y="63.2169"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0846" y="63.1622"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0225" y="63.1689"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0225" y="63.1091"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.8108" y="62.8974"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.9503" y="62.8974"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1919" y="62.6558"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1919" y="62.314"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.0965" y="62.2186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.478" y="62.2186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.3475" y="62.3491"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.3475" y="62.6909"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.5891" y="62.9325"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.9309" y="62.9325"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1725" y="62.6909"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.1725" y="62.3491"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.042" y="62.2186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.8875" y="62.2186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.8875" y="62.5609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.1291" y="62.8025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.4709" y="62.8025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7125" y="62.5609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7125" y="62.2186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="135.2163" y="62.2186"/>
							</SegmentLine>
							<SegmentLine>
								<End x="135.2163" y="72.0677"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3808" y="72.0677"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.3808" y="71.8305"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.4796" y="71.8305"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.672" y="71.8303"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.8187" y="71.4752"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.7583" y="71.4149"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.685" y="71.3417"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.6851" y="71.2381"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.7582" y="71.165"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.8618" y="71.165"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.9348" y="71.238"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.9348" y="71.2496"/>
							</SegmentLine>
							<SegmentLine>
								<End x="128.9925" y="71.3685"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.1995" y="71.5328"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.2546" y="71.588"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.2952" y="71.6287"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.3391" y="71.6725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.5618" y="71.6725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6192" y="71.6724"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.6809" y="71.6725"/>
							</SegmentLine>
							<SegmentLine>
								<End x="129.704" y="71.6493"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8532" y="71.6566"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.8791" y="71.6825"/>
							</SegmentLine>
							<SegmentLine>
								<End x="130.9413" y="71.6826"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.1018" y="71.6825"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.1592" y="71.6824"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2209" y="71.6825"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.2487" y="71.6547"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.7813" y="71.6026"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.8197" y="71.6026"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.9418" y="71.6025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="131.9992" y="71.6024"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.0609" y="71.6025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.1049" y="71.5586"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.1473" y="71.5162"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.1483" y="71.5155"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.3565" y="71.3774"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4167" y="71.3375"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.4758" y="71.2274"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.485" y="71.2182"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.5584" y="71.145"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.6618" y="71.1449"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.6905" y="71.1735"/>
							</SegmentLine>
							<SegmentLine>
								<End x="132.7974" y="71.217"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.2453" y="71.2121"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3017" y="71.2115"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4057" y="71.1677"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4383" y="71.135"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6517" y="71.135"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7026" y="71.1257"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2809" y="70.9074"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2841" y="70.9063"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2959" y="70.9024"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2992" y="70.9024"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3609" y="70.9025"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.4049" y="70.8586"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.5183" y="70.7451"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.5589" y="70.7044"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6025" y="70.6609"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6026" y="70.5987"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6025" y="70.4382"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6024" y="70.3808"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6025" y="70.3191"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.5992" y="70.3159"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6252" y="69.9051"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6256" y="69.8991"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6525" y="69.8709"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6526" y="69.8087"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6525" y="69.6482"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6524" y="69.5908"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6525" y="69.5291"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6086" y="69.4851"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.5133" y="69.3898"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3849" y="69.2243"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3053" y="69.1217"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.0462" y="69.1054"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6992" y="69.4525"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6586" y="69.4932"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6149" y="69.5989"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6148" y="69.642"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5416" y="69.715"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4381" y="69.7149"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.365" y="69.6416"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.365" y="69.5382"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5741" y="69.3291"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5741" y="69.2325"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6509" y="69.2325"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.8925" y="68.9909"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.8925" y="68.6491"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6509" y="68.4075"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5641" y="68.4075"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5641" y="68.3209"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4383" y="68.1949"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.365" y="68.1216"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3651" y="68.0181"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4384" y="67.945"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5418" y="67.945"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.615" y="68.0182"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6453" y="68.0486"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.9286" y="68.0095"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.64" y="66.7433"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6589" y="66.7244"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7025" y="66.6809"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7026" y="66.6187"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7025" y="66.4582"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7024" y="66.4008"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.7025" y="66.3391"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6586" y="66.2951"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.6266" y="66.2632"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.3965" y="65.8956"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.357" y="65.8326"/>
							</SegmentLine>
							<SegmentLine>
								<End x="134.2269" y="65.7606"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.7353" y="65.7607"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.6784" y="65.7607"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5727" y="65.8043"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.5415" y="65.835"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.4381" y="65.8349"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.365" y="65.7616"/>
							</SegmentLine>
							<SegmentLine>
								<End x="133.3651" y="65.6581"/>
							</SegmentLine>
						</FilledContour>
						<Voids/>
					</Island>
				</Islands>
			</Copper>
			<Copper priority="50" backoff="1"
			 connectPad="Thermal"
			 lineWidth="0.1" lineClr="1.6" minSquare="0.01" deleteUnconnected="on" state="Poured">
				<LayerRef name="INT_PWR"/>
				<NetRef name="EMI_1V8"/>
				<ThermalPad>
					<Thermal spokeNum="4" minSpokeNum="1" angle="45" spokeWidth="0.381" backoff="1"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<FilledContour>
						<Start x="137.6844" y="55.4723"/>
						<SegmentLine>
							<End x="137.6844" y="44.4277"/>
						</SegmentLine>
						<SegmentLine>
							<End x="120.287" y="44.4277"/>
						</SegmentLine>
						<SegmentLine>
							<End x="120.287" y="55.4723"/>
						</SegmentLine>
					</FilledContour>
				</Shape>
				<Voids/>
				<Islands>
					<Island>
						<FilledContour>
							<Start x="120.287" y="55.4723"/>
							<SegmentLine>
								<End x="120.287" y="44.4277"/>
							</SegmentLine>
							<SegmentLine>
								<End x="137.6844" y="44.4277"/>
							</SegmentLine>
							<SegmentLine>
								<End x="137.6844" y="55.4723"/>
							</SegmentLine>
						</FilledContour>
						<Voids>
							<FilledContour>
								<Start x="124.4325" y="54.0307"/>
								<SegmentLine>
									<End x="124.4325" y="54.0291"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.1909" y="53.7875"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.8491" y="53.7875"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.6075" y="54.0291"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.6075" y="54.3709"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.8491" y="54.6125"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.1909" y="54.6125"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.4325" y="54.3709"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.4325" y="54.2493"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.375" y="54.1918"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.375" y="54.0882"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="135.4293" y="48.0625"/>
								<SegmentLine>
									<End x="135.6409" y="48.0625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.8825" y="47.8209"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.8825" y="47.4791"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.6409" y="47.2375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.2991" y="47.2375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.0575" y="47.4791"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.0575" y="47.8209"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.2849" y="48.0483"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.2982" y="48.035"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.4018" y="48.035"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="134.9469" y="52.6897"/>
								<SegmentLine>
									<End x="134.9469" y="52.6515"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.7053" y="52.4099"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.3635" y="52.4099"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.1219" y="52.6515"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.1219" y="52.9933"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.3635" y="53.2349"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.7053" y="53.2349"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.8975" y="53.0427"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.8975" y="53.0809"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.1391" y="53.3225"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.4809" y="53.3225"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.7225" y="53.0809"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.7225" y="52.7391"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.4809" y="52.4975"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.1391" y="52.4975"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="133.28" y="53.0534"/>
								<SegmentLine>
									<End x="133.5091" y="53.2825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.8509" y="53.2825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.0925" y="53.0409"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.0925" y="52.6991"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.8509" y="52.4575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.5091" y="52.4575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.3" y="52.6666"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.0834" y="52.45"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.2825" y="52.2509"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.2825" y="51.9091"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.1234" y="51.75"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.3325" y="51.5409"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.3325" y="51.1991"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.0909" y="50.9575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.7491" y="50.9575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.5075" y="51.1991"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.5075" y="51.5409"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.6666" y="51.7"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.46" y="51.9066"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.2309" y="51.6775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.8891" y="51.6775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.685" y="51.8816"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.4609" y="51.6575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.1191" y="51.6575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.925" y="51.8516"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.6909" y="51.6175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.3491" y="51.6175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.1075" y="51.8591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.1075" y="51.8641"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.8809" y="51.6375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.5391" y="51.6375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.2975" y="51.8791"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.2975" y="52.2209"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.5266" y="52.45"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.2875" y="52.6891"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.2875" y="53.0309"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.5166" y="53.26"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.2975" y="53.4791"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.2975" y="53.8209"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.5391" y="54.0625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.8809" y="54.0625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.1225" y="53.8209"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.1225" y="53.4791"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.8934" y="53.25"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.06" y="53.0834"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.2991" y="53.3225"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.6409" y="53.3225"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.875" y="53.0884"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.0891" y="53.3025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.4309" y="53.3025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.6725" y="53.0609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.6725" y="52.7191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.4359" y="52.4825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.4609" y="52.4825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.665" y="52.2784"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.8891" y="52.5025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.2309" y="52.5025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.47" y="52.2634"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.6866" y="52.48"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.4875" y="52.6791"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.4875" y="53.0209"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.7291" y="53.2625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.0709" y="53.2625"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="127.78" y="53.0334"/>
								<SegmentLine>
									<End x="127.9991" y="53.2525"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.3409" y="53.2525"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.5825" y="53.0109"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.5825" y="52.6691"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.3434" y="52.43"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.5425" y="52.2309"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.5425" y="51.8891"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.3009" y="51.6475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.9591" y="51.6475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.75" y="51.8566"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.5109" y="51.6175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.1691" y="51.6175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.9275" y="51.8591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.9275" y="52.2009"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.1691" y="52.4425"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.5109" y="52.4425"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.72" y="52.2334"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.9566" y="52.47"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.76" y="52.6666"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.5409" y="52.4475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.1991" y="52.4475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.9575" y="52.6891"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.9575" y="53.0309"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.1991" y="53.2725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.5409" y="53.2725"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="126.1625" y="52.7341"/>
								<SegmentLine>
									<End x="126.1625" y="52.6491"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.9209" y="52.4075"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.5791" y="52.4075"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.35" y="52.6366"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.1509" y="52.4375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.1259" y="52.4375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.3225" y="52.2409"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.3225" y="51.8991"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.0809" y="51.6575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.7391" y="51.6575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.4975" y="51.8991"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.4975" y="52.2409"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.7391" y="52.4825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.7641" y="52.4825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.58" y="52.6666"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.3909" y="52.4775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.0491" y="52.4775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.8075" y="52.7191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.8075" y="53.0609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.0491" y="53.3025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.3909" y="53.3025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.62" y="53.0734"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.8091" y="53.2625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.1509" y="53.2625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.38" y="53.0334"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.5791" y="53.2325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.9209" y="53.2325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.1075" y="53.0459"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.1075" y="53.1309"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.3491" y="53.3725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.6909" y="53.3725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.9325" y="53.1309"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.9325" y="52.7891"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.6909" y="52.5475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.3491" y="52.5475"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="126.8725" y="51.9191"/>
								<SegmentLine>
									<End x="126.6309" y="51.6775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.2891" y="51.6775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.0475" y="51.9191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.0475" y="52.2609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.2891" y="52.5025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.6309" y="52.5025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.8725" y="52.2609"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="132.6666" y="48.49"/>
								<SegmentLine>
									<End x="132.5075" y="48.6491"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.5075" y="48.9909"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.7491" y="49.2325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.0909" y="49.2325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.3325" y="48.9909"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.3325" y="48.6491"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.1134" y="48.43"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.2725" y="48.2709"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.2725" y="47.9291"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.1134" y="47.77"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.3425" y="47.5409"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.3425" y="47.4826"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.5675" y="47.7076"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.9093" y="47.7076"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.1075" y="47.5094"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.1075" y="47.5309"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.3491" y="47.7725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.6909" y="47.7725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.9325" y="47.5309"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.9325" y="47.1891"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.6909" y="46.9475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.3491" y="46.9475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.1509" y="47.1457"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.1509" y="47.1242"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.9093" y="46.8826"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.5675" y="46.8826"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.3259" y="47.1242"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.3259" y="47.1825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.1009" y="46.9575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.7591" y="46.9575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.5525" y="47.1641"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.5525" y="47.1591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.3109" y="46.9175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.9691" y="46.9175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.7275" y="47.1591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.7275" y="47.5009"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.9519" y="47.7253"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.7181" y="47.9591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.7181" y="48.3009"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.9597" y="48.5425"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.3015" y="48.5425"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.5103" y="48.3337"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="131.3825" y="48.8391"/>
								<SegmentLine>
									<End x="131.1409" y="48.5975"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.7991" y="48.5975"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.5575" y="48.8391"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.5575" y="49.1809"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.7991" y="49.4225"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.1409" y="49.4225"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.3825" y="49.1809"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="130.93" y="48.3334"/>
								<SegmentLine>
									<End x="131.0991" y="48.5025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.4409" y="48.5025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.6825" y="48.2609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.6825" y="47.9191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.4409" y="47.6775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.0991" y="47.6775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.87" y="47.9066"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.7009" y="47.7375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.3591" y="47.7375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.1425" y="47.9541"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.1425" y="47.9291"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.9184" y="47.705"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.1225" y="47.5009"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.1225" y="47.1591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.8809" y="46.9175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.5391" y="46.9175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.2975" y="47.1591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.2975" y="47.5009"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.5216" y="47.725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.3175" y="47.9291"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.3175" y="48.2709"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.5591" y="48.5125"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.9009" y="48.5125"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.1175" y="48.2959"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.1175" y="48.3209"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.3591" y="48.5625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="130.7009" y="48.5625"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="128.1225" y="48.8491"/>
								<SegmentLine>
									<End x="127.8809" y="48.6075"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.5391" y="48.6075"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.2975" y="48.8491"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.2975" y="49.1909"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.5391" y="49.4325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.8809" y="49.4325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.1225" y="49.1909"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="126.925" y="48.3484"/>
								<SegmentLine>
									<End x="127.1591" y="48.5825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.5009" y="48.5825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.7425" y="48.3409"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.7425" y="47.9991"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.5009" y="47.7575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.1591" y="47.7575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.935" y="47.9816"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.7009" y="47.7475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.3591" y="47.7475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.1175" y="47.9891"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.1175" y="48.3309"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.3591" y="48.5725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.7009" y="48.5725"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="125.1625" y="48.8091"/>
								<SegmentLine>
									<End x="124.9209" y="48.5675"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.5791" y="48.5675"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.3375" y="48.8091"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.3375" y="49.1509"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.5791" y="49.3925"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.9209" y="49.3925"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.1625" y="49.1509"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="128.5925" y="47.8891"/>
								<SegmentLine>
									<End x="128.3509" y="47.6475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.0091" y="47.6475"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.7675" y="47.8891"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.7675" y="48.2309"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.0091" y="48.4725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.3509" y="48.4725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.5925" y="48.2309"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="126.8925" y="47.1291"/>
								<SegmentLine>
									<End x="126.6509" y="46.8875"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.3091" y="46.8875"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.0675" y="47.1291"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.0675" y="47.4709"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.3091" y="47.7125"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.6509" y="47.7125"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.8925" y="47.4709"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="124.5542" y="47.5492"/>
								<SegmentLine>
									<End x="124.7675" y="47.7625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.1093" y="47.7625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.3509" y="47.5209"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.3509" y="47.1791"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.1093" y="46.9375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.7675" y="46.9375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.5742" y="47.1308"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.3609" y="46.9175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.0191" y="46.9175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.7775" y="47.1591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.7775" y="47.5009"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.0191" y="47.7425"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.3609" y="47.7425"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="135.7425" y="48.6491"/>
								<SegmentLine>
									<End x="135.5009" y="48.4075"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.1591" y="48.4075"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.9175" y="48.6491"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.9175" y="48.9909"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.1591" y="49.2325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.5009" y="49.2325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.7425" y="48.9909"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="135.1416" y="51.685"/>
								<SegmentLine>
									<End x="134.9175" y="51.9091"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.9175" y="52.2509"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.1591" y="52.4925"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.5009" y="52.4925"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.7425" y="52.2509"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.7425" y="51.9091"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.5584" y="51.725"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.7825" y="51.5009"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.7825" y="51.1591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.5409" y="50.9175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="135.1991" y="50.9175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.9575" y="51.1591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="134.9575" y="51.5009"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="129.4825" y="46.2491"/>
								<SegmentLine>
									<End x="129.2409" y="46.0075"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.8991" y="46.0075"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.6575" y="46.2491"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.6575" y="46.5909"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.8991" y="46.8325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.2409" y="46.8325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="129.4825" y="46.5909"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="127.7825" y="47.0691"/>
								<SegmentLine>
									<End x="127.5409" y="46.8275"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.1991" y="46.8275"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.9575" y="47.0691"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.9575" y="47.4109"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.1991" y="47.6525"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.5409" y="47.6525"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.7825" y="47.4109"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="128.4525" y="53.5391"/>
								<SegmentLine>
									<End x="128.2109" y="53.2975"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.8691" y="53.2975"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.6275" y="53.5391"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.6275" y="53.8809"/>
								</SegmentLine>
								<SegmentLine>
									<End x="127.8691" y="54.1225"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.2109" y="54.1225"/>
								</SegmentLine>
								<SegmentLine>
									<End x="128.4525" y="53.8809"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="126.1525" y="46.3391"/>
								<SegmentLine>
									<End x="125.9109" y="46.0975"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.5691" y="46.0975"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.3275" y="46.3391"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.3275" y="46.6809"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.5691" y="46.9225"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.9109" y="46.9225"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.1525" y="46.6809"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="124.5425" y="46.3191"/>
								<SegmentLine>
									<End x="124.3009" y="46.0775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.9591" y="46.0775"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.7175" y="46.3191"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.7175" y="46.6609"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.9591" y="46.9025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.3009" y="46.9025"/>
								</SegmentLine>
								<SegmentLine>
									<End x="124.5425" y="46.6609"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="132.6825" y="46.2791"/>
								<SegmentLine>
									<End x="132.4409" y="46.0375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.0991" y="46.0375"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.8575" y="46.2791"/>
								</SegmentLine>
								<SegmentLine>
									<End x="131.8575" y="46.6209"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.0991" y="46.8625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.4409" y="46.8625"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.6825" y="46.6209"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="133.8125" y="45.7291"/>
								<SegmentLine>
									<End x="133.5709" y="45.4875"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.2291" y="45.4875"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.9875" y="45.7291"/>
								</SegmentLine>
								<SegmentLine>
									<End x="132.9875" y="46.0709"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.2291" y="46.3125"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.5709" y="46.3125"/>
								</SegmentLine>
								<SegmentLine>
									<End x="133.8125" y="46.0709"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="126.4825" y="50.6991"/>
								<SegmentLine>
									<End x="126.2409" y="50.4575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.8991" y="50.4575"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.6575" y="50.6991"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.6575" y="51.0409"/>
								</SegmentLine>
								<SegmentLine>
									<End x="125.8991" y="51.2825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.2409" y="51.2825"/>
								</SegmentLine>
								<SegmentLine>
									<End x="126.4825" y="51.0409"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="123.2125" y="52.2591"/>
								<SegmentLine>
									<End x="122.9709" y="52.0175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.6291" y="52.0175"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.3875" y="52.2591"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.3875" y="52.6009"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.6291" y="52.8425"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.9709" y="52.8425"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.2125" y="52.6009"/>
								</SegmentLine>
							</FilledContour>
							<FilledContour>
								<Start x="123.8225" y="49.4491"/>
								<SegmentLine>
									<End x="123.5809" y="49.2075"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.2391" y="49.2075"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.9975" y="49.4491"/>
								</SegmentLine>
								<SegmentLine>
									<End x="122.9975" y="49.7909"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.2391" y="50.0325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.5809" y="50.0325"/>
								</SegmentLine>
								<SegmentLine>
									<End x="123.8225" y="49.7909"/>
								</SegmentLine>
							</FilledContour>
						</Voids>
					</Island>
				</Islands>
			</Copper>
		</Coppers>
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
		<View scale="23.0595" scrollHorz="129.1933" scrollVert="59.8528"/>
		<ActiveLayer name="Int 1"/>
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
				<LayerRef name="Int 1"/>
				<Colors details="#075f78" pads="#054c60" fix="#043948"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Int 2"/>
				<Colors details="#ce7946" pads="#a46038" fix="#7b482a"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="INT_GND"/>
				<Colors details="#9b550f" pads="#7c440c" fix="#5d3309"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Int 3"/>
				<Colors details="#318aa4" pads="#276e83" fix="#1d5262"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="INT_PWR"/>
				<Colors details="#95b535" pads="#77902a" fix="#596c1f"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Int 4"/>
				<Colors details="#3a5ec5" pads="#2e4b9d" fix="#223876"/>
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