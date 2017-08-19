/*
 * sseg_driver.h
 *
 *  Created on: 2017-05-25
 *      Author: ak82770
 */

#ifndef SSEG_DRIVER_H_
#define SSEG_DRIVER_H_


#define PIO_DATA_REG_OFT 0	//offset du registre Data
#define pio_write(base,data) IOWR(base, PIO_DATA_REG_OFT, data)

/*

 exemple d'utilisation affichant "12EF" sur les 7 seg

	alt_u8 message[4];

	message[0] = sseg_conv_hex(0x01);
	message[1] = sseg_conv_hex(0x0b);
	message[2] = sseg_conv_hex(0x00);
	message[3] = sseg_conv_hex(0x0a);
	sseg_disp_4_digit(SSEG_1_4_BASE, message); //equivalent message[0]
*/


alt_u8 sseg_conv_hex(int hex)
{
	/* patron hexadecimaux pour afficheur 7seg active-low (0-9, a-f)
	 * le msb est ignore */
	static const alt_u8 SSEG_HEX_TABLE[16] = {
			0x40, 0x79, 0x24, 0x30, 0x19, 0x92, 0x02, 0x78, 0x00, 0x10, // 0-9
			0x88, 0x03, 0x46, 0x21, 0x06, 0x0E};						// a-f

	alt_u8 pattern;

	if (hex < 16) {
		pattern = SSEG_HEX_TABLE[hex];
	} else {
		pattern = 0xff; //tous eteint
	}
	return (pattern);
}


void sseg_disp_4_digit(alt_u32 base, alt_u8 *digit)
{
	/* digit est l'adresse d'un tableau de 4 alt_u8 */

	alt_u32 sseg_data = 0;
	int i;

	/* assemblage de 4 donnees par OR et decalage pour former un 32 bit */
	for(i = 0; i < 4; i++){
		sseg_data = (sseg_data << 8) | *digit;
		digit++;
	}
	pio_write(base,sseg_data);
}

void display_int_to_sseg(int number)
{
	alt_u8 message[4];


	//Pour Display sur le hex3.
	int i = 0;
	while(number >= 1000)
	{
		i++;
		number -= 1000;

	}
	//display i  on hex3.
	message[0] = sseg_conv_hex(i);
	i = 0;
	while(number >= 100)
	{
		i++;
		number -= 100;
	}
	//display i  on hex2.
	message[1] = sseg_conv_hex(i);
	i = 0;
	while(number >= 10)
	{
		i++;
		number -= 10;
	}
	//display i  on hex1.
	message[2] = sseg_conv_hex(i);
	i = 0;
	while(number >= 1)
	{
		i++;
		number -= 1;
	}
	//display i  on hex0.
	message[3] = sseg_conv_hex(i);
	sseg_disp_4_digit(SSEG_I_IV_BASE, message); //equivalent message[0]

	alt_u8 message1[4];

	message1[0] = sseg_conv_hex(0x01);//no hex here...
	message1[1] = sseg_conv_hex(0x02);//no hex here...
	message1[2] = 0x40;//hex5 -> OFF
	message1[3] = 0x40;//hex4 -> OFF
	sseg_disp_4_digit(SSEG_V_VI_BASE, message1); //equivalent message[0]

}

void display_pause(void)
{
	alt_u8 message[4];

	message[0] = 0x41;//hex3 -> U
	message[1] = 0x12;//hex2 -> S
	message[2] = 0x06;//hex1 -> E
	message[3] = 0xff;//hex0 -> OFF.
	sseg_disp_4_digit(SSEG_I_IV_BASE, message); //equivalent message[0]

	alt_u8 message1[4];

	message1[0] = sseg_conv_hex(0x01);
	message1[1] = sseg_conv_hex(0x02);
	message1[2] = 0x0c;//hex5 -> P
	message1[3] = 0x88;//hex4 -> A
	sseg_disp_4_digit(SSEG_V_VI_BASE, message1); //equivalent message[0]
}

//usefull for debugging
void display_all_off(void)
{
	alt_u8 message[4];

		message[0] = 0xff;//OFF
		message[1] = 0xff;
		message[2] = 0xff;
		message[3] = 0xff;
		sseg_disp_4_digit(SSEG_I_IV_BASE, message); //equivalent message[0]

		alt_u8 message1[4];

		message1[0] = 0xff;
		message1[1] = 0xff;
		message1[2] = 0xff;
		message1[3] = 0xff;
		sseg_disp_4_digit(SSEG_V_VI_BASE, message1); //equivalent message[0]
}




#endif /* SSEG_DRIVER_H_ */
