# other
- [chaos-engineering](chaos-engineering/README.md)
- [chaos-engineering-practices](chaos-engineering-practices/README.md)
- [eureka-service-discovery](eureka-service-discovery/README.md)
- [file-io-nio](file-io-nio/README.md)
- [garbage-collection-algorithms](garbage-collection-algorithms/README.md)
- [gc-tuning](gc-tuning/README.md)
- [istio-service-mesh](istio-service-mesh/README.md)
- [latency-throughput-zero-to-hero](latency-throughput-zero-to-hero/README.md)
- [paxos-algorithm](paxos-algorithm/README.md)
- [README.md](README.md/README.md)
- [Os](os/README.md)
- [spring-boot-microservices](spring-boot-microservices/README.md)
- [zookeeper-for-coordination](zookeeper-for-coordination/README.md)

## Python Interview Concepts

### Decorators
# decorator function to convert to lowercase
def lowercase_decorator(function):
    def wrapper():
        func = function()
        string_lowercase = func.lower()
        return string_lowercase
    return wrapper
# decorator function to split words
def splitter_decorator(function):
    def wrapper():
        func = function()
        string_split = func.split()
        return string_split
    return wrapper
@splitter_decorator # this is executed next
@lowercase_decorator # this is executed first
def hello():
    return 'Hello World'
hello()   # output => [ 'hello' , 'world' ]

### List-Dict Comprehensions
my_list = [2, 3, 5, 7, 11]
squared_list = [x**2 for x in my_list]    # list comprehension
# output => [4 , 9 , 25 , 49 , 121]
squared_dict = {x:x**2 for x in my_list}    # dict comprehension
# output => {11: 121, 2: 4 , 3: 9 , 5: 25 , 7: 49}

### Lambda
mul = lambda a, b : a * b

### Copying Objects
Shallow Copy: bit-wise copy, references shared.
Deep Copy: recursive copy, no shared references.

from copy import copy, deepcopy
list_1 = [1, 2, [3, 5], 4]
## shallow copy
list_2 = copy(list_1)
list_2[3] = 7
list_2[2].append(6)
list_2    # output => [1, 2, [3, 5, 6], 7]
list_1    # output => [1, 2, [3, 5, 6], 4]
## deep copy
list_3 = deepcopy(list_1)
list_3[3] = 8
list_3[2].append(7)
list_3    # output => [1, 2, [3, 5, 6, 7], 8]
list_1    # output => [1, 2, [3, 5, 6], 4]

### Generators
## generate fibonacci numbers upto n
def fib(n):
    p, q = 0, 1
    while(p < n):
        yield p
        p, q = q, p + q
x = fib(10)    # create generator object

## iterating using __next__(), for Python2, use next()
x.__next__()    # output => 0
x.__next__()    # output => 1
x.__next__()    # output => 1
x.__next__()    # output => 2
x.__next__()    # output => 3
x.__next__()    # output => 5
x.__next__()    # output => 8
x.__next__()    # error

## iterating using loop
for i in fib(10):
    print(i)    # output => 0 1 1 2 3 5 8

### PYTHONPATH
PYTHONPATH is an environment variable that specifies additional directories where Python looks for modules and packages.
