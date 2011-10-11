Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDiaR-00034i-Mr
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 22:06:03 +0200
Received: by wwf10 with SMTP id 10so5373104wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 13:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lSA578ROYlIwuu2NC9ggLtfgFsAxb5TJX5/ngRofsQw=;
	b=kNlvEo54Y/GjEthEFX6X69D+gvC/mmT/pojRpLuVngUAty/8JNM3/I0+XJATpeUyEY
	MgqKe39YmSi9RSFQh2Ck7m83V2HsdP3cger7qPQXgshFM95hYKCYkFjRM/E5B/dHSfbH
	bgGOUVO3YrjDW5YlfBcsp2OfTmFgoSOknSA54=
MIME-Version: 1.0
Received: by 10.216.158.140 with SMTP id q12mr8290179wek.8.1318363221854; Tue,
	11 Oct 2011 13:00:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.138 with HTTP; Tue, 11 Oct 2011 13:00:21 -0700 (PDT)
In-Reply-To: <j726u5$8ta$1@dough.gmane.org>
References: <cover.1318362324.git.otavio@ossystems.com.br>
	<2d40bd35a2ecf2ac49a66a09656c7319aa811c98.1318362324.git.otavio@ossystems.com.br>
	<j726u5$8ta$1@dough.gmane.org>
Date: Tue, 11 Oct 2011 17:00:21 -0300
X-Google-Sender-Auth: bRRaQXdmXXTishQbl6RZhDNo1wA
Message-ID: <CAP9ODKoNWxn0yt8yc0sy0yyCKiH4LCSYUsibTA_4kX24cV7j=w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/1] xserver-nodm-init: exit 1 only if systemd is installed
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
X-List-Received-Date: Tue, 11 Oct 2011 20:06:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 16:54, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> While you're at it, please change it to ${base_bindir}

I can do it but don't you want to do that and amend it? If you prefer
I can send a new patch but dunno if it is worth it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


