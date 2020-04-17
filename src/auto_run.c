#include <stdio.h>
#include <stdlib.h>
#include <auto_run.h>

extern func_t fa, fd;

void auto_run()
{
	printf("Auto run ...\n");
	const func_t *fptr = &fa;
	while(fptr <= &fd)
	{
		printf("Running %s: ", fptr->name);
		fptr->ops->fn();
		fptr++;
	}
	return;
}

