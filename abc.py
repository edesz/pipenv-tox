import os
import argparse

import numpy as np
import pandas as pd

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-c",
        "--num-cols",
        type=int,
        dest="num_cols",
        default=5,
        help="number of columns",
    )
    args = parser.parse_args()

    ncols = args.num_cols

    df = pd.DataFrame(np.random.rand(10, ncols))
    print(df)
    print(os.getenv("MY_ENV_VAR"))
