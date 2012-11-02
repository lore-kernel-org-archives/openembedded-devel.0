Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TUF74-0004rd-MO for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 12:08:34 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TUEu0-0000YB-Gc for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 11:55:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2012 11:55:04 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2012 11:55:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 02 Nov 2012 11:52:30 +0100
Message-ID: <k708l4$3tt$2@ger.gmane.org>
References: <1351734166-8711-1-git-send-email-Xin.Ouyang@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1351734166-8711-1-git-send-email-Xin.Ouyang@windriver.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [PATCH][meta-networking 1/2] netperf: import recipe
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
X-List-Received-Date: Fri, 02 Nov 2012 11:08:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-11-12 02:42, Xin Ouyang schreef:
> Git-Url: -
> http://git.openembedded.org/openembedded/tree/recipes/netperf/
> 
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com> --- 
> .../recipes-support/netperf/files/cpu_set.patch    |   24 +++++++++ 
> meta-networking/recipes-support/netperf/files/init |   51
> ++++++++++++++++++++

The initscript is missing LSB headers and hardcodes $sbindir to /usr/sbin.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQk6XuMkyGM64RGpERApMQAJ0f0YMb53j54pjbXUpl7b6RCjWm7gCgrbd/
8Ainle5y7zDc8tFdcr9gCsQ=
=K3FI
-----END PGP SIGNATURE-----



