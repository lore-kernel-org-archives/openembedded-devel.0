Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RKZhy-0003fQ-Ao
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 19:02:10 +0100
Received: by qyk35 with SMTP id 35so3644122qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 10:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=d4vAgJYUlYzGBk2QJ+8pBw7bkFQKWmJbYNbM2oCo2j0=;
	b=nkTLabWTdf7P/ffQvfCYixYSIrY19dj/ZOaQ0TYeiRC69T/nHr6F009MaIgQnb5Rtd
	Wh1IJT5lqbOvKuf+naw/qdzrCQvk/ww40IQF0TaB52/ysLXukQBh8QULhWQxYp72iTZJ
	jqRxQdC6FCDPyZmBNTnUHlhpI33eCcp/Qv1qY=
MIME-Version: 1.0
Received: by 10.229.64.144 with SMTP id e16mr2468498qci.112.1319997366062;
	Sun, 30 Oct 2011 10:56:06 -0700 (PDT)
Received: by 10.229.94.72 with HTTP; Sun, 30 Oct 2011 10:56:06 -0700 (PDT)
In-Reply-To: <CAFU7RzOnmbu=dxsM7MZ2DXLrOUMYSN4hoVfAL4W=vJ+Y0vH-Kg@mail.gmail.com>
References: <CAFU7RzOnmbu=dxsM7MZ2DXLrOUMYSN4hoVfAL4W=vJ+Y0vH-Kg@mail.gmail.com>
Date: Sun, 30 Oct 2011 10:56:06 -0700
Message-ID: <CA+M6bXk_1OLfQ0p4Ziq+Y-5KWOfwS9JXMsLo62U19VByNyFOYw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: from narcissus to compilation
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
X-List-Received-Date: Sun, 30 Oct 2011 18:02:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2011 at 10:23 AM, Raffaele Recalcati
<lamiaposta71@gmail.com> wrote:
> Can anybody tell me, as =A0I got a succesfull compilation on narcissus
> for dm3730-am3715-evm, which is
> the right branch to reproduce the same compilation in order to port
> the kernel to my board?

Well, if you didn't select 'advanced' under build options, it's
probably from the 2011.03-maintenance branch.  The rest of it depends
on what image you selected and options and so forth.  And since this
is an angstrom image, it's best to ask on their MLs.

--=20
Tom


