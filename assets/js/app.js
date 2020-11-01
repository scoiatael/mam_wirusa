// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"

import Map from "./map"
import Marker from "./marker"

const mapID = 'map-hero'
const mapEl = window.document.getElementById(mapID)
if (mapEl) {
  const map = Map(mapEl)

  if (window.Cases) {
    window.Cases.map(([lng, lat, acc, info, reported_at]) =>
                     Marker({lng, lat, acc}).bindPopup(`${reported_at} - ${info}`).addTo(map))
  }
}
