Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RVeM9-0004gS-EJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 08:13:25 +0100
Received: by vbbfc21 with SMTP id fc21so106631vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 23:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=KRWgdgoaIG/SAbbjeZxNx0pQnCRMifj2MZRAh1OvXdY=;
	b=u0h77b3IlULutVqyjSANHRdlcqlRGcotfasDafYpCmeWic1Rq89iJN83bE7W4juac1
	XlRHmGf9YqhF5jnc06HsQ3sq2zFaGJNYEz/anhtWndfspf70qJnFt/ZwtAboUMA9h4mB
	GEvaVp3YZazYaeG81+/ttKphP2yLpowvvoL3c=
MIME-Version: 1.0
Received: by 10.52.97.35 with SMTP id dx3mr1052904vdb.2.1322636805071; Tue, 29
	Nov 2011 23:06:45 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Tue, 29 Nov 2011 23:06:45 -0800 (PST)
In-Reply-To: <CA+M6bXn0wrOomBX1_L5Bq-oPv08A7xaNWxNvtg3oCOYbDG2m=Q@mail.gmail.com>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<1322476245.26081.89.camel@phil-desktop>
	<1322478479.26287.15.camel@ted>
	<alpine.LNX.2.02.1111281848560.1090@myhost>
	<CACW_hTYYKTX4RQXwFSEu+VR3kPe1kGw1J_ba-=L1XqE_QkwWJA@mail.gmail.com>
	<CAMKF1sr9aBc4tMvJDwoPQHranmLs-knaXDp3bhgK5jxd-8f+WQ@mail.gmail.com>
	<CACW_hTbvoH+KH75mXrikXp8+CPTxdh_w=LKCOgGJ6CQGaKOTWw@mail.gmail.com>
	<CA+M6bXn0wrOomBX1_L5Bq-oPv08A7xaNWxNvtg3oCOYbDG2m=Q@mail.gmail.com>
Date: Wed, 30 Nov 2011 08:06:45 +0100
Message-ID: <CACW_hTYJZg1vfsi-9C+vEgEKZP_zcNgEGLJEWX6wsPw+wCNVwA@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 Nov 2011 07:13:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/30 Tom Rini <tom.rini@gmail.com>

> On Tue, Nov 29, 2011 at 2:46 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > 2011/11/29 Khem Raj <raj.khem@gmail.com>
> >
> >> Hi Frans,
> >>
> >
> > Hi Khem, all
> >
> >>
> >> On Tue, Nov 29, 2011 at 12:24 AM, Frans Meulenbroeks
> >> <fransmeulenbroeks@gmail.com> wrote:
> >> >
> >> > Of course I also do not want to write faulty documentation; then
> again I
> >> > also hate wasting my time, so I think I wouldn't even start if there
> was
> >> a
> >> > chance that my contribution might be rejected because the pull master
> >> does
> >> > not like my style or feels there are grammar errors or so.
> >>
> >> I consider someone reviewing my patches a good thing. I think it makes
> >> me learn things
> >> if there is feedback on the patches, I include the feedback and
> >> resubmit the patch and thereby improve it
> >>
> >
> > Oh, I consider reviewing patches a good thing too. For documentation it
> > also depends on the process and the kind of comments.
> > If the person pulling the changes rejects them because (s)he finds the
> > grammar not ok and the review comment is "improve grammar", that is
> fairly
> > demotivating (if I knew how to do so, I would have done that upfront).
>
> This would be just as bad as reviewing a patch and saying only "fix
> the things that are wrong".  Both are equally unacceptable, and
> frankly at this point in the projects life, equally unlikely.
>

Hm. I'm not too sure about this. With a patch it is much easier to
distinguish between right and wrong.
With explanatory text the scale is much wider, and for text I suggest to
look at the content (which obviously should be technically ok) and perhaps
a little bit less at style and grammar (but of course it should remain
understandable).


>
> > A few of such rejects will make that most people loose the interest in
> > submitting documentation quite quickly.
> > And if you have to give detailed review comments or instructions
> reviewing
> > becomes quite time consuming (actually more time consuming than actually
> > making the change yourself)
>
> Which probably means the commenter knows enough that they should have
> made the documentation change to start with.  This is the price to pay
>

I'm not sure about this. It could well be that a reviewer comments on style
and structure, even though (s)he cannot judge the technical details (and
therefore probably could not write the piece himself).
And I feel we have some people that seem to like it to pick on other people
not following the guidelines they are not willing to document.


> for not doing the edits directly.  Personally, I've been willing to
> pay that cost and explaining it to someone else helps make sure I
> really understand it and that the code is also really correct.
>

Sure. I understand and appreciate that.
Then again for code sometimes the feedback that is given with rejected
patches is neither helpful nor stimulating.
If that happens with documentation too, soon someone will end up whining
that no one wants to contribute to the documentation.

My two cents.
Frans.

