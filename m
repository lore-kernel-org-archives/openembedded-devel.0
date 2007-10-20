Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ij98r-0005tN-CE
	for openembedded-devel@openembedded.org; Sat, 20 Oct 2007 09:53:07 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9K7k4Ux003691; Sat, 20 Oct 2007 09:46:05 +0200
Message-ID: <4719B244.6000701@student.utwente.nl>
Date: Sat, 20 Oct 2007 09:46:12 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <a7f8874a0709212103h126eeea7y751fa5fd4256fb20@mail.gmail.com>	<200709261801.13349.u.luckas@road.de>	<a7f8874a0710091402w7af1b580pe1fa89f95f5626de@mail.gmail.com>	<200710192235.46408.luckas@musoft.de>
	<a7f8874a0710191346y6690674cs9997d57ce3162056@mail.gmail.com>
In-Reply-To: <a7f8874a0710191346y6690674cs9997d57ce3162056@mail.gmail.com>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l9K7k4Ux003691
Cc: Uli Luckas <luckas@musoft.de>
Subject: Re: RFC: Kexec Cmdline Support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Oct 2007 07:53:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Henry von Tresckow schreef:
> On 10/19/07, Uli Luckas <luckas@musoft.de> wrote:
>> Am Tuesday, 9. October 2007 schrieb Hans Henry von Tresckow:
>>> Ok, I have tested your patch and it works very well. I think the only
>> real
>>> stumbling block left is figuring out a way to get the base address fo=
r
>> the
>>> ATAG list without hard-coding it. I think if we can somehow access th=
e
>>> machine_desc structure in the kernel from user space, this would be
>> easy.
>>> Unfortunately I am not very good at kernel hacking yet, so if you or
>>> someone else on the list has an idea, please let me know.
>> Hi Henry,
>> sorry for letting you wait so long. I am out of office until 10/29. Af=
ter
>> that
>> I can provide a kernel patch to export the ATAG list's base address an=
d
>> also
>> the old ATAG list. For now the patch will be against 2.6.21 though, as=
 I
>> don't have a running, more recent kernel available.
>>
>> Regards
>> Uli
>>
>> --
>> Fr=C3=BCher oder sp=C3=A4ter emulieren wir euch
>> - Linux.de
>>
>=20
> Thanks. That sounds excellent :) 2.6.21 should be OK, since it looks li=
ke
> that will be the version for Angstrom 2007 iirc.

Only for a few devices, e.g. the zaurus device are probably going to use
.23, the powerpc devices .22, etc

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHGbJEMkyGM64RGpERAqwwAJ422t+AkOZC6HgFTbaF5QgVWC2ysACgsnlX
YADqHrw6e3HtqYGI+bS1u34=3D
=3DOjIL
-----END PGP SIGNATURE-----


