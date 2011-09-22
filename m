Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6d8V-0002o4-3M for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 08:51:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6d3N-0006aV-Ul for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 08:46:37 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2011 08:46:37 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2011 08:46:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Sep 2011 08:46:23 +0200
Message-ID: <j5eljv$ur4$1@dough.gmane.org>
References: <1316384018-7651-1-git-send-email-dbaryshkov@gmail.com>	<j56n5t$s0d$2@dough.gmane.org>
	<j57i4p$i51$1@dough.gmane.org>	<j57inn$mme$1@dough.gmane.org>
	<20110919143959.GC19168@jama.jama.net> <4E7A309A.8060300@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
In-Reply-To: <4E7A309A.8060300@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][V3] openssl: fixup the openssl-fix-link patch
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
X-List-Received-Date: Thu, 22 Sep 2011 06:51:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-09-11 20:44, Dmitry Eremin-Solenikov schreef:
> Koen, please doublecheck your setup. Today I've just rebuilt
> openssl-native with this patch and it worked. Did you clean/cleansstate
> before rechecking the patch?

I did cleansstate in between, I'll try a build from scratch now.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOetm/MkyGM64RGpERAidKAJ9EoLQ0hORkh388WddFS/jPNBp4IACgjH5u
QwtVwfuzIMSwDwZFCQ2ZzG4=
=XQnF
-----END PGP SIGNATURE-----



