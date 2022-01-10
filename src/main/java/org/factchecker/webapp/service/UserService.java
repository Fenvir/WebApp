package org.factchecker.webapp.service;

import org.factchecker.webapp.repos.IUserRepo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {
//    @Autowired
    private final IUserRepo iUserRepo;

    public UserService(IUserRepo iUserRepo) {
        this.iUserRepo = iUserRepo;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return iUserRepo.findByUsername(username);
    }
}
