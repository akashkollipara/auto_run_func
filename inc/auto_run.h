#pragma once

typedef struct fn_ops
{
	void (*fn)(void);
} fn_ops_t;

typedef struct function
{
	char *name;
	fn_ops_t *ops;
} func_t;

#define FUNCTION_EXPORT(_name,_ops)			\
	const func_t _name __attribute__((section(".func_table")))=	\
	{								\
		.name = #_name,						\
		.ops = _ops						\
	};

void auto_run();
