class gentask1<T extends Number> {

    T data, data1;
    Double sum;

    public void Display(T data, T data1) {
        this.data = data;
        this.data1 = data1;

        sum = (data.doubleValue() + data1.doubleValue());
        System.out.println(sum);

    }

    public static void main(String args[]) {
        gentask1<Integer> g = new gentask1<>();
        g.Display(4, 5);

    }
}
