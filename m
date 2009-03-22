Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LlS3M-0003IZ-2f
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 19:05:44 +0100
Received: by fxm20 with SMTP id 20so1401418fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2009 11:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1KCd7W11ZHtq8zcdQR06D+tbQNNW4syic22kon7/qtc=;
	b=mRqwOINU1thQvNPwvyBtV/DBfMsCBe5fEd5PgLGITU2Opsztg3cPQNmBc/o1lYlnX8
	afsAyweTW3O1MCu0vN24YE+NMhJv6td8xLo7YGvAzbJegxNOwaZB1UmQhU2bJwZ/o17D
	EDuFnHorXZs3Ko+dBF0XhpysHTiV/qEn4ohKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rQI/0bvXOJEnM+sawWvf86AQ/SUuibg2yw5UBKSX5wHuFUqY3yALJGZhflDG3kTI4s
	sHQoGyQG8AVsdzRTYJlIYlEzPpsCFb7SUO+R8NqQvCcD8OCDGsxKEsYsfmxGj26RSWPr
	0JdRPnZ9S0SSGCPvrU5PUOLQrQx/AKJbt7XWY=
MIME-Version: 1.0
Received: by 10.223.113.9 with SMTP id y9mr5268823fap.19.1237745064418; Sun, 
	22 Mar 2009 11:04:24 -0700 (PDT)
In-Reply-To: <20090322172416.GA16899@denix.org>
References: <1237737623-10538-1-git-send-email-matthieu.poullet@gmail.com>
	<d1b08f940903220927v2f820afia681d67bdbd50b54@mail.gmail.com>
	<20090322172416.GA16899@denix.org>
Date: Sun, 22 Mar 2009 19:04:24 +0100
Message-ID: <d1b08f940903221104u5f0f1328i8918a50ec49541f7@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Angstrom: weak-assign DEPLOY_DIR
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
X-List-Received-Date: Sun, 22 Mar 2009 18:05:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Well, I reproduced the issue after long time. Still present.

http://www.hentges.net/irclogs/%23oe/2008/July/20080725_oe.log
[20080725 09:57:35]	 <ant|work>  	 I already have /build/pstage

The 'fix' can be discuted but seems to work

Regards

Andrea


