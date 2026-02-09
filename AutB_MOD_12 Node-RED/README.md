<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

# Module 12 Node-RED
*2ème partie Flow Based Programming*

*Keywords:* **Flow / Node / Function / Context Data / Message / Payload**

<figure>
    <img src="./img/openjs_foundation-logo.svg"
         alt="openjs_foundation-logo"
         width="400">
  <figcaption>OpenJS Foundation: <a href="https://openjsf.org/">OpenJS</a></figcaption>
</figure>



# Introduction
:no_bell: *In the rest of this course, some paragraphs are marked with this symbol. This does not necessarily mean that the topic is unimportant, but rather that it will not be covered in detail.*

## Java Script
JavaScript is a high-level, interpreted programming language primarily used to create interactive effects within web browsers. It enables dynamic content, control over multimedia, animated images, and much more on web pages. JavaScript is a core technology of the World Wide Web, alongside HTML and CSS.

Originally developed for client-side scripting in browsers, JavaScript is now also widely used on the server side (notably with Node.js). It is known for its flexibility, event-driven programming model, and support for object-oriented, imperative, and functional programming styles.

**Key features:**
- Runs in all modern web browsers
- Dynamically typed and prototype-based
- Supports asynchronous programming, callbacks, promises, async/await.
- Enables DOM manipulation and event handling

**Example:**
```javascript
console.log("Hello, world!");
```

## The V8 engine
The **V8 engine** is an open-source JavaScript engine developed by Google. It is written in C++ and is used in Google Chrome and other Chromium-based browsers to execute JavaScript code. V8 compiles JavaScript directly to native machine code before executing it, which makes it extremely fast.

**Key points about V8:**
- Developed by Google for Chrome, but also used in Node.js.
- Translates JavaScript into efficient machine code using Just-In-Time (JIT) compilation.
- Provides high performance for both client-side, browsers, and server-side, Node.js JavaScript execution.
- Continuously optimized for speed and memory efficiency.

**Why is V8 important?**
V8's performance and efficiency are a major reason why JavaScript can be used for large-scale, high-performance applications, both in browsers and on servers, via Node.js.

<div align="center">
<figure>
    <img src="./img/Node_js_architecture.jpg"
         alt="Node_js_architecture.jpg"
         width="400">
  <figcaption>Node.js architecture, Source: <a href="https://www.techanicinfotech.com//">Technic Infotech</a></figcaption>
</figure>
</div>

## Node JS
> We won't be diving into Node.js in this course, but we do consider it helpful to understand the underlying framework of the environment we'll be using. This can sometimes help you understand its behavior, take advantage of its benefits, and avoid its flaws.

> We're going a little further, because in the previous module we covered **cyclic programming**, and now **asynchronous architecture** and **event-driven programming**. This is very different from what you could do by simply running Python a Python for data analysis.

> In Python, you could do some asynchonous tasks with asyncio. Not being a Python expert, I don't want to venture into this debate. 

Node.js is an open-source, cross-platform, single-threaded **runtime environment** designed for developing fast, scalable server and network applications. It runs on the V8 JavaScript engine and adopts a non-blocking, event-driven I/O architecture, making it efficient and suitable for real-time applications.

> A **runtime environment** is the underlying platform or system that provides the necessary resources and services for a program to execute. In the context of Node.js, the runtime environment includes the V8 JavaScript engine, libraries, and APIs that allow JavaScript code to run outside of a web browser, interact with the file system, network, and other system resources.

Traditionally, JavaScript only worked on the front-end, as the runtime was only available in web browsers like Google Chrome. The programming language can therefore be used to create a client-side application, much like a dynamic website.

Ryan Dahl created Node.js in 2009 as a lightweight, responsive runtime environment for JavaScript. This software allows developers to use the scripting language as server-side code.

Using server-side JavaScript allows developers to write both the front-end and back-end in the same language. This streamlines development and maintenance since they can reuse the same code.

Furthermore, developing the back-end in JavaScript allows the application to benefit from Node.js's asynchronous programming model. This architecture, at its core, allows the web service to respond more efficiently to multiple user requests.

### What means single-threaded ?
A **single-threaded** environment means that all code execution happens on one main thread of the CPU, rather than using multiple threads to run tasks in parallel.

In Node.js, this means:

- Only one operation can execute JavaScript code at a time.
- Node.js uses an event loop to handle many tasks, like I/O operations, asynchronously, so it can manage multiple connections efficiently without creating new threads for each one.
- Heavy CPU-bound tasks can block the event loop, so Node.js is best suited for I/O-bound applications.

💡 **Analogy:**  
Think of a single-threaded system like a chef, the thread, in a kitchen. The chef can only cook one dish at a time, but can start a dish, put it in the oven, I/O, and while it bakes, start preparing another dish. The chef never duplicates himself, but manages many tasks by switching between them efficiently.

