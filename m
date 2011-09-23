Received: from nm6-vm1.bullet.mail.ne1.yahoo.com ([98.138.91.71])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <juhsis@yahoo.com>) id 1R71QP-0008IA-Sx
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 10:48:02 +0200
Received: from [98.138.90.50] by nm6.bullet.mail.ne1.yahoo.com with NNFMP;
	23 Sep 2011 08:39:50 -0000
Received: from [98.138.87.12] by tm3.bullet.mail.ne1.yahoo.com with NNFMP;
	23 Sep 2011 08:39:50 -0000
Received: from [127.0.0.1] by omp1012.mail.ne1.yahoo.com with NNFMP;
	23 Sep 2011 08:39:49 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 998797.82594.bm@omp1012.mail.ne1.yahoo.com
Received: (qmail 13987 invoked by uid 60001); 23 Sep 2011 08:39:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1316767189; bh=sXugwvhiSxS75W0LVOBwoKw6LELT+IzVMp+6FdmqpVw=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=Lxc1fdnv+wKEtQ13JCljepEr8ADzGOGkqw0AODcWEJPwljkcZIzJEdPGTqFVUPhJGfveJR2WUiUNobp3sW+jbYIZvDKVlJvHoZFZuGCt752OHdB8S9PhhKlQT2kF/n/n2Pf/i22qPwqGsI9fAs87S1DwSm/cA9R3Ah8+CpxugGs=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=vf+EsK9fw3Zbj6kE84750Tv7JXhTDIpihn94RBDJEuaGAIgYXS8OM1UfX/ZBF5D3MuVVswbPWKSkRqSIuf2FwXPDlMc31R1wpGK/f6APbzBLORCUeemxkkVHAqrzwvzsa0mNVsjoa5LU8cE1+eyx/QGM31nrEDNOI9VKo/9dr2M=;
X-YMail-OSG: iJM44iwVM1mkWSHAYzfA0M8dgrjqoy8rJ7ZXRxilfjg9iHc
	DxxAigpMQFBv6n6HKtu3lem6zj5JPMMRyfphwhZ.SR98I1A.3EYZtQxRvjzW
	hzgLJ9yIymIz_jr35MzCmO6SAWc4ni_FssT.VKOIRMiqff3YW3xLfKBrTAwS
	oQS3b.PHBNXJzgO0txszr7JUwKAQh4Kg.S5ilA9W_Wu9eTdwMkchS2sQtFpJ
	OysqTCWCWn9ISh_peKNH_QkyhGtRBwClkSgXqm3n6nAk_z5M8EjDpvq9eH0X
	o1AqBBXAr.OEA4ghGkDX8ckOn4rv994moRVRDWyGffUdDQsLQjSsVIvDez8l
	0heIIRy7nVaDggG7RrHMz_iecujnGn3yQCqIBT0qVW2XxcnxR_UM80JyB8OB
	8fmWZqrM79TjNKEQ0muuYO5rgb1NTciqcSWeZoTkE5t5IzWhtJIdYhojZPI3
	8fxtgErz5o86I8lXkF3GcuPnK
Received: from [95.9.177.49] by web121504.mail.ne1.yahoo.com via HTTP;
	Fri, 23 Sep 2011 01:39:49 PDT
X-Mailer: YahooMailWebService/0.8.114.317681
Message-ID: <1316767189.9579.YahooMailNeo@web121504.mail.ne1.yahoo.com>
Date: Fri, 23 Sep 2011 01:39:49 -0700 (PDT)
From: ibrahim demir <juhsis@yahoo.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: ti_cgt_c6000_6.1.17_setup_linux_x86.bin error while installing ti-codec-engine
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
X-List-Received-Date: Fri, 23 Sep 2011 08:48:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Dear developers,

I have a problem at installing ti codec engine:&#65533;


(command i entered is: "# bitbake ti-codec-engine")
**************************************************************************=
*******************************

