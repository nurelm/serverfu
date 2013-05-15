rails g active_scaffold State name:string abbreviation:string
rails g active_scaffold Address description:string street1:string street2:string city:string state_id:integer zip:string
rails g active_scaffold Email description:string email:string contact_id:integer
rails g active_scaffold Phone description:string phone:string contact_id:integer
rails g active_scaffold Contact description:string first_name:string middle_name:string last_name:string contactable_id:integer contactable_type:string
rails g active_scaffold Note note:text noteable_id:integer noteable_type:string
rails g active_scaffold Host name:string
rails g active_scaffold Server name:string host_id:integer
rails g active_scaffold Client name:string server_id:integer
rails g active_scaffold Site description:string client_id:integer, ip_id
rails g active_scaffold Domain name:string site_id:integer
rails g active_scaffold IP address:string
rails g active_scaffold Credential site_id:integer credential_type_id:integer, domain:string username:string password:string description:string
rails g active_scaffold CredentialType type:string
