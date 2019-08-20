
package dwr;

import java.util.List;
import java.util.ArrayList;

/**
 * 树节点管理器.
 * @author Lingo
 */
public class TreeNodeManager {

    public List getTree(String id) {
        List list = new ArrayList();
        String seed1 = id + 1;
        String seed2 = id + 2;
        String seed3 = id + 3;
        list.add(new TreeNode(seed1, "" + seed1, false));
        list.add(new TreeNode(seed2, "" + seed2, false));
        list.add(new TreeNode(seed3, "" + seed3, true));

        return list;
    }

}

