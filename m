Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RWYi4-0004jw-UD for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 20:23:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RWYba-0008Ew-4L for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 20:17:06 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 20:17:06 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 20:17:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 02 Dec 2011 20:16:53 +0100
Message-ID: <jbb875$apq$1@dough.gmane.org>
References: <1322838598-30090-1-git-send-email-eric@eukrea.com>
	<1322838598-30090-4-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1322838598-30090-4-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-oe v2 4/4] add nostromo webserver
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
X-List-Received-Date: Fri, 02 Dec 2011 19:23:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 02-12-11 16:09, Eric Bénard schreef:
> this recipe was imported from OE-classic and upgraded to latest version
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com> --- 
> meta-oe/recipes-extended/nostromo/files/cross.diff |  119
> ++++++++++++++++++++ .../recipes-extended/nostromo/files/nhttpd.conf    |
> 55 +++++++++ meta-oe/recipes-extended/nostromo/files/nostromo   |   34
> ++++++ meta-oe/recipes-extended/nostromo/files/volatiles  |    2 + 
> .../recipes-extended/nostromo/nostromo_1.9.5.bb    |   55 +++++++++ 5
> files changed, 265 insertions(+), 0 deletions(-) create mode 100644
> meta-oe/recipes-extended/nostromo/files/cross.diff create mode 100644
> meta-oe/recipes-extended/nostromo/files/nhttpd.conf create mode 100644
> meta-oe/recipes-extended/nostromo/files/nostromo create mode 100644
> meta-oe/recipes-extended/nostromo/files/volatiles create mode 100644
> meta-oe/recipes-extended/nostromo/nostromo_1.9.5.bb
> 
> diff --git a/meta-oe/recipes-extended/nostromo/files/cross.diff
> b/meta-oe/recipes-extended/nostromo/files/cross.diff new file mode
> 100644 index 0000000..d93ddb7 --- /dev/null +++
> b/meta-oe/recipes-extended/nostromo/files/cross.diff @@ -0,0 +1,119 @@

Can you please add a patch header with the purpose and upstream status of
the patches? Bonus points for making them git-amable :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7ZJCIACgkQMkyGM64RGpEVWACghc+52XWW5LR0RmW1Yr0kLrtx
s3EAoKYtrtzi1ZVyZau50/TUSSePoPyE
=Pm0P
-----END PGP SIGNATURE-----



