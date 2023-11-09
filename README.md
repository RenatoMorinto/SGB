# Sistema de Gerenciamento de Biblioteca

O objetivo do Desafio é gerar um sistema de gerenciamento de biblioteca contendo Livros, Autores, Editoras e Empréstimos:
Os requisitos obrigatórios são: 
- As tabelas mencionadas devem apresentar campos apropriados com títulos, nome de autores, nome de editoras, datas de empréstimos, entre outros.
- Listar todos os livros de um autor específico.
- Listar todos os livros que estão em empréstimo atualmente.
- Listar todas as editoras que publicaram mais de 10 livros.
- Liste todos os livros com seus respectivos autores.
- A tabela Emprestimos deve possuir uma TRIGGER para registrar o emprestimo do livro.
- A tabela Emprestimos deve possuir um TRIGGER que atualize a tabela a coluna Disponibilidade dos Livros.
- Uma consulta LEFT JOIN para exibir todos os livros, data de publicação e se possui disponibilidade de empréstimo.
- Uma STORED PROCEDURE que calcula um valor de multa para atrasos na devolução dos livros emprestados.

## Estrutura
### Tabelas 
  Livros:
    - LivroID chave primária e utiliza inteiros
    - Titulo varchar com 255 caracteres e não aceita valores nulos
    - AutorID utiliza inteiros
    - EditoraID utiliza inteiros
    - DataPublicacao utiliza datas e não aceita valores nulos
    - Disponibilidade utiliza valores binários e não aceita nulos

 Autores
   - AutorID chave primária e utiliza inteiros
   - NomeAutor varchar com 255 caracteres e não aceita valores nulos

Editoras
   - EditoraID chave primária e utiliza inteiros
   - varchar com 255 caracteres e não aceita valores nulos

Emprestimos
   - EmprestimosID chave primária e utiliza inteiros
   - LivroID utiliza inteiros
   - DataEmprestimo utiliza datas e não aceita valores nulos
   - DataDevolucao utiliza datas
   - Multa utiliza decimais com 5 caracteres dentre eles 2 estão após a vírgula, como padrão está determinado para iniciar com zero
   - Uma constraint(regra para integridade) verificando através do LivroID se na tabela Livros ele está emprestado
   - Uma constraint(regra para integridade) verificando através da DataEmprestimo o valor/data é maior ou igual a data atual

![image](https://github.com/RenatoMorinto/SGB/assets/74305604/616c5454-65ac-4522-b370-d809b8767f38)

