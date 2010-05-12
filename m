Received: from web57907.mail.re3.yahoo.com ([68.142.236.100])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <henryzhang62@yahoo.com>) id 1OCGrp-0007Fe-4T
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 20:41:14 +0200
Received: (qmail 34590 invoked by uid 60001); 12 May 2010 18:30:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1273689037; bh=JwfV4kSkSNcQrnUqIkfdAKRdRKzsJ0oh9f2gzlvBEhA=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=o3CCnpKA2iQ2fvl9hDeAJbWURgAm894loztsJP+kGEZaSsjxAjKK39KOPrAu7gHmU8QiMpA21AV4vzv8TWUagvgoMqn3Inuh/enuyII0+rBOGCyFdoexTR1k8mhOG2P2YBK8+on9Thnk0F608N8J9y8IhnZMCmoGAjrBB/TLHpI=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=UO7mDRgxoZfhp4FfIFIzg4FqMPxb4gJqKQZifxkRiz6RKEBaz0Qai3PiwAQT7DXXm5AafcVhglTeBMBBR5HIpl19lPpIMKfxbrEDEkS837CIQJeZePpIdXo9g4UExsocyI8MbMkX0YIbDmvDeVboibTSL2xtU8g8wv3C8OT94q0=;
Message-ID: <740455.28529.qm@web57907.mail.re3.yahoo.com>
X-YMail-OSG: 37lKifoVM1nS4LFf3RFFetm.psrbkULj_Ypu6xejdRvzCD0
	HbAUh_nD7m1e0TJmzzEjwDL3w5A_n8ZaWgE.wDvyVmpIueaI8lzAHkr6zv6K
	1XDvM2.KLPCx_0xyXS1l30CRPbpkjEdGCIbYZSjD1QfGxykM5Qe2KZip8ayJ
	Ry_TemMxtwaoe1Vg6M.crVWAkjgwurXb8aRFTKJOcENOy2hb5Ki7iFmKgcs1
	mv5xzpmadfavVWUufkWyK1ZlVzkVi6WJ.w8mH_.tIPIUuVj1qOcRDH.PHZ_.
	n1kqBosa_BX7NDOzKz77IGzkbZsiwCqL5iulCfxT4ReXxcJvdkmr4dT4bUwM
	QG37fFR5iRSQZTmn7T3hNiSdfJf7Iaz8-
Received: from [70.134.44.229] by web57907.mail.re3.yahoo.com via HTTP;
	Wed, 12 May 2010 11:30:37 PDT
X-Mailer: YahooMailClassic/10.1.11 YahooMailWebService/0.8.103.269680
Date: Wed, 12 May 2010 11:30:37 -0700 (PDT)
From: hong zhang <henryzhang62@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikIvUUA9BtBryyx1WPNamzk7LHmng2T-xTY7WSv@mail.gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 68.142.236.100
X-SA-Exim-Mail-From: henryzhang62@yahoo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eet: CROSS COMPILE Badness on x86_64 build machine
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
X-List-Received-Date: Wed, 12 May 2010 18:41:15 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Steve,=0A=0AI am trying to build toolchain for my overo board. Shoudl I get=
 tree from=0Agit clone git://gitorious.org/gumstix-oe/mainline.git ?=0A=0AI=
 have build problem with openembedded tree.=0A=0A---henry=0A=0A--- On Wed, =
5/12/10, Steve Sakoman <sakoman@gmail.com> wrote:=0A=0A> From: Steve Sakoma=
n <sakoman@gmail.com>=0A> Subject: [oe] eet: CROSS COMPILE Badness on x86_6=
4 build machine=0A> To: "openembedded-devel" <openembedded-devel@lists.open=
embedded.org>=0A> Date: Wednesday, May 12, 2010, 1:08 PM=0A> Building from =
recent pull of oe.dev=0A> (yesterday)=0A> =0A> Anyone else seeing this?=0A>=
 =0A> Steve=0A> =0A> =0A> ERROR: function do_compile failed=0A> ERROR: log =
