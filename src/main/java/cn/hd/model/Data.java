package cn.hd.model;

public class Data {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_data.id
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_data.name
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_data.memo
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    private String memo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_data.pid
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    private Integer pid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_data.id
     *
     * @return the value of t_data.id
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_data.id
     *
     * @param id the value for t_data.id
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_data.name
     *
     * @return the value of t_data.name
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_data.name
     *
     * @param name the value for t_data.name
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_data.memo
     *
     * @return the value of t_data.memo
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    public String getMemo() {
        return memo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_data.memo
     *
     * @param memo the value for t_data.memo
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_data.pid
     *
     * @return the value of t_data.pid
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    public Integer getPid() {
        return pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_data.pid
     *
     * @param pid the value for t_data.pid
     *
     * @mbggenerated Fri Apr 14 09:14:35 CST 2017
     */
    public void setPid(Integer pid) {
        this.pid = pid;
    }
}