Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9Sm-00053y-PV
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:45:56 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so871094fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cMOAxejuqXH8xsqG9fjNc8uFgwpOWR2rPHQYkwGJm3M=;
	b=mJa7mQtnfL8+Iw/qOiv+rjBFQse0cB7f5iC4xiQs6LFEDQlxiJT+4D3KOLRUl8XhAW
	CEdn1bADGrE85glA/ABnDbgCAAPcz3NmPnt5tzGxa5epoWr3KG+7Il85UL+MzhJFyHax
	higSplPBNUcZP5zyy/QvORHgpbvQgUPH39fLM=
Received: by 10.223.6.91 with SMTP id 27mr465202fay.146.1314891663290;
	Thu, 01 Sep 2011 08:41:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w20sm125129fah.27.2011.09.01.08.41.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:41:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:39:11 +0200
Message-Id: <a71d95d852880cbf3cd910572e66f41d707f6c18.1314891222.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
References: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314891222.git.Martin.Jansa@gmail.com>
References: <cover.1314891222.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 04/10] linux: add some logo files from meta-zaurus
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Sep 2011 15:45:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../linux/files/qvga/logo_linux_clut224.ppm.bz2    |  Bin 0 -> 5547 bytes
 .../linux/files/vga/logo_linux_clut224.ppm.bz2     |  Bin 0 -> 6436 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kernel/linux/files/qvga/logo_linux_clut224.ppm.bz2
 create mode 100644 recipes-kernel/linux/files/vga/logo_linux_clut224.ppm.bz2

diff --git a/recipes-kernel/linux/files/qvga/logo_linux_clut224.ppm.bz2 b/recipes-kernel/linux/files/qvga/logo_linux_clut224.ppm.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..ddc39a3c64dfadcd18c3d3f4489378c59fd649cc
GIT binary patch
literal 5547
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
Sex#Cb>7?Lnq(&RAkNSUT^P|B4

literal 0
HcmV?d00001

