# Swift Timer Demo
An Xcode 10 project, written in Swift 4.2, demonstrating my best practices for using the Timer class.

In the [companion tutorial](http://iosbrain.com/blog/2018/10/31/using-the-swift-4-2-timer-class-in-xcode-10/), I'll discuss how developers often need to do something many times and at regular intervals. One common application of such a use case is checking some process's or device's status, a process of  called "polling." In the tutorial, I'll show you how to use the Swift 4.2 [`Timer`](https://developer.apple.com/documentation/foundation/timer) class in Xcode 10 to repeatedly perform a simple task, every second, for 1 minute (60 seconds) -- **and** update the user interface (UI) on each "tick." You'll learn how to start a timer ticking, pause it, resume it, stop it, and do something on each tick.

Here's on of my apps using a `Timer` to perform animations -- _and_ the UI remains responsive:

![alt text][logo1]

[logo1]: http://iosbrain.com/wp-content/uploads/2018/10/EmphasizeUIResponsive.gif "Animation using Timer"

-------
Copyright (c) 2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and iosbrain.com.
