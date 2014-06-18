Return-Path: <cliff.brake@gmail.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED176FDE5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 01:32:00 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id j15so136764qaq.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 18:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=8ZoOrxFZX7errGqBiXoda7jY6p4QGTFi8nnTxoAwa+w=;
	b=lU5gKUDzBv+rkgSuSiUxpnHW1wseqgnjb4iIg4kF+sMz/Yp+OzVuQ+dtlMMrBX4hwf
	nYEgytFmN2aRF+6QAZe+lHbpNnG4hUiVbvMeEKOYirgLQgkZ6WMrpr+n5H+z0/KdDYBB
	LWRq2kD2RrNBYKFjA0QvkO4se0Gg0YTVZ+o9oDUK8HyRJNBQNxaec2yYho7Wq2JtLZdy
	JiVJwmMy4TskTOY1x9afd0dLQKBuDw41LMfQSosCeRr+B6rqX/BB/ILmAhoTroQ77tNf
	pAyJZDBxaT3Lz/QeZ88b40ekkzx6DsCUrWCVoFPQ+/9ktEiouDrmpsAcxMDhNSqFlAMc
	j86A==
MIME-Version: 1.0
X-Received: by 10.140.94.103 with SMTP id f94mr20927691qge.64.1403055121049;
	Tue, 17 Jun 2014 18:32:01 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.31.73 with HTTP; Tue, 17 Jun 2014 18:32:01 -0700 (PDT)
In-Reply-To: <CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama> <536A7C42.6030502@balister.org>
	<20140511145337.GE22774@jama> <20140616134850.GP2428@jama>
	<CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>
Date: Tue, 17 Jun 2014 21:32:01 -0400
X-Google-Sender-Auth: 993P7xkMV0HdMUr6EC6O7sPz1IQ
Message-ID: <CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Jun 2014 01:32:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 17, 2014 at 4:55 PM, Otavio Salvador <otavio@ossystems.com.br>

> I didn't find any. Or are you preparing a list to send?
>
>> Can anyone please volunteer and send README update patch?
>
> Is anyone willing to take it? I can help but I don't want to be the only one.

I'm willing to help as well.  I started a branch to merge:

https://github.com/cbrake/meta-openembedded/commits/daisy-to-merge

Let me know if anyone else has ideas for README, etc.  Otavio, perhaps
you can add your email to the README's as well (assuming this is what
Martin had in mind).  Thanks.

Cliff

