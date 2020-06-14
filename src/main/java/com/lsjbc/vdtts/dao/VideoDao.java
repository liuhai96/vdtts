package com.lsjbc.vdtts.dao;

import com.lsjbc.vdtts.dao.mapper.VideoMapper;
import com.lsjbc.vdtts.entity.Video;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName: VideoDao
 * @Description:
 * @Datetime: 2020/6/14   8:01
 * @Author: JX181114 - 郑建辉
 */
@Repository(VideoDao.NAME)
public class VideoDao {

    /**
     * Bean名
     */
    public static final String NAME = "VideoDao";

    @Resource
    private VideoMapper mapper;

    /**
     * 根据特定科目的教学视频
     *
     * @param level 科目等级
     * @return 教学视频集合
     */
    public List<Video> getVideoByLevel(Integer level) {
        Example example = new Example(Video.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("vLevel", level);

        return mapper.selectByExample(example);
    }


}
