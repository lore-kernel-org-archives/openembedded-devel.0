Return-Path: <prvs=1344511f89=holzmayr@rsi-elektrotechnik.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.160])
	by mail.openembedded.org (Postfix) with ESMTP id 6A83A781E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1497967685;
	l=1083; s=domk; d=rsi-elektrotechnik.de;
	h=Content-Transfer-Encoding:Content-Language:Content-Type:In-Reply-To:
	MIME-Version:Date:From:References:To:Subject;
	bh=KFzNu68q3XyenhZULP+2XSzTQ1YEfRQibgC08amMG+E=;
	b=jW8STJ3bwOUjAT0OcwBOWkWAMzhrVa6brlD8Xbdoyr2PXzo15HFhxcEMbKypxpiOGx
	NREOSlpo5BbXQcv+cuLWkfKwopm/ToMJGRfdAsyCpIBAVBf29jKmZsV73qWCjAv1+Nub
	LYsRPLMMGuY+mJocVDLQwk2B/TKy7GYdfBTUc=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPWwJyH/ODuV4n+N24+CqMVTDvF1MhuFNtPdyidq2ZZdXriOrPDOpyD7Cm/6iRJmZvQ==
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de
	([2001:0:9d38:78cf:2ca8:3fcf:af6c:cbea])
	by smtp.strato.de (RZmta 40.9 AUTH) with ESMTPSA id j012d5t5KE83vG9
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate);
	Tue, 20 Jun 2017 16:08:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1497967671; x=1498572471;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=Subject:To:
	References:From:Message-ID:Date:User-Agent:MIME-Version:
	In-Reply-To:Content-Type:Content-Language:
	Content-Transfer-Encoding; bh=KFzNu68q3XyenhZULP+2XSzTQ1YEfRQibg
	C08amMG+E=; b=u7rGyjo42twpaHWZgJPlERrRb49KGERueJsWMYHLaURbk1Z+33
	n1c2zmQqpiLcczUox6NhYiuIk4GyEZb0iVz2ly43vuw2v4KERduUXWa0WNNJd/EG
	5m49aOFNyRsb5DCpQjvI0irAjNK+3Ji6zJ82Z+V/PjJhmzZMdK2vEXVl8=
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v17.0.2) with ESMTPSA id
	md50000536404.msg; Tue, 20 Jun 2017 16:07:50 +0200
X-Spam-Processed: mail.rsi-elektrotechnik.de, Tue, 20 Jun 2017 16:07:50 +0200
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 185.69.203.14
X-MDArrival-Date: Tue, 20 Jun 2017 16:07:50 +0200
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=1344511f89=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
To: "Tamtamis, Panagiotis" <panagiotis.tamtamis@unify.com>,
	???'?? ?????? <maryan.pricak@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <CAGyDALnwxEvX3AFfbB5thjQy91+9BNmzgyR5RPQetLseZD7hJw@mail.gmail.com>
	<e23728ee-eece-c3d1-da75-defd91e094ad@rsi-elektrotechnik.de>
	<0D74DA672F03634EA90EB18A61E36D27263B0EC1@MCHP04MSX.global-ad.net>
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
Message-ID: <baf1ac86-c92d-1907-0cb5-25e94b495818@rsi-elektrotechnik.de>
Date: Tue, 20 Jun 2017 16:07:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <0D74DA672F03634EA90EB18A61E36D27263B0EC1@MCHP04MSX.global-ad.net>
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
X-List-Received-Date: Tue, 20 Jun 2017 14:08:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

Hi Tamis,

On 20.06.2017 10:07, Tamtamis, Panagiotis wrote:
> I use the following in my image recipe:
> 
> FORCE_RO_REMOVE = "1"
> ROOTFS_RO_UNNEEDED += " kernel-${LINUX_VERSION} kernel-image-${LINUX_VERSION} kernel-image-uimage-${LINUX_VERSION}"

While that might work, it actually builds all the stuff and then only 
excludes it from the rootfs generation. But if we actually never ever 
want a kernel, why spend the compile time? :)

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