⚠️ **Pitfall**
If you run long-running, CPU-intensive code in Node.js, it will block the event loop and slow down all other operations. For such tasks, consider using worker threads or moving the work outside Node.js.

> To understand how Node.js works, you need to understand the following important terms.
> - Non-blocking I/O Model
> - Asynchronous Architecture
> - Event-driven

## Non-blocking I/O Model

To process a user request, traditional servers like Apache and Tomcat use a single thread that can serve one client at a time. When the maximum number of threads is reached, a new request must wait for existing threads to complete their tasks.

Threads still processing user requests will block input from new clients and will not forward output to external services such as APIs or databases. This can lead to bottlenecks during traffic spikes with many concurrent connections.

Non-blocking paradigms mean that a single Node.js thread can receive and transmit a new request without waiting for the current request to complete. This system is called an asynchronous architecture.

## Asynchronous Architecture

A synchronous architecture processes client requests in order, meaning that the web server completes the current operation before starting a new one.

In contrast, **an application with an asynchronous architecture will begin a new operation while waiting for the results of other operations**. As soon as it receives a response, the web server returns the data to the client.

Asynchronous architecture is suitable for applications that need to retrieve data from other services, such as application programming interfaces. **API**s or **databases**. Instead of remaining idle, the web server can process new requests while waiting for responses.

While excellent for input/output, **I/O, tasks**, **this architecture makes Node.js more CPU-intensive** since it uses only a single thread to process multiple requests.

## Event-driven

In Node.js, events are signals indicating that a specific action has occurred. For example, they can trigger a **new operation** or the **completion** of a task.

**Events are an integral part of the asynchronous model**. They operate in a loop, telling Node.js how to handle the flow of requests.

When a new request is received from a client, the event loop starts. Node.js then forwards the request to the appropriate external service, such as an API. Once the server receives the data, a new event triggers a callback function.

A callback function executes another function when a specific condition or asynchronous operation is completed. It allows the web server to process requests and send responses to the client.

## Benefits of Using Node.js

Now that we understand the mechanics of Node.js, let's see how this model can benefit your web application development.

- **Speed**. Node.js's asynchronous architecture handles multiple I/O operations more efficiently, resulting in a more responsive application. It also allows for real-time execution of data.
- **Error Handling Mechanism**. Built-in error objects provide users with greater flexibility in handling many issues. They allow developers to obtain more detailed information about the error for more efficient troubleshooting and processing.
- **Development Efficiency**. Node.js allows developers to use JavaScript anywhere for comprehensive development. It facilitates development because the code runs seamlessly between the backend and frontend.
- **A Rich Ecosystem**. Users can install various modules via the Node Package Manager (NPM) to easily add new features to their Node.js applications without having to write them from scratch.
- **Flexibility and scalability**. Developers can use Node.js with other frameworks and operating systems. They can also evolve the runtime using different approaches, such as installing a load balancer or implementing microservices.
- **Open source**. The Node.js source code is accessible to all users, and its creators advocate transparency, innovation, and customization. This runtime also benefits from significant community support.

### What is Node.js written in?

Node.js is developed in C, C++, and JavaScript.

According to Wikipedia, Node.js is "a packaged compilation of Google's V8 JavaScript engine, the libuv platform abstraction layer, and a core library, primarily written in JavaScript."

The runtime internally uses Chrome V8, which is the JavaScript runtime, itself written in C++. This allows Node.js to access internal system features, such as network management.

### Node.js Architecture and Operation

Node.js relies on an architecture called a **single-threaded event loop** to handle multiple clients simultaneously. Unlike other environments like Java, which use a multi-threaded model where each client request is handled by a separate thread from a thread pool, Node.js handles all requests on a single thread via an event loop. This allows for efficient handling of multiple concurrent connections without creating a separate thread for each client, improving performance and resource utilization.

<div align="center">
<figure>
    <img src="./img/How node.js process incoming requests using the event loop.png"
         alt="How node.js process incoming requests using the event loop"
         width="400">
  <figcaption>How node.js process incoming requests using the event loop, Source: <a href="https://kinsta.com/knowledgebase/what-is-node-js/">Kinsta</a></figcaption>
</figure>
</div>


# Node-RED
<figure>
    <img src="./img/LogoNode-RED.png"
         alt="LogoNode-RED"
         width="100">
  <figcaption>Low-code programming for event-driven applications <a href="https://nodered.org/">nodered.org</a></figcaption>
</figure>


## A brief introduction to Node-RED

Node-RED is a tool for building Internet of Things, IoT, applications with a focus on simplifying the **wiring together** of code blocks to carry out tasks. It uses a visual programming approach that allows developers to connect predefined code blocks, known as **nodes**, together to perform a task. The connected nodes, usually a combination of input nodes, processing nodes and output nodes, when wired together, make up a **flow**.

