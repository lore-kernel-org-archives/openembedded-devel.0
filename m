Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PIG8N-000656-LV
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 08:39:21 +0100
Received: by wwf26 with SMTP id 26so386983wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 23:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=GnE7H8+V2mImPT4CGofRaKJwNbCf2UtymuvegIxn/Hc=;
	b=YG3jMDoPOqu37SygCR/GvIvAI48i4VoyPgfGscyStzZhV4HDjV7nRNWHf9qxqbTHPG
	dWqtF/lqxL4lV+KrIwzDwBWvUJoLfXmxT2Fp6ksvYfa4bUrVWQeTK5ZmA/azEXGDAFWf
	q72axRXjhV3MY6fmPCrIriuGL4pIkm1MFDE1U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ir5vPAKVAA+a3BahS1KDizU/v9pRUTtYxvhHDxNzzp2gxxX8+yMGx1/yT97TL0RIyS
	HW495HEWYd6ROHwqznTCFXC3iDkZChtTqdOqiztFbKDPU9fIc/6/w65dwxJO608xkt1t
	XCZS4/DlACimW1e/Co6+s93N3tI45O7xxfoyQ=
MIME-Version: 1.0
Received: by 10.227.128.7 with SMTP id i7mr7190089wbs.165.1289893087170; Mon,
	15 Nov 2010 23:38:07 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Mon, 15 Nov 2010 23:38:07 -0800 (PST)
In-Reply-To: <20101116061352.GG20958@jama>
References: <4CE1D1D1.1000009@gmail.com>
	<20101116061352.GG20958@jama>
Date: Tue, 16 Nov 2010 18:08:07 +1030
Message-ID: <AANLkTikC0c057fz7BFAWEjw4BGqmJfQ5OkvR+AZBOA_9@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: emacs copying ${STAGING_DIR_TARGET} - wtf?
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
X-List-Received-Date: Tue, 16 Nov 2010 07:39:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 16 November 2010 16:43, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Nov 16, 2010 at 11:05:29AM +1030, Graham Gower wrote:
>> PS: emacs and emacs-x11 fail for me in do_compile.
>
> Do you have make-3.82 on your host? emacs-x11_23.1.bb compiles fine with
> SHR.

Nope. make --version says 3.81.


