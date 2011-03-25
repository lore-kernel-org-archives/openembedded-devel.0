Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q31ZQ-0006Gq-26 for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 08:36:32 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q31XY-0003Fg-P6 for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 08:34:36 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2011 08:34:36 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2011 08:34:36 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 25 Mar 2011 08:34:21 +0100
Message-ID: <imhght$u23$1@dough.gmane.org>
References: <cover.1301008354.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1301008354.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 0/8] [meta-oe] remaining set of LIC_FILES_CHKSUMs for e-wm build
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
X-List-Received-Date: Fri, 25 Mar 2011 07:36:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-03-11 00:25, Martin Jansa wrote:
> e-wm compiled fine now with few extra BBCLASSEXTEND in oe-core
> 
> Pull URL: git://gitorious.org/shr/meta-openembedded.git
>   Branch: jama/license
>   Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/license
> 
> Thanks,
>     Martin Jansa <Martin.Jansa@gmail.com>


Merged into master, thanks!



> ---
> 
> 
> Martin Jansa (8):
>   eet: add LIC_FILES_CHKSUM
>   evas: add LIC_FILES_CHKSUM
>   ecore: add LIC_FILES_CHKSUM and inherit gettext
>   edbus: add LIC_FILES_CHKSUM
>   efreet: add LIC_FILES_CHKSUM
>   eeze: add LIC_FILES_CHKSUM
>   edje: add LIC_FILES_CHKSUM
>   e-wm: add LIC_FILES_CHKSUM and inherit gettext
> 
>  meta-efl/recipes-efl/e17/e-wm_svn.bb |    3 ++-
>  meta-efl/recipes-efl/efl/ecore.inc   |    7 ++++---
>  meta-efl/recipes-efl/efl/edbus.inc   |    1 +
>  meta-efl/recipes-efl/efl/edje.inc    |    1 +
>  meta-efl/recipes-efl/efl/eet.inc     |    1 +
>  meta-efl/recipes-efl/efl/eeze.inc    |    1 +
>  meta-efl/recipes-efl/efl/efreet.inc  |    1 +
>  meta-efl/recipes-efl/efl/evas.inc    |    1 +
>  8 files changed, 12 insertions(+), 4 deletions(-)
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNjEV9MkyGM64RGpERAltSAKCeD41sPU1eQssTI4Nu1fMpW2Lw/gCaAn1L
lghIXdSxuxf+6phf4WRe3tQ=
=SG0/
-----END PGP SIGNATURE-----



