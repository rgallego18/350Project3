
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7f 26                	jg     4f <main+0x4f>
  29:	eb 5d                	jmp    88 <main+0x88>
  2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  2f:	90                   	nop
  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf("cat: cannot open %s\n", argv[i]); // Change to use format string
      exit(1); 
    }
    cat(fd);
  30:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  33:	83 c6 01             	add    $0x1,%esi
  36:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  39:	50                   	push   %eax
  3a:	e8 61 00 00 00       	call   a0 <cat>
    close(fd);
  3f:	89 3c 24             	mov    %edi,(%esp)
  42:	e8 34 03 00 00       	call   37b <close>
  for(i = 1; i < argc; i++){
  47:	83 c4 10             	add    $0x10,%esp
  4a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  4d:	74 2f                	je     7e <main+0x7e>
    if((fd = open(argv[i], 0)) < 0){
  4f:	83 ec 08             	sub    $0x8,%esp
  52:	6a 00                	push   $0x0
  54:	ff 33                	push   (%ebx)
  56:	e8 38 03 00 00       	call   393 <open>
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	89 c7                	mov    %eax,%edi
  60:	85 c0                	test   %eax,%eax
  62:	79 cc                	jns    30 <main+0x30>
      printf("cat: cannot open %s\n", argv[i]); // Change to use format string
  64:	50                   	push   %eax
  65:	50                   	push   %eax
  66:	ff 33                	push   (%ebx)
  68:	68 eb 07 00 00       	push   $0x7eb
  6d:	e8 3e 04 00 00       	call   4b0 <printf>
      exit(1); 
  72:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  79:	e8 d5 02 00 00       	call   353 <exit>
  }
  exit(0);
  7e:	83 ec 0c             	sub    $0xc,%esp
  81:	6a 00                	push   $0x0
  83:	e8 cb 02 00 00       	call   353 <exit>
    cat(0);
  88:	83 ec 0c             	sub    $0xc,%esp
  8b:	6a 00                	push   $0x0
  8d:	e8 0e 00 00 00       	call   a0 <cat>
    exit(0); 
  92:	31 d2                	xor    %edx,%edx
  94:	89 14 24             	mov    %edx,(%esp)
  97:	e8 b7 02 00 00       	call   353 <exit>
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <cat>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
  a5:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  a8:	eb 1d                	jmp    c7 <cat+0x27>
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	53                   	push   %ebx
  b4:	68 40 0b 00 00       	push   $0xb40
  b9:	6a 01                	push   $0x1
  bb:	e8 b3 02 00 00       	call   373 <write>
  c0:	83 c4 10             	add    $0x10,%esp
  c3:	39 d8                	cmp    %ebx,%eax
  c5:	75 25                	jne    ec <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  c7:	83 ec 04             	sub    $0x4,%esp
  ca:	68 00 02 00 00       	push   $0x200
  cf:	68 40 0b 00 00       	push   $0xb40
  d4:	56                   	push   %esi
  d5:	e8 91 02 00 00       	call   36b <read>
  da:	83 c4 10             	add    $0x10,%esp
  dd:	89 c3                	mov    %eax,%ebx
  df:	85 c0                	test   %eax,%eax
  e1:	7f cd                	jg     b0 <cat+0x10>
  if(n < 0){
  e3:	75 20                	jne    105 <cat+0x65>
}
  e5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  e8:	5b                   	pop    %ebx
  e9:	5e                   	pop    %esi
  ea:	5d                   	pop    %ebp
  eb:	c3                   	ret
      printf("cat: write error\n"); 
  ec:	83 ec 0c             	sub    $0xc,%esp
  ef:	68 c8 07 00 00       	push   $0x7c8
  f4:	e8 b7 03 00 00       	call   4b0 <printf>
      exit(1); 
  f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 100:	e8 4e 02 00 00       	call   353 <exit>
    printf("cat: read error\n"); 
 105:	83 ec 0c             	sub    $0xc,%esp
 108:	68 da 07 00 00       	push   $0x7da
 10d:	e8 9e 03 00 00       	call   4b0 <printf>
    exit(1);
 112:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 119:	e8 35 02 00 00       	call   353 <exit>
 11e:	66 90                	xchg   %ax,%ax

00000120 <strcpy>:
#include "x86.h"
#include <stddef.h> 

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
  char *os = s;
  while((*s++ = *t++) != 0)
 121:	31 c0                	xor    %eax,%eax
{
 123:	89 e5                	mov    %esp,%ebp
 125:	53                   	push   %ebx
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 137:	83 c0 01             	add    $0x1,%eax
 13a:	84 d2                	test   %dl,%dl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	89 c8                	mov    %ecx,%eax
 143:	c9                   	leave
 144:	c3                   	ret
 145:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 17                	jne    178 <strcmp+0x28>
 161:	eb 3a                	jmp    19d <strcmp+0x4d>
 163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 167:	90                   	nop
 168:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 16c:	83 c2 01             	add    $0x1,%edx
 16f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 172:	84 c0                	test   %al,%al
 174:	74 1a                	je     190 <strcmp+0x40>
    p++, q++;
 176:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 178:	0f b6 19             	movzbl (%ecx),%ebx
 17b:	38 c3                	cmp    %al,%bl
 17d:	74 e9                	je     168 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 17f:	29 d8                	sub    %ebx,%eax
}
 181:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 184:	c9                   	leave
 185:	c3                   	ret
 186:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 190:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 194:	31 c0                	xor    %eax,%eax
 196:	29 d8                	sub    %ebx,%eax
}
 198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19b:	c9                   	leave
 19c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 19d:	0f b6 19             	movzbl (%ecx),%ebx
 1a0:	31 c0                	xor    %eax,%eax
 1a2:	eb db                	jmp    17f <strcmp+0x2f>
 1a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1af:	90                   	nop

