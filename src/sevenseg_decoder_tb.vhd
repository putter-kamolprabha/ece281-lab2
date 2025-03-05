----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Putter Kamolprabha
-- 
-- Create Date: 02/24/2025 08:30:55 AM
-- Design Name: Lab 2 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: Lab 2 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is
    component sevenseg_decoder is 
        Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component; 
    
    signal w_sw : STD_LOGIC_VECTOR(3 DOWNTO 0) := (others => '0');
    signal w_seg : STD_LOGIC_VECTOR(6 DOWNTO 0);

begin
    sevenseg_decoder_inst : sevenseg_decoder PORT MAP (
        i_Hex => w_sw,
        o_seg_n => w_seg
    );
    
    test_process : process 
    begin
         w_sw <= x"0"; wait for 10 ns;
         assert NOT w_seg = "0111111" report "Error on 0" SEVERITY FAILURE; --flipped
         w_sw <= x"1"; wait for 10 ns;
         assert NOT w_seg = "0000110" report "Error on 1" SEVERITY FAILURE;
         w_sw <= x"2"; wait for 10 ns;
         assert NOT w_seg = "1011011" report "Error on 2" SEVERITY FAILURE;
         w_sw <= x"3"; wait for 10 ns;
         assert NOT w_seg = "1001111" report "Error on 3" SEVERITY FAILURE;
         w_sw <= x"4"; wait for 10 ns;
         assert NOT w_seg = "1100110" report "Error on 4" SEVERITY FAILURE;
         w_sw <= x"5"; wait for 10 ns;
         assert NOT w_seg = "1101101" report "Error on 5" SEVERITY FAILURE;
         w_sw <= x"6"; wait for 10 ns;
         assert NOT w_seg = "1111101" report "Error on 6" SEVERITY FAILURE;
         w_sw <= x"7"; wait for 10 ns;
         assert NOT w_seg = "0000111" report "Error on 7" SEVERITY FAILURE;
         w_sw <= x"8"; wait for 10 ns;
         assert NOT w_seg = "1111111" report "Error on 8" SEVERITY FAILURE;
         w_sw <= x"9"; wait for 10 ns;
         assert NOT w_seg = "1101111" report "Error on 9" SEVERITY FAILURE;
         w_sw <= x"A"; wait for 10 ns;
         assert NOT w_seg = "1110111" report "Error on A" SEVERITY FAILURE;
         w_sw <= x"B"; wait for 10 ns;
         assert NOT w_seg = "1111100" report "Error on B" SEVERITY FAILURE;
         w_sw <= x"C"; wait for 10 ns;
         assert NOT w_seg = "1011000" report "Error on C" SEVERITY FAILURE;
         w_sw <= x"D"; wait for 10 ns;
         assert NOT w_seg = "1011110" report "Error on D" SEVERITY FAILURE;
         w_sw <= x"E"; wait for 10 ns;
         assert NOT w_seg = "1111001" report "Error on E" SEVERITY FAILURE;
         w_sw <= x"F"; wait for 10 ns;
         assert NOT w_seg = "1110001" report "Error on F" SEVERITY FAILURE;
        
         wait; 
    end process test_process;


end Behavioral;