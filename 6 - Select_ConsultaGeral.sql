-- Listar todos os livros de um autor específico
SELECT 
	L.Titulo
FROM 
	Livros L JOIN Autores A ON 
	L.AutorID = A.AutorID
WHERE 
	A.NomeAutor = 'Clarice Lispector';

-- Listar todos os livros que estão em empréstimo atualmente
SELECT 
	L.LivroID
   ,L.Titulo
FROM 
	Livros L JOIN Emprestimos E ON 
	L.LivroID = E.LivroID
WHERE 
	E.DataDevolucao IS NOT NULL;

-- Verificar se algum autor tem mais de 1 título
SELECT 
	A.AutorID
   ,A.NomeAutor
   ,COUNT(L.LivroID) AS QuantidadeTitulos
FROM 
	Autores A JOIN Livros L ON 
	A.AutorID = L.AutorID
GROUP BY 
	A.AutorID
   ,A.NomeAutor
HAVING 
	COUNT(L.LivroID) > 1;

-- Listar todas as editoras que publicaram mais de 10 livros
SELECT 
	E.EditoraID
   ,E.NomeEditora
   ,COUNT(L.LivroID) AS QuantidadeLivros
FROM 
	Editoras E JOIN Livros L ON 
	E.EditoraID = L.EditoraID
GROUP BY 
	E.EditoraID
   ,E.NomeEditora
HAVING 
	COUNT(L.LivroID) > 10;

-- Listar informações dos livros de uma editora específica (por exemplo, EditoraID = 14)
SELECT 
	L.LivroID
   ,L.Titulo
   ,A.NomeAutor
   ,E.NomeEditora
   ,L.DataPublicacao
   ,L.Disponibilidade
FROM 
	Livros L 
	JOIN Autores  A ON L.AutorID   = A.AutorID 
	JOIN Editoras E ON L.EditoraID = E.EditoraID
WHERE 
	E.EditoraID = 14; -- Substitua 14 pelo ID da editora desejada

-- Liste todos os livros com seus respectivos autores
SELECT 
	L.Titulo
   ,A.NomeAutor
FROM 
	Livros L JOIN Autores A ON 
	L.AutorID = A.AutorID;

-- Consulta utilizando LEFT JOIN
SELECT 
	L.Titulo
   ,L.DataPublicacao
   ,CASE WHEN E.DataDevolucao IS NULL 
		 THEN 'Disponível' 
		 ELSE 'Indisponível' 
		 END AS StatusEmprestimo
FROM Livros L LEFT JOIN Emprestimos E ON 
	 L.LivroID = E.LivroID;
