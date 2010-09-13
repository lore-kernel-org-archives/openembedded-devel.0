Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OvCCb-0000PQ-29
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 18:48:22 +0200
Received: by wwe15 with SMTP id 15so297723wwe.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+2ePmF1rk2XVvOfClYl9kJnN540AleURZ/jht4pgEsM=;
	b=ZdHQvV/ZNclo9MEZCvmVDybpXOestthxEXIkdSwWExh5xgV1QTfSUXjpesgySPyCDR
	Hcq91mza8WNgvT64LbxVWW/VgSin815tKs5KA11jRiTZrAvWMVkgLPZQhPIHpNxCDksW
	b9kAHh4t9WbCRARv2wXxOck87ZBnucXKqBpi8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IfB5zw5jt/p7xOe/daayBuBXoszHo06qbcpPjkjWYhDFc6kkoGFa0hW2YrSRPhxrQc
	PV3K+Mv/o9NOZanRx2dmwhda5ElfskyfzRLqG3FbcRvC3mSDh7JpHZY2aSKPgzNcfAc/
	hUiu3BR2hCig4vINbsJcy1fZ6y+PC9Q+6+aY0=
MIME-Version: 1.0
Received: by 10.227.141.132 with SMTP id m4mr3750956wbu.65.1284396454107; Mon,
	13 Sep 2010 09:47:34 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Mon, 13 Sep 2010 09:47:33 -0700 (PDT)
In-Reply-To: <201008312105.45051.roman@khimov.ru>
References: <AANLkTimgF4zbXEyzYK-BQqtgiv2fk1rvgi3W4MdfQ5Wt@mail.gmail.com>
	<201008312105.45051.roman@khimov.ru>
Date: Mon, 13 Sep 2010 12:47:33 -0400
Message-ID: <AANLkTik5uYeMJ5uzFgUEGCjUsB+ApnHptsMOBBzHGMQ+@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: branch namespace clutter
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
X-List-Received-Date: Mon, 13 Sep 2010 16:48:22 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2010 at 1:05 PM, Roman I Khimov <roman@khimov.ru> wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
30 =C1=D7=C7=D5=D3=D4=C1 2010 19:56:52 =C1=D7=D4=CF=D2 Cliff Brake =CE=C1=
=D0=C9=D3=C1=CC:
>> If there are any branches in the OE git repo that are no longer in
>> use, please let me know and I'll delete them. =9AOur branch namespace is
>> getting rather cluttered.
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/refs/heads
>
> Please, drop "rik/perl-5.10", that one was merged long ago.

Thanks, I think I have taken care of all the proposed deletions to date.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


