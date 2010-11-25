Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PLZD1-0001Cm-92
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 11:37:47 +0100
Received: by bwz10 with SMTP id 10so724423bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 02:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=3iXbLIZGogoYoG/EE2GcPwjRgVS2t3pcGOFcsptIvi8=;
	b=CrhHHs2cVVkNdUnTEZdp2ACC+vs2QxhJkBLl+6Ba1hX6+m4qbGqJ5V+69/ZRDrmYAP
	bWM/GGX2711+OL2KSlgaDR87n96pMZp9wJ83g3rM4JJgEi9YVd3Aunq8eqtYNXf8Ldls
	RL3InVwiwuU+FEPp57DCLAHr3U6VWcAZ6hQmc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=ruqwYIK2v3KT6bpHqnhGekAvuFSqw6Nv9NMmcfCX+VojdJi7kIIA2BaNIiWQg+BKUo
	EYjmGlHJ2lZTaC+DBvvdfZETKmTWOSTVxof6F5xtlLZ2J2YCMAueiFlKw9qTclKKV8Jk
	or19De2ksVGOSRu/LroSkN9c8ZYB+t8Zzy4Rg=
Received: by 10.204.152.218 with SMTP id h26mr480495bkw.196.1290681388806;
	Thu, 25 Nov 2010 02:36:28 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a24sm451468fak.3.2010.11.25.02.36.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Nov 2010 02:36:28 -0800 (PST)
Date: Thu, 25 Nov 2010 11:36:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101125103616.GN3274@jama>
References: <1290676461-13283-1-git-send-email-eric@eukrea.com>
	<1290676461-13283-2-git-send-email-eric@eukrea.com>
	<1290676461-13283-3-git-send-email-eric@eukrea.com>
	<1290676461-13283-4-git-send-email-eric@eukrea.com>
	<1290676461-13283-5-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1290676461-13283-5-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/5] busybox: remove 1.17.3
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
X-List-Received-Date: Thu, 25 Nov 2010 10:37:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 25, 2010 at 10:14:21AM +0100, Eric Bénard wrote:
> as it's no more default for SHR

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


