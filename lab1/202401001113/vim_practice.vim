set nomore
let s:log=['Vim tutor practice | Student 202401001113', 'Official ~/.vimrc loaded; representative exercises from lessons 1-7', '']
function! Check(label, actual, expected)
  if a:actual !=# a:expected
    call add(s:log, 'FAIL '.a:label.': '.string(a:actual))
    call writefile(s:log, 'vim_practice_results.txt')
    cquit
  endif
  call add(s:log, 'PASS '.a:label.' => '.a:actual)
endfunction
function! Exercise(text)
  enew!
  call setline(1,a:text)
  call cursor(1,1)
endfunction
call Exercise('The ccow jumpedd ovverr thhe mooon.')
normal! fcx
normal! fdx
normal! fvx
normal! frx
normal! fhx
normal! fox
call Check('1: x delete characters',getline(1),'The cow jumped over the moon.')
call Exercise('There is text missing.')
execute "normal! 0wwimore \<Esc>"
call Check('1: i insert',getline(1),'There is more text missing.')
execute "normal! A Done.\<Esc>"
call Check('1: A append',getline(1),'There is more text missing. Done.')
call Exercise('There are a some words fun that do not belong paper in this sentence.')
normal! 0wwdw
" Locate each unwanted word, then use the actual delete-word operator.
call cursor(1,match(getline(1),'fun')+1)
normal! dw
call cursor(1,match(getline(1),'paper')+1)
normal! dw
call Check('2: dw operator and motion',getline(1),'There are some words that do not belong in this sentence.')
call Exercise('One two three four five')
normal! 0d2w
call Check('2: d2w count',getline(1),'three four five')
let &undolevels=&undolevels
normal! wd$
call Check('2: d$ to line end',getline(1),'three ')
normal! u
call Check('2: u undo',getline(1),'three four five')
call Exercise(['b) Violets are blue','a) Roses are red'])
normal! ggddp
call Check('3: dd and p move a line',join(getline(1,'$'),' | '),'a) Roses are red | b) Violets are blue')
call Exercise('Whan this line was typed in.')
" r replaces one character; repair the intentional typo.
call cursor(1,3)
normal! re
call Check('3: r replace',getline(1),'When this line was typed in.')
call Exercise('This lubw has a few words.')
normal! 0w
execute "normal! celine\<Esc>"
call Check('3: ce change word',getline(1),'This line has a few words.')
normal! 0ww
execute "normal! c$needs correction.\<Esc>"
call Check('3: c$ change to end',getline(1),'This line needs correction.')
call Exercise(['thee best time to see thee flowers is in thee spring.','A second line.'])
normal! G
call Check('4: G last line',string(line('.')),'2')
normal! gg
call Check('4: gg first line',string(line('.')),'1')
call search('flowers','W')
call Check('4: forward search',expand('<cword>'),'flowers')
%s/thee/the/g
call Check('4: substitution',getline(1),'the best time to see the flowers is in the spring.')
call Exercise('(matching parenthesis)')
normal! 0%
call Check('4: % match',string(col('.')),string(strlen(getline(1))))
call Exercise(['Saved practice file','second line'])
write! vim_tutor_saved.txt
call Check('5: :w save file',join(readfile('vim_tutor_saved.txt'),' | '),'Saved practice file | second line')
call writefile(['Read external text'],'vim_tutor_read.txt')
$read vim_tutor_read.txt
call Check('5: :r read file',getline('$'),'Read external text')
call Check('5: :! equivalent external command',substitute(system('printf command_ok'),'\n$','',''),'command_ok')
call Exercise('First line')
execute "normal! oSecond line\<Esc>"
execute "normal! OInserted line\<Esc>"
call Check('6: o and O open lines',join(getline(1,'$'),' | '),'First line | Inserted line | Second line')
normal! ggyyp
call Check('6: yy and p copy',getline(2),'First line')
normal! ggVjy
call Check('6: visual selection yank',getreg('"'),"First line\nFirst line\n")
call Exercise('Adding 123 to xxx gives you xxx.')
call cursor(1,15)
execute "normal! R456\<Esc>"
call cursor(1,29)
execute "normal! R579\<Esc>"
call Check('6: R replace mode',getline(1),'Adding 123 to 456 gives you 579.')
set runtimepath^=./vimhelp
helptags vimhelp/doc
help tutor
call Check('7: :help',&buftype,'help')
close
call Check('7: configuration number',string(&number),'1')
call Check('7: configuration relative number',string(&relativenumber),'1')
call Check('7: :set command available',string(exists(':set')),'2')
call add(s:log,'')
call add(s:log,'All representative exercise assertions passed. This is an automated Vim practice record, not a claim of human study time.')
call writefile(s:log,'vim_practice_results.txt')
qa!
