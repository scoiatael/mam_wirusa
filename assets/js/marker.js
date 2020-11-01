const Marker = ({lng, lat, acc}) =>
    L.circle([lat, lng], {
        color: '#ff000009',
        fillColor: '#f03',
        fillOpacity: 0.5,
        radius: 20000 * 2**6 * 1/2**acc
    })

export default Marker
