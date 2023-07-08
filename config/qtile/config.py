import os
import subprocess

# Qtile imports
from libqtile import bar, widget, hook 
from libqtile.layout.floating import Floating
from libqtile.layout.columns import Columns
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.bar import Bar

# Third party imports
# For dynamic multiscreen, install xlib from pip
from Xlib import display

# colors
white = "#f9f5d7"
white0 = "#928374"
gray = "#a89984"
gray0 = "#928374"
red = "#cc241d"
red0 = "#9d0006"
green = "#98971a"
green0 = "#79740e"
yellow = "#d79921"
yellow0 = "#b57614"
blue = "#458588"
blue0 = "#076678"
purple = "#b16286"
purple0 = "#8f3f71"
orange = "#d65d0e"
orange0 = "#fe8019"
aqua = "#689d6a"
aqua0 = "#427b58"
black = "#7c6f64"
black0 = "#32302F"
bg = black0
soft = "#ebdbb2"
opac = "#28282800"
fg = soft

# Global variables
mod = "mod4"
terminal = "alacritty"
browser = "brave"
file_browser = "ranger"
home = os.path.expanduser("~")

# Dynamic multiscreen setup
d = display.Display()
s = d.screen()
r = s.root
res = r.xrandr_get_screen_resources()._data

screen_count = 0
for output in res["outputs"]:
    mon = d.xrandr_get_output_info(output, res["config_timestamp"])._data
    if mon["num_preferred"] and mon["crtc"]:
        screen_count += 1
if screen_count == 0:
    screen_count = 1

@hook.subscribe.client_managed
def auto_show_screen(window):
    window.group.cmd_toscreen()

@hook.subscribe.startup
def autostart():
    autostart = os.path.expanduser('~/.config/qtile/scripts/autostart.sh')
    subprocess.run([autostart])

@hook.subscribe.startup_once
def start_once():
    autostart = os.path.expanduser('~/.config/qtile/scripts/autostart_once.sh')
    subprocess.run([autostart])

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "control"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "control"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "control"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "control"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "shift"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "shift"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "shift"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "shift"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "s", lazy.spawn(terminal + " -e alsamixer"), desc="Volumn setting"),

    # Utility
    Key([mod], "n" , lazy.spawn("dunstctl close"), desc="Close the last notification"),
    Key([mod], "space" , lazy.spawn(home + '/.config/qtile/scripts/ibus_engine.sh'), desc="Change Ibus Engine"),
    Key([mod], "XF86AudioLowerVolume" , lazy.spawn("xbacklight -dec 5"), desc="Decrease brightness"),
    Key([mod], "XF86AudioRaiseVolume" , lazy.spawn("xbacklight -inc 5"), desc="Increase brightness"),
    Key(
        [mod],
        "Escape",
        lazy.spawn("alacritty -e betterlockscreen -l blur"),
        desc="lock screen",
    ),
    Key([], "Print", lazy.spawn("flameshot gui"), desc="Screenshot"),
    Key([mod], "p", lazy.spawn("flameshot gui"), desc="Screenshot"),
    Key([mod], "t", lazy.spawn(home + '/.config/qtile/scripts/terminal.sh'), desc="Launch terminal"),
    Key([mod, "shift"], "t", lazy.spawn(terminal + ' -e tmux'), desc="Launch new terminal tmux session"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.window.toggle_floating(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key(
        [mod],
        "e",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    # Toggle between different layouts as defined belowa mutual relationship or connection between two or more things
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),

    # RofI
    Key([mod, "shift"], "Escape", lazy.spawn(home + '/.config/rofi/powermenu/powermenu.sh'), desc="Shutdown Qtile"),
    Key([mod], "XF86AudioMute", lazy.spawn(home + '/.config/rofi/powermenu/powermenu.sh'), desc="Powermenu Qtile"),
    Key([mod], "r", lazy.spawn(home + '/.config/rofi/launchers/launcher.sh'), desc="Launch Applications"),
    Key([mod], "b", lazy.spawn(home + '/.config/rofi/bluetooth/bluetooth.sh'), desc="Bluetooth"),
    Key([mod], "w", lazy.spawn(home + '/.config/rofi/wifi/wifi.sh'), desc="Wifi"),

    # Volume
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),

    ### Switch focus of monitors
    Key([mod], "Tab",
        lazy.next_screen(),
        desc='Move focus to next monitor'
        ),
    Key([mod, "shift"], "Tab",
        lazy.prev_screen(),
        desc='Move focus to prev monitor'
        ),
]

