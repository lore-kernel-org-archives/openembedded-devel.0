Return-Path: <cynthia.ms.chiu@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 182376FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:36:24 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id d204so8591554oig.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 12:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=VGm9pr3jBx+uWCpoVEJFf27Ckt3KbrrbrJnh3NWfJG8=;
	b=MCiKH62pC3TeIvcICeufUS+hh3MNqxOap3VJqPOALdYr8U9FjFm3xp85XS5x0lamFu
	YaDvwBzBJiNCoGVzJNsouY3GceGGOwtIFdeXsuD2QqTtOZqyTmla3u8VfWH9t4/eBXV2
	j0wYqSIMtwqUIxaor9CTJM5JcHJUdy4MuzaZnXDkxKi7Ng7tlLIYoL8M7SiVfRp8i1LA
	AmFDTOaABe8/m21i7MoplJ7shY91kCKYBumOt6fc//EVdV1HNs+zBlXBhU9aJrDfKOtG
	46ZTrpHVye2bx84bh9Q866nCJYZu7N+RWPtGWgo8zA38aWFjejesULUd7n3NzwF4zIf4
	6b8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=VGm9pr3jBx+uWCpoVEJFf27Ckt3KbrrbrJnh3NWfJG8=;
	b=F5HnuaQzSOAzDFTZ99Oz8vDunFdFIb3B0VIxDuDR4Yl7UXMHMyOoOFKDc2O21DGd6o
	dncQGIPyLxxFWOHDgIVZnqmElyZUqq1GwCin49sD5/9yxOWMy2nPACVy9cFhoUimkN0i
	aMzj0XtjHSz2OCZ6nSaqq97gLTVateySnyaGpAylLZlKgysqHlsY9I8ilg80BaS+ooSo
	SAyfl1FY6Yhz0mvmPZqQgJKKx2rHsKKJpLbqV8H76vjG+jcs2FlN7C08NiDQi53k8n/I
	DWzFNfJs4e39Ep0UOEHKZnZx+J5efZUa1NHmEk1XgZkAwcBhc9ilUiYAldSpL/4rnDPJ
	oyWg==
X-Gm-Message-State: ALyK8tIRbyPRTkPg6xa19Od4R9mj5+EwtLD1iM6AempKpaUKklWAbxjHXAXQf1C+ktzpZH1hAThZqGOjH3DCZQ==
X-Received: by 10.157.37.181 with SMTP id q50mr33233589ota.79.1469129784869;
	Thu, 21 Jul 2016 12:36:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.171.7 with HTTP; Thu, 21 Jul 2016 12:36:24 -0700 (PDT)
In-Reply-To: <CA+chaQcKT3UUFryKvo40Y2b4Ng28Afig3_257bx309PLN4VgNA@mail.gmail.com>
References: <1469035439-23466-1-git-send-email-cynthia.ms.chiu@gmail.com>
	<CA+chaQcKT3UUFryKvo40Y2b4Ng28Afig3_257bx309PLN4VgNA@mail.gmail.com>
From: Cynthia Chiu <cynthia.ms.chiu@gmail.com>
Date: Thu, 21 Jul 2016 13:36:24 -0600
Message-ID: <CAFn+KXAx=btsDOCrJEHn9YHkRo-6juNk=RV2gUKMBnMrCtbcBQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v3] Pointing the LIC_FILES_CHKSUM to a valid file.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2016 19:36:25 -0000
Content-Type: text/plain; charset=UTF-8

Will do. Thanks for your feedback!

On Wed, Jul 20, 2016 at 11:37 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Squash this into v2 to make it proper v3.
>
> Thanks.
>
> On Wed, Jul 20, 2016 at 7:23 PM, cynthiachiu <cynthia.ms.chiu@gmail.com>
> wrote:
>
> > Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
> > ---
> >  meta-oe/recipes-extended/canopennode/canopensocket_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > index 7c58a26..1e0f7d0 100644
> > --- a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "Linux CANOpen tools"
> >  DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
> >  LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM =
> > "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > +LIC_FILES_CHKSUM =
> > "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >
> >  SRC_URI = "gitsm://github.com/CANopenNode/CANopenSocket.git"
> >  SRCREV = "7777653da3a630b0dc02b3fa5ff029d9bc57cd26"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

