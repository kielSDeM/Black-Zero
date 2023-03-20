Adds a new column:
```
ALTER TABLE logins ADD newColumn INT;
```

Renames a column:
```
ALTER TABLE logins RENAME COLUMN newColumn TO oldColumn;
```

Changes a columns data type:
```
ALTER TABLE logins MODIFY oldColumn DATE;
```

Drops a column:
```
ALTER TABLE logins DROP oldColumn;
```
Updates a table.
```
UPDATE table_name SET column1=newvalue1, column2=newvalue2, ... WHERE <condition>;
```
