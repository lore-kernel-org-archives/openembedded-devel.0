Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sqk0q-0007sZ-DP for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 14:02:52 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sqjpu-0003fE-Fw for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 13:51:34 +0200
Received: from 188.207.89.201 ([188.207.89.201])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 13:51:34 +0200
Received: from koen by 188.207.89.201 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 13:51:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 16 Jul 2012 13:51:21 +0200
Message-ID: <ju0v7p$d5i$1@dough.gmane.org>
References: <1342437647-815-1-git-send-email-koen@dominion.thruhere.net>
	<5003FCF0.7030004@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 188.207.89.201
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <5003FCF0.7030004@mlbassoc.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-oe][PATCH] v4l-utils 0.8.8: disable qv4l2 build
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
X-List-Received-Date: Mon, 16 Jul 2012 12:02:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-07-12 13:37, Gary Thomas schreef:
> On 2012-07-16 05:20, Koen Kooi wrote:
>> It picks up host qmake and breaks the build.
> 
> Does it still break if you have QT in your image?

Yes, but image contents are irrelevant.

> If not, then perhaps this could be made conditional rather than just
> removed.

As said above, image contents are irrelevant, only DEPENDS matter.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQBAA5MkyGM64RGpERAunzAJ4hqATX7m/a1tY5C1gcdM8nBE8y9wCgsoPt
IuLMq7qMY51wc+dyZ9bGDis=
=TXNl
-----END PGP SIGNATURE-----



