Received: from web57908.mail.re3.yahoo.com ([68.142.236.101])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <henryzhang62@yahoo.com>) id 1OCF4u-0007Eb-A1
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 18:46:37 +0200
Received: (qmail 17240 invoked by uid 60001); 12 May 2010 16:42:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1273682561; bh=nf4Oj2Kxry2wPo3u078n4scoOgGBvufEBaKXk3Digrk=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=LMbQKIJJfDCj5egEX2msbWk3wct4BetMrekpElVSP3XVcvIHMvvXo75RDqMh8zUzEGcdbUFQ+nZjTvvWlh9Vomy+Ovd4Fe/nuFRI3vydyTHl+SVnsVjjQf/5FuiVoDhn+xOhn4XySlTrT11248MOPS/iDLSYd2oUI131nZxFtd0=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=ZjND/PYa0H9RcnmGVOeetck2n9fU2J4XIQItmnZszm7puXc2nmdESkUM7VxoF0mk6QO+welciZy3PceVgfUPQ8fZxOP0Phh31wIaQSqbs1YkQqHLhaAF4OpPq5QMmhQ+A3nsNvEMPuHtsNDdRq8pr7eRW5Nol2V3ho/nfKDIt0U=;
Message-ID: <116447.12987.qm@web57908.mail.re3.yahoo.com>
X-YMail-OSG: HSzu7q4VM1nqzZoOQnmy7yACdmVqduTMKpHIqICyHgn.N7u
	bV7WnHsFrTbgaW.Z1l1jc5j29AyllnftT9G3s4GT3n_LktctaUB6NZIfFP1T
	L_aOiNSaW0VHY94.rvWJngCj_hdKV89cd9ziRAjIcLi6zjAYVRGv2paimBWr
	H0N7_0.hJGemJsuAyTQMgFSet5sTc6_JNf8q1Nkc6X7VZT330TOjCMH1QNdw
	OHbuwUycKBDAKXvzOna.WqA1rLmKGzR1VlBoOTIDlmoc4Zp6Lha_JA0GztzT
	zLLY5d75Ojfx88We4upf8GgveX1uhHLtzFgVL8bv1Z.BvPF7RvgCu7HPzu8X
	5hday0ilN6hhDKHKZvXWgIg--
Received: from [70.134.44.229] by web57908.mail.re3.yahoo.com via HTTP;
	Wed, 12 May 2010 09:42:41 PDT
X-Mailer: YahooMailClassic/10.1.11 YahooMailWebService/0.8.103.269680
Date: Wed, 12 May 2010 09:42:41 -0700 (PDT)
From: hong zhang <henryzhang62@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100512162402.258030@gmx.net>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 68.142.236.101
X-SA-Exim-Mail-From: henryzhang62@yahoo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xfce recipes
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
X-List-Received-Date: Wed, 12 May 2010 16:46:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Andreas,=0A=0AI am running "bitbake opie-image" for gumstix-overo but using=
 distro=3Dangstrom. But keep complain gnutls bb.=0ASo far, only bitbake hel=
loworld is successfull. I met nano download problem when I do bitbake nano.=
=0A=0AAny problem you see?=0A=0A---henry=0A=0A--- On Wed, 5/12/10, "Andreas=
 M=FCller" <Schnitzeltony@gmx.de> wrote:=0A=0A> From: "Andreas M=FCller" <S=
chnitzeltony@gmx.de>=0A> Subject: [oe] xfce recipes=0A> To: openembedded-de=
vel@lists.openembedded.org=0A> Date: Wednesday, May 12, 2010, 11:24 AM=0A> =
I am working with the gumstix-overo=0A> branch of oe and have bitbake versi=
on 1.8.18. As far as I=0A> can see the recipes of xfce-base are the same as=
 in=0A> oe-master. =0A> =0A> Baking xfce stuff leads me to:=0A> =0A> Since =
checksum.ini has died many recipes complain in the=0A> fetch task that ther=
e is no checksum information in the bb=0A> files. Without exactly knowing w=
hat I am doing I helped=0A> myself with the patch attached (which is not pr=
operly=0A> working on all recipes!). I found out that there are some=0A> re=
cipes working with simple SRC_URI[md5sum] and others need=0A> SRC_URI[archi=
ve.md5sum]. Investigations lead me to=0A> utils.bbclass / base_get_checksum=
s. In case the parameter=0A> 'name' can be found it must be prepended in SR=
C_URI[...].=0A> Since I lost the trace here now my questions: How to decide=
=0A> if a recipe needs SRC_URI[<name>.md5sum] or=0A> SRC_URI[md5sum] and wh=
at is the content of <name>=0A> (where does it come from)?=0A> =0A> Advices=
 are welcome...=0A> =0A> Andreas=0A> -- =0A> GRATIS f=FCr alle GMX-Mitglied=
er: Die maxdome Movie-FLAT!=0A> Jetzt freischalten unter http://portal.gmx.=
net/de/go/maxdome01=0A> =0A> -----Inline Attachment Follows-----=0A> =0A> _=
______________________________________________=0A> Openembedded-devel maili=
ng list=0A> Openembedded-devel@lists.openembedded.org=0A> http://lists.linu=
xtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A> =0A=0A=0A      


