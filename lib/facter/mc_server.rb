Facter.add("mc_server") do
    setcode do
        File.exists?("/etc/mcollective/server.cfg")
    end
end