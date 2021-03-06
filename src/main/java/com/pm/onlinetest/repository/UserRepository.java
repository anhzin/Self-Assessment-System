package com.pm.onlinetest.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pm.onlinetest.domain.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {
	
	@Query("SELECT u FROM User u WHERE u.userId =:userId")
	User findByUserId(@Param("userId") Integer userId);
		
	@Query("SELECT u FROM Authority a, User u WHERE u.userId = a.userId AND a.authority =:authority AND u.enabled = true")
	List<User> findByAuthority(@Param("authority") String authority);
	
	@Query("SELECT u FROM User u WHERE u.enabled = true")
	List<User> findAllEnabled();
	
	@Modifying(clearAutomatically = true)
	@Transactional
	@Query("UPDATE User u SET u.enabled = false WHERE u.userId =:userId")
	void softDelete(@Param("userId") Integer userId);
	
	@Query("SELECT u FROM User u WHERE u.username=:username AND u.enabled = true")
	User findByUsername(@Param("username") String username);
	
	@Query("SELECT u FROM User u WHERE u.username=:username AND u.enabled = true AND u.userId !=:userId")
	User findByUsernameExceptThis(@Param("username") String username, @Param("userId") Integer userId);


	@Query("SELECT u FROM User u WHERE u.email=:email)")
	User isEmailExists(@Param("email") String email);
	
	@Query("SELECT u.userId FROM User u WHERE u.email=:email")
	int findByUseremailid(@Param("email") String email);

	//String passwordUpdate(Integer userId);

	@Modifying(clearAutomatically = true)
	@Transactional
	@Query("UPDATE User u SET u.password = :accessCode WHERE u.email =:email")
	void passwordUpdate(@Param("email") String email, @Param("accessCode") String accessCode);	
	
	@Modifying(clearAutomatically = true)
	@Transactional
	@Query("UPDATE User u SET u.enabled = :enabled WHERE u.userId =:userId")
	void updateStatus(@Param("userId") Integer userId, @Param("enabled") boolean enabled);
	
	// First keyword introduce in spring jpa 1.7 which is not support in current
	// version of this project. If the version is update pls remove the Query
	// annotation on top of it
	@Query("SELECT u FROM User u WHERE u.email=:email and u.username is not null)")
	User findFirstByEmail(@Param("email") String email);
}
