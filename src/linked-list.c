#include <stdio.h>
#include <stdlib.h>
#include "../lib/linked-list.h"

int main()
{
	ListPtr start = NULL;	//Pointer to first node
	insert_node(&start, 1, 1);
	insert_node(&start, 2, 9);
	insert_node(&start, 3, 5);
	print_list(&start);
	return 0;
}


