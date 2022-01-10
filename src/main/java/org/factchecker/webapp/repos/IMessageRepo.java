package org.factchecker.webapp.repos;

import org.factchecker.webapp.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IMessageRepo extends CrudRepository<Message, Long> {
    List<Message> findByTag(String tag);
}
