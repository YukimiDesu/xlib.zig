pub const x = @cImport({
    @cInclude("X11/Xlib.h");
    @cInclude("X11/keysym.h");
});

pub const Display = struct {
    x_display: ?*x.Display,
};

pub fn OpenDisplay(display_name: ?[]u8) ?Display {
    const dpy = x.XOpenDisplay(if (display_name != null) @ptrCast(display_name.?) else null);
    if (dpy == null) return null;
    return Display{
        .x_display = dpy,
    };
}
