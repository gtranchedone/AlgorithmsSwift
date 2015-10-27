//: [Previous](@previous)
/*:
# How to use public classes, structs and functions from one Playground page in another

Suppose my "PageFour" needs to see what is in PageThree and PageTwo.

## In Xcode 7 Beta 1

In Xcode 7 Beta 1 it seems not to be possible to use the content of one page into another. Of course we don't want to copy the implementation every time we need it. Also, as the data structures and algorithms in this Playground are explained in each page, we don't want to have those in the Source folder of the Playground either.

_This issue is discussed on [Apple's Developer Forum](https://forums.developer.apple.com/thread/5439)_

The quick and dirty hack to work around this limitation is the following:

*0. Be sure to use "public" for any objects that you want to be availble to other pages.*

*1. First get into (and possibly create) the Sources folder for PageFour*

    $ cd MyPlayground.playground/Pages/PageFour.xcplaygroundpage/Sources

*2. Link in Contents from other Pages*

    ln -s ../../PageTwo/Contents.swift PageTwoPage.swift
    ln -s ../../PageThree/Contents.swift PageThreePage.swift

*/
