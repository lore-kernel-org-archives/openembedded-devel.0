Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M7dKS-0001NT-CK
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 May 2009 00:35:04 +0200
Received: by fxm20 with SMTP id 20so1975912fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 15:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wsJn37u31QqBi2satXFT3KX+QiXOOFC1D7t4kAGgowI=;
	b=oGitH3a8LyOt39Qlmc/oQJQVK2VupDHPYyd0FIlykK1n2DZ3iBOZ4too4ja+4rnBQb
	h6DeRXdWYp/qcGV1bVziisfIjBqYjDLmPaR8MqxfCNSHsGL8YJlpb3KFHrQayIhRUog9
	ixlrknfKGCfLAEA4+hfYH+ojdMYAC6wzYpEIQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ivV5RVF4WVN0+IYnakw3pL5P5wvGaNxDIkewJuklVANbgQ6uFAaxYNz/H8GkwhZJmv
	JbfG8lEiYFr7qkXbQbubcdyG76TtNpv6x0j7ODJU1crLuvGTOy3HYVaKwykl6NrGdo1K
	kaLLK6yoXaz+cKJ83x4zvauVv6TY6ap6bPVwE=
MIME-Version: 1.0
Received: by 10.223.110.4 with SMTP id l4mr2607750fap.47.1243031239284; Fri, 
	22 May 2009 15:27:19 -0700 (PDT)
In-Reply-To: <20090522213142.GF23842@smtp.west.cox.net>
References: <20090522213142.GF23842@smtp.west.cox.net>
Date: Sat, 23 May 2009 00:27:19 +0200
Message-ID: <d1b08f940905221527v147487e3n128cf91e6a7a6e1d@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Fri, 22 May 2009 22:35:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I think the side-effects of the patch are blessing too much...I'd
propose a rethink of the patch as opt-in.

Andrea