| make[2]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/base/drv'
| [DRV &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65=
533; ] ------- INCLUDES -----------------------------------
| [DRV &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65=
533; ] ------- DIRS ------------------ INCLUDE ------------
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/base/drv/_ds=
plink.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scrip=
ts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsp=
link-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530=
_0/INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/base/drv/_ds=
plink.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scrip=
ts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsp=
link-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/INCLUDE=
/DspBios/OMAP3530/internal &#65533;>/dev/null
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/base/drv/Dsp=
Bios/shm_drv.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setu=
p-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi=
/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/O=
MAP3530_0/INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/base/drv/Dsp=
Bios/shm_drv.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setu=
p-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi=
/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/=
INCLUDE/DspBios/OMAP3530/internal &#65533;>/dev/null
| make[2]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/base/drv'
| make[1]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/base'
| make -f Makefile -C pools &#65533; includes
| make[1]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/pools'
| [POOLS &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; ] =
------- INCLUDES -----------------------------------
| [POOLS &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; ] =
------- DIRS ------------------ INCLUDE ------------
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/pools/dsplin=
kpool.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scrip=
ts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsp=
link-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530=
_0/INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/pools/dsplin=
kpool.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scrip=
ts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsp=
link-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/INCLUDE=
/DspBios/OMAP3530/internal &#65533;>/dev/null
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/pools/_buf_p=
ool.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530_0=
/INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/pools/_buf_p=
ool.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/D=
spBios/OMAP3530/internal &#65533;>/dev/null
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/pools/DspBio=
s/_sma_pool.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup=
-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/=
ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OM=
AP3530_0/INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/pools/DspBio=
s/_sma_pool.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup=
-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/=
ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/I=
NCLUDE/DspBios/OMAP3530/internal &#65533;>/dev/null
| make[1]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/pools'
| make -f Makefile -C mpcs &#65533; includes
| make[1]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/mpcs'
| [MPCS &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#6=
5533;] ------- INCLUDES -----------------------------------
| [MPCS &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#6=
5533;] ------- DIRS ------------------ INCLUDE ------------
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/mpcs/_mpcs.h=
 /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/buil=
d/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_=
1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530_0/INCL=
UDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/mpcs/_mpcs.h=
 /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/buil=