Originally developed as an open source project at IBM in late 2013, to meet their need to quickly connect hardware and devices to web services and other software – as a sort of glue for the IoT – it has quickly evolved to be a general purpose IoT programming tool. Importantly, Node-RED has rapidly developed a significant and growing user base and an active developer community who are contributing new nodes that allow programmers to reuse Node-RED code for a wide variety of tasks.

Although Node-RED was originally designed to work with the Internet of Things, it has become useful for a range of applications and is now considered one of the pre-eminent low code/no code visual development tools.

> Here at the HEVS, after having tested and validated Node-RED for use a User Interface for a prototype of filtering water, we use it as User Interafce for all the labs in Automation.

## The Node-RED Interface

Node-RED is a software program for managing event flows, sequences of processing to be performed following the reception of messages or events. It contains a number of basic features, but most of the features useful in our case will need to be installed later.

In Node-RED, a "feature" is represented as a node, an element that can be placed in your flow, connected to other nodes as inputs or outputs. The flow represents all the nodes. It is not linear, and a node connected to no other can still be activated if the conditions are met.

<div align="center">
<figure>
    <img src="./img/NodeRedInABrowser.png"
         alt="Image Lost: NodeRedInABrowser.png"
         width="500">
  <figcaption>Node-RED is works in a Browser</figcaption>
</figure>
</div>

The Node-RED interface consists of four parts:

### 🔹 On the left
The list of available nodes. To place them on the flow, select the one you want and drag it to the desired location.

### 🔹 In the center
The **flows**. You can open as many as you want; each flow is independent and cannot affect others. Concretly a **flow** is a tab, it can be seen a sub program with it own variables.

### 🔹 On the right
Useful tabs.
- The i tab provides detailed information on any selected node.
- The debug tab, insect icon,  appears as soon as a debug node is placed and
allows you to view debug messages.
- The dashboard tab, graph icon, appears as soon as a dashboard node
appears and allows you to access it.
- Other tabs may appear depending on the nodes installed and placed.

### 🔹 Top
The Deploy button allows you to **deploy** your flow and make it active. The
menu button, parallel lines icon, opens a menu, which contains the following options:
- View: Manage the view, display or hide the side menus. It also allows
access to the debug or dashboard if active.
- Import: Load a saved flow
- Export: Save open flows
- Manage Palette: Manage installed nodes and install new ones
- Flows / Subflows: Create a new flow or subflow.

---


## Common nodes

Let's start with the basic nodes, common.
Here's a list of memos with a reminder, in my words, of what they do.

### Examples
There is a lot of integrated examples for each node. Looking at the examples is probably the best way to learn and understand Node-RED.

<div style="text-align: center;">
<figure>
  <img src="./img/Lot_of_examples.png"
     alt="Image lost : Lot_of_examples"
     width = "400">
  <figcaption>Load an example to understand a node !</figcaption>
</figure>
</div>

### How to load an example
Node-RED is finally only a big JSON file.

Below a first example.

:bulb: You do not have to understand the JSON code below !

```json
[
    {
        "id": "c4abe2be0fc6d270",
        "type": "group",
        "z": "3f31cf57430bd5cb",
        "name": "",
        "style": {
            "label": true
        },
        "nodes": [
            "d2b330ed93df35a0",
            "81e48eeb776da060",
            "4d5a8d75274a52cb"
        ],
        "env": [
            {
                "name": "This_Group",
                "value": "4",
                "type": "num"
            }
        ],
        "x": 94,
        "y": 99,
        "w": 372,
        "h": 162
    },
    {
        "id": "d2b330ed93df35a0",
        "type": "inject",
        "z": "3f31cf57430bd5cb",
        "g": "c4abe2be0fc6d270",
        "name": "",
        "props": [
            {
                "p": "payload"
            },
            {
                "p": "topic",
                "vt": "str"
            }
        ],
        "repeat": "",
        "crontab": "",
        "once": false,
        "onceDelay": 0.1,
        "topic": "",
        "payload": "Hello !",
        "payloadType": "str",
        "x": 190,
        "y": 140,
        "wires": [
            [
                "81e48eeb776da060"
            ]
        ]
    },
    {
        "id": "81e48eeb776da060",
        "type": "debug",
        "z": "3f31cf57430bd5cb",
        "g": "c4abe2be0fc6d270",
        "name": "debug 4",
        "active": true,
        "tosidebar": true,
        "console": false,
        "tostatus": false,
        "complete": "false",
        "statusVal": "",
        "statusType": "auto",
        "x": 360,
        "y": 140,
        "wires": []
    },
    {
        "id": "4d5a8d75274a52cb",
        "type": "comment",
        "z": "3f31cf57430bd5cb",
        "g": "c4abe2be0fc6d270",
        "name": "Node-RED says Hello !",
        "info": "# Some documentation\n\nHere you should explain what you are doing.\n\n|A table|Label|\n|-------|-----|\n|N°1    |Example|\n\n```mermaid\nflowchart LR\n    Start --> Stop\n\n```",
        "x": 220,
        "y": 220,
        "wires": []
    }
]
```

