function [hMenu, hButtons] = render_uimgraudiotoolbar(hFrame)
%RENDER_UIMGRBASICAUDIOMENUTOOLBAR Create UIMGR-based objects of basic 
%   audio toolbar buttons and menu items.
%   [HMENU, HBUTTONS] = RENDER_UIMGRBASICAUDIOTOOLBAR uses the
%   Signal Processing Toolbox UIMGR package to plugin a new toolbar and 
%   a menu with play, pause, and stop buttons and menu items that will 
%   operate on an audioplayer object.
%   

%   Copyright 1984-2019 The MathWorks, Inc.

% Play callbacks
fcns = menus_cbs;
      
% Play toolbar uimgr objects
icons = load('uiscope_icons');
tooltips = {'Play',...
            'Pause',...
            'Stop'};

tags = {'play',...
        'pause',...
        'stop'};

hToolbar = findobj(hFrame.Children,'Tag','uitoolbar_Toolbar');
hButtons.bPlay = uitoggletool(hToolbar,...
    'Tag',tags{1},...
    'CData',icons.play_off,...
    'TooltipString', tooltips{1},...
    'ClickedCallback',fcns.play_cb);
hButtons.bPause = uitoggletool(hToolbar,...
    'Tag',tags{2},...
    'CData',icons.pause_default,...
    'TooltipString', tooltips{2},...
    'Enable','off',...
    'ClickedCallback',fcns.pause_cb);

hButtons.bPause = uitoggletool(hToolbar,...
    'Tag',tags{3},...
    'CData',icons.stop_default,...
    'TooltipString', tooltips{3},...
    'Enable','off',...
    'ClickedCallback',fcns.stop_cb);

% Playback menus uimgr objects
hMenu = uimenu(hFrame,'Label','&Playback','Tag','uimgr.uimenugroup_Playback');

hMenugroup.mPlay = spcwidgets.ToggleMenu( ...
    hMenu, ...
    'Tag', 'uimgr.spctogglemenu_Play', ...
    'Label', '&Play', ...
    'Callback', fcns.play_cb);

hMenugroup.mPause = spcwidgets.ToggleMenu( ...
    hMenu, ...
    'Tag', 'uimgr.spctogglemenu_Pause', ...
    'Label', 'P&ause', ...
    'Enable', 'off',...
    'Callback', fcns.pause_cb);
hMenugroup.mStop = spcwidgets.ToggleMenu( ...
    hMenu, ...
    'Tag', 'uimgr.spctogglemenu_Stop', ...
    'Label', '&Stop', ...
    'Enable', 'off',...
    'Callback', fcns.stop_cb);

end % render_uimgraudiotoolbar
% [EOF]
