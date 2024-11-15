class lib {
    public static void main(String[] args) {

    }
}

class book {
    String title;
    String author;

    public book(String title, String author) {
        this.title = title;
        this.author = author;
    }
}

class ebooks extends book {

    int filesize;
    String format;

    public ebooks(String title, String author, int filesize, String format) {

        super(title, author);
        this.filesize = filesize;
        this.format = format;

    }

}