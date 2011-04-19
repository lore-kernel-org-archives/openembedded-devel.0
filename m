Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCAAR-0003ZB-3q for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 14:36:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCA89-0007ZX-Lv for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 14:34:09 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 14:34:09 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 14:34:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 19 Apr 2011 14:33:57 +0200
Message-ID: <iojvfl$aue$1@dough.gmane.org>
References: <1303213631-7082-1-git-send-email-michael.lippautz@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1303213631-7082-1-git-send-email-michael.lippautz@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe] fakeroot: Add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 19 Apr 2011 12:36:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-04-11 13:47, Michael Lippautz wrote:
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb |    1 +

Thank you for your patch, but I'm not sure if it should go in or not. In
oe-core we switched to pseudo-native as fakeroot-native replacement, so
the fakeroot recipe seems redundant.
Does anyone have a need for fakeroot(-native) or can it get deleted?

Michaels immediate need for fakeroot-native was addressed with
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNrYE1MkyGM64RGpERAuwVAJ0daBSvkRTQT+KIzy6pWjwl6xsVKQCfUMTR
FM+Ueun/df2VrXD7pM0Ff2s=
=BRdx
-----END PGP SIGNATURE-----



