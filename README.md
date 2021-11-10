# TheMateMonitor
A system to monitor inmates

# The Problem
Monitoring inmates or any target is typically done using man power. It means there will be a person to monitor the inmates or there will be cameras to monitor and a person will be there to watch the camera feeds. But this type of monitoring can only be done in a limited geographical boundary. To extend the boundaries the cost of monitoring must be increased and the vulnerability also increases itself. So a new method is required to monitor the inmates. 

# Existing solutions

![image](https://user-images.githubusercontent.com/58026793/141170413-97cebf4a-e802-4edb-b5d6-87b3577c04f9.png)
![image](https://user-images.githubusercontent.com/58026793/141170439-26b75102-f06a-43c5-8a3d-f6664595dca7.png)

........![image](https://user-images.githubusercontent.com/58026793/141170463-6a593a56-af02-4b40-b72e-976672df9173.png)
![image](https://user-images.githubusercontent.com/58026793/141170480-03aa2597-8d7a-45e6-8415-f7e78542efa4.png)
![image](https://user-images.githubusercontent.com/58026793/141170491-964c621a-4fa4-413e-935c-2262f62b3c2e.png) ..........

The above companies are already providing a specialized tracking service. They help the management to
- keep locate the inmate inside a building.
- view the records of an inmate on screeen whenever needed.
- collect temperature signature to confirm the inmate is wearing the required device.
- track movement history to detect suspecious activities.

The main target of the existing systems is to monitor the inmate inside a building or a relatively small area. But keeping a person in the prison or in observation center will cost a lot and the productivity because of that person will decrease. So leting the low risk inmates to do live their normal life while observing their actions could be an effective solution which will reduce cost a lot. 

## The Proposed Solution
- A wearable device which will sent alert if broken or removed from body, Which will authente the person wearing it periodically according to the requirment of the management, which should use a very less power, which should be able to communicate over a very large distance.

- A stable network which can manage a considerable number of end devices and can provide network coverage to a very large geographical area.

- An application to be used by the management to view the data collected and the alerts according to the criterias made.


# Project Scope
1. use microcontrollers and lora modules as end nodes and gateways, to collect and send data over lorawan network using "The Things Network"
2. use existing services like AWS to manage the data and setup pipelines and trigers
3. Create a simple webapp through which the admin users can monitor collected data and can receive the warnings depends on the data received.

## Why?

1. Lora Wan
- low power consumption
- wide range
- Suitable for location tracking


2. The Things Network
- Easy to manage end nodes and Gateways
- Easy to integrate the devices with services like AWS

# THE INMATE MONITOR

## Features
### Security
The wearable device must notify the authorities if any attempt taken to remove or damage the device.
- So fiber optics cable can be fixed inside the band, if the light signal from one end to the other end is disturbed an alert could be sewnt imediatly to the network and the network has to notify the monitoring party.
- Or a small copper wire can be used to ensure that the band is not broken and notification can be sent if the resistance of the connecting cable changes. so if some one tries to bypass the cable it will get caught.

### Authentication
The must verify th eperson periodically. the time interval could be decided by the monitoring party according to the risk level of the target being monitored.
- Fingerprint sensors can be used to verify th eperson. As the need of verifying is periodical the sensor could be only activated in the needed time to save power.

### Thermal Signature
A thermal signature could be observed and recorded to ensure the device is being worn by the same person. and to make sure that the device is being worn.

### Location History
It is obvious that keeping location history is very omportant not only to keep the inmate in the given border like a town or a district. But also to observe several inmates and their movements in odd times and the suspecious geatherings of two or more inmates also could be identified. 


