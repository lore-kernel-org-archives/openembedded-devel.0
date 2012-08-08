Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sz0aV-0008Fu-VS for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 09:21:52 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sz0P8-0003KG-Hq for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 09:10:06 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2012 09:10:06 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2012 09:10:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 Aug 2012 09:06:05 +0200
Message-ID: <jvt345$dms$2@dough.gmane.org>
References: <jvqqs2$tn3$1@dough.gmane.org>
	<CAEsOVNc1onWY2n27Gk8O-H5NsKq_yUARxo9NXPuGdZQToR9mTw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CAEsOVNc1onWY2n27Gk8O-H5NsKq_yUARxo9NXPuGdZQToR9mTw@mail.gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: meta-openembedded patch queue
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
X-List-Received-Date: Wed, 08 Aug 2012 07:21:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-08-12 19:53, McClintock Matthew-B29882 schreef:
> On Tue, Aug 7, 2012 at 5:32 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote: Hi,
> 
> I've applied a bunch of patches and hopefully commented on all the ones
> I didn't apply. I also cleared the meta-oe patchwork so it's nice and
> empty now: http://patchwork.openembedded.org/project/oe/list/?q=meta-oe
> 
> If your patch hasn't been applied yet into meta-openembedded master and
> is lacking comments, please resubmit it as [meta-oe][PATCH v(N+1)]
> (substitute N please).
> 
> There are a few big deadlines coming up at work, so everything will have
> a few days of delay but if you haven't seen any feedback after a week and
> the patch is still sitting in patchwork, please send a reminder. Replying
> to the patch with 'ping' is usually enough and most people know where to
> find me on IRC.
> 
>> I have this:
> 
>> http://patchwork.openembedded.org/patch/32957/

Ah right, I did try that one, but forgot to actually send the feedback:

koen@dominion:/OE/tentacle/sources/meta-openembedded$ sh contrib/pw-am.sh 32957
2012-08-08 09:04:45 URL:http://patches.openembedded.org/patch/32957/mbox/
[1299] -> "pw-am-32957.patch" [1]
Applying: cramfs_cvs.bb: fix compile step so it can be rerun without failing
error: patch failed: meta-oe/recipes-support/cramfs/cramfs_cvs.bb:4
error: meta-oe/recipes-support/cramfs/cramfs_cvs.bb: patch does not apply
Patch failed at 0001 cramfs_cvs.bb: fix compile step so it can be rerun
without failing
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQIg/dMkyGM64RGpERAjyFAJ0UfXrIdMAHVinfQZgXk+Y01rOqMgCgm3kP
6PKqyfo7oHk/kGZSMNnpK8k=
=Ccup
-----END PGP SIGNATURE-----



