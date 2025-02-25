<img src="https://raw.githubusercontent.com/exyte/media/master/common/header.png">

<p><h1 align="left">SVGView</h1></p>

<p><h4>SVG parser written in SwiftUI</h4></p>

___

<p> We are a development agency building
  <a href="https://clutch.co/profile/exyte#review-731233">phenomenal</a> apps.</p>
</br>

<a href="https://exyte.com/contacts"><img src="https://i.imgur.com/vGjsQPt.png" width="134" height="34"></a> <a href="https://twitter.com/exyteHQ"><img src="https://i.imgur.com/DngwSn1.png" width="165" height="34"></a>

</br></br>
[![Travis CI](https://travis-ci.org/exyte/SVGView.svg?branch=master)](https://travis-ci.org/exyte/SVGView)
[![Version](https://img.shields.io/cocoapods/v/SVGView.svg?style=flat)](http://cocoapods.org/pods/SVGView)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-0473B3.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/SVGView.svg?style=flat)](http://cocoapods.org/pods/SVGView)
[![Platform](https://img.shields.io/cocoapods/p/SVGView.svg?style=flat)](http://cocoapods.org/pods/SVGView)
[![Twitter](https://img.shields.io/badge/Twitter-@exyteHQ-blue.svg?style=flat)](http://twitter.com/exyteHQ)

# Overview

The goal of this project is to bring the full power of SVG to Apple platforms. Out framework can parse SVG files and represent their content in SwiftUI. It provides you with the ability to not only render SVG files, but also add interactivity to them, handle user input and use SwiftUI to put your art into motion.

# Usage

Get started with `SVGView` in a few lines of code:

```Swift
struct ContentView: View {
    var body: some View {
        SVGView(fileURL: Bundle.main.url(forResource: "example", withExtension: "svg")!)
    }
}
```

## Interact with vector elements

You may locate the desired part of your SVG file using standard identifiers to add gestures and change its properties in runtime:

```Swift
struct ContentView: View {
    var body: some View {
        let view = SVGView(fileURL: Bundle.main.url(forResource: "example", withExtension: "svg")!)
        if let part = view.getNode(byId: "part") {
            part.onTapGesture {
                part.opacity = 0.2
            }
        }
        return view
    }
}
```

## Animation

You can use standard SwiftUI tools to animate your image:

```Swift
if let part = view.getNode(byId: "part") {
    part.onTapGesture {
        withAnimation {
            part.opacity = 0.2
        }
    }
}
```

## Complex effects

SVGView makes it easy to add custom effects to your app. For example, make this <a href="https://www.iconfinder.com/icons/1337497/">pikachu</a> track finger movement:

```Swift
var body: some View {
    let view = SVGView(fileURL: Bundle.main.url(forResource: "pikachu", withExtension: "svg")!)
    let delta = CGAffineTransform(translationX: getEyeX(), y: 0)
    view.getNode(byId: "eye1")?.transform = delta
    view.getNode(byId: "eye2")?.transform = delta

    return view.gesture(DragGesture().onChanged { g in
        self.x = g.location.x
    })
}
```

<img src="https://i.imgur.com/Ij0Xn4A.gif" width="300" height="300">

# SVG Tests Coverage

Our mission is to provide 100% support of all SVG standards: 1.1 (Second Edition), Tiny 1.2 and 2.0. However, this project is at its very beginning, so you can follow our progress on <a href="w3c-coverage.md">this page</a>. You can also check out <a href="https://github.com/exyte/SVGViewTests">SVGViewTests project</a> to see how well this framework handles every single SVG test case.

# Installation

## Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/exyte/SVGView.git")
]
```

## CocoaPods

```ruby
pod 'SVGView'
```

## Carthage

```ogdl
github "Exyte/SVGView"
```

# Requirements

* iOS 14+ / watchOS 7+ / macOS 11+
* Xcode 12+

## Our other open source SwiftUI libraries
[PopupView](https://github.com/exyte/PopupView) - Toasts and popups library    
[Grid](https://github.com/exyte/Grid) - The most powerful Grid container    
[ScalingHeaderScrollView](https://github.com/exyte/ScalingHeaderScrollView) - A scroll view with a sticky header which shrinks as you scroll  
[AnimatedTabBar](https://github.com/exyte/AnimatedTabBar) - A tabbar with number of preset animations     
[MediaPicker](https://github.com/exyte/mediapicker) - Customizable media picker     
[ConcentricOnboarding](https://github.com/exyte/ConcentricOnboarding) - Animated onboarding flow    
[FloatingButton](https://github.com/exyte/FloatingButton) - Floating button menu    
[ActivityIndicatorView](https://github.com/exyte/ActivityIndicatorView) - A number of animated loading indicators    
[ProgressIndicatorView](https://github.com/exyte/ProgressIndicatorView) - A number of animated progress indicators  
[LiquidSwipe](https://github.com/exyte/LiquidSwipe) - Liquid navigation animation    

