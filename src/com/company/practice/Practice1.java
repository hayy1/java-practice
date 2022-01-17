package com.company.practice;

import java.util.Scanner;

public class Practice1 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("이진수로 변경할 수를 입력하세요 : ");
        int num1 = scanner.nextInt();

        String num2 = Integer.toBinaryString(num1);

        System.out.println(num2);

    }
}
