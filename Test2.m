%Reads the file
filename = '/Users/spencer/Downloads/map-2.osm'; 

%The lines layer represents features such as roads, sidewalks, and railroad tracks. 
%The table represents the lines using line shapes in geographic coordinates.
linesLayer = readgeotable(filename,Layer="lines");
%The points layer represents features such as traffic signals, bus stops, and subway entrances. 
%The table represents the points using point shapes in geographic coordinates.
pointsLayer = readgeotable(filename,Layer="points");


%Find the table rows that represent footpaths.
% Create a new geospatial table from the footpath table rows.
isPath = linesLayer.highway == "path";
path = linesLayer(isPath,:);

isFootpath = linesLayer.highway == "footway";
footway = linesLayer(isFootpath,:);

%Display the footpaths on a map
figure
geoplot(footway)
geolimits([44.22135 44.22883],[-76.50266 -76.48582])
title("Footpaths")

isPath = linesLayer.highway == "path";
path = linesLayer(isPath,:);

figure
geoplot(path)
geolimits([44.22135 44.22883],[-76.50266 -76.48582])
title("Pathwa")

