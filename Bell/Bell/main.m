//
//  main.m
//  Bell
//
//  Created by shiori on 11/07/29.
//  Copyright 2011 東京工科大学大学院. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
