## Ridership Data Dictionary
* Source: Trimet Business Analyst
* Date: 1/26/2018
* Method of Handoff: Direct transfer to USB, physical handoff
* Based on GTFS, schema resource: https://developers.google.com/transit/gtfs/reference/

## Fields
* SUMMARY_BEGIN_DATE        
    - Date of summary
* ROUTE_NUMBER        
    - Trimet Number for Bus Route
* DIRECTION        
    - Each bus goes only in 2 directions (N,S or E,W) assigned a binary
    - Binary (0,1)
* SERVICE_KEY
    - W = Weekday
    - S = Saturday
    - U = Sunday
    - X = Holiday/Extra Service        
* STOP_SEQ        
    - The stop_sequence field identifies the order of the stops for a particular trip. The values for stop_sequence must be non-negative integers, and they must increase along the trip. For example, the first stop on the trip could have a stop_sequenceof 1, the second stop on the trip could have a stop_sequence of 23, the third stop could have a stop_sequence of 40, and so on.
* LOCATION_ID
    - Trimet Stop ID        
* PUBLIC_LOCATION_DESCRIPTION        
    - Public Location Description
* ONS        
    - How many customer boarded 
* OFFS        
    - How many customers departed
* X_COORD        
    - X Coordinate based in State Plane NAD83 (2913)
* Y_COORD
    - Y Coordinate based in State Plane NAD83 (2913)

Reference for EPSG:2913: <https://epsg.io/2913>.
