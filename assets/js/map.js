import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import iconRetinaUrl from 'leaflet/dist/images/marker-icon-2x.png'
import iconUrl from 'leaflet/dist/images/marker-icon.png'
import shadowUrl from 'leaflet/dist/images/marker-shadow.png'

/* This code is needed to properly load the images in the Leaflet CSS */
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
    iconRetinaUrl,
    iconUrl,
    shadowUrl,
});

import Marker from "./marker"

const PolandCenter = [52.25, 19, 25]

function Map(el) {
    const map = L.map(el).setView(PolandCenter, 6);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    const popup = L.popup();
    const targetLatLng = el.getAttribute('data-target-location');
    const targetAcc = el.getAttribute('data-target-location-zoom');
    let lastMarker = null;
    if (targetLatLng && targetAcc) {
        const targetLatLngEl = window.document.getElementById(targetLatLng)
        const targetAccEl = window.document.getElementById(targetAcc)
        function onMapClick(e) {
            const acc = map.getZoom()
            const lng = e.latlng.lng
            const lat = e.latlng.lat
            if (lastMarker) {
                lastMarker.remove()
            }
            lastMarker = Marker({lng, lat, acc}).addTo(map)
            targetLatLngEl.value = JSON.stringify({
                type: "Point",
                coordinates: [lng, lat]
            })
            targetAccEl.value = acc
        }

        map.on('click', onMapClick);
    }

    return map
}
export default Map;
