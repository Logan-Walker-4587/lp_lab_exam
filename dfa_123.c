#include<stdio.h>
#include<string.h>

int transition(int state , char input)
{
	int next_state = 0;
	if (state==0 && input=='1'){
		next_state = 1;
	}
        else if (state==0 && input=='2'){
		next_state = 2;
	}
	else if (state==0 && input=='3'){
		next_state = 3;
	}
	else if (state==1 && input=='1'){
		next_state = 1;
	}
	else if (state==1 && input=='3'){
		next_state = 3;
	}
	else if (state==1 && input=='2'){
		next_state = 2;
	}
	else if (state==2 && input=='2'){
		next_state = 2;
	}
	else if (state==2 && input=='3'){
		next_state= 3;
	}
	else if (state==3 && input=='3'){
		next_state = 3;
	}         

	else {
		next_state = -1;
		return next_state;
	}
	return next_state;
}

int main()
{
	char input[100] ;
        int current_state = 0;
	char c;
	printf("\nEnter a binary string : ");
	scanf("%s",input);
	for (int i =0;i<strlen(input) ; i++){
		c = input[i];
                current_state = transition(current_state,c);
	}
	if (current_state == 1 || current_state == 2 || current_state ==3){
		printf("\nAccepted\n");
	}
	else
	{
		printf("\nrejected\n");
	}
	return 0;
}
                        
