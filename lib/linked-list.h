/* linked-list.h
Linked List Manipulation Library
Author: Rexwyn Nohay
Last Modified: 11/18/2014 12:43 PM
Notes: In using this library, it is imperative to declare a ListPtr variable
first that points to NULL. Example, ListPtr start = NULL;
*/

struct list {
	int key;
	int value;
	struct list *nextNode;
};

typedef struct list List;
typedef List *ListPtr;

int insert_node(ListPtr *, int, int);
void print_list(ListPtr *);
int list_size(ListPtr *);

/* Function insert_node
Param: List *startPtr : pointer to the pointer that refers to the first node
		int val : the value to be inserted
Return: 0 - Error, No memory allocated
		1 - No error
*/
int insert_node(ListPtr *startPtr ,int key, int val)
{
	ListPtr  nxtNode = malloc(sizeof(List));	//allocate a space where the next node is to be placed
	if(nxtNode != NULL) {
		//Insert the value
		nxtNode->key = key;
		nxtNode->value = val;
		nxtNode->nextNode = NULL;
		//Let's place the node to the list
		if(*startPtr == NULL) {	//test if list is empty
			*startPtr = nxtNode;	//assign the address of this node to start
		}
		else {
			//Look for the last node
			ListPtr lastNode = *startPtr;	//assign the address of first node to lastNode
			while(lastNode->nextNode != NULL) {
				lastNode = lastNode->nextNode;	//assign the address of next node to presentNode
			}
			lastNode->nextNode = nxtNode;
		}
		return 1;
	}
	else	return 0;
}

/* Function print_list
Param: List *startPtr : pointer to the pointer that refers to the first node
Return: int counter : number of 
*/
void print_list(ListPtr *startPtr)
{
	if(*startPtr == NULL) {
		printf("List empty");
		return;
	}
	ListPtr presentNode = *startPtr;
	while(presentNode != NULL)
	{
		printf("Key: %d, Value: %d\n", presentNode->key, presentNode->value);
		presentNode = presentNode->nextNode;
	}
	
}

int list_size(ListPtr *startPtr)
{
	int counter = 0;
	if(*startPtr == NULL) {
		return counter;
	}
	ListPtr presentNode = *startPtr;
	while(presentNode != NULL)
	{
		counter++;
		presentNode = presentNode->nextNode;
	}
	return counter;
}