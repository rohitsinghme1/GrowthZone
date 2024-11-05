class generic2 {
    public static void main(String args[]) {
        gent<Integer> g = new gent<>();
        g.display();
    }
}

class gent<T extends Number> {
    public void display() {
        System.out.println("This is a bounded type generics class");
    }
}