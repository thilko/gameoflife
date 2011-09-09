 watch( 'lib/*' ) {|md| system("rspec spec/*") }
 watch( 'spec/.*_spec\.rb' ) {|md| system("rspec #{md[0]}") }
