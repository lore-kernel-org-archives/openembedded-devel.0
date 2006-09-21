Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GQOjc-0004qJ-JW
	for openembedded-devel@openembedded.org; Thu, 21 Sep 2006 15:37:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8LDWdIM006678
	for <openembedded-devel@openembedded.org>;
	Thu, 21 Sep 2006 14:32:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06608-02 for <openembedded-devel@openembedded.org>;
	Thu, 21 Sep 2006 14:32:37 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8LDWZLx006662
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 21 Sep 2006 14:32:35 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <74d0deb30609210139i2f045429kba82f6dde280269b@mail.gmail.com>
References: <E1GQ93n-0000Z3-Re@linuxtogo.org>
	<74d0deb30609210139i2f045429kba82f6dde280269b@mail.gmail.com>
Date: Thu, 21 Sep 2006 14:32:36 +0100
Message-Id: <1158845556.5567.56.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev linux-openzaurus-2.6.18: Apply	recent 2.6.17 patches including overlay support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2006 13:37:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2006-09-21 at 10:39 +0200, pHilipp Zabel wrote:
> On 9/20/06, rpurdie commit <openembedded-commits@lists.openembedded.org> wrote:
> > linux-openzaurus-2.6.18: Apply recent 2.6.17 patches including overlay support
> 
> Is this already working? Could it be used to drive overlay2 in YUV
> mode from userspace?

Whilst I've not tried a YUV image, it should work, yes. overlay1
certainly works with RGB data. I was thinking of removing the 18-25bpp
support (leaving 16bpp) and trying to get it merged for 2.6.19...

Cheers,

Richard





