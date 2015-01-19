module Volt
  class RestController

    def self.new(*args, &block)
      inst = allocate
      # In MRI initialize is private for some reason, so call it with send
      inst.send(:initialize, *args, &block)
      return inst
    end

    attr_accessor :attrs

    def initialize(*args)
      if args[0]
        # Assign the first passed in argument to attrs
        self.attrs = args[0]
      end
    end

    # Change the url params, similar to redirecting to a new url
    def go(url)
      self.url.parse(url)
    end

    def page
      $page.page
    end

    def store
      $page.store
    end

    def flash
      $page.flash
    end

    def params
      $page.params
    end

    def local_store
      $page.local_store
    end

    def cookies
      $page.cookies
    end

    def url
      $page.url
    end

    def channel
      $page.channel
    end

    def tasks
      $page.tasks
    end

    def controller
      @controller
    end

    def url_for(params)
      $page.url.url_for(params)
    end

    def url_with(params)
      $page.url.url_with(params)
    end

    def loaded?
      respond_to?(:state) && state == :loaded
    end

  end
end
