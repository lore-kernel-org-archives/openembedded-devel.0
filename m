Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q7NIb-0004Q7-TX for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:37:09 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q7NGb-0006XZ-By for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:35:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 09:35:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 09:35:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 06 Apr 2011 09:32:25 +0200
Message-ID: <inh4u9$q7$3@dough.gmane.org>
References: <cover.1302074016.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1302074016.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 0/8] [meta-efl] Pull request #3
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
X-List-Received-Date: Wed, 06 Apr 2011 07:37:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-04-11 09:14, Martin Jansa wrote:
> Sync with oe, add ephoto, bump SRCREV
> 
> Pull URL: git://gitorious.org/shr/meta-openembedded.git
>   Branch: jama/meta-efl
>   Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-efl

Merged into master, thanks!


> 
> Thanks,
>     Martin Jansa <Martin.Jansa@gmail.com>
> ---
> 
> 
> Martin Jansa (5):
>   ephoto: inherit gettext
>   elementary: inherit gettext
>   e-base: bump SRCREV
>   evas: drop PACKAGES_DYNAMIC_virtclass-native, not needed anymore
>   azy: disable mysql tests
> 
> Philippe De Swert (3):
>   eio: new recipe and include file for eio
>   ephoto: new svn build recipe
>   eeze: update to 1.0.1
> 
>  meta-efl/classes/e-base.bbclass            |    2 +-
>  meta-efl/recipes-efl/e17/ephoto_svn.bb     |   14 ++++++++++++++
>  meta-efl/recipes-efl/efl/azy_svn.bb        |    2 ++
>  meta-efl/recipes-efl/efl/eeze_1.0.0.bb     |   10 ----------
>  meta-efl/recipes-efl/efl/eeze_1.0.1.bb     |   10 ++++++++++
>  meta-efl/recipes-efl/efl/eio.inc           |    8 ++++++++
>  meta-efl/recipes-efl/efl/eio_svn.bb        |   13 +++++++++++++
>  meta-efl/recipes-efl/efl/elementary_svn.bb |    2 +-
>  meta-efl/recipes-efl/efl/evas.inc          |    1 -
>  9 files changed, 49 insertions(+), 13 deletions(-)
>  create mode 100644 meta-efl/recipes-efl/e17/ephoto_svn.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.0.0.bb
>  create mode 100644 meta-efl/recipes-efl/efl/eeze_1.0.1.bb
>  create mode 100644 meta-efl/recipes-efl/efl/eio.inc
>  create mode 100644 meta-efl/recipes-efl/efl/eio_svn.bb
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNnBcJMkyGM64RGpERAvJqAKCTNrFB8awSK//9N+7Sj0VPr1Mg5ACfY7/u
ZiwI0PEKHXbzvRAnzdoUeao=
=Hqsf
-----END PGP SIGNATURE-----



