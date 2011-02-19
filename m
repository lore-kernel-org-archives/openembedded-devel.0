Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PqgiS-0000Ql-94
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 07:54:52 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de (recycler-gw.in-dsl.de
	[217.197.85.167]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1J6rc0f027295
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sat, 19 Feb 2011 07:53:39 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 62A0F23926;
	Sat, 19 Feb 2011 07:53:38 +0100 (CET)
Message-ID: <4D5F68F2.205@dresearch.de>
Date: Sat, 19 Feb 2011 07:53:38 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>	<1298038322-20481-1-git-send-email-sledz@dresearch.de>
	<1298069307.3776.7.camel@mattotaupa>
In-Reply-To: <1298069307.3776.7.camel@mattotaupa>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p1J6rc0f027295
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH v2] u-boot-2009.03: use AMD fixups for AMIC too
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
X-List-Received-Date: Sat, 19 Feb 2011 06:54:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/18/2011 11:48 PM, Paul Menzel wrote:
> Am Freitag, den 18.02.2011, 15:12 +0100 schrieb Steffen Sledz:
>> From: Mario Schuknecht <m.schuknecht@dresearch.de>
>>
>> * AMIC flashes are AMD clones and need the same fixups.
>=20
> =E2=80=A6 otherwise the uBoot command `saveenv` does not work.
>=20
> Please add in the commit message or in the patch file that this patch
> has been sent upstream [1].
>=20
> [1] http://patchwork.ozlabs.org/patch/82763/

Added.

> If you build for `hipox` is not your fix applied twice? Or am I
> mistaken?

Your mistaken. ;-)

> If I am and with the changes requested in the beginning,
>=20
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

Pushed.

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


