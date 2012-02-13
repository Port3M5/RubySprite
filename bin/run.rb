# Add paths to the loadpath
loadpaths = %w(lib vendor vendor/slick)
loadpaths.each do |name|
  $:.unshift File.expand_path "../#{name}", File.dirname(File.expand_path __FILE__)
end

$:.each { |n| puts n }

# Require Ruby classes
requirements = %w(java lwjgl.jar slick.jar)
requirements.each do |r|
  require r
end

# Load required Java Classes
java_includes = %w(java.lang.System org.lwjgl.LWJGLUtil)
java_includes.each do |ji|
  include_class ji
end

# Set Natives location
natives_path = "bin/natives/#{LWJGLUtil.get_platform_name()}"
System.set_property "org.lwjgl.librarypath", natives_path
