from numpy.core.fromnumeric import repeat
import pandas as pd
import numpy as np
import sys

args = sys.argv

try:
    ROWS = int(args[1])
except IndexError:
    ROWS = 100
except ValueError:
    print('Please provide an integer value for the number of rows to generate')
    exit()

TARGET_TABLE = 'data'

PAIRS = ["GBP/EUR", "GBP/USD", "EUR/USD"]
PROVIDERS = ["CBOE", "UBS"]
PRICE_MIN = 1
PRICE_MAX = 3
PRICE_STEP = 0.00001
QTY_MIN = 1000000
QTY_MAX = 2000000


def generate_dataframe(rows: int, pairs: list, providers: list) -> pd.DataFrame:
    pairs_probability = np.repeat(probability_per_item(pairs), len(pairs))
    providers_probability = np.repeat(
        probability_per_item(providers), len(providers))

    df = pd.DataFrame({
        "date": pd.date_range("2018-01-01", periods=rows, freq="100L", tz=0),
        "pair": np.random.choice(pairs, rows, p=pairs_probability),
        "quantity": np.random.randint(QTY_MIN, QTY_MAX, size=rows),
        "price": np.random.choice(np.arange(PRICE_MIN, PRICE_MAX, PRICE_STEP), size=rows),
        "providers": np.random.choice(providers, rows, p=providers_probability)
    })

    df.price = df.price.apply(lambda x: round(x, 5))

    return df


def probability_per_item(items: list) -> float:
    return 1 / len(items)


def create_table_(SOURCE: pd.DataFrame, TARGET_TABLE: str) -> list:

    # SOURCE: source dataframe
    # TARGET_TABLE: target_TABLE table to be created in database
    drop_table_if_exists = f'DROP TABLE IF EXISTS {TARGET_TABLE}'

    create_table = pd.io.sql.get_schema(
        SOURCE.reset_index(drop=True), TARGET_TABLE)

    return [drop_table_if_exists, create_table]


def SQL_INSERT_DATA(SOURCE: pd.DataFrame, TARGET_TABLE: str) -> list:
    sql_inserts = []

    for index, row in SOURCE.iterrows():
        sql_inserts.append(
            'INSERT INTO ' +
            TARGET_TABLE +
            ' (' +
            str(', '.join(SOURCE.columns)) +
            ') VALUES ' +
            str(tuple(row.apply(str)))
        )

    return sql_inserts


def generate_sql_file(sql_statement: list):

    sql_script_string = ';\n\n'.join(sql_statement) + ";"

    with open("populate.sql", "w") as sql_file:
        sql_file.write(sql_script_string)


def main():
    df = generate_dataframe(ROWS, PAIRS, PROVIDERS)

    sql_statement = create_table_(
        df, TARGET_TABLE) + SQL_INSERT_DATA(df, TARGET_TABLE)

    generate_sql_file(sql_statement)


if __name__ == "__main__":
    main()
