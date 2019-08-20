package dwr;

import java.io.Serializable;

/**
 * ∑÷“≥∂‘œÛ.
 */
public class ListRange implements Serializable {
    private Object[] data;
    private int totalSize;

    public ListRange(Object[] data, int totalSize) {
        this.data = data;
        this.totalSize = totalSize;
    }

    public Object[] getData() {
        return data;
    }
    public void setData(Object[] data) {
        this.data = data;
    }

    public int getTotalSize() {
        return totalSize;
    }
    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }
}

