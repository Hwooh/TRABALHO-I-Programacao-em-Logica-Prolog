% FATOS
% Autores: Pablo Manoel, Eduardo Ventura, Esther Siqueira, Gabriel Costa.
% nome, idade, se esta perto da aposentadoria, região, linguagem, nivel, salario, regime, experiencia.
candidato(eduardo, 22, nao, sp, php, senior, 7000, clt, um_ano).
candidato(pablo, 19, nao, rj, python, junior, 3000, clt, seis_meses).
candidato(marcio, 20, nao, sp, python, junior, 2000, clt, um_ano).
candidato(marcio, 20, nao, sp, c, senior, 3000, pj, um_ano).
candidato(luiz, 50, sim, bh, cmaismais, pleno, 3500, clt, trinta_anos).
candidato(piva, 40, nao, sp, java, senior, 7000, clt, vinte_e_cinco_anos).
candidato(piva, 40, nao, sp, c, senior, 6000, pj, vinte_e_cinco_anos).


diferente(X, Y) :- X=Y, !, fail; true.

% REGRAS
help() :- writeln("Menu de Ajuda"),
    	  writeln("utilize Capacidade('Linguagem desejada'). para saber a capacidade para a liguagem desejada."),
    	  writeln(""),
    	  writeln("utilize idade('Linguagem desejada'). para saber a idade dos candidatos."),
    	  writeln(""),
		  writeln("utilize regiaogeral('Linguagem desejada'). para saber as regioes dos candidatos."),
    	  writeln(""),
   		  writeln("utilize regiaocontra('regiao da empresa','Linguagem desejada'). para saber as quais candidatos estão perto da empresa."),
    	  writeln(""),
    	  writeln("utilize faixasalario('Linguagem desejada'). para saber a faixa salaria desejada pelos candidatos."),
    	  writeln(""),
    	  writeln("utilize regimecontra('Regime contratual desejado','Linguagem desejada'). para saber o regime de contrato dos candidatos."),
    	  writeln(""),
    	  writeln("utilize experiencia('Linguagem desejada'). para saber a experiencia de mercado dos candidatos."),
    	  writeln(""),
		  writeln("utilize melhorescandidato('Linguagem desejada, Nivel de capacitação desejado, Regime contratual desejado, Se está perta da aposentadoria, Região desejada'). para saber os melhores candidatos para a vaga."),
    	  writeln("").


idade(LIN) :- candidato(NOME, IDADE, APOSEN, _, LIN, _, _, _, _), format("Nome do candidato: ~s \tIdade: ~d \tEsta perto da aposentadoria?: ~s\n", [NOME, IDADE, APOSEN]), fail;true.
capacidade(LIN) :- candidato(NOME, _, _, _, LIN, CAPACIDADE, _, _, _), format("Nome do candidato: ~s \tLinguagem: ~s \tNivel de Capacidade: ~s\n", [NOME, LIN, CAPACIDADE]), fail;true.
regiaogeral(LIN) :- candidato(NOME, _, _, REGI, LIN, _, _, _, _), format("Nome do candidato: ~s \tRegião: ~s \n", [NOME, REGI]), fail;true.
regiaocontra(REGI,LIN) :- candidato(NOME, _, _, REGI, LIN, _, _, _, _), format("Nome do candidato: ~s \tLinguagem: ~s \n", [NOME, LIN]), fail;true.
faixasalario(LIN) :- findall(X, candidato(_, _, _, _, LIN, _, X, _, _), R), min_member(MIN,R), max_member(MAX,R), format("A faixa salarial dos candidatos é ~d - ~d", [MIN, MAX]), fail;true.
regimecontra(REGIMECONTRA, LIN) :- candidato(NOME, _, _, _, LIN, _, _, REGIMECONTRA, _), format("Nome do candidato: ~s \tRedime de contratação: ~s \n", [NOME, REGIMECONTRA]), fail;true.
experiencia(LIN) :- candidato(NOME, _, _, _, LIN, _, _, _, EXP), format("Nome do candidato: ~s \tTempo de experiencia: ~s \n", [NOME, EXP]), fail;true.
melhorescandidatos(LIN, CAPACI, REGIMECONTRA, APOSEN, REGI) :- candidato(NOME, IDADE, APOSEN, REGI, LIN, CAPACI, SALARIO, REGIMECONTRA, EXP), format("Nome do candidato: ~s \tIdade: ~d \tSalario: ~d \tTempo de experiencia: ~s \n", [NOME, IDADE, SALARIO, EXP]), fail;true.

