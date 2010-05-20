Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OFDXt-0007ya-F6
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 23:44:54 +0200
Received: by gwj19 with SMTP id 19so157816gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 14:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=RUbFJsJ6lmkKCp1DbF0oF/h3mE3qN6FtpbKD4lP0adM=;
	b=T7iooNXc5KM+QGCzyQkUNFHuRjWyQxX/oXw+w7vXRnkpjFFZuCsLB9IIdCmJX8UVQo
	F4GuQG7tWxswQpvVgRTsaAPMxT/LxM4Hjg4Nh4n8QloRoa89V46PQDINc5nymQwCD/xg
	Bykh6z3SvMtv76Esh22m0CJxPyEdnqMmhFPrA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=s+l2g6Wg567xCU8cO8q5+oJ/2UCZvA0txSi1OUU+JHndxveBPvB2N6C/5kNmFBLyB6
	K/c7u28Z3V+pFar4Q1gDZQRUTVJ8J1M61f9AB5czYo5smGLFsEPpoF2Aldu0EimAE2ba
	EvyO5nftE11n4JylAGUei972jSc6P1SlWsNVw=
MIME-Version: 1.0
Received: by 10.151.52.4 with SMTP id e4mr2305418ybk.252.1274391645914; Thu, 
	20 May 2010 14:40:45 -0700 (PDT)
Received: by 10.150.12.14 with HTTP; Thu, 20 May 2010 14:40:45 -0700 (PDT)
In-Reply-To: <1274234538-26516-1-git-send-email-raj.khem@gmail.com>
References: <1274234538-26516-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 20 May 2010 23:40:45 +0200
Message-ID: <AANLkTin6CI2jKSdaSPFpNn38yap_DDwwStmVSipH3Q1-@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFA][PATCH] automake_1.11.1.bb: Remove DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Thu, 20 May 2010 21:44:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Khem,

On Wed, May 19, 2010 at 4:02 AM, Khem Raj <raj.khem@gmail.com> wrote:
> versions but they use features from automake 1.11. We have this recipe
> but it not enabled. I ask for approval to make it default. I have
> build few images thus far without any problems and SHR already uses
> it as preferred automake. Some distributions ask for specific versions

Acked-by: Leon Woestenberg <leon@sidebranch.com>

Regards,
-- 
Leon


