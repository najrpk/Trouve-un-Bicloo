//
//  Station.swift
//  Trouve un Bicloo
//
//  Created by kevin jan on 20/07/2022.
//

import Foundation
import CoreLocation

struct Station: Codable {
    
    var number:             Int
    var contractName:       String
    var name:               String
    var address:             String
    var status:             String
    var position:           StationLocation
}

struct StationLocation: Codable {
    var latitude:   Double
    var longitude:  Double
}

/*
 {
   ->"number": 38,
   ->"contractName": "nantes",
   ->"name": "038-RICORDEAU",
   ->"address": "Place Alexis-Ricordeau - Chaussée de la Madeleine",
   ->"position": {
     "latitude": 47.2121084631418,
     "longitude": -1.55304912932047
   },
   "banking": true,
   "bonus": false,
   ->"status": "OPEN",
   "lastUpdate": "2022-07-20T08:34:29Z",
   "connected": true,
   "overflow": false,
   "shape": null,
   "totalStands": {
     "availabilities": {
       "bikes": 18,
       "stands": 19,
       "mechanicalBikes": 18,
       "electricalBikes": 0,
       "electricalInternalBatteryBikes": 0,
       "electricalRemovableBatteryBikes": 0
     },
     ->"capacity": 40
   },
   "mainStands": {
     "availabilities": {
       "bikes": 18,
       "stands": 19,
       "mechanicalBikes": 18,
       "electricalBikes": 0,
       "electricalInternalBatteryBikes": 0,
       "electricalRemovableBatteryBikes": 0
     },
     "capacity": 40
   },
   "overflowStands": null
 }
 */
