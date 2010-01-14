Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NVWIQ-0000if-JD
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 21:28:01 +0100
Received: by bwz9 with SMTP id 9so47737bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 12:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=o1nuBfniD12S2/FOfsHqm3iSDK6YpQk+XKZ+skWos4E=;
	b=WEj+FMlTUVxDqPU6H2OIyrN8W5fqzoKRB4sNalCaP6vzUj8lMFy3QekwifD4oMNyL1
	BhpYuaciHcO25g/lIBtMFXBb8B1k8xgq4Vkw1vdWJfiqJAMal+VEpEjV4QoRutXwfKb1
	4yP8xX0S8xZljRVLG5SQtV3B9nqlD9jvnbeIA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=R/zFLOUHY3IilMvlALDVOc6Z/O0rv1rCwUqYcsrSvW3k2GxU24qvQ7wYzW0O3GRDfS
	Jof8HXkurImqEmlTfQNB+1lEB2ICWeF+ak+B04vBnMm27QxD/CmsyvPHi4G1ZoEgirfR
	EpVi4A44yJWYiX7ThgNyBIfRdqx1rAOoxtNX4=
Received: by 10.204.20.207 with SMTP id g15mr715855bkb.213.1263500747394;
	Thu, 14 Jan 2010 12:25:47 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 15sm533930bwz.12.2010.01.14.12.25.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Jan 2010 12:25:46 -0800 (PST)
Date: Thu, 14 Jan 2010 12:25:41 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100114202541.GD3529@gmail.com>
References: <318819580.1263399029.155991028.16785@mcgi25.rambler.ru>
	<4B4EDCED.6000107@gefanuc.com> <4B4EE2DA.5080106@rambler.ru>
	<4B4EE7B5.3040206@gefanuc.com>
MIME-Version: 1.0
In-Reply-To: <4B4EE7B5.3040206@gefanuc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Adding a new Machine question
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
X-List-Received-Date: Thu, 14 Jan 2010 20:28:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/01/10 09:45), Martyn Welch wrote:
> Perepelica Alexander wrote:
> > When I try boot image in qemu I see
> > booting kernel ... and nothing.
> >

Did you set the console properly. i.e. -append "console=ttyS0" on qemu
invocation ?


