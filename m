Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RRQYt-0005Pt-M2
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 16:41:08 +0100
Received: by faat2 with SMTP id t2so4561548faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 07:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=J4byhRLOqR11We3eZlxoKxE9YFaS9saKqS/zaVQeWmw=;
	b=QNrO8O0672fA7stHt3RYhJpPhHGSEeNJfzK3wJ0xxE+vgB+rXkpFOJxTQseGkZx6PM
	rG6jWXOmC8pZ7RI+kJnkjUU24Gtumfwas9O6hi8F3V6hPUeEjyyANG71zML9Q4dWSaBw
	Vwm6yuf3RNF1m444I7MxXlA15ioSGpbaav0Kk=
MIME-Version: 1.0
Received: by 10.152.148.168 with SMTP id tt8mr2406712lab.7.1321630475427; Fri,
	18 Nov 2011 07:34:35 -0800 (PST)
Received: by 10.152.24.36 with HTTP; Fri, 18 Nov 2011 07:34:35 -0800 (PST)
In-Reply-To: <ja59tk$sno$2@dough.gmane.org>
References: <1321575726-25190-1-git-send-email-raj.khem@gmail.com>
	<ja59tk$sno$2@dough.gmane.org>
Date: Fri, 18 Nov 2011 07:34:35 -0800
Message-ID: <CAMKF1sqgMD+4+cZuXgp-ACub0X0HQqaAjxoCgLMsiCConiQT6A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] gcc-4.6: Delete linaro patch that has been committed upstream
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
X-List-Received-Date: Fri, 18 Nov 2011 15:41:08 -0000
Content-Type: text/plain; charset=UTF-8

On Friday, November 18, 2011, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 18-11-11 01:22, Khem Raj schreef:
>> gcc-4.6-linaro-r106723.patch is actually a fix for PR 47551 and its
>> needed in oe-core therefore we have to delete this here since now it will
>> be part of oe-core
>
> Any idea when this will go into oe-core?

I need some builds going with it so looking for Saul and others to try it
out on scratch builds
I will keep an eye on it
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEYEARECAAYFAk7GKvQACgkQMkyGM64RGpGvuACdEZnnBkj9Bq2kyw+6tJBbmkp5
> 4ZwAnikMpRnHZRspmDDuA4XSJL7OqCYY
> =A/tL
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

