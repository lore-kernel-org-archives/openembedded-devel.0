Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q34uS-0007el-Bx
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 12:10:28 +0100
Received: by qwh5 with SMTP id 5so552684qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2011 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=JXbNuAxyXKPdZa+Fk0I73z/qneIOna3hrmj9Xo97rv8=;
	b=lNu1L9+1FCBVgoyT4da0tlWkboVoE5hIPskSZa82OkiKCKnwYo4D2dkWDHA5WUXyC3
	EblOkLraKqAXJzYMUoHYRp7jLeWt4+hgo0HtrvuKFwcmI36bNiSJMdj6Eqm2XhKKPRz9
	uW06DnKCbdME7YS5f2fN5sYXFQvg9B7Be4zvU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QIYQG4sb9/R5wykcc/WVR4/nXhULKmnGh5Nq0YVCbDVshdcLlA/5pu8tn7B+Dh6pOn
	5Xy1Ab2Gg6sKSa5wyF3AI6mbEx/OerAnBAnBAseTfM3hdNRuB1i4u187Bigd9C7pfZkm
	DS9zrSA7ytsnUqn7AIoZsH2ugmkNP+p4evO0M=
MIME-Version: 1.0
Received: by 10.224.138.16 with SMTP id y16mr491141qat.255.1301051305311; Fri,
	25 Mar 2011 04:08:25 -0700 (PDT)
Received: by 10.224.134.5 with HTTP; Fri, 25 Mar 2011 04:08:25 -0700 (PDT)
In-Reply-To: <img1sm$q20$1@dough.gmane.org>
References: <1300971676-31774-1-git-send-email-heroor@gmail.com>
	<1300974563.3795.29.camel@mattotaupa>
	<img1sm$q20$1@dough.gmane.org>
Date: Fri, 25 Mar 2011 16:38:25 +0530
Message-ID: <AANLkTinSf8edN_JitFWFu=oi1cOfseAu4r7fCRMTmrJw@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] TI IPC: Fix License field.
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
X-List-Received-Date: Fri, 25 Mar 2011 11:10:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 24, 2011 at 11:47 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 24-03-11 14:49, Paul Menzel wrote:
>> Am Donnerstag, den 24.03.2011, 18:31 +0530 schrieb Siddharth Heroor:
>>> From: Siddharth Heroor <heroor@ti.com>
>>>
>>> * The correct license for TI IPC is BSD and not TI.
>>
>> Was the original license a mistake or was it relicensed?
>>
>>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>>> ---
>>
>> All Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>. I would
>> push them or do the TI people want to push these?
>
> Please don't push any TI patches without my or Denys' Ack/SOB.

Can you please consider pushing this patchset into the 2011.03
maintenance branch as well?

Thanks and Regards,
Sid


