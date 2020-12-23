local record mysql

    record MysqlConf
		host: string
		port: number
		database: string
        user: string
        password: string
        charset: string
        max_packet_size: number
        on_connect: function(MysqlClient)
    end
    
    record MysqlSTMT
    end

    -- 执行错误 返回值
    record MysqlErrRet
        errno: number
        badresult: string
        sqlstate: string
        err: string
    end

    -- 插入返回值
    record MysqlOKRet
        insert_id: number
        affected_rows: number
        server_status: number
        warning_count: number
    end
-- call proc ret = 
--     [1] = {
-- 		[1] = {
-- 			["num"] = 89,
-- 			["blb"] = "ÿ

--  0@",
-- 			["id"] = 1,
-- 			["flt"] = 3.1415,
-- 			["str"] = "test_str",
-- 			["dt"] = "2020-03-20 15:30:40",
-- 		},
-- 	},
-- 	[2] = {
-- 		["warning_count"] = 0,
-- 		["insert_id"] = 0,
-- 		["affected_rows"] = 0,
-- 		["server_status"] = 2,
-- 	},
--     ["mulitresultset"] = true,

    record MysqlProcEffectElement
        num: number
        blb: string
        id: number
        flt: number
        str: string
        dt: string
    end

    record MysqlProcEffectRet
        {any}
    end

    record MysqlProcRet
        -- MysqlProcEffectRet
        -- MysqlOKRet
        {any}
        mulitresultset: boolean
    end

    record MysqlClient
        query: function(MysqlClient, string): boolean | any
        prepare: function(MysqlClient, string): MysqlSTMT
        execute: function(MysqlClient, MysqlSTMT, ...: any): any -- MysqlOKRet or MysqlProcRet
        stmt_close: function(MysqlClient, MysqlSTMT)
        disconnect: function(MysqlClient)
    end

    connect: function(MysqlConf): MysqlClient
    quote_sql_str: function(string): string
end

return mysql