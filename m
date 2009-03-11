Received: from [217.146.130.193] (helo=chlothar.bnv-bamberg.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LhKKD-0004Du-5o
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 10:02:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bnv-bamberg.de; s=mail2008; h=Subject:From:To:Cc:In-Reply-To:
	References:Content-Type:Date:Message-Id:Mime-Version:
	Content-Transfer-Encoding; bh=qYSymEUYRIduVzQgDB8srDQLjkgiTlVim2
	M2vzDVcr4=; b=dQpEcqsAUxhEWt+Kf4drDk31wZED9nkkoi4IKfos8DTrHkc+zX
	2rfzBe/8lrcp/+hZojjny2Qi8zcrByw+lY2KXB3M0xkTVxo64CpzVq5ETrGS0yDx
	9Tyzghd9MpYKbMDyL/+PX+gR2cTU5LZwv4gZjU+9BFgMGem8ymqZwn1h4=
Received: from localhost ([127.0.0.1] helo=chlothar.bnv-bamberg.de)
	by chlothar.bnv-bamberg.de with esmtp 
	id 1LhKK7-0007sX-QC ; Wed, 11 Mar 2009 10:01:59 +0100
Received: from w0d87.w.pppool.de ([89.58.13.135] helo=[192.168.2.5])
	by chlothar.bnv-bamberg.de with esmtpa (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>)
	id 1LhKK7-0007q0-FO; Wed, 11 Mar 2009 10:01:59 +0100
From: harald <ba0547@bnv-bamberg.de>
To: angstrom-distro-devel@linuxtogo.org
In-Reply-To: <1236760668.4955.5.camel@utx.utx.cz>
References: <49B5E3B9.70409@gmail.com>
	<1236709292.28500.27.camel@hammer.suse.cz> <49B73DC1.5000902@gmail.com>
	<74d0deb30903110117m2de9bd4cvd7bc88501e9c719b@mail.gmail.com>
	<1236760668.4955.5.camel@utx.utx.cz>
Date: Wed, 11 Mar 2009 10:01:52 +0100
Message-Id: <1236762113.4471.8.camel@debian.dorg.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@lists.openembedded.org
Subject: Angstrom online image builder.
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
X-List-Received-Date: Wed, 11 Mar 2009 09:02:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

after all my tries to build angstroem on my machine fails because my
loox do not start with my images but with my kernel runs with rootfs
images which can be downloaded at several locations (opie, gpe.., almost
all workes). I tired to use angstrom online image builder from here:
http://amethyst.openembedded.net/~koen/narcissus/

This worked only once for me. Now you can choose yor machine and some
addidional information. No image will be built. Is it a limitation that
every machine can only send on request or is something wrong with the
online image builder?  

Regards, Harald.



