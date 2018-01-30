#include<stdio.h>

int main(){
	int a[11];
	for(int i=0; i<11; i++){
		a[i] = 0;
	}
	int atual;
	int sum=0;
	double b=0.0;
	char c=1;
	while (scanf("%d",&atual) != EOF){
		a[atual]++;
		sum++;
	}
	printf("%s\t%s\t%s\n","n","q","p");
	for (int i=10; i>=0; i--){
		b += a[i]*1.0/sum;
		if (c){
			printf("%d\t%d\t%f\t%f\n",i,a[i],b,b);
			if (b>0.9999) c=0;
		}
		else{
			printf("%d\t%d\t%f\t%f\n",i,a[i],b,0.0);
		}
	}
	return 0;
}
