#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

/**
* infinite_while - infinite sleepy time
* Return: Success
*/

int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
* main - Main
* Return: Success
*/

int main(void)
{
	pid_t c1, c2, c3, c4, c5;
	int infinite = 0;

	(void)infinite;
	c1 = fork();
	if (c1 < 1)
		exit(0);
	else
		printf("Zombie process created, PID: %d\n", c1);
	c2 = fork();
	if (c2 < 1)
		exit(0);
	else
		printf("Zombie process created, PID: %d\n", c2);
	c3 = fork();
	if (c3 < 1)
		exit(0);
	else
		printf("Zombie process created, PID: %d\n", c3);
	c4 = fork();
	if (c4 < 1)
		exit(0);
	else
		printf("Zombie process created, PID: %d\n", c4);
	c5 = fork();
	if (c5 < 1)
		exit(0);
	else
		printf("Zombie process created, PID: %d\n", c5);
	infinite = infinite_while();
	return (0);
}
