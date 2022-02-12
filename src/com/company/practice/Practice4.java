package com.company.practice;

import java.util.Scanner;

public class Practice4 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("거리를 입력하세요 : ");
        String input = scanner.next();

        double result = 0;
        if (input.contains("K") || input.contains("k")) {
            input = input.toUpperCase();
            // 1000KM  {1000, M}
            result = Double.parseDouble(input.split("K")[0]);
            result *= 1000;
            System.out.println("To Meter is "  + result);
        } else {
            result = Double.parseDouble(input.substring(0,input.length()-1));
            result /= 1000;
            System.out.println("To KiloMeter is " + result);
        }

        }

    }

