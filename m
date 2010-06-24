Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1ORj9v-0003kR-8x
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 11:55:55 +0200
Received: by gyg10 with SMTP id 10so4544565gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AkGLixexykYHhzT+u31dZ+YDZcVkPzl4+pqfHRdHjCU=;
	b=IKYqv53rtlrAYmiH0tvYvi/UGsGgPthYbDrrDeULJezW2YiFK/PM0rHROhnscomBy/
	EYTObVeA7NVsjevMjaxwJbTCeI7+f0/ydmrGoYV/zuZlVaVVI+mqWQOYAkifr45Ge5hY
	qauNPeiZI9tCnzAk5IHLCD+QUPvUWUfnP3HGg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bdCXjpPEM5sYuyAdhqqy/0iyIi4iBFd4+o7LC1yUuOfMiFQaqMtG063L3JCRPbiy88
	8ZyoiUW5p6oxEqU0A5tR2jOzCjjNkGqqMkJFs2r6XgdCOBYH6gn/w1f9n+x4rndwYWYH
	RDsJCIk/DxTxli2g5GxWRPGYaq6kNI2Q8PCaY=
MIME-Version: 1.0
Received: by 10.100.173.20 with SMTP id v20mr7731076ane.140.1277373061826; 
	Thu, 24 Jun 2010 02:51:01 -0700 (PDT)
Received: by 10.100.243.32 with HTTP; Thu, 24 Jun 2010 02:51:01 -0700 (PDT)
In-Reply-To: <hvv8hp$skd$3@dough.gmane.org>
References: <AANLkTilEWkJxX-05BU-UBnOIP9jgP3vtf8K7jA5-A9Q6@mail.gmail.com>
	<201006241230.18165.jay4mail@gmail.com>
	<hvv8hp$skd$3@dough.gmane.org>
Date: Thu, 24 Jun 2010 11:51:01 +0200
Message-ID: <AANLkTilxOH_7_4pS1BOorWBVQGT1vBMDPEy14F5kCjb1@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: makedevs vs. device_table-minimal.txt
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
X-List-Received-Date: Thu, 24 Jun 2010 09:55:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Since you're on >2.6.31, why not use devtmpfs?
>
> regards,
>
> Koen

Unfortunately not all machines are yet ready for 2.6.3x
Neverthless, there is a bug in the device tables having nodes in
subdirs without creating those.

Regards

Andrea


