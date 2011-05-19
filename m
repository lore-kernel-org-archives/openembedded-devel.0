Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QMy6A-0004fz-NZ for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 09:56:46 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QMy3J-0006Jp-AH for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 09:53:49 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 09:53:49 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 09:53:49 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 19 May 2011 09:53:34 +0200
Message-ID: <ir2i9u$iel$1@dough.gmane.org>
References: <y>
	<1305614722-5460-1-git-send-email-eyalr@ti.com>	<EC51CDB0807A51469E0C9CB8CF72D65F03323CEDC7@dnce02.ent.ti.com>	<1305730807.4389.6.camel@mattotaupa>
	<EC51CDB0807A51469E0C9CB8CF72D65F03323CEF86@dnce02.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <EC51CDB0807A51469E0C9CB8CF72D65F03323CEF86@dnce02.ent.ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: Pull Request: [PATCH] ti-wifi-utils: update to use the latest release
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
X-List-Received-Date: Thu, 19 May 2011 07:56:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-05-11 08:40, Reizer, Eyal wrote:
> Hi,
> 
> Could you please pull the below patch to the 2011.03-maintenance branch.
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=16fcbc6a76e6dcdd15f36163cd47e6c0702c29f5

I already have these queued:

Christian Charreyre (1):
      python-numpy: add missing runtime dependencies

Eyal Reizer (1):
      ti-wifi-utils: update to use the latest release

Jeff Lance (1):
      matrix_gui: Pull in lmbench,multimedia,EZSDK mods

Koen Kooi (3):
      dttsp: fix DEPENDS
      sdrshell-qt4: fix DEPENDS and update SRCREV
      bigbuckbunny: fix SRC_URI

Tom Rini (2):
      openssh.inc: Don't use ${libdir}exec
      lmbench: Rework for binaries in /usr/bin

I'll send out a request once Tom gets back from holiday
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN1Mx+MkyGM64RGpERAoqLAKCm0UQDOIci6MycSkKp4kPTqkePVQCfX8Be
5qZnPYI8juTLXva8XOAuLuo=
=JsGJ
-----END PGP SIGNATURE-----