d/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_=
1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBio=
s/OMAP3530/internal &#65533;>/dev/null
| make[1]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/mpcs'
| make -f Makefile -C mplist &#65533; includes
| make[1]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/mplist'
| [MPLIST &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533;] =
------- INCLUDES -----------------------------------
| [MPLIST &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533;] =
------- DIRS ------------------ INCLUDE ------------
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/mplist/_mpli=
st.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/=
build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplin=
k-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530_0/=
INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/mplist/_mpli=
st.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/=
build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplin=
k-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/Ds=
pBios/OMAP3530/internal &#65533;>/dev/null
| make[1]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/mplist'
| make -f Makefile -C msg &#65533; includes
| make[1]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/msg'
| [MQT &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65=
533; ] ------- INCLUDES -----------------------------------
| [MQT &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65=
533; ] ------- DIRS ------------------ INCLUDE ------------
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/msg/dsplinkm=
qt.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/=
build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplin=
k-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530_0/=
INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/msg/dsplinkm=
qt.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/=
build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplin=
k-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/Ds=
pBios/OMAP3530/internal &#65533;>/dev/null
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/msg/DspBios/=
_zcpy_mqt.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-s=
cripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti=
-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP=
3530_0/INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/msg/DspBios/=
_zcpy_mqt.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-s=
cripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti=
-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/INC=
LUDE/DspBios/OMAP3530/internal &#65533;>/dev/null
| make[1]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/msg'
| make -f Makefile -C data &#65533; includes
| make[1]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/data'
| [DATA &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#6=
5533;] ------- INCLUDES -----------------------------------
| [DATA &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#6=
5533;] ------- DIRS ------------------ INCLUDE ------------
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/data/dsplink=
data.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-script=
s/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspl=
ink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530_=
0/INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/data/dsplink=
data.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-script=
s/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspl=
ink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/=
DspBios/OMAP3530/internal &#65533;>/dev/null
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/data/DspBios=
//_zcpy_data.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setu=
p-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi=
/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/O=
MAP3530_0/INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/data/DspBios=
//_zcpy_data.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setu=
p-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi=
/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/=
INCLUDE/DspBios/OMAP3530/internal &#65533;>/dev/null
| make[1]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/data'
| make -f Makefile -C notify &#65533; includes
| make[1]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/notify'
| [NOTIFY &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533;] =
------- INCLUDES -----------------------------------
| [NOTIFY &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533;] =
------- DIRS ------------------ INCLUDE ------------
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/notify/_noti=
fy.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/=
build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplin=
k-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530_0/=
INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/notify/_noti=
fy.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/=
build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplin=
k-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/Ds=
pBios/OMAP3530/internal &#65533;>/dev/null
| make[1]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/notify'
| make -f Makefile -C ringio &#65533; includes
| make[1]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/ringio'
| [RINGIO &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533;] =
------- INCLUDES -----------------------------------
| [RINGIO &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533;] =
------- DIRS ------------------ INCLUDE ------------
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/ringio/_ring=
io.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/=
build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplin=
k-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530_0/=
INCLUDE/. >/dev/null
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/export/INCLUDE/DspBios/OMAP3530/internal" "" "mkdir -p /media/8cb6c643-337=
7-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_=
1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsp=
link_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/DspBios/OMAP3530/internal"
| cp /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts=
/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dspli=
nk-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/ringio/_ring=
io.h /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/=
build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplin=
k-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/export/INCLUDE/Ds=
pBios/OMAP3530/internal &#65533;>/dev/null
| make[1]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/ringio'
|&#65533;
| [SRC &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65=
533; ] =3D=3D=3D=3D=3D=3D=3D OBJECTS =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D DEBUG =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| make -f Makefile -C base &#65533; objdeb
| make[1]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/base'
|&#65533;
| [BASE &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#6=
5533;] =3D=3D=3D=3D=3D=3D=3D OBJECTS =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D DEBUG =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| make -f Makefile -C gen &#65533; objdeb
| make[2]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/base/gen'
| [GEN &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65=
533; ] ------- DIRS ------------------ DEBUG --------------
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/BUILD/OMAP3530_0/GEN/OBJ/DEBUG" "" "mkdir -p /media/8cb6c643-3377-4bb9-99b=
c-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/bea=
gleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux=
_1_65_00_03/dsplink/dsp/BUILD/OMAP3530_0/GEN/OBJ/DEBUG"
| [GEN &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65=
533; ] ------- OBJECT ---------------- DEBUG --------------
| /usr//bin/perl /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnue=
abi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/make/bin=
/runif.pl LINUX "exist /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/par=
ana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux=
-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp=
/src/base/gen" "make -C /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/pa=
rana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-linu=
x-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/ds=
p/src/base/gen -f &#65533;/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/=
parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstrom-li=
nux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/=
make/DspBios/C64XX/compile.mk objdeb VERBOSE=3D0" ""
| make[3]: Entering directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757=
/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angst=
rom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/ds=
plink/dsp/src/base/gen'
| echo Compiling failure.c...
| Compiling failure.c...
| /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/bu=
ild/tmp-angstrom_2008_1/sysroots/beagleboard-angstrom-linux-gnueabi/usr/sha=
re/ti/ti-cgt6x-tree/bin/cl6x -g -d"_DEBUG" --no_compress -dMAX_DSPS=3D1 -dM=
AX_PROCESSORS=3D2 -dID_GPP=3D1 -dOMAP3530 -dPROC_COMPONENT -dPOOL_COMPONENT=
 -dNOTIFY_COMPONENT -dMPCS_COMPONENT -dRINGIO_COMPONENT -dMPLIST_COMPONENT =
-dMSGQ_COMPONENT -dMSGQ_ZCPY_LINK -dCHNL_COMPONENT -dCHNL_ZCPY_LINK -dZCPY_=
LINK -dPROCID=3D0 -dOMAP3530 -dOMAP3530_INTERFACE=3DSHMEM_INTERFACE -dPHYIN=
TERFACE=3DSHMEM_INTERFACE -dDSP_SWI_MODE -I/media/8cb6c643-3377-4bb9-99bc-8=
10069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagle=
board-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_=
65_00_03/dsplink/dsp/inc
 -I/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/b=
uild/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink=
-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/inc/DspBios -I/med=
ia/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp=
-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_=
00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/inc/DspBios/5.XX -I/media/=
8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-an=
gstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_=
03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/inc/DspBios/5.XX/OMAP3530 -I/=
media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/=
tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_=
65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/inc/OMAP3530
 -I/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/b=
