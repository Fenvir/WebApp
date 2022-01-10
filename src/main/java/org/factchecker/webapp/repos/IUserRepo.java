package org.factchecker.webapp.repos;

import org.factchecker.webapp.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IUserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
