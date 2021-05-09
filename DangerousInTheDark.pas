
program untitled;


var sw : integer;						{сила меча}
	swp : integer;						{бробивна сила меча}
	p : integer;						{твоє життя}
	pp : integer;						{твоя броня}
	
	maxp : integer;						{твоє максимальне здоров'я}
	maxpp : integer;					{твій максимальний щит}
	
	
	swm : integer;						{сила монстра}
	swpm : integer;						{бробивна сила монстра}
	pm : integer;						{життя монстра}
	ppm : integer;						{броня монстра} 
	
	Minswm : integer;					{мінімальна сила монстра}
	Maxswm : integer;					{максимальна сила монстра}
	Minswpm : integer;					{мінімальна бробивна сила монстра}
	Maxswpm : integer;					{максимальна бробивна сила монстра} 
	nameM : string;
	
	
	mon : integer;						{mon-monster (рандомний монстр)}
	
	di : integer;						{який удар ти зробиш}
	
	{dim : integer;}                       {який удар зробить монстр}
	Udm : integer;
	
	level : integer;					{на якому ти рівні}
	
	povtor : string;					{перезапускає гру після смерті воїна}	
	
	wea : integer;						{рандомна зброя з мобів}
	
	have : byte;						{що з рандомної збої ти візьмеш}{так само відноситься до очків покращень}
	
	Fmon : text;						{це монстр з текстового файлу}
	UdarMon : text;						{це удар монстра}
	Xfile : string;						{що це за файл}
	UdarMfile : string;					{що за удар робить мостр}
	

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


procedure damage();
begin
			p := p - swm;
			writeln('лишилось твого життя');
			writeln(p,'-',swm);
end;



procedure damageMon();
begin
			pm := pm - sw;
			writeln('лишилось життя монстра');
			writeln(pm,'-',sw);
end;

{}

procedure dead();
begin
writeln('В героїчній битві за підземелля,');
writeln('загинув воїн...');
writeln('натисніть Enter для продовження...');
readln(povtor);
pm := 0;
level := 1;
end;


{зброя яка випадає з мобів}

procedure weapon();
begin
case wea of

0:begin 
	writeln('поламаний кинжал'); 
	writeln('---сила меча : 2-5');
	writeln('---пробивна сила меча : 1-3');
  end;

1:begin 
	writeln('залізний кинжал');
	writeln('---сила меча : 4-8');
	writeln('---пробивна сила меча : 2-5');
  end;
2:begin 
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


{читає характеристики зброї}

procedure weaponScan();
begin;
case wea of
0:begin 
	{поламаний кинжал}
	sw := 2 + random(6);
	swp := 1 + random(3);
  end;
1:begin 
	{залізний кинжал}
	sw := 4 + random(5);
	swp := 2 + random(4);
  end;
2:begin 
	{залізний меч}
	sw := 5 + random(6);
	swp := 3 + random(3);
  end;
3:begin 
	{залізний молот}
	sw := 6 + random(3);
	swp := 4 + random(7);
  end;
4:begin
	{залізна сабля}
	sw := 9 + random(4);
	swp := 3 + random(4);
  end;
5:begin 
	{піратська сабля}
	sw := 11 + random(5);
	swp := 4 + random(2);
  end;
6:begin  
	{палка з шипами}
	sw := 5 + random(6);
	swp := 5 + random(6);
  end;
7:begin 
	{поламаний срібний меч}
	sw := 13 + random(6);
	swp := 7 + random(4);
  end;
8:begin 
	{поламана залізна катана}
	sw := 14 + random(7);
	swp := 6 + random(3);
  end;
9:begin 
	{поламана стальна катана}
	sw := 16 + random(10);
	swp := 10 + random(5);
  end;
10:begin
	{стальний меч}
	sw := 13 + random(8);
	swp := 11 + random(8);
  end;
11:begin 
	sw := 1 + random(10);
	swp := 1 + random(10);
  end;
  
1001:begin 
	{комок слизі}
	sw := 6 + random(13);
	swp := 5;
  end;
end;
end;
{моби}
{--------------------------------------------------------
procedure slugGreen();
begin
			writeln('Зелений Слизень');
			swm := 0;
			swpm := 0;
			pm := 10;				
			ppm :=2;
			writeln(pm,'-життя монстра');
			writeln(ppm,'-броня монстра');
			writeln(':');
end;

procedure slugYellow();
begin
			writeln('Жовтий Слизень');
			swm := 1 + random(5);
			swpm := 1 + random(2);
			pm := 15;				
			ppm :=3;
			writeln(pm,'-життя монстра');
			writeln(ppm,'-броня монстра');
			writeln(':');
end;

procedure slugRed();
begin
			writeln('Червоний Слизень');
			swm := 1 + random (10);
			swpm := 1 + random(3);
			pm := 20;				
			ppm :=5;
			writeln(pm,'-життя монстра');
			writeln(ppm,'-броня монстра');
			writeln(':');
end;

procedure slagBig();
begin
			writeln('Великий Слизень');
			swm := 1 + random (5);
			swpm := 1 + random(5);
			pm := 25;				
			ppm :=8;
			writeln(pm,'-життя монстра');
			writeln(ppm,'-броня монстра');
			writeln(':');
end;

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
* 
procedure slagGreenUdar();
begin
	case dim of
	1:Udm := 3;
	
	2:Udm := 4;
	
	3:Udm := 3;
	
	4:Udm := 4;
	end;
		po;
		dim := dim + 1;
			if dim = 5 then
			dim := 1
end;

procedure slagYellowUdar();
begin
	case dim of
	1:Udm := 3;
	
	2:Udm := 1;
	
	3:Udm := 4;
	
	4:Udm := 1;
	end;
		po;
		dim := dim + 1;
			if dim = 5 then
			dim := 1
end;

procedure slagRedUdar();
begin
	case dim of
	1:Udm := 3;
	
	2:Udm := 1;
	
	3:Udm := 2;
	
	4:Udm := 1;
	end;	
		po;
		dim := dim + 1;
			if dim = 5 then
			dim := 1
end;

procedure slagBigUdar();
begin
	case dim of
	1:Udm := 4;
	
	2:Udm := 2;
	
	3:Udm := 1;
	
	4:Udm := 4;
	end;	
		po;
		dim := dim + 1;
			if dim = 5 then
			dim := 1
end;

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


{БОССИ}

{-------------------------------------------------------
procedure KingOfSlugsUdar();
begin
	case dim of
	1:Udm := 3;
	
	2:Udm := 2;
	
	3:Udm := 1;
	
	4:Udm := 1;
	
	5:Udm := 3;
	
	6:Udm := 4;
	end;
		po;
		dim := dim + 1;
			if dim = 7 then
			dim := 1
end;
-------------------------------------------------------}



{основна программа<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>}

BEGIN
	randomize;	
	level := 1;
	{b := 1;}
	wea := 1;
	maxp := 30;
	
	p := 30;
	pp := 15;
	maxpp := 15;
	
	writeln(p,' твоє життя');
	writeln(pp,'  твоя броня');
	writeln('в тебе Поламаний кинжал');
	
repeat	
    writeln('кімната-',level);
    writeln(':');
	write('відкрити двері в кімнату?');
	readln();
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
			Xfile := '1slagGreen.txt';
			writeln('Зелений Слизень');
		  end;
		2:begin		
			Xfile := '2slugYellow.txt';
			writeln('Жовтий Слизень');
		  end;
		3:begin		
			Xfile := '3slugRed.txt';
			writeln('Червоний Слизень');
		  end;	
		{4:begin		
			slagBig;
		  end; 
		5:begin
			skeletonSwordsman;
		  end;
		6:begin
			skeletonPirat;
		  end;
		7:begin
			skeletonPoisoned;
		  end;
		
		1001:begin
				KingOfSlugs;
			 end;}		 
	end;
			
			assign(Fmon, 'mobs/character/'+ Xfile);
			reset(Fmon);
			read(Fmon, Minswm);
			readln(Fmon, Maxswm);
			read(Fmon, Minswpm);
			readln(Fmon, Maxswpm);
			readln(Fmon, pm);
			readln(Fmon, ppm);
			close(Fmon);
			
			swm := Minswm + random(Maxswm);
			swpm := Minswpm + random(Maxswpm);
			writeln(pm,'-життя монстра');
			writeln(ppm,'-броня монстра');
			writeln(':');
				

	case mon of
	1: begin 
		UdarMfile := '1slagGreenUdar.txt'
	   end;
	2: begin
		UdarMfile := '2slagYellowUdar.txt'
	   end;	
	3:begin
		UdarMfile := '3slagRedUdar.txt'
	  end;
	{4: begin
		slagBigUdar
	   end;
	5:begin
		skeletonSwordsmanUdar
	  end;
	6:begin
		skeletonPiratUdar
	  end;
	7:begin
		skeletonPoisonedUdar
	  end;
	  
	  
	1001:begin
			KingOfSlugsUdar
		 end;}
	end;
	
			assign(UdarMon, 'mobs/DamageMonster/'+ UdarMfile);
			reset(UdarMon);
repeat			
			if Eof(UdarMon) then
			begin
			close(UdarMon);
			reset(UdarMon);
			end
			else readln(UdarMon, Udm);
		
		
		
		

	writeln('1: простий удар');
	writeln('2: удар в спину');
	writeln('3: встати за щит');
	writeln('4: слідкувати за спиною');
	readln(di);
	writeln(':');
	
		weaponScan;
	
	
	case di of
		1:begin
			case Udm of
					1:begin
								if swp > ppm then 
									begin
									damageMon;
									
										if pm = 0 then break;
										
											if swpm > pp then 
											begin
											damage;
											
											end
											
											else begin 
											swm := swm div 2;
											damage;
											
											end;
								
											
											
											
									end
									else begin 
									sw := sw div 2;
									damageMon;
									
										if pm = 0 then break;
											if swpm > pp then 
											begin
											damage;
											
											end
											
											else begin 
											sw := sw div 2;
											damage;
											
											end;
									end;
								
							
					  end;
					  
					2:begin
							ppm := ppm div 2;
							swm:= swm + (swm div 2);
							pp := pp div 2;
								if swp > ppm then 
									begin
									damageMon;
									
										if pm = 0 then break;
											
											if swpm > pp then 
											begin
											damage;
											
											end
											
											else begin 
											swm := swm div 2;
											damage;
											
											end;
								
											
											
											
									end
									else begin 
									sw := sw div 2;
									damageMon;
									
										if pm = 0 then break;
											if swpm > pp then 
											begin
											damage;
											
											end
											
											else begin 
											swm := swm div 2;
											damage;
											
											end;
									end;
					
					  end;
					  
					3:begin
							ppm := ppm * 2;
								if swp > ppm then 
									begin
									damageMon;
									
										if pm = 0 then break;
										
								
											
											
											
									end
									else begin 
									sw := sw div 2;
									damageMon;
									
										if pm = 0 then break;

									end;
								
					  end;
					  
					4:begin
								if swp > ppm then 
									begin
									damageMon;
									
										if pm = 0 then break;
											
								
											
											
											
									end
									else begin 
									sw := sw div 2;
									damageMon;
									
										if pm = 0 then break;
											
									end;
					  end;
					end;
					
		  end;
		
		2:begin
			case Udm of
					1:begin
							sw := sw + (sw div 2);
							pp := pp div 2;
							ppm := ppm div 2;
								if swp > ppm then 
									begin
									damageMon;
									
										if pm = 0 then break;
										
											if swpm > pp then 
											begin
											damage;
											
											end
											
											else begin 
											swm := swm div 2;
											damage;
											
											end;
								
											
											
											
									end
									else begin 
									sw := sw div 2;
									damageMon;
									
										if pm = 0 then break;
											if swpm > pp then 
											begin
											damage;
											
											end
											
											else begin 
											sw := sw div 2;
											damage;
											
											end;
									end;
								
							
					  end;
					  
					2:begin		pp := pp div 2;
								pp := pp div 2;
								sw := sw + (sw div 2);
								ppm := ppm div 2;
								ppm := ppm div 2;
								swm := swm + (swm div 2);
								
								if swp > ppm then 
									begin
									damageMon;
									
										if pm = 0 then break;
										
											if swpm > pp then 
											begin
											damage;
											
											end
											
											else begin 
											swm := swm div 2;
											damage;
											
											end;
								
											
											
											
									end
									else begin 
									sw := sw div 2;
									damageMon;
									
										if pm = 0 then break;
											if swpm > pp then 
											begin
											damage;
											
											end
											
											else begin 
											sw := sw div 2;
											damage;
											
											end;
									end;
					  end;
					
					3:begin	
								sw := sw + (sw div 2);
					
								if swp > ppm then 
									begin
									damageMon;
									
										if pm = 0 then break;										
									end
									
									
									else begin 
									sw := sw div 2;
									damageMon;
									
										if pm = 0 then break;											
									end;
									
					  end;
					
					4:begin		
								sw := sw + (sw div 2);
								ppm := ppm * 2;
						
								if swp > ppm then 
									begin
									damageMon;
									
										if pm = 0 then break;										
									end
									
									
									else begin 
									sw := sw div 2;
									damageMon;
									
										if pm = 0 then break;											
									end;	
					  end;
					
					
				end;
		  end;
		
		3:begin
			case Udm of	
				1:begin
										pp := pp * 2;
										
											if swpm > pp then 
											begin
											damage;
									
											end
											
											else begin 
											swm := swm div 2;
											damage;
									
											end;												
				  end;
				
				2:begin
									swm := swm + (swm div 2);
									pp := pp div 2;
										if swpm > pp then 
											begin
											damage;
									
											end
											
											else begin 
											swm := swm div 2;
											damage;
									
											end;
				  end;
				
				3:begin
								pp := pp * 2;
								ppm := ppm * 2; 
								writeln('лишилось життя монстра');
								writeln(pm);
								writeln('лишилось твого життя');
								writeln(p);
				  end;
				
				4:begin
								pp := pp * 2;
								writeln('лишилось життя монстра');
								writeln(pm);
								writeln('лишилось твого життя');
								writeln(p);
								 
								
				  end;
			end;
			
			
		  end;
		
		4:begin
			case Udm of	
				1:begin				
										if swpm > pp then 
											begin
											damage;
									
											end
											
											else begin 
											swm := swm div 2;
											damage;
									
											end;
				  end;
				
				2:begin			
								pp := pp * 2;
									if swpm > pp then 
											begin
											damage;
									
											end
											
											else begin 
											swm := swm div 2;
											damage;
									
											end;
				  end;
				
				3:begin 
								ppm := ppm * 2; 
								writeln('лишилось життя монстра');
								writeln(pm);
								writeln('лишилось твого життя');
								writeln(p);
				  end;
				
				4:begin
								pp := pp * 2;
								ppm := ppm * 2; 
								writeln('лишилось життя монстра');
								writeln(pm);
								writeln('лишилось твого життя');
								writeln(p);
				  end;
			end;
		  end;
	
	
	end;
	
	
until (pm or p) <= 0;	
	if p <= 0 then 
			begin
				dead;		
				end
			
	else 
	begin
		writeln('Ти знищив монстра' );
		writeln(':');
		writeln('НАГОРОДА З МОНСТРА');
		level := level + 1;
		
		wea := level + random(4);
		
				case level of
				
				6:begin
					wea :=1001;
					
					writeln(':');
					writeln('в тебе два очка покращення');
					writeln('1:життя');
					writeln('2:броня');
					readln(have);
						
						case have of
						1:begin
							maxp := maxp + 5;
							writeln(maxp,'-твое поліковане життя');
							writeln(':');
							writeln('в тебе одне очко покращення');
							writeln('1:життя');
							writeln('2:броня');
							readln(have);
								case have of
									1:begin
										maxp := maxp + 5;
										writeln(maxp,'-твое поліковане життя');
										writeln(':');
									  end;
									2:begin
										maxpp := maxpp + 5;
										writeln(maxpp,'-твоя нова броня');
										writeln(':');
									  end;					
								end;
						  end;
						2:begin
							maxpp := maxpp + 5;
							writeln(maxpp,'-твоя нова броня');
							writeln(':');
							writeln('в тебе одне очко покращення');
							writeln('1:життя');
							writeln('2:броня');
							readln(have);
							case have of
									1:begin
										maxp := maxp + 5;
										writeln(maxp,'-твое поліковане життя');
										writeln(':');
									  end;
									2:begin
										maxpp := maxpp + 5;
										writeln(maxpp,'-твоя нова броня');
										writeln(':');
									  end;				
								end;
						  end
						
						end;
					{лікування}
					while p = maxp do
					begin
					p:= p +1
					end; 
					{кінець лікування}
					
					pp := maxpp;
					
				  end;
				11:begin
				
				  end;
				16:begin
				
				  end;
				21:begin
				
				  end;    
				end;
		
		weapon;
		writeln(':');		
		writeln(':');
		writeln('ти візьмеш цю зброю?...');
		writeln('так-1');
		writeln('ні-2');
		readln(have);
		writeln(':');
			case have of
			1: weaponScan;
			
			end;
		
	end;

		
until povtor ='-';
	

	
	
	
END.
