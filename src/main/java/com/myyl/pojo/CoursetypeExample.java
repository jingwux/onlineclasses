package com.myyl.pojo;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public class CoursetypeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CoursetypeExample() {
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

        public Criteria andTypeidIsNull() {
            addCriterion("typeId is null");
            return (Criteria) this;
        }

        public Criteria andTypeidIsNotNull() {
            addCriterion("typeId is not null");
            return (Criteria) this;
        }

        public Criteria andTypeidEqualTo(String value) {
            addCriterion("typeId =", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidNotEqualTo(String value) {
            addCriterion("typeId <>", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidGreaterThan(String value) {
            addCriterion("typeId >", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidGreaterThanOrEqualTo(String value) {
            addCriterion("typeId >=", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidLessThan(String value) {
            addCriterion("typeId <", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidLessThanOrEqualTo(String value) {
            addCriterion("typeId <=", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidLike(String value) {
            addCriterion("typeId like", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidNotLike(String value) {
            addCriterion("typeId not like", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidIn(List<String> values) {
            addCriterion("typeId in", values, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidNotIn(List<String> values) {
            addCriterion("typeId not in", values, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidBetween(String value1, String value2) {
            addCriterion("typeId between", value1, value2, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidNotBetween(String value1, String value2) {
            addCriterion("typeId not between", value1, value2, "typeid");
            return (Criteria) this;
        }

        public Criteria andCtnameIsNull() {
            addCriterion("ctname is null");
            return (Criteria) this;
        }

        public Criteria andCtnameIsNotNull() {
            addCriterion("ctname is not null");
            return (Criteria) this;
        }

        public Criteria andCtnameEqualTo(String value) {
            addCriterion("ctname =", value, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameNotEqualTo(String value) {
            addCriterion("ctname <>", value, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameGreaterThan(String value) {
            addCriterion("ctname >", value, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameGreaterThanOrEqualTo(String value) {
            addCriterion("ctname >=", value, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameLessThan(String value) {
            addCriterion("ctname <", value, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameLessThanOrEqualTo(String value) {
            addCriterion("ctname <=", value, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameLike(String value) {
            addCriterion("ctname like", value, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameNotLike(String value) {
            addCriterion("ctname not like", value, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameIn(List<String> values) {
            addCriterion("ctname in", values, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameNotIn(List<String> values) {
            addCriterion("ctname not in", values, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameBetween(String value1, String value2) {
            addCriterion("ctname between", value1, value2, "ctname");
            return (Criteria) this;
        }

        public Criteria andCtnameNotBetween(String value1, String value2) {
            addCriterion("ctname not between", value1, value2, "ctname");
            return (Criteria) this;
        }

        public Criteria andPartypeIsNull() {
            addCriterion("partype is null");
            return (Criteria) this;
        }

        public Criteria andPartypeIsNotNull() {
            addCriterion("partype is not null");
            return (Criteria) this;
        }

        public Criteria andPartypeEqualTo(String value) {
            addCriterion("partype =", value, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeNotEqualTo(String value) {
            addCriterion("partype <>", value, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeGreaterThan(String value) {
            addCriterion("partype >", value, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeGreaterThanOrEqualTo(String value) {
            addCriterion("partype >=", value, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeLessThan(String value) {
            addCriterion("partype <", value, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeLessThanOrEqualTo(String value) {
            addCriterion("partype <=", value, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeLike(String value) {
            addCriterion("partype like", value, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeNotLike(String value) {
            addCriterion("partype not like", value, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeIn(List<String> values) {
            addCriterion("partype in", values, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeNotIn(List<String> values) {
            addCriterion("partype not in", values, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeBetween(String value1, String value2) {
            addCriterion("partype between", value1, value2, "partype");
            return (Criteria) this;
        }

        public Criteria andPartypeNotBetween(String value1, String value2) {
            addCriterion("partype not between", value1, value2, "partype");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
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