/*  https://www.hackerrank.com/challenges/binary-search-tree-1 */
-- create database Binary_Tree_Nodes;

use Binary_Tree_Nodes;

create table BST(
	N Integer not null,
    P Integer);
    
insert into BST value
(1, 2),
(3, 2),
(5, 6),
(7, 6),
(2, 4),
(6, 4),
(4, 15),
(8, 9),
(10, 9),
(12, 13),
(14, 13),
(9, 11),
(13, 11),
(11, 15),
(15, NULL);

With IRtable as (SELECT DISTINCT P as IR FROM BST WHERE P is not null),
	 ILtable as (SELECT DISTINCT N as IL FROM BST WHERE P is not null)
SELECT N, CASE when N in (SELECT IR FROM IRtable left join ILtable on IRtable.IR = ILtable.IL
							WHERE IL is null) then 'Root'
			   when N in (SELECT IR FROM IRtable join ILtable on IRtable.IR = ILtable.IL) 
											  then 'Inner'
			   when N in (SELECT IL FROM IRtable right join ILtable on IRtable.IR = ILtable.IL
							WHERE IR is null) then 'Leaf' 
		  END AS Tree_Nodes
FROM BST
ORDER BY N;