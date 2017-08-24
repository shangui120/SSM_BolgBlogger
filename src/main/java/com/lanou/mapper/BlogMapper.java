package com.lanou.mapper;

import com.lanou.bean.Blog;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dllo on 17/8/23.
 */

@Repository
public interface BlogMapper {

    @Select("select *from b_blog")
    List<Blog> findBlog();

    @Delete("delete from b_blog where id = #{id,jdbcType=INTEGER}")
    void delete(Integer id);

    @Insert("insert into b_blog values (null,#{title,jdbcType=VARCHAR}, #{des,jdbcType=VARCHAR},#{content,jdbcType=VARCHAR},#{userId,jdbcType=INTEGER})")
    void insert(Blog blog);


}
