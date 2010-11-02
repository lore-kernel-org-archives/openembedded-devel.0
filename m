Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDLEk-0005qu-Fj
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 19:05:37 +0100
Received: by ywo32 with SMTP id 32so4469512ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 11:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=n2QByQ733rrv8a3da/pl6iA6YgdQApISvWaH0sJ8y3g=;
	b=mzNimXjTAYXAUYquNkHQV0Xg17+TF/Or8D7YcfEJ0uK8yh/Xvo5xnTaSfIlu8M9ehd
	SLkXPj0UZ7R5rEm/W0LdWV3TbQh2vczD1MP/ebTg8Z32DLdPwVPVXMdPdwvp0zT34zU6
	oNwbe/+8s0wC6Z0cB8hVhfDjXnDra/10aShj4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=cLeIrTyd0jFB7wKlP4gIoQcVvyHuh/Z+IKhJ912TN0vkyX+5HnC3Rqqbgkvc2S+6Aj
	ZD+E070m1gvl3YbfeiXxwGNzZWT5wwy0W3bIahmeRf56aiF5J4CB8W+r2yDqGL33FCuA
	WLjh3b5PCHM7dZCBvKniBRLhNwkBTCQE8JMl0=
Received: by 10.91.45.8 with SMTP id x8mr1779534agj.199.1288721082470; Tue, 02
	Nov 2010 11:04:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Tue, 2 Nov 2010 11:04:22 -0700 (PDT)
In-Reply-To: <AANLkTinZsM-WRnKhPnAtkKbY-t2TPBP_cvyu8c2bG3zC@mail.gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
	<AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
	<20101101183327.GD15069@ibawizard.net>
	<AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
	<AANLkTinZsM-WRnKhPnAtkKbY-t2TPBP_cvyu8c2bG3zC@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2010 11:04:22 -0700
Message-ID: <AANLkTim_7pgDjqHkt7fPoWKnzrwmu03n0mNaK5faYcsr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Tue, 02 Nov 2010 18:05:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 2, 2010 at 5:00 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Mon, Nov 1, 2010 at 2:49 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/11/1 Petr =C5=A0tetiar <ynezz@true.cz>:
>>> Khem Raj <raj.khem@gmail.com> [2010-11-01 10:32:53]:
>>>
>>>> We should add another column identifying the build is from clean tmp
>>>> or an incremental one
>>>
>>> No more columns please. I think, that I should receive a PhD just becau=
se I
>>> can update that table :-) It's pure rocket science...
>>>
>>> -- ynezz
>>>
>>
>> Put the table in a spreadsheet?
>> I think google docs can be used to share access to a common sheet (but
>> not fully sure).
>
> Yes, with Google spreadsheets, multiple people can edit a google doc.
> The following might be a good solution:
>
> http://www.mediawikiwidgets.org/Google_Spreadsheet
>
> Do all testers currently have google accounts? =C2=A0I'm all for making i=
t
> less painful.

sounds good. Dont they allow anonymous edit iow one who does not have
gmail/google account can still edit google docs ?

>
> Thanks,
> Cliff
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> http://bec-systems.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


