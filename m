Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OJDRJ-0003dr-Gb
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 00:26:34 +0200
Received: by vws4 with SMTP id 4so1134040vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=uI98L53Df8zBkrfpaQgLCBgnMkXkF1MxL59a7HYAiYA=;
	b=Lp6RarR+TwfERIZGWGBX503S82R2siF8WBKkZpFF5V/Rw91hYw2g7uspk0wzkNmY3Q
	oN7041WcsRmbz8E+SdEgiBNfj2MFU/qLnclZ6hZIS6ItCPuEZQ05jttqm7RXADGAehcd
	+Y0xu2GhJkdyiSLyyRBNDa+HEFfiuwyJz2YQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=t0Gr1cH4KmOQqdtZnsBHfUdnUfzAEwZ6ghQRYUXWAUl7VLWLmtR49tfMIYjIJ/KNOT
	ywwyr7XTcF8q1MmTVwOY8nzT3tWD8ahwj4eIZ3lm+xVtb14t22fM4piO8czIC2frjQCi
	YtfSvDFxauOgoVehCeaYkpIcEG9MyW289xaXY=
Received: by 10.224.87.134 with SMTP id w6mr1975700qal.178.1275344538162; Mon, 
	31 May 2010 15:22:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.136 with HTTP; Mon, 31 May 2010 15:21:58 -0700 (PDT)
In-Reply-To: <AANLkTilCZJoRhGKzBokT9TuZwbh0mzyzsBQ2J3NsIpwJ@mail.gmail.com>
References: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com> 
	<AANLkTilCZJoRhGKzBokT9TuZwbh0mzyzsBQ2J3NsIpwJ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 31 May 2010 15:21:58 -0700
X-Google-Sender-Auth: 2Fb-qsv_YuEWASg7zCox23tDlYk
Message-ID: <AANLkTinUqQ16GPijhEAJof0uwAfrokQroib56xX2IutT@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Mon, 31 May 2010 22:26:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 31, 2010 at 3:04 PM, Cliff Brake <cliff.brake@gmail.com> wrote:

> -vvvv provides a little more info ...
>
>
> NOTE: Running task 729 of 733 (ID: 8,
> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb,
> do_package_stage)
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb
> do_package_stage failed
> NOTE: package autotools-demo-1.0-2-ga58ca94-r0: task do_package_stage:
> Started
> ERROR: Task 8
> (/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb,
> do_package_stage) failed with 256
> ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb'
> failed
> ERROR: Function staging_packager failed
> NOTE: Task failed: ('function staging_packager failed',
>
> '/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-2-ga58ca94-r0/temp/log.staging_packager.26542')
> ERROR: Logfile of failure stored in:
>
> /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-2-ga58ca94-r0/temp/log.staging_packager.26542
> Log data follows:
> | *** Error: CONTROL/control is missing field Source
> | The Source field contain the URL's or filenames of the source code
> and any patches
> | used to build this package.  Either gnu-style tarballs or Debian
> source packages
> | are acceptable.  Relative filenames may be used if they are
> distributed in the same
> | directory as the .ipk file.
> |
> | ipkg-build: Please fix the above errors and try again.
> | ERROR: Function staging_packager failed
> NOTE: package autotools-demo-1.0-2-ga58ca94-r0: task do_package_stage:
> Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb
> do_package_stage failed
> ERROR: Task 8
> (/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb,
> do_package_stage) failed with 256
> ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb'
> failed
> ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb'
> failed
>
> So we need a way to provide Source URL's for packaging ...


Last time I looked at that part of the packaging classes and SRC_URI, they
fell back to ${FILE} if SRC_URI was unset, which while not particularly
useful, seems a reasonable way to do it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