diff --git a/recipes-kernel/linux/files/vga/logo_linux_clut224.ppm.bz2 b/recipes-kernel/linux/files/vga/logo_linux_clut224.ppm.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..c3aeaac1833469a6de74f75a77d655d600c5bd99
GIT binary patch
literal 6436
zcmXAtc{~%2|M+)fm|^atkz<=9WQ4GdF=v~z$W6_ergGQjrf66~lDR_e(1j$*eMONY
zX(&mB(DnZP`aV97$LsZYz5aVWUVpqEkJs}_@}L{(5>Kf)pF*{O3t)@gK1=|T0=z=i
zsF(qOR7(J800Rpv4&Klo7;J^aCCAk{=>GtR#HBF-)v{b<lIRKdSGe7uO%4y-9`dIk
zvpjzFDnXS0FE_FCS~88L{3*YnBUcYMoOtz|NBw{Q8&w=qa30v=Kmh=dSC)N6D_*B!
zyT~sAM{88k%#Mg;;q2%LHBDgjS<ia>!^b&`a}K?hYA6AS4F@T#KcPfX0@_gQEC2PA
zgY+ze|F-Vw?or;3Hx}r-$DNCFZO`_6-0<o1sZZ<|c3#M&Kkql;%M=Qv{1Cv~5>AUt
zRbUbc{f_y^1hT%C2EY40{6qakCH&WIzR-ieI|_z89Nr;MTcCf_e#RSEmnNQ6b@LSE
zdBx0q9HN$SLBJg>v=<*`->=aR*~2nU#yNX8Z{(vrNS!Nt4K~ctlU3F8BY7XjLrbKu
zJ9xImrH_e6_|<#z^pY<<SjceaE79s?ckpkY*;R|-cdw~_QxLL!WA>QT;}Dhf`O7EB
zt6hDPY`J5KDR!3xP0DPzTR#wh5U#wqI73_TT4Cy-LbiWOQ2P@cbWkM)sCYx|{-wd=
zDIIQQb?;(uw}xa^V9Oz9YE?A}xDSHga&7sxu8SMc$f{|YWI<_PRDpbOG|nR7{%hEB
zIJ*C%hVYEU+9~c(l*ZzRm)%yeK7Mkv*6JCxAuNf55o7XEMOt=4Y)_9kBo`@c?BjmZ
z+E28a(>d}SL9?ku^$FBn6^1JVIh|$v0KN?{?Ua509>F=fNjSP`IY_Ot7_?RrpQRJF
z9UOyC&)9_7hH+!!$G(0jI6#$X9q4=AyLUf|MZ%?(#a#ZTChyUFUkWgic*rNmQ9sB8
zZZMI4OF&OnL0IOph~t@6_ws(|^vz-b0h+CHwJ*6)B3(IQ_KYqy$aAk8a@8e1d~e`p
z+wqejg>czM>;u<Go9m-y$HF_^9H*4>9+iBqR;ld{s|f9bu`IYJ4Bm!!jamr>L_0<#
zlm<@>oK}3eJQIEGD<Uto+C1)PAU0$5(UNJfr|L!TFO4oS9#{e6Kc~czzsr8a1$WKK
z-#U4;rVkS<$K_214aSUwJ3KkdU0_PZi=FA%eL3-7F}nce!tt}r*^f+XxtC&%BKKp_
z%P%BR+GUOOA-AhU-5IJg?Q;)t4cg)rEV9~hZ>|nkO3z)Q?%-~L8^C$b+UnNG3|Bl{
z+mY)Yi3xG_8ZhE|64oR}BwAf<ixr})CZkM;abr0b)(dj#Fn1@a-}4n@m}tRiyK<@A
z?aTP9wR<Lj4F$??lhT(;hM*8Bv_)ik&_#aK9(4Lhvl(eiJa6i*uaCM@MubDpB@1d(
z-tp->v$cOy;+Z?<L8BVQ*V`>RtCs8*UH*HvM_Wq$C2E9SpG_)W)Bf8dK2YY|Ir3?p
zs<_e^g!(FWZ_&kFhqI465_L4-%wTg^^=Ppyh>f+%E8uK109Y)X#)X4YgJmIHStk`x
z0UIus8V{p5HE57HS8XSFN^C6+3g@t`K9|Db+Hx{U{~}C_Gkc5HVxTtgHoN9+L$dFz
z!9D-kj_S$gX+I~$4c91|$%J`Z^$eoz$VI6*yHTgVsb)hRbx(TUCU2$}rx#w=&uP8>
zwqiv6vAW)gi)#JGzw=5r?#5`x4|s<hc^YXQS@Bet_C^=Fex7_^)a&OW?%qcVc(OGG
zx|atMadXh2s2+SU8snNxLCvPKK6gtT|J*f$?DR6*Kiho6b~JpGqmo{ZRj%Pr_Pem<
zkGL;%IKP6u+WUP+Hp{Es%rx{<+cZDL+c$-8E_UsBzN&DqHc!isXS5J&ZqaoAU1VbE
zlIPZ;*y2_m%g#YvX)n4ydW&z;+Gg#0Jcz20O%4G^ZiqK`524cY$92B^sJYBGQfN0L
z#A}zCUH47QAGFx=H%S>aFiO|E5_sEp4f&aJ$KR~)t7pRV;+)otb#sovZj)v+uODSZ
z*=(5&{D%HkTFdxv@V9aQmH7Vl`1}QvJ~5BAuP^b@Moy;6TJ15vvmCCdb59u*%kvJI
z3pS<vxtjN%z~TNk&EB6izJ*x*EpIGew^D?T-M)D$gRV>}UhsGx{~&F@W1j1);>&qa
zjrS-F)eH{TEod#vkP&*faKG##l;C|A?0fMFkj2X*0S-<iCuMugioY@-u=~G|9dyiA
zmNdn37(xsI1Z6kP`BHn^=%ZU7`p~L>n9@mQ+AzJ$(-oP6G>z2$Av+BcqtQ99U{x>D
z8v8ug(NX+{m|Svbs7;UK)9{Jyi$W7b0SjkQBHkM&eE}@rvZhpy&C(Rlk;N2dlKHJb
z*TOrB4ybo3ef!RBoUG(!-nWMN3~|C~c&`uX>;awXDh-SHW#tA~OS@bEoyyZ}5751J
zSio>W883^^=gMCo^c{J<>Y~M3;%K*{x}SLmE7z{o9^T6oFRtn8Em!z(W;`%6%GP^*
zuPnOqw*M^`lZlEwi8b5CKt99SvdjJZrw?iQY}D~)oDk>plNwze0}Sl2xYKa%jnVqx
zbgXNmFvBvSXiTV<nj0Z$fcM0EOa<2x!p;bWdRV1Yq<6ndML~CskB=ypq?Ga!{p&J{
z%mfa|d-$QDWAg#CecxIvSI@~nzRRjwE)LEYPW@bLWsHY7`v|Y&=iNS-++H)4!G=^P
z!CkRxsyOV)qFQ=Y5;tEsO{VF``RC4dk{ylMVQHtLykbaMAt)v1@*iNN;p+Ua&_Byw
zO)J2d3cObRXIk`ts^}X<2mj+UkwI#O7LCncY&z_A`>gj9wwUZZk|#>#O5A5YibKBH
zYxA4(xmYF}!!D7wfa9p;Ha#jYB$ZPu>6so@%9XwSusnXcte8?71*gN-3uro_^YK6D
ztRHdf@sudu)q}oAut=*(mz!ep*&-JXju-q~4(-h^<FC_n@1~nQa5}=SON)r!>_n<C
zNfZseN5fsP7lm(c=}d-&Y3Q{VzwX1TO}oNgG!%Mj-Et_uVLLl-HH=|9`Fkl{T7cz3
zziCF<hqB^YxG{#qkub(o?-9|DG5PkYFB>o|=6ID^vEDZ6ans<D$7Nq8L4Uwv%75Q$
zN9`Y{H2S|QcVg#wrM%5-QDV`P3d(2cuI;2zuCi;<Ec7QSEw+U9JOyZf^@k;AyL37<
zRnefjqs6NmlAxcf*(@Yxk8O)yI|h9d5w=Ck>KH1&16t2bG*_Mo^I(*m_&fwZ-LFw!
zZon~6a^GcS+o+&nZkev5h0;N)zID)$fgdljax7ckyyjdn>?(_dgu?XBKK^eg;Y9J+
zY#s!yX<{l+RQJ(Wc5Z^}dhKKv{`A4oOjAIgr(6KB*W>U*dW>v|bLM%Uj*fg>Cc7p#
zu14*W#Ov2ae%S$Is0X2EUoDgV<WcK&=)<;ClRCp5K5G~am7!3BhGYByndD3W03`B9
z2+Z)3y*ig3-L>B-{$*(~+&*?|cmJVL*CuFh%4KKqi7VlhOq0Qdi}Uke4HL)QUJ~@S
zdLEpg*?%-K9@_GFw(HBJLi}~27-|<IhE!n{kzp)2QN0d=72vSoWK-we8H26=L@#Yd
zt$Ukmc7I(|2zo%@A&tuiESCCtBDDc4l2qT}H?da=gRQ#<JJ-5c?Dg7D!mM3*ijl>v
zq~M`=pvLW$_}JrJ>IRAg0C*wxviqTS+hfgIN<4I|(2Cgh;UAZhb({1PW6PD6vl0k2
ziBifD)MxTX(;qOY<o$eEkvqBC`TA%Dd16Evt4Sl_)Y25rc2k*n!a75e&oih?aMSot
z;&?*iAvue0=e1VUufc^xhh(c^&##l(NS|9*<}MDZ_#4rYXNTzlVMX(SC&gDL)V>4B
ze~1gFJ!+%b{WtfX`F%O*wgetL(|d<lh-&B?_TX(-H1NIIH(ePO_=AhH_|lnwLI)8q
z0u0ls-<=UKB}{ypTrRB>Ami7+C14)Gl=-4lpx7g-E6<cbqzc%pxj@L-*UEd-EaNY8
z8CsLQSz(}aSe*my<pjofbj_(Tw7lfWpU!U(_^dAQ*-~j=GyV3X9(ZK>sVv*|lHN24
zIUPU)@?&)A7${i2zQH&6@)$kwxk$gH-Hb`PL~Pb+vA7Ln_gcK<RF-KjDA)aR&-lss
z97^7`rjo$Tyidb4MAqCEukNm?^GD0VV!5YXo3A^7oQ&+k_q$SRS-%(-v6K4RRe+_y
zmw~Q&Qh9Avm<<NPX21xYM!D{%$LG|U!WEBAl|h^c>;<X(Mel(vkN+*^%zWY-5jP7&
zO=oNq2jyAjHWr^F<L3s9<H3=;*RDH~6gZo|z*I#h54fwZL8|>kGrKt<pFR<HqPtIF
zph(~mYN5gwiVh)`*|Y!3b7GHh5pR=KFfxE$aPHDb_ph723?&+rr;zmkL=~{3KmjJX
zrT`-lm1S2$<en}@BA)MJB4~$0vAT%6w&Dc+tWaY#TzV+QEiiY_cjre^8rN~)YOMn$
zd7yzf+t6`t<~9l01KNQ%hgKo7x*B4H`nC^UL(~mL23=-F?fg;>%6RO9;N#!e5r!~O
z9nw)_?-S^1GhKim8xo(r<7nWU@PWyE#;E2K{u*+IBE2U5LONA)s{WT(2Y#B5iAqm{
z70=+lAArW2zPiba_hj(%fX0>|pxQziN1T7SRH>r$Q97}Lh_!^q9oh}cz!`%>%3p+|
zUL3T%?R)D=wzPWC_dxCgvFPKZoO9X$Cj;(M-KSqv>l0^^*bS8O9&~Yg*Ce-~={~q&
zt9Gn-vK&}9*;`$7Z*wW*sI2iVLJssRUUX4J+WNggcVrfUce`E&R2dL>n0L<7QvtXa
z`+FmH=d`Tz)cO+Jq9uhpxn2V*$;kime&x+ms4}5p{6yLxy>A?gOI$?fab{xbh|v1-
zy_2rD#%_H?eghRT_fw6b9?;xr6z64(Lef)}$EwC&r)4x-zar#X;rY79{=0i@s5|KX
zQA3DOY1B&f==xF(tXh=wXVrAn_(YScr{l4FB>2~cuH^O_XZT`$v|VETf#Q(U&n1`O
zDilR^W_sgi|3!_XAN_{AcRss*V}`-czj=lA2!3$tjA+n}z^^9~_1Aud{5f4ptaWwZ
zvL3{4eL5#)gLCx}&bC43Hkn$!jEP>_l1F}hLB5egqn!N`4}r@fdoA+HsIbcE%voQi
zhghoavsY!W8tCLo@;7^kIxq-&5vOGJp#Ufh$_BxCNqx<|?B2&r07JrM&{duzI$*8h
z!nHutbjpcz0^PNog$00BEdhE+6tc=?5P-)qwRup$TS8U^Nsxj83xKu&)CGhCKegKW
zaYANMPnbT+ojkUqJw^!(D!`n#RIH>*ZQ23{<MJmt!LN6?4^yIcuK5UL|4a`fjWDC?
zQgyD`%qckXF0)OJyqZneUc1@K0}mp4F5h5C{Kd{%FZMWiDUB{~BUd4nl;0&2$+eZv
zha*e&j#OT;-EjR2xWv$d;`ten{iFH6kW;z4=9MN+3haL`1;sSkqt8%aWQ-!0tLPI7
z*yX3*W+Ut#A_lrRiqir$_#?@>m_3BXhM4<q=6)oVcOA_j3|<7GxVzUU_~WFUn2P4U
zpeZVA&Yr_17@_5~`N|fkB4rZd6YwG7p-Z)bOMjURpBgrM6O5K6Zkigz2}E_52@@jR
zIGdNGn)h558b3r0`b;25X8GqIPIKqt`Ot=fyC=#`Bn&We5N-3gWcE=bIzs}$!zBVP
zAuBCDk~cE~P1tzBkBYX%>_fH!gS3ToB_p&*C14?G+mb;B$Mv{g$fY=2%rgFuR8r}-
zmT)nS2eFD!>0FD=V-4z|L`da<pb5ZK8Hy>F3swR<X|SC1VXJ&-Yqk*%W_xv(dQn`I
zX5pgG5r*n>pjd*l9ccok4;3WZI&s<>pkRX26ekr(nj`>Haa3WzlokdBm`E0eQ$W`%
zg<;=`0O5g*ZC5ci)Kr;I72q;}T>6e&a^fa%#ak?E>KLa1XSJtgQfDiMTTfnfKhoJ$
zy?tL4YVEJZuTIdI%~(G3Z`ZmKwo5QHeiPzz_edqpi*VpqN!wK&QCMq3b)^7yS&jb6
z8>U6W_jk7-X1SJA)uV0)9N|4>90qm<Dq|2-R0fZHDaj%=_D&!nfWHy|BJEg)4h=#J
zkIGHG6B=?QdSSFsJtC%|aQ-oPkG;8PH*tsj+>d)XC>4g20R{zyD^|46JKbvxrNRea
zFP!>k1opZ{wLg4!6A0*Rda^q-I`3kD)1X{0yBK0ac@wpDc5<mu;#1!_t43(eG>l}P
z@*DB&ZSu!$#&2Tiv(Y3N&!HDHmBFAQh7|G{cSzV-f)Or6{Ee!}RA)-C9#puwEPch%
zVZ3{3=WSwO9ELib7;)t6VdM2rfBD{M%_&STs*h{eG;TaeuM3cPY8su_7;tUp<)Muq
z^F>b^mhd^1hDLzyr*@yHzX+R<S^Rg4IX4<QyWi_^lao(JrfuA++TUIG_^$=#Z1bdQ
zG7|##{wA{>OAtXm0RH#APu}`ea@#i<j%JVg>H)dIo+KoawsGgS9Bit3PR2#6ev(`F
z`ANR2FT7|_Z|xvWPzj*V(u0U)*=VL{4%Mp&-4j$ftV|M+e6Cl$2;<f<0pZV;YPrhF
zQ!(T>?N56%Fu#4Ue1nm8RVa7g>o0ac`v=Ann!7EJsv3g{VJaW)l2Af&7xzk%$kSrU
zE>h=x+Rj~Cc#S%)^tQmsp-RIntedaL($}2nb^`#YBBcNbRd8Yz5{Z?yMv1ajfV%b)
zx-@$*R7VsJV`7jPTXH287%WSIu;r1cuW$qbHpP!&GLx_}0tHx%a_*Lqmz!Ren=@z#
zgO*iN$#@SFPgj7|C8MW}=qdhc0$Il;Ma4V&nlgGplmwfUs=vM@+dEj<aHPVBk4lbE
zT6ubovlZldkz;`GK(Eo6vSTvotQ)Km>GU(wB_sOCj(TB1yo0I@Yw}fQ1#&?y(81Db
zMPR9UQs?aj<>g}10JT5c4)P4Gp@K%$OhScJ(M}C;C0i_Eic2_5$)sR7xFjBkcbJ0k
zVoA6d0m{k(%L8$NW!K9r$-E3eQDzeQu1cDOy9y8k;fe~Oxz2SpHx<b=`>eX0{#ZU=
zrW~6uuQ-_nib08sp@>%J3Az$sAf$&=EE;4<?m>}#Bb7n6%{0rGl1eaE#w`@e-o^rj
z79|4tpgMHI4R)}<XfU9xl7zb9LaeH?EW#!M;j{w$ljBSP-?->h!u})UAKP9cFMaqg
zc;TakD&W+S)#F7ckyR(%k=}_iDydbCzH_aco>F?3`DO)+z1~i1O6e|E=RHWQ$GKCY
z5~hC_o-=GL=n){+aMLItzhE~wM;dKq<5Wvh%7YO?#8@F2=xrc28BQPxxVU8cSNjtA
zopeS2=?u_>i)9ZO3!&&p?&E*YzqxU6lpW{^-rhQyA`dW3dQUZDN0@%UfbMD5_hi-f
z2#w4sL2CH``pj_PYIhY%eX*V1xQ0LD>nc0?ak_XbzzGLuy0I`3JYneB{VyKxo1%-A
zI}!W=ny70T{rD{ZA`l8Fp*$r>u~L?XL25|)c_~C9pcUXmv$0I^?M-I4-T!BOAcUiu
zwrWBwc9pP*7_t<*QR3jqYCs<7TfKLEC;W%2cbT6V!){wohA@9}3%+=BKNxI7)9(@v
zE)IV2Lsa%d$$-){ZSPXIM~#W2n+z&X`A)X?Tyx_b4qdK{GKh#uc!wWYYm>20qSo8z
zE_3wg<Qjf{oRihR6IAu9X3G-Aa$O;yq#zqNKv@-k9tT4p6EGe!C&^GK<c7~<ud$t&
z?}o;+l~88q_RVFw#W7!~n8mhaG+I5m1}Ye7#(P!e!#XQY<Tpx^LCb<P)RJGf7o6L4
zN9V}zMbxFg=g&CA_tgD$`^QL%F@)ty$5tjuUuyK>sRG_vO*|A6lVb9@I3}l0A9B7;
z*w~fNI(ZA6`_r6xDB&*YMZ63VtejT7gSvbP|0!Z06T*vZkRF}yuIu(ee`EI|pQ9<1
z9tf+&3@si>{s{T0GV@P{xK=sxP=~L%Th*3Ujz24ST5dhs1Db@y0&B#Y{hU}(49Wva
z9YE?Kg8?2ARY1CjXq6ZXRY{}=qaZtm^CR1d?m!jf{iF=c<h_*~{@9;(2z5wV`OU`E
z9MVutsuC%`MKUQq==O}h$x|tx^CLI5)`Ft$Ip$e}t7x2o&dex|3>RH4I*Jzn2(q}s
zU~Ri?^#M;8l=Mjc**t#PJ!y;aW5$vCL1L}O*BCAKL;b_c=4X7_YP&EOi&cb(<#y-u
z_aD_V5kk^JD91yAzK?`HSb-)cgNRvCy2X=UaDH_D{`xFU`PXN@PS#y})U*0v5T23&
zfbfg8a<LdlD^MkiK)LfjhBaJ%nMw#>2>!>gAOZvc7wRdlF03J`OYmFH{;%wyB=Umr
uY^LIGDr~}@2>=4oAOIvO55$RZVP|8NWSmHbwiGKV2KgA3ZL%dV^8W!6K}L4~

literal 0
HcmV?d00001

-- 
1.7.6.1



