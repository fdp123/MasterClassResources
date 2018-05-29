//: ## Dry Wet Mixer
//: It's a very common operation to mix exactly two inputs, one before
//: processing occurs, and one after, and then mixing down to a combination
//: of the two

//: Prepare the players:
let file = try AKAudioFile(readFileName: "drumloop.wav", baseDir: .resources)
var drums = try AKAudioPlayer(file: file)
drums.looping  = true

//: Build an effects chain:

var delay = AKDelay(drums)
delay.time = 0.1
delay.feedback = 0.8
let reverb = AKReverb(delay)
reverb.loadFactoryPreset(.largeChamber)

//: Mix the result of those two processors back with the original

let mixture = AKDryWetMixer(drums, reverb, balance: 0.5)

AudioKit.output = mixture
AudioKit.start()
drums.play()

//#-hidden-code

//: User Interface Set up

class PlaygroundView: AKPlaygroundView {

    var balanceLabel: Label?

    override func setup() {
        addTitle("Dry Wet Mix")

        addSubview(AKBypassButton(node: drums))

        addSubview(AKPropertySlider(
            property: "Balance",
            value: mixture.balance,
            color: AKColor.cyan
        ) { sliderValue in
            mixture.balance = sliderValue
            })
    }
}

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = PlaygroundView()


PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code
