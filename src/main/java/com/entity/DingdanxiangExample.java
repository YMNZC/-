package com.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName Dingdanxiang
 * @Description mybatis持久层数据操作订单项表搜索条件及排序封装扩展类
 */
public class DingdanxiangExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DingdanxiangExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andDingdanidIsNull() {
            addCriterion("dingdanid is null");
            return (Criteria) this;
        }

        public Criteria andDingdanidIsNotNull() {
            addCriterion("dingdanid is not null");
            return (Criteria) this;
        }

        public Criteria andDingdanidEqualTo(Integer value) {
            addCriterion("dingdanid =", value, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidNotEqualTo(Integer value) {
            addCriterion("dingdanid <>", value, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidGreaterThan(Integer value) {
            addCriterion("dingdanid >", value, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidGreaterThanOrEqualTo(Integer value) {
            addCriterion("dingdanid >=", value, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidLessThan(Integer value) {
            addCriterion("dingdanid <", value, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidLessThanOrEqualTo(Integer value) {
            addCriterion("dingdanid <=", value, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidLike(Integer value) {
            addCriterion("dingdanid like", value, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidNotLike(Integer value) {
            addCriterion("dingdanid not like", value, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidIn(List<Integer> values) {
            addCriterion("dingdanid in", values, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidNotIn(List<Integer> values) {
            addCriterion("dingdanid not in", values, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidBetween(Integer value1, Integer value2) {
            addCriterion("dingdanid between", value1, value2, "dingdanid");
            return (Criteria) this;
        }

        public Criteria andDingdanidNotBetween(Integer value1, Integer value2) {
            addCriterion("dingdanid not between", value1, value2, "dingdanid");
            return (Criteria) this;
        }
        public Criteria andShangpinidIsNull() {
            addCriterion("shangpinid is null");
            return (Criteria) this;
        }

        public Criteria andShangpinidIsNotNull() {
            addCriterion("shangpinid is not null");
            return (Criteria) this;
        }

        public Criteria andShangpinidEqualTo(Integer value) {
            addCriterion("shangpinid =", value, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidNotEqualTo(Integer value) {
            addCriterion("shangpinid <>", value, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidGreaterThan(Integer value) {
            addCriterion("shangpinid >", value, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidGreaterThanOrEqualTo(Integer value) {
            addCriterion("shangpinid >=", value, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidLessThan(Integer value) {
            addCriterion("shangpinid <", value, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidLessThanOrEqualTo(Integer value) {
            addCriterion("shangpinid <=", value, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidLike(Integer value) {
            addCriterion("shangpinid like", value, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidNotLike(Integer value) {
            addCriterion("shangpinid not like", value, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidIn(List<Integer> values) {
            addCriterion("shangpinid in", values, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidNotIn(List<Integer> values) {
            addCriterion("shangpinid not in", values, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidBetween(Integer value1, Integer value2) {
            addCriterion("shangpinid between", value1, value2, "shangpinid");
            return (Criteria) this;
        }

        public Criteria andShangpinidNotBetween(Integer value1, Integer value2) {
            addCriterion("shangpinid not between", value1, value2, "shangpinid");
            return (Criteria) this;
        }
        public Criteria andGoumaishuliangIsNull() {
            addCriterion("goumaishuliang is null");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangIsNotNull() {
            addCriterion("goumaishuliang is not null");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangEqualTo(Integer value) {
            addCriterion("goumaishuliang =", value, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangNotEqualTo(Integer value) {
            addCriterion("goumaishuliang <>", value, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangGreaterThan(Integer value) {
            addCriterion("goumaishuliang >", value, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangGreaterThanOrEqualTo(Integer value) {
            addCriterion("goumaishuliang >=", value, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangLessThan(Integer value) {
            addCriterion("goumaishuliang <", value, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangLessThanOrEqualTo(Integer value) {
            addCriterion("goumaishuliang <=", value, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangLike(Integer value) {
            addCriterion("goumaishuliang like", value, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangNotLike(Integer value) {
            addCriterion("goumaishuliang not like", value, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangIn(List<Integer> values) {
            addCriterion("goumaishuliang in", values, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangNotIn(List<Integer> values) {
            addCriterion("goumaishuliang not in", values, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangBetween(Integer value1, Integer value2) {
            addCriterion("goumaishuliang between", value1, value2, "goumaishuliang");
            return (Criteria) this;
        }

        public Criteria andGoumaishuliangNotBetween(Integer value1, Integer value2) {
            addCriterion("goumaishuliang not between", value1, value2, "goumaishuliang");
            return (Criteria) this;
        }
        public Criteria andUsersidIsNull() {
            addCriterion("usersid is null");
            return (Criteria) this;
        }

        public Criteria andUsersidIsNotNull() {
            addCriterion("usersid is not null");
            return (Criteria) this;
        }

        public Criteria andUsersidEqualTo(Integer value) {
            addCriterion("usersid =", value, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidNotEqualTo(Integer value) {
            addCriterion("usersid <>", value, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidGreaterThan(Integer value) {
            addCriterion("usersid >", value, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidGreaterThanOrEqualTo(Integer value) {
            addCriterion("usersid >=", value, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidLessThan(Integer value) {
            addCriterion("usersid <", value, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidLessThanOrEqualTo(Integer value) {
            addCriterion("usersid <=", value, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidLike(Integer value) {
            addCriterion("usersid like", value, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidNotLike(Integer value) {
            addCriterion("usersid not like", value, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidIn(List<Integer> values) {
            addCriterion("usersid in", values, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidNotIn(List<Integer> values) {
            addCriterion("usersid not in", values, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidBetween(Integer value1, Integer value2) {
            addCriterion("usersid between", value1, value2, "usersid");
            return (Criteria) this;
        }

        public Criteria andUsersidNotBetween(Integer value1, Integer value2) {
            addCriterion("usersid not between", value1, value2, "usersid");
            return (Criteria) this;
        }

    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}
