Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P0QSk-0002m2-LR
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 05:02:41 +0200
Received: by pvg6 with SMTP id 6so1475923pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 20:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=hjaIQCnOCdnsX4PElVSjEQxXXQXT+k/fPSMnz9oKL38=;
	b=iS4Un6/8KIktg92Dzq7/hDEVu1uShxRLGAS66jMQtEXPcI47Y9Ew5pu8iZREBvVDhD
	/hPf9EVXJFdioyIwe/BZz1Mrds/b8sbXOuOckvfptfV0SLc6jS1VIT5xBtmrbIGuNfj4
	rcWiungkAupq7LAuHja36HnBlNDSDE9zhxhSA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cQ1jvh7WBt5jHKdkGNZNbSBnqaPr+lp5TA58wiKZPS4qaR9wIp33nlf4sqLTBdVnFF
	wkJNMEX0U4N/Qv/kHI6GiihU9EE2FDhAqE/HL5Dg+IDb82HVXcGbqvsaKNDPMPxhVVTF
	AWOxp7KRDwwn0aie3FS7exFWNAcaP+Xwc6NeI=
Received: by 10.142.226.1 with SMTP id y1mr7267823wfg.292.1285642946654;
	Mon, 27 Sep 2010 20:02:26 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d10sm8204244wfe.10.2010.09.27.20.02.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 27 Sep 2010 20:02:25 -0700 (PDT)
Date: Mon, 27 Sep 2010 20:02:06 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100928030206.GA7753@gmail.com>
References: <AANLkTikCbjnRFr=E4t0MXcH8+Cap2KNWKyS2vZpp+Xdq@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikCbjnRFr=E4t0MXcH8+Cap2KNWKyS2vZpp+Xdq@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: packages
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
X-List-Received-Date: Tue, 28 Sep 2010 03:02:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/08/10 10:36), C Michael Sundius wrote:
> I'm trying to understand how package feeds work. From the documentation it
> seems
> that you can use a package feed to install prebuilt packages onto a running
> taget.
> but what I'd like to do is to have OE look to see if a pre built package
> exists before it
> goes and builds one. Sort of like a packaged staging, but distributed, so
> anyone could
> pick up the package it needs from a single server, rather than having to
> build it first

hmm interesting. I dont think anything like that exist in OE although it
seems interesting

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


