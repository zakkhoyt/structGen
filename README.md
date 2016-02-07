### structGen

Generate C structs from the command line (for use with Obj-C)

#### Usage:

```
structGen Name key1,value1 key2,value2
```

For example this command 

```
structGen MyStruct city,Boise zip,83702
```

will output this code:

```
\\ .h file
extern const struct MyStruct {
	__unsafe_unretained NSString *city;
	__unsafe_unretained NSString *zip;
} MyStruct;

\\ .m file
const struct MyStruct MyStruct = {
	.city = @"Boise",
	.zip = @"83702",
};
```
