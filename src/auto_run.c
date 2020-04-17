#include <stdio.h>
#include <stdlib.h>
#include <auto_run.h>

extern func_t _table_start, _table_end;

void auto_run()
{
	printf("Auto run ...\n");
	const func_t *fptr = &_table_start;
	while(fptr < &_table_end)
	{
		printf("Running %s: ", fptr->name);
		fptr->ops->fn();
		fptr++;
	}
	return;
}

