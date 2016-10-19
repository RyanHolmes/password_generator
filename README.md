# password_generator
Generates a strong password based on the website/program you are accessing plus a master password.

Using openssl and SHA1 hashing - SHA1(Program + password).
ex) SHA1("facebookmasterpassword") turns into "tkQfLzxtCjhcI3XMPQ933KFunu8="

I added this to my zshrc file -> alias keychain="cd ~/Documents/password_generator; ruby pass.rb; ruby reset.rb &!".

Now when I run "keychain" in terminal, it copies my generated password to my clipboard, then deletes it after 1 minute.