uild/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink=
-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/inc/C64XX -I/media=
/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-a=
ngstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00=
_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/src/base/gen -I/media/8cb6c6=
43-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom=
_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r10=
0i/dsplink_linux_1_65_00_03/dsplink/dsp/src/base/gen/DspBios -I/media/8cb6c=
643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstro=
m_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r1=
00i/dsplink_linux_1_65_00_03/dsplink/dsp/src/base/gen/DspBios/
 -I/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/b=
uild/tmp-angstrom_2008_1/sysroots/beagleboard-angstrom-linux-gnueabi/usr/sh=
are/ti/ti-dspbios-tree/packages/ti/bios/include -I/media/8cb6c643-3377-4bb9=
-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/sysr=
oots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-cgt6x-tree/include =
-I/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/bui=
ld/tmp-angstrom_2008_1/sysroots/beagleboard-angstrom-linux-gnueabi/usr/shar=
e/ti/ti-dspbios-tree/packages/ti/rtdx/include/c6000 -I/media/8cb6c643-3377-=
4bb9-99bc-810069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/=
sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dspbios-tree/pa=
ckages/ti/psl/include
 -I/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/b=
uild/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink=
-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530_0/I=
NCLUDE -q -pdr -pdv -pden -ml3 -mv6400+ --disable:sploop &#65533; &#65533; =
-fr"/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/b=
uild/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink=
-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsplink/dsp/BUILD/OMAP3530_0/G=
EN/OBJ/DEBUG" failure.c
| /bin/sh: /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-s=
cripts/build/tmp-angstrom_2008_1/sysroots/beagleboard-angstrom-linux-gnueab=
i/usr/share/ti/ti-cgt6x-tree/bin/cl6x: No such file or directory
| make[3]: *** [failure.c.deb] Error 127
| make[3]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/base/gen'
| make[2]: *** [objdeb] Error 2
| make[2]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/base/gen'
| make[1]: *** [gen.objdeb] Error 2
| make[1]: Leaving directory `/media/8cb6c643-3377-4bb9-99bc-810069de5757/=
home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleboard-angstr=
om-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/dsplink_linux_1_65_00_03/dsp=
link/dsp/src/base'
| make: *** [base.objdeb] Error 2
NOTE: package ti-dsplink-1_1_65_00_03-r100i: task do_compile: Failed
ERROR: Function 'do_compile' failed (see /media/8cb6c643-3377-4bb9-99bc-81=
0069de5757/home/parana/setup-scripts/build/tmp-angstrom_2008_1/work/beagleb=
oard-angstrom-linux-gnueabi/ti-dsplink-1_1_65_00_03-r100i/temp/log.do_compi=
le.19319 for further information)
ERROR: Task 251 (/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/s=
etup-scripts/sources/openembedded/recipes/ti/ti-dsplink_1.65.00.03.bb, do_c=
ompile) failed with exit code '1'
ERROR: '/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scri=
pts/sources/openembedded/recipes/ti/ti-dsplink_1.65.00.03.bb' failed


**************************************************************************=
*************

My system has Ubuntu 11.04, and i am using b7 beagleboard. My goal is to c=
ompile my opencv project for work in beagle and i follow that steps:&#65533=
;http://code.google.com/p/opencv-dsp-acceleration/wiki/Instruction_For_Buil=
ding_Examples. I had done step 1 and have stacked at step 2.
What is the problem in that case?
From juhsis@yahoo.com Fri Sep 23 11:45:09 2011
Received: from nm30-vm4.bullet.mail.ne1.yahoo.com ([98.138.91.190])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <juhsis@yahoo.com>) id 1R72Jf-0000x4-V5
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 11:45:09 +0200
Received: from [98.138.90.55] by nm30.bullet.mail.ne1.yahoo.com with NNFMP=
;
	23 Sep 2011 09:36:38 -0000
Received: from [98.138.89.165] by tm8.bullet.mail.ne1.yahoo.com with NNFMP=
;
	23 Sep 2011 09:36:38 -0000
Received: from [127.0.0.1] by omp1021.mail.ne1.yahoo.com with NNFMP;
	23 Sep 2011 09:36:38 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 87799.63205.bm@omp1021.mail.ne1.yahoo.com
Received: (qmail 6872 invoked by uid 60001); 23 Sep 2011 09:36:38 -0000
DKIM-Signature: v
