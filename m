Subject: [meta-networking] This version of TShark was not built with support for capturing packets
To: openembedded-devel@lists.openembedded.org
From: qaz79462008@gmail.com
X-Originating-Location: Taipei, Taipei City, TW (175.98.141.254)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 08 May 2020 01:27:53 -0700
Message-ID: <edvX.1588926473120380747.XE0J@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="oDFkbHfj9cJCTWGpMQQ9"

--oDFkbHfj9cJCTWGpMQQ9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I build my Yocto with wireshark_1.12.4.bb ( https://git.congatec.com/yocto/=
meta-openembedded/blob/fido/meta-networking/recipes-support/wireshark/wires=
hark_1.12.4.bb )
put it on my machine and run tshark, it shows "tshark: This version of TSh=
ark was not built with support for capturing packets."
one line of the recipe *EXTRA_OECONF +=3D "--with-qt=3Dno --enable-usr-loc=
al=3Dno --enable-tshark --with-pcap=3Dno --enable-pcap-ng-default"

* So does this mean that I have tshark enable?
How should I modify the recipe?
Thanks

--oDFkbHfj9cJCTWGpMQQ9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I build my Yocto with <a href=3D"https://git.congatec.com/yocto/meta-openem=
bedded/blob/fido/meta-networking/recipes-support/wireshark/wireshark_1.12.4=
.bb" target=3D"_blank" rel=3D"noopener">wireshark_1.12.4.bb</a><br />put it=
 on my machine and run tshark, it shows "tshark: This version of TShark was=
 not built with support for capturing packets."<br />one line of the recipe=
&nbsp;<strong>EXTRA_OECONF +=3D "--with-qt=3Dno --enable-usr-local=3Dno --e=
nable-tshark --with-pcap=3Dno --enable-pcap-ng-default"<br /><br /></strong=
>So does this mean that I have tshark enable?<br />How should I modify the =
recipe?<br />Thanks<br />

--oDFkbHfj9cJCTWGpMQQ9--
