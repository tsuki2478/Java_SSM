package cn.hd.model;

import java.util.ArrayList;
import java.util.List;

public class Rolebean {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_role.RID
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    private Integer rid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_role.ROLENAME
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    private String rolename;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_role.DESCRIPTION
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    private String description;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_role.ISDEL
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    private Integer isdel;

    //有多个权限
    private List<Integer> mids=new ArrayList<>();
    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_role.RID
     *
     * @return the value of t_role.RID
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    public Integer getRid() {
        return rid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_role.RID
     *
     * @param rid the value for t_role.RID
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    public void setRid(Integer rid) {
        this.rid = rid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_role.ROLENAME
     *
     * @return the value of t_role.ROLENAME
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    public String getRolename() {
        return rolename;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_role.ROLENAME
     *
     * @param rolename the value for t_role.ROLENAME
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_role.DESCRIPTION
     *
     * @return the value of t_role.DESCRIPTION
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    public String getDescription() {
        return description;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_role.DESCRIPTION
     *
     * @param description the value for t_role.DESCRIPTION
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_role.ISDEL
     *
     * @return the value of t_role.ISDEL
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    public Integer getIsdel() {
        return isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_role.ISDEL
     *
     * @param isdel the value for t_role.ISDEL
     *
     * @mbggenerated Tue Apr 11 17:23:49 CST 2017
     */
    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

	public List<Integer> getMids() {
		return mids;
	}

	public void setMids(List<Integer> mids) {
		this.mids = mids;
	}

}
