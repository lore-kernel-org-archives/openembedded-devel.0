Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1R1jMr-0000VB-AA
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 20:30:30 +0200
Received: by ywa12 with SMTP id 12so878850ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2011 11:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=8BehaOrGkvDGrKUEY+LmBsqu4VQEh6isH/fSI12+EmA=;
	b=O5LDuhpTD69nEOBG8gXp572KxeQTXWscjmSU+sDSl0/gUWnPN6ckRxho2zywYVx2a0
	g0T6gGfa8BZpjnBrX8s2dqPKKJuGV8XP6oeYIpvfOCTFB+4jjNzfxAxlTJo3Gn9/OR8+
	RsM9eutYcz8WA9vlkH2Wln9GiAdM//Yv4iptQ=
MIME-Version: 1.0
Received: by 10.42.145.66 with SMTP id e2mr431508icv.262.1315506325139; Thu,
	08 Sep 2011 11:25:25 -0700 (PDT)
Received: by 10.42.213.197 with HTTP; Thu, 8 Sep 2011 11:25:25 -0700 (PDT)
In-Reply-To: <4E64EE9D.6090909@dresearch-fe.de>
References: <4E607624.8010300@dresearch-fe.de>
	<4E64EE9D.6090909@dresearch-fe.de>
Date: Thu, 8 Sep 2011 11:25:25 -0700
Message-ID: <CA+M6bXkrdOVYWSNdEA469u6n34TUj_31=fnAUHcpGn2U_QiF6w@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [2011.03-maintenance] pull request (gcc/java/binutils) - Update
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
X-List-Received-Date: Thu, 08 Sep 2011 18:30:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 5, 2011 at 8:45 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote=
:
> Hi Tom,
>
> please pull these 3 commits from here:
>
> URI: git://git.openembedded.org/openembedded
> Branch: sledz/maintenance
>
> Jesse Gilles (1):
> =A0 =A0 =A0classpath in 2011.03-maintenance
>
> Stefan Herbrechtsmeier (1):
> =A0 =A0 =A0gcc: Remove package libstdc++-dev and libgcc-dev from gcc-cros=
s
>
> Steffen Sledz (1):
> =A0 =A0 =A0binutils-2.18: fix checksums
>
> All are bugfixes and already in oe-dev master.

Applied, thanks.

--=20
Tom


