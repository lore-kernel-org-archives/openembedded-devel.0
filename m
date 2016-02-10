Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 213D373198
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:56:18 +0000 (UTC)
Received: from poczta.nazwa.pl (unknown [10.252.0.17])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 30A5842B0E5;
	Wed, 10 Feb 2016 18:56:17 +0100 (CET)
Date: Wed, 10 Feb 2016 18:56:17 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Reply-To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Marko Lindqvist <cazfi74@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Message-ID: <1420916562.321932.1455126977163.JavaMail.open-xchange@ox7.netart.com.pl>
In-Reply-To: <CAF6bG8e8YM=A_UF=OzPQCYMz8tXJ98veW-G+hvCL_+XqQi6JZw@mail.gmail.com>
References: <1455115465-28799-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<CAF6bG8e8YM=A_UF=OzPQCYMz8tXJ98veW-G+hvCL_+XqQi6JZw@mail.gmail.com>
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.6.2-Rev33
X-Originating-Client: com.openexchange.ox.gui.dhtml
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] lua: bump lua.pc version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Feb 2016 17:56:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


> Dnia 10 luty 2016 o 18:47 Marko Lindqvist <cazfi74@gmail.com> napisa=C5=
=82(a):
>
>
> On 10 February 2016 at 16:44, Maciej Borzecki
> <maciej.borzecki@open-rnd.pl> wrote:
> > Lua was updated to 5.3.2, however lua.pc still has 5.2.2 listed as
> > Version.
>
> Sorry, I have not been following this. Do we still have lua-5.2
> available for packages that are not switched to lua-5.3?
>
> (My experience, based on single case, was that updating sw to use
> lua-5.3 instead of lua-5.2 was much simpler than lua-5.1 -> lua-5.2,
> but I still assume there to be fair number of packages that have had
> no lua-5.3 compatible releases yet. In fact, I'm maintaining one.)
>
=20
AFAIK there's only a single lua recipe in OE and it's currently lua
5.3.2. Layer index also lists lua-5.1 in meta-openwrt, but that would
be all.

--
Maciej Borz=C4=99cki
Senior Software Engineer at Open-RnD Sp. z o.o.
www.open-rnd.pl, Facebook, Twitter

