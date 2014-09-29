Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 70A6671651
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 15:13:43 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id b6so322227yha.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=KsJC3ZlWU18wIoPHRJzY+yn+9RWVSUSUVzmSMs+ifn4=;
	b=iwFzK1CivgNuroqs063UHx3bSuhVibJTW9/MxRk2oNV9ezQDwu28U+uWvlsb1f/qAP
	a5cWLcE9kpeg1PSQAsJUpmzbxeMeb0fqKbQe24CUNPasW7Mi0bhgxj94JMteXIXCfMD5
	TiGFbzIv4/kLS0qxYLgr+umI0yyBe656SsZazKg9THYS7EqqjrUhuRfU0pkF0t+w+sgl
	K2AbC6G9snm9cEbaFMzME7Z8KPqbN+IR+B3NZ6LayonXBif6nz+fLPm9nve3Q/2NY60Y
	O9WvsMWMOpJqAFeTlwArAm0QrR4dC3iS8XUf6kNsPfcTQTiv9q/pFieMklD8ZRJFufds
	cEIA==
MIME-Version: 1.0
X-Received: by 10.236.127.140 with SMTP id d12mr59485328yhi.37.1412003624485; 
	Mon, 29 Sep 2014 08:13:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Mon, 29 Sep 2014 08:13:44 -0700 (PDT)
In-Reply-To: <CAOd_LFwvwKvJWXpc4uhYqm4i61vs37isLNmzf5DqjmBvTeiR6w@mail.gmail.com>
References: <CAOd_LFwvwKvJWXpc4uhYqm4i61vs37isLNmzf5DqjmBvTeiR6w@mail.gmail.com>
Date: Mon, 29 Sep 2014 12:13:44 -0300
X-Google-Sender-Auth: Oqe_0WlMP_45iGqLkR0dZeJ26jA
Message-ID: <CAP9ODKrgGOgv-skJ5xJaX_opERn9o=bU3thVOsrR_ZA_AL3kRA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][daisy] pull request libmikmod: Adjust SRC_URI (2014-09-26 09:22:37 -0400)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Sep 2014 15:13:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2014 at 11:25 AM, Cliff Brake <cbrake@bec-systems.com> wrot=
e:
> The following changes since commit 662cf409c1175450699d498085f3c894e0fe81=
d0:
>
>   php: Fix native build due mistakenly linking against host's iconv
> (2014-09-01 11:45:23 +0200)
>
> are available in the git repository at:
>
>   https://github.com/cbrake/meta-openembedded.git 2014-09-26_merge-to-dai=
sy
>
> for you to fetch changes up to 8e6f6e49c99a12a0382e48451f37adac0181362f:
>
>   libmikmod: Adjust SRC_URI (2014-09-26 09:22:37 -0400)
>
> ----------------------------------------------------------------
> Oliver St=C3=A4bler (1):
>       libmikmod: Adjust SRC_URI

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

