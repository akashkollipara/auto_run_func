SECTIONS
{
	.drivers :
	{
		_drivers_start = .;
		KEEP(*(.drivers))
		_drivers_end = .;
	}
}
INSERT AFTER .data;
