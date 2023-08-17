# Parametros necessários para a instalação do CrowdStrike Falcon Sensor
$CID = 'adicione o CID aqui'
$GROUPING_TAGS= 'xxxx'


# Criar diretorio para armazenar o instalador
if (!(Test-Path -Path 'C:\seu caminho aqui' -ErrorAction SilentlyContinue)) {

    New-Item -ItemType Directory -Path 'C:\seu caminho aqui' -Force

}
# Fazer o donwload do instalador
wget "https:caminho completo onde está o instalado" -outfile "C:/seu caminho aqui/instalador.exe"


# Armazenar o local do diretorio onde o está instalador
$SensorLocal = 'C:/seu caminho aqui/instalador.exe'


# Verificar se o serviçpo está ativo, se não tiver será feito a instalação
if (!(Get-Service -Name 'CSFalconService' -ErrorAction SilentlyContinue)) {

    & $SensorLocal /install /norestart /quiet CID=$CID GROUPING_TAGS=$GROUPING_TAGS
 
}

# Especifique o caminho completo para o diretório que você deseja excluir
$nomeDoDiretorio = "C:\seu caminho aqui"

# Excluir o diretório
Remove-Item -Path $nomeDoDiretorio -Recurse -Force

