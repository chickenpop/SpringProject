
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
 where c.seq = 1 and tc.category = '전시관' and t.placename like '%박물관%'
 order by likeCnt desc;
 
 

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
       (select round(avg(tr.star), 2) from tblTourReview tr where tr.tseq = t.seq) as reviewAvg,
       t.lat,
       t.lng
  from tblTour t 
 inner join tblCity c on t.cseq = c.seq
 inner join tblTourCategory tc on t.tcseq = tc.seq 
 where t.seq = 1 and c.seq = 1;
 
 
 
-- erd 변경 전 리뷰 조회
select  
       seq,
       content, 
       star,
       regdate,
       id,
       image
 from tblTourReview where tseq = 1 order by regdate desc;
 
 
-- erd 변경 후 리뷰 조회
select 
       tr.seq,
       tr.content, 
       tr.star,
       tr.regdate,
       tr.id,
       ri.image
  from tblTourReview tr
 left outer join tblreviewimg ri on tr.seq = ri.tseq
 where tr.tseq = 1 order by regdate desc;


-- 리뷰 등록
insert into tblTourReview (seq, content, star, tseq, id) values (seqTourReview.nextVal, '나쁘지 않았어요', 4.0, 21,'Devid');

-- 이미지 있는 리뷰 등록
insert into tblTourReview (seq, content, star, tseq, id) values (seqTourReview.nextVal, '나쁘지 않았어요', 4.0, 21,'Devid');
insert into tblreviewimg (seq, tseq, image) values (seqReviewImg.nextVal, (select max(seq) from tblTourReview), '거리.jpg');

select * from tblTourReview order by regdate;











 
 
 
 
 
 
 
 