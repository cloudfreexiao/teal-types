local record crypt
    hashkey: function(string): string
    randomkey: function(): string
    desencode: function(string, string): string
    desdecode: function(string): string
    hexencode: function(string): string
    hexdecode: function(string): string
    hmac64: function(string, string): string
    -- hmac64_md5: function()
    dhexchange: function(string): string
    dhsecret: function(string, string): string
    base64encode: function(string): string
    base64decode: function(string): string
    sha1: function(string): string
    hmac_sha1: function(string, string): string
    -- hmac_hash: function()
    -- xor_str: function()
end

return crypt