
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 47                	jle    65 <main+0x65>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  1e:	8b 47 04             	mov    0x4(%edi),%eax
  21:	83 fe 02             	cmp    $0x2,%esi
  24:	74 2a                	je     50 <main+0x50>
  26:	bb 02 00 00 00       	mov    $0x2,%ebx
  2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  2f:	90                   	nop
  30:	68 18 07 00 00       	push   $0x718
  35:	83 c3 01             	add    $0x1,%ebx
  38:	50                   	push   %eax
  39:	68 1a 07 00 00       	push   $0x71a
  3e:	6a 01                	push   $0x1
  40:	e8 bb 03 00 00       	call   400 <printf>
  45:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 f3                	cmp    %esi,%ebx
  4e:	75 e0                	jne    30 <main+0x30>
  50:	68 1f 07 00 00       	push   $0x71f
  55:	50                   	push   %eax
  56:	68 1a 07 00 00       	push   $0x71a
  5b:	6a 01                	push   $0x1
  5d:	e8 9e 03 00 00       	call   400 <printf>
  62:	83 c4 10             	add    $0x10,%esp
  exit(0);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	6a 00                	push   $0x0
  6a:	e8 34 02 00 00       	call   2a3 <exit>
  6f:	90                   	nop

00000070 <strcpy>:
#include "x86.h"
#include <stddef.h> 

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  char *os = s;
  while((*s++ = *t++) != 0)
  71:	31 c0                	xor    %eax,%eax
{
  73:	89 e5                	mov    %esp,%ebp
  75:	53                   	push   %ebx
  76:	8b 4d 08             	mov    0x8(%ebp),%ecx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  91:	89 c8                	mov    %ecx,%eax
  93:	c9                   	leave
  94:	c3                   	ret
  95:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 55 08             	mov    0x8(%ebp),%edx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	75 17                	jne    c8 <strcmp+0x28>
  b1:	eb 3a                	jmp    ed <strcmp+0x4d>
  b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b7:	90                   	nop
  b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  bc:	83 c2 01             	add    $0x1,%edx
  bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  c2:	84 c0                	test   %al,%al
  c4:	74 1a                	je     e0 <strcmp+0x40>
    p++, q++;
  c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  c8:	0f b6 19             	movzbl (%ecx),%ebx
  cb:	38 c3                	cmp    %al,%bl
  cd:	74 e9                	je     b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  cf:	29 d8                	sub    %ebx,%eax
}
  d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d4:	c9                   	leave
  d5:	c3                   	ret
  d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 d8                	sub    %ebx,%eax
}
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave
  ec:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  ed:	0f b6 19             	movzbl (%ecx),%ebx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb db                	jmp    cf <strcmp+0x2f>
  f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop

00000100 <strlen>:

