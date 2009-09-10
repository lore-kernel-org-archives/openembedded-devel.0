Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mlg0q-0006YT-HC
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 11:32:23 +0200
Received: by fg-out-1718.google.com with SMTP id e21so1373984fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 02:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=lmqrENwpCfxOevy1OgXfOoRRpRAI8i2II/5dasjOOXo=;
	b=Yv/xj2TBDIicnrdl0xmcPlX96+3gbkeZhdtqNdMsGTem89yd5vosMA/T4dFqE0K1sB
	CeLaN1z3aF6rTZ6oka71DD+qkNuEiIPv2gVT9+OKEZ6TyvOBNZZ+6rd5uUIZQvaqme9K
	D7nLAh3WJuiLCbzkPlJ6I4Wc8t/8JX49spywA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vs2sniDkHR1LxBnULtSb5/2iX2S7BWBaGa22GkPtdaZhb91anlmb0jmSEpXqMs2LLI
	IPyCOq0W4OKPktWpQPO/FR7fXr4MWaRJ1cCt8E60IPlvWcGlb5LYX2gH4/sgzP5PsGQF
	49qXut6bapc/l+vv71IZuZBXCn6dxdTLw2zpI=
MIME-Version: 1.0
Received: by 10.239.145.11 with SMTP id q11mr140314hba.98.1252575114923; Thu, 
	10 Sep 2009 02:31:54 -0700 (PDT)
In-Reply-To: <1252350704-9530-1-git-send-email-raj.khem@gmail.com>
References: <1252350704-9530-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 10 Sep 2009 11:31:54 +0200
Message-ID: <c384c5ea0909100231q56d54c1dmabd0b229485e218b@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] tar_1.22.bb: Add recipe for 1.22 release.
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
X-List-Received-Date: Thu, 10 Sep 2009 09:32:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 7, 2009 at 9:11 PM, Khem Raj<raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Leon Woestenberg <leon@sidebranch.com>
-- 
Leon


