var store = {
  title: ""
  items: [
    {done: false, title: "git clone hello-world-imba"}
    {done: true, title: "npm install"}
    {done: false, title: "npm run dev"}
    {done: false, title: "do somthing else"}
    {done: false, title: "5th thing"}
    {done: false, title: "9th thing"}
  ]
}

tag App
  def addItem
    data:items.push(title: data:title, done: false)
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
          <div.flex.align-items-center>
            <a.ui.green.ribbon.label .hidden=!item:done>
              <i.check.icon>
            <div.inline.field>
              <div.ui.toggle.checkbox>
                <input[item:done].hidden type="checkbox" tabindex="0">
                <label .done=item:done> item:title
          <a href='' :tap.removeItem(index)>
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