# SwayNC - Custom Notification System

A beautiful notification system perfectly integrated with your Catppuccin Mocha theme.

## Features

✨ **Beautiful Notifications**: Styled with Catppuccin Mocha colors  
🎛️ **Control Center**: Modern notification panel with controls  
⌨️ **Keyboard Shortcuts**: Easy access via keybinds  
🔧 **Customizable**: Easily modify styles and behavior  

## Controls

| Action | Keybind | Description |
|--------|---------|-------------|
| Toggle Notification Center | `Super + N` | Open/close notification panel |
| Click Waybar Bell | Mouse Click | Toggle notification center |
| Right-click Waybar Bell | Right Click | Dismiss all notifications |

## Notification Types

- **Normal**: Blue border, standard priority
- **Low**: Subtle styling, lower opacity  
- **Critical**: Red border, persistent display
- **Media**: Special styling for music/media notifications

## Testing

Run the test script to see all notification types:
```bash
~/.config/swaync/test-notifications.sh
```

## Customization

### Colors
All colors are defined using Catppuccin Mocha palette in `style.css`. Modify the color variables to customize:

```css
@define-color blue #89b4fa;
@define-color red #f38ba8;
@define-color green #a6e3a1;
/* ... etc */
```

### Behavior
Modify notification behavior in `config.json`:
- `timeout`: How long notifications stay visible
- `control-center-width`: Width of notification panel
- `notification-icon-size`: Size of notification icons

## Integration

- **Waybar**: Shows notification status and count
- **Hyprland**: Configured to auto-start with session
- **Theme**: Matches your existing Catppuccin setup

Enjoy your beautiful new notification system! 🎉 