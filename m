Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNEC6-0002rL-2a
	for Openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 01:35:43 +0100
Received: by gwj16 with SMTP id 16so2070330gwj.6
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 16:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=WqYioRtAylXBpC9znpmPpw3+CCLULroH4jneAS/s9lk=;
	b=hjJ6tXrorR1yvUbOPJu2XhRzQJvUgBP8YJ8HseaJh599WsaPG+ta0Dx1MNWkQSPZSN
	GjiMSaj6/qGD/4LJ0yTYw5USuMcxaRIq/O+6S3vEmQX7J5GUX9z2wrrBGXC8Z8bORcbS
	x8+RLjz7qnF7kTFnhsVWAZr3oxN7/spj1PdiQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=oATGsC2HHrEmuM2iay3auZpJMBy1uiBh8gButfIZOb7MZsWg+GJbAqv0SFFh3di/hd
	40JK4d2DioessHCFGYaH9zgdnF8W5phJ2oJLmxG2m9Z1k2V+KT8Kmfv4oabzk7y3TNW4
	+M/AtmwQ2SqOKXaeLfGTsQ5CnnThJYTeUe1p0=
Received: by 10.90.99.8 with SMTP id w8mr10020656agb.0.1291077261593; Mon, 29
	Nov 2010 16:34:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Mon, 29 Nov 2010 16:34:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Nov 2010 16:34:01 -0800
Message-ID: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: release-2010 - last moment hot fixes
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
X-List-Received-Date: Tue, 30 Nov 2010 00:35:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi Folks,

Please update your release branch to latest tip and rerun your builds
and other tests that you have been doing
and indicate any hot fixes that we need for the final release. Again
update the Testing table with the results

Thank you
-Khem


