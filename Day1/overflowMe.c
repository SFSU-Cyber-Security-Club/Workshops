#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

int winner()
{
        int on = 1;
        FILE* f = fopen("ASCIART.txt", "r");
        
        if(f == NULL)
        {
                printf("Add some amazing ASCII Art here.. \n");
                on = 0;
        }

        char c;
        
        if(on)
        {
                while ((c = fgetc(f)) != EOF) {
                         putchar(c);
                }   

                fclose(f);
        }



        printf("You made it!!!! Here's the flag! \n");
       
        f = fopen("flag.txt", "r");
        
        while ((c = fgetc(f)) != EOF) 
        {
               putchar(c);
        }       
       
        fclose(f);
        
        exit(1);

}
int main()
{
        //Terminal crap
        setbuf(stdin, 0);
        setbuf(stdout, 0);
        setbuf(stderr, 0);


        char sillybuffer[20];

        printf("Overflow me to this address!! %x \n ", &winner);
        printf("Go go go !\n");
        scanf("%s", sillybuffer);
       

        printf("Let's see .. \n");
        return 0;
}
