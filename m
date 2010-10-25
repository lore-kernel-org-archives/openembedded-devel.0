Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAWBd-0002mr-8P
	for openembedded-devel@openembedded.org; Tue, 26 Oct 2010 01:10:42 +0200
Received: by yxe42 with SMTP id 42so2614046yxe.6
	for <openembedded-devel@openembedded.org>;
	Mon, 25 Oct 2010 16:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=nH78CHxtG0+I+sXhW7jjozEnEtKPniRR+YJg+dol1cg=;
	b=CkILKt6iu5qlnIZAGi/lNVsUyds5CSJQTsOZVtyXZtfSfS+1rRKmv6/Fs2JIqPSwcM
	E9KJTzUyDD5G0ugWt4fa8XkqRolr2wIA1HeKWgrajSx1R7JnDgRJkSbhmwHoV19pb2iS
	MCQju37klDAvfELieSZGcFzRycLTzjrUvglhw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=aXcZO+41Z6zkZ9Ujz3KJfNBngL2t8zI3Y55E4kpSKoxW7UV4faciGsKFQNoHxlmVuc
	yivfLZexyrnmJLahFmbZjUdY1RxORX5v1ydCXZH5iYbBKDSUoCjeZsHmgZrJwIxbzfYY
	OCnP3A3MBRbSnpiv71ru549CKsmleysPipn/8=
Received: by 10.42.204.3 with SMTP id fk3mr5764242icb.314.1288048198949; Mon,
	25 Oct 2010 16:09:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 16:09:38 -0700 (PDT)
In-Reply-To: <20101022083220.GH15069@ibawizard.net>
References: <1287525847-13430-1-git-send-email-ynezz@true.cz>
	<20101022083220.GH15069@ibawizard.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Oct 2010 16:09:38 -0700
Message-ID: <AANLkTin+D=aEARB7_o11ino7ecQK0E-q_kP_71d56_DX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] busybox: add ts72xx hwclock-default file and modify hwclock.sh
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
X-List-Received-Date: Mon, 25 Oct 2010 23:10:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 22, 2010 at 1:32 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Ping, pong?
>

check with latest master or the patch status at
patchwork.openemebedded.org before you send a ping here :)

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


