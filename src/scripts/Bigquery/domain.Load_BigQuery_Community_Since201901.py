import sys
from utils import convertDataTypes, cleanDataFrame
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.utils import getResolvedOptions
from datetime import date
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, last_day, lead, date_add, when, max, last
from pyspark.sql.window import Window

def load_bigquery_community_since201901(bigquery_df):
    ""

if __name__ == "__main__":
    args = getResolvedOptions(sys.argv, ['raw_db', 'raw_table_bigquery', 's3_destination_bigquery'])

    glueContext = GlueContext(SparkContext.getOrCreate())

    raw_bigquery_df = glueContext.create_dynamic_frame.from_catalog(database=args['raw_db'],
                                                            table_name=args['raw_table_bigquery']).toDF()

    load_bigquery_community_since201901(raw_bigquery_df)