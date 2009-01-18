Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LOVC3-0002BH-0W
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 11:47:51 +0100
Received: by bwz8 with SMTP id 8so5957006bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2009 02:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NzgJUovYsbzTSwySDrmsaH6qEHuB6cbFr+rqoy0UM9c=;
	b=TaFnyc4bNtkb36OxFJGikIpTvnhtN/AHRIMwKd4lk3OTqZcFrvyahL9ybem87r1h+H
	BZUmRFOv0l7DQfLIHAB4ZhUv2BYIn6xeVm6AkfooiazmeytBGUJLDC8KShcFzuzapN0j
	rkeBtMCHefRHprmqWe6DgNJG0H8qD/u84cvJ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SCjHECdef3lqYfEHe0H9NZ4twIjS+edYg7hIdIgtG2bgjnzfA1+nl5jSdjsgYkmFNO
	vWpSWzfVISQbeHqQoBhk7JiHBEw405ZOxhNnhZyijkx8OWhKF+476dGdnks9q4qzkpEZ
	swghbdAjISAXbcvLgDMxRgKKTQjx2d4qGUUYo=
MIME-Version: 1.0
Received: by 10.181.205.3 with SMTP id h3mr1619895bkq.91.1232275256113; Sun, 
	18 Jan 2009 02:40:56 -0800 (PST)
In-Reply-To: <gkuqgo$ncn$2@ger.gmane.org>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>
	<45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>
	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
	<4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>
	<ea6b4f404328c7722af631e1fcf6050a184eef42.1232244759.git.andrea.adami@gmail.com>
	<48e10fbb365d98dff4b8086d562b339fe62e29a6.1232244759.git.andrea.adami@gmail.com>
	<c1ce4054664d07c9f2a79ac7bcdf26637470aeec.1232244759.git.andrea.adami@gmail.com>
	<be10caf1d9175ef81833424a9c6b334fd4857272.1232244759.git.andrea.adami@gmail.com>
	<gkuqgo$ncn$2@ger.gmane.org>
Date: Sun, 18 Jan 2009 11:40:56 +0100
Message-ID: <d1b08f940901180240q714ae33agb361b515a44103b5@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 12/14] zaurus-2.6.inc: modules fixes
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
X-List-Received-Date: Sun, 18 Jan 2009 10:47:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> NACK, not every kernel has those built-in for those machines.

...but the kernel who as it compiled breaks badly trying to load the
modules...and won't boot.

Regards

Andrea


