# x-arr-chart

A Helm Chart to install Sonarr, Radarr, or Lidarr into Kubernetes.

# Installing the chart

    helm repo add chrisjohnson00 https://raw.githubusercontent.com/chrisjohnson00/helm-charts/master/
    helm upgrade sonarr chrisjohnson00/x-arr-chart --install --atomic -n {namespace} -f /path/to/your/custom/sonarr-values.yaml

## Limitations

Since x-arr applications utilize a SQLlite database, and SQLlite is temperamental with disk latency, running x-arr in 
Kubernetes USUALLY requires you schedule the pod to the same node, and utilize a local path mount.  This chart overcomes 
this issue by using [OpenEBS](https://openebs.io/) to provide a "local path mount" which is replicated to all nodes, 
thus making the pod schedule-able to any node.

## Dependencies

I made this for myself, so it assumes:
 - [OpenEBS](https://openebs.io/) is installed in the cluster, to replicate the `/config` dir between nodes.
 - A NFS share to mount the data directories to
 
## Doesn't work?

Since I made this for myself, it may not work for your needs... however, if you submit an issue, I'm quick and capable
of making adjustments to enable this chart to be used in more environments.  
