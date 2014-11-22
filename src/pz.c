#include <stdio.h>

int main()
{
	int num = 4;
	int *ptr1, **ptr2, ***ptr3;
	ptr1 = &num;
	ptr2 = &ptr1;
	ptr3 = &ptr2;
	printf("Addresses:\n");
	printf("num: %p\nptr1: %p\nptr2: %p\nptr3: %p\n", &num, &ptr1, &ptr2, &ptr3);
	printf("Values:\n");
	printf("num: %d\nptr1: %p\nptr2: %p\nptr3: %p\n", num, ptr1, ptr2, ptr3);
	printf("References:\n");
	printf("num: %d\n*ptr3: %p\n**ptr3: %p\n***ptr3: %d\n", num, *ptr3, **ptr3,***ptr3);

	return 0;
}