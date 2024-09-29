class gentask1<T> {

    T data, data1;

    public void Display(T data, T data1) {
        this.data = data;
        this.data1 = data1;

        System.out.println(data);
        System.out.println(data1);

    }

    public static void main(String arghs[]) {
        gentask1<Integer> g = new gentask1<>();
        g.Display(4, 3);
        gentask1<String> gg = new gentask1<>();
        gg.Display("Rohit", "Singh");
    }
}
