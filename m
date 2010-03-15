Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nr9iF-0001H5-ER
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 13:48:03 +0100
Received: by bwz20 with SMTP id 20so2848474bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 05:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=7nCAZV02QlNKhHFQW7gzT4jbdfrQ0p3+7ZZsEmfGYm0=;
	b=Zrt8I6AVb2R0oiYQy3DRrCF1wxAnPjmWXNOBwKcCSjfnRgO0DMtVsZVSSklyzN5OVR
	ZdQDj4zhemgRMGeTMrgVDphm33SMCrqRTVMGjrX10n+Efy8IyjQ37krndK+3QEPOB3SO
	9C1E8CzoanSihZkSVFDfdCM5zEDYuVFfYrRUw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MOL/umUfeFk4Ys5GT+sudj0n/H6/evL5Xnn3B9BjBD/AaHblBmxlsqPHrkk8nu40Wl
	xcCj3+chsjHRYAsO1Ws46IoQvgjwKgj9s8/2V0kqPH4czeCPejfviKlYCaZ10Q4JazS4
	yDlXhp3c56GesEJaSoKiRP0np1iRXySw3fr1s=
MIME-Version: 1.0
Received: by 10.204.10.151 with SMTP id p23mr4637392bkp.80.1268657100056; Mon, 
	15 Mar 2010 05:45:00 -0700 (PDT)
In-Reply-To: <201003150605.03085.holger+oe@freyther.de>
References: <201003150605.03085.holger+oe@freyther.de>
Date: Mon, 15 Mar 2010 13:44:59 +0100
Message-ID: <fca63bcf1003150544k4a9df366m8119add6de5fc1d0@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for help to address known security issues
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
X-List-Received-Date: Mon, 15 Mar 2010 12:48:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/15 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> unrar 3.4.3: http://www.FreeBSD.org/ports/portaudit/94234e00-be8a-11db-
> b2ec-000c6ec775d9.html
>
> unrar-native: same thing..

Done. Fixed by bumping (... rewriting) to 3.9.9.

Regards,
Michael


