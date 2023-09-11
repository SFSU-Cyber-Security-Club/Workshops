#include<unistd.h>
#include<stdlib.h>
#include<fcntl.h>
int main()
{
        char buffer[22];
        int f = open("oskar", O_RDONLY);
        
        read(f, buffer, sizeof(buffer));

        write(1, buffer, sizeof(buffer));
}
