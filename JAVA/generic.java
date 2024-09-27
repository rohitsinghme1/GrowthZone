class gen<T> {
    private T data;

    public gen(T data) {
        this.data = data;
    }

    public T getdata() {
        return this.data;
    }

}

class generic {
    public static void main(String args[]) {
        gen<Integer> g = new gen<>(5);
        System.out.println(g.getdata());

    }
}
