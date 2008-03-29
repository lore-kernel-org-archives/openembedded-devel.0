Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jfdfz-0005Oc-JM
	for openembedded-devel@openembedded.org; Sat, 29 Mar 2008 17:13:03 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jfdfw-0000Px-Md
	for openembedded-devel@openembedded.org; Sat, 29 Mar 2008 16:13:00 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 29 Mar 2008 16:13:00 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 29 Mar 2008 16:13:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sat, 29 Mar 2008 17:12:52 +0100
Message-ID: <fslpq4$5dq$1@ger.gmane.org>
References: <200803291626.09506.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803291626.09506.zecke@selfish.org>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: Request for help on daggy fixes and NCC
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Mar 2008 16:13:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:

| Sadly this merge triggers another NCC and I think the danger of breaking
| something in manually fixing the NCC is higher than the use of a daggy
fix.
| So what is your opinion on this? Would you do daggy fixes? Would you
avoid
| them? Would you first try and see if the result is mergable?
|
| Thankfully I could use mtn db to kill the daggy fix rev manually and
now need
| to apply the fix on top. And I love the concept of the daggy fix :(

My experience with OE developers is that daggy fixed is such a non-cvs
concept that if one would do a daggy fix, people would start bitching on
IRC about creating multiple heads and a 'bogus' merge for working of an
'old' OE tree.

If only monotone had something like 'hg transplant'....

regards,

Koen

PS: daggy fixes rock!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH7mqEMkyGM64RGpERAk31AJ9o7mvrhEGSOEebHyAJLE7xR3ldeACeMNGT
+ombgToVwHZ4lo0cV9n3G3g=
=5I31
-----END PGP SIGNATURE-----



