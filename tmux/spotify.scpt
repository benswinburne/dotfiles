if application "Spotify" is running then
  tell application "Spotify"
    set theName to name of the current track
    set theArtist to artist of the current track
    set theAlbum to album of the current track
    set theUrl to spotify url of the current track

    if player state is stopped then
      set state to "■ "
    else
      if player state is paused then
        # set state to "ǁ ॥ "
        set state to "॥ "
      else
        set state to "▶ "
      end if
    end if

    if length of theName is less than or equal to 20 then
      set shrtName to theName
    else
      set shrtName to text 1 thru 20 of theName & "…"
    end if

    if length of theArtist is less than or equal to 20 then
      set shrtArtist to theArtist
    else
      set shrtArtist to text 1 thru 20 of theArtist & "…"
    end if

    try
      if shrtArtist is not equal to "" then
        # return "♫  " & shrtName & " - " & shrtArtist
        return state & shrtName & " - " & shrtArtist
      else
        # return "♫  " & shrtName
        return state & shrtName
      end if
    on error err
    end try
  end tell
end if
