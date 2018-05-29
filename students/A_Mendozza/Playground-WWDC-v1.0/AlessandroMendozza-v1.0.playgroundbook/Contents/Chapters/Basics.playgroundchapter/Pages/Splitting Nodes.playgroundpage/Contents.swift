//: ## Splitting Nodes
//: All nodes can have multiple destinations

//: Prepare the source audio player
let file = try AKAudioFile(readFileName: "drumloop.wav", baseDir: .resources)

let player = try AKAudioPlayer(file: file)
player.looping = true

//: The following nodes are both acting on the original player node
var ringMod = AKRingModulator(player)

var delay = AKDelay(player)
delay.time = 0.01
delay.feedback = 0.8
delay.dryWetMix = 1

//: Any number of inputs can be equally summed into one output, including the
//: original player, allowing us to create dry/wet mixes even for effects that
//: don't have that property by default
let mixer = AKMixer(player, delay)

AudioKit.output = mixer
AudioKit.start()
player.play()

//#-hidden-code
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code
