package com.fmr.admin.model;

import jakarta.persistence.*;

@Entity
@Table(name = "user")
public class User {

  @Id
  @Column(name = "user_id")
  private Long userId;

  @Column(name = "first_name")
  private String firstName;

  @Column(name = "last_name")
  private String lastName;

  @Column(name = "email")
  private String email;

  @Column(name = "phone_no")
  private String phone;

  public Long getUserId() {
    return userId;
  }

  // combine first + last name
  public String getName() {
    return firstName + " " + lastName;
  }

  public String getEmail() {
    return email;
  }

  public String getPhone() {
    return phone;
  }
}
