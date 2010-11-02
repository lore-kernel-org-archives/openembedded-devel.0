Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PDFYL-0007qe-MI
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 13:01:26 +0100
Received: by wwi18 with SMTP id 18so963424wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 05:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=U6G+7Itu/kUvBgacnLP3Q1EoqfmtgHGUinS/1QHR/ns=;
	b=mzbQjIdlWAL34NhnUwMS43wS9HSs/DI0/IAIHQEvZ7pLd5j7GIMSvRh7fTaIpdf1Wm
	0sbQrn8wah7zaaIe06t1V4yoPHYpLve85Gp3UJq6CrIqN5udQRImEVku/2kAcjobKh2E
	rWD/84TZdtHpJN9NMBgM1unP23MXAw1Wm4was=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=B/HUdqM/JGhz4gCUUF/iJPv0tgEL6piCoX7D8YZsmjRhTqzQabvKXuXCyogPhAwmUN
	XbFRYwjaiLApDuwVI9pm5zPtOFihSObsV8Zkq5j72+j7P1l3Ni42MpaCT32zMZqxVjsZ
	0+QLTS4KjZ29GrOL9S1GXN6IInEmBQA8QZWes=
MIME-Version: 1.0
Received: by 10.216.132.131 with SMTP id o3mr3365008wei.19.1288699235639; Tue,
	02 Nov 2010 05:00:35 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Tue, 2 Nov 2010 05:00:34 -0700 (PDT)
In-Reply-To: <AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
	<AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
	<20101101183327.GD15069@ibawizard.net>
	<AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
Date: Tue, 2 Nov 2010 08:00:34 -0400
Message-ID: <AANLkTinZsM-WRnKhPnAtkKbY-t2TPBP_cvyu8c2bG3zC@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Tue, 02 Nov 2010 12:01:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2010 at 2:49 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/11/1 Petr =C5=A0tetiar <ynezz@true.cz>:
>> Khem Raj <raj.khem@gmail.com> [2010-11-01 10:32:53]:
>>
>>> We should add another column identifying the build is from clean tmp
>>> or an incremental one
>>
>> No more columns please. I think, that I should receive a PhD just becaus=
e I
>> can update that table :-) It's pure rocket science...
>>
>> -- ynezz
>>
>
> Put the table in a spreadsheet?
> I think google docs can be used to share access to a common sheet (but
> not fully sure).

Yes, with Google spreadsheets, multiple people can edit a google doc.
The following might be a good solution:

http://www.mediawikiwidgets.org/Google_Spreadsheet

Do all testers currently have google accounts?  I'm all for making it
less painful.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


