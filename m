Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PVRrg-0000Em-VA
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 17:48:37 +0100
Received: by fxm11 with SMTP id 11so5109974fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 08:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=R+8U3fR1Cy/UVyM4vuLRi0k7QMQEyjk1vXVW9cM/aFw=;
	b=jbfIwQzOEUfHlG1UOWTVH2cDY4DGF5Q20rBTbZWfHAAT1K6TOXX/iyMjogeEuuUyHZ
	KP7l2j/IGHSQrw7iUQTtK4Iy1pW22bM60V8Hc7n5Y+hTEjyOxDiWwqXRVHSl9NJoQYr3
	R0qaoDO6w4HRajeI6eqPao5tNXfYsY3JWJ6p0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=naue9O7yR7uZNSG/LmxOy92t1rekd806get2bCpVPetoH3L9j2KZMnppRJNN1ULHWp
	ujG/JIqm6+q4JmWei+OLPywNQggbvXw+HHP9JZeBHLJzQ+zSWI0HFKdGhQWmuRscTRWW
	Ns79dUQuy9RWDvufAhdrhVCJI1+GP4dnqXG/8=
Received: by 10.223.86.199 with SMTP id t7mr535592fal.29.1293036505273;
	Wed, 22 Dec 2010 08:48:25 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y3sm1752712fai.38.2010.12.22.08.48.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Dec 2010 08:48:23 -0800 (PST)
Date: Wed, 22 Dec 2010 17:48:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101222164821.GA3295@jama>
References: <1292911102-13199-1-git-send-email-raj.khem@gmail.com>
	<4D1201DE.4030905@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4D1201DE.4030905@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gcc-4.5: Apply patches upto 2010.12 release of linaro gcc
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
X-List-Received-Date: Wed, 22 Dec 2010 16:48:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Dec 22, 2010 at 02:49:18PM +0100, Eric Bénard wrote:
> Hi Khem,
> 
> On 21/12/2010 06:58, Khem Raj wrote:
> > This patch brings in more Linaro patches. So far I have built a x11-image
> > for qemuarm and it has shown no issues. I plan to test it more thoroughly
> > in coming days on different arches and different images and also run gcc
> > regression testsuite for them. But while I do this I wanted to bring it to
> > everyone who would be interested to try and test the patch out and report
> > any issues one sees and we could weed them out before installing this patch
> >
> > -Khem
> >
> > Signed-off-by: Khem Raj<raj.khem@gmail.com>
> 
> Acked-by: Eric Bénard <eric@eukrea.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Tested for armv4t (om-gta02), armv5te (spitz), armv7a (nokia900).

Thanks
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


