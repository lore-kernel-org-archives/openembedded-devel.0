Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHfav-0005Kq-1z
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 16:33:52 +0100
Received: by fxm8 with SMTP id 8so3521108fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 07:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=C1UD3kdBiGm28SdiSUNHj52Y1hFyz9TmjP1e4uKWH3k=;
	b=qRpuscCDB3J7fVQ0swzcHZwo+r5S9XWl9m+DgiS2RNT32ytjavQYsRZKZlGsmFiUOZ
	rb5d8GnTvJpJ1SH1yxPjS+Ijpx3D0n/657krH5lxVUHqcCZQH7slo8l6ScCEvpwwWd8e
	seNUAOwsbGnCFyuvmTjTq+M78afn/BjMrZRw8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GimxzI3uvv9YRnSsKUZzzUVZOPOk+myxgtHfa8iBa53fTQsZKOAwecZiI++nD3JNZs
	wD1vfpvw5nrXSZfGacFbXPunaKKV9F/KZ+y/h4OrMc4I46PfH3u9dB3hXLS0QDZZSlZv
	4ff5Y3SXuMK4tFzQmJUaB0a/jnYIlYXYIDW10=
MIME-Version: 1.0
Received: by 10.239.184.159 with SMTP id y31mr693846hbg.192.1260199929601; 
	Mon, 07 Dec 2009 07:32:09 -0800 (PST)
In-Reply-To: <hfim16$osr$4@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<hfim16$osr$4@ger.gmane.org>
Date: Mon, 7 Dec 2009 16:32:08 +0100
Message-ID: <c384c5ea0912070732y702255cch47f5214edc3900e@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] uclibc{, -cross}{, -initial}_nios2-0.9.2{7, 9}.bb: 	nios2 fork.
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
X-List-Received-Date: Mon, 07 Dec 2009 15:33:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Koen,

On Mon, Dec 7, 2009 at 11:39 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> On 06-12-09 23:44, Leon Woestenberg wrote:
>>
>> =A0recipes/uclibc/uclibc-initial_nios2-0.9.27.bb =A0 =A0 =A0| =A0 32 +++=
+

> That's bogus. Change that to 0.9.27-nios2 or put nios2 in PR, but don't
> screw up uclibc versioning.
>
Thanks for the review!

Sorry for letting my initial frustration out. I should have really
questioned this approach, but I cannot the reason anymore why it was
suggested.

/likewise is looking into his IRC logs.

Greetings,
--=20
Leon


