
-- 더미데이터 추가

--유저
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('aavid', '이기수', '01012365679', '1111', default, '22/07/16', 'y', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Devid', '이명수', '01012375679', '1111', default, '22/07/16', 'y', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('David', '이영수', '01012385679', '1111', default, '22/07/17', 'y', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Robert', '김영수', '01012345679', '1111', default, '22/07/17', 'y', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Michael', '김성호', '01022345678', '1111', default, '22/07/18', 'y', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Joseph', '이성민', '01032345678', '1111', default, '22/07/18', 'y', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Charles', '이지훈', '01042345678', '1111', default, '22/07/19', 'n', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Thomas', '박준서', '01052345678', '1111',  default, '22/07/19', 'y', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Edward', '박건우', '01062345678', '1111', default, '22/07/21', 'y', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Andrew', '유진우', '01072345678', '1111', default, '22/07/21', 'n', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Brian', '이광수', '01082345678', '1111', default, '22/07/22','y', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Kevin', '유재석', '01092345678', '1111',  default, '22/07/22','y', 'm');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('cavid', '이박수', '01012355679', '1111', default, '22/07/16', 'y', 'f');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Joshua', '이미영', '01010345678', '1111',  default, '22/07/17', 'y', 'f');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Jennifer', '김예지', '01053345678', '1111',  default, '22/07/18', 'y', 'f');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Nancy', '김수민', '01064345678', '1111',  default, '22/07/19', 'y', 'f');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Carol', '이윤서', '01075345678', '1111',  default, '22/07/20', 'y', 'f');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Ashley', '박하은', '01086345678', '1111',  default, '22/07/20', 'y', 'f');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Melissa', '장민서', '01097345678', '1111',  default,'22/07/21', 'y', 'f');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Laura', '송수빈', '01018345678', '1111', default, '22/07/21','y', 'f');
insert into tblUser(id, name, tel, pw, profile, regdate, active, gender) values ('Donna', '유현서', '01018345678', '1111',  default, '22/07/22', 'y', 'f');

-- 관광명소 찜
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'aavid', 1);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Devid', 1);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Robert', 1);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Joseph', 1);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Kevin', 1);


insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'aavid', 2);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Devid', 2);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Robert', 2);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Joseph', 2);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Kevin', 2);


insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'aavid', 3);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Devid', 3);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Robert', 3);


insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'aavid', 4);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Devid', 4);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Robert', 4);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Joseph', 4);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Kevin', 4);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Nancy', 4);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Donna', 4);

insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'aavid', 5);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Devid', 5);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Robert', 5);


insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'aavid', 6);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Devid', 6);


commit;

select * from tbltour;

-- 카테고리 정렬용 더미
insert into tblTour(seq, placeName, address, image, open, close, tcseq, cseq, lat, lng) values (seqTour.nextVal, '감귤박물관', '제주특별자치도 서귀포시 효돈순환로 441', '감귤박물관.jpg', '09:00', '18:00', 2, 1, 33.2710085, 126.6077957);
insert into tblTour(seq, placeName, address, image, open, close, tcseq, cseq, lat, lng) values (seqTour.nextVal, '박물관은살아있다', '제주특별자치도 서귀포시 중문관광로 42', '박물관은살아있다.jpg', '09:00', '18:00', 2, 1, 33.2545853, 126.4088998);
insert into tblTour(seq, placeName, address, image, open, close, tcseq, cseq, lat, lng) values (seqTour.nextVal, '제주민속자연사박물관', '제주특별자치도 제주시 삼성로 40', '제주민속자연사박물관.jpg', '09:00', '18:00', 2, 1, 33.5064925, 126.5303583);
insert into tblTour(seq, placeName, address, image, open, close, tcseq, cseq, lat, lng) values (seqTour.nextVal, '해녀박물관', '제주특별자치도 제주시 공항로 2', '해녀박물관.jpg', '09:00', '18:00', 2, 1, 33.5234818, 126.8633559);


insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Devid', 21);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Robert', 21);

insert into tblTourReview (seq, content, star, tseq, id, image) values (seqTourReview.nextVal, '나쁘지 않았어요', 4.0, 21,'Devid');


insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Devid', 22);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Robert', 22);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Joseph', 22);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Kevin', 22);

insert into tblTourReview (seq, content, star, tseq, id, image) values (seqTourReview.nextVal, '재밌었어요', 5.0, 22,'Joseph', null);
insert into tblTourReview (seq, content, star, tseq, id, image) values (seqTourReview.nextVal, '10시에 오시면 좋아요', 3.5, 22,'Kevin', null);


insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Devid', 23);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Nancy', 23);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Donna', 23);

insert into tblTourReview (seq, content, star, tseq, id, image) values (seqTourReview.nextVal, '재밌었어요', 3.0, 23,'Nancy', null);
insert into tblTourReview (seq, content, star, tseq, id, image) values (seqTourReview.nextVal, '10시에 오시면 좋아요', 3.0, 23,'Donna', null);

insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Devid', 24);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Robert', 24);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Joseph', 24);
insert into tblLikeTour (seq, id, tseq) values (seqLikeTour.nextVal, 'Kevin', 24);

insert into tblTourReview (seq, content, star, tseq, id, image) values (seqTourReview.nextVal, '별로에요', 2.0, 24,'Robert', null);
insert into tblTourReview (seq, content, star, tseq, id, image) values (seqTourReview.nextVal, '오후에 오시면 좋아요', 3.0, 24,'Joseph', null);


-- 리뷰 사진 테스트
insert into tblreviewimg (seq, tseq, image) values (seqReviewImg.nextVal, 86,'거리.jpg');
