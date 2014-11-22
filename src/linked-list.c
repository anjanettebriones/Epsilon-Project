#include <stdio.h>
#include <stdlib.h>
#include "linked-list.h"

void show_menu();
void show_nodes(ListPtr *);
void add_node(ListPtr *);
void edit_node();
void delete_node();


int main()
{
	ListPtr start = NULL;	//Pointer to first node
	char ch;
	show_menu();
	
	for(;;){
		ch = getchar();
		switch(ch) {
			case 'a':
			case 'A':
				show_nodes(&start);
				show_menu();
			break;
			case 'b':
			case 'B':
				add_node(&start);
				show_menu();
			break;
			case 'c':
			case 'C':

				show_menu();
			break;
			case 'd':
			case 'D':

				show_menu();
			break;
			case 'e':
			case 'E':
				return 0;
			break;
			default:
				printf("Invalid input.\nChoose: ");
			break;
		}
	}

	return 0;
}

void show_menu()
{
	system("clear");
	printf("List Manipulator\n\n");
	printf("\ta. Show Nodes\n\tb. Add a node\n\tc. Edit a node\n\td.Delete a node\n\te. Exit\n");
	printf("Choice: ");
}

void show_nodes(ListPtr *start)
{
	system("clear");
	printf("List of Nodes\n\n");
	print_list(start);
	printf("\n\nPress any key to continue...");
	if(getche()) return;
}

void add_node(ListPtr *start)
{
	char ch;
	int key, val;
	system("clear");
	printf("Add Nodes\n\n");
	printf("Key: ");
	scanf("%d", &key);
	printf("Value: ");
	scanf("%d", &val);
	if(insert_node(start, key, val)) printf("Added.\n");
	else printf("Failed to add.\n");
	printf("\n\nPress any key to continue...");
	getchar();
}

void edit_node()
{

}

void delete_node()
{

}


