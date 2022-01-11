package org.factchecker.webapp.controller;

import org.factchecker.webapp.domain.Message;
import org.factchecker.webapp.domain.User;
import org.factchecker.webapp.repos.IMessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class WebController {
    @Autowired
    private IMessageRepo iMessageRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/index")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Message> messages;

        if (filter != null && !filter.isEmpty()) {
            messages = iMessageRepo.findByTag(filter);
        } else {
            messages = iMessageRepo.findAll();
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "index";
    }

    @PostMapping("/index")
    public String add(@AuthenticationPrincipal User user,
                      @RequestParam String text,
                      @RequestParam String tag,
                      Map<String, Object> model) {
        Message message = new Message(text, tag, user);
        iMessageRepo.save(message);
        Iterable<Message> messages = iMessageRepo.findAll();
        model.put("messages", messages);

        return "index";
    }
}
