Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCCE65DF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 12:56:57 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rl12so10453053iec.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=l5H++yJWl00R6HJHfKYeZsrMj+YsjESdOcs3wKZrY3c=;
	b=lgLLMgUbhZKY9czjiJB9fVgoInCQzN8bcFYONyRdapYVsmo4y/B7ZRHvvxFbHdD3Zm
	JZ+8Zu5S5cF0vdXiXmFbgi4ZpOjUGr4MCTb2/mc7ahSsAD80Y9FrNjD3MuYCytpii/cp
	XBstFO9ULaXve11Mcw9ha+Es8g9yjpp68Olct/5/VGQfNE9jHFp2E4uu1mhn500cfgpR
	eA7ZLh87hdOae/v9vs7IUsmYa9nnawwWTR9Lpr8ilXF6t9+gHMeoS+nNG1MLr/DJpFFK
	6hgpqUkdA5MsiwNTdBkU/yXMnlhgUj828xbg3HF1DH93hAlDxXPlunjrkU0BYQ2UAiVF
	EMgw==
MIME-Version: 1.0
X-Received: by 10.50.138.72 with SMTP id qo8mr9904732igb.26.1397653017995;
	Wed, 16 Apr 2014 05:56:57 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Wed, 16 Apr 2014 05:56:57 -0700 (PDT)
In-Reply-To: <CAMKF1srO8NBNuYbMhbwUO3df8+Q3aDoUmzHUinDy9V_WKuBsRA@mail.gmail.com>
References: <00d101cf5942$91feeb30$b5fcc190$@lge.com>
	<CAMKF1srO8NBNuYbMhbwUO3df8+Q3aDoUmzHUinDy9V_WKuBsRA@mail.gmail.com>
Date: Wed, 16 Apr 2014 21:56:57 +0900
Message-ID: <CALYKT1hwGK7c9QcXMRXpMPLbP69zoa_49QBhZXpOaYec7geVRQ@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How can I get the toolchain?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Apr 2014 12:57:00 -0000
Content-Type: text/plain; charset=UTF-8

Hi Changhyeok Bae,

I raised similar questions and received good pointers and explanations:

http://thread.gmane.org/gmane.comp.handhelds.openembedded

Find the QnA titled with:

[oe] Where can I get a arm cross toolchain for oe-core?

I only able to give you pointers to answers I received.

Good luck!

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-04-16 17:02 GMT+09:00 Khem Raj <raj.khem@gmail.com>:

> On Wed, Apr 16, 2014 at 12:07 AM, Changhyeok Bae <changhyeok.bae@lge.com>
> wrote:
> > Hi,
> >
> > How can I extract the toolchain in my oe build result?
> >
>
> bitbake -cpopulate_sdk <yourimage>
> should generate a self-installer .sh script which then you can run and
> install it
>
> > Regards,
> > Changhyeok
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

