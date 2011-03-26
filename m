Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3X0Z-0001Mn-51 for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 18:10:39 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3Wyk-0001Uk-D8 for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 18:08:46 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 18:08:46 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 18:08:46 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 26 Mar 2011 18:08:30 +0100
Message-ID: <iml6ie$bb4$1@dough.gmane.org>
References: <1301158234-13658-1-git-send-email-radoslav@kolev.info>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1301158234-13658-1-git-send-email-radoslav@kolev.info>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] Added a recipe for libmodbus
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
X-List-Received-Date: Sat, 26 Mar 2011 17:10:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-03-11 17:50, Radoslav Kolev wrote:

> +++ b/recipes/libmodbus/libmodbus_git.bb
> @@ -0,0 +1,11 @@
> +require libmodbus.inc
> +
> +SRCREV = "6254ede9156095ee0300"
> +
> +PR = "${INC_PR}.1"

That's missing a PV = 1.2 or similar
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNjh2OMkyGM64RGpERAn/bAKCy5pAexAIwWE/LlH6bE+b+03WpwQCgqLLR
ScFrtf6DFwZlBoMm8hextko=
=0ktX
-----END PGP SIGNATURE-----



