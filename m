Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PEi9Y-0001gL-0F
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 13:45:52 +0100
Received: by qwd6 with SMTP id 6so3219238qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=XQfqtl9cw3kwCWMOH0pLxsrBJM0uSNY/Ti3tV18cNRw=;
	b=Dq9fL1HJl76zvxHx28Krv6wrCA0wEwjtSN1ic4vOb2XpX5+UvZXRXLw8i8xwESnsJF
	iQuysSbeZaM7QlcaD+mPweDEmSyvPzgJBz1iCZb9V7NwXvC++N++bgVr9TTEMi58p0Un
	xamJeOY7HJ9urOQxTXHDKhxg6AuUU9XK6c65o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=sSAFWhKkwKNRBkzgj/ZLxo4/DiAEicDRJOYOjNAD3Wc6Ve4goBrysdswLuXGiWqkRJ
	VmaqrYGuXjbvldUqNFZHt4+mgPEqGosLiIYMEEdfaTKSooNLEW7e0naxK4ID/zw/0R+8
	Gc6DFoVTpgtm20s18YCW98JpqLDuj+c4yt1gw=
Received: by 10.229.75.3 with SMTP id w3mr2981535qcj.296.1289047497096; Sat,
	06 Nov 2010 05:44:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Sat, 6 Nov 2010 05:44:36 -0700 (PDT)
In-Reply-To: <4CD53CC1.10208@eukrea.com>
References: <1288387543-1277-1-git-send-email-eric@eukrea.com>
	<1288387543-1277-2-git-send-email-eric@eukrea.com>
	<1288387543-1277-3-git-send-email-eric@eukrea.com>
	<1288387543-1277-4-git-send-email-eric@eukrea.com>
	<1288387543-1277-5-git-send-email-eric@eukrea.com>
	<1288387543-1277-6-git-send-email-eric@eukrea.com>
	<1288387543-1277-7-git-send-email-eric@eukrea.com>
	<AANLkTik=_ONqFN=OnALnzoUK6kmdFNfoybCBqQ728JwM@mail.gmail.com>
	<4CD53CC1.10208@eukrea.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Sat, 6 Nov 2010 13:44:36 +0100
Message-ID: <AANLkTi=T25mm3TNo32VU4=+ijMX98_dM=AAD78UfHdc4@mail.gmail.com>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 7/7] qwt: add qwt 5.2.1
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
X-List-Received-Date: Sat, 06 Nov 2010 12:45:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Nope, no patch
using it for SHR so with qt-X11


2010/11/6 Eric B=E9nard <eric@eukrea.com>

> Hi,
>
> Le 06/11/2010 12:26, Sylvain Par=E9 a =E9crit :
>
>> Thanks for the update.
>> But am I the only having issue building it?
>>
>> http://tinderbox.openembedded.org/public/logs/task/9693587.txt
>>
>>  are you using the patch which was pushed ?
> If yes, it's tested using qt-embedded 4.7 on armv5 & armv6 with angstrom
> 2010-x distro.
>
> Eric
>

