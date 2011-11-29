Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RVXLI-0006GC-VT
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 00:44:05 +0100
Received: by qyk30 with SMTP id 30so6271qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 15:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oz9vE8vloxLUnJq7RxnoSiaC5ds/kX22K0UJblDnFrI=;
	b=TzEyChYnS+yh24qEtzeFouDNK930yVT/M04VVvmErJA0n6llPaqthdjdULw+jss2VK
	brUQjaLE4D1Qqc/Hal7Dy99ONjK0UOKWdfDf+HUL2DN96yLCF0r18aG1H7q4ejio4KUi
	ExDyBWHaOe4oZVHvKHk91I+RknKzP0AY1dwGg=
MIME-Version: 1.0
Received: by 10.229.46.4 with SMTP id h4mr4618417qcf.188.1322609845122; Tue,
	29 Nov 2011 15:37:25 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Tue, 29 Nov 2011 15:37:25 -0800 (PST)
In-Reply-To: <CACW_hTbvoH+KH75mXrikXp8+CPTxdh_w=LKCOgGJ6CQGaKOTWw@mail.gmail.com>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<1322476245.26081.89.camel@phil-desktop>
	<1322478479.26287.15.camel@ted>
	<alpine.LNX.2.02.1111281848560.1090@myhost>
	<CACW_hTYYKTX4RQXwFSEu+VR3kPe1kGw1J_ba-=L1XqE_QkwWJA@mail.gmail.com>
	<CAMKF1sr9aBc4tMvJDwoPQHranmLs-knaXDp3bhgK5jxd-8f+WQ@mail.gmail.com>
	<CACW_hTbvoH+KH75mXrikXp8+CPTxdh_w=LKCOgGJ6CQGaKOTWw@mail.gmail.com>
Date: Tue, 29 Nov 2011 16:37:25 -0700
Message-ID: <CA+M6bXn0wrOomBX1_L5Bq-oPv08A7xaNWxNvtg3oCOYbDG2m=Q@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2011 23:44:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 29, 2011 at 2:46 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/11/29 Khem Raj <raj.khem@gmail.com>
>
>> Hi Frans,
>>
>
> Hi Khem, all
>
>>
>> On Tue, Nov 29, 2011 at 12:24 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>> >
>> > Of course I also do not want to write faulty documentation; then again I
>> > also hate wasting my time, so I think I wouldn't even start if there was
>> a
>> > chance that my contribution might be rejected because the pull master
>> does
>> > not like my style or feels there are grammar errors or so.
>>
>> I consider someone reviewing my patches a good thing. I think it makes
>> me learn things
>> if there is feedback on the patches, I include the feedback and
>> resubmit the patch and thereby improve it
>>
>
> Oh, I consider reviewing patches a good thing too. For documentation it
> also depends on the process and the kind of comments.
> If the person pulling the changes rejects them because (s)he finds the
> grammar not ok and the review comment is "improve grammar", that is fairly
> demotivating (if I knew how to do so, I would have done that upfront).

This would be just as bad as reviewing a patch and saying only "fix
the things that are wrong".  Both are equally unacceptable, and
frankly at this point in the projects life, equally unlikely.

> A few of such rejects will make that most people loose the interest in
> submitting documentation quite quickly.
> And if you have to give detailed review comments or instructions reviewing
> becomes quite time consuming (actually more time consuming than actually
> making the change yourself)

Which probably means the commenter knows enough that they should have
made the documentation change to start with.  This is the price to pay
for not doing the edits directly.  Personally, I've been willing to
pay that cost and explaining it to someone else helps make sure I
really understand it and that the code is also really correct.

-- 
Tom


