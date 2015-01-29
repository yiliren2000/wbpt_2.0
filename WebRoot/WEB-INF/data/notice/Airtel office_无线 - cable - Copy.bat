route delete 10.73.26.0 mask 255.255.255.0
route delete 10.73.28.0 mask 255.255.255.0
route delete 10.73.16.0 mask 255.255.255.0
route delete 10.49.34.0 mask 255.255.255.0
route delete 10.49.38.0 mask 255.255.255.0
route delete 10.81.67.0 mask 255.255.255.0
route delete 10.81.68.0 mask 255.255.255.0
route delete 10.81.77.0 mask 255.255.255.0
route delete 10.81.78.0 mask 255.255.255.0
route delete 10.65.83.0 mask 255.255.255.0
route delete 10.65.84.0 mask 255.255.255.0
route delete 10.65.85.0 mask 255.255.255.0
route delete 10.65.77.0 mask 255.255.255.0
route delete 10.81.0.0  mask 255.255.255.0


route add 10.73.16.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.73.26.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.73.28.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.49.34.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.49.38.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.81.67.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.81.68.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.81.77.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.81.78.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.65.83.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.65.84.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.65.85.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.65.77.0 10.10.10.254 mask 255.255.255.0 if 12
route add 10.81.0.0 10.10.10.254 mask 255.255.255.0 if 12

pause