data follows=0A> (/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/eet-2_1.1.0+svnr48617-r1/temp/log.do_compile.29091)=0A> | NOTE: make -j =
4=0A> | make=A0 all-recursive=0A> | make[1]: Entering directory=0A> `/home/=
steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617=
-r1/eet'=0A> | Making all in src=0A> | make[2]: Entering directory=0A> `/ho=
me/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48=
617-r1/eet/src'=0A> | Making all in lib=0A> | make[3]: Entering directory=
=0A> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1=
.0+svnr48617-r1/eet/src/lib'=0A> |=A0=A0=A0CC=A0=0A> =A0=A0=A0libeet_la-eet=
_lib.lo=0A> |=A0=A0=A0CC=A0=0A> =A0=A0=A0libeet_la-eet_data.lo=0A> |=A0=A0=
=A0CC=A0=0A> =A0=A0=A0libeet_la-eet_image.lo=0A> |=A0=A0=A0CC=A0=0A> =A0=A0=
=A0libeet_la-eet_cipher.lo=0A> | CROSS COMPILE Badness: /usr/include in INC=
LUDEPATH:=0A> /usr/include/eina-0=0A> | cc1: internal compiler error: in ad=
d_path, at=0A> c-incpath.c:425=0A> | Please submit a full bug report,=0A> |=
 with preprocessed source if appropriate.=0A> | See <http://gcc.gnu.org/bug=
s.html> for=0A> instructions.=0A> | CROSS COMPILE Badness: /usr/include in =
INCLUDEPATH:=0A> /usr/include/eina-0=0A> | cc1: internal compiler error: in=
 add_path, at=0A> c-incpath.c:425=0A> | Please submit a full bug report,=0A=
> | with preprocessed source if appropriate.=0A> | See <http://gcc.gnu.org/=
bugs.html> for=0A> instructions.=0A> | make[3]: *** [libeet_la-eet_image.lo=
] Error 1=0A> | make[3]: *** Waiting for unfinished jobs....=0A> | make[3]:=
 *** [libeet_la-eet_data.lo] Error 1=0A> | CROSS COMPILE Badness: /usr/incl=
ude in INCLUDEPATH:=0A> /usr/include/eina-0=0A> | cc1: internal compiler er=
ror: in add_path, at=0A> c-incpath.c:425=0A> | Please submit a full bug rep=
ort,=0A> | with preprocessed source if appropriate.=0A> | See <http://gcc.g=
nu.org/bugs.html> for=0A> instructions.=0A> | make[3]: *** [libeet_la-eet_l=
ib.lo] Error 1=0A> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH:=0A=
> /usr/include/eina-0=0A> | cc1: internal compiler error: in add_path, at=
=0A> c-incpath.c:425=0A> | Please submit a full bug report,=0A> | with prep=
rocessed source if appropriate.=0A> | See <http://gcc.gnu.org/bugs.html> fo=
r=0A> instructions.=0A> | make[3]: *** [libeet_la-eet_cipher.lo] Error 1=0A=
> | make[3]: Leaving directory=0A> `/home/steve/overo-oe/tmp/work/armv7a-an=
gstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet/src/lib'=0A> | make[2]: *=
** [all-recursive] Error 1=0A> | make[2]: Leaving directory=0A> `/home/stev=
e/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/=
eet/src'=0A> | make[1]: *** [all-recursive] Error 1=0A> | make[1]: Leaving =
directory=0A> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
eet-2_1.1.0+svnr48617-r1/eet'=0A> | make: *** [all] Error 2=0A> | FATAL: oe=
_runmake failed=0A> =0A> _______________________________________________=0A=
> Openembedded-devel mailing list=0A> Openembedded-devel@lists.openembedded=
.org=0A> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-d=
evel=0A> =0A=0A=0A      


