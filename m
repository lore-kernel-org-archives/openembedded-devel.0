Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Kf19o-0006zp-4F
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Sep 2008 01:37:32 +0200
Received: by py-out-1112.google.com with SMTP id y77so1341562pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Sep 2008 16:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=4zs/rXTWs+wWNNyKUffH0xyk2xzC5SPCQoHjshf/w4I=;
	b=U+7EoQZhE6m9UfhHK/JfEjnAAdOaDeVZ2CQoUms4QufY6TMDu4N5IAdrXv6VKkXZC/
	PN+ol0/NufB4PkNTratsk6U28xRN4Ae63apLwTNNKPiYVEp33EPM+e6Fr+CzxbyNVLaB
	Gzkp6G0BzTpuT0L9rMNfDrFMv8m7VWhDsVkII=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=v/JbVXxTyRQO7nV2KGfMEhAcOx9X75gsN+NBQ8uuOpi5UxK1q/PNdoN0Lbi4PFtY9s
	REOBfEMjVDSR+XB/6Z8jU1oEpbWVbd5CPnBzc1phv40u70eWCXMXYWS4RJqjZLORpKSs
	eaiLERXRGk9ZOR6HMQYj6IbpRFm4BlbOl1sSM=
Received: by 10.142.237.19 with SMTP id k19mr2440462wfh.86.1221435276137;
	Sun, 14 Sep 2008 16:34:36 -0700 (PDT)
Received: from localhost ( [71.146.23.38])
	by mx.google.com with ESMTPS id 22sm20591282wfd.7.2008.09.14.16.34.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Sep 2008 16:34:35 -0700 (PDT)
Date: Sun, 14 Sep 2008 16:34:33 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080914233433.GB8709@gmail.com>
References: <20080914133128.GA21462@gmail.com>
	<200809141728.54433.mickey@vanille-media.de>
MIME-Version: 1.0
In-Reply-To: <200809141728.54433.mickey@vanille-media.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [patch] compile opkg-sdk-native with gcc 4.3
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
X-List-Received-Date: Sun, 14 Sep 2008 23:37:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/09/08 17:28), Michael 'Mickey' Lauer wrote:
> Am Sunday 14 September 2008 15:31:28 schrieb Khem Raj:
> No, please send it upstream (opkg-devel@lists.openmoko.org). We should really 
> try to prevent adding patches where we have good contacts to upstream.

OK sent the patch upstream.

Thx

-Khem


