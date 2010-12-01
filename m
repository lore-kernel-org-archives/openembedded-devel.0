Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNiTi-0003cB-Jz
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 09:55:55 +0100
Received: by wwi17 with SMTP id 17so1243653wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 00:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4SYLKj+zpN0hnXBVFw7P4Eye/inbv+3gdCrn06Uj23U=;
	b=F1LDqEw/JQC4Kvg2tFOjaAW3IBiTcsMkocVUsxjVz33MAT0YoIZnuHylqAdKuE/FkO
	crSyZOiYP5XpK3/i+1A6FfY2QZjMw59zcJKkcwDSWHQD7nrbhnOQ2r0Ad/UZAdXIlKmU
	2dwxLuDZ2nQjigUHxQ2fyLnixfREM9gUn3CQQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dqPlSsAbOyPyDEKND8cnGMJYzONiwovaV6MvPIRGlzE68pB4uh06Aws8lkZ4PBVcjv
	ZYxlYGc23xrZXGb1Z0nOZDEvQaSdcm766Gap6v6P1yOCBuoh35+WFWRVMQcXJajG5jmx
	ENvO/u3klLvPmBorHVyKWWQw6fwiWRXXjz9/A=
MIME-Version: 1.0
Received: by 10.227.134.149 with SMTP id j21mr8979172wbt.194.1291193673020;
	Wed, 01 Dec 2010 00:54:33 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Wed, 1 Dec 2010 00:54:32 -0800 (PST)
In-Reply-To: <AANLkTikCDnhP-SoKC+fx-N-Tst3O7-AE_dkNz_g=gCo5@mail.gmail.com>
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
	<20101130082314.GL10755@ibawizard.net>
	<AANLkTikmbUDpw04xqRYE+pwY1_mBUNNOdfL+LdnahUrC@mail.gmail.com>
	<20101201084510.GM10755@ibawizard.net>
	<AANLkTikCDnhP-SoKC+fx-N-Tst3O7-AE_dkNz_g=gCo5@mail.gmail.com>
Date: Wed, 1 Dec 2010 19:24:32 +1030
Message-ID: <AANLkTik_w9__s=gBQ=YeseiEbVptaPgrjdbwv8c=jbLn@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010 - last moment hot fixes
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
X-List-Received-Date: Wed, 01 Dec 2010 08:55:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 1 December 2010 19:21, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/12/1 Petr =C5=A0tetiar <ynezz@true.cz>:
>> Khem Raj <raj.khem@gmail.com> [2010-11-30 10:12:08]:
>>
>>> Do we already have some resolutions to these issues ? are there
>>> existing patches
>>
>> Yes, there are few patches around, but Koen didn't told us yet[1] what
>> fix/workaround he would preffer for Angstrom 2008/2010.
>>
>> 1. http://www.mail-archive.com/openembedded-devel@lists.openembedded.org=
/msg13494.html
>>
>> -- ynezz
>
> OE is more than angstrom, and no single distro should =C2=A0block progres=
s
> for the rest, even not if it is the primary distro.
> My suggestion would be to upgrade uclibc + binutils. to fix things.
> Angstrom then can (and probably already does) pin the current versions.
>
> My 2 cents, Frans.
>

The alternative is remove uclibc bits from the angstrom distro conf,
removing all doubt about its current status as unsupported/nonworking.


