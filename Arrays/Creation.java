import java.util.Scanner;

public class Creation {
    public static void main(String args[])
    {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] arr=new int[n];

        System.out.print("Before: ");
        for(int i=0;i<n;i++){
            System.out.println(arr[])
        }
        int position=sc.nextInt();
        int value=sc.nextInt();

        for(int i=n;i>position;i--){
            arr[i]=arr[i-1];

        }
        arr[position]=value;
        n++;

    }
    
}
