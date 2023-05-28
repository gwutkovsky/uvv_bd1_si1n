# Design e Desenvolvimento de Bancos de Dados
# PSET 1 
- **Aluno:** Guilherme Silva Wutkovsky
- **Professor:** Abrantes Araújo Silva Filho
- **Monitora:** Suellen Miranda Amorim

	Um Problem Set (PSET) é um conjunto de problemas e tarefas difíceis (algunsvextremamente difíceis) que forçarão a estudar e realmente compreender a matéria.

## Ferramentas utlizadas

- **SQL Power Architect:** Utilizado para criar o projeto lógico e gerar o script do código.
- **Emacs:** Utilizado para edição do script e implementação das restrições do banco de dados.
- **SGBD:** Postgresql
- **Esquema lógico:** 
 
	![perojetologico.jpeg](https://github.com/gwutkovsky/uvv_bd1_si1n/blob/main/pset1/projetologico.jpeg)

## Implementação do banco de dados no PostgreSQL

Primeiro foi necessário recriar o esquema lógico fornecido pelo professor (Lojas UVV) no **SQL Power Architect**, após ter feito esse passo, selecionei a opção de gerear um script sql para o **Postgresql** e copiei para um editor de texto (**Emacs**). Dessa forma, comecei a fazer a organização do script, de forma a deixar sua aparência agradável e de melhor compreenção, além de adicionar comentários em todos os processos do código para que sua leitura e identificação das tabelas e colunas ficassem mais simples. Em seguida, salvei o mesmo com o nome de pset1.sql, abri o terminal linux da  máquina virtual e utilizei o comando "psql -U POSTGRES < pset1.sql" para verificar se o código estava funcionando e se existia algum erro, após corrigir todos os erros, comecei a implementar as restrições para o banco de dados pelo editor de texto e rodei novamente o código, corrigi novos erros e salvei.

## Conclusão

Diante do trabalho realizado, julgo que consegui desenvolver novas habilidades no seguimento de criação de um banco de dados. Após o término do projeto, percebi que compreendi as funcionalidades básicas do Git e do Github, bem como as vantagens de usar essas aplicações. Outro ponto importante que me ajudou a finalizar essa atividade foi participar da monitoria, onde a monitora Suellen Miranda Amorin me deu o direcionamento para a resolução de alguns problemas enfrentados durante o processo de implementação do banco de dados, além de adquirir outros conhecimentos com as outras pessoas que estavam presentes no local. Dessa forma, acredito que fui capaz de resolver esse pset de forma correta.
