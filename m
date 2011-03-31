Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q5GXg-0002gJ-IZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 14:00:01 +0200
Received: by iwn10 with SMTP id 10so2546652iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 04:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=rzh5nDB5s11WlCA86W9cD14XFYQ3FgEvKYTUvSbl9lc=;
	b=YrMJjZEAfPLIhtzrIpmlAiDyDv21o5IuOc/AgUUKLpq93H7WZgaOdhTewGfSaVXpYF
	yygH4hfKmmTUY3yUh6kJNrLPghWiHC4JROtjifz8lssvZNp6i2Vyud40YCb8OUjkEx98
	BUGYyO+YmLWuiCrtAADLVVapBkzS+YOwD6rfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=v4JBYbzNuqQTdOKgE7NYbYFnKnLh6pmdoeh0dBUrbIWfhka9XxoJNJ/69vZj8c+3pG
	KnKNd3+R1UnBMBofYLsfhFWewXc1XsbbCB+T8CLxPQo2/8wx5lVcRTL+wpO0p1HWZwMS
	OZ+phBpb+pR5stY28yrzgz6vUMrv8TKy/Z7w0=
MIME-Version: 1.0
Received: by 10.42.115.129 with SMTP id k1mr2637314icq.457.1301572672883; Thu,
	31 Mar 2011 04:57:52 -0700 (PDT)
Received: by 10.231.43.6 with HTTP; Thu, 31 Mar 2011 04:57:52 -0700 (PDT)
In-Reply-To: <in1n4g$hvs$1@dough.gmane.org>
References: <20110331074506.GB23178@denix.org> <in1gf0$aun$1@dough.gmane.org>
	<AANLkTikn4r-ScRstfT_r-Adw36=682MEb_XHMKn+qs3_@mail.gmail.com>
	<in1n4g$hvs$1@dough.gmane.org>
Date: Thu, 31 Mar 2011 13:57:52 +0200
Message-ID: <AANLkTin8=R-0LBgbfKprsKuFCTL6DcU6em-dNAUv9Nrw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request for new TI machines, angstrom and qt4 fixes
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
X-List-Received-Date: Thu, 31 Mar 2011 12:00:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/31 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 31-03-11 12:51, Frans Meulenbroeks wrote:
>> Adding new machines on a maintenance branch seems somewhat odd as new
>> somewhat conflicts with maintenance.
>> is this what we want? And if so, what about adding new recipes?
>
> Since you aren't using, developing or supporting 2011.03-maintenance, I
> strongly object to your usage of 'we'.

I don't think you know what I am using, let alone what I am developing
at the moment, or my plans to support things.

Also the we was a general tone of voice meaning "we as OE".

But somehow I guess this is the hostile and unfriendly response to be
expected from you.
Instead of stimulating people to think with you, you bash them away.
And then tomorrow complain that people do not participate.
Now how would that come?
>
> Furthermore, this isn't the first time that new machines would get added
> to 2011.03-maintenance.

which might not be a good plan either.
>
> People really should read
> http://wiki.openembedded.org/index.php/2011.03-maintenance

Which does not speficy what should and should not be added
(apart from:
"Unless specific to code that no longer resides in a non-maintenance
branch (ie master here or oe-core / meta-oe / etc) code must be a
backport and should say where the code already resides (for ease of
review, interoperability checking and so forth). "
)


