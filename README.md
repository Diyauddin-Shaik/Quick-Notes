# Quick-Notes
Read it for quick revision 
Comparison (Very Important for Interviews)

| Workflow    | Complexity | Best For                        |
| ----------- | ---------- | ------------------------------- |
| Git Flow    | High       | Large teams, versioned products |
| GitHub Flow | Low        | Web apps, startups              |
| GitLab Flow | Medium     | CI/CD pipelines                 |
| Trunk Based | Low        | High-speed development          |


Interview Tip

If interviewer asks:

"Which workflow is most modern?"

Answer:

Modern DevOps teams prefer GitHub Flow or Trunk Based Development because they support continuous integration and fast deployments.

Git Flow → structured & heavy
GitHub Flow → simple
GitLab Flow → environment-based
Trunk Based → fast CI/CD

Kubernetes API versions and their uses
   API                                                                 version	Resource / use
v1	                                                  Core resources: Pod, Service, Namespace, ConfigMap, Secret, PersistentVolume (PV), PersistentVolumeClaim (PVC), ServiceAccount, Node.
apps/v1	                                              Deployment, ReplicaSet, StatefulSet, DaemonSet.
batch/v1	                                            Job and CronJob for one-time and scheduled tasks.
autoscaling/v1	                                      HorizontalPodAutoscaler (HPA), basic CPU-based autoscaling configuration.
autoscaling/v2	                                      HPA with CPU, memory and custom/external metrics.
networking.k8s.io/v1	                                Ingress, NetworkPolicy, IngressClass.
rbac.authorization.k8s.io/v1	                        Role, RoleBinding, ClusterRole, ClusterRoleBinding.
storage.k8s.io/v1	                                    StorageClass, CSIDriver, CSINode, VolumeAttachment.
policy/v1	                                            PodDisruptionBudget (PDB).
scheduling.k8s.io/v1	                                PriorityClass for pod scheduling priority.
coordination.k8s.io/v1	                              Lease objects, used for leader election and node heartbeats.
discovery.k8s.io/v1	                                  EndpointSlice, which tracks network endpoints behind Services.
certificates.k8s.io/v1	                              CertificateSigningRequest (CSR) for certificate requests.
admissionregistration.k8s.io/v1	                      ValidatingWebhookConfiguration and MutatingWebhookConfiguration.
apiextensions.k8s.io/v1	                              CustomResourceDefinition (CRD), which extends the Kubernetes API.
authentication.k8s.io/v1	                            TokenReview for validating authentication tokens.
authorization.k8s.io/v1	                              SubjectAccessReview and related resources for authorization checks.
events.k8s.io/v1	                                    Event objects that report cluster activity and troubleshooting information.
flowcontrol.apiserver.k8s.io/v1	                      FlowSchema and PriorityLevelConfiguration for API request flow control.
admissionregistration.k8s.io/v1	                      Configures admission webhooks that validate or mutate API requests.
