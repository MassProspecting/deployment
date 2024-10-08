require_relative '../lib/blackops.rb'
require_relative '../config.rb'

l = BlackStack::LocalLogger.new('blackops.log')

begin
    # start server
    ret = BlackOps.get_instance( :master,
        logger: l
    )

    l.log JSON.pretty_generate(ret) if ret
    l.log "Instance not Found.".yellow if !ret

rescue => e
    l.reset
    l.log(e.to_console.red)
end