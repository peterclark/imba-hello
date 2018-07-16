
var store = {
	title: ""
	items: [
		{title: "git clone hello-world-imba"}
		{title: "npm install"}
		{title: "npm run dev"}
		{title: "do somthing else"}
		{title: "5th thing"}
		{title: "6th thing"}
	]
}

tag App
	def addItem
		data:items.push(title: data:title)
		data:title = ""
		
	def render
		<self.vbox>
			<header>
				<input[data:title] placeholder="New..." :keyup.enter.addItem>
				<button :tap.addItem> 'Add item'
			<ul> for item in data:items
				<li> item:title


Imba.mount <App[store]>