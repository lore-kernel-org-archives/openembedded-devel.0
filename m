Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3r1c-0004qs-2Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 16:00:48 +0200
Received: by iwn37 with SMTP id 37so204396iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=V2uOGaWcycez5OIDPY2jMTlDDzCFqUEFQ7rjfLFJanU=;
	b=kPpGtY67cGvoh5DOyF7VgrIBH2VlCKP+HZUkmcQxl5rN4vpxN53xHkUpYb/ffN8wPZ
	E/Sf4zCdl+x4dFYYdg2xyGQ4bZd2gRmJDBFtkWCPACj+Nrp9+MW5e/qL2GMibqRtVCN/
	HSe+9Veg8QFBs1lKMaoHe/MqAjYGDO+WOAVMI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MmytqFujjvKMij8CnWfPAoTr6m6SGSdEldKpttTRuJTgJQT/e1gNWLiDAJ8SI/7vm4
	TdrZj+wXwACqcyvS3+2pfPQn2niBEaEO5Ya/Q1ZGHkbuJbkgZJJ2Z+gSY0SZkKiBBeEW
	5zhEXCR4DgNuO8O+un7l4fNBcKWIcJJeLE0HE=
MIME-Version: 1.0
Received: by 10.231.148.83 with SMTP id o19mr884506ibv.112.1286460017507; Thu,
	07 Oct 2010 07:00:17 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 7 Oct 2010 07:00:17 -0700 (PDT)
In-Reply-To: <4CADD11C.6020800@freyther.de>
References: <4CADCF1E.3090602@mentor.com>
	<4CADD11C.6020800@freyther.de>
Date: Thu, 7 Oct 2010 16:00:17 +0200
Message-ID: <AANLkTimRidGM5_Lob02ZqFtENcYi2hjigKs80=bkLjLh@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Updating libtiff
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
X-List-Received-Date: Thu, 07 Oct 2010 14:00:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/7 Holger Freyther <holger+oe@freyther.de>:
> On 10/07/2010 09:46 PM, Tom Rini wrote:
>
>> I think we should go with:
>> - Add tiff_4.0.0beta6.bb which should be compatible with beta5 and will get
>> upgrades right.
>
> but not with tiff_4.0.0.bb... then you would need to bump PE...
>

Yeah, that's why I was told to use the 3.9.2+ construct.

Forgot if there was a reason (e.g. security vulnerability) not to keep 3.9.2

Frans


