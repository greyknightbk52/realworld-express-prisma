#!/bin/bash

mongosh <<EOF
var config = {
    "_id": "dbrs",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "172.20.0.4:27017",
            "priority": 3
        },
        {
            "_id": 2,
            "host": "172.20.0.2:27017",
            "priority": 2
        },
        {
            "_id": 3,
            "host": "172.20.0.3:27017",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF
