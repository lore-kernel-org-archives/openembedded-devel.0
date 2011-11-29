Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVUDv-0003XA-P7
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Nov 2011 21:24:15 +0100
Received: by lahe6 with SMTP id e6so1142418lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 12:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vaUlna44zoijCw5r8nPLdiL5QhrU8rOpE3TGwRk+yKM=;
	b=rWPnBsUFkDzM5EYZQCYGhMfBZXv1ot6qpD/bGV/utA6PBkw3OC5ZXQYpRl3VsvWIpo
	LdxUrL+zwo0rOoQwloDhu5mChtLK8uaPVbUon4lJB6hO/0UzqOQFdM8/HWJk8nl8Lhjm
	tkoViP+D7HAKfM2n+Hn9kKOU5dnP0qTPB1oLY=
Received: by 10.152.132.39 with SMTP id or7mr32168810lab.14.1322597855624;
	Tue, 29 Nov 2011 12:17:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Tue, 29 Nov 2011 12:17:03 -0800 (PST)
In-Reply-To: <CACW_hTYYKTX4RQXwFSEu+VR3kPe1kGw1J_ba-=L1XqE_QkwWJA@mail.gmail.com>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<1322476245.26081.89.camel@phil-desktop>
	<1322478479.26287.15.camel@ted>
	<alpine.LNX.2.02.1111281848560.1090@myhost>
	<CACW_hTYYKTX4RQXwFSEu+VR3kPe1kGw1J_ba-=L1XqE_QkwWJA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2011 12:17:03 -0800
Message-ID: <CAMKF1sr9aBc4tMvJDwoPQHranmLs-knaXDp3bhgK5jxd-8f+WQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Documentation problems
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
X-List-Received-Date: Tue, 29 Nov 2011 20:24:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi Frans,

On Tue, Nov 29, 2011 at 12:24 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
>
> Of course I also do not want to write faulty documentation; then again I
> also hate wasting my time, so I think I wouldn't even start if there was a
> chance that my contribution might be rejected because the pull master does
> not like my style or feels there are grammar errors or so.

I consider someone reviewing my patches a good thing. I think it makes
me learn things
if there is feedback on the patches, I include the feedback and
resubmit the patch and thereby improve it


>
> (note that I am not a native english speaker so this is not too unlikely;

neither am I.

> also if there are language errors in a contributed piece of documentation
> on a wiki other people more proficient in english could correct those
> easier and better than I ever can),

right now there is no review process for wiki. So if I write a
document it does not get notified
to people and chances of someone really stumbling into this new piece
are new users who are studying
that document and I think reviewing it beforehand is a good thing
since I might have written it wrong
besides grammar errors. I think wrong documentation is worse than no
documentation.

>
> For me this raises the bar to contribute (not that I have contributed much
> to our documentation...)
>
> The issue with documentation
> - everybody wants documentation
> - hardly anyone wants to write documentation
> - make it hard to write documentation and you'll end up with no
> documentation.
>
> BTW somewhere in the thread also the license issue was raised.
> I'd suggest a form of creative commons with attribution clause.

This should be fixed yes.


