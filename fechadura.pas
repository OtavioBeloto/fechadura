Program fechadura;

const
MAX = 2;

type
	dados = record
	nome, sobrenome, senha: string;
	cpf: integer;
end;

var
v:array[0..MAX] of dados;
i,j,confCPF,cpf,sair: integer;
confSenha:string;

procedure visualizar;
begin
writeln('+++++++++++++++++++++++++++++++++++++++++');
writeLN('+++++++++++++++ CADASTROS +++++++++++++++');
writeln('+++++++++++++++++++++++++++++++++++++++++');
for i:= 0 to MAX do
	begin
		writeln();
		write(' | ');
		write(v[i].nome,' ');
		write(v[i].sobrenome,' ');
		write(v[i].cpf,' ');
		write(v[i].senha,' ');
		write(' | ');
	end;
	delay(3000);
	clrscr;
end;	

procedure cadastrar;
	begin
	for i:=0 to MAX do
		begin
			writeln('+++++++++++++++++++++++++++++++++++++++++');
			writeLN('++++++++++      CADASTRO       ++++++++++');
			writeln('+++++++++++++++++++++++++++++++++++++++++');
			write('Qual é o seu nome? ');
			readln(v[i].nome);
			write('Qual é o seu sobrenome? ');
			readln(v[i].sobrenome);
			write('Qual é o seu CPF? ');
			readln(v[i].cpf);
			write('Qual é a sua senha? ');
			readln(v[i].senha);
			clrscr;
		end;
	end;
		
	
procedure alterar;
  begin
  	writeln('+++++++++++++++++++++++++++++++++++++++++');
		writeLN('++++++++++    TROCA DE SENHA  +++++++++++');
		writeln('+++++++++++++++++++++++++++++++++++++++++');
		writeln('Qual é o seu CPF? ');
		read(cpf);
			begin
				for i:=0 to MAX do 
				begin
					if (cpf = v[i].cpf) then
					begin
						writeln('Digite a nova senha: ');
						read(v[i].senha);
						delay(1000);
						writeln('Senha alterada com SUCESSO!');
						delay(1000);
						clrscr;
						break;
					end;
				end;	
			end;
	end;
		
procedure excluir;
var
	confirmacao:char;

	begin
		writeln('+++++++++++++++++++++++++++++++++++++++++');
		writeLN('++++++++++  DELETAR USUÁRIO    ++++++++++');
		writeln('+++++++++++++++++++++++++++++++++++++++++');
		writeln('Qual é o seu CPF? ');
		read(cpf);
		delay(2000);
			begin
			for i:=0 to MAX do 
			begin
				if (cpf = v[i].cpf) then
				begin
					writeln('Deseja confirmar a exclusão do usuario ? ',v[i].nome,' ? S/N');
					read(confirmacao);
						if(confirmacao='S') then
							v[i].nome:='';
							v[i].sobrenome:='';
							v[i].cpf:=0;
							v[i].senha:='';
							delay(1000);
							writeln('USUÁRIO EXCLUIDO COM SUCESSO!');
							delay(2000);
							clrscr;
						break;
					end;
				end;
			end;	
	end;

function login(j:integer;k:string):string;

	begin
			for i:=0 to MAX do
			begin 
				if (j = v[i].cpf) and (k = v[i].senha) then
				begin
					login:=('Acesso permitido');
					break;
				end;
			login:=('Acesso não permitido');
			end;
		
	end;
	
procedure menu;
var
menu: char;
	begin
		writeln('+++++++++++++++++++++++++++++++++++++++++');
		writeln('++++++++ DIGITE A OPÇÃO DESEJADA ++++++++');
		writeln('+++++++++++++++++++++++++++++++++++++++++');
		writeln('+++++++++++  1 - CADASTRAR   ++++++++++++');
		writeln('+++++++++++  2 - ALTERAR     ++++++++++++');
		writeln('+++++++++++  3 - EXCLUIR     ++++++++++++');
		writeln('+++++++++++  4 - LOGIN       ++++++++++++');
		writeln('+++++++++++  5 - VISUALIZAR  ++++++++++++');
		writeln('+++++++++++  0 - SAIR        ++++++++++++');
		writeln('+++++++++++++++++++++++++++++++++++++++++');
		writeln('+++++++++++++++++++++++++++++++++++++++++');
		read(menu);
		
		clrscr;		
			case menu of
				'1': cadastrar;
				'2': alterar;
				'3': excluir;
				'0': sair:=1;
				'5': visualizar;
				'4': begin
							writeln('+++++++++++++++++++++++++++++++++++++++++');
							write('Digite seu CPF: ');
							readln(confCPF);
							write('Digite sua senha: ');
							readln(confSenha);
							login;
							clrscr;
							delay(1500);
							writeln('+++++++++++++++++++++++++++++++++++++++++');
							writeln('+++++++++',login(confCPF,confSenha),'++++++++');
							writeln('+++++++++++++++++++++++++++++++++++++++++');
							delay(1500); 
							clrscr;
							sair :=1;
						 end;
			end;
	end;
		
Begin
textcolor(15);
writeln('+++++++++++++++++++++++++++++++++++++++++');
writeln('+++++++++++++++ BEM VINDO +++++++++++++++');
writeln('+++++++++++++++++++++++++++++++++++++++++');
delay(1500);
clrscr;
while(sair<1) do
	begin
		menu;
	end;
	writeln('+++++++++++++++++++++++++++++++++++++++++');
	writeln('++++++++++++   OBRIGADO!   ++++++++++++++');
	writeln('+++++++++++++++++++++++++++++++++++++++++');  
End.