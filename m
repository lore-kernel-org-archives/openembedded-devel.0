Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OA0g8-0006CM-RC
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 15:00:08 +0200
Received: by fxm11 with SMTP id 11so4922581fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=cwQVEDelmdcWUex8QjXzZcBk/AT8jYHvrdk02Uz+k2I=;
	b=Ri8HshoS4IbL4oZJKvzndyxsAjK3NBkHr/FndS4+ygfdeFX5lRGJBgxPGBNO2fv0s4
	ZNk7doJFwzxVNK+z1hDyEN+fyaELJECP8hUZVqmuU25YrjW+PwRjiHRnWoK+2B6WFHK2
	HmLVhFtOjoegFqVYUcVCVGjmO17s1/WYAicqw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ieN0FiVpBuqpiIjOqqnA/3FBaPUjbr3BIDOXa6m3GxURiXbxZQUoWrNJiK4Xer9LB5
	xDnLDS02vIHxcs3gjoLriScaB8lZBR+Nm55EDRY3ZW65xOXfElL06pHG6i2UywZ67vcR
	MhcBRF56EjnZMItScYTvJfrTz3djZ/zivWqT4=
Received: by 10.223.10.11 with SMTP id n11mr6655540fan.3.1273150550405;
	Thu, 06 May 2010 05:55:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z15sm1945344fkz.51.2010.05.06.05.55.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 06 May 2010 05:55:44 -0700 (PDT)
Date: Thu, 6 May 2010 14:55:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100506125538.GF3312@jama>
References: <1273102999.5743.49.camel@rex> <hrtn8s$e9m$1@dough.gmane.org>
	<hrtpja$lag$1@dough.gmane.org> <1273147827.5743.104.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1273147827.5743.104.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Thu, 06 May 2010 13:00:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 06, 2010 at 01:10:27PM +0100, Richard Purdie wrote:
> Someone just told me OE was broken as this email hadn't been replied
> too. For reference, Koen and I talked elsewhere, a fix was pushed and
> this issue was resolved. 

No OE is great and we know it :).

> To further update, Khem pushed updates for eglibc and gcc 4.5 (thanks).
> Koen also pushed some legacy staging removals which had some issues but
> these have also all been fixed. There was also an error appearing about
> "bb" being unknown and that is also fixed.

I've rebuilt 2 images today and except those smaller issues as you said 
and which were fixed in minutes everything went OK.

> So in summary, we don't have any known problems due to these changes at
> the moment :).
>
> I wasn't clear in my original email but all issues that people raised
> testing the branch had been addressed before it was pushed. Thanks go to
> the people who did test it.

I haven't test it before push and from that announcement I expected some
problems, but the way it was done was great, well prepared, work of
professionals, thanks to all people involved.

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


