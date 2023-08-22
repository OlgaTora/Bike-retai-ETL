import logging


logging.basicConfig(level=logging.DEBUG,
                    filename='bike.log',
                    format='%(asctime)s %(levelname)s:%(message)s',
                    datefmt='%H:%M:%S')
logger = logging.getLogger()
logger.setLevel(logging.INFO)
