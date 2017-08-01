## JAX-RS Provider(Filter, Interceptor, ...)

### @PreMatching
  This anotation indicate that this filter will be executed before resource access.

### ContainerRequestFilter, ClientRequestFilter, ContainerResponseFilter, ClientResponseFilter
  Four filter interface, mainly for filter header of request and response.

### WriterInterceptor
  Interceptor to write request and response.

### @NamingBinding
  This anotation define an anotation that binding filter and resource. @BindingAnotationName need to add both on filter and resource,
  then this filter will only deal with the corresponding resource.
  
	@NameBinding
	@Retention(RetentionPolicy.RUNTIME)
	@Target({ElementType.TYPE, ElementType.METHOD})
	public @interface BindingAnotationName {
	}

## The order of provider called.
1. pre-matching ContainerRequestFilters
1. post-matching ContainerRequestFilters
1. ReaderInterceptor
1. MessageBodyReader
1. ContainerResponseFilters
1. WriterInterceptor
1. MessageBodyWrite

