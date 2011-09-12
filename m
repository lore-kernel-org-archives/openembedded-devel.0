Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3831-0005f6-1f
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 17:03:47 +0200
Received: by bke11 with SMTP id 11so2381030bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2011 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WMkeooV728jHYO0Hen8bDaHYe3Bz/dr9/yqTb2HQKY0=;
	b=wKrgX5yMsKo0wwMJssPBqAC75d6A70W/zYWZBnHe6IsSjA86GcO4GS6sO/Rh3iJ+X0
	a9urkzjBxIpofaPiMak9RcdWuirhx3nuscdmbNW6JqMImsnq0K0cx90n8r3U6IrTuzfo
	3ejzcHXFT2Y2dMDGozjrSW4OUT5Ys8xsahi5U=
MIME-Version: 1.0
Received: by 10.204.129.214 with SMTP id p22mr1428597bks.93.1315839517587;
	Mon, 12 Sep 2011 07:58:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Mon, 12 Sep 2011 07:58:37 -0700 (PDT)
In-Reply-To: <4E6E1D06.7000307@juszkiewicz.com.pl>
References: <4E6E1D06.7000307@juszkiewicz.com.pl>
Date: Mon, 12 Sep 2011 11:58:37 -0300
X-Google-Sender-Auth: MTopR43NU16ZQYtIgptiO5qy4dE
Message-ID: <CAP9ODKo8E9QeQYrUh9d=cERiHwL=X9h=WXoJmKPoHtCsPn25mQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: PC Engines Alix.1c to take
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
X-List-Received-Date: Mon, 12 Sep 2011 15:03:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2011 at 11:53, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
...
> What I would like to see is merging my patch set which dropped alix
> machine in favour of geodelx one - never finished testing of it.
...

This ought to work out of box AFAIK since GeodeLX is more or less sane
in this regard. I've been working with many different Geode boards and
have no issues with geodelx machine with them.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


