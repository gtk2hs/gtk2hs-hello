module Main (main) where

import Graphics.UI.Gtk
       (dialogRun, messageDialogNew, containerAdd, widgetShowAll,
        widgetDestroy, windowTitle, mainGUI, mainQuit, objectDestroy,
        buttonActivated, buttonLabel, containerChild, on,
        containerBorderWidth, buttonNew, windowNew, initGUI, set,
        AttrOp(..), ButtonsType(..), MessageType(..))

main :: IO ()
main = do
    -- Initialise Gtk.
    initGUI
    -- Make our main window.
    window <- windowNew
    -- When the window is destroyed quit the application.
    on window objectDestroy mainQuit
    -- Set the border width and title of the window.
    set window [ containerBorderWidth := 10, windowTitle := "Hello, World!" ]
    -- Make a "Hello, World!" button.
    button <- buttonNew
    set button [ buttonLabel := "Hello, World!" ]
    -- When the button is clicked pop up a "Hello, World!" message dialog box.
    on button buttonActivated $ do
        md <- messageDialogNew (Just window) [] MessageInfo ButtonsOk "Hello, World!"
        set md [ windowTitle := "Hello, World!" ]
        dialogRun md
        widgetDestroy md
    -- Add the button into the window.
    containerAdd window button
    -- Show the window (otherwise it will remain hidden).
    widgetShowAll window
    -- Start the main loop (this will continue until mainQuit is called).
    mainGUI
