# lab6：Rails相关gem功能调研

## ActiveJob

>   Active Job is a framework for declaring jobs and making them run on a variety of queuing backends. These jobs can be everything from regularly scheduled clean-ups, to billing charges, to mailings — anything that can be chopped up into small units of work and run in parallel.

ActiveJob是Rails中的抽象类，为后台工作提供了一个接口。它并不直接执行任何任务，而是定义了一个API，其他 gem 可以实现这个API来处理后台任务。

## ActiveModel

>   Active Model provides a known set of interfaces for usage in model classes. They allow for Action Pack helpers to interact with non-Active Record models, for example. Active Model also helps with building custom ORMs for use outside of the Rails framework.

ActiveModel gem提供了非数据库模型对象的行为，比如包含属性和方法的对象，它们可以像 ActiveRecord 对象一样进行验证。这使得创建非持久化模型变得简单。

## ActiveRecord

>   Active Record connects classes to relational database tables to establish an almost zero-configuration persistence layer for applications. The library provides a base class that, when subclassed, sets up a mapping between the new class and an existing table in the database. In the context of an application, these classes are commonly referred to as **models**. Models can also be connected to other models; this is done by defining **associations**.

ActiveRecord 是 Rails ORM（对象关系映射）的一部分，它负责处理数据库操作，包括创建、读取、更新和删除（CRUD）操作。它实现了ORM的核心概念，即对象和数据库表之间的映射。

## ActiveSupport

>   Active Support is a collection of utility classes and standard library extensions that were found useful for the Rails framework. These additions reside in this package so they can be loaded as needed in Ruby projects outside of Rails.

 ActiveSupport gem提供了Rails框架的基础工具集，包括对Ruby语言的增强，比如时间处理、缓存操作、参数编码等。它是Rails内部使用的许多功能的基础。

## ActitionMailer

>   Action Mailer is a framework for designing email service layers. These layers are used to consolidate code for sending out forgotten passwords, welcome wishes on signup, invoices for billing, and any other use case that requires a written notification to either a person or another system.

提供了一种简单的方式来发送邮件。允许定义邮件模板，并且可以发送HTML或者纯文本格式的邮件。它也支持异步发送邮件。

## ActionPack

>   Action Pack is a framework for handling and responding to web requests. It provides mechanisms for **routing** (mapping request URLs to actions), defining **controllers** that implement actions, and generating responses. In short, Action Pack provides the controller layer in the MVC paradigm.

包含了创建web应用程序所需的基本组件，如HTTP请求和响应处理，路由，以及HTML的辅助方法。它是构建Rails应用的基础。

## ActionViewer

>   Action View is a framework for handling view template lookup and rendering, and provides view helpers that assist when building HTML forms, Atom feeds and more. Template formats that Action View handles are ERB (embedded Ruby, typically used to inline short Ruby snippets inside HTML), and XML Builder.

ActionView是Rails MVC模式中的视图部分，提供了模板渲染引擎，包括布局管理和部分视图的重用。它支持多种模板引擎，如ERB和HAML。

## *Reference*

1.   https://github.com/rails/rails?tab=readme-ov-file#frameworks-and-libraries