import java.util.*;

class Stack {

    Scanner sc = new Scanner(System.in);
    LinkedList<Integer> LL = new LinkedList<>();

    public void menu() {
        System.out.println("1. push ");
        System.out.println("2. pop");
        System.out.println("3. peek");
        System.out.println("4. is empty");
        System.out.println("5. Print Stack");
        System.out.println();

        int cho = sc.nextInt();
        System.out.println();

        switch (cho) {
            case 1:
                int n;
                System.out.println("Enter the number to push");
                n = sc.nextInt();
                LL.addFirst(n);
                System.out.println("done");
                System.out.println();

                break;

            case 2:
                System.out.println("Removing element");
                LL.removeFirst();
                System.out.println("done");
                System.out.println();
                break;

            case 3:
                System.out.println(LL.get(0));
                System.out.println();
                break;

            case 4:
                if (LL.isEmpty()) {
                    System.out.println("is empty");
                } else {
                    System.out.println(LL.size());
                }
                System.out.println();
                break;

            case 5:
                System.out.println(LL);
                System.out.println();
                break;

            default:
                System.out.println("Invalid input");
                System.out.println();
        }

        menu();

    }

    public static void main(String args[]) {
        Stack s = new Stack();
        s.menu();
    }

}
