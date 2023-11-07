const index = require('./../index')


// index.getWindowList().then(windowList => {
//   console.log(windowList)
// }).catch(error => {
//   console.log(`Error: ${error}`)
// })

index.focusWindow(8394753, '22127RK46C-1f662fbd', async message =>{
  await index.sendKeys(8394753, 'turnoff', {resetFocus: true})
})
// make sure to enter a valid pid
// index.sendKeys(1061123, 'turnoff', {resetFocus: true})
// .then(message => {
//   console.log(message)
// }).catch(err => {
//   console.log(`error is : ${err}`)
// })
