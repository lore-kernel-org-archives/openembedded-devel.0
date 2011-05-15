Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLjaY-0008Dl-Oe
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 00:15:02 +0200
Received: by pzk36 with SMTP id 36so1928362pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 15:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=8y0q3X7iPSZw69DaZyCSy6CxLE2Bd7SUCh3v6nztimY=;
	b=RLA531KDIU4juxOSJDrdwAsReG3+vwMMga8UpGrGU12atpxO+AXVTVWVXBF3HPGMLC
	ZYKp7u/c6ZhiYadvtcBB2FiiRNampSthBDAvOK2MkZigKg8mPPO+0/Fc+s68MkleKRbE
	U95m/8u5JcEDwOKT8G2Qg0AVanEoDHRIlMILM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=lIL72fS52JGwRo/eveUtgR1GHeyr7OTBi0KmfQ5ItjwKXSejAMTAN6AJ+TyBhW5OQz
	/tbBurclYtZD8xeyBwsBmnoRqtsi5OaS6A/reqbNpFouMAystpe3ZHK36cR4RHj1j8ec
	NrV4C7WEBKYgfguafzvdTjprto0I+hklTb45k=
Received: by 10.68.64.164 with SMTP id p4mr5890594pbs.330.1305497530110;
	Sun, 15 May 2011 15:12:10 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y7sm2859125pbg.43.2011.05.15.15.12.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 15:12:08 -0700 (PDT)
Date: Sun, 15 May 2011 15:11:11 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110515221111.GC24670@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4DC8F3A2.2090005@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4DC8F3A2.2090005@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: x86_64
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
X-List-Received-Date: Sun, 15 May 2011 22:15:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/05/11 10:13), Jaap de Jong wrote:
> Hi All,
> 
> is there any support for 64 bit intel/amd machines?
> And if so, how to build for them?

classic oe does not have it but there are patches posted look through
mailing list archives

fwiw. oe-core has a working support for x86_64 architecture it will be
worthwhile looking at that

-Khem


