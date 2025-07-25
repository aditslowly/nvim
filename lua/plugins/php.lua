return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          filetypes = { "php", "blade", "phtml" },
          settings = {
            intelephense = {
              files = {
                associations = { "*.php", "*.blade.php" },
                maxFileSize = 5000000,
                exclude = {
                  "**/.git/**",
                  "**/vendor/**",
                  "**/node_modules/**",
                  "**/storage/**",
                },
              },
              stubs = {
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "Core",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
                "FFI",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "meta",
                "mysqli",
                "oci8",
                "odbc",
                "openssl",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_ibm",
                "pdo_mysql",
                "pdo_pgsql",
                "pdo_sqlite",
                "pgsql",
                "Phar",
                "posix",
                "pspell",
                "readline",
                "Reflection",
                "session",
                "shmop",
                "SimpleXML",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "Zend OPcache",
                "zip",
                "zlib",
                -- Laravel-specific
                "laravel",
                "eloquent",
                "blade",
                "support",
              },
              environment = {
                includePaths = {
                  vim.fn.getcwd() .. "/vendor/laravel/framework/Illuminate/",
                },
              },
            },
          },
        },
      },
    },
  },
}
