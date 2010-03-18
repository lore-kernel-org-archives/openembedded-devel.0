Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NsKMW-0000RM-5A
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 19:22:29 +0100
Received: by fxm20 with SMTP id 20so522737fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 11:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=v+WqR1aVwkAPYsfzmxtXFKJOSIKh5toeGo6mA0ycUxQ=;
	b=BX/GKlTPvHHR6zV8FEfBSzbTwwvstngYP1axy728GT1DPFwJcm5un+54mxu8RDj5yj
	PiM/BluFX4KxSKmE61Td8++RCU3BuNQmycw3UiCKIYARESPZzsfF/8hJkln2yKu/Go81
	Wo1gbEgRcA5YD26q9vTIWS2XoJFaukQ8jM2Wo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cMqf3FmniVnEzKljnwFZE7rmqqM+1gLS8kqL3+CTUc6SP3Edcr/L0mAltk+pYUnWWL
	49/AbJmZvNLjPaWO0Ty1H31zLJZARAR/OFlUrRZmplyJPARPI6y6bohLIDy8u7vMhGOD
	5jbJDuh4YY8ODLihveoO4QLUIIcj4qknEJwL0=
Received: by 10.223.81.89 with SMTP id w25mr7436235fak.25.1268936363438;
	Thu, 18 Mar 2010 11:19:23 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm206733fxm.5.2010.03.18.11.19.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 18 Mar 2010 11:19:22 -0700 (PDT)
Date: Thu, 18 Mar 2010 19:19:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100318181909.GO29306@jama>
References: <141020e31003180719n7c4b1bd0ve58e26c7b6b661ee@mail.gmail.com>
	<hntiu8$ggu$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hntiu8$ggu$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gst-plugins-base_0.10.28 fails with thumb Was: [oe-commits] Koen Kooi : gstreamer: updates
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
X-List-Received-Date: Thu, 18 Mar 2010 18:22:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 18, 2010 at 05:04:24PM +0100, Koen Kooi wrote:
> Try using file://ivorbis-thumb.patch;patch=1 from gst-plugins-bad.
> 
> regards,

Yes, that worked, thanks!

Applied

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


