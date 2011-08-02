Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QoAQp-0006DW-UJ for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 10:34:32 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QoAMc-0007VY-1q for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 10:30:10 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2011 10:30:10 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2011 10:30:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 02 Aug 2011 10:29:57 +0200
Message-ID: <j18ci6$j39$1@dough.gmane.org>
References: <1312268948-5879-1-git-send-email-schnitzeltony@gmx.de>
	<1312268948-5879-2-git-send-email-schnitzeltony@gmx.de>
	<1312269999.3658.5.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1312269999.3658.5.camel@mattotaupa>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe v2 1/1] iceauth: Import 1.0.4 from oe.dev
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
X-List-Received-Date: Tue, 02 Aug 2011 08:34:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 02-08-11 09:26, Paul Menzel schreef:
> Am Dienstag, den 02.08.2011, 09:09 +0200 schrieb Andreas Mueller:
>> The patch was imported from the OpenEmbedded git server (git://github.com/openembedded/openembedded.git) as of commit id 033af22d565adabc05303f88e76e31e7d239756c.
>> 
>> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de> --- meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |    8 ++++++++ 1 files changed, 8 insertions(+), 0 deletions(-) create mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
>> 
>> diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb new file mode 100644 index 0000000..168afc2 --- /dev/null +++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb @@ -0,0 +1,8 @@ +require xorg-app-common.inc +DESCRIPTION = 
>> "Tool for manipulating ICE protocol authorization records" +LIC_FILES_CHKSUM = "file://COPYING;md5=13f70acf3c27f5f834bbc954df775f8e" +DEPENDS += "libice" +PR = "${INC_PR}.1"
> 
> Please start at `"${INC_PR}.0"`. If it is not too much effort it is easier to send a `v3` so that Koen can apply those patches without having to do any editing.

No need, I did that manually
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFON7WFMkyGM64RGpERAizeAKCURZKlr39tTKdG2EZpKrVaj+16QQCeIbl8
iVJlf5oowbFiKuPLF8AP3NI=
=TofN
-----END PGP SIGNATURE-----



