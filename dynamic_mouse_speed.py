#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Author: Sergiy Kolodyazhnyy
Date:  August 2nd, 2016
Written for: http://askubuntu.com/q/806212/295286
Tested on Ubuntu 16.04 LTS

usage: dynamic_mouse_speed.py [-h] [-q] [-p POINTER] [-s SCROLL] [-v]

Sets mouse pointer and scroll speed per window

optional arguments:
  -h, --help            show this help message and exit
  -q, --quiet           Blocks GUI dialogs.
  -p POINTER, --pointer POINTER
                        mouse pointer speed,floating point number from -1 to 1
  -s SCROLL, --scroll SCROLL
                        mouse scroll speed,integer value , -10 to 10
                        recommended
  -v, --verbose         prints debugging information on command line


"""
from __future__ import print_function
import gi
gi.require_version('Gdk', '3.0')
gi.require_version('Gtk', '3.0')
from gi.repository import Gdk, Gtk,Gio
import time
import subprocess
import sys
import os
import argparse


def run_cmd(cmdlist):
    """ Reusable function for running shell commands"""
    try:
        stdout = subprocess.check_output(cmdlist)
    except subprocess.CalledProcessError:
        print(">>> subprocess:",cmdlist)
        sys.exit(1)
    else:
        if stdout:
            return stdout



def get_user_window():
    """Select two windows via mouse. 
       Returns integer value of window's id"""
    window_id = None
    while not window_id:
        for line in run_cmd(['xwininfo', '-int']).decode().split('\n'):
            if 'Window id:' in line:
                window_id = line.split()[3]
    return int(window_id)

def gsettings_get(schema,path,key):
    """Get value of gsettings schema"""
    if path is None:
        gsettings = Gio.Settings.new(schema)
    else:
        gsettings = Gio.Settings.new_with_path(schema,path)
    return gsettings.get_value(key)

def gsettings_set(schema,path,key,value):
    """Set value of gsettings schema"""
    if path is None:
        gsettings = Gio.Settings.new(schema)
    else:
        gsettings = Gio.Settings.new_with_path(schema,path)
    return gsettings.set_double(key,value)

def parse_args():
    """ Parse command line arguments"""
    arg_parser = argparse.ArgumentParser(
                 description="""Sets mouse pointer and scroll """ + 
                             """speed per window """)
    arg_parser.add_argument(
                '-q','--quiet', action='store_true',
                help='Blocks GUI dialogs.',
                required=False)

    arg_parser.add_argument(
                '-p','--pointer',action='store',
                type=float, help=' mouse pointer speed,' + 
                'floating point number from -1 to 1', required=False)

    arg_parser.add_argument(
                '-s','--scroll',action='store',
                type=int, help=' mouse scroll speed,' + 
                'integer value , -10 to 10 recommended', required=False)

    arg_parser.add_argument(
                '-v','--verbose', action='store_true',
                help=' prints debugging information on command line',
                required=False)
    return arg_parser.parse_args()

def get_mouse_id():
    """ returns id of the mouse as understood by
        xinput command. This works only with one
        mouse attatched to the system"""
    devs = run_cmd( ['xinput','list','--id-only']   ).decode().strip()
    for dev_id in devs.split('\n'):
        props = run_cmd( [ 'xinput','list-props', dev_id  ]   ).decode()
        if "Evdev Scrolling Distance" in props:
            return dev_id


def write_rcfile(scroll_speed):
    """ Writes out user-defined scroll speed
        to ~/.imwheelrc file. Necessary for
        speed increase"""
        
    number = str(scroll_speed)
    user_home = os.path.expanduser('~')
    with open( os.path.join(user_home,".imwheelrc") ,'w'  ) as rcfile:
        rcfile.write( '".*"\n' )
        rcfile.write("None, Up, Button4, " + number + "\n"   )   
        rcfile.write("None, Down, Button5, " + number + "\n")
        rcfile.write("Control_L, Up,   Control_L|Button4 \n" +
                     "Control_L, Down, Control_L|Button5 \n" +
                     "Shift_L,   Up,   Shift_L|Button4 \n" +
                     "Shift_L,   Down, Shift_L|Button5 \n" )



def set_configs(mouse_speed,scroll_speed,mouse_id):
    """ sets user-defined values
        when the desired window is in focus"""
    if mouse_speed:
        gsettings_set('org.gnome.desktop.peripherals.mouse',None, 'speed', mouse_speed)

    if scroll_speed:
       if scroll_speed > 0:
           subprocess.call(['killall','imwheel'])
           # Is it better to write config here
           # or in main ?
           write_rcfile(scroll_speed)
           subprocess.call(['imwheel'])
       else:
           prop="Evdev Scrolling Distance"
           scroll_speed = str(abs(scroll_speed))
           run_cmd(['xinput','set-prop',mouse_id,prop,scroll_speed,'1','1']) 
           

     
def set_defaults(mouse_speed,scroll_speed,mouse_id):
    """ restore values , when user-defined window
        looses focus"""
    if mouse_speed:
        gsettings_set('org.gnome.desktop.peripherals.mouse', None, 
                      'speed', mouse_speed)

    if scroll_speed:
        if scroll_speed > 0:
           subprocess.call(['killall','imwheel'])
        if scroll_speed < 0:
           prop="Evdev Scrolling Distance"
           run_cmd(['xinput','set-prop',mouse_id,prop,'1','1','1'])
    

def main():
    """Entry point for when program is executed directly"""
    args = parse_args()

    # Get a default configs
    # gsettings returns GVariant, but
    # setting same schema and key requires 
    # floating point number
    screen = Gdk.Screen.get_default()
    default_pointer_speed = gsettings_get('org.gnome.desktop.peripherals.mouse', 
                                          None, 
                                          'speed')
    default_pointer_speed = float(str(default_pointer_speed))

    
    # Ask user for values , or check if those are provided via command line
    if not args.quiet:
       text='--text="Select window to track"'
       mouse_speed = run_cmd(['zenity','--info',text])
    
    user_window = get_user_window() 

    scroll_speed = args.scroll    
    pointer_speed = args.pointer
    mouse_id = get_mouse_id()

    if pointer_speed: 
        if pointer_speed > 1 or pointer_speed < -1:

           run_cmd(['zenity','--error',
                    '--text="Value out of range:' + 
                    str(pointer_speed) + '"'])
           sys.exit(1)

    # ensure that we will raise the user selected window
    # and activate all the preferences 
    flag = True
    for window in screen.get_window_stack():
        if user_window == window.get_xid():
            window.focus(time.time())
            window.get_update_area()
    try:
        while True:
            time.sleep(0.25) # Necessary for script to catch active window
            if  screen.get_active_window().get_xid() == user_window:
                if flag:
                    set_configs(pointer_speed,scroll_speed,mouse_id) 
                    flag=False
        
            else:
               if not flag:
                  set_defaults(default_pointer_speed, scroll_speed,mouse_id)
                  flag = True
        
            if args.verbose: 
                print('ACTIVE WINDOW:',str(screen.get_active_window().get_xid()))
                print('MOUSE_SPEED:', str(gsettings_get(
                                          'org.gnome.desktop.peripherals.mouse',
                                           None, 'speed')))
                print('Mouse ID:',str(mouse_id))
                print("----------------------")
    except:
        print(">>> Exiting main, resetting values")
        set_defaults(default_pointer_speed,scroll_speed,mouse_id)

if __name__ == "__main__":
    main()

