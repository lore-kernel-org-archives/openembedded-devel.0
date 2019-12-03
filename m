Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6DA7F33A
	for <Openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 04:16:32 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id i11so2071293iol.13
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 20:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6LeLQ+4oW1ZE9w/O/sxQjIqXaE2jj3+bHKJUIHZZfoM=;
	b=FpQ8PctJhNS4oFLwGYOmxOXrhusXXTsGHQgNDRUyadsaQzVtMzFmCF8RJgqFtFlEZN
	DzWsBRrr2TzK9lcYVMnbFqx73KRTwAL07szD9gi+a76YJ0v7+ga3z4pXbDrjiUekB4SJ
	KI8EYidDDDwnnOeuRNze6xAx9aQRH/Mi3R2UxpUrAbhpVXwez0cOLP8WWxYqx205WxWc
	agdn6UTDrmew1ZnyzqAZlZpwrlCPtSl+tXTdH33mTVKjx7leMz9TmVdit+wjnLSIC1fs
	CxWIZIl3G2ijiR6b7/+3W/JKq0kenkIdAPWj03FGj1d3YmhqP/Ajh6rE4zjfEHc9sGhI
	yBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6LeLQ+4oW1ZE9w/O/sxQjIqXaE2jj3+bHKJUIHZZfoM=;
	b=gwtLoaoDfWdbV8jTdnF3qnY5sjJtstjXRawxa6eNqUhpsp4EvsYpb1KVqTprhvLKtB
	y43ogDRwLcB2FuktIgysVCDe6klPcP7ZCQnFMEMsXsEbHvqUWnHAOVgNMj0Hxl9PsW+O
	i3pD/4Ekc2gl8hnv8skOOZT66A0fsyADo8G8YFZmDUwWmum+3fcsGMtolkncJ0B/SHm8
	/lvbl7uSOgdAGR7xeeS22BCana7/1KFXvZx7covG3PHIBj25qAQ1vJcRUhsMFnXWzTlI
	RCrN+hNNTV+XA21cgYrxJa+kxGQg3gLhx1PYtgtaM+4FNcSrHhyS+2YLUdCRy/LX6XnD
	NVpA==
X-Gm-Message-State: APjAAAWkIL1I3lJPIP/PurNp05j7rfVwa2vi3H+Z6jAwJfqBkEB1scJO
	XEKu3tVTmy/8VowqiS3/hbAEx7vRPa7sL7oLCFM=
X-Google-Smtp-Source: APXvYqyKWZpOb1pxk4XJ1/GcR8S/YGaDlt3bCua80YSVuOhed1etAvJuSUT931d2GxT6B13o9vneaoztKsa3/Y3C7Rw=
X-Received: by 2002:a5d:81d4:: with SMTP id t20mr923156iol.170.1575346593471; 
	Mon, 02 Dec 2019 20:16:33 -0800 (PST)
MIME-Version: 1.0
References: <CANx9H-Am-T-LMMr+oWpR0KM70k0TYHF2v=GdqTem4Rj1ud6srA@mail.gmail.com>
	<c61b511b-c927-c794-e208-6997e3d99ace@gmail.com>
In-Reply-To: <c61b511b-c927-c794-e208-6997e3d99ace@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 2 Dec 2019 20:16:22 -0800
Message-ID: <CANx9H-AQdLsCQ-WP3qvQ5M_SrnYd4okfjEgUdSrw6F=tbUTOTw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: ANNOUNCEMENT: meta-python2 has been created
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
X-List-Received-Date: Tue, 03 Dec 2019 04:16:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 2, 2019 at 1:49 PM akuster808 <akuster808@gmail.com> wrote:

> Tim,
>
> On 12/2/19 7:56 AM, Tim Orling wrote:
> > Why?
> > ====
> > With the pending EOL (end-of-life) of Python 2 in a month [1], it is time
> > to move python2 recipes to a new home. For that reason, meta-python2 [2]
> > has been created as the home for legacy python2 recipes.
>
> Thanks for putting in the time to get this sorted out.
>

It was a slog, but it was worth it. You are welcome :)

>
> > How?
> > ====
> > It was a design goal to keep the original history of meta-python, but
> only
> > the python2 parts. In order to accomplish this git-filter-repo was used
> > [3]. The exact steps used can be seen in a gist [4]. After that script
> was
> > run, manual merging of *.inc and *.bb files was performed to make recipe
> > maintenance with AUH (auto upgrade helper) and devtool easier. Since this
> > layer does not have to support two python versions, the reason for the
> *.bb
> > and *.inc split has been eliminated. Commits that upgraded recipes to
> > python2-incompatible versions were reverted. Changes to make the recipes
> > build and ptests be runnable were also made (to master branch). The
> stable
> > branches were also kept, to make it easier to refer back to prior history
> > and allow developers to use meta-python2 only in their workflow. NOTE:
> The
> > stable branches may require work to make them usable, this was outside
> the
> > scope of the immediate effort.
>
>
> Should we have a separate patch work for this layer?
>
>
As I understand it, that requires a separate mailing list, which currently
feels like undo overhead. But I would love a separate patchwork instance.

If the normal Stable branch format is used for patches, it should be
> easy to sort out so we can see how it goes and make adjustments as we go.
>
> The volume for stable meta-python patches tends to be low so I don't
> mind sorting things out from master to zeus between the two branches.
>
> There are a few changes I would like to make to the zeus branch of
meta-python2 (clean up of packagegroup-meta-python2 and such), but I agree
that the amount of patches tends to be low and it is not that much of a
burden. It certainly seems worth supporting zeus, as I had originally
intended meta-python2 to exist before the zeus release. It is also worth
considering warrior. Much further back than that I would want to hear from
users that want to step up to help maintain the older stable releases. It
is certainly doable to perform builds on gitlab-ci for as far back as 'kas'
supports releases (which as I recall is krogoth and morty believe it or
not).

>
> - armin
> >
> > What next?
> > =========
> > Python2 recipes from meta-python will be dropped via patches sent to the
> > mailing list. Python2 recipes from meta-oe and meta-networking, which
> have
> > already been added to meta-python2, will be dropped via patches to the
> > mailing list. Other layers are welcome to do the same.
> >
> > Recipe upgrades to meta-python2 will also be coming, for instance Django
> > 1.11.x LTS is the last version to support Python 2, but we are not at the
> > latest release of that series.
> >
> > The original meta-python will become Python3-only and patches for python2
> > support will be nacked and redirected to meta-python2.
> >
> > python2 itself will likely be moved from oe-core into meta-python2
> >
> > [1] https://www.python.org/doc/sunset-python-2/
> > [2] https://git.openembedded.org/meta-python2/
> > [3] https://github.com/newren/git-filter-repo
> > [4] https://gist.github.com/moto-timo/ab70ab96ddbaf5fd1226bd21dbbfec9b
>
>
>

