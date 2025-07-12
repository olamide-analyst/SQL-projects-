SELECT * FROM raw_air_pollution_lagos;

 -- 1. Fixing inconsistent casing in Location
UPDATE raw_air_pollution_lagos
SET Location = UPPER(Location);

SELECT DISTINCT Location from raw_air_pollution_lagos;

 -- 2. Handle missing CO values
DELETE FROM raw_air_pollution_lagos
WHERE "CO (ppm)" IS NULL;

 -- 3. check for duplicate rows
SELECT Date, Location, COUNT(*) AS readings_count
FROM raw_air_pollution_lagos
GROUP BY Date, Location, [PM2.5 (µg/m³)], [CO (ppm)], [Temperature (°C)], [Wind Speed (km/h)] 
HAVING COUNT(*) > 1;

-- 4. Remove duplicate rows using RowID
DELETE FROM raw_air_pollution_lagos
WHERE rowid NOT IN (                  
    SELECT MIN(rowid)
    FROM raw_air_pollution_lagos
    GROUP BY Date, Location, [PM2.5 (µg/m³)], [CO (ppm)], [Temperature (°C)], [Wind Speed (km/h)]
);

 -- 5. Remove Outliers: values too extreme (too high or too low) to be true
 -- Remove outliers in PM2.5 and CO (ppm)
DELETE FROM raw_air_pollution_lagos
WHERE [PM2.5 (µg/m³)] < 0 OR [PM2.5 (µg/m³)] > 500;

DELETE FROM raw_air_pollution_lagos
WHERE [CO (ppm)] < 0 OR [CO (ppm)] > 100;

 -- clean Temperature (°C) and Wind Speed (km/h) values
DELETE FROM raw_air_pollution_lagos
WHERE [Temperature (°C)] < 10 OR [Temperature (°C)] > 45;

DELETE FROM raw_air_pollution_lagos
WHERE [Wind Speed (km/h)] < 0 OR [Wind Speed (km/h)] > 100;

SELECT * FROM raw_air_pollution_lagos;
