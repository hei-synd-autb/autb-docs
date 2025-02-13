<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

*The table below is given for information purposes only.*

# Piping and Instrumentation Diagram, *P&ID*

|Letter	|Column 1 Measured value	|Column 2 Modifier|Column 3 Readout/passive function |Column 4 Output/active function |Column 5 Function modifier|
|-------|---------------------------|-----------------|----------------------------------|--------------------------------|--------------------------|
|A	    |Analysis                   |                 |Alarm                             | ||		
|B	    |Burner, combustion         |                 |User choice	                     | |User choice	|User choice|
|C	    |User's choice (usually conductivity)|		  |                                  |Control	                      |Close|
|D	    |User's choice (usually density)|	Difference			Deviation
|E	    |Voltage		            |                 |Sensor	                         | ||	
|F	    |Flow rate                  |Ratio            ||||			
|G	    |User's choice (usually gaging/gauging)|	Gas|	Glass/gauge/viewing|||		
|H	    |Hand                       ||||				High|
|I	    |Current		||Indicate	|||	
|J	    |Power	|Scan||||			
|K	    |Time, time schedule|	Time rate of change||		Control station	||
|L	    |Level		||Light		||Low|
|M	    |User's choice||||				Middle / intermediate|
|N	    |User's choice (usually torque)||		User choice|	User choice|	User choice|
|O	    |User's choice||		Orifice||		Open|
|P	    |Pressure||		Point/test connection|||		
|Q	    |Quantity|	Totalize/integrate|	Totalize/integrate	|||	
|R	    |Radiation||		Record	||	Run|
|S	    |Speed, frequency|	Safety||		Switch|	Stop|
|T	    |Temperature|||			Transmit|	
|U	    |Multivariable	||	Multifunction|	Multifunction	|
|V	    |Vibration, mechanical analysis|||			Valve or damper	||
|W	    |Weight, force	||	Well or probe	|||	
|X	    |User's choice (usually on-off valve as XV)|	X-axis	|Accessory devices, unclassified|	Unclassified|	Unclassified|
|Y	    |Event, state, presence|	Y-axis||		Auxiliary devices||	
|Z	    |Position, dimension|	Z-axis or Safety Instrumented System||		Actuator, driver or unclassified final control element||

## Examples
| 	              |Propriété mesurée|Indication|	Transmission|Enregistrement|Régulation|	Indication et régulation|Enregistrement et régulation|
|-----------------|-----------------|----------|-------------|--------------|----------|-------------------------|----------------------------|     
|Débit (Flow rate)|F|	FI|	FT|	FR|	FC|	FIC|	FRC|
|Niveau (Level)   |	L|	LI|	LT	|LR|LC|	LIC|	LRC|
|Pression (Pressure)|	P|	PI|	PT|	PR	|PC	|PIC|	PRC|
|Analyse qualitative (Quality)|	Q|QI	|QT	|QR	|QC	|QIC|	QRC|
|Radiation (Radiation)|	R	|RI	|RT	|RR	|RC	|RIC|	RRC|
|Température (Temperature)|	T|	TI	|TT|	TR|	TC|	TIC|	TRC|
|Poids (Weight)|	W|	WI|	WT	|WR|	WC|	WIC|	WRC|
|Autre propriété, à spécifier dans une note|	X|	XI|	XT|	XR|	XC|	XIC|	XRC|
