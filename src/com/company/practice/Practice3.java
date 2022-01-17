package com.company.practice;

import java.util.Scanner;

public class Practice3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("별 찍을 1~100 사이 숫자를 입력하세요 : ");
        int num = scanner.nextInt();

        if (num < 1 || num > 100) {
            System.out.println("1~100 사이 숫자를 입력하세요.");
        } else {
            int i, j, k;
            for (i = 1; i <= num; i++) {
                for (k = num; k > i; k--) {
                    System.out.print(" ");
                }
                for (j = 1; j <= k; j++) {
                    System.out.print("*");
                }
                System.out.println();
            }
        }
    }
}
