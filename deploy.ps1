# 起動する順番でdeployment名を配列で定義
$deployments = "mysql", "redis", "tomcat", "nginx"

# deploymentを順番にデプロイ
foreach ($deployment in $deployments) {
    Write-Host "デプロイ: $deployment"
    kubectl apply -f "$deployment.yaml"
    $replicas = 0
    # デプロイが完了するまで待機
    while ($replicas -ne 1) {        
        $replicas = (kubectl get deployment "$deployment" -o json | ConvertFrom-Json).status.availableReplicas

        if($null -eq $replicas) {
            $replicas = 0
        }

        Write-Host "待機中... ($replicas/1)"
        Start-Sleep -Seconds 5
    }
    if($replicas -eq 1) {
        Write-Host "$deployment のデプロイが完了しました"
    }
}
