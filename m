Received: from [209.85.221.176] (helo=mail-qy0-f176.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1Mj9fJ-0007Bn-RL
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 12:35:41 +0200
Received: by qyk6 with SMTP id 6so871478qyk.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=O1M3ePoxp15ul/B+Z4bOy7siKFE4EGpVGNyznUSW3s0=;
	b=Pp1gNifezpuwIwg/ryIsMry+/1jHTQuqbwgXdw70AcrQi1Vp5/KGSa+JyvEC/qV77g
	eOOQUUeJUYgcdVWWv54LA2c2Nj/wjcWACLGPVIFnEAckBH5vqjFH2Dzfvw4v1kjlYIYo
	V/gBv8AQ28+Ca2SycfXZ9qvGROjFsb1uEoLWs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gpfuqGZ0UllwKWIM5NBtsxy7e1OuYLIGbl+vIXYmjH11V6ZhtBO05GPO5sr4js5VIC
	r87ugcPLtevtMiR/uxrV+PxR82qyVCECGEEErypY9B+FdP+OnQc7bggM+oLCIO8UXt8z
	GfDAoWhhc54eydQZ0Hrzqh4PtGHTE7J18Xv6c=
MIME-Version: 1.0
Received: by 10.229.3.12 with SMTP id 12mr2650094qcl.98.1251973010238; Thu, 03 
	Sep 2009 03:16:50 -0700 (PDT)
In-Reply-To: <h5um2o$ioq$1@ger.gmane.org>
References: <5f2b60908120549u70fe6e00yf1df3e0e8d9bc059@mail.gmail.com>
	<h5um2o$ioq$1@ger.gmane.org>
Date: Thu, 3 Sep 2009 12:16:50 +0200
Message-ID: <5f2b60909030316q43cc1b60ic8350e68bcdb2a5c@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gstreamer-ti fails for target dm6446-evm (TI davinci)
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
X-List-Received-Date: Thu, 03 Sep 2009 10:35:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/8/12 Koen Kooi <k.kooi@student.utwente.nl>

> On 12-08-09 14:49, Bj=C3=B8rn Forsman wrote:
>
>  Any suggestions for a fix?
>>
>
> I'm cleaning up the arago updates and plan to push them into OE this week=
:
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=3Dkoen/dvsd=
k
>
> When that's in it should give you something that at least builds for
> dm6446-evm.


What is the status of the dvsdk branch? Any new ETA on the OE push?

Regards,
Bj=C3=B8rn