groups = [
    Group('1', label=' ', matches=[Match(wm_class='Brave-browser')], layout='columns'),
    Group('2', label=' ', matches=[Match(wm_class='Alacritty')], layout='columns'),
    Group(
        '3', 
        label='󰹕 ',
        matches=[Match(wm_class='notion-app'),
                 # Match(wm_class='obsidian'),
                 Match(wm_class='Zathura')],
        layout='columns'),
    Group('4', label=' ', matches=[Match(wm_class='Anki')], layout='columns'),
    Group('5', label=' ', matches=[Match(wm_class='steam')], layout='columns'),
    Group('6', label=' ', matches=[Match(wm_class='Virt-manager')], layout='columns'),
    Group('7', label=' ', matches=[Match(wm_class='obs')], layout='columns'),
    Group('8', label='󰝖 ', matches=[Match(wm_class='Todoist')], layout='columns'),
    Group('9', label=' ', matches=[Match(wm_class='thunderbird')], layout='columns'),
    Group('0', label=' ', matches=[Match(wm_class='Morgen'), Match(wm_class='VirtualBox Manager')], layout='columns'),
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
           Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

layouts = [
    Columns(
        border_normal=bg,
        border_focus_stack=yellow,
        border_width=2,
        border_normal_stack=white0,
        border_focus=green,
        border_on_single=2,
        margin=6,
        margin_on_single=6,
    )
]

widget_defaults = dict(
    font="Jetbrains Mono Bold",
    fontsize=12,
    padding=10,
    foreground=bg
)
extension_defaults = widget_defaults.copy()

@lazy.function
def on_click(qtile):
    return qtile.cmd('alacritty -e focus')

screens = []
for i in range(screen_count):
    systray_widget = widget.TextBox(text='')
    if i == 0:
        systray_widget = widget.Systray()

    screens.append(
        Screen(
            top=Bar(
                [
                    widget.TextBox(
                        text=' ',
                        foreground='#ffffff',
                        background=opac,
                        padding=2
                    ),
                    widget.Image(
                        filename=home + "/.config/qtile/assets/logo.png",
                        scale=True,
                        background=opac,
                    ),
                    widget.Clock(
                        background=opac,
                        foreground=yellow,
                        format='%H:%M',
                        ),
                    widget.WindowName(
                        foreground=fg,
                        max_chars=40,
                        width=bar.CALCULATED,
                        padding=0,
                    ),
                    widget.Spacer(),
                    widget.GroupBox(
                        disable_drag=False,
                        active=soft,
                        fontsize=14,
                        inactive=white0,
                        highlight_method='line',
                        block_highlight_text_color=soft,
                        this_screen_border=yellow,
                        this_current_screen_border=green,
                        borderwidth=2,
                        highlight_color=bg,
                        background=opac
                    ),
                    widget.Spacer(),
                    widget.CPU(
                        format='<span foreground="#d65d0e"></span>  {freq_current}GHz {load_percent}%',
                        foreground=orange0,
                        background=opac),
                    widget.Memory(
                        format='<span foreground="#a89984"></span> {MemPercent: .0f}%',
                        measure_mem='G',
                        foreground=gray0,
                        background=opac),
                    widget.GenPollText(
                        name="Volume",
                        fmt="{}",
                        update_interval=0,
                        background=opac,
                        func=lambda: subprocess.check_output(home + "/.config/qtile/scripts/volume").decode("utf-8"),
                        foreground=soft,
                        padding=0),
                    widget.Spacer(length=15),
                ],
                margin=[10, 10, 5, 10],
                background=opac,
                opacity=1,
                size=25,
            ),
            bottom=Bar(
                [
                    widget.GenPollText(
                        name="Battery",
                        fmt="{}",
                        update_interval=60,
                        background=opac,
                        func=lambda: subprocess.check_output(home + "/.config/qtile/scripts/battery").decode("utf-8"),
                        padding=0),
                    widget.Spacer(),
                    widget.Clock(
                        background=opac,
                        foreground=yellow0,
                        format=' %A, %B %d, %Y',
                        padding=0),
                    widget.Spacer(),
                    systray_widget,
                    widget.Spacer(length=15),
                ],
                margin=[5, 10, 10, 10],
                background=opac,
                opacity=1,
                size=25,
            ),
            left=bar.Gap(6),
            right=bar.Gap(6),
        )
    )

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False

floating_layout = Floating(
    border_normal=white0,
    border_focus=soft,
    border_width=3,
    float_rules=[
        *Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
        Match(wm_class="pavucontrol"),
        Match(wm_class="zoom"),
        Match(wm_class="bitwarden"),
        Match(wm_class="kdenlive"),
    ]
)

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
