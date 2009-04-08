Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LrU62-0004Iy-TN
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 11:29:58 +0200
Received: by bwz19 with SMTP id 19so26470bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QHKloZ4CjrPwuzT7NwW/4HX1kNRTwfUbT94jSVnt8pM=;
	b=lCgVlpwDvv6dgZcchUs9eHwcKl0cH2RNTh51qDuceXyK/ODxvvmp9gz5wX6aJgw8ST
	k6NQ5t9RuAa9enQKlSfLBz3uM3AqMH5Qavu+t3fjCSMPVAx90wuNcPCuxCFz0NiYdlnr
	tStathmK0gNJhGPu2NjJu88flbWsT9VXKTrdk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qqQckvw7xp9ZAFmX1QWKtWKiB2s4z1uRUcj7oSvjlj0HXjIyqrxUur4ZD78RoF1H0+
	ER9GTQn7exuBSxLQTCbZxWrxEmazNFPTA8mHS+cEryUA3a6qpJD/05KkfjJBbEzGW4gO
	8ABywfMHNuCWDDr5xGVRoUBWjGcLYZq8lJs6g=
MIME-Version: 1.0
Received: by 10.223.113.3 with SMTP id y3mr142232fap.71.1239182782940; Wed, 08 
	Apr 2009 02:26:22 -0700 (PDT)
In-Reply-To: <49DC653A.5090804@bolloretelecom.eu>
References: <49DA2F2C.60008@bolloretelecom.eu>
	<19c1b8a90904061449s1cc1c4e6pb1c04f2c71cc6beb@mail.gmail.com>
	<1239096233.16991.525.camel@mill.internal.reciva.com>
	<d1b08f940904070841y3d7ca01erae4a50625faff158@mail.gmail.com>
	<49DC653A.5090804@bolloretelecom.eu>
Date: Wed, 8 Apr 2009 11:26:22 +0200
Message-ID: <d1b08f940904080226s7fd5a2bnb0af62c9184659fc@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.171
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make "LDFLAGS ignored" QA errors fatal
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
X-List-Received-Date: Wed, 08 Apr 2009 09:30:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

thx for having done the job!

Andrea


