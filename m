Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PD0Tc-0000Ky-Mn
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 20:55:33 +0100
Received: by wya21 with SMTP id 21so5970948wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=f9PiuA5Y7y8+669amW/7pYKm0B3qwFLGF/WgNrr9jH0=;
	b=JZJ+BIRx5ODfEKjZV4TlGWXt43T0TsRs7z2HpPwZQNvz8X6/kzTx/J/DBRrmPXgIBy
	mEXCzLvpYPsl+zWkGXJFn6NMvLtVo2cGE1l2WHJHc1FO6j+cM12wI1sG+eCQRgMYxG5k
	4Qz5q5kGV8QBA22w5pF99eJ5b1W8SstlehQNE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=uOahviGNw+ns+rR+Ox7c5pDBOAU+Trz1MfG/sbPtXy8h1IlCU9/kn6XHDPHodbYeSY
	bqQ31HE8fQg5bxHpn16NmZTI/NgKa+G9UI386J5B/2+Va3LPSrbtrDZ3OLFMvBBtHWfJ
	R86Qjy8xAsXenUgWlWcpzjR9aLRJR3oGU183w=
MIME-Version: 1.0
Received: by 10.216.144.228 with SMTP id n78mr131342wej.51.1288641283602; Mon,
	01 Nov 2010 12:54:43 -0700 (PDT)
Sender: zach.frey@gmail.com
Received: by 10.216.37.5 with HTTP; Mon, 1 Nov 2010 12:54:43 -0700 (PDT)
In-Reply-To: <20101101194703.GA12018@gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
	<AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
	<20101101194703.GA12018@gmail.com>
Date: Mon, 1 Nov 2010 15:54:43 -0400
X-Google-Sender-Auth: vsEAdfjCWdTvzwHDaSLGIDnMJiA
Message-ID: <AANLkTi=TyPX5L5oUHYehsuvqr9FGSCaD_nj1Z8+P=8F_@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Trouble compiling system-tools-backends
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
X-List-Received-Date: Mon, 01 Nov 2010 19:55:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 1, 2010 at 3:47 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> Well it built fine for me on minimal distro with libtool 2.4 and
> machine=efikamx
> you could try using angstrom-2010 and see if that helps as it also uses
> libtool 2.4
>

OK, thanks -- I'll report if angstrom-2010 works for me or not.


> other guess ...there could be build host difference as I am using ubuntu
> 10.10
>

Is Ubuntu 8.04 "supported", or is it old enough that I ought to expect
problems?


Thanks,
Zach

