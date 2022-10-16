-- 사용자
INSERT INTO public.to0_user_main(
	    user_key, site_key, USER_ID, USER_NAME, USER_PASS, SVC_MAIL_USE_YNL, SVC_UC_USE_YNL, AUTH_NUM, USER_PASS_MOD_TIMESTAMP)
VALUES ('yamdeng', 'comes', 'yamdeng', 'yamdeng', 'yamdeng', 'Y', 'Y', 3, NOW());

-- 부서
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);

INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1-1', 'comes', 'comes', 'dept1', 'dept1-1', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1-2', 'comes', 'comes', 'dept1', 'dept1-2', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1-3', 'comes', 'comes', 'dept1', 'dept1-3', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1-1-1', 'comes', 'comes', 'dept1-1', 'dept1-1-1', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1-1-2', 'comes', 'comes', 'dept1-1', 'dept1-1-2', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1-2-1', 'comes', 'comes', 'dept1-2', 'dept1-2-1', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1-2-2', 'comes', 'comes', 'dept1-2', 'dept1-2-2', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1-3-1', 'comes', 'comes', 'dept1-3', 'dept1-3-1', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1-3-2', 'comes', 'comes', 'dept1-3', 'dept1-3-2', 'tree_path', 0, 'D', 1);

INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);
INSERT INTO to0_dept_mast(dept_key, site_key, cor_key, upper_dept_key, dept_name, tree_path, TREE_DEPTH, dept_type, sort_index)
                    VALUES ('dept1', 'comes', 'comes', '', '최상위', 'tree_path', 0, 'D', 1);