#!/bin/bash

MYSQL_DATABASE="bitcoin_tracker"

create_database() {
    EXISTING_DATABASE=$(mysql -u root -p -e "SHOW DATABASES LIKE '$MYSQL_DATABASE'")
    if [ -z "$EXISTING_DATABASE" ]; then
        /opt/lampp/bin/mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE"
        echo "Database '$MYSQL_DATABASE' created successfully."
    fi
}

use_database() {
    /opt/lampp/bin/mysql -u root -D "$MYSQL_DATABASE"
}

create_tables() {
    use_database << EOF
    CREATE TABLE IF NOT EXISTS assets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    name VARCHAR(255) NOT NULL,
    symbol VARCHAR(10) NOT NULL,
    max_supply DECIMAL(40, 20),
    market_cap DECIMAL(40, 20),
    volume_24hr DECIMAL(40, 20)
);

    CREATE TABLE IF NOT EXISTS prices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    asset_id INT NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    price DECIMAL(40, 20) NOT NULL,
    change_percent DECIMAL(40, 20),
    FOREIGN KEY (asset_id) REFERENCES assets(id)
);
    
EOF
}

insert_data() {
    JSON_DATA=$(curl -s https://api.coincap.io/v2/assets/bitcoin)
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to retrieve data from API. Check network connectivity or API status."
        exit 1
    fi

    NAME=$(echo $JSON_DATA | jq -r '.data.name')
    SYMBOL=$(echo $JSON_DATA | jq -r '.data.symbol')
    MAX_SUPPLY=$(echo $JSON_DATA | jq -r '.data.maxSupply')
    MARKET_CAP=$(echo $JSON_DATA | jq -r '.data.marketCapUsd')
    VOLUME_24HR=$(echo $JSON_DATA | jq -r '.data.volumeUsd24Hr')
    PRICE=$(echo $JSON_DATA | jq -r '.data.priceUsd')
    CHANGE_PERCENT=$(echo $JSON_DATA | jq -r '.data.changePercent24Hr')

    use_database << EOF
    INSERT INTO assets (timestamp, name, symbol, max_supply, market_cap, volume_24hr)
    VALUES (CURRENT_TIMESTAMP, '$NAME', '$SYMBOL', '$MAX_SUPPLY', '$MARKET_CAP', '$VOLUME_24HR');

    INSERT INTO prices (asset_id, timestamp, price, change_percent)
    SELECT id, CURRENT_TIMESTAMP, '$PRICE', '$CHANGE_PERCENT'
    FROM assets
    WHERE name = '$NAME';
EOF
}

store_csv_assets() {
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    CSV_FILE="assets_data.csv"
    if [ ! -f "$CSV_FILE" ]; then
        echo "Timestamp,Name,Symbol,Max Supply,Market Cap (USD),Volume 24hr (USD)" > $CSV_FILE
    fi
    echo "$TIMESTAMP,$NAME,$SYMBOL,$MAX_SUPPLY,$MARKET_CAP,$VOLUME_24HR" >> $CSV_FILE
    echo "Assets data stored in $CSV_FILE"
}

store_csv_prices() {
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    CSV_FILE="prices_data.csv"
    if [ ! -f "$CSV_FILE" ]; then
        echo "Timestamp,Price (USD),Change Percent 24hr" > $CSV_FILE
    fi
    echo "$TIMESTAMP,$PRICE,$CHANGE_PERCENT" >> $CSV_FILE
    echo "Prices data stored in $CSV_FILE"
}
main() {
    create_database
    create_tables
    insert_data
    store_csv_assets
    store_csv_prices
    echo "Data processing completed successfully."
}
main
