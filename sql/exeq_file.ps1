# SqlServerモジュールをインポート
Import-Module SqlServer

# SQL Serverへの接続情報を設定
$serverName = "sqlserver2019instance.cotcwkukjawi.ap-northeast-1.rds.amazonaws.com"         # SQL Serverの名前
$databaseName = "TestDB"    # データベースの名前
$userName = "admin"
$password = "Toyobo20202!!"
$queryFilePath = "C:\path\to\your\query.sql"  # .sqlファイルのパス

# .sqlファイルの内容を読み込む
$query = Get-Content -Path $queryFilePath -Raw

$params = @{
    ServerInstance = $serverName
    Database = $databaseName
    Username = $userName
    Password = $password
    Encrypt = "Optional"
    #EncryptConnection = $true
    #TrustServerCertificate = $true
}

# クエリを実行して結果を取得
$result = Invoke-sqlcmd @params -query $query
#Invoke-sqlcmd @params -query $query

# 結果を表示
$result | Format-Table -AutoSize
