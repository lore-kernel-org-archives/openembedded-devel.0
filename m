Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PBDWc-0002uX-Oo
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 23:27:15 +0200
Received: by fxm3 with SMTP id 3so1255869fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 14:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=pBBMmLuadFMPjIMg952BAn7lgwUhXgN5TL94dHPEOmA=;
	b=I0zN+tQy7QyV6Mh4fbw70bNaRmX4YOiEjGwsR8AOhubL0f/WNIbTCjMCVwHfVuRUU2
	iuTGr+BK9uzbzVR7oNnsmg5NlmGb7UU0hC6ARbD1qyU32bxTGCC0Vmyt9pkWc8FRdUbj
	CKloQo8K4MYjhSOxHO4R5SNh4I2VnksUHgS/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=xSKK1k+cTyBAfPWqrIYTeEStYR7oRoctrEoke0sl7pmu18pMhX6HRSKlYVe8L0rduk
	1ugJQbgzC1/ayXz+DKkFCrzVcZD8m7SHh+5N9VWzRh1iEANLHCKMJZ2zC7rNP98vfWeB
	Tpct2tGb1EaEfLj94p7wxRc3LvpTzz4ziEk8Y=
Received: by 10.223.86.136 with SMTP id s8mr2952876fal.112.1288214773701; Wed,
	27 Oct 2010 14:26:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.112.201 with HTTP; Wed, 27 Oct 2010 14:25:53 -0700 (PDT)
In-Reply-To: <1288179182.1285.2607.camel@rex>
References: <1288179182.1285.2607.camel@rex>
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 27 Oct 2010 15:25:53 -0600
Message-ID: <AANLkTi=e7EBjHv21UOD2Hi2Ou_9ZS1YGXB6eOXUGgdt6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Poky 4.0 and Yocto 0.9 released
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
X-List-Received-Date: Wed, 27 Oct 2010 21:27:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

From the website it sounds like Yocto is a cross between OpenEmbedded and
Ubuntu?

It's used to build distributions in the same way that OpenEmbedded is.
Has 6-month release cycle, including binaries, like Ubuntu.

Is that correct?


What's the difference between Poky and Yocto then?

AJ ONeal


On Wed, Oct 27, 2010 at 5:33 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> It gives me pleasure to announce a new Poky release, Poky 'Laverne' 4.0
> and also Yocto 0.9, the first release of the Yocto Project. For more
> information about these, please see the new website:
>
> http://www.yoctoproject.org/
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

