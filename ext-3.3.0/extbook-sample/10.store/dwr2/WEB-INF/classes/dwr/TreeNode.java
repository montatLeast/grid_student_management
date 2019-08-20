
package dwr;

/**
 * 树节点对应的pojo.
 * @author Lingo
 */
public class TreeNode {
    private String id;
    private String text;
    private boolean leaf;

    public TreeNode() {
    }

    public TreeNode(String id, String text, boolean leaf) {
        this.id = id;
        this.text = text;
        this.leaf = leaf;
    }

    public String getId() {
        return id;
    }
    public void setid(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }

    public boolean getLeaf() {
        return leaf;
    }
    public void setLeaf(boolean leaf) {
        this.leaf = leaf;
    }

}