000001b0 <strlen>:

size_t 
strlen(const char *s) 
{
 1b0:	55                   	push   %ebp
  size_t n; 
  for(n = 0; s[n]; n++)
 1b1:	31 c0                	xor    %eax,%eax
{
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
 1b8:	80 3a 00             	cmpb   $0x0,(%edx)
 1bb:	74 0c                	je     1c9 <strlen+0x19>
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	83 c0 01             	add    $0x1,%eax
 1c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1c7:	75 f7                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <memset>:

void*
memset(void *dst, int c, size_t n) 
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1e5:	89 d0                	mov    %edx,%eax
 1e7:	c9                   	leave
 1e8:	c3                   	ret
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strchr>:

char*
strchr(const char *s, char c) 
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	75 12                	jne    213 <strchr+0x23>
 201:	eb 1d                	jmp    220 <strchr+0x30>
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 20c:	83 c0 01             	add    $0x1,%eax
 20f:	84 d2                	test   %dl,%dl
 211:	74 0d                	je     220 <strchr+0x30>
    if(*s == c)
 213:	38 d1                	cmp    %dl,%cl
 215:	75 f1                	jne    208 <strchr+0x18>
      return (char*)s;
  return 0;
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret
 224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 235:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 238:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 239:	31 db                	xor    %ebx,%ebx
{
 23b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 23e:	eb 27                	jmp    267 <gets+0x37>
    cc = read(0, &c, 1);
 240:	83 ec 04             	sub    $0x4,%esp
 243:	6a 01                	push   $0x1
 245:	56                   	push   %esi
 246:	6a 00                	push   $0x0
 248:	e8 1e 01 00 00       	call   36b <read>
    if(cc < 1)
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	7e 1d                	jle    271 <gets+0x41>
      break;
    buf[i++] = c;
 254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 258:	8b 55 08             	mov    0x8(%ebp),%edx
 25b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 25f:	3c 0a                	cmp    $0xa,%al
 261:	74 10                	je     273 <gets+0x43>
 263:	3c 0d                	cmp    $0xd,%al
 265:	74 0c                	je     273 <gets+0x43>
  for(i=0; i+1 < max; ){
 267:	89 df                	mov    %ebx,%edi
 269:	83 c3 01             	add    $0x1,%ebx
 26c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 26f:	7c cf                	jl     240 <gets+0x10>
 271:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 27a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27d:	5b                   	pop    %ebx
 27e:	5e                   	pop    %esi
 27f:	5f                   	pop    %edi
 280:	5d                   	pop    %ebp
 281:	c3                   	ret
 282:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <stat>:

int
stat(char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 295:	83 ec 08             	sub    $0x8,%esp
 298:	6a 00                	push   $0x0
 29a:	ff 75 08             	push   0x8(%ebp)
 29d:	e8 f1 00 00 00       	call   393 <open>
  if(fd < 0)
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	85 c0                	test   %eax,%eax
 2a7:	78 27                	js     2d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	ff 75 0c             	push   0xc(%ebp)
 2af:	89 c3                	mov    %eax,%ebx
 2b1:	50                   	push   %eax
 2b2:	e8 f4 00 00 00       	call   3ab <fstat>
  close(fd);
 2b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ba:	89 c6                	mov    %eax,%esi
  close(fd);
 2bc:	e8 ba 00 00 00       	call   37b <close>
  return r;
 2c1:	83 c4 10             	add    $0x10,%esp
}
 2c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2c7:	89 f0                	mov    %esi,%eax
 2c9:	5b                   	pop    %ebx
 2ca:	5e                   	pop    %esi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2d5:	eb ed                	jmp    2c4 <stat+0x34>
 2d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2de:	66 90                	xchg   %ax,%ax

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n = 0;

  while('0' <= *s && *s <= '9')
 2e7:	0f be 02             	movsbl (%edx),%eax
 2ea:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2ed:	80 f9 09             	cmp    $0x9,%cl
  int n = 0;
 2f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2f5:	77 1e                	ja     315 <atoi+0x35>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 300:	83 c2 01             	add    $0x1,%edx
 303:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 306:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 30a:	0f be 02             	movsbl (%edx),%eax
 30d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
  return n;
}
 315:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 318:	89 c8                	mov    %ecx,%eax
 31a:	c9                   	leave
 31b:	c3                   	ret
 31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, size_t n) 
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	8b 45 10             	mov    0x10(%ebp),%eax
 328:	8b 55 08             	mov    0x8(%ebp),%edx
 32b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst = vdst;
  const char *src = vsrc; 
  while(n-- > 0)
 32e:	85 c0                	test   %eax,%eax
 330:	74 13                	je     345 <memmove+0x25>
 332:	01 d0                	add    %edx,%eax
  char *dst = vdst;
 334:	89 d7                	mov    %edx,%edi
 336:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 340:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 341:	39 c7                	cmp    %eax,%edi
 343:	75 fb                	jne    340 <memmove+0x20>
  return vdst;
 345:	5e                   	pop    %esi
 346:	89 d0                	mov    %edx,%eax
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret

0000034b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34b:	b8 01 00 00 00       	mov    $0x1,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <exit>:
SYSCALL(exit)
 353:	b8 02 00 00 00       	mov    $0x2,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <wait>:
SYSCALL(wait)
 35b:	b8 03 00 00 00       	mov    $0x3,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <pipe>:
SYSCALL(pipe)
 363:	b8 04 00 00 00       	mov    $0x4,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <read>:
SYSCALL(read)
 36b:	b8 05 00 00 00       	mov    $0x5,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <write>:
SYSCALL(write)
 373:	b8 10 00 00 00       	mov    $0x10,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret

0000037b <close>:
SYSCALL(close)
 37b:	b8 15 00 00 00       	mov    $0x15,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret

00000383 <kill>:
SYSCALL(kill)
 383:	b8 06 00 00 00       	mov    $0x6,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret

0000038b <exec>:
SYSCALL(exec)
 38b:	b8 07 00 00 00       	mov    $0x7,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <open>:
SYSCALL(open)
 393:	b8 0f 00 00 00       	mov    $0xf,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret

0000039b <mknod>:
SYSCALL(mknod)
 39b:	b8 11 00 00 00       	mov    $0x11,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret

000003a3 <unlink>:
SYSCALL(unlink)
 3a3:	b8 12 00 00 00       	mov    $0x12,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret

000003ab <fstat>:
SYSCALL(fstat)
 3ab:	b8 08 00 00 00       	mov    $0x8,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret

000003b3 <link>:
SYSCALL(link)
 3b3:	b8 13 00 00 00       	mov    $0x13,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret

000003bb <mkdir>:
SYSCALL(mkdir)
 3bb:	b8 14 00 00 00       	mov    $0x14,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret

000003c3 <chdir>:
SYSCALL(chdir)
 3c3:	b8 09 00 00 00       	mov    $0x9,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret

000003cb <dup>:
SYSCALL(dup)
 3cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret

000003d3 <getpid>:
SYSCALL(getpid)
 3d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret

000003db <sbrk>:
SYSCALL(sbrk)
 3db:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret

000003e3 <sleep>:
SYSCALL(sleep)
 3e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret

000003eb <uptime>:
SYSCALL(uptime)
 3eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret

000003f3 <shutdown>:
SYSCALL(shutdown)
 3f3:	b8 16 00 00 00       	mov    $0x16,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret

000003fb <cps>:
SYSCALL(cps)
 3fb:	b8 17 00 00 00       	mov    $0x17,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret

00000403 <chpr>:
SYSCALL(chpr)
 403:	b8 18 00 00 00       	mov    $0x18,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret
 40b:	66 90                	xchg   %ax,%ax
 40d:	66 90                	xchg   %ax,%ax
 40f:	90                   	nop

00000410 <printint.constprop.0>:
{
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	89 d3                	mov    %edx,%ebx
 418:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 41b:	85 c0                	test   %eax,%eax
 41d:	0f 89 85 00 00 00    	jns    4a8 <printint.constprop.0+0x98>
 423:	83 e1 01             	and    $0x1,%ecx
 426:	0f 84 7c 00 00 00    	je     4a8 <printint.constprop.0+0x98>
    neg = 1;
    x = -xx;
 42c:	f7 d8                	neg    %eax
 42e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 430:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 435:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 438:	31 f6                	xor    %esi,%esi
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 440:	89 c8                	mov    %ecx,%eax
 442:	31 d2                	xor    %edx,%edx
 444:	89 f7                	mov    %esi,%edi
 446:	f7 f3                	div    %ebx
 448:	8d 76 01             	lea    0x1(%esi),%esi
 44b:	0f b6 92 60 08 00 00 	movzbl 0x860(%edx),%edx
 452:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 456:	89 ca                	mov    %ecx,%edx
 458:	89 c1                	mov    %eax,%ecx
 45a:	39 da                	cmp    %ebx,%edx
 45c:	73 e2                	jae    440 <printint.constprop.0+0x30>
  if(neg)
 45e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 461:	85 c0                	test   %eax,%eax
 463:	74 07                	je     46c <printint.constprop.0+0x5c>
    buf[i++] = '-';
 465:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
 46a:	89 f7                	mov    %esi,%edi
 46c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 46f:	01 df                	add    %ebx,%edi
 471:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
 478:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 47b:	83 ec 04             	sub    $0x4,%esp
 47e:	88 45 d7             	mov    %al,-0x29(%ebp)
 481:	8d 45 d7             	lea    -0x29(%ebp),%eax
 484:	6a 01                	push   $0x1
 486:	50                   	push   %eax
 487:	6a 01                	push   $0x1
 489:	e8 e5 fe ff ff       	call   373 <write>
  while(--i >= 0)
 48e:	89 f8                	mov    %edi,%eax
 490:	83 c4 10             	add    $0x10,%esp
 493:	83 ef 01             	sub    $0x1,%edi
 496:	39 d8                	cmp    %ebx,%eax
 498:	75 de                	jne    478 <printint.constprop.0+0x68>
}
 49a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49d:	5b                   	pop    %ebx
 49e:	5e                   	pop    %esi
 49f:	5f                   	pop    %edi
 4a0:	5d                   	pop    %ebp
 4a1:	c3                   	ret
 4a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    x = xx;
 4a8:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4aa:	31 c0                	xor    %eax,%eax
 4ac:	eb 87                	jmp    435 <printint.constprop.0+0x25>
 4ae:	66 90                	xchg   %ax,%ax

000004b0 <printf>:

void
printf(const char *fmt, ...) 
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 2c             	sub    $0x2c,%esp
  uint *ap;
  int fd = 1; 

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4bc:	0f b6 13             	movzbl (%ebx),%edx
 4bf:	83 c3 01             	add    $0x1,%ebx
 4c2:	84 d2                	test   %dl,%dl
 4c4:	74 69                	je     52f <printf+0x7f>
 4c6:	8d 75 0c             	lea    0xc(%ebp),%esi
 4c9:	31 ff                	xor    %edi,%edi
 4cb:	eb 28                	jmp    4f5 <printf+0x45>
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4d0:	83 f8 25             	cmp    $0x25,%eax
 4d3:	74 4b                	je     520 <printf+0x70>
  write(fd, &c, 1);
 4d5:	83 ec 04             	sub    $0x4,%esp
 4d8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4db:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4de:	6a 01                	push   $0x1
 4e0:	50                   	push   %eax
 4e1:	6a 01                	push   $0x1
 4e3:	e8 8b fe ff ff       	call   373 <write>
        state = '%';
      } else {
        putc(fd, c);
 4e8:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4eb:	0f b6 13             	movzbl (%ebx),%edx
 4ee:	83 c3 01             	add    $0x1,%ebx
 4f1:	84 d2                	test   %dl,%dl
 4f3:	74 3a                	je     52f <printf+0x7f>
    c = fmt[i] & 0xff;
 4f5:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4f8:	85 ff                	test   %edi,%edi
 4fa:	74 d4                	je     4d0 <printf+0x20>
      }
    } else if(state == '%'){
 4fc:	83 ff 25             	cmp    $0x25,%edi
 4ff:	75 ea                	jne    4eb <printf+0x3b>
      if(c == 'd'){
 501:	83 f8 25             	cmp    $0x25,%eax
 504:	0f 84 1e 01 00 00    	je     628 <printf+0x178>
 50a:	83 e8 63             	sub    $0x63,%eax
 50d:	83 f8 15             	cmp    $0x15,%eax
 510:	77 2e                	ja     540 <printf+0x90>
 512:	ff 24 85 08 08 00 00 	jmp    *0x808(,%eax,4)
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
 520:	0f b6 13             	movzbl (%ebx),%edx
 523:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 526:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 52b:	84 d2                	test   %dl,%dl
 52d:	75 c6                	jne    4f5 <printf+0x45>
        putc(fd, c);
      }
      state = 0;
    }
  }
 52f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 532:	5b                   	pop    %ebx
 533:	5e                   	pop    %esi
 534:	5f                   	pop    %edi
 535:	5d                   	pop    %ebp
 536:	c3                   	ret
 537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 540:	83 ec 04             	sub    $0x4,%esp
 543:	8d 7d e7             	lea    -0x19(%ebp),%edi
 546:	88 55 d4             	mov    %dl,-0x2c(%ebp)
        putc(fd, '%');
 549:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 54d:	6a 01                	push   $0x1
 54f:	57                   	push   %edi
 550:	6a 01                	push   $0x1
 552:	e8 1c fe ff ff       	call   373 <write>
        putc(fd, c);
 557:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 55b:	83 c4 0c             	add    $0xc,%esp
 55e:	88 55 e7             	mov    %dl,-0x19(%ebp)
 561:	6a 01                	push   $0x1
 563:	57                   	push   %edi
      state = 0;
 564:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 566:	6a 01                	push   $0x1
 568:	e8 06 fe ff ff       	call   373 <write>
        putc(fd, c);
 56d:	83 c4 10             	add    $0x10,%esp
 570:	e9 76 ff ff ff       	jmp    4eb <printf+0x3b>
 575:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 578:	8b 06                	mov    (%esi),%eax
 57a:	31 c9                	xor    %ecx,%ecx
 57c:	ba 10 00 00 00       	mov    $0x10,%edx
        ap++;
 581:	83 c6 04             	add    $0x4,%esi
      state = 0;
 584:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 586:	e8 85 fe ff ff       	call   410 <printint.constprop.0>
        ap++;
 58b:	e9 5b ff ff ff       	jmp    4eb <printf+0x3b>
        s = (char*)*ap;
 590:	8b 16                	mov    (%esi),%edx
        ap++;
 592:	83 c6 04             	add    $0x4,%esi
        if(s == 0)
 595:	85 d2                	test   %edx,%edx
 597:	0f 84 a3 00 00 00    	je     640 <printf+0x190>
        while(*s != 0){
 59d:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 5a0:	31 ff                	xor    %edi,%edi
        while(*s != 0){
 5a2:	84 c0                	test   %al,%al
 5a4:	0f 84 41 ff ff ff    	je     4eb <printf+0x3b>
 5aa:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
          putc(fd, *s);
 5b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5b9:	6a 01                	push   $0x1
 5bb:	57                   	push   %edi
 5bc:	6a 01                	push   $0x1
 5be:	e8 b0 fd ff ff       	call   373 <write>
          s++;
 5c3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        while(*s != 0){
 5c6:	83 c4 10             	add    $0x10,%esp
 5c9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
          s++;
 5cd:	83 c2 01             	add    $0x1,%edx
        while(*s != 0){
 5d0:	84 c0                	test   %al,%al
 5d2:	75 dc                	jne    5b0 <printf+0x100>
      state = 0;
 5d4:	31 ff                	xor    %edi,%edi
 5d6:	e9 10 ff ff ff       	jmp    4eb <printf+0x3b>
 5db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop
        printint(fd, *ap, 10, 1);
 5e0:	8b 06                	mov    (%esi),%eax
 5e2:	b9 01 00 00 00       	mov    $0x1,%ecx
 5e7:	ba 0a 00 00 00       	mov    $0xa,%edx
        ap++;
 5ec:	83 c6 04             	add    $0x4,%esi
      state = 0;
 5ef:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 10, 1);
 5f1:	e8 1a fe ff ff       	call   410 <printint.constprop.0>
        ap++;
 5f6:	e9 f0 fe ff ff       	jmp    4eb <printf+0x3b>
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop
        putc(fd, *ap);
 600:	8b 06                	mov    (%esi),%eax
  write(fd, &c, 1);
 602:	83 ec 04             	sub    $0x4,%esp
 605:	8d 7d e7             	lea    -0x19(%ebp),%edi
        ap++;
 608:	83 c6 04             	add    $0x4,%esi
        putc(fd, *ap);
 60b:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 60e:	6a 01                	push   $0x1
 610:	57                   	push   %edi
      state = 0;
 611:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 613:	6a 01                	push   $0x1
 615:	e8 59 fd ff ff       	call   373 <write>
        ap++;
 61a:	83 c4 10             	add    $0x10,%esp
 61d:	e9 c9 fe ff ff       	jmp    4eb <printf+0x3b>
 622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 628:	83 ec 04             	sub    $0x4,%esp
 62b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 62e:	8d 7d e7             	lea    -0x19(%ebp),%edi
 631:	6a 01                	push   $0x1
 633:	e9 2b ff ff ff       	jmp    563 <printf+0xb3>
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
 640:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 645:	ba 00 08 00 00       	mov    $0x800,%edx
 64a:	e9 5b ff ff ff       	jmp    5aa <printf+0xfa>
 64f:	90                   	nop

00000650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 650:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	a1 40 0d 00 00       	mov    0xd40,%eax
{
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 65e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 668:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 66a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 66c:	39 ca                	cmp    %ecx,%edx
 66e:	73 30                	jae    6a0 <free+0x50>
 670:	39 c1                	cmp    %eax,%ecx
 672:	72 04                	jb     678 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 674:	39 c2                	cmp    %eax,%edx
 676:	72 f0                	jb     668 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 678:	8b 73 fc             	mov    -0x4(%ebx),%esi
 67b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 67e:	39 f8                	cmp    %edi,%eax
 680:	74 2e                	je     6b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 682:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 685:	8b 42 04             	mov    0x4(%edx),%eax
 688:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 68b:	39 f1                	cmp    %esi,%ecx
 68d:	74 38                	je     6c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 68f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 691:	5b                   	pop    %ebx
  freep = p;
 692:	89 15 40 0d 00 00    	mov    %edx,0xd40
}
 698:	5e                   	pop    %esi
 699:	5f                   	pop    %edi
 69a:	5d                   	pop    %ebp
 69b:	c3                   	ret
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a0:	39 c1                	cmp    %eax,%ecx
 6a2:	72 d0                	jb     674 <free+0x24>
 6a4:	eb c2                	jmp    668 <free+0x18>
 6a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 6b0:	03 70 04             	add    0x4(%eax),%esi
 6b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b6:	8b 02                	mov    (%edx),%eax
 6b8:	8b 00                	mov    (%eax),%eax
 6ba:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6bd:	8b 42 04             	mov    0x4(%edx),%eax
 6c0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6c3:	39 f1                	cmp    %esi,%ecx
 6c5:	75 c8                	jne    68f <free+0x3f>
    p->s.size += bp->s.size;
 6c7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6ca:	89 15 40 0d 00 00    	mov    %edx,0xd40
    p->s.size += bp->s.size;
 6d0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6d3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6d6:	89 0a                	mov    %ecx,(%edx)
}
 6d8:	5b                   	pop    %ebx
 6d9:	5e                   	pop    %esi
 6da:	5f                   	pop    %edi
 6db:	5d                   	pop    %ebp
 6dc:	c3                   	ret
 6dd:	8d 76 00             	lea    0x0(%esi),%esi

000006e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ec:	8b 15 40 0d 00 00    	mov    0xd40,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f2:	8d 78 07             	lea    0x7(%eax),%edi
 6f5:	c1 ef 03             	shr    $0x3,%edi
 6f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6fb:	85 d2                	test   %edx,%edx
 6fd:	0f 84 8d 00 00 00    	je     790 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 703:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 705:	8b 48 04             	mov    0x4(%eax),%ecx
 708:	39 f9                	cmp    %edi,%ecx
 70a:	73 64                	jae    770 <malloc+0x90>
  if(nu < 4096)
 70c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 711:	39 df                	cmp    %ebx,%edi
 713:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 716:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 71d:	eb 0a                	jmp    729 <malloc+0x49>
 71f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 720:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 722:	8b 48 04             	mov    0x4(%eax),%ecx
 725:	39 f9                	cmp    %edi,%ecx
 727:	73 47                	jae    770 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 729:	89 c2                	mov    %eax,%edx
 72b:	39 05 40 0d 00 00    	cmp    %eax,0xd40
 731:	75 ed                	jne    720 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 733:	83 ec 0c             	sub    $0xc,%esp
 736:	56                   	push   %esi
 737:	e8 9f fc ff ff       	call   3db <sbrk>
  if(p == (char*)-1)
 73c:	83 c4 10             	add    $0x10,%esp
 73f:	83 f8 ff             	cmp    $0xffffffff,%eax
 742:	74 1c                	je     760 <malloc+0x80>
  hp->s.size = nu;
 744:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 747:	83 ec 0c             	sub    $0xc,%esp
 74a:	83 c0 08             	add    $0x8,%eax
 74d:	50                   	push   %eax
 74e:	e8 fd fe ff ff       	call   650 <free>
  return freep;
 753:	8b 15 40 0d 00 00    	mov    0xd40,%edx
      if((p = morecore(nunits)) == 0)
 759:	83 c4 10             	add    $0x10,%esp
 75c:	85 d2                	test   %edx,%edx
 75e:	75 c0                	jne    720 <malloc+0x40>
        return 0;
  }
}
 760:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 763:	31 c0                	xor    %eax,%eax
}
 765:	5b                   	pop    %ebx
 766:	5e                   	pop    %esi
 767:	5f                   	pop    %edi
 768:	5d                   	pop    %ebp
 769:	c3                   	ret
 76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 770:	39 cf                	cmp    %ecx,%edi
 772:	74 4c                	je     7c0 <malloc+0xe0>
        p->s.size -= nunits;
 774:	29 f9                	sub    %edi,%ecx
 776:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 779:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 77c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 77f:	89 15 40 0d 00 00    	mov    %edx,0xd40
}
 785:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 788:	83 c0 08             	add    $0x8,%eax
}
 78b:	5b                   	pop    %ebx
 78c:	5e                   	pop    %esi
 78d:	5f                   	pop    %edi
 78e:	5d                   	pop    %ebp
 78f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 790:	c7 05 40 0d 00 00 44 	movl   $0xd44,0xd40
 797:	0d 00 00 
    base.s.size = 0;
 79a:	b8 44 0d 00 00       	mov    $0xd44,%eax
    base.s.ptr = freep = prevp = &base;
 79f:	c7 05 44 0d 00 00 44 	movl   $0xd44,0xd44
 7a6:	0d 00 00 
    base.s.size = 0;
 7a9:	c7 05 48 0d 00 00 00 	movl   $0x0,0xd48
 7b0:	00 00 00 
    if(p->s.size >= nunits){
 7b3:	e9 54 ff ff ff       	jmp    70c <malloc+0x2c>
 7b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bf:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 7c0:	8b 08                	mov    (%eax),%ecx
 7c2:	89 0a                	mov    %ecx,(%edx)
 7c4:	eb b9                	jmp    77f <malloc+0x9f>
