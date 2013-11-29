Return-Path: <diego.sueiro@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id C7A726BEFB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2013 18:22:24 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id e14so16182837iej.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2013 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0RQb21Y8hgS6h8F+3GPWkqzTQ4S4TzHVCF5iFPuN9L8=;
	b=XpOU/GVFpqgmOcinXQOj7JyKe5MS+kvmZgWsoKDYCkXucyENn1Vo5rpMm8VEQOliS3
	4U62L8Bln5JzDUIJHaHqof83hUd8euWZbDi7h7IRBR24yk7+bn5p5PHn9WZnv0lDwm++
	wsFgqDhTy+uYhZLFN57iXUlCF6wrO9cyfjv67jAV3NG3P+FJA44DUmPXBfM7E/pQISIo
	2OxIvDiLWuJgnkp8GID3pFvuEVQb1DroDLVBe6DCbJtUNvN5/NNx7dtqCxILexTtUbDv
	ut6mri16hOm7wxZi0WAVqqZ76IM3T9rY7uF75WnTJfdrzY0r/rcQcrkHA9q14JKZoaSS
	cx5A==
X-Received: by 10.42.142.129 with SMTP id s1mr32789387icu.30.1385749344024;
	Fri, 29 Nov 2013 10:22:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.26.233 with HTTP; Fri, 29 Nov 2013 10:22:03 -0800 (PST)
In-Reply-To: <20131129160650.GB3940@deserted.net>
References: <CAMCfZKEEYRnDP36tKtn=rqXEdY3VVucDMv0FdYntjYmaw3=fMg@mail.gmail.com>
	<20131128182423.GC3724@deserted.net>
	<CAMCfZKFLW-FzmEDdquj2+H8ePnOOAZDGpoRPV+CPhD_VvzDW7Q@mail.gmail.com>
	<20131128190221.GD3724@deserted.net>
	<CAMCfZKGaTKreSQmLcmNMbUD0TeGWhCbFidBwUKq0SAPEAskeeA@mail.gmail.com>
	<20131129160650.GB3940@deserted.net>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Fri, 29 Nov 2013 16:22:03 -0200
Message-ID: <CAMCfZKGQ6N-=vtcXBH2zMPd0zK_B21tYjkKRdJgSvxW3BuYB2Q@mail.gmail.com>
To: Joe MacDonald <joe@deserted.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Change to vsftpd recipe
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
X-List-Received-Date: Fri, 29 Nov 2013 18:22:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 29, 2013 at 2:06 PM, Joe MacDonald <joe@deserted.net> wrote:

> I'm still engaged in a bit of other debug stuff right now, so if you've
> got a proposal for this one, please feel free.  Otherwise I'll ping you
> when I get back to look at this.
>

I thought my patch could fix it, but it is not working for you.

Regards,

--
*dS
Diego Sueiro

/*long live rock 'n roll*/

