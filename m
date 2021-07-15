Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.7502.1626354500966901313
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 06:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gpanders.com header.s=gm1 header.b=NPZ0EfL1;
 spf=pass (domain: gpanders.com, ip: 217.70.183.195, mailfrom: greg@gpanders.com)
Received: (Authenticated sender: greg@gpanders.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F381B60004;
	Thu, 15 Jul 2021 13:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gpanders.com;
	s=gm1; t=1626354499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpVh12GVtaZYfkIouGjn3o1vg0gLil08yYsdavSVyLI=;
	b=NPZ0EfL12+a/ec/YakuQpi90N0iignVuGxK28HwJ2U1K0ul6ggKcUIE8cjVik8rPjIWX3k
	rkDXmM5ENNEuLCMmvpqr6Z9fQt8e0dNaRp/OWb2yDBxvJbyMx4titO/+okApviFWOyP1lN
	AfwCnQrFgo9mhRS8gZI2MMOB7ufZewgsoOOOecDlfjNCJOrRDjvmK/BVOZESsAEEvJ7NB+
	M62oNxNXncZMHOF2AKQjQ9sJFcgsnTNJ/p00CEs5XMl+y/+tu9X23VnmKLOlQBrnm67Dat
	7Z+MEW188Ea7odmzQHfR82KP81lLfD701AGK2lqv6LCoVpzxGvKOKsujnD1uWg==
Date: Thu, 15 Jul 2021 13:08:15 +0000
From: "Gregory Anders" <greg@gpanders.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: zboszor@pr.hu, Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Upstream scipy recipe to meta-openembedded
Message-ID: <YPAzP4jMI/KIJeEd@gpanders.com>
References: <YOxdaI1jQgdxKTQn@gpanders.com>
 <59d33c0b-fbf0-593c-a259-be23aac0de6a@gmail.com>
 <be74a5ac-d9d9-8efa-434b-504bc7663c19@pr.hu>
 <e025ca46-c030-978f-3ec0-499df2ba14a6@embed.me.uk>
 <YO2QfsrtVgrsw7YX@gpanders.com>
 <f0c2e1bc-0e24-1b7a-f9ff-ca85c9cd9856@embed.me.uk>
MIME-Version: 1.0
In-Reply-To: <f0c2e1bc-0e24-1b7a-f9ff-ca85c9cd9856@embed.me.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Thu, 15 Jul 2021 09:44 +0100, Jack Mitchell wrote:
>Hi Greg,
>
>I should be able to take it over as I'll continue to be using it in the
>future. How do you want to transfer ownership, shall I fork it and you
>point to the new repo on the master branch, or can you get github to
>re-direct to the new home?

Thanks Jack. I believe I can simply transfer the repo to your user on 
GitHub. You should receive an email asking for your confirmation.
