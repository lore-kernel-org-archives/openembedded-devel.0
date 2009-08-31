Received: from [64.71.164.66] (helo=madrid.hostgo.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <javiroman@kernel-labs.org>) id 1MiCaj-0003jt-Fh
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 21:31:03 +0200
Received: from mail-fx0-f224.google.com ([209.85.220.224])
	by madrid.hostgo.com with esmtpsa (TLSv1:RC4-MD5:128) (Exim 4.69)
	(envelope-from <javiroman@kernel-labs.org>) id 1MiCIj-0004Fq-Uu
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 15:12:26 -0400
Received: by fxm24 with SMTP id 24so1947716fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 12:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.15.11 with SMTP id i11mr1873432faa.105.1251745943063; Mon, 
	31 Aug 2009 12:12:23 -0700 (PDT)
In-Reply-To: <4A9C0CA3.7050906@balister.org>
References: <12c2e32e0908310716r696a7dadrdc330ad9d4b1eb65@mail.gmail.com> 
	<200908311722.45126.mickey@vanille-media.de>
	<12c2e32e0908311041g71b15fd7j102c162d440a7776@mail.gmail.com> 
	<4A9C0CA3.7050906@balister.org>
From: Javi Roman <javiroman@kernel-labs.org>
Date: Mon, 31 Aug 2009 21:12:03 +0200
Message-ID: <12c2e32e0908311212m6a4a04fcpda63d338c455e426@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - madrid.hostgo.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - kernel-labs.org
Subject: Re: DISTRO minimal.conf for ARM architectures
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
X-List-Received-Date: Mon, 31 Aug 2009 19:31:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 31, 2009 at 7:47 PM, Philip Balister<philip@balister.org> wrote:
> Javi Roman wrote:
>>
>> On Mon, Aug 31, 2009 at 5:22 PM, Michael 'Mickey'
>> Lauer<mickey@vanille-media.de> wrote:
>> By the way, I'm trying to use the minimal distro for Beagleboard,
>> instead of Angstron, because of I have thought minimal distro is a
>> good point of start a fresh (o vanilla) basic distribution, and
>> Angstron is a more complete and cutting edge distribution for
>> Beagleboard platform (as Koen has told me).
>
> I think you are confusing choice of DISTRO and choice of image.You can
> create vanilla images with Angstrom.
>
> We really need to put something on the wiki explaining what DISTRO means in
> the OE context.
>

Oh, no, I understand the meaning of a DISTRO (I guess). The point here
is I was looking for a DISTRO, a base DISTRO (or generic distro,
better than "minimal") for a set of different boards that I have (ARM,
PPC, MIPS, x86) .

I have built a minimal.conf distro for ALIX board, and I would like to
build the same distro (I'm not talking about the final image) for a
Beagle board (for example), with the same eglibc, gcc, ... and so
forth. I'm talking about a base line distro.

It is possible that minimal.conf distro is not for I am using, I mean
is not a generic distro at all. I'm a little bit confused about it.


-- 
Javi Roman
Sent from Madrid, Spain


