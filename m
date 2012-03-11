Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S6lAm-0002RD-D9
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 16:59:04 +0100
Received: by lagw12 with SMTP id w12so3047462lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2012 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=886pSc3membHIpukWIfy/DDlEN6a0NfX52I2+yUHYr4=;
	b=TvK0G59UAehrggCHNq8aVHY02ldkSDjc5RwAxLgraGVavoUnztL2nxrgrsqNhPO4Hm
	S0SrycuESJhJ0Y3B+H+pEOH7myA76arim4byuNzdbTHsJPtJX3cQcC7TW8xBNeB1dhxO
	LpTDQDZ+10rl/VvgJpijV4k5M1PchO0xFieqmCx+51uJMK2rWEIHG2ybIkRbWGdHbEtc
	WH0RQSuRhE0S2BAqaJ08hCAjPEgj+5CD9AmhWy5wJmnv46O5wd2cCBBcJc3aCIg0eOMv
	nmew3igOToWk7uZxOK57PtchBlIncQrlBeU5RgaxElIHbkKJElFLWXBLx/H6VhFQCHAm
	Fsxw==
Received: by 10.112.29.200 with SMTP id m8mr3465452lbh.44.1331481022251; Sun,
	11 Mar 2012 08:50:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Sun, 11 Mar 2012 08:49:52 -0700 (PDT)
In-Reply-To: <1329916893.4422.8.camel@jethro.cheepee.homedns.org>
References: <1329869118-16435-1-git-send-email-cheepeero@gmx.net>
	<ji29qe$565$1@dough.gmane.org>
	<1329916893.4422.8.camel@jethro.cheepee.homedns.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Mar 2012 08:49:52 -0700
Message-ID: <CAMKF1srh5PGuH0Xhv19cZvsv9iuKvbgHJmWiMNzzNaT2aPcLFA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] v4l-utils: skip qv4l2 instead of using host toolchain
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
X-List-Received-Date: Sun, 11 Mar 2012 15:59:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 22, 2012 at 5:21 AM, Ciprian Ciubotariu <cheepeero@gmx.net> wrote:
> It's a reference to our internal issue tracker, which scans commit
> messages for such 'See #blah' references and makes a nice list of
> commits attached to each issue.
>
> I can strip that if needed.
>
> I was actually wondering how one can obey commit policies of more than
> one community, and still make use of git's DSCM abilities.

please strip it and resubmit. patch guidelines are on OE wiki

>
> On Wed, 2012-02-22 at 09:42 +0100, Koen Kooi wrote:
>>
>> Op 22-02-12 01:05, Ciprian Ciubotariu schreef:
>> > See #2134
>>
>> What does that mean?
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


