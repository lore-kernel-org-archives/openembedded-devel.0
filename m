Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jf8dC-0007WY-Ru
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 08:04:06 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jf8d9-0003Sk-2g
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 07:04:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 07:04:03 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 07:04:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Fri, 28 Mar 2008 08:03:49 +0100
Message-ID: <fsi58m$7j8$1@ger.gmane.org>
References: <1206638249.4514.57.camel@dax.rpnet.com>	<fsgsaq$nqf$1@ger.gmane.org>
	<1206659222.4514.59.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1206659222.4514.59.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: kernel breackage, was Re: ipkg/opkg offical response
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
X-List-Received-Date: Fri, 28 Mar 2008 07:04:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
| On Thu, 2008-03-27 at 20:25 +0100, Koen Kooi wrote:
|> Richard Purdie schreef:
|>
|> | * Adding do_deploy to packaged-staging's knowledge. This is best done
|> | with the patch for kernel.bbclass that thesing was been working on.
I've
|> | made some suggestions for tweaks (looking at the version already in
|> | poky) and suggested he commits it after that.
|>
|> That patch broke uImage kernels *real bad*, I just pushed a fix for it.
|>
|> Proper review on mailinglist first next time?
|
| Well, it was posted for review on the mailing list and I was one of the
| few people who actually responded ;-).

You're being deliberatly obtuse.
http://lists.linuxtogo.org/pipermail/openembedded-devel/2008-March/004613.html
looks nothing like the patch that was committed, it doesn't have bugs
Jeremy and I fixed.
Or are you saying it's okay that people commit something different than
what was reviewed?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH7JhVMkyGM64RGpERAjcBAJ44PFUYtx86MAFoPwCQfJLGbUjxTACePy/y
KdT7FnpKR9ElE/JNayfIqww=
=JaFL
-----END PGP SIGNATURE-----



