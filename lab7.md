# lab7：Boot of Rails 

## Rails Server 启动流程

1.   **解析命令行参数**：
     当输入 `rails server` 命令后，Rails首先解析命令行参数，以确定应该使用哪个服务器（例如Puma、WEBrick等）来启动。
1.   **加载Rails环境**：
     接下来，Rails开始加载环境配置。它会查找`config/application.rb`中的配置选项，并按照该文件中的指示来配置Rails环境。

```ruby
# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server
```

$$
\uparrow
$$

```ruby
# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
```

$$
\uparrow
$$

```ruby
require_relative "boot"

...

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

...
```

$$
\uparrow
$$

```ruby
ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
```

$$
\uparrow
$$

3.   **初始化Rails应用**：
     Rails应用的初始化涉及到多个步骤，其中包括加载Gemfile中指定的所有gem。Rails会确保所有依赖都被正确加载。
4.   **设置路由**：
     一旦环境配置完成，Rails会根据`config/routes.rb`文件中的定义来设置路由。这些路由决定了如何将HTTP请求分发到应用程序的不同部分。
5.   **启动Web服务器**：
     根据`rails server`命令传递的选项，选择适当的web服务器gem（如Puma、WEBrick）。服务器gem被加载并配置，之后服务器开始监听指定端口上的连接。
6.   **监听请求**：
     一旦服务器启动并且正在监听连接，它就开始处理来自客户端的请求。每当一个请求到达时，服务器就会调用Rails的应用程序，应用程序则根据路由配置处理请求，并返回响应。

## Gem 加载过程

- **Gemfile 与 Gemfile.lock**：
  在Rails项目根目录下的Gemfile中，列出了所有需要的gem以及它们的版本。当运行`bundle install`时，Bundler工具会解析Gemfile，确定gem的依赖关系，并锁定版本到Gemfile.lock文件中。

- **Bundler加载gem**：
  当运行`rails server`时，实际上是在调用由Bundler提供的`bundle exec`命令。这确保了Rails应用程序在一个隔离的环境中运行，只访问Gemfile.lock中锁定的gem版本。

- **Rails加载gem**：
  Rails自身会在启动时加载必要的gem，包括但不限于ActiveSupport、ActiveRecord等核心组件。这些gem提供了Rails应用程序运行所需的大部分功能。

通过以上步骤，Rails能够确保在启动时正确加载所有必要的gem，并准备好处理请求。这对于理解和调试Rails应用程序的行为非常有用。