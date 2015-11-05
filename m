Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id E9E677709E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 11:42:52 +0000 (UTC)
Received: by ioll68 with SMTP id l68so87452991iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 03:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0ZDFmzESnoihuKekToUWf7hRBGTZ7o9TCT2bQDi+hKg=;
	b=xN1UoNfPmCL+aLoqAbfnxgpan/lY5/oi9nW6G/Yx4b6R8tFiMslxqu0gewXh9qhWAk
	Wera2Juc5SCBnzDVqk5uJ9k9FeboTzFKHRTTIPAVUJMYFxRFhIGlTwxmpeLlB0EpRVDX
	JVBfB/cigctdUpqYZiHKZWEhqt3f04yQAqSipd8w+ITlJu9DGV4E3p/8lo7dPqwSnlXm
	BtDVcKX1zCpR6METv2/EIjItZbb7v9nzRAy9rF/ceCFLBAYpsRQdHnaXHiK16Zh1HPQh
	9/B8WEHbmJBOJawpG8VER8M5LAUpMN7+PTVrlwlvilvjAe/VRqzw2ecFQnjcxqBmnIsF
	mz4g==
MIME-Version: 1.0
X-Received: by 10.107.135.95 with SMTP id j92mr8282868iod.148.1446723772316;
	Thu, 05 Nov 2015 03:42:52 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Thu, 5 Nov 2015 03:42:52 -0800 (PST)
In-Reply-To: <CAJTo0LZ=_5fwRDRXsY9sHNfq_XMjp6RQ4neGcCT2rs+od0Gz0g@mail.gmail.com>
References: <1446719398-14391-1-git-send-email-adrian.freihofer@gmail.com>
	<CAJTo0LZ=_5fwRDRXsY9sHNfq_XMjp6RQ4neGcCT2rs+od0Gz0g@mail.gmail.com>
Date: Thu, 5 Nov 2015 12:42:52 +0100
Message-ID: <CALbNGRRqc-MUa++9kU8A=tgRKf=1BG-0huwQMHcJ294gJcuAuQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libqmi: update to 1.12.6
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
X-List-Received-Date: Thu, 05 Nov 2015 11:42:53 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 5, 2015 at 11:49 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 5 November 2015 at 10:29, Adrian Freihofer <adrian.freihofer@gmail.com>
> wrote:
>>
>> +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
>
>
> Wrong list, this should go to openembedded-devel@.
>
> Ross
>
When sending to correct list: Could you add the error message in the
commit message please? I am wondering why my builds of ModemManager
don't fail.

Andreas

