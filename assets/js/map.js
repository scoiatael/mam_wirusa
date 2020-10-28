import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
/* This code is needed to properly load the images in the Leaflet CSS */
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
  iconUrl: require('leaflet/dist/images/marker-icon.png'),
  shadowUrl: require('leaflet/dist/images/marker-shadow.png'),
});

const PolandCenter = [52.25, 19, 25]

function Map(el) {
    const map = L.map(el).setView(PolandCenter, 6);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    const popup = L.popup();
    const targetLatLng = el.getAttribute('data-target-location');
    const targetAcc = el.getAttribute('data-target-location-zoom');
    if (targetLatLng && targetAcc) {
        const targetLatLngEl = window.document.getElementById(targetLatLng)
        const targetAccEl = window.document.getElementById(targetAcc)
        function onMapClick(e) {
            popup
                .setLatLng(e.latlng)
                .setContent(e.latlng.toString())
                .openOn(map);
            targetLatLngEl.value = JSON.stringify({
                type: "Point",
                coordinates: [e.latlng.lat, e.latlng.lng]
            })
            targetAccEl.value = map.getZoom()
        }

        map.on('click', onMapClick);
    }
}
export default Map;
