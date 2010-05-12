Received: from web57908.mail.re3.yahoo.com ([68.142.236.101])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <henryzhang62@yahoo.com>) id 1OCGVU-0004pT-3I
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 20:18:10 +0200
Received: (qmail 77381 invoked by uid 60001); 12 May 2010 18:14:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1273688053; bh=6vTk9s0lZhMCtax3M1hUFTQYQaIpO11+mc8QB+IBazI=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=daZzbGzmNeYL0DJBFw35ZnH2rMw/w3+4qTq149jqqW0GGyzJw9q29SAtGUICi0Eosmg2KUPeqvyWPBAJon/rEp1EHw2gTFCtCPVRMDHg5onnkRm80NfwQha7AOAFRqSsiXTpJBNPJhtb0EHkioCoIBbY0gH3DgB0RABVFX8G6+4=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=yae5C5aCu/D7yH7TzsQSLBAJ0p2I6dbB2XzhBW+7j9Ja8eVgNdhBQCDvmbohh/wwz9HQ7zu2QInyT39J/0RZcJh1GIUKugr/VZ2y60PWEzzx3y8i4lC8ztAPQYwfVuQiSmHdW7B+SyoRmYrH86HjCEimjMj5LRnKAQNb11e1cSw=;
Message-ID: <41445.39732.qm@web57908.mail.re3.yahoo.com>
X-YMail-OSG: ksc08KkVM1n1lHHzhhEZJJsrjvBqcNUKuD597PY49iFc6tN
	mnD2CJkQXlwyvGXdYKmiI0EKWz20HBkuX0Uopv5hyo3cPtsTNzMQ2s8BOATA
	N8e0weFnFbYO1Sh4iDb7coZ1xA73Q_kDakO75i8qZh6Aq5y5XUgJMIjVrzdq
	yD765B5FyC1BQt7TOn7gn4HvsTzJD_zTZX7JZcNUav3LK8tKIwJB3X9yEgi9
	yG1_UTVCIQRbimcXOlwkqL9OMD8K4d1orXL8T1MAYGlgB.pLzYqd_tPtledn
	E7kFYjc9WCy4hOsvHEH3OqhOG0VHvdwBIfZKPeiowIQSFKIs3PfROC5fGuOL
	5qg3hmkSsr2kYpNN8iknuSC10vjDK44E-
Received: from [70.134.44.229] by web57908.mail.re3.yahoo.com via HTTP;
	Wed, 12 May 2010 11:14:12 PDT
X-Mailer: YahooMailClassic/10.1.11 YahooMailWebService/0.8.103.269680
Date: Wed, 12 May 2010 11:14:12 -0700 (PDT)
From: hong zhang <henryzhang62@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikIvUUA9BtBryyx1WPNamzk7LHmng2T-xTY7WSv@mail.gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 68.142.236.101
X-SA-Exim-Mail-From: henryzhang62@yahoo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Wed, 12 May 2010 18:18:10 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

what command like bitbake xxx you used?=0A=0A--- On Wed, 5/12/10, Steve Sak=
oman <sakoman@gmail.com> wrote:=0A=0A> From: Steve Sakoman <sakoman@gmail.c=
om>=0A> Subject: [oe] eet: CROSS COMPILE Badness on x86_64 build machine=0A=
> To: "openembedded-devel" <openembedded-devel@lists.openembedded.org>=0A> =
Date: Wednesday, May 12, 2010, 1:08 PM=0A> Building from recent pull of oe.=
dev=0A> (yesterday)=0A> =0A> Anyone else seeing this?=0A> =0A> Steve=0A> =
=0A> =0A> ERROR: function do_compile failed=0A> ERROR: log data follows=0A>=
 (/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+s=
vnr48617-r1/temp/log.do_compile.29091)=0A> | NOTE: make -j 4=0A> | make=A0 =
all-recursive=0A> | make[1]: Entering directory=0A> `/home/steve/overo-oe/t=
mp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet'=0A> | M=
aking all in src=0A> | make[2]: Entering directory=0A> `/home/steve/overo-o=
e/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet/src'=
=0A> | Making all in lib=0A> | make[3]: Entering directory=0A> `/home/steve=
/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/e=
et/src/lib'=0A> |=A0=A0=A0CC=A0=0A> =A0=A0=A0libeet_la-eet_lib.lo=0A> |=A0=
=A0=A0CC=A0=0A> =A0=A0=A0libeet_la-eet_data.lo=0A> |=A0=A0=A0CC=A0=0A> =A0=
=A0=A0libeet_la-eet_image.lo=0A> |=A0=A0=A0CC=A0=0A> =A0=A0=A0libeet_la-eet=
_cipher.lo=0A> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH:=0A> /u=
sr/include/eina-0=0A> | cc1: internal compiler error: in add_path, at=0A> c=
-incpath.c:425=0A> | Please submit a full bug report,=0A> | with preprocess=
ed source if appropriate.=0A> | See <http://gcc.gnu.org/bugs.html> for=0A> =
instructions.=0A> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH:=0A>=
 /usr/include/eina-0=0A> | cc1: internal compiler error: in add_path, at=0A=
> c-incpath.c:425=0A> | Please submit a full bug report,=0A> | with preproc=
essed source if appropriate.=0A> | See <http://gcc.gnu.org/bugs.html> for=
=0A> instructions.=0A> | make[3]: *** [libeet_la-eet_image.lo] Error 1=0A> =
| make[3]: *** Waiting for unfinished jobs....=0A> | make[3]: *** [libeet_l=
a-eet_data.lo] Error 1=0A> | CROSS COMPILE Badness: /usr/include in INCLUDE=
PATH:=0A> /usr/include/eina-0=0A> | cc1: internal compiler error: in add_pa=
th, at=0A> c-incpath.c:425=0A> | Please submit a full bug report,=0A> | wit=
h preprocessed source if appropriate.=0A> | See <http://gcc.gnu.org/bugs.ht=
ml> for=0A> instructions.=0A> | make[3]: *** [libeet_la-eet_lib.lo] Error 1=
=0A> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH:=0A> /usr/include=
/eina-0=0A> | cc1: internal compiler error: in add_path, at=0A> c-incpath.c=
:425=0A> | Please submit a full bug report,=0A> | with preprocessed source =
if appropriate.=0A> | See <http://gcc.gnu.org/bugs.html> for=0A> instructio=
ns.=0A> | make[3]: *** [libeet_la-eet_cipher.lo] Error 1=0A> | make[3]: Lea=
ving directory=0A> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnu=
eabi/eet-2_1.1.0+svnr48617-r1/eet/src/lib'=0A> | make[2]: *** [all-recursiv=
e] Error 1=0A> | make[2]: Leaving directory=0A> `/home/steve/overo-oe/tmp/w=
ork/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet/src'=0A> | m=
ake[1]: *** [all-recursive] Error 1=0A> | make[1]: Leaving directory=0A> `/=
home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr=
48617-r1/eet'=0A> | make: *** [all] Error 2=0A> | FATAL: oe_runmake failed=
=0A> =0A> _______________________________________________=0A> Openembedded-=
devel mailing list=0A> Openembedded-devel@lists.openembedded.org=0A> http:/=
/lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A> =0A=0A=
=0A      


