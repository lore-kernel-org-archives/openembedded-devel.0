Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OwDLM-0006CT-5V
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 14:13:36 +0200
Received: by iwn2 with SMTP id 2so1028923iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 05:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RFXRRzyL5h9iT5PNUN23Ktb2io9RKRKlVXWzjQjTOI4=;
	b=RK3kBdCkzCfdRUMBUzUcX2opIzH+KoU3rUowwXGSFZfFYLuyKcdpEkoty/XYmJf6Jh
	Y7R/AdNPHIDtWxKV3Vcp19Y4M9OHclzbBH3ibBCZQREAmxww3QiY3AWiIjeOVRtlF9eM
	fw5kkrptX1Z1VhVSjsyrjoJ2ESYqteM6t0Ne0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pz8/njSFSz1gOtpllEu+8sLiupOFVfMw47+DyERKe6kpg4pECFxzaSdz155yDsEnMZ
	xpUWDYdJ/d+IO3cqRTT4O+Nb66OoDxF+/jbuw46qQpmKQcL6KdI/BvemA2MucqFD6Epk
	bnNblvQ00JRKBFYRiPjUbcayrwMQHVS9q0/ts=
MIME-Version: 1.0
Received: by 10.231.157.207 with SMTP id c15mr3363770ibx.143.1284639167178;
	Thu, 16 Sep 2010 05:12:47 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Thu, 16 Sep 2010 05:12:47 -0700 (PDT)
In-Reply-To: <1284633626.3825.52.camel@mattotaupa>
References: <4C90A7E1.4030401@dresearch.de> <4C91EF7C.7080209@dresearch.de>
	<1284633626.3825.52.camel@mattotaupa>
Date: Thu, 16 Sep 2010 14:12:47 +0200
Message-ID: <AANLkTi=VC0YNXYb4JfOtXrsyq_FWkXbxeg_aOXLYUnfZ@mail.gmail.com>
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
Subject: Re: fatal: The remote end hung up unexpectedly
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
X-List-Received-Date: Thu, 16 Sep 2010 12:13:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/16 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Donnerstag, den 16.09.2010, 12:20 +0200 schrieb Steffen Sledz:
>> Am 15.09.2010 13:02, schrieb Steffen Sledz:
>> > Can't push my changes today. :(
>> >
>> >> git push -v upstream
>> > Pushing to git://git.openembedded.net/openembedded
>> > fatal: The remote end hung up unexpectedly
>>
>> Sorry, my mistake. Local configuration error.
>>
>> git://git.openembedded.net/openembedded vs. git@git.openembedded.org:ope=
nembedded
>
> I do not have commit access so I have to use
>
> =A0 =A0git://git.openembedded.net/openembedded
>
> which is failing for me.
>

For ro you can also try the repo.or.cz mirror (especially if you are in EU)

Frans


