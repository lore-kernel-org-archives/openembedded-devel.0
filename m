Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QylWr-0003yo-P2 for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 16:12:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QylS9-0004N3-Jn for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 16:07:41 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 16:07:41 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 16:07:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 31 Aug 2011 16:07:29 +0200
Message-ID: <j3lf71$5ck$1@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
	<1314785183.3769.22.camel@mattotaupa>
	<j3l22l$5ti$1@dough.gmane.org>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<CAP9ODKrs1WvLOpHNKsJu0Uf7_8zFQ_GPrPz=+ttdy5tces2gjw@mail.gmail.com>
	<j3lad2$v75$2@dough.gmane.org>
	<CAP9ODKrOqJ12xba98J=2PAdk7p+pK=gGO0e01wuy_xTMZjsRcg@mail.gmail.com>
	<j3ld1i$l0g$1@dough.gmane.org>
	<1314798564.3769.48.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1314798564.3769.48.camel@mattotaupa>
X-Enigmail-Version: 1.3.1
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 14:12:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-08-11 15:49, Paul Menzel schreef:
> Am Mittwoch, den 31.08.2011, 15:30 +0200 schrieb Koen Kooi:
>> Op 31-08-11 15:02, Otavio Salvador schreef:
> 
> […]
> 
>>> so or you change the policy or you follow it. Otherwise makes no
>>> sense to have a policy if the person who merge the patches do not
>>> follow it.
>> 
>> From http://wiki.openembedded.org/index.php/Category:Policy I read:
>> 
>> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines 
>> http://wiki.openembedded.org/index.php/Commit_Policy 
>> http://wiki.openembedded.org/index.php/Commit_log_example 
>> http://wiki.openembedded.org/index.php/Styleguide 
>> http://wiki.openembedded.org/index.php/Versioning_Policy
>> 
>> And none of those say PR = r0 is wanted behaviour. OTOH it doesn't say
>> it's unwanted either.
> 
> I am sorry for the confusion. It is actually all over the place in the 
> user manual [1].
> 
> $ git grep "r0" docs/
> 
> This is of course in oe.dev, but the manual is still advertised in the 
> Wiki [1].

Summary: The OE classic manual talks about it, but that's irrelevant for
meta-oe.

> PS: Koen, thank you for fixing your Thunderbird installation. At least it
> looks good in this message.

It turns out that "autowrap" doesn't have an off switch anymore, so the
"fix" was to set the wrap length to 78. The bug is still there, but you
don't notice it.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXkAhMkyGM64RGpERAsBEAKCcJkFIY2IGtKN+l1LmcUOObF30fwCeJ+Vf
RaFw6hncwiJFXCPV93OMdYM=
=x/Gl
-----END PGP SIGNATURE-----



