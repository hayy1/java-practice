package com.company.practice;

import java.util.Scanner;

public class Practice2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("별 찍을 숫자를 입력하세요 : ");

        try {
            int num = scanner.nextInt();
            for (int i = 0; i < num; i++) {
                for (int j = 0; j <= i; j++) {
                    System.out.print("*");
                }
                System.out.println();
            }

        } catch (Exception e) {
            System.out.println("숫자만 입력하세요.");
        }

    }
}

