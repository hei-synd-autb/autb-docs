<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)


*Keywords:* **GIT TortoiseGIT ctrlX Codesys VSCode Notepad++ UAExpert**

# Connect your PC to the automation box
You need a RJ45 port port TCP/IP.
You must configure this port with the same subnet as the ctrlX Core: 192.168.0.200.
These ports are reserved:
-   192.168.0.1
-   192.168.0.2
-   192.168.0.33
-   192.168.0.10

For exemple: 192.168.0.**61**

> Connection of your PC to a device is a basic knowledge. If you do not know the commands **ping** and **ipconfig** learn them by heart.

> Passwords for automation boxes are not disclosed on GitHub...

# List of software for Automation Box
This is the list of softwares needed on the development PC.

> This list is for information and can help you in your work, but as the correct installation of some software, especially ctrlX Works, can depend of your hardware, **we do not give any support for this insallation**.

# Version control

## GIT
*Version of git while writing this document:* **2.42.0**

> Git is a distributed version control system that tracks changes in any set of computer files.

Git can be used in command line in a **Command Prompt** or **Windows PowerShell**

```
git --version
```
<figure>
    <img src="img/Windows PowerShell Git version.png"
         alt="Windows PowerShell Git version">
    <figcaption>Windows PowerShell Git version</figcaption>
</figure>

## Tortoise GIT
*Version of TortoiseGIT while writing this document:* **2.14.0**

> TortoiseGit provides overlay icons showing the file status.

TortoiseGit  provides a graphical user interface GUI for GIT.

# IEC 61131-3 programming environment

> A **Programming Environment** is the collection of tools used in the development of software. In a general sense, a programming environment combines hardware and software that allows a developer to build applications. Developers typically work in integrated development environments or  **Integrated Development Environment** IDEs.

## ctrlX WORKS
*Version of ctrlX WORKS :* **1.16.0**, *update info on january 2024*.

> Please, ask a lab manager for the current version of ctrlX Works.

### ctrlX WORKS installation
When installing ctrlX Works V1.16 on PCs of HEVS, it is very important to exit temporarily the anti-virus, else the installation is partial and the system will not run correctly

The anti-virus prohibit the installation of many libraries of the IDE.

<figure>
    <img src="./img/Exit Kaspersky.png"
         alt="Exit Kaspersky.png">
    <figcaption>Select icon Kaspersky then rigth-click Exit</figcaption>
</figure>


ctrlX WORKS is a suite of software for ctrlX Core hardware. It includes the following Engineering Tools:

## ctrlX WORKS - Device Management

<figure>
    <img src="./img/ctrlX WORKS Engineering.png"
         alt="ctrlX WORKS - Device Management">
    <figcaption>ctrlX WORKS - Device Management</figcaption>
</figure>

### ctrlX PLC Engineering

<figure>
    <img src="./img/ctrlX PLC Engineering.png"
         alt="ctrlX PLC Engineering">
    <figcaption>ctrlX PLC Engineering</figcaption>
</figure>

> ctrlX PLC Engineering is the main tool used in the automation basis. The IEC61131-3 language and compiler are based on 

The ctrlX PLC Engineering is a programming environment for creating software applications according to the IEC 61131-3 standard. The development environment provides a variety of convenient engineering functions for development work, such as:

- Editors for FBD, LAD, STL, ST, AS, in addition the variants CFC and extended CFC
- Support of object-oriented programming
- Comprehensive project comparison, also for graphic editors
- Library concept for easy reuse of application code
- Debugging and online properties for optimizing the application code and for accelerating testing and commissioning
- Security properties to protect the source code and the operation of the controller

