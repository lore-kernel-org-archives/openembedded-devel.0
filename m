Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nikunjbadjatya@gmail.com>) id 1OME3L-0008JJ-F6
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 07:42:16 +0200
Received: by vws11 with SMTP id 11so4533416vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 22:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=kdnZ9+huWP+WtwIiLbLqQMvu+b+dyhQf6wtLEeQ7W3E=;
	b=LvzsNGaU0E6AhuffMQPjkkpQiGDMq2nDGZgswKDyCKvCWuQSGOWbPvYqal7UQT+XuN
	dpo/IopHq83RtqrVrh87mPWuSInUk2Rw5j0x47GazCGpnrmXCmiuc3otY/k5cRTQk3FU
	OJ1N0cvFe2yCw/N6i7O+4JHQqqD3gp9q4a1vQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=vkWGjjDD6D2fv5wr8Tc1cg9BJ93n3W4er5ZvmUGJ1/vOboww1zJV9uRPhD3oJWWB3X
	iRWQ8GoRg15+1aJeaJMUVEZRu6uEU46CCLLFkcO5lUg3lz7Wx4BOr/CVoVZGJEVQhbwJ
	8kkIniqxWxSLVVMzAGWPJpp5jBDYyLEJhaL4g=
Received: by 10.224.14.18 with SMTP id e18mr104977qaa.99.1276061873108; Tue, 
	08 Jun 2010 22:37:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.191.12 with HTTP; Tue, 8 Jun 2010 22:37:33 -0700 (PDT)
In-Reply-To: <AANLkTimag0Slc1QpfQA1yuj8Xj2fi_e0diMdWwBHb9qi@mail.gmail.com>
References: <AANLkTimag0Slc1QpfQA1yuj8Xj2fi_e0diMdWwBHb9qi@mail.gmail.com>
From: nikunj badjatya <nikunjbadjatya@gmail.com>
Date: Wed, 9 Jun 2010 11:07:33 +0530
Message-ID: <AANLkTinx7IpoSHQJgRlflmrdV2n4kLp4sbSrNtQ_6Gc_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: nikunjbadjatya@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: ANGSTROM kernel Image and Rootfs
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
X-List-Received-Date: Wed, 09 Jun 2010 05:42:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I have completed generating helloworld package with OMAP5912OSK and ANGSTROM
distro.
I want the angstrom kernel image and rootfs using openembedded/bitbake and
not premade or through online tool ( narcissus ) . Is that possible ??
The rootfs folder has not been created with the building of helloworld.
I am currently using CentOS5.4.

Kindly help.
Thanks,

Nikunj
Bangalore, India

