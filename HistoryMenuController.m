/***************************************************************************
 *   Copyright 2005-2009 Last.fm Ltd.                                      *
 *   Copyright 2010 Max Howell <max@methylblue.com                         *
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

#import "HistoryMenuController.h"
#import "NSDictionary+Track.h"
#import "lastfm.h"


@implementation HistoryMenuController

-(void)awakeFromNib
{
    tracks = [NSMutableArray arrayWithCapacity:5];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onPlayerInfo:)
                                                 name:@"playerInfo"
                                               object:nil];
}

-(void)insert:(NSDictionary*)track
{
    NSMenuItem* item = [menu itemAtIndex:0];
    if([item isEnabled] == false)
        [menu removeItem:item];
    
    item = [[NSMenuItem alloc] initWithTitle:track.prettyTitle action:@selector(clicked:) keyEquivalent:@""];
    [item setTarget:self];
    [item setRepresentedObject:track.url];
    [menu insertItem:item atIndex:0];
    [item release];
    
    // 18 items is about an hour
    if([menu numberOfItems] > 18)
       [menu removeItemAtIndex:15];
}

-(void)onPlayerInfo:(NSNotification*)not
{
    NSDictionary* track = [not userInfo];
    uint transition = [[track objectForKey:@"Transition"] unsignedIntValue];
    
    switch(transition){
        case TrackStarted:
        case PlaybackStopped:
            if(currentTrack)
                [self insert:currentTrack];
            [currentTrack release];
            currentTrack = track;
            [currentTrack retain];
    }
}

-(void)clicked:(id)sender
{
    [[NSWorkspace sharedWorkspace] openURL:[sender representedObject]];
}

@end
