# -*- coding: utf-8 -*-
#  mainWindow.rb
#  Bell
#
#  Created by shiori on 11/07/29.
#  Copyright 2011 東京工科大学大学院. All rights reserved.
#

framework 'Cocoa'


class MainWindow < NSView
    
    def initWithFrame(freamRect)
        if super
            @format = NSDateFormatter.new
            @format.setDateFormat("mm:ss")
            @font = NSFont.fontWithName("Helvetica", size:40)
            @t = Time.local(2011,1,1,0,0,0)
            @timInt = @t.tv_sec
            @pop1 = @pop2 = @pop3 = @timInt + 1
            @flag = false
            
        end
        return self
    end
    
    def resetInit
        @t = Time.local(2011,1,1,0,0,0)
        @timInt = @t.tv_sec
        @fllag =false
        setNeedsDisplay(true)
    end
    
    def drawRect(rect)
        # draw a black background
        temp_context do
            NSColor.blackColor.set
            NSBezierPath.fillRect(rect)
        end
        
        t = Time.at(@timInt)

        case @timInt
            when @pop1
                NSBeep()
            when @pop2..(@pop2+1)
                NSBeep()
            when @pop3..(@pop3+2)
                NSBeep()
        end

        
        if @pop2 > @timInt
        temp_context do
            attributes = {NSFontAttributeName => @font, NSForegroundColorAttributeName => NSColor.whiteColor}
            "#{@format.stringFromDate(t)}".drawAtPoint([50,20], withAttributes: attributes)
        end
        elsif @pop3 > @timInt
            temp_context do
                attributes = {NSFontAttributeName => @font, NSForegroundColorAttributeName => NSColor.cyanColor}
                "#{@format.stringFromDate(t)}".drawAtPoint([50,20], withAttributes: attributes)
            end
        else
            temp_context do
                attributes = {NSFontAttributeName => @font, NSForegroundColorAttributeName => NSColor.redColor}
                "#{@format.stringFromDate(t)}".drawAtPoint([50,20], withAttributes: attributes)
            end
            
        end
        
    end
    
    def setPop(pop1,pop2,pop3)
        @pop1 = pop1 * 60 + @t.tv_sec
        @pop2 = pop2 * 60 + @t.tv_sec
        @pop3 = pop3 * 60 + @t.tv_sec
    end
    
    def run
        @timInt += 1 
    end
    
    def temp_context(&block)
		context = NSGraphicsContext.currentContext
		context.saveGraphicsState
		yield
		context.restoreGraphicsState
	end
    
end