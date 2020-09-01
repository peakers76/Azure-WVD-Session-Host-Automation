﻿
param(
     [string] $hostPoolName =$(throw "hostPoolName is required.")#= "wvd-arm-dist-hp1",
    ,[string] $resourcegroupname =$(throw "resourcegroupname is required.")#= "wvd-arm-cross-subs"
    ,$hp_vm =$(throw "vm array is required.")
    ,$sh_name =$(throw "vm array is required.")
)
Write-Output "*********Start Drain Script*********"
Write-Output $hp_vm
Write-Output $sh_name
$_currenthpvm=$hp_vm | ConvertFrom-Json
$_sh_name = $sh_name | ConvertFrom-Json
Write-Output $_currenthpvm.Count
foreach($sh in $_sh_name){
    Write-Output $sh
    Update-AzWvdSessionHost -ResourceGroupName $resourcegroupname -HostPoolName $hostPoolName -Name $sh -AllowNewSession:$true
}
Write-Output "*********End Drain Script*********"