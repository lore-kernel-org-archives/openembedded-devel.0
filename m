Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OwFWD-0003yF-PD
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 16:32:58 +0200
Received: by gxk10 with SMTP id 10so448999gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=diLsYggvLhMZXxN4Vg/YL2+/my8sPZ2jGMI2DBkCHPo=;
	b=lBwIBdXVVjfRvrbj9uiCRFbtzOJ1fDDbut5Sj5Gnbd6t6R4kfgRMY4pDVPMalO0nCs
	/YWKfLz8p7jjY6gQYbSeQlQWRR64bRQyWSsCkLa7yY2eDDLno+zFrREMbVT5HSXltXEA
	A7ivKIlOWEnij1BugGrJyTzYmaPUtsi6umUvQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=guRp5dkw5aIy+j6lY3AEDVxMqG7wJkqdYZe7o4vAI2lwUApnNYAYhtLrudfMWr0STY
	DsM+Yy1C+/tsEf2nX0BkvOVxyztsa7wfHLett4G675yJM8dzMTUlwrsBfwVmE08J+Ht8
	0Kzq9Rlzu4BMn4nxnz7WIygh0s4CLbRpbD/uw=
Received: by 10.101.127.5 with SMTP id e5mr3736877ann.138.1284647526315; Thu,
	16 Sep 2010 07:32:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Thu, 16 Sep 2010 07:31:45 -0700 (PDT)
In-Reply-To: <1284623776.3825.5.camel@mattotaupa>
References: <1284615893-18010-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
	<1284623776.3825.5.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Sep 2010 07:31:45 -0700
Message-ID: <AANLkTi=m8Sg5JtcczZaohgrgmN+y5EbQRYzn6eYoPUVj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: Update recipe for all version
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
X-List-Received-Date: Thu, 16 Sep 2010 14:32:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 16, 2010 at 12:56 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Could you please add more information to the patch headers [1]. Like,
> were do they come from, links to more information why they are needed
> and possibly upstream tickets or commits.
>
>

its already there in the patch headers.

-- 
-Khem


