Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA196D476
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 03:14:21 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id ht17so2833215vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 19:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2xXSVDe+uGF8On6ePSD+sWQ8JbpOU20+yvDEikSUYtQ=;
	b=Y4PgP/9ibQCvZGguO3IEZ/M1mDQ5EHzrOV/f6FYp8mwex7qmjyjqtqege9iecBKSHF
	+9lzQlBGOC8FC/5M85E+ycJauHzYvWzgcz2ZKRgssxpKOq44b4gCyLU069Qj3TbTgNpb
	o77qziJF/cxB7PEaLOpaOPRi3pSZOP8c84e6Fx2rOkCWp23B0Y/xy0liP9CMqthy4ngq
	QSMss95XvgOpZWZQRmSlDms7ApBs/3fJLd6HGGCdUBQQo8fUEs7fwTX1fbYKwfz+72pq
	HiHmkBaUKI7TAv5Bnzk2wNZjpVOOaxFMRYgeEloauexX1PCcUUlD4/r4J6zOVHI+C+fW
	Io6A==
MIME-Version: 1.0
X-Received: by 10.52.187.138 with SMTP id fs10mr26405575vdc.10.1384312462751; 
	Tue, 12 Nov 2013 19:14:22 -0800 (PST)
Received: by 10.52.187.132 with HTTP; Tue, 12 Nov 2013 19:14:22 -0800 (PST)
In-Reply-To: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
References: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
Date: Tue, 12 Nov 2013 19:14:22 -0800
Message-ID: <CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: libmpd-11.8.17 gets 404 Not Found
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
X-List-Received-Date: Wed, 13 Nov 2013 03:14:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Sorry, I shouldn't have mentioned anything about updating to Dora from
Dylan.
This 404 is happening in Dylan build.



On Tue, Nov 12, 2013 at 7:07 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> Hello everyone, my first post here. Not sure if I am posting at the right
> place.
> I am updating my meta layer to Dora from Dylan. At the moment,
> libmpd-11.8.17 is getting 404 Not Found. It is here -
> http://downloads.sourceforge.net/musicpd/libmpd/11.8.17/libmpd-11.8.17.tar.gz
> .
>
> Not sure if it's a temporary issue. Anyone else ran into this?
>
> Adam
>

