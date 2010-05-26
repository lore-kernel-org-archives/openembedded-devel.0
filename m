Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OHB6e-0003ng-Ck
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 09:32:48 +0200
Received: by fxm9 with SMTP id 9so1796326fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 00:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=Ow6Y5A3hOgr2V699FTV5lMU6inwPgsUARgFjiYEb/VE=;
	b=BbMS3VArH0e7OOF9zOmibTwv9XCFGJfB87kXjRFN16oLUxE+emBi10OOpm5ab8elOr
	wQKowIQ0YQXHHst++EGRJMsK1mEh0hFFoY+CYfFOMMrWrDxTrBVbEeDOCd0a3sZ0YjxV
	5zlrO6n4rzv+qIePCSvaUVelok9mfk8NEsRqw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=w43mh82xGd/FuyJzSrN0mkLaFaDamr4jiYbg6+FPMfdFQpYZiPV9rbLPVm52Q0oCHT
	RR1plQKL/Ro7yVy5QYCNDXQva5pksz4l0go1YokDnqJjmj7CyNF0t7EKvWyv0lq36vUX
	KQZYzZiOuS5mxcng41HlWhdgUM9xls6SvCx/g=
Received: by 10.223.16.142 with SMTP id o14mr2182410faa.11.1274858920892;
	Wed, 26 May 2010 00:28:40 -0700 (PDT)
Received: from s42.loc (85-127-94-237.dynamic.xdsl-line.inode.at
	[85.127.94.237])
	by mx.google.com with ESMTPS id r25sm28698320fai.23.2010.05.26.00.28.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 00:28:40 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OHBE6-0000vC-K9; Wed, 26 May 2010 09:40:30 +0200
Date: Wed, 26 May 2010 09:40:30 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526074030.GB31532@mx.loc>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
	<1274854676-5931-3-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1274854676-5931-3-git-send-email-koen@openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>, Koen Kooi <k-kooi@ti.com>
Subject: Re: [PATCH 3/7] Usermanual/features: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 07:32:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 26, 2010 at 08:17:52AM +0200, Koen Kooi wrote:
>From: Chase Maupin <chase.maupin@ti.com>
>
>* Fixed up typos and other errors in the documentation.
>
>Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>Signed-off-by: Koen Kooi <k-kooi@ti.com>
>---
> docs/usermanual/chapters/features.xml |   10 +++++-----
> 1 files changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/docs/usermanual/chapters/features.xml b/docs/usermanual/chapters/features.xml
>index 3cbf1d8..0b82378 100644
>--- a/docs/usermanual/chapters/features.xml
>+++ b/docs/usermanual/chapters/features.xml
>@@ -22,9 +22,9 @@
>     <para>Run-time Dependencies (<command>RDEPENDS</command>) will be added
>     when packaging the software. They should only contain the minimal
>     dependencies to run the program. OpenEmbedded will analyze each packaged
>-    binary and search for <command>SO_NEEDED</command> libraries. The
>-    libraries are absolutely required by the program then OpenEmbedded is
>-    searching for packages that installs these libraries. these packages are
>+    binary and search for <command>SO_NEEDED</command> libraries. These
>+    libraries are absolutely required by the program so OpenEmbedded will
>+    search for packages that installs these libraries. These packages are

s/packages that installs/packages that install/


