create table tbl_clob as
   select to_lob(CONTENT) CONTENT,seq from EXHIBIT;
 
select b.seq, b.content, b.filename
from (select * from tbl_clob
where CONTENT like '%시간의 풍경%') a, EXHIBIT b
where a.seq = b.seq;

drop table tbl_clob;
