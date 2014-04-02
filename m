Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 25AA46F9FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 00:09:02 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so8389122wgg.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 17:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ABOQOJhEfwlme2pX6Y6AHNsWhd31AMUJ4tzlMsjUWs4=;
	b=pDTcNv/VsFXyBastH4ch9MTW9Tdq21xXKjYrcO2RoCpKkHZMZ8a+37302REjqXsPIj
	xnIi+POMs6QBkBBmcNBvCaJ0i40La2qXWDsREOxovkqBNFMtE7bn4TbnIgSdRwYq0y3K
	8c7aFjhA7loITshSvnTHHXiXSF7voi0gUXOfbx7P4w67E4Y+NdG+DnH2dls1U7C7fZ6A
	AY1Lv8h6TnxMiBjHER4a0Q5nYUzn5dm+QXHyy4/InF1SWJUYDokIGsH/3avZ8cM2M6AF
	zNb8w4/jD26Ur0sQSumGCvndAFaF7oyLAR6yN6dqOFw3BhkJarqTmtdhNaGpxba1QEVq
	w1zw==
MIME-Version: 1.0
X-Received: by 10.180.105.65 with SMTP id gk1mr23958485wib.12.1396397342725;
	Tue, 01 Apr 2014 17:09:02 -0700 (PDT)
Received: by 10.216.117.6 with HTTP; Tue, 1 Apr 2014 17:09:02 -0700 (PDT)
Date: Tue, 1 Apr 2014 17:09:02 -0700
Message-ID: <CAOLEWZWxEZNDkg8v7oSoqjzA0mYXxW2pRMWqcraCLhYNRbA6nA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] changed gnuplot recipe license to gnuplot
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
X-List-Received-Date: Wed, 02 Apr 2014 00:09:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Was working with Martin on this one; the "original" patch referred to is
Tim's gnuplot upgrade patch.  The patch being superseded is my earlier
patch from today that included Tim's changes plus the license change.
*And* the license file patch was just resent as a patch to meta-oe, so
hopefully we're good on this one...

Steve


On Tue, Apr 1, 2014 at 4:14 PM, Paul Barker <paul@paulbarker.me.uk> wrote:

> On 1 April 2014 23:36, Stephen Arnold <stephen.arnold42@gmail.com> wrote:
> > Also sent license file patch for oe-core.  This supercedes previous
> gnuplot
> > patch that incorrectly included the original gnuplot patch changes as
> well.
>
> Just got a few bits of general advice on submitting patches to
> OpenEmbedded:
>
> Each patch subject should be of the form "thing: change", where thing
> is usually the recipe name. So this would be "gnuplot: Use gnuplot
> license" or something similar.
>
> The "[PATCH]" tag should be "[PATCH v2]" if you're superseding a
> previously sent but not yet merged patch. In this case, it's unclear
> which patch your mean. Please email in reply to the patch you want to
> cancel so that the maintainers know not to merge it.
>
> There's a lot of further detailed advice and guidelines at
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> Thanks,
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

