Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1Rs9Br-000892-9L
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 09:35:47 +0100
Received: by iaby12 with SMTP id y12so5755431iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 00:27:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.208.41 with SMTP id mb9mr20962411igc.25.1327998472197; Tue,
	31 Jan 2012 00:27:52 -0800 (PST)
Received: by 10.50.155.134 with HTTP; Tue, 31 Jan 2012 00:27:52 -0800 (PST)
In-Reply-To: <1327916482-16069-1-git-send-email-fromm@dresearch-fe.de>
References: <CADZ6=asn5Tq6adpuysW229BYXDu3ExUVNDWEZtzpjyAUv9PHgQ@mail.gmail.com>
	<1327916482-16069-1-git-send-email-fromm@dresearch-fe.de>
Date: Tue, 31 Jan 2012 09:27:52 +0100
Message-ID: <CADZ6=atX=Uwq-wV5sCfoCDJ3VR1CLQ9Jipx5O6=xLvKR74NMgA@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-java] llvm-config: Work around shebang max length issue
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
X-List-Received-Date: Tue, 31 Jan 2012 08:35:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello oe-devel-list,

> =C2=A0 =C2=A0This patch works around a max shebang length issue
> =C2=A0 =C2=A0in llvm's llvm-config.

Does really no one care about this? Well, we'll be maintaining a
.bbappend for llvm in our HidaV-Layer (https://github.com/DFE/HidaV)
for the time being.

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


