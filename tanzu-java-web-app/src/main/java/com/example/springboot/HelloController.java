package com.example.springboot;

import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.Period;

@RestController
public class HelloController {

    @GetMapping("/")
    public String index() {
        return "Greetings from Spring Boot + Test!";
    }

    @PostMapping("/calculateAge")
    public String calculateAge(@RequestParam String name, @RequestParam String dob) {
        // Parse the input string into a LocalDate object
        LocalDate dobDate = LocalDate.parse(dob);

        // Calculate the age
        Period age = calculateAge(dobDate, LocalDate.now());

        // Display the result
        return "Hello, " + name + "! Your age is: " + age.getYears() + " years, " + age.getMonths() + " months, and " + age.getDays() + " days.";
    }

    // Function to calculate age
    private static Period calculateAge(LocalDate dob, LocalDate currentDate) {
        return Period.between(dob, currentDate);
    }
}
