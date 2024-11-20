/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author ASUS
 */

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class UserError implements Serializable{
    private String userIDError ;
    private String fullNameError ;
    private String roleIDError ;
    private String passwordError;
    private String confirmError;
    private String error;
    private String priceError;
    private String quantityError;
    private String BrandError;
    
}
