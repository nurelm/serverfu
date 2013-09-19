depth = 7
counter = 1

(1..depth).each do |host_counter|
  host = Host.new
  host.name = "Host #{host_counter}"
  (1..depth).each do
    server = Server.new
    contact = Contact.new
    note = Note.new

    server.name = "Server #{counter}"
    contact.first_name = "First #{counter}"
    contact.last_name = "Last #{counter}"
    note.note = "This is note #{counter}"

    host.servers.push server
    host.contacts.push contact
    host.notes.push note

    host.save

    counter += 1
  end
end