You could export this text in a JSON file, but you could simply insert it like that.

<div align="center">
<figure>
    <img src="./img/Insert_Import_Node.png"
         alt="Insert_Import_Node"
         width="400">
  <figcaption>Right click, Insert Import</figcaption>
</figure>
</div>

<div align="center">
<figure>
    <img src="./img/Insert_Import_Code.png"
         alt="Insert_Import_Code"
         width="400">
  <figcaption>Copy past the JSON text, current flow, Import</figcaption>
</figure>
</div>

**Deploy !**

> Note that if you click on the comment : Node-RED says Hello!, you can read the block documentation by clicking the :information_source: button at the upper right corner of the window.
---



### Inject
Mainly for debugging, used to manually send a message.

<div style="text-align: left;">
<figure>
  <img src="./img/Node_inject.png"
     alt="Image lost : Node_inject"
     width = "200">
  <figcaption>Node Inject</figcaption>
</figure>
</div>

<div style="text-align: center;">
<figure>
  <img src="./img/Node_inject_Hello_World.png"
     alt="Image lost : Node_inject_Hello_World"
     width = "400">
  <figcaption>Inject Hello World !</figcaption>
</figure>
</div>

:bulb: Can also be used to inject a message with a given delay or a selectable time interval.


### Debug
Allows you to display a partial or complete message in the debug window.

<div style="text-align: center;">
<figure>
  <img src="./img/Hello_World_Debug.png"
     alt="Image lost Hello_World_Debug"
     width = "400">
  <figcaption>Debug Hello World !</figcaption>
</figure>
</div>

<div style="text-align: center;">
<figure>
  <img src="./img/Debug_Icon.png"
     alt="Image lost Debug_Icon: Node_inject_Hello_World"
     width = "400">
  <figcaption>Click this icon for debug.</figcaption>
</figure>
</div>

<div style="text-align: center;">
<figure>
  <img src="./img/Debug_Hello.png"
     alt="Image lost Debug_Hello"
     width = "400">
  <figcaption>Debug window</figcaption>
</figure>
</div>

### complete 
:no_bell: *for information only*

<div style="text-align: left;">
<figure>
  <img src="./img/Node_complete.png"
     alt="Image lost Node_complete"
     width = "200">
  <figcaption>Node complete</figcaption>
</figure>
</div>

