# Lecture 8

## Sequential programs

- Program takes control, prompts for input
- Person waits for program
- Program says when it is ready for more input

```C++
while true {
  print “Prompt for Input”
  input = read_line_of_text()
  output = do_work()
  print output
}
```

User is literally modeled as a file

## Event-driven programming

- A program waits for a user to provide input
- All communication is done via events
	- Mouse down
	- Item drag
	- Key up
- All events go in a queue
	- Ensures events are handled in order
	- Hides specifics from applications

## Basic interactive software loop

All interactive software has this loop somewhere

```C++
do {
  e = read_event(); // input
  dispatch_event(e); // processing
  if (damage_exists())
     update_display(); // output
} while (e.type != WM_QUIT);
```

This is loop is typically written for you in a particular tool or library

#### Example: a button

- What's behind the button?
	1) Set `x` and `y` boundaries
	2) Check if mouse down within those boundaries
	3) Check if mouse up is *also* within those boundaries
	4) If so, then fire an event

## Understanding tools

### What is a user interface tool?

Software or libraries which help you build a user interface

### They are used because ...

- Identify common or important practices
- Package those practices in a framework
- Make it easy to follow these practices
- Make it easier to focus on the application we're building

### Tools enable

- Faster and more iterative design
- Better implementation than without a tool
- Consistency across applications using the same tool

### Designing tools

- Need to understand the core practices and problems
- Those are often evolving with technology and design
- The tasks people are trying to solve change quickly (tools need to keep up)

### Key terms

| Term | Definition |
| ---- | --------- |
| Threshold | How hard to get started |
| Ceiling | How much can be achieved |
| Path of least resistance | Tools influence what interfaces are created |
| Moving targets | Changing needs make tools obsolete |

### Threshold

- Some tools are harder to pick up
- Depends on what a person already knows
	- A new programming language adds to the threshold
	- Borrowed concepts reduce the threshold

### Ceiling

- Tools restrict what is possible

### Path of least resistance

- Bootstrap pages may look similar
- Linguistic relativity
	- Some thoughts in one language cannot be expressed/understood in others
- Tools frame how we think about interaction and design

### Moving targets

- Codification eventually constrains design
- Greater understanding of how people interact with technology
- New technology changes the needs of tools

### Threshold and ceiling

- All relative; no absolute measure
- Tools should be *low threshold* -> easy to pick up
- Tools should also be *high ceiling* -> can do a lot
- The best tools are both

## How does this relate to visualization

### Scalable vector graphics (SVG)

- XML format for specifying graphics
	- Looks somewhat like HTML
	- Can be rendered by most browsers
- Composed of lines, circles, rectangles, etc.

```XML
<svg width="100" height="100">  
<circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" /> </svg>
```

### Visualization tools

- Governed by the same principles of tools
- Scalable vector graphics (High ceiling, but high threshold)
- Microsoft Excel (Low threshold, but low ceiling)

### Declarative languages

- Programming be describing *what*, not *how*
- Separate specification from execution
- Constrasts **imperative** programming, where you must provide explicit steps
- HTML and CSS are declarative, but JavaScript is imperative

### Why declarative?

- Faster iteration, less code, lower threshold
- Can be generated programmatically
- Generally considered easier than learning an imperative language

### Provotis

- Initial grammar for visualization
- Composition of data representative marks
	- Specifies how content should be rendered
- Self contained JavaScript model

```JavaScript
var vis = new pv.Panel(); 
vis.add(pv.Bar)
	.data([1, 1.2, 1.7, 1.5, 0.7])
	.visible(true)  
	.left((d) => this.index * 25) .bottom(0)  
	.width(20)  
	.height((d) => d * 80) 
	.fillStyle("blue") 
	.strokeStyle("black") 
	.lineWidth(1.5); 
vis.render();
```

### D3

- Binds data directly to a web pages DOM by editing a SVG
- More expressive! Can do anything SVG can
- Enables interactivity
	- Can access mouse and keyboard events
- Much more complex...

```JavaScript
var svg = d3.select(DOM.svg(width, height));

svg.append("g")
  .attr("fill", "steelblue")
  .selectAll("rect")
  .data(data).enter() 
  .append("rect") 
  .attr("x", d => x(d.name)) 
  .attr("y", d => y(d.value)) 
  .attr("height", d => y(0) - y(d.value))
  .attr("width", x.bandwidth());

svg.append("g")
  .call(xAxis);

svg.append("g")
  .call(yAxis);
```

Compared to microsoft excel, both D3 and and Provotis have a high ceiling, but they also have a pretty high threshold

### Vega-lite

Goal: "create and expressive yet concise declarative language for specifying visualizations"

This is achieved be creating a grammar of graphics

| Grammar rule | explanation |
| ------------- | ----------- |
| Data | input data to visualize |
| Mark | Data-representative graphics |
| Transform | whether to filter, aggregate, bin, etc |
| Encoding | mapping between data and mark properties |
| Scale | map between data values and visual values |
| Guides | axes & legends that visualize scales |

#### Making a histogram

Data as JSON

```JSON
[  
{
	"date": "2015/01/01",  
	"weather": "sun",  
	"temperature": 1.1999999999999997
}, 
{
	"date": "2015/01/02", 
	"weather": "fog", 
	"temperature": 2.8

}, 
{
	"date": "2015/01/03", 
	"weather": "fog", 
	"temperature": 3.35
}, 
{
	"date": "2015/01/04",  
	"weather": "fog",  
	"temperature": 6.949999999999999
}, 
{
	"date": "2015/01/05", 
	"weather": "fog", 
	"temperature": 10.8
}, ...
```

- Bin records by their temperature
- Count how many fall into each bin
- Render bins as vertical bars

```JSON
{
	data: {url: "weather-seattle.json"},
	mark: "bar",
	encoding: {
		x: {
			bin: true,
			field: "temperature",
			type: "quantitative"
		},
		y: {
			aggregate: "count",
			type: "quantitative"
		}
	}
}
```

#### Adding color

```JSON
{
...
	color: {
		field: "weather",
		type: "nominal"
	}
}
```

#### Sensible defaults

- The field chose reasonable defaults for presenting the data
- No specification for
	- What colors to use
	- How wide the bins should be
	- How to label the axes
	- How the bars should be stacked
- Can be overridden

```JSON
{
...
	scale:  {
		domain: ["sun", "fog", "drizzle","rain", "snow"],
		range: ["#e7ba52","#c7c7c7","#aec7e8","#1f77b4","#9467bd" ]
	}
}
```

#### Aggregate data

```JSON
{
	data: {url: "weather-seattle.json"},
	mark: "bar",
	encoding: {
		x: {  
			timeUnit: "month", 
			field: "date", 
			type: "quantitative"
		}, 
		y: {
		aggregate: "mean",
		field: "precipitation",
		type: "quantitative"
		} 
	}
}
```

### Vega-lite's secret

- Threshold is lower
	- More concise definitions
	- Less to know upfront
- Ceiling remains the same
	- Sensible defaults can be overridden

### Vega-lites downside

- Visualizations made with vega-lite look similar (like bootstrap)
- It is a path of least resistance
- Sensible defaults can be overridden, but are they in practice?
 