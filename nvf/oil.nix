{
  enable = true;
  setupOpts = {
    default_file_explorer = true;
    delete_to_trash = true;
    watch_for_changes = true;
    columns = [ "icon" ];
    #view_options = {
    #  is_always_hidden = ''
    #    function(name, _)
    #      return name == '..' or name == '.git'
    #    end,
    #  '';
    #};
    win_options = {
      wrap = false;
    };
  };
}
