Received: from mail-yw0-f171.google.com ([209.85.211.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NlRxp-0000lW-IM
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 20:04:33 +0100
Received: by ywh1 with SMTP id 1so552629ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 11:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eEndgkDlr5jtBq14CmSYNk/xUdxfZc8qcMo3DCkWmKE=;
	b=CAMRU9SsImw+JATNElV1jIxz9bRH7hYGH7qmaiGetxw1VX8dhX+GM2n0SPalZhTYMj
	yhHXCFOpCTfyHRh3BiHZOz7QejA5BU2jc5WeEqVvefj4fv9XzNyG/rUgzgTEkqp0I2cH
	DgyOosXpENanpG8vZLthY1fx+VcJjNy2J9zzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ImZY6wcL8ZmnKJLmAFR6mAkRhthuO2Fjd+X9NezvnKw2cCuTFTu7/ivB/hk5G+o0lC
	ff6lXfJisonprMefvmWmPtDKxwPdP0TXHOIeqwnHddK+lLcfCmMdCN5CcP4IknYDioZc
	QCLwE2HBG1cDlslFNMKGm3/KchIoNsovQXeBs=
MIME-Version: 1.0
Received: by 10.101.202.34 with SMTP id e34mr3111420anq.107.1267297304830; 
	Sat, 27 Feb 2010 11:01:44 -0800 (PST)
In-Reply-To: <201002271945.18454.marcin@juszkiewicz.com.pl>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<201002271904.22479.marcin@juszkiewicz.com.pl>
	<ac9c93b11002271040i221bdb10o22cad1cf1551b6fb@mail.gmail.com>
	<201002271945.18454.marcin@juszkiewicz.com.pl>
Date: Sat, 27 Feb 2010 20:01:44 +0100
Message-ID: <ac9c93b11002271101t795ebe64y7d116ea3af9eea7e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sat, 27 Feb 2010 19:04:34 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2010/2/27 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia sobota, 27 lutego 2010 o 19:40:32 Frans Meulenbroeks napisa=B3(a):
>
>> I just wanted to suggest a more sensible and clear naming scheme and
>> clean up a little bit, but apparently this is not appreciated :-(
>
>> (and yes, I also think it makes sense to remove old orphaned unused
>> 5-year-old recipes, but guess I'm alone here too).
>
> The problem is that we do not know who uses them. We can remove ones whic=
h no
> one is using or alter them in any way - thats why we are using SCM so use=
rs
> can revert any change.
>
>> Guess I'd better not propose to remove some of those 26 (yes,
>> twenty-six!) glib recipes (or 8 abiword recipes )
>
> Oh cleanups... Too much things to get cleaned, reorganized etc :(
>
Yes and this was a small proposal towards it, but I feel it is not
really appreciated, so I suggest to forget about it.
I'll just move on to activities that I feel are more appreciated.

FM


