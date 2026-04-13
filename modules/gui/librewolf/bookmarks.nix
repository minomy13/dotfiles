{ ... }:
{
  hm.programs.librewolf.profiles.default.bookmarks = {
    force = true;
    settings = [
      {
        name = "Toolbar";
        toolbar = true;
        bookmarks = [
          {
            name = "Development";
            bookmarks = [
              {
                name = "Codeberg";
                url = "https://codeberg.org";
              }
              {
                name = "GitHub";
                url = "https://github.com";
              }
            ];
          }
          {
            name = "Language";
            bookmarks = [
              {
                name = "WaniKani";
                url = "https://wanikani.com";
              }
            ];
          }
        ];
      }
    ];
  };
}
