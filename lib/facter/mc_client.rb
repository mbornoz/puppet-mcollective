Facter.add("mc_client") do
    setcode do
        File.exists?("/etc/mcollective/client.cfg")
    end
end