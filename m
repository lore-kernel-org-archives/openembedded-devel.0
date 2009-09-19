Received: from [209.85.218.226] (helo=mail-bw0-f226.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mow6k-00044X-4O
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Sep 2009 11:19:57 +0200
Received: by bwz26 with SMTP id 26so1071406bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2009 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ZihQQWR6jnFz67EolfSrI/eBkhXhp82EFHE89XUKp7c=;
	b=XBfXcqWO758aTcbwO9UbD3URufGsyobmS6GXQLeyljXBhtPAiby0V/almmGmYX9fuc
	nWxA3B82sx5gRPNJFY0PU9DCpMg0ydo+K5Y+ng4ZfXTYuxgftNXQmPyC1CbwnbqUrQ8t
	f+iGLyZibYTITP93FIb+xYSFkld8v6dgs6JbY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Jy3Wu1Rc94LKSTb9q4LQ9o1EC1CqYpKImLTHdyScmOBXcvG8lAfmXRJMg8KbAPmQpE
	9UWd2UOKYWmeiSWmThTZucSqLC1DGkPWO7gl4YVniW+oCze3jOvijyozqfjfTglRJ7bo
	BrQxIHkt6jmeEXfZ0OgzJ1G7T1CLeoMC9EzxM=
MIME-Version: 1.0
Received: by 10.239.182.207 with SMTP id r15mr171768hbg.204.1253351959089; 
	Sat, 19 Sep 2009 02:19:19 -0700 (PDT)
In-Reply-To: <20090918005111.GC5465@denix.org>
References: <1252941903-6186-1-git-send-email-enric.balletbo@telefonica.net>
	<1252941903-6186-2-git-send-email-enric.balletbo@telefonica.net>
	<20090914161124.GA5843@mi.fu-berlin.de>
	<70c9a9110909170220i1306a412o90b87055f49073e2@mail.gmail.com>
	<c384c5ea0909171600g63db2af1u1d94bcc77d6d0829@mail.gmail.com>
	<20090918005111.GC5465@denix.org>
Date: Sat, 19 Sep 2009 11:19:19 +0200
Message-ID: <c384c5ea0909190219x55e9dafo558ef061ea41548f@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] igep0020: Add IGEP v2 support to OE
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
X-List-Received-Date: Sat, 19 Sep 2009 09:19:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Fri, Sep 18, 2009 at 2:51 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Sep 18, 2009 at 01:00:47AM +0200, Leon Woestenberg wrote:
>
>> This looks like a first good industrial OMAP3 board. Nice feature set there.
>
> The board is nice, true. But can you please specify what makes it the first
> good industrial one? :) Thanks.
>
Disregard that remark (I probably thought "commercial" or didn't think at all.)

One shouldn't post messages after 01:00 AM ;-)

Regards,
-- 
Leon


