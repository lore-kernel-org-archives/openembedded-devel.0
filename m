Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Ov3NM-0001r4-8y
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 09:22:53 +0200
Received: by gwb10 with SMTP id 10so883375gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 00:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=yOA124bpRcRyKpr4N7U2tHXjjD3BBI5O9FtCbnxYZqE=;
	b=OwzMrm3RtW2/PqHXV0aMkFeXabiazwHq8IQNfE1uaG9SSJId3ehbA+6J0ctC2/qT9s
	cxCuKti+FTWWjyb8qkIIeK8CSkMadcTVkJzMKUSK1Cjwwl8l2QAo12I7TNlfGY+8WCwO
	mP0fKNCOPPLdES3OrMh7a4L+5RS+0cNhpMSeo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=aqX32sA6sdD5rOT80TS5ajqI6Z8MGPi8BBlukmnmvbEiGg4l05oKwaihQBiYfkM9ch
	I0MouOV5QK/yBVE2YhtDiZXbqmfs5YMpWNKA6a0jFLKRMz1StI4i6J/NT2x6QT4Y0NyB
	B37g0EjJ0CkLPbOUlOkyrqv7bWVoTc/vABhoc=
MIME-Version: 1.0
Received: by 10.101.168.7 with SMTP id v7mr3749791ano.244.1284362525110; Mon,
	13 Sep 2010 00:22:05 -0700 (PDT)
Received: by 10.231.161.1 with HTTP; Mon, 13 Sep 2010 00:22:04 -0700 (PDT)
In-Reply-To: <AANLkTikbF1e5LxEVduNiS7oyxNd=smDh2AnmBR4oOxu8@mail.gmail.com>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
	<i6629i$d5c$1@dough.gmane.org> <201009081609.32135.pieterg@gmx.com>
	<4C879EC5.10402@balister.org> <4C8ADB7A.4000303@techsol.ca>
	<i6f9uu$39o$1@dough.gmane.org> <i6fc40$90f$1@dough.gmane.org>
	<i6j7h4$m7t$1@dough.gmane.org>
	<AANLkTikbF1e5LxEVduNiS7oyxNd=smDh2AnmBR4oOxu8@mail.gmail.com>
Date: Mon, 13 Sep 2010 16:52:04 +0930
Message-ID: <AANLkTi=UnN1SW5tRNBe1vLksNyH8TkbSR3Fo3=RgnOjp@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Mon, 13 Sep 2010 07:22:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Frans, Koen.

You guys need to stop this shit.


