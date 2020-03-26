control "Ruby-1.0" do                                
    impact 1.0                                              
    title "Hello Ruby"                                   
    desc "Running the command should include the words 'hello Ruby'." 
    describe command('go run helloRuby.go') do                       
     its('stdout') { should match 'hello Ruby' }        
    end                                                 
end

control "Ruby-2.0" do                                
    impact 1.0                                              
    title "Hello Ruby Web"                                   
    desc "Connecting to the website should return 200 and body should contain the words 'hello Ruby'." 
    describe http('http://localhost:8888') do                       
     its('status') { should eq 200 }
     its('body') { should match 'hello Ruby' }        
    end                                                 
end

control "Ruby-3.0" do                                
    impact 1.0                                              
    title "Hello Ruby Docker"                                   
    desc "Connecting to the website via docker should return 200 and body should contain the words 'hello Ruby'." 
    describe http('http://localhost:9999') do                       
     its('status') { should eq 200 }
     its('body') { should match 'hello Ruby' }        
    end                                                 
end

control "Ruby-4.0" do                                
    impact 1.0                                              
    title "Hello Ruby Minikube"                                   
    desc "Connecting to the website via minikube should return 200 and body should contain the word 'hello Ruby'." 
    describe http('http://192.168.99.101:30770/') do                       
     its('status') { should eq 200 }
     its('body') { should match 'hello Ruby' }        
    end                                                 
end
