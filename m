Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SyhwW-0001eC-Mu
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 13:27:20 +0200
Received: by ggmq1 with SMTP id q1so3208211ggm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 04:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Hl+u5+4gLb56FCwPZHGfz5oOk3h7auXP5Rs3JD211U0=;
	b=UWbA5JPYBM8O3Ha8f4RiRfH1FzGeFnZCCf24RAu9didb3QeTOBXEsXmDYxFy770Vxm
	8V+9Z3AbB3oyWMhAEIvHoBks712Msfs2ZSYNDTesAGM2MFSpG6IzXi13tD8W02BAHn07
	eDwdqZm2T3wS1egk3a6EWGn5UjSeUtKaySCTGWakGWUq6DVbXemypual0KhXa5PKDdWD
	v3UudfuEJ93vu8plWA4nKqHUmIrUJR3+1ZXPZBqFa/j5UrCwx6FfRJm1h1qNLtZfJnJa
	k0bAXHAy6EQNRX7NilIGX11WI4tNvtlbTq/RKJzVIDZcXlwTbmg8VoFZ+ml3Tyr468i9
	oRiA==
MIME-Version: 1.0
Received: by 10.43.124.201 with SMTP id gp9mr11111376icc.47.1344338134374;
	Tue, 07 Aug 2012 04:15:34 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 7 Aug 2012 04:15:34 -0700 (PDT)
In-Reply-To: <20120807110710.GS3267@jama.jama.net>
References: <jvqqs2$tn3$1@dough.gmane.org>
	<20120807110710.GS3267@jama.jama.net>
Date: Tue, 7 Aug 2012 13:15:34 +0200
Message-ID: <CALbNGRR=Crnc7bTQgddnkVzezFzK_HqK2RMPZZP=x87TVdc4Zw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-openembedded patch queue
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
X-List-Received-Date: Tue, 07 Aug 2012 11:27:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 7, 2012 at 1:07 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Aug 07, 2012 at 12:32:51PM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> I've applied a bunch of patches and hopefully commented on all the ones I
>> didn't apply. I also cleared the meta-oe patchwork so it's nice and empty
>> now: http://patchwork.openembedded.org/project/oe/list/?q=meta-oe
>>
>> If your patch hasn't been applied yet into meta-openembedded master and is
>> lacking comments, please resubmit it as [meta-oe][PATCH v(N+1)] (substitute
>> N please).
>>
>> There are a few big deadlines coming up at work, so everything will have a
>> few days of delay but if you haven't seen any feedback after a week and the
>> patch is still sitting in patchwork, please send a reminder. Replying to the
>> patch with 'ping' is usually enough and most people know where to find me on
>> IRC.
>
> There are few pending patches IMHO worth including, I can resend them in
> some consolidated pull request (all pushed to jansa/pull already), but
> listing pw ids is maybe easier for you to apply them:
>
> systemctl mask (sorry I forgot to include meta-oe prefix):
> 33997 33999
>
> patches from khem wit meta-systemd prefix:
> 33795 33793 33791 33789 33787
>
OK I will base my two patches upon these and send them when tested.

Andreas


