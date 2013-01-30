Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U0TXg-0002fh-CH for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 10:01:26 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U0TIn-0003Qg-Af for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 09:45:53 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 09:45:53 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 09:45:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 30 Jan 2013 09:45:26 +0100
Message-ID: <keamj1$22j$1@ger.gmane.org>
References: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe][[RFC][PATCH] nodejs: add 0.8.18
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
X-List-Received-Date: Wed, 30 Jan 2013 09:01:27 -0000
X-List-Received-Date: Wed, 30 Jan 2013 09:01:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-01-13 09:02, Koen Kooi schreef:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
> .../nodejs/nodejs/0002-Enable-NEON.patch           | 27 ++++++++++ 
> ...0003-Resolve-bad-rpath-issue-when-linking.patch | 29 ++++++++++ 
> meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 61
> ++++++++++++++++++++++ 3 files changed, 117 insertions(+) create mode
> 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch 
> create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch
>
> 
create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb

Ignore this one, it fails at runtime.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRCN2mMkyGM64RGpERAk/OAJ4kLEF//o1hXuaWEIPGr05hTiRqMgCbBGdu
Oe/xAyE11B/LWqRoqvO4s5Y=
=GPs+
-----END PGP SIGNATURE-----



