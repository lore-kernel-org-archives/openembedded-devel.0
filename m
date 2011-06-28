Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbZpA-0000l8-1D
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 17:03:36 +0200
Received: by bwf20 with SMTP id 20so308716bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Nw+fFGlsgBdzt5HCpfxG8ktgEpcPfuRqL7Hfd4vskp4=;
	b=NXZa25hR1Eq+wLkpuAAwuMQP7y78QaY+xQ5n5kezO4qa2RweGxXXfTrRroggfqdfW+
	VEBYg6ZFmKpl1LiayhMSZaCDbSgZRvyR+w8UAkC2sPr/0tqUf4zd/2UjlY4+WgJVPsT4
	RFDRLhLr3sx2vdO7dqFyBInRluiqxQJjrqaD0=
MIME-Version: 1.0
Received: by 10.204.14.147 with SMTP id g19mr5856011bka.11.1309273191604; Tue,
	28 Jun 2011 07:59:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.73.70 with HTTP; Tue, 28 Jun 2011 07:59:51 -0700 (PDT)
In-Reply-To: <iucpq7$uav$1@dough.gmane.org>
References: <cover.1309272010.git.otavio@ossystems.com.br>
	<iucpq7$uav$1@dough.gmane.org>
Date: Tue, 28 Jun 2011 11:59:51 -0300
X-Google-Sender-Auth: awTFYgJXMUVloM4rxdwQiyIjKwE
Message-ID: <BANLkTinqwZhxLGtp997dgKh9BmAD02LU-A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/2] Fix parse errors
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
X-List-Received-Date: Tue, 28 Jun 2011 15:03:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2011 at 11:51, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> I'm not going pull those in, since the whole point was to not make them
> machine specific. RP has pushed a workaround for it so parsing
> continues. I'll push a proper fix for systemd later.

What's the difference if the package will be built from same source?

In case you change anything you'll need to rebuild all packages anyway
so I see no gain in having it per package.

Mind to clarify it?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


