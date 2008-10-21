Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KsEsB-0003VB-Ph
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2008 12:53:59 +0200
Received: by rv-out-0708.google.com with SMTP id f25so2775202rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2008 03:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=QXwfKYDoJRdUbScPVhr94oZTHUoUZQZ0w2A40Jm86KM=;
	b=jbKNaxKCBn+I0KaoV4uhRCacaiVSfiqkQlPCcIJLnwYFEcT7pK4ViT3HPCIisoGC47
	4Kfu8QVQyoLTTFCQM6t6cNtujNQVddsBLXfmV5T8yZfkXs/tP5iPGHGUInqaUwEr9+xi
	qRKwcUZQxGuFxuxIYpmpTX0Gcj481sVQKAhi4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=W8qMkLbchYmDzKDje3RaLDHEHiHA6L624aTM2b8yjzQEiesHmjzkpkvUJ5bXbmA8th
	2DaVHo2a2/85Q/JMANNyEx0TROUqK+k7PQtIabZKGg3+Gfij60WCd/G1y0ExV46KoKjB
	gIMaHhpaYw5F3T6a2/4JiGdaYohnuMC5TV3Zc=
Received: by 10.141.171.6 with SMTP id y6mr5583034rvo.85.1224586417570;
	Tue, 21 Oct 2008 03:53:37 -0700 (PDT)
Received: by 10.141.129.13 with HTTP; Tue, 21 Oct 2008 03:53:37 -0700 (PDT)
Message-ID: <f96d234e0810210353x38eced88u4d2407bd33afd4d3@mail.gmail.com>
Date: Tue, 21 Oct 2008 06:53:37 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF47D@hiob.intern.dresearch.de>
MIME-Version: 1.0
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF479@hiob.intern.dresearch.de>
	<f96d234e0810200859p70d3e127qa41e01266e2efd47@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF47B@hiob.intern.dresearch.de>
	<gdk0so$7qm$1@ger.gmane.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF47D@hiob.intern.dresearch.de>
Subject: Re: support another hardware
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
X-List-Received-Date: Tue, 21 Oct 2008 10:54:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Oct 21, 2008 at 5:06 AM, Sledz, Steffen <sledz@dresearch.de> wrote:
>> None of the above. As Cliff said in his earlier mail:
>>
>> "For the kernel, the preferred approach seems to be to use
>> a generic linux-2.6.xx.bb recipe, and add your machine to the
>> version you support."
>> ...
>
> Thanx. That's a lot of help.
>
> I would start an "Adding Machine" page with this info in the wiki. OK?

Please do.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


