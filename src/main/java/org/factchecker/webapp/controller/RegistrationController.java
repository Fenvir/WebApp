package org.factchecker.webapp.controller;

import org.factchecker.webapp.domain.User;
import org.factchecker.webapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        if (!userService.addUser(user)) {
            model.put("message", "Пользователь с таким именем уже существует!");
            return "registration";
        }

        if (user.getUsername().equals("") || user.getPassword().equals("")) {
            model.put("message", "Имя пользователя и пароль не должны быть пустыми");
            return "registration";
        }

        if (user.getUsername().equals(user.getPassword())) {
            model.put("message", "Имя пользователя и пароль не должны совпадать");
            return "registration";
        }

        return "redirect:/index";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "Пользователь активирован");
        } else {
            model.addAttribute("message", "Код активации не найден");
        }

        return "/login";
    }

}
