Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id 52FD26F766
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 4AA6B358F8CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 10:10:41 -0500 (EST)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 4VzhckXz7He4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 10:10:40 -0500 (EST)
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.rogue-research.com (Postfix) with ESMTPSA id CAB91358F8BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 10:10:40 -0500 (EST)
Received: by mail-vc0-f172.google.com with SMTP id la4so837044vcb.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Mar 2014 07:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	bh=HF6TJGbgGyvsN/uwxDge5is1IMGm0d3PCb/JYY//jYw=;
	b=XaGBJDpo+AjoNfWg4kbX5MCh8DhaGHZmqiT32q4Qhovb9bQ3e1fL2dcxLj4nMlWmi2
	wx+9GXy9anzhhV0QEu4t043D3FzpELvBh5RW06nGPDs6HMyeenx6U4f62JXAop0Xsb6+
	lPKEwwNtFxD0dYmyZfdPmyYZkErECBxZtD5ha4xrNVeY54IlmdqpxWxsWQOB/ksbHZgr
	4x/3L8ENfEfbu8NFzuN8tqafHul1KB4+iSavOyJHdwzk++0osG5TllnhG/UH2/vsKioY
	G2Z4dZ2qqeSqHiAyIkyeJYWjMTt4D2cOQJp2+oybHbyn/SP+FrpAmGcRIimQMT4HtxIw
	laVQ==
MIME-Version: 1.0
X-Received: by 10.220.192.71 with SMTP id dp7mr64928vcb.45.1394204885703; Fri,
	07 Mar 2014 07:08:05 -0800 (PST)
Received: by 10.58.95.36 with HTTP; Fri, 7 Mar 2014 07:08:05 -0800 (PST)
In-Reply-To: <CAOd_LFyAkzdc4T-FjWh20-iNd7omPEwdhvJecKapUUo3pC0XaA@mail.gmail.com>
References: <CAP71WjxZnBfp3agkiw+yGbLWE2p2gzgXGSQ+SBZi9zu+7-cpEQ@mail.gmail.com>
	<CAOd_LFyAkzdc4T-FjWh20-iNd7omPEwdhvJecKapUUo3pC0XaA@mail.gmail.com>
Date: Fri, 7 Mar 2014 10:08:05 -0500
Message-ID: <CACgAsMdwRRbraDhMCQ17JMDq_dC2AN7q=oXqvCWR96VDidziZA@mail.gmail.com>
From: =?ISO-8859-1?Q?Kevyn=2DAlexandre_Par=E9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: using OE efficiently for development
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
X-List-Received-Date: Fri, 07 Mar 2014 15:08:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Nicolas,

On Thu, Mar 6, 2014 at 1:32 PM, Cliff Brake <cbrake@bec-systems.com> wrote:

<snip>

>
> Here is another example using repo: https://github.com/kraj/angstrom-manifest
>
> The OE build system is complex, but is very flexible and works very
> well.  The flexibility of fetching sources in different ways is nice,
> as different parts of the system really need different tools (are they
> under heavy development, etc) vs forcing everything to be in git, etc.
>

Have seen kind of the same pattern as angstrom:
https://github.com/gumstix/Gumstix-YoctoProject-Repo

-KA

