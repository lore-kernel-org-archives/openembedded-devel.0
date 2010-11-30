Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNYPk-000857-AJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 23:11:13 +0100
Received: by gwj16 with SMTP id 16so2704712gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 14:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=gWN3REZ42qpLSjmL0miF1nUospUHekhBp/rJfovWK+k=;
	b=jQzK8SDtLw2byEx5KoVWWIrYhMgFxxwqVqJrbxMU6c2Bby19Osby1k9zL75LKJtJIQ
	bfXDmCy8h6/387kBQON47lCiPviY/oKGgxyaUtlP2DrLXP+Gg/4aM42pKjp8Zegg4dxY
	w8KAUFbBuBDJALgN2+fgceIg7SjHRPuV8XllY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=vbLXUzAXHInAbiHRuoBgPkPHyeecpXJK9tdPJ+pCp/rW+piBWVxV0isxAexZCJ69Kc
	Wvn2eIBUX/YtnUcSM5NXbRyMfFDI4LZjLQx7L2oApRf09fs/XhO+S5OVaZfjh7Vdq0Rm
	Xzzy0050BY7hjlb38s3lJXtjgksagXfAH9NbM=
Received: by 10.90.9.22 with SMTP id 22mr398311agi.102.1291154986655; Tue, 30
	Nov 2010 14:09:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 30 Nov 2010 14:09:26 -0800 (PST)
In-Reply-To: <20101126074637.GS3274@jama>
References: <AANLkTinbu9JpEw5fdX8pHcxraf4uTdCf7JKm9v1UekeS@mail.gmail.com>
	<20101126074637.GS3274@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Nov 2010 14:09:26 -0800
Message-ID: <AANLkTi=Jcih2tFQYB2Qr2RJMAouZFFShfYmoWgE8M1rC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bluez-dtl1-workaround not provided?
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
X-List-Received-Date: Tue, 30 Nov 2010 22:11:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2010 at 11:46 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Nov 25, 2010 at 06:24:36PM +0100, Andrea Adami wrote:
>> Hello,
>>
>> build from scratch of console image for c7x0/armv5te leads to:
>
> With new kernel I had this some time ago.. I'm using this patch since
> then, but never send it here as I didn't look why this was needed
> before..
>

patch looks ok to me. Please install into master and release branch

Thx
-Khem

> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


