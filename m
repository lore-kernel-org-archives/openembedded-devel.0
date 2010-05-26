Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OHBVr-0004bB-8f
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 09:58:51 +0200
Received: by fxm9 with SMTP id 9so1817255fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 00:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=sKf0y8Jl8hUWz0vC5w6ISnDiy7s2469k4YiBesX7Qx0=;
	b=s8htI8ikqO5fY1KpchRydObwr24xPhUUAy6t6PtKfB6eoQtL53YdRjCG9gRfG1upD1
	9qE54ghl/U1fG5txcijdRAv5WNx+Ap47e4JZW7Opro/fy+QN/PX8JSPxnVp2+L+5B5Oh
	RgeieQf1NNrFyqlleTdAGsIlWub1lOz5rF+rk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Nne9eLXp9ZtxRUFJn+SZrj3URSkoPEMRvH5FBq30L+O5Yd9xRjuznuRxooCq+ITZ+C
	yks/vugshJFGUfqZa6Xq/if3xj4bdSGBkNvF5PUY2DqQA7Wk1r9tFH3pEtuVobIm3AmP
	KHlVLaH7QYNImCWxxQ49cDobohANWlMJLRfH4=
Received: by 10.204.6.193 with SMTP id a1mr3362908bka.104.1274860482751;
	Wed, 26 May 2010 00:54:42 -0700 (PDT)
Received: from s42.loc (85-127-94-237.dynamic.xdsl-line.inode.at
	[85.127.94.237])
	by mx.google.com with ESMTPS id h21sm4342983bkh.5.2010.05.26.00.54.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 00:54:42 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OHBdI-0001qT-JH; Wed, 26 May 2010 10:06:32 +0200
Date: Wed, 26 May 2010 10:06:32 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526080632.GD31532@mx.loc>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
	<1274854676-5931-5-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1274854676-5931-5-git-send-email-koen@openembedded.org>
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
Subject: Re: [PATCH 5/7] Usermanual/metadata: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 07:58:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 26, 2010 at 08:17:54AM +0200, Koen Kooi wrote:
>From: Chase Maupin <chase.maupin@ti.com>
>
>* Fixed up typos and other errors in the documentation.
>
>Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>Signed-off-by: Koen Kooi <k-kooi@ti.com>
>---
> docs/usermanual/chapters/metadata.xml |   18 +++++++++---------
> 1 files changed, 9 insertions(+), 9 deletions(-)
>
>diff --git a/docs/usermanual/chapters/metadata.xml b/docs/usermanual/chapters/metadata.xml
>index bbf6f73..2b65454 100644
>--- a/docs/usermanual/chapters/metadata.xml
>+++ b/docs/usermanual/chapters/metadata.xml


Shouldn't the whole block below be updated to take SRC_URI[md5sum] and
SRC_URI[sha256sum] into account?

Alternatively just provide a link to
docs/usermanual/reference/var_src_uri.xml which covers that in detail
and should be more up-to-date

>@@ -128,23 +128,23 @@ DEPENDS = "gtk+"
> RDEPENDS = "cool-ttf-fonts"
>                 </screen> The package needs gtk+ to build ('DEPENDS') and
>     requires the 'cool-ttf-fonts' package to run ('RDEPENDS'). OE will add
>-    run-time dependencies on libraries on its own via the so called
>-    <emphasis>shlibs</emphasis>-code, but you need to specify everything other
>+        run-time dependencies on libraries on its own via the so called
>+    <emphasis>shlibs</emphasis>-code, but you need to specify everything else
>     by yourself, which in this case is the 'cool-ttf-fonts' package.</para>
> 
>     <para>After entering all this OE will know what to build before trying to
>     build your application, but it doesn't know where to get it yet. So let's
>     add the source location: <screen>
> SRC_URI = "http://www.host.com/foo/files/${P}.tar.bz2;md5sum=yoursum"
>-                </screen> This will tell the fetcher to where to download the
>+                </screen> This will tell the fetcher where to download the
>     sources from and it will check the integrity using md5sum if you provided
>     the appropriate <emphasis>yoursum</emphasis>. You can make one by doing
>     <screen>md5sum foo-1.9.tar.bz2</screen> and replacing
>     <emphasis>yoursum</emphasis> with the md5sum on your screen. A typical
>-    md5sum will look like this: <screen>a6434b0fc8a54c3dec3d6875bf3be8mtn </screen>Notice
>-    the <emphasis>${P}</emphasis> variable, that one holds the package name,
>-    <emphasis>${PN}</emphasis> in BitBake speak and the package version,
>-    <emphasis>${PV}</emphasis> in BitBake speak. It's a short way of writing
>+    md5sum will look like this: <screen>a6434b0fc8a54c3dec3d6875bf3be868 </screen>Notice
>+    the <emphasis>${P}</emphasis> variable holds the package name 
>+    (<emphasis>${PN}</emphasis> in BitBake speak) and the package version 
>+    (<emphasis>${PV}</emphasis> in BitBake speak). It's a short way of writing
>     <emphasis>${PN}-${PV}</emphasis>. Using this notation means you can copy
>     the recipe when a new version is released without having to alter the
>     contents. You do need to check if everything is still correct, because new


