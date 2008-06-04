Received: from [64.233.166.183] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1K41Tw-0000uZ-T0
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jun 2008 00:29:26 +0200
Received: by py-out-1112.google.com with SMTP id y77so214975pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2008 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=F+1hGmKV7msMOrFWIpcjo6c1Ch4VeOkwo7kBCwoX7Zg=;
	b=BsGxdX4Vp7gsu8NrNbz1ftZE/ctPZTAzcY+OxwopHACMGDOIcD0i4bpcRxm6Btazfw
	SYiaT0gKQak++eLVHfW0f9SZD4QVMNUZjaD3Hbvi0oWwv531q9h2QYpqmlNekyhGE3nY
	GQwB77db9qz5DSIM1fQ9/X6ird2ck2jQTNzVE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=YYqx30smDsHxY7oCsXbcqOdSrtqUzgp+Wzik0eE9at6yRlq7awIOl4PcGUVe6ocgPE
	HYGdAT/EiXW2YzrJ/+ED7mEsqh00Z+bi3bCM5t7xxE8U6ZzTTVeNA2izxZ6kFYXTTcbl
	10jwOJog9R9cGaW7qF2YA5sYZgq3j4MVXAiUw=
Received: by 10.114.181.1 with SMTP id d1mr804352waf.3.1212618289073;
	Wed, 04 Jun 2008 15:24:49 -0700 (PDT)
Received: by 10.114.77.18 with HTTP; Wed, 4 Jun 2008 15:24:49 -0700 (PDT)
Message-ID: <d1b08f940806041524k42788e2cve997b861bc3fd0d4@mail.gmail.com>
Date: Thu, 5 Jun 2008 00:24:49 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d1b08f940806041503j30d3192fj3607d2071886131b@mail.gmail.com>
MIME-Version: 1.0
References: <d1b08f940806041503j30d3192fj3607d2071886131b@mail.gmail.com>
Subject: Re: [RFC] patches for angstrom 2008.1 - c7x0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 04 Jun 2008 22:29:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Sorry, was meant for c7x0 only:

============================================================
--- conf/distro/include/angstrom-2008-preferred-versions.inc	45c7ad8dae151667ad4090f51315c58cf1e5a31b
+++ conf/distro/include/angstrom-2008-preferred-versions.inc	989f798867f6f1deb79f8cd515470d7f419445fd
@@ -8,5 +8,6 @@ PREFERRED_VERSION_udev 		= "118"
 PREFERRED_VERSION_pixman	= "0.10.0"
 PREFERRED_VERSION_pulseaudio 	= "0.9.9"
 PREFERRED_VERSION_udev 		= "118"
+PREFERRED_VERSION_udev_c7x0 	= "092"
 PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
 PREFERRED_VERSION_dropbear 	= "0.50"


Andrea


