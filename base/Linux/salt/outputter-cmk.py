def output(data):
#    for item in data:
    host_name = data.keys()[0]
    tag = []
    kernel = data[host_name]['kernel']
    os = data[host_name]['os']
    tag.append((kernel))
    tag.append((os))
    tag_str = '|'.join(tag)
    wato_host = '''all_hosts += [
        "{0}|cmk-agent|prod|lan|tcp|wato|{1}/" + FOLDER_PATH + "/")]'''.format(host_name, tag_str)
    print wato_host

    # do fancy stuff with data...
    return ''
