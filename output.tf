locals {
  # Mapps users to their assigned instances
  assignment-mapping = {
    for i, name in var.participants :
    name => {
      workstation = {
        ip = aws_instance.workstation[i].public_ip
      },
      apache = {
        ip = aws_instance.apache[i].public_ip
      },
      lb = {
        ip = aws_instance.lb[i].public_ip
      },
      iis = {
        ip = aws_instance.iis[i].public_ip
      }
    }
  }
}

output "Node-list" {
  description = "Formatted user to infrastructure assignments:"
  value = concat(
    [
      format(
        "%-20s | %-15s | %-15s | %-15s | %-15s",
        "Name", "workstation", "apache_web", "lb", "iis_web"
      )
    ],
    [for name, val in local.assignment-mapping :
      format(
        "%-20s | %-15s | %-15s | %-15s | %-15s",
        name, val.workstation.ip, val.apache.ip, val.lb.ip, val.iis.ip
      )
    ]
  )
}
output "Automate-server" {
  description = "Print the IP address of the automate server"
  value = concat(
    [
      format(
        "%-15s | %-15s",
        "Automate IP", "Automate URL"
      )
    ],
    [
      format(
        "%-15s | %-30s",
        aws_instance.automate[0].public_ip, "https://${aws_instance.automate[0].public_dns}"
      )
    ]
  )
}
