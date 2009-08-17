Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Md5cZ-0004Ls-53
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 19:03:47 +0200
Received: by rv-out-0708.google.com with SMTP id l33so711653rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 09:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/jESLD6Cd0tnvlrr24LtcwJKQMai/q0gfwnhS7YTNYY=;
	b=o/oRzsF496Y3DlCpgm06+xfZZzTbuAEPRIGTArYd9rBry6Vov2OsMLlTwYmBfbJEo+
	jlKdmLeimemamLmQaiW0z2ItWBqZqQlISQrJsR2yRdwmileGV79jkN9qgn82FnpZATfo
	kbmRtFiDlmgGAIWxyLQOnptNZy92VjrlBZ+Qo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XdTPpHC0jLO8WUqK4Nlz4UPMny7OpmL6TKRSfF4HrqZhN3tXT1JRKDHCi1PtBzwjlq
	+ex9bHPtYiXx4I3DDQrGjIYhXc5IoPxm0eKHnOeXCLbw0yx815C1lQawrV1gLSme5Ksg
	GJCaBkTbXf3KOmIEq7nkk+mcEOZppg5oTrcbI=
Received: by 10.141.1.7 with SMTP id d7mr2407335rvi.221.1250527608027;
	Mon, 17 Aug 2009 09:46:48 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id k37sm26499972rvb.7.2009.08.17.09.46.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Aug 2009 09:46:46 -0700 (PDT)
Date: Mon, 17 Aug 2009 09:46:38 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090817164638.GA31404@gmail.com>
References: <540809eb0908100042n74d61d41s6336bea61546dfb@mail.gmail.com>
	<4A881398.4070709@nospam.arcornews.de> <h6951i$4gi$1@ger.gmane.org>
	<h698ht$k4v$1@ger.gmane.org> <4A882DA9.10208@xora.org.uk>
	<20090817072128.efc69473.manuel.pietschmann@googlemail.com>
	<h6bj3p$86h$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <h6bj3p$86h$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] python-sip: update 4.7.9 -> 4.8.2
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
X-List-Received-Date: Mon, 17 Aug 2009 17:03:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/08/09 14:40), Rolf Leggewie wrote:
> Manuel Pietschmann wrote:
> > i think moving python-pyqt from 4.4.3 to 4.5.4 will get it working again.
> 
> I agree that is likely.  Please test.

It will take some time I guess I gave it a try and it does not work out
of the box. Until then I have lowered priority of python-sip_4.8.2.bb

> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


