Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OHB8s-0003vy-92
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 09:35:06 +0200
Received: by fxm9 with SMTP id 9so1798032fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=Biv+/kjU75zKSuhk3LSAfQEutoriutcZhyE0qhgIjl0=;
	b=hKscQh7upDmsVU9yqloOy3D/RkSPhzflO4OR6XC8C8rroQtYOfsg9sh3ao7inBcySE
	+l8XSgJCF2y6sXEI97FRQzYOJVhvD4W9rAhl/Up9dMFAawVCr2BGYiqRBDXidAYK8UwQ
	QjyWaJdPkN7BHP+cXpLZTJqTHErVEQdkcEN1g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aJTLeYHqV861g+PtbiLBOXaGcXZUbt+U2S19GEGSy2S5OWhCaKutkdbtvasbFQkFSk
	RPEvGoUDe5DfM8XzxsAxWvzIvHUjASKjQj2ugALzg/WYy3+OW56Xg+oSkFZHJHJLvRyk
	S9Xv+5kfPONv2RiSeidpGx8GBujgnXtTaIxh0=
Received: by 10.223.50.68 with SMTP id y4mr7375227faf.51.1274859058746;
	Wed, 26 May 2010 00:30:58 -0700 (PDT)
Received: from s42.loc (85-127-94-237.dynamic.xdsl-line.inode.at
	[85.127.94.237])
	by mx.google.com with ESMTPS id r25sm28719769fai.11.2010.05.26.00.30.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 00:30:58 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OHBGK-0000zq-8G; Wed, 26 May 2010 09:42:48 +0200
Date: Wed, 26 May 2010 09:42:48 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526074248.GC31532@mx.loc>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
	<1274854676-5931-4-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1274854676-5931-4-git-send-email-koen@openembedded.org>
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
Subject: Re: [PATCH 4/7] Usermanual/getting_oe: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 07:35:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 26, 2010 at 08:17:53AM +0200, Koen Kooi wrote:
>From: Chase Maupin <chase.maupin@ti.com>
>
>* Fixed up typos and other errors in the documentation.
>
>Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>Signed-off-by: Koen Kooi <k-kooi@ti.com>
>---
> docs/usermanual/chapters/getting_oe.xml |   26 ++++++++++++++++++++++----
> 1 files changed, 22 insertions(+), 4 deletions(-)
>
>diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
>index d18c955..cb82220 100644
>--- a/docs/usermanual/chapters/getting_oe.xml
>+++ b/docs/usermanual/chapters/getting_oe.xml

>@@ -342,6 +342,16 @@ MACHINE = "om-gta01"</screen>
>             </varlistentry>
> 
>             <varlistentry>
>+              <term><literal>base-image</literal></term>
>+              <listitem>
>+                <para>Build and image that is the smallest possible image

s/and image/an image/


