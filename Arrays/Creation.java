import java.util.Scanner;

public class Creation {
    public static void main(String args[])
    {
        Scanner sc=new Scanner(System.in);

        System.out.print("Enter size of the array: ");
        int n=sc.nextInt();
        
        int[] arr=new int[n];

        System.out.print("Enter Values: ");
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
            
        }

        System.out.print("Before: ");
        for(int i=0;i<n;i++){
            System.out.print(arr[i]+ " ");
        }

         System.out.print("Enter position: ");
        int position=sc.nextInt();
         System.out.print("Enter Value: ");
        int value=sc.nextInt();
        n++;
        for(int i=n-1;i>position;i--){
            arr[i]=arr[i-1];

        }
        arr[position]=value;
        n++;

        System.out.print("After: ");
        for(int i=0;i<n;i++){
            System.out.println(arr[i]);
        }

    }
    
}
