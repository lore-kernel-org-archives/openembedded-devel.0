Received: from mail-pz0-f177.google.com ([209.85.222.177])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbSd2-00067s-0V
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 06:45:51 +0100
Received: by pzk7 with SMTP id 7so3122973pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 21:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=7hdzZ9z4WX+fLi+lmi+NdhxktvNK+/o6j8KNF9syKWs=;
	b=icc0FpyuMqUlxJFfGDBe+6XRKbsYMHUuwUh3x+ymErWPoUYgyMmdVCXkyR2hbDqKRz
	zdRalXksfbxRdM4ukwkB28ceaiOKBUaAXl4iY57KeDBlr229EgRKJJ1TrU2a6wBlflWK
	79Xx+S8gr/mN6Zn0DgBFJLfuPLAN5DIAu2RjQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=rMlrthb8sjnExTZRcoBfCDnpJ+BiYvYkjZSv4DaMA0uUQtfTOunV/05V7np6M9OabA
	2+6Z3pgoybqrlv6XOehB9wcMV0FFYcuWR4EyRA6Cm62GyjU2ztyBxZIxTvwr01oy3tzZ
	MtochRyPRGrSiCkhMuGEVfg7/+24sKhoCjFuU=
Received: by 10.142.118.20 with SMTP id q20mr1977266wfc.135.1264916602123;
	Sat, 30 Jan 2010 21:43:22 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 22sm3224763pzk.6.2010.01.30.21.43.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 21:43:21 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u7dmmldamn1qzu@camelguo>
	<19c1b8a91001302122x5cde3628xd57639405a862736@mail.gmail.com>
Date: Sun, 31 Jan 2010 13:43:11 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dt591lmn1qzu@camelguo>
In-Reply-To: <19c1b8a91001302122x5cde3628xd57639405a862736@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.177
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building piccontrol - 0.4 failed due to lack of liblua5.1.a
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
X-List-Received-Date: Sun, 31 Jan 2010 05:45:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Sun, 31 Jan 2010 13:22:16 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> in your build tree check where liblua5.1.a is installed and then
> go from there.

No, I can not find liblua5.1.a on my build directory.

-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


