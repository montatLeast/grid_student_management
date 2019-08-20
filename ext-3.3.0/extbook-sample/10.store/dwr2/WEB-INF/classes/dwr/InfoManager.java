package dwr;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 操作pojo的管理器.
 * @author Lingo
 */
public class InfoManager {
    private List infoList = new ArrayList();
    public InfoManager() {
        for (int i = 0; i < 20; i++) {
            Info info = new Info();
            info.setId(i);
            info.setName("name " + i);
            info.setSex(i%2);
            info.setEmail("xyz20003@gmail.com");
            info.setTel("" + i);
            info.setAddTime(new Date());
            info.setDescn("descn " + i);

            infoList.add(info);
        }
    }

    public List getResult() {
        return infoList;
    }

    public ListRange getItems(Map conditions) {
        int start = 0;
        int pageSize = 10;
        // int pageNo = (start / pageSize) + 1;

        try {
            start = Integer.parseInt(conditions.get("start").toString());
            pageSize = Integer.parseInt(conditions.get("limit").toString());
            // pageNo = (start / pageSize) + 1;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        int end = start + pageSize;
        if (end > infoList.size()) {
            end = infoList.size();
        }
        List list = infoList.subList(start, end);
        return new ListRange(list.toArray(), infoList.size());
    }

}

