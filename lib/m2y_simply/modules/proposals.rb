require "httparty"
module M2ySimply

  class Proposals < Base

    def self.create_proposal(body)
      parsed_body = {
        :CodigoWorkflow => Time.now.to_i,
        :DadosEntrada => body
      }
      post(base_url + PROPOSALS_PATH, parsed_body.to_json).parsed_response
    end

    def self.send_document(proposal_id, file_name, base64)
      body = {
        :NomeArquivo => base64,
        :BytesBase64 => file_name,
        :IdentificadorObjeto => proposal_id
      }
      put(base_url + PROPOSALS_PATH + proposal_id + DOCUMENTS_PATH, parsed_body.to_json).parsed_response
    end

    def self.approve_proposal(proposal_id)
      post(base_url + APPROVE_PROPOSALS_PATH + proposal_id, {}).parsed_response
    end

    def self.check_proposal(proposal_id)
      get(base_url + PROPOSALS_PATH + proposal_id).parsed_response
    end

  end
end
