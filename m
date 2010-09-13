Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvCUi-0005fR-0e
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 19:07:12 +0200
Received: by iwn2 with SMTP id 2so5333840iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 10:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VZ5Z3sUFNHHT50+qEeJ4vRqB09ZDs78c5G6Jizw2iO0=;
	b=daAPwrgCMCbVL1zUU1cdmAqZuHcjZomPu8lTB8b/CrtLHEzITnmRtF2Nxhbnz0N27o
	N4gPsNelmZLF/RjOEc9sqtc0cx5ioVkZHrhoateWR87jjb6C7/pd1srBb17HVOx99qut
	Gl/MCDMMvw9+Pxzb8TJkkmkF8ZTURXegIgynA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=avyiROuE9qCCG4S4k8AHqAnNxBJveG83EozlUvrTk4QEpDP0Dd6hohE6PdtBq8amlH
	VZVkzP0UP42YFFgfWgjzx15Lkcz1865w0VnFkRkEBdQeQ62iLfkvDbqqSNccUuBD7+lk
	s3KJzO4YBMQlWeADhPTD9/vt2SFE14IE2orf8=
MIME-Version: 1.0
Received: by 10.231.33.203 with SMTP id i11mr6111540ibd.8.1284397555009; Mon,
	13 Sep 2010 10:05:55 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 10:05:53 -0700 (PDT)
In-Reply-To: <AANLkTik5uYeMJ5uzFgUEGCjUsB+ApnHptsMOBBzHGMQ+@mail.gmail.com>
References: <AANLkTimgF4zbXEyzYK-BQqtgiv2fk1rvgi3W4MdfQ5Wt@mail.gmail.com>
	<201008312105.45051.roman@khimov.ru>
	<AANLkTik5uYeMJ5uzFgUEGCjUsB+ApnHptsMOBBzHGMQ+@mail.gmail.com>
Date: Mon, 13 Sep 2010 19:05:53 +0200
Message-ID: <AANLkTin9DhwF5QWg+Cs8bFf43vaJ5F7N1kHGoOqnO+rz@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: branch namespace clutter
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
X-List-Received-Date: Mon, 13 Sep 2010 17:07:22 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/9/13 Cliff Brake <cliff.brake@gmail.com>:
> On Tue, Aug 31, 2010 at 1:05 PM, Roman I Khimov <roman@khimov.ru> wrote:
>> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB=
 30 =C1=D7=C7=D5=D3=D4=C1 2010 19:56:52 =C1=D7=D4=CF=D2 Cliff Brake =CE=C1=
=D0=C9=D3=C1=CC:
>>> If there are any branches in the OE git repo that are no longer in
>>> use, please let me know and I'll delete them. =9AOur branch namespace i=
s
>>> getting rather cluttered.
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/refs/heads
>>
>> Please, drop "rik/perl-5.10", that one was merged long ago.
>
> Thanks, I think I have taken care of all the proposed deletions to date.
>
> Thanks,
> Cliff

These ones haven't had a push for 3-4 years.
Guess they are obsolete or merged. Can the owner confirm?

org.openembedded.oetest	modules/chksum_checker/chksum.py: Generate a
checksum.ini from already downlo...	Holger Freyther	3 years
org.openembedded.oz354fam083	handhelds-pxa-2.6_2.6.15-hh1: add a patch
to fix resume on h2200.	Matt Reimer	4 years
org.openembedded.oz354x	linux-hotplug: Import patch from .dev by hrw.
Thanks Bernardo	Matthias Hentges	4 years
org.openembedded.packaged-staging	packaged-staging.bbclass: add some
usage notes	Koen Kooi	4 years

Also some seem from people that are gone (and some I have no idea who they =
are).

Frans


