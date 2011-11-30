Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RVniX-0004Hz-RM for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 18:13:10 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RVnc3-0007eD-Oq for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 18:06:27 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 18:06:27 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 18:06:27 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 30 Nov 2011 18:06:14 +0100
Message-ID: <jb5nq6$ca3$1@dough.gmane.org>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<4ED6507D.4090007@ts.fujitsu.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <4ED6507D.4090007@ts.fujitsu.com>
X-Enigmail-Version: 1.3.3
X-Enigmail-Draft-Status: 513
Subject: Re: Documentation problems
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
X-List-Received-Date: Wed, 30 Nov 2011 17:13:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-11-11 16:49, Rainer Koenig schreef:

> Then I tried to see if problems that I'm encountering are "known issues"
> so that I can find it in bugzilla. And I learned that you gave up
> Bugzilla for tracking bugs on the mailing list. Ouch!!!

Bugzilla started to become a liability when the OE bugzilla maintainer
didn't want patches to get reviewed on the mailing list and actually started
closing bugs as 'resolved' or 'wontfix' after people dared to post a patches
to the mailing list.
With a maintainer like that a bugzilla is useless. Thankfully Rolf
disappeared from the OE project, but the damage was already done.

As you pointed out, OE-core is tracking its bugs in the yocto bugzilla with
pretty graphs and such. Other layers may use different tools to track bugs,
it's up to the maintainers to decide what works best for them.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7WYoQACgkQMkyGM64RGpECFQCfVH0oPSdE1jvPDSH9gxTBMYL9
SpUAn3jBN0WVTijtqbnOwxzeJDM6z79+
=Cg/o
-----END PGP SIGNATURE-----



