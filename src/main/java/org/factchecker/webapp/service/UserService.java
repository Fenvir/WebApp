package org.factchecker.webapp.service;

import org.factchecker.webapp.config.PasswordEncoderConfig;
import org.factchecker.webapp.domain.Role;
import org.factchecker.webapp.domain.User;
import org.factchecker.webapp.repos.IUserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private IUserRepo iUserRepo;

    @Autowired
    private MailSenderService mailSender;

    @Autowired
    protected PasswordEncoderConfig passwordEncoderConfig;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return iUserRepo.findByUsername(username);
    }

    public boolean addUser(User user) {
        User userFromDB = iUserRepo.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return false;
        } else if (user.getUsername().equals("") && user.getPassword().equals("")) {
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoderConfig.getPasswordEncoder().encode(user.getPassword()));
        iUserRepo.save(user);

        sendMessage(user);

        return true;
    }

    private void sendMessage(User user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Привет %s! \n" +
                            "Добро пожаловать в FactChecker. Пожалуйста пройдите по ссылке: http://localhost:12750/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );
            mailSender.send(user.getEmail(), "Код активации", message);
        }
    }

    public boolean activateUser(String code) {
        User user = iUserRepo.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);
        iUserRepo.save(user);

        return true;
    }

    public List<User> findAll() {
        return iUserRepo.findAll();
    }

    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);
        Set<String> roles = Arrays.stream(Role.values()).map(Role::name).collect(Collectors.toSet());
        user.getRoles().clear();

        for (String key : form.keySet()) {

            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        iUserRepo.save(user);
    }

    public void updateProfile(User user, String password, String email) {
        String userEmail = user.getEmail();

        boolean isEmailChanged = (email != null && !email.equals(userEmail)) ||
                (userEmail != null && !userEmail.equals(email));

        if (isEmailChanged) {
            user.setEmail(email);

            if (!StringUtils.isEmpty(email)) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }

        if (!StringUtils.isEmpty(password)) {
            user.setPassword(passwordEncoderConfig.getPasswordEncoder().encode(password));
        }

        iUserRepo.save(user);

        if (isEmailChanged) {
            sendMessage(user);
        }
    }
}
