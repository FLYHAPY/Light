return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 125,
  height = 34,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 3,
  nextobjectid = 95,
  properties = {},
  tilesets = {
    {
      name = "Mytileset",
      firstgid = 1,
      class = "",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      columns = 7,
      image = "Tileset.png",
      imagewidth = 448,
      imageheight = 256,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      wangsets = {},
      tilecount = 28,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 125,
      height = 34,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        25, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 11, 12, 12, 12, 12, 12, 12, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 11, 12, 12, 12, 12, 12, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 11, 12, 12, 12, 12, 12, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 11, 12, 12, 12, 12, 12, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 11, 12, 12, 12, 12, 12, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17, 18, 19, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 0, 0, 0, 0, 0, 0, 24, 24, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 25,
        25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 0, 0, 0, 0, 0, 0, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 25,
        25, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 0, 0, 0, 0, 0, 0, 0, 0, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 28, 9, 9, 9, 9, 9, 9, 9, 9, 27, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 1, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 27, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 27, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 27, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 22, 22, 22, 22, 22, 22, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 27, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 28, 9, 2, 2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 27, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 8, 9, 9, 9, 9, 9, 9, 9, 10, 23, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 27, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 8, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 27, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 24, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 8, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 27, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 8, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 21, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 8, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 8, 9, 9, 9, 9, 9, 9, 9, 27, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 26, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 23, 23, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 25,
        25, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 26, 9, 9, 9, 9, 9, 9, 9, 25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 25,
        25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 26, 9, 9, 9, 9, 9, 9, 9, 9, 25, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 28, 9, 9, 9, 9, 10, 0, 0, 0, 23, 23, 25,
        25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 22, 22, 22, 22, 22, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 26, 9, 9, 9, 9, 9, 9, 9, 9, 9, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 25,
        25, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 26, 9, 9, 9, 9, 9, 9, 9, 9, 9, 27, 2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 26, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 25,
        25, 0, 0, 0, 0, 0, 0, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 1, 26, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 26, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 9, 9, 9, 9, 10, 23, 23, 0, 0, 0, 25,
        25, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 26, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 24, 24, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 26, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 23, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 16, 16, 16, 16, 17, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 26, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 23, 0, 0, 23, 0, 0, 23, 0, 0, 23, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 27, 2, 2, 2, 2, 2, 26, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 23, 0, 0, 23, 0, 0, 23, 0, 0, 23, 0, 0, 0, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 23, 25,
        25, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 25, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 25,
        25, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 25, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 25
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "Object Layer 1",
      class = "",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7.10543e-15,
          y = 1856,
          width = 448,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 3,
          name = "",
          class = "",
          shape = "rectangle",
          x = 512,
          y = 1728,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 4,
          name = "",
          class = "",
          shape = "rectangle",
          x = 447.864,
          y = 1792,
          width = 192.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 5,
          name = "",
          class = "",
          shape = "rectangle",
          x = 64,
          y = 1408,
          width = 959.731,
          height = 191.667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 6,
          name = "",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 450.845,
          width = 63.9583,
          height = 1411.49,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 7,
          name = "",
          class = "",
          shape = "rectangle",
          x = 640,
          y = 1856,
          width = 448,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 8,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1088,
          y = 1792,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 9,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1152,
          y = 1728,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 10,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1216,
          y = 1664,
          width = 1088.54,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 12,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1919.33,
          y = 1728,
          width = 384.667,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 13,
          name = "",
          class = "",
          shape = "rectangle",
          x = 2304,
          y = 1984,
          width = 320,
          height = 186.667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 14,
          name = "",
          class = "",
          shape = "rectangle",
          x = 2624,
          y = 1920,
          width = 1218.54,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 16,
          name = "",
          class = "",
          shape = "rectangle",
          x = 2816,
          y = 1856,
          width = 575.428,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 17,
          name = "",
          class = "",
          shape = "rectangle",
          x = 2882,
          y = 1792,
          width = 446.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 18,
          name = "",
          class = "",
          shape = "rectangle",
          x = 64,
          y = 896,
          width = 255.762,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 19,
          name = "",
          class = "",
          shape = "rectangle",
          x = 3840,
          y = 1856,
          width = 382.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 20,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4224,
          y = 1792,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 21,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4288,
          y = 1728,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 22,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4352,
          y = 1664,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 23,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4416,
          y = 1600,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 26,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4484,
          y = 1540,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 27,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4544,
          y = 1472,
          width = 510.625,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 28,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5056,
          y = 1088,
          width = 63.9583,
          height = 1081,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 30,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1728,
          y = 1216,
          width = 510.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 31,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1793,
          y = 1152,
          width = 383.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 32,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1856,
          y = 1088,
          width = 255.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 33,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1920,
          y = 1024,
          width = 129.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 34,
          name = "",
          class = "",
          shape = "rectangle",
          x = 576,
          y = 1216,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 35,
          name = "",
          class = "",
          shape = "rectangle",
          x = 512,
          y = 1152,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 36,
          name = "",
          class = "",
          shape = "rectangle",
          x = 448,
          y = 1088,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 37,
          name = "",
          class = "",
          shape = "rectangle",
          x = 384,
          y = 1024,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 38,
          name = "",
          class = "",
          shape = "rectangle",
          x = 320,
          y = 960,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 40,
          name = "",
          class = "",
          shape = "rectangle",
          x = 576,
          y = 768,
          width = 3649.21,
          height = 126.667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 42,
          name = "",
          class = "",
          shape = "rectangle",
          x = 832,
          y = 704,
          width = 255.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 43,
          name = "",
          class = "",
          shape = "rectangle",
          x = 896,
          y = 640,
          width = 129.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 44,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1472,
          y = 704,
          width = 129.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 45,
          name = "",
          class = "",
          shape = "rectangle",
          x = 2176,
          y = 640,
          width = 63.9583,
          height = 127.667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 46,
          name = "",
          class = "",
          shape = "rectangle",
          x = 2368,
          y = 640,
          width = 63.9583,
          height = 127.667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 47,
          name = "",
          class = "",
          shape = "rectangle",
          x = 2944,
          y = 704,
          width = 640.428,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 48,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4224,
          y = 832,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 49,
          name = "",
          class = "",
          shape = "rectangle",
          x = 3583.67,
          y = 896,
          width = 768.292,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 50,
          name = "",
          class = "",
          shape = "rectangle",
          x = 3583.33,
          y = 960,
          width = 2112.62,
          height = 127.417,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 51,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5312,
          y = 1088,
          width = 384.667,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 52,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5696,
          y = 1408,
          width = 896.625,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 53,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6592,
          y = 1344,
          width = 1021.66,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 54,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7236,
          y = 1408,
          width = 379.958,
          height = 510.333,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 55,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5120,
          y = 1600,
          width = 2112.44,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 56,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5120,
          y = 2048,
          width = 2811.11,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 57,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5760,
          y = 1921.33,
          width = 63.9583,
          height = 126.333,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 58,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6528,
          y = 1920,
          width = 63.9583,
          height = 126.333,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 59,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6336,
          y = 1860,
          width = 63.9583,
          height = 186.333,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 60,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6144,
          y = 1793.33,
          width = 63.9583,
          height = 253,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 61,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5952,
          y = 1854.67,
          width = 63.9583,
          height = 191.666,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 62,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6784,
          y = 1984,
          width = 191.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 63,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6848,
          y = 1920,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 64,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6784,
          y = 1280,
          width = 445.762,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 65,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6848,
          y = 1216,
          width = 315.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 66,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6912,
          y = 1152,
          width = 191.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 67,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6976,
          y = 1088,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 68,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7616,
          y = 1408,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 69,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7680,
          y = 1408,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 70,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7808,
          y = 1600,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 71,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7872,
          y = 1600,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 72,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7616,
          y = 1792,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 73,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7680,
          y = 1792,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 74,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7808,
          y = 1984,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 75,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7872,
          y = 1984,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 77,
          name = "",
          class = "",
          shape = "rectangle",
          x = 7936.02,
          y = 125.5,
          width = 63.9583,
          height = 2051,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 78,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4416,
          y = 640,
          width = 3513.21,
          height = 126.667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 79,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4672,
          y = 0,
          width = 3326.54,
          height = 126.667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 80,
          name = "",
          class = "",
          shape = "rectangle",
          x = 8.36364,
          y = 127.758,
          width = 5112.85,
          height = 318.909,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 82,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4672,
          y = 448,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 83,
          name = "",
          class = "",
          shape = "rectangle",
          x = 640,
          y = 1280,
          width = 3711.96,
          height = 126.333,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 84,
          name = "",
          class = "",
          shape = "rectangle",
          x = 3776,
          y = 1216,
          width = 189.958,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 85,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5696,
          y = 1088,
          width = 128.083,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 86,
          name = "",
          class = "",
          shape = "rectangle",
          x = 4928,
          y = 896,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 87,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5376,
          y = 576,
          width = 191.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 88,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5440,
          y = 512,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 89,
          name = "",
          class = "",
          shape = "rectangle",
          x = 5952,
          y = 576,
          width = 127.833,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 90,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6528,
          y = 576,
          width = 315.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 91,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6592,
          y = 512,
          width = 191.095,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        },
        {
          id = 92,
          name = "",
          class = "",
          shape = "rectangle",
          x = 6656,
          y = 448,
          width = 63.9583,
          height = 63.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["collidable"] = true
          }
        }
      }
    }
  }
}
