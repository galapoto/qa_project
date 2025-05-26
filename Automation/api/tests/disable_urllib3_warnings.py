def disable_insecure_request_warning():
    import urllib3
    urllib3.disable_warnings()