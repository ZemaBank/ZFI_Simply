require "m2y_simply"

M2ySimply.configure do |config|
  config.username  = "zema"
  config.password = "zema"
  config.proxy = "velodrome.usefixie.com"
  config.proxy_user = "fixie"
  config.proxy_pass = "0M2Oatgx6VZWhgh"
  config.proxy_port = 80
  config.server_url = "https://sworkshml-zemafinanceira.simply.com.br"
end


body = [
  {
    "Nome": "CPF",
    "Valor": "12914243693"
  },
  {
    "Nome": "Nome",
    "Valor": "ANDRESSA SILVA MAGALHAES"

  },
  {
    "Nome": "Logradouro",
    "Valor": "RUA SEBASTIÃO MARCELINO"
  },
  {
    "Nome": "Numero",
    "Valor": "35"
  },
  {
    "Nome": "Complemento",
    "Valor": ""
  },
  {
    "Nome": "Bairro",
    "Valor": "DOMINGOS ZEMA"
  },
  {
    "Nome": "Cidade",
    "Valor": "ARAXÁ"
  },
  {
    "Nome": "CEP",
    "Valor": "38181158"
  },
  {
    "Nome": "UF",
    "Valor": "MG"
  },
  {
    "Nome": "Num_Identidade",
    "Valor": "25666666"
  },
  {
    "Nome": "Orgao_Emissor",
    "Valor": "MAER"
  },
  {
    "Nome": "Data_Emissao",
    "Valor": "15/06/2020"
  },
  {
    "Nome": "Estado_Civil",
    "Valor": "S"
  },
  {

    "Nome": "Naturalidade",
    "Valor": "ARAXA"
  },
  {
    "Nome": "Profissao",
    "Valor": ""
  }
]


p M2ySimply::Proposals.create_proposal(body)

p M2ySimply::Proposals.send_document(proposal_id, file_name, base64)

p M2ySimply::Proposals.approve_proposal(body)
