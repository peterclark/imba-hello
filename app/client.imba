var store = {
  title: ""
  items: [
    {title: "git clone hello-world-imba"}
    {title: "npm install"}
    {title: "npm run dev"}
    {title: "do somthing else"}
    {title: "5th thing"}
    {title: "9th thing"}
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


var main = document.getElementsByClassName('main')[0]
Imba.mount <App[store]>, main

tag Login < a

  def open
    window:netlifyIdentity.open()

  def user
    return window:netlifyIdentity.currentUser()

  def render
    <self.ui.inverted.button :tap.prevent.open>
      if user
        'Logout'
      else
        'Log in'

var auth = document.getElementsByClassName('auth')[0]
Imba.mount <Login>, auth 