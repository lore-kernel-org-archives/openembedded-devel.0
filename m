Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SVMqU-0001D3-Hm
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 15:03:50 +0200
Received: by lbol5 with SMTP id l5so2130601lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 05:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=RhEORdNQjter+giKWX8fZoz4B/9stZlkjS8BGWolByk=;
	b=j+q9IvdEF5bNjSzMESYYYmfEQ8PyKiiiQYahBDcTmDMhNxJwI6ZHd0r490j6J1n7st
	zhkAbgCHyP6tAYnBgx/Xj3VV96BWB1jtUAqD245ZV23RyPf29wi3YoLeWCIgjaAxkUMV
	y/h9EFgnPU36LLlk4JXaN2TcXiXgAYgxoCgMqwdT5fHwzd8wzpYN/Twny6u+V0Stp7tK
	OS0tHlg2Bo7eXpswYKrWrjSmVLmPk3mlYO+O05ZVeEhzrIzORPCU6rKvCM5pPL59PNtd
	fTKoU1DrQ/gWGB1wXiOUPO5wRgg/gmTox5pzScq748aj4ZtCtw3chEUnLx5h+XxtE8Yv
	7/Gg==
MIME-Version: 1.0
Received: by 10.152.146.129 with SMTP id tc1mr10869985lab.27.1337345626589;
	Fri, 18 May 2012 05:53:46 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 05:53:46 -0700 (PDT)
In-Reply-To: <jp5gkp$2ip$1@dough.gmane.org>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
Date: Fri, 18 May 2012 14:53:46 +0200
Message-ID: <CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnnphH4XD21LmEjuW76duw7E7/zfURBApbZ7qhMjN8SmrfUD3Cx/2Xqx9eup3Bx1bOpXave
Cc: meta-ti@yoctoproject.org
Subject: Re: ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
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
X-List-Received-Date: Fri, 18 May 2012 13:03:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Koen,

>> sorry for the cross-post (openembedded-devel, meta-ti), I think this
>> affects both projects one way or the other.
>>
>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This means
>> with oe-core + meta-oe you now can choose between gcc-4.6 and gcc-4.7.
>> However, both compilers break the kernel we're using
>> (ti81xx-psp-linux-2.6.37).
>
> What happens when you disable the mailbox? AIUI you shouldn't need that o=
n
> Ne/Ce.

How do I disable the mailbox? What do you mean by Ne/Ce?

Regards,
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


