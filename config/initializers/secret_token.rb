# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Tasks::Application.config.secret_key_base = 'e287efafe2b08bb7688852ff46a8fae7e42612937af19198cd29e175208e6a5253abf7697903481a11fe9288c279e3b63b6037801c82e5bc610c4d01569d8e4e'
