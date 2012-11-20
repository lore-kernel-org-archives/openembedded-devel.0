Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TaibZ-0007Zd-Bd
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2012 08:50:50 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so3914713iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 23:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=9pCKNXQAyZ1O9FSTLKccUqRHJualwg5Wr/t0+ph4lDs=;
	b=dyuR7SXa/mPQ414ZUPZanW3Sm6BAJzNFZ4d0YpyKQtGTp5yXcNhOziXWygMIwr1KJm
	N9iatxz8CQbbL4yawgyIzyyshzyuPvxuQfAIw9K6Gr4u8LLtbLjQXgnFOz5LOJo2f0nl
	rFT92UbWQPO/QyDu1EF7vUPo+ipkw4U6+tU5qg/ID7JSsIAwNDoaaqm9yhiNZ89Io7fi
	pkpsT64YfxmL6b6gG+7Q3zSlIxYXt8APYKwSP9zQvwS4DmdGyZ2XiGWGEbbJTyYn/lXN
	AKgltjrkyK69goCDsjdd3l228X33OnjH4HU9NOkBqIjxhHrd3/DImZMdIa/dWmxjYhrF
	ZNNw==
MIME-Version: 1.0
Received: by 10.50.179.33 with SMTP id dd1mr9282310igc.31.1353397005488; Mon,
	19 Nov 2012 23:36:45 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Mon, 19 Nov 2012 23:36:45 -0800 (PST)
In-Reply-To: <CAOd_LFyo-7GmLS9AtdO8BXXVxGuqdQvoZqmHHsm+qGSittwVmw@mail.gmail.com>
References: <CAOd_LFyo-7GmLS9AtdO8BXXVxGuqdQvoZqmHHsm+qGSittwVmw@mail.gmail.com>
Date: Tue, 20 Nov 2012 08:36:45 +0100
Message-ID: <CALbNGRQsWzFDuuzAqoVWO9DVHnRbs06pHg94JHeCneUQvHCA8Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: window managers?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Nov 2012 07:50:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 17, 2012 at 10:57 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> Hello,
>
> I did some looking into window managers in recent oe/meta-oe/angstrom,
> and this is what I found:
>
> matchbox
> - is this still maintained?  Does not seem like a lot of new development.
>
> xfce
> - looks promising, but xconf did not build
Off-topic: Could you give some details / logs?

Andreas


