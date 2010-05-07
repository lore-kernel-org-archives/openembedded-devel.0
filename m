Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OAVbb-0002FL-Aw
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 00:01:16 +0200
Received: by fxm11 with SMTP id 11so1128603fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 14:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=b1lSk/OtQ5j2B5gAjQk6nGVBiU6AoChoYwOP6TC5aV0=;
	b=Ctc70fXMcmj8wqtFmKT7yYrbjW2uldyeivPamu0Zpg2yFzyHYopJHOfyWv566adPNp
	5ppIo75Bb/JsEVVLEFMH2MKfc7DciZTkc1dM2Wm8ROAtKsB7ztW12DZ+3tro+26jS8jO
	oXmpw30hOeRRCWLtdGBIVE9/8lhubRnM/sDFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TbLxvo5pUO+aOQ0VmOZ/WyZJnU7ZdN7V709ONYfIDX9A847zKlhwhfML9p6XH0qvkd
	sPrfHaXwYbl16cEiMI75a87Pt0w+4v0DWUvBVDceD/X+RO9/5rO7uFQBWSHl5YfTnjoj
	6yvv2FVwz88y/mrfsR0GuvGFAnotcNCy8Y8Wc=
MIME-Version: 1.0
Received: by 10.239.180.19 with SMTP id f19mr68791hbg.91.1273269441634; Fri, 
	07 May 2010 14:57:21 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Fri, 7 May 2010 14:57:21 -0700 (PDT)
In-Reply-To: <p2pd1b08f941005071437o2f204e22jdf93ac2db58d6572@mail.gmail.com>
References: <1273102999.5743.49.camel@rex>
	<1273104883.457.56.camel@trini-m4400>
	<1273175555.457.296.camel@trini-m4400>
	<s2g19c1b8a91005061817i5719e011z51260b5361e708e7@mail.gmail.com>
	<1273248787.457.324.camel@trini-m4400>
	<p2pd1b08f941005071437o2f204e22jdf93ac2db58d6572@mail.gmail.com>
Date: Fri, 7 May 2010 23:57:21 +0200
Message-ID: <g2kd1b08f941005071457ud7949e4cx295b79bf0bfe1fd2@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Fri, 07 May 2010 22:01:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

another anomaly, after rebuild from scratch, appears already on task 17:

NOTE: Running task 17 of 5034 (ID: 1135,
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb,
do_install)
cp: cannot stat
`/oe/build/tmp/work/i686-linux/stagemanager-native-0.0.1-r12/sysroot-destdir//oe/build/tmp/*':
No such file or directory

Andrea


