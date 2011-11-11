Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ROoie-00042o-7N for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 11:52:24 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ROoca-00088F-FK for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 11:46:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 11:46:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 11:46:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 11 Nov 2011 11:45:52 +0100
Message-ID: <j9iud0$16r$1@dough.gmane.org>
References: <4EBBE67F.20300@freyther.de>
	<j9gufv$35d$1@dough.gmane.org>	<20111110185732.GC20602@denix.org>
	<j9hbvk$b8u$2@dough.gmane.org>
	<20111110210133.GD20602@denix.org> <4EBCEE8B.10802@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <4EBCEE8B.10802@freyther.de>
X-Enigmail-Version: 1.3.2
Subject: Re: RFC Creation of a meta-telephony repository
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
X-List-Received-Date: Fri, 11 Nov 2011 10:52:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-11-11 10:44, Holger Freyther schreef:
> On 11/10/2011 10:01 PM, Denys Dmytriyenko wrote:
> 
>>> I haven't seen enough reason to place the burden for this layer on
>>> the OE admin team instead of doing 'self' hosting on
>>> gitorious/github/etc/
>> 
>> Well, first of all, when we had constrained resources at oe.org, we
>> were trying to limit the number of commercial layers, assuming that the
>> company behind such layer is well capable of providing hosting for
>> their product. That would mean BSP layers from semis, like Intel, TI,
>> Freescale etc. or commercial distro layers from OSVs, such as Mentor,
>> Montavista etc. We always welcomed community layers on oe.org, even BSP
>> layers for platforms that had no official commercial support, but also
>> distro, apps and other layers, as long as they had "supported by
>> community" status.
> 
> Okay,
> 
> i don't mind hosting this myself (either gitorious or really myself).
> The reason to ask for hosting it on OE was making it easier to
> collaborate with OE members and making it more easy to find the
> repository.

Having worked with layers for quite a while now I go through the following
list before creating one:

Does it need to be a layer? -> no -> send patches to existing layers
	|
	yes
	|
Does it need to be a seperate repo? -> no -> send patches to existing repos
	|
	yes
	|
Is github/gitorious/etc good enough? -> no -> ...
	|
	yes
	|
Create repo + layer

And after a I while re-evaluate it.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOvPzgMkyGM64RGpERAjNiAJ4114dbMzlf07Jsa4IeGGmhxX1n2QCfchcF
PmSc2wSo80JoBXbPHZo5PgM=
=ulrG
-----END PGP SIGNATURE-----



