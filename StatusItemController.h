/***************************************************************************
 *   Copyright 2005-2009 Last.fm Ltd.                                      *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Steet, Fifth Floor, Boston, MA  02110-1301, USA.          *
 ***************************************************************************/

// Created by Max Howell <max@last.fm>

#import <Growl/GrowlApplicationBridge.h>
#import <Cocoa/Cocoa.h>
@class AutoDash;


@interface StatusItemController : NSObject <GrowlApplicationBridgeDelegate>
{
    NSStatusItem* status_item;
    IBOutlet NSMenu* menu;
    IBOutlet NSMenu* app_menu;
    IBOutlet NSMenuItem* start_at_login;
    AutoDash* autodash;
}

-(IBAction)love:(id)sender;
-(IBAction)tag:(id)sender;
-(IBAction)share:(id)sender;
-(IBAction)startAtLogin:(id)sender;
-(IBAction)installDashboardWidget:(id)sender;
-(IBAction)activateAutoDash:(id)sender;
-(IBAction)about:(id)sender;

@end


@interface ShareWindowController:NSWindowController
{
    IBOutlet NSTextField* username;
}
-(IBAction)submit:(id)sender;
@end