### Codeys Inside
ctrlX PLC Engineering is based on [Codesys](https://www.codesys.com/).
<figure>
    <img src="img/Codesys Logo.png"
         alt="Codesys Logo">
    <figcaption>Codesys Logo</figcaption>
</figure>

> **Codesys** is a provider of PLC compilers, IDE and libraries for IEC 61131-3 programming languages. It is the basis of some of the main PLC companies like [Beckhoff](https://www.beckhoff.com), [Rexroth](https://www.boschrexroth.com), [Wago](https://www.wago.com), [Schneider Electric \(Partially\)](https://www.se.com).

> **Codesys** solution is the only well-distributed commercial solution implementing **Object-Oriented OO** extension of IEC 61131-3.

> Some companies like [Siemens](https://www.siemens.com/global/en/products/automation/industry-software/automation-software/tia-portal.html) and [Rockwell *Allen Bradley*](https://www.rockwellautomation.com/en-us/products/hardware/allen-bradley.html) do not use Codesys, but do not support OO extension of IEC 61131-3 either.

### ctrlX Drive Engineering

<figure>
    <img src="img/ctrlX IO Engineering App.png"
         alt="ctrlX IO Engineering App">
    <figcaption>ctrlX IO Engineering App</figcaption>
</figure>

### cltrX I/O Engineering

<figure>
    <img src="img/ctrlX DRIVE Engineering.png"
         alt="ctrlX DRIVE Engineering">
    <figcaption>ctrlX DRIVE Engineering</figcaption>
</figure>

# Visual Studio Code
*Version of VS Code while writing this document:* **1.82.0**

[Visual Studio Code](https://code.visualstudio.com/) is a code editor. In the context of Automation Box, this tool is mainly used as text editor for [Markdown *.MD* files](https://www.markdownguide.org). These files are used for all the GIT based documentation.

> There exist an IEC 61131-3 [Structured Text language extension](https://marketplace.visualstudio.com/items?itemName=Serhioromano.vscode-st) for VS Code. This editor is not very usefull, except maybe for code edition in documentation, because structured text files are generally encapsulated in XML headers. Making these files not directly usable.

```xml
<Implementation>
    <ST><![CDATA[CASE iState OF
    0:	(* idle *)
        IF bTest THEN

                nErrorID		:= fbUA_Disconnect.ErrorID;
                iState 			:= 0; (* idle *)
                nConnectionHdl	:= 0;
            END_IF
        END_IF
    END_CASE
]]></ST>
</Implementation>
```

# Notepad++
*Version of Notepad++ while writing this document:* **8.5.6**

[Notepad++](https://notepad-plus-plus.org) is used as a general purpose dashboard for text edition, including Structured Text.
Notepad++ includes for example an Hex editor.

<figure>
    <img src="img/NotePad++ Hex Extension.png"
         alt="NotePad++ Hex Extension">
    <figcaption>NotePad++ Hex Extension</figcaption>
</figure>

# UA Expert
*Version of TortoiseGIT while writing this document:* **1.7.0**
Automation Box is a highly connected system. The core of this connectivity is OPC UA.

> OPC Unified Architecture **OPC UA** is a machine-to-machine communication protocol used for industrial automation and developed by the [OPC Foundation](https://opcfoundation.org/about/opc-technologies/opc-ua/).

**UAExpert** form **Unified-Automation** is the most widely OPC UA Client tool to test an OPC UA server capabilities. [UaExpert is free for download with registration](https://www.unified-automation.com/products/development-tools/uaexpert.html?gclid=EAIaIQobChMI7fihktOkgQMVmZSDBx2cGgMmEAAYASAAEgKlBfD_BwE).

[Unified Automation](https://www.unified-automation.com/) is likely the provider of Software Development Kits, **SDKs** for the majority of existing OPC UA solutions.

> **OPC UA** is in constant evolution, not all servers and/or client provide all services. It depends of the needs of **Original Equipment Manufacturers OEMs**, **Off-The-Shelf Software** and versions of **SDK** used, which are very often hiden for the final user.


### Various implementations of OPC UA

The [**Institute for Control Engineering** of Machine Tools and Manufacturing Units at the **University of Stuttgart**](http://www.isw.uni-stuttgart.de/) provides [a list of libraries, tools and resources for OPC UA in various language](https://github.com/iswunistuttgart/awesome-opcua). That means you can access the Automation Box from almost any of your prefered language, but the entry point to check existing OPC UA entry points is UaExpert.

# Prosys OPC UA Monitor
A free test version is available and used as **No code** HMI for some practical works.

<figure>
    <img src="./img/ProsysOpcUaMonitorIcon.png"
         alt="Prosys Opc Ua Monitor Icon">
    <figcaption>Prosys Opc Ua Monitor Icon</figcaption>
</figure>

[Prosys OPC UA Monitor](https://www.prosysopc.com/products/opc-ua-monitor/)


## TwinCAT 3 XAE
*Version of TwinCAT XAE when writing this document:* **4.24.47**

> TwinCAT XAE e**X**tended **A**utomation **E**ngineering) allows hardware to be programmed and configured in a single engineering tool. 

TwinCAT XAE is  the IDE of Beckhoff. It is intended for PLC programming of Beckhoff devices, but as a free tools, can be used for offlline programming and simulation.

> [TwinCAT Tools](https://www.beckhoff.com/fr-ch/products/automation/twincat/) with simulator runs on main Windows based PC with enough memory and processing capability.

### Integration of TwinCAT 3 in Visual Studio
One of the great idea of Beckhoff was to integrate TwinCAT in Visual Studio at a time when the main used languages where C++/C# from Microsoft with Visual Studio IDE. It is still possible to integrate TwinCAT 3 in Visual Studio, *Visual Studio 2019 for version 4.24.47*. But unless you need to write C++ code in your TwinCAT application, I suggest to install TwinCAT as a standalone application. 

