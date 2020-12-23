-- a simple redis-cluster client
-- rewrite from https://github.com/antirez/redis-rb-cluster

local redis = require("skynet.db.redis")

local record cluster

    record RedisClusterNode
        host: string
        port: number
        name: string
    end

    record RedisClusterNodes
        {RedisClusterNode}
    end

    record RedisClusterOptions
        read_slave: boolean
        auth: string
        db: number
    end

    -- TODO: 待确定是否都是string 类型
    type RedisClusterSubPubFunc = function(string, string, string)

    record RedisClusterClient
        -- TODO: https://github.com/teal-language/tl/issues/173

        get_redis_link: function(RedisClusterClient, RedisClusterNode): redis.RedisClient
        set_node_name: function(RedisClusterClient, RedisClusterNode)
        initialize_slots_cache: function(RedisClusterClient)
        flush_slots_cache: function(RedisClusterClient)
        keyslot: function(RedisClusterClient, string): number
        get_key_from_command: function(RedisClusterClient, {any}): string
        close_existing_connection: function(RedisClusterClient)
        close_all_connection: function(RedisClusterClient)
        get_connection: function(RedisClusterClient, RedisClusterNode): redis.RedisClient
        get_random_connection: function(RedisClusterClient): redis.RedisClient
        get_connection_by_slot: function(RedisClusterClient, number): redis.RedisClient
        get_watch_connection_by_slot: function(RedisClusterClient, number): redis.RedisClient
        get_watch_connection: function(RedisClusterClient, RedisClusterNode): redis.RedisClient
        connections: {string: redis.RedisClient}
    end

    new: function(RedisClusterNodes, RedisClusterOptions, RedisClusterSubPubFunc): RedisClusterClient
end

return cluster