-- 지점 정보 입력
insert into escape_branch values(1, '서면점', '서면');
insert into escape_branch values(2, '경성대점', '경성대');
insert into escape_branch values(3, '해운대점', '해운대');
insert into escape_branch values(4, '하단점', '하단');
insert into escape_branch values(5, '남포점', '남포');

-- 테마 정보 입력
-- 서면점
insert into thema values(1,1, '인형의 집', '공포', 2, 20000);
insert into thema values(2,1, '마술사의 집', '판타지', 1, 24000);
insert into thema values(3,1, '범인의 집', '스릴러', 5, 18000);
-- 경성대점
insert into thema values(4,2, '도굴꾼', '판타지', 5, 28000);
insert into thema values(5,2, '학교 괴담', '공포', 1, 17000);
insert into thema values(6,2, '어둠의 마법', '판타지', 4, 22000);
insert into thema values(7,2, '수상한 편의점', '스릴러', 3, 20000);
-- 해운대점
insert into thema values(8,3, '문명을 찾아라', '판타지', 4, 30000);
insert into thema values(9,3, '우체국 살인', '스릴러', 2, 23000);
-- 하단점
insert into thema values(10,4, '모험왕', '판타지', 3, 30000);
insert into thema values(11,4, '보물찾기', '판타지', 5, 26000);
insert into thema values(12,4, '좀비연구', '공포', 1, 24000);
-- 남포점
insert into thema values(13,5, '앨리스', '판타지', 2, 32000);
insert into thema values(14,5, '알리바바', '판타지', 5, 32000);

-- 직원 정보 입력
insert into emp values(1, 1, '강이준', '남', 21);
insert into emp values(1, 2, '도하준', '남', 20);
insert into emp values(2, 3, '유서아', '여', 21);
insert into emp values(2, 4, '이지아', '여', 22);
insert into emp values(2, 5, '이은우', '남', 20);
insert into emp values(3, 6, '정시아', '여', 23);
insert into emp values(3, 7, '김도현', '남', 27);
insert into emp values(4, 8, '김아윤', '여', 25);
insert into emp values(4, 9, '박서준', '남', 24);
insert into emp values(5, 10, '백아린', '여', 26);
insert into emp values(5, 11, '김선우', '남', 22);

-- 고객 정보 입력 
insert into customer values(1,'권지용','남', 30);
insert into customer values(2,'손가인','여', 28);
insert into customer values(3,'박지영','여', 24);
insert into customer values(4,'공지철','남', 26);
insert into customer values(5,'김상중','남', 32);
insert into customer values(6,'최홍기','남', 31);
insert into customer values(7,'왕지현','여', 22);
insert into customer values(8,'주영훈','남', 18);
insert into customer values(9,'곽태근','남', 20);
insert into customer values(10,'박채림','여', 23);
insert into customer values(11,'이선웅','남', 22);
insert into customer values(12,'김도진','남', 20);
insert into customer values(13,'김종운','남', 24);
insert into customer values(14,'이지은','여', 26);

-- 방문 정보 입력
insert into visit values(1, 5, 1, 3, '2024-03-15', 3);
insert into visit values(2, 2, 2, 4, '2024-03-15', 2);
insert into visit values(3, 4, 3, 2, '2024-03-15', 3);
insert into visit values(4, 8, 4, 2, '2024-03-16', 6);
insert into visit values(5, 6, 5, 3, '2024-03-16', 4);
insert into visit values(6, 10, 6, 4, '2024-03-17', 8);
insert into visit values(7, 11, 7, 3, '2024-03-18', 9);
insert into visit values(8, 2, 8, 3, '2024-03-19', 2);
insert into visit values(9, 3, 9, 4, '2024-03-19', 1);
insert into visit values(10, 14, 10, 5, '2024-03-20', 11);
insert into visit values(11, 5, 11, 4, '2024-03-20', 3);
insert into visit values(12, 7, 12, 2, '2024-03-20', 4);
insert into visit values(13, 9, 13, 3, '2024-03-21', 6);
insert into visit values(14, 13, 14, 2, '2024-03-21', 10);
insert into visit values(15, 8, 5, 4, '2024-03-22', 5);
insert into visit values(16, 9, 4, 2, '2024-03-22', 6);
insert into visit values(17, 8, 7, 3, '2024-03-22', 7);
insert into visit values(18, 13, 10, 4, '2024-03-22', 10);
insert into visit values(19, 4, 12, 2, '2024-03-22', 3);

