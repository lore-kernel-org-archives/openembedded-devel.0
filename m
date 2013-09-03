Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 877406BEF8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 13:47:27 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id fz6so6467633pac.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 06:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=UZR4RYbq0/2O70Kp1hZMKf9IWjaY5SEZFSjGT6ngES0=;
	b=ZXBzNzH+PbMm5oL5eO/aCoObeee5kkwHtfm4CHxlRnW82B5FFSIOf8z4lGrY0p9NAy
	9k1BNNVPqcyWOCXSJQ1sSibhuDRgGLX7wg7R0iNV1xRPMB2T5wehjb3XHiNn4LO9S1dT
	dlMf83mN8c4y5BLqgYCu9LUZGql4F35DsuPeE4v1AU9LcPQZZK9QBBTx8SIz/rDi7dwj
	3i1MksAN29ntYAYbfpgoqnMonzyCPThWb39omKWlmfFfd4gBAN0Djhb1B9tHlatWHgjx
	45DaABYB10Ir98Gplim/5qxxlGvT23vANjhIaTHiYFot9TYsdAmL1OjPdl90F7deFzGb
	x5ew==
X-Gm-Message-State: ALoCoQnsEtsaTrDqVpExx6RLzTnBq/mi6bgMQw5t/kD+FgSHYJJKwawJqVc/nem1JzND1DWXPpZW
MIME-Version: 1.0
X-Received: by 10.66.216.129 with SMTP id oq1mr32528466pac.75.1378216048219;
	Tue, 03 Sep 2013 06:47:28 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Tue, 3 Sep 2013 06:47:28 -0700 (PDT)
In-Reply-To: <CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
	<CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
	<CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
	<CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
Date: Tue, 3 Sep 2013 14:47:28 +0100
X-Google-Sender-Auth: MAH-DFTbigXrRvkq18T580I1Puk
Message-ID: <CAOMwXhNvcxZXE-uh-APJ-BFZrZcQrujOXchBJjyELnrXnJ1c6g@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
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
X-List-Received-Date: Tue, 03 Sep 2013 13:47:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 3, 2013 at 2:38 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Tue, Sep 3, 2013 at 9:13 AM, Laszlo Papp <lpapp@kde.org> wrote:
> > IMO, most of this email is red herring, and the main topic is a
> networking
> > specification should be in meta-networking. Why would I (or anyone for
> that
> > matter) need *any* virtualization layer when I am working on a network
> > device?
>
> Ah, so I see we won't address the fact that the mailing list should have
> been consulted and that the goals of the oe-layers should be to reduce
> duplication and get everyone working together. I promise, I won't mention
> this again, but it is a key point I want to make.
>

Frankly, you have mentioned the credit so strongly in this thread for a few
lines which is not even copyright'd, I will rewrite this stuff from scratch
today. I am sad to see this discussion is going into "credit debate" rather
than technical stuff.

Actually, I even had a recipe before looking into virtualization, but that
probably does not matter for you...

> I am sorry for your historical misplacement, but it is not an excuse for
> > future mistakes IMHO. If your virtualization depends on network stuff,
> you
> > should *not* force others for virtualization whatever that is. If you
> need
> > that, build on top of networking or use own recipes maintained by you.
>
> I don't agree with that characterization, since it is very black and white.
>
> Having a binding to the larger meta-oe universe (at least for some
> recipes),
> isn't always a good thing, and having self contained layers is also
> something
> that is a goal at times. I'm not saying this is the case here, just that
> what
> you describe above about networking devices not wanting virtualization,
> is at times flipped around from other layers when looking at meta-oe.
>
> meta-virt and meta-networking are very similar in age and the group of
> recipes to start meta-virt were a merging of two existing layers (a good
> collaboration) and a lot contributed by ENEA, it was a good effort and I
> don't think it's right to drop all traces of that effort or describe it as
> a
> mistake.
>
> Again, opinions vary, that's part of the fun.
>

The problem is not that opinions matter, but *your* opinion about black
being white IMHO. Did you even bother to read what the openflow standard is
for? It is for networking devices, come on, and you still think it is not a
meta-networking material?

Please come up with a *rebruttal* and bother substantiating it.


> > I fail to see how it is a problem. Even more, the recipe was completely
> > broken like virtual/libc, *ancient* version, wrong rm'f stuff, bad
> > description IMHO, etc for meta-networking.
>
> Patches would have been accepted :)
>

Here is the patch, so what is your argument again? That it should remain in
your beloved meta-virtualization while disregarding the fact it is a
networking standard?

I do not seem to have pushed the latest version of the change though.

> I do not personally mind if you keep your clone because it is your
> > business, but surely, networking devices should use a network layer, and
> > that is exactly the point of meta-networking.
>
> I'll agree to disagree, I've tried to say that we should look at what the
> two
> layers need, come up with a plan, keep the credit to the original authors
> and then decide how to move forward. i.e. if there are multiple users of
> the
> recipe, maybe see about getting it into oe-core, etc. But I see that isn't
> on
> the menu today.
>

oe-core would not make sense for this. It is *far* from being that core
component. It is actually a very domain specific networking  component.


> I'll ping Joe and we'll see what we can figure out as timing for a path
> forward.
>

There is no *any* need to ping him. This change was sent to the mailing
list as instructed by the meta-networking layer manual, hence he will see
it. Please keep this "ping" in public, and do not hide this behind the
scenes in private. The more eyes, the better.

