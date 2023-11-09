-- Tabela Livros
CREATE TABLE Livros (
    LivroID		    INT PRIMARY KEY
   ,Titulo		    VARCHAR(255) NOT NULL
   ,AutorID		    INT
   ,EditoraID	    INT
   ,DataPublicacao  DATE NOT NULL
   ,Disponibilidade BIT NOT NULL
);

-- Tabela Autores
CREATE TABLE Autores (
    AutorID   INT PRIMARY KEY
   ,NomeAutor VARCHAR(255) NOT NULL
);

-- Tabela Editoras
CREATE TABLE Editoras (
    EditoraID   INT PRIMARY KEY
   ,NomeEditora VARCHAR(255) NOT NULL
);

-- Tabela Empréstimos
CREATE TABLE Emprestimos (
    EmprestimoID   INT PRIMARY KEY
   ,LivroID		   INT
   ,DataEmprestimo DATE NOT NULL
   ,DataDevolucao  DATE
   ,Multa		   DECIMAL(5, 2) DEFAULT 0
   ,CONSTRAINT FK_Livro_Emprestimo FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
   ,CONSTRAINT Check_DataEmprestimo CHECK (DataEmprestimo >= CURRENT_TIMESTAMP)
);

-- Constraint para não permitir datas de empréstimo no passado
ALTER TABLE Emprestimos
ADD CONSTRAINT Check_DataEmprestimo CHECK (DataEmprestimo >= CURRENT_TIMESTAMP);

-- Constraint para não permitir valores negativos no campo de multa
ALTER TABLE Emprestimos
ADD CONSTRAINT Check_MultaPositiva CHECK (Multa >= 0);

-- Trigger para registrar quando um livro é emprestado
CREATE TRIGGER RegistrarEmprestimo
ON Emprestimos
AFTER INSERT
AS
BEGIN
    UPDATE Livros
    SET Disponibilidade = 0
    WHERE LivroID IN (SELECT LivroID FROM inserted);
END;

-- Trigger para atualizar a disponibilidade de livros quando um for devolvido
CREATE TRIGGER AtualizarDisponibilidade
ON Emprestimos
AFTER UPDATE
AS
BEGIN
    UPDATE 
		Livros
    SET 
		Disponibilidade = 1
    FROM 
		Livros JOIN inserted ON 
		Livros.LivroID = inserted.LivroID
    WHERE 
		inserted.DataDevolucao IS NOT NULL;
END;

-- Stored Procedure para calcular a multa do empréstimo
CREATE PROCEDURE CalcularMulta(@emprestimo_id INT)
AS
BEGIN
    DECLARE @multa_calculada DECIMAL(5, 2);

    SELECT 
		@multa_calculada = DATEDIFF(DAY, DataEmprestimo, GETDATE()) * 0.5
    FROM 
		Emprestimos
    WHERE 
		EmprestimoID = @emprestimo_id;

    UPDATE 
		Emprestimos
    SET 
		Multa = @multa_calculada
    WHERE 
		EmprestimoID = @emprestimo_id;
END;
