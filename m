Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Py7Bd-0000M4-Sj
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 19:35:41 +0100
Received: by bwz10 with SMTP id 10so2756413bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 10:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Hgyjkrsdee1Y8hyUF+0fQgSlF2/cwE72RgiKPbDGNKc=;
	b=eZpNJ4C1KJNvjopAL39yObSTj2LS7WoyuUBNa51MJrRV/l/Zo3IcsZ1Q5ZXG93e29D
	daGPHCl3owHffdVRPLvych2vvPFqkMikhQ/WZN6EyvrcorqDytxB9322KSJBU5PHzO0C
	vLf9QhmszIlT36gjev8Pv2kMQKkCEPqnQUu8M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=CSkYToigXBbwpyCrzJltsL/Y0XJQWenLr02bm5gtmqzkp8ga1D2jrC+48IdMYxpOFX
	x+YO61PaqgYwdyhzdo8bUZAxGPNQ+Yg3pXc5bN0f1b+R+JM/8jGlwLynV/+cUi6wF2Vq
	g8/6fJNv94Zs7mp3rEgd8sxzAK6pfdhvQ9d2g=
MIME-Version: 1.0
Received: by 10.204.141.14 with SMTP id k14mr3859357bku.37.1299866702419; Fri,
	11 Mar 2011 10:05:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.174.65 with HTTP; Fri, 11 Mar 2011 10:05:02 -0800 (PST)
In-Reply-To: <20110311081950.GG7353@excalibur.local>
References: <20110311081950.GG7353@excalibur.local>
Date: Fri, 11 Mar 2011 18:05:02 +0000
X-Google-Sender-Auth: ieRZY_5Hyi_-R7uQ6NGl2kpUWJQ
Message-ID: <AANLkTimOrjU4nPrBej7d3kLxkEbkwSpeGLj2NkcPpWZw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Fri, 11 Mar 2011 18:35:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2011 at 08:19, Stefan Schmidt <stefan@datenfreihafen.org> w=
rote:
> It feels like the current OE bugzilla is not in really good shape. The qu=
estion
> is how we are going to handle this. On the one hand it might be good to r=
emove
> as it holds a lot outdated informations and it seems developers are not u=
sing it
> at all.

What about using github to host OE and use the issues and pull-requests fea=
ture?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


