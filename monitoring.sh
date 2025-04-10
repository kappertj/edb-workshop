NS=`oc whoami`

oc project $NS
TOKEN=`oc -n  $NS create  token grafana-sa --duration=$((365*24))h`

cat <<EOF > grafana-secret-creds.yaml
kind: Secret
apiVersion: v1
metadata:
  name: credentials
  namespace: '${NS}'
stringData:
  GF_SECURITY_ADMIN_PASSWORD: grafana
  GF_SECURITY_ADMIN_USER: admin
  PROMETHEUS_TOKEN: '${TOKEN}'
type: Opaque
EOF

cat <<EOF > grafana-instance.yaml
apiVersion: grafana.integreatly.org/v1beta1
kind: Grafana
metadata:
  name: grafana
  labels:
    dashboards: "grafana"
    folders: "grafana"
spec:
  deployment:
    spec:
      template:
        spec:
          containers:
            - name: grafana
              env:
                - name: GF_SECURITY_ADMIN_USER
                  valueFrom:
                    secretKeyRef:
                      key: GF_SECURITY_ADMIN_USER
                      name: credentials
                - name: GF_SECURITY_ADMIN_PASSWORD
                  valueFrom:
                    secretKeyRef:
                      key: GF_SECURITY_ADMIN_PASSWORD
                      name: credentials
  config:
    auth:
      disable_login_form: "false"
      disable_signout_menu: "true"
    auth.anonymous:
      enabled: "false"
    log:
      level: warn
      mode: console
EOF

oc -n user0 create -f grafana-secret-creds.yaml
oc -n user0 create -f grafana-instance.yaml
oc -n user0 get pods -l app=grafana
oc -n user0 create route edge grafana --service=grafana-service --insecure-policy=Redirect
oc -n user0 get route grafana -o jsonpath='{.spec.host}'

cat <<EOF > grafana-datasource.yaml
apiVersion: grafana.integreatly.org/v1beta1
kind: GrafanaDatasource
metadata:
  name: grafana-ds
spec:
  valuesFrom:
    - targetPath: "secureJsonData.httpHeaderValue1"
      valueFrom:
        secretKeyRef:
          name: "credentials"
          key: "PROMETHEUS_TOKEN"
  instanceSelector:
    matchLabels:
      dashboards: "grafana"
  datasource:
    name: Prometheus
    type: prometheus
    access: proxy
    url: https://thanos-querier.openshift-monitoring.svc:9091
    isDefault: true
    jsonData:
      "tlsSkipVerify": true
      "timeInterval": "5s"
      httpHeaderName1: 'Authorization'
    secureJsonData:
      "httpHeaderValue1": "Bearer \${PROMETHEUS_TOKEN}"
    editable: true
EOF

oc -n user0 create -f grafana-datasource.yaml

cat <<EOF > grafana-dashboard-ocp-v.yaml
apiVersion: grafana.integreatly.org/v1beta1
kind: GrafanaDashboard
metadata:
  name: grafana-dashboard-cnpg
  labels:
    app: grafana
spec:
  instanceSelector:
    matchLabels:
      dashboards: grafana  
  folder: "CloudNativePG"      
  url: https://raw.githubusercontent.com/cloudnative-pg/grafana-dashboards/refs/heads/main/charts/cluster/grafana-dashboard.json
EOF
oc -n user0 create -f grafana-dashboard-ocp-v.yaml