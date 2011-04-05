Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q73hr-000565-Im for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 12:41:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q73fo-0005qJ-V2 for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 12:39:48 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 12:39:48 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 12:39:48 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 05 Apr 2011 12:39:35 +0200
Message-ID: <inerh7$g3o$1@dough.gmane.org>
References: <1300981024-9111-2-git-send-email-obi@opendreambox.org>	<1300983264-16652-1-git-send-email-obi@opendreambox.org>	<4D99C0EA.5070902@opendreambox.org>	<inciqg$3vi$2@dough.gmane.org>	<4D99E05E.9020100@opendreambox.org>	<ind0l0$io$1@dough.gmane.org>	<4D9A0A1D.3020209@opendreambox.org>	<inecec$sae$2@dough.gmane.org>	<4D9ADC0D.6060603@opendreambox.org>
	<inen1t$mgv$1@dough.gmane.org>
	<1301995968.14449.293.camel@phil-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1301995968.14449.293.camel@phil-desktop>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCHv2] kernel/module-base: Append PR to MACHINE_KERNEL_PR
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
X-List-Received-Date: Tue, 05 Apr 2011 10:41:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-04-11 11:32, Phil Blundell wrote:
> On Tue, 2011-04-05 at 11:23 +0200, Koen Kooi wrote:
>> On 05-04-11 11:08, Andreas Oberritter wrote:
>>> Thereby making MACHINE_KERNEL_PR mandatory for all machines?
>>
>> I don't see why not.
> 
> The majority of machines aren't using it at present so this would be an
> unexpected (and presumably unwelcome) change for them.  That seems like
> a bad idea unless there is a compelling reason why it needs to be done.

First: You don't get to complain about broken kernel module PRs when you
are against rebuilding them when the kernel changes.

Second: the majority of machines doesn't even build, so those kind of
arguments are bogus

So apart from handwaving ("presumably unwelcome") do you have any actual
arguments against moving all machines to MACHINE_KERNEL_PR?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNmvFnMkyGM64RGpERAqqkAJ4vgIlyQ3cgVAnZS2rcjdGJHjn3uQCfTOjt
UtUZ9dRa9XfWvnganZPrAbg=
=KtE5
-----END PGP SIGNATURE-----



