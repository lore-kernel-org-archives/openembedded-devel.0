Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SVJNf-00046S-37
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 11:21:51 +0200
Received: by lags15 with SMTP id s15so1989732lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 02:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=yFpCc+Zixn5ARTpyPzvOscNb+lcKaGoKVu0GbL6O8GI=;
	b=AKOzqWvBquVcaO/qB+Ll+qRRAE0omgl+60xkptrSPzlrejq52fNcNP5bI5TxmihQlh
	79Ni11oEL3GuATvfAXxXYsnR+HY3y9v4dZvVMtSe4/gDXxiJ1+v9t9uRQfnYTexcPOKe
	4M++Xb+cAyGXfvtqShoB9e8wlC8iWz0J/Y74vd3ngg73uxyEzqgPn8IOqHKSZVJ/K2vB
	3uOhVSfrWSae/VR4yWsG77twYXksoIhrxBlVek8Xs2Du8GUEdrHlQSYpcbvjPOQgmoKe
	Mn6Pd9Tg2uvi1tCIKH5zMIeGci3di4EnmcnthZqEr13RBqR9NyuPACGIyf2CVDpGZBH0
	PgNA==
MIME-Version: 1.0
Received: by 10.152.128.137 with SMTP id no9mr10269400lab.2.1337332307445;
	Fri, 18 May 2012 02:11:47 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 02:11:47 -0700 (PDT)
In-Reply-To: <6434146.9hc03uN0UM@helios>
References: <CADZ6=avSzGXb3h1BunDQqqojA7tv-gO2VRicC6nt9KzAuNOcUg@mail.gmail.com>
	<6434146.9hc03uN0UM@helios>
Date: Fri, 18 May 2012 11:11:47 +0200
Message-ID: <CADZ6=auJALW_nY==4utWfRaQQpi-j0Cn9Uoev9OLtC8LLUbNVg@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQmsQqsDCxA8VGmM+5cAhD+jTmQyX8ZjWbiRPnV0mWnNbY4dt1oclnySdRuSKcedQae25fji
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Introducing the HidaV layer
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
X-List-Received-Date: Fri, 18 May 2012 09:21:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Paul,

>> Finally, I would like to add HidaV to the openembedded layer index[1].
>> Is there some formality involved in this, or do I just create a wiki
>> account and then edit it in?
>
> No formality in particular. I think you should be able to add it, or I'm =
more
> than happy to add it right now - in fact I was about to, but I'm not enti=
rely
> sure where this fits. Does it belong in "Miscellaneous" or "Board / devic=
e
> support layers"?

I think it fits best into "Board / Device support", since we are
working on a product (i.e. devices) which this layer aims to support.
The layer will also provide a distribution for these devices, not just
a BSP, but the "device" focus is stronger than the "distribution"
focus for now. I'll add it there.

Regards + Thanks,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