size_t 
strlen(const char *s) 
{
 100:	55                   	push   %ebp
  size_t n; 
  for(n = 0; s[n]; n++)
 101:	31 c0                	xor    %eax,%eax
{
 103:	89 e5                	mov    %esp,%ebp
 105:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
 108:	80 3a 00             	cmpb   $0x0,(%edx)
 10b:	74 0c                	je     119 <strlen+0x19>
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	75 f7                	jne    110 <strlen+0x10>
    ;
  return n;
}
 119:	5d                   	pop    %ebp
 11a:	c3                   	ret
 11b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 11f:	90                   	nop

00000120 <memset>:

void*
memset(void *dst, int c, size_t n) 
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	8b 7d fc             	mov    -0x4(%ebp),%edi
 135:	89 d0                	mov    %edx,%eax
 137:	c9                   	leave
 138:	c3                   	ret
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strchr>:

char*
strchr(const char *s, char c) 
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	83 c0 01             	add    $0x1,%eax
 15f:	84 d2                	test   %dl,%dl
 161:	74 0d                	je     170 <strchr+0x30>
    if(*s == c)
 163:	38 d1                	cmp    %dl,%cl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 185:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 189:	31 db                	xor    %ebx,%ebx
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 27                	jmp    1b7 <gets+0x37>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	56                   	push   %esi
 196:	6a 00                	push   $0x0
 198:	e8 1e 01 00 00       	call   2bb <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1af:	3c 0a                	cmp    $0xa,%al
 1b1:	74 10                	je     1c3 <gets+0x43>
 1b3:	3c 0d                	cmp    $0xd,%al
 1b5:	74 0c                	je     1c3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1b7:	89 df                	mov    %ebx,%edi
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
 1c1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cd:	5b                   	pop    %ebx
 1ce:	5e                   	pop    %esi
 1cf:	5f                   	pop    %edi
 1d0:	5d                   	pop    %ebp
 1d1:	c3                   	ret
 1d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <stat>:

int
stat(char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 f1 00 00 00       	call   2e3 <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 27                	js     220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1f9:	83 ec 08             	sub    $0x8,%esp
 1fc:	ff 75 0c             	push   0xc(%ebp)
 1ff:	89 c3                	mov    %eax,%ebx
 201:	50                   	push   %eax
 202:	e8 f4 00 00 00       	call   2fb <fstat>
  close(fd);
 207:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 20a:	89 c6                	mov    %eax,%esi
  close(fd);
 20c:	e8 ba 00 00 00       	call   2cb <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	8d 65 f8             	lea    -0x8(%ebp),%esp
 217:	89 f0                	mov    %esi,%eax
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret
 21d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 220:	be ff ff ff ff       	mov    $0xffffffff,%esi
 225:	eb ed                	jmp    214 <stat+0x34>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax

00000230 <atoi>:

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 55 08             	mov    0x8(%ebp),%edx
  int n = 0;

  while('0' <= *s && *s <= '9')
 237:	0f be 02             	movsbl (%edx),%eax
 23a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 23d:	80 f9 09             	cmp    $0x9,%cl
  int n = 0;
 240:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 245:	77 1e                	ja     265 <atoi+0x35>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 250:	83 c2 01             	add    $0x1,%edx
 253:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 256:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 25a:	0f be 02             	movsbl (%edx),%eax
 25d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 260:	80 fb 09             	cmp    $0x9,%bl
 263:	76 eb                	jbe    250 <atoi+0x20>
  return n;
}
 265:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 268:	89 c8                	mov    %ecx,%eax
 26a:	c9                   	leave
 26b:	c3                   	ret
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <memmove>:

void*
memmove(void *vdst, const void *vsrc, size_t n) 
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	8b 45 10             	mov    0x10(%ebp),%eax
 278:	8b 55 08             	mov    0x8(%ebp),%edx
 27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst = vdst;
  const char *src = vsrc; 
  while(n-- > 0)
 27e:	85 c0                	test   %eax,%eax
 280:	74 13                	je     295 <memmove+0x25>
 282:	01 d0                	add    %edx,%eax
  char *dst = vdst;
 284:	89 d7                	mov    %edx,%edi
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 290:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 291:	39 c7                	cmp    %eax,%edi
 293:	75 fb                	jne    290 <memmove+0x20>
  return vdst;
 295:	5e                   	pop    %esi
 296:	89 d0                	mov    %edx,%eax
 298:	5f                   	pop    %edi
 299:	5d                   	pop    %ebp
 29a:	c3                   	ret

0000029b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29b:	b8 01 00 00 00       	mov    $0x1,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret

000002a3 <exit>:
SYSCALL(exit)
 2a3:	b8 02 00 00 00       	mov    $0x2,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret

000002ab <wait>:
SYSCALL(wait)
 2ab:	b8 03 00 00 00       	mov    $0x3,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret

000002b3 <pipe>:
SYSCALL(pipe)
 2b3:	b8 04 00 00 00       	mov    $0x4,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret

000002bb <read>:
SYSCALL(read)
 2bb:	b8 05 00 00 00       	mov    $0x5,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret

000002c3 <write>:
SYSCALL(write)
 2c3:	b8 10 00 00 00       	mov    $0x10,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret

000002cb <close>:
SYSCALL(close)
 2cb:	b8 15 00 00 00       	mov    $0x15,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret

000002d3 <kill>:
SYSCALL(kill)
 2d3:	b8 06 00 00 00       	mov    $0x6,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret

000002db <exec>:
SYSCALL(exec)
 2db:	b8 07 00 00 00       	mov    $0x7,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret

000002e3 <open>:
SYSCALL(open)
 2e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret

000002eb <mknod>:
SYSCALL(mknod)
 2eb:	b8 11 00 00 00       	mov    $0x11,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <unlink>:
SYSCALL(unlink)
 2f3:	b8 12 00 00 00       	mov    $0x12,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <fstat>:
SYSCALL(fstat)
 2fb:	b8 08 00 00 00       	mov    $0x8,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <link>:
SYSCALL(link)
 303:	b8 13 00 00 00       	mov    $0x13,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <mkdir>:
SYSCALL(mkdir)
 30b:	b8 14 00 00 00       	mov    $0x14,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <chdir>:
SYSCALL(chdir)
 313:	b8 09 00 00 00       	mov    $0x9,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <dup>:
SYSCALL(dup)
 31b:	b8 0a 00 00 00       	mov    $0xa,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <getpid>:
SYSCALL(getpid)
 323:	b8 0b 00 00 00       	mov    $0xb,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <sbrk>:
SYSCALL(sbrk)
 32b:	b8 0c 00 00 00       	mov    $0xc,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <sleep>:
SYSCALL(sleep)
 333:	b8 0d 00 00 00       	mov    $0xd,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <uptime>:
SYSCALL(uptime)
 33b:	b8 0e 00 00 00       	mov    $0xe,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <shutdown>:
SYSCALL(shutdown)
 343:	b8 16 00 00 00       	mov    $0x16,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <cps>:
SYSCALL(cps)
 34b:	b8 17 00 00 00       	mov    $0x17,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <chpr>:
SYSCALL(chpr)
 353:	b8 18 00 00 00       	mov    $0x18,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret
 35b:	66 90                	xchg   %ax,%ax
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint.constprop.0>:
{
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	89 d3                	mov    %edx,%ebx
 368:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 36b:	85 c0                	test   %eax,%eax
 36d:	0f 89 85 00 00 00    	jns    3f8 <printint.constprop.0+0x98>
 373:	83 e1 01             	and    $0x1,%ecx
 376:	0f 84 7c 00 00 00    	je     3f8 <printint.constprop.0+0x98>
    neg = 1;
    x = -xx;
 37c:	f7 d8                	neg    %eax
 37e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 380:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 385:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 388:	31 f6                	xor    %esi,%esi
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 390:	89 c8                	mov    %ecx,%eax
 392:	31 d2                	xor    %edx,%edx
 394:	89 f7                	mov    %esi,%edi
 396:	f7 f3                	div    %ebx
 398:	8d 76 01             	lea    0x1(%esi),%esi
 39b:	0f b6 92 80 07 00 00 	movzbl 0x780(%edx),%edx
 3a2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 3a6:	89 ca                	mov    %ecx,%edx
 3a8:	89 c1                	mov    %eax,%ecx
 3aa:	39 da                	cmp    %ebx,%edx
 3ac:	73 e2                	jae    390 <printint.constprop.0+0x30>
  if(neg)
 3ae:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3b1:	85 c0                	test   %eax,%eax
 3b3:	74 07                	je     3bc <printint.constprop.0+0x5c>
    buf[i++] = '-';
 3b5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
 3ba:	89 f7                	mov    %esi,%edi
 3bc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3bf:	01 df                	add    %ebx,%edi
 3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
 3c8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 3cb:	83 ec 04             	sub    $0x4,%esp
 3ce:	88 45 d7             	mov    %al,-0x29(%ebp)
 3d1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 3d4:	6a 01                	push   $0x1
 3d6:	50                   	push   %eax
 3d7:	6a 01                	push   $0x1
 3d9:	e8 e5 fe ff ff       	call   2c3 <write>
  while(--i >= 0)
 3de:	89 f8                	mov    %edi,%eax
 3e0:	83 c4 10             	add    $0x10,%esp
 3e3:	83 ef 01             	sub    $0x1,%edi
 3e6:	39 d8                	cmp    %ebx,%eax
 3e8:	75 de                	jne    3c8 <printint.constprop.0+0x68>
}
 3ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ed:	5b                   	pop    %ebx
 3ee:	5e                   	pop    %esi
 3ef:	5f                   	pop    %edi
 3f0:	5d                   	pop    %ebp
 3f1:	c3                   	ret
 3f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    x = xx;
 3f8:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3fa:	31 c0                	xor    %eax,%eax
 3fc:	eb 87                	jmp    385 <printint.constprop.0+0x25>
 3fe:	66 90                	xchg   %ax,%ax

00000400 <printf>:

void
printf(const char *fmt, ...) 
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 2c             	sub    $0x2c,%esp
  uint *ap;
  int fd = 1; 

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 409:	8b 5d 08             	mov    0x8(%ebp),%ebx
 40c:	0f b6 13             	movzbl (%ebx),%edx
 40f:	83 c3 01             	add    $0x1,%ebx
 412:	84 d2                	test   %dl,%dl
 414:	74 69                	je     47f <printf+0x7f>
 416:	8d 75 0c             	lea    0xc(%ebp),%esi
 419:	31 ff                	xor    %edi,%edi
 41b:	eb 28                	jmp    445 <printf+0x45>
 41d:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 420:	83 f8 25             	cmp    $0x25,%eax
 423:	74 4b                	je     470 <printf+0x70>
  write(fd, &c, 1);
 425:	83 ec 04             	sub    $0x4,%esp
 428:	8d 45 e7             	lea    -0x19(%ebp),%eax
 42b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 42e:	6a 01                	push   $0x1
 430:	50                   	push   %eax
 431:	6a 01                	push   $0x1
 433:	e8 8b fe ff ff       	call   2c3 <write>
        state = '%';
      } else {
        putc(fd, c);
 438:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 43b:	0f b6 13             	movzbl (%ebx),%edx
 43e:	83 c3 01             	add    $0x1,%ebx
 441:	84 d2                	test   %dl,%dl
 443:	74 3a                	je     47f <printf+0x7f>
    c = fmt[i] & 0xff;
 445:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 448:	85 ff                	test   %edi,%edi
 44a:	74 d4                	je     420 <printf+0x20>
      }
    } else if(state == '%'){
 44c:	83 ff 25             	cmp    $0x25,%edi
 44f:	75 ea                	jne    43b <printf+0x3b>
      if(c == 'd'){
 451:	83 f8 25             	cmp    $0x25,%eax
 454:	0f 84 1e 01 00 00    	je     578 <printf+0x178>
 45a:	83 e8 63             	sub    $0x63,%eax
 45d:	83 f8 15             	cmp    $0x15,%eax
 460:	77 2e                	ja     490 <printf+0x90>
 462:	ff 24 85 28 07 00 00 	jmp    *0x728(,%eax,4)
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
 470:	0f b6 13             	movzbl (%ebx),%edx
 473:	83 c3 01             	add    $0x1,%ebx
        state = '%';
 476:	bf 25 00 00 00       	mov    $0x25,%edi
  for(i = 0; fmt[i]; i++){
 47b:	84 d2                	test   %dl,%dl
 47d:	75 c6                	jne    445 <printf+0x45>
        putc(fd, c);
      }
      state = 0;
    }
  }
 47f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 482:	5b                   	pop    %ebx
 483:	5e                   	pop    %esi
 484:	5f                   	pop    %edi
 485:	5d                   	pop    %ebp
 486:	c3                   	ret
 487:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 490:	83 ec 04             	sub    $0x4,%esp
 493:	8d 7d e7             	lea    -0x19(%ebp),%edi
 496:	88 55 d4             	mov    %dl,-0x2c(%ebp)
        putc(fd, '%');
 499:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 49d:	6a 01                	push   $0x1
 49f:	57                   	push   %edi
 4a0:	6a 01                	push   $0x1
 4a2:	e8 1c fe ff ff       	call   2c3 <write>
        putc(fd, c);
 4a7:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 4ab:	83 c4 0c             	add    $0xc,%esp
 4ae:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4b1:	6a 01                	push   $0x1
 4b3:	57                   	push   %edi
      state = 0;
 4b4:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 4b6:	6a 01                	push   $0x1
 4b8:	e8 06 fe ff ff       	call   2c3 <write>
        putc(fd, c);
 4bd:	83 c4 10             	add    $0x10,%esp
 4c0:	e9 76 ff ff ff       	jmp    43b <printf+0x3b>
 4c5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4c8:	8b 06                	mov    (%esi),%eax
 4ca:	31 c9                	xor    %ecx,%ecx
 4cc:	ba 10 00 00 00       	mov    $0x10,%edx
        ap++;
 4d1:	83 c6 04             	add    $0x4,%esi
      state = 0;
 4d4:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 4d6:	e8 85 fe ff ff       	call   360 <printint.constprop.0>
        ap++;
 4db:	e9 5b ff ff ff       	jmp    43b <printf+0x3b>
        s = (char*)*ap;
 4e0:	8b 16                	mov    (%esi),%edx
        ap++;
 4e2:	83 c6 04             	add    $0x4,%esi
        if(s == 0)
 4e5:	85 d2                	test   %edx,%edx
 4e7:	0f 84 a3 00 00 00    	je     590 <printf+0x190>
        while(*s != 0){
 4ed:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 4f0:	31 ff                	xor    %edi,%edi
        while(*s != 0){
 4f2:	84 c0                	test   %al,%al
 4f4:	0f 84 41 ff ff ff    	je     43b <printf+0x3b>
 4fa:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 500:	83 ec 04             	sub    $0x4,%esp
 503:	89 55 d4             	mov    %edx,-0x2c(%ebp)
          putc(fd, *s);
 506:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 509:	6a 01                	push   $0x1
 50b:	57                   	push   %edi
 50c:	6a 01                	push   $0x1
 50e:	e8 b0 fd ff ff       	call   2c3 <write>
          s++;
 513:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        while(*s != 0){
 516:	83 c4 10             	add    $0x10,%esp
 519:	0f b6 42 01          	movzbl 0x1(%edx),%eax
          s++;
 51d:	83 c2 01             	add    $0x1,%edx
        while(*s != 0){
 520:	84 c0                	test   %al,%al
 522:	75 dc                	jne    500 <printf+0x100>
      state = 0;
 524:	31 ff                	xor    %edi,%edi
 526:	e9 10 ff ff ff       	jmp    43b <printf+0x3b>
 52b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop
        printint(fd, *ap, 10, 1);
 530:	8b 06                	mov    (%esi),%eax
 532:	b9 01 00 00 00       	mov    $0x1,%ecx
 537:	ba 0a 00 00 00       	mov    $0xa,%edx
        ap++;
 53c:	83 c6 04             	add    $0x4,%esi
      state = 0;
 53f:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 10, 1);
 541:	e8 1a fe ff ff       	call   360 <printint.constprop.0>
        ap++;
 546:	e9 f0 fe ff ff       	jmp    43b <printf+0x3b>
 54b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop
        putc(fd, *ap);
 550:	8b 06                	mov    (%esi),%eax
  write(fd, &c, 1);
 552:	83 ec 04             	sub    $0x4,%esp
 555:	8d 7d e7             	lea    -0x19(%ebp),%edi
        ap++;
 558:	83 c6 04             	add    $0x4,%esi
        putc(fd, *ap);
 55b:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 55e:	6a 01                	push   $0x1
 560:	57                   	push   %edi
      state = 0;
 561:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 563:	6a 01                	push   $0x1
 565:	e8 59 fd ff ff       	call   2c3 <write>
        ap++;
 56a:	83 c4 10             	add    $0x10,%esp
 56d:	e9 c9 fe ff ff       	jmp    43b <printf+0x3b>
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 578:	83 ec 04             	sub    $0x4,%esp
 57b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 57e:	8d 7d e7             	lea    -0x19(%ebp),%edi
 581:	6a 01                	push   $0x1
 583:	e9 2b ff ff ff       	jmp    4b3 <printf+0xb3>
 588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop
 590:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 595:	ba 21 07 00 00       	mov    $0x721,%edx
 59a:	e9 5b ff ff ff       	jmp    4fa <printf+0xfa>
 59f:	90                   	nop

000005a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a1:	a1 20 0a 00 00       	mov    0xa20,%eax
{
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	57                   	push   %edi
 5a9:	56                   	push   %esi
 5aa:	53                   	push   %ebx
 5ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b8:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ba:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5bc:	39 ca                	cmp    %ecx,%edx
 5be:	73 30                	jae    5f0 <free+0x50>
 5c0:	39 c1                	cmp    %eax,%ecx
 5c2:	72 04                	jb     5c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c4:	39 c2                	cmp    %eax,%edx
 5c6:	72 f0                	jb     5b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ce:	39 f8                	cmp    %edi,%eax
 5d0:	74 2e                	je     600 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5d5:	8b 42 04             	mov    0x4(%edx),%eax
 5d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5db:	39 f1                	cmp    %esi,%ecx
 5dd:	74 38                	je     617 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5e1:	5b                   	pop    %ebx
  freep = p;
 5e2:	89 15 20 0a 00 00    	mov    %edx,0xa20
}
 5e8:	5e                   	pop    %esi
 5e9:	5f                   	pop    %edi
 5ea:	5d                   	pop    %ebp
 5eb:	c3                   	ret
 5ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f0:	39 c1                	cmp    %eax,%ecx
 5f2:	72 d0                	jb     5c4 <free+0x24>
 5f4:	eb c2                	jmp    5b8 <free+0x18>
 5f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 600:	03 70 04             	add    0x4(%eax),%esi
 603:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 606:	8b 02                	mov    (%edx),%eax
 608:	8b 00                	mov    (%eax),%eax
 60a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 60d:	8b 42 04             	mov    0x4(%edx),%eax
 610:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 613:	39 f1                	cmp    %esi,%ecx
 615:	75 c8                	jne    5df <free+0x3f>
    p->s.size += bp->s.size;
 617:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 61a:	89 15 20 0a 00 00    	mov    %edx,0xa20
    p->s.size += bp->s.size;
 620:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 623:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 626:	89 0a                	mov    %ecx,(%edx)
}
 628:	5b                   	pop    %ebx
 629:	5e                   	pop    %esi
 62a:	5f                   	pop    %edi
 62b:	5d                   	pop    %ebp
 62c:	c3                   	ret
 62d:	8d 76 00             	lea    0x0(%esi),%esi

00000630 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 639:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 63c:	8b 15 20 0a 00 00    	mov    0xa20,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 642:	8d 78 07             	lea    0x7(%eax),%edi
 645:	c1 ef 03             	shr    $0x3,%edi
 648:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 64b:	85 d2                	test   %edx,%edx
 64d:	0f 84 8d 00 00 00    	je     6e0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 653:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 655:	8b 48 04             	mov    0x4(%eax),%ecx
 658:	39 f9                	cmp    %edi,%ecx
 65a:	73 64                	jae    6c0 <malloc+0x90>
  if(nu < 4096)
 65c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 661:	39 df                	cmp    %ebx,%edi
 663:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 666:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 66d:	eb 0a                	jmp    679 <malloc+0x49>
 66f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 670:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 672:	8b 48 04             	mov    0x4(%eax),%ecx
 675:	39 f9                	cmp    %edi,%ecx
 677:	73 47                	jae    6c0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 679:	89 c2                	mov    %eax,%edx
 67b:	39 05 20 0a 00 00    	cmp    %eax,0xa20
 681:	75 ed                	jne    670 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 683:	83 ec 0c             	sub    $0xc,%esp
 686:	56                   	push   %esi
 687:	e8 9f fc ff ff       	call   32b <sbrk>
  if(p == (char*)-1)
 68c:	83 c4 10             	add    $0x10,%esp
 68f:	83 f8 ff             	cmp    $0xffffffff,%eax
 692:	74 1c                	je     6b0 <malloc+0x80>
  hp->s.size = nu;
 694:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 697:	83 ec 0c             	sub    $0xc,%esp
 69a:	83 c0 08             	add    $0x8,%eax
 69d:	50                   	push   %eax
 69e:	e8 fd fe ff ff       	call   5a0 <free>
  return freep;
 6a3:	8b 15 20 0a 00 00    	mov    0xa20,%edx
      if((p = morecore(nunits)) == 0)
 6a9:	83 c4 10             	add    $0x10,%esp
 6ac:	85 d2                	test   %edx,%edx
 6ae:	75 c0                	jne    670 <malloc+0x40>
        return 0;
  }
}
 6b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6b3:	31 c0                	xor    %eax,%eax
}
 6b5:	5b                   	pop    %ebx
 6b6:	5e                   	pop    %esi
 6b7:	5f                   	pop    %edi
 6b8:	5d                   	pop    %ebp
 6b9:	c3                   	ret
 6ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6c0:	39 cf                	cmp    %ecx,%edi
 6c2:	74 4c                	je     710 <malloc+0xe0>
        p->s.size -= nunits;
 6c4:	29 f9                	sub    %edi,%ecx
 6c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6cc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 6cf:	89 15 20 0a 00 00    	mov    %edx,0xa20
}
 6d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6d8:	83 c0 08             	add    $0x8,%eax
}
 6db:	5b                   	pop    %ebx
 6dc:	5e                   	pop    %esi
 6dd:	5f                   	pop    %edi
 6de:	5d                   	pop    %ebp
 6df:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 6e0:	c7 05 20 0a 00 00 24 	movl   $0xa24,0xa20
 6e7:	0a 00 00 
    base.s.size = 0;
 6ea:	b8 24 0a 00 00       	mov    $0xa24,%eax
    base.s.ptr = freep = prevp = &base;
 6ef:	c7 05 24 0a 00 00 24 	movl   $0xa24,0xa24
 6f6:	0a 00 00 
    base.s.size = 0;
 6f9:	c7 05 28 0a 00 00 00 	movl   $0x0,0xa28
 700:	00 00 00 
    if(p->s.size >= nunits){
 703:	e9 54 ff ff ff       	jmp    65c <malloc+0x2c>
 708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 710:	8b 08                	mov    (%eax),%ecx
 712:	89 0a                	mov    %ecx,(%edx)
 714:	eb b9                	jmp    6cf <malloc+0x9f>
