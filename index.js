require ('hazardous')  // makes this module work when it's unpacked from the app.asar package when the app is packed with electron-build
// it overloads path.join to change asar.app to asar.app.unpacked

const path = require('path')
const { exec } = require('child_process')
const focusWindowMacScript = path.join(__dirname, 'mac', 'setWindowFocus.applescript')
const focusAndSendKeys = path.join(__dirname, 'mac', 'focusAndSendKeysAndEnter.applescript')

const focusWindow = (pid, callback) => {
  const emptyCallBack = () => {}
  callback = callback || emptyCallBack
  if ( process.platform === 'darwin' ) {
    exec(`osascript "${focusWindowMacScript}" ${pid}`, (error, stdout, stderr) => {
      if (error) {
        callback(error, null)
        return
      }
      if (stderr) {
        callback(stderr, null)
        return
      }
      callback(null, stdout)
    })
  } else if ( process.platform === 'win32' ) {
    // TODO: add windows support
    callback('Windows isn\'t supported yet', null)
  } else if ( process.platform === 'win3linux2' ) {
    // TODO: add Linux support
    callback('Linux isn\'t supported yet', null)
  } else {
    callback('Platform not suported', null)
  }
  
}

const sendKeysAndEnter = (pid, keys, callback) => {
  const emptyCallBack = () => {}
  callback = callback || emptyCallBack
  if ( process.platform === 'darwin' ) {
    exec(`osascript "${focusAndSendKeys}" ${pid} "${keys}"`, (error, stdout, stderr) => {
      if (error) {
        callback(error, null)
        return
      }
      if (stderr) {
        callback(stderr, null)
        return
      }
      callback(null, stdout)
    })
  } else if ( process.platform === 'win32' ) {
    // TODO: add windows support
    callback('Windows isn\'t supported yet', null)
  } else if ( process.platform === 'win3linux2' ) {
    // TODO: add Linux support
    callback('Linux isn\'t supported yet', null)
  } else {
    callback('Platform not suported', null)
  }
}

module.exports = {
  focusWindow: focusWindow,
  sendKeysAndEnter: sendKeysAndEnter
}