Return-Path: <k4230r6@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEF0607A4;
	Thu,  9 Jul 2015 10:35:15 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so14446163wiw.0;
	Thu, 09 Jul 2015 03:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZrtB3gAk1dMTKSb/C9a3Ww0yZaTc70ysmwrHAAet0iU=;
	b=fP0KVF6SXFjY5XTrUeE9DMYSt+0i8wBeiFZPfOBmNizhGG3GcV6cYviJtA/aqhQBmR
	z0GfVKRV1qJuJdgjIG92yzJBvqE0qo4n1ztPc9nz4Du2zjWY2hZRr5y4QYIshvVZGxCg
	/uPDNXNvHUD2gGb/yDEIGzguLj8E/TBqGwmCcAqf1qizaowjf+H9wopaN78E3vike0MM
	BmzEIgHyPibF0kQR3eps7OMcDm8wUhxJjceBBSm98MCOSHnJBV5DvvsW2BsXgv9RAMre
	r4ldAaELfcwDK34N2vBDJjKmsaS3VZ/AOrBbtQghya97EcUdmsKqFB2vCk5ayVthlpNd
	+Ogw==
MIME-Version: 1.0
X-Received: by 10.194.24.196 with SMTP id w4mr28392098wjf.137.1436438115306;
	Thu, 09 Jul 2015 03:35:15 -0700 (PDT)
Received: by 10.27.45.21 with HTTP; Thu, 9 Jul 2015 03:35:15 -0700 (PDT)
Received: by 10.27.45.21 with HTTP; Thu, 9 Jul 2015 03:35:15 -0700 (PDT)
In-Reply-To: <CAJTo0La0qFDC36msPioX=-=xsdWrhGSUrKC-9DokxV9Htx003Q@mail.gmail.com>
References: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0La0qFDC36msPioX=-=xsdWrhGSUrKC-9DokxV9Htx003Q@mail.gmail.com>
Date: Thu, 9 Jul 2015 12:35:15 +0200
Message-ID: <CAALGJZbmg2kqahBp5jFL4mk2N6upacQpmi9bpd3jSf5A-c4T8A@mail.gmail.com>
From: Christian Ege <k4230r6@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Thu, 09 Jul 2015 10:35:16 -0000
Content-Type: text/plain; charset=UTF-8

Am 09.07.2015 12:31 nachm. schrieb "Burton, Ross" <ross.burton@intel.com>:
>
> On 9 July 2015 at 11:24, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
>
> > What do people think? Should we be looking to make the switch back in
OE as
> > well?
> >
>
> I say we switch back to ffmpeg, and do it as soon as possible so we're not
> making this change during M3.
Switching to ffmpeg will be great, because kodi requires ffmpeg.

Another option could be supporting both.

Regards,
Christian
>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

