-- 상위 2개 insert
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('top1', 'SITE_COMES', 'COMES_COR', '-1', '대표이이사', '대표이사', '대표이사', 1, '0', 1);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('top2', 'SITE_COMES', 'COMES_COR', '-1', '의사결정협의회', '의사결정협의회', '의사결정협의회', 1, '0', 2);

-- 바로 하위의 부서 : 2depth
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept1', 'SITE_COMES', 'COMES_COR', 'top1', '경영전략본부', '경영전략본부', '대표이사 > 경영전략본부', 2, '0', 1);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2', 'SITE_COMES', 'COMES_COR', 'top1', 'QA사업본부', 'QA사업본부', '대표이사 > QA사업본부', 2, '0', 2);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept3', 'SITE_COMES', 'COMES_COR', 'top1', '개발사업본부', '개발사업본부', '대표이사 > 개발사업본부', 2, '0', 3);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept4', 'SITE_COMES', 'COMES_COR', 'top1', '기업부설연구소', '기업부설연구소', '대표이사 > 기업부설연구소', 2, '0', 4);

--3depth
-- 경영전략본부 > 하위 부서
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept1-1', 'SITE_COMES', 'COMES_COR', 'dept1', '전략기획실', '전략기획실', '대표이사 > 경영전략본부 > 전략기획실', 3, '0', 1);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept1-2', 'SITE_COMES', 'COMES_COR', 'dept1', '경영지원실', '경영지원실', '대표이사 > 경영전략본부 > 경영지원실', 3, '0', 2);

-- 개발사업본부 > 하위 부서
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept3-1', 'SITE_COMES', 'COMES_COR', 'dept3', '1실', '1실(개발)', '대표이사 > 개발사업본부 > 1실', 3, '0', 1);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept3-2', 'SITE_COMES', 'COMES_COR', 'dept3', '2실', '2실(개발)', '대표이사 > 개발사업본부 > 2실', 3, '0', 2);

-- QA사업본부 > 하위 부서
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-1', 'SITE_COMES', 'COMES_COR', 'dept2', '1실', '1실(QA)', '대표이사 > QA사업본부 > 1실', 3, '0', 1);
INSERT INTO to0_dept_mast(
    dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
    VALUES ('dept2-2', 'SITE_COMES', 'COMES_COR', 'dept2', '2실', '2실(QA)', '대표이사 > QA사업본부 > 2실', 3, '0', 2);
INSERT INTO to0_dept_mast(
    dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
    VALUES ('dept2-3', 'SITE_COMES', 'COMES_COR', 'dept2', '3실', '3실(QA)', '대표이사 > QA사업본부 > 3실', 3, '0', 3);
INSERT INTO to0_dept_mast(
    dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
    VALUES ('dept2-4', 'SITE_COMES', 'COMES_COR', 'dept2', '4실', '4실(QA)', '대표이사 > QA사업본부 > 4실', 3, '0', 4);

-- QA사업본부 > 1실 > 하위 부서
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-1-1', 'SITE_COMES', 'COMES_COR', 'dept2-1', 'SQ06', 'SQ06', '대표이사 > QA사업본부 > 1실 > SQ06', 4, '0', 1);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-1-2', 'SITE_COMES', 'COMES_COR', 'dept2-1', 'SQ08', 'SQ08', '대표이사 > QA사업본부 > 1실 > SQ08', 4, '0', 2);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-1-3', 'SITE_COMES', 'COMES_COR', 'dept2-1', 'SQ14', 'SQ14', '대표이사 > QA사업본부 > 1실 > SQ14', 4, '0', 3);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-1-4', 'SITE_COMES', 'COMES_COR', 'dept2-1', 'SQ09', 'SQ09', '대표이사 > QA사업본부 > 1실 > SQ09', 4, '0', 4);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-1-5', 'SITE_COMES', 'COMES_COR', 'dept2-1', 'SQ19', 'SQ19', '대표이사 > QA사업본부 > 1실 > SQ19', 4, '0', 5);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-1-6', 'SITE_COMES', 'COMES_COR', 'dept2-1', 'TQ06', 'TQ06', '대표이사 > QA사업본부 > 1실 > TQ06', 4, '0', 6);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-1-7', 'SITE_COMES', 'COMES_COR', 'dept2-1', 'TQ13', 'TQ13', '대표이사 > QA사업본부 > 1실 > TQ13', 4, '0', 7);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-1-8', 'SITE_COMES', 'COMES_COR', 'dept2-1', 'TQ07', 'TQ07', '대표이사 > QA사업본부 > 1실 > TQ07', 4, '0', 8);

