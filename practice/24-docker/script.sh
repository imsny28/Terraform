# cat script.sh
#!/usr/bin/env bash
terraform init —backend=false —force—copy —no—color —reconfigure
terraform validate —json —no—color

terraform apply —auto—approve —compact—warnings —input=false —no—color —var "ports=[$PORT_RANGE]"
