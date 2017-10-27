Marco Romano file:


# Class “Conditioner” with standard init

## properties

- isActive: Bool
- airPower: Int
- temperature: Double
- slatsAngle : Int
- mode : CondMode

## methods

- setCondMode

```swift
let lab2Conditioner = Conditioner(isActive: true, airPower: 220, temperature: 27.4, slatsAngle: 12, mode: CondMode.auto)
lab2Conditioner.setCondMode(mode: CondMode.auto)
```


- setCondTemp
```swift
lab2Conditioner.setCondTemp(temp: 24.5)
```


- switchCond
```swift
lab2Conditioner.switchCond()
```

```swift
class Conditioner {
var isActive: Bool
var airPower: Int
var temperature: Double
var slatsAngle : Int
var mode : CondMode

init (isActive: Bool, airPower: Int, temperature: Double, slatsAngle: Int, mode: CondMode) {
self.isActive = isActive
self.airPower = airPower
self.temperature = temperature
self.slatsAngle = slatsAngle
self.mode = mode
}

// method used to set the Conditioner mode
func setCondMode (mode: CondMode) {
self.mode = mode
switch mode {
case CondMode.auto:
self.temperature = 25.0
self.airPower = 20
self.slatsAngle = 12
break
case CondMode.cool:
self.temperature = 23.0
self.airPower = 22
self.slatsAngle = 14
break
case CondMode.dry:
self.temperature = 21.0
self.airPower = 24
self.slatsAngle = 16
break
case CondMode.fan:
self.temperature = 19.0
self.airPower = 28
self.slatsAngle = 18
break
case CondMode.heat:
self.temperature = 18.0
self.airPower = 30
self.slatsAngle = 35
break
}
}

/* method used to set the Conditioner temperature
input: Double (temperature)

*/
func setCondTemp (temp: Double) {
self.temperature = temp
}

/* method used to switch On/Off the Conditioner
there are no inputs, the method switches the conditioner state (on/off)
*/
func switchCond () {
self.isActive = !isActive
if (!isActive) {
self.temperature = 0
self.airPower = 0
self.slatsAngle = 0
}
}

}
```
