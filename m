Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1Rrr6z-0005Ep-Up
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 14:17:34 +0100
Received: by iaby12 with SMTP id y12so4465995iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 05:09:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.168.8 with SMTP id u8mr1528394icy.42.1327928980689; Mon, 30
	Jan 2012 05:09:40 -0800 (PST)
Received: by 10.50.155.134 with HTTP; Mon, 30 Jan 2012 05:09:40 -0800 (PST)
In-Reply-To: <CADZ6=asn5Tq6adpuysW229BYXDu3ExUVNDWEZtzpjyAUv9PHgQ@mail.gmail.com>
References: <CADZ6=asn5Tq6adpuysW229BYXDu3ExUVNDWEZtzpjyAUv9PHgQ@mail.gmail.com>
Date: Mon, 30 Jan 2012 14:09:40 +0100
Message-ID: <CADZ6=avk8ekCLnXv=wbYwhcYzHpyN9mR2mctUNW4hxFfGJZ5Ug@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] llvm-config: Work around shebang max length issue
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
X-List-Received-Date: Mon, 30 Jan 2012 13:17:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello *.*,

> This patch works around a max shebang length issue
> in llvm's llvm-config.
>

Sorry guys, I garbled the patch in the first submission. I already
changed the first submission's patch state to "not applicable" in
patchwork and resent it. Just want to make sure no one tries to apply
my first submission to this issue. Patchwork already has the sane
diff.

Some feedback on the patch would be great.

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


