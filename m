Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S5tqq-00043n-R1 for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 08:02:56 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S5tiT-0003Pu-Ed for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 07:54:17 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 07:54:17 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 07:54:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 09 Mar 2012 07:54:07 +0100
Message-ID: <jjc9ec$uin$2@dough.gmane.org>
References: <1331219658-28720-1-git-send-email-gary@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <1331219658-28720-1-git-send-email-gary@mlbassoc.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe] README: fix typo
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
X-List-Received-Date: Fri, 09 Mar 2012 07:02:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-03-12 16:14, Gary Thomas schreef:
> Without this change, 'git send-email' complains of a missing argument.

Only if there's a dir called 'meta-oe', git is weird like that.

regards,

Koen


> Tested with git 1.7.7.6 on Fedora 16.
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com> --- meta-oe/README |    2
> +- 1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/README b/meta-oe/README index a195919..ed14866
> 100644 --- a/meta-oe/README +++ b/meta-oe/README @@ -6,7 +6,7 @@
> revision: HEAD
> 
> Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-oe]' in the subject'
> 
> -When sending single patches, please use something like 'git send-email
> -1 --to openembedded-devel@lists.openembedded.org --subject-prefix
> meta-oe' +When sending single patches, please use something like 'git
> send-email -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=meta-oe'
> 
> You are encouraged to fork the mirror on github
> https://github.com/openembedded/meta-oe/ to share your patches, this is
> preferred for patch sets consisting of more than one patch. Other
> services like gitorious, repo.or.cz or self hosted setups are of course
> accepted as well, 'git fetch <remote>' works the same on all of them. We
> recommend github because it is free, easy to use, has been proven to be
> reliable and has a really good web GUI.
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9ZqQ8ACgkQMkyGM64RGpEqIACdGmcFzw6kCjxJm1sRPOXsNUr3
ygkAnRVRraA/+17ijY+91QpYk79VrMV8
=DHsY
-----END PGP SIGNATURE-----



