Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1Ot17O-0008IR-T7
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 18:34:04 +0200
Received: by ewy7 with SMTP id 7so2490835ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:reply-to:mime-version:content-type:content-disposition
	:user-agent; bh=i2nQIJedAzWZs1elW8PPRWKl68mMiQEU2zIQ7k6FcAE=;
	b=BPMrVfxEshivMZR/58zWD4tnuYxf2Z5eEKI0+AdcyD6yn3xbXwUQpW/8M71IuLwTn0
	XGpv0aXGOoyG586NazmZ2cbdDo4k8dOaxsRcfOwDANb0iECtzr4x13arZKmvIPcyXMis
	2CM1Q3eRI9P2JYOgBGoVhsWsyBB/DpnsjxgTc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:reply-to:mime-version:content-type
	:content-disposition:user-agent;
	b=NFw37gUjWyvL7uW3Oc62VJvjc63pCe6hby7guh5i9TH0I15w0FoBE+B1j9S4HM+bNJ
	bxzUz8doyGg113XSl0mRJHb9QleiN/W2yB3BjdzVLRuzBHFijxMEUV0u2Z93oZ9QP4Y9
	eKXlVmIhZGBOOTliCCdjUcDzsJafg8TnZPF/k=
Received: by 10.213.11.8 with SMTP id r8mr28114ebr.54.1283877193373;
	Tue, 07 Sep 2010 09:33:13 -0700 (PDT)
Received: from localhost (c-96dde555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.221.150])
	by mx.google.com with ESMTPS id v59sm10171036eeh.22.2010.09.07.09.33.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Sep 2010 09:33:12 -0700 (PDT)
Date: Tue, 7 Sep 2010 18:36:05 +0200
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100907163605.GA15949@boggieman.bredbandsbolaget.se>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kristoffer.ericson@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Moving keys to development server
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
X-List-Received-Date: Tue, 07 Sep 2010 16:34:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Greetings,

We at JLime are setting up an development server to be able for all
developers to work on same machine (and build/push alot faster). Im having issues
getting the write access from the server (works fine from my laptop).
Ive moved the keys into my server user account but cant get it to work.
It fails with access denied.

So, what am I missing?

Best wishes
Kristoffer


