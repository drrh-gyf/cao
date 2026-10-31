# 操作系统实验 1

学号：202401001113

## 实验项目
- Shell 脚本与基础命令
- Vim 编辑和 GCC 四阶段构建
- GDB 断点、单步、观察点、调用栈
- Make 增量构建
- Git 本地提交、分支、推送与克隆

## 运行
```bash
gcc -std=c99 -Wall -g c/lower2upper.c -o c/lower2upper
printf 'Hello Linux 123!\n' | c/lower2upper
make -C make
```
