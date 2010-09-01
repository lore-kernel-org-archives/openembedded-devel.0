Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OqsAi-0004Xr-OT
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 20:36:33 +0200
Received: by gwb1 with SMTP id 1so3195505gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 11:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=vnlipYbahR/tQ/rC3BZuzuY69jcWl7kdn87UjiMBo6Q=;
	b=Ea3KR3dzSYbg2Pi34hwevTt2XAJVAQgeTqd82QuXWu4eDZaBiXSJ7J71OWqBxzYqdV
	isupApx6dmSIg2Gh1k0lyFmUZR5QsieDu2gEV88UKYiX9cL/taLbycytIWli6koCLX+Y
	mIMiqZ8DkA0KBMyesSVFX8SaOtczN2oXGyE1s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BAPsvw9nK07+wRxGuxZsfjm0rjDHs8KP6B8iKIzayCCBZYL5ku359nPxJi8bSQuDQ9
	Em85L3KSuM+ITbM2xXlJNdykNcx05raNUxWGo/7oERgYMa2No2BhvRQg8LyehDhEBwXc
	WUB5yPLCdCRspykALNMLF2EbSYaBVghv7dOjE=
MIME-Version: 1.0
Received: by 10.151.50.16 with SMTP id c16mr2058654ybk.41.1283366157474; Wed,
	01 Sep 2010 11:35:57 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 1 Sep 2010 11:35:57 -0700 (PDT)
In-Reply-To: <i5m4sn$l1b$3@dough.gmane.org>
References: <AANLkTinuQnnOAh62GF+v0TzU8mRj1F+m1YGi6DdohNmr@mail.gmail.com>
	<AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
	<i5m4sn$l1b$3@dough.gmane.org>
Date: Wed, 1 Sep 2010 20:35:57 +0200
Message-ID: <AANLkTikvh8BY9odbVKg55K-UJjQsnqVqsOWRkqsMQ+GZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-30
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
X-List-Received-Date: Wed, 01 Sep 2010 18:36:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/1 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 31-08-10 13:05, Cliff Brake wrote:
>> sending again as it appears the last email did not make it ...
>>
>>
>> ---------- Forwarded message ----------
>> From: Cliff Brake <cliff.brake@gmail.com>
>> Date: Mon, Aug 30, 2010 at 11:51 AM
>> Subject: testing branch 2010-08-30
>> To: openembedded-devel@lists.openembedded.org
>>
>>
>> Hello,
>>
>> Last weeks testing cycle was a good success I think -- thanks to all
>> who participated.
>>
>> http://wiki.openembedded.net/index.php/Testing
>
> Looking at the wiki it seems that extending tinderbox to show results
> for a certain git revision would be a lot easier to maintain, no?
>
> regards,
>
> Koen

Yes. Good idea. Feel free to add it.

Frans


