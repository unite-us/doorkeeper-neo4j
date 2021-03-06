require 'neo4j'
require 'doorkeeper/orm/neo4j/concerns/scopes'
require 'doorkeeper/orm/neo4j/concerns/access_grant_mixin'
require_relative '../../../../lib/doorkeeper/neo4j/compatible'

module Doorkeeper
  class AccessGrant
    include DoorkeeperNeo4j::Compatible

    include ::Neo4j::ActiveNode
    include ::Neo4j::Timestamps

    include Doorkeeper::Neo4j::AccessGrantMixin
    include Models::Neo4j::Scopes

    property :resource_owner_id, type: String
    property :token,             type: String
    property :expires_in,        type: Integer
    property :redirect_uri,      type: String
    property :revoked_at,        type: DateTime

    validates :token,         uniqueness: true
  end
end
