/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ADMIND
 */
public class UserDTO {
    private String Username;
    private String Name;
    private String Password;
    private String Role;

    public UserDTO() {
    }

    public UserDTO(String Username, String Name, String Password, String Role) {
        this.Username = Username;
        this.Name = Name;
        this.Password = Password;
        this.Role = Role;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "Username=" + Username + ", Name=" + Name + ", Password=" + Password + ", Role=" + Role + '}';
    }
    
}
