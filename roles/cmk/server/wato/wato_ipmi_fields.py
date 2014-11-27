declare_host_attribute(
   NagiosTextAttribute(
    "ipmi_ip",
    "_IPMI_IP",
    "IPMI_IP",
    "IPMI_IP",
   ),
   show_in_table = True,
   show_in_folder = False,
)

declare_host_attribute(
   NagiosTextAttribute(
    "ipmi_password",
    "_IPMI_PASSWORD",
    "IPMI_PASSWORD",
    "IPMI_PASSWORD",
   ),
   show_in_table = False,
   show_in_folder = True,
)
