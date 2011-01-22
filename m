Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pgclo-0005oH-Ks
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 13:40:45 +0100
Received: by iyj18 with SMTP id 18so2835364iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 04:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=mnZNRmbNBx7+siLKFLk5KBUI/DAaqsoDVlVmR6DoxLc=;
	b=e557ZLKsefLstVdJiUXWOD9Rx/j9cTpMbrVETQVvuPW7Ou8ffh/WuYuHClDgw4ky8P
	rbyktaIy/ElkMJCeAEXrJ17FY2aoEcHkgQyx6tJrOuLmuzQb0SUqTRoes4NERGHzGTeX
	tz17RTUqXtLC/+UluN5KQVvEAIZ4xFeTLC/8g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JNRtY7Xi6/VBd4aX0fXxgepUeWkUXHArTFBSKpoSFg94fPETv2qlBdN7v2UiwgypLS
	h9w7kw9J+MUidH11nsXhlyS7Yz1Z3g0FbJXLLJv4cHq0AWOmf46XcZb7Iyf8ZoXlMy3/
	k+PcsgTRJCwR57ZdfiQ+39SesVoXa2Uc5U0Tg=
MIME-Version: 1.0
Received: by 10.231.31.196 with SMTP id z4mr2112898ibc.199.1295699999712; Sat,
	22 Jan 2011 04:39:59 -0800 (PST)
Received: by 10.231.34.69 with HTTP; Sat, 22 Jan 2011 04:39:59 -0800 (PST)
In-Reply-To: <AANLkTimR7QtotOx-e22eRkc_iT8GMr+2gwby42QF=VQ-@mail.gmail.com>
References: <20110120181233.GA1789@lit.local.igalia.com>
	<ihbp5c$4ov$1@dough.gmane.org>
	<AANLkTinnrY2o___wOwe3vqrYfY8QsBQYE6AA7VFuAq7T@mail.gmail.com>
	<ihedug$vsl$1@dough.gmane.org>
	<AANLkTimR7QtotOx-e22eRkc_iT8GMr+2gwby42QF=VQ-@mail.gmail.com>
Date: Sat, 22 Jan 2011 13:39:59 +0100
Message-ID: <AANLkTikRt1cQ_Vp_Y=Z0oxKXjWCsSWa=ahb+VMGcEjzA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Sat, 22 Jan 2011 12:40:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/22 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2011/1/22 Koen Kooi <k.kooi@student.utwente.nl>:

>
>> using things like insane.bbclass. As expected, you had to use pretty
>
> get your facts straight. minimal uses insane.bbclass:
> minimal.conf:INHERIT += "insane"
> No idea when exactly it was added. I'm not the minimal maintainer),
> but it is used now.

Withdrawing this last sentence.
Just after pressing send I noticed I added it myself last Xmas:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/conf/distro/minimal.conf?id=f118388495185c9469b69e68a6f9b7a2ebef17ef

Frans


