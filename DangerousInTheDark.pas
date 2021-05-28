
program untitled;


var sw : integer;						{сила меча}
	swp : integer;						{бробивна сила меча}
	p : integer;						{твоє життя}
	pp : integer;						{твоя броня}
	
	Minsw : integer;					{мінімальна сила}
	Maxsw : integer;					{максимальна сила}
	Minswp : integer;					{мінімальна бробивна сила}
	Maxswp : integer;					{максимальна бробивна сила} 
	
	Blocking : byte;					{твій шанс блокування}
	
	maxp : integer;						{твоє максимальне здоров'я}
	maxpp : integer;					{твій максимальний щит}
	
	
	swm : integer;						{сила монстра}
	swpm : integer;						{бробивна сила монстра}
	pm : integer;						{життя монстра}
	ppm : integer;						{броня монстра}
	maxppm : integer;					{максимальний щит монстра} 
	
	Minswm : integer;					{мінімальна сила монстра}
	Maxswm : integer;					{максимальна сила монстра}
	Minswpm : integer;					{мінімальна бробивна сила монстра}
	Maxswpm : integer;					{максимальна бробивна сила монстра} 
	
	BlockingM : byte;					{шанс блокування монстра}
	
	mon : integer;						{mon-monster (рандомний монстр)}
	
	{dim : integer;}                    {який удар зробить монстр}
	Udm : integer;
	
	level : byte;						{на якому ти рівні}
	
	povtor : string;					{перезапускає гру після смерті воїна}	
	
	wea : integer;						{рандомна зброя з мобів}
	
	have : byte;						{що з рандомної збої ти візьмеш}{так само відноситься до очків покращень}{також це твій вибір 1,2,3,4 і т.д.}
	
	ChaMfile : text;					{характеристика монстра з текстового файлу}
	ChaMon : string;					{назва файлу з монстром}
	UdarMfile : text;					{це удар монстра}
	UdarMon : string;					{назва файлу з ударами мостра}
	
	SaveName : string;					{назва файлу з збереженнями}
	SaveStatus : string;				{поше чи є збережження}
	B : char;							{говорить, який файл призначений для збережень гри а також загрузки гри}

	
	

procedure po();  			{po- пояснення}
begin
case Udm of
	1: 	begin writeln('монстр: простий удар');
		end;
	2: 	begin writeln('монстр: удар в спину');
		end;
	3:	begin writeln('монстр: встав за щит');
		end;
	4:	begin writeln('монстр: слідкує за спиною');
		end;	
end;
writeln(':');
end;
				
{загрузка нових характеристик}

procedure NewLevel();
begin
	level := 1;
	wea := 1;
	maxp := 30;
	Minsw	:=2;
	Maxsw	:=4;
	Minswp 	:=1;
	Maxswp 	:=3;
	Blocking := 10;
	
	p := 30;
	pp := 15;
	maxpp := 15;
end;

{зброя яка випадає з мобів}
  {----------------------------------------------------------
procedure weapon();
begin
case wea of

1:begin
	writeln('поламаний кинжал'); 
	writeln('---сила меча : 2-5');
	writeln('---пробивна сила меча : 1-3');
  end;

2:begin 
	writeln('залізний кинжал');
	writeln('---сила меча : 4-8');
	writeln('---пробивна сила меча : 2-5');
  end;
3:begin
	writeln('залізний меч');
	writeln('---сила меча : 5-10');
	writeln('---пробивна сила меча : 3-5');
  end;
3:begin 
	writeln('залізний молот');
	writeln('---сила меча : 6-8');
	writeln('---пробивна сила меча : 4-10');
  end;
4:begin 
	writeln('залізна сабля');
	writeln('---сила меча : 9-12');
	writeln('---пробивна сила меча : 3-6');
  end;
5:begin 
	writeln('піратська сабля');
	writeln('---сила меча : 11-15');
	writeln('---пробивна сила меча : 4-5');
  end;
6:begin  
	writeln('палка з шипами');
	writeln('---сила меча : 5-10');
	writeln('---пробивна сила меча : 5-10');
  end;
7:begin 
	writeln('поламаний срібний меч');
	writeln('---сила меча : 13-16');
	writeln('---пробивна сила меча : 7-10');
  end;
8:begin 
	writeln('поламана залізна катана');
	writeln('---сила меча : 14-20');
	writeln('---пробивна сила меча : 6-8');
  end;
9:begin 
	writeln('поламана стальна катана');
	writeln('---сила меча : 16-25');
	writeln('---пробивна сила меча : 10-14');
  end;
10:begin 
	writeln('стальний меч');
	writeln('---сила меча : 13-20');
	writeln('---пробивна сила меча : 11-18');
  end;
11:begin 
	writeln('');
	writeln('');
  end;
  
1001:begin 
		writeln('комок слизі');
		writeln('15:5');
	 end;
  
end;
end;
----------------------------------------------------------}

{читає характеристики зброї}

procedure weaponDamage();
begin;
	sw := Minsw + random(Maxsw);
	swp := Minswp + random(Maxswp);
end;

{просто читає та записує характеристики зброї}
procedure weaponReadFile();
var ChaWeapon : string; 	{назва файлу з характеристиками зброї}
	ChaWfile : text;		{характеристики зброї з файлу}
	
	minsw, maxsw	: integer;
	minswp, maxswp  : integer;
begin
case wea of
		0:begin
			ChaWeapon := '0BrokenDagger.txt';
			writeln('Поламаний Кинджал');
		  end;
		1:begin
			ChaWeapon := '1BrokenIronDagger.txt';
			writeln('Поламаний залізний кинджал');
		  end;
		2:begin
			ChaWeapon := '2BrokenIronSword.txt';
			writeln('Поламаний залізний меч');
		  end;
		3:begin
			ChaWeapon := '3SharpWoodDagger.txt';
			writeln('Гострий деревʼяний кинджал');
		  end;
		4:begin
			ChaWeapon := '4SharpWoodSword.txt';
			writeln('Гострий деревʼяний меч');
		 end;
		5:begin
			ChaWeapon := '5IronSword.txt';
			writeln('Залізний меч');
		 end;
		6:begin
			ChaWeapon := '6SharpIronSword.txt';
			writeln('Гострий залізний меч');
		 end;
		end;		
				
			assign(ChaWfile, 'weapon/normal/'+ ChaWeapon);
			reset(ChaWfile);
			read(ChaWfile, minsw);
			Readln(ChaWfile, maxsw);
			read(ChaWfile, minswp);
			Readln(ChaWfile, maxswp);
			close(ChaWfile);
			
		write('урон: ');
		writeln(minsw,':', maxsw);
		write('пробивна сила: ');
		writeln(minswp,':',maxswp);
		
				
		writeln(':');
		writeln(':');		
		writeln('ти візьмеш цю зброю?...');
		writeln('>так-1');
		writeln('>ні-2');
		readln(have);
			if have = 1 then begin
			Minsw 	:= minsw;
			Maxsw 	:= maxsw;
			Minswp 	:= minswp;
			Maxswp 	:= maxswp;
			end;
		writeln(':');


end;

{----------------------------------------
case wea of
0:begin 
	поламаний кинжал
	sw := 2 + random(4);
	swp := 1 + random(3);
  end;
1:begin 
	залізний кинжал
	sw := 4 + random(5);
	swp := 2 + random(4);
  end;
2:begin 
	залізний меч
	sw := 5 + random(6);
	swp := 3 + random(3);
  end;
3:begin 
	залізний молот
	sw := 6 + random(3);
	swp := 4 + random(7);
  end;
4:begin
	залізна сабля
	sw := 9 + random(4);
	swp := 3 + random(4);
  end;
5:begin 
	піратська сабля
	sw := 11 + random(5);
	swp := 4 + random(2);
  end;
6:begin  
	палка з шипами
	sw := 5 + random(6);
	swp := 5 + random(6);
  end;
7:begin 
	поламаний срібний меч
	sw := 13 + random(6);
	swp := 7 + random(4);
  end;
8:begin 
	поламана залізна катана
	sw := 14 + random(7);
	swp := 6 + random(3);
  end;
9:begin 
	поламана стальна катана
	sw := 16 + random(10);
	swp := 10 + random(5);
  end;
10:begin
	стальний меч
	sw := 13 + random(8);
	swp := 11 + random(8);
  end;
11:begin 
	sw := 1 + random(10);
	swp := 1 + random(10);
  end;
  
1001:begin 
	комок слизі
	sw := 6 + random(13);
	swp := 5;
  end;	pp := 15;
end;
end;-------------------------------------}

{моби}
{--------------------------------------------------------

procedure skeletonSwordsman();
begin
			writeln('Скелет Фехтувальник');
			swm := 1 + random (18);
			swpm := 1 + random(12);
			pm := 10;				
			ppm :=10;
			writeln(pm,'-життя монстра');
			writeln(ppm,'-броня монстра');
			writeln(':');
end;

procedure skeletonPirat();
begin
			writeln('Скелет Пірат');
			swm := 1 + random (15);
			swpm := 1 + random(5);
			pm := 15;				
			ppm :=8;w
			writeln(pm,'-життя монстра');
			writeln(ppm,'-броня монстра');
			writeln(':');
end;

procedure skeletonPoisoned();
begin
			writeln('Отруєний Скелет');
			swm := 1 + random (5);
			swpm := 1 + random(8);
			pm := 5;				
			ppm :=2;
			writeln(pm,'-життя монстра');
			writeln(ppm,'-броня монстра');
			writeln(':');
end;




procedure KingOfSlugs();
begin
			writeln('Король Слимаків БОСС');
			swm := 1 + random (15);
			swpm := 1 + random(12);
			pm := 40;				
			ppm :=10;
			writeln(pm,'-життя монстра');
			writeln(ppm,'-броня монстра');
			writeln(':');
end;
--------------------------------------------------------}
{удари мобів}
{-------------------------------------------------------
 

procedure skeletonSwordsmanUdar();
begin
	case dim of
	1:Udm := 2;
	
	2:Udm := 3;
	
	3:Udm := 1;
	
	4:Udm := 2;
	end;
		po;
		dim := dim + 1;
			if dim = 5 then
			dim := 1
end;

procedure skeletonPiratUdar();
begin
	case dim of
	1:Udm := 4;
	
	2:Udm := 1;
	
	3:Udm := 1;
	
	4:Udm := 4;
	end;
		po;
		dim := dim + 1;
			if dim = 5 then
			dim := 1
end;

procedure skeletonPoisonedUdar();
begin
	case dim of
	1:Udm := 2;
	
	2:Udm := 1;
	
	3:Udm := 3;
	
	4:Udm := 1;
	end;
		po;
		dim := dim + 1;
			if dim = 5 then
			dim := 1
end;

-------------------------------------------------------}
{блокування удару}
function ImpactBlocking(hp, damage : integer; Block, Num, stan : byte) : integer; {stan: 0 - людину, 1- монстра}
var K : byte;
begin
	K := 1 + random(100);
	Block := Block div Num;
	if K <= Block then begin
		if stan = 0 then begin
		writeln('Блокування вдалося');
		writeln(hp, '-0');
		ImpactBlocking := hp;
		end
		else begin
		writeln('Монстер відбив вашу атаку');
		writeln(hp,'-0');
		ImpactBlocking := hp;
		end;
	end
	else begin
		if stan = 0 then begin
		writeln('лишилось твого життя');
		writeln(hp,'-',damage);
		ImpactBlocking := hp - damage;	
		end
		else begin
		writeln('лишилось життя монстра');
		writeln(hp,'-',damage);
		ImpactBlocking := hp - damage;
		end;
	end;
end;

{зберігання гри і т.д.}
function SaveSlot(NameSlot : string) : boolean;
var Check : text;
	CheckNumber : integer;
begin
	assign(Check, 'saves/'+ NameSlot);
	reset(Check);
	readln(Check, CheckNumber);
	close(Check);
	SaveSlot := CheckNumber = 1;

end;



procedure SaveCheckSlot();
var K : Byte;
begin
	for K := 1 to 3 do
	begin
	case K of
	1:B := '1';
	2:B := '2';
	3:B := '3';
	end;
		SaveName := B +'save.txt';		
		if SaveSlot(SaveName) then
		begin
		SaveStatus := 'Збереження в наявності';
		writeln(B + ' слот збереження ---' + SaveStatus);
		end
		else begin 
		SaveStatus := 'Пустий слот';
		writeln(B + ' слот збереження ---' + SaveStatus);
		end;
	end;
end;

procedure LoadingSave();
var {B : Char;}
	SaveFile : text; 	{файл збереження}
begin
	readln(have);
	case have of
	1:B :='1';
	2:B :='2';
	3:B :='3';
	end;

		if SaveSlot(B + 'save.txt') then
		begin
			write('Хочете продовжити гру?: 1-так/2-ні:');
			readln(have);
				case have of
				1:begin
					assign(SaveFile, 'saves/' + B + 'save.txt' );
					reset(SaveFile);
					
					readln(SaveFile);
					readln(SaveFile, p);
					readln(SaveFile, pp);
					readln(SaveFile, Maxp);
					readln(SaveFile, Maxpp);
					readln(SaveFile, level);
					readln(SaveFile, Minsw);
					readln(SaveFile, Maxsw);
					readln(SaveFile, Minswp);
					readln(SaveFile, Maxswp);
					readln(SaveFile, Blocking);
									
					close(SaveFile);
			      end;
				2:begin
						writeln('Хочиш ВИДАЛИТИ збереження з цього слоту?: 1-так/2-ні');
						readln(have);
							if have = 1 then begin 
								have := 2;
								assign(SaveFile, 'saves/' + B + 'save.txt');
								rewrite(SaveFile);
								writeln(SaveFile, 0);
								close(SaveFile);
							end;
				  end;
				end;
		end
		else begin
			writeln(B + '-це пустий слот');
			write('Хочете почати нову гру? 1-так/2-ні:');
			readln(have);
				if have = 1 then
				NewLevel
				else have := 2;
		end;
			
end;


procedure SaveGame();
var SaveGfile : text;
begin
	assign(SaveGfile, 'saves/' + B + 'save.txt');
	rewrite(SaveGfile);
	writeln(SaveGfile, 1, 		 ' (стан збереження)');
	writeln(SaveGfile, p,		 ' (p)');
	writeln(SaveGfile, pp, 		 ' (pp)');
	writeln(SaveGfile, Maxp,	 ' (Maxp)');
	writeln(SaveGfile, Maxpp,	 ' (Maxpp)');
	writeln(SaveGfile, Level,	 ' (level)');
	writeln(SaveGfile, Minsw,	 ' (Minsw)');
	writeln(SaveGfile, Maxsw,	 ' (Maxsw)');
	writeln(SaveGfile, Minswp,	 ' (Minswp)');
	writeln(SaveGfile, Maxswp, 	 ' (Maxswp)');
	writeln(SaveGfile, Blocking, ' (Blocking)');
	close(SaveGfile);
	
end;

{смерть воїна}

procedure dead();
begin
writeln('В героїчній битві за підземелля,');
writeln('загинув воїн...');
writeln('натисніть Enter щоб вийти в меню...');
readln(povtor);
pm := 0;
	NewLevel;
	SaveGame;
end;

{покращення скілів}



procedure UpdateSkills();
var K, G : byte;
begin
	if level < 5 then begin
	end;
	writeln(':');
	writeln('в тебе два очка покращення');
	for K:= 1 to 2 do begin
		writeln('1:життя');
		writeln('2:броня');
		readln(have);
			case have of
			1:	begin
					Maxp := Maxp + 5;
					writeln(maxp,'-твое поліковане життя');
					writeln(':');
						if p < maxp then
						p := p + 1;
					
					if K = 1 then
					writeln('В тебе лишилося одне очко покращення');
				 end;
			2:begin
					maxpp := maxpp + 5;
					writeln(maxpp,'-твоя нова броня');
					writeln(':');
						if pp < maxpp then
						pp := pp + 1;
					
					if K = 1 then
					writeln('В тебе лишилося одне очко покращення');
				 end;	
			else begin 	G := 1;
						case G of
						1:begin
							writeln('Ти не хочеш взяти покращення?');
							writeln('Ну раз ти так вирішив...');
							readln();
						end;
						2: begin
							writeln('Ти що творИш?..');
							writeln('ПереСтань так робити...');
							readln();
						end;
						3: begin
							writeln('ТоБі нЕясно?..');
							writeln('Ти поЧинаЄш наГліти...');
							readln();
						end;
						4: begin
							writeln('КОМУ СК#ЗАНО ПЕрЕСТАТИ!!!');
							writeln('Т&БІ, СКАЗ#НО ПЕРЕСТ%ТИ!!!!!!!!!!!!!!!!!');
							readln();
						end;
						5: begin
							writeln('Я споКі@ний... Так, спо%ійний...');
							writeln('Те#ер ТВ&Я черга засп@коїтися...');
							readln();
						end;
						6: begin
							writeln('Д# тебе н* до#оди&ь?!...');
							writeln('Ти з@об&в уКилеВ пом#лку....');
							readln();
						end;
						else writeln('Ви розбудили велике зло...');
							 readln();	
						end;					
						G := G + 1;
				 end;	
			end;
	end;
	
end;

procedure CheatCodes ();
var Cheat : string;
	CheatNum : integer;
begin
	repeat
	write('/');
	readln(Cheat); 
	case Cheat of
	'lev+':begin
			write('\котрий рівень?');
			readln(CheatNum);
			if have < 50 then
			writeln('\такого рівня не має')
			else
			level := CheatNum;
		   end;	
	'Newhp':begin
			write('\на скільки підняти життя?');
			readln(CheatNum);
			maxp := CheatNum;
			p := maxp;
			end;
	'Newpp':begin
			write('\на скільки підняти броню?');
			readln(CheatNum);
			maxpp := CheatNum;
			pp := maxpp;
			end;
	end;
	until cheat = '';
end;

procedure FightTheMonster();

begin
	writeln('1: простий удар');
	writeln('2: удар в спину');
	writeln('3: встати за щит');
	writeln('4: слідкувати за спиною');
	readln(have);
	writeln(':');
	weaponDamage;
	
	swm := Minswm + random(Maxswm);
	swpm := Minswpm + random(Maxswpm);
	
	po;
	
	case have of
	1,2:begin
			if have = 2 then begin
			sw := sw + (sw div 2);
			pp := pp div 2;
			end;
			
			case Udm of
			1,2:begin
					if Udm = 2 then begin
					swm := swm + (swm div 2);
					ppm := ppm div 2;
					end;
						if swp < ppm then 
						sw := sw div 2;
						
						pm := ImpactBlocking(pm, sw, BlockingM, 2, 1);
							if pm > 0 then begin
								if swpm < pp then
								swm := swm div 2;
								
								p := ImpactBlocking(p, swm, Blocking, 2, 0);
							end;
				end;
			3,4:begin
				if have = 1 then begin
				  if Udm = 3 then
					ppm := ppm * 2
				  else 
					ppm := ppm div 2;
				end
				else begin
				  if Udm = 3 then 
					ppm := ppm div 2
				  else 
					ppm := ppm * 2;
				end;
					
						if swp < ppm then begin
						sw := sw div 2;
						pm := ImpactBlocking(pm, sw, BlockingM, 1, 1);
						end
						else
						pm := ImpactBlocking(pm, sw, BlockingM, 2, 1);
						p := ImpactBlocking(p, 0, 0, 2, 0);
				end;
			end;		
		  end;
	3,4: begin
				case Udm of
			1,2:begin	
				if have = 3 then begin
					if Udm = 1 then
					swpm := swpm div 2
					else begin
					swm := swm + (swm div 2);
					ppm := ppm div 2;
					swpm := swpm * 2;
					end;
				end		
				else begin
					if Udm = 1 then
					swpm := swpm * 2
					else begin
					swm := swm + (swm div 2);
					ppm := ppm div 2;
					swpm := swpm div 2;
					end;
				end;
					
					pm := ImpactBlocking(pm, 0, 0, 2, 1);
						if swpm < pp then begin
						swm := swm div 2;
						p := ImpactBlocking(p, swm, Blocking, 1, 0);
						end
						else
						p := ImpactBlocking(p, swm, Blocking, 2, 0);
				end;
			3,4:begin
					pm := ImpactBlocking(pm, 0, 0, 1, 1);
					p := ImpactBlocking(p, 0, 0, 1, 0);
				end;
			end;
		end			
	
	end;
	
end;

{основна программа<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>}

BEGIN
	randomize;	
while level < 51 do begin	{після смерті вертає тебе сюди}

	repeat
		SaveCheckSlot;
		write('Який слот гри загрузити?---');
		LoadingSave;
			if have =1 then break
			
	until have =1;
	
	writeln(p,' твоє життя');
	writeln(pp,'  твоя броня');
	writeln('в тебе Поламаний кинжал');
	
repeat	
    writeln('кімната-',level);
    writeln(':');
    SaveGame;
		repeat
			write('Відкрити двері в кімнату?: 1-так 2-ні ');
			readln(have);
				case have of
				2: writeln('Гра збереглась...' + 'Ви можете спокійно закрити гру...');
				255: CheatCodes;
				end;
				
		until have = 1;
		writeln(':');
	
	mon := level + random (3);
	
	case level of
	
	5:begin
		mon := 1001;
	  end;
	
	10:begin
		mon := 1002;
	  end;
	
	15:begin
		mon := 1003;
	  end;	
	end;
	
	
	Writeln('появився монстр');
	
	case mon of
		1:begin
			ChaMon := '1slugGreen.txt';
			writeln('Зелений Слизень');
		  end;
		2:begin		
			ChaMon := '2slugYellow.txt';
			writeln('Жовтий Слизень');
		  end;
		3:begin		
			ChaMon := '3slugRed.txt';
			writeln('Червоний Слизень');
		  end;
		4:begin
			ChaMon := '4BigGreenSlug.txt';
			writeln('Великий Слизень');
		  end;
		5:begin		
			ChaMon := '5FastYellowSlug.txt';
			writeln('Швидкий Слизень');
		  end;
		6:begin		
			ChaMon := '6MilitarySlug.txt';
			writeln('Віськовий Слизень');
		  end;	
		{
		5:begin
			skeletonSwordsman;
		  end;
		6:begin
			skeletonPirat;
		  end;
		7:begin
			skeletonPoisoned;
		  end;
		}
		1001:begin
			ChaMon := '1001KingOfSlugs.txt';
			write('БОСС: ');
			writeln('Король Слизняків');
			 end;		 
	end;
			
			assign(ChaMfile, 'mobs/character/'+ ChaMon);
			reset(ChaMfile);
			read(ChaMfile, Minswm);
			readln(ChaMfile, Maxswm);
			read(ChaMfile, Minswpm);
			readln(ChaMfile, Maxswpm);
			readln(ChaMfile, pm);
			readln(ChaMfile, ppm);
			readln(ChaMfile, BlockingM);
			close(ChaMfile);
			
			writeln(pm,'-життя монстра');
			writeln(ppm,'-броня монстра');
			writeln(':');
			maxppm := ppm;
				

	case mon of
	1: begin 
		UdarMon := '1slugGreenUdar.txt'
	   end;
	2: begin
		UdarMon := '2slugYellowUdar.txt'
	   end;	
	3:begin
		UdarMon := '3slugRedUdar.txt'
	  end;
	4: begin 
		UdarMon := '4BigGreenSlugUdar.txt'
	   end;
	5: begin
		UdarMon := '5FastYellowSlugUdar.txt'
	   end;	
	6:begin
		UdarMon := '6MilitarySlugUdar.txt'
	  end;
	{
	5:begin
		skeletonSwordsmanUdar
	  end;
	6:begin
		skeletonPiratUdar
	  end;
	7:begin
		skeletonPoisonedUdar
	  end;
	  
	}
	1001:begin
		UdarMon :=	'1001KingOfSlugsUdar.txt'
		 end;
	end;

			assign(UdarMfile, 'mobs/DamageMonster/'+ UdarMon);
			reset(UdarMfile);
repeat   {початок бійки}		
	
			if Eof(UdarMfile) then
			begin
			close(UdarMfile);
			reset(UdarMfile);
			end
			else readln(UdarMfile, Udm);
	
	pp := maxpp;
	ppm := maxppm;
		
	FightTheMonster;

until (pm or p) <= 0;	
	if p <= 0 then 
			begin
				dead;		
				end			
	else 
	begin
	povtor := '1';
		writeln('Ти знищив монстра' );
		writeln(':');
		writeln('НАГОРОДА З МОНСТРА');
		level := level + 1;		
		wea := level + random(3);	
			case level of				
				6,11,16:begin
					wea :=1001;
					UpdateSkills;
				end;
				else weaponReadFile;				
				end;		
	end;

		
until povtor ='';
end; 	

	
	
	
END.
