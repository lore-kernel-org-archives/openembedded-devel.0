Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1O5o79-0006L9-Tu
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 00:46:20 +0200
Received: by fg-out-1718.google.com with SMTP id e12so893905fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 15:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=pz3JpfJ/AvKPgSOqHfPWwTL4kdbyLTCGiKQ3COoU8lI=;
	b=THYzPG7pcNROFmZjUPUlk3ihLRMScb1XMDx8uAnuNgzOvkZ6s7J0+eeINd54F3XpEV
	z4BwIDWbdENIGMwDw8IPKFit+zAl9+3KJmjaHe8YBt3FFzrz8OnAgT634dULU1+136tW
	ZTIGF9V6G+hq6BamhTGF28SmBpvREwrHAXNUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=FHX2PdSk6Ho0r2/ys2OQ6zeInddSzAk/39fYrtLBSir+O69DfGBiImWjRmHQ4FhrBp
	sxJOP0TliEI/kJqXTzcOENEq1T523uuMIS7iIT0SaLO1KYm1Qc9Gayox7ZOBWAdTDSSv
	DPG4n7zAbMZaWue6sF0o0L4czgdFNFMrODT7Q=
Received: by 10.87.70.20 with SMTP id x20mr3452498fgk.33.1272148963437;
	Sat, 24 Apr 2010 15:42:43 -0700 (PDT)
Received: from [192.168.5.21] (z0701.wist.uni-linz.ac.at [193.171.42.194])
	by mx.google.com with ESMTPS id e3sm2898360fga.29.2010.04.24.15.42.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 24 Apr 2010 15:42:43 -0700 (PDT)
Message-ID: <4BD373DD.2080006@gmail.com>
Date: Sun, 25 Apr 2010 00:42:37 +0200
From: =?UTF-8?B?TWF0dGhpYXMgR8O8bnRoZXI=?= <matgnt@gmail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1272147418-31196-1-git-send-email-matgnt@gmail.com>
In-Reply-To: <1272147418-31196-1-git-send-email-matgnt@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] Topas910 kernel upgrade to 2.6.32 and initial u-boot support
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
X-List-Received-Date: Sat, 24 Apr 2010 22:46:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I forgot to mention the source:
 >http://git.labs.kernelconcepts.de/

So Kernelconcepts did the main part of the work :)

Matthias


Matthias Günther wrote:
> Hi oe list.
> 
> I've attached patches for the topas910 machine. Please let me know your comments.
> 
> Best regards
> Matthias
> 
> 


