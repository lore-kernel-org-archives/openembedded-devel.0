Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 435356B6F7;
	Tue, 12 Apr 2016 02:32:46 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id y204so6085992oie.3;
	Mon, 11 Apr 2016 19:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cfB2bLwVOFJI6ffyqaK2RCmfAFlmrPvd5KfDnTiUsIw=;
	b=tggNLBSloK6cvPBgQilGGbHme1ceLb3YFbBYr0ZjdYBhuc++Tumk6eXhoQfanyWw96
	ll1+WSeh+PkSAJM9rJtDR+FtDz9g01dhLPgSe1KwHev+DTxZ4OO0IpH9MGz8XCZKGWh3
	YGmfjUx0T6Qd58LGkpwW1HiQ81XETwHEl+t1rJr7upmO3DMXlmkk8WSNu+DBg1FKbZuQ
	20aRlgwpydsrKCL04bvPtl+z9+TeduX9JkVmsl8456AJUjkxWtKCNfZoQcPeVU2t81Ev
	HjEOICyU1/DoyZHqZMArp6VsLS8uRggzOx2fKnpdbK4h7/hC3YWtR7uWlT8YCZeL1o9y
	2Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cfB2bLwVOFJI6ffyqaK2RCmfAFlmrPvd5KfDnTiUsIw=;
	b=BDXkK4jW8qKhuc3N+FaI7V6C7iJlaQ4z6h6RYragO5XULbiWIm/ADt7x2Es7lJ4mvH
	DdOlg6oMXR3PTZMJUgvGm1KWYRx6RH6OwErtoyCvTlORrXJlUrPRZ4DXcmyfz+B+U5F9
	VK7tBZgVkxLbyFsachIHr1ffRzHpqhoDkORIarkHq8u/yU801rJjvLiYRMPgPcLzuQd0
	tycfF57RrjUEpG8o7jIoo9loDdpcQuvhCFHJ6kCK3feE6yDMzOmzK8LV4mdgiDTDestL
	H1RT6HFz3IVioT3nzVTBDVVX+XK3Kga+KCNtBGgkKp9NYIcbGYcym/6DrRAbxi8VGOKm
	J74w==
X-Gm-Message-State: AOPr4FUE1du7w4fAU89/r8YjcdkVdUEbUqcR+ov4vHupILfl9e8YidMHF9mG3I43WcCUBZ7TxNxjDyJ/hrh3Tw==
X-Received: by 10.202.172.201 with SMTP id v192mr283840oie.29.1460428367329;
	Mon, 11 Apr 2016 19:32:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.227.131 with HTTP; Mon, 11 Apr 2016 19:32:27 -0700 (PDT)
In-Reply-To: <CAHQecY4PBZ-PHi6SefradTq5o2PXKo0wbo-jid80hMc0bfkYgA@mail.gmail.com>
References: <56DEF97F.9070306@balister.org> <1458767514382.89578@seescan.com>
	<56F30D13.6030909@balister.org>
	<2408177.Nm4BLto1dd@rjs-zotac.streifs.net>
	<20160412013543.GV16135@denix.org> <570C52DB.6060901@balister.org>
	<CAHQecY4PBZ-PHi6SefradTq5o2PXKo0wbo-jid80hMc0bfkYgA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 12 Apr 2016 14:32:27 +1200
Message-ID: <CADySD0E_HRSQ3ytibHCPYcFm5Y-rv96u=b1u38ABkE7s2ahzbw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
Subject: Re: [OE-core] [yocto] OEDAM, April 8 in San Diego after ELC
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
X-List-Received-Date: Tue, 12 Apr 2016 02:32:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8B
Hi,
=E2=80=8B
Is there any information/material posted online for people who weren't able
to attend because of geographical barriers ?

regards
Ankur


On Tue, Apr 12, 2016 at 1:48 PM, Tom King <ka6sox@gmail.com> wrote:

> do we have meeting minutes posted someplace?
>
> thanks
>
> tom
>
> On Mon, Apr 11, 2016 at 6:43 PM, Philip Balister <philip@balister.org>
> wrote:
>
> > On 04/11/2016 09:35 PM, Denys Dmytriyenko wrote:
> > > On Mon, Apr 11, 2016 at 03:35:21PM -0700, Rudolf J Streif wrote:
> > >> Hello Everyone:
> > >>
> > >> If you attended OEDAM last Friday in San Diego, I very much hope tha=
t
> > you enjoyed being here.
> > >>
> > >> The Catamaran Hotel, where we held the meeting, would very much
> > appreciate your feedback:
> > >>
> > >> www.catamaranresort.com/trip
> > >>
> > >> I hope you all had a safe trip back home,
> > >
> > > And huge thanks to Rudi and Jefro for their help in organizing the
> event!
> > >
> >
> > And an even bigger thanks to everyone that came to the meeting. You are
> > the people that make OpenEmbedded great!
> >
> > Philip
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

