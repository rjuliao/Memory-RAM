library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
---------------------------

entity RAM is
generic(
	-- Define two constants
	dim: integer := 256;
	bdim: integer := 8
);
port(
	reowr:    in std_logic;
	enable:   in std_logic;
	dir:      in std_logic_vector (bdim-1 downto 0);
	datain:   in std_logic_vector (bdim-1 downto 0);
	dataout:  buffer std_logic_vector (bdim-1 downto 0);
	hexaDis0: out std_logic_vector (6 downto 0);  --Seven segment display no 0
	hexaDis1: out std_logic_vector (6 downto 0);  --Seven segment display no 1
	hexaDis2: out std_logic_vector (6 downto 0);  --Seven segment display no 2
	hexaDis3: out std_logic_vector (6 downto 0);  --Seven segment display no 3
	hexaDis4: out std_logic_vector (6 downto 0);  --Seven segment display no 4
	hexaDis5: out std_logic_vector (6 downto 0)  --Seven segment display no 5
);
end RAM;
----------------------------------------------


architecture behaviorRAM of RAM is
	type ram_v is array (0 to dim - 1) of
		std_logic_vector (bdim-1 downto 0);
	signal temp_ram: ram_v;
begin
-- The process of the RAM
process(reowr, enable, dir, datain)
	begin
		if enable = '1' then
			if reowr = '0' then
			-- if reowr is 0, the RAM read
				dataout <= temp_ram(conv_integer(dir));
				
				case dataout(7 downto 4) is
												--  6543210
					when "0000" => hexaDis4 <= "1000000"; --0
					when "0001" => hexaDis4 <= "1111001"; --1
					when "0010" => hexaDis4 <= "0100100"; --2
					when "0011" => hexaDis4 <= "0110000"; --3
					when "0100" => hexaDis4 <= "0011001"; --4
					when "0101" => hexaDis4 <= "0010010"; --5
					when "0110" => hexaDis4 <= "0000010"; --6
					when "0111" => hexaDis4 <= "1111000"; --7
					when "1000" => hexaDis4 <= "0000000"; --8
					when "1001" => hexaDis4 <= "0010000"; --9
					when "1010" => hexaDis4 <= "0001000"; --10/A
					when "1011" => hexaDis4 <= "0000011"; --11/B/b
					when "1100" => hexaDis4 <= "1000110"; --12/C
					when "1101"z => hexaDis4 <= "0100001"; --13/D/d
					when "1110" => hexaDis4 <= "0000110"; --14/E
					when "1111" => hexaDis4 <= "0001110"; --15/F
					when others => hexaDis4 <= "0111111"; -- -
				end case;
			
				case dataout(3 downto 0) is
												--  6543210
					when "0000" => hexaDis5 <= "1000000"; --0
					when "0001" => hexaDis5 <= "1111001"; --1
					when "0010" => hexaDis5 <= "0100100"; --2
					when "0011" => hexaDis5 <= "0110000"; --3
					when "0100" => hexaDis5 <= "0011001"; --4
					when "0101" => hexaDis5 <= "0010010"; --5
					when "0110" => hexaDis5 <= "0000010"; --6
					when "0111" => hexaDis5 <= "1111000"; --7
					when "1000" => hexaDis5 <= "0000000"; --8
					when "1001" => hexaDis5 <= "0010000"; --9
					when "1010" => hexaDis5 <= "0001000"; --10/A
					when "1011" => hexaDis5 <= "0000011"; --11/B/b
					when "1100" => hexaDis5 <= "1000110"; --12/C
					when "1101" => hexaDis5 <= "0100001"; --13/D/d
					when "1110" => hexaDis5 <= "0000110"; --14/E
					when "1111" => hexaDis5 <= "0001110"; --15/F
				   when others => hexaDis5 <= "0111111"; -- -
				end case;
				--Put the SSD of the datain in nothing
				hexaDis2 <= "0111111";
				hexaDis3 <= "0111111";
			else
				-- if reowr is 1, the RAM write
				temp_ram(conv_integer(dir)) <= datain;
				
				--Put the SSD of the dataout in nothing
				hexaDis4 <= "0111111";
				hexaDis5 <= "0111111";
				
				case datain(7 downto 4) is
												--  6543210
					when "0000" => hexaDis2 <= "1000000"; --0
					when "0001" => hexaDis2 <= "1111001"; --1
					when "0010" => hexaDis2 <= "0100100"; --2
					when "0011" => hexaDis2 <= "0110000"; --3
					when "0100" => hexaDis2 <= "0011001"; --4
					when "0101" => hexaDis2 <= "0010010"; --5
					when "0110" => hexaDis2 <= "0000010"; --6
					when "0111" => hexaDis2 <= "1111000"; --7
					when "1000" => hexaDis2 <= "0000000"; --8
					when "1001" => hexaDis2 <= "0010000"; --9
					when "1010" => hexaDis2 <= "0001000"; --10/A
					when "1011" => hexaDis2 <= "0000011"; --11/B/b
					when "1100" => hexaDis2 <= "1000110"; --12/C
					when "1101" => hexaDis2 <= "0100001"; --13/D/d
					when "1110" => hexaDis2 <= "0000110"; --14/E
					when "1111" => hexaDis2 <= "0001110"; --15/F
					when others => hexaDis2 <= "0111111"; -- -
				end case;
			
				case datain(3 downto 0) is
												--  6543210
					when "0000" => hexaDis3 <= "1000000"; --0
					when "0001" => hexaDis3 <= "1111001"; --1
					when "0010" => hexaDis3 <= "0100100"; --2
					when "0011" => hexaDis3 <= "0110000"; --3
					when "0100" => hexaDis3 <= "0011001"; --4
					when "0101" => hexaDis3 <= "0010010"; --5
					when "0110" => hexaDis3 <= "0000010"; --6
					when "0111" => hexaDis3 <= "1111000"; --7
					when "1000" => hexaDis3 <= "0000000"; --8
					when "1001" => hexaDis3 <= "0010000"; --9
					when "1010" => hexaDis3 <= "0001000"; --10/A
					when "1011" => hexaDis3 <= "0000011"; --11/B/b
					when "1100" => hexaDis3 <= "1000110"; --12/C
					when "1101" => hexaDis3 <= "0100001"; --13/D/d
					when "1110" => hexaDis3 <= "0000110"; --14/E
					when "1111" => hexaDis3 <= "0001110"; --15/F
					when others => hexaDis3 <= "0111111"; -- -
				end case;
				
			end if;
			
		else
		--Clear the RAM
			for i in 0 to (dim - 1) loop
				temp_ram(i) <= "00000000";
			end loop;
		end if;

		case dir(7 downto 4) is
												--  6543210
				when "0000" => hexaDis0 <= "1000000"; --0
				when "0001" => hexaDis0 <= "1111001"; --1
				when "0010" => hexaDis0 <= "0100100"; --2
				when "0011" => hexaDis0 <= "0110000"; --3
				when "0100" => hexaDis0 <= "0011001"; --4
				when "0101" => hexaDis0 <= "0010010"; --5
				when "0110" => hexaDis0 <= "0000010"; --6
				when "0111" => hexaDis0 <= "1111000"; --7
				when "1000" => hexaDis0 <= "0000000"; --8
				when "1001" => hexaDis0 <= "0010000"; --9
				when "1010" => hexaDis0 <= "0001000"; --10/A
				when "1011" => hexaDis0 <= "0000011"; --11/B/b
				when "1100" => hexaDis0 <= "1000110"; --12/C
				when "1101" => hexaDis0 <= "0100001"; --13/D/d
				when "1110" => hexaDis0 <= "0000110"; --14/E
				when "1111" => hexaDis0 <= "0001110"; --15/F
				when others => hexaDis0 <= "0111111"; -- -
			end case;
			
		case dir(3 downto 0) is
												--  6543210
			when "0000" => hexaDis1 <= "1000000"; --0
			when "0001" => hexaDis1 <= "1111001"; --1
			when "0010" => hexaDis1 <= "0100100"; --2
			when "0011" => hexaDis1 <= "0110000"; --3
			when "0100" => hexaDis1 <= "0011001"; --4
			when "0101" => hexaDis1 <= "0010010"; --5
			when "0110" => hexaDis1 <= "0000010"; --6
			when "0111" => hexaDis1 <= "1111000"; --7
			when "1000" => hexaDis1 <= "0000000"; --8
			when "1001" => hexaDis1 <= "0010000"; --9
			when "1010" => hexaDis1 <= "0001000"; --10/A
			when "1011" => hexaDis1 <= "0000011"; --11/B/b
			when "1100" => hexaDis1 <= "1000110"; --12/C
			when "1101" => hexaDis1 <= "0100001"; --13/D/d
			when "1110" => hexaDis1 <= "0000110"; --14/E
			when "1111" => hexaDis1 <= "0001110"; --15/F
			when others => hexaDis1 <= "0111111"; -- -
		end case;
			
		
	end process;
end behaviorRAM;