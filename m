Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 55681609BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 14:34:25 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id j5so805491qga.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=uat7I0ohLgquyjZDk0C+Wsz4Q2Nz6X0tK09lcDrkwOw=;
	b=lXzOr3d8qjfNa7iLuSg7pouoQinEiEOlajiPmmCb3wpjnQfpRBliZ5aaiaNiLDNFfA
	0lxDltmpxlPi8rbMLPPZjIC3jOy3Q9rd9rDMmws+0cD8UCMElV9G5xAeImKND08csF61
	kwpeXqlYOGX87EooTxgfTD0S5fNKDfCQpzmTkkgs/C3FFZZ3UH/Aq0V0yrmEbzz4xIBI
	mCYbMc/DTVHPdznud9B1fn2L2Wk2oMfb7ikyzd+A8vUwgYCG7VJagcHELT/ZkZNN9c94
	8sF4nxbXvCJFYhmWn7s0tJNuosvt8A1FUfQm5WgMZthmL8RBa7QvY+i7wciNsR69DEaw
	7ERQ==
MIME-Version: 1.0
X-Received: by 10.140.102.163 with SMTP id w32mr3391380qge.97.1403102065962;
	Wed, 18 Jun 2014 07:34:25 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.31.73 with HTTP; Wed, 18 Jun 2014 07:34:25 -0700 (PDT)
In-Reply-To: <20140618142125.GJ2117@jama>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama> <536A7C42.6030502@balister.org>
	<20140511145337.GE22774@jama> <20140616134850.GP2428@jama>
	<CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>
	<CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>
	<CAP9ODKr1QTT++D-iiAwT5LgftiZdmzT34xMM_2dkHF5Ti99KnA@mail.gmail.com>
	<CAOd_LFz4ArrStfheb4+KKhwhWPDft5BYjqNk7Y05Ja=oDk+ZSg@mail.gmail.com>
	<20140618142125.GJ2117@jama>
Date: Wed, 18 Jun 2014 10:34:25 -0400
X-Google-Sender-Auth: 5KmM-D5r-l4TWMaXRmmSXpfZwVU
Message-ID: <CAOd_LFxAsqciQfwvwmsHxwxSd7=4A27y2-tWqETU0GTBBG2ZGw@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 18 Jun 2014 14:34:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 18, 2014 at 10:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jun 18, 2014 at 10:04:52AM -0400, Cliff Brake wrote:

>
>> Otavio, Armin, would you like me to add your emails to the maintainer
>> lists in these readme's as well?
>
> Should I wait 1 more day before merging branch above for possible
> maintainer additions?

Yes, that would be a good idea.  I'll send a pull request tomorrow, or
after I hear back from others.

If there are other outstanding daisy patches, please let me know.

As far as a procedure to merge changes, I propose that initially one
of the branch maintainers sends a pull request to the maillist .
Another maintainer ack the pull request, and then Martin (or other
main branch maintainer) merges and pushes.  This will initially give
us a little bit more review.  Eventually we may transition to one of
us pushing changes directly after co-maintainer ack. The goal is
obviously to keep daisy building and as stable as possible.

Thanks,
Cliff

