Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R0gBt-0003ut-20
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 22:54:49 +0200
Received: by vwe42 with SMTP id 42so4304005vwe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Sep 2011 13:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cYWvQaVAtG6p5kheqVvqIqCKlxczzt0dw+1VxcCdlaQ=;
	b=X+ikEHSOyiY877AYPaGu85ydr7DRTcT5YION3ncuB5ruMEU7gRvPRtRpPx35vrRiYl
	/Ci3RlFGBszo5fERLg+O90hMLmD3LKRJgwIEbiYx1PGHfrrR0KmwGSCy9hsDbYgvX6rf
	eo4MBxCiMdhi+Vk6WY0TQgPeIvUbxsEIW1VF8=
MIME-Version: 1.0
Received: by 10.52.178.164 with SMTP id cz4mr4242198vdc.467.1315255787997;
	Mon, 05 Sep 2011 13:49:47 -0700 (PDT)
Received: by 10.52.183.37 with HTTP; Mon, 5 Sep 2011 13:49:47 -0700 (PDT)
In-Reply-To: <201109050122.02940.paul.eggleton@linux.intel.com>
References: <1315181107-26857-1-git-send-email-dbaryshkov@gmail.com>
	<201109050122.02940.paul.eggleton@linux.intel.com>
Date: Tue, 6 Sep 2011 00:49:47 +0400
Message-ID: <CALT56yMNhEBc3J_e-KD1kA2ZZtY9w-E+zqFVC30zKooGgxV9TA@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] nandlogical: corect oobblock/writesize patch
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
X-List-Received-Date: Mon, 05 Sep 2011 20:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9/5/11, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Monday 05 September 2011 01:05:07 Dmitry Eremin-Solenikov wrote:
>> Somehow the oobblock-to-writesize.patch patch got damaged. Correct it.
>
> I guess this is for meta-handheld?

Yes.

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>


-- 
With best wishes
Dmitry


