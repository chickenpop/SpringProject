
-- city.tour.sql

-- 관광명소 카테고리 검색

select
       t.seq, 
       t.placename, 
       t.address, 
       t.open, 
       t.close, 
       t.image, 
       t.cseq, 
       tc.category, 
       (select count(*) from tblLikeTour lt where lt.tseq = t.seq) as likeCnt, 
       (select count(*) from tblTourReview tr where tr.tseq = t.seq) as reviewCnt, 
       (select round(avg(tr.star), 2) from tblTourReview tr where tr.tseq = t.seq) as reviewAvg
  from tblTour t 
 inner join tblCity c on t.cseq = c.seq
 inner join tblTourCategory tc on t.tcseq = tc.seq 
 where c.seq = 1 and tc.category = '랜드마크' and t.placename like '%거리%';
 
 

select * from tblTourCategory;

-- 관광명소 상세조회
select
       t.seq, 
       t.placename, 
       t.address, 
       t.open, 
       t.close, 
       t.image, 
       t.cseq, 
       tc.category, 
       (select count(*) from tblLikeTour lt where lt.tseq = t.seq) as likeCnt, 
       (select count(*) from tblTourReview tr where tr.tseq = t.seq) as reviewCnt, 
       (select round(avg(tr.star), 2) from tblTourReview tr where tr.tseq = t.seq) as reviewAvg
  from tblTour t 
 inner join tblCity c on t.cseq = c.seq
 inner join tblTourCategory tc on t.tcseq = tc.seq 
 where t.seq = 1 and c.seq = 2;
 
 
select  
       seq,
       content, 
       star,
       regdate,
       id,
       image
 from tblTourReview where tseq = 2 order by regdate desc;
 
 
 
 
 
 
 
 
 
 