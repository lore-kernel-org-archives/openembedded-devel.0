Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OBhHI-0005Ot-68
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 06:41:08 +0200
Received: by fxm11 with SMTP id 11so3103391fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 21:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8oDpoeYaVh4Sie3mGJAAvAuEyaKyP3ZtmyXeI3Z+OWU=;
	b=j+bd/tBM6idiE/6X4LZitQ/RA5FNx+kfAzt9rgeZfX6lir7Vy8r+Jg6rdB0F6JqNYm
	IAB0jP6joKYLliTivbSXUxPv62byt90UHRGJNsfPq674wccRaGuukNZ/7KoRuvjcgFA+
	kuPxkQiUD+e1wQCINEZpYMM67il5OjjAk3uII=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jY9qNzURUiqfcQIQbna++Y+CC3xMAHkialqrohkg5rNcSLPBEqDnkAR5aFdcCwRCd0
	ils2GXllMk2Xo+cjLAcoocuENOQ6VPRzJ9CWQ6Do+hPWCxkevYvlhNBt8h/VLpe/xL2J
	w4RcY2Vf8yl6p6jszPz+iaBVigojJcP8rfSck=
Received: by 10.223.45.83 with SMTP id d19mr5425635faf.65.1273552635349;
	Mon, 10 May 2010 21:37:15 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm24764878fah.4.2010.05.10.21.37.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 May 2010 21:37:14 -0700 (PDT)
Date: Tue, 11 May 2010 06:37:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100511043715.GA3285@jama>
References: <20100510232720.GA13708@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20100510232720.GA13708@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Move gcc 4.4.3 recipes in favour of 4.4.4
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
X-List-Received-Date: Tue, 11 May 2010 04:41:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 10, 2010 at 04:27:20PM -0700, Khem Raj wrote:
> Hi
> 
> I would like to propose to move gcc 4.4.3 recipes to gcc 4.4.4, 
> there are no additional patches that we need and 4.4.4 is superset
> of bugfixes. I want to avoid adding additional recipes if we could.
> 4.4.3 is not so widely used in distributions unlike 4.4.2
> 
> I can also just add 4.4.4 and leave 4.4.3 as it is if someone wants
> to keep using 4.4.3

SHR is using 4.4.3 and I don't mind moving to 4.4.4. Thanks for adding
it.

> Please cast your concerns

Any news about 4.5.0 producing segfaulting binaries on armv[45]t?

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


