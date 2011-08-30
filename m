Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyQRO-0002ED-Rk for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 17:41:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyQMf-00045e-60 for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 17:36:37 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:36:37 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:36:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Aug 2011 17:36:24 +0200
Message-ID: <j3j01o$35m$1@dough.gmane.org>
References: <cover.1314710525.git.otavio@ossystems.com.br>
	<j3ipqj$ib6$1@dough.gmane.org>
	<CAP9ODKpaJAfkqxUwcBq=TO6Ye68s88EY12k_M=qgy08ZP5r6QQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <CAP9ODKpaJAfkqxUwcBq=TO6Ye68s88EY12k_M=qgy08ZP5r6QQ@mail.gmail.com>
X-Enigmail-Version: 1.3
Subject: Re: [meta-oe][PATCH 0/2] Remove recipes from meta-oe
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
X-List-Received-Date: Tue, 30 Aug 2011 15:41:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-08-11 15:56, Otavio Salvador schreef:
> On Tue, Aug 30, 2011 at 10:50, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> NAK on the second, there's no binutils 2.20 in OE-core
> 
> It has 2.21.1a; what the problem?

2.21.x breaks for arm with the armv7a-sec instructions

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXQN4MkyGM64RGpERAsx5AKCB04hFrmSRRL0aOMD9fC1DtLAVrgCfY515
3SbJUUbRlN9MVco/B4Si/kQ=
=ulXL
-----END PGP SIGNATURE-----



