Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OJD9g-0003E2-4V
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 00:08:20 +0200
Received: by wwb34 with SMTP id 34so2346334wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 15:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=+locGczUpixd2kLnctT/dGH1GBVSTijlEw3FhbgNeyM=;
	b=QxYvskHn6DQ9v8iDYI3y/KkPXW8h+qMu2dumsZ8r6J3PtSb3NSpvN+62ZJy7tVRvsv
	n0ksNdgy1wiF139Up3A4ArptzTis7BqQ6KPvgT69HtwtfWTdpBTvB/VDu1gyPaikHgJr
	wVUoBNfrpVcpFGCRa+fn+5ihdjnF66k0+v490=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sKgiQtCCJf2Trvg0UWtXVIsCc923IdwvD8Zl3LiHHoASjuu819t45aMrhjSGbYXgvr
	HlwvePepMAnRtSSUI5aBO50CQyfPA6IGlc7yUmIN/RZcAT54BwWmJF2BVHCj/TG2NJtj
	ZU6OV8pQ+4KRkAOtuGRCQOdKuq0vo/wU5OQM8=
MIME-Version: 1.0
Received: by 10.227.143.211 with SMTP id w19mr4784964wbu.182.1275343446926; 
	Mon, 31 May 2010 15:04:06 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Mon, 31 May 2010 15:04:06 -0700 (PDT)
In-Reply-To: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
References: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
Date: Mon, 31 May 2010 18:04:06 -0400
Message-ID: <AANLkTilCZJoRhGKzBokT9TuZwbh0mzyzsBQ2J3NsIpwJ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gitver problems
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
X-List-Received-Date: Mon, 31 May 2010 22:08:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

-vvvv provides a little more info ...


NOTE: Running task 729 of 733 (ID: 8,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_package_stage)
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb
do_package_stage failed
NOTE: package autotools-demo-1.0-2-ga58ca94-r0: task do_package_stage: Started
ERROR: Task 8 (/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_package_stage) failed with 256
ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb'
failed
ERROR: Function staging_packager failed
NOTE: Task failed: ('function staging_packager failed',
'/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-2-ga58ca94-r0/temp/log.staging_packager.26542')
ERROR: Logfile of failure stored in:
/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-2-ga58ca94-r0/temp/log.staging_packager.26542
Log data follows:
| *** Error: CONTROL/control is missing field Source
| The Source field contain the URL's or filenames of the source code
and any patches
| used to build this package.  Either gnu-style tarballs or Debian
source packages
| are acceptable.  Relative filenames may be used if they are
distributed in the same
| directory as the .ipk file.
|
| ipkg-build: Please fix the above errors and try again.
| ERROR: Function staging_packager failed
NOTE: package autotools-demo-1.0-2-ga58ca94-r0: task do_package_stage: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb
do_package_stage failed
ERROR: Task 8 (/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_package_stage) failed with 256
ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb'
failed
ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb'
failed

So we need a way to provide Source URL's for packaging ...

Cliff


