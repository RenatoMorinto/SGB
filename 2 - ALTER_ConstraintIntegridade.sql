-- Constraint para não permitir datas de empréstimo no passado
ALTER TABLE Emprestimos
ADD CONSTRAINT Check_DataEmprestimo CHECK (DataEmprestimo >= CURRENT_TIMESTAMP);

-- Constraint para não permitir valores negativos no campo de multa
ALTER TABLE Emprestimos
ADD CONSTRAINT Check_MultaPositiva CHECK (Multa >= 0);