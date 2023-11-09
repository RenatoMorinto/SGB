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
