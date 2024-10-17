#include<stdio.h>
#include<string.h>

int transition(int state , char input)
{
	int next_state = 0;
	if (state==0 && input=='a'){
		next_state = 1;
	}
        
	else if (state==1 && input=='b'){
		next_state = 2;
	}
	else if (state==2 &&  input=='c'){                                                         
		next_state = 3;
	}
	else if (state==1 && input=='a'){
		next_state = 1;
	}
	else if (state==0 && (input == 'b' || input=='c')){
		next_state = 0;
	}
	else if (state==1 && (input=='c' || input=='b')){
		next_state=0;
	}
	else if (state==2 && input=='a'){
		next_state = 1;
	}
	else if(state==3 && (input =='a' || input =='b' || input=='c')){
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
	printf("\nEnter a string : ");
	scanf("%s",input);
	for (int i =0;i<strlen(input) ; i++){
		c = input[i];
                current_state = transition(current_state,c);
		//printf("\n current state = %d",current_state);
	}
	if (current_state == 3){
		printf("\nAccepted\n");
	}
	else
	{
		printf("\nrejected\n");
	}
	return 0;
}
                        
