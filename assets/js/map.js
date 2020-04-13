function logx(base, x){
    if(base == 10){
        return Math.log10(x);
    }
    return Math.log10(x)/Math.log10(base);
}

var map_mun = L.map('map-mun', {
    center: [21.5, -79.371124],
    zoom: 15,
    keyboard: false,
    dragging: true,
    zoomControl: true,
    boxZoom: false,
    doubleClickZoom: false,
    scrollWheelZoom: false,
    tap: true,
    touchZoom: true,
    zoomSnap: 0.05,
    zoomControl: true
});
map_mun.zoomControl.setPosition('topright');
geojsonM = null;

covidData = function (data) {

    var factor = 100;
    var muns = data.muns;
    var genInfo = data.genInfo;

    if (geojsonM)
        map_mun.removeLayer(geojsonM);

    geojsonM = L.geoJSON(municipios, { style: styleM });

    function getMunProfile(code, mun, pro) {
        var t = '';
        t += '<div class="small-pname"><span class="bd">' + pro + '</span> - <span>' + mun + '</span></div>';
        if (code in muns) {
            t += '<div class="small-content"><span class="bd">Diagnosticados:</span> <span>' + muns[code] + '</span></div>';
        } else {
            t += '<div class="small-content">No hay casos diagnosticados</div>';
        }
        t += '<div class="small-plink">&nbsp;</div>';

        return t;
    }

    geojsonM.bindPopup(function (layer) {
        var mcode = layer.feature.properties.DPA_municipality_code;
        var mun = layer.feature.properties.municipality;
        var pro = layer.feature.properties.province;
        return getMunProfile(mcode, mun, pro);
    });

    function styleM(feature) {
        return {
            weight: 0.5,
            opacity: 0.8,
            color: '#f5f1f1',
            fillOpacity: 1,
            fillColor: getColorM(feature.properties.DPA_municipality_code)
        };
    }

    function getColorM(code) {
        if (code in muns) {
            var opac = logx(factor,muns[code] * factor / genInfo.max_muns);
            return "rgba(176,30,34," + opac + ")";
        }
        return '#D1D2D4';
    }

    map_mun.addLayer(geojsonM);
    map_mun.fitBounds(geojsonM.getBounds());
    map_mun.setMaxBounds(geojsonM.getBounds());

}

covidData2 = function (data) {

    var factor = 100;
    var pros = data.pros;
    var genInfo = data.genInfo;

    if (geojsonM)
        map_mun.removeLayer(geojsonM);

    geojsonM = L.geoJSON(provincias, { style: styleP });

    function getProProfile(code, pro) {
        var t = '';
        t += '<div class="small-pname"><span class="bd">' + pro + '</span></div>';
        if (code in pros) {
            t += '<div class="small-content"><span class="bd">Diagnosticados:</span> <span>' + pros[code] + '</span></div>';
        } else {
            t += '<div class="small-content">Sin casos reportados aún</div>';
        }
        t += '<div class="small-plink">&nbsp;</div>';

        return t;
    }

    geojsonM.bindPopup(function (layer) {
        var pcode = layer.feature.properties.DPA_province_code;
        var pro = layer.feature.properties.province;
        return getProProfile(pcode, pro);
    });

    function styleP(feature) {
        return {
            weight: 0.5,
            opacity: 0.8,
            color: '#f5f1f1',
            fillOpacity: 1,
            fillColor: getColorP(feature.properties.DPA_province_code)
        };
    }

    function getColorP(code) {
        if (code in pros) {
            var opac = logx(factor,pros[code] * factor / genInfo.max_pros);
            return "rgba(176,30,34," + opac + ")";
        }
        return '#D1D2D4';
    }

    map_mun.addLayer(geojsonM);
    map_mun.fitBounds(geojsonM.getBounds());
    map_mun.setMaxBounds(geojsonM.getBounds());
}


filterByProvince = function (province_id, data) {
    let features = [];
    for (const i in data.features) {
        const municipality = data.features[i].properties;
        if (municipality.DPA_province_code === province_id) {
            features.push(data.features[i]);
        }
    }
    var ret = Object.assign({}, data);
    ret.features=features;
    return ret;
}

covidData3 = function (data, province_id) {
        var municipalitydata = JSON.parse(strGeoJson);
        var factor = 100;
        var muns = data.muns;
        var genInfo = data.genInfo;
        var features = [];
        for (const i in municipalitydata.features) {
            const municipality = municipalitydata.features[i].properties;
            if (municipality.DPA_province_code === province_id) {
                features.push(municipalitydata.features[i]);
            }
        }
        var filtermunicipality = Object.assign({}, municipalitydata);
        filtermunicipality.features=features;

        if (geojsonM)
            map_mun.removeLayer(geojsonM);

        geojsonM = L.geoJSON(filtermunicipality, { style: styleM });

       function getMunProfile(code, mun, pro) {
            var t = '';
            t += '<div class="small-pname"><span class="bd">' + pro + '</span> - <span>' + mun + '</span></div>';
            if (code in muns) {
                t += '<div class="small-content"><span class="bd">Diagnosticados:</span> <span>' + muns[code] + '</span></div>';
            } else {
                t += '<div class="small-content">No hay casos diagnosticados</div>';
            }
            t += '<div class="small-plink">&nbsp;</div>';

            return t;
        }

        geojsonM.bindPopup(function (layer) {
            var mcode = layer.feature.properties.DPA_municipality_code;
            var mun = layer.feature.properties.municipality;
            var pro = layer.feature.properties.province;
            return getMunProfile(mcode, mun, pro);
        });

        function styleM(feature) {
            return {
                weight: 0.5,
                opacity: 0.8,
                color: '#f5f1f1',
                fillOpacity: 1,
                fillColor: getColorM(feature.properties.DPA_municipality_code)
            };
        }

        function getColorM(code) {
            if (code in muns) {
                var opac = logx(factor,muns[code] * factor / genInfo.max_muns);
                return "rgba(176,30,34," + opac + ")";
            }
            return '#D1D2D4';
        }

        map_mun.addLayer(geojsonM);
        map_mun.fitBounds(geojsonM.getBounds());
        map_mun.setMaxBounds(geojsonM.getBounds());
}