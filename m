Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RH8YK-00071B-W3 for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 08:26:01 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RH8Sd-0004Fu-Se for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 08:20:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:20:07 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:20:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Oct 2011 08:12:19 +0200
Message-ID: <j7r2g3$7jb$3@dough.gmane.org>
References: <cover.1319168013.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <cover.1319168013.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH 0/4] systemd fixes
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
X-List-Received-Date: Fri, 21 Oct 2011 06:26:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-10-11 05:34, Otavio Salvador schreef:
> The following changes since commit
> 0368dfd5d8285fe31c853097846e8a6822c7cda0:
> 
> gcc-4.6: Remove the patches that are already applied via oe-core
> (2011-10-20 19:25:50 +0200)
> 
> are available in the git repository at: 
> git://github.com/OSSystems/meta-oe master 
> https://github.com/OSSystems/meta-oe/tree/master
> 
> Otavio Salvador (4): systemd: add systemd-initramfs systemd: do not
> recommend systemd-serialgetty systemd-serialgetty: don't require
> systemd_git.bb

I had comments on those 3

> systemd: add lock group using useradd.bbclass

I'll push that one when the matching oe-core commits gets applied.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOoQ1DMkyGM64RGpERAhm6AKC0P0CUWFRCO1Ezn3kmi/vPA6NKPACfcg4+
1RCsXdclw8RxtU3veq4spLQ=
=Xt8t
-----END PGP SIGNATURE-----



