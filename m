Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SqMIr-0005Mb-BS for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jul 2012 12:43:53 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SqM7y-0006cx-0N for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jul 2012 12:32:38 +0200
Received: from 188.207.89.201 ([188.207.89.201])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jul 2012 12:32:38 +0200
Received: from koen by 188.207.89.201 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jul 2012 12:32:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 15 Jul 2012 12:32:25 +0200
Message-ID: <jtu67p$oft$1@dough.gmane.org>
References: <1342193205-25293-1-git-send-email-koen@dominion.thruhere.net>
	<4461686.rdlsglFAG9@helios>
	<3797A80A-708E-422C-B501-ADDB47AD4541@dominion.thruhere.net>
	<1545322.vi2fespzus@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 188.207.89.201
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <1545322.vi2fespzus@helios>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-oe][meta-efl][PATCH] various: update ; proto= to ; protocol= in SRC_URI
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
X-List-Received-Date: Sun, 15 Jul 2012 10:43:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-07-12 17:40, Paul Eggleton schreef:
> On Friday 13 July 2012 17:37:47 Koen Kooi wrote:
>> Op 13 jul. 2012, om 17:35 heeft Paul Eggleton het volgende geschreven:
>>> On Friday 13 July 2012 17:26:45 Koen Kooi wrote:
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> 
>>> Just checking, you're aware that for the svn fetcher this will break
>>> with older versions of bitbake that don't have the recent patch
>>> applied?
>>> 
>>> If that's not a concern, no problem.
>> 
>> Not a concern for meta-oe master, only for release branches :)
> 
> My thinking was that at least in the OE-Classic days we didn't expect the
> user to have bleeding edge bitbake even in master.

OE-core changed all that :/ I know RP avoids hard dependencies, but to avoid
"that was fixed in bitbake master last week" type of responses the angstrom
scripts that track oe-core master also track bitbake master.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQApw5MkyGM64RGpERAuCnAKCB6B5X4jcmHpbFnbRFfvzw9wZ+OgCeMZzc
+KDiQv7qTysxp+Ryoj3Q2EM=
=pbrL
-----END PGP SIGNATURE-----



