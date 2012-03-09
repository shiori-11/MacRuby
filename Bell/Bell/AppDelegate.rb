#
#  AppDelegate.rb
#  Bell
#
#  Created by shiori on 11/07/29.
#  Copyright 2011 東京工科大学大学院. All rights reserved.
#
framework 'Cocoa'

class AppDelegate < NSWindowController
    attr_accessor :window, :countView
    attr_accessor :runButton ,:restButton
    attr_accessor :popUp1, :popUp2, :popUp3


    def applicationDidFinishLaunching(a_notification)
        # Insert code here to initialize your application
        puts "app init"
        initApp
        puts "app end"

    end
    
    def initApp
        @timer = nil
        @runButton.setImage(NSImage.imageNamed(NSImageNameRightFacingTriangleTemplate))
        arr = []
        0..60.times do |x|
            arr << x.to_s
        end
        @popUp1.addItemsWithTitles(arr)
        @popUp2.addItemsWithTitles(arr)
        @popUp3.addItemsWithTitles(arr)
    end
    
    
    def startButton(sender)
        if @timer
            @timer.invalidate
            @timer = nil

            sender.setImage(NSImage.imageNamed(NSImageNameRightFacingTriangleTemplate))
        else
            @countView.setPop(@popUp1.titleOfSelectedItem.to_i, 
                              @popUp2.titleOfSelectedItem.to_i,
                              @popUp3.titleOfSelectedItem.to_i)
            sender.setImage(NSImage.imageNamed(NSImageNameStopProgressTemplate))
            #@countView.setTime
            @timer = NSTimer.scheduledTimerWithTimeInterval 1,
            target: self,
            selector: 'run:',
            userInfo: nil,
            repeats: true
            
        end    
    end
    
    def resetButton(sender)
        @countView.resetInit
    end
    
    def bellButton(sender)
        NSBeep()
    end
    
    def run(test)
        @countView.run
        @countView.setNeedsDisplay(true)
    end
    

end

