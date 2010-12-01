Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNiVp-0003nn-Jy
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 09:58:07 +0100
Received: by wwi17 with SMTP id 17so1245589wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 00:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=nAIoMRxiTdGgPbti8FSAyVMc4p8clHQOvQhP4jijQME=;
	b=MU4Tinmkojkc45mM0sjeIGADnvvwCKBJ2q+95cmBssSTFrJK0NOWUxO8d9HAlyBmkC
	69xrnQmmy2iX5YjctELrtsZWNwMVNX08/QiylZGiBoIiQvMKJJZUlF/1rLP5AVUnIeHM
	NkBYFkGH934Q0CU1MF0Wz+a1VLOzRNvPcVz6s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dZvEymLZbL+jHvaVKObGXoeiBj2cZekA73ERmaGu1OVOx4nU6K8oZ37BVSvtmW7xhV
	3ndLRRrC2iyhtPMP6BT63u0V9YBkHyaYPgdMHSjMn+4wO3Zo5p+5Dgiox9WCdMlwcu52
	ZQ0pBLOcKF3snaNblFFavtRDZ5iewOdhDp7C8=
MIME-Version: 1.0
Received: by 10.227.134.149 with SMTP id j21mr8981360wbt.194.1291193804038;
	Wed, 01 Dec 2010 00:56:44 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Wed, 1 Dec 2010 00:56:44 -0800 (PST)
In-Reply-To: <1291190482-6925-1-git-send-email-Martin.Jansa@gmail.com>
References: <1291190482-6925-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 1 Dec 2010 19:26:44 +1030
Message-ID: <AANLkTi=s1G3BmrUoe2Bzz8DpHxzt1RB2BPyUMLPWDDYb@mail.gmail.com>
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
Subject: Re: [PATCH] opkg: move OPKG_SRCREV to opkg.inc directly
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
X-List-Received-Date: Wed, 01 Dec 2010 08:58:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 1 December 2010 18:31, Martin Jansa <martin.jansa@gmail.com> wrote:
> * now OPKG_SRCREV was used only in this one .inc, so move it there
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Graham Gower <graham.gower@gmail.com>


