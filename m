Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PCzSL-0001Bo-HS
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 19:50:10 +0100
Received: by yxe42 with SMTP id 42so3580420yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 11:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HxhJutehIGfEGT/mMHJIBnzomU2iEpfxdSwZTr9izMk=;
	b=uhArQqv74RZeTwYBNJVnz+m2vd2CbLtxRz3dDekpSLp4XDrVc/7dPJigix15Ic8lxM
	Pd4POSCU4diKaq11U+pt0DuXSezpUZN1JWpBMdgWp2F3HdTcH6SGXDqxk3m+M4sl4Hp+
	iwm1BC34cSFqB5X9UU4Q3D9O+268eismJ23w4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=F/0OZ1XEhiZERjNIHHFaE6z1ic66nn3f8TsZnDhBP9ehXOmLATvezng0/X6Juyytjj
	lUECeQFdqqqMMKfdVAmiGBB4KtArN9d728pjV7bPQe43l5tqBZqgbeAyyikyPrU+h/nv
	TN7W/tSyyzAVY49DNd8iRzL2NEe0/1v5R/rZ8=
MIME-Version: 1.0
Received: by 10.42.178.200 with SMTP id bn8mr5036644icb.81.1288637360023; Mon,
	01 Nov 2010 11:49:20 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 11:49:19 -0700 (PDT)
In-Reply-To: <20101101183327.GD15069@ibawizard.net>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
	<AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
	<20101101183327.GD15069@ibawizard.net>
Date: Mon, 1 Nov 2010 19:49:19 +0100
Message-ID: <AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Mon, 01 Nov 2010 18:50:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/11/1 Petr =C5=A0tetiar <ynezz@true.cz>:
> Khem Raj <raj.khem@gmail.com> [2010-11-01 10:32:53]:
>
>> We should add another column identifying the build is from clean tmp
>> or an incremental one
>
> No more columns please. I think, that I should receive a PhD just because=
 I
> can update that table :-) It's pure rocket science...
>
> -- ynezz
>

Put the table in a spreadsheet?
I think google docs can be used to share access to a common sheet (but
not fully sure).

Disadvantage of an incremental build is that you need to keep all the
tmp dirs around, which, at least for me, is probably prohibitive (I'll
verify this later)

Frans


