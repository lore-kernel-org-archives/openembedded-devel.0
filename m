Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PDOye-00081a-ML
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 23:05:13 +0100
Received: by wya21 with SMTP id 21so7352964wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 15:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LDrRkwfenpXw6+NJPa2XXH2JcK5ESwExC4ZXubsDpOU=;
	b=cFOi6e/Mp5vN9k4hB4MQg9eqT5ScSkPNdUp7gkvea4q3fDnDGTspOakkYNIIKZYDmK
	gAoPC4xQ6a6HDh25nii64gP864vkIm5eQXnRKnELeiZFLfzNY16mnETkRY3yz3extP2X
	dor8BaC4La5cNEWbOfDA9CLnfGXZEDW4KML68=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ap/D7ptSg6y0x/yJf/bpWbirjqzRJkRfvcqaZQnerXfWTS3ZOLPdh218Ql5x/bjD1D
	xsUNFeZDNHdHE2+KR+e9l7QmVOq0i7sM6C21Gzoy1XnYaiByiK5g1k0R350mULHcN4nU
	apYrl3k0zlBL1wZZ0EqMIo2OEdA/kWiHy6REM=
MIME-Version: 1.0
Received: by 10.227.145.193 with SMTP id e1mr3568924wbv.226.1288735462471;
	Tue, 02 Nov 2010 15:04:22 -0700 (PDT)
Received: by 10.227.163.79 with HTTP; Tue, 2 Nov 2010 15:04:22 -0700 (PDT)
In-Reply-To: <AANLkTim_7pgDjqHkt7fPoWKnzrwmu03n0mNaK5faYcsr@mail.gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
	<AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
	<20101101183327.GD15069@ibawizard.net>
	<AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
	<AANLkTinZsM-WRnKhPnAtkKbY-t2TPBP_cvyu8c2bG3zC@mail.gmail.com>
	<AANLkTim_7pgDjqHkt7fPoWKnzrwmu03n0mNaK5faYcsr@mail.gmail.com>
Date: Tue, 2 Nov 2010 23:04:22 +0100
Message-ID: <AANLkTikBh===7NWuK3r_ceK+JqHb7e8inZbTcFUrdWXm@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
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
X-List-Received-Date: Tue, 02 Nov 2010 22:05:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Nov 2, 2010 at 7:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Nov 2, 2010 at 5:00 AM, Cliff Brake <cliff.brake@gmail.com> wrote=
:
>> Do all testers currently have google accounts? =A0I'm all for making it
>> less painful.
>
> sounds good. Dont they allow anonymous edit iow one who does not have
> gmail/google account can still edit google docs ?
>
No, unfortunately not.

You can use your private email adres when you "login" and create a
password, but effectively that will then become your Google account
login.


Regards,
--=20
Leon


