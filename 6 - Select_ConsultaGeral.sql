-- Listar todos os livros de um autor espec�fico
SELECT 
	L.Titulo
FROM 
	Livros L JOIN Autores A ON 
	L.AutorID = A.AutorID
WHERE 
	A.NomeAutor = 'Clarice Lispector';

-- Listar todos os livros que est�o em empr�stimo atualmente
SELECT 
	L.LivroID
   ,L.Titulo
FROM 
	Livros L JOIN Emprestimos E ON 
	L.LivroID = E.LivroID
WHERE 
	E.DataDevolucao IS NOT NULL;

-- Verificar se algum autor tem mais de 1 t�tulo
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

-- Listar informa��es dos livros de uma editora espec�fica (por exemplo, EditoraID = 14)
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
		 THEN 'Dispon�vel' 
		 ELSE 'Indispon�vel' 
		 END AS StatusEmprestimo
FROM Livros L LEFT JOIN Emprestimos E ON 
	 L.LivroID = E.LivroID;
