Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NGZOs-0005Ij-5O
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 15:44:53 +0100
Received: by pzk30 with SMTP id 30so2340550pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 06:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=gqzTKcm1IW3LQAN4aGOeWNYwuZnzUMSmu4LUdRj0Xc4=;
	b=BYjX52KLed2PPRHAdo4h1y+d4Pyb9vkfDISr1pSkX3oZTv6AO7UNv/gdiKoDNRmpW5
	3HajkIkDoktGQrNlF89nueJX7aZgWsMjDwJB+rjNAMsaFrmfavPEQd8IWWjvLpYpaPiF
	wPpWYrfu19QNxA+R1rYJfVfAP/nQKqEc47azs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RIhB7kHTuj0xmhy77cvxQqD5EKRB9fkvVQbUHwnYhjqvoB/t7RC4xA4kEVi7cCP031
	MXO+qd0kQTxZ2fQMtBBmxGft6Ouw6MrIDuDlyJcoMeWmDAMIuQqlRtCLAkwVQkvIPNba
	42dOa6EORRpEDUoFD9nWInMEGm8zv1JjdIW8k=
MIME-Version: 1.0
Received: by 10.140.247.21 with SMTP id u21mr202179rvh.3.1259937792228; Fri, 
	04 Dec 2009 06:43:12 -0800 (PST)
In-Reply-To: <BAY127-W12EABE192FF93EC42483CFD8930@phx.gbl>
References: <BAY127-W12EABE192FF93EC42483CFD8930@phx.gbl>
Date: Fri, 4 Dec 2009 15:43:12 +0100
Message-ID: <d1b08f940912040643k2d5dc2a5j3b72bb9e18bce88c@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Facing problem with "bitbake" command
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
X-List-Received-Date: Fri, 04 Dec 2009 14:44:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

> [root@localhost build]# bitbake nano
> bash: bitbake: command not found
> [root@localhost build]#
>
> Plz tell me where might be the problem.

First problem is you're building as root...


Andrea


