//gcc testshellcode.c -fno-stack-protector -z execstack -o testshellcode

int main()
{
        const char shellcode[] = "\x48\x31\xff\x48\x31\xd2\x48\x31\xf6\x48\x31\xc0\x48\x8d\x35\x12\x00\x00\x00\xbf\x01\x00\x00\x00\xba\x0d\x00\x00\x00\xb8\x01\x00\x00\x00\x0f\x05\xc3\x48\x65\x6c\x6c\x6f\x20\x57\x6f\x72\x6c\x64\x5c\x6e";


        int (*f)();
        f = (int (*)())shellcode;
        (int)(*f)();

}

