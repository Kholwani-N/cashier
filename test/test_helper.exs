ExUnit.start()

# Load support files
Enum.each(Path.wildcard("test/support/**/*.ex"), &Code.require_file/1)