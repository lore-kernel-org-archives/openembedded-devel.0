Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PqmVD-0001uK-Ls
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 14:05:35 +0100
Received: by iwn10 with SMTP id 10so518972iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 05:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=9Q2NN7sYg/NoJ+0GPYpZA7OC+tqtY+TqhL6Frhz1QDA=;
	b=Cj5t9L/v1ybvu53VFCfOHJt/iUEtvoDwx/eLtTI5pTWB41DWdB654Vevaq2tu0c8Zx
	9FN1npI7UlvjsSHkpRvB0roK42vu77aD7Q9tK1+l++IkToqozPjfQo9fKq0IcLbcMxyl
	1Lv9nJ5b5O9yVitLECIApJUm4aqLRvZVi1oyA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JvLyvuge8xyWt3IdoL2LHIaQBHt9eODhiYDnj2pnU6PFOORgLnRTyFeEwZwY3UajnN
	lTC/Ti8IUNbLVH6GzqRWKsyMX+s6ogT4czzcc0VrOfPwBLUa/YtOzdxcTobsU8+tceek
	zQk6HclKxV8+Hm4AV+uCxuzd1SfTQM08ZV+FM=
MIME-Version: 1.0
Received: by 10.231.157.211 with SMTP id c19mr1341062ibx.172.1298120660319;
	Sat, 19 Feb 2011 05:04:20 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Sat, 19 Feb 2011 05:04:20 -0800 (PST)
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Date: Sat, 19 Feb 2011 14:04:20 +0100
Message-ID: <AANLkTinwo=chD6eARn_EQeJuRPwbUYsnkx0EBVLtbCvL@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Patchset pending for merging from O.S. Systems tree
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
X-List-Received-Date: Sat, 19 Feb 2011 13:05:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/18 Otavio Salvador <otavio@ossystems.com.br>:
>
> Hello,
>
> Those patches are the ones I sent some days ago, with the requested
> fixes and also with the acked-bys already given plus some new ones
> that have been cooked here afterwards.
>
> I've done a full build from scratch using those and it seems safe to
> get those in. Please ack/nack and push according.
>
> TIA,
>
> _______________________________________________
>
Applied the first 10 and the last patch.
Thanks for contributing.

I did not push the cmake patches as they have no acks yet and I feel
not comfortable with cmake.

Enjoy, Frans.


