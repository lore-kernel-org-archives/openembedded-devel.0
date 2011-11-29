Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RVVcP-0006aq-1p
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Nov 2011 22:53:37 +0100
Received: by vbbfc21 with SMTP id fc21so4744803vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=F1fWzyErIlx5+EPeSpGwhtPz84m1WzaMcBeTnKhSAFo=;
	b=o+3ptrHg3oWVgZ77lSJTXXjBrAspqb9EKOhq21275+5XO9URNe49mYOfyB22heJOE0
	RrMXODgXQv7N0EDXBUA+feQs8mNtQ67WVKqB9H+iwukOQ8JRAU351CYw9p/5FtUSDkvC
	0GocvvwltGktN3B4kno8lccsBp4a+2DRIb8TM=
MIME-Version: 1.0
Received: by 10.52.65.176 with SMTP id y16mr50634150vds.53.1322603216786; Tue,
	29 Nov 2011 13:46:56 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Tue, 29 Nov 2011 13:46:56 -0800 (PST)
In-Reply-To: <CAMKF1sr9aBc4tMvJDwoPQHranmLs-knaXDp3bhgK5jxd-8f+WQ@mail.gmail.com>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<1322476245.26081.89.camel@phil-desktop>
	<1322478479.26287.15.camel@ted>
	<alpine.LNX.2.02.1111281848560.1090@myhost>
	<CACW_hTYYKTX4RQXwFSEu+VR3kPe1kGw1J_ba-=L1XqE_QkwWJA@mail.gmail.com>
	<CAMKF1sr9aBc4tMvJDwoPQHranmLs-knaXDp3bhgK5jxd-8f+WQ@mail.gmail.com>
Date: Tue, 29 Nov 2011 22:46:56 +0100
Message-ID: <CACW_hTbvoH+KH75mXrikXp8+CPTxdh_w=LKCOgGJ6CQGaKOTWw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Tue, 29 Nov 2011 21:53:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/29 Khem Raj <raj.khem@gmail.com>

> Hi Frans,
>

Hi Khem, all

>
> On Tue, Nov 29, 2011 at 12:24 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> >
> > Of course I also do not want to write faulty documentation; then again I
> > also hate wasting my time, so I think I wouldn't even start if there was
> a
> > chance that my contribution might be rejected because the pull master
> does
> > not like my style or feels there are grammar errors or so.
>
> I consider someone reviewing my patches a good thing. I think it makes
> me learn things
> if there is feedback on the patches, I include the feedback and
> resubmit the patch and thereby improve it
>

Oh, I consider reviewing patches a good thing too. For documentation it
also depends on the process and the kind of comments.
If the person pulling the changes rejects them because (s)he finds the
grammar not ok and the review comment is "improve grammar", that is fairly
demotivating (if I knew how to do so, I would have done that upfront).
A few of such rejects will make that most people loose the interest in
submitting documentation quite quickly.
And if you have to give detailed review comments or instructions reviewing
becomes quite time consuming (actually more time consuming than actually
making the change yourself)

That is somewhat the advantage of a wiki. You can contribute to the best of
your abilities and others can extend with their knowledge, expertise and
language skills.
Then again, I understand that there is a risk that faulty information is
created (as was also expressed by Koen). However I cannot really recall big
such problems with our wiki.

There is of course another problem (which does surface every once in a
while). Sometimes people write pieces based upon outdated information. And
even if not, the information itself will become outdated.
E.g. if we deprecate PR (which is a good idea btw) this needs to be changed
in the wiki too. That is a part of the process that is not really well
developed.
outdated information is equally wrong as other faulty information.

As stated before, for most people writing documentation is not particularly
fun, so it should be made easy with few annoyances. Make it hard and you
will hardly get contributions. Turn people down a few times and they are
gone.

>
>
> >
> > (note that I am not a native english speaker so this is not too unlikely;
>
> neither am I.
>
> > also if there are language errors in a contributed piece of documentation
> > on a wiki other people more proficient in english could correct those
> > easier and better than I ever can),
>
> right now there is no review process for wiki. So if I write a
> document it does not get notified
> to people and chances of someone really stumbling into this new piece
> are new users who are studying
> that document and I think reviewing it beforehand is a good thing
> since I might have written it wrong
> besides grammar errors. I think wrong documentation is worse than no
> documentation.
>

I agree with the wrong documentation is worse than no documentation.
I'm not sure whether there are no wiki plugins to allow notification.
(and it is always possible to examine the recent changes page, but that is
not really convenient).

BTW it is always possible to lock certain pages and only allow a limited
set of users to edit those pages. I can imagine this is done wth the pages
that are considered core.

Frans

