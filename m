Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NYzcb-00035z-SG for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 11:23:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NYzaM-0003TG-Os
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 11:20:50 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 11:20:50 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 11:20:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 24 Jan 2010 11:20:26 +0100
Message-ID: <hjh6t9$6v0$1@ger.gmane.org>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>	<hivtt3$v2r$1@ger.gmane.org>	<1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>	<hj09k8$km$1@ger.gmane.org>	<1263820243.3675.560.camel@mill.internal.reciva.com>	<1263824896.26227.112.camel@dax.rpnet.com>	<hj21vd$32h$1@ger.gmane.org>	<1264114415.457.1069.camel@lenovo.internal.reciva.com>	<ac9c93b11001212352s479136d7ge27afe3433afe5c2@mail.gmail.com>
	<19c1b8a91001220813w46f8888ewcffb90df590bda93@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <19c1b8a91001220813w46f8888ewcffb90df590bda93@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: include default PR or not
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
X-List-Received-Date: Sun, 24 Jan 2010 10:23:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-01-10 17:13, Khem Raj wrote:

> IMO Letting PR=r0 is better because it does help people in remembering
> to bump PR when they make the first change after r0
> afterall 0 is also a number so it does convey some information in the recipe.

My experience is that people forget to bump PR regardless of PR = rX
being present in the recipe and/or includes, that line of thinking is moot.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLXB7qMkyGM64RGpERAh9dAKCOEMCbtp+JMVdjqmpIJeAwO0sxuQCfXUbN
6ggZc7oVtJXYhraPeNIwSIw=
=/Bkw
-----END PGP SIGNATURE-----



