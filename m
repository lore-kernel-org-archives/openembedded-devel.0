Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIQ9y-0001s9-R7
	for Openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 19:21:40 +0100
Received: by yxd5 with SMTP id 5so569234yxd.6
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 10:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=cBNbCIbTIAFTQgVXGMukn9RamyHlWdltiJJW690t+Yw=;
	b=fXKpUfm0NO651QsoeyQmohWE42BlfCrQxhS2jq3gIYMsvtAnolx0jpV4CaIp6j4hQ0
	Mk+RyNkveYhfWHFLq/OLerWxxDKUUf5ysAwqSGV9hk8bKdqgSi28jbiSXexZSV1sUU2f
	74EhLZE4PkMFoqiFB2BzQWHCgw8TWw0+zuT6s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=JWhbVB8UO2u/vwmTVgCcQYVt7KmQaKrfs+fVDztQByPjB3xoFUSus51vnUQ7QvaCQP
	5YF5PBHYfWGhr9GwpPlSDF9cpEpE3lfPrNMsSU+bDPpQnk33hu2mznUFzKcGj5ZICCx2
	0SR7NWQzjnT6vXZEGMcK8TFauorkGtRldURk4=
Received: by 10.91.42.30 with SMTP id u30mr10033949agj.102.1289931629499; Tue,
	16 Nov 2010 10:20:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 10:20:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 10:20:09 -0800
Message-ID: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Preparing for release - Freeze on master
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
X-List-Received-Date: Tue, 16 Nov 2010 18:21:40 -0000
Content-Type: text/plain; charset=UTF-8

Hello All,

In order to get to the 2010.12 release, I would like to request to
stop pushing any changes to master until release. Please keep your
changes in you local tree ready for when the window
opens again after the release. Any bugfixes (and only bugfixes) that
are required for the release are ok to push after approval on mailing
list.

Please help in testing various combinations to make this release a
robust one. You should report the test results to the testing matrix
on wiki. More combinations we test better it is.
Report any bugs to the mailing list or even better if they come with fixes.

Lets make this release a success!

Thank you for your cooperation

-Khem


