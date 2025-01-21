# nspire-image
Basic 36 color image renderer for ti nspire API > 2.3
I made this bcus I wanted to send image data through serial, but the Nspire's API only supports serial above 2.7 and the offical image renderer via string is only available up to 2.3
My goal was to make it render an X*X image with AxA squares that could be easily sent via serial and parsed by the calc

# Images
<table>
<tr>
<td width="50%">
<img src="https://github.com/user-attachments/assets/21ac26ef-afbb-4bc2-b298-5a191c6e6a41" alt="60x60 (3px/sqr) Render">
</td>
<td width="50%">
<img src="https://github.com/user-attachments/assets/66c4ba82-e26c-4606-97b4-3d84dd7d6187" alt="Original Image">
</table>

# How does it work?
The python script (used as example) takes in an image, resizes it to a square and lowers it down into the requested X*X pixels. Next the program converts the closes color match into a character from 0-9 or a-z
This can additionally support more 26 colors (A-Z) but I didn't feel the need to implement that yet
Example string given in tns file (60x60):
```
String length: 4900
Result string:
0000000cczc00cv0000000rcczzttquuvczvuuvvwkkkkkkkkkbcccuuuuuuuuuuuuuuut000000rcc1cr0zv0000000000rzzt0uvzcuuuuclkkkkwbbzzzzzzzcuulcccluuuuuuqq0000000vczcrvzzvv0000000000zc0tuuuuuuuvwkkkbcczzzzzzzzzbbbwwwbbbluuuuu000000rczzzrccr1c0000000000cz00vuuuuucckkbccccczzzzzzzzwkkkkkkkkwvuuuu0000000rcvvr0vrr00000000000vz00ruuuuuvvwbzzccccczzzzzzzzwkkkkkkkl0cuuu00000000czv0vzcvc0000000000zc000quuuuvtzzzzzzzzzzzzzzzzzzkkkkkkkl0cuuu0000000rzzr0vzvzv000000000cz0000tuuuuvczzzzzczzzzzzzzzzzzbkkkkkw9vuuuu000000rzzzc0vzz1v0000000rczr0r000vvuuzzzzzzcczzzzzzzzzzzzzkkkkklvluuuu0000000ccrv0rvzcv000000czc00rt0000vuczzzzzvvzzzzzzzzzzccczbkkkwvcuuuuu000000rvvcv00rvv0000000czvvvv0000rczbwbzzvqccczzzzczzzzcccbkkklcuququu000000rcz1zrrzzzc0000000vzvvvcr0rvvbkkbzzvtvqqvczczzzzzzcczkkwvvvzccqu000000rcc1z0cccvz0000000rzvvucvvvqcwkkkzzzcqvqqtvvczzzczzczwkcvvvzczuu000000rzz1z0czccc00000vczcuuuuuccvccwkwcl9zzvqqqqqtvzzczzzzplc111zctqt000000rccccr0v0vr00000v1cqvuqulzzzzcvbc9999cc9qqqqqqccczzzzlvvuvv1ctqu0000000cvzc000000000000v1vuuuczzzzzzcvqq999q9999qqqqqqzzzzcrvuuqzctuuu000000rcc1cr000000000000zzuuczzzzzzz1cqqqqllll9qlzzccvzzzzvvuuuuvvcuuu0000000vczcr000000000000v1uczzzzzzzz11zctqllllllllcccczzzzccuuuuuczccc000000rczzzr000000000000rzvczzzzzzz11111vqlllllll99qlwbzzzzcuuuuuvc1zv0000000rvvvr0000000000000zvrbwbzzz1111111vvllllll99lbkbzzzzzcuuvv0cctt00000000cc00000000000000rzv0cwbzzzz1111111z9llllvqvclwkzzzzcrvvr00000t000vv000cc00000000000000cz00cwbzzzvqvccvtvzvq9vvqqccrvbzzzzrr000000r0t0rc1c000vv0000000rv0000vzv00vcczzvvqtqv000v9qc1zzzzzc0vzcczz1zt00rrr0tzzczr000vv0000r00v1zcczzv000000zzvvtqvv000vq9cc11zzzzcccvzzvrzz00rrczzluuz0rv0000000cc0rzrvvv00000000rvrzccv0000vvvr0czzzzzzzc1c00001cccccrvquicvzc000000tzcccv000000000vv000rzzzllccckv00rzzzzzzzczz00000v1c1c000uulzczv000000cc0vv000000000vzzv00vzzbbbwwjucv0czzzzzzzz1v000000v0cv000uuuuuzv00000vzr0000000000rczzzzr0czbwjuukkwbwrzzzzvzzczz00000000000000uuuuucc0000vzv0000000vr0rcuccczcczbkwkukwwkbkczzcqtqcczc00000000000000uuuuuuzcvvzzv0000000vz1zzvcccccczbkkkwkukkubkwzzcqqtzczv00000000000000qqqquuuizzv0000000000ccv1zcccccczwkkkkwuujuwkkwbzczzz00000000000000000uuuuuuuuuuvvr00000rvczcczqucccczwkkkkkkwkuubkkkbz1cvv0rvr00rvr000rvr00uuuuuuuuuuuuvvvvvvczcccvvvucccczwkkkkkkkwwbwkkkbzz000vzzzv0czzcvrzccv0uuuuuuuuuuuuczzzzczcccccvzcvcvcczbkkkkkkkkkkkkkb1c000rzzzv0z1z1vrzzzr0uuuuuuuuucz11zyyyz11zcccuqz1ccccczbkkkkkkkkkkkkb1c0000czzr0czcz0r1zzcrqquuuuucz1yooooooooy1cccqzzvczczbkwbwkkkkkkkkkkb1c0000zczv0czccvrczzzvqquuuuz1yooooooooooozzcccccwbwwwkkkkbbwkkkkkkkkbzc0000vcv00r0vrr0rvvr0uuuuuz1oooooooooooooyzlbwkkkkkkkkkkkkkbbbbbbwbbbzz000rc1zr0vzzz00czzc0uuuuzzoooooooooooooozblkkkkkkkkkkkkkwwkkwwwbbzccc1v00vcvcc0czczvvccvcvuuuz1ooooooooooooooo1wkkkkkkkkkkkkkkkwwwwkkkkbccczzr000vzv0zzcccrzzvzrcqc1oooooooooooooooyzllkkkkkkkkkkkkkkkkkwwwkkkbccz1v000cv00vvrcr0v0vv0yczoooooooooooooooc1wlkkkkkkkkkkkkkkkkkkkkkkkkkbzzv000vccr0rzrv0rcczcrozfooooooooooooooo1bllllkkkkkkkkkkkkkkkkwkkkkkkkhz000vzzzc0zzvzvrcz1zrooooooooooooooooc1zlllllkkkkkkkkkkkkkwwkkkkkkkkkk1zr0cccrz0cczc0rczczroooooooooooooooz1bllllllkkkkkkkkkkwwkkkkkkkkkkkkkzc00vzvcc0vzzzvrzzzzroooooooooooofz1zvqlllllllkkkkkkkkkkkkkkkkkkkkkkkhc000r0rcr00rv00rvcvcroooooooffyzz1zkq0rlllllllkkkkkkkkkkkkkkkkkkkkkkwzr00rcvzczvcrrcr0vzvcrooooooyzz111cuuuutvlllllllkkkkkkkkkkkkkkkkkkkkkbc000rzvvvzvcv0cvr1zzcroooooooooofyz1zcuurlllllllkkkkkkkkkkkkkkkkkkkkkhv000rc00zv0czv000zrzr0ooooooooooooooy11zrtlllllllkkkkkkkkkwkkkkkkkkkkzr000rc0rc000zc00rvvc00oooooooooooooooof11cqlllllllkkkkkwzzzzbbkkkkkkkzr0000r00r0000000000000ooooooooooooooooooc1zllllllllkkkbzv00rvcbkkkkkkzv00000000000czzr000000oooooooooooooooosuuuz1cllllllllbc0000000cbkkkkkbz00000000000v0cc000000ooooooooooooossuuuuuuc1cllllllbc000000000cbkkkkkbzcc000000000vzr000000oooooooooossuuuuuuuuuuc1bllllwz00v0vcvv00rzkkkkkkwhz000000000r00000000oooooooooooooooosssuuuuc1cqllzr00cczzzc000cbkkkkkkzvr000000vcccr000000ooooooooooooooooooooosuuc1vqcc000vvzczc000vbkkkkkkb1v000000vczv0000000oooooooooooyfooooooooooosc1rcv000ccczzc0000zkkkkkkkz00000000zv00000000oooooooooooycooooooooooooszzc0000vzzzzc0000cwlkkkkwz00000000czv0000000oooooooooooccooooooofoooooo1c000rczzzzc0000cblkkkwcz000000000vv0000000oooooooooofvcfoooooffocfoooyv0000r0rvrr0000vblccvr0zr00000000000000000oooooooooocqqcooooooyoffoooyv0000vvvzcv0000vcrr00rvzc0000tv0000000000roooooooooocqtcfooooofyyoooozr0000cvvzcv0000vc00vcccczcrvvzcrzr00000crvooooooooofvqqqcooooooyooooozr0000cvczccr000vcrvcuuuuuzzzzzzz1c00000zzzooooooooocqqvvcycfcooooooooz00000rvvcvv0000vzcluuuuuuuuuuucuuzcvrrvzuqoooooooofvtqqqqzfcfffooooooz00000cccccz0000vcuuuuuuuuuuuuuuuuuizzzzvuuoooooooocqqqqqtvyooooooooooz00000vvccvc0000vcuuuuuuuuuuuuuuuuuuuuuutuuooooooofvqqqqqqtcfoooofooooz000000000000000vcuuuuuuuuuuuuuquuuuuuuuutuooooooocqqqqqqqqqcfoooffoofzr0000ccczzv0000vcuuuuuuuuuuuuuquuuuuuuuuqtoooooocqqvvvvqqqqqcooofffzzc000000rcv000000vcuuuuuuuuuuuuuuquuuuuuuuuqooooocvtqqqqqqqqqqqcooffyv00000000vc0000000ccuuuuuuuuuuuuuuquuuuuuuuuu
```

### leave a star if you enjoyed!
