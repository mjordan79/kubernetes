Rancher 2 installation on local cluster:
  Preliminary Operations:
    a) Enable RBAC: 
    b) Edit the coredns configmap () and insert the entry into the  file
    c) Enable ingress: 
    d) Enable the metrics server: 
  Rancher 2 Installation:
    1) Create the self‑signed certificates (CA, Certificate and Key) using  and 
    2) Create the namespace for Rancher secrets: 
    3) Create the  secret containing the CA using the script 
    4) Create the  secret using the script 
    5) Install Rancher 2 using the script 
  Subsequent Operations:
    1) Import the CA () into Windows using certmgr, under “Trusted Root Certification Authorities”.
    2) Import an external cluster (from Rancher 2 click on import existing, fill in the fields and execute the cURL command for clusters with self‑signed certificates — the second command, not the first one)

Happy Kubing!

