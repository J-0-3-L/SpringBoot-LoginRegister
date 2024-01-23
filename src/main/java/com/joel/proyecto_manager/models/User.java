package com.joel.proyecto_manager.models;


import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "users")
@NoArgsConstructor
@Getter
@Setter
public class User extends ModelBase{

  private String email;
  private String password;

  @Transient
  private String passwordConfirmation;
}