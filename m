Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKx3q-0007uS-Jk
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 18:53:47 +0100
Received: by ywo32 with SMTP id 32so542621ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 09:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=c0kE+PV8XzobqQeCSAdCsewjwo2PMp982zfHCOAngqk=;
	b=o3yQZzociMRv3J+sPBNh4TfEd9E74zp4udlmiGecNbKRVZwYrEE+CwYlSBElPpdFGa
	5Y2XaUi13BMyETpQApXucv3Fl+7KWMJJ0QFgdDH8IziPg3ouBW+A3mzKKwd6CPtU3SD4
	sqD1Lm3CfNybnSsO/kR01hyGChkzpeO79Gb5s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=wEcaOhV8Q/ci6YrajyH425/ye9oBVx3VehKYeV76Usi4tD7P/2y0r6/SDU/2enwGg4
	g/cv1t4HhgGtRJPuwHSiPaTfLyVwH8NAhigEJFg8AFLN8pYPplik9fmQouxWsnsv/D2C
	rtOprlrqsVpQNOMc09zkimH3g4gKB4/bAoMZ8=
Received: by 10.90.99.8 with SMTP id w8mr9127082agb.0.1290534752673; Tue, 23
	Nov 2010 09:52:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 09:52:12 -0800 (PST)
In-Reply-To: <4CEBFD16.1040609@gravedo.de>
References: <4CEBFD16.1040609@gravedo.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 09:52:12 -0800
Message-ID: <AANLkTimKz2CMcnh9E=jP8uRghU+06yNXpqJPt1kmNzaD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RELEASE-2010.12] Fix bug in lvm2 recipes
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
X-List-Received-Date: Tue, 23 Nov 2010 17:53:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 23, 2010 at 9:42 AM, Simon Busch <morphis@gravedo.de> wrote:
> Should I cherry-pick it in the release branch to fix the problem there too?

sure please do.


