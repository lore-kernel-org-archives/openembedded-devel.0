Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qiht6-0003Yw-0v
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 09:05:08 +0200
Received: by wyg30 with SMTP id 30so2077844wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 00:01:04 -0700 (PDT)
Received: by 10.216.61.145 with SMTP id w17mr2627191wec.59.1310972464202;
	Mon, 18 Jul 2011 00:01:04 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id eo18sm3190054wbb.29.2011.07.18.00.01.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 00:01:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAD=GYpbJaYh9iViHjocf24z98LKnsH0Mq7cBy_9p_hULf1gYnQ@mail.gmail.com>
Date: Mon, 18 Jul 2011 09:00:56 +0200
Message-Id: <670B4FBB-C6E9-46CD-81DA-FDD94A88A3FB@dominion.thruhere.net>
References: <CAD=GYpbJaYh9iViHjocf24z98LKnsH0Mq7cBy_9p_hULf1gYnQ@mail.gmail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
X-Mailer: Apple Mail (2.1084)
Cc: beagleboard@googlegroups.com, openembedded-devel@lists.openembedded.org,
	"Kridner, Jason" <jdk@ti.com>
Subject: Re: [Angstrom-devel] Bitbake build failure of Angstrom
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
X-List-Received-Date: Mon, 18 Jul 2011 07:05:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 18 jul 2011, om 07:16 heeft Joel A Fernandes het volgende geschreven:

> Hi,
> 
> I am attempting to manually rebuild the BeagleBoard validation image
> using bitbake.
> 
> For this, I used the revision found in /etc/angstrom-version of an
> image I built with Narcissus. The OE revision I used referring to the
> above version file is: a1f31c757d2514e946737d60789c6f9f05ce38eb (Which
> happens to be my fix for GPIO)
> 
> Now, when I run a "bitbake beagleboard-validation-gnome-image -k "

Why are you using -k ?


