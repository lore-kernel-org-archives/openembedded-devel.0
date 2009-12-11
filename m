Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NJDJz-0000tA-04
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 22:46:46 +0100
Received: by fxm25 with SMTP id 25so1465337fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 13:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nQ3mwJSCn68AG0JKv8NVlXLylD/NRvLKnLzAnXIEoKc=;
	b=OE0BZuBuo5AewpD17KetahDi5ALRppyhkvb6mWoVGhpz3i6ifDT1Vbrcq3ib6HhTLq
	QjdjE0cNOuFMChA+FzZhAwGAyNWntrIaVPQi5kCmMvGvJwfnepNmpipGKIQo36Z6rlmP
	WHBb7TAoY1WL1//RoqmKZZz78UOTDaNH5S5gw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VI1c9sUDNwZT1awVsAeAWS82nGQGzACD3qzt1sBNmrw0jhAc0vZE3y1eiF6nDWT7V2
	Ml6lQ6EGaEhyHmOlgW3lpB8/rkEVclvUPYGtulKrCCg3mi2cI7JDSXQcVFeW3QKIgvSn
	gjK3fzXMyZmbSUhDAfpQTya1m/4furoe7NAGo=
MIME-Version: 1.0
Received: by 10.239.173.204 with SMTP id g12mr202588hbf.190.1260567899057; 
	Fri, 11 Dec 2009 13:44:59 -0800 (PST)
In-Reply-To: <hfim04$osr$3@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<hfim04$osr$3@ger.gmane.org>
Date: Fri, 11 Dec 2009 22:44:59 +0100
Message-ID: <c384c5ea0912111344o588a950dq7dc06954f6d71be0@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] binutils{, -cross}_nios2-2.15.bb: binutils for 	nios2.
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
X-List-Received-Date: Fri, 11 Dec 2009 21:46:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Koen,

>> ---
>> =A0recipes/binutils/binutils-cross_nios2-2.15.bb | =A0 =A08 +++++++
>> =A0recipes/binutils/binutils_nios2-2.15.bb =A0 =A0 =A0 | =A0 26
>> +++++++++++++++++++++++++
>
>
> That's bogus. Change that to 2.15-nios2 or put nios2 in PR, but don't scr=
ew
> up binutils versioning.
>
nios2-<version> has been fixed to <version>-nios2 my local branch.

Thanks for the review and remarks,

Regards,
--=20
Leon


