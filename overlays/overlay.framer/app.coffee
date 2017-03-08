# Import file "overlay"
sketch = Framer.Importer.load("imported/overlay@1x")

Framer.Device.contentScale = 2

scroll = ScrollComponent.wrap(sketch.options1)
scroll.scrollHorizontal = false 

sketch.options_btn.onTap ->
	sketch.options.visible = not sketch.options.visible 

sketch.trafficLayer.opacity = 0
sketch.trafficLayer.states.add
	on:
		opacity: 100
	
toggleBar = new Layer
	x: sketch.floatBackground.x
	y: sketch.floatBackground.y
	parent: sketch.showTraffic
	width: 51
	height: 31
	borderRadius: 50
	backgroundColor: "#ffffff"
	borderColor: new Color("rgba(0,0,0,0.1)")
	borderWidth: 1.5
	
sketch.Float.placeBefore(toggleBar)

sketch.knob.states.add
	on: 
		maxX: 55

toggleBar.states.add
	on:
		backgroundColor: "#44DB5E"

toggleBar.on Events.Tap, ->
	sketch.knob.states.next()
	toggleBar.states.next()	
	sketch.trafficLayer.states.next()
