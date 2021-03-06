function Marker({lng, lat, acc}) {
    const circle = L.circle([lat, lng], {
        color: '#ff000009',
        fillColor: '#f03',
        fillOpacity: 0.5,
        radius: 20000 * 2**6 * 1/2**acc
    })
    if (acc < 11) {
        return circle;
    }
    const marker = L.marker([lat, lng])
    const self = {
        addTo: (map) => {
            circle.addTo(map);
            marker.addTo(map)
            return self
        },
        bindPopup: (text) => {
            circle.bindPopup(text)
            return self
        },
        remove: () => {
            circle.remove()
            marker.remove()
        }
    }
    return self
}

export default Marker
