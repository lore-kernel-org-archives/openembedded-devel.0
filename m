Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUP8i-000455-QH
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 21:09:37 +0200
Received: by iwn34 with SMTP id 34so2370366iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=wk36v87bWTulqeNQFCquk+6Hp48Dfiw+pC9NKdu8W+E=;
	b=VLEZeTMBPuIBPeeFPXxF75u7NgQSNW6KTyfyu5NaBmS5TLYp3fDkFtcQy5nFlEe/jx
	oDE+bwe6iuzcLrPJUsqM2OG8TekHah+8BifArO/ayJUmSQvIrnJ4LA+JETnkOY4wdA7e
	HHChPUn9tXLAg+EQlb0gP68hJSCNDPj1z2id8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=WibYnamFfCv9FnEdBkjQdm8hlphew3PHUT/obMulw0pKjv4v5jmBS9iPSP7FVegNHV
	746eJGjfC7W11/LgLpohuPw5C+DF+dwXtsTS77c2jMb/3pOop05e/lyOIke4wYINaImu
	/yxvi4WghBdXs0f2gGcYf1FFxZzAR5nGN4/Q8=
Received: by 10.231.13.139 with SMTP id c11mr8516595iba.157.1278011093282; 
	Thu, 01 Jul 2010 12:04:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 1 Jul 2010 12:04:33 -0700 (PDT)
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CFE2@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CFE2@KCINPUNHJCMS01.kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Jul 2010 12:04:33 -0700
Message-ID: <AANLkTinTVmPf0NBVfHwS-VjuEPn5J-WfJMG0fAlXZvKs@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Thu, 01 Jul 2010 19:09:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 1, 2010 at 3:19 AM, Soumya R <Soumya.R@kpitcummins.com> wrote:
> Hi All,
>
> =A0 =A0 =A0I need to include root file system in my uImage how can i
> do that in OpenEmbedded.

look into initramfs.
Dont you think adding subject to email makes sense.?

>
> Regards,
> Soumya
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


