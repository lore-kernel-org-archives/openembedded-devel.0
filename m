Return-Path: <prvs=1343fb49fe=holzmayr@rsi-elektrotechnik.de>
X-Greylist: delayed 369 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 Jun 2017 19:08:08 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.163])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6F678229
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1497899288;
	l=1107; s=domk; d=rsi-elektrotechnik.de;
	h=Content-Transfer-Encoding:Content-Language:Content-Type:In-Reply-To:
	MIME-Version:Date:From:References:To:Subject;
	bh=MDUMX01SoHSs6m50Ur1y8Elal+Q2hqAbH42tN2J1ki4=;
	b=j7HRLoIEWRT46c6zCt+NfUXGpdL15Qs9UXd3nqmCJRnlYtgqzMctJF+m2DkH3cEcaU
	Kem07Bdgo3gUGNfiE4c6lz+oN3vYqoHBZ2td9PBIjsTDMZnD5GsWitdYP/j/MZSOfRar
	KwDV44ShVV2LdubGUWIL94y78w+g/Pq61EKnM=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPWwJyH/ODuV4n+N24+CqMVTDvF1MhuFNtPdyidq2ZZdXriOrPDOpyD7Cm/6iRJmZvQ==
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de
	([2001:0:9d38:78cf:2ca8:3fcf:af6c:cbea])
	by smtp.strato.de (RZmta 40.9 AUTH) with ESMTPSA id j0154dt5JJ1vnU6
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate);
	Mon, 19 Jun 2017 21:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1497898903; x=1498503703;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=Subject:To:
	References:From:Message-ID:Date:User-Agent:MIME-Version:
	In-Reply-To:Content-Type:Content-Language:
	Content-Transfer-Encoding; bh=MDUMX01SoHSs6m50Ur1y8Elal+Q2hqAbH4
	2tN2J1ki4=; b=C/gu4tGm7O0wSt9AxCjCi3zcJUCrvgHcZtCPyR1OPMxDL7ohvo
	WUwJ1Vt9B9o+HuQOeLE7FSmgretLAcg+1K1VGZAlkYOiAj937mdlSlDeJIkyUjya
	7xm5eb0676wBlMylaiJRC/+UjA5NrIRIfZQx/n2XA2ixxPzpNyLuu+m20=
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v17.0.2) with ESMTPSA id
	md50000536107.msg; Mon, 19 Jun 2017 21:01:42 +0200
X-Spam-Processed: mail.rsi-elektrotechnik.de, Mon, 19 Jun 2017 21:01:42 +0200
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 178.26.151.155
X-MDArrival-Date: Mon, 19 Jun 2017 21:01:42 +0200
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=1343fb49fe=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
To: =?UTF-8?B?0JzQsNGAJ9GP0L0g0J/RgNGW0YbQsNC6?= <maryan.pricak@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <CAGyDALnwxEvX3AFfbB5thjQy91+9BNmzgyR5RPQetLseZD7hJw@mail.gmail.com>
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
Message-ID: <e23728ee-eece-c3d1-da75-defd91e094ad@rsi-elektrotechnik.de>
Date: Mon, 19 Jun 2017 21:01:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAGyDALnwxEvX3AFfbB5thjQy91+9BNmzgyR5RPQetLseZD7hJw@mail.gmail.com>
Subject: (No subject)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Jun 2017 19:08:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

Hi Maryan,

On 19.06.2017 16:57, Мар'ян Пріцак wrote:
> I'm trying to build an image that's supposed to be used as rootfs for
> container.
> Is there a way to build image rootfs without Linux kernel and modules?

The simplest solution is to just refer to linux-dummy:
https://layers.openembedded.org/layerindex/recipe/41/

If you're not in a hurry, I expect to push a layer doing exactly what 
you describe to github, as I'm working on that too.

Greetz
-- 
Josef Holzmayr
Software Developer Embedded Systems

Tel: +49 8444 9204-48
Fax: +49 8444 9204-50

R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
www.rsi-elektrotechnik.de
———————————————
Amtsgericht Ingolstadt – GmbH: HRB 191328 – KG: HRA 170393
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
Ust-IdNr: DE 128592548

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548


