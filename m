Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3Tmr-0004V9-3v for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 14:44:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3TQz-0001Ez-1T for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 14:21:41 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 14:21:41 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 14:21:41 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 26 Mar 2011 14:21:24 +0100
Message-ID: <imkp8k$93d$1@dough.gmane.org>
References: <1301137767.3979.40.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1301137767.3979.40.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] orc: add version 0.4.10
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
X-List-Received-Date: Sat, 26 Mar 2011 13:44:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-03-11 12:09, Paul Menzel wrote:
> Date: Thu, 24 Mar 2011 10:21:23 +0100
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> 0.4.11 is out already, but I tested my used program with 0.4.10 only.

FWIW, .11 works fine for me.

Anyway,

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
>  recipes/orc/orc_0.4.10.bb |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/orc/orc_0.4.10.bb
> 
> diff --git a/recipes/orc/orc_0.4.10.bb b/recipes/orc/orc_0.4.10.bb
> new file mode 100644
> index 0000000..e072fab
> --- /dev/null
> +++ b/recipes/orc/orc_0.4.10.bb
> @@ -0,0 +1,4 @@
> +require orc.inc
> +
> +SRC_URI[orc.md5sum] = "dd4e7a1820c9db5853aa7fe31ddb5a03"
> +SRC_URI[orc.sha256sum] = "5001a0034edc06800b546246fbe0407ba6e9759c9583d5d93adba3557b6a777e"
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNjehUMkyGM64RGpERAipaAKC40Lu43X056B+2DYwVTQ6cZ4B9KACdFOIe
SaURz/NinO1T7iu/PF2GHyM=
=bhTG
-----END PGP SIGNATURE-----