I've used it very little so far.
For more information: [What is the Complete Node?](https://flowfuse.com/node-red/core-nodes/complete/)


### catch
:no_bell: *for information only*

<div style="text-align: left;">
<figure>
  <img src="./img/Node_catch.png"
     alt="Image lost Node_catch"
     width = "200">
  <figcaption>Node catch</figcaption>
</figure>
</div>

I've used it very little so far.
For more information:: [What is the Catch Node?](https://flowfuse.com/node-red/core-nodes/catch/)

<div style="text-align: center;">
<figure>
  <img src="./img/Node-RED catch.png"
     alt="Image lost Node-RED catch"
     width = "500">
  <figcaption>Catch error message</figcaption>
</figure>
</div>

In the example above, a text message, `Send invalid input`, is sent to a JavaScript function designed to process text.

The catch node intercepts any type of error in the flow. We then write a text in the payload for `debug 2`.

:memo: In the PLC world, the concept of an error most often doesn't exist. That's why we strive to write code with absolute robustness.

:warning: In the PLC world, we find the concept of an alarm. **This is fundamentally different**. When there is an alarm, it is not an error; quite the opposite; it means that the engineer anticipated the problem and programmed the machine's reaction to a particular case.

### status
:no_bell: *for information only*

<div style="text-align: left ;">
<figure>
  <img src="./img/Node_status.png"
     alt="Image lost Node_status"
     width = "200">
  <figcaption>Node status</figcaption>
</figure>
</div>

[What's the Status node in Node-RED used for?](https://flowfuse.com/node-red/core-nodes/status/)

<div style="text-align: center;">
<figure>
  <img src="./img/Status_Example.png"
     alt="Image lost Status_Example"
     width = "500">
  <figcaption>Status Example</figcaption>
</figure>
</div>

In this case, two debug nodes are configured to send a status directly to the status node and not to the debug window

<div style="text-align: center;">
<figure>
  <img src="./img/Node_Status_Only.png"
     alt="Image lost Node_Status_Only"
     width = "300">
  <figcaption>Node status only</figcaption>
</figure>
</div>

### link nodes
Link nodes let you create a flow that can jump between tabs in the editor - they add a virtual wire from the end of one flow to the start of another.

#### link out

<div style="text-align: left;">
<figure>
  <img src="./img/Node_link_out.png"
     alt="Image lost Node_link_out"
     width = "200">
  <figcaption>Node link out</figcaption>
</figure>
</div>

For example, you can send a message to an other flow. Or avoid to have to many links in the actual flow.

<div style="text-align: center;">
<figure>
  <img src="./img/Hello_to_flow_2.png"
     alt="Image lost Hello_to_flow_2"
     width = "400">
  <figcaption>link ou to other flow</figcaption>
</figure>
</div>

#### link in

<div style="text-align: left;">
<figure>
  <img src="./img/Node_link_in.png"
     alt="Image lost Node_link_in"
     width = "200">
  <figcaption>Node link in</figcaption>
</figure>
</div>

In a link in, you can select the messages from other links sending message.

<div style="text-align: center;">
<figure>
  <img src="./img/Hello_from_link_1.png"
     alt="Image lost Hello_from_link_1"
     width = "400">
  <figcaption>Get value from other flow</figcaption>
</figure>
</div>


#### link call

Calls a flow that starts with a link in node and passes on the response.

<div style="text-align: left;">
<figure>
  <img src="./img/Node_call.png"
     alt="Image lost Node_call"
     width = "200">
  <figcaption>Node link call</figcaption>
</figure>
</div>

This node must more be seen as a box for link verification than for a link.
Below an example with some illustrations.

Here, the node **link call with name Test In** receive a timestamp, this stamp is sent to **link out** to the **Test function**, then **link in** - **dashed line** -  **link out** to the **green debug Test function**.

<div style="text-align: center;">
<figure>
  <img src="./img/Link_call_fails.png"
     alt="Image lost Link_call_fails"
     width = "600">
  <figcaption>Test In linked to the input of Test function</figcaption>
</figure>
</div>

:warning: This cause a time out catched by the red node after **3 seconds**. Why ? 

<div style="text-align: center;">
<figure>
  <img src="./img/Link_call_time_out.png"
  <img src="./img/Link_call_time_out.png"
     alt="Image lost Link_call_fails"
     width = "400">
  <figcaption>Timeout after 3 seconds, link call fails</figcaption>
</figure>
</div>

:bulb: because the **link call** node wait a communication return. To do that, we have to edit the **link in** after the **function** to be in mode: **Return to calling link node**.

<div style="text-align: center;">
<figure>
  <img src="./img/Return_to_calling_link_node.png"
  <img src="./img/Link_call_time_out.png"
     alt="Image lost Link_call_fails"
     width = "400">
  <figcaption>Timeout after 3 seconds</figcaption>
</figure>
</div>

As a result, the link out icon change like below:

<div style="text-align: center;">
<figure>
  <img src="./img/Link_call_success.png"
     alt="Image lost Link_call_success"
     width = "600">
  <figcaption>Link call sucessfull</figcaption>
</figure>
</div>

What happens when we press on the timestamp ?

<div style="text-align: center;">
<figure>
  <img src="./img/Link_call_success_path.png"
     alt="Image lost Link_call_success_path"
     width = "600">
  <figcaption>Link call sucessfull with path</figcaption>
</figure>
</div>

1.  We send a timestamp to **Test In**.
2.  Link call in configured to send the message to the test function via **link out**.
3.  The configured link send back the message to **Test In**.
4.  If the message is received within the configured delay, the message pass to the Debug Call Three.

<div style="text-align: center;">
<figure>
  <img src="./img/Link_call_some_test.png"
     alt="Image lost Link_call_some_test"
     width = "600">
  <figcaption>Some test to understand the message</figcaption>
</figure>
</div>

In the last image, we add a **delay of 5 seconds** after the Test function. By adding this delay, we can verify that the delay is to long and the catch node will send a message to the **Check Time Out**.

You can add a debug node with name **To Check Id** and by configuring it with output: complete message object, as for **Debug Call Three**.

In the debug panel:

**To Check Id**, check _msgid.

```js
{"_msgid":"45c782272fbc0a1b",
 "payload":1760443662079,
 "topic":""}
```

**Debug Call Three**, check _msgid.

```js
{"_msgid":"45c782272fbc0a1b",
 "payload":"payload of test function",
 "topic":"",
 "_event":"node:8d2380bd9fd72ee5"}
```

We can see that the payload has been modified by the function, but the **_msgid is the same from the beginning to the end**.

:bulb: If you can fully understand the last image, you have taken a big step in understanding the principle of Node-RED.

### comment

<div style="text-align: left;">
<figure>
  <img src="./img/Node_comment.png"
     alt="Image lost Node_comment"
     width = "200">
  <figcaption>Node comment</figcaption>
</figure>
</div>

You can add mode detailled information in markdown format and display it in the Information tab.

<div style="text-align: center;">
<figure>
  <img src="./img/My_nice_comment_markdown_like.png"
     alt="Image lost My_nice_comment_markdown_like"
     width = "400">
  <figcaption>My nice comment in the info tab</figcaption>
</figure>
</div>

### Annexe


> About message Id, it is coded on 8 bytes. Here an example to get the 64 bit unsigned value of **_msgid**.

```js
// var myHex = "d05a3b7f70b3e37f";
var myHex = msg._msgid;

// conversion précise en BigInt (unsigned)
var asBigInt = BigInt("0x" + myHex);
msg.payload = asBigInt
return msg;
```

---

## Next
In the learning path of Node-RED, it could be logical to continue with function. But, we want to have some understanding of the interfaces for the next practical work, lab. That's why we present a brif overview of some functions below.

The functions in depth will be presented after the interface, / UI User interface.

---

## Function nodes

### Function
Nodes allowing you to act on messages, modify their content, submit processing to them, and slightly influence the way they are delivered.

<figure>
    <img src="./img/node_function.png"
         alt="Image lost: node_function.png"
         width="200">
  <figcaption>Function Node <a href="https://nodered.org">nodered.org</a></figcaption>
</figure>
Allows you to create a function in JavaScript. Usefull for processing a received message to make it usable by an output node.


> Function will be developped [in details in a subsequent module](../ADP_Module_05_Functions_Sub_Flows/README.md#function).

### Change

<figure>
    <img src="./img/node_change.png"
         alt="Image lost: node_change.png"
         width="200">
  <figcaption>Change Node <a href="https://nodered.org">nodered.org</a></figcaption>
</figure>

The Change node can be used to modify a message’s properties and set context properties without having to resort to a Function node.

Each node can be configured with multiple operations that are applied in order. The available operations are:

- **Set** - set a property. The value can be a variety of different types, or can be taken from an existing message or context property.
- **Change** - search and replace parts of a message property.
- **Move** - move or rename a property.
- **Delete** - delete a property.

<div align="center">
<figure>
    <img src="./img/Change_message_to_information.png"
         alt="Image Lost: Change_message_to_information.png"
         width="500">
  <figcaption>Using change message to format payload</figcaption>
</figure>
</div>

<div align="center">
<figure>
    <img src="./img/Change_Set_Message.png"
         alt="Image Lost: Node_SelectAMessage.png"
         width="400">
  <figcaption>Using Set in a change .</figcaption>
</figure>
</div>

<div align="center">
<figure>
    <img src="./img/Change_Change_Message.png"
         alt="Image Lost: Node_SelectAMessage.png"
         width="400">
  <figcaption>Using Change in a change .</figcaption>
</figure>
</div>

As a debug output:

```json
"Information From Node-RED."
```

### Switch

<figure>
    <img src="./img/node_switch.png"
         alt="Image lost: node_switch.png"
         width="200">
  <figcaption>Switch Node <a href="https://nodered.org">nodered.org</a></figcaption>
</figure>

The Switch node allows messages to be routed to different branches of a flow by evaluating a set of rules against each message.

<div align="center">
<figure>
    <img src="./img/Node_SelectAMessage.png"
         alt="Image Lost: Node_SelectAMessage.png"
         width="500">
  <figcaption>Node-RED select a message</figcaption>
</figure>
</div>

The name **switch** comes from the **switch statement** that is common to many programming languages. It is not a reference to a physical switch.

The node is configured with the property to test - which can be either a message property or a context property.


There are four types of rule:

- **Value** rules are evaluated against the configured property
- **Sequence** rules can be used on message sequences, such as those generated by the Split node
- A JSONata **Expression** can be provided that will be evaluated against the whole message and will match if the expression returns a true value.
- An **Otherwise** rule can be used to match if none of the preceding rules have matched.

<div align="center">
<figure>
    <img src="./img/Node_Edit_Switch_Node.png"
         alt="Image Lost: Node_Edit_Switch_Node.png"
         width="400">
  <figcaption>Node-RED Edit switch node</figcaption>
</figure>
</div>

In the example above, depending of the value of `payload`, the `switch` will send a `message` in on of the `debug node`.

The node will route a message to all outputs corresponding to matching rules. But it can also be configured to stop evaluating rules when it finds one that matches.

## Sequence nodes
:no_bell: *for information only*

Nodes allowing you to act on the sequence of transmitted messages and thus influence the flow.

### Node split

<figure>
    <img src="./img/Node-split.png"
         alt="Image lost: Node-split.png"
         width="200">
  <figcaption>Node split</figcaption>
</figure>

### Node join

<figure>
    <img src="./img/Node-join.png"
         alt="Image lost: Node-join.png"
         width="200">
  <figcaption>Node join</figcaption>
</figure>

### Node sort

<figure>
    <img src="./img/Node-sort.png"
         alt="Image lost: Node-sort.png"
         width="200">
  <figcaption>Node sort</figcaption>
</figure>

### Node batch

<figure>
    <img src="./img/Node-batch.png"
         alt="Image lost: Node-batch.png"
         width="200">
  <figcaption>Node batch</figcaption>
</figure>


 Examples:

Allows you to split an incoming message into multiple outgoing messages.

Allows you to group multiple incoming messages into a single outgoing message.

## Network nodes
:no_bell: *for information only*

Nodes for managing the network aspect of the flow, by configuring HTTP requests, websockets, and TCP or UDP messages. This category also includes MQTT (Mosquitto) nodes, if you install them.

## Parser
Nodes for processing formatted data and extracting JavaScript objects usable by other nodes, or for formatting a JavaScript object into a desired format. These nodes can handle HTML, CSV, JSON, XML, or YAML formatting.

> Will be developped in a subsequent module

## Storage
Nodes for saving message data to files. They also allow you to monitor files for changes.
This category also includes Influxdb and PostgreSQL nodes, if you install them.

The i menu provides detailed explanations for each of these nodes.
> Will be developped in a subsequent module

---

## Working with message
A Node-RED flow works by passing messages between nodes. The messages are simple JavaScript objects that can have any set of properties.

Messages usually have a payload property - this is the default property that most nodes will work with.

Node-RED also adds a property called _msgid - this is an identifier for the message which can be used to trace its progress through a flow.

```json
{
    "_msgid": "12345",
    "payload": "..."
}
```

The value of a property can be any valid JavaScript type, such as:

- Boolean - true, false
- Number - eg 0, 123.4
- String - "hello"
- Array - [1,2,3,4]
- Object - { "a": 1, "b": 2}
- Null

[More information about JavaScript types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Data_structures)

### Understanding the structure of a message

The easiest way to understand the structure of a message is to pass it to a Debug node and view it in the Debug sidebar.

By default, the Debug node will display the msg.payload property, but can be configured to display any property or the whole message.

When displaying an Array or Object, the sidebar provides a structured view that can be used to explore the message.

<div align="center">
<figure>
    <img src="./img/MessageInDebug.png"
         alt="Image Lost: MessageInDebug.png"
         width="500">
  <figcaption>Node-RED message in the debug window</figcaption>
</figure>
</div>

The message is an object.
- **topic** is the path to the variable of the PLC: `plc/app/Application/sym/PackTag/Command/Parameter_Lreal`
- **payload** is the effective message to be passed. This is an object, and this object value is an array of 8 object with `ID`, `Name`, `Unit` and `Value`.
- **type** of payload is an `object`.
- and **timestamp**, **timestampFiletime** and finally: **_msgid**.

<div align="center">
<figure>
    <img src="./img/MessageInDebugOverButton.png"
         alt="Image Lost: MessageInDebugOverButton.png"
         width="500">
  <figcaption>Node-RED tools in debug window</figcaption>
</figure>
</div>

<figure>
    <img src="./img/Node-RED_copy_path.png"
         alt="Image lost: Node-RED_copy_path.png"
         width="50">
  <figcaption>Copy path</figcaption>
</figure>

Copies the path to the selected element to your clipboard. This allows you to quickly determine how to access a property in a Change or Function node

<figure>
    <img src="./img/Node-RED_copy_value.png"
         alt="Image lost: Node-RED_copy_value.png"
         width="50">
  <figcaption>Copy value</figcaption>
</figure>

Copies the value of the element to your clipboard as a JSON string. Note that the sidebar truncates Arrays and Buffers over a certain length. Copying the value of such a property will copy the truncated version.

<figure>
    <img src="./img/Node-RED_Pins.png"
         alt="Image lost: Node-RED_Pins.png"
         width="50">
  <figcaption>Pins</figcaption>
</figure>

Pins the selected element so it is always displayed. When another message is received from the same Debug node, it is automatically expanded to show all pinned elements.

### Working with JSON

**JSON**, JavaScript Object Notation, is a standard way for representing a JavaScript object as a String. It is commonly used by web APIs to return data.

If a message property contains a JSON string it must first be parsed to its equivalent JavaScript object before the properties it contains can be accessed. To determine whether a property contains a String or Object, the Debug node can be used.

Node-RED provides a JSON node to do this conversion.

:bulb: if you come from Python world...

#### JSON and Python: Similar but not identical

| Concept        | JSON                          | Python                   |
| -------------- | ----------------------------- | ------------------------ |
| Type           | Text format (string)          | In-memory data structure |
| Main container | Object `{}`                   | Dictionary `dict`        |
| Arrays         | `[ ... ]`                     | Lists `[ ... ]`          |
| Strings        | `"text"`                      | `'text'` or `"text"`     |
| Numbers        | No distinction (just numeric) | `int`, `float`, etc.     |
| Booleans       | `true` / `false`              | `True` / `False`         |
| Null           | `null`                        | `None`                   |

So:

#### A JSON object like

```json
{"name": "Alice", "age": 30}
```

#### is equivalent to this Python dict:

```python
{"name": "Alice", "age": 30}
```

### Changing message properties

A common task in a flow is to modify the properties of a message as it passes between nodes. For example, the result of an HTTP Request may be an object with many properties, of which only some are needed.

There are two main nodes for modifying a message, the Function node and the Change node.

The Function node allows you to run any JavaScript code against the message. This gives you complete flexibility in what you do with the message, but does require familiarity with JavaScript and is unnecessary for many simple cases. More information about writing Functions is available here.

The Change node provides a lot of functionality without needing to write JavaScript code. Not only can it modify message properties, but it can also access flow- and global-context.

It provides four basic operations:

    Set a property to a value,
    Change a String property by performing a search and replace,
    Delete a property,
    Move a property.

For the set operation, you first identify what property you want to set, then the value you want it to have. That value can either be a hardcoded value, such as a string or number, or it can be taking from another message or flow/global context property. It also supports using the JSONata expression language to calculate a new value.

For example, using the Debug node’s ability to determine a message element’s path, you can paste the path straight into the ‘to’ field, with msg. selected from the list. That will then set msg.payload to the value of msg.payload.Phone[2].type.


Another example, using a JSONata expression, is to convert a temperature, held in msg.payload.temperature, from Fahrenheit to Celsius and store the result in a new message property msg.payload.temperature_c.

### Message sequences

A message sequence is an ordered series of messages that are related in some way. For example, the Split node can turn a single message whose payload is an Array, into a message sequence where each message has a payload corresponding to one of the array elements.

Understanding msg.parts

Each message in a sequence has a property called msg.parts. This is an object that contains information how the message fits in the sequence. It has the following properties:

msg.parts.id
    a unique identifier for the sequence
msg.parts.index
    the message's position within the sequence
msg.parts.count
    if known, the total number of messages in the sequence

Note: the parts array may contain additional meta-data about the sequence. For example, the split node also attaches information that can be used by the join node to reassemble the sequence. See the split node’s documentation.

### Working with sequences

<figure>
    <img src="./img/NodeRedSequence.png"
         alt="Image lost: NodeRedSequence.png"
         width="150">
  <figcaption>Sequences</figcaption>
</figure>

There are a number of core nodes that can work across message sequences:

#### Split

Turns a single message into a sequence of messages.

The exact behaviour of the node depends on the type of msg.payload:

String/Buffer
    the message is split using the specified character (default: `\n`), buffer sequence or into fixed lengths.
Array
    the message is split into either individual array elements, or arrays of a fixed-length.
Object
    a message is sent for each key/value pair of the object.

#### Join

Turns a sequence of messages into a single message.

The node provides three modes of operation:

Automatic
    attempts to reverse the action of a previous Split node
Manual
    allows finer control on how the sequence should be joined
Reduce
    New in 0.18 - allows a JSONata expression to be run against each message in the sequence and the result accumulated to produce a single message.

#### Sort

New in 0.18

Sorts the sequence based on a property value or JSONata expression result.

#### Batch

Creates new sequences of messages from those received.

The node provides three modes of operation:

Number of messages
    groups messages into sequences of a given length. The overlap option specifies how many messages at the end of one sequence should be repeated at the start of the next sequence.
Time interval
    groups messages that arrive within the specified interval. If no messages arrive within the interval, the node can optionally send on an empty message.
Concatenate Sequences
    creates a message sequence by concatenating incoming sequences. Each sequence must have a msg.topic property to identify it. The node is configured with a list of topic values to identify the order sequences are concatenated. 

## JSONata expression ?

## Your job
Install Node-RED on your laptop. Use this link to get guided about the procedure: [Running Node-RED locally](https://nodered.org/docs/getting-started/local)

### About the tools
<figure>
    <img src="./img/Node_logo.png"
         alt="Node_logo"
         width="100">
  <figcaption>node js <a href="https://nodejs.org/en/">nodejs.org</a></figcaption>
</figure>

## Node JS version?
[Check for supported version of node js for Node-RED here](https://nodered.org/docs/faq/node-versions).

[Download for Node js](https://nodejs.org/en/download).

### About the tools
<figure>
    <img src="./img/npm.png"
         alt="npm"
         width="100">
  <figcaption>npm Docs <a href="https://docs.npmjs.com/">npm</a></figcaption>
</figure>



## What is npm?
Node Package Manager, **NPM**, is a tool for installing software, such as modules or dependencies, for JavaScript applications. It helps improve the efficiency of Node.js development by allowing users to access additional components from a single location.

**Important!** NPM can refer to either the utility developers use to download packages or the repository where users share their modules.

The NPM repository currently contains millions of packages and modules.

Downloading and managing packages from NPM uses your system's command-line interface. By default, this utility is automatically configured after Node.js installation.

---

# Dashboard 2.0 [User Interface](UserInferface.md)



<!-- End of README.md -->
