package hello;

import java.util.Date;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Application {

    @RequestMapping("/")
    public String home() {
        return "Hello Docker World, MySpringBootProyect: "+new Date()+" V5";
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
