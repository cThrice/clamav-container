# clamav-container

Status: WIP

Purpose:
Modernize ClamAV deployments for K8s environments.  Specifically deploy a self sustaining ClamAV infra using helm.

Done:
- Basic Docker files
- cron'd scans
- Basic health checks
- local mirror - So we are not abusing the poor clamav update servers with all our daemonsets

Todo:
- Convert helm into a sharable format and upload
- move to centos7 ( Debian shows too many vulns on most scans )
- Add docs


Credit to:
https://github.com/GoogleCloudPlatform/community
