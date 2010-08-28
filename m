Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1OpTDD-000492-1k
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 23:45:19 +0200
Received: by iwn2 with SMTP id 2so3583508iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 14:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=45pg+bhsRgtkSZcH6pkjqx5x+hVcKcmXU7wPWPo7O+o=;
	b=k68npLdGGC3EMSPEKyGBlFbxsQpdlKrmAVwa91zk4yBsoQ2MZnhpKkyHTdoHB17YgX
	X+H02vgRKYQS0St4BxcKPD+etn4jLaKsX7Z4OJsk2vo6qEBAcEVM8xR+Vb+xE8VQxotW
	xojUdNLg8Z0IKbYqn05MwS5k3kIjUeZLpW5I0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=McXkgb3PT8uvNn+BOzHHBrEZ6b3Kdh/Dgkpt2Le+lCezDM7ZRZoYTcSoK8lO8NJauH
	WL7did9oVRGiYlGTxPjFHqdc59h2brCJ1y5bjs4CaLumobtmSWnIqGIOYlrdATylNjcj
	gQr5y0np5R2owu8OYcVn00FrGlvjY49oeUQqY=
MIME-Version: 1.0
Received: by 10.231.167.67 with SMTP id p3mr3104847iby.20.1283031889879; Sat,
	28 Aug 2010 14:44:49 -0700 (PDT)
Received: by 10.231.142.90 with HTTP; Sat, 28 Aug 2010 14:44:49 -0700 (PDT)
In-Reply-To: <20100828083325.GA10221@rhein.zuhause.netz>
References: <AANLkTikEXrrN54mzFeDmxwm=kPYpLSz1XJww0tFBVuwW@mail.gmail.com>
	<20100828083325.GA10221@rhein.zuhause.netz>
Date: Sat, 28 Aug 2010 23:44:49 +0200
Message-ID: <AANLkTimJKQE_4wH9SYkS+zGp5Y_hBh3MxDR7PUHQsrab@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Custom kernel + TI - modules
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
X-List-Received-Date: Sat, 28 Aug 2010 21:45:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi Henning,

thanks for the answer, though this an answer I was fearing to hear.

Cheers,
Maksym.

> TI-Stuff is only known to work with 2.6.29-psp or 2.6.32-psp. To my Knowledge
> there is no variant for 2.6.33.


