Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sz0VK-0007zi-7k for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 09:16:30 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sz0Ju-0002p3-89 for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 09:04:42 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2012 09:04:42 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2012 09:04:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 Aug 2012 09:04:49 +0200
Message-ID: <jvt31p$dms$1@dough.gmane.org>
References: <jvqqs2$tn3$1@dough.gmane.org>
	<20120807110710.GS3267@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <20120807110710.GS3267@jama.jama.net>
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
X-List-Received-Date: Wed, 08 Aug 2012 07:16:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-08-12 13:07, Martin Jansa schreef:
> On Tue, Aug 07, 2012 at 12:32:51PM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Hi,
>> 
>> I've applied a bunch of patches and hopefully commented on all the ones
>> I didn't apply. I also cleared the meta-oe patchwork so it's nice and
>> empty now:
>> http://patchwork.openembedded.org/project/oe/list/?q=meta-oe
>> 
>> If your patch hasn't been applied yet into meta-openembedded master and
>> is lacking comments, please resubmit it as [meta-oe][PATCH v(N+1)]
>> (substitute N please).
>> 
>> There are a few big deadlines coming up at work, so everything will
>> have a few days of delay but if you haven't seen any feedback after a
>> week and the patch is still sitting in patchwork, please send a
>> reminder. Replying to the patch with 'ping' is usually enough and most
>> people know where to find me on IRC.
> 
> There are few pending patches IMHO worth including, I can resend them in 
> some consolidated pull request (all pushed to jansa/pull already), but 
> listing pw ids is maybe easier for you to apply them:
> 
> systemctl mask (sorry I forgot to include meta-oe prefix): 33997 33999
> 
> patches from khem wit meta-systemd prefix: 33795 33793 33791 33789	33787

I didn't apply 33787, that needs coordination with other layers to prevent
breakage. I think doing a copy + delete a few days later is a better
migration path.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQIg+RMkyGM64RGpERAtaoAKCor8oB+MKfZoTcBlRh4WRhxiWaYACdH7jq
MQKEHA00lFfiBeOSKT6p83c=
=ulLp
-----END PGP SIGNATURE-----



