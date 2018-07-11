# RootAR

## Setup Instructions

* Clone
* Download the [inception v3 model](http://download.tensorflow.org/models/inception_v3_2016_08_28.tar.gz), and extract it to the `RootAR` folder.
* Open `RootAR.xcodeproj` with XCode.
* Click on the toplevel item, RootAR, in the project navigator (way on the left). The `Development Team` (linked to your Apple Developer account) has to be set.
* Point to your server in `ApiController.swift`
* Choose your iPhone as the device and click build and run.

## Example Server
* There's a simple Sinatra example server to get started with [here.](https://github.com/nuclearnic/ar-insurance-server)