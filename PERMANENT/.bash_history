v.in.ogr input=D:\natural-earth\10m_cultural\10m_cultural\ne_10m_admin_0_countries.shp
v.in.ogr input=D:\natural-earth\10m_cultural\10m_cultural\ne_10m_admin_0_countries_lakes.shp
g.rename vector=ne_10m_admin_0_countries_lakes@PERMANENT,countries
v.in.ogr input=D:\natural-earth\10m_cultural\10m_cultural\ne_10m_admin_1_states_provinces_lakes.shp
g.rename --overwrite vector=ne_10m_admin_1_states_provinces_lakes@PERMANENT,provinces
v.in.ogr -t input=D:\natural-earth\10m_cultural\10m_cultural\ne_10m_railroads.shp
v.in.ogr -t --overwrite input=D:\natural-earth\10m_cultural\10m_cultural\ne_10m_railroads.shp
g.rename --overwrite vector=ne_10m_railroads@PERMANENT,railroads
v.in.ogr -t --overwrite input=D:\natural-earth\10m_cultural\10m_cultural\ne_10m_roads.shp
g.rename --overwrite vector=ne_10m_roads@PERMANENT,roads
v.in.ogr --overwrite input=D:\natural-earth\10m_cultural\10m_cultural\ne_10m_time_zones.shp snap=1e-008
g.rename --overwrite vector=ne_10m_time_zones@PERMANENT,timezones
v.in.ogr --overwrite input=D:\natural-earth\10m_physical\ne_10m_coastline.shp output=coastlines
v.in.ogr --overwrite input=D:\natural-earth\10m_physical\ne_10m_geography_marine_polys.shp output=marine_regions
v.in.ogr --overwrite input=D:\natural-earth\10m_physical\ne_10m_geography_regions_polys.shp output=regions snap=1e-009
v.in.ogr --overwrite input=D:\natural-earth\10m_physical\ne_10m_glaciated_areas.shp output=glaciated_areas
v.in.ogr --overwrite input=D:\natural-earth\10m_physical\ne_10m_lakes.shp output=lakes
v.in.ogr --overwrite input=D:\natural-earth\10m_physical\ne_10m_land.shp output=land
v.in.ogr --overwrite input=D:\natural-earth\10m_physical\ne_10m_ocean.shp output=ocean
v.in.ogr --overwrite input=D:\natural-earth\10m_physical\ne_10m_rivers_lake_centerlines_scale_rank.shp output=rivers
r.in.gdal input=D:\natural-earth\NE1_HR_LC_SR_W_DR\NE1_HR_LC_SR_W_DR.tif output=natural_earth
r.composite red=natural_earth.red@PERMANENT green=natural_earth.green@PERMANENT blue=natural_earth.blue@PERMANENT output=natural_earth
g.remove -f type=raster name=natural_earth.blue@PERMANENT,natural_earth.green@PERMANENT,natural_earth.red@PERMANENT
r.info map=natural_earth@PERMANENT
g.region res=0:02
r.mapcalc
r.mapcalc expression=natural_earth_subsampled = natural_earth@PERMANENT
g.region res=0:015
g.region res=0.015
r.mapcalc expression=natural_earth_subsampled = natural_earth@PERMANENT
r.mapcalc --overwrite expression=natural_earth_subsampled = natural_earth@PERMANENT
g.region res=0.02
r.mapcalc --overwrite expression=natural_earth_subsampled = natural_earth@PERMANENT
g.rename
g.rename raster=natural_earth_subsampled@PERMANENT,natural_earth
g.rename --overwrite raster=natural_earth_subsampled@PERMANENT,natural_earth
