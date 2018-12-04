# HTTP Resource

A generic resource for hitting an HTTP URL based on a small alpine base image.  Useful for generic HTTP REST APIs (e.g. notifications, comments, etc..).  Because this is a resource, it has access to the [build metadata](https://concourse-ci.org/implementing-resources.html#section_resource-metadata).

## Installing

Add the following to the `resource_types` section of a pipeline config:

```yaml
---
resource_types:
- name: concourse-http-resource
  type: docker-image
  source:
    repository: edtan1/concourse-http-resource
```

## Source configuration

```yaml
---
resources:
- name: my-http-resource
  type: concourse-http-resource
  source:
    url: http://test-url/api/test-endpoint
    method: "POST"
    headers:
      X-My-Header: "my-header-value"
```

* `url`: *Required.* HTTP URL to access.

* `method`: *Optional.* HTTP method to use.  Defaults to GET.

* `headers`: *Optional.* Map of HTTP headers to send

## `check`: no-op

This resource currently does nothing for `check`.

## `in`: no-op

This resource currently does nothing for `in`.

## `out`: Hit an HTTP URL

Access an HTTP URL using curl.

### Configuration:

``` yaml
plan:
- put: my-http-resource
  params:
    data_text: "The build $BUILD_NAME $BUILD_ID completed"
```

### Parameters

* `data_file`: *Optional. File containing data to be sent with the request.  Cannot be specified at the same time as `data_text`.

* `data_text`: *Optional. Text to be sent with the request.  Cannot be specified at the same time as `data_file`.
