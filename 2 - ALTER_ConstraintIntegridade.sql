-- Constraint para n�o permitir datas de empr�stimo no passado
ALTER TABLE Emprestimos
ADD CONSTRAINT Check_DataEmprestimo CHECK (DataEmprestimo >= CURRENT_TIMESTAMP);

-- Constraint para n�o permitir valores negativos no campo de multa
ALTER TABLE Emprestimos
ADD CONSTRAINT Check_MultaPositiva CHECK (Multa >= 0);