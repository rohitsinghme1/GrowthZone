class DemoClass {

    public <T> void genMethod(T data) {
        System.out.println(data);
    }
}

class gener {
    public static void main(String[] args) {
        DemoClass d = new DemoClass();
        d.genMethod("Singh");
        d.genMethod(5);
        d.genMethod(12.5);
    }
}