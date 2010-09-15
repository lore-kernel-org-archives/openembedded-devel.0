Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvqYA-0006ql-90
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 13:53:20 +0200
Received: by iwn2 with SMTP id 2so96044iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KH6UJdh8h4vKajJOzHkByxSwEvn0zwK9DfmXI2nWsA4=;
	b=TWAm5kNG9GxCTpspepeDkb/YPsiUUKc7DXkX2qeXRZueUKlWbUvIMnBtqylXWyK+g/
	zLK87Q3WkYpGPHu9kqKZsX2g/hrQTa4unJdC4UQ6p4zQq5RcqyXDr+MS7YC93Z3Vc9Sj
	F+YJsYExCn7Va98knnFOAJTjAjv56uNv4PKuU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=P7qiI8GH+VN01rqZUdrQwpu2xuuf6XrXV6fBtv58Asa2C+6x28MakpPx0y/8hqWZ7t
	tZbu5k+NFzQB+YAtSu+tiiFUQuR3vLpZqSis3EyKG3S3N1+XpSdE6RuR0ePI42O3xegR
	uYTCwdDWRlii0H4EHEF/hFiIr3KRrsfnfqXHU=
MIME-Version: 1.0
Received: by 10.231.157.195 with SMTP id c3mr1506987ibx.155.1284551549250;
	Wed, 15 Sep 2010 04:52:29 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Wed, 15 Sep 2010 04:52:29 -0700 (PDT)
In-Reply-To: <4C90A7E1.4030401@dresearch.de>
References: <4C90A7E1.4030401@dresearch.de>
Date: Wed, 15 Sep 2010 13:52:29 +0200
Message-ID: <AANLkTik1N_3sFrOqsWoBrcCSdYmBLoCOPdv-0dRwWzzB@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Sep 2010 11:53:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/15 Steffen Sledz <sledz@dresearch.de>:
> Can't push my changes today. :(
>
>> git push -v upstream
> Pushing to git://git.openembedded.net/openembedded
> fatal: The remote end hung up unexpectedly
>
> Steffen
>

Hm.
I see that every once in a while too when doing a pull. Pulling a
second time then often works for me, but I guess you tried pushing a
2nd time.
And there are no new changes for 13 hrs.
Guess we'll have to wait for the west coast to wake up

Frans.


