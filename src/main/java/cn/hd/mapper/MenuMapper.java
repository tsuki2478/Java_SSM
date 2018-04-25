package cn.hd.mapper;

import java.util.List;

import cn.hd.model.BaseConditionVO;
import cn.hd.model.Menu;

public interface MenuMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_menu
     *
     * @mbggenerated Tue Apr 11 15:54:34 CST 2017
     */
    int deleteByPrimaryKey(Integer mid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_menu
     *
     * @mbggenerated Tue Apr 11 15:54:34 CST 2017
     */
    int insert(Menu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_menu
     *
     * @mbggenerated Tue Apr 11 15:54:34 CST 2017
     */
    int insertSelective(Menu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_menu
     *
     * @mbggenerated Tue Apr 11 15:54:34 CST 2017
     */
    Menu selectByPrimaryKey(Integer mid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_menu
     *
     * @mbggenerated Tue Apr 11 15:54:34 CST 2017
     */
    int updateByPrimaryKeySelective(Menu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_menu
     *
     * @mbggenerated Tue Apr 11 15:54:34 CST 2017
     */
    int updateByPrimaryKey(Menu record);

	List<Menu> queryAll();

	List<Menu> query(BaseConditionVO vo);
	 /**
     * 删除菜单时，也要相对应的子菜单一起删除，这里的删除是指逻辑删除(伪删除)
     * isdel 0 表示未删除，1表示 已删除
     * @param id
     */
	void updateByMidorPid(int id);

}