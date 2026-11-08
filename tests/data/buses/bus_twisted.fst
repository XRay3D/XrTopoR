<?xml version="1.0" encoding="UTF-8"?>

<!--********************************************-->
<!--   File    : bus_twisted.fst-->
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
		<OriginalFile>.\bus_twisted.fst</OriginalFile>
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
		</Packages>
	</LocalLibrary>

	<Constructive version="1.2">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.1">
					<Polyline>
						<Start x="0" y="0"/>
						<SegmentLine>
							<End x="70" y="0"/>
						</SegmentLine>
						<SegmentLine>
							<End x="70" y="-58.1"/>
						</SegmentLine>
						<SegmentLine>
							<End x="0" y="-58.1"/>
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
				<Org x="10" y="-10"/>
			</CompInstance>
			<CompInstance name="J2" uniqueId="AAAAAAAB" side="Top">
				<ComponentRef name="J2"/>
				<FootprintRef name="J2"/>
				<Org x="60" y="-10"/>
			</CompInstance>
		</Components>
	</ComponentsOnBoard>

	<NetList version="2.0">
		<Net name="D0">
			<PinRef compName="J1" pinName="1"/>
			<PinRef compName="J2" pinName="16"/>
		</Net>
		<Net name="D1">
			<PinRef compName="J1" pinName="2"/>
			<PinRef compName="J2" pinName="15"/>
		</Net>
		<Net name="D2">
			<PinRef compName="J1" pinName="3"/>
			<PinRef compName="J2" pinName="14"/>
		</Net>
		<Net name="D3">
			<PinRef compName="J1" pinName="4"/>
			<PinRef compName="J2" pinName="13"/>
		</Net>
		<Net name="D4">
			<PinRef compName="J1" pinName="5"/>
			<PinRef compName="J2" pinName="12"/>
		</Net>
		<Net name="D5">
			<PinRef compName="J1" pinName="6"/>
			<PinRef compName="J2" pinName="11"/>
		</Net>
		<Net name="D6">
			<PinRef compName="J1" pinName="7"/>
			<PinRef compName="J2" pinName="10"/>
		</Net>
		<Net name="D7">
			<PinRef compName="J1" pinName="8"/>
			<PinRef compName="J2" pinName="9"/>
		</Net>
		<Net name="D8">
			<PinRef compName="J1" pinName="9"/>
			<PinRef compName="J2" pinName="8"/>
		</Net>
		<Net name="D9">
			<PinRef compName="J1" pinName="10"/>
			<PinRef compName="J2" pinName="7"/>
		</Net>
		<Net name="D10">
			<PinRef compName="J1" pinName="11"/>
			<PinRef compName="J2" pinName="6"/>
		</Net>
		<Net name="D11">
			<PinRef compName="J1" pinName="12"/>
			<PinRef compName="J2" pinName="5"/>
		</Net>
		<Net name="D12">
			<PinRef compName="J1" pinName="13"/>
			<PinRef compName="J2" pinName="4"/>
		</Net>
		<Net name="D13">
			<PinRef compName="J1" pinName="14"/>
			<PinRef compName="J2" pinName="3"/>
		</Net>
		<Net name="D14">
			<PinRef compName="J1" pinName="15"/>
			<PinRef compName="J2" pinName="2"/>
		</Net>
		<Net name="D15">
			<PinRef compName="J1" pinName="16"/>
			<PinRef compName="J2" pinName="1"/>
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
