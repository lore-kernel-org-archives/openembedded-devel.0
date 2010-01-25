Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NZIfa-0007gw-Tq
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 07:43:34 +0100
Received: by ywh8 with SMTP id 8so916810ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 22:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=a2NLCeNcuGITE2fVffdOnmaxUA37TNovRVV3grXGOFY=;
	b=KJOEVX56lTCCDX/+Cs+S4ynBRIxdGeULSKyPtJj+vfNITmXDKoXqQ9PoUGMXtsTgD6
	CjF1TmSxrGT3eleqhTvAwwZpw038BvydA77/CpNbTxKPGBJJ7EnmLUd0rXhjItSnF85V
	FE4AfUJc+0TBKpSzT4s3+5oS6Be9OwBZkjYeU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=M1QpXIKWqLefy4C0Y3WQ4PGHmK1nDzyQlb3SxKoAbQznKhNFG3A6Dv19AAi8V75PaW
	t+QB8+Wi0tyX996djQnkYKQRiQ1whNL4oDEFb8JBlE9tx+Ki1digXD0buPbas6VWrpXH
	C5mcguXfhRk58tfm/ax1OBhfwJ6LklxojLcxg=
Received: by 10.101.129.31 with SMTP id g31mr7258520ann.153.1264401669392;
	Sun, 24 Jan 2010 22:41:09 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 22sm1637772ywh.0.2010.01.24.22.41.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 Jan 2010 22:41:08 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u60m9axmmn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001242236w53852eb2s8ef6dfbeb0ac57e3@mail.gmail.com>
Date: Mon, 25 Jan 2010 14:40:58 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u62suaqlmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a91001242236w53852eb2s8ef6dfbeb0ac57e3@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: linux-titan-sh4-2.6.21: offset to unaligned destination error when compiling linux-titan-sh4 kernel
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
X-List-Received-Date: Mon, 25 Jan 2010 06:43:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Mon, 25 Jan 2010 14:36:38 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

>>
>> Has anyone ever built kernel for titan machine successfully?
> I have only tried toolchain builds which worked. Care to provide a  =

> preprocessed
> file in  a   bug report ?

Yes, Of course. Could you give me your local.conf? I have not found a  =

workable setting (MACHINE, DISTRO and LIBC combination) for titan.

Thanks a lot!

-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


