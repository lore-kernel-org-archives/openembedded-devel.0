Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U0DRY-00022k-DK for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 16:49:53 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U0DCh-0006EL-7o for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 16:34:31 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 16:34:31 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 16:34:31 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 29 Jan 2013 16:34:06 +0100
Message-ID: <ke8q56$cdm$1@ger.gmane.org>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
	<c693696c02e012de92fd19dddeee0d85ab0e687e.1359462547.git.Martin.Jansa@gmail.com>
	<ke8h9h$gak$1@ger.gmane.org>
	<20130129130650.GN16904@jama.palm1.palmone.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <20130129130650.GN16904@jama.palm1.palmone.com>
X-Enigmail-Version: 1.5
Subject: Re: [PATCH 3/5] move broken recipes to nonworking directories
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
X-List-Received-Date: Tue, 29 Jan 2013 15:49:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-01-13 14:06, Martin Jansa schreef:
> On Tue, Jan 29, 2013 at 02:02:47PM +0100, Koen Kooi wrote: Op 29-01-13
> 13:29, Martin Jansa schreef:
>>>> * this set does not build with distroless qemuarm as reported in
>>>> 'State of bitbake world' thread, nobody volunteered to fix them
> 
> Let me have a look at fbida and the cloud9 stuff before moving them.

I fixed the fbida build for armv7a/angstrom, but I can't reproduce the
cloud9 error for armv7a/angstrom, can you forward me the error log again please?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRB+vuMkyGM64RGpERAskYAKCsNst/HA5VRY8cRRCfQ+SUTPJZBgCgrpiz
wn5sJzJUvJjpntPRMVliAMQ=
=NNvn
-----END PGP SIGNATURE-----