-- QA사업본부 > 2실 > 하위 부서
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-2-1', 'SITE_COMES', 'COMES_COR', 'dept2-2', 'SQ05', 'SQ05', '대표이사 > QA사업본부 > 2실 > SQ05', 4, '0', 1);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-2-2', 'SITE_COMES', 'COMES_COR', 'dept2-2', 'SQ15', 'SQ15', '대표이사 > QA사업본부 > 2실 > SQ15', 4, '0', 2);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-2-3', 'SITE_COMES', 'COMES_COR', 'dept2-2', 'SQ16', 'SQ16', '대표이사 > QA사업본부 > 2실 > SQ16', 4, '0', 3);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-2-4', 'SITE_COMES', 'COMES_COR', 'dept2-2', 'SQ17', 'SQ17', '대표이사 > QA사업본부 > 2실 > SQ17', 4, '0', 4);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-2-5', 'SITE_COMES', 'COMES_COR', 'dept2-2', 'SQ20', 'SQ20', '대표이사 > QA사업본부 > 2실 > SQ20', 4, '0', 5);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-2-6', 'SITE_COMES', 'COMES_COR', 'dept2-2', 'SQ21', 'SQ21', '대표이사 > QA사업본부 > 2실 > SQ21', 4, '0', 6);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-2-7', 'SITE_COMES', 'COMES_COR', 'dept2-2', 'SQ22', 'SQ22', '대표이사 > QA사업본부 > 2실 > SQ22', 4, '0', 7);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-2-8', 'SITE_COMES', 'COMES_COR', 'dept2-2', 'TQ05', 'TQ05', '대표이사 > QA사업본부 > 2실 > TQ05', 4, '0', 8);

-- QA사업본부 > 3실 > 하위 부서
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-3-1', 'SITE_COMES', 'COMES_COR', 'dept2-3', 'ExpertGroup', 'ExpertGroup', '대표이사 > QA사업본부 > 3실 > ExpertGroup', 4, '0', 1);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-3-2', 'SITE_COMES', 'COMES_COR', 'dept2-3', 'SQ01', 'SQ01', '대표이사 > QA사업본부 > 3실 > SQ01', 4, '0', 2);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-3-3', 'SITE_COMES', 'COMES_COR', 'dept2-3', 'SQ03', 'SQ03', '대표이사 > QA사업본부 > 3실 > SQ03', 4, '0', 3);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-3-4', 'SITE_COMES', 'COMES_COR', 'dept2-3', 'SQ04', 'SQ04', '대표이사 > QA사업본부 > 3실 > SQ04', 4, '0', 4);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-3-5', 'SITE_COMES', 'COMES_COR', 'dept2-3', 'SQ07', 'SQ07', '대표이사 > QA사업본부 > 3실 > SQ07', 4, '0', 5);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-3-6', 'SITE_COMES', 'COMES_COR', 'dept2-3', 'SQ10', 'SQ10', '대표이사 > QA사업본부 > 3실 > SQ10', 4, '0', 6);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-3-7', 'SITE_COMES', 'COMES_COR', 'dept2-3', 'SQ11', 'SQ11', '대표이사 > QA사업본부 > 3실 > SQ11', 4, '0', 7);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-3-8', 'SITE_COMES', 'COMES_COR', 'dept2-3', 'SQ13', 'SQ13', '대표이사 > QA사업본부 > 3실 > SQ13', 4, '0', 8);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-3-9', 'SITE_COMES', 'COMES_COR', 'dept2-3', 'TQ04', 'TQ04', '대표이사 > QA사업본부 > 3실 > TQ04', 4, '0', 9);

-- QA사업본부 > 4실 > 하위 부서
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-4-1', 'SITE_COMES', 'COMES_COR', 'dept2-4', 'SQ02', 'SQ02', '대표이사 > QA사업본부 > 4실 > SQ02', 4, '0', 1);
INSERT INTO to0_dept_mast(
	dept_key, site_key, cor_key, upper_dept_key, dept_name, short_dept_name, tree_path, tree_depth, dept_type, sort_index)
	VALUES ('dept2-4-2', 'SITE_COMES', 'COMES_COR', 'dept2-4', 'SQ12', 'SQ12', '대표이사 > QA사업본부 > 4실 > SQ12', 4, '0', 2);


/* 사용자 insert  : excel로 포팅 */


1.팀원
 -1실 > SQ06(dept2-1-1)
21101201	gelee3	이경은
21112901	bgkim	김보국
21120601	hklee	이현경

 -1실 > SQ14(dept2-1-3)
21121301	hcso	소현철
21122001	hsjo	조현식
22010603	jsjeong	정지수
22030701	jhmoon	문지현

 -2실 > SQ05(dept2-2-1)
22080101	sjkim02	김소진
22080801	sjlee00	이수진
22080802	archo	조아라

 -2실 > SQ16(dept2-2-3)
18010103	jhlim88	임진혁	JinHyuck Lim
18021903	cwpark	박찬원	ChanWon Park

 -3실 > SQ01(dept2-3-2)
18091301	sclee	이순철	SoonChul Lee
18091703	bkkim	김병국	ByungKuk Kim;


-- 관리자 부서
21052401	yskim97	김영석 ---> 상위 관리자 부서 (dept1)
21052403	smheo	허성민 ---> 첫번째 하위 부서 (dept1-1)
21062801	hrlee	이하린 ---> 두번째 하위 부서 (dept1-2)
jmh 장매화 ---> 상위 관리자 부서 (dept1)