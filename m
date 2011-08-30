Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1QyN5D-0001zA-Db
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 14:06:23 +0200
Received: by ywa12 with SMTP id 12so5047320ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=UmP2Gnxt24LAt2C3VRRV2tjEEjKGzR+MOdnZZRWfNUQ=;
	b=KJL44vil4sC6LjSDR/fb8dwXjlSEx0kn8vz4lIw6mkONU84ZkWYvwN751LF20yClHy
	2ExufRpQdAEN6E4VcaUKIAH67P7v2vkC1HyxB1Sj01Fn8jNay9pJ9pW08cKJ715chZw+
	O7f53dI/Sep0xFplG86bAEynAdAivDImjXv50=
MIME-Version: 1.0
Received: by 10.42.145.131 with SMTP id f3mr5973790icv.504.1314705689740; Tue,
	30 Aug 2011 05:01:29 -0700 (PDT)
Received: by 10.42.166.132 with HTTP; Tue, 30 Aug 2011 05:01:29 -0700 (PDT)
In-Reply-To: <mailman.3.1314698402.24288.openembedded-devel@lists.openembedded.org>
References: <mailman.3.1314698402.24288.openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Aug 2011 14:01:29 +0200
Message-ID: <CAJJ=G6-fiaRfo10wiyi0Armq00H78gauu3z8qm_NnkwrKAFhkg@mail.gmail.com>
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Openembedded-devel Digest, Vol 61, Issue 80
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
X-List-Received-Date: Tue, 30 Aug 2011 12:06:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

>> I run Angstrom 2010.8 with a 2.6.39 kernel. To get better power management I want to use the 2.6.39 pm-branch from sakoman.
>
> What makes you think that has better PM? If you look at the actual patchsets, you'll see that sakoman-pm is actually the angstrom .39 kernel :)

My board doesn't wake from suspend when I use .39 from
org.openembedded.dev. Neither using a timer nor from console input.
sakoman-pm wakes, so in my case it has better PM for atm. :)

- Tasslehoff


