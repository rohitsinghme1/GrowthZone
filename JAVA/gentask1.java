class gentask1<T> {

    T data, data1, sum;

    public void add(T data, T data1) {
        this.data = data;
        this.data1 = data1;

        this.sum = data + data1;

    }

    public static void mian(String arghs[]) {
        gentask1<Integer> g = new gentask1<>();
        g.add(2, 3);
    }
}
