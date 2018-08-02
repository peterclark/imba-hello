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

  def removeItem index
    data:items.splice(index,1)
        
  def render
    <self>
      <div.ui.raised.very.padded.text.container.segment>
        <div.ui.form>
          <div.fields>
            <div.twelve.wide.field>
              <input[data:title] placeholder="New..." :keyup.enter.addItem>
            <div.four.wide.field>
              <button.ui.primary.button :tap.addItem> 'Add item'
      <div.ui.segments.text.container> for item,index in data:items
        <div.ui.segment.flex.space-between.align-items-center>
          item:title
          <a :tap.removeItem(index)>
            <i.red.close.icon>


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