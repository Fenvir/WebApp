package org.factchecker.webapp.controller;

import org.factchecker.webapp.domain.Role;
import org.factchecker.webapp.domain.User;
import org.factchecker.webapp.repos.IUserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private IUserRepo iUserRepo;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDB = iUserRepo.findByUsername(user.getUsername());

        if (userFromDB != null) {
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

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        iUserRepo.save(user);

        return "redirect:/index";
    }

}
