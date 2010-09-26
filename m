Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Ozekd-0006lK-Q6
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 02:05:56 +0200
Received: by iwn2 with SMTP id 2so1743127iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 17:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=e10pCeymBy/6Ul7LMrBvte9ua5nsEaUNsaDHB5r9Mqw=;
	b=Z4ttjaUf/U295EbOUaWMyyls47YnALO8uAUGgDUH1LlNkz554zblD6e6Rt8IF97pRN
	PNH9prdi4LEZ4FolNl9QE826j1QBgWd8qI8G6DZtwMAjxReGwiUU7mfG0ecfpgQ5++tN
	QsqUmnYPrftmwLRY1I/A40G+B/Pq5DVKywTL0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=V2StVf2xhWidBINMzXQX1hyxgO7VDNrBvMoUECalriy37DTzroYgOR0wkFl+iIpkiY
	Rb19r9PLckGh8kO+NIKchsEi30IvuSmPaQPZhV9wL1qK5ZGkUya7Nqfq6x/kY2jhbxNs
	9yyNJgRNWhm7BTrZuvirYfa22DTvbBtBWdgoc=
MIME-Version: 1.0
Received: by 10.231.39.201 with SMTP id h9mr6527366ibe.27.1285459548598; Sat,
	25 Sep 2010 17:05:48 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Sat, 25 Sep 2010 17:05:48 -0700 (PDT)
In-Reply-To: <AANLkTi=yzQKfFvBDGM2JtTGoz+Zq40M0VcaZVYOxcaWy@mail.gmail.com>
References: <AANLkTi=yzQKfFvBDGM2JtTGoz+Zq40M0VcaZVYOxcaWy@mail.gmail.com>
Date: Sun, 26 Sep 2010 09:35:48 +0930
Message-ID: <AANLkTi=Ot8PQi0+0CgtiNDP85FkKcvxssPQOhSbbDgk+@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc 4.5 - linaro into OE
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
X-List-Received-Date: Sun, 26 Sep 2010 00:05:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 26 September 2010 03:18, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> I have ported some patches from linaro into OE gcc 4.5, they work fine
> and the tests results look good
> it should improve the performance too. It would be nice if somebody
> could try this out and report any
> issues. Results of my gcc testsuite run are here
>
> http://uclibc.org/~kraj/gcc-results/
>
> I will post any performance results if I do
>
> The git branch is khem/import-linaro-gcc-4.5
>
> Thanks
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Forgive my ignorance, what is the nature of the linaro patches?

-Graham


