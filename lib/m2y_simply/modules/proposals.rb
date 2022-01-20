require "httparty"
module M2ySimply

  class Proposals < Base

    def self.create_proposal(body)
      parsed_body = {
        CodigoWorkflow: M2ySimply.configuration.workflow,
        DadosEntrada: body
      }
      response = post(base_url + PROPOSALS_PATH, parsed_body.to_json)
      format_response(response)
    end

    def self.send_document(proposal_id, file_name, base64)
      parsed_body = {
        NomeArquivo: file_name,
        BytesBase64: base64
      }
      put(base_url + PROPOSALS_PATH + proposal_id + DOCUMENTS_PATH, parsed_body.to_json)
    end

    def self.send_selfie(proposal_id, base64)
      parsed_body = {
        parametros: [
          nome: 'Base64',
          valor: base64
        ],
        prioridade: 1
      }
      put(base_url + PROPOSALS_PATH + proposal_id, parsed_body.to_json)
    end

    def self.approve_proposal(proposal_id)
      response = post(base_url + APPROVE_PROPOSALS_PATH + proposal_id, {})
      format_response(response)
    end

    def self.check_proposal(proposal_id)
      get(base_url + PROPOSALS_PATH + proposal_id)
    end

    def self.reassess_proposal(proposal_id)
      query_string = "?identificador=#{proposal_id}&estimulo=1&mensagem=*"
      response = post(base_url + PROPOSALS_PATH + REASSESS_PROPOSAL_PATH + query_string, {})
      format_response(response)
    end
  end
end
