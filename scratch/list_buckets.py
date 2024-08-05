import argparse
# import subprocess
# import json
from google.cloud import storage


# def run_command(command):
#     process = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
#     output, error = process.communicate()
#     if error:
#         print(f"Error: {error}")
#     return output.decode()

# use gcloud storage to list the subfolders in a bucket



def list_blobs_sizes(bucket_name, prefix="staging/*", delimiter="/"):
    """Lists all the folders and their size in the bucket."""
    storage_client = storage.Client()

    blobs = storage_client.list_blobs(bucket_name, prefix=prefix, delimiter=delimiter)

    print("Blobs:")
    for blob in blobs:
        print(blob.name)

    if delimiter:
        print("Prefixes:")
        for prefix in blobs.prefixes:
            print(prefix)


    # for blob in blobs:
    #     #bucket.get_blob(blob)
    #     print(blob.name)
    #     #print(blob.size)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='List folders in a bucket and their sizes')

    parser.add_argument('-b', '--bucket', required=False, type=str, help='bucket name')
    parser.add_argument('-s', '--subfolder', required=False, type=str, help='subfolder name')

    args = parser.parse_args()

    bucket = args.bucket
    subfolder = args.subfolder
    list_blobs_sizes(bucket, subfolder)


#
# for bucket in buckets:
#     bucket_name = bucket['name']
#     size_command = f"gsutil du -s gs://{bucket_name}"
#     size_output = run_command(size_command)
#     size = size_output.split()[0]
#     print(f"{project},{bucket_name},{size}")