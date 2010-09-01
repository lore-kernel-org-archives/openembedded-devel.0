Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OqtYj-000198-Pq
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 22:05:46 +0200
Received: by wwe15 with SMTP id 15so861239wwe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 13:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=IC0Tig/e9vB1GPtzW33D3Mt+P8Px5uJnjsP0MEaN+tk=;
	b=EEM+LM1UAl3kZ5ltnBVYIuQojZoXUhw6YpAIYw+pFLnGx4K/NXYIWMw2kk3t/c+9cA
	zLqgQNA2zhxp+Ez+P2DriU+13c9vF/InLGxW03qHIodN4VS+04kUDezpuVT5KrIO1tLt
	jO8kobru9SV4OYmMtP2DIzdD+RmptInnoUxhk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=hqrs943C1sOOj0uScZfIslUGctS2Xu0U0blQsWps1xqE1mDu3nzyUc4hE9LdQCqKP+
	A1dhW5i/qQuQmk2TXkRD3XNMcWoPkD/TO4QopNFyIWTS6c2niNLvn0znru4BCPTzS/r9
	3dvfhQJE483S+tUtbE9eU9RK1BVTyVDjiC744=
MIME-Version: 1.0
Received: by 10.216.11.205 with SMTP id 55mr8327020wex.51.1283371483548; Wed,
	01 Sep 2010 13:04:43 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Wed, 1 Sep 2010 13:04:43 -0700 (PDT)
Date: Wed, 1 Sep 2010 13:04:43 -0700
Message-ID: <AANLkTimeV1FbwQCMYL7WH3tuo_zwcYX1o9cs1H66VPhu@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libxml-namespacesupport-perl stuck in do configure
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
X-List-Received-Date: Wed, 01 Sep 2010 20:05:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am trying to get this to build and it seems to be stuck on the
do_configure part, I let it run for over 24 hours before killing it
and when I tried to alt C to kill it, it endlessly looped showing
something about selecting the country your in and loops through the
choices endlessly the only way I could kill it fully was to close the
terminal. I noticed in May someone else brought up this or a very
similar issue, what is the work around and or fix for this? Thanks for
any help or tips


