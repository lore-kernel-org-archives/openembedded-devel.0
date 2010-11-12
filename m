Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PH2Lk-0006gT-9c
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 23:44:09 +0100
Received: by ywo32 with SMTP id 32so828119ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 14:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=lW0vFSrNyi+w/gB4U9IdSTEzorhhLtBfJhFxQdDDxSs=;
	b=DWaBzytfW+JJQuds1AwVKnM49KjsDOpWAU9csnXs0el4UQkvVMmPTUF22YT3NDv84M
	tG+/gNfhCiU+QIParANPTvUF2J5DsLRwU2KOQiIxumtG1VGQY5XUqYdoO3SXRzR+6AUC
	MaFCTqyYL+CntdC+ipaeoR42dc2QkwcNrFX3Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=XAMxKaNAkljlQT0d/JHAgRklgh6Jsba2ISA70o1hz6hfijt6dXLMdw6KvEJb67Eeo9
	DHzH4oUh2bBjOdPcI5gHkJKr+0uXotQBdZsIFPzYxkeLBIz6hs2wM6a/rCd3VmCb+UJ/
	MTRJxlc0Y4xUEQl3S1SIVr2pLhir50jqZEjd8=
Received: by 10.91.51.19 with SMTP id d19mr3906947agk.183.1289601782591; Fri,
	12 Nov 2010 14:43:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Fri, 12 Nov 2010 14:42:42 -0800 (PST)
In-Reply-To: <1289596030-8386-1-git-send-email-harvey.tim@gmail.com>
References: <1289596030-8386-1-git-send-email-harvey.tim@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Nov 2010 14:42:42 -0800
Message-ID: <AANLkTik=qbfXy9XPtTEW8mK_08-DFsiKRQ8b1-wry0mD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] nuttcp: new recipe
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
X-List-Received-Date: Fri, 12 Nov 2010 22:44:09 -0000
Content-Type: text/plain; charset=UTF-8

> --- /dev/null
> +++ b/recipes/nuttcp/nuttcp_7.1.3.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "TCP/UDP network testing tool, much like iperf"
> +HOMEPAGE = "http://www.wcisd.hpc.mil/nuttcp/Nuttcp-HOWTO.html"
> +SECTION = "console/network"
> +LICENSE = "GPL"
> +

same thing as last patch regarding license.

-Khem


