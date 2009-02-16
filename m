Received: from [209.85.218.213] (helo=mail-bw0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LZCVe-0005pU-Vs
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 00:04:20 +0100
Received: by bwz9 with SMTP id 9so3250849bwz.12
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Feb 2009 15:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=XYBHtiSs4tU9XXnfAn/CsHEK4B/2IsRC3A2MF++Dhxw=;
	b=ksmUHviwU3YBCMd2JevoFFN6prwAY8mWpdZC/yaSxgBCteV4AEYh10UeRu/D5qcj0k
	iPJFnEvvmNupT37NexC3DT9Zm1MnhCZnjSU8hCv+EOiiobCWWsRwgFNv/zq3K6BJmIvl
	xtO000pNy9uNDogw1HkBXGILCvT5g3cpAIxao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=YZvy/8JbajKW6FF2uIMPB9QmasoXC6d05HbGreM2qKGPN//lp0WTxKdgqCq1WaT5h2
	Ranr3PH5O3+6mNMCFvz7KafRNcXnmTdYR2xaIGxsXhFgIAM5QXV4KPYuTK1lgBliJC91
	RTE9F+kTLGOBHduen3toEP1WoesvjlCpT57GI=
MIME-Version: 1.0
Received: by 10.181.52.14 with SMTP id e14mr2132992bkk.47.1234825342092; Mon, 
	16 Feb 2009 15:02:22 -0800 (PST)
In-Reply-To: <gncne6$i0f$1@ger.gmane.org>
References: <1234795059.5643.2.camel@EPBYMINW0568>
	<87ljs6fgjx.fsf@neumann.lab.ossystems.com.br>
	<gncne6$i0f$1@ger.gmane.org>
Date: Tue, 17 Feb 2009 01:02:22 +0200
Message-ID: <fce2a370902161502y2ebd80f7pb0214434b5888404@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] neon: bump version to 0.28.3
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
X-List-Received-Date: Mon, 16 Feb 2009 23:04:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

How can I help to update neon version? testing some packages? Please
provide me with the list of them, I'll try to build it.
Anyway, I propose to update 'org.openembedded.dev' branch not stable
one so it's not a big problem for those who really care stability
issues I think.

On Mon, Feb 16, 2009 at 11:56 PM, Vitus Jensen <vjensen@gmx.de> wrote:
> Am Mon, 16 Feb 2009 14:16:34 -0300 schrieb Otavio Salvador:
>
>> Ihar Hrachyshka <ihar.hrachyshka@gmail.com> writes:
>>
>>> Seems that current neon versions doesn't work with gnutls 2.x
>>
>> In this case I belive it could be droped; what others think?
>
> Bad idea as "Please note: The neon API is subject to backwards-
> incompatible change over minor versions (0.24.x -> 0.25.x) but is stable
> across patch releases (0.24.0 -> 0.24.x)." (http://www.webdav.org/neon/)
> and current recipes may rely on a specific minor version.  As least
> subversion and devfs2 tests neon versions.  I haven't checked the others.
>
> Bye,
>   Vitus
>
> --
> Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


