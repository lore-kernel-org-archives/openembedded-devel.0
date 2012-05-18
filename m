Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SVIPa-0002EG-GE
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 10:19:46 +0200
Received: by lbol5 with SMTP id l5so1981172lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 01:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=7u9Sg60842O5xfaz5zEobYkyZrRPopluVy30scLsxac=;
	b=VJOTQPBQXh5ppAb6sxF3vnTmFJ5ss1RUa1wZ81gbAAx2cKRgURPpDz3ZlwMw2oWKmE
	qoidGQTrDjiiw9h2+zGv/QWtMpXuo8i6x+DLZBBq3jJLjj2FBRKETdUmXdnf99mYPD1H
	Sut1aNVAMyvm6Hc6aYCibVi0U6VHQpjAwHOHX49LHE4cd64EXJmxPHrwXES+pWdTtQHF
	JpRfj/Lm4vBzXF+Ghtoj2sIksuiYWdNRSKLApBTWZz1OuzRmlhb2fc2jhhiPyDuiUH9C
	tYrQ2OVranfxf4cOqIFUPplFWBubusrwaneGLBTH0xbOpbX1D5iOVVbjcK/4mTlN9NdP
	q2Qw==
MIME-Version: 1.0
Received: by 10.112.86.105 with SMTP id o9mr4443850lbz.32.1337328582917; Fri,
	18 May 2012 01:09:42 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 01:09:42 -0700 (PDT)
Date: Fri, 18 May 2012 10:09:42 +0200
Message-ID: <CADZ6=avSzGXb3h1BunDQqqojA7tv-gO2VRicC6nt9KzAuNOcUg@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnVobDbKE+GGwIGyu+xzgybL0xqakUARXV1//+OB+Bi8mLfSRS4UEENZ7OikQwq0YrfT1l8
Subject: Introducing the HidaV layer
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
X-List-Received-Date: Fri, 18 May 2012 08:19:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello *.*,

There's a new layer in town. HidaV will provide a common platform
layer, development support, and firmware for our yet-to-come ti8148
based systems. The layer poses a symbiosis of a "board support" and a
"distribution" layer. HidaV integrates meta-ti, meta-openembedded,
meta-angstrom, and openembedded-core to a well-tailored distribution.
Although HidaV therefore heavily focuses on our own devices/boards we
hope to provide useful bug fixes and recipes for other projects/layers
as well.

The code is here: <https://github.com/DFE/HidaV>
Some initial documentation: <https://github.com/DFE/HidaV/wiki>

Finally, I would like to add HidaV to the openembedded layer index[1].
Is there some formality involved in this, or do I just create a wiki
account and then edit it in?

Regards,
Thilo

[1] http://www.openembedded.org/wiki/LayerIndex

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


