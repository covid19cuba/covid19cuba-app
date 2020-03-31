function logx(base, x){
    if(base == 10){
        return Math.log10(x);
    }
    return Math.log10(x)/Math.log10(base);
}

covidData = function (data) {

    var factor = 45;
    var cases = {};
    for (var day in data.dias) {
        if ('diagnosticados' in data.dias[day]) {
            var diag = data.dias[day].diagnosticados;
            for (var p in diag) {
                cases[diag[p].id] = diag[p];
                cases[diag[p].id]['fecha'] = data.dias[day].fecha;
            }
        }
    }

    var casos = cases;


    function getAllRegions() {
        var muns = {};
        var pros = {};
        for (var c in casos) {

            if (!(casos[c].dpacode_municipio_deteccion in muns)) {
                muns[casos[c].dpacode_municipio_deteccion] = { "total": 1 }
            } else {
                muns[casos[c].dpacode_municipio_deteccion].total += 1;
            }
            if (!(casos[c].dpacode_provincia_deteccion in pros)) {
                pros[casos[c].dpacode_provincia_deteccion] = { "total": 1 }
            } else {
                pros[casos[c].dpacode_provincia_deteccion].total += 1;
            }
        }
        return { 'muns': muns, 'pros': pros };
    }

    var regions = getAllRegions();
    var muns = regions.muns;
    var pros = regions.pros;

    function resumeCases() {
        var max_muns = 0;
        var max_pros = 0;
        var total = 0;
        for (var m in muns) {
            if (max_muns < muns[m].total) {
                max_muns = muns[m].total;
            }
            total += muns[m].total;
        }
        for (var p in pros) {
            if (max_pros < pros[p].total) {
                max_pros = pros[p].total;
            }
        }

        return {
            'max_muns': max_muns,
            'max_pros': max_pros,
            'total': total
        };
    }

    var genInfo = resumeCases();


    var geojsonM = L.geoJSON(municipios, { style: styleM });

    var geojsonP = L.geoJSON(provincias, { style: styleP });

    function getMunProfile(code, mun, pro) {
        var t = '';
        t += '<div class="small-pname"><span class="bd">' + pro + '</span> - <span>' + mun + '</span></div>';
        if (code in muns) {
            t += '<div class="small-content"><span class="bd">Diagnosticados:</span> <span>' + muns[code].total + '</span></div>';
        } else {
            t += '<div class="small-content">No hay casos diagnosticados</div>';
        }
        t += '<div class="small-plink">&nbsp;</div>';

        return t;
    }

    function getProProfile(code, pro) {
        var t = '';
        t += '<div class="small-pname"><span class="bd">' + pro + '</span></div>';
        if (code in pros) {
            t += '<div class="small-content"><span class="bd">Diagnosticados:</span> <span>' + pros[code].total + '</span></div>';
        } else {
            t += '<div class="small-content">Sin casos reportados aún</div>';
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

    geojsonP.bindPopup(function (layer) {
        var pcode = layer.feature.properties.DPA_province_code;
        var pro = layer.feature.properties.province;
        return getProProfile(pcode, pro);
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

    function styleP(feature) {
        return {
            weight: 0.5,
            opacity: 0.8,
            color: '#f5f1f1',
            fillOpacity: 1,
            fillColor: getColorP(feature.properties.DPA_province_code)
        };
    }

    function getColorM(code) {
        if (code in muns) {
            var opac = logx(factor,muns[code].total * factor / genInfo.max_muns);
            return "rgba(176,30,34," + opac + ")";
        }
        return '#D1D2D4';
    }

    function getColorP(code) {
        if (code in pros) {
            var opac = logx(factor,pros[code].total * factor / genInfo.max_pros);
            return "rgba(176,30,34," + opac + ")";
        }
        return '#D1D2D4';
    }

    var map_mun = L.map('map-mun', {
        center: [21.5, -79.371124],
        zoom: 15,
        layers: [geojsonM],
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
    map_mun.fitBounds(geojsonM.getBounds());

    var map_pro = L.map('map-pro', {
        center: [21.5, -79.371124],
        zoom: 15,
        layers: [geojsonP],
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
    map_pro.zoomControl.setPosition('topright');
    map_pro.fitBounds(geojsonP.getBounds());


    function setBounds() {

        $('#map-pro').show();
        $('#map-mun').show();
        map_pro.fitBounds(geojsonP.getBounds());
        map_mun.fitBounds(geojsonM.getBounds());
        $('#map-pro').hide();

    }

    window.addEventListener('resize', setBounds);

    $('#map-pro').hide();
    $('#map-mun').show();

}

