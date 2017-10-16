control "M-4.2" do
  title "4.2 Ensure no security groups allow ingress from 0.0.0.0/0 to port
3389 (Scored)"
  desc  "Security groups provide stateful filtering of ingress/egress network
traffic to AWS resources. It is recommended that no security group allows
unrestricted ingress access to port 3389. Removing unfettered connectivity to
remote console services, such as RDP, reduces a server's exposure to risk. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "4.2"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 1"
  tag "nist": ["Not Mapped"]
  tag "audit": "Perform the following to determine if the account is configured
as prescribed: Login to the AWS Management Console
at https://console.aws.amazon.com/vpc/home In the left pane, click Security
Groups For each security group, perform the following: Select the security
group Click the Inbound Rules tab Ensure no rule exists that has a port range
that includes port 3389 and has a
Source of 0.0.0.0/0
Note: A Port value of ALL or a port range such as 1024-4098 are inclusive of
port 3389.
"
  tag "fix": "Perform the following to implement the prescribed state: Login to
the AWS Management Console
at https://console.aws.amazon.com/vpc/home In the left pane, click Security
Groups For each security group, perform the following: Select the security
group Click the Inbound Rules tab Identify the rules to be removed Click the x
in the Remove column Click Save
"
